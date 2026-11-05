#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Render the retained benchmark samples; never runs a benchmark."""
import argparse
from decimal import Decimal
from pathlib import Path
import re
import statistics

ROOT = Path(__file__).resolve().parents[1]
RECORD = ROOT / 'bench/results/release-013-native-2026-11-04/recording'
LABELS = {'plain': 'Small record', 'escaped': 'Escaped / Unicode',
          'array': '1,024 nonnegative integers', 'array-signed': '1,024 signed small integers',
          'array-wide': '1,024 wide integers', 'mixed': 'Mixed event',
          'floats': '256 simple floats', 'floats-wide': '256 wide-exponent floats',
          'text-short': '64-byte ASCII text', 'text-sparse': '8 KiB sparse escapes',
          'text-ascii': '8 KiB ASCII text', 'text-escaped': 'Dense escapes / Unicode',
          'wide': '16 reversed fields'}
PATTERN = re.compile(r'<!-- samples \| ([^|]+) \| ([^|]+) \| ([^|]+) \| ([\d.,]+) -->')


def samples():
    result = {}
    for pass_index in (1, 2, 3):
        for kind in ('before', 'after', 'compare'):
            text = (RECORD / f'run-{pass_index}-{kind}.md').read_text()
            reported = {}
            for line in text.splitlines():
                fields = [v.strip() for v in line.split('|')[1:-1]]
                if len(fields) == 8 and fields[1] in LABELS:
                    reported[fields[0], fields[1], fields[2]] = Decimal(fields[5].replace(',', ''))
            for impl, fixture, operation, values in PATTERN.findall(text):
                values = [Decimal(n) for n in values.split(',')]
                key = kind, impl.strip(), fixture.strip(), operation.strip()
                if len(values) != 7 or any(n <= 0 or not n.is_finite() for n in values):
                    raise ValueError('invalid retained batch samples')
                median = reported[key[1:]]
                # Original medians have 0.1 ns precision; samples have 0.001 ns.
                if abs(statistics.median(values) - median) > Decimal('0.0505'):
                    raise ValueError('reported median inconsistent with rounded samples')
                result.setdefault(key, []).append({'median': median, 'samples': values})
    if sum(len(v['samples']) for passes in result.values() for v in passes) != 3276:
        raise ValueError('retained sample count changed')
    if any(len(passes) != 3 for passes in result.values()):
        raise ValueError('missing/duplicate process pass')
    return result


def summary(values):
    med = statistics.median(p['median'] for p in values)
    flat = [v for p in values for v in p['samples']]
    return med, min(flat), max(flat)


def render():
    data = samples()

    def cell(kind, impl, name, op):
        med, low, high = summary(data[kind, impl, name, op])
        return f'{med:,.1f} [{low:,.1f}–{high:,.1f}]'

    text = '''# Recorded results

[Method and commands](README.md) · [Workloads](CORPUS.md) · [Checked source comparison](CURRENTNESS.md)
· [Raw samples and metadata](results/release-013-native-2026-11-04/recording)

This historical run measures implementation
`52473a635952b12eddbb78b4d241b24d3d9f0b21`. The source check verifies the same
compiled implementation, harness, fixtures and locked dependencies for v0.1.3
and the audited main checkout. It is not a new measurement or binary-identity
claim; use the recorded toolchain/flags when interpreting these numbers.

## Environment and protocol

Intel Core Ultra 7 258V; Linux 7.2.11-arch1-1 x86-64; CPU4 affinity. Goose
`eadca409f68210893f366e60d0c2f0dc29a339be`, GCC/G++ 16.2.1, Rust 1.101.0-nightly
(`822182db4`), Cargo 1.101.0-nightly (`29c5daa1a`). Generated Goose C uses
`-O2 -march=native`; C++ uses Release `-O3 -DNDEBUG -march=native`; Rust uses
release optimization 3/no LTO and `-C target-cpu=native`. These are not default
portable deployment settings. Exact settings and observed Cargo profile are
in [metadata](results/release-013-native-2026-11-04/recording/metadata.json).

Thirteen JSON fixtures use owned typed values, with separate DOM/Protobuf APIs.
Each operation has up to 1,000 warmup iterations, then seven timed batches; three
process passes are shuffled with seed 219. Requested iterations are 200,000, scaled
by fixture as described in [the method](README.md#what-is-timed). All 3,276 batch
averages are preserved, including the older release and slower results.

**Cells are median [minimum–maximum], in ns/op; lower is better.** Median is the
median of three originally reported process-pass medians (rounded to 0.1 ns).
The range covers all 21 batch averages (recorded to 0.001 ns),
not a confidence interval or request-latency range. Printed precision is not
measurement accuracy. Full-value and float-bit checks occur before timing; API checks, consumption and cleanup are timed.

The host was shared, frequency/turbo not fixed and the core not isolated.
Baseline passes 1/3 had child-CPU/wall ratios 83.5%/83.7%, versus about 99% for the
measured newer-source processes. That asymmetric scheduling loss can favor the
newer source. Older recorder build/cache paths also differ between versions.
These observations do not establish an overall ranking, significance of close
results or a causal speedup on unchanged algorithms. No control is subtracted.

'''
    for operation in ('decode', 'encode'):
        text += f'## Typed JSON {operation}\n\n'
        text += '| Fixture | goose-json | sonic-rs | serde_json |\n| --- | ---: | ---: | ---: |\n'
        for name, label in LABELS.items():
            cells = [cell('after', 'goose-json', name, operation),
                     cell('compare', 'sonic-rs', name, operation),
                     cell('compare', 'serde_json', name, operation)]
            text += '| ' + label + ' | ' + ' | '.join(cells) + ' |\n'
        text += '\n'
    text += '''## Other APIs and formats

These are different contracts, not like-for-like typed JSON competitors.
Borrowing DOM does not enforce the schema and can lose wide-i64 precision.
Binary Protobuf differs in bytes, presence/default and unknown-field rules;
negative `int64` uses ten-byte varints, not zigzag `sint64`.

| Fixture | Protobuf decode | Protobuf encode | Borrowing DOM decode |
| --- | ---: | ---: | ---: |
'''
    for name, label in LABELS.items():
        cells = [cell('compare', 'prost (binary)', name, 'decode'),
                 cell('compare', 'prost (binary)', name, 'encode'),
                 cell('after', 'Goose DOM', name, 'decode')]
        text += '| ' + label + ' | ' + ' | '.join(cells) + ' |\n'
    text += '''
Input/output byte counts differ by encoding; all per-operation byte counts are
kept in the raw output tables. This page does not normalize unlike formats by
bytes or claim equivalent validation work.

## Historical release comparison

Older source is v0.1.2 (`3fa7b5275399641f8069698b6c097ea66cef7929`); newer source
is the measured 52473 commit, whose implementation matches v0.1.3/main. Both use
the same native backend and corpus. These are ratios of separately summarized
times, **not** medians of paired percentages. The scheduling/build-path caveats
above apply; changed times on unchanged decoder/float/string paths must not be
attributed to improvements to those algorithms.

| Fixture | Decode v0.1.2 → measured source (change) | Encode v0.1.2 → measured source (change) |
| --- | ---: | ---: |
'''
    for name, label in LABELS.items():
        cells = []
        for operation in ('decode', 'encode'):
            before = summary(data['before', 'goose-json', name, operation])[0]
            after = summary(data['after', 'goose-json', name, operation])[0]
            cells.append(f'{before:,.1f} → {after:,.1f} ({(after / before - 1) * 100:+.1f}%)')
        text += '| ' + label + ' | ' + ' | '.join(cells) + ' |\n'
    text += '''
The full raw release tables retain baseline variation and all 3,276 samples.
No unfavorable pass is excluded from these summaries.

## Reproduce the recording

Use a disposable full clone at the measured source, the pinned Goose compiler
and the exact compiler/dependency versions above. Cargo uses its checked-in lock
file. Choose an allowed CPU and a new output directory:

```sh
git switch --detach 52473a635952b12eddbb78b4d241b24d3d9f0b21
python3 bench/measure.py --goose /absolute/path/to/pinned/goose --native --cpu 4 \\
  --iterations 200000 --runs 3 --baseline 3fa7b5275399641f8069698b6c097ea66cef7929 \\
  --output .build/reproduce-release013
```

These commands describe a new measurement, which may vary. Changing tools,
flags, workload or machine creates a different recording. In a shared workspace,
coordinate one finite quiet window before running performance measurements.

Regenerate this summary without compiling or measuring anything:

```sh
python3 scripts/benchmark-report.py --check
python3 scripts/benchmark-report.py --write
```

`--check` verifies this page against the unchanged raw sample comments. `--write`
updates only this maintained summary, never the historical recordings.
'''
    return text


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--write', action='store_true')
    group.add_argument('--check', action='store_true')
    args = parser.parse_args()
    target = ROOT / 'bench/RESULTS.md'
    text = render()
    if args.write:
        target.write_text(text)
    elif not target.exists() or target.read_text() != text:
        parser.exit(1, 'Benchmark summary differs; run scripts/benchmark-report.py --write.\n')
    else:
        print('Benchmark summary matches all 3,276 retained samples.')


if __name__ == '__main__':
    main()
