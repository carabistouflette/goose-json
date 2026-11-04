# Native kernels

Goose owns all allocation, capacity checks and result lifetimes. These private
C ABI functions receive bounded slices and write only inside supplied storage;
no builder internals, padded loads or alignment assumptions are used. Goose's
`i64&` can be byte-aligned, so output references use `gs_i64` with alignment 1.
`unquote` receives input already UTF-8 validated by the entry point;
`escape_chunk` follows successful validation by `quote_prefix`. These are private
preconditions, with all buffer bounds enforced independently. Float-array elements are loaded with `memcpy` for the same reason.

CMake builds a C++17 static library. The generated Goose C only includes
`select.h`; TinyCC, compilers other than GCC/Clang, and `GOOSE_JSON_FORCE_PORTABLE` select
the Goose fallback.
The native package still requires CMake and a C++ compiler in either mode.
SSE2/AVX2 scans use bounded unaligned loads when enabled by the compiler;
other architectures use scalar scans. simdutf selects supported UTF-8 kernels
at runtime. Deployment builds do not enable `-march=native` by default.

Run `make format` after changing this directory or CMakeLists.txt. It refreshes
`json_codec.build` with a source fingerprint, invalidating Goose's local native
package cache. `make check` and benchmark builds reject a stale fingerprint.

## Vendored dependencies

The following source files are unmodified. Their notices and both upstream
license alternatives are preserved alongside them. This package uses the
Apache license alternatives, including Dragonbox's LLVM exception.

- Dragonbox: https://github.com/jk-jeon/dragonbox at
  `beeeef91cf6fef89a4d4ba5e95d47ca64ccb3a44`.
  `include/dragonbox/dragonbox.h` is copied to `vendor/dragonbox/dragonbox.h`.
  Apache-2.0 WITH LLVM-exception or BSL-1.0.
- simdutf: https://github.com/simdutf/simdutf at
  `4ab2be54f0b41536d5258675ffad7ba5d10fe384`.
  Apache-2.0 or MIT. UTF-8-only amalgamation, produced from that checkout:

  ```sh
  python3 singleheader/amalgamate.py --with-utf8 --source-dir src \
    --include-dir include --output-dir /path/to/native/vendor/simdutf \
    --no-zip --no-readme
  ```

  Only `simdutf.cpp` and `simdutf.h` are retained, with the upstream licenses.

Dragonbox and simdutf use package-specific C++ namespaces to avoid collisions
with another dependency's vendored version. No runtime network access or
external package manager is required.
