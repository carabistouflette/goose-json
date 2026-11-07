# Security

Use [GitHub private vulnerability reporting](https://github.com/carabistouflette/goose-json/security/advisories/new)
for suspected vulnerabilities. Include the affected commit, compiler versions,
platform and a small reproducer. Keep exploit details out of public issues until
a fix is available.

## Input and ownership boundaries

The strict struct decoder checks UTF-8 and rejects input above 1 MiB. Floating-
point tokens are limited to 128 bytes. Missing, duplicate and unknown fields
fail. Discard a value after a decoding error; it may be partial. Serialization
failure returns empty output and an error. Formatting overloads cannot erase
diagnostics or alter numeric JSON output.

The optional protocol reader validates the whole document, including unknown
members, and rejects duplicate decoded keys. Its input, retained output,
nesting and work limits are described in the [API](docs/api.md#select-json-object-members).
A failure clears the destination. Selected values contain raw JSON bytes; the
caller is responsible for validating protocol-specific rules and handling text
safely when displaying it.

These input limits are not a memory budget. Schemas can expand small wire values
into larger owned results. Serialization has no output cap. See the
[API](docs/api.md) for supported types and exact behavior.

## Validation

CI exercises TinyCC, GCC/Clang and the forced-portable path, including Goose's
debug checks. Native tests use ASan/UBSan, exact-byte oracles, short buffers,
unaligned storage, guard pages and float bit patterns. A bounded native fuzzer
runs in CI against the native codec kernels; it does not fuzz the protocol
reader. The Ethereum consumer integration tests use loopback HTTP; they do not
exercise a TLS handshake. These checks do not establish correctness for every
input or platform.

[Validation commands](docs/validation.md) · [Native testing](native/README.md#testing)
· [Dependency notices](NOTICE)
