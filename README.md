# goose-json

Read JSON into Goose structs and write them back. Field names come from your
struct definition; decoded strings and arrays own their storage.

[API reference](docs/api.md) · [Benchmarks](bench/README.md) · [Contributing](CONTRIBUTING.md)

## Usage

Save this as `main.goose` and run `goose run main.goose`:

```goose
import json_codec from "carabistouflette/goose-json@06622d495175842914f7381b72fd6d855733acc3";

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
process passes on a Core Ultra 7 258V, CPU 4, with native CPU tuning. Source
`06622d4` is measured against fixed `v0.1.2`; all thirteen fixtures are shown.
Wide-integer encoding took less time in each matched pass. The final pass had
substantial CPU contention; every sample is retained. This shared-host synthetic
corpus does not establish a reliable cross-library ranking.
[Matched changes, raw data and limitations](bench/README.md#recorded-native-results).

<details>
<summary>Decode timings — all thirteen fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.121 | 0.230 | 0.115 |
| Escaped / Unicode | 0.224 | 0.475 | 0.323 |
| 1,024 nonnegative integers | 11.420 | 28.044 | 19.681 |
| 1,024 signed small integers | 12.043 | 28.151 | 20.245 |
| 1,024 wide integers | 33.276 | 33.794 | 45.978 |
| Mixed event | 2.578 | 4.315 | 4.711 |
| 256 simple floats | 5.060 | 8.856 | 8.444 |
| 256 wide-exponent floats | 8.832 | 16.221 | 21.459 |
| 64-byte ASCII text | 0.122 | 0.218 | 0.161 |
| 8 KiB sparse escapes | 2.042 | 2.664 | 3.323 |
| 8 KiB ASCII text | 1.339 | 1.835 | 2.253 |
| Dense escapes / Unicode | 14.762 | 22.900 | 32.828 |
| 16 reversed fields | 0.493 | 1.019 | 0.863 |

</details>

<details>
<summary>Encode timings — all thirteen fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.055 | 0.077 | 0.057 |
| Escaped / Unicode | 0.105 | 0.168 | 0.100 |
| 1,024 nonnegative integers | 6.105 | 10.690 | 9.370 |
| 1,024 signed small integers | 6.157 | 9.187 | 9.250 |
| 1,024 wide integers | 16.843 | 19.163 | 17.351 |
| Mixed event | 2.770 | 3.213 | 2.573 |
| 256 simple floats | 11.517 | 17.743 | 10.103 |
| 256 wide-exponent floats | 12.011 | 16.317 | 9.600 |
| 64-byte ASCII text | 0.051 | 0.147 | 0.108 |
| 8 KiB sparse escapes | 1.994 | 0.728 | 5.947 |
| 8 KiB ASCII text | 0.833 | 0.709 | 5.247 |
| Dense escapes / Unicode | 11.575 | 8.545 | 10.491 |
| 16 reversed fields | 0.176 | 0.449 | 0.469 |

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
