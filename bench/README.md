# Benchmarks

Owned-result API microbenchmarks with current SIMD competition, not a universal ranking. Results include slower cases. Sources, locked dependencies, complete batch samples, executable hashes, and the environment are published.

## Run

From the library root:

```sh
make setup
make bench                         # portable GCC build, Goose only
make bench-compare                 # also serde_json, sonic-rs, and binary Protobuf
make bench-native                  # native CPU instructions for Goose/GCC AND Rust
python3 bench/measure.py --native --cpu 0 --iterations 200000 --runs 3 --output .build/reproduce-01
```

Alternatively pass `GOOSE=/absolute/path/to/goose` to Make, or `--goose /absolute/path/to/goose` to the Python runner. Goose setup needs CMake and a C/C++ toolchain; comparisons additionally need Cargo/Rust. The recorder uses only Python's standard library; CPU pinning needs Linux `taskset` and an allowed CPU index. Omit `--cpu` on other systems. Use a fresh output directory: existing data is never overwritten. A full Git clone is needed for the baseline commit, or fetch that commit before measuring.

Native builds are intentionally machine-specific. GCC receives `-O2 -march=native`; Rust receives its release profile and `-C target-cpu=native`, as [Sonic recommends](https://github.com/cloudwego/sonic-rs#requirementsnotes). Portable benchmarks omit both native flags. Do not mix their results. The default deployment/toolchain settings are unchanged.

## Corpus and equivalence

All implementations read the same [JSON fixtures](fixtures). Fixture construction, file I/O, compilation and full-value round-trip validation happen outside timing. Every timed decode builds a fresh result; every encode creates fresh output. Validation, error checks, allocation, result consumption and scope cleanup are timed. Goose's region/data-stack allocation and Rust's heap allocation differ; no allocation-count or memory-footprint claim is made.

- `plain`: 38-byte record, i64 id, bool, owned text.
- `escaped`: 62-byte record with escapes and Unicode; canonical JSON output is 54 bytes.
- `array`: 1,024 integers 0..1023, 4,022 bytes.
- `floats`: 256 values `(i - 128) / 8`, 1,581 bytes. These dyadic values round-trip exactly; they are not a difficult-decimal or full-f64-distribution corpus. Boundary/rounding correctness is tested separately.
- `text-ascii`: an 8 KiB ASCII string in a record, 8,225 bytes total.
- `text-escaped`: 512 repetitions containing controls, quotes, backslashes and Unicode, 8,737 wire bytes.
- `wide`: 16 integer fields supplied in reverse declaration order, 135 bytes. This exercises field lookup without an input-order shortcut.

Small records use the requested iterations per sample; integers use one tenth, floats and long text one hundredth, and wide records one fifth (each at least one). Every operation has up to 1,000 warmup iterations and seven timed batches. Checksums prevent unused results, and complete values/array elements are checked before timing. Unsorted per-batch ns/op values are retained in HTML comments beside the visible result tables.

**goose-json** uses strict typed mapping with owned strings/arrays, required/duplicate/unknown-field checks, UTF-8 validation and resource limits. **serde_json 1.0.154** and **sonic-rs 0.5.10** use the same owned Rust structs and `deny_unknown_fields`, with the default safe parsing APIs. serde_json enables `float_roundtrip`; no unchecked parsing is used. JSON resource policies differ, so this compares complete implementations, not identical internal work. Rust `String` establishes UTF-8 before encoding; Goose's mutable byte builder needs checking during encoding. Versions and transitive checksums are locked in [Cargo.lock](compare/Cargo.lock).

**Goose DOM** is borrowing/untyped and does not enforce the typed schema. **prost 0.14.4** uses binary Protobuf with different presence/default/unknown-field rules and byte counts. These are separate API/format choices, not like-for-like JSON competitors. Item tags are id=1, active=2, name=3; numeric arrays use packed field 1 (int64 or double); wide fields use int64 tags 1..16. The Rust annotations are the schema; no protoc is needed.

## Measurement protocol

The recorder builds first, freezes three independent executables (before/after/comparison), then shuffles process order for each pass with seed 219. It selects the actual Cargo-produced executable, isolates native and portable Cargo outputs, hashes all measured binaries and relevant sources, and rejects source changes during compilation or measurement. This prevents a concurrent smoke build from replacing the measured executable. The exact baseline commit defaults to `05b81674e101e349ea40a379011418963a7a9794`; `--baseline` selects another compatible revision. Baseline and candidate use the same current corpus, harness, Goose compiler and native C options.

The summary below is the median of **three process-pass medians**, each based on seven batch averages. All 21 batches are retained; this is not a percentile latency distribution or a confidence interval. Within-process operation order is fixed: Goose interleaves decode/encode/DOM; Rust measures APIs sequentially. Process shuffling, warmup, repeated runs and CPU pinning reduce but do not eliminate scheduling, order, cache and thermal effects. CPU frequency/turbo were not fixed and the core was not isolated from other processes. No universal winner or statistical-significance claim is made. This remains a synthetic corpus, not production-traffic replay.

CI exercises portable comparisons and a native recorder smoke run with tiny counts, without timing thresholds. Production binaries keep portable defaults unless the application explicitly opts into native CPU tuning.

## Recorded native results

Measured 2026-11-04 Europe/Paris; exact UTC start, CPU, kernel, compiler versions, flags, source SHA-256 hashes, process orders, executable hashes and Cargo release profile are in [metadata.json](results/native-2026-11-04/metadata.json). Intel Core Ultra 7 258V, CPU 0; GCC 16.2.1, Rust 1.101.0-nightly, and Goose `eadca409f68210893f366e60d0c2f0dc29a339be`. Requested iterations: 200,000. The measured code is commit `22f21f0`; later regression-test/documentation commits do not alter those measured sources. Re-run on your deployment hardware.

Median ns/op, **decode / encode**, lower is better:

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 117.8 / 42.2 | 172.3 / 74.0 | 188.7 / 71.3 |
| Escaped / Unicode | 244.2 / 104.6 | 306.5 / 147.9 | 315.0 / 95.7 |
| 1,024 integers | 10,806.0 / 6,311.6 | 17,916.6 / 8,000.2 | 15,570.8 / 8,458.9 |
| 256 floats | 6,515.2 / 30,555.0 | 7,399.4 / 10,941.8 | 7,425.5 / 10,287.3 |
| 8 KiB ASCII text | 6,826.2 / 5,348.5 | 1,081.4 / 565.9 | 2,285.4 / 4,718.7 |
| Dense escapes / Unicode | 37,819.8 / 34,576.8 | 13,574.4 / 8,523.6 | 23,999.5 / 13,981.8 |
| 16 reversed fields | 843.2 / 195.5 | 958.8 / 424.5 | 1,520.4 / 419.9 |

Measured previous-codec → current-codec times (same native options and expanded harness):

| Fixture | Decode before → after | Encode before → after |
| --- | ---: | ---: |
| Small record | 142.6 → 117.8 | 49.3 → 42.2 |
| Escaped / Unicode | 274.4 → 244.2 | 113.3 → 104.6 |
| 1,024 integers | 15,268.4 → 10,806.0 | 5,834.4 → 6,311.6 |
| 256 floats | 8,216.2 → 6,515.2 | 31,750.7 → 30,555.0 |
| 8 KiB ASCII text | 11,846.6 → 6,826.2 | 12,094.7 → 5,348.5 |
| Dense escapes / Unicode | 37,906.2 → 37,819.8 | 34,061.0 → 34,576.8 |
| 16 reversed fields | 863.4 → 843.2 | 190.1 → 195.5 |

The retained changes combine string classification and escaping, copy raw strings directly into their owners, decode escaped strings directly into owned storage, and inline checked integer reads. Word scans assemble bytes without alignment casts or overreads; `checkfree` makes the compiler verify the scanner's bounds proofs. UTF-8, surrogate, integer overflow, duplicate/missing/unknown-field and size checks remain. Whole-float and shared word-load experiments did not provide a sufficiently consistent broad improvement and were discarded.

The gains are workload-specific. Integer-array encoding is slower in this run set despite faster decoding. Dense escaped text has no meaningful gain. Sonic remains substantially ahead on long-string operations, and floating-point encoding remains a major gap. Those are visible engineering targets, not hidden from the summary.

Separate binary Protobuf and borrowing DOM results, ns/op:

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 61.3 / 42.1 | 122.1 |
| Escaped / Unicode | 62 / 24 | 74.8 / 34.8 | 169.7 |
| 1,024 integers | 4022 / 1923 | 4,489.7 / 7,089.0 | 25,438.9 |
| 256 floats | 1581 / 2051 | 838.8 / 582.0 | 6,697.1 |
| 8 KiB ASCII text | 8225 / 8199 | 516.1 / 190.6 | 7,213.7 |
| Dense escapes / Unicode | 8737 / 6663 | 8,473.3 / 158.0 | 14,736.2 |
| 16 reversed fields | 135 / 31 | 141.2 / 152.1 | 438.7 |

## Raw data and history

The [native result directory](results/native-2026-11-04) contains all nine process outputs plus metadata. Each Markdown output includes all seven samples for every row. Preserve the directory when comparing another run; do not select only the fastest pass.

The [2026-11-03 methodology and measurements](results/2026-11-03-methodology.md) cover the older three-fixture, portable/default-CPU experiment. Its serde_json build did not enable float_roundtrip, and it had no Sonic baseline. Those historical measurements are not mixed into the native table above.
