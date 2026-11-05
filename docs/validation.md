# Validation

Use the pinned compiler and run from a repository clone:

```sh
make setup
make check test test-debug test-portable
make test-native CXX=clang++
make test-native CXX=g++
```

Or pass `GOOSE=/absolute/path/to/goose` when Goose is already installed.

- `check`: fixture/source-hash drift, Python checks, Goose formatting and type checks.
- `test`: public API behavior in the runner and a compiled executable, plus examples.
- `test-debug`: runner/compiled overflow, cast-range and tag checks.
- `test-portable`: compiled fallback and standalone runtime linkage.
- `test-native`: the actual C++ library with ASan/UBSan, exact bytes, float bits,
  buffer limits, unaligned accesses and guard pages.

These checks do not certify other platforms or every possible input. The tested
platform is Linux x86-64; see the [API limits](api.md#validation-and-limits).
[Native testing](../native/README.md#testing) covers optional longer fuzz campaigns.
CI uses bounded campaigns and no speed thresholds.

<a id="maintainability-cleanup"></a>

[Historical audits](validation-history.md), including the
[maintainability cleanup](validation-history.md#maintainability-cleanup), retain commit-specific one-off checks,
reviews and failed optimization attempts. Their test counts and timing statements
apply to the named sources, not automatically to future commits. Current benchmark
applicability is checked separately in the [source comparison](../bench/CURRENTNESS.md).
