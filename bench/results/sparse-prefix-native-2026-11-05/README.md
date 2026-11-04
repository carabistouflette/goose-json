# Prefix reuse experiments: rejected

The existing `v0.1.3` writer is retained. Two safe-prefix reuse variants passed
correctness checks but introduced repeatable dense-text encoding regressions.
Keeping the regression gate matters more than adopting a narrow sparse gain.

[All results and methods](REPORT.md) include every fixture and all 9,828 timed
batch averages. All source commits remain available in Git history.

| Recording | Source | Role |
| --- | --- | --- |
| [Initial probe](probe) | `ff7fe29` | Short-count exploratory full API/comparison series |
| [Broad series](recording) | `8bda7e7` | Confounded long full API/comparison series |
| [Alternating pairs A](paired) | `8bda7e7` | Rejected unconditional prefix reuse |
| [Alternating pairs B](paired-conditional) | `e665f0c` | Rejected conditional reuse at 32 bytes |

Every baseline is immutable `v0.1.3`,
`aae48035f73e09b51011950ff12bfe424e0ec921`. The probe and broad variant have
identical production code; their source difference strengthens tests only.
Metadata includes exact commits, source/executable hashes, flags/profiles,
process order, validation results and available scheduling diagnostics.
CSV exports normalize CRLF to LF only; every row value and its order is preserved.
The directory date is local Paris time; metadata timestamps are UTC.

## Reproduce a paired variant

Use a fresh disposable **full clone** containing this report. The two runner
files were added after the measured commits. Save them, switch to the exact
candidate, and restore the runner files as untracked artifacts before running:

```sh
json_pair_tools=$(mktemp -d)
cp bench/results/sparse-prefix-native-2026-11-05/paired.goose "$json_pair_tools/"
cp bench/results/sparse-prefix-native-2026-11-05/paired.py "$json_pair_tools/"
git switch --detach e665f0c
mkdir -p bench/results/sparse-prefix-native-2026-11-05
cp "$json_pair_tools/paired.goose" bench/results/sparse-prefix-native-2026-11-05/
cp "$json_pair_tools/paired.py" bench/results/sparse-prefix-native-2026-11-05/
python3 bench/results/sparse-prefix-native-2026-11-05/paired.py \
  --goose /absolute/path/to/pinned/goose --cpu 4 --build-cpu 3 \
  --output .build/reproduce-prefix-pairs
```

Choose allowed CPU indices. Use `8bda7e7` instead of `e665f0c` for variant A.
The runner refuses nonempty output directories. It freezes two executables
with controlled native flags and a fresh shared compiler cache, hashes inputs,
alternates revision order, shuffles fixtures, retains every row and rejects
paired count/byte-length/checksum disagreement or input mutation. It compares
the checked-out candidate, **not** the final retained writer on main.

For the earlier broad/probe method, use `bench/measure.py` at the recorded
source with `--native --cpu 4 --runs 3`, baseline full SHA above, and respectively
`--iterations 200000` or `20000`. Fixture construction, Cargo profiles, CPU
frequency/isolation limits and different API/format contracts are documented
in [the benchmark guide](../../README.md).
