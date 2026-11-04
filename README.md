# goose-json

Automatic, strict JSON ↔ struct mapping for the [Goose language](https://github.com/aardappel/goose), using `const for` field reflection. Apache-2.0. Experimental API, no release yet.

Addresses the request in [discussion #219](https://github.com/aardappel/goose/discussions/219) without macros, code generation, or a runtime reflection registry. Native builds use small bounded C++ kernels with vendored Dragonbox and simdutf; Goose owns all storage. The in-process TinyCC runner uses the Goose implementation. See [native build and dependency details](native/README.md).

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

Replace `<commit>` with a published full commit hash. Inside this checkout, use `import json_codec from "..";` from an example or test. Run `make setup`, then `make check test`. Setup requires Git, CMake 3.27+, a C/C++20 toolchain, and Make; Linux's in-process runner requires libc development headers. Even with an installed Goose compiler, this package needs CMake and a C++17 compiler to build its static native library, plus the toolchain's C++ runtime. Alternatively, `make GOOSE=/path/to/goose check test`. [GOOSE_REVISION](GOOSE_REVISION) pins the tested compiler; compatibility with other revisions is not promised.

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

Parsing uses Goose's streaming reader, with no document tree. Field dispatch is a linear comparison over the compile-time expanded fields: O(input bytes + object members × schema fields). It allocates seen-field flags per object, scratch storage for escaped keys/strings, and owned text/array results. Unescaped strings are copied once into their owner. Native escaped strings stream through a fixed 4 KiB buffer into owned storage; they do not allocate a second full-string scratch buffer. Native float arrays format bounded batches of 64 values. Serialization appends to a checked grow-only builder, with compile-time expanded field access. The portable implementation uses the standard reader and writer where appropriate.

Floating-point tokens are limited to 128 bytes (`MAX_NUMBER_BYTES`) before the upstream reader runs, bounding its arbitrary-precision conversion cost and preventing its saturated-exponent edge case. This accepts every finite f64 output produced by the writer but intentionally rejects longer valid JSON numbers. Input is limited to 1 MiB (`MAX_INPUT_BYTES`) before parsing and is checked for UTF-8 in a linear pass. Unknown fields fail immediately rather than walking arbitrary nested input. Recursion follows the finite, statically known schema; no recursive reference graphs are supported. The input cap bounds accepted wire size, not an exact allocator budget: wide schemas and tiny scalar arrays can expand in memory. Serialization has no output-size cap.

## Benchmarks

Native, owned-result JSON operations. Median ns/op, **decode / encode**, lower is better; median of three repeated process passes on one Core Ultra 7 258V. Both GCC and Rust enable native CPU instructions. The expanded corpus includes floats, long strings and reverse-order fields, with safe SIMD `sonic-rs` as a baseline.

| Fixture | goose-json | sonic-rs | serde_json |
| --- | ---: | ---: | ---: |
| Small record | 117.8 / 42.2 | 172.3 / 74.0 | 188.7 / 71.3 |
| Escaped / Unicode | 244.2 / 104.6 | 306.5 / 147.9 | 315.0 / 95.7 |
| 1,024 integers | 10,806.0 / 6,311.6 | 17,916.6 / 8,000.2 | 15,570.8 / 8,458.9 |
| 256 floats | 6,515.2 / 30,555.0 | 7,399.4 / 10,941.8 | 7,425.5 / 10,287.3 |
| 8 KiB ASCII text | 6,826.2 / 5,348.5 | 1,081.4 / 565.9 | 2,285.4 / 4,718.7 |
| Dense escapes / Unicode | 37,819.8 / 34,576.8 | 13,574.4 / 8,523.6 | 23,999.5 / 13,981.8 |
| 16 reversed fields | 843.2 / 195.5 | 958.8 / 424.5 | 1,520.4 / 419.9 |

The changes improve ASCII text and integer decoding; they do not establish a universal lead. Sonic is faster on long strings, floating-point encoding remains slower, and integer-array encoding regressed in these runs. Full ranges, complete batch data, resource/ownership differences and separate Protobuf/DOM results are [documented](bench/README.md).

```sh
make bench-native
python3 bench/measure.py --native --cpu 0 --iterations 200000 --runs 3 --output .build/reproduce-01
```

See [benchmark setup and methodology](bench/README.md). CI checks execution and correctness, never noisy timing thresholds.

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md). Tests cover the in-process and native execution paths, ownership, nested records, scalar arrays, key escaping, integer limits, malformed input, Unicode, and size limits. `make test-native CXX=clang++` runs the native kernels under ASan/UBSan, including one million float bit patterns and guard-page checks. After editing native sources, run `make format` to refresh the package cache fingerprint.

[Apache-2.0](LICENSE). Copyright 2026 goose-json contributors.
