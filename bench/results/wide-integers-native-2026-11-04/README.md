# Wide-integer conversion recording

Measured source `06622d495175842914f7381b72fd6d855733acc3`, fixed codec baseline
`3fa7b5275399641f8069698b6c097ea66cef7929` (`v0.1.2`). The GCC/Clang integer
formatter uses bounded decimal blocks; public output and the harness are unchanged.

All nine process outputs and all 3,276 batch averages are retained here.
[Metadata](metadata.json) records exact source/executable hashes, requested and
observed build profiles, process order, timings and passed typed-decode checks.
[Historical full tables and matched changes](report.md).

From a full checkout at the measured source, with the pinned compiler:

```sh
python3 bench/measure.py --goose /absolute/path/to/goose --native --cpu 4 \
  --iterations 200000 --runs 3 --baseline v0.1.2 --output .build/wide-integer-rerun
```

Choose an allowed CPU for your machine. This CPU 4 series used a shared host
without exclusive isolation or fixed frequency/turbo. The third pass suffered
substantial scheduling contention: child CPU/wall time was about 50% for Goose
and 68% for Rust. All completed samples remain included; no timing process was
interrupted or altered. Wide-integer encoding improved in all three matched
passes, but the cross-library timings do not establish a reliable ranking.
Review and heavy correctness tests finished before timing. Historical
[expanded-corpus controls and profiles](../corpus-native-2026-11-04) are separate
recordings; do not infer codec speedups from absolute times across recordings.
