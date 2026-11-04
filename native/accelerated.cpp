// SPDX-License-Identifier: Apache-2.0
#include "api.h"
#define JKJ_NAMESPACE goose_json_dragonbox
#include "vendor/dragonbox/dragonbox.h"
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

#include "codec.h"
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
