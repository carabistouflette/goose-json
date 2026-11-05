# goose-json

Read JSON into Goose structs and write them back. Struct field names become JSON
keys; decoded strings and arrays own their storage.

[API](docs/api.md) · [Benchmarks](bench/README.md) · [Contributing](CONTRIBUTING.md)

<a id="usage"></a>

## Quickstart

Requires the [tested Goose compiler](GOOSE_REVISION), CMake and a C++17 compiler
with its runtime, including for `goose run`. Tested on Linux x86-64 with GCC and
Clang; other platforms are unverified.

Save this as `main.goose`, then run `goose run main.goose`:

```goose
import json_codec from "carabistouflette/goose-json@aae48035f73e09b51011950ff12bfe424e0ec921";
import os;

struct Item { id: i64, active: bool, name: json_codec::Text }

fn main() {
    let input = "{\"id\":42,\"active\":true,\"name\":\"Goose\"}";
    var item, error = json_codec::deserialize<Item>(input);
    if error.len > 0 { write_stderr(error); exit(1); }
    let text, write_error = json_codec::serialize(item);
    if write_error.len > 0 { write_stderr(write_error); exit(1); }
    print(text);
}
```

Output:

```json
{"id":42,"active":true,"name":"Goose"}
```

The example pins **v0.1.3**, an experimental prerelease. Main has additional tests,
profiling tools and documentation; its codec implementation is unchanged from that
release. See the [changelog](CHANGELOG.md) and checked
[source comparison](bench/CURRENTNESS.md). The API may change before 1.0.

## Supported values

| Goose type | JSON value |
| --- | --- |
| Structs and nested structs | Objects |
| `json_codec::Text` | Owned UTF-8 strings |
| `i64` | Integers |
| Finite `f64` | Numbers |
| `bool` | Booleans |
| `i64[>..]`, `f64[>..]`, `bool[>..]` | Arrays |

Every field is required. Missing, duplicate and unknown fields are errors.
Maps, null/optional values, enums and arrays of records or text are unsupported.

Check every returned error. A failed decode can leave a partial value: discard
it. A failed serialization returns empty output. Use `deserialize_into` for
`root struct` destinations, scalars and arrays; see [examples and ownership](docs/api.md).

Input is limited to **1 MiB** and floating-point tokens to **128 bytes**.
Invalid UTF-8, out-of-range integers and non-finite floats are rejected.
These are input limits, not a memory budget. Serialization has no output cap.

## Performance

[Recorded comparisons](bench/RESULTS.md) cover thirteen fixtures, with all results,
raw samples and variation shown. Some cases are slower than the compared JSON
libraries. The measured implementation matches v0.1.3 and main through the
[checked source comparison](bench/CURRENTNESS.md); the timings still describe the
recorded machine, compiler settings and shared-host conditions. Protobuf and
borrowing DOM results have separate contracts. No overall ranking is claimed.

## Development

From a full Git clone, including tags and historical benchmark commits:

```sh
make setup
make check test test-debug test-portable
make test-native CXX=clang++
```

Building the pinned Goose compiler requires Git, Make, CMake 3.27+ and a C/C++20
toolchain. Linux's in-process runner also needs libc development headers. With
Goose already installed, pass `GOOSE=/absolute/path/to/goose` to Make.

[Contributing](CONTRIBUTING.md) covers checks and commit conventions.
[Native implementation](native/README.md) covers build dependencies and fuzzing.
[Validation history](docs/validation.md) records earlier audits and experiments.
Report vulnerabilities through the [security policy](SECURITY.md).

## License

[Apache-2.0](LICENSE). Vendored dependency notices are in [NOTICE](NOTICE).
