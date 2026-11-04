/* SPDX-License-Identifier: Apache-2.0 */
#ifndef GOOSE_JSON_NATIVE_API_H
#define GOOSE_JSON_NATIVE_API_H
#include <stddef.h>
#include <stdint.h>
#if defined(__GNUC__) || defined(__clang__)
typedef int64_t gs_i64 __attribute__((aligned(1)));
#else
typedef int64_t gs_i64;
#endif
#pragma pack(push, 1)
typedef struct {
    uint8_t *data;
    int64_t len;
} sl_u8;
typedef struct {
    double *data;
    int64_t len;
} sl_f64;
#pragma pack(pop)
#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
    uint64_t mantissa;
    int32_t exponent;
} gj_decimal;
uint8_t gj_cpp_utf8(const char *data, size_t length);
gj_decimal gj_cpp_decimal(double value);
uint8_t gj_utf8(sl_u8 text);
void gj_prefix(sl_u8 text, int64_t at, gs_i64 *end, uint8_t *ascii);
int64_t gj_quote_prefix(sl_u8 text);
int64_t gj_escape_chunk(sl_u8 text, int64_t at, sl_u8 out, gs_i64 *position);
int64_t gj_unquote(sl_u8 text, int64_t at, sl_u8 out, gs_i64 *position, uint8_t *done);
int64_t gj_number(double value, sl_u8 out);
int64_t gj_float_chunk(sl_f64 values, sl_u8 out, uint8_t prefix);
#ifdef __cplusplus
}
#endif
#endif
