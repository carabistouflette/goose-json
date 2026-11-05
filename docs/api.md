# API

[Quickstart](../README.md#quickstart) · [Runnable example](../examples/item.goose)

## Decode and encode

```text
deserialize<T>(input)          -> value, error
deserialize_into(input, value) -> error
serialize(value)              -> output, error
```

An empty error means success. Errors and output are owned byte builders.

`deserialize<T>` constructs an ordinary struct. `deserialize_into` writes into
an existing destination and also accepts `root struct` types, supported scalars
and scalar arrays. It replaces encountered strings and arrays. A decode failure
may leave partial changes; discard that value. Previously owned text remains
independent of the original JSON input.

`serialize` accepts a mutable reference using ordinary Goose call syntax. It
writes keys in field declaration order. Failure returns empty output.
Diagnostics and numeric output do not call application formatting overloads.

## Types and field rules

Supported values are structs, nested structs, `json_codec::Text`, `i64`, finite
`f64`, `bool`, and grow-only arrays of those three scalar types. `Text.bytes` is
an owned UTF-8 byte builder. Other integer widths, borrowed strings, nullable
values, maps, enums and arrays of records/text are unsupported.

Keys are case-sensitive. Every field is required, including fields with Goose
defaults. Missing, duplicate and unknown fields fail. Escaped key spellings are
decoded before comparison. There is no coercion: an `i64` rejects `1.0`, `1e0`,
booleans and strings.

Ordinary Goose structs require their resizable field to be last. A `root struct`
can have several independently growing fields, but cannot be returned by value;
use `deserialize_into`. For example, the complete program in
[examples/into.goose](../examples/into.goose) reads a root struct and a scalar array:

```sh
goose run examples/into.goose
```

Run repository examples from a clone using the compiler in
[GOOSE_REVISION](../GOOSE_REVISION); they import this checkout. The quickstart
instead imports the exact released v0.1.3 commit.

## Validation and limits

| Boundary | Behavior |
| --- | --- |
| Input size | At most 1,048,576 bytes, checked before parsing |
| Float token | At most 128 bytes, checked before conversion |
| Integers | Full signed `i64` range; overflow rejected |
| Floating point | Finite rounding accepted, including underflow to signed zero; non-finite results rejected |
| Text | UTF-8 validated; malformed escapes and lone surrogates rejected |
| Object shape | Required fields only; duplicate/unknown fields and trailing data rejected |
| Serialization | No output-size cap; invalid UTF-8/non-finite values produce empty output and an error |

The input cap is not a fixed allocation budget: many small values or wide schemas
can require more storage than their JSON text. Recursion follows the finite
schema; recursive reference graphs are unsupported. Reader errors include a byte
offset; errors caught before the reader may not.

## Implementation notes

Parsing uses a streaming reader rather than a document tree. Field lookup
compares input keys with declared names, so wide objects need more comparisons.
Unescaped strings are copied into their owner. Native paths use a fixed 4 KiB
scratch buffer for escaped strings and batches of 64 values for float arrays. Goose owns
result storage and lifetimes in all modes.

GCC/Clang builds use private C++ kernels for selected operations. TinyCC and
`GOOSE_JSON_FORCE_PORTABLE` use the Goose fallback; CMake/C++ build dependencies
still apply. See [native build details](../native/README.md).
