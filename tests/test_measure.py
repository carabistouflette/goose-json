# SPDX-License-Identifier: Apache-2.0
"""Source-drift detection must ignore output, but retain real input checks."""
import importlib.util
import io
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


if __name__ == "__main__":
    unittest.main()
