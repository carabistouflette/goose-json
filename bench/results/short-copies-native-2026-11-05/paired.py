#!/usr/bin/env python3
"""Record typed encode/decode pairs built at identical source/output/cache paths."""
# SPDX-License-Identifier: Apache-2.0
import argparse
import csv
import hashlib
import importlib.util
import json
import os
import platform
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
ENTRY = HERE/'paired.goose'
BASELINE = '1b8df659591fd07e071bfc6f2f79966f228b801f'
COUNTS = {'plain':20000, 'escaped':20000, 'array':2000, 'array-signed':2000,
          'array-wide':2000, 'mixed':2000, 'floats':500, 'floats-wide':500,
          'text-short':20000, 'text-sparse':2000, 'text-ascii':2000,
          'text-escaped':2000, 'wide':20000}
COUNTS = {f'{operation}/{name}':count for operation in ('encode', 'decode') for name,count in COUNTS.items()}

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def harness_hashes():
    paths = [Path(__file__).resolve(), ENTRY, ROOT/'GOOSE_REVISION',
             ROOT/'bench/measure.py', ROOT/'bench/native-cc.sh', ROOT/'bench/g++']
    paths += sorted((ROOT/'bench/fixtures').glob('*.json'))
    return {str(p.relative_to(ROOT)):sha(p) for p in paths}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--goose', required=True)
    parser.add_argument('--candidate', required=True, help='Git commit to compile; working sources are never modified')
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
    inputs = harness_hashes()
    candidate = recording.capture(['git','rev-parse','--verify',args.candidate+'^{commit}'])
    meta = {'utc':datetime.now(timezone.utc).isoformat(), 'baseline':BASELINE,
            'candidate':candidate,
            'harness_revision':recording.capture(['git','rev-parse','HEAD']),
            'build_paths':'Same absolute source, entry, compiler-cache and output paths for both revisions; cache emptied before each build',
            'cpu':args.cpu, 'build_cpu':args.build_cpu, 'seed':219,
            'os':f'{platform.system()} {platform.release()} {platform.machine()}',
            'cpu_model':next((line.split(':',1)[1].strip() for line in Path('/proc/cpuinfo').read_text().splitlines() if line.startswith('model name')),'unknown'),
            'source_mtime':'epoch0 for archived production files',
            'series':3, 'rounds_per_series':21, 'counts':COUNTS,
            'method':'Separate short typed encode/decode process pairs; alternate revision order by round, shuffle fixtures; full preflight/warmup outside timed loop. All samples retained.',
            'scope':'Public typed serialize or deserialize_into with fresh output/destination, error checks, checksum consumption and cleanup. Not same-process timing. No significance/isolation/universal-ranking claim.',
            'flags':'Goose -O2, GCC -march=native; native C++ Release -O3 -DNDEBUG -march=native',
            'goose_revision':(ROOT/'GOOSE_REVISION').read_text().strip(),
            'goose_version':recording.capture([goose,'version']),
            'gcc':recording.capture(['gcc','--version']).splitlines()[0],
            'g++':recording.capture(['g++','--version']).splitlines()[0],
            'harness_source_sha256':inputs,
            'objcopy':recording.capture(['objcopy','--version']).splitlines()[0],
            'validation':'pending', 'series_timings':[]}
    with tempfile.TemporaryDirectory(prefix='gj-short-copy-pairs-') as directory:
        scratch = Path(directory)
        work = scratch/'source'
        entry = work/HERE.relative_to(ROOT)/'paired.goose'
        entry.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(ENTRY, entry)
        cache = scratch/'goose-home'
        build_env = dict(env, GOOSE_HOME=str(cache))
        binaries, source_maps, section_hashes = {}, {}, {}
        common_files = None
        for label, revision in [('before',BASELINE), ('after',candidate)]:
            files = recording.capture(['git','ls-tree','-r','--name-only',revision,'--',
                'json_codec.goose','json_codec.build','CMakeLists.txt','native','scripts/native-manifest.py']).splitlines()
            if common_files is not None and files != common_files:
                raise RuntimeError('revision source file sets differ; unsupported by this matched recorder')
            common_files = files
            source_maps[label] = {}
            for filename in files:
                dest = work/filename
                dest.parent.mkdir(parents=True, exist_ok=True)
                dest.write_bytes(recording.run(['git','show',f'{revision}:{filename}'],stdout=subprocess.PIPE,text=False).stdout)
                os.utime(dest, (0,0))
                source_maps[label][filename] = sha(dest)
            recording.run(['python3',str(work/'scripts/native-manifest.py'),'--check'])
            if cache.exists():
                shutil.rmtree(cache)
            compiled = work/'encode-pairs'
            recording.run(['taskset','-c',str(args.build_cpu),goose,'build',str(entry),
                '--cc',str(ROOT/'bench/native-cc.sh'),'-O2','-o',str(compiled)],env=build_env)
            frozen = scratch/label
            shutil.copy2(compiled, frozen)
            binaries[label] = str(frozen)
            section_hashes[label] = {}
            for section in ('.text','.rodata'):
                exported = scratch/(label+section+'.bin')
                recording.run(['objcopy','-O','binary','--only-section='+section,str(frozen),str(exported)])
                section_hashes[label][section] = sha(exported)
        meta['baseline_source_sha256'] = source_maps['before']
        meta['candidate_source_sha256'] = source_maps['after']
        meta['executable_sha256'] = {k:sha(v) for k,v in binaries.items()}
        meta['section_sha256'] = section_hashes
        meta['identical_production_sources'] = source_maps['before'] == source_maps['after']
        meta['identical_executables'] = meta['executable_sha256']['before'] == meta['executable_sha256']['after']
        meta['identical_code_and_rodata'] = section_hashes['before'] == section_hashes['after']
        (output/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')
        if inputs != harness_hashes():
            raise RuntimeError('harness input changed during compilation')
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
            if inputs != harness_hashes():
                raise RuntimeError('input changed during recording')
            meta['validation'] = 'passed: all paired counts, byte lengths and checksums; full value/roundtrip assertions in every process'
        finally:
            (output/'metadata.json').write_text(json.dumps(meta,indent=2)+'\n')

if __name__ == '__main__':
    main()
