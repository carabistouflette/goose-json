// SPDX-License-Identifier: Apache-2.0
#include "../native/api.h"
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>
#include <string>
#include <vector>
#if defined(__unix__)
#include <sys/mman.h>
#include <unistd.h>
#endif

static uint64_t bits(double d) {
    uint64_t u;
    memcpy(&u, &d, 8);
    return u;
}
static sl_u8 span(std::string &s) { return {(uint8_t *)s.data(), (int64_t)s.size()}; }

static void roundtrip(double value) {
    uint8_t output[34];
    memset(output, 0xa5, sizeof output);
    int64_t n = gj_number(value, {output + 1, 32});
    assert(output[0] == 0xa5 && output[33] == 0xa5);
    if (!std::isfinite(value)) {
        assert(n == -1);
        return;
    }
    assert(n > 0 && n < 32);
    output[n + 1] = 0;
    char *end;
    double actual = strtod((const char *)output + 1, &end);
    assert(end == (char *)output + n + 1 && bits(actual) == bits(value));
    double parsed;
    // Subnormal underflow may deliberately fall back to Goose.
    if (gj_parse_number({output + 1, n}, &parsed) == n)
        assert(bits(parsed) == bits(value));
    assert(gj_number(value, {output + 1, 31}) == -1);
}

static void numbers() {
    uint8_t packed[9];
    auto *value = (gs_f64 *)(void *)(packed + 1);
    for (const char *bad : {"", "-", "+1", ".1", "01", "1.", "1e", "1e+", "nan", "inf", "1e9999"}) {
        std::string text(bad);
        auto n = gj_parse_number(span(text), value);
        // A valid numeric prefix is allowed; the Goose container checks delimiters.
        assert(n == 0 || n < (int64_t)text.size());
    }
    std::string tiny = "-0.0";
    assert(gj_parse_number(span(tiny), value) == 4 && bits(*value) == bits(-0.0));
    std::string too_long(129, '1');
    assert(gj_parse_number(span(too_long), value) == 0);
    for (int length = 0; length <= 130; ++length) {
        std::string text = "[";
        for (int i = 0; i < length; ++i) {
            if (i)
                text += ',';
            text += "1.25";
        }
        text += "]";
        uint8_t raw[64 * 8 + 1];
        auto *values = (double *)(void *)(raw + 1);
        uint8_t done = 0, prefix = 0;
        int64_t at = 1, total = 0;
        while (!done) {
            auto n = gj_parse_float_chunk(span(text), at, {values, 64}, &at, &done, prefix);
            assert(n >= 0 && n <= 64);
            for (int i = 0; i < n; ++i) {
                double d;
                memcpy(&d, raw + 1 + i * 8, 8);
                assert(d == 1.25);
            }
            total += n;
            prefix = 1;
        }
        assert(total == length && at == (int64_t)text.size());
    }
}

static void strings() {
    for (int length = 0; length < 160; ++length)
        for (int offset = 0; offset < 40; ++offset) {
            std::string text(length, 'a');
            if (offset < length)
                text.replace(offset, 1, "\n\"\\\té😀");
            assert(gj_quote_prefix(span(text)) >= 0);
            std::string encoded;
            for (int cap : {6, 7, 16, 31, 32, 33, 64, 4096}) {
                std::vector<uint8_t> out(cap + 2, 0xa5);
                std::string result;
                int64_t at = 0;
                while (at < (int64_t)text.size()) {
                    auto before = at;
                    auto n = gj_escape_chunk(span(text), at, {out.data() + 1, cap}, &at);
                    assert(n >= 0 && n <= cap && at > before);
                    assert(out.front() == 0xa5 && out.back() == 0xa5);
                    result.append((char *)out.data() + 1, n);
                }
                if (encoded.empty())
                    encoded = result;
                assert(encoded == result);
            }
            std::string wire = encoded + '"';
            for (int cap : {4, 5, 7, 16, 31, 32, 33, 64, 4096}) {
                std::vector<uint8_t> out(cap + 2, 0xa5);
                int64_t at = 0;
                uint8_t done = 0;
                std::string decoded;
                while (!done) {
                    auto before = at;
                    auto n = gj_unquote(span(wire), at, {out.data() + 1, cap}, &at, &done);
                    assert(n >= 0 && n <= cap && at > before);
                    assert(out.front() == 0xa5 && out.back() == 0xa5);
                    decoded.append((char *)out.data() + 1, n);
                }
                assert(decoded == text && at == (int64_t)wire.size());
            }
        }
    for (const char *bad :
         {"\\q\"", "\\uD800\"", "\\uDC00\"", "\\uD800\\u0000\"", "abc", "\\", "\n\""}) {
        std::string wire(bad);
        uint8_t out[128], done;
        int64_t at = 0;
        assert(gj_unquote(span(wire), 0, {out, 128}, &at, &done) < 0);
    }
    std::string surrogate = "\\uD83D\\uDE00\"";
    uint8_t out[8], done;
    int64_t at = 0;
    assert(gj_unquote(span(surrogate), 0, {out, 8}, &at, &done) == 4 && done);
    assert(memcmp(out, "😀", 4) == 0);
    // Packed Goose references must be safe, even when the address is odd.
    uint8_t packed[10];
    auto *position = (gs_i64 *)(void *)(packed + 1);
    uint8_t ascii;
    std::string plain(40, 'a');
    gj_prefix(span(plain), 0, position, &ascii);
    assert(*position == 40 && ascii);
    plain += '"';
    assert(gj_unquote(span(plain), 0, {out, 8}, position, &done) == 8);
}

static void guard_pages() {
#if defined(__unix__)
    const long page = sysconf(_SC_PAGESIZE);
    auto *mem = (uint8_t *)mmap(nullptr, page * 3, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    assert(mem != MAP_FAILED && mprotect(mem + page, page, PROT_READ | PROT_WRITE) == 0);
    for (int n = 0; n < 256; ++n) {
        auto *s = mem + 2 * page - n;
        memset(s, 'a', n);
        sl_u8 in{s, n};
        assert(gj_utf8(in) && gj_quote_prefix(in) == n);
        if (n >= 6) {
            std::string input(n, 'a');
            int64_t position = 0;
            assert(gj_escape_chunk(span(input), 0, {s, n}, &position) == n && position == n);
            s[n - 1] = '"';
            int64_t at = 0;
            uint8_t done;
            std::vector<uint8_t> decoded(n + 4);
            assert(gj_unquote(in, 0, {decoded.data(), n + 4}, &at, &done) == n - 1 && done);
        }
    }
    assert(munmap(mem, page * 3) == 0);
#endif
}

int main() {
    for (double value :
         {0.0, -0.0, 1.0, -1.0, 1e-5, 1e-6, 1e15, 1e16, std::numeric_limits<double>::denorm_min(),
          std::numeric_limits<double>::min(), std::numeric_limits<double>::max(), double(INFINITY),
          -double(INFINITY), double(NAN)}) {
        roundtrip(value);
        if (std::isfinite(value)) {
            roundtrip(std::nextafter(value, INFINITY));
            roundtrip(std::nextafter(value, -INFINITY));
        }
    }
    uint64_t state = 219;
    for (int i = 0; i < 1000000; ++i) {
        state ^= state << 13;
        state ^= state >> 7;
        state ^= state << 17;
        double value;
        memcpy(&value, &state, 8);
        roundtrip(value);
    }
    // Chunk boundaries, unaligned arrays, nonfinite failure and exact capacity.
    uint8_t packed[64 * 8 + 1];
    for (int i = 0; i < 64; ++i) {
        double d = i / 8.0;
        memcpy(packed + 1 + i * 8, &d, 8);
    }
    uint8_t output[2114];
    memset(output, 0xa5, sizeof output);
    auto n = gj_float_chunk({(double *)(void *)(packed + 1), 64}, {output + 1, 2112}, 1);
    assert(n > 0 && output[0] == 0xa5 && output[2113] == 0xa5 && output[1] == ',');
    assert(gj_float_chunk({(double *)(void *)(packed + 1), 65}, {output + 1, 2112}, 0) == -1);
    double inf = INFINITY;
    memcpy(packed + 1 + 63 * 8, &inf, 8);
    assert(gj_float_chunk({(double *)(void *)(packed + 1), 64}, {output + 1, 2112}, 0) == -1);
    numbers();
    strings();
    guard_pages();
    puts("native kernels: 1,000,000 float patterns, string boundaries and guard pages passed");
}
