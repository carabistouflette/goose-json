# Validation record

Recorded 2026-11-04 for the native codec measured at
`f6409122724d371e679ccd5cc27ea842097f895b`. Subsequent documentation and test
changes preserve the measured production source hashes. This record describes
checks performed, not a security certification or a guarantee on other systems.

## Correctness and memory safety

- The public suite exercises decoded values, malformed input, ownership,
  resource limits, float fallback, and empty serialization output on failure.
  Both the in-process runner and a compiled executable pass.
- GCC and Clang ASan/UBSan native suites pass, including one million float bit
  patterns per run, guard pages, exact/undersized buffers, and byte-aligned ABI
  references and float arrays.
- The production CMake library passed one million libFuzzer cases each with
  default SSE2, native AVX2, and scalar scanner branches. After expanding escape
  capacity coverage, another 100,000 cases passed in each mode. The seed is 219;
  corpus mutation and coverage can differ between compiler versions and runs.
- Independent GPT-6.1 Sol reviews at ultra reasoning checked the fuzz harness
  and optimized native kernels. Findings about successful array-format coverage,
  exact scanner positions and full-block escape capacities were addressed.
  The final review found no confirmed production blocker in its scope.
- That final review independently exercised all three scanner variants under
  ASan/UBSan, with scalar scanner/escape oracles, guarded buffers, float round
  trips and exact capacity checks. It also verified that ordinary Release builds
  do not enable sanitizer or fuzz instrumentation.

The public suite and native harness are checked into this repository. Reproduce
the maintained checks with the compiler pinned in [GOOSE_REVISION](../GOOSE_REVISION):

```sh
make setup
make check test
make test-native CXX=clang++
make test-native CXX=g++
make fuzz-native FUZZ_RUNS=1000000
make fuzz-native FUZZ_FLAGS=-march=native FUZZ_RUNS=1000000
make fuzz-native FUZZ_FLAGS='-U__SSE2__ -U__AVX2__' FUZZ_RUNS=1000000
```

Native AVX2 coverage requires a supporting CPU. Undefining the scanner macros
exercises the scalar scanner on x86-64; it does not validate another architecture.
The independent review probes were additional one-off checks, not maintained
test targets. See [native testing](../native/README.md#testing) for the maintained
harness's scope and [the security policy](../SECURITY.md) for input boundaries.

## Performance evidence

[Benchmark results](../bench/README.md) retain all ten fixtures, baseline/candidate
comparisons, three process passes, source and executable hashes, and separate
Protobuf/DOM results. An earlier noisy recording is retained and excluded from
the current tables. The machine was shared, CPU frequency was not fixed, and
CPU pinning did not provide exclusive isolation. No universal performance
ranking or statistical-significance claim follows from these measurements.

Linux x86-64 with GCC and Clang is tested. Other operating systems and
architectures remain unverified.
