# goose-json

Read JSON into Goose structs and write them back. Field names come from your
struct definition; decoded strings and arrays own their storage.

[API reference](docs/api.md) · [Benchmarks](bench/README.md) · [Contributing](CONTRIBUTING.md)

## Usage

Save this as `main.goose` and run `goose run main.goose`:

```goose
import json_codec from "carabistouflette/goose-json@e91a5ccf910b1910934e8c1b9a245d9449581c65";

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
process passes on a Core Ultra 7 258V, CPU 4, with native CPU tuning. This is a
shared-host synthetic corpus; close timings can overlap. These tables measure
the expanded harness against fixed `v0.1.1`, with identical codec sources in
that recording. The later portable-float correction has no new timing claims.
[Provenance and profiles](bench/results/corpus-native-2026-11-04) are retained.

<details>
<summary>Decode timings — all thirteen fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.074 | 0.189 | 0.105 |
| Escaped / Unicode | 0.144 | 0.356 | 0.239 |
| 1,024 nonnegative integers | 7.754 | 19.948 | 14.639 |
| 1,024 signed small integers | 7.354 | 19.390 | 14.287 |
| 1,024 wide integers | 21.677 | 24.005 | 30.223 |
| Mixed event | 1.670 | 2.988 | 3.054 |
| 256 simple floats | 3.310 | 5.442 | 4.877 |
| 256 wide-exponent floats | 5.942 | 10.437 | 14.324 |
| 64-byte ASCII text | 0.094 | 0.137 | 0.109 |
| 8 KiB sparse escapes | 1.239 | 1.944 | 2.246 |
| 8 KiB ASCII text | 0.878 | 1.192 | 1.472 |
| Dense escapes / Unicode | 10.979 | 16.076 | 20.499 |
| 16 reversed fields | 0.317 | 0.698 | 0.694 |

</details>

<details>
<summary>Encode timings — all thirteen fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.035 | 0.058 | 0.051 |
| Escaped / Unicode | 0.070 | 0.129 | 0.073 |
| 1,024 nonnegative integers | 3.983 | 7.174 | 6.987 |
| 1,024 signed small integers | 4.881 | 6.486 | 6.089 |
| 1,024 wide integers | 18.910 | 12.252 | 12.415 |
| Mixed event | 1.846 | 2.255 | 1.701 |
| 256 simple floats | 7.379 | 10.147 | 6.264 |
| 256 wide-exponent floats | 8.148 | 11.146 | 6.478 |
| 64-byte ASCII text | 0.038 | 0.098 | 0.073 |
| 8 KiB sparse escapes | 1.180 | 0.500 | 3.958 |
| 8 KiB ASCII text | 0.546 | 0.447 | 3.391 |
| Dense escapes / Unicode | 7.780 | 7.266 | 6.864 |
| 16 reversed fields | 0.125 | 0.319 | 0.328 |

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
