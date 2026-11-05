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

## Portable float carry correction

The final signed-integer review uncovered a separate pre-existing portable-mode
abort for either sign of `9.999999999999998e36` on the published baseline. A
15-digit carry could change scale -22 to -23 and then index `POW10[23]`, beyond
its 23 elements. The correction uses the existing runtime-digit fallback before
that decrement at the lower bound. Other carry positions retain their previous
behavior. Exact-byte/bit regressions for both signs run under hostile format hooks.

The carry correction was independently reviewed alongside a separate integer
experiment. The whole corrected float routine is byte-identical in corrective
commit `e91a5ccf910b1910934e8c1b9a245d9449581c65`;
the integer writer matches the published `a6073f4` baseline. The corrective
branch has separate normal/debug, portable/standalone and sanitizer regression
validation. Optional integer experiments do not gate this repair. The fixed
`v0.1.1` tag is preserved. Native-format benchmark tables remain historical
measurements of their stated source revisions; no new speedup claim is made.

The independent Sol 6.1 ultra review found no correctness/standards blockers.
Its Python/reference oracle passed 71,158 cases per mode in seven modes:
24,247 integers, 46,846 finite floats, fourteen arrays and 51 exact diagnostics.
It covered decimal powers and neighboring values, dense carry/layout boundaries,
signed zeros, i64 limits, hostile hooks and offsets through byte 1,048,575.
Generated/runtime C passed standalone portable ASan/UBSan. The reviewer separately
reproduced the baseline abort and verified canonical spelling and exact bits
for both repaired inputs. No unchanged native fuzz/SIMD audit was repeated.

## Wide-integer conversion candidate

The GCC/Clang integer adapter uses a private header-only decimal kernel with
eight-digit blocks and mostly 32-bit tail arithmetic. The kernel requires
twenty output bytes; the existing Goose adapter still rejects slices shorter
than `GS_FMT_MAX` before writing. Signed magnitudes use unsigned subtraction,
including i64.min. TinyCC/other compilers retain the pinned runtime formatter.
The public API and canonical integer spelling are preserved.

The public normal/debug runner and compiled suites, debug portable mode and
standalone runtime linkage pass. Both GCC and Clang native ASan/UBSan suites
pass a million integer patterns against `std::to_chars`, decimal-boundary
neighbors, sixteen destination offsets, undersized buffers and guard pages.
The maintained public hostile-hook suite checks eight-/sixteen-digit block
boundaries and the signed extrema. A separate Python oracle matches 70,016
integer output lines in TinyCC release/debug, GCC native, Clang debug portable
and Clang ASan/UBSan builds, including public roundtrips.

An independent Sol 6.1 ultra review found no standards, correctness or KISS
blockers. GCC/Clang C11 and C++17 probes, Clang ASan/UBSan, one million random
integers plus one million small integers against `snprintf`, exact/short/null
spans, alignment/canary checks and guard pages passed. Independent public tests
covered TinyCC normal/debug, GCC native, Clang debug and GCC forced-portable
debug/standalone, plus exact diagnostics at byte 10,000 and 1,048,575 and extreme
float spellings. No unchanged SIMD/floating fuzz audit was repeated.

The [matched full-API recording](../bench/results/wide-integers-native-2026-11-04)
compares measured source `06622d495175842914f7381b72fd6d855733acc3` with fixed
`v0.1.2`. All thirteen fixtures, nine process outputs and 3,276 batch averages
are retained. Wide-integer encoding decreased in each of the three passes;
the aggregate median decreased 43.8%, versus 16.5% for signed small integers.
Sparse-text encoding was 0.1% slower in aggregate. Decoder/float/string kernels
were unchanged; their timing differences are not attributed to this optimization.
The third pass suffered substantial scheduling contention (Goose child CPU/wall
about 50%, Rust 68%). No samples were discarded or corrected. Review and heavy
correctness validation finished before timing, but the shared core had no
exclusive reservation or fixed frequency. No universal ranking is claimed.

## v0.1.3 release preparation

The production tree is unchanged from reviewed main
`52473a635952b12eddbb78b4d241b24d3d9f0b21`; the bounded integer kernel retains
its independent review, byte oracles and GCC/Clang sanitizer evidence above.
`make check` passed before the new timing series. CI on the release branch
repeats the maintained normal/debug/portable, native sanitizer and bounded fuzz
checks rather than introducing another private correctness campaign.

The [shared-host rerun](../bench/results/release-013-native-2026-11-04) retains all
thirteen fixtures, nine process outputs and 3,276 batch averages. Every typed
decoder checksum/count/set check passed. Baseline processes in passes 1 and 3
had child CPU/wall ratios near 83.5%, versus about 99% for candidate processes;
this asymmetric scheduling loss can favor current results. All samples and
regressions are included without correction. Courtesy coordination was
acknowledged during the series; unrestricted HTTP/crypto work could still run.
This does not establish exclusive isolation, statistical significance or a
reliable ranking. Previous recordings and immutable release tags are retained.

Four [separate profiles](../bench/results/release-013-native-2026-11-04/PROFILING.md)
ran on CPU3 after timing completed. Their instrumented entry validates full
input and exact roundtrips before encoding; source/binary hashes, counts and
checksums are retained. They identify numeric layout and escaping as narrow
follow-up investigation targets without supplying latency or speedup claims.

## Rejected sparse-prefix experiments

The [complete experiment record](../bench/results/sparse-prefix-native-2026-11-05)
retains all 9,828 timed batch averages from a short probe, a broad matched series
and two alternating encoder-pair recordings. All thirteen fixtures, regressions,
source/executable hashes and validation results are retained. The broad series
was confounded by large changes on untouched paths; neither that series nor
small changes on unrelated paths are treated as evidence of algorithmic gains.
The short process pairs also retain shared-host/frequency/layout limitations.

Both variants passed correctness checks but caused repeatable dense-encoding
regressions, including the conditional variant that preserved short-prefix
block boundaries. Neither is adopted. The production writer is restored
byte-for-byte to immutable `v0.1.3`, `aae48035f73e09b51011950ff12bfe424e0ec921`.
Native kernels, API contracts and release tags are unchanged.

Independent Sol 6.1 ultra review of the first prototype found no blocking
correctness/security/API/KISS findings. Its 4,682 Python-oracle cases passed
TinyCC normal/debug, GCC normal/debug, Clang normal/debug and forced-portable
GCC/Clang debug; immutable baseline also passed GCC/Clang debug. Coverage included
630 malformed UTF-8 cases, exact Unicode/escape bytes, multiple chunks, nested
empty-output failures and ownership. Its small maintained-test coverage finding
was fixed: the long-prefix test now retains a suffix that needs multiple output
chunks even when a prefix is skipped.

The retained tests also cover ASCII/Unicode prefixes around 32/64 bytes, exact
standard JSON output at chunk boundaries, invalid UTF-8 after escapes, and the
native threshold. Normal/debug/portable suites and end-to-end Clang ASan/UBSan
(generated C, pinned runtime and native library) passed for both tested variants
and again for the final retained writer with the stronger tests. No unchanged
SIMD/floating fuzz campaign was repeated. CI continues the maintained native
sanitizer and bounded fuzz checks.

## Float suffix bounds and matched-build measurement

The [float-suffix record](../bench/results/float-suffix-native-2026-11-05) retains
both bounded-normalization variants, a legacy identical-source control, a
matched-build identical-executable control and the corrected final comparison:
all thirteen encoder fixtures and all 8,190 timed batch averages. No timing is
corrected or normalized against a control. Differences on untouched paths are
not attributed to algorithmic changes. The final tradeoff did not meet the
acceptance bar; native/runtime/build sources remain byte-identical to `v0.1.3`.

The retained native tests check fifteen exact spellings: signed zeros, fixed/
scientific thresholds, one-/two-/three-digit exponents, maximum finite value
and both signs of the minimum subnormal. Both GCC and Clang native ASan/UBSan
suites and normal/debug/portable public suites passed for each candidate and
again for the restored formatter with the new tests.

Root's original-loop byte oracle passed 1,003,808 cases per candidate under
Clang ASan/UBSan. Independent Sol 6.1 ultra review found no blockers for either
variant. The first compiled actual baseline/candidate with GCC/Clang ASan/UBSan,
527,490 cases per compiler. The four-byte variant was independently checked
against both baselines with 298,114 patterns per compiler, including every IEEE
exponent field and decimal-power ±4 ULP neighbors. Each review covered full
buffers/lengths, finite bit roundtrips, sixteen alignments, guard pages, 7,800
chunk/capacity cases and the fifteen canonical spellings. Counts describe test
executions, not a claimed disjoint union of inputs. No unchanged SIMD/string/
integer fuzz campaign was added beyond the maintained native regression suite.

An identical-source control exposed different executables under the legacy
asymmetric build procedure. The separate matched-build recorder extracts both
Git revisions to the same source/entry/output paths, uses fresh Goose caches at
the same path and fixes production-source mtimes. Its A/A control produced
identical complete executables and matching `.text`/`.rodata` hashes. This
removes uncontrolled build-procedure differences without identifying a single
cause of old timing shifts or proving host isolation. Source/harness hashes,
input mutation checks, all samples and complete reproduction steps are retained.
Historical records and release tags remain unchanged; shared-host/frequency/
layout limitations continue to apply.
