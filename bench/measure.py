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
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parent.parent


def run(command, **kwargs):
    return subprocess.run(command, cwd=ROOT, check=True, **dict({"text": True}, **kwargs))


def capture(command):
    return run(command, stdout=subprocess.PIPE).stdout.strip()


def source_hashes():
    paths = [ROOT / "json_codec.goose", ROOT / "Makefile", ROOT / "CMakeLists.txt", ROOT / "json_codec.build", ROOT / "bench/g++", ROOT / "scripts/native-manifest.py"]
    paths += [p for p in (ROOT / "native").rglob("*") if p.is_file()]
    paths += [p for p in (ROOT / "bench").rglob("*") if p.is_file() and "target" not in p.parts and "results" not in p.parts and p.suffix in (".goose", ".rs", ".toml", ".lock", ".json", ".py", ".sh")]
    return {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(paths)}


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
    output.mkdir(parents=True, exist_ok=True)
    if any(output.iterdir()):
        parser.error("--output must be empty (preserve previous measurements)")
    run(["python3", "scripts/native-manifest.py", "--check"])
    hashes = source_hashes()
    cc = str(ROOT / "bench/native-cc.sh") if args.native else "gcc"
    # An explicit profile avoids inheriting undisclosed Rust code-generation flags.
    rustflags = "-C target-cpu=native" if args.native else ""
    env = dict(os.environ, RUSTFLAGS=rustflags)
    env.pop("CARGO_ENCODED_RUSTFLAGS", None)
    with tempfile.TemporaryDirectory(prefix="goose-json-measure-") as directory:
        base = Path(directory)
        # Freeze each executable: a concurrent portable smoke build must not
        # replace a binary between recorded runs.
        run([goose, "build", "bench/bench.goose", "--cc", cc, "-O2", "-o", str(base / "after")])
        artifacts = run(["cargo", "build", "--locked", "--release", "--message-format=json", "--target-dir", ".build/compare-native" if args.native else ".build/compare-portable", "--manifest-path", "bench/compare/Cargo.toml"], env=env, stdout=subprocess.PIPE).stdout
        artifact = next(json.loads(line) for line in artifacts.splitlines() if json.loads(line).get("executable") and json.loads(line).get("target", {}).get("name") == "goose-json-compare")
        shutil.copy2(artifact["executable"], base / "compare")
        (base / "bench").mkdir()
        files = capture(["git", "ls-tree", "-r", "--name-only", baseline, "--", "json_codec.goose", "json_codec.build", "CMakeLists.txt", "native"]).splitlines()
        for filename in files:
            destination = base / filename
            destination.parent.mkdir(parents=True, exist_ok=True)
            destination.write_bytes(run(["git", "show", f"{baseline}:{filename}"], stdout=subprocess.PIPE, text=False).stdout)
        shutil.copy(ROOT / "bench/bench.goose", base / "bench/bench.goose")
        shutil.copytree(ROOT / "bench/fixtures", base / "bench/fixtures")
        run([goose, "build", str(base / "bench/bench.goose"), "--cc", cc, "-O2", "-o", str(base / "before")])
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
            "process_order_seed": 219, "runs": [],
            "executable_sha256": {name: hashlib.sha256(Path(command[0]).read_bytes()).hexdigest() for name, command in commands.items()},
            "source_sha256": {},
        }
        metadata["source_sha256"] = hashes
        if source_hashes() != hashes:
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
                with (output / filename).open("w") as stream:
                    run(command, env=env, stdout=stream)
            if source_hashes() != hashes:
                raise RuntimeError("sources changed during measurement; discard this measurement")
            (output / "metadata.json").write_text(json.dumps(metadata, indent=2) + "\n")


if __name__ == "__main__":
    main()
