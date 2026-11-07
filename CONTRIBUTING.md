# Contributing

Keep changes focused. Use branches such as `fix/...`, `feat/...` or `docs/...`
and Conventional Commits, for example `fix: reject duplicate keys`. One commit
should describe one coherent change. Do not commit credentials, generated
binaries, compiler caches or private workspace notes.

## Checks

Use the compiler in [GOOSE_REVISION](GOOSE_REVISION). `make setup` builds it;
Goose source builds need CMake 3.27+ and a C/C++20 toolchain. The Ethereum
consumer integration additionally needs pkg-config and libcurl 7.85 or newer
with development headers and libraries, and fetches its commit-pinned goose-http
dependency.
With an existing compiler, pass `GOOSE=/absolute/path/to/goose` to Make.

```sh
make format
"${GOOSE:-.toolchain/goose/build/goose}" format protocol.goose
make check test test-debug test-portable
```

For native changes, also run:

```sh
make test-native CXX=clang++
make test-native CXX=g++
```

[Native testing](native/README.md#testing) describes bounded fuzz checks.
`make format` updates the native package's cache hash; `make check` rejects a stale
hash and checks the benchmark source comparison. Add public behavior regressions
in the relevant module tests: `tests/codec.goose` for the struct codec and `tests/protocol.goose` or `tests/protocol_bounds.goose`
for the optional protocol reader. `tests/formatting.goose` installs application
formatting overloads. Test malformed input, ownership and empty output on errors.

## Design and review

Keep file/process I/O in the application. Preserve the documented type set,
validation, ownership and error rules. Native acceleration stays private, bounded
and backed by a portable implementation. Diagnostics and numeric output must not
invoke application formatting overloads. Discuss API/type additions first.

Get an independent review, fix actionable findings and keep CI passing. Compiler
updates need a reviewed full upstream commit in `GOOSE_REVISION` and full checks.
Releases use semantic versions; the API may change before 1.0. Never move a
published tag.

## Performance

Profile before changing a hot path. [Benchmark instructions](bench/README.md)
cover setup, workload, compiler settings and comparison limits. Keep all fixtures,
slower results and raw samples. A result needs exact source/dependency/toolchain
identities, not just a recent date. CI checks execution, not speed thresholds.
Report vulnerabilities through the [security policy](SECURITY.md).
