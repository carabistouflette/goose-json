// SPDX-License-Identifier: Apache-2.0
#include "api.h"
#define fast_float goose_json_fast_float
#include "vendor/fast_float/fast_float.h"
#undef fast_float
#include <cstring>
#define JKJ_NAMESPACE goose_json_dragonbox
#include "vendor/dragonbox/dragonbox_to_chars.h"
#undef JKJ_NAMESPACE
#include "vendor/simdutf/simdutf.h"

extern "C" uint8_t gj_cpp_utf8(const char *data, size_t length) {
    return length == 0 || simdutf::validate_utf8(data, length);
}
// Caller checks finite, nonzero input; Dragonbox does not handle zero/NaN/Inf.
extern "C" gj_decimal gj_cpp_decimal(double value) {
    const auto decimal = goose_json_dragonbox::dragonbox::to_decimal(
        value, goose_json_dragonbox::dragonbox::policy::sign::ignore,
        goose_json_dragonbox::dragonbox::policy::trailing_zero::remove);
    return {decimal.significand, decimal.exponent};
}

// The upstream formatter has an optimized 17-digit path. Its scientific form
// already matches ours except for E/e. Keep our fixed-point path for small values.
static inline int64_t gj_scientific(double value, sl_u8 output) {
    char *first = reinterpret_cast<char *>(output.data);
    char *end = goose_json_dragonbox::dragonbox::to_chars_n(value, first);
    for (char *p = end; p != first;) {
        --p;
        if (*p == 'E') {
            *p = 'e';
            break;
        }
    }
    return end - first;
}
extern "C" int64_t gj_cpp_scientific(double value, sl_u8 output) {
    return gj_scientific(value, output);
}
extern "C" int64_t gj_parse_number(sl_u8 input, gs_f64 *output) {
    if (input.len < 1)
        return 0;
    const char *first = reinterpret_cast<const char *>(input.data);
    const char *last = first + (input.len < 129 ? input.len : 129);
    double value;
    constexpr goose_json_fast_float::parse_options options{
        goose_json_fast_float::chars_format::json};
    auto result = goose_json_fast_float::from_chars_advanced(first, last, value, options);
    // Keep Goose's established underflow/range behavior on conversion failure.
    if (result.ec != std::errc() || result.ptr - first > 128)
        return 0;
    memcpy(output, &value, sizeof value);
    return result.ptr - first;
}

static int64_t gj_space(sl_u8 text, int64_t at) {
    while (at < text.len && (text.data[at] == ' ' || text.data[at] == '\n' ||
                             text.data[at] == '\r' || text.data[at] == '\t'))
        ++at;
    return at;
}
extern "C" int64_t gj_parse_float_chunk(sl_u8 text, int64_t at, sl_f64 output, gs_i64 *position,
                                        uint8_t *done, uint8_t prefix) {
    *position = at;
    *done = 0;
    if (at < 0 || at > text.len || output.len < 1 || output.len > 64)
        return -1;
    int64_t count = 0;
    while (count < output.len) {
        at = gj_space(text, at);
        if (at == text.len)
            return -1;
        if (text.data[at] == ']') {
            *position = at + 1;
            *done = 1;
            return count;
        }
        if (prefix) {
            if (text.data[at++] != ',')
                return -1;
            at = gj_space(text, at);
        }
        double value;
        int64_t n = gj_parse_number({text.data + at, text.len - at}, &value);
        if (!n)
            return -1; // Goose handles uncommon underflow/range cases.
        std::memcpy(reinterpret_cast<uint8_t *>(output.data) + count * 8, &value, 8);
        at += n;
        ++count;
        prefix = 1;
    }
    *position = at;
    return count;
}

#include "codec.h"
static inline int64_t gj_impl_number(double value, sl_u8 output) {
#if GJ_NATIVE
    if (output.len < 32)
        return -1;
    uint64_t bits;
    memcpy(&bits, &value, sizeof bits);
    if (((bits >> 52) & 0x7ff) == 0x7ff)
        return -1;
    double magnitude = value < 0 ? -value : value;
    if (magnitude >= 1e16 || (magnitude > 0 && magnitude < 1e-5))
        return gj_scientific(value, output);
    char storage[20];
    char *digits = storage + sizeof storage;
    uint8_t *text = output.data;
    int negative = (int)(bits >> 63), count = 0, exponent;
    uint32_t ieee_exp = (uint32_t)((bits >> 52) & 0x7ff);
    uint64_t ieee_mantissa = bits & 0xfffffffffffff;
    gj_decimal decimal;
    if (!ieee_exp && !ieee_mantissa) {
        decimal.mantissa = 0;
        decimal.exponent = 0;
    } else
        decimal = gj_cpp_decimal(value);
    static const char pairs[] = "0001020304050607080910111213141516171819"
                                "2021222324252627282930313233343536373839"
                                "4041424344454647484950515253545556575859"
                                "6061626364656667686970717273747576777879"
                                "8081828384858687888990919293949596979899";
    uint64_t mantissa = decimal.mantissa;
    while (mantissa >= 100) {
        uint64_t quotient = mantissa / 100;
        unsigned remainder = (unsigned)(mantissa - quotient * 100);
        digits -= 2;
        memcpy(digits, pairs + remainder * 2, 2);
        mantissa = quotient;
    }
    if (mantissa < 10)
        *--digits = (char)('0' + mantissa);
    else {
        digits -= 2;
        memcpy(digits, pairs + mantissa * 2, 2);
    }
    count = (int)(storage + sizeof storage - digits);
    exponent = decimal.exponent + count - 1;
    int point = exponent + 1, used = 0;
    if (negative)
        text[used++] = '-';
    if (point > 0 && point < count) {
        memcpy(text + used, digits, (size_t)point);
        used += point;
        text[used++] = '.';
        memcpy(text + used, digits + point, (size_t)(count - point));
        used += count - point;
    } else if (point >= count && point <= 16) {
        memcpy(text + used, digits, (size_t)count);
        used += count;
        for (int j = count; j < point; ++j)
            text[used++] = '0';
        text[used++] = '.';
        text[used++] = '0';
    } else if (point > -5 && point <= 0) {
        text[used++] = '0';
        text[used++] = '.';
        for (int j = 0; j < -point; ++j)
            text[used++] = '0';
        memcpy(text + used, digits, (size_t)count);
        used += count;
    } else {
        text[used++] = digits[0];
        if (count > 1) {
            text[used++] = '.';
            memcpy(text + used, digits + 1, (size_t)(count - 1));
            used += count - 1;
        }
        text[used++] = 'e';
        if (exponent < 0) {
            text[used++] = '-';
            exponent = -exponent;
        }
        if (exponent >= 100)
            text[used++] = (char)('0' + exponent / 100);
        if (exponent >= 10)
            text[used++] = (char)('0' + (exponent / 10) % 10);
        text[used++] = (char)('0' + exponent % 10);
    }
    return used;
#else
    (void)output;
    (void)value;
    return -1;
#endif
}
extern "C" {
uint8_t gj_available(void) { return 1; }
uint8_t gj_utf8(sl_u8 text) { return gj_impl_utf8(text); }
void gj_prefix(sl_u8 text, int64_t at, gs_i64 *end, uint8_t *ascii) {
    gj_impl_prefix(text, at, end, ascii);
}
int64_t gj_quote_prefix(sl_u8 text) { return gj_impl_quote_prefix(text); }
int64_t gj_escape_chunk(sl_u8 text, int64_t at, sl_u8 out, gs_i64 *position) {
    return gj_impl_escape_chunk(text, at, out, position);
}
int64_t gj_unquote(sl_u8 text, int64_t at, sl_u8 out, gs_i64 *position, uint8_t *done) {
    return gj_impl_unquote(text, at, out, position, done);
}
int64_t gj_number(double value, sl_u8 out) { return gj_impl_number(value, out); }
int64_t gj_float_chunk(sl_f64 values, sl_u8 out, uint8_t prefix) {
    if (values.len < 0 || values.len > 64)
        return -1;
    int64_t used = 0;
    for (int64_t i = 0; i < values.len; ++i) {
        if (prefix || i) {
            if (used >= out.len)
                return -1;
            out.data[used++] = ',';
        }
        double value;
        // Goose arrays can be byte-aligned. Do not dereference double* here.
        memcpy(&value, reinterpret_cast<const uint8_t *>(values.data) + 8 * i, 8);
        const int64_t count = gj_impl_number(value, sl_u8{out.data + used, out.len - used});
        if (count < 0)
            return -1;
        used += count;
    }
    return used;
}
}
