#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Bounded nested-encoder throughput and separate whole-process peak-RSS probe."""
import argparse
import csv
from datetime import datetime, timezone
import hashlib
import json
import os
from pathlib import Path
import random
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent


def document(kind, repeats):
    unit = {'ascii': 'a', 'unicode': 'é😀', 'escapes': '\0\n"\\\t'}[kind]
    return {'id': 42, 'active': True, 'context': {'region': 7, 'leaf': {'label': unit * repeats}},
            'values': [0, -1, 9223372036854775807, -9223372036854775808]}


def expected(kind, repeats):
    return json.dumps(document(kind, repeats), ensure_ascii=False, separators=(',', ':')).encode()


def cases():
    overhead = len(expected('ascii', 0))
    result = [(f'ascii-output-{n}', 'ascii', n - overhead)
              for n in (4095, 4096, 4097, 65535, 65536, 65537, 1048575, 1048576, 1048577, 4194304)]
    return result + [('unicode-256k', 'unicode', 43690),
                     ('escapes-256k', 'escapes', 52428), ('escapes-512k', 'escapes', 104857)]


def run(args, **kwargs):
    return subprocess.run(args, cwd=ROOT, check=True, **kwargs)


def capture(args):
    return run(args, stdout=subprocess.PIPE, text=True).stdout.strip()


def hashes():
    paths = capture(['git', 'ls-files', '--', 'json_codec.goose', 'json_codec.build',
                     'CMakeLists.txt', 'GOOSE_REVISION', 'native', 'scripts/native-manifest.py']).splitlines()
    paths += ['bench/large/encoder.goose', 'bench/large/measure.py']
    return {p: hashlib.sha256((ROOT / p).read_bytes()).hexdigest() for p in paths}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--goose', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--cpu', type=int, default=4)
    parser.add_argument('--build-cpu', type=int, default=3)
    parser.add_argument('--smoke', action='store_true', help='validate two boundary cases; no measurements')
    args = parser.parse_args()
    if any(n not in os.sched_getaffinity(0) for n in (args.cpu, args.build_cpu)):
        parser.error('requested CPU is outside allowed affinity')
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    if any(output.iterdir()):
        parser.error('output must be empty')
    selected = cases() if not args.smoke else [cases()[0], cases()[8]]
    sources = hashes()
    metadata = {'utc': datetime.now(timezone.utc).isoformat(),
                'revision': capture(['git', 'rev-parse', 'HEAD']), 'source_sha256': sources,
                'goose': capture([str(args.goose.resolve()), 'version']),
                'gcc': capture(['gcc', '--version']).splitlines()[0],
                'g++': capture(['g++', '--version']).splitlines()[0],
                'kernel': capture(['uname', '-srmo']), 'cpu': args.cpu, 'build_cpu': args.build_cpu,
                'cpu_model': next(line.split(':', 1)[1].strip() for line in Path('/proc/cpuinfo').read_text().splitlines() if line.startswith('model name')),
                'flags': 'Goose -O2 --cc gcc; native C++ Release -O3 -DNDEBUG; portable CPU defaults; default data-stack reserve',
                'timing': '3 series x 3 shuffled rounds, 3 warmup encodes per process. Timed public encode, error checking, byte consumption and cleanup. Setup and validation outside timing. All samples retained.',
                'memory': '3 fresh processes per case, one encode, no warmup or preflight. GNU time maximum resident set (KiB) for whole process including startup, source construction and output; not incremental allocation or reserved virtual space.',
                'limits': 'Shared host, no isolation/fixed frequency/statistical significance/universal ranking claim. Synthetic fixed nested schema. Outputs over 1 MiB serialize successfully but exceed decoder input cap.',
                'validation': 'pending'}
    try:
        with tempfile.TemporaryDirectory(prefix='gj-large-') as directory:
            scratch = Path(directory)
            env = dict(os.environ, GOOSE_HOME=str(scratch / 'cache'))
            for key in ('CFLAGS', 'CXXFLAGS', 'CPPFLAGS', 'LDFLAGS', 'GOOSE_STDLIB'):
                env.pop(key, None)
            binary = output / 'encoder'
            with (output / 'build.log').open('w') as log:
                run(['taskset', '-c', str(args.build_cpu), str(args.goose.resolve()), 'build',
                     str(HERE / 'encoder.goose'), '--cc', 'gcc', '-O2', '-o', str(binary)],
                    env=env, stdout=log, stderr=subprocess.STDOUT)
            metadata['binary_sha256'] = hashlib.sha256(binary.read_bytes()).hexdigest()
            sizes = {}
            prefixes = {}
            for name, kind, repeats in selected:
                wire = scratch / 'encoded.json'
                run(['taskset', '-c', str(args.build_cpu), str(binary), 'validate', kind, str(repeats), str(wire)])
                oracle = expected(kind, repeats)
                if wire.read_bytes() != oracle:
                    raise RuntimeError('independent exact-byte mismatch: ' + name)
                if json.loads(oracle) != document(kind, repeats):
                    raise RuntimeError('Python oracle roundtrip mismatch: ' + name)
                sizes[name] = len(oracle)
                prefixes[name] = oracle[:2000]
            metadata['validated_sizes'] = sizes
            if not args.smoke:
                rng = random.Random(219)
                with (output / 'timing.csv').open('w', newline='') as stream:
                    writer = csv.writer(stream, lineterminator='\n')
                    writer.writerow(('series', 'round', 'case', 'iterations', 'bytes', 'elapsed_ns', 'checksum'))
                    for series in range(1, 4):
                        for round_index in range(1, 4):
                            order = selected.copy()
                            rng.shuffle(order)
                            for name, kind, repeats in order:
                                count = max(2, min(2000, 8388608 // sizes[name]))
                                text = capture(['taskset', '-c', str(args.cpu), str(binary), 'timing', kind, str(repeats), str(count)])
                                size, checksum, elapsed = map(int, text.split(','))
                                if size != sizes[name] or elapsed <= 0 or checksum != size * count + sum(prefixes[name][:count]):
                                    raise RuntimeError('invalid timing row: ' + name)
                                writer.writerow((series, round_index, name, count, size, elapsed, checksum))
                            stream.flush()
                with (output / 'memory.csv').open('w', newline='') as stream:
                    writer = csv.writer(stream, lineterminator='\n')
                    writer.writerow(('repeat', 'case', 'bytes', 'checksum', 'max_rss_kib'))
                    for repeat in range(1, 4):
                        order = selected.copy()
                        rng.shuffle(order)
                        for name, kind, repeats in order:
                            rss = scratch / 'rss.txt'
                            text = capture(['/usr/bin/time', '-f', '%M', '-o', str(rss), 'taskset', '-c',
                                            str(args.build_cpu), str(binary), 'memory', kind, str(repeats), '1'])
                            size, checksum = map(int, text.split(','))
                            peak = int(rss.read_text().strip())
                            if size != sizes[name] or checksum != size + ord('{') or peak < 0:
                                raise RuntimeError('invalid memory row: ' + name)
                            writer.writerow((repeat, name, size, checksum, peak))
                        stream.flush()
            if hashes() != sources:
                raise RuntimeError('source changed during recording')
            metadata['validation'] = 'passed: independent Python exact bytes and values, full Goose roundtrips within input cap, expected rejection above cap, invalid UTF-8 tail returns empty output'
    finally:
        (output / 'metadata.json').write_text(json.dumps(metadata, indent=2) + '\n')


if __name__ == '__main__':
    main()
