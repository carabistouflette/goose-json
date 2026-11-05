#!/usr/bin/env python3
"""Record short shuffled, alternating full-API encoder process pairs."""
# SPDX-License-Identifier: Apache-2.0
import argparse
import csv
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import random
import resource
import shutil
import subprocess
import tempfile
import time
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
BASELINE = 'aae48035f73e09b51011950ff12bfe424e0ec921'
COUNTS = {'plain':20000, 'escaped':20000, 'array':2000, 'array-signed':2000,
          'array-wide':2000, 'mixed':2000, 'floats':500, 'floats-wide':500,
          'text-short':20000, 'text-sparse':2000, 'text-ascii':2000,
          'text-escaped':2000, 'wide':20000}

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--goose', required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--cpu', type=int, default=4)
    parser.add_argument('--build-cpu', type=int, default=3)
    args = parser.parse_args()
    allowed = os.sched_getaffinity(0)
    if args.cpu not in allowed or args.build_cpu not in allowed:
        parser.error('requested CPU is outside this process affinity')
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    if any(output.iterdir()):
        parser.error('output must be empty; preserve previous results')
    goose = str(Path(args.goose).resolve())
    spec = importlib.util.spec_from_file_location('recording', ROOT/'bench/measure.py')
    recording = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(recording)
    env = recording.build_environment(True)
    inputs = recording.source_hashes()
    extras = {'paired.goose':sha(HERE/'paired.goose'), 'paired.py':sha(__file__)}
    baseline_files = recording.capture(['git','ls-tree','-r','--name-only',BASELINE,'--',
                                       'json_codec.goose','json_codec.build','CMakeLists.txt','native']).splitlines()
    meta = {'utc':datetime.now(timezone.utc).isoformat(), 'baseline':BASELINE,
            'candidate':recording.capture(['git','rev-parse','HEAD']),
            'cpu':args.cpu, 'build_cpu':args.build_cpu, 'seed':219,
            'series':3, 'rounds_per_series':21, 'counts':COUNTS,
            'method':'Separate short encoder-only process pairs; alternate revision order by round, shuffle fixtures; full preflight/warmup outside timed loop. All samples retained.',
            'scope':'Public typed serialize with fresh output, validation, checksum consumption and cleanup. Not same-process timing. No significance/isolation/universal-ranking claim.',
            'flags':'Goose -O2, GCC -march=native; native C++ Release -O3 -DNDEBUG -march=native',
            'goose_revision':(ROOT/'GOOSE_REVISION').read_text().strip(),
            'goose_version':recording.capture([goose,'version']),
            'gcc':recording.capture(['gcc','--version']).splitlines()[0],
            'g++':recording.capture(['g++','--version']).splitlines()[0],
            'source_sha256':inputs, 'entry_runner_sha256':extras,
            'validation':'pending', 'series_timings':[]}
    with tempfile.TemporaryDirectory(prefix='gj-prefix-pairs-') as directory:
        scratch = Path(directory)
        base = scratch/'baseline'
        baseline_hashes = {}
        for filename in baseline_files:
            dest = base/filename
            dest.parent.mkdir(parents=True, exist_ok=True)
            dest.write_bytes(recording.run(['git','show',f'{BASELINE}:{filename}'], stdout=subprocess.PIPE,text=False).stdout)
            baseline_hashes[filename] = sha(dest)
        entry = base/HERE.relative_to(ROOT)/'paired.goose'
        entry.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(HERE/'paired.goose', entry)
        build_env = dict(env, GOOSE_HOME=str(scratch/'goose-home'))
        binaries = {}
        for label, source in [('before',entry), ('after',HERE/'paired.goose')]:
            binary = scratch/label
            recording.run(['taskset','-c',str(args.build_cpu),goose,'build',str(source),
                           '--cc',str(ROOT/'bench/native-cc.sh'),'-O2','-o',str(binary)],env=build_env)
            binaries[label] = str(binary)
        meta['baseline_source_sha256'] = baseline_hashes
        meta['executable_sha256'] = {k:sha(v) for k,v in binaries.items()}
        if inputs != recording.source_hashes() or extras != {'paired.goose':sha(HERE/'paired.goose'),'paired.py':sha(__file__)}:
            raise RuntimeError('input changed during compilation')
        rng = random.Random(219)
        try:
            with (output/'samples.csv').open('w', newline='') as stream:
                writer = csv.writer(stream)
                writer.writerow(['series','round','order','fixture','revision','count','bytes','elapsed_ns','checksum'])
                for series in range(1,4):
                    cpu_start = resource.getrusage(resource.RUSAGE_CHILDREN)
                    wall_start = time.perf_counter()
                    for round_index in range(21):
                        names = list(COUNTS)
                        rng.shuffle(names)
                        for name in names:
                            order = ['before','after'] if (round_index+series)%2 else ['after','before']
                            expected = None
                            for index,label in enumerate(order):
                                text = recording.run(['taskset','-c',str(args.cpu),binaries[label],name,str(COUNTS[name])],env=env,stdout=subprocess.PIPE).stdout.strip()
                                fixture,count,size,elapsed,checksum = text.split(',')
                                count,size,elapsed,checksum = map(int,(count,size,elapsed,checksum))
                                if fixture != name or count != COUNTS[name] or size <= 0 or elapsed <= 0:
                                    raise RuntimeError(f'invalid row: {text}')
                                actual = count,size,checksum
                                if expected is not None and actual != expected:
                                    raise RuntimeError(f'paired checksum/count/size mismatch: {name}')
                                expected = actual
                                writer.writerow([series,round_index+1,index+1,name,label,count,size,elapsed,checksum])
                        stream.flush()
                    cpu_end = resource.getrusage(resource.RUSAGE_CHILDREN)
                    meta['series_timings'].append({'series':series,'wall_seconds':time.perf_counter()-wall_start,
                        'child_cpu_seconds':cpu_end.ru_utime+cpu_end.ru_stime-cpu_start.ru_utime-cpu_start.ru_stime})
                    print(f'paired series {series} complete',flush=True)
            if inputs != recording.source_hashes() or extras != {'paired.goose':sha(HERE/'paired.goose'),'paired.py':sha(__file__)}:
                raise RuntimeError('input changed during recording')
            meta['validation'] = 'passed: all paired counts, byte lengths and checksums; full value/roundtrip assertions in every process'
        finally:
            (output/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')

if __name__ == '__main__':
    main()
