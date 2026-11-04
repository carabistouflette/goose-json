# Benchmarks

Owned-result API microbenchmarks against pinned JSON implementations. Results include slower cases. Sources, locked dependencies, complete batch samples, executable hashes, and the environment are published.

## Run

From the library root:

```sh
make setup
make bench                         # default-CPU GCC/C++ build, Goose only
make bench-compare                 # also serde_json, sonic-rs, and binary Protobuf
make bench-native                  # native CPU instructions for Goose/GCC AND Rust
python3 bench/measure.py --native --cpu 4 --iterations 200000 --runs 3 \
  --baseline 0c26308570cbe2c6769c1bf0eba8d86e7e8ad681 --output .build/reproduce-01
```

Alternatively pass `GOOSE=/absolute/path/to/goose` to Make, or `--goose /absolute/path/to/goose` to the Python runner. Goose setup needs CMake and a C/C++ toolchain; comparisons additionally need Cargo/Rust. The recorder uses only Python's standard library; CPU pinning needs Linux `taskset` and an allowed CPU index. Omit `--cpu` on other systems. Use a fresh output directory outside `native/`: existing data is never overwritten. A full Git clone is needed for the baseline commit, or fetch that commit before measuring.

Native builds are intentionally machine-specific. Generated Goose C receives `-O2 -march=native`; the CMake C++ kernels receive Release flags `-O3 -DNDEBUG -march=native` through the sibling `bench/g++` wrapper. Rust receives its release profile (`opt-level=3`, no LTO) and `-C target-cpu=native`, as [Sonic recommends](https://github.com/cloudwego/sonic-rs#requirementsnotes). Portable benchmarks omit both native flags. Do not mix their results. Native CPU tuning is restricted to this benchmark profile. Default deployment builds use the same checked native backend without `-march=native`; TinyCC uses the Goose fallback. All modes still require the CMake/C++ build dependency described in [native/README.md](../native/README.md).

Use the Python recorder for controlled comparisons. It supplies the top-level
Rust release settings explicitly: optimization 3, no debug information/assertions,
no overflow checks/LTO/incremental compilation, 16 codegen units, unwinding panics
and no stripping. It clears inherited `CARGO_PROFILE_*` settings and forces
`CARGO_INCREMENTAL=0`. Requested settings and Cargo's observed executable profile
are recorded separately; an incompatible observed profile stops the run before
timing. Compiler wrappers and package-specific Cargo configuration remain part of
the trusted toolchain. The simple Make benchmark targets use the caller's environment.

## Corpus and equivalence

All implementations read the same [JSON fixtures](fixtures). Fixture construction, file I/O, compilation and full-value round-trip validation happen outside timing. Every timed decode builds a fresh result; every encode creates fresh output. Validation, error checks, allocation, result consumption and scope cleanup are timed. Goose's region/data-stack allocation and Rust's heap allocation differ; no allocation-count or memory-footprint claim is made.

- `plain`: 38-byte record, i64 id, bool, owned text.
- `escaped`: 62-byte record with escapes and Unicode; canonical JSON output is 54 bytes.
- `array`: 1,024 integers 0..1023, 4,022 bytes.
- `array-signed`: 1,024 alternating positive/negative integers with magnitudes 1..1024.
- `array-wide`: 1,024 signed integers including i64 limits and the 9,999/10,000 formatting boundary, then deterministic large magnitudes with alternating signs.
- `mixed`: a synthetic event with an i64-limit ID, bool, difficult decimal, nested region/owned label, 16 large/signed counters, 32 float samples, flags and escaped Unicode text. Members are supplied in reverse declaration order. This models a mixed shape, not captured production traffic.
- `floats`: 256 values `(i - 128) / 8`, 1,581 bytes. These dyadic values round-trip exactly; they are not a difficult-decimal or full-f64-distribution corpus. Boundary/rounding correctness is tested separately.
- `floats-wide`: 256 finite values sampling the binary exponent range, 5,975 input bytes. Mantissas are `((i * 2654435761) % 1000003 + 1) / 1000003.0`, scaled by `2^((i * 37) % 2045 - 1022)`, alternating sign. First/last values are 0.125/1.25 for bounded consumption. This stresses long significant digits and large/small exponents; it is still a synthetic distribution. The Goose harness verifies every element against that formula before timing. Equivalent JSON encodings can have different byte counts.
- `text-short`: a 64-byte ASCII string in a 97-byte record, covering the native writer threshold. Uses the full requested iteration count.
- `text-sparse`: 8 KiB ASCII with one newline, one quote and a Unicode suffix; 8,233 input bytes. Exercises long strings with few escapes.
- `text-ascii`: an 8 KiB ASCII string in a record, 8,225 bytes total.
- `text-escaped`: 512 repetitions containing controls, quotes, backslashes and Unicode, 8,737 wire bytes.
- `wide`: 16 integer fields supplied in reverse declaration order, 135 bytes. This exercises field lookup without an input-order shortcut.

Small records and `text-short` use the requested iterations per sample; integers and mixed events use one tenth, floats and long text one hundredth, and wide records one fifth (each at least one). Every operation has up to 1,000 warmup iterations and seven timed batches. Checksums consume results; integer endpoint contributions use `% 1024` to keep large values and accumulated sums bounded. Both typed harnesses check all fixture fields/elements before timing and validate float round-trips by bits. The Goose harness uses `deserialize_into` for all shapes, including independently owned fields in root structs. New fixtures are reproducible with `python3 bench/fixtures.py`; `--check` rejects drift without rewriting them. Unsorted per-batch ns/op values are retained in HTML comments beside the visible result tables.

**goose-json** uses strict typed mapping with owned strings/arrays, required/duplicate/unknown-field checks, UTF-8 validation and resource limits. **serde_json 1.0.154** and **sonic-rs 0.5.10** use the same owned Rust structs and `deny_unknown_fields`, with the default safe parsing APIs. serde_json enables `float_roundtrip`; no unchecked parsing is used. JSON resource policies differ, so this compares complete implementations, not identical internal work. Rust `String` establishes UTF-8 before encoding; Goose's mutable byte builder needs checking during encoding. Versions and transitive checksums are locked in [Cargo.lock](compare/Cargo.lock).

**Goose DOM** is borrowing/untyped and does not enforce the typed schema. **prost 0.14.4** uses binary Protobuf with different presence/default/unknown-field rules and byte counts. These are separate API/format choices, not like-for-like JSON competitors. DOM numbers cannot losslessly represent every wide i64. Protobuf `int64` negative values use ten-byte varints; these results do not represent a zigzag `sint64` schema. Item tags are id=1, active=2, name=3; numeric arrays use packed field 1 (int64 or double); wide fields use int64 tags 1..16. The Rust annotations are the schema; no protoc is needed. Mixed event tags are event_id=1, active=2, reading=3, required context=4, counters=5, samples=6, flags=7, message=8; context uses region=1 and label=2. The nested required Protobuf message still has different presence semantics from JSON.

## Measurement protocol

The recorder clears inherited C/C++ flags, Cargo profile overrides and custom toolchain/stdlib overrides, uses a fresh Goose build cache shared by candidate and baseline for that recording, builds first, freezes three independent executables (before/after/comparison), then shuffles process order for each pass with seed 219. It selects and checks the actual Cargo-produced executable, isolates native and portable Cargo outputs, hashes all measured binaries, Goose/Rust sources, native sources/headers/vendors, CMake, the package sidecar, fingerprint script and compiler wrappers, and rejects source changes during compilation or measurement. This prevents a concurrent smoke build from replacing the measured executable. The exact baseline commit defaults to `05b81674e101e349ea40a379011418963a7a9794`; `--baseline` selects another compatible revision. Published records explicitly identify their selected baseline; pass `--baseline v0.1.1` for the fixed experimental release. Baseline and candidate use the same current corpus, harness, Goose compiler and native C options. Both candidate and baseline use the native backend; exact flags and source hashes are recorded. Every completed pass must also have matching typed-decoder fixture sets, iteration counts and consumption checksums across both Goose revisions, serde, Sonic and Protobuf. A mismatch stops recording, retains raw data/provenance and marks validation failed in metadata. Encoding checksums are not equated across libraries because valid number spelling can differ.

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured source `4835c5041ec69605f6b027a11b365f860f2c9ef8` against fixed `v0.1.1`
(`fcae091cf89c1692b1e2d64891f645c862cc8844`) on 2026-11-04. Both contain the same
production codec. The before/after columns below are controls using the expanded
harness, not a codec optimization claim. Every pass passed the typed-decoder
checksum/count/fixture-set check. [Full provenance](results/corpus-native-2026-11-04/recording/metadata.json).

Intel Core Ultra 7 258V, Linux x86-64, CPU 4 affinity; pinned Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`, GCC/G++ 16.2.1 and Rust 1.101.0-nightly.
All three shuffled process passes requested 200,000 iterations, with fixture
scaling above. Native CPU tuning applies to Goose/C++ and Rust. Requested and
observed release profiles, source hashes and executable hashes are retained.

This shared desktop had no exclusive CPU reservation or fixed frequency/turbo.
The independent review used CPU 5; other work could continue. Child CPU time was
99.1–99.7% of wall time, a scheduling diagnostic rather than
a correction. All 3,276 batch averages are retained; close results can overlap.
Control differences illustrate variability and code-path/layout effects. These
synthetic cases support neither a universal ranking nor a significance claim.

### Decode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 74.4 | 188.9 | 105.5 |
| Escaped / Unicode | 143.8 | 355.6 | 238.7 |
| 1,024 nonnegative integers | 7,753.8 | 19,948.1 | 14,639.1 |
| 1,024 signed small integers | 7,354.0 | 19,390.3 | 14,286.9 |
| 1,024 wide integers | 21,676.5 | 24,005.3 | 30,222.9 |
| Mixed event | 1,669.6 | 2,988.0 | 3,053.6 |
| 256 simple floats | 3,310.1 | 5,442.4 | 4,876.9 |
| 256 wide-exponent floats | 5,942.0 | 10,437.4 | 14,324.2 |
| 64-byte ASCII text | 93.8 | 137.2 | 108.6 |
| 8 KiB sparse escapes | 1,238.6 | 1,944.0 | 2,246.3 |
| 8 KiB ASCII text | 878.2 | 1,192.2 | 1,472.1 |
| Dense escapes / Unicode | 10,979.4 | 16,075.6 | 20,499.4 |
| 16 reversed fields | 317.0 | 697.9 | 694.2 |

### Encode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 35.2 | 58.0 | 51.5 |
| Escaped / Unicode | 70.0 | 128.8 | 73.0 |
| 1,024 nonnegative integers | 3,983.2 | 7,174.0 | 6,986.6 |
| 1,024 signed small integers | 4,881.5 | 6,485.5 | 6,089.0 |
| 1,024 wide integers | 18,909.8 | 12,252.5 | 12,414.8 |
| Mixed event | 1,845.8 | 2,255.0 | 1,700.9 |
| 256 simple floats | 7,379.0 | 10,146.6 | 6,264.4 |
| 256 wide-exponent floats | 8,147.5 | 11,146.2 | 6,477.5 |
| 64-byte ASCII text | 38.0 | 97.6 | 72.6 |
| 8 KiB sparse escapes | 1,179.7 | 499.6 | 3,957.7 |
| 8 KiB ASCII text | 546.0 | 446.7 | 3,390.9 |
| Dense escapes / Unicode | 7,779.9 | 7,266.0 | 6,863.5 |
| 16 reversed fields | 124.9 | 319.0 | 327.7 |

### Fixed-release controls

Both revisions use the expanded harness and the same production codec.

| Fixture | Decode release → current | Encode release → current |
| --- | ---: | ---: | ---: |
| Small record | 76.7 → 74.4 | 36.4 → 35.2 |
| Escaped / Unicode | 149.4 → 143.8 | 69.1 → 70.0 |
| 1,024 nonnegative integers | 7,780.8 → 7,753.8 | 4,329.2 → 3,983.2 |
| 1,024 signed small integers | 7,593.0 → 7,354.0 | 4,850.9 → 4,881.5 |
| 1,024 wide integers | 22,584.4 → 21,676.5 | 19,331.9 → 18,909.8 |
| Mixed event | 1,637.8 → 1,669.6 | 1,868.9 → 1,845.8 |
| 256 simple floats | 3,691.6 → 3,310.1 | 8,233.2 → 7,379.0 |
| 256 wide-exponent floats | 6,109.1 → 5,942.0 | 8,189.2 → 8,147.5 |
| 64-byte ASCII text | 84.9 → 93.8 | 34.9 → 38.0 |
| 8 KiB sparse escapes | 1,237.7 → 1,238.6 | 1,220.1 → 1,179.7 |
| 8 KiB ASCII text | 1,199.7 → 878.2 | 772.2 → 546.0 |
| Dense escapes / Unicode | 11,211.7 → 10,979.4 | 8,000.1 → 7,779.9 |
| 16 reversed fields | 320.7 → 317.0 | 130.2 → 124.9 |

### Different APIs and formats

Protobuf and borrowing DOM have separate contracts; neither is a like-for-like
typed JSON implementation. DOM cannot losslessly represent every wide i64;
negative Protobuf int64 values use ten-byte varints (not zigzag sint64).

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 53.7 / 25.5 | 54.7 |
| Escaped / Unicode | 62 / 24 | 51.5 / 22.5 | 95.1 |
| 1,024 nonnegative integers | 4022 / 1923 | 4,171.7 / 6,768.8 | 12,168.3 |
| 1,024 signed small integers | 4538 / 6083 | 5,173.4 / 14,937.6 | 12,361.2 |
| 1,024 wide integers | 19771 / 9669 | 6,696.8 / 21,842.2 | 34,601.6 |
| Mixed event | 1187 / 954 | 943.4 / 402.3 | 1,946.5 |
| 256 simple floats | 1581 / 2051 | 701.2 / 275.1 | 3,170.0 |
| 256 wide-exponent floats | 5975 / 2051 | 847.5 / 279.5 | 10,762.8 |
| 64-byte ASCII text | 97 / 70 | 42.6 / 24.4 | 98.9 |
| 8 KiB sparse escapes | 8233 / 8205 | 506.0 / 252.0 | 9,687.6 |
| 8 KiB ASCII text | 8225 / 8199 | 489.8 / 268.5 | 4,900.8 |
| Dense escapes / Unicode | 8737 / 6663 | 8,106.7 / 266.5 | 11,575.3 |
| 16 reversed fields | 135 / 31 | 104.4 / 98.2 | 238.1 |

## Raw data and history

The [expanded-corpus recording](results/corpus-native-2026-11-04) contains all
nine process outputs, 3,276 batch averages, source/executable hashes, build
profiles and scheduling metadata. Every pass contributes to the tables.
[Separate encode-only profiles](results/corpus-native-2026-11-04/PROFILING.md)
identify integer conversion/copying, float formatting and escaping costs; they
use instrumented builds and never contribute latency values to these tables.

The [initial remainder probe](results/corpus-remainder-probe-2026-11-04) completed
normally but is excluded: Rust signed remainder and Goose nonnegative modulo
made wide-integer consumption checksums differ despite full decoded-value
validation passing. All raw data is retained. Rust now uses `rem_euclid`, and
the recorder rejects this mismatch automatically before accepting a pass.

The [historical formatter-isolation report](results/formatter-native-2026-11-04/report.md)
retains the prior ten-fixture recording and its matched regression analysis.
The expanded corpus also changes the harness and consumption checks, so do not
attribute absolute differences between historical recordings to codec changes.

The [historical sparse-run recording](results/sparse-native-2026-11-04) retains
its original raw data, matched-change narrative and tables. It measured `6fad097`
against `ce1f806` on CPU 2; it is not a rerun of the formatter fix.

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
