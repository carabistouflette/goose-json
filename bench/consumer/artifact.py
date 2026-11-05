#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Profile the existing artifact consumer's signed-metadata read in loopback TLS.

Optional Linux diagnostic, not a production-latency or optimization benchmark.
Consumer sources/pins are extracted from immutable Git objects, never edited live.
"""
import argparse
from datetime import datetime, timezone
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import shlex
import ssl
import subprocess
import tempfile
import threading

ROOT = Path(__file__).resolve().parents[2]
CONSUMER = 'c2d190b613c541a5dba839ce380de8b111c9ab0c'
JSON_PIN = '3fa7b5275399641f8069698b6c097ea66cef7929'
PHASE_C = r'''
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
static int64_t durations[3], calls[3];
void gj_consumer_record(int64_t index, int64_t nanos) {
    if (index < 0 || index >= 3 || nanos < 0) abort();
    durations[index] += nanos;
    calls[index]++;
}
void gj_consumer_report(int64_t total) {
    fprintf(stderr, "PROFILE,%lld,%lld,%lld,%lld,%lld,%lld,%lld\n",
        (long long)total, (long long)durations[2], (long long)durations[0],
        (long long)durations[1], (long long)calls[2], (long long)calls[0], (long long)calls[1]);
}
'''


def run(args, **kwargs):
    return subprocess.run(args, check=True, timeout=600, **kwargs)


def capture(args, **kwargs):
    return run(args, stdout=subprocess.PIPE, text=True, **kwargs).stdout.strip()


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def replace_once(text, old, new):
    if text.count(old) != 1:
        raise RuntimeError('consumer source marker changed: ' + old)
    return text.replace(old, new)


def instrument(source, cli):
    source = replace_once(source, 'import std;\n', 'import std;\nimport os;\nextern fn profile_record(index: i64, nanos: i64) = "gj_consumer_record";\n')
    marker = 'fn authenticate<C>(request: const Request&, expected: u8[:], result: Result&) -> bool {\n'
    source = replace_once(source, marker, marker + '    let profile_auth = clock_ns();\n    defer profile_record(2, clock_ns() - profile_auth);\n')
    for index, statement in enumerate(('    let verified = crypto::verify_ed25519(raw, signature, key);',
                                        '    let error = json_codec::deserialize_into(raw, metadata);')):
        source = replace_once(source, statement,
                              f'    let profile_started_{index} = clock_ns();\n' + statement +
                              f'\n    profile_record({index}, clock_ns() - profile_started_{index});')
    statement = '    let result = artifact::execute(request, download_signals::received);'
    cli = replace_once(cli, statement, '    let profile_started = clock_ns();\n' + statement +
                       '\n    profile_report(clock_ns() - profile_started);')
    cli += '\nextern fn profile_report(total: i64) = "gj_consumer_report";\n'
    return source, cli


def extract(repo, dest):
    entries = run(['git', '-C', str(repo), 'ls-tree', '-rz', CONSUMER], stdout=subprocess.PIPE).stdout.split(b'\0')
    hashes = {}
    for entry in filter(None, entries):
        attributes, name = entry.split(b'\t', 1)
        mode, kind, object_id = attributes.decode().split()
        path = name.decode()
        if mode not in ('100644', '100755') or kind != 'blob' or Path(path).is_absolute() or '..' in Path(path).parts:
            raise RuntimeError('unsupported consumer Git entry: ' + path)
        data = run(['git', '-C', str(repo), 'cat-file', 'blob', object_id], stdout=subprocess.PIPE).stdout
        target = dest / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)
        target.chmod(0o755 if mode == '100755' else 0o644)
        hashes[path] = hashlib.sha256(data).hexdigest()
    return hashes


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--goose', type=Path, required=True)
    parser.add_argument('--artifact-repo', type=Path, required=True, help='clone containing the pinned consumer commit; read-only')
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--cpu', type=int, default=3)
    args = parser.parse_args()
    if args.cpu not in os.sched_getaffinity(0):
        parser.error('CPU is outside allowed affinity')
    # Affinity is inherited by compiler children and the loopback server threads.
    os.sched_setaffinity(0, {args.cpu})
    output = args.output.resolve()
    output.mkdir(parents=True, exist_ok=True)
    if any(output.iterdir()):
        parser.error('output must be empty')
    goose = args.goose.resolve()
    metadata = {'utc': datetime.now(timezone.utc).isoformat(), 'consumer_revision': CONSUMER,
                'json_pin': JSON_PIN, 'harness_revision': capture(['git', '-C', str(ROOT), 'rev-parse', 'HEAD']),
                'harness_sha256': sha(Path(__file__).resolve()), 'goose': capture([str(goose), 'version']),
                'gcc': capture(['gcc', '--version']).splitlines()[0], 'g++': capture(['g++', '--version']).splitlines()[0],
                'kernel': capture(['uname', '-srmo']), 'cpu': args.cpu,
                'backends': {p: capture(['pkg-config', '--modversion', p]) for p in ('libsodium', 'libcurl')},
                'flags': 'Goose -O2 --standalone, GCC; native dependencies Release defaults; portable CPU tuning',
                'scope': 'Instrumented nested wall-clock spans for existing artifact::execute in fresh processes against loopback HTTPS. Not production latency, CPU sampling or a before/after optimization comparison. JSON span covers deserialize_into call only, excluding metadata declaration, validation and owner cleanup; authenticate span ends in its defer before final owner rewind. Full execute includes normal cleanup but excludes CLI/startup/signal guard setup/stop. Clock/hook instrumentation perturbs execution; no Amdahl/speedup bound or allocation inference.',
                'validation': 'pending'}
    tracked = subprocess.run(['git', '-C', str(ROOT), 'show',
                              metadata['harness_revision'] + ':bench/consumer/artifact.py'],
                             stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    metadata['harness_matches_revision'] = (tracked.returncode == 0 and
        hashlib.sha256(tracked.stdout).hexdigest() == metadata['harness_sha256'])
    try:
        with tempfile.TemporaryDirectory(prefix='consumer-', dir=output) as directory:
            scratch = Path(directory)
            consumer = scratch / 'source'
            metadata['consumer_source_sha256'] = extract(args.artifact_repo.resolve(), consumer)
            entry = consumer / 'examples/download/main.goose'
            imports = dict(re.findall(r'import\s+(\w+)\s+from\s+"([^"]+)"', entry.read_text()))
            if imports.get('json_codec') != 'carabistouflette/goose-json@' + JSON_PIN:
                raise RuntimeError('consumer JSON pin changed')
            metadata['imports'] = imports
            pin = (consumer / 'GOOSE_REVISION').read_text().strip()
            if ('goose ' + pin[:7]) not in metadata['goose']:
                raise RuntimeError('Goose does not advertise the consumer compiler pin')
            spec = importlib.util.spec_from_file_location('fixture', consumer / 'tests/integration.py')
            fixture = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(fixture)
            shim = scratch / 'transport.o'
            flags = capture(['pkg-config', '--cflags', 'libcurl'])
            run(['gcc', '-std=c11', '-O2', '-Wall', '-Wextra', '-Werror', *shlex.split(flags),
                 '-c', str(consumer / 'tests/transport.c'), '-o', str(shim)])
            helper = scratch / 'phases.c'
            helper.write_text(PHASE_C)
            phases = scratch / 'phases.o'
            run(['gcc', '-std=c11', '-O2', '-Wall', '-Wextra', '-Werror', '-c', str(helper), '-o', str(phases)])
            wrapper = scratch / 'probe-cc'
            extra = [str(shim), str(phases), '-Wl,--wrap=curl_multi_add_handle', '-Wl,--wrap=curl_multi_cleanup', '-lcurl']
            wrapper.write_text('#!' + shutil.which('python3') + '\nimport os,sys\nargs=sys.argv[1:]\n'
                               'program=any(a.startswith("@") and a.endswith("/link-cc.rsp") for a in args) and not any(a in args for a in ("-c","-E","-S"))\n'
                               'os.execvp("gcc", ["gcc", *args, *(' + repr(extra) + ' if program else [])])\n')
            wrapper.chmod(0o755)
            (scratch / 'g++').symlink_to(shutil.which('g++'))
            env = dict(os.environ, GOOSE_HOME=str(scratch / 'cache'))
            for key in ('CFLAGS', 'CXXFLAGS', 'CPPFLAGS', 'LDFLAGS', 'GOOSE_STDLIB'):
                env.pop(key, None)
            binaries = {}
            original_source, original_cli = (consumer / 'artifact.goose').read_text(), entry.read_text()
            for label in ('original', 'instrumented'):
                if label == 'instrumented':
                    source, cli = instrument(original_source, original_cli)
                    (consumer / 'artifact.goose').write_text(source)
                    entry.write_text(cli)
                    metadata['instrumented_source_sha256'] = {p: sha(consumer / p) for p in ('artifact.goose', 'examples/download/main.goose')}
                binary = output / (label + '-cli')
                with (output / (label + '-build.log')).open('w') as log:
                    run([str(goose), 'build', str(entry), '--standalone', '--cc', str(wrapper), '-O2', '-o', str(binary)],
                        cwd=consumer, env=env, stdout=log, stderr=subprocess.STDOUT)
                binaries[label] = binary
            metadata['binary_sha256'] = {label: sha(path) for label, path in binaries.items()}
            ca, key = fixture.certificate(scratch)
            server = fixture.http.server.ThreadingHTTPServer(('127.0.0.1', 0), fixture.Handler)
            server.daemon_threads = True
            context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
            context.load_cert_chain(ca, key)
            server.socket = context.wrap_socket(server.socket, server_side=True)
            for name in ('request_started', 'request_done', 'header_gate', 'body_waiting', 'body_gate', 'reset_waiting', 'reset_gate'):
                setattr(server, name, threading.Event())
            server.requests = []
            size = 262144
            server.config = dict(size=size, advertised=size, code=200, chunk=65536, delay=0.0, padding=0, reset=False, header_wait=False)
            url = f'https://localhost:{server.server_port}/payload'
            signing = fixture.ed25519.Ed25519PrivateKey.from_private_bytes(hashlib.sha256(b'goose streaming download fixture').digest())
            public = signing.public_key().public_bytes(fixture.serialization.Encoding.Raw, fixture.serialization.PublicFormat.Raw).hex()
            raw = json.dumps({'url': url, 'sha256': fixture.payload_hash(size)}, separators=(',', ':')).encode()
            (output / 'metadata-fixture.json').write_bytes(raw)
            metadata.update(payload_bytes=size, payload_sha256=fixture.payload_hash(size), metadata_bytes=len(raw),
                            fixture_sha256=hashlib.sha256(raw).hexdigest(), signing_public_key=public)
            child_env = dict(env, GOOSE_DOWNLOAD_FIXTURE_URL=url, GOOSE_DOWNLOAD_FIXTURE_CA=str(ca))
            for key in ('http_proxy', 'https_proxy', 'all_proxy', 'HTTP_PROXY', 'HTTPS_PROXY', 'ALL_PROXY'):
                child_env[key] = ''
            child_env['NO_PROXY'] = 'localhost,127.0.0.1'
            thread = threading.Thread(target=server.serve_forever, daemon=True)
            thread.start()
            records = []
            try:
                requests = [('original-control', 'original', raw, True, 'None')]
                requests += [('invalid-signature', 'instrumented', raw, False, 'Signature'),
                             ('signed-invalid-json', 'instrumented', b'{"url":', True, 'Json')]
                requests += [(f'profile-{i}', 'instrumented', raw, True, 'None') for i in range(1, 8)]
                for name, label, content, valid_signature, stage in requests:
                    parent = scratch / name
                    parent.mkdir(mode=0o700)
                    path = scratch / (name + '.json')
                    path.write_bytes(content)
                    signature = signing.sign(content if valid_signature else b'not the metadata').hex()
                    before = len(server.requests)
                    completed = subprocess.run([str(binaries[label]), str(path), signature, public, url,
                                                str(parent), 'staging.part', 'verified.bin', str(size)],
                                               env=child_env, capture_output=True, timeout=30)
                    lines = completed.stderr.splitlines(keepends=True)
                    profiles = [line for line in lines if line.startswith(b'PROFILE,')]
                    stderr = b''.join(line for line in lines if not line.startswith(b'PROFILE,'))
                    clean = subprocess.CompletedProcess(completed.args, completed.returncode, completed.stdout, stderr)
                    fields = fixture.record(clean, stage, 'Applied' if stage == 'None' else 'NotAttempted', 0 if stage == 'None' else 1)
                    expected_requests = 1 if stage == 'None' else 0
                    if len(server.requests) - before != expected_requests or (parent / 'staging.part').exists():
                        raise RuntimeError('request/staging mismatch: ' + name)
                    if stage == 'None':
                        final = parent / 'verified.bin'
                        if final.stat().st_size != size or hashlib.sha256(final.read_bytes()).hexdigest() != fixture.payload_hash(size):
                            raise RuntimeError('published payload mismatch: ' + name)
                    elif any(parent.iterdir()):
                        raise RuntimeError('authentication failure mutated destination: ' + name)
                    record = {'case': name, 'stage': stage, 'requests': expected_requests, 'status': fields}
                    if label == 'instrumented':
                        if len(profiles) != 1:
                            raise RuntimeError('missing/extra phase report')
                        numbers = [int(n) for n in profiles[0].decode().strip().split(',')[1:]]
                        if len(numbers) != 7 or any(n < 0 for n in numbers):
                            raise RuntimeError('invalid phase report')
                        total, auth, verify, parse, auth_calls, verify_calls, parse_calls = numbers
                        if not (0 <= parse <= auth <= total and 0 <= verify <= auth):
                            raise RuntimeError('invalid nested phase ordering')
                        expected_calls = (1, 1, 0 if stage == 'Signature' else 1)
                        if (auth_calls, verify_calls, parse_calls) != expected_calls:
                            raise RuntimeError('signature/JSON ordering or call counts changed')
                        record.update(zip(('execute_ns', 'authenticate_ns', 'signature_ns', 'json_call_ns',
                                           'authenticate_calls', 'signature_calls', 'json_calls'), numbers))
                    elif profiles:
                        raise RuntimeError('original binary unexpectedly instrumented')
                    records.append(record)
            finally:
                server.shutdown()
                server.server_close()
                thread.join(timeout=5)
            metadata['records'] = records
            expected_sources = dict(metadata['consumer_source_sha256'])
            expected_sources.update(metadata['instrumented_source_sha256'])
            if any(sha(consumer / p) != value for p, value in expected_sources.items()):
                raise RuntimeError('consumer snapshot changed unexpectedly')
            if sha(Path(__file__).resolve()) != metadata['harness_sha256']:
                raise RuntimeError('profile harness changed during execution')
            metadata['validation'] = 'passed: original functional control; two authenticated-ordering failures with zero HTTP/destination mutation; seven signed full-workflow profiles with exact published payload/digest/status and no staging residue'
    finally:
        (output / 'results.json').write_text(json.dumps(metadata, indent=2) + '\n')


if __name__ == '__main__':
    main()
