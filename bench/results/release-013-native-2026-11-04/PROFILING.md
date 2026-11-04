# Separate encode-only profiles

These four instrumented profiles use the public typed `serialize` API with
fresh output, validation and cleanup. The [entry](profile.goose) is copied
unchanged from the historical corpus profiler. It validates the complete input
and bit-exact roundtrip before entering its encode loop. [Metadata](profile-metadata.json)
records the source/binary hashes, counts, checksums and flags; the production
source hashes are in [the timing record](recording/metadata.json).

All profiles ran on CPU3 **after** every CPU4 timing process finished. There was
no exclusive reservation or fixed frequency/turbo. No host security settings
were changed. These GNU gprof builds use `-pg -g -fno-omit-frame-pointer
-march=native`, Goose `-O2 --standalone`, and native C++ Release `-O3 -DNDEBUG`.
The fresh compiler cache also instruments the pinned runtime and native library.
No instrumented result contributes latency or speedup values to the benchmarks.

Instrumentation changes call costs, code layout and inlining. Samples have
10 ms granularity and include initialization, preflight and final printing.
Inline work is attributed to its containing function. The sparse profile has
only about a second of sampled execution. These are coarse investigation leads,
not estimates of uninstrumented cost fractions or achievable speedups.

## Findings and next experiments

- Simple floats: Dragonbox's nearest-decimal conversion is the largest sampled
  function, followed by the containing numeric formatter. A new float algorithm
  would carry substantial correctness risk; this recording does not justify
  replacing the vendored conversion.
- Wide floats: `gj_impl_number` and Dragonbox digit emission dominate. A narrow
  follow-up can inspect JSON layout/copying around the existing Dragonbox output,
  preserving canonical spelling, negative zero and exact finite roundtrips.
- Sparse and dense strings: `gj_escape_chunk` dominates, with UTF-8 validation
  also visible. A narrow follow-up can inspect repeated scanning/copying in the
  sparse path. Validation, bounded loads and exact buffer checks remain required.

No additional production optimization is introduced in this release checkpoint.
A future candidate needs exact-byte oracles, sanitizer/guard-page coverage and
matched full-API timing across all fixtures; kernel-only wins are insufficient.
The current shared-host rerun does not justify chasing small percentage changes
on unchanged float/string paths. Previous optimization experiments and all
historical timing records remain separate.

## Reproduce

Use a full checkout containing this recording, with the production codec at
`52473a635952b12eddbb78b4d241b24d3d9f0b21`. Save these wrappers beside one another
in a fresh temporary directory and make them executable. The C++ driver must be
named `g++`, beside `cc`.

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

From the library root, set `json_profile` to that temporary directory:

```sh
GOOSE_HOME="$json_profile/home" /absolute/path/to/goose build \
  bench/results/release-013-native-2026-11-04/profile.goose \
  --cc "$json_profile/cc" --standalone -O2 -o "$json_profile/profile"
GMON_OUT_PREFIX="$json_profile/floats.gmon" taskset -c 3 \
  "$json_profile/profile" floats 500000
gprof --flat-profile --no-demangle "$json_profile/profile" \
  "$json_profile"/floats.gmon.*
```

Use fresh output prefixes. Other names/counts appear in metadata. Exports retain
all numerical rows, with trailing whitespace removed; executables, gmon data,
build caches and private working notes are excluded from publication.
