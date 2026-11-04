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

These owned-result API microbenchmarks compare pinned JSON implementations on
all ten fixtures. Some cases remain faster in the compared libraries. Binary
Protobuf and borrowing DOM results use separate contracts and are linked below.

Times are **microseconds per operation**, lower is better: medians of three
process passes on a Core Ultra 7 258V, CPU 4, with native CPU tuning. This is a
shared-host synthetic corpus; close timings can overlap. Measured source
`ca9b0dc` includes formatter isolation; historical results remain available.

<details>
<summary>Decode timings — all ten fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.073 | 0.179 | 0.105 |
| Escaped / Unicode | 0.140 | 0.294 | 0.209 |
| 1,024 integers | 9.410 | 18.665 | 12.955 |
| 256 simple floats | 3.312 | 5.436 | 5.173 |
| 256 wide-exponent floats | 6.191 | 10.511 | 15.091 |
| 64-byte ASCII text | 0.081 | 0.129 | 0.110 |
| 8 KiB sparse escapes | 1.431 | 1.624 | 2.189 |
| 8 KiB ASCII text | 0.886 | 1.154 | 1.575 |
| Dense escapes / Unicode | 10.137 | 14.946 | 19.276 |
| 16 reversed fields | 0.332 | 0.666 | 0.525 |

</details>

<details>
<summary>Encode timings — all ten fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.037 | 0.054 | 0.051 |
| Escaped / Unicode | 0.070 | 0.113 | 0.064 |
| 1,024 integers | 4.392 | 6.915 | 6.338 |
| 256 simple floats | 7.549 | 9.870 | 6.238 |
| 256 wide-exponent floats | 8.549 | 11.084 | 6.254 |
| 64-byte ASCII text | 0.036 | 0.097 | 0.085 |
| 8 KiB sparse escapes | 1.273 | 0.469 | 6.691 |
| 8 KiB ASCII text | 0.566 | 0.455 | 6.438 |
| Dense escapes / Unicode | 7.809 | 5.633 | 9.054 |
| 16 reversed fields | 0.117 | 0.298 | 0.296 |

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
