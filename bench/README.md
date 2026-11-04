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

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured source `06622d495175842914f7381b72fd6d855733acc3` against fixed `v0.1.2`
(`3fa7b5275399641f8069698b6c097ea66cef7929`) on 2026-11-04. The candidate changes
GCC/Clang integer conversion; the corpus, harness and build settings are matched.
Every pass passed typed-decoder checksum/count/fixture-set validation.
[Full provenance](results/wide-integers-native-2026-11-04/metadata.json).

Intel Core Ultra 7 258V, Linux x86-64, CPU 4 affinity; pinned Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`, GCC/G++ 16.2.1 and Rust 1.101.0-nightly.
All three shuffled process passes requested 200,000 iterations, with fixture
scaling above. Native CPU tuning applies to Goose/C++ and Rust. Requested and
observed release profiles, source hashes and executable hashes are retained.

**Shared-host limitation:** the third pass suffered substantial scheduling
contention. Child CPU/wall time was about 50% for both Goose processes and 68%
for Rust, versus 98.5–99.2% in the first two passes. Third-pass Goose timings
were often roughly twice as slow. No samples were discarded or corrected;
all nine outputs and 3,276 batch averages contribute to these tables. The core
was not isolated and frequency/turbo were not fixed. Independent review and
our heavy correctness tests finished before timing; unrelated work could run.
These results support neither statistical significance nor a reliable cross-library
ranking. Close results, and differences on unchanged paths, require caution.

### Decode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 121.0 | 230.2 | 115.0 |
| Escaped / Unicode | 223.6 | 474.9 | 323.1 |
| 1,024 nonnegative integers | 11,420.1 | 28,043.9 | 19,680.8 |
| 1,024 signed small integers | 12,043.2 | 28,151.1 | 20,245.5 |
| 1,024 wide integers | 33,276.3 | 33,794.4 | 45,978.5 |
| Mixed event | 2,578.2 | 4,314.9 | 4,710.8 |
| 256 simple floats | 5,060.1 | 8,856.4 | 8,444.2 |
| 256 wide-exponent floats | 8,831.7 | 16,220.5 | 21,459.2 |
| 64-byte ASCII text | 122.0 | 218.0 | 161.0 |
| 8 KiB sparse escapes | 2,041.8 | 2,664.2 | 3,323.4 |
| 8 KiB ASCII text | 1,339.5 | 1,835.5 | 2,253.5 |
| Dense escapes / Unicode | 14,762.2 | 22,899.8 | 32,827.8 |
| 16 reversed fields | 493.2 | 1,019.1 | 863.2 |

### Encode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 55.0 | 76.7 | 57.3 |
| Escaped / Unicode | 104.6 | 167.9 | 99.5 |
| 1,024 nonnegative integers | 6,104.8 | 10,690.0 | 9,370.4 |
| 1,024 signed small integers | 6,156.8 | 9,187.4 | 9,250.4 |
| 1,024 wide integers | 16,843.4 | 19,163.3 | 17,351.3 |
| Mixed event | 2,769.9 | 3,212.7 | 2,572.8 |
| 256 simple floats | 11,517.2 | 17,743.1 | 10,102.6 |
| 256 wide-exponent floats | 12,010.6 | 16,317.1 | 9,599.6 |
| 64-byte ASCII text | 51.3 | 147.1 | 108.1 |
| 8 KiB sparse escapes | 1,994.3 | 728.0 | 5,946.8 |
| 8 KiB ASCII text | 833.3 | 709.2 | 5,247.4 |
| Dense escapes / Unicode | 11,574.8 | 8,544.7 | 10,490.5 |
| 16 reversed fields | 175.6 | 448.8 | 469.5 |

### Matched fixed-release comparison

All thirteen fixtures are included. Negative changes mean less time; decoding
and float/string kernels were not changed by this integer optimization. Their
observed differences are not evidence of improvements to those algorithms.

| Fixture | Decode release → current (change) | Encode release → current (change) |
| --- | ---: | ---: |
| Small record | 120.7 → 121.0 (+0.2%) | 55.9 → 55.0 (-1.6%) |
| Escaped / Unicode | 242.9 → 223.6 (-7.9%) | 113.1 → 104.6 (-7.5%) |
| 1,024 nonnegative integers | 11,845.9 → 11,420.1 (-3.6%) | 6,463.7 → 6,104.8 (-5.6%) |
| 1,024 signed small integers | 12,074.5 → 12,043.2 (-0.3%) | 7,372.2 → 6,156.8 (-16.5%) |
| 1,024 wide integers | 33,842.5 → 33,276.3 (-1.7%) | 29,976.3 → 16,843.4 (-43.8%) |
| Mixed event | 2,738.1 → 2,578.2 (-5.8%) | 3,003.0 → 2,769.9 (-7.8%) |
| 256 simple floats | 5,345.0 → 5,060.1 (-5.3%) | 12,193.9 → 11,517.2 (-5.5%) |
| 256 wide-exponent floats | 9,521.5 → 8,831.7 (-7.2%) | 12,774.1 → 12,010.6 (-6.0%) |
| 64-byte ASCII text | 129.8 → 122.0 (-6.0%) | 54.5 → 51.3 (-5.9%) |
| 8 KiB sparse escapes | 2,067.3 → 2,041.8 (-1.2%) | 1,993.0 → 1,994.3 (+0.1%) |
| 8 KiB ASCII text | 1,382.2 → 1,339.5 (-3.1%) | 876.3 → 833.3 (-4.9%) |
| Dense escapes / Unicode | 17,036.3 → 14,762.2 (-13.3%) | 12,068.7 → 11,574.8 (-4.1%) |
| 16 reversed fields | 540.4 → 493.2 (-8.7%) | 188.9 → 175.6 (-7.0%) |

Wide-integer encoding decreased in every matched pass, including the contended
third pass. This is evidence for this kernel on this distribution, rather than
a claim about all integer sizes or machines. The aggregate median decreased
43.8%; signed-small-integer encoding decreased 16.5%. Sparse-text encoding was
0.1% slower in aggregate; no escaping code changed.

| Wide-integer encoding | v0.1.2 ns/op | Candidate ns/op | Change |
| --- | ---: | ---: | ---: |
| Pass 1 | 28,761.9 | 16,843.4 | -41.4% |
| Pass 2 | 29,976.3 | 16,602.3 | -44.6% |
| Pass 3 | 65,335.4 | 34,997.5 | -46.4% |

### Different APIs and formats

Protobuf and borrowing DOM have separate contracts; neither is a like-for-like
typed JSON implementation. DOM cannot losslessly represent every wide i64;
negative Protobuf int64 values use ten-byte varints (not zigzag sint64).
Times are ns/op with the same shared-host limitations.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 60.2 / 33.4 | 87.0 |
| Escaped / Unicode | 62 / 24 | 70.5 / 33.4 | 142.7 |
| 1,024 nonnegative integers | 4022 / 1923 | 5,855.6 / 9,218.1 | 19,470.8 |
| 1,024 signed small integers | 4538 / 6083 | 7,736.1 / 22,136.1 | 20,500.6 |
| 1,024 wide integers | 19771 / 9669 | 10,433.8 / 33,496.2 | 55,068.6 |
| Mixed event | 1187 / 954 | 1,392.1 / 641.9 | 2,815.2 |
| 256 simple floats | 1581 / 2051 | 1,082.0 / 422.3 | 4,864.2 |
| 256 wide-exponent floats | 5975 / 2051 | 868.9 / 432.1 | 16,321.1 |
| 64-byte ASCII text | 97 / 70 | 63.7 / 34.4 | 134.8 |
| 8 KiB sparse escapes | 8233 / 8205 | 757.5 / 378.0 | 15,958.8 |
| 8 KiB ASCII text | 8225 / 8199 | 738.4 / 381.4 | 7,483.1 |
| Dense escapes / Unicode | 8737 / 6663 | 9,169.2 / 330.7 | 17,340.6 |
| 16 reversed fields | 135 / 31 | 148.2 / 140.4 | 364.1 |

## Raw data and history

The [wide-integer recording](results/wide-integers-native-2026-11-04) contains all
nine process outputs, 3,276 batch averages and complete provenance. All passes,
including the contended third pass, contribute to the current tables.

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
