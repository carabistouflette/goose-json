# Bounded nested encoder: throughput and separate peak RSS

All thirteen cases passed independent exact-output checks, supported decoder
roundtrips, expected input-cap rejections and empty-output rejection of invalid
UTF-8 tails. No production bug or allocation/growth bottleneck was demonstrated,
so this checkpoint retains the baseline implementation and the reproducible
probe. No algorithm change or speedup is claimed.

The schema has three nested object levels plus a signed integer array, including
both i64 limits. Ten ASCII cases produce exact lengths around 4 KiB, 64 KiB and
1 MiB, plus 4 MiB. These are selected **output-size boundaries**, not claims of
vector capacity/reallocation boundaries in Goose's grow-only data stacks. Other
cases use repeated raw `é😀` or a five-byte control/escape unit (`NUL`, newline,
quote, backslash, tab). Their input text payloads are 262,140, 262,140 and 524,285
bytes respectively; escaping expands their wire output.

## All results

[117 raw timing samples](timing.csv), [39 raw memory observations](memory.csv),
[provenance and source hashes](metadata.json). Every observation is retained.
Encoded throughput counts **output bytes**, not input payload bytes; expansion
therefore affects its interpretation. Memory is observed in different processes
from throughput and is never subtracted or used as an allocation estimate.

| Case | Output bytes | µs/encode | Encoded MiB/s | Process peak RSS KiB, median [min–max] |
| --- | ---: | ---: | ---: | ---: |
| ascii-output-4095 | 4,095 | 0.66 | 5,899.7 | 4,352 [4,148–4,352] |
| ascii-output-4096 | 4,096 | 0.66 | 5,890.2 | 4,268 [4,144–4,280] |
| ascii-output-4097 | 4,097 | 0.59 | 6,585.6 | 4,428 [4,376–4,452] |
| ascii-output-65535 | 65,535 | 7.68 | 8,135.0 | 4,472 [4,460–4,476] |
| ascii-output-65536 | 65,536 | 9.11 | 6,858.2 | 4,480 [4,436–4,484] |
| ascii-output-65537 | 65,537 | 8.53 | 7,326.2 | 4,440 [4,280–4,480] |
| ascii-output-1048575 | 1,048,575 | 162.28 | 6,162.0 | 6,392 [6,296–6,404] |
| ascii-output-1048576 | 1,048,576 | 162.53 | 6,152.6 | 6,200 [6,192–6,408] |
| ascii-output-1048577 | 1,048,577 | 170.66 | 5,859.6 | 6,296 [6,204–6,324] |
| ascii-output-4194304 | 4,194,304 | 878.04 | 4,555.6 | 12,624 [12,548–12,624] |
| unicode-256k | 262,263 | 116.50 | 2,147.0 | 4,820 [4,760–4,848] |
| escapes-256k | 734,115 | 911.43 | 768.1 | 5,384 [5,352–5,384] |
| escapes-512k | 1,468,121 | 1,622.59 | 862.9 | 6,384 [6,296–6,408] |

## Interpretation

The one-shot 4 MiB output process peaks at roughly 12 MiB RSS, including its
source builder, encoded output, program/runtime and shared-library pages. This
is consistent with larger live data requiring more resident pages, but this
probe does not attribute individual pages or establish an exact memory formula.
Neighboring boundary timings vary; short batches and shared-host conditions
prevent treating those differences as proof of a capacity cliff. No measured
before/after optimization comparison or cross-library ranking is made.

## Measurement protocol and limits

- One frozen GCC/native-backend executable, default portable CPU tuning and
  default Goose data-stack reserve; Core Ultra 7 258V shared Linux desktop.
- Before any timing, each case serializes once and is compared **byte-for-byte**
  to Python's independently constructed JSON (`ensure_ascii=False`, compact
  separators). Python checks decoded values. Goose checks every nested field
  and integer element after decoding when wire size is at most 1 MiB. Larger
  wire output must be rejected by the decoder's documented input cap, while
  serialization remains valid. Appending `0xff` to every payload must yield
  empty output and a nonempty serialization error. These are correctness-only
  runs, not memory measurements.
- Throughput: three series of three shuffled rounds, seed 219. Each fresh child
  constructs its source outside timing, warms with three encodes, then encodes
  between 2 and 2,000 times (roughly 8 MiB output per batch). The public API,
  error checks, length and byte consumption, and scope cleanup are timed.
  Checksums are checked against the independent output oracle. Construction,
  file I/O, validation and printing are outside the clock interval. CPU4 affinity
  is best effort; it does not reserve the core or fix frequency/turbo. All
  timing samples finish before the memory phase or independent review starts.
- Table time is the **median of three series medians**, each of three batch
  averages. Encoded MiB/s is output size divided by that summary time. This is
  neither tail latency nor a confidence interval/significance test. Some batches
  are only about a millisecond; these are exploratory throughput observations.
- Memory: three fresh processes per case, shuffled separately, CPU3 affinity,
  exactly one encode and no warmup/preflight. GNU `time -f %M` reports whole-child
  maximum resident set size in KiB, including startup, source construction,
  encoding and printing. It is **not** incremental encoder allocation, an
  in-phase peak, heap usage or reserved virtual address space. The table gives
  median and full min/max range; startup/page-accounting differences remain.
  The recorder retains a reported zero rather than interpreting it as no memory
  use; no zeros occurred in this recording.
- The fixed synthetic schema and repeated patterns are not production-traffic
  replay. Only encoding throughput is measured. Source hashes are checked after
  recording; compiled binaries/logs are excluded from publication, so their
  hashes are provenance rather than published independently rehashable artifacts.
- The first shell launch restricted the runner itself to CPU3 and was rejected
  by its requested-affinity guard before building or creating samples. The
  corrected launch completed the sole recorded series; no timed sample was
  restarted or discarded.

## Reproduce

Linux, GCC/G++, GNU time (`/usr/bin/time`), taskset, CMake, Python and the pinned
Goose compiler are required. Use a full standalone clone, choose allowed CPUs,
and provide a new/empty output directory:

```sh
python3 bench/large/measure.py --goose /absolute/path/to/pinned/goose \
  --cpu 4 --build-cpu 3 --output .build/large-encoder
```

Do not restrict the parent runner to a CPU affinity that excludes either requested
core. Builds, preflights and memory children use `--build-cpu`; timed children use
`--cpu`. The native package compiles at Release defaults (`-O3 -DNDEBUG`), while
Goose uses `-O2 --cc gcc`. A private fresh cache prevents concurrent builds from
replacing the measured executable. The recorded harness/source revision is
`a59319f900b24ed5e747816cdc12386058a4c1ed`.

For a quick correctness-only smoke, add `--smoke`. It checks exact outputs at
4,095 bytes and 1 MiB + 1 byte, including decoder-cap and invalid-tail behavior,
without running a throughput or memory series. Pinned CI runs that smoke without
performance thresholds. The main `make check` also type-checks the Goose entry
and checks the independent oracle's escaping and exact boundary sizes.
