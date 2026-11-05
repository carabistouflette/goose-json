# Workloads

[Results](RESULTS.md) · [Method](README.md)

These are fixed synthetic shapes, not captured production traffic. Every
implementation reads the same JSON bytes. Input lengths below include any
trailing newline; canonical encoded output may be shorter or use different
valid number spellings. Full fixture values and finite float bits are checked
before timing. Source hashes are in the recorded metadata.

| Fixture | JSON input bytes | Shape |
| --- | ---: | --- |
| `plain` | 38 | Small record: i64 id, bool, owned text |
| `escaped` | 62 | Same record with escapes and Unicode; canonical output is 54 bytes |
| `array` | 4,022 | 1,024 integers from 0 to 1,023 |
| `array-signed` | 4,538 | 1,024 alternating-sign integers with magnitudes 1 to 1,024 |
| `array-wide` | 19,771 | 1,024 signed integers with i64 limits, decimal boundaries and large magnitudes |
| `mixed` | 1,187 | i64-limit id, bool, difficult decimal, nested region/label, 16 counters, 32 float samples, flags and escaped text; reverse member order |
| `floats` | 1,581 | 256 dyadic values `(i - 128) / 8`; exact binary fractions, not a difficult-decimal corpus |
| `floats-wide` | 5,975 | 256 finite values across binary exponents; long significands and small/large magnitudes |
| `text-short` | 97 | A 64-byte ASCII field, covering the native writer threshold |
| `text-sparse` | 8,233 | 8 KiB ASCII with one newline, one quote and a Unicode suffix |
| `text-ascii` | 8,225 | An 8 KiB ASCII field |
| `text-escaped` | 8,737 | 512 repeats of controls, quotes, backslashes and Unicode |
| `wide` | 135 | 16 integer fields supplied in reverse declaration order |

The exact integer/mixed formulas are in [fixtures.py](fixtures.py). The wide-float
formula is checked in both [the Goose](bench.goose) and
[Rust harness](compare/src/main.rs): mantissa
`((i * 2654435761) % 1000003 + 1) / 1000003.0`, multiplied by
`2^((i * 37) % 2045 - 1022)`, with alternating signs. The first and last values
are 0.125 and 1.25 for bounded consumption. This does not sample every f64 value
or model a typical application's number distribution.

Read the existing [fixtures](fixtures) or verify the generated subset without
rewriting anything:

```sh
python3 bench/fixtures.py --check
```

`python3 bench/fixtures.py` regenerates only `array-signed`, `array-wide` and
`mixed`. Other fixtures are retained files; it is not a generator for the entire
corpus. Malformed-input, rounding and ownership checks live in the test suite,
not the performance corpus.
