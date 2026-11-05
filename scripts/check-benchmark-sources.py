#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Check whether the retained benchmark implementation still matches this tree."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
METADATA = ROOT / 'bench/results/release-013-native-2026-11-04/recording/metadata.json'
RELEASE = 'aae48035f73e09b51011950ff12bfe424e0ec921'
PUBLISHED_BASE = 'a088d90e3c10b14304f60706a820f4f41745689f'


def git_bytes(revision, path):
    return subprocess.check_output(['git', 'show', f'{revision}:{path}'], cwd=ROOT)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def build_fields(data):
    # The generated source-hash comment also changes when native/README.md changes.
    return b'\n'.join(line.strip() for line in data.splitlines()
                      if line.strip() and not line.lstrip().startswith(b'//'))


def benchmark_make(data):
    # Only verification recipes may differ. All other Make directives match.
    result, verification = [], False
    for line in data.splitlines():
        if line and not line.startswith((b'\t', b' ', b'#')):
            verification = line.split(b':', 1)[0] in (b'check', b'test')
        if not (verification and line.startswith(b'\t')):
            result.append(line)
    return b'\n'.join(result)


def check():
    metadata = json.loads(METADATA.read_text())
    measured = metadata['source_head']
    tag = subprocess.check_output(['git', 'rev-parse', 'v0.1.3^{commit}'], cwd=ROOT, text=True).strip()
    if tag != RELEASE:
        raise ValueError('v0.1.3 does not resolve to its recorded release commit')
    if (ROOT / 'GOOSE_REVISION').read_text().strip() != metadata['goose_revision']:
        raise ValueError('Goose compiler pin changed: benchmark applicability needs review')
    archived = [METADATA.relative_to(ROOT).as_posix()]
    archived += [f'bench/results/release-013-native-2026-11-04/recording/run-{i}-{kind}.md'
                 for i in (1, 2, 3) for kind in ('before', 'after', 'compare')]
    for path in archived:
        if (ROOT / path).read_bytes() != git_bytes(PUBLISHED_BASE, path):
            raise ValueError('historical recording was modified: ' + path)
    paths = metadata['source_sha256']
    expected_native = {p for p in paths if p.startswith('native/')}
    actual_native = {p.relative_to(ROOT).as_posix() for p in (ROOT / 'native').rglob('*') if p.is_file()}
    if actual_native != expected_native:
        raise ValueError('native file set changed: benchmark applicability needs review')
    classified = {}
    for path, expected in paths.items():
        recorded = git_bytes(measured, path)
        current = (ROOT / path).read_bytes()
        if digest(recorded) != expected:
            raise ValueError('recorded hash does not match measured Git source: ' + path)
        if path == 'Makefile':
            if benchmark_make(recorded) != benchmark_make(current):
                raise ValueError('benchmark Make targets/settings changed')
            classified[path] = 'benchmark targets/settings identical; other check recipes may differ'
        elif path == 'native/README.md':
            classified[path] = 'documentation only; not a compiled input'
        elif path == 'json_codec.build':
            for revision in (RELEASE, PUBLISHED_BASE):
                if build_fields(git_bytes(revision, path)) != build_fields(recorded):
                    raise ValueError('release/published build configuration changed: ' + revision)
            if build_fields(current) != build_fields(recorded):
                raise ValueError('native build configuration changed')
            classified[path] = 'build fields identical; generated hash comments may differ'
        elif digest(current) != expected:
            raise ValueError('benchmark-relevant source changed: ' + path)
        if path in ('CMakeLists.txt', 'json_codec.goose') or (path.startswith('native/') and path != 'native/README.md'):
            for revision in (RELEASE, PUBLISHED_BASE):
                if git_bytes(revision, path) != recorded:
                    raise ValueError('release/published implementation differs: ' + path)
    return {'measured_source': measured, 'release': RELEASE, 'published_base': PUBLISHED_BASE,
            'recorded_files_checked': len(paths), 'immutable_recording_files_checked': len(archived),
            'compiler_pin': metadata['goose_revision'],
            'classified_noncode_inputs': classified,
            'scope': 'Same implementation/harness/fixtures/locked dependencies and benchmark settings under the recorded toolchain; not binary identity, a new timing run or a ranking guarantee.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='read-only check; also the default')
    parser.parse_args()
    try:
        result = check()
    except (OSError, ValueError, subprocess.CalledProcessError) as error:
        parser.exit(1, f'Benchmark source comparison failed: {error}\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
