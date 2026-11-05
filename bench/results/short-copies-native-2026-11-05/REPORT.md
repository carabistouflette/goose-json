# Short copy experiment: production helper retained

The only candidate passes correctness/security review but fails the adoption
gate fixed before measurement in `1ba4e93`. Dense encoding's median-of-series
paired change is **−1.18%**, with series −2.10%, −1.18%, **+0.85%**. This is below
the required 5% gain and not an improvement in every series. No other fixture
exceeds the 3% slowdown limit; the identical-source control also meets its gate.
The implementation and package fingerprint are restored to the baseline.

All **6,552 batch averages** are retained: two complete recordings, each with
13 fixtures × encode/decode × three series × 21 pairs × two revisions. Neither
sample selection/control subtraction nor retries/another variant were used.
This is a negative result, not a claim that the optimization improves production.

## Precommitted gate and outcome

| Gate | Outcome |
| --- | --- |
| Dense encode improves every series, summary at least 5% | **Fail:** −2.10% / −1.18% / +0.85%; summary −1.18% |
| No other encode/decode summary slowdown over 3% | Pass |
| Identical-source executable/code identity; all control summaries within ±3% | Pass |
| Correctness checks and independent native review before timing | Pass |

These are engineering acceptance thresholds, not significance tests. The exact
premeasurement policy remains available at immutable harness revision below.
The candidate's speculative cost was branch decomposition of one- to three-byte
plain runs inside the dense escaping hot loop. Existing gprof evidence places
most dense-case time in `gj_escape_chunk`, but that profile does not establish
the share attributable to the copy helper or an achievable speedup. This
experiment supplies no stronger causal conclusion about the individual branches.

## Recording and statistics

Same absolute source/entry/output/cache paths for both archived revisions, cache
cleared before each build, source mtimes fixed, native fingerprints checked,
completed executables frozen before timing. Code/source/harness/binary hashes
and host/compiler settings are in metadata. A/A complete binaries, `.text` and
`.rodata` are byte-identical; candidate `.text` differs as expected. No separately
published binaries are provided; hashes are provenance rather than downloadable
independently rehashable executable artifacts.

All baseline builds use the current native baseline (production equals v0.1.3),
not a portable backend. GCC/native CPU tuning applies to both Goose and C++.
Builds use CPU3; all preflight, root correctness checks and independent native
review finish before CPU4 timing. The shared host has no exclusive CPU reservation
or fixed frequency/turbo. Core Ultra 7 258V, Linux x86-64, pinned Goose `eadca409`,
GCC/G++16.2.1. Matching builds and alternating/shuffled pairs do not eliminate
scheduling/cache/layout/thermal variation; the A/A control retains nonzero shifts.
No ranking, significance or causal change to untouched algorithms is claimed.

Each separate process performs full fixture-value and exact float-bit roundtrip
preflight, then operation-specific warmup (up to 1,000 iterations). Encoding
includes public `serialize`, fresh output, error checks, byte/length consumption
and cleanup. Decoding includes public `deserialize_into`, a fresh typed
destination, error checks, value consumption and cleanup. Input construction,
file I/O, full preflight, warmup and printing are outside timing. Raw `bytes`
is canonical encoded length for both operations; decoder input is the hashed
fixture file, not necessarily the same length. No bytes-per-second comparisons
are derived from this column.

Before/after ns/op columns are separately pooled medians of 63 batch averages.
Each pair's percentage is `(after/before−1)*100`; each series percentage is the
median of 21 paired percentages; summary is the median of three series medians.
**Summary percentage is not the ratio of the two pooled ns/op medians.** In the
dense candidate row those two statistics even have different signs. All values
are retained rather than choosing the more favorable statistic after the fact.
Faster-pair counts/ranges are descriptive, not latency percentiles, confidence
intervals or significance tests. Each row is a batch average, not an individual
request observation. Synthetic fixed fixtures are not production-traffic replay.

CSV publication changes CRLF to LF only, preserving every field value and row
order; original outputs remain in private build artifacts. No numerical edits.

## Identical-source A/A control

[Metadata](control/metadata.json), [all 3,276 samples](control/samples.csv).

### Encode

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 54.0 | 53.3 | -2.08% / -1.38% / -0.07% | -1.38% | 36 |
| Escaped / Unicode | 108.9 | 106.8 | +0.26% / +1.69% / -1.38% | +0.26% | 33 |
| 1,024 nonnegative integers | 5,938.0 | 5,924.3 | -0.17% / +1.97% / +4.60% | +1.97% | 28 |
| 1,024 signed small integers | 6,059.1 | 6,111.8 | +0.16% / -0.20% / -1.41% | -0.20% | 33 |
| 1,024 wide integers | 15,216.0 | 14,462.5 | +1.93% / -1.39% / -1.50% | -1.39% | 31 |
| Mixed event | 2,692.9 | 2,671.7 | -0.19% / -1.80% / +0.55% | -0.19% | 35 |
| 256 simple floats | 11,190.6 | 11,392.2 | +0.27% / +0.19% / -0.11% | +0.19% | 28 |
| 256 wide-exponent floats | 11,374.2 | 11,408.3 | +0.23% / +0.51% / -0.58% | +0.23% | 27 |
| 64-byte ASCII text | 53.2 | 53.0 | -0.11% / -0.39% / +4.28% | -0.11% | 30 |
| 8 KiB sparse escapes | 1,882.6 | 1,871.2 | +0.06% / +1.42% / +0.17% | +0.17% | 29 |
| 8 KiB ASCII text | 831.9 | 826.5 | +0.24% / +0.38% / -0.60% | +0.24% | 29 |
| Dense escapes / Unicode | 10,236.3 | 10,355.8 | +0.06% / +1.44% / +0.00% | +0.06% | 26 |
| 16 reversed integer fields | 178.2 | 182.9 | +0.96% / +1.19% / -1.32% | +0.96% | 27 |

### Decode

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 113.8 | 113.2 | +0.33% / -2.11% / -2.37% | -2.11% | 35 |
| Escaped / Unicode | 223.5 | 222.9 | +0.83% / +1.74% / +1.47% | +1.47% | 24 |
| 1,024 nonnegative integers | 10,531.9 | 10,562.8 | -1.97% / +0.15% / -0.81% | -0.81% | 33 |
| 1,024 signed small integers | 10,588.5 | 10,393.7 | +1.07% / +0.05% / +0.35% | +0.35% | 29 |
| 1,024 wide integers | 28,026.4 | 27,233.0 | -0.76% / -0.03% / -3.46% | -0.76% | 36 |
| Mixed event | 2,546.2 | 2,591.4 | +0.55% / +0.32% / -0.19% | +0.32% | 26 |
| 256 simple floats | 5,189.9 | 5,223.4 | +1.52% / -0.83% / -1.01% | -0.83% | 33 |
| 256 wide-exponent floats | 8,611.8 | 8,584.9 | -0.35% / -1.18% / +0.46% | -0.35% | 34 |
| 64-byte ASCII text | 124.7 | 123.1 | +0.83% / -0.08% / +1.30% | +0.83% | 29 |
| 8 KiB sparse escapes | 1,969.9 | 1,959.7 | -0.30% / -0.34% / -0.11% | -0.30% | 36 |
| 8 KiB ASCII text | 1,304.6 | 1,318.6 | -0.38% / -1.09% / +1.51% | -0.38% | 33 |
| Dense escapes / Unicode | 13,770.7 | 12,816.0 | -0.53% / -0.86% / +1.03% | -0.53% | 31 |
| 16 reversed integer fields | 473.9 | 471.4 | -1.29% / -1.07% / +0.22% | -1.07% | 37 |

## Candidate: not adopted

[Metadata](candidate/metadata.json), [all 3,276 samples](candidate/samples.csv).

### Encode

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 52.4 | 52.5 | +0.49% / +0.25% / +2.01% | +0.49% | 26 |
| Escaped / Unicode | 100.6 | 100.9 | +0.37% / +1.09% / +1.12% | +1.09% | 27 |
| 1,024 nonnegative integers | 5,447.7 | 5,506.8 | +0.35% / -1.27% / -0.21% | -0.21% | 34 |
| 1,024 signed small integers | 5,474.9 | 5,608.2 | -0.35% / +1.29% / +0.85% | +0.85% | 28 |
| 1,024 wide integers | 13,388.8 | 13,724.5 | -0.53% / -0.34% / -2.38% | -0.53% | 34 |
| Mixed event | 2,539.3 | 2,516.9 | -1.30% / -1.54% / -2.00% | -1.54% | 41 |
| 256 simple floats | 10,630.3 | 10,732.0 | -0.76% / +0.55% / +0.23% | +0.23% | 32 |
| 256 wide-exponent floats | 11,281.6 | 11,176.2 | +0.14% / +1.05% / -0.98% | +0.14% | 29 |
| 64-byte ASCII text | 51.5 | 51.2 | +0.48% / -0.09% / +2.24% | +0.48% | 27 |
| 8 KiB sparse escapes | 1,769.3 | 1,779.4 | -0.21% / +0.17% / +0.95% | +0.17% | 31 |
| 8 KiB ASCII text | 809.6 | 810.8 | -0.29% / +0.62% / -0.10% | -0.10% | 32 |
| Dense escapes / Unicode | 9,223.3 | 9,313.1 | -2.10% / -1.18% / +0.85% | -1.18% | 33 |
| 16 reversed integer fields | 171.3 | 175.7 | +2.56% / +0.51% / +0.11% | +0.51% | 27 |

### Decode

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 114.6 | 112.6 | +0.20% / -2.79% / -0.63% | -0.63% | 39 |
| Escaped / Unicode | 213.9 | 212.2 | -1.47% / -0.53% / +0.39% | -0.53% | 35 |
| 1,024 nonnegative integers | 9,890.5 | 9,708.1 | -1.72% / +0.20% / +0.02% | +0.02% | 32 |
| 1,024 signed small integers | 9,624.3 | 9,548.1 | -1.94% / -0.96% / +2.30% | -0.96% | 30 |
| 1,024 wide integers | 27,532.2 | 26,013.7 | +0.90% / -1.36% / -2.66% | -1.36% | 35 |
| Mixed event | 2,509.4 | 2,546.2 | -0.66% / +0.39% / +0.02% | +0.02% | 31 |
| 256 simple floats | 4,935.1 | 4,927.5 | -0.52% / -0.54% / +0.17% | -0.52% | 34 |
| 256 wide-exponent floats | 8,116.3 | 8,182.5 | +0.74% / +0.15% / +0.09% | +0.15% | 29 |
| 64-byte ASCII text | 119.5 | 119.8 | -0.25% / +0.17% / +2.34% | +0.17% | 30 |
| 8 KiB sparse escapes | 1,871.3 | 1,886.1 | -0.36% / +0.91% / -0.41% | -0.36% | 32 |
| 8 KiB ASCII text | 1,290.2 | 1,286.3 | -1.29% / +1.22% / +1.60% | +1.22% | 31 |
| Dense escapes / Unicode | 12,770.4 | 12,281.4 | -5.00% / -1.17% / -1.10% | -1.17% | 37 |
| 16 reversed integer fields | 457.0 | 448.3 | -0.46% / -0.07% / -0.25% | -0.25% | 34 |

## Correctness and retained coverage

The final production helper is unchanged. New maintained tests compare complete
buffers to `memcpy` for lengths 0..40 and all sixteen source × sixteen destination
alignments (10,496 cases), including bytes before/after the copy. Guard-page
loads/stores cover lengths 0..255, including zero-length protected pointers and
short runs at the page edge. Existing exact string/chunk/canary/API tests remain.

Root GCC/Clang ASan/UBSan maintained native suites and public normal/debug/portable
checks passed for the candidate. Fresh independent Sol 6.1 ultra review found
no correctness, security or maintainability blockers and passed focused baseline/
candidate differential ASan/UBSan checks in scalar, SSE2 and AVX2 builds with both
compilers: 2,026,974 API calls per build, including escaping/unquoting, short runs,
chunk capacities, unaligned buffers, malformed escapes, canaries and guard edges.
Counts describe API calls per execution, not unique inputs or a disjoint union.
The same review audited the bidirectional recorder/preflights and found no
blockers. No timing was run by that review and no unchanged float/SIMD fuzz
campaign was added. Production, vendor, API/ownership/error contracts and release
tags remain unchanged; performance rejection is independent of correctness.

## Reproduce

Use a disposable full clone and the pinned Goose compiler, Linux taskset, GNU
binutils objcopy, Python, CMake and GCC/G++. Choose allowed CPU indices and new/
empty output directories. The recorded immutable harness is
`1ba4e93c89faa769659b3676e6e4d8a0f4fa27a1`, baseline
`1b8df659591fd07e071bfc6f2f79966f228b801f` and candidate
`290dd6e6d84c16721fd938913e7bb4ced3092346`:

```sh
git switch --detach 1ba4e93c89faa769659b3676e6e4d8a0f4fa27a1
python3 bench/results/short-copies-native-2026-11-05/paired.py \
  --goose /absolute/path/to/pinned/goose --candidate 1b8df659591fd07e071bfc6f2f79966f228b801f \
  --cpu 4 --build-cpu 3 --output .build/reproduce-short-copy-control
python3 bench/results/short-copies-native-2026-11-05/paired.py \
  --goose /absolute/path/to/pinned/goose --candidate 290dd6e6d84c16721fd938913e7bb4ced3092346 \
  --cpu 4 --build-cpu 3 --output .build/reproduce-short-copy-candidate
```

The recorder extracts archived production files without rewriting the checked-out
sources/index. It rejects changed file sets and harness input mutation. Both
recordings must finish and retain all samples; do not rerun toward a target.
