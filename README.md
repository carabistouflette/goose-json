# goose-json

Read JSON into Goose structs and write them back. Field names come from your
struct definition; decoded strings and arrays own their storage.

[API reference](docs/api.md) · [Benchmarks](bench/README.md) · [Contributing](CONTRIBUTING.md)

## Usage

Save this as `main.goose` and run `goose run main.goose`:

```goose
import json_codec from "carabistouflette/goose-json@27145a16f4ea2dc61c037d5eaaa7311db7bd9d83";

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

goose-json recorded the lowest decoding median in all eight fixtures against
sonic-rs and serde_json on the tested machine. Encoding results vary: Sonic leads
on long text and wide-exponent floats; serde leads on the small escaped record.

Times below are **microseconds per operation**, lower is better. These are
medians from three process passes on a Core Ultra 7 258V with native CPU tuning.
They describe this corpus and machine; close timings can overlap.

<details>
<summary>Decode timings — all eight fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.109 | 0.165 | 0.157 |
| Escaped / Unicode | 0.202 | 0.308 | 0.305 |
| 1,024 integers | 9.082 | 16.972 | 14.654 |
| 256 simple floats | 4.897 | 7.018 | 7.002 |
| 256 wide-exponent floats | 8.086 | 15.938 | 22.177 |
| 8 KiB ASCII text | 0.902 | 1.079 | 2.232 |
| Dense escapes / Unicode | 12.251 | 12.998 | 22.558 |
| 16 reversed fields | 0.743 | 0.934 | 1.511 |

</details>

<details>
<summary>Encode timings — all eight fixtures</summary>

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 0.042 | 0.069 | 0.070 |
| Escaped / Unicode | 0.100 | 0.147 | 0.095 |
| 1,024 integers | 5.448 | 8.005 | 7.933 |
| 256 simple floats | 9.850 | 11.734 | 9.851 |
| 256 wide-exponent floats | 11.439 | 9.746 | 10.553 |
| 8 KiB ASCII text | 0.803 | 0.555 | 4.641 |
| Dense escapes / Unicode | 9.834 | 8.373 | 13.297 |
| 16 reversed fields | 0.204 | 0.409 | 0.407 |

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

## License

[Apache-2.0](LICENSE). Vendored dependency notices are in [NOTICE](NOTICE).
