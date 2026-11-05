# Which implementation do the results describe?

[Results](RESULTS.md) · [Method](README.md)

The retained thirteen-fixture comparison measured
`52473a635952b12eddbb78b4d241b24d3d9f0b21`. Its compiled codec sources match:

- Released **v0.1.3**, `aae48035f73e09b51011950ff12bfe424e0ec921`.
- Main at the start of this audit,
  `a088d90e3c10b14304f60706a820f4f41745689f`.
- This documentation update's working tree, checked in CI before publication.

This is checked by content, not inferred from dates. Run from a full Git clone:

```sh
python3 scripts/check-benchmark-sources.py --check
```

The check compares all 46 recorded file hashes with their immutable measured Git
objects and this checkout, and confirms the ten original metadata/raw-output
files are unchanged from the audited main commit. It also checks the v0.1.3 tag target, compiler pin and
native file set. It covers the codec, native headers/C++/vendors/licenses, CMake,
native fingerprint generator, benchmark entry/recorder/wrappers, every fixture
and the complete Cargo manifest/lock/source. Changes to those relevant inputs
fail the check and require a new applicability review.

Three inputs are classified separately:

| Input | Checked relationship |
| --- | --- |
| `Makefile` | Only `check`/`test` verification recipes may differ; all other directives, build recipes and benchmark settings must match |
| `native/README.md` | Documentation; not compiled |
| `json_codec.build` | All build fields match after removing comments |

The native fingerprint includes its README. This prose update therefore refreshes
the generated source-hash **comment** in `json_codec.build`, without changing its
build fields or compiled implementation. Cache/build paths can change: this
source comparison does **not** establish binary identity or predict identical
new timings.

## Toolchain and dependency scope

The record used Goose `eadca409f68210893f366e60d0c2f0dc29a339be` (runtime
`3025e5810379`), GCC/G++ 16.2.1 and Rust 1.101.0-nightly
(`822182db4`, 2026-10-13), Cargo 1.101.0-nightly (`29c5daa1a`, 2026-10-07).
The current compiler pin remains that exact Goose revision. These installed
tool versions were also checked during this documentation audit; future
installations must not assume that equality.

The locked JSON/Protobuf dependencies and transitive checksums are unchanged.
The native vendor files and their documented revisions are unchanged. Flags,
profile settings, OS/CPU and scheduling limits remain those in
[the original metadata](results/release-013-native-2026-11-04/recording/metadata.json).
A source match makes this recording applicable to the same implementation under
that toolchain; it does not turn it into a measurement of different compilers,
flags, architectures or deployment defaults.

## Historical records

The [index](results/README.md) labels all older datasets by purpose. A report's
“current”, “candidate”, “baseline” and source-identity statements refer to that
recording's named revisions, not whichever main commit a reader has checked out.
Rejected candidate tables do not describe shipped implementations. Instrumented
profiles and operation-count probes are not throughput data. The artifact
consumer profile uses its own frozen JSON v0.1.2 pin.
