# v0.1.3 preparation: matched rerun

Frozen source `52473a635952b12eddbb78b4d241b24d3d9f0b21` against `v0.1.2`
(`3fa7b5275399641f8069698b6c097ea66cef7929`). This repeats the reviewed integer
optimization; production code is identical to the previous integer recording.

All nine outputs and all 3,276 batch averages are in [recording](recording).
[Metadata](recording/metadata.json) includes source/executable hashes, compiler
flags/profiles, process order, timing and passed typed-decode checks.
[Full tables, matched changes and API contracts](../../README.md).

```sh
python3 bench/measure.py --goose /absolute/path/to/goose --native --cpu 4 \
  --iterations 200000 --runs 3 --baseline v0.1.2 --output .build/release-rerun
```

Use a full checkout at the frozen source and the pinned compiler; choose an
allowed CPU on your machine. The courtesy request was acknowledged during the
series, with coordinated owners avoiding new heavy CPU4 work. Unrestricted
HTTP/crypto work could still schedule there; no existing work was interrupted.
There was no exclusive reservation or fixed frequency/turbo.

Baseline passes 1 and 3 had child CPU/wall ratios of 83.5% and 83.7%, while all
candidate processes were about 99%. This asymmetric scheduling loss can favor
the candidate. Other processes ranged 98.8–99.3%; individual batches also varied.
All samples and regressions are retained without corrections. Wide-integer
encoding took less time in all three matched passes, but aggregate differences
and close comparisons do not establish significance or a reliable ranking.
The [earlier contended series](../wide-integers-native-2026-11-04/report.md)
remains separate and unchanged.

[Separate encode-only profiles](PROFILING.md) run on CPU3 after all timing
processes complete. Instrumented data never supplies benchmark latency.
