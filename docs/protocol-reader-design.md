# Proposed bounded protocol JSON reader

Status: initial design; see [API documentation](api.md#select-json-object-members)
for the implemented interface. The initial use case is reading one JSON-RPC response, including an arbitrary
`result` or `error.data`. The existing struct codec remains the default.

## Proposed interface

Add an opt-in operation taking a complete UTF-8 JSON document whose root is
an object and a list of decoded UTF-8 member names. It validates the entire
document and returns an owned result with one entry per requested name, in
request order. Each entry is missing or present with the exact bytes of the
JSON value, excluding surrounding whitespace. Thus `null` is present and
is distinguishable from missing. Names compare case-sensitively after JSON
escape decoding. Requested names must be unique and valid UTF-8; invalid
requests fail before parsing.

Returned bytes are owned, independent of the input and selector storage, and
remain valid until the result is cleared or destroyed. No slices into the
input are retained. On any error, the result is empty, including when reusing
an existing destination. Callers must check the error. Exact Goose names and
the destination type remain to be checked against the pinned compiler's
ownership rules; this document specifies behavior, not a compilable signature.

Values keep their original JSON spelling: numbers are not converted through
floating point, and strings retain quotes and escapes. A caller can decode a
selected string or integer with the existing strict codec, or apply this
operation again to a selected object. Each invocation has its own limits;
applications making repeated calls must bound the number of calls themselves.
The implementation accepts input and selectors that alias the destination by
finishing all reads into scratch storage before replacing it.
Arrays and arbitrary nested values can be retained as raw JSON. Array indexing,
a mutable tree, and JSON writing are outside this initial proposal.

For example, select `jsonrpc`, `id`, `result`, and `error`. The application
must decode and require `jsonrpc` to equal `"2.0"`, validate `id` against the
outstanding request under its chosen string/integer/null policy, and require
exactly one of `result` and `error`. A present `result: null` is not missing.
If `error` is present, the application can select and validate its required
integer `code`, string `message`, and optional `data`. This reader validates
JSON; the application validates JSON-RPC and correlates ids. Transport and
batch responses at the root are outside this proposal.

## Standard reader assessment

The library already uses `json::Reader` from the Goose revision pinned in
`GOOSE_REVISION`. The pinned standard module's `read_string` may return a slice
of the input or scratch storage, `each_member` exposes raw escaped keys, and
`skip_value` has no configurable depth, member, or duplicate-key budget. Its
string decoder permits lone surrogate halves and does not validate raw UTF-8.
The standard `parse` builds growable node and stack arrays and converts numbers
to `i64`/`f64`; it does not preserve arbitrary number tokens. Its `finish`
checks for trailing input. These helpers can inform the implementation, but
none alone provides the owned, bounded contract proposed here. Inspect and
exercise the exact pinned revision before relying on individual helpers.

## Validation and proposed limits

All limits apply to the whole input, including ignored members. Reject invalid
UTF-8, malformed strings or escapes, lone surrogates, invalid JSON number
syntax, malformed containers, trailing non-whitespace, and duplicate object
keys at every nesting level. Duplicates are compared after decoding escapes,
so `"id"` and `"\u0069d"` conflict. Unknown members are permitted but fully
validated. Number tokens are validated lexically and retained exactly; a
large but syntactically valid exponent does not require conversion to `f64`.

| Resource per call | Proposed maximum |
| --- | ---: |
| Input bytes | 1,048,576 |
| Nesting depth, root object included | 64 |
| JSON values, root included | 8,192 |
| Object members across the document | 4,096 |
| Decoded bytes in one key | 4,096 |
| Bytes in one number token | 128 |
| Requested names | 64 |
| Decoded bytes in one requested name | 4,096 |
| Aggregate decoded requested-name bytes | 65,536 |
| Retained raw value bytes | 524,288 |
| Duplicate-key candidate comparisons | 131,072 |
| Bytes examined comparing decoded keys for duplicates | 4,194,304 |

A value is any object, array, string, number, boolean or null. A member's key
is not itself a value. Depth counts containers currently open; scalars do not
increase it. Empty objects and arrays count as values and containers. Compare each decoded key against every earlier key in the same object in
input order, stopping on a duplicate. Count every candidate comparison,
including length mismatches. For equal-length keys compare corresponding bytes
in order until the first difference; count each pair examined as one byte. Apply these work budgets
across all objects, including ignored ones, and check counters before exceeding
them. Input, names and output budgets are byte counts, not character counts.
Limit errors may reject otherwise valid JSON. Selector validation and matching
must also have bounded work: at most 64 selectors, each no longer than 4,096
bytes, and at most 65,536 bytes in total. Matching is limited to root members; its work is bounded by the input and
selector limits and is not charged to the duplicate-comparison budgets.

Enforce depth and count limits before descending or allocating for a new item,
and check byte limits before append or integer arithmetic. Duplicate detection
must retain enough decoded keys for every currently open object and release
them on exit. Its temporary allocations and stack are bounded by the input,
member, key and depth limits; these limits do not promise a fixed total heap
size or protect against process-wide allocation failure. Avoid hidden I/O and
global mutable state. Define an explicit nonempty error on every failure,
without calling application formatting overloads.

## Fixture and verification plan

Independent fixtures must state expected presence and exact retained bytes,
not merely agree with the implementation. The examples exercise JSON selection;
separate fixtures must validate JSON-RPC envelope rules. At minimum cover:

| Case | Expected result |
| --- | --- |
| `{"jsonrpc":"2.0","id":1,"result":null}` selecting all four envelope names | `result` present with `null`; `error` missing |
| `{"jsonrpc":"2.0","id":1,"error":{"code":-32601,"message":"not found"}}` | `error` present as its exact object bytes; `result` missing |
| `{"\u0069d":1,"id":2}` | duplicate-key error |
| `{"ignored":{"a":1,"\u0061":2},"id":1}` | duplicate-key error in ignored content |
| `{"ignored":[1,],"id":1}` | syntax error in ignored content |
| `{"id":9007199254740993,"result":1e999}` | both number tokens retained exactly |
| `{"id":01}` and `{"id":1e}` | number syntax errors |
| Malformed UTF-8, bad escapes, or isolated UTF-16 surrogates | error even in ignored content |
| Valid escaped surrogate pair and escaped selector key | decoded names match; value bytes remain unchanged |
| Two top-level values, or non-object root | error |
| Duplicate selectors or malformed UTF-8 in a selector | error and empty result |

Generate cases at and one past every limit, including nesting, counts, number
and key lengths, retained bytes, selector budgets and both duplicate-work
budgets. Include wide objects, deeply nested ignored values and long common
key prefixes. Establish the inputs' actual counter values independently; do not
treat an earlier unrelated limit as proof of the target boundary. Verify that
mutating or releasing input and selector buffers after success does not alter
results; reuse the destination after success and after failure; verify no
partial result escapes any failure. Check zero selectors, empty containers,
whitespace, escaped keys, string values, all scalar forms and multiple selected
values in request order. Compare acceptance and values with an independent
strict JSON implementation where policies coincide, with separate oracles for
duplicate keys and numerical lexemes. Exercise debug and optimized builds with
the pinned compiler and the existing portable path.

The implementation uses the pinned reader after preflighting object keys,
validates UTF-8 and surrogate output, and has independent boundary and Python
differential fixtures. The checks and reviews do not establish platform
qualification or a performance claim.
