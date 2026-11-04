# Historical integer optimization recording

## Recorded native results

Measured source `06622d495175842914f7381b72fd6d855733acc3` against fixed `v0.1.2`
(`3fa7b5275399641f8069698b6c097ea66cef7929`) on 2026-11-04. The candidate changes
GCC/Clang integer conversion; the corpus, harness and build settings are matched.
Every pass passed typed-decoder checksum/count/fixture-set validation.
[Full provenance](metadata.json).

Intel Core Ultra 7 258V, Linux x86-64, CPU 4 affinity; pinned Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`, GCC/G++ 16.2.1 and Rust 1.101.0-nightly.
All three shuffled process passes requested 200,000 iterations, with fixture
scaling above. Native CPU tuning applies to Goose/C++ and Rust. Requested and
observed release profiles, source hashes and executable hashes are retained.

**Shared-host limitation:** the third pass suffered substantial scheduling
contention. Child CPU/wall time was about 50% for both Goose processes and 68%
for Rust, versus 98.5–99.2% in the first two passes. Third-pass Goose timings
were often roughly twice as slow. No samples were discarded or corrected;
all nine outputs and 3,276 batch averages contribute to these tables. The core
was not isolated and frequency/turbo were not fixed. Independent review and
our heavy correctness tests finished before timing; unrelated work could run.
These results support neither statistical significance nor a reliable cross-library
ranking. Close results, and differences on unchanged paths, require caution.

### Decode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 121.0 | 230.2 | 115.0 |
| Escaped / Unicode | 223.6 | 474.9 | 323.1 |
| 1,024 nonnegative integers | 11,420.1 | 28,043.9 | 19,680.8 |
| 1,024 signed small integers | 12,043.2 | 28,151.1 | 20,245.5 |
| 1,024 wide integers | 33,276.3 | 33,794.4 | 45,978.5 |
| Mixed event | 2,578.2 | 4,314.9 | 4,710.8 |
| 256 simple floats | 5,060.1 | 8,856.4 | 8,444.2 |
| 256 wide-exponent floats | 8,831.7 | 16,220.5 | 21,459.2 |
| 64-byte ASCII text | 122.0 | 218.0 | 161.0 |
| 8 KiB sparse escapes | 2,041.8 | 2,664.2 | 3,323.4 |
| 8 KiB ASCII text | 1,339.5 | 1,835.5 | 2,253.5 |
| Dense escapes / Unicode | 14,762.2 | 22,899.8 | 32,827.8 |
| 16 reversed fields | 493.2 | 1,019.1 | 863.2 |

### Encode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 55.0 | 76.7 | 57.3 |
| Escaped / Unicode | 104.6 | 167.9 | 99.5 |
| 1,024 nonnegative integers | 6,104.8 | 10,690.0 | 9,370.4 |
| 1,024 signed small integers | 6,156.8 | 9,187.4 | 9,250.4 |
| 1,024 wide integers | 16,843.4 | 19,163.3 | 17,351.3 |
| Mixed event | 2,769.9 | 3,212.7 | 2,572.8 |
| 256 simple floats | 11,517.2 | 17,743.1 | 10,102.6 |
| 256 wide-exponent floats | 12,010.6 | 16,317.1 | 9,599.6 |
| 64-byte ASCII text | 51.3 | 147.1 | 108.1 |
| 8 KiB sparse escapes | 1,994.3 | 728.0 | 5,946.8 |
| 8 KiB ASCII text | 833.3 | 709.2 | 5,247.4 |
| Dense escapes / Unicode | 11,574.8 | 8,544.7 | 10,490.5 |
| 16 reversed fields | 175.6 | 448.8 | 469.5 |

### Matched fixed-release comparison

All thirteen fixtures are included. Negative changes mean less time; decoding
and float/string kernels were not changed by this integer optimization. Their
observed differences are not evidence of improvements to those algorithms.

| Fixture | Decode release → current (change) | Encode release → current (change) |
| --- | ---: | ---: |
| Small record | 120.7 → 121.0 (+0.2%) | 55.9 → 55.0 (-1.6%) |
| Escaped / Unicode | 242.9 → 223.6 (-7.9%) | 113.1 → 104.6 (-7.5%) |
| 1,024 nonnegative integers | 11,845.9 → 11,420.1 (-3.6%) | 6,463.7 → 6,104.8 (-5.6%) |
| 1,024 signed small integers | 12,074.5 → 12,043.2 (-0.3%) | 7,372.2 → 6,156.8 (-16.5%) |
| 1,024 wide integers | 33,842.5 → 33,276.3 (-1.7%) | 29,976.3 → 16,843.4 (-43.8%) |
| Mixed event | 2,738.1 → 2,578.2 (-5.8%) | 3,003.0 → 2,769.9 (-7.8%) |
| 256 simple floats | 5,345.0 → 5,060.1 (-5.3%) | 12,193.9 → 11,517.2 (-5.5%) |
| 256 wide-exponent floats | 9,521.5 → 8,831.7 (-7.2%) | 12,774.1 → 12,010.6 (-6.0%) |
| 64-byte ASCII text | 129.8 → 122.0 (-6.0%) | 54.5 → 51.3 (-5.9%) |
| 8 KiB sparse escapes | 2,067.3 → 2,041.8 (-1.2%) | 1,993.0 → 1,994.3 (+0.1%) |
| 8 KiB ASCII text | 1,382.2 → 1,339.5 (-3.1%) | 876.3 → 833.3 (-4.9%) |
| Dense escapes / Unicode | 17,036.3 → 14,762.2 (-13.3%) | 12,068.7 → 11,574.8 (-4.1%) |
| 16 reversed fields | 540.4 → 493.2 (-8.7%) | 188.9 → 175.6 (-7.0%) |

Wide-integer encoding decreased in every matched pass, including the contended
third pass. This is evidence for this kernel on this distribution, rather than
a claim about all integer sizes or machines. The aggregate median decreased
43.8%; signed-small-integer encoding decreased 16.5%. Sparse-text encoding was
0.1% slower in aggregate; no escaping code changed.

| Wide-integer encoding | v0.1.2 ns/op | Candidate ns/op | Change |
| --- | ---: | ---: | ---: |
| Pass 1 | 28,761.9 | 16,843.4 | -41.4% |
| Pass 2 | 29,976.3 | 16,602.3 | -44.6% |
| Pass 3 | 65,335.4 | 34,997.5 | -46.4% |

### Different APIs and formats

Protobuf and borrowing DOM have separate contracts; neither is a like-for-like
typed JSON implementation. DOM cannot losslessly represent every wide i64;
negative Protobuf int64 values use ten-byte varints (not zigzag sint64).
Times are ns/op with the same shared-host limitations.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 60.2 / 33.4 | 87.0 |
| Escaped / Unicode | 62 / 24 | 70.5 / 33.4 | 142.7 |
| 1,024 nonnegative integers | 4022 / 1923 | 5,855.6 / 9,218.1 | 19,470.8 |
| 1,024 signed small integers | 4538 / 6083 | 7,736.1 / 22,136.1 | 20,500.6 |
| 1,024 wide integers | 19771 / 9669 | 10,433.8 / 33,496.2 | 55,068.6 |
| Mixed event | 1187 / 954 | 1,392.1 / 641.9 | 2,815.2 |
| 256 simple floats | 1581 / 2051 | 1,082.0 / 422.3 | 4,864.2 |
| 256 wide-exponent floats | 5975 / 2051 | 868.9 / 432.1 | 16,321.1 |
| 64-byte ASCII text | 97 / 70 | 63.7 / 34.4 | 134.8 |
| 8 KiB sparse escapes | 8233 / 8205 | 757.5 / 378.0 | 15,958.8 |
| 8 KiB ASCII text | 8225 / 8199 | 738.4 / 381.4 | 7,483.1 |
| Dense escapes / Unicode | 8737 / 6663 | 9,169.2 / 330.7 | 17,340.6 |
| 16 reversed fields | 135 / 31 | 148.2 / 140.4 | 364.1 |
