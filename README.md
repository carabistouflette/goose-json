# goose-json

Automatic, strict JSON ↔ struct mapping for the [Goose language](https://github.com/aardappel/goose), using `const for` field reflection. Apache-2.0. Experimental API, no release yet.

Addresses the request in [discussion #219](https://github.com/aardappel/goose/discussions/219) without macros, code generation, or a runtime reflection registry. There are no runtime dependencies beyond Goose's standard library.

```goose
import json_codec from "carabistouflette/goose-json@<commit>";

struct Item { id: i64, active: bool, name: json_codec::Text }
fn main() {
    var item, error = json_codec::deserialize<Item>("{\"id\":42,\"active\":true,\"name\":\"Goose\"}");
    if error.len > 0 { print(error); return; }
    let text, write_error = json_codec::serialize(item);
    if write_error.len > 0 { print(write_error); return; }
    print(text);
}
```

Replace `<commit>` with a published full commit hash. Inside this checkout, use `import json_codec from "..";` from an example or test. Run `make setup`, then `make check test`. Setup requires Git, CMake 3.27+, a C/C++20 toolchain, and Make; Linux's in-process runner requires libc development headers. Alternatively, `make GOOSE=/path/to/goose check test`. [GOOSE_REVISION](GOOSE_REVISION) pins the tested compiler; compatibility with other revisions is not promised.

## Contract

- Struct roots and nested structs map to objects using exact, case-sensitive field names. No custom mapping is needed.
- Supported fields: `i64`, `bool`, finite `f64`, owned `json_codec::Text`, nested structs, and grow-only arrays `i64[>..]`, `bool[>..]`, `f64[>..]`.
- `Text { bytes: ... }` owns its UTF-8 byte builder. Decoded results outlive the source JSON, including escaped strings. All other string/array representations, integer widths, nullable fields, maps, enums, and arrays of records/text are outside this initial API; unsupported types fail at compile time.
- Every field is required, including fields with Goose defaults. Missing, duplicate, or unknown fields are errors. Escaped keys are decoded before comparison. No numeric/string/bool coercion occurs. An `i64` requires integer notation: `1.0` and `1e0` are rejected.
- Invalid JSON, invalid UTF-8, lone surrogate escapes, trailing data, and floats that round to non-finite values are errors. Integer limits are checked before arithmetic can overflow. Finite rounding is accepted, including underflow to signed zero. Floating-point tokens longer than 128 bytes are rejected before upstream conversion. Errors include a byte offset when produced by that reader.
- `deserialize<T>(text)` returns `(value, error)`. Empty error means success. On error the value may be partial: discard it. The convenience function accepts ordinary structs; Goose root structs cannot be returned by value.
- `deserialize_into(text, destination)` returns an error byte builder and also accepts `root struct` destinations, supported scalars, and supported scalar arrays. Serialization likewise accepts these types directly. Use `var destination = Type { .. };`. It replaces encountered strings and arrays, but may leave partial changes on failure. Always check the error before use. Root structs allow several independently growing fields; ordinary structs must follow Goose's rule that a resizable field is last.
- `serialize(value)` takes a mutable reference (ordinary Goose call syntax) and returns `(text, error)`. Field declaration order determines output order. Failure returns empty output. Non-finite floats and invalid UTF-8 in `Text` are rejected. Signed zero formatting follows the standard writer.

## Cost and limits

Parsing uses Goose's streaming reader, with no document tree. Field dispatch is a linear comparison over the compile-time expanded fields: O(input bytes + object members × schema fields). It allocates seen-field flags per object, scratch storage for escaped keys/strings, and owned text/array results. Unescaped strings are copied once into their owner; escaped strings pass through scratch first. Serialization appends directly to a grow-only builder, with compile-time expanded field access.

Floating-point tokens are limited to 128 bytes (`MAX_NUMBER_BYTES`) before the upstream reader runs, bounding its arbitrary-precision conversion cost and preventing its saturated-exponent edge case. This accepts every finite f64 output produced by the writer but intentionally rejects longer valid JSON numbers. Input is limited to 1 MiB (`MAX_INPUT_BYTES`) before parsing and is checked for UTF-8 in a linear pass. Unknown fields fail immediately rather than walking arbitrary nested input. Recursion follows the finite, statically known schema; no recursive reference graphs are supported. The input cap bounds accepted wire size, not an exact allocator budget: wide schemas and tiny scalar arrays can expand in memory. Serialization has no output-size cap.

## Benchmarks

Native, owned-result JSON operations; median **ns/op**, lower is better. One Core Ultra 7 258V / GCC 16.2 / Rust nightly measurement, seven batches per operation, with an independent repeat. These fixtures do not establish a general ranking.

| Fixture | goose-json decode | serde_json decode | goose-json encode | serde_json encode |
| --- | ---: | ---: | ---: | ---: |
| Small record | 121.7 | 157.7 | 48.9 | 70.6 |
| Escaped / Unicode | 243.1 | 304.3 | 114.9 | 96.7 |
| 1,024 integers | 12,422.6 | 13,424.5 | 5,714.1 | 8,228.8 |

On this fixture set, decoding takes 28–42% less time than the previous codec. Escaped-string encoding remains slower than `serde_json`; no encoding speedup over the previous codec is claimed. Protobuf is measured separately because its bytes and schema semantics differ.

```sh
make bench                         # Goose; GCC required
make bench-compare                 # adds optional locked Rust serde_json / prost baselines
```

See [methodology, hardware, source revisions, Protobuf results, and raw ranges](bench/README.md). CI smoke-runs the benchmarks without timing thresholds.

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md). Tests cover the in-process and native execution paths, ownership, nested records, scalar arrays, key escaping, integer limits, malformed input, Unicode, and size limits.

[Apache-2.0](LICENSE). Copyright 2026 goose-json contributors.
