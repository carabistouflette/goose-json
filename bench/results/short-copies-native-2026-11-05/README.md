# Short escaping-copy candidate: acceptance protocol

This experiment tests one native implementation change: copy one- to three-byte
plain runs with first/middle/last byte accesses. Input and output spans remain
nonoverlapping and every access stays inside the requested run. The helper is
shared by escaping and unquoting, so both directions must pass correctness and
performance checks. No performance improvement is claimed before measurement.

The recorder builds archived baseline and candidate production sources at the
same absolute source/output/cache paths, clears that cache before each build,
fixes archived source mtimes and freezes completed executables. It preserves
source/harness/binary/section hashes and checks counts, canonical encoded lengths
and checksums within every pair. The typed entry checks all fixture values and
exact roundtrips before operation-specific warmup. Each timed encode/decode uses
fresh owned output/destination, API error checks, consumption and cleanup.
The CSV bytes column is canonical encoded length for both operations, not decoder
input length; fixture files/hashes identify actual decoder inputs.

Before running the series, the adoption gate is fixed as follows:

- Dense escaping must improve in every one of the three series and by at least
  5% in the median-of-series summary.
- No other encode/decode fixture may have a median-of-series slowdown over 3%.
- The identical-source A/A control must produce identical executables/code and
  have no fixture summary outside ±3%; otherwise evidence is insufficient to
  adopt this candidate in this checkpoint.
- All correctness checks and independent native review must pass first. No
  control subtraction, selective sample removal, timing retries or second
  implementation variant is used to clear this gate.

These are conservative engineering acceptance thresholds, not statistical
significance tests or CI speed thresholds. The shared host has no exclusive
core reservation or fixed frequency/turbo. Layout/cache/scheduling/thermal
variation remains possible; no universal ranking or causal attribution to
unchanged paths is claimed. Both complete recordings will be retained.
