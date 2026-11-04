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
  --baseline 493723faf149c111eca75f3ac0d14514ac262a8b --output .build/reproduce-01
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

The recorder clears inherited C/C++ flags and custom toolchain/stdlib overrides, uses a fresh Goose build cache shared by candidate and baseline for that recording, builds first, freezes three independent executables (before/after/comparison), then shuffles process order for each pass with seed 219. It selects the actual Cargo-produced executable, isolates native and portable Cargo outputs, hashes all measured binaries, Goose/Rust sources, native sources/headers/vendors, CMake, the package sidecar, fingerprint script and compiler wrappers, and rejects source changes during compilation or measurement. This prevents a concurrent smoke build from replacing the measured executable. The exact baseline commit defaults to `05b81674e101e349ea40a379011418963a7a9794`; `--baseline` selects another compatible revision. The published final run explicitly selects previous codec `493723faf149c111eca75f3ac0d14514ac262a8b`. Baseline and candidate use the same current corpus, harness, Goose compiler and native C options. Both candidate and baseline use the native backend; exact flags and source hashes are recorded.

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured 2026-11-04 on an Intel Core Ultra 7 258V, CPU 0, Linux x86-64;
GCC/G++ 16.2.1, Rust 1.101.0-nightly and Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`. Each process requested 200,000
iterations, with fixture-specific divisors described above. Full provenance is
in [metadata.json](results/validated-native-2026-11-04/metadata.json).

Measured candidate: `f6409122724d371e679ccd5cc27ea842097f895b`. Baseline: `493723f`.
Later documentation and test-only changes do not alter the measured codec.
Candidate and baseline were compiled with the same controlled environment and
fresh native build cache. No sanitizer or fuzz instrumentation is enabled in
these normal release builds.

An earlier shared-host series showed large unexplained swings in unchanged
operations. All its samples are [retained](results/contended-native-2026-11-04).
The recording below followed a best-effort request for other workers to avoid
CPU 0. Other cores remained active; CPU 0 was not exclusively isolated and
frequency/turbo were not fixed. Per-process child CPU time was 97.4–99.7% of wall
time. CPU/wall accounting is diagnostic and does not normalize or correct the
reported ns/op. These observations do not establish statistical significance.

### Decode

Median ns/op across three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 114.6 | 170.1 | 162.0 |
| Escaped / Unicode | 214.1 | 315.3 | 302.2 |
| 1,024 integers | 9,595.2 | 17,182.0 | 14,826.8 |
| 256 simple floats | 4,954.9 | 7,199.4 | 7,134.5 |
| 256 wide-exponent floats | 8,658.5 | 15,915.5 | 22,186.7 |
| 64-byte ASCII text | 115.8 | 189.4 | 175.2 |
| 8 KiB sparse escapes | 2,389.1 | 1,583.7 | 2,764.0 |
| 8 KiB ASCII text | 858.6 | 1,064.9 | 2,184.3 |
| Dense escapes / Unicode | 13,221.6 | 13,077.6 | 22,556.8 |
| 16 reversed fields | 793.9 | 920.1 | 1,501.2 |

### Encode

Median ns/op across three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 43.9 | 72.3 | 70.4 |
| Escaped / Unicode | 102.8 | 155.3 | 92.1 |
| 1,024 integers | 5,887.6 | 7,963.0 | 7,878.9 |
| 256 simple floats | 10,586.6 | 10,064.8 | 10,050.6 |
| 256 wide-exponent floats | 11,006.6 | 9,628.1 | 8,926.7 |
| 64-byte ASCII text | 43.2 | 133.2 | 127.1 |
| 8 KiB sparse escapes | 1,995.0 | 634.8 | 4,808.2 |
| 8 KiB ASCII text | 502.2 | 541.9 | 4,516.8 |
| Dense escapes / Unicode | 9,803.2 | 8,411.4 | 12,290.1 |
| 16 reversed fields | 192.5 | 401.0 | 404.3 |

### Matched changes

Previous native codec → candidate, ns/op. All ten fixtures are included.

| Fixture | Decode before → after | Encode before → after |
| --- | ---: | ---: |
| Small record | 113.8 → 114.6 | 43.9 → 43.9 |
| Escaped / Unicode | 220.2 → 214.1 | 106.7 → 102.8 |
| 1,024 integers | 9,800.9 → 9,595.2 | 6,065.5 → 5,887.6 |
| 256 simple floats | 4,955.4 → 4,954.9 | 10,366.6 → 10,586.6 |
| 256 wide-exponent floats | 8,559.1 → 8,658.5 | 11,655.5 → 11,006.6 |
| 64-byte ASCII text | 116.5 → 115.8 | 42.8 → 43.2 |
| 8 KiB sparse escapes | 2,361.5 → 2,389.1 | 2,003.5 → 1,995.0 |
| 8 KiB ASCII text | 995.9 → 858.6 | 641.0 → 502.2 |
| Dense escapes / Unicode | 12,935.0 → 13,221.6 | 10,303.2 → 9,803.2 |
| 16 reversed fields | 798.7 → 793.9 | 194.4 → 192.5 |

Long ASCII encoding takes about 21.7% less time, dense-text encoding about 4.9%
less, and wide-exponent float encoding about 5.6% less in these medians. The
changes use bounded four-vector lookahead, a per-block capacity proof with
fallback checks for smaller buffers, and local scientific formatting. They
preserve UTF-8 validation, finite checks, ownership and output bounds.

There are tradeoffs and remaining gaps. Simple-float encoding is about 2.1%
slower than the previous codec here; short-string encoding is about 0.9% slower.
Several other small differences are within the visible run/batch variability.
Sonic remains faster on sparse text, dense-text encoding and wide-exponent float
encoding; serde leads small escaped-record and wide-exponent float encoding.
Dense-text decoding is close to Sonic. This corpus and one shared machine cannot
establish a universal library ranking.

### Different APIs and formats

Binary Protobuf and borrowing DOM results below are separate comparisons, not
like-for-like typed JSON implementations. Their semantics are described above.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 60.2 / 39.8 | 120.6 |
| Escaped / Unicode | 62 / 24 | 68.8 / 33.7 | 161.9 |
| 1,024 integers | 4022 / 1923 | 4,564.3 / 7,118.8 | 23,868.5 |
| 256 simple floats | 1581 / 2051 | 780.1 / 545.2 | 6,240.7 |
| 256 wide-exponent floats | 5975 / 2051 | 770.6 / 545.0 | 17,304.5 |
| 64-byte ASCII text | 97 / 70 | 61.0 / 40.5 | 173.4 |
| 8 KiB sparse escapes | 8233 / 8205 | 515.5 / 181.4 | 15,729.1 |
| 8 KiB ASCII text | 8225 / 8199 | 508.5 / 181.6 | 7,491.1 |
| Dense escapes / Unicode | 8737 / 6663 | 8,224.7 / 158.8 | 14,845.1 |
| 16 reversed fields | 135 / 31 | 134.3 / 153.3 | 428.7 |

## Raw data and history

The [validated recording](results/validated-native-2026-11-04) contains all nine
process outputs and metadata, retaining every batch sample. All three passes
contribute to the tables; individual fastest batches are not selected.
The [contended series](results/contended-native-2026-11-04) is retained separately
and does not contribute to the current comparison.

The [previous eight-fixture recording](results/final-kernels-2026-11-04) measured
source `ee112bf` against the earlier pure-Goose implementation. Its large float
formatting improvement is historical and is not a speedup over this run's native
baseline. Older [native](results/native-2026-11-04) and
[default-CPU methodology](results/2026-11-03-methodology.md) records are also kept.

See [native checks and fuzzing](../native/README.md#testing) for the sanitizer and
libFuzzer commands. Timing thresholds are deliberately absent from CI.
