# goose-json

Read JSON into Goose structs and write them back. Field names come from your
struct definition; decoded strings and arrays own their storage.

[API reference](docs/api.md) · [Benchmarks](bench/README.md) · [Contributing](CONTRIBUTING.md)

## Usage

Save this as `main.goose` and run `goose run main.goose`:

```goose
import json_codec from "carabistouflette/goose-json@6fad097cef35c0623b45e96e84246de6b0a64a70";

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

The latest matched run reduced sparse-text decoding time by about 54%
and encoding time by about 51% compared with the previous codec. Results vary by
workload; some cases remain faster in the compared libraries.

Times below are **microseconds per operation**, lower is better. These are
medians from three process passes on a Core Ultra 7 258V with native CPU tuning.
They describe this corpus and machine; close timings can overlap.

<details>
<summary>Decode timings — all ten fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.116 | 0.176 | 0.159 |
| Escaped / Unicode | 0.214 | 0.301 | 0.313 |
| 1,024 integers | 9.274 | 16.875 | 14.618 |
| 256 simple floats | 4.480 | 7.114 | 7.054 |
| 256 wide-exponent floats | 8.252 | 15.545 | 22.115 |
| 64-byte ASCII text | 0.113 | 0.197 | 0.181 |
| 8 KiB sparse escapes | 1.076 | 1.575 | 2.784 |
| 8 KiB ASCII text | 0.848 | 1.096 | 2.200 |
| Dense escapes / Unicode | 12.634 | 12.931 | 23.584 |
| 16 reversed fields | 0.765 | 0.949 | 1.484 |

</details>

<details>
<summary>Encode timings — all ten fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.043 | 0.075 | 0.073 |
| Escaped / Unicode | 0.097 | 0.143 | 0.092 |
| 1,024 integers | 5.392 | 7.794 | 7.813 |
| 256 simple floats | 9.452 | 10.275 | 9.722 |
| 256 wide-exponent floats | 10.551 | 10.207 | 9.572 |
| 64-byte ASCII text | 0.043 | 0.135 | 0.129 |
| 8 KiB sparse escapes | 0.951 | 0.634 | 4.811 |
| 8 KiB ASCII text | 0.492 | 0.537 | 4.581 |
| Dense escapes / Unicode | 9.671 | 8.368 | 12.099 |
| 16 reversed fields | 0.183 | 0.403 | 0.404 |

</details>

[Full comparisons, regressions, Protobuf results and reproduction steps →](bench/README.md)

## Development

```sh
make setup                   # build the pinned Goose compiler
make check test test-debug    # formatting, normal tests and debug checks
make test-native CXX=clang++  # native ASan/UBSan checks
```

Building Goose from source requires Git, Make, CMake 3.27+ and a C/C++20 toolchain.
Linux's in-process runner also needs libc development headers. With an installed
compiler, use `make GOOSE=/path/to/goose check test test-debug`.

See [contribution guidelines](CONTRIBUTING.md) for commit conventions and checks,
and [native build details](native/README.md) for dependencies and cache refreshes.
The [validation record](docs/validation.md) describes the completed checks and
independent reviews.

Report vulnerabilities privately through the [security policy](SECURITY.md).

## License

[Apache-2.0](LICENSE). Vendored dependency notices are in [NOTICE](NOTICE).
