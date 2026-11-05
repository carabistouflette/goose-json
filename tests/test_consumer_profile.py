# SPDX-License-Identifier: Apache-2.0
import importlib.util
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('consumer_profile', ROOT / 'bench/consumer/artifact.py')
profile = importlib.util.module_from_spec(spec)
spec.loader.exec_module(profile)


class ConsumerProfileTests(unittest.TestCase):
    def test_unknown_or_ambiguous_source_fails_closed(self):
        with self.assertRaises(RuntimeError):
            profile.instrument('', '')
        with self.assertRaises(RuntimeError):
            profile.replace_once('marker marker', 'marker', 'replacement')

    @unittest.skipUnless(sys.platform.startswith('linux') and shutil.which('gcc'), 'requires Linux GCC')
    def test_phase_report_units_and_counts(self):
        source = profile.PHASE_C + '''
int main(void) {
    gj_consumer_record(0, 11);
    gj_consumer_record(1, 7);
    gj_consumer_record(2, 42);
    gj_consumer_report(100);
    return 0;
}
'''
        with tempfile.TemporaryDirectory(prefix='json-consumer-control-') as directory:
            folder = Path(directory)
            c = folder / 'control.c'
            c.write_text(source)
            binary = folder / 'control'
            subprocess.run(['gcc', '-std=c11', '-O2', '-Wall', '-Wextra', '-Werror',
                            str(c), '-o', str(binary)], check=True, capture_output=True)
            result = subprocess.run([str(binary)], check=True, capture_output=True, text=True)
            self.assertEqual(result.stdout, '')
            self.assertEqual(result.stderr, 'PROFILE,100,42,11,7,1,1,1\n')


if __name__ == '__main__':
    unittest.main()
