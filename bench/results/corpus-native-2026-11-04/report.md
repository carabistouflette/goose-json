# Expanded-corpus control results

## Recorded native results

Measured source `4835c5041ec69605f6b027a11b365f860f2c9ef8` against fixed `v0.1.1`
(`fcae091cf89c1692b1e2d64891f645c862cc8844`) on 2026-11-04. Both contain the same
production codec. The before/after columns below are controls using the expanded
harness, not a codec optimization claim. Every pass passed the typed-decoder
checksum/count/fixture-set check. [Full provenance](recording/metadata.json).

Intel Core Ultra 7 258V, Linux x86-64, CPU 4 affinity; pinned Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`, GCC/G++ 16.2.1 and Rust 1.101.0-nightly.
All three shuffled process passes requested 200,000 iterations, with fixture
scaling above. Native CPU tuning applies to Goose/C++ and Rust. Requested and
observed release profiles, source hashes and executable hashes are retained.

This shared desktop had no exclusive CPU reservation or fixed frequency/turbo.
The independent review used CPU 5; other work could continue. Child CPU time was
99.1–99.7% of wall time, a scheduling diagnostic rather than
a correction. All 3,276 batch averages are retained; close results can overlap.
Control differences illustrate variability and code-path/layout effects. These
synthetic cases support neither a universal ranking nor a significance claim.

### Decode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 74.4 | 188.9 | 105.5 |
| Escaped / Unicode | 143.8 | 355.6 | 238.7 |
| 1,024 nonnegative integers | 7,753.8 | 19,948.1 | 14,639.1 |
| 1,024 signed small integers | 7,354.0 | 19,390.3 | 14,286.9 |
| 1,024 wide integers | 21,676.5 | 24,005.3 | 30,222.9 |
| Mixed event | 1,669.6 | 2,988.0 | 3,053.6 |
| 256 simple floats | 3,310.1 | 5,442.4 | 4,876.9 |
| 256 wide-exponent floats | 5,942.0 | 10,437.4 | 14,324.2 |
| 64-byte ASCII text | 93.8 | 137.2 | 108.6 |
| 8 KiB sparse escapes | 1,238.6 | 1,944.0 | 2,246.3 |
| 8 KiB ASCII text | 878.2 | 1,192.2 | 1,472.1 |
| Dense escapes / Unicode | 10,979.4 | 16,075.6 | 20,499.4 |
| 16 reversed fields | 317.0 | 697.9 | 694.2 |

### Encode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 35.2 | 58.0 | 51.5 |
| Escaped / Unicode | 70.0 | 128.8 | 73.0 |
| 1,024 nonnegative integers | 3,983.2 | 7,174.0 | 6,986.6 |
| 1,024 signed small integers | 4,881.5 | 6,485.5 | 6,089.0 |
| 1,024 wide integers | 18,909.8 | 12,252.5 | 12,414.8 |
| Mixed event | 1,845.8 | 2,255.0 | 1,700.9 |
| 256 simple floats | 7,379.0 | 10,146.6 | 6,264.4 |
| 256 wide-exponent floats | 8,147.5 | 11,146.2 | 6,477.5 |
| 64-byte ASCII text | 38.0 | 97.6 | 72.6 |
| 8 KiB sparse escapes | 1,179.7 | 499.6 | 3,957.7 |
| 8 KiB ASCII text | 546.0 | 446.7 | 3,390.9 |
| Dense escapes / Unicode | 7,779.9 | 7,266.0 | 6,863.5 |
| 16 reversed fields | 124.9 | 319.0 | 327.7 |

### Fixed-release controls

Both revisions use the expanded harness and the same production codec.

| Fixture | Decode release → current | Encode release → current |
| --- | ---: | ---: | ---: |
| Small record | 76.7 → 74.4 | 36.4 → 35.2 |
| Escaped / Unicode | 149.4 → 143.8 | 69.1 → 70.0 |
| 1,024 nonnegative integers | 7,780.8 → 7,753.8 | 4,329.2 → 3,983.2 |
| 1,024 signed small integers | 7,593.0 → 7,354.0 | 4,850.9 → 4,881.5 |
| 1,024 wide integers | 22,584.4 → 21,676.5 | 19,331.9 → 18,909.8 |
| Mixed event | 1,637.8 → 1,669.6 | 1,868.9 → 1,845.8 |
| 256 simple floats | 3,691.6 → 3,310.1 | 8,233.2 → 7,379.0 |
| 256 wide-exponent floats | 6,109.1 → 5,942.0 | 8,189.2 → 8,147.5 |
| 64-byte ASCII text | 84.9 → 93.8 | 34.9 → 38.0 |
| 8 KiB sparse escapes | 1,237.7 → 1,238.6 | 1,220.1 → 1,179.7 |
| 8 KiB ASCII text | 1,199.7 → 878.2 | 772.2 → 546.0 |
| Dense escapes / Unicode | 11,211.7 → 10,979.4 | 8,000.1 → 7,779.9 |
| 16 reversed fields | 320.7 → 317.0 | 130.2 → 124.9 |

### Different APIs and formats

Protobuf and borrowing DOM have separate contracts; neither is a like-for-like
typed JSON implementation. DOM cannot losslessly represent every wide i64;
negative Protobuf int64 values use ten-byte varints (not zigzag sint64).

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 53.7 / 25.5 | 54.7 |
| Escaped / Unicode | 62 / 24 | 51.5 / 22.5 | 95.1 |
| 1,024 nonnegative integers | 4022 / 1923 | 4,171.7 / 6,768.8 | 12,168.3 |
| 1,024 signed small integers | 4538 / 6083 | 5,173.4 / 14,937.6 | 12,361.2 |
| 1,024 wide integers | 19771 / 9669 | 6,696.8 / 21,842.2 | 34,601.6 |
| Mixed event | 1187 / 954 | 943.4 / 402.3 | 1,946.5 |
| 256 simple floats | 1581 / 2051 | 701.2 / 275.1 | 3,170.0 |
| 256 wide-exponent floats | 5975 / 2051 | 847.5 / 279.5 | 10,762.8 |
| 64-byte ASCII text | 97 / 70 | 42.6 / 24.4 | 98.9 |
| 8 KiB sparse escapes | 8233 / 8205 | 506.0 / 252.0 | 9,687.6 |
| 8 KiB ASCII text | 8225 / 8199 | 489.8 / 268.5 | 4,900.8 |
| Dense escapes / Unicode | 8737 / 6663 | 8,106.7 / 266.5 | 11,575.3 |
| 16 reversed fields | 135 / 31 | 104.4 / 98.2 | 238.1 |
