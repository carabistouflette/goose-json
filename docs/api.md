# API reference

[← goose-json](../README.md)

## Types and behavior

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

## Reading into an existing destination

Use `deserialize_into` for `root struct` types, scalars, arrays, or a destination
you already own:

```goose
var destination = Item { .. };
let error = json_codec::deserialize_into(input, destination);
if error.len > 0 { print(error); return; }
```

An empty error builder signals success. See the
[quick start](../README.md#usage) for `deserialize<T>` and `serialize`. The [example program](../examples/item.goose) exits with a nonzero
status on failure.

## Implementation

The API uses Goose's `const for` field reflection. Native builds use vendored
Dragonbox, fast_float and simdutf; the TinyCC runner uses the Goose fallback.
See [native build details and dependency licenses](../native/README.md).

The library addresses the automatic mapping requested in
[Goose discussion #219](https://github.com/aardappel/goose/discussions/219).
