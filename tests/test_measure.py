# SPDX-License-Identifier: Apache-2.0
"""Source-drift detection must ignore output, but retain real input checks."""
import importlib.util
import io
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

SPEC = importlib.util.spec_from_file_location(
    "measure", Path(__file__).resolve().parents[1] / "bench/measure.py"
)
measure = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(measure)


class BuildEnvironmentTest(unittest.TestCase):
    def test_inherited_flags_are_not_used(self):
        flags = {"CXXFLAGS": "-march=native", "CFLAGS": "-O0", "CPPFLAGS": "-DOTHER",
                 "LDFLAGS": "-flto", "CMAKE_TOOLCHAIN_FILE": "custom.cmake",
                 "GOOSE_STDLIB": "/custom/stdlib", "CARGO_ENCODED_RUSTFLAGS": "-Copt-level=0"}
        with patch.dict(measure.os.environ, flags):
            for native in (False, True):
                env = measure.build_environment(native)
                for name in flags:
                    self.assertNotIn(name, env)
                self.assertEqual(env["RUSTFLAGS"], "-C target-cpu=native" if native else "")
            self.assertEqual(measure.os.environ["CXXFLAGS"], "-march=native")

    def test_cargo_profile_overrides_do_not_leak_into_builds(self):
        overrides = {"CARGO_PROFILE_RELEASE_OPT_LEVEL": "0",
                     "CARGO_PROFILE_RELEASE_LTO": "fat",
                     "CARGO_PROFILE_RELEASE_PACKAGE_SERDE_DEBUG_ASSERTIONS": "true"}
        with patch.dict(measure.os.environ, {**overrides, "CARGO_NET_OFFLINE": "true"}):
            for native in (False, True):
                env = measure.build_environment(native)
                self.assertFalse(any(key.startswith("CARGO_PROFILE_") for key in env))
                self.assertEqual(env["CARGO_NET_OFFLINE"], "true")
            self.assertEqual(measure.os.environ["CARGO_PROFILE_RELEASE_OPT_LEVEL"], "0")

    def test_incremental_override_is_disabled_without_changing_the_parent(self):
        with patch.dict(measure.os.environ, {"CARGO_INCREMENTAL": "1",
                                            "CARGO_BUILD_INCREMENTAL": "true"}):
            for native in (False, True):
                self.assertEqual(measure.build_environment(native)["CARGO_INCREMENTAL"], "0")
            self.assertEqual(measure.os.environ["CARGO_INCREMENTAL"], "1")


class ComparisonArtifactTest(unittest.TestCase):
    def artifact(self):
        return {"reason": "compiler-artifact", "target": {"name": "goose-json-compare"},
                "executable": "/tmp/comparison executable",
                "profile": {"opt_level": "3", "debuginfo": 0, "debug_assertions": False,
                            "overflow_checks": False, "test": False}}

    def test_selects_the_executable_from_cargo_messages(self):
        artifact = self.artifact()
        messages = [dict(artifact, executable=None),
                    {"reason": "build-script-executed"}, artifact,
                    {"reason": "build-finished", "success": True}]
        self.assertEqual(measure.comparison_artifact("\n".join(map(json.dumps, messages))), artifact)

    def test_rejects_unexpected_profiles_before_measurement(self):
        for key, value in (("opt_level", "0"), ("debuginfo", 2), ("debug_assertions", True),
                           ("overflow_checks", True), ("test", True)):
            with self.subTest(key=key):
                artifact = self.artifact()
                artifact["profile"][key] = value
                with self.assertRaisesRegex(RuntimeError, "unexpected release profile"):
                    measure.comparison_artifact(json.dumps(artifact))
        artifact = self.artifact()
        del artifact["profile"]
        with self.assertRaisesRegex(RuntimeError, "unexpected release profile"):
            measure.comparison_artifact(json.dumps(artifact))

    def test_missing_executable_has_an_actionable_error(self):
        artifact = self.artifact()
        artifact["target"]["name"] = "another-binary"
        with self.assertRaisesRegex(RuntimeError, "did not produce"):
            measure.comparison_artifact(json.dumps(artifact))


class SourceHashesTest(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        # A workspace directory name must not be mistaken for a generated
        # bench/results directory when choosing source inputs.
        self.root = Path(self.directory.name) / "results" / "project"
        self.patch = patch.object(measure, "ROOT", self.root)
        self.patch.start()
        self.addCleanup(self.patch.stop)
        for name in (
            "json_codec.goose", "json_codec.build", "Makefile", "CMakeLists.txt",
            "scripts/native-manifest.py", "native/codec.h", "bench/g++",
            "bench/bench.goose", "bench/fixtures/plain.json",
        ):
            path = self.root / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text("original")
        self.output = self.root / "bench/custom-output"
        self.output.mkdir()

    def test_generated_metadata_does_not_change_sources(self):
        before = measure.source_hashes(self.output)
        (self.output / "metadata.json").write_text('{"runs": [["after"]]}')
        (self.output / "run-1-after.md").write_text("timings")
        self.assertEqual(before, measure.source_hashes(self.output))

    def test_native_output_is_rejected_before_creating_files(self):
        output = self.root / "native/results"
        with patch.object(measure, "capture", return_value="head"), \
             patch("sys.argv", ["measure.py", "--output", str(output)]), \
             patch("sys.stderr", new_callable=io.StringIO) as error:
            with self.assertRaises(SystemExit) as failure:
                measure.main()
        self.assertEqual(failure.exception.code, 2)
        self.assertIn("cannot be inside native sources", error.getvalue())
        self.assertFalse(output.exists())

    def test_real_inputs_still_detect_source_drift(self):
        for name in ("native/codec.h", "bench/fixtures/plain.json", "bench/g++"):
            with self.subTest(source=name):
                before = measure.source_hashes(self.output)
                (self.root / name).write_text("changed")
                self.assertNotEqual(before, measure.source_hashes(self.output))

class DecodeChecksumTest(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.output = Path(self.directory.name)
        for label, names in (("before", ("goose-json",)), ("after", ("goose-json",)),
                             ("compare", ("serde_json", "sonic-rs", "prost (binary)"))):
            rows = [f"| {name} | {fixture} | decode | 20 | 10 | 1.0 | 1.0–2.0 | {checksum} |"
                    for name in names for fixture, checksum in (("plain", 100), ("array-wide", 13976))]
            (self.output / f"run-1-{label}.md").write_text("\n".join(rows))

    def test_matching_typed_consumption(self):
        measure.validate_decode_checksums(self.output, 1)

    def test_signed_remainder_regression_is_rejected(self):
        path = self.output / "run-1-compare.md"
        path.write_text(path.read_text().replace("13976", "5784"))
        with self.assertRaisesRegex(RuntimeError, "checksum/iteration/fixture mismatch"):
            measure.validate_decode_checksums(self.output, 1)

    def test_missing_or_duplicate_fixture_is_rejected(self):
        path = self.output / "run-1-after.md"
        original = path.read_text()
        for text in (original.splitlines()[0], original + "\n" + original):
            path.write_text(text)
            with self.assertRaises(RuntimeError):
                measure.validate_decode_checksums(self.output, 1)

    def test_changed_iteration_count_is_rejected(self):
        path = self.output / "run-1-after.md"
        path.write_text(path.read_text().replace("| 10 |", "| 11 |"))
        with self.assertRaisesRegex(RuntimeError, "checksum/iteration/fixture mismatch"):
            measure.validate_decode_checksums(self.output, 1)


if __name__ == "__main__":
    unittest.main()
