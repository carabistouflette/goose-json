# Expanded corpus recording

Measured harness source `4835c5041ec69605f6b027a11b365f860f2c9ef8`, fixed codec baseline
`fcae091cf89c1692b1e2d64891f645c862cc8844` (`v0.1.1`). Production codec files are
identical. This establishes controls for the broader corpus, not a speedup claim.

All nine process outputs and all 3,276 batch averages are retained under
[recording](recording), with complete source/executable hashes, requested/observed
build profiles, process order, timing and passed typed-decode checksum checks.
[Historical full results](report.md); [API contracts](../../README.md#corpus-and-equivalence).

From a full checkout at the measured harness source, with the pinned compiler:

```sh
python3 bench/measure.py --goose /absolute/path/to/goose --native --cpu 4 \
  --iterations 200000 --runs 3 --baseline v0.1.1 --output .build/corpus-rerun
```

Choose an allowed CPU on your machine. This CPU 4 series used a shared host,
without exclusive isolation or fixed frequency. All passes contribute to the
reported medians. Earlier [invalid remainder probes](../corpus-remainder-probe-2026-11-04)
are preserved separately and excluded. No timing samples were interrupted.

[Encode-only profiling](PROFILING.md) uses separate instrumented builds; source,
flags, checksums and raw flat profiles are retained. Profiling output is never
used as benchmark latency or an achievable-speedup estimate.
