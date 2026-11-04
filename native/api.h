/* SPDX-License-Identifier: Apache-2.0 */
#ifndef GOOSE_JSON_NATIVE_API_H
#define GOOSE_JSON_NATIVE_API_H
#include <stddef.h>
#include <stdint.h>
/* Private ABI: callers own valid, nonoverlapping input/output spans. Empty
   spans may have null data pointers. No function allocates or retains storage.
   Error returns may leave partial output; callers must discard it.
   Goose scalar references and array elements can be byte-aligned. */
#if defined(__GNUC__) || defined(__clang__)
typedef int64_t gs_i64 __attribute__((aligned(1)));
typedef double gs_f64 __attribute__((aligned(1)));
#else
typedef int64_t gs_i64;
typedef double gs_f64;
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
/* Internal conversion helpers. Decimal requires finite, nonzero input;
   scientific requires finite input and at least 32 writable output bytes. */
uint8_t gj_cpp_utf8(const char *data, size_t length);
gj_decimal gj_cpp_decimal(double value);
int64_t gj_cpp_scientific(double value, sl_u8 output);
/* A consumed numeric prefix (at most 128 bytes), or 0 for Goose fallback.
   The caller checks delimiters. Failure leaves the scalar output unchanged. */
int64_t gj_parse_number(sl_u8 input, gs_f64 *output);
/* Parse up to output.len (1..64) floats, using unaligned-safe element stores.
   prefix means a preceding value requires a comma. Returns element count or
   -1 for fallback; done means ']' was consumed. position is the next input byte. */
int64_t gj_parse_float_chunk(sl_u8 text, int64_t at, sl_f64 output, gs_i64 *position, uint8_t *done,
                             uint8_t prefix);
uint8_t gj_utf8(sl_u8 text);
/* First control/quote/backslash at or after at; end may equal text.len.
   ascii describes only the scanned prefix, not the rest of the input. */
void gj_prefix(sl_u8 text, int64_t at, gs_i64 *end, uint8_t *ascii);
/* Validate all UTF-8, then return the first escape position or text.len;
   -1 means invalid UTF-8. */
int64_t gj_quote_prefix(sl_u8 text);
/* Input must already pass quote_prefix. At least 6 output bytes are required.
   Return bytes written or -1; position is the next unconsumed input byte. */
int64_t gj_escape_chunk(sl_u8 text, int64_t at, sl_u8 out, gs_i64 *position);
/* Input must already pass UTF-8 validation. Start after the opening quote or
   resume at position. At least 4 output bytes are required. Return bytes written
   or -1; done means the closing quote was consumed, with position after it. */
int64_t gj_unquote(sl_u8 text, int64_t at, sl_u8 out, gs_i64 *position, uint8_t *done);
/* Format finite values into at least 32 bytes; return bytes written or -1. */
int64_t gj_number(double value, sl_u8 out);
/* Format 0..64 byte-aligned elements. prefix requests an initial comma for a
   nonempty chunk. 33*values.len output bytes suffice. Return bytes written or -1. */
int64_t gj_float_chunk(sl_f64 values, sl_u8 out, uint8_t prefix);
#ifdef __cplusplus
}
#endif
#endif
