# Historical sparse-run recording

## Recorded native results

Measured 2026-11-04 on an Intel Core Ultra 7 258V, CPU 2, Linux x86-64;
GCC/G++ 16.2.1, Rust 1.101.0-nightly and Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`. Each process requested 200,000
iterations, with fixture-specific divisors described above. Full provenance is
in [metadata.json](metadata.json).

Measured candidate: `6fad097cef35c0623b45e96e84246de6b0a64a70`. Baseline: `ce1f8066fd18de466cc78800202452b7d0fcd9c0`.
Later documentation and test/CI changes do not alter the measured codec. The
Makefile has since gained a debug-test target; its benchmark targets and flags
are unchanged. Both measured builds use
the same controlled environment, fresh native cache and release flags; sanitizer
and fuzz instrumentation are disabled.

A later Unicode-decoder cleanup and native contract comments produced
byte-identical native objects with GCC and Clang in default and native Release
profiles; see the [maintainability checks](../../../docs/validation.md#maintainability-cleanup).
The timings here still refer to the measured commit above.

The later recorder profile audit fixed inherited Cargo settings that could
silently change future comparison builds. All six historical recordings with
Cargo profile metadata report optimization 3 with assertions/overflow checks off.
Earlier records do not contain the new full requested-profile field; they remain
unchanged historical measurements, not reruns under the newer recorder.

The previous SQLite matched series completed before this CPU 2 window began.
Sibling owners agreed to keep new heavy jobs off CPU 2; other-core validation
continued. Our fuzzing and independent review had finished before timing.
This was best-effort coordination on a shared desktop host, not exclusive core
or machine isolation. CPU frequency/turbo were not fixed. Per-process child CPU
time was 95.2–99.8% of wall time. That diagnostic does not normalize or correct
ns/op and does not establish statistical significance.

### Decode

Median ns/op across three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 115.8 | 175.7 | 158.6 |
| Escaped / Unicode | 214.5 | 301.0 | 312.8 |
| 1,024 integers | 9,274.1 | 16,875.3 | 14,617.7 |
| 256 simple floats | 4,480.1 | 7,114.3 | 7,054.3 |
| 256 wide-exponent floats | 8,251.9 | 15,545.0 | 22,114.7 |
| 64-byte ASCII text | 112.8 | 197.0 | 181.0 |
| 8 KiB sparse escapes | 1,075.9 | 1,574.6 | 2,784.4 |
| 8 KiB ASCII text | 847.5 | 1,096.4 | 2,200.0 |
| Dense escapes / Unicode | 12,634.4 | 12,930.8 | 23,584.2 |
| 16 reversed fields | 765.2 | 948.9 | 1,484.4 |

### Encode

Median ns/op across three process-pass medians; lower is better.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 42.5 | 75.0 | 73.3 |
| Escaped / Unicode | 97.2 | 143.0 | 92.3 |
| 1,024 integers | 5,391.7 | 7,793.6 | 7,812.6 |
| 256 simple floats | 9,452.4 | 10,275.3 | 9,721.9 |
| 256 wide-exponent floats | 10,550.6 | 10,206.8 | 9,572.4 |
| 64-byte ASCII text | 42.6 | 134.6 | 129.3 |
| 8 KiB sparse escapes | 950.9 | 634.1 | 4,811.1 |
| 8 KiB ASCII text | 492.1 | 537.4 | 4,580.9 |
| Dense escapes / Unicode | 9,671.5 | 8,368.2 | 12,099.2 |
| 16 reversed fields | 183.4 | 403.4 | 404.3 |

### Matched changes

Previous native codec → candidate, ns/op. All ten fixtures are included.

| Fixture | Decode before → after | Encode before → after |
| --- | ---: | ---: |
| Small record | 111.2 → 115.8 | 43.0 → 42.5 |
| Escaped / Unicode | 196.1 → 214.5 | 93.9 → 97.2 |
| 1,024 integers | 9,350.3 → 9,274.1 | 5,525.3 → 5,391.7 |
| 256 simple floats | 5,067.6 → 4,480.1 | 10,717.2 → 9,452.4 |
| 256 wide-exponent floats | 8,522.6 → 8,251.9 | 11,005.2 → 10,550.6 |
| 64-byte ASCII text | 116.2 → 112.8 | 44.2 → 42.6 |
| 8 KiB sparse escapes | 2,318.2 → 1,075.9 | 1,927.7 → 950.9 |
| 8 KiB ASCII text | 844.0 → 847.5 | 499.5 → 492.1 |
| Dense escapes / Unicode | 12,803.8 → 12,634.4 | 9,625.6 → 9,671.5 |
| 16 reversed fields | 785.4 → 765.2 | 187.8 → 183.4 |

Sparse-text decoding takes about 53.6% less time and encoding about
50.7% less time in these medians. Plain spans between escapes are coalesced into
bounded scans and copies instead of copying each 32-byte block separately.
A local decimal-conversion helper preserves the existing C ABI and Dragonbox
policies. Simple-float encoding takes about 11.8% less time here.
UTF-8 validation, buffer bounds, numeric spelling and ownership are unchanged.

Small escaped-record decoding is 9.4% slower (196.1 → 214.5 ns/op), and
encoding 3.5% slower. Small-record decoding is 4.1% slower; dense-text encoding
is 0.5% slower. All regressions are visible in the matched table, including
operations whose production path did not change. Small differences can reflect run/batch noise,
code layout, scheduling or frequency changes. Competitor results remain
workload-dependent; the tables support neither a universal ranking nor a
statistical-significance claim. See all raw samples before interpreting close
results.

### Different APIs and formats

Binary Protobuf and borrowing DOM results below are separate comparisons, not
like-for-like typed JSON implementations. Their semantics are described above.

| Fixture | JSON / Protobuf input bytes | Protobuf decode / encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
| Small record | 38 / 11 | 60.2 / 39.7 | 115.3 |
| Escaped / Unicode | 62 / 24 | 68.6 / 34.6 | 155.3 |
| 1,024 integers | 4022 / 1923 | 4,424.6 / 6,965.4 | 23,715.3 |
| 256 simple floats | 1581 / 2051 | 859.8 / 582.0 | 6,277.7 |
| 256 wide-exponent floats | 5975 / 2051 | 850.9 / 546.9 | 16,941.4 |
| 64-byte ASCII text | 97 / 70 | 61.5 / 40.6 | 171.8 |
| 8 KiB sparse escapes | 8233 / 8205 | 521.5 / 183.0 | 14,462.1 |
| 8 KiB ASCII text | 8225 / 8199 | 543.4 / 183.6 | 7,052.6 |
| Dense escapes / Unicode | 8737 / 6663 | 8,260.5 / 157.9 | 14,302.7 |
| 16 reversed fields | 135 / 31 | 133.8 / 144.0 | 425.9 |
