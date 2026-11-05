# Benchmarks

These microbenchmarks compare JSON decoding/encoding into owned typed values.
They use thirteen fixed fixtures, from small records to arrays and escaped text.
They are not production-traffic replay.

[Results and variation](RESULTS.md) · [Workloads](CORPUS.md) · [Source identity](CURRENTNESS.md)
· [Historical recordings](results/README.md)

## Run

From a full Git clone with the [pinned Goose compiler](../GOOSE_REVISION):

```sh
make setup
make bench
make bench-compare
```

`bench` runs Goose with default CPU settings. `bench-compare` also needs Cargo/Rust
and uses the locked serde_json, sonic-rs and Protobuf harness. With an installed
Goose compiler, pass `GOOSE=/absolute/path/to/goose` to Make.

For machine-specific CPU instructions on both Goose/C++ and Rust:

```sh
make bench-native
```

These Make targets use your environment. The recorder controls build flags,
freezes binaries, shuffles process order and preserves source hashes/raw samples:

```sh
python3 bench/measure.py --goose /absolute/path/to/goose --native --cpu 4 \
  --iterations 200000 --runs 3 --baseline v0.1.2 --output .build/my-recording
```

Use an allowed Linux CPU index; omit `--cpu` for an unpinned run. CPU affinity
is not isolation. Choose a new/empty output directory outside `native/`.
Compiler/package builds require CMake and a C++ toolchain. The recorder needs
Python's standard library, Git and Rust/Cargo. See the
[recorded tool versions and exact-source reproduction](RESULTS.md#reproduce-the-recording)
before comparing a new run with published numbers.

## What is timed

Every typed decode creates a fresh result; every encode creates fresh output.
API validation/error checks, result consumption and scope cleanup are timed.
Goose's data-stack allocation differs from Rust heap allocation. These timings
do not measure allocation counts or peak memory.

File I/O, fixture construction, compilation and full-value/float-bit roundtrip
checks happen before timing. Each operation has up to 1,000 warmup iterations
and seven timed batches. Small records/64-byte text use the requested iteration
count; integers/mixed events use one tenth, floats/long text one hundredth and
wide records one fifth, each at least one. Raw batch averages are embedded in
comments in each recorded output. Do not treat them as request-latency percentiles.

Goose interleaves decode/encode/DOM; the Rust process measures APIs sequentially.
The recorder shuffles the three separate processes per pass with seed 219.
Frequency, scheduling, operation order, cache and thermal effects remain possible.
Its baseline and candidate use different absolute build paths/cache history;
small differences do not establish an algorithmic gain. Newer separate-process
encode/decode experiments use matched paths, but do not repair old recordings.

<a id="corpus-and-equivalence"></a>

## Comparison contracts

| Implementation | Result and validation |
| --- | --- |
| goose-json | Owned fields; required/duplicate/unknown-field checks, UTF-8 validation and documented input/token limits |
| serde_json 1.0.154 | Same owned Rust structs, `deny_unknown_fields`, `float_roundtrip`; safe APIs |
| sonic-rs 0.5.10 | Same owned Rust structs and `deny_unknown_fields`; safe APIs |
| Goose DOM | Borrowed/untyped; different schema checks and possible wide-i64 precision loss |
| prost 0.14.4 | Binary Protobuf; different bytes, presence/default/unknown-field rules |

Rust strings already guarantee UTF-8 on encoding; Goose's mutable byte builders
need validation. Resource policies differ across implementations. Protobuf and
DOM are separate API/format choices, not like-for-like JSON competitors. Protobuf
uses `int64` (ten-byte negative varints), not zigzag `sint64`. Exact Rust types,
Protobuf tags and locked transitive dependencies are in
[main.rs](compare/src/main.rs) and [Cargo.lock](compare/Cargo.lock).

## Recorded native results

The [full tables](RESULTS.md) retain every fixture, slower cases, dispersion,
separate Protobuf/DOM results and the old fixed-release comparison. The measured
implementation matches v0.1.3 and current main through the
[checked source comparison](CURRENTNESS.md). The data remains a historical run
under its recorded machine/toolchain; it is not a new timing measurement.

The host was shared. In particular, two baseline passes lost more scheduling
time than the candidate. No overall ranking, close-result significance or
percent-change guarantee is claimed. CI runs correctness smoke checks with no
speed thresholds.

## Other records

[The recording index](results/README.md) distinguishes historical implementations,
rejected candidates, operation-count diagnostics, large-output observations and
the signed-artifact consumer profile. That consumer keeps its own JSON v0.1.2
pin; it is not a current-main benchmark. Historical raw artifacts are unchanged.
