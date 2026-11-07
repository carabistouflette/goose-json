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
import json_codec from "carabistouflette/goose-json@fcee7b75658a5708756dc163127b70df656996a4";
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

The example pins **v0.2.0**, an experimental prerelease, by its exact commit.
The strict struct codec remains unchanged from v0.1.3. See the
[changelog](CHANGELOG.md) and checked [source comparison](bench/CURRENTNESS.md). The API may change before 1.0.

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

## Select protocol fields

The `json_codec.protocol` module, available starting with v0.2.0, selects
owned raw values from a validated JSON object. It distinguishes missing members
from `null` and preserves exact number tokens. See the [selective reader API](docs/api.md#select-json-object-members)
for the interface, limits and JSON-RPC example.

## Read an Ethereum block number

The [Ethereum JSON-RPC consumer](examples/ethereum_rpc.goose) posts
`eth_blockNumber` to an endpoint with numeric ID `1`, then validates the
JSON-RPC response and matching ID. The copy in this checkout pins goose-json
to the exact v0.2.0 release commit; the copy in the v0.2.0 tag imports its
checkout. Run it with:

```sh
goose run examples/ethereum_rpc.goose -- https://your-rpc-endpoint.example/
```

It imports the published `goose-http` commit
`c2310d8403d93b24b65eb45e9dae11e36183514d`; first use needs network access
or a pre-fetched package, CMake, a C compiler and libcurl development files
for libcurl 7.85 or newer.
HTTPS is required unless `--allow-http` is explicitly provided, for example
when running a local fixture.
The client returns a canonical lowercase hexadecimal quantity of at most 64
hex digits; a null result is reported separately. It accepts signed 64-bit RPC
error codes and prints the exact error JSON as ASCII hex on stderr, preserving
its bytes without displaying untrusted terminal controls. The application makes
one transport call and does not retry; the transport does not follow redirects.
The timeout is not a hard wall-clock deadline if DNS cleanup stalls. The
loopback integration suite runs with `make test` against both the pinned reader
and the current checkout; no live endpoint is contacted by the tests.

## Performance

[Recorded comparisons](bench/RESULTS.md) cover thirteen fixtures, with all results,
raw samples and variation shown. Some cases are slower than the compared JSON
libraries. These timings cover the strict struct codec, not the selective
protocol reader. The measured implementation matches v0.1.3 and main through the
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
