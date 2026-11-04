# Benchmarks

Owned-result API microbenchmarks against pinned JSON implementations. Results include slower cases. Sources, locked dependencies, complete batch samples, executable hashes, and the environment are published.

## Run

From the library root:

```sh
make setup
make bench                         # default-CPU GCC/C++ build, Goose only
make bench-compare                 # also serde_json, sonic-rs, and binary Protobuf
make bench-native                  # native CPU instructions for Goose/GCC AND Rust
python3 bench/measure.py --native --cpu 0 --iterations 200000 --runs 3 \
  --baseline ce1f8066fd18de466cc78800202452b7d0fcd9c0 --output .build/reproduce-01
```

Alternatively pass `GOOSE=/absolute/path/to/goose` to Make, or `--goose /absolute/path/to/goose` to the Python runner. Goose setup needs CMake and a C/C++ toolchain; comparisons additionally need Cargo/Rust. The recorder uses only Python's standard library; CPU pinning needs Linux `taskset` and an allowed CPU index. Omit `--cpu` on other systems. Use a fresh output directory outside `native/`: existing data is never overwritten. A full Git clone is needed for the baseline commit, or fetch that commit before measuring.

Native builds are intentionally machine-specific. Generated Goose C receives `-O2 -march=native`; the CMake C++ kernels receive Release flags `-O3 -DNDEBUG -march=native` through the sibling `bench/g++` wrapper. Rust receives its release profile (`opt-level=3`, no LTO) and `-C target-cpu=native`, as [Sonic recommends](https://github.com/cloudwego/sonic-rs#requirementsnotes). Portable benchmarks omit both native flags. Do not mix their results. Native CPU tuning is restricted to this benchmark profile. Default deployment builds use the same checked native backend without `-march=native`; TinyCC uses the Goose fallback. All modes still require the CMake/C++ build dependency described in [native/README.md](../native/README.md).

## Corpus and equivalence

All implementations read the same [JSON fixtures](fixtures). Fixture construction, file I/O, compilation and full-value round-trip validation happen outside timing. Every timed decode builds a fresh result; every encode creates fresh output. Validation, error checks, allocation, result consumption and scope cleanup are timed. Goose's region/data-stack allocation and Rust's heap allocation differ; no allocation-count or memory-footprint claim is made.

- `plain`: 38-byte record, i64 id, bool, owned text.
- `escaped`: 62-byte record with escapes and Unicode; canonical JSON output is 54 bytes.
- `array`: 1,024 integers 0..1023, 4,022 bytes.
- `floats`: 256 values `(i - 128) / 8`, 1,581 bytes. These dyadic values round-trip exactly; they are not a difficult-decimal or full-f64-distribution corpus. Boundary/rounding correctness is tested separately.
- `floats-wide`: 256 finite values sampling the binary exponent range, 5,975 input bytes. Mantissas are `((i * 2654435761) % 1000003 + 1) / 1000003.0`, scaled by `2^((i * 37) % 2045 - 1022)`, alternating sign. First/last values are 0.125/1.25 for bounded consumption. This stresses long significant digits and large/small exponents; it is still a synthetic distribution. The Goose harness verifies every element against that formula before timing. Equivalent JSON encodings can have different byte counts.
- `text-short`: a 64-byte ASCII string in a 97-byte record, covering the native writer threshold. Uses the full requested iteration count.
- `text-sparse`: 8 KiB ASCII with one newline, one quote and a Unicode suffix; 8,233 input bytes. Exercises long strings with few escapes.
- `text-ascii`: an 8 KiB ASCII string in a record, 8,225 bytes total.
- `text-escaped`: 512 repetitions containing controls, quotes, backslashes and Unicode, 8,737 wire bytes.
- `wide`: 16 integer fields supplied in reverse declaration order, 135 bytes. This exercises field lookup without an input-order shortcut.

Small records and `text-short` use the requested iterations per sample; integers use one tenth, floats and long text one hundredth, and wide records one fifth (each at least one). Every operation has up to 1,000 warmup iterations and seven timed batches. Checksums prevent unused results, and complete values/array elements are checked before timing. Unsorted per-batch ns/op values are retained in HTML comments beside the visible result tables.

**goose-json** uses strict typed mapping with owned strings/arrays, required/duplicate/unknown-field checks, UTF-8 validation and resource limits. **serde_json 1.0.154** and **sonic-rs 0.5.10** use the same owned Rust structs and `deny_unknown_fields`, with the default safe parsing APIs. serde_json enables `float_roundtrip`; no unchecked parsing is used. JSON resource policies differ, so this compares complete implementations, not identical internal work. Rust `String` establishes UTF-8 before encoding; Goose's mutable byte builder needs checking during encoding. Versions and transitive checksums are locked in [Cargo.lock](compare/Cargo.lock).

**Goose DOM** is borrowing/untyped and does not enforce the typed schema. **prost 0.14.4** uses binary Protobuf with different presence/default/unknown-field rules and byte counts. These are separate API/format choices, not like-for-like JSON competitors. Item tags are id=1, active=2, name=3; numeric arrays use packed field 1 (int64 or double); wide fields use int64 tags 1..16. The Rust annotations are the schema; no protoc is needed.

## Measurement protocol

The recorder clears inherited C/C++ flags and custom toolchain/stdlib overrides, uses a fresh Goose build cache shared by candidate and baseline for that recording, builds first, freezes three independent executables (before/after/comparison), then shuffles process order for each pass with seed 219. It selects the actual Cargo-produced executable, isolates native and portable Cargo outputs, hashes all measured binaries, Goose/Rust sources, native sources/headers/vendors, CMake, the package sidecar, fingerprint script and compiler wrappers, and rejects source changes during compilation or measurement. This prevents a concurrent smoke build from replacing the measured executable. The exact baseline commit defaults to `05b81674e101e349ea40a379011418963a7a9794`; `--baseline` selects another compatible revision. The published final run explicitly selects previous codec `ce1f8066fd18de466cc78800202452b7d0fcd9c0`. Baseline and candidate use the same current corpus, harness, Goose compiler and native C options. Both candidate and baseline use the native backend; exact flags and source hashes are recorded.

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured 2026-11-04 on an Intel Core Ultra 7 258V, CPU 2, Linux x86-64;
GCC/G++ 16.2.1, Rust 1.101.0-nightly and Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`. Each process requested 200,000
iterations, with fixture-specific divisors described above. Full provenance is
in [metadata.json](results/sparse-native-2026-11-04/metadata.json).

Measured candidate: `6fad097cef35c0623b45e96e84246de6b0a64a70`. Baseline: `ce1f8066fd18de466cc78800202452b7d0fcd9c0`.
Later documentation and test/CI changes do not alter the measured codec. The
Makefile has since gained a debug-test target; its benchmark targets and flags
are unchanged. Both measured builds use
the same controlled environment, fresh native cache and release flags; sanitizer
and fuzz instrumentation are disabled.

The previous SQLite matched series completed before this CPU 2 window began.
Sibling owners agreed to keep new heavy jobs off CPU 2; other-core validation
continued. Our fuzzing and independent review had finished before timing.
This was best-effort coordination on a shared desktop host, not exclusive core
or machine isolation. CPU frequency/turbo were not fixed. Per-process child CPU
time was 95.2–99.8% of wall time. That diagnostic does not normalize or correct
ns/op and does not establish statistical significance.

### Decode

Median ns/op across three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 115.8 | 175.7 | 158.6 |
| Escaped / Unicode | 214.5 | 301.0 | 312.8 |
| 1,024 integers | 9,274.1 | 16,875.3 | 14,617.7 |
| 256 simple floats | 4,480.1 | 7,114.3 | 7,054.3 |
| 256 wide-exponent floats | 8,251.9 | 15,545.0 | 22,114.7 |
| 64-byte ASCII text | 112.8 | 197.0 | 181.0 |
| 8 KiB sparse escapes | 1,075.9 | 1,574.6 | 2,784.4 |
| 8 KiB ASCII text | 847.5 | 1,096.4 | 2,200.0 |
| Dense escapes / Unicode | 12,634.4 | 12,930.8 | 23,584.2 |
| 16 reversed fields | 765.2 | 948.9 | 1,484.4 |

### Encode

Median ns/op across three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 42.5 | 75.0 | 73.3 |
| Escaped / Unicode | 97.2 | 143.0 | 92.3 |
| 1,024 integers | 5,391.7 | 7,793.6 | 7,812.6 |
| 256 simple floats | 9,452.4 | 10,275.3 | 9,721.9 |
| 256 wide-exponent floats | 10,550.6 | 10,206.8 | 9,572.4 |
| 64-byte ASCII text | 42.6 | 134.6 | 129.3 |
| 8 KiB sparse escapes | 950.9 | 634.1 | 4,811.1 |
| 8 KiB ASCII text | 492.1 | 537.4 | 4,580.9 |
| Dense escapes / Unicode | 9,671.5 | 8,368.2 | 12,099.2 |
| 16 reversed fields | 183.4 | 403.4 | 404.3 |

### Matched changes

Previous native codec → candidate, ns/op. All ten fixtures are included.

| Fixture | Decode before → after | Encode before → after |
| --- | ---: | ---: |
| Small record | 111.2 → 115.8 | 43.0 → 42.5 |
| Escaped / Unicode | 196.1 → 214.5 | 93.9 → 97.2 |
| 1,024 integers | 9,350.3 → 9,274.1 | 5,525.3 → 5,391.7 |
| 256 simple floats | 5,067.6 → 4,480.1 | 10,717.2 → 9,452.4 |
| 256 wide-exponent floats | 8,522.6 → 8,251.9 | 11,005.2 → 10,550.6 |
| 64-byte ASCII text | 116.2 → 112.8 | 44.2 → 42.6 |
| 8 KiB sparse escapes | 2,318.2 → 1,075.9 | 1,927.7 → 950.9 |
| 8 KiB ASCII text | 844.0 → 847.5 | 499.5 → 492.1 |
| Dense escapes / Unicode | 12,803.8 → 12,634.4 | 9,625.6 → 9,671.5 |
| 16 reversed fields | 785.4 → 765.2 | 187.8 → 183.4 |

Sparse-text decoding takes about 53.6% less time and encoding about
50.7% less time in these medians. Plain spans between escapes are coalesced into
bounded scans and copies instead of copying each 32-byte block separately.
A local decimal-conversion helper preserves the existing C ABI and Dragonbox
policies. Simple-float encoding takes about 11.8% less time here.
UTF-8 validation, buffer bounds, numeric spelling and ownership are unchanged.

Small escaped-record decoding is 9.4% slower (196.1 → 214.5 ns/op), and
encoding 3.5% slower. Small-record decoding is 4.1% slower; dense-text encoding
is 0.5% slower. All regressions are visible in the matched table, including
operations whose production path did not change. Small differences can reflect run/batch noise,
code layout, scheduling or frequency changes. Competitor results remain
workload-dependent; the tables support neither a universal ranking nor a
statistical-significance claim. See all raw samples before interpreting close
results.

### Different APIs and formats

Binary Protobuf and borrowing DOM results below are separate comparisons, not
like-for-like typed JSON implementations. Their semantics are described above.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 60.2 / 39.7 | 115.3 |
| Escaped / Unicode | 62 / 24 | 68.6 / 34.6 | 155.3 |
| 1,024 integers | 4022 / 1923 | 4,424.6 / 6,965.4 | 23,715.3 |
| 256 simple floats | 1581 / 2051 | 859.8 / 582.0 | 6,277.7 |
| 256 wide-exponent floats | 5975 / 2051 | 850.9 / 546.9 | 16,941.4 |
| 64-byte ASCII text | 97 / 70 | 61.5 / 40.6 | 171.8 |
| 8 KiB sparse escapes | 8233 / 8205 | 521.5 / 183.0 | 14,462.1 |
| 8 KiB ASCII text | 8225 / 8199 | 543.4 / 183.6 | 7,052.6 |
| Dense escapes / Unicode | 8737 / 6663 | 8,260.5 / 157.9 | 14,302.7 |
| 16 reversed fields | 135 / 31 | 133.8 / 144.0 | 425.9 |

## Raw data and history

The [sparse-run recording](results/sparse-native-2026-11-04) contains all nine
process outputs and metadata, retaining every batch sample. All three passes
contribute to the tables; individual fastest batches are not selected.

The [previous validated recording](results/validated-native-2026-11-04) measured
`f640912` against `493723f`, including bounded scan and dense-text improvements.
An [earlier contended series](results/contended-native-2026-11-04) is retained
separately and does not contribute to the current tables. The initial exploratory
[sparse-run probe](results/sparse-exploratory-2026-11-04) overlapped a local
kernel timing job in its first passes and is not used for the published comparison.

The [eight-fixture recording](results/final-kernels-2026-11-04) measured source
`ee112bf` against the earlier pure-Goose implementation. Its large float formatting
improvement is historical, not a speedup over the current native baseline.
Older [native](results/native-2026-11-04) and
[default-CPU methodology](results/2026-11-03-methodology.md) records are also kept.

See [native checks and fuzzing](../native/README.md#testing) for the sanitizer and
libFuzzer commands. Timing thresholds are deliberately absent from CI.
