# SPDX-License-Identifier: Apache-2.0
import importlib.util
from pathlib import Path
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('large_measure', ROOT / 'bench/large/measure.py')
probe = importlib.util.module_from_spec(spec)
spec.loader.exec_module(probe)


class LargeProbeTests(unittest.TestCase):
    def test_independent_oracle_spelling(self):
        self.assertEqual(probe.expected('escapes', 1),
                         b'{"id":42,"active":true,"context":{"region":7,"leaf":{"label":"\\u0000\\n\\"\\\\\\t"}},'
                         b'"values":[0,-1,9223372036854775807,-9223372036854775808]}')
        self.assertIn('é😀'.encode(), probe.expected('unicode', 1))

    def test_exact_output_boundaries(self):
        selected = probe.cases()
        self.assertEqual(len({name for name, _, _ in selected}), 13)
        sizes = [len(probe.expected(kind, count)) for _, kind, count in selected[:10]]
        self.assertEqual(sizes, [4095, 4096, 4097, 65535, 65536, 65537,
                                 1048575, 1048576, 1048577, 4194304])
        self.assertLess(len(probe.expected('escapes', 52428)), 1048576)
        self.assertGreater(len(probe.expected('escapes', 104857)), 1048576)


if __name__ == '__main__':
    unittest.main()
