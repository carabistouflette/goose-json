/* SPDX-License-Identifier: Apache-2.0 */
#ifndef GOOSE_JSON_NATIVE_CODEC_H
#define GOOSE_JSON_NATIVE_CODEC_H
#include <stdint.h>
#include <string.h>
#if !defined(__TINYC__) && !defined(GOOSE_JSON_FORCE_PORTABLE) &&                                  \
    (defined(__GNUC__) || defined(__clang__))
#define GJ_NATIVE 1
#else
#define GJ_NATIVE 0
#endif
#if GJ_NATIVE && defined(__SSE2__)
#include <immintrin.h>
#endif
#include "api.h"

/* mask is nonzero at every call. */
static inline int gj_first(uint32_t mask) {
#if defined(__GNUC__) || defined(__clang__)
    return __builtin_ctz(mask);
#else
    int bit = 0;
    while (!(mask & 1)) {
        ++bit;
        mask >>= 1;
    }
    return bit;
#endif
}

/* mode=0: ASCII only. mode=1: ASCII without JSON string specials.
   Loads are strictly bounded; neither input padding nor alignment is assumed. */
static inline int64_t gj_ascii_run(const uint8_t *s, int64_t n, int64_t i, int mode) {
#if GJ_NATIVE && defined(__AVX2__)
    while (n - i >= 32) {
        __m256i v = _mm256_loadu_si256((const __m256i *)(const void *)(s + i));
        unsigned mask = mode == 2 ? 0 : (unsigned)_mm256_movemask_epi8(v);
        if (mode) {
            __m256i controls = mode == 2
                                   ? _mm256_cmpgt_epi8(_mm256_set1_epi8(-96),
                                                       _mm256_xor_si256(v, _mm256_set1_epi8(-128)))
                                   : _mm256_cmpgt_epi8(_mm256_set1_epi8(32), v);
            __m256i special = _mm256_or_si256(
                controls, _mm256_or_si256(_mm256_cmpeq_epi8(v, _mm256_set1_epi8('"')),
                                          _mm256_cmpeq_epi8(v, _mm256_set1_epi8('\\'))));
            mask |= (unsigned)_mm256_movemask_epi8(special);
        }
        if (mask)
            return i + gj_first(mask);
        i += 32;
    }
#endif
#if GJ_NATIVE && defined(__SSE2__)
    while (n - i >= 16) {
        __m128i v = _mm_loadu_si128((const __m128i *)(const void *)(s + i));
        unsigned mask = mode == 2 ? 0 : (unsigned)_mm_movemask_epi8(v);
        if (mode) {
            __m128i controls = mode == 2 ? _mm_cmplt_epi8(_mm_xor_si128(v, _mm_set1_epi8(-128)),
                                                          _mm_set1_epi8(-96))
                                         : _mm_cmplt_epi8(v, _mm_set1_epi8(32));
            __m128i special =
                _mm_or_si128(controls, _mm_or_si128(_mm_cmpeq_epi8(v, _mm_set1_epi8('"')),
                                                    _mm_cmpeq_epi8(v, _mm_set1_epi8('\\'))));
            mask |= (unsigned)_mm_movemask_epi8(special);
        }
        if (mask)
            return i + __builtin_ctz(mask);
        i += 16;
    }
#endif
    while (i < n && (mode == 2 || s[i] < 128) &&
           (!mode || (s[i] >= 32 && s[i] != '"' && s[i] != '\\')))
        ++i;
    return i;
}

/* Valid UTF-8 code-point width, or zero. All continuation reads are bounded. */
static inline int gj_width(const uint8_t *s, int64_t n) {
    if (!n)
        return 0;
    unsigned c = s[0];
    if (c < 128)
        return 1;
    if (c >= 0xc2 && c <= 0xdf)
        return n >= 2 && (s[1] & 0xc0) == 0x80 ? 2 : 0;
    if (c >= 0xe0 && c <= 0xef) {
        if (n < 3 || (s[1] & 0xc0) != 0x80 || (s[2] & 0xc0) != 0x80)
            return 0;
        if ((c == 0xe0 && s[1] < 0xa0) || (c == 0xed && s[1] > 0x9f))
            return 0;
        return 3;
    }
    if (c >= 0xf0 && c <= 0xf4) {
        if (n < 4 || (s[1] & 0xc0) != 0x80 || (s[2] & 0xc0) != 0x80 || (s[3] & 0xc0) != 0x80)
            return 0;
        if ((c == 0xf0 && s[1] < 0x90) || (c == 0xf4 && s[1] > 0x8f))
            return 0;
        return 4;
    }
    return 0;
}
static inline uint8_t gj_impl_utf8(sl_u8 input) {
#if GJ_NATIVE
    return input.len >= 0 && gj_cpp_utf8((const char *)input.data, (size_t)input.len);
#else
    const uint8_t *s = input.data;
    int64_t n = input.len, i = 0;
    while (i < n) {
        int width = gj_width(s + i, n - i);
        if (!width)
            return 0;
        i += width;
    }
    return 1;
#endif
}
static inline void gj_impl_prefix(sl_u8 input, int64_t at, gs_i64 *position, uint8_t *ascii_out) {
    const uint8_t *s = input.data;
    int64_t n = input.len, i = at;
    if (at < 0 || at > n) {
        *position = 0;
        *ascii_out = 0;
        return;
    }
    i = gj_ascii_run(s, n, i, 2);
    *position = i;
    *ascii_out = gj_ascii_run(s, i, at, 0) == i;
}

/* Small copies avoid an out-of-line memcpy for each short escaped-text run.
   Every load/store is bounded by n, including at a guard-page boundary. */
static inline void gj_copy(uint8_t *to, const uint8_t *from, int64_t n) {
    if (n >= 32) {
        memcpy(to, from, (size_t)n);
        return;
    }
    while (n >= 8) {
        uint64_t word;
        memcpy(&word, from, 8);
        memcpy(to, &word, 8);
        to += 8;
        from += 8;
        n -= 8;
    }
    if (n >= 4) {
        uint32_t word;
        memcpy(&word, from, 4);
        memcpy(to, &word, 4);
        to += 4;
        from += 4;
        n -= 4;
    }
    if (n >= 2) {
        uint16_t word;
        memcpy(&word, from, 2);
        memcpy(to, &word, 2);
        to += 2;
        from += 2;
        n -= 2;
    }
    if (n)
        *to = *from;
}

/* A bit marks each control, quote or backslash in a bounded 32-byte block.
   Reuse the mask across dense escapes instead of rescanning overlapping runs. */
static inline uint32_t gj_specials(const uint8_t *s, int64_t n) {
    uint32_t mask = 0;
    int64_t i = 0;
#if GJ_NATIVE && defined(__AVX2__)
    if (n >= 32) {
        __m256i v = _mm256_loadu_si256((const __m256i *)(const void *)s);
        __m256i controls =
            _mm256_cmpgt_epi8(_mm256_set1_epi8(-96), _mm256_xor_si256(v, _mm256_set1_epi8(-128)));
        return (uint32_t)_mm256_movemask_epi8(_mm256_or_si256(
            controls, _mm256_or_si256(_mm256_cmpeq_epi8(v, _mm256_set1_epi8('"')),
                                      _mm256_cmpeq_epi8(v, _mm256_set1_epi8('\\')))));
    }
#endif
#if GJ_NATIVE && defined(__SSE2__)
    while (n - i >= 16 && i < 32) {
        __m128i v = _mm_loadu_si128((const __m128i *)(const void *)(s + i));
        __m128i controls =
            _mm_cmplt_epi8(_mm_xor_si128(v, _mm_set1_epi8(-128)), _mm_set1_epi8(-96));
        mask |= (uint32_t)_mm_movemask_epi8(
                    _mm_or_si128(controls, _mm_or_si128(_mm_cmpeq_epi8(v, _mm_set1_epi8('"')),
                                                        _mm_cmpeq_epi8(v, _mm_set1_epi8('\\')))))
                << i;
        i += 16;
    }
#endif
    for (; i < n && i < 32; ++i)
        if (s[i] < 32 || s[i] == '"' || s[i] == '\\')
            mask |= (uint32_t)1 << i;
    return mask;
}

/* Validate the whole string and find its first character requiring escaping.
   Plain ASCII proves UTF-8 validity during the same scan. */
static inline int64_t gj_impl_quote_prefix(sl_u8 input) {
    if (input.len < 0)
        return -1;
    int64_t at = gj_ascii_run(input.data, input.len, 0, 1);
    if (at == input.len)
        return at;
    if (!gj_impl_utf8(input))
        return -1;
    return gj_ascii_run(input.data, input.len, at, 2);
}
/* Caller first validates UTF-8 with quote_prefix. */
static inline int64_t gj_impl_escape_chunk(sl_u8 input, int64_t at, sl_u8 output,
                                           gs_i64 *position) {
    *position = at;
    if (at < 0 || at > input.len || output.len < 6)
        return -1;
    const uint8_t *s = input.data;
    uint8_t *out = output.data;
    int64_t n = input.len, i = at, used = 0, cap = output.len;
    while (i < n) {
        int64_t base = i, limit = n - i > 32 ? i + 32 : n;
        uint32_t mask = gj_specials(s + base, limit - base);
        while (mask) {
            int64_t end = base + gj_first(mask);
            mask &= mask - 1;
            int64_t run = end - i;
            if (run > cap - used) {
                run = cap - used;
                if (run)
                    gj_copy(out + used, s + i, run);
                *position = i + run;
                return cap;
            }
            if (run) {
                gj_copy(out + used, s + i, run);
                used += run;
                i = end;
            }
            if (cap - used < 6) {
                *position = i;
                return used;
            }
            unsigned c = s[i++];
            if (c == '"' || c == '\\') {
                if (cap - used < 2)
                    return -1;
                out[used++] = '\\';
                out[used++] = (uint8_t)c;
            } else if (c < 32) {
                static const uint8_t escapes[32] = {0, 0,   0,   0,   0, 0,   0,
                                                    0, 'b', 't', 'n', 0, 'f', 'r'};
                if (escapes[c]) {
                    if (cap - used < 2)
                        return -1;
                    out[used++] = '\\';
                    out[used++] = escapes[c];
                } else {
                    if (cap - used < 6)
                        return -1;
                    memcpy(out + used, "\\u00", 4);
                    used += 4;
                    out[used++] = "0123456789abcdef"[c >> 4];
                    out[used++] = "0123456789abcdef"[c & 15];
                }
            }
        }
        int64_t run = limit - i;
        if (run > cap - used) {
            run = cap - used;
            if (run)
                gj_copy(out + used, s + i, run);
            *position = i + run;
            return cap;
        }
        if (run) {
            gj_copy(out + used, s + i, run);
            used += run;
        }
        i = limit;
    }
    *position = i;
    return used;
}
static inline int gj_hex(unsigned c) {
    if (c >= '0' && c <= '9')
        return (int)c - '0';
    if (c >= 'a' && c <= 'f')
        return (int)c - 'a' + 10;
    if (c >= 'A' && c <= 'F')
        return (int)c - 'A' + 10;
    return -1;
}
static inline int gj_u16(const uint8_t *s, int64_t n, int64_t *at) {
    if (n - *at < 4)
        return -1;
    int value = 0;
    for (int j = 0; j < 4; ++j) {
        int d = gj_hex(s[(*at)++]);
        if (d < 0)
            return -1;
        value = value * 16 + d;
    }
    return value;
}
/* Streaming string decode. Caller validates raw UTF-8 globally first. Every
   call either consumes input, reaches a closing quote, or reports an error. */
static inline int64_t gj_impl_unquote(sl_u8 input, int64_t at, sl_u8 output, gs_i64 *position,
                                      uint8_t *done) {
    *position = at;
    *done = 0;
    if (at < 0 || at > input.len || output.len < 4)
        return -1;
    const uint8_t *s = input.data;
    uint8_t *out = output.data;
    int64_t n = input.len, i = at, used = 0, cap = output.len;
    while (i < n) {
        int64_t base = i, limit = n - i > 32 ? i + 32 : n;
        uint32_t mask = gj_specials(s + base, limit - base);
        while (mask) {
            int64_t end = base + gj_first(mask);
            mask &= mask - 1;
            if (end < i)
                continue;
            int64_t run = end - i;
            if (run > cap - used) {
                run = cap - used;
                if (run)
                    gj_copy(out + used, s + i, run);
                *position = i + run;
                return cap;
            }
            if (run) {
                gj_copy(out + used, s + i, run);
                used += run;
                i = end;
            }
            if (cap - used < 4) {
                *position = i;
                return used;
            }
            unsigned c = s[i++];
            if (c == '"') {
                *position = i;
                *done = 1;
                return used;
            }
            if (c < 32)
                return -1;
            if (c != '\\' || i == n)
                return -1;
            c = s[i++];
            int cp;
            if (c != 'u') {
                // All ordinary escapes produce exactly one byte.
                static const uint8_t decoded[128] = {
                    0,  0, 0, 0,  0,  0, 0, 0, 0, 0, 0, 0, 0,  0, 0,  0, 0, 0, 0, 0, 0, 0,
                    0,  0, 0, 0,  0,  0, 0, 0, 0, 0, 0, 0, 34, 0, 0,  0, 0, 0, 0, 0, 0, 0,
                    0,  0, 0, 47, 0,  0, 0, 0, 0, 0, 0, 0, 0,  0, 0,  0, 0, 0, 0, 0, 0, 0,
                    0,  0, 0, 0,  0,  0, 0, 0, 0, 0, 0, 0, 0,  0, 0,  0, 0, 0, 0, 0, 0, 0,
                    0,  0, 0, 0,  92, 0, 0, 0, 0, 0, 8, 0, 0,  0, 12, 0, 0, 0, 0, 0, 0, 0,
                    10, 0, 0, 0,  13, 0, 9, 0, 0, 0, 0, 0, 0,  0, 0,  0, 0, 0};
                if (c >= 128 || !decoded[c] || used >= cap)
                    return -1;
                out[used++] = decoded[c];
                continue;
            }
            if (c == 'u') {
                cp = gj_u16(s, n, &i);
                if (cp < 0)
                    return -1;
                if (cp >= 0xd800 && cp <= 0xdbff) {
                    if (n - i < 6 || s[i] != '\\' || s[i + 1] != 'u')
                        return -1;
                    i += 2;
                    int low = gj_u16(s, n, &i);
                    if (low < 0xdc00 || low > 0xdfff)
                        return -1;
                    cp = 0x10000 + ((cp - 0xd800) << 10) + low - 0xdc00;
                } else if (cp >= 0xdc00 && cp <= 0xdfff)
                    return -1;
            } else
                return -1;
            int width = cp < 0x80 ? 1 : cp < 0x800 ? 2 : cp < 0x10000 ? 3 : 4;
            if (width > cap - used)
                return -1;
            if (width == 1)
                out[used++] = (uint8_t)cp;
            else if (width == 2) {
                out[used++] = (uint8_t)(0xc0 | (cp >> 6));
                out[used++] = (uint8_t)(0x80 | (cp & 63));
            } else if (width == 3) {
                out[used++] = (uint8_t)(0xe0 | (cp >> 12));
                out[used++] = (uint8_t)(0x80 | ((cp >> 6) & 63));
                out[used++] = (uint8_t)(0x80 | (cp & 63));
            } else {
                out[used++] = (uint8_t)(0xf0 | (cp >> 18));
                out[used++] = (uint8_t)(0x80 | ((cp >> 12) & 63));
                out[used++] = (uint8_t)(0x80 | ((cp >> 6) & 63));
                out[used++] = (uint8_t)(0x80 | (cp & 63));
            }
        }
        if (i < limit) {
            int64_t run = limit - i;
            if (run > cap - used) {
                run = cap - used;
                if (run)
                    gj_copy(out + used, s + i, run);
                *position = i + run;
                return cap;
            }
            gj_copy(out + used, s + i, run);
            used += run;
            i = limit;
        }
    }
    return -1; // Input ended before its closing quote.
}

static inline int64_t gj_impl_number(double value, sl_u8 output) {
#if GJ_NATIVE
    if (output.len < 32)
        return -1;
    uint64_t bits;
    memcpy(&bits, &value, sizeof bits);
    if (((bits >> 52) & 0x7ff) == 0x7ff)
        return -1;
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
#endif
