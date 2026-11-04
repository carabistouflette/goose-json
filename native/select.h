/* SPDX-License-Identifier: Apache-2.0 */
#ifndef GOOSE_JSON_NATIVE_SELECT_H
#define GOOSE_JSON_NATIVE_SELECT_H
static inline uint8_t gj_available(void) {
#if defined(__TINYC__) || defined(GOOSE_JSON_FORCE_PORTABLE) ||                                    \
    (!defined(__GNUC__) && !defined(__clang__))
    return 0;
#else
    return 1;
#endif
}

/* Runtime declarations and generated slice types precede user headers. */
static inline int64_t gj_runtime_i64(int64_t value, sl_u8 out) {
    if (out.len < GS_FMT_MAX) return -1;
    return gs_fmt_i64(out.data, value);
}
static inline int64_t gj_runtime_f64(double value, sl_u8 out) {
    if (out.len < GS_FMT_MAX) return -1;
    return gs_fmt_f64(out.data, value);
}
#endif
