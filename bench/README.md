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
  --baseline v0.1.2 --output .build/reproduce-01
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

The recorder clears inherited C/C++ flags, Cargo profile overrides and custom toolchain/stdlib overrides, uses a fresh Goose build cache shared by candidate and baseline for that recording, builds first, freezes three independent executables (before/after/comparison), then shuffles process order for each pass with seed 219. It selects and checks the actual Cargo-produced executable, isolates native and portable Cargo outputs, hashes all measured binaries, Goose/Rust sources, native sources/headers/vendors, CMake, the package sidecar, fingerprint script and compiler wrappers, and rejects source changes during compilation or measurement. This prevents a concurrent smoke build from replacing the measured executable. The exact baseline commit defaults to `05b81674e101e349ea40a379011418963a7a9794`; `--baseline` selects another compatible revision. Published records explicitly identify their selected baseline; pass `--baseline v0.1.2` for this recording’s fixed release. Baseline and candidate use the same current corpus, harness, Goose compiler and native C options. Both candidate and baseline use the native backend; exact flags and source hashes are recorded. Every completed pass must also have matching typed-decoder fixture sets, iteration counts and consumption checksums across both Goose revisions, serde, Sonic and Protobuf. A mismatch stops recording, retains raw data/provenance and marks validation failed in metadata. Encoding checksums are not equated across libraries because valid number spelling can differ.

Older before/after recorders do not match absolute build paths/cache history.
A later [float-suffix investigation](results/float-suffix-native-2026-11-05)
includes identical-source controls and a separate matched-build recorder that
produced byte-identical A/A executables. Historical data remains unchanged;
small shifts are not proof of algorithmic effects, and no control is subtracted
from a candidate measurement. See that report for the exact build procedures.

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured source `52473a635952b12eddbb78b4d241b24d3d9f0b21` against fixed `v0.1.2`
(`3fa7b5275399641f8069698b6c097ea66cef7929`) on 2026-11-04. This repeats the reviewed integer change with
identical production code to the prior recording; no further optimization was
introduced for this run. All thirteen fixtures passed typed-decoder checksum,
iteration-count and fixture-set validation in every pass.
[Complete provenance](results/release-013-native-2026-11-04/recording/metadata.json).

Intel Core Ultra 7 258V, Linux x86-64, CPU4 affinity. Goose `eadca409f68210893f366e60d0c2f0dc29a339be`,
GCC/G++ 16.2.1, Rust 1.101.0-nightly; native tuning on both Goose/C++ and Rust.
Three shuffled process passes, seven batches each, 200,000 requested iterations
with fixture scaling described above. Every one of the 3,276 batch averages is
retained. Median ns/op across the three process-pass medians; lower is better.

A best-effort quiet CPU4 window was requested before launch and acknowledged
while the series was running. Coordinated owners avoided new heavy CPU4 work;
unrestricted HTTP/crypto jobs could still schedule there. A brief pre-launch
snapshot showed no heavy CPU4 worker. There was no exclusive reservation or
fixed frequency/turbo.

**Residual contention:** baseline passes 1 and 3 had child CPU/wall ratios of
83.5% and 83.7%, versus about 99% for every candidate process. This asymmetric
scheduling loss can favor the candidate. Other processes ranged 98.8–99.3%,
and batches still varied substantially. These ratios are diagnostics, never
time corrections. All passes and regressions are included. Neither the
aggregate percentage changes nor close cross-library results establish a
reliable ranking or statistical significance. The earlier contended recording
is also retained; this rerun is not an isolated-host measurement.

### Decode

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 112.5 | 280.7 | 112.9 |
| Escaped / Unicode | 228.0 | 323.4 | 247.7 |
| 1,024 nonnegative integers | 11,467.5 | 26,372.3 | 16,502.6 |
| 1,024 signed small integers | 10,082.1 | 19,386.5 | 16,113.9 |
| 1,024 wide integers | 32,243.1 | 30,750.5 | 36,126.8 |
| Mixed event | 2,531.8 | 3,713.6 | 4,685.7 |
| 256 simple floats | 4,886.5 | 8,035.0 | 6,962.8 |
| 256 wide-exponent floats | 8,531.8 | 15,962.4 | 22,669.4 |
| 64-byte ASCII text | 116.6 | 231.0 | 170.6 |
| 8 KiB sparse escapes | 1,583.3 | 2,636.6 | 3,310.9 |
| 8 KiB ASCII text | 1,199.3 | 1,906.8 | 2,275.4 |
| Dense escapes / Unicode | 14,479.1 | 24,368.9 | 26,196.2 |
| 16 reversed fields | 435.7 | 1,016.8 | 833.3 |

### Encode

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 51.1 | 64.9 | 56.2 |
| Escaped / Unicode | 108.9 | 110.3 | 77.5 |
| 1,024 nonnegative integers | 6,148.9 | 9,755.6 | 8,341.1 |
| 1,024 signed small integers | 5,195.7 | 6,737.7 | 6,481.7 |
| 1,024 wide integers | 15,424.2 | 16,747.9 | 16,735.1 |
| Mixed event | 2,688.3 | 3,197.4 | 2,476.2 |
| 256 simple floats | 10,818.4 | 14,676.9 | 8,967.2 |
| 256 wide-exponent floats | 12,070.4 | 17,591.8 | 9,719.2 |
| 64-byte ASCII text | 50.2 | 155.0 | 115.0 |
| 8 KiB sparse escapes | 1,511.8 | 743.3 | 5,720.3 |
| 8 KiB ASCII text | 743.1 | 711.1 | 5,513.9 |
| Dense escapes / Unicode | 11,858.8 | 8,926.8 | 10,454.0 |
| 16 reversed fields | 152.5 | 463.3 | 400.2 |

### Matched fixed-release comparison

Times are ns/op. Negative changes mean less time. Decoder, float and string
kernels are unchanged by the integer optimization; their observed timing
changes must not be attributed to improvements to those algorithms.

| Fixture | Decode release → current (change) | Encode release → current (change) |
| --- | ---: | ---: |
| Small record | 121.5 → 112.5 (-7.4%) | 55.8 → 51.1 (-8.4%) |
| Escaped / Unicode | 236.0 → 228.0 (-3.4%) | 107.6 → 108.9 (+1.2%) |
| 1,024 nonnegative integers | 12,025.9 → 11,467.5 (-4.6%) | 6,425.2 → 6,148.9 (-4.3%) |
| 1,024 signed small integers | 11,834.2 → 10,082.1 (-14.8%) | 7,681.5 → 5,195.7 (-32.4%) |
| 1,024 wide integers | 32,434.5 → 32,243.1 (-0.6%) | 29,355.2 → 15,424.2 (-47.5%) |
| Mixed event | 2,616.5 → 2,531.8 (-3.2%) | 2,878.5 → 2,688.3 (-6.6%) |
| 256 simple floats | 5,528.8 → 4,886.5 (-11.6%) | 12,342.5 → 10,818.4 (-12.3%) |
| 256 wide-exponent floats | 8,918.6 → 8,531.8 (-4.3%) | 11,975.4 → 12,070.4 (+0.8%) |
| 64-byte ASCII text | 111.9 → 116.6 (+4.2%) | 47.7 → 50.2 (+5.2%) |
| 8 KiB sparse escapes | 1,940.6 → 1,583.3 (-18.4%) | 1,901.4 → 1,511.8 (-20.5%) |
| 8 KiB ASCII text | 1,384.9 → 1,199.3 (-13.4%) | 871.6 → 743.1 (-14.7%) |
| Dense escapes / Unicode | 14,766.4 → 14,479.1 (-1.9%) | 11,364.5 → 11,858.8 (+4.3%) |
| 16 reversed fields | 524.8 → 435.7 (-17.0%) | 196.7 → 152.5 (-22.5%) |

| Wide-integer encoding | v0.1.2 ns/op | Current ns/op | Change |
| --- | ---: | ---: | ---: |
| Pass 1 | 29,355.2 | 12,639.0 | -56.9% |
| Pass 2 | 27,807.5 | 17,284.9 | -37.8% |
| Pass 3 | 30,453.7 | 15,424.2 | -49.4% |

### Different APIs and formats

Protobuf and borrowing DOM have different contracts. Neither is a like-for-like
typed JSON implementation; DOM loses precision for some wide i64 values and
Protobuf uses binary data with different field/presence rules. Negative `int64`
values use ten-byte varints, not zigzag `sint64`. Times are ns/op.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 57.4 / 32.2 | 82.3 |
| Escaped / Unicode | 62 / 24 | 49.7 / 24.1 | 148.4 |
| 1,024 nonnegative integers | 4022 / 1923 | 5,401.8 / 8,298.2 | 19,137.1 |
| 1,024 signed small integers | 4538 / 6083 | 5,529.4 / 16,299.2 | 17,691.6 |
| 1,024 wide integers | 19771 / 9669 | 11,100.8 / 33,491.3 | 51,924.4 |
| Mixed event | 1187 / 954 | 1,444.4 / 608.2 | 2,804.5 |
| 256 simple floats | 1581 / 2051 | 1,076.1 / 379.0 | 4,478.3 |
| 256 wide-exponent floats | 5975 / 2051 | 875.0 / 415.9 | 16,082.6 |
| 64-byte ASCII text | 97 / 70 | 64.8 / 35.4 | 133.4 |
| 8 KiB sparse escapes | 8233 / 8205 | 783.8 / 407.6 | 13,101.9 |
| 8 KiB ASCII text | 8225 / 8199 | 765.4 / 415.0 | 6,771.5 |
| Dense escapes / Unicode | 8737 / 6663 | 9,499.4 / 346.9 | 17,081.4 |
| 16 reversed fields | 135 / 31 | 147.9 / 142.2 | 321.7 |

## Raw data and history

The [encoder allocation/copy diagnostic](results/encoder-copies-2026-11-05)
records phase-scoped operation counts across thirteen fixtures, with positive
controls and explicit coverage limits. It found no allocation-focused production
change to justify; these counts are not latency or memory-use measurements.

The [float-suffix experiments and controls](results/float-suffix-native-2026-11-05)
retain all 8,190 batch averages, including the matched-build A/A control and final
comparison. Neither native variant was adopted. Canonical spelling regressions
and the matched-build recorder remain; production formatting is unchanged.

The [rejected prefix-reuse experiments](results/sparse-prefix-native-2026-11-05)
retain the initial probe, confounded broad series and two short alternating
encoder-pair follow-ups across all thirteen fixtures. Both variants regressed
dense text; the production writer was retained. All 9,828 batch averages and
regressions remain available. These experiments do not replace the tables above.

The [release rerun](results/release-013-native-2026-11-04) contains all nine
process outputs, source/executable hashes, scheduling metadata and 3,276 batch
averages. Separate instrumented profiles never contribute benchmark latency.

The [historical integer recording](results/wide-integers-native-2026-11-04/report.md)
retains every sample, matched change and its explicit third-pass contention
limits. It measures the same codec as this rerun. Absolute differences between
recordings are not codec improvements.

The [historical expanded-corpus controls](results/corpus-native-2026-11-04/report.md)
measure identical production codecs with the expanded harness. Their
[encode-only profiles](results/corpus-native-2026-11-04/PROFILING.md) identify
integer conversion/copying, float formatting and escaping costs. Instrumented
profiles never contribute latency values to these tables. Absolute times from
different recordings must not be attributed to codec changes.

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
