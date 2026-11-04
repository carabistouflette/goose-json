# Validation record

Recorded 2026-11-04 for the native codec measured at
`6fad097cef35c0623b45e96e84246de6b0a64a70`. Subsequent audits and source cleanups
are recorded below; timings refer to the exact benchmark source commits. This
record describes checks performed, not a security certification or a guarantee
on other systems.

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

## Maintainability cleanup

The cleanup after `ec6ac84a99a4dcc339c31d45fbfca5020aafdb79` groups the public
suite into ten named functions, documents private native span/chunk contracts,
and removes an unreachable second Unicode-escape branch. All nonblank test-body
lines were retained in their original order, except removal of one redundant
integer-to-float cast; each group is called exactly once.

The resulting native source fingerprint is
`37002ab348dd704f7eefbaafa88dac48f1ad320cf4824950ba9f313a1102ae6c`.
Public normal/debug checks, GCC/Clang ASan/UBSan suites and 100,000 fuzz cases
per SSE2/AVX2/scalar scanner configuration passed.

For each of G++ 16.2.1 and Clang 23.1.4, `native/accelerated.cpp` compiled to a
byte-identical object before and after the cleanup, using
`-O3 -DNDEBUG -std=c++17 -fPIC`, the project's namespace definitions and unchanged vendor
sources. Both default CPU flags and `-march=native` were checked. This is object
identity for those compiler/profile pairs, not a fresh latency measurement or
a guarantee for every compiler and platform.

An independent GPT-6.1 Sol ultra review found no blockers. It confirmed all 76
assertions and 20 `reject` calls were retained, checked the declared native
contracts and verified the object hashes. Targeted Clang ASan/UBSan Unicode and
chunk differentials passed 2,365,704 cases per SSE2 and portable-kernel build,
covering UTF-16 code units, surrogate boundaries, malformed escapes, capacities,
prefix lengths, guard bytes and byte-aligned references.

## Benchmark release-profile audit

The recorder at `0c26308570cbe2c6769c1bf0eba8d86e7e8ad681` retained inherited
`CARGO_PROFILE_RELEASE_OPT_LEVEL=0`. A tiny offline Cargo project confirmed that
this produced an unoptimized release executable despite a manifest requesting
optimization 3. This was a measurement-configuration defect; the codec was not
changed during this audit.

The recorder now clears inherited profile overrides, supplies an explicit
top-level release configuration, forces `CARGO_INCREMENTAL=0`, and checks the
observed executable profile before timing. Requested settings and observed Cargo
fields are distinct metadata. Unit regressions cover environment isolation,
artifact selection and rejected optimization/debug/assertion/overflow/test
profiles. A complete native recorder smoke run passed with conflicting release
environment settings. Separate offline probes verified conflicting manifest
settings are overridden, an actual unoptimized artifact is rejected, and
incremental environment/configuration overrides do not reach the compiler.

The independent GPT-6.1 Sol ultra review found no blocker in the runner/tests
diff. It checked portable/native/cached artifacts and real JSON from tiny offline
Cargo projects, including Cargo 1.74, 1.99 and 1.101 nightly. The review identified
the separate incremental switch; that small hardening was added and verified
afterward. This does not sandbox compiler wrappers or every package-specific
Cargo setting. No new timing comparison or library ranking follows from these
smoke tests. Previously recorded data and immutable releases are unchanged.

## Consumer formatting isolation

The pre-fix codec allowed application `format` overloads to erase its error
text (including the nonempty-error failure signal), replace integer output,
and alter portable float digits/exponents. The fix constructs diagnostics with
byte operations and owns JSON number layout. Bounded adapters use the pinned
Goose runtime's numeric primitives without hook lookup. Native float kernels
are unchanged. Common nonnegative integers below 10,000 use direct digits;
larger/negative integers use the bounded runtime fallback.

`tests/formatting.goose` installs no-op consumer overloads for strings, signed
and unsigned integers, floats and booleans. It checks malformed/schema/range/
UTF-8/resource-limit errors, byte offsets, empty serialization output on errors,
integer limits, float spelling/bit roundtrips, every direct-digit value and its
boundaries, and short/byte-offset runtime buffers. Normal/debug runner and
compiled suites pass. `make test-portable` adds compiled debug portable mode
and standalone runtime linkage.

The final source passed a 44,586-line byte differential against the pre-fix,
hook-free baseline in TinyCC release/debug, GCC portable/native and Clang debug
portable modes. The same output matched under Clang ASan/UBSan with portable
formatting. Generated Goose C, pinned runtime and the production C++ library
were instrumented in a fresh cache; normal and portable consumer suites and the
public codec suite passed with sanitizer errors fatal.

An independent GPT-6.1 Sol ultra combined review found no blockers in the
diagnostic/numeric fix before the small integer fast path. It compared 52,796
lines in six backend configurations and independently verified 48,572 float
bit roundtrips and 4,103 integer roundtrips. ABI probes checked short buffers,
16 alignments, canaries and 10,000 numeric patterns under ASan/UBSan. A focused final
Sol ultra review also found no blockers in the direct-digit path and portable CI.
Its independent Python oracle matched 30,047 output lines across four build
configurations, including every fast-path value, struct/array output, integer
limits and diagnostic offsets crossing 10,000. It independently ran all maintained
normal/debug/portable targets and checked standalone/separate-runtime linkage.
Reviewed final `json_codec.goose` SHA256:
`bf8ed4ef1b7258df3dde3172e5a98606dfc86d17e29483a57f1111ee4dae67ca`.

A fresh full recorder run measured source
`ca9b0dce42061c38e72d05233ee229874dc5b682` against public baseline
`0c26308570cbe2c6769c1bf0eba8d86e7e8ad681`, with pinned Rust JSON/Protobuf
comparisons, native CPU tuning and CPU 4 affinity. All nine shuffled process
outputs and 2,520 batch averages are retained in the
[formatter recording](../bench/results/formatter-native-2026-11-04). The README
tables use every pass. This shared host had no core reservation or fixed
frequency; observed slower cases are reported alongside improvements. No
universal performance ranking or security certification follows. Earlier
exploratory scratch/in-place variants were not substituted into this recording.

Publication checks also passed from a standalone public clone using the pinned
compiler: manifest verification, the example, and the standalone debug portable
consumer suite. The README's exact remote-import example was extracted to a new
project with a fresh package cache. It fetched immutable source `ca9b0dc` and
produced the documented JSON output. The quickstart now pins that reviewed fix.

## Expanded corpus and consumption audit

The benchmark-only checkpoint extends the corpus to thirteen fixtures: signed
small integers, wide integers including i64 limits, and a synthetic mixed event
with nested text and independently owned arrays. Goose uses `deserialize_into`
in all cases; both revisions use that same harness. Both languages validate
complete fixture values before timing, and Rust's numeric roundtrip checks now
compare float bits, including signed zero.

An independent GPT-6.1 Sol ultra review found one checksum inconsistency: Goose
uses nonnegative modulo, whereas Rust used signed remainder for negative integer
endpoints. Decoded values were correct; timed result consumption differed. The
review otherwise found no scoped blocker and ran 69 mutation probes, all rejected
before affected-fixture timing, including middle-array and signed-zero changes.

Rust now uses `rem_euclid(1024)`. Four recorder regressions cover mismatched
checksums/counts and missing/duplicate fixtures. All thirteen recorder tests pass;
the corrected smoke run has identical typed-decoder checksums for every fixture.
The recorder marks validation failed and stops if any typed implementation or
revision consumes different values/counts. All three initial probe passes finished
normally and are retained separately; the new guard rejects each one.

The accepted recording at harness source
`4835c5041ec69605f6b027a11b365f860f2c9ef8` uses fixed `v0.1.1` as baseline.
Production codec/native files match that release byte-for-byte. All nine process
outputs and 3,276 batch averages are retained, with every pass contributing to
the tables and `typed_decode_checksums: passed` in provenance. This establishes
controls for the expanded corpus; before/after differences are not codec speedups.
See [results and full provenance](../bench/results/corpus-native-2026-11-04).

Separate encode-only gprof builds instrument the generated C, runtime and native
library. All six profiles run after the initial recording and before the accepted
rerun, on CPU 4; their times never contribute to benchmark results. Hardware
sampling was denied, and host security settings were not changed. Coarse leads
are integer conversion/copying, native float digit/layout work and string
escaping/validation. Source, flags, hashes, checksums, reproduction steps and all
flat-profile exports are retained. Instrumentation changes costs and inlining;
profile distributions are not latency estimates or achievable-speedup claims.
