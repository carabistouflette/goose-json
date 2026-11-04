#!/usr/bin/env python3
"""Build, then record repeated process-order-shuffled comparisons. Stdlib only."""
# SPDX-License-Identifier: Apache-2.0
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import random
import shutil
import subprocess
import tempfile
import time
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parent.parent
RUST_RELEASE_PROFILE = {
    "opt-level": 3,
    "debug": 0,
    "debug-assertions": False,
    "overflow-checks": False,
    "lto": False,
    "codegen-units": 16,
    "incremental": False,
    "panic": "unwind",
    "strip": "none",
}


def run(command, **kwargs):
    return subprocess.run(command, cwd=ROOT, check=True, **dict({"text": True}, **kwargs))


def capture(command):
    return run(command, stdout=subprocess.PIPE).stdout.strip()


def source_hashes(output=None):
    # main requires an initially empty output directory. Its generated metadata
    # is not a source input, even when the directory is below bench/.
    paths = [ROOT / "json_codec.goose", ROOT / "Makefile", ROOT / "CMakeLists.txt", ROOT / "json_codec.build", ROOT / "bench/g++", ROOT / "scripts/native-manifest.py"]
    paths += [p for p in (ROOT / "native").rglob("*") if p.is_file()]
    bench = ROOT / "bench"
    paths += [
        p for p in bench.rglob("*")
        if p.is_file()
        and not {"target", "results"}.intersection(p.relative_to(bench).parts)
        and p.suffix in (".goose", ".rs", ".toml", ".lock", ".json", ".py", ".sh")
    ]
    return {
        str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
        for p in sorted(paths)
        if output is None or output not in p.parents
    }


def build_environment(native):
    # CMake caches inherited flags at configuration time. Control them and use
    # a fresh Goose cache so candidate and baseline cannot reuse unequal builds.
    env = {key: value for key, value in os.environ.items()
           if not key.startswith("CARGO_PROFILE_")}
    for name in ("CFLAGS", "CXXFLAGS", "CPPFLAGS", "LDFLAGS",
                 "CMAKE_TOOLCHAIN_FILE", "GOOSE_STDLIB", "CARGO_ENCODED_RUSTFLAGS"):
        env.pop(name, None)
    env["RUSTFLAGS"] = "-C target-cpu=native" if native else ""
    # Cargo's separate incremental switch can override profile.release settings.
    env["CARGO_INCREMENTAL"] = "0"
    return env


def release_profile_args():
    args = []
    for key, value in RUST_RELEASE_PROFILE.items():
        args.extend(["--config", f"profile.release.{key}={json.dumps(value)}"])
    return args


def comparison_artifact(output):
    expected = {
        "opt_level": str(RUST_RELEASE_PROFILE["opt-level"]),
        "debuginfo": RUST_RELEASE_PROFILE["debug"],
        "debug_assertions": RUST_RELEASE_PROFILE["debug-assertions"],
        "overflow_checks": RUST_RELEASE_PROFILE["overflow-checks"],
        "test": False,
    }
    for line in output.splitlines():
        artifact = json.loads(line)
        if not artifact.get("executable") or artifact.get("target", {}).get("name") != "goose-json-compare":
            continue
        profile = artifact.get("profile", {})
        if any(profile.get(key) != value for key, value in expected.items()):
            raise RuntimeError(f"Cargo comparison executable has an unexpected release profile: {profile}")
        return artifact
    raise RuntimeError("Cargo did not produce the goose-json-compare executable")


def validate_decode_checksums(output, index):
    """All typed decoders must consume the same values and iteration counts."""
    expected = None
    for label, implementations in (("before", ("goose-json",)),
                                   ("after", ("goose-json",)),
                                   ("compare", ("serde_json", "sonic-rs", "prost (binary)"))):
        groups = {name: {} for name in implementations}
        for line in (output / f"run-{index}-{label}.md").read_text().splitlines():
            cells = [cell.strip() for cell in line.split("|")[1:-1]]
            if not line.startswith("| ") or len(cells) != 8:
                continue
            implementation, fixture, operation = cells[:3]
            if implementation not in groups or operation != "decode":
                continue
            if fixture in groups[implementation]:
                raise RuntimeError(f"duplicate decode row: {label}/{implementation}/{fixture}")
            groups[implementation][fixture] = (int(cells[4]), int(cells[7]))
        for implementation, values in groups.items():
            if not values:
                raise RuntimeError(f"missing typed decode rows: {label}/{implementation}")
            if expected is None:
                expected = values
            elif values != expected:
                raise RuntimeError(f"typed decode checksum/iteration/fixture mismatch: {label}/{implementation}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--goose", default=os.environ.get("GOOSE", ".toolchain/goose/build/goose"))
    parser.add_argument("--baseline", default="05b81674e101e349ea40a379011418963a7a9794")
    parser.add_argument("--iterations", type=int, default=100000)
    parser.add_argument("--runs", type=int, default=3)
    parser.add_argument("--cpu", type=int)
    parser.add_argument("--native", action="store_true")
    parser.add_argument("--output", type=Path, default=Path(".build/measurements"))
    args = parser.parse_args()
    if not 1 <= args.iterations <= 10000000 or not 1 <= args.runs <= 100:
        parser.error("iterations must be 1..10000000 and runs 1..100")
    if args.cpu is not None and (not hasattr(os, "sched_getaffinity") or args.cpu not in os.sched_getaffinity(0)):
        parser.error("--cpu must be in this process's Linux CPU affinity")
    goose = str((ROOT / args.goose).resolve())
    baseline = capture(["git", "rev-parse", "--verify", args.baseline + "^{commit}"])
    source = capture(["git", "rev-parse", "HEAD"])
    output = (ROOT / args.output).resolve()
    if output == ROOT / "native" or ROOT / "native" in output.parents:
        parser.error("--output cannot be inside native sources (it invalidates the package fingerprint)")
    output.mkdir(parents=True, exist_ok=True)
    if any(output.iterdir()):
        parser.error("--output must be empty (preserve previous measurements)")
    run(["python3", "scripts/native-manifest.py", "--check"])
    run(["python3", "bench/fixtures.py", "--check"])
    hashes = source_hashes(output)
    cc = str(ROOT / "bench/native-cc.sh") if args.native else "gcc"
    # An explicit profile avoids inheriting undisclosed Rust code-generation flags.
    env = build_environment(args.native)
    rustflags = env["RUSTFLAGS"]
    with tempfile.TemporaryDirectory(prefix="goose-json-measure-") as directory:
        base = Path(directory)
        build_env = dict(env, GOOSE_HOME=str(base / "goose-home"))
        # Freeze each executable: a concurrent portable smoke build must not
        # replace a binary between recorded runs.
        run([goose, "build", "bench/bench.goose", "--cc", cc, "-O2", "-o", str(base / "after")], env=build_env)
        artifacts = run(["cargo", "build", "--locked", "--release", "--message-format=json",
                         "--target-dir", ".build/compare-native" if args.native else ".build/compare-portable",
                         "--manifest-path", "bench/compare/Cargo.toml", *release_profile_args()],
                        env=env, stdout=subprocess.PIPE).stdout
        artifact = comparison_artifact(artifacts)
        shutil.copy2(artifact["executable"], base / "compare")
        (base / "bench").mkdir()
        files = capture(["git", "ls-tree", "-r", "--name-only", baseline, "--", "json_codec.goose", "json_codec.build", "CMakeLists.txt", "native"]).splitlines()
        for filename in files:
            destination = base / filename
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_bytes(run(["git", "show", f"{baseline}:{filename}"], stdout=subprocess.PIPE, text=False).stdout)
        shutil.copy(ROOT / "bench/bench.goose", base / "bench/bench.goose")
        shutil.copytree(ROOT / "bench/fixtures", base / "bench/fixtures")
        run([goose, "build", str(base / "bench/bench.goose"), "--cc", cc, "-O2", "-o", str(base / "before")], env=build_env)
        commands = {
            "before": [str(base / "before"), str(args.iterations)],
            "after": [str(base / "after"), str(args.iterations)],
            "compare": [str(base / "compare"), str(args.iterations)],
        }
        metadata = {
            "utc": datetime.now(timezone.utc).isoformat(),
            "baseline": baseline, "source_head": source,
            "goose_revision": (ROOT / "GOOSE_REVISION").read_text().strip(),
            "goose_version": capture([goose, "version"]),
            "g++": capture(["g++", "--version"]).splitlines()[0],
            "native_cxx_flags": "-O3 -DNDEBUG" + (" -march=native" if args.native else ""),
            "gcc": capture(["gcc", "--version"]).splitlines()[0],
            "rustc": capture(["rustc", "--version"]),
            "cargo": capture(["cargo", "--version"]),
            "os": f"{platform.system()} {platform.release()} {platform.machine()}",
            "cpu": next((line.split(":", 1)[1].strip() for line in Path("/proc/cpuinfo").read_text().splitlines() if line.startswith("model name")), "unknown") if Path("/proc/cpuinfo").exists() else platform.processor(),
            "affinity_cpu": args.cpu, "iterations": args.iterations,
            "goose_flags": "-O2", "gcc_flags": "-O2" + (" -march=native" if args.native else ""),
            "rustflags": rustflags, "rust_profile": artifact["profile"],
            "rust_release_config": RUST_RELEASE_PROFILE,
            "goose_cache": "isolated per recording",
            "inherited_c_cpp_flags": False,
            "process_order_seed": 219, "runs": [], "process_timings": [],
            "executable_sha256": {name: hashlib.sha256(Path(command[0]).read_bytes()).hexdigest() for name, command in commands.items()},
            "source_sha256": {},
        }
        metadata["source_sha256"] = hashes
        if source_hashes(output) != hashes:
            raise RuntimeError("sources changed during compilation; discard this measurement")
        rng = random.Random(219)
        for index in range(1, args.runs + 1):
            order = list(commands)
            rng.shuffle(order)
            metadata["runs"].append(order)
            for name in order:
                command = commands[name]
                if args.cpu is not None:
                    command = ["taskset", "-c", str(args.cpu)] + command
                filename = f"run-{index}-{name}.md"
                print(filename, flush=True)
                cpu_before = os.times()
                started = time.perf_counter()
                with (output / filename).open("w") as stream:
                    run(command, env=env, stdout=stream)
                elapsed = time.perf_counter() - started
                cpu_after = os.times()
                child_cpu = ((cpu_after.children_user - cpu_before.children_user) +
                             (cpu_after.children_system - cpu_before.children_system))
                metadata["process_timings"].append({
                    "file": filename, "wall_seconds": elapsed,
                    "child_cpu_seconds": child_cpu if os.name == "posix" else None,
                })
            if source_hashes(output) != hashes:
                raise RuntimeError("sources changed during measurement; discard this measurement")
            metadata["typed_decode_checksums"] = "failed"
            try:
                validate_decode_checksums(output, index)
                metadata["typed_decode_checksums"] = "passed"
            finally:
                (output / "metadata.json").write_text(json.dumps(metadata, indent=2) + "\n")


if __name__ == "__main__":
    main()
