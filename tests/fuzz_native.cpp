// SPDX-License-Identifier: Apache-2.0
#include "../native/api.h"
#include <cmath>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

static void require(bool ok) {
    if (!ok)
        std::abort();
}
static uint64_t bits(double value) {
    uint64_t n;
    std::memcpy(&n, &value, 8);
    return n;
}
static int64_t plain_end(sl_u8 text, int64_t at) {
    while (at < text.len && text.data[at] >= 32 && text.data[at] != '"' && text.data[at] != '\\')
        ++at;
    return at;
}
static void space(const char *&p) {
    while (*p == ' ' || *p == '\t' || *p == '\r' || *p == '\n')
        ++p;
}
static std::string format(double value) {
    uint8_t text[33];
    std::memset(text, 0xa5, sizeof text);
    const auto n = gj_number(value, {text, 32});
    require(text[32] == 0xa5);
    if (!std::isfinite(value)) {
        require(n < 0);
        return {};
    }
    require(n > 0 && n < 32);
    const std::string result(reinterpret_cast<char *>(text), n);
    char *end;
    const double oracle = std::strtod(result.c_str(), &end);
    require(end == result.c_str() + n && bits(oracle) == bits(value));
    return result;
}

extern "C" int LLVMFuzzerTestOneInput(const uint8_t *data, size_t size) {
    const std::string original(size ? reinterpret_cast<const char *>(data) : "", size);
    const sl_u8 input{const_cast<uint8_t *>(data), static_cast<int64_t>(size)};
    const int64_t cap = size ? data[0] % 67 : 0;
    std::vector<uint8_t> output(cap);
    sl_u8 out{output.data(), cap};
    const int64_t start = size ? data[size - 1] % (size + 1) : 0;
    int64_t position = 0;
    uint8_t done = 0, ascii = 0;
    gj_prefix(input, start, &position, &ascii);
    const auto expected_end = plain_end(input, start);
    bool expected_ascii = true;
    for (auto i = start; i < expected_end; ++i)
        expected_ascii &= data[i] < 128;
    require(position == expected_end && bool(ascii) == expected_ascii);
    // This private kernel assumes raw UTF-8 was checked by the Goose caller.
    const bool valid = gj_utf8(input);
    if (valid) {
        auto n = gj_unquote(input, 0, out, &position, &done);
        require(n < 0 || (n <= cap && position > 0 && position <= input.len));
    }
    const auto prefix = gj_quote_prefix(input);
    require((prefix >= 0) == valid);
    if (prefix >= 0) {
        require(prefix == plain_end(input, 0));
        std::string encoded;
        int64_t at = 0;
        const int64_t capacity = cap + 6;
        std::vector<uint8_t> buffer(capacity);
        while (at < input.len) {
            const auto before = at;
            auto n = gj_escape_chunk(input, at, {buffer.data(), capacity}, &at);
            require(n >= 0 && n <= capacity && at > before && at <= input.len);
            encoded.append(reinterpret_cast<char *>(buffer.data()), n);
        }
        encoded.push_back('"');
        sl_u8 wire{reinterpret_cast<uint8_t *>(encoded.data()),
                   static_cast<int64_t>(encoded.size())};
        std::string decoded;
        at = 0;
        done = 0;
        while (!done) {
            const auto before = at;
            auto n = gj_unquote(wire, at, {buffer.data(), capacity}, &at, &done);
            require(n >= 0 && n <= capacity && at > before && at <= wire.len);
            decoded.append(reinterpret_cast<char *>(buffer.data()), n);
        }
        require(at == wire.len && decoded == original);
    }
    double value = 0;
    const auto parsed = gj_parse_number(input, &value);
    require(parsed >= 0 && parsed <= input.len && parsed <= 128);
    if (parsed) {
        const std::string decimal(original.data(), parsed);
        char *end;
        const double oracle = std::strtod(decimal.c_str(), &end);
        require(std::isfinite(value) && end == decimal.c_str() + parsed);
        require(bits(oracle) == bits(value));
    }
    // Element count and byte capacity vary independently; successful and short
    // writes must both be reachable. Float arrays may be byte-aligned in Goose.
    const int64_t count = size > 1 ? data[1] % 65 : 0;
    std::vector<uint8_t> numbers(count * 8 + 1);
    const int64_t at = size && data[0] == '[' ? 1 : 0;
    for (uint8_t continuation : {0, 1}) {
        auto n =
            gj_parse_float_chunk(input, at, {reinterpret_cast<double *>(numbers.data() + 1), count},
                                 &position, &done, continuation);
        require(n < 0 || (n <= count && position >= at && position <= input.len));
        if (n >= 0) {
            // Only compare consumed bytes: a full chunk can stop at a numeric
            // prefix whose following delimiter is checked by its caller.
            const std::string consumed(original.data() + at, position - at);
            const char *cursor = consumed.c_str();
            for (int64_t i = 0; i < n; ++i) {
                if (continuation || i) {
                    space(cursor);
                    require(*cursor++ == ',');
                }
                char *end;
                const double oracle = std::strtod(cursor, &end);
                double actual;
                std::memcpy(&actual, numbers.data() + 1 + i * 8, 8);
                require(end > cursor && std::isfinite(actual) && bits(oracle) == bits(actual));
                cursor = end;
            }
        }
    }
    if (size >= 8) {
        std::memcpy(&value, data, 8);
        const auto canonical = format(value);
        const auto written = gj_number(value, out);
        if (std::isfinite(value) && cap >= 32) {
            require(written == static_cast<int64_t>(canonical.size()));
            require(std::memcmp(output.data(), canonical.data(), written) == 0);
        } else
            require(written < 0);
        bool finite = true;
        std::string expected;
        const bool comma = data[2] & 2;
        for (int64_t i = 0; i < count; ++i) {
            const size_t offset = (i * 8) % (size - 7);
            std::memcpy(&value, data + offset, 8);
            std::memcpy(numbers.data() + 1 + i * 8, &value, 8);
            finite &= std::isfinite(value);
            if (comma || i)
                expected += ',';
            expected += format(value);
        }
        const bool adequate = data[2] & 1;
        const int64_t capacity = adequate ? count * 33 : cap;
        std::vector<uint8_t> buffer(capacity);
        const auto n = gj_float_chunk({reinterpret_cast<double *>(numbers.data() + 1), count},
                                      {buffer.data(), capacity}, comma);
        if (adequate && finite)
            require(n >= 0);
        if (n >= 0) {
            require(finite && n <= capacity && n == static_cast<int64_t>(expected.size()));
            require(n == 0 || std::memcmp(buffer.data(), expected.data(), n) == 0);
        }
    }
    require(size == 0 || std::memcmp(original.data(), data, size) == 0);
    return 0;
}
