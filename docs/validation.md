# Validation record

Recorded 2026-11-04 for the native codec measured at
`6fad097cef35c0623b45e96e84246de6b0a64a70`. Subsequent documentation and test
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
  default SSE2, native AVX2, and scalar scanner branches. The seed is 219;
  corpus mutation and coverage can differ between compiler versions and runs.
- Independent GPT-6.1 Sol reviews at ultra reasoning checked the fuzz harness
  and optimized native kernels. Findings about successful array-format coverage,
  exact scanner positions and full-block escape capacities were addressed.
  The subsequent sparse-run/decimal-helper review also found no confirmed
  production blocker in its scope.
- The sparse-run review independently exercised all three scanner variants under
  ASan/UBSan. Each passed 278,538 exact string comparisons against the preceding
  codec and independent scalar oracles, 931,264 float/capacity checks and 40,000
  packed-array comparisons. Guarded buffers, partial error writes, chunk
  positions, signed zero and exact float spelling were checked. Additional
  maintained million-pattern tests and the previous guarded oracle also passed.
- Production source fingerprint for that review:
  `fa77dfc961568613cc6a6b0cfa20cd7644f5e27e502ae46b6c55afb03ac3994d`.
  Ordinary Release builds keep sanitizer and fuzz instrumentation disabled.

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

## Public-contract audit after 0.1.0

An additional 2026-11-04 audit targeted the released codec at
`ea9133d94d14a4b8a381437d7983ba8fe1a836f1`. No new reproducible production bug
was found in that scope. Production Goose/native code, benchmark harnesses and
dependencies are unchanged by the subsequent test/CI improvements.

- An independent GPT-6.1 Sol ultra review exercised 99,420 inputs per backend:
  native debug, forced-portable debug and TinyCC. It found no acceptance or
  decoded-value discrepancy. Another 21,291 float cases passed per compiled
  backend, including bit comparisons with the pinned standard reader.
- That review also checked nested/empty structs, malformed and escaped keys,
  duplicate/unknown fields, resource limits, destination reuse, ownership and
  partial-error behavior. Direct input/destination aliasing and aliasing through
  a containing record were rejected by Goose's lifetime checker.
- A separate Python JSON oracle checked 6,686 root scalar/array, Unicode,
  malformed-input and limit cases. The campaign passed in the debug runner and
  a native debug executable built with Clang ASan/UBSan, comparing expected
  values and finite float bits as well as serialization round-trips.
- `make test-debug` passed in runner and compiled modes and is now required in
  CI. It enables Goose's debug overflow, cast-range and tag checks.
- The maintained fuzzer now checks exact escaped bytes against a bytewise
  oracle. A temporary paired newline/tab swap in encoder and decoder passed the
  former round-trip-only check and was rejected by the new oracle. Another
  100,000 fuzz cases passed in each of SSE2, AVX2 and scalar scanner modes.

The public-contract/Python probes and mutation experiment were one-off audit
tools; they are not maintained CI targets. The debug suite and escaped-byte
oracle are maintained in this repository. This audit does not extend platform
support or establish a universal security guarantee.
