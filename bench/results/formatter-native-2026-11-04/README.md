# Formatter-isolation native recording

Candidate `ca9b0dce42061c38e72d05233ee229874dc5b682` versus public baseline
`0c26308570cbe2c6769c1bf0eba8d86e7e8ad681`, 2026-11-04. Full results, semantics and
shared-host limitations: [historical benchmark report](report.md).

All nine process outputs, all 2,520 batch averages, source/executable hashes,
process order/timing, toolchain and requested/observed build profiles are retained.
No process pass or fastest batch was excluded. Build artifacts are not published.

From a full clone at the candidate revision, with the pinned compiler available:

```sh
python3 bench/measure.py --goose /absolute/path/to/goose --native --cpu 4 \
  --iterations 200000 --runs 3 \
  --baseline 0c26308570cbe2c6769c1bf0eba8d86e7e8ad681 \
  --output .build/formatter-rerun
```

CPU 4 was an allowed affinity on this Linux host, not an exclusive reservation.
Choose an allowed CPU on your machine; results are machine/workload dependent.
