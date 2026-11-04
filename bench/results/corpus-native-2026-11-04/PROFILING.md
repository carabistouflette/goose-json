# Encode-only profiling

These six profiles use the public typed `serialize` API, including fresh output,
validation and cleanup. The frozen [entry](profile.goose) validates complete input
and a bit-exact roundtrip before its encode loop. See [metadata](profile-metadata.json)
for iteration counts, source/binary hashes, flags and checksums. Production codec
source is the fixed `v0.1.1` implementation.

Hardware sampling with `perf record` was denied on this host. No host security
settings were changed. These are separate GNU gprof builds: `-pg -g
-fno-omit-frame-pointer -march=native`, Goose `-O2 --standalone`, native C++ Release
`-O3 -DNDEBUG`. The pinned runtime and native library are instrumented too. All
profiling runs used CPU 4, after the initial recording completed and before the
accepted rerun. They never contribute latency values to the benchmark tables.

Instrumentation changes function/call costs and inlining. Sampling has 10 ms
granularity and includes initialization/preflight/final checksum printing.
Treat the distributions as coarse leads for experiments, not estimates of
uninstrumented latency or achievable speedups. Inline work is attributed to its
containing function. The shared host was not isolated or frequency-fixed.

## Findings

- Signed small integers: the generated typed writer, runtime integer conversion
  and copying dominate. Negative values take the bounded runtime fallback; the
  direct-digit path currently covers nonnegative values below 10,000.
- Wide integers: runtime unsigned magnitude conversion dominates; this is a
  separate problem from the small-negative fast path.
- Simple floats: Dragonbox digit selection is the principal sampled cost.
- Wide floats: native numeric layout and Dragonbox digit emission dominate.
- Sparse/dense strings: escaping and UTF-8 validation dominate. Validation is
  part of the API contract and must be preserved by any optimization.

The first narrow experiment should extend direct-digit formatting to small
negative integers, preserving the runtime fallback at the i64 limits. Measure it
with the full corpus; then investigate wide-integer conversion independently.
Float/text profiles remain useful follow-up targets.

## Reproduce

Use the published checkout containing this recording. The profiling entry is a
recording artifact added after the measured harness commit; verify the codec
hash in `profile-metadata.json` and native hashes in `recording/metadata.json`
before profiling a later checkout.
Save the two wrappers below beside one another in a temporary directory and make
them executable; Goose finds the C++ driver beside the C wrapper.

`cc`:

```sh
#!/bin/sh
exec gcc -pg -g -fno-omit-frame-pointer -march=native "$@"
```

`g++`:

```sh
#!/bin/sh
exec g++ -pg -g -fno-omit-frame-pointer -march=native "$@"
```

From the library root, with `json_profile` pointing to that temporary directory:

```sh
GOOSE_HOME="$json_profile/home" goose build \
  bench/results/corpus-native-2026-11-04/profile.goose \
  --cc "$json_profile/cc" --standalone -O2 -o "$json_profile/profile"
GMON_OUT_PREFIX="$json_profile/array-signed.gmon" taskset -c 4 \
  "$json_profile/profile" array-signed 250000
gprof --flat-profile --no-demangle "$json_profile/profile" \
  "$json_profile"/array-signed.gmon.*
```

Use fresh profile-output prefixes. The other fixture names/counts are listed in
metadata. Flat-profile exports for every run are retained next to this file, with only
trailing spaces removed;
binaries, gmon/perf data and generated builds are excluded from publication.
