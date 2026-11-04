// SPDX-License-Identifier: Apache-2.0
// Native package discovery must exclude test programs, including their foreign
// symbols. This is deliberately not a C identifier; including it breaks the JIT
// symbol table, as unrelated externs in a toolchain checkout did in CI.
extern fn excluded_symbol() = "excluded.symbol";
