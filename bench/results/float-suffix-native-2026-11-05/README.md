# Float suffix experiments: baseline retained

Two bounded exponent-normalization variants passed correctness checks but did
not meet the overall performance gate. Production code remains `v0.1.3`.
The useful retained changes are exact canonical-number tests and a recorder
with matched build paths, fresh caches and an identical-executable A/A control.

[Complete results and methods](REPORT.md) retain every fixture, regression and
all **8,190 batch averages**. Earlier source/build procedures remain separate;
no timing is corrected or normalized against a control.

| Recording | Candidate source | Build procedure | Role |
| --- | --- | --- | --- |
| [Five-byte scan](paired) | `75142a6` | Legacy asymmetric paths | Diagnostic |
| [Four-byte scan](paired-four) | `d0d1452` | Legacy asymmetric paths | Diagnostic |
| [Identical-source control](control) | `79dafea` | Legacy asymmetric paths | Diagnostic |
| [Identical-executable control](fixed-control) | `79dafea` | Matched paths/fresh caches | Control |
| [Four-byte scan](fixed-four) | `d0d1452` | Matched paths/fresh caches | Acceptance: not adopted |

Every baseline is immutable `v0.1.3`,
`aae48035f73e09b51011950ff12bfe424e0ec921`. Restored-writer source `79dafea` has
identical production/native/build files. Metadata records full source commits,
harness revisions, input/byte/executable hashes, compiler settings, ordering and
validation. The matched recorder also records `.text`/`.rodata` hashes.
CSV exports normalize CRLF to LF only; every row value/order remains unchanged.
The directory date is local Paris time; metadata timestamps are UTC.

## Reproduce

Use a disposable full clone and the pinned compiler. The recorded matched-build
harness revision is `e0877fe`; it accepts a separate candidate Git revision,
extracts both sources to one temporary path without rewriting checked-out sources
or the Git index.
GNU binutils (`objcopy`) is required for code/rodata hashes, alongside Git,
Python, Linux `taskset`, CMake and a C/C++ toolchain.

```sh
git switch --detach e0877fe6ebe20d3c067193311e6b065f2d14aef4
python3 bench/results/float-suffix-native-2026-11-05/fixed-paired.py \
  --goose /absolute/path/to/pinned/goose --candidate d0d1452de92e24a1fc5b437daad0148ab9122e07 \
  --cpu 4 --build-cpu 3 --output .build/reproduce-float-suffix
```

Use candidate `79dafea9c2d3511c3dfa68ff62a2631617dce9a4` for the identical-production control; choose allowed CPU
indices. Outputs must be new/empty. Both versions use the same absolute source,
entry, cache and output paths, with a cleared cache before each build. All source
file sets must match. Archived native fingerprints are checked; the completed
binaries are copied/frozen before any timing. The common [typed entry](../sparse-prefix-native-2026-11-05/paired.goose)
validates every fixture and exact roundtrips before its warmup/timed encode loop.

For the legacy runs, check out the recorded candidate and run the unchanged
[legacy recorder](../sparse-prefix-native-2026-11-05/paired.py) with the same
compiler/CPU/output arguments, omitting `--candidate`. It compares the checkout
against fixed `v0.1.3`; its unmatched build paths are part of those old records.
Shared-host, fixed-distribution and timing-scope limitations apply to every run.
