# Security

Report suspected vulnerabilities through [GitHub private vulnerability reporting](https://github.com/carabistouflette/goose-json/security/advisories/new).
Please include the affected commit, Goose/compiler versions, platform and a
minimal reproducer. Keep exploit details out of public issues until a fix is
available.

## Input boundary

The public deserialization functions validate UTF-8 and reject inputs above
1 MiB. Float tokens are limited to 128 bytes before conversion. Missing,
duplicate and unknown fields are errors. Native kernels receive bounded slices;
Goose owns storage and checks builder growth. Returned values may be partial
after a decoding error and must be discarded. Serialization errors return empty
output.

These are input/work limits, not a fixed allocator budget. Schemas can expand
small JSON values into larger in-memory results. Serialization has no output cap.
See the [API contract](docs/api.md) for supported types and ownership rules.

## Checks

The public API is tested through TinyCC, native and forced-portable builds.
CI also runs `make test-debug` in runner and compiled modes, enabling Goose's
debug overflow, cast-range and tag checks.
Native checks use GCC/Clang ASan/UBSan, guard pages and float bit-pattern tests.
The [native fuzzer](native/README.md#testing) runs in CI and can be run locally for
longer campaigns. Vendored dependencies are pinned with their original notices;
see [native dependency details](native/README.md#vendored-dependencies).
