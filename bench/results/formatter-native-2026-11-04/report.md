# Historical formatter-isolation report

## Recorded native results

Measured 2026-11-04 on an Intel Core Ultra 7 258V, CPU 4, Linux x86-64;
GCC/G++ 16.2.1, Rust 1.101.0-nightly and pinned Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`. Each process requested 200,000
iterations, with fixture-specific divisors above. Candidate:
`ca9b0dce42061c38e72d05233ee229874dc5b682`; baseline:
`0c26308570cbe2c6769c1bf0eba8d86e7e8ad681`. This measures the formatter-isolation
fix, including the small-integer path, against the previous public codec.
See [full provenance](metadata.json).

Both Goose revisions use the same harness, fresh native cache and controlled
release flags. Rust's requested release configuration and observed executable
profile are recorded separately; optimization is 3, assertions/overflow checks
are off, and incremental compilation is disabled. No sanitizers are enabled.

This was a shared desktop host without a reserved core. Timed children were
pinned to CPU 4; an independent review used CPU 5 and other work could continue.
CPU frequency/turbo were not fixed. Child CPU time was
99.0–99.7% of wall time; this is a scheduling diagnostic,
not a correction or evidence of statistical significance. Do not compare absolute
numbers across this recording and the older CPU 2 series as a codec speedup.

### Decode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 73.0 | 178.6 | 105.3 |
| Escaped / Unicode | 140.0 | 293.9 | 209.2 |
| 1,024 integers | 9,410.1 | 18,665.4 | 12,954.9 |
| 256 simple floats | 3,312.5 | 5,436.0 | 5,172.5 |
| 256 wide-exponent floats | 6,191.4 | 10,511.1 | 15,091.3 |
| 64-byte ASCII text | 80.6 | 129.2 | 110.4 |
| 8 KiB sparse escapes | 1,430.7 | 1,623.9 | 2,188.6 |
| 8 KiB ASCII text | 885.9 | 1,154.1 | 1,574.6 |
| Dense escapes / Unicode | 10,136.6 | 14,946.3 | 19,276.3 |
| 16 reversed fields | 332.4 | 665.9 | 525.3 |

### Encode

Median ns/op across all three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 36.7 | 53.7 | 51.5 |
| Escaped / Unicode | 69.6 | 113.2 | 64.2 |
| 1,024 integers | 4,392.1 | 6,915.4 | 6,338.4 |
| 256 simple floats | 7,548.8 | 9,869.5 | 6,238.3 |
| 256 wide-exponent floats | 8,548.9 | 11,083.7 | 6,253.9 |
| 64-byte ASCII text | 35.6 | 97.4 | 85.4 |
| 8 KiB sparse escapes | 1,272.6 | 469.3 | 6,691.4 |
| 8 KiB ASCII text | 566.4 | 455.4 | 6,437.6 |
| Dense escapes / Unicode | 7,808.8 | 5,633.0 | 9,054.0 |
| 16 reversed fields | 117.1 | 297.8 | 296.5 |

### Matched changes

Previous public codec → candidate, ns/op. All ten fixtures and both operations are retained.

| Fixture | Decode before → after | Encode before → after |
| --- | ---: | ---: | ---: |
| Small record | 93.0 → 73.0 | 33.3 → 36.7 |
| Escaped / Unicode | 136.1 → 140.0 | 68.3 → 69.6 |
| 1,024 integers | 9,268.8 → 9,410.1 | 4,325.1 → 4,392.1 |
| 256 simple floats | 3,490.7 → 3,312.5 | 7,833.8 → 7,548.8 |
| 256 wide-exponent floats | 5,904.4 → 6,191.4 | 8,007.7 → 8,548.9 |
| 64-byte ASCII text | 71.2 → 80.6 | 30.7 → 35.6 |
| 8 KiB sparse escapes | 1,401.3 → 1,430.7 | 1,220.2 → 1,272.6 |
| 8 KiB ASCII text | 864.9 → 885.9 | 547.0 → 566.4 |
| Dense escapes / Unicode | 9,865.4 → 10,136.6 | 7,122.9 → 7,808.8 |
| 16 reversed fields | 282.8 → 332.4 | 162.5 → 117.1 |

Wide-record encoding takes about 27.9% less time in these medians. Integer-array
encoding is 1.5% slower; small-record encoding is 10.2% slower, short-text encoding
16.0% slower, wide-float encoding 6.8% slower and dense-text encoding 9.6% slower.
These regressions remain visible alongside improvements. The native float and
string kernels did not change, but whole-program code layout and shared-host
frequency/cache effects can affect API timings. Close results can overlap; no
universal ranking, production-latency or statistical-significance claim follows.

### Different APIs and formats

Binary Protobuf and borrowing DOM use different formats/contracts; these are
separate comparisons, not like-for-like typed JSON implementations.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 39.3 / 22.8 | 57.9 |
| Escaped / Unicode | 62 / 24 | 48.3 / 22.2 | 98.9 |
| 1,024 integers | 4022 / 1923 | 2,993.9 / 5,930.4 | 12,900.9 |
| 256 simple floats | 1581 / 2051 | 520.9 / 276.8 | 3,312.0 |
| 256 wide-exponent floats | 5975 / 2051 | 529.9 / 283.0 | 11,364.6 |
| 64-byte ASCII text | 97 / 70 | 39.8 / 22.9 | 91.8 |
| 8 KiB sparse escapes | 8233 / 8205 | 478.3 / 241.8 | 10,508.5 |
| 8 KiB ASCII text | 8225 / 8199 | 471.1 / 242.5 | 5,068.1 |
| Dense escapes / Unicode | 8737 / 6663 | 5,490.6 / 214.8 | 13,056.2 |
| 16 reversed fields | 135 / 31 | 99.3 / 93.0 | 269.1 |
