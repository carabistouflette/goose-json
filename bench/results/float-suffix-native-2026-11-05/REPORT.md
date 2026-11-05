# Scientific suffix experiments and matched-build controls

Neither normalization variant is adopted. The current native formatter and
package sidecar match published `v0.1.3` byte-for-byte. The final same-path
comparison shows a modest wide-float gain with an unfavorable dense-text
tradeoff. The mechanisms behind shifts on untouched paths were not isolated;
these observations are not claims about changes to their algorithms.

The maintained change is fifteen exact canonical-number cases and a recorder
that controls source/output/cache paths and source timestamps. All five
recordings and all **8,190 timed batch averages** are retained. No sample was
corrected, subtracted, selected away or interrupted to improve a result.

## Method and statistics

Every short process uses the typed public encoder with fresh output, validation,
error checks, consumption and cleanup inside timing. File I/O, fixture creation,
complete value/bit-roundtrip preflight and up to 1,000 warmup iterations are
outside timing. These are **separate process pairs**, not same-process A/B.
There are three series of 21 pairs per fixture, alternating revision order and
shuffling fixture order with seed 219. Counts, encoded lengths and consumption
checksums must agree inside every pair; every process checks complete values and
roundtrips. All 1,638 rows in each recording passed.

Before/after columns are pooled medians of 63 process-batch averages per
revision/fixture, in ns/op. For each pair, percentage is `(after/before-1)*100`.
Each series percentage is its median of 21 paired percentages; the summary is
the median of the three series medians. This is **not** the ratio of the two
separately pooled timing medians. Faster-pair counts and ranges are descriptive,
not significance tests, request-latency percentiles or confidence intervals.

The legacy recorder builds baseline in a temporary tree and candidate in the
working tree, with a shared fresh cache. Identical production sources produced
different executable hashes in its control. That observation does not isolate
why timings differ, but exposes uncontrolled build-procedure differences.

The separate [matched-build recorder](fixed-paired.py) extracts both revisions
from Git to the same absolute source/entry/output paths, clears the same compiler
cache before each build and fixes production source mtimes to epoch zero.
It verifies archived fingerprints, records source/harness/binary/code/rodata
hashes, freezes each executable and rejects harness-input mutation. Its A/A
control produced byte-identical complete executables, `.text` and `.rodata`.
This validates the matched build procedure; it does not establish which old
variable caused any earlier timing shift. Earlier data is never adjusted.

All builds finish on CPU3 before CPU4 timing. Root/reviewer correctness work
finishes before timing. Core Ultra 7 258V, Linux x86-64, pinned Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`, GCC/G++16.2.1, native CPU tuning on
Goose/C++. The shared desktop has no exclusive reservation or fixed frequency/
turbo. Unrestricted ongoing work can overlap. Matching builds does not eliminate
scheduling, cache, layout or thermal effects. The controls retain nonzero timing
variation. No universal ranking, significance or production-traffic gain is claimed.
Encoder timing only is measured here; decoder correctness is checked by preflight.

## Matched-build control: identical source and executable

Baseline `aae48035` versus restored-writer `79dafea`. Production sources and
complete executables are identical. [Metadata](fixed-control/metadata.json),
[all samples](fixed-control/samples.csv). Nonzero changes demonstrate remaining
measurement variability and are never used as corrections.

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 49.8 | 49.9 | -0.46% / -0.63% / +1.78% | -0.46% | 32 |
| Escaped / Unicode | 95.5 | 95.5 | +0.06% / -1.10% / +0.66% | +0.06% | 33 |
| 1,024 nonnegative integers | 5,207.1 | 5,109.3 | -0.51% / -0.62% / -0.28% | -0.51% | 34 |
| 1,024 signed small integers | 5,110.8 | 5,142.8 | +1.59% / +0.44% / -0.28% | +0.44% | 27 |
| 1,024 wide integers | 12,679.0 | 12,465.1 | -2.54% / +0.56% / -1.18% | -1.18% | 33 |
| Mixed event | 2,475.8 | 2,468.5 | +0.44% / -0.26% / -0.21% | -0.21% | 28 |
| 256 simple floats | 9,945.6 | 10,002.5 | +0.46% / -0.32% / +0.16% | +0.16% | 29 |
| 256 wide-exponent floats | 10,379.0 | 10,364.3 | +0.75% / -0.70% / -1.71% | -0.70% | 38 |
| 64-byte ASCII text | 48.4 | 48.7 | +1.36% / -0.40% / -1.14% | -0.40% | 31 |
| 8 KiB sparse escapes | 1,708.5 | 1,681.3 | +1.15% / -0.56% / +0.73% | +0.73% | 31 |
| 8 KiB ASCII text | 772.4 | 775.9 | -0.10% / +0.30% / -0.14% | -0.10% | 33 |
| Dense escapes / Unicode | 8,623.0 | 8,789.3 | +0.47% / +0.97% / +1.24% | +0.97% | 28 |
| 16 reversed integer fields | 169.4 | 172.5 | +1.07% / -2.21% / +1.52% | +1.07% | 32 |

## Matched-build final candidate: not adopted

Four guarded checks skip the guaranteed final exponent digit; pinned scientific
output is nonempty and `E` is at most four bytes earlier. Vendor conversion,
rounding policies, digits and fixed-point paths are unchanged. Actual candidate
`d0d1452` versus immutable `v0.1.3`. Source and executable/code hashes differ as
expected. [Metadata](fixed-four/metadata.json), [all samples](fixed-four/samples.csv).
The wide-float improvement does not meet the net-regression gate because dense
text is slower in each series. No causal claim about unchanged string code is made.

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 49.4 | 49.5 | +1.72% / -0.82% / +1.30% | +1.30% | 29 |
| Escaped / Unicode | 93.9 | 91.2 | -0.80% / -0.22% / +0.06% | -0.22% | 36 |
| 1,024 nonnegative integers | 5,072.7 | 5,062.8 | -2.27% / -0.93% / -1.44% | -1.44% | 41 |
| 1,024 signed small integers | 5,148.9 | 5,184.2 | +0.51% / +0.42% / +1.15% | +0.51% | 27 |
| 1,024 wide integers | 12,404.9 | 12,338.7 | -3.47% / +1.02% / +2.12% | +1.02% | 31 |
| Mixed event | 2,355.0 | 2,364.6 | +2.47% / +1.22% / +1.10% | +1.22% | 27 |
| 256 simple floats | 9,887.4 | 9,990.2 | +0.13% / +2.14% / +1.15% | +1.15% | 24 |
| 256 wide-exponent floats | 10,365.9 | 9,988.5 | -3.53% / -2.68% / -3.93% | -3.53% | 52 |
| 64-byte ASCII text | 47.6 | 48.1 | -2.43% / +0.23% / +1.39% | +0.23% | 32 |
| 8 KiB sparse escapes | 1,688.7 | 1,693.9 | +2.03% / -1.88% / +0.26% | +0.26% | 26 |
| 8 KiB ASCII text | 770.2 | 759.6 | +1.39% / -1.15% / +0.17% | +0.17% | 30 |
| Dense escapes / Unicode | 8,487.6 | 8,801.7 | +7.73% / +6.44% / +2.67% | +6.44% | 14 |
| 16 reversed integer fields | 167.0 | 169.0 | -2.14% / +2.11% / +2.11% | +2.11% | 28 |

## Legacy five-byte candidate: diagnostic only

Candidate `75142a6` bounds/unrolls the existing scan to five bytes, with no skipped
digit. [Metadata](paired/metadata.json), [all samples](paired/samples.csv).
The following legacy-path tables are not the acceptance comparison.

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 47.5 | 47.5 | +0.12% / -1.19% / +3.43% | +0.12% | 28 |
| Escaped / Unicode | 89.2 | 90.1 | +1.23% / -0.92% / +0.42% | +0.42% | 29 |
| 1,024 nonnegative integers | 5,108.9 | 4,991.7 | +0.19% / -2.78% / -0.85% | -0.85% | 37 |
| 1,024 signed small integers | 5,176.6 | 5,175.7 | -1.12% / -0.27% / +0.03% | -0.27% | 32 |
| 1,024 wide integers | 12,817.9 | 12,738.8 | +0.11% / +3.09% / -2.14% | +0.11% | 29 |
| Mixed event | 2,354.5 | 2,344.0 | -0.92% / -1.56% / -0.27% | -0.92% | 41 |
| 256 simple floats | 9,816.8 | 10,023.0 | +1.23% / -0.47% / +0.90% | +0.90% | 28 |
| 256 wide-exponent floats | 10,217.3 | 10,004.6 | -2.09% / -1.84% / -1.51% | -1.84% | 44 |
| 64-byte ASCII text | 46.6 | 46.2 | -1.11% / -1.10% / -1.39% | -1.11% | 39 |
| 8 KiB sparse escapes | 1,642.8 | 1,664.2 | -0.07% / -0.15% / +0.11% | -0.07% | 32 |
| 8 KiB ASCII text | 741.4 | 761.2 | +0.77% / +0.93% / +0.96% | +0.93% | 24 |
| Dense escapes / Unicode | 8,661.9 | 8,966.7 | +1.08% / +6.10% / +2.44% | +2.44% | 23 |
| 16 reversed integer fields | 162.9 | 166.4 | -1.22% / -1.38% / -2.26% | -1.38% | 36 |

## Legacy four-byte candidate: diagnostic only

Candidate `d0d1452`, before matched-path recording.
[Metadata](paired-four/metadata.json), [all samples](paired-four/samples.csv).

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 49.6 | 49.5 | +1.00% / -0.34% / -0.13% | -0.13% | 32 |
| Escaped / Unicode | 94.5 | 93.7 | -1.64% / -0.18% / +1.24% | -0.18% | 35 |
| 1,024 nonnegative integers | 5,122.2 | 5,115.7 | -1.21% / -0.37% / -1.47% | -1.21% | 34 |
| 1,024 signed small integers | 5,174.0 | 5,146.6 | -0.78% / +0.44% / -0.05% | -0.05% | 34 |
| 1,024 wide integers | 12,613.3 | 12,498.3 | +2.65% / +3.20% / -2.24% | +2.65% | 29 |
| Mixed event | 2,415.9 | 2,431.7 | -0.63% / -0.97% / +0.51% | -0.63% | 35 |
| 256 simple floats | 9,942.3 | 10,032.2 | +2.19% / +0.92% / +0.94% | +0.94% | 22 |
| 256 wide-exponent floats | 10,419.5 | 10,239.1 | -3.34% / -3.98% / -3.94% | -3.94% | 52 |
| 64-byte ASCII text | 48.7 | 50.0 | +0.31% / -0.73% / -1.37% | -0.73% | 33 |
| 8 KiB sparse escapes | 1,701.1 | 1,713.4 | -1.15% / -0.82% / +0.41% | -0.82% | 37 |
| 8 KiB ASCII text | 773.1 | 777.2 | -1.08% / -1.28% / -0.60% | -1.08% | 36 |
| Dense escapes / Unicode | 8,601.9 | 8,902.1 | +6.23% / +2.89% / +4.81% | +4.81% | 22 |
| 16 reversed integer fields | 167.5 | 170.6 | +7.96% / +4.25% / +3.08% | +4.25% | 19 |

## Legacy identical-production control: diagnostic only

Restored writer `79dafea`; all 23 runtime/native/build files match baseline.
The executable hashes differ, unlike the later matched-path control. This is
not proof of a particular causal mechanism, and these percentages are not
subtracted from candidate timings. [Metadata](control/metadata.json),
[all samples](control/samples.csv).

| Fixture | Before ns/op | After ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 49.9 | 49.9 | -1.10% / -2.10% / +3.11% | -1.10% | 37 |
| Escaped / Unicode | 94.1 | 93.3 | -0.07% / -0.82% / +1.41% | -0.07% | 29 |
| 1,024 nonnegative integers | 5,151.0 | 5,107.8 | -2.19% / -0.94% / -1.97% | -1.97% | 41 |
| 1,024 signed small integers | 5,163.1 | 5,150.8 | +0.86% / -0.22% / +0.16% | +0.16% | 30 |
| 1,024 wide integers | 12,720.3 | 12,714.3 | +1.63% / +3.85% / +2.17% | +2.17% | 27 |
| Mixed event | 2,406.8 | 2,430.2 | +0.91% / -0.56% / +1.32% | +0.91% | 30 |
| 256 simple floats | 9,952.7 | 9,963.5 | +0.11% / +0.10% / -0.59% | +0.10% | 32 |
| 256 wide-exponent floats | 10,232.3 | 10,298.8 | -0.55% / -0.90% / -0.66% | -0.66% | 37 |
| 64-byte ASCII text | 47.7 | 48.1 | +1.48% / +0.10% / -1.50% | +0.10% | 32 |
| 8 KiB sparse escapes | 1,686.9 | 1,689.9 | +0.61% / -0.26% / -0.56% | -0.26% | 34 |
| 8 KiB ASCII text | 765.2 | 759.0 | -0.80% / -0.07% / +0.44% | -0.07% | 35 |
| Dense escapes / Unicode | 8,493.8 | 8,649.4 | +3.92% / +1.98% / +1.78% | +1.98% | 23 |
| 16 reversed integer fields | 167.4 | 171.4 | +1.12% / +0.68% / +1.34% | +1.12% | 26 |

## Correctness evidence and decision

Both variants passed exact-output and memory-safety checks but remain unshipped.
Root's original-loop oracle passed 1,003,808 patterns per variant under Clang
ASan/UBSan, including complete buffers, signed zero/subnormals, decimal-power
neighbors and nonfinite helper behavior beyond its finite-input precondition.
GCC/Clang maintained native sanitizer suites and public normal/debug/portable
suites passed, and passed again on the retained formatter with the new tests.

Independent Sol 6.1 ultra review of `75142a6` found no findings: actual baseline
and candidate GCC/Clang ASan/UBSan each passed 527,490 patterns, all fifteen
canonical spellings, sixteen alignments, guard pages and 7,800 chunk/capacity
cases. A fresh review of `d0d1452` against both baselines also found no findings;
each compiler passed 298,114 patterns (including every IEEE exponent field,
mantissa-bit positions and decimal-power ±4 ULP neighbors), the same guard/
alignment/chunk checks, and exact bytes/finite bit roundtrips.

Counts describe each test execution, not a claimed disjoint union of patterns.
Vendor sources, API/ownership/error contracts and immutable release tags remain
unchanged. Temporary compiled binaries are excluded; recorded hashes remain as
provenance rather than independently rehashable published binary artifacts.
