# Prefix reuse: rejected experiments

Neither variant is adopted. The production writer is restored byte-for-byte to
`v0.1.3` (`aae48035f73e09b51011950ff12bfe424e0ec921`). Correctness checks passed,
but both variants trade a repeatable sparse-text gain for a dense-text regression.
The narrower variant did not eliminate that regression. Its precise mechanism
was not isolated; this report does not attribute it to an unproven cause.

## Short alternating process pairs

Every process uses the full typed public encoder: fresh output, UTF-8 validation,
error checks, result consumption and cleanup. File I/O, construction, complete
fixture checks, exact roundtrip validation and up to 1,000 warmup iterations
are outside timing. These are separate short processes, **not same-process A/B**.
The counts, fixture shuffle and alternating revision order are recorded by the
[runner](paired.py); all samples remain in the two CSV files.

Each variant has three consecutive series of 21 pairs per fixture. The process
order alternates by round; fixture order shuffles with seed 219. One process
produces one timed batch average. Both revisions in every pair must agree on
count, byte length and consumption checksum; every process checks complete
input values and roundtrips before timing. All 1,638 rows per variant passed.

**Statistics:** before/after columns are medians of all 63 process-batch averages
per revision/fixture, in ns/op. A pair's percentage is `(after / before - 1)*100`.
Each series column is the median of its 21 paired percentages; the summary is
the median of those three series medians. It is deliberately **not** the ratio
of the two separately pooled timing medians. Faster-pair counts include every
pair and are descriptive, not significance tests or confidence intervals.

CPU4 affinity, Core Ultra 7 258V, native GCC/C++ tuning with the same controlled
build environment and a fresh shared cache per recording. Builds use CPU3 and
finish before timing. No exclusive core reservation or fixed frequency/turbo;
ongoing unrestricted work can overlap. Short alternating pairs reduce long-run
drift without removing scheduling, cache, layout or thermal effects. The fixed
synthetic inputs do not establish production-traffic speedups or a universal
ranking. Small differences on untouched paths remain noise-sensitive.

## Variant A: unconditional prefix reuse

The safe prefix is appended directly before suffix escaping. It passed the
independent byte oracle but introduces a repeatable dense-escaping penalty.

Measured commit `8bda7e71f9d2e4cf5407dc2e749d32e41d60eb74`. [Metadata](paired/metadata.json), [all rows](paired/samples.csv).

| Fixture | Before ns/op | Candidate ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 58.6 | 58.9 | -0.21% / +0.37% / +0.57% | +0.37% | 30 |
| Escaped / Unicode | 113.1 | 112.7 | -0.19% / -1.03% / -0.93% | -0.93% | 37 |
| 1,024 nonnegative integers | 6,467.4 | 6,459.9 | +0.22% / -0.38% / +0.40% | +0.22% | 32 |
| 1,024 signed small integers | 6,523.4 | 6,528.5 | -0.01% / +0.15% / +0.03% | +0.03% | 30 |
| 1,024 wide integers | 17,682.7 | 17,645.1 | -0.02% / -0.52% / -0.18% | -0.18% | 36 |
| Mixed event | 2,928.2 | 2,960.5 | +0.96% / +0.28% / +1.78% | +0.96% | 21 |
| 256 simple floats | 12,283.9 | 12,315.7 | -0.46% / +0.61% / +0.30% | +0.30% | 28 |
| 256 wide-exponent floats | 12,965.1 | 13,252.0 | -0.32% / -0.39% / -0.22% | -0.32% | 33 |
| 64-byte ASCII text | 57.9 | 57.8 | +1.05% / +0.58% / -0.08% | +0.58% | 27 |
| 8 KiB sparse escapes | 2,021.1 | 1,865.4 | -6.26% / -8.50% / -8.14% | -8.14% | 58 |
| 8 KiB ASCII text | 913.4 | 925.4 | +0.13% / +0.38% / +1.52% | +0.38% | 26 |
| Dense escapes / Unicode | 11,572.1 | 12,222.0 | +5.16% / +5.52% / +5.55% | +5.52% | 6 |
| 16 reversed fields | 197.8 | 203.9 | -2.03% / +7.11% / +0.40% | +0.40% | 26 |

## Variant B: reuse at least one full block

This variant preserves the original plain-ASCII branch and starts from byte
zero for prefixes shorter than 32 bytes. Longer prefixes are appended directly.
The dense-text regression remains, so it is also rejected.

Measured commit `e665f0c6d82a8ec5512d75d41c7753e1f16e1928`. [Metadata](paired-conditional/metadata.json), [all rows](paired-conditional/samples.csv).

| Fixture | Before ns/op | Candidate ns/op | Series 1 / 2 / 3 paired change | Median series change | Faster pairs / 63 |
| --- | ---: | ---: | ---: | ---: | ---: |
| Small record | 55.9 | 55.9 | -0.46% / -0.41% / -0.62% | -0.46% | 39 |
| Escaped / Unicode | 107.8 | 106.9 | -2.67% / +0.61% / -1.01% | -1.01% | 37 |
| 1,024 nonnegative integers | 6,412.9 | 6,419.4 | -0.35% / -0.07% / +0.09% | -0.07% | 32 |
| 1,024 signed small integers | 6,475.7 | 6,465.3 | -0.14% / -0.29% / +0.15% | -0.14% | 34 |
| 1,024 wide integers | 16,971.8 | 17,248.3 | +0.26% / -0.38% / -1.59% | -0.38% | 38 |
| Mixed event | 2,889.5 | 2,867.2 | -0.97% / -0.06% / -0.35% | -0.35% | 35 |
| 256 simple floats | 12,155.5 | 12,168.8 | -0.36% / +0.35% / +0.35% | +0.35% | 31 |
| 256 wide-exponent floats | 12,737.5 | 12,800.5 | +0.30% / -0.16% / +0.29% | +0.29% | 28 |
| 64-byte ASCII text | 54.9 | 54.9 | -0.17% / +0.29% / -0.51% | -0.17% | 32 |
| 8 KiB sparse escapes | 2,003.9 | 1,840.3 | -8.77% / -9.03% / -8.15% | -8.77% | 61 |
| 8 KiB ASCII text | 876.8 | 879.3 | -0.65% / -0.21% / +0.64% | -0.21% | 32 |
| Dense escapes / Unicode | 11,457.5 | 11,879.1 | +4.26% / +4.66% / +4.55% | +4.55% | 12 |
| 16 reversed fields | 191.9 | 194.1 | -0.65% / +3.28% / -1.30% | -0.65% | 29 |

## Earlier broad series: inconclusive

The three shuffled thirteen-fixture passes have all 3,276 batch averages and
all typed-decoder checksum/count/set checks passed. Its process child CPU/wall
ratios range 88.9–99.3%; the 88.9% process was the second Rust comparison. Most
Goose processes were near 98–99%, which still does not fix frequency or isolate
the core. Large timing changes appear on untouched decoders and numeric paths;
the sparse gain did not persist in every matched pass. No headline speedup is
inferred from this series. Every sample, including all external comparisons,
remains in [recording](recording). The codec is variant A, not variant B.

Times below are medians of the three process medians, ns/op. Negative changes
mean less time, but these confounded observations are not causal attributions.

| Fixture | Decode before → A (change) | Encode before → A (change) |
| --- | ---: | ---: |
| Small record | 115.8 → 114.8 (-0.9%) | 48.3 → 52.2 (+8.1%) |
| Escaped / Unicode | 232.2 → 208.7 (-10.1%) | 103.2 → 99.7 (-3.4%) |
| 1,024 nonnegative integers | 11,438.0 → 11,939.3 (+4.4%) | 5,956.1 → 6,137.4 (+3.0%) |
| 1,024 signed small integers | 12,009.6 → 11,215.7 (-6.6%) | 6,305.1 → 5,865.9 (-7.0%) |
| 1,024 wide integers | 32,905.0 → 27,695.0 (-15.8%) | 16,913.5 → 13,110.4 (-22.5%) |
| Mixed event | 2,559.3 → 1,938.3 (-24.3%) | 2,799.1 → 2,083.8 (-25.6%) |
| 256 simple floats | 5,310.7 → 3,884.6 (-26.9%) | 11,964.8 → 8,881.7 (-25.8%) |
| 256 wide-exponent floats | 8,395.6 → 7,446.6 (-11.3%) | 11,570.3 → 9,467.4 (-18.2%) |
| 64-byte ASCII text | 128.3 → 92.9 (-27.6%) | 54.1 → 37.7 (-30.3%) |
| 8 KiB sparse escapes | 1,965.3 → 1,445.0 (-26.5%) | 1,884.5 → 1,273.7 (-32.4%) |
| 8 KiB ASCII text | 1,319.4 → 1,069.4 (-18.9%) | 828.6 → 669.5 (-19.2%) |
| Dense escapes / Unicode | 14,325.5 → 12,178.9 (-15.0%) | 11,379.6 → 8,711.6 (-23.4%) |
| 16 reversed fields | 483.4 → 347.9 (-28.0%) | 180.8 → 122.1 (-32.5%) |

The preceding [20,000-iteration probe](probe) is also retained in full (3,276
batch averages); it does not contribute to the tables above. The probe uses
production commit `ff7fe29`; broad series and first paired series use `8bda7e7`,
which differs only in strengthened multi-chunk tests. Variant B is `e665f0c`.
There are 9,828 timed batch averages across all four recordings. No samples were
discarded or corrected, and no existing process was interrupted to improve them.

The final source keeps the strengthened exact-byte/Unicode/native-threshold,
multi-chunk and invalid-tail regressions. Production code and immutable release
tags remain unchanged. There is no new performance or security superiority claim.
