# goose-json

Read JSON into Goose structs and write them back. Field names come from your
struct definition; decoded strings and arrays own their storage.

[API reference](docs/api.md) · [Benchmarks](bench/README.md) · [Contributing](CONTRIBUTING.md)

## Usage

Save this as `main.goose` and run `goose run main.goose`:

```goose
import json_codec from "carabistouflette/goose-json@f6409122724d371e679ccd5cc27ea842097f895b";

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

The latest matched run reduced 8 KiB ASCII encoding time by about 22% compared
with the previous codec. Results vary by workload: sparse-text handling and some
encoding cases remain faster in the compared libraries.

Times below are **microseconds per operation**, lower is better. These are
medians from three process passes on a Core Ultra 7 258V with native CPU tuning.
They describe this corpus and machine; close timings can overlap.

<details>
<summary>Decode timings — all ten fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.115 | 0.170 | 0.162 |
| Escaped / Unicode | 0.214 | 0.315 | 0.302 |
| 1,024 integers | 9.595 | 17.182 | 14.827 |
| 256 simple floats | 4.955 | 7.199 | 7.135 |
| 256 wide-exponent floats | 8.659 | 15.915 | 22.187 |
| 64-byte ASCII text | 0.116 | 0.189 | 0.175 |
| 8 KiB sparse escapes | 2.389 | 1.584 | 2.764 |
| 8 KiB ASCII text | 0.859 | 1.065 | 2.184 |
| Dense escapes / Unicode | 13.222 | 13.078 | 22.557 |
| 16 reversed fields | 0.794 | 0.920 | 1.501 |

</details>

<details>
<summary>Encode timings — all ten fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.044 | 0.072 | 0.070 |
| Escaped / Unicode | 0.103 | 0.155 | 0.092 |
| 1,024 integers | 5.888 | 7.963 | 7.879 |
| 256 simple floats | 10.587 | 10.065 | 10.051 |
| 256 wide-exponent floats | 11.007 | 9.628 | 8.927 |
| 64-byte ASCII text | 0.043 | 0.133 | 0.127 |
| 8 KiB sparse escapes | 1.995 | 0.635 | 4.808 |
| 8 KiB ASCII text | 0.502 | 0.542 | 4.517 |
| Dense escapes / Unicode | 9.803 | 8.411 | 12.290 |
| 16 reversed fields | 0.193 | 0.401 | 0.404 |

</details>

[Full comparisons, regressions, Protobuf results and reproduction steps →](bench/README.md)

## Development

```sh
make setup              # build the pinned Goose compiler
make check test         # check formatting and run tests
make test-native CXX=clang++  # native ASan/UBSan checks
```

Building Goose from source requires Git, Make, CMake 3.27+ and a C/C++20 toolchain.
Linux's in-process runner also needs libc development headers. With an installed
compiler, use `make GOOSE=/path/to/goose check test`.

See [contribution guidelines](CONTRIBUTING.md) for commit conventions and checks,
and [native build details](native/README.md) for dependencies and cache refreshes.
The [validation record](docs/validation.md) describes the completed checks and
independent reviews.

Report vulnerabilities privately through the [security policy](SECURITY.md).

## License

[Apache-2.0](LICENSE). Vendored dependency notices are in [NOTICE](NOTICE).
