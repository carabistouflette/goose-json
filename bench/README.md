# Benchmarks

Small API microbenchmarks, not a general library ranking. Fixture construction, file I/O and compilation are outside the timed region. Every decode constructs a fresh result; every encode constructs fresh output. Allocation, validation, result consumption, and scope cleanup are inside the timed batches. No buffer-reuse or allocation-count claim is made.

## Reproduce

From the library root, after `make setup`:

```sh
make bench                       # native Goose only; requires GCC
make bench-compare               # also requires Cargo/Rust and downloads locked crates
make bench-compare BENCH_ITERATIONS=500000
```

Alternatively pass `GOOSE=/absolute/path/to/goose` to Make. Each operation has up to 1,000 warmup iterations and seven measured batches. Small records use the requested iterations per batch; the array uses one tenth. Output is a Markdown table in nanoseconds per operation, including the minimum, median, maximum, and a checksum. The range describes batch averages, not per-request tail latency. These are warm operation costs, not process startup or memory-footprint measurements. Results must be consumed and errors checked even in release builds. CI runs ten iterations as a correctness smoke check; it never asserts a timing threshold. For less scheduler migration on Linux, use `taskset -c 0 make bench-compare BENCH_ITERATIONS=500000` (choose a CPU allowed on your machine). Make can recompile, but compilation is never timed.

The [shared fixtures](fixtures) are 38-byte plain and 62-byte escaped/Unicode records, plus a 4,022-byte object holding integers 0 through 1023. JSON encoding canonicalizes the escaped record to 54 bytes. The byte column describes the actual input to decoding or output of encoding. These are valid, memory-resident inputs; malformed traffic, wide schemas, other CPUs, and production application behavior are not covered.

## What is compared

- **goose-json:** automatic typed mapping, owned text/arrays, strict missing/duplicate/unknown-field checks, UTF-8 checks, input and number bounds. Goose uses its data-stack memory model; this is not Rust's heap allocator.
- **serde_json 1.0.154:** [`from_slice`/`to_vec`](https://docs.rs/serde_json/1.0.154/serde_json/), owned `String`/`Vec`, with `deny_unknown_fields`; required and duplicate fields also fail. The schemas and JSON bytes match. Resource policies and ownership machinery differ: this is an end-to-end implementation comparison, not an isolated parser algorithm test. Rust `String` guarantees UTF-8 before serialization; Goose's public byte builder needs validation during serialization.
- **Goose DOM:** the pinned standard library's borrowing document-tree parser. It does not construct the typed model, copy unescaped text into owned strings, or enforce the schema checks above. It is a reference for a different API, not a like-for-like winner or loser. Only decoding is measured.
- **prost 0.14.4:** [`Message::decode`/`encode_to_vec`](https://docs.rs/prost/0.14.4/prost/trait.Message.html), using the same logical values as JSON. The wire format is binary Protobuf. Item field numbers are `id=1`, `active=2`, `name=3`; array values are packed repeated `int64`, field 1. Derive annotations are the schema; no `protoc` is required. Protobuf's defaults, field-presence and unknown-field rules differ, and there are fewer bytes to process. These numbers answer “what if I can change formats?”, not “which JSON parser wins?”.

The Rust baseline dependencies and transitive checksums are in [Cargo.lock](compare/Cargo.lock). It uses `black_box` on inputs and results; Goose consumes decoded values and serialized lengths/content, asserts errors, and emits checksums. Matching JSON checksums help detect fixture or result-consumption drift. DOM and Protobuf encoding checksums intentionally differ. The Rust harness asserts full-value JSON and Protobuf round trips before timing; the Goose harness compares every round-trip field/array element and verifies the fixture values before timing, with further correctness coverage in the library tests. Goose interleaves decode/encode/DOM batches; Rust measures each API in sequence. Warmup and ranges reduce, but cannot remove, order and thermal effects.

## Recorded environment

Measured 2026-11-03 UTC on one Intel Core Ultra 7 258V laptop, Linux 7.2.11-arch1-1, x86-64, with every measurement process pinned to CPU 0. No CPU isolation, fixed-frequency control, or turbo/thermal control was applied. Other processes can still run. Values are illustrative and should be rerun on your target machine.

- Goose compiler: `eadca409f68210893f366e60d0c2f0dc29a339be`.
- Goose build: `goose build bench/bench.goose --cc gcc -O2`; GCC 16.2.1 20260810. Goose `-O2` selects its inlining level; its native driver invokes GCC `-O2`.
- Rust: `rustc 1.101.0-nightly (822182db4 2026-10-13)`, Cargo's default release profile (`opt-level=3`). No `RUSTFLAGS` override or target-specific tuning was set.
- Optimized codec source: `f4e6452fc3ec32ef77e1ad64f181434952e398d1`; complete-value-checking harness in `c5c4d9d`.
- Previous codec baseline: `510db33628f444e86024508564d1ac0530e27a2b`, compiled with the same current Goose harness, compiler and GCC options.
- Two complete measurement passes; each uses 500,000 iterations per small-record sample and 50,000 per array sample. The summary uses the first complete pass, not the fastest samples or the best pass. The repeat is published separately.

Raw measurements: [before](results/before.md), [after](results/after.md), [external](results/compare.md), and independent repeats [before](results/before-repeat.md), [after](results/after-repeat.md), [external](results/compare-repeat.md).

## Reproduce the previous codec

With an absolute `GOOSE` executable path, run from this checkout:

```sh
baseline=$(mktemp -d)
mkdir -p "$baseline/bench"
git show 510db33628f444e86024508564d1ac0530e27a2b:json_codec.goose > "$baseline/json_codec.goose"
cp bench/bench.goose "$baseline/bench/"
cp -R bench/fixtures "$baseline/bench/"
"$GOOSE" build "$baseline/bench/bench.goose" --cc gcc -O2 -o "$baseline/bench-before"
(cd "$baseline" && taskset -c 0 ./bench-before 500000)
```

The retained changes avoid float conversion for integer reads, avoid revalidating raw string/key slices after the input has already passed UTF-8 validation, stop comparing field names after a match, and scan ASCII prefixes eight bytes at a time. Integer overflow and grammar remain checked. Escaped text still receives Unicode validation. The existing 1 MiB input and 128-byte float-token guards remain; the integer path rejects invalid/out-of-range values without arbitrary-precision conversion. Experiments with extra per-digit branching and a word-load UTF-8 helper regressed some cases and were discarded. Timing changes smaller than the published variation should not be treated as improvements.

## Results: first complete pass

Typed JSON operations, median ns/op (lower is better):

| Fixture | goose-json decode | serde_json decode | goose-json encode | serde_json encode |
| --- | ---: | ---: | ---: | ---: |
| Small record | 121.7 | 157.7 | 48.9 | 70.6 |
| Escaped / Unicode | 243.1 | 304.3 | 114.9 | 96.7 |
| 1,024 integers | 12,422.6 | 13,424.5 | 5,714.1 | 8,228.8 |

Measured decoding changes relative to the previous codec:

| Fixture | Decode before (ns/op) | Decode after (ns/op) | Time reduction |
| --- | ---: | ---: | ---: |
| Small record | 209.6 | 121.7 | 41.9% |
| Escaped / Unicode | 337.0 | 243.1 | 27.9% |
| 1,024 integers | 21,422.6 | 12,422.6 | 42.0% |

Encoding variation relative to the previous codec overlaps the sample ranges; no encoding speedup is claimed. On these inputs, goose-json decoding is faster than this serde_json build in both recorded passes. This does not cover floating-point arrays, wide records, alternative JSON libraries or architectures. Escaped-string encoding is slower than serde_json, as shown above.

Binary Protobuf, a separate format decision:

| Fixture | JSON input bytes | Protobuf bytes | Protobuf decode (ns/op) | Protobuf encode (ns/op) |
| --- | ---: | ---: | ---: | ---: |
| Small record | 38 | 11 | 64.8 | 37.6 |
| Escaped / Unicode | 62 | 24 | 75.6 | 28.4 |
| 1,024 integers | 4022 | 1923 | 4,614.2 | 7,158.0 |

Borrowing, untyped standard-library DOM decoding, a separate API decision:

| Fixture | Borrowing DOM decode (ns/op) |
| --- | ---: |
| Small record | 120.5 |
| Escaped / Unicode | 164.6 |
| 1,024 integers | 23,258.5 |
