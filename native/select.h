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
#endif
