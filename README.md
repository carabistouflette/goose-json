# goose-json

Read JSON into Goose structs and write them back. Field names come from your
struct definition; decoded strings and arrays own their storage.

[API reference](docs/api.md) · [Benchmarks](bench/README.md) · [Contributing](CONTRIBUTING.md)

## Usage

Save this as `main.goose` and run `goose run main.goose`:

```goose
import json_codec from "carabistouflette/goose-json@52473a635952b12eddbb78b4d241b24d3d9f0b21";

struct Item { id: i64, active: bool, name: json_codec::Text }

fn main() {
    let input = "{\"id\":42,\"active\":true,\"name\":\"Goose\"}";
    var item, error = json_codec::deserialize<Item>(input);
    if error.len > 0 { print(error); return; }

    let text, write_error = json_codec::serialize(item);
    if write_error.len > 0 { print(write_error); return; }
    print(text);
}
```

Output:

```json
{"id":42,"active":true,"name":"Goose"}
```

**Requirements:** Goose ([tested compiler](GOOSE_REVISION)), CMake and a C++17
compiler with its runtime. These build dependencies also apply to `goose run`.
Tested on Linux x86-64 with GCC and Clang; other platforms are unverified.
The API is experimental; the example pins a published commit.
See the [changelog](CHANGELOG.md) for release notes.

## Supported types

| Goose type | JSON value |
| --- | --- |
| Structs and nested structs | Objects |
| `json_codec::Text` | UTF-8 strings |
| `i64` | Integers |
| Finite `f64` | Numbers |
| `bool` | Booleans |
| `i64[>..]`, `f64[>..]`, `bool[>..]` | Arrays |

Every field is required. Missing, duplicate and unknown fields are errors.
Invalid UTF-8, out-of-range integers and non-finite floats are rejected.
Maps, optional fields, enums and arrays of records or text are not supported yet.

Check every returned error. Discard a partially decoded value after failure;
serialization failures return empty output. For `root struct` destinations,
scalars and arrays, use `deserialize_into(input, destination)`.

[Full API contract, ownership rules and limits →](docs/api.md)

## Performance

These owned-result API microbenchmarks cover thirteen fixtures, including
signed/large integers and a mixed event. Some cases remain faster in the compared
libraries. Binary Protobuf and borrowing DOM results have separate contracts.

Times are **microseconds per operation**, lower is better: medians of three
process passes on a Core Ultra 7 258V, CPU4, with native CPU tuning. The release
rerun measures `52473a6` against fixed `v0.1.2`, with all thirteen fixtures shown.
Every sample is retained. Two baseline passes lost more CPU scheduling time
than the candidate, which can favor current results. The shared host had no
exclusive reservation or fixed frequency; no reliable ranking is claimed.
[Matched changes, raw data and limitations](bench/README.md#recorded-native-results).

<details>
<summary>Decode timings — all thirteen fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.113 | 0.281 | 0.113 |
| Escaped / Unicode | 0.228 | 0.323 | 0.248 |
| 1,024 nonnegative integers | 11.467 | 26.372 | 16.503 |
| 1,024 signed small integers | 10.082 | 19.387 | 16.114 |
| 1,024 wide integers | 32.243 | 30.750 | 36.127 |
| Mixed event | 2.532 | 3.714 | 4.686 |
| 256 simple floats | 4.886 | 8.035 | 6.963 |
| 256 wide-exponent floats | 8.532 | 15.962 | 22.669 |
| 64-byte ASCII text | 0.117 | 0.231 | 0.171 |
| 8 KiB sparse escapes | 1.583 | 2.637 | 3.311 |
| 8 KiB ASCII text | 1.199 | 1.907 | 2.275 |
| Dense escapes / Unicode | 14.479 | 24.369 | 26.196 |
| 16 reversed fields | 0.436 | 1.017 | 0.833 |

</details>

<details>
<summary>Encode timings — all thirteen fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.051 | 0.065 | 0.056 |
| Escaped / Unicode | 0.109 | 0.110 | 0.077 |
| 1,024 nonnegative integers | 6.149 | 9.756 | 8.341 |
| 1,024 signed small integers | 5.196 | 6.738 | 6.482 |
| 1,024 wide integers | 15.424 | 16.748 | 16.735 |
| Mixed event | 2.688 | 3.197 | 2.476 |
| 256 simple floats | 10.818 | 14.677 | 8.967 |
| 256 wide-exponent floats | 12.070 | 17.592 | 9.719 |
| 64-byte ASCII text | 0.050 | 0.155 | 0.115 |
| 8 KiB sparse escapes | 1.512 | 0.743 | 5.720 |
| 8 KiB ASCII text | 0.743 | 0.711 | 5.514 |
| Dense escapes / Unicode | 11.859 | 8.927 | 10.454 |
| 16 reversed fields | 0.152 | 0.463 | 0.400 |

</details>

[Full comparisons, regressions, Protobuf results and reproduction steps →](bench/README.md)

## Development

```sh
make setup                   # build the pinned Goose compiler
make check test test-debug test-portable  # normal/debug and portable paths
make test-native CXX=clang++  # native ASan/UBSan checks
```

Building Goose from source requires Git, Make, CMake 3.27+ and a C/C++20 toolchain.
Linux's in-process runner also needs libc development headers. With an installed
compiler, use `make GOOSE=/path/to/goose check test test-debug test-portable`.

See [contribution guidelines](CONTRIBUTING.md) for commit conventions and checks,
and [native build details](native/README.md) for dependencies and cache refreshes.
The [validation record](docs/validation.md) describes the completed checks and
independent reviews.

Report vulnerabilities privately through the [security policy](SECURITY.md).

## License

[Apache-2.0](LICENSE). Vendored dependency notices are in [NOTICE](NOTICE).
