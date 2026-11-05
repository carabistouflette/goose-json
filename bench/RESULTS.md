# Recorded results

[Method and commands](README.md) · [Workloads](CORPUS.md) · [Checked source comparison](CURRENTNESS.md)
· [Raw samples and metadata](results/release-013-native-2026-11-04/recording)

This historical run measures implementation
`52473a635952b12eddbb78b4d241b24d3d9f0b21`. The source check verifies the same
compiled implementation, harness, fixtures and locked dependencies for v0.1.3
and the audited main checkout. It is not a new measurement or binary-identity
claim; use the recorded toolchain/flags when interpreting these numbers.

## Environment and protocol

Intel Core Ultra 7 258V; Linux 7.2.11-arch1-1 x86-64; CPU4 affinity. Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`, GCC/G++ 16.2.1, Rust 1.101.0-nightly
(`822182db4`), Cargo 1.101.0-nightly (`29c5daa1a`). Generated Goose C uses
`-O2 -march=native`; C++ uses Release `-O3 -DNDEBUG -march=native`; Rust uses
release optimization 3/no LTO and `-C target-cpu=native`. These are not default
portable deployment settings. Exact settings and observed Cargo profile are
in [metadata](results/release-013-native-2026-11-04/recording/metadata.json).

Thirteen JSON fixtures use owned typed values, with separate DOM/Protobuf APIs.
Each operation has up to 1,000 warmup iterations, then seven timed batches; three
process passes are shuffled with seed 219. Requested iterations are 200,000, scaled
by fixture as described in [the method](README.md#what-is-timed). All 3,276 batch
averages are preserved, including the older release and slower results.

**Cells are median [minimum–maximum], in ns/op; lower is better.** Median is the
median of three originally reported process-pass medians (rounded to 0.1 ns).
The range covers all 21 batch averages (recorded to 0.001 ns),
not a confidence interval or request-latency range. Printed precision is not
measurement accuracy. Full-value and float-bit checks occur before timing; API checks, consumption and cleanup are timed.

The host was shared, frequency/turbo not fixed and the core not isolated.
Baseline passes 1/3 had child-CPU/wall ratios 83.5%/83.7%, versus about 99% for the
measured newer-source processes. That asymmetric scheduling loss can favor the
newer source. Older recorder build/cache paths also differ between versions.
These observations do not establish an overall ranking, significance of close
results or a causal speedup on unchanged algorithms. No control is subtracted.

## Typed JSON decode

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 112.5 [93.0–152.5] | 280.7 [169.5–288.5] | 112.9 [96.5–162.4] |
| Escaped / Unicode | 228.0 [180.4–303.6] | 323.4 [305.3–464.6] | 247.7 [200.8–337.4] |
| 1,024 nonnegative integers | 11,467.5 [9,560.6–12,145.6] | 26,372.3 [18,123.7–29,365.1] | 16,502.6 [13,344.9–20,564.8] |
| 1,024 signed small integers | 10,082.1 [8,046.7–11,972.1] | 19,386.5 [18,098.2–27,164.6] | 16,113.9 [13,315.2–23,723.3] |
| 1,024 wide integers | 32,243.1 [21,745.8–39,793.7] | 30,750.5 [23,553.1–41,153.5] | 36,126.8 [30,660.7–49,826.1] |
| Mixed event | 2,531.8 [1,559.5–2,862.0] | 3,713.6 [2,922.9–4,607.9] | 4,685.7 [3,198.6–5,260.4] |
| 256 simple floats | 4,886.5 [3,310.3–5,452.0] | 8,035.0 [5,692.6–8,850.4] | 6,962.8 [4,899.8–7,784.4] |
| 256 wide-exponent floats | 8,531.8 [5,509.3–9,343.2] | 15,962.4 [10,536.7–21,238.6] | 22,669.4 [13,843.6–24,571.5] |
| 64-byte ASCII text | 116.6 [76.3–155.2] | 231.0 [179.4–292.0] | 170.6 [163.6–195.9] |
| 8 KiB sparse escapes | 1,583.3 [1,271.5–1,931.0] | 2,636.6 [2,327.6–2,926.9] | 3,310.9 [2,533.5–3,882.6] |
| 8 KiB ASCII text | 1,199.3 [828.1–1,410.5] | 1,906.8 [1,807.0–2,007.6] | 2,275.4 [2,115.8–2,380.5] |
| Dense escapes / Unicode | 14,479.1 [9,256.7–16,901.6] | 24,368.9 [16,657.9–25,719.1] | 26,196.2 [20,657.2–31,787.1] |
| 16 reversed fields | 435.7 [295.7–515.2] | 1,016.8 [683.7–1,099.3] | 833.3 [543.7–934.1] |

## Typed JSON encode

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 51.1 [43.4–58.2] | 64.9 [53.5–85.0] | 56.2 [47.4–80.1] |
| Escaped / Unicode | 108.9 [84.6–145.5] | 110.3 [106.4–119.5] | 77.5 [62.5–94.0] |
| 1,024 nonnegative integers | 6,148.9 [4,878.7–7,030.1] | 9,755.6 [7,417.0–11,465.5] | 8,341.1 [6,423.4–10,147.7] |
| 1,024 signed small integers | 5,195.7 [4,109.5–6,365.0] | 6,737.7 [6,235.2–10,650.5] | 6,481.7 [5,992.1–9,507.6] |
| 1,024 wide integers | 15,424.2 [10,858.7–19,300.5] | 16,747.9 [12,961.5–19,298.7] | 16,735.1 [12,200.3–20,550.2] |
| Mixed event | 2,688.3 [1,700.2–2,935.0] | 3,197.4 [2,020.3–3,474.5] | 2,476.2 [1,959.4–2,756.6] |
| 256 simple floats | 10,818.4 [7,539.1–12,237.2] | 14,676.9 [10,955.7–17,267.0] | 8,967.2 [6,307.5–10,640.7] |
| 256 wide-exponent floats | 12,070.4 [7,552.4–12,816.0] | 17,591.8 [12,624.3–67,133.4] | 9,719.2 [5,780.2–18,597.1] |
| 64-byte ASCII text | 50.2 [32.3–54.0] | 155.0 [145.3–260.6] | 115.0 [108.9–206.1] |
| 8 KiB sparse escapes | 1,511.8 [1,216.5–1,848.3] | 743.3 [701.4–783.1] | 5,720.3 [4,099.2–6,053.7] |
| 8 KiB ASCII text | 743.1 [520.8–885.6] | 711.1 [701.2–809.2] | 5,513.9 [5,194.2–5,635.3] |
| Dense escapes / Unicode | 11,858.8 [7,236.4–13,220.9] | 8,926.8 [6,693.6–9,345.5] | 10,454.0 [7,781.7–11,864.9] |
| 16 reversed fields | 152.5 [112.7–219.4] | 463.3 [348.7–474.1] | 400.2 [318.7–471.4] |

## Other APIs and formats

These are different contracts, not like-for-like typed JSON competitors.
Borrowing DOM does not enforce the schema and can lose wide-i64 precision.
Binary Protobuf differs in bytes, presence/default and unknown-field rules;
negative `int64` uses ten-byte varints, not zigzag `sint64`.

| Fixture | Protobuf decode | Protobuf encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 57.4 [38.7–77.6] | 32.2 [21.0–36.2] | 82.3 [69.5–89.5] |
| Escaped / Unicode | 49.7 [46.9–74.2] | 24.1 [21.7–36.0] | 148.4 [117.0–198.1] |
| 1,024 nonnegative integers | 5,401.8 [4,252.0–5,948.3] | 8,298.2 [6,218.5–10,154.9] | 19,137.1 [15,485.3–22,414.4] |
| 1,024 signed small integers | 5,529.4 [5,102.2–8,247.2] | 16,299.2 [14,829.8–23,071.0] | 17,691.6 [13,366.2–20,987.4] |
| 1,024 wide integers | 11,100.8 [9,120.5–11,527.9] | 33,491.3 [26,685.1–36,736.0] | 51,924.4 [35,823.5–57,194.7] |
| Mixed event | 1,444.4 [1,039.9–1,644.6] | 608.2 [438.8–622.7] | 2,804.5 [1,792.7–3,088.3] |
| 256 simple floats | 1,076.1 [815.9–1,268.6] | 379.0 [325.9–444.2] | 4,478.3 [3,170.4–5,113.6] |
| 256 wide-exponent floats | 875.0 [755.5–1,198.5] | 415.9 [388.1–487.1] | 16,082.6 [10,111.6–17,296.5] |
| 64-byte ASCII text | 64.8 [61.3–71.7] | 35.4 [31.8–37.5] | 133.4 [85.7–139.8] |
| 8 KiB sparse escapes | 783.8 [736.7–812.6] | 407.6 [378.0–413.2] | 13,101.9 [10,058.4–14,561.2] |
| 8 KiB ASCII text | 765.4 [723.1–796.2] | 415.0 [374.6–461.4] | 6,771.5 [4,696.4–7,855.8] |
| Dense escapes / Unicode | 9,499.4 [6,013.3–10,838.6] | 346.9 [215.0–365.4] | 17,081.4 [10,890.1–20,116.3] |
| 16 reversed fields | 147.9 [112.1–158.1] | 142.2 [116.1–158.3] | 321.7 [229.0–386.2] |

Input/output byte counts differ by encoding; all per-operation byte counts are
kept in the raw output tables. This page does not normalize unlike formats by
bytes or claim equivalent validation work.

## Historical release comparison

Older source is v0.1.2 (`3fa7b5275399641f8069698b6c097ea66cef7929`); newer source
is the measured 52473 commit, whose implementation matches v0.1.3/main. Both use
the same native backend and corpus. These are ratios of separately summarized
times, **not** medians of paired percentages. The scheduling/build-path caveats
above apply; changed times on unchanged decoder/float/string paths must not be
attributed to improvements to those algorithms.

| Fixture | Decode v0.1.2 → measured source (change) | Encode v0.1.2 → measured source (change) |
| --- | ---: | ---: |
| Small record | 121.5 → 112.5 (-7.4%) | 55.8 → 51.1 (-8.4%) |
| Escaped / Unicode | 236.0 → 228.0 (-3.4%) | 107.6 → 108.9 (+1.2%) |
| 1,024 nonnegative integers | 12,025.9 → 11,467.5 (-4.6%) | 6,425.2 → 6,148.9 (-4.3%) |
| 1,024 signed small integers | 11,834.2 → 10,082.1 (-14.8%) | 7,681.5 → 5,195.7 (-32.4%) |
| 1,024 wide integers | 32,434.5 → 32,243.1 (-0.6%) | 29,355.2 → 15,424.2 (-47.5%) |
| Mixed event | 2,616.5 → 2,531.8 (-3.2%) | 2,878.5 → 2,688.3 (-6.6%) |
| 256 simple floats | 5,528.8 → 4,886.5 (-11.6%) | 12,342.5 → 10,818.4 (-12.3%) |
| 256 wide-exponent floats | 8,918.6 → 8,531.8 (-4.3%) | 11,975.4 → 12,070.4 (+0.8%) |
| 64-byte ASCII text | 111.9 → 116.6 (+4.2%) | 47.7 → 50.2 (+5.2%) |
| 8 KiB sparse escapes | 1,940.6 → 1,583.3 (-18.4%) | 1,901.4 → 1,511.8 (-20.5%) |
| 8 KiB ASCII text | 1,384.9 → 1,199.3 (-13.4%) | 871.6 → 743.1 (-14.7%) |
| Dense escapes / Unicode | 14,766.4 → 14,479.1 (-1.9%) | 11,364.5 → 11,858.8 (+4.3%) |
| 16 reversed fields | 524.8 → 435.7 (-17.0%) | 196.7 → 152.5 (-22.5%) |

The full raw release tables retain baseline variation and all 3,276 samples.
No unfavorable pass is excluded from these summaries.

## Reproduce the recording

Use a disposable full clone at the measured source, the pinned Goose compiler
and the exact compiler/dependency versions above. Cargo uses its checked-in lock
file. Choose an allowed CPU and a new output directory:

```sh
git switch --detach 52473a635952b12eddbb78b4d241b24d3d9f0b21
python3 bench/measure.py --goose /absolute/path/to/pinned/goose --native --cpu 4 \
  --iterations 200000 --runs 3 --baseline 3fa7b5275399641f8069698b6c097ea66cef7929 \
  --output .build/reproduce-release013
```

These commands describe a new measurement, which may vary. Changing tools,
flags, workload or machine creates a different recording. In a shared workspace,
coordinate one finite quiet window before running performance measurements.

Regenerate this summary without compiling or measuring anything:

```sh
python3 scripts/benchmark-report.py --check
python3 scripts/benchmark-report.py --write
```

`--check` verifies this page against the unchanged raw sample comments. `--write`
updates only this maintained summary, never the historical recordings.
