# Benchmarks

Owned-result API microbenchmarks with current SIMD competition, not a universal ranking. Results include slower cases. Sources, locked dependencies, complete batch samples, executable hashes, and the environment are published.

## Run

From the library root:

```sh
make setup
make bench                         # default-CPU GCC/C++ build, Goose only
make bench-compare                 # also serde_json, sonic-rs, and binary Protobuf
make bench-native                  # native CPU instructions for Goose/GCC AND Rust
python3 bench/measure.py --native --cpu 0 --iterations 200000 --runs 3 --output .build/reproduce-01
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
- `text-ascii`: an 8 KiB ASCII string in a record, 8,225 bytes total.
- `text-escaped`: 512 repetitions containing controls, quotes, backslashes and Unicode, 8,737 wire bytes.
- `wide`: 16 integer fields supplied in reverse declaration order, 135 bytes. This exercises field lookup without an input-order shortcut.

Small records use the requested iterations per sample; integers use one tenth, floats and long text one hundredth, and wide records one fifth (each at least one). Every operation has up to 1,000 warmup iterations and seven timed batches. Checksums prevent unused results, and complete values/array elements are checked before timing. Unsorted per-batch ns/op values are retained in HTML comments beside the visible result tables.

**goose-json** uses strict typed mapping with owned strings/arrays, required/duplicate/unknown-field checks, UTF-8 validation and resource limits. **serde_json 1.0.154** and **sonic-rs 0.5.10** use the same owned Rust structs and `deny_unknown_fields`, with the default safe parsing APIs. serde_json enables `float_roundtrip`; no unchecked parsing is used. JSON resource policies differ, so this compares complete implementations, not identical internal work. Rust `String` establishes UTF-8 before encoding; Goose's mutable byte builder needs checking during encoding. Versions and transitive checksums are locked in [Cargo.lock](compare/Cargo.lock).

**Goose DOM** is borrowing/untyped and does not enforce the typed schema. **prost 0.14.4** uses binary Protobuf with different presence/default/unknown-field rules and byte counts. These are separate API/format choices, not like-for-like JSON competitors. Item tags are id=1, active=2, name=3; numeric arrays use packed field 1 (int64 or double); wide fields use int64 tags 1..16. The Rust annotations are the schema; no protoc is needed.

## Measurement protocol

The recorder builds first, freezes three independent executables (before/after/comparison), then shuffles process order for each pass with seed 219. It selects the actual Cargo-produced executable, isolates native and portable Cargo outputs, hashes all measured binaries, Goose/Rust sources, native sources/headers/vendors, CMake, the package sidecar, fingerprint script and compiler wrappers, and rejects source changes during compilation or measurement. This prevents a concurrent smoke build from replacing the measured executable. The exact baseline commit defaults to `05b81674e101e349ea40a379011418963a7a9794`; `--baseline` selects another compatible revision. The published final run explicitly selects previous codec `d59c5f3ce8eeb03e5ce25178082f86d08ac15d17`. Baseline and candidate use the same current corpus, harness, Goose compiler and native C options. The candidate adds C++ kernels; their exact flags and sources are recorded separately.

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured 2026-11-04 Europe/Paris. Exact UTC start, CPU, kernel, compiler versions,
flags, source SHA-256 hashes, process orders, executable hashes and Cargo profile
are in [metadata.json](results/final-kernels-2026-11-04/metadata.json).
Intel Core Ultra 7 258V, CPU 0; GCC/G++ 16.2.1, Rust 1.101.0-nightly, and Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`. Requested iterations: 200,000.
Measured source: `ee112bf7c88265ed897c70388d7bbd9dd86a5ed7`. Later test/documentation commits do not
change the measured codec. Re-run on your deployment hardware.

Median ns/op, **decode / encode**, lower is better:

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 108.9 / 42.1 | 165.2 / 69.1 | 157.1 / 69.5 |
| Escaped / Unicode | 201.7 / 100.2 | 308.5 / 146.6 | 305.2 / 95.4 |
| 1,024 integers | 9,082.5 / 5,448.0 | 16,972.1 / 8,004.5 | 14,654.1 / 7,933.4 |
| 256 simple floats | 4,896.6 / 9,850.3 | 7,017.7 / 11,733.7 | 7,001.6 / 9,851.4 |
| 256 wide-exponent floats | 8,086.1 / 11,438.8 | 15,938.0 / 9,745.9 | 22,177.4 / 10,553.3 |
| 8 KiB ASCII text | 901.8 / 803.5 | 1,079.2 / 555.5 | 2,232.5 / 4,641.4 |
| Dense escapes / Unicode | 12,250.6 / 9,834.3 | 12,998.4 / 8,373.2 | 22,558.1 / 13,296.7 |
| 16 reversed fields | 742.5 / 203.7 | 934.2 / 408.9 | 1,510.7 / 407.4 |

Measured previous codec → candidate, in the same shuffled run set:

| Fixture | Decode before → after | Encode before → after |
| --- | ---: | ---: |
| Small record | 116.6 → 108.9 | 42.5 → 42.1 |
| Escaped / Unicode | 238.6 → 201.7 | 103.4 → 100.2 |
| 1,024 integers | 10,185.4 → 9,082.5 | 5,502.8 → 5,448.0 |
| 256 simple floats | 6,241.2 → 4,896.6 | 29,173.4 → 9,850.3 |
| 256 wide-exponent floats | 25,023.5 → 8,086.1 | 1,070,141.8 → 11,438.8 |
| 8 KiB ASCII text | 6,511.3 → 901.8 | 5,091.4 → 803.5 |
| Dense escapes / Unicode | 35,669.2 → 12,250.6 | 32,900.0 → 9,834.3 |
| 16 reversed fields | 748.1 → 742.5 | 179.7 → 203.7 |

The candidate has the lowest observed decoding median in each of these eight
fixtures versus the two pinned JSON implementations. Dense text decoding and
simple-float encoding are close enough to competitors that these measurements
should not be interpreted as a statistically established lead. This is not an
exhaustive comparison with every JSON library or machine.

The widest improvement is wide-exponent float encoding: the previous Goose
standard writer's general path takes about 1.07 ms; the native path takes about
11.4 µs, roughly 94× faster. Other substantial gains include about 7.2× faster
ASCII decoding, 6.3× faster ASCII encoding and 3.3× faster dense-text encoding.
These improvements retain strict validation, finite-number checks, numeric/input
limits, owned results and checked Goose output growth.

Encoding still has visible gaps. Sonic is faster on ASCII and dense text and on
wide-exponent floats; serde is faster on the small escaped record. Simple-float
encoding is effectively tied with serde in these medians. Wide-record encoding
regressed from 179.7 to 203.7 ns in this run set despite still beating the compared
JSON libraries. Full batch variability is retained rather than using timing
thresholds or hiding regressions.

The native backend uses bounded scans, fixed-size string chunks and 64-value
float batches, with vendored simdutf, fast_float and Dragonbox. The public API
remains in Goose, which owns allocation and storage. TinyCC/forced-portable
paths retain the checked Goose implementation. See [native details and exact
upstream revisions](../native/README.md).

Separate binary Protobuf and borrowing DOM results, ns/op:

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 58.2 / 39.6 | 116.2 |
| Escaped / Unicode | 62 / 24 | 69.6 / 34.0 | 162.0 |
| 1,024 integers | 4022 / 1923 | 4,484.1 / 7,130.8 | 23,437.9 |
| 256 simple floats | 1581 / 2051 | 768.0 / 545.6 | 6,334.5 |
| 256 wide-exponent floats | 5975 / 2051 | 799.2 / 581.8 | 17,103.9 |
| 8 KiB ASCII text | 8225 / 8199 | 508.7 / 182.2 | 7,001.8 |
| Dense escapes / Unicode | 8737 / 6663 | 8,288.2 / 166.5 | 14,128.6 |
| 16 reversed fields | 135 / 31 | 133.0 / 144.6 | 397.2 |

## Raw data and history

The [final result directory](results/final-kernels-2026-11-04) contains all nine
process outputs plus metadata. Each output retains all seven batch samples for
every row. The table uses all three process passes, not the fastest run.

The earlier [native result directory](results/native-2026-11-04) records the
previous pure-Goose implementation (source `22f21f0`) and its seven-fixture
comparison. The [2026-11-03 methodology](results/2026-11-03-methodology.md) covers
an older three-fixture default-CPU experiment, without Sonic or serde's
float_roundtrip option. Historical measurements are not mixed into the table
above.
