# Short copy experiment: baseline retained

One bounded one- to three-byte copy candidate passed correctness review but
failed the precommitted performance gate. Dense encoding did not improve in
every series or reach the required 5% summary gain. Production is restored to
v0.1.3; stronger copy/canary/guard tests and the bidirectional recorder remain.

[Complete results, methods and reproduction](REPORT.md) retain all **6,552 batch
averages**, including the identical-source control and all encoding/decoding
fixtures. No timing is subtracted or selected away. The policy below was committed
before either recording at `1ba4e93`.

## Premeasurement acceptance protocol

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
unchanged paths is claimed. Both complete recordings are retained.
