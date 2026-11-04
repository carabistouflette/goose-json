# Changelog

## Unreleased

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
