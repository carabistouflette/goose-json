/* SPDX-License-Identifier: Apache-2.0 */
#ifndef GOOSE_JSON_NATIVE_INTEGER_H
#define GOOSE_JSON_NATIVE_INTEGER_H
#include <stdint.h>
#include <string.h>

static const char gj_integer_pairs[201] =
    "00010203040506070809101112131415161718192021222324252627282930313233343536373839"
    "40414243444546474849505152535455565758596061626364656667686970717273747576777879"
    "8081828384858687888990919293949596979899";

/* Internal helpers: pair < 100, four < 10000, eight < 100000000. */
static inline uint8_t *gj_integer_pair(uint8_t *out, uint32_t value) {
    memcpy(out, gj_integer_pairs + 2 * value, 2);
    return out + 2;
}
static inline uint8_t *gj_integer_four(uint8_t *out, uint32_t value) {
    out = gj_integer_pair(out, value / 100);
    return gj_integer_pair(out, value % 100);
}
static inline uint8_t *gj_integer_eight(uint8_t *out, uint32_t value) {
    out = gj_integer_four(out, value / 10000);
    return gj_integer_four(out, value % 10000);
}
static inline uint8_t *gj_integer_head_four(uint8_t *out, uint32_t value) {
    if (value >= 100) {
        uint32_t high = value / 100;
        if (high >= 10)
            out = gj_integer_pair(out, high);
        else
            *out++ = (uint8_t)('0' + high);
        return gj_integer_pair(out, value % 100);
    }
    if (value >= 10)
        return gj_integer_pair(out, value);
    *out++ = (uint8_t)('0' + value);
    return out;
}
static inline uint8_t *gj_integer_head(uint8_t *out, uint32_t value) {
    if (value >= 10000) {
        out = gj_integer_head_four(out, value / 10000);
        return gj_integer_four(out, value % 10000);
    }
    return gj_integer_head_four(out, value);
}

/* Canonical i64 decimal, no terminator. Short capacity fails without writing.
   Eight-digit blocks keep most conversion in independent 32-bit arithmetic. */
static inline int64_t gj_integer_i64(int64_t value, uint8_t *out, int64_t capacity) {
    if (capacity < 20)
        return -1;
    uint8_t *begin = out;
    uint64_t magnitude = (uint64_t)value;
    if (value < 0) {
        *out++ = '-';
        magnitude = UINT64_C(0) - magnitude;
    }
    if (magnitude >= UINT64_C(10000000000000000)) {
        out = gj_integer_head_four(out, (uint32_t)(magnitude / UINT64_C(10000000000000000)));
        uint64_t tail = magnitude % UINT64_C(10000000000000000);
        out = gj_integer_eight(out, (uint32_t)(tail / UINT64_C(100000000)));
        out = gj_integer_eight(out, (uint32_t)(tail % UINT64_C(100000000)));
    } else if (magnitude >= UINT64_C(100000000)) {
        out = gj_integer_head(out, (uint32_t)(magnitude / UINT64_C(100000000)));
        out = gj_integer_eight(out, (uint32_t)(magnitude % UINT64_C(100000000)));
    } else {
        out = gj_integer_head(out, (uint32_t)magnitude);
    }
    return (int64_t)(out - begin);
}
#endif
