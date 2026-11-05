# Native implementation

Goose owns result storage and lifetimes. Private C functions receive bounded,
nonoverlapping slices and never allocate or retain them. Loads and stores stay
inside each slice; input padding and alignment are not required. Scalar output
references use byte-aligned `gs_i64`/`gs_f64` types, and float-array elements use
`memcpy` for unaligned access.

String helpers have additional preconditions: `unquote` receives validated UTF-8;
`escape_chunk` follows successful `quote_prefix` validation. These are internal
interfaces. Applications should use the [public API](../docs/api.md).

## Build and fallback

CMake builds a C++17 static library. GCC/Clang builds use its string/float kernels
and a bounded integer converter. TinyCC, other C compilers and
`GOOSE_JSON_FORCE_PORTABLE` select the Goose fallback. **CMake and a C++ compiler
are still required in fallback mode.**

SSE2/AVX2 scans are enabled when supported by the compiler target. simdutf chooses
its UTF-8 implementation at runtime. Default deployment builds do not add
`-march=native`; the benchmark's optional native profile does. Linux x86-64 is
tested; scalar code paths do not establish support for another platform.

Numeric conversion does not use application formatting overloads. Header-only
adapters are declared in `runtime.goose`; `select.h` checks output capacity before
calling them. Goose still appends the resulting bytes and chooses float layout.
Float parsing examines at most 129 bytes and rejects tokens above 128 bytes.
Failed native float conversions fall back to Goose for range/underflow handling.
Float arrays use batches of 64; a failed parse batch is reparsed in Goose.

After changing this directory or `CMakeLists.txt`, run:

```sh
make format
make check
```

This refreshes `json_codec.build`, whose source hash invalidates Goose's local
native-package cache. The hash includes this README; a documentation-only change
can refresh the hash without changing compiled code. Build fields and source
identity are checked separately in the [benchmark source comparison](../bench/CURRENTNESS.md).

## Testing

```sh
make test-native CXX=clang++
make test-native CXX=g++
make fuzz-native FUZZ_RUNS=10000
make fuzz-native FUZZ_FLAGS=-march=native FUZZ_RUNS=10000
```

The tests link the same library with ASan/UBSan. They check integer/float spelling,
bit roundtrips, exact string bytes, chunk progress, short buffers, unaligned
accesses and guard pages. libFuzzer inputs are capped at 16 KiB; public input
limits are tested separately. CI runs bounded fuzz checks without speed thresholds.
Increase `FUZZ_RUNS` for longer local campaigns. Reproducers go in
`.build/fuzz-artifacts/`.

On x86-64, `FUZZ_FLAGS='-U__SSE2__ -U__AVX2__'` exercises scalar scanner branches.
This is not another architecture's test. Native AVX2 checks require a supporting CPU.

## Vendored sources

Original notices and license alternatives are kept beside the source files;
see [NOTICE](../NOTICE). C++ namespaces are renamed at build time to avoid
collisions with another package's copies. Runtime execution needs no network or
external package manager; first-time Goose dependency fetching may need Git/network.

| Dependency | Source revision | Files / license used here |
| --- | --- | --- |
| [Dragonbox](https://github.com/jk-jeon/dragonbox) | `beeeef91cf6fef89a4d4ba5e95d47ca64ccb3a44` | `dragonbox.h`, `dragonbox_to_chars.h/.cpp`; Apache-2.0 WITH LLVM-exception |
| [simdutf](https://github.com/simdutf/simdutf) | `4ab2be54f0b41536d5258675ffad7ba5d10fe384` | UTF-8-only amalgamation; Apache-2.0 |
| [fast_float](https://github.com/fastfloat/fast_float) | `dbeabeeb3e6791cb96994c2a7a084c36e62ccfb2` | Single-header amalgamation; Apache-2.0 |

To regenerate simdutf from its pinned upstream checkout:

```sh
python3 singleheader/amalgamate.py --with-utf8 --source-dir src \
  --include-dir include --output-dir /path/to/native/vendor/simdutf \
  --no-zip --no-readme
```

Keep only `simdutf.cpp`, `simdutf.h` and its original licenses. Generate fast_float
from its pinned checkout with:

```sh
python3 script/amalgamate.py > /path/to/native/vendor/fast_float/fast_float.h
```

Dragonbox files are copied from `include/dragonbox/` and `source/` at its pinned
revision. The compiler collects package symbols only from library modules, not
examples, tests, benchmark files or header-only adapters.
