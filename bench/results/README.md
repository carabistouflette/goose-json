# Recording archive

These are historical recordings, preserved without editing raw outputs. Dates
alone do not establish applicability. Each report's source/candidate/baseline
labels refer to its own immutable revisions. See the maintained
[results](../RESULTS.md) and [source comparison](../CURRENTNESS.md) for v0.1.3/main.

| Recording | Purpose / limits |
| --- | --- |
| [Release 0.1.3 preparation](release-013-native-2026-11-04) | Thirteen-fixture native comparison; current source relationship checked separately; asymmetric scheduling loss retained |
| [Wide integers](wide-integers-native-2026-11-04/report.md) | Earlier integer comparison; source/context and contention limits in report |
| [Expanded corpus](corpus-native-2026-11-04/report.md) | Historical identical-code controls and separate instrumented profiles |
| [Remainder probe](corpus-remainder-probe-2026-11-04) | Excluded: cross-language consumption checksum mismatch; raw data retained |
| [Formatter isolation](formatter-native-2026-11-04/report.md) | Older ten-fixture harness; do not compare absolute times as code gains |
| [Sparse strings](sparse-native-2026-11-04) | Earlier source pair, not a current-release rerun |
| [Validated kernels](validated-native-2026-11-04) | Historical bounded-scan/dense-text changes |
| [Contended series](contended-native-2026-11-04) | Separate noisy data, excluded from maintained result tables |
| [Exploratory sparse scan](sparse-exploratory-2026-11-04) | Overlapping local kernel job; not a published comparison basis |
| [Initial kernels](final-kernels-2026-11-04), [native](native-2026-11-04), [default-CPU method](2026-11-03-methodology.md) | Historical implementations/tooling |
| [Prefix reuse](sparse-prefix-native-2026-11-05) | Rejected candidates; all 9,828 observations retained, including confounded procedures |
| [Float suffix](float-suffix-native-2026-11-05) | Rejected candidates and old/new build controls; 8,190 observations |
| [Short copies](short-copies-native-2026-11-05) | One rejected candidate and identical-source control; 6,552 encode/decode observations |
| [Large encoder](large-encoder-2026-11-05) | Separate throughput and whole-process RSS observations; no growth-bottleneck/speedup claim |
| [Copy/allocation counts](encoder-copies-2026-11-05) | Instrumented operation counts with coverage limits; not latency or memory use |
| [Signed consumer](artifact-consumer-2026-11-05) | Existing application with its original JSON v0.1.2 pin; nested wall-clock spans, not production/current-main benchmarks |

Top-level `before`, `after` and `compare` Markdown files retain early exploratory
outputs. They do not contribute to the maintained summary. All slower cases and
rejected trials stay available. No control measurements are subtracted from
candidate timings, and archived profiles are never substituted for throughput.
