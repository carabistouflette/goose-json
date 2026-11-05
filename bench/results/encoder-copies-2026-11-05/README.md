# Encoder allocation and runtime-copy diagnostic

The bounded diagnostic found no allocation-focused production change to justify.
The existing grow-only output uses Goose data stacks, not vector-style capacity
reallocations. On these thirteen existing synthetic fixtures, the measured
encoding phase made **zero wrapped malloc/calloc/realloc/free calls and zero new
stack-region reservations**. Runtime `gs_memcpy` requests were smaller than one
encoded-output length per operation. Source inspection also found no extra
whole-output copy in the public `serialize` return path. Production stays unchanged.

These are operation counts, **not timing, memory-use or speedup measurements**.
They do not establish the largest CPU cost or rule out benefits from safely
removing individual staging copies. No native direct-write API or allocation
estimate pass was added without evidence of an end-to-end benefit.

## Per-operation results

All 26 observations are in [counts.csv](counts.csv). Each fixture runs once at
one iteration and once at ten; every counter scales exactly 1:10 and the encoded
length stays fixed. Each child independently checks full fixture values and exact
bit roundtrips before warmup. API error/output checks and checksum consumption
remain inside the observed phase.

| Fixture | Encoded bytes | Runtime copy requests | Requested copy bytes | Wrapped allocation/free calls | New stack regions |
| --- | ---: | ---: | ---: | ---: | ---: |
| plain | 38 | 8 | 27 | 0 | 0 |
| escaped | 54 | 13 | 39 | 0 | 0 |
| array | 4,022 | 2 | 8 | 0 | 0 |
| array-signed | 4,537 | 514 | 2,016 | 0 | 0 |
| array-wide | 19,770 | 1,023 | 18,736 | 0 | 0 |
| mixed | 1,186 | 43 | 1,129 | 0 | 0 |
| floats | 1,581 | 6 | 1,576 | 0 | 0 |
| floats-wide | 5,862 | 6 | 5,857 | 0 | 0 |
| text-short | 97 | 8 | 86 | 0 | 0 |
| text-sparse | 8,233 | 10 | 8,222 | 0 | 0 |
| text-ascii | 8,225 | 8 | 8,214 | 0 | 0 |
| text-escaped | 8,737 | 10 | 8,726 | 0 | 0 |
| wide | 135 | 32 | 80 | 0 | 0 |

## Method and limits

[The recorder](../../profile-copies.py) derives its entry from the existing
[paired encoder harness](../sparse-prefix-native-2026-11-05/paired.goose).
It injects begin/end hooks around that harness's encoding interval, after setup,
preflight and warmup. The interval includes clock calls, encoding, error checks,
checksum consumption and scope cleanup; printing is outside it. No decoder or
setup allocation counts are reported.

The compiler wrapper instruments the generated standalone C translation unit:

- `gs_memcpy`: calls and **requested logical bytes**, not actual load/store traffic.
  Small runtime copies can use overlapping loads/stores; the compiler can also
  inline or eliminate machine copies. Direct generated stores and native/vendor/
  libc copies are outside this counter. A small count does not mean no bytes
  were written.
- `gs_reserve_region`: new data-stack region calls during the interval. Already
  reserved/committed stack storage and ordinary stack pushes are not allocations
  in this counter. Zero new regions says nothing about total reserved address
  space or resident/peak memory.
- GNU ld `--wrap` for malloc/calloc/realloc/free: calls referenced by linked
  objects, including the native static archive. Internal calls within shared
  libraries, alternative allocators and direct OS allocation APIs are outside
  this counter. Zero wrapped calls is not a universal no-allocation guarantee.

A compiled positive-control test exercises each counter, performs operations
before/after the phase, and requires exact phase counts: one three-byte copy,
one region request, one malloc, one calloc, one realloc and two frees. Unknown
runtime spellings fail closed instead of silently producing zero counts.
The instrumentation changes generated C only, in a temporary build; it does not
edit codec/compiler sources. Instrumented elapsed time is deliberately discarded.

[Metadata](metadata.json) records exact source hashes, source revision, pinned
compiler version, flags, binary hash and CPU3 affinity. A fresh private Goose
cache is used. Shared-host scheduling does not turn these counts into timing
results. The synthetic corpus is bounded evidence, not production-traffic replay.
Generated C, compiler logs and binaries remain private build artifacts; the
binary hash is provenance, not a published independently rehashable executable.

## Reproduce

Linux, GNU GCC/ld, Python, taskset, CMake and the pinned Goose compiler are required.
Use a full standalone clone and an empty/new output directory:

```sh
python3 bench/profile-copies.py --goose /absolute/path/to/pinned/goose \
  --cpu 3 --output .build/encoder-copy-profile
python3 -m unittest discover -s tests -p test_profile_copies.py
```

Choose an allowed CPU. The recorded recorder/source revision is
`22d7fa82b8618a47d0d897dd8892a1343c1b8b23`; source hashes also include the exact
recorder, existing entry and fixture bytes. These results add no runtime change,
new release or change to historical benchmark tables.
