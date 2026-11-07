# Changelog

## Unreleased

- Pin the Ethereum consumer and quickstart to the exact v0.2.0 release commit.

## 0.2.0 (experimental)

The strict struct codec implementation is unchanged from v0.1.3.

- Add the optional bounded protocol reader for selecting owned raw JSON values,
  with whole-document validation and explicit resource limits.
- Add a read-only Ethereum block-number client with bounded HTTP transport and
  loopback tests for JSON-RPC responses.

- Add exact Unicode/escape, canonical-number, short-copy, alignment and guard-page tests.
- Add bounded encode/decode, large-output, allocation/copy and signed-consumer
  diagnostics. Keep complete observations and rejected optimization trials.
- Simplify usage/API/build documentation, pin the quickstart to v0.1.3 and check
  benchmark source/dependency identity against the recorded implementation.

## 0.1.3

- Convert wide signed integers using bounded eight-digit blocks on GCC/Clang;
  preserve canonical output, the existing adapter capacity contract and runtime
  fallback on TinyCC/other compilers.
- Check integer bytes, decimal boundaries, short spans, unaligned destinations
  and guard pages against independent standard-library conversion.

## 0.1.2

- Fix portable serialization of finite floats near a 15-digit carry boundary
  (including both signs of 9.999999999999998e36). Fall back before a scaling
  carry can index beyond the power table; preserve canonical output and bits.

## 0.1.1

- Make parsing/serialization errors and numeric output independent of application
  formatting overloads. Previously, overloads could erase diagnostics or alter
  integer output and portable float output. Preserve JSON number spelling and
  native float kernels; cover consumer overloads in normal/debug tests.
- Keep common nonnegative integer output in Goose and inline the scalar writer.
  Publish a new matched native recording against the previous public revision,
  with all regressions, JSON/Protobuf/DOM results and build profiles retained.

- Prevent inherited Cargo release/incremental settings from silently changing
  benchmark comparisons; record the requested profile and reject incompatible
  observed executable profiles before timing.
- Split the public tests into ten named groups, preserving their checks and
  execution order; remove a redundant numeric cast.
- Clarify private native contracts and simplify Unicode escape control flow.
  Checked Release objects remain byte-identical with GCC and Clang.
- Run the public suite with Goose's debug checks in runner and compiled modes
  in CI (`make test-debug`).
- Compare fuzzed escaped bytes against an independent bytewise oracle, alongside
  the existing round-trip checks. Production codec behavior is unchanged.

## 0.1.0

First experimental release. The API may change before 1.0.

- Typed JSON decoding and encoding for Goose structs, owned UTF-8 text,
  `i64`, finite `f64`, booleans and scalar arrays.
- Required-field, duplicate-field, unknown-field, Unicode and numeric checks;
  documented input and number-token limits.
- Bounded native string and float kernels with a portable Goose fallback.
- Reproducible JSON and separate Protobuf/DOM comparisons, native sanitizer
  tests, fuzzing and pinned CI.

The final performance pass coalesces sparse string runs into bounded copies and
keeps decimal conversion local to the formatter. Output spelling and the public
validation/ownership contract are unchanged. See [benchmark results](bench/README.md)
and the [validation record](docs/validation.md) for evidence and limitations.

Tested on Linux x86-64 with GCC and Clang and the compiler in
[GOOSE_REVISION](GOOSE_REVISION). CMake and a C++17 compiler/runtime are required,
including for `goose run`. Other platforms are unverified.

See the [API reference](docs/api.md) for supported types, ownership and error
handling, [SECURITY.md](SECURITY.md) for private reports, and [NOTICE](NOTICE)
for vendored dependency notices. Project code is Apache-2.0; original dependency
licenses are retained.
