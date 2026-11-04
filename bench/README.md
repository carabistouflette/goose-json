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

**Goose DOM** is borrowing/untyped and does not enforce the typed schema. **prost 0.14.4** uses binary Protobuf with different presence/default/unknown-field rules and byte counts. These are separate API/format choices, not like-for-like JSON competitors. Item tags are id=1, active=2, name=3; numeric arrays use packed field 1 (int64 or double); wide fields use int64 tags 1..16. The Rust annotations are the schema; no protoc is needed. Mixed event tags are event_id=1, active=2, reading=3, required context=4, counters=5, samples=6, flags=7, message=8; context uses region=1 and label=2. The nested required Protobuf message still has different presence semantics from JSON.

## Measurement protocol

The recorder clears inherited C/C++ flags, Cargo profile overrides and custom toolchain/stdlib overrides, uses a fresh Goose build cache shared by candidate and baseline for that recording, builds first, freezes three independent executables (before/after/comparison), then shuffles process order for each pass with seed 219. It selects and checks the actual Cargo-produced executable, isolates native and portable Cargo outputs, hashes all measured binaries, Goose/Rust sources, native sources/headers/vendors, CMake, the package sidecar, fingerprint script and compiler wrappers, and rejects source changes during compilation or measurement. This prevents a concurrent smoke build from replacing the measured executable. The exact baseline commit defaults to `05b81674e101e349ea40a379011418963a7a9794`; `--baseline` selects another compatible revision. Published records explicitly identify their selected baseline; pass `--baseline v0.1.1` for the fixed experimental release. Baseline and candidate use the same current corpus, harness, Goose compiler and native C options. Both candidate and baseline use the native backend; exact flags and source hashes are recorded.

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured 2026-11-04 on an Intel Core Ultra 7 258V, CPU 4, Linux x86-64;
GCC/G++ 16.2.1, Rust 1.101.0-nightly and pinned Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`. Each process requested 200,000
iterations, with fixture-specific divisors above. Candidate:
`ca9b0dce42061c38e72d05233ee229874dc5b682`; baseline:
`0c26308570cbe2c6769c1bf0eba8d86e7e8ad681`. This measures the formatter-isolation
fix, including the small-integer path, against the previous public codec.
See [full provenance](results/formatter-native-2026-11-04/metadata.json).

Both Goose revisions use the same harness, fresh native cache and controlled
release flags. Rust's requested release configuration and observed executable
profile are recorded separately; optimization is 3, assertions/overflow checks
are off, and incremental compilation is disabled. No sanitizers are enabled.

This was a shared desktop host without a reserved core. Timed children were
pinned to CPU 4; an independent review used CPU 5 and other work could continue.
CPU frequency/turbo were not fixed. Child CPU time was
99.0–99.7% of wall time; this is a scheduling diagnostic,
not a correction or evidence of statistical significance. Do not compare absolute
numbers across this recording and the older CPU 2 series as a codec speedup.

### Decode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 73.0 | 178.6 | 105.3 |
| Escaped / Unicode | 140.0 | 293.9 | 209.2 |
| 1,024 integers | 9,410.1 | 18,665.4 | 12,954.9 |
| 256 simple floats | 3,312.5 | 5,436.0 | 5,172.5 |
| 256 wide-exponent floats | 6,191.4 | 10,511.1 | 15,091.3 |
| 64-byte ASCII text | 80.6 | 129.2 | 110.4 |
| 8 KiB sparse escapes | 1,430.7 | 1,623.9 | 2,188.6 |
| 8 KiB ASCII text | 885.9 | 1,154.1 | 1,574.6 |
| Dense escapes / Unicode | 10,136.6 | 14,946.3 | 19,276.3 |
| 16 reversed fields | 332.4 | 665.9 | 525.3 |

### Encode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 36.7 | 53.7 | 51.5 |
| Escaped / Unicode | 69.6 | 113.2 | 64.2 |
| 1,024 integers | 4,392.1 | 6,915.4 | 6,338.4 |
| 256 simple floats | 7,548.8 | 9,869.5 | 6,238.3 |
| 256 wide-exponent floats | 8,548.9 | 11,083.7 | 6,253.9 |
| 64-byte ASCII text | 35.6 | 97.4 | 85.4 |
| 8 KiB sparse escapes | 1,272.6 | 469.3 | 6,691.4 |
| 8 KiB ASCII text | 566.4 | 455.4 | 6,437.6 |
| Dense escapes / Unicode | 7,808.8 | 5,633.0 | 9,054.0 |
| 16 reversed fields | 117.1 | 297.8 | 296.5 |

### Matched changes

Previous public codec → candidate, ns/op. All ten fixtures and both operations are retained.

| Fixture | Decode before → after | Encode before → after |
| --- | ---: | ---: | ---: |
| Small record | 93.0 → 73.0 | 33.3 → 36.7 |
| Escaped / Unicode | 136.1 → 140.0 | 68.3 → 69.6 |
| 1,024 integers | 9,268.8 → 9,410.1 | 4,325.1 → 4,392.1 |
| 256 simple floats | 3,490.7 → 3,312.5 | 7,833.8 → 7,548.8 |
| 256 wide-exponent floats | 5,904.4 → 6,191.4 | 8,007.7 → 8,548.9 |
| 64-byte ASCII text | 71.2 → 80.6 | 30.7 → 35.6 |
| 8 KiB sparse escapes | 1,401.3 → 1,430.7 | 1,220.2 → 1,272.6 |
| 8 KiB ASCII text | 864.9 → 885.9 | 547.0 → 566.4 |
| Dense escapes / Unicode | 9,865.4 → 10,136.6 | 7,122.9 → 7,808.8 |
| 16 reversed fields | 282.8 → 332.4 | 162.5 → 117.1 |

Wide-record encoding takes about 27.9% less time in these medians. Integer-array
encoding is 1.5% slower; small-record encoding is 10.2% slower, short-text encoding
16.0% slower, wide-float encoding 6.8% slower and dense-text encoding 9.6% slower.
These regressions remain visible alongside improvements. The native float and
string kernels did not change, but whole-program code layout and shared-host
frequency/cache effects can affect API timings. Close results can overlap; no
universal ranking, production-latency or statistical-significance claim follows.

### Different APIs and formats

Binary Protobuf and borrowing DOM use different formats/contracts; these are
separate comparisons, not like-for-like typed JSON implementations.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 39.3 / 22.8 | 57.9 |
| Escaped / Unicode | 62 / 24 | 48.3 / 22.2 | 98.9 |
| 1,024 integers | 4022 / 1923 | 2,993.9 / 5,930.4 | 12,900.9 |
| 256 simple floats | 1581 / 2051 | 520.9 / 276.8 | 3,312.0 |
| 256 wide-exponent floats | 5975 / 2051 | 529.9 / 283.0 | 11,364.6 |
| 64-byte ASCII text | 97 / 70 | 39.8 / 22.9 | 91.8 |
| 8 KiB sparse escapes | 8233 / 8205 | 478.3 / 241.8 | 10,508.5 |
| 8 KiB ASCII text | 8225 / 8199 | 471.1 / 242.5 | 5,068.1 |
| Dense escapes / Unicode | 8737 / 6663 | 5,490.6 / 214.8 | 13,056.2 |
| 16 reversed fields | 135 / 31 | 99.3 / 93.0 | 269.1 |

## Raw data and history

The [formatter-isolation recording](results/formatter-native-2026-11-04) contains
all nine process outputs and metadata, retaining all 2,520 batch averages across
all APIs/revisions. All three passes contribute to the tables; individual fastest
batches are not selected.

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
