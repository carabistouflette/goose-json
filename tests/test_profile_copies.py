# SPDX-License-Identifier: Apache-2.0
"""Calibrate the diagnostic counters, including positive allocation controls."""
import importlib.util
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('profile_copies', ROOT / 'bench/profile-copies.py')
probe = importlib.util.module_from_spec(spec)
spec.loader.exec_module(probe)


class CopyProfileTests(unittest.TestCase):
    def test_rejects_unknown_runtime(self):
        with self.assertRaises(RuntimeError):
            probe.instrument('int main(void) { return 0; }')

    @unittest.skipUnless(shutil.which('gcc') and shutil.which('ld'), 'requires GNU compiler/linker')
    def test_phase_counters_have_positive_controls(self):
        source = '''
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct { int unused; } gs_stack;
#define GS_API
static void gs_memcpy(void *dst, const void *src, size_t n) {
    memcpy(dst, src, n);
}
GS_API uint8_t *gs_reserve_region(gs_stack *stack) {
    (void)stack;
    return NULL;
}
void gj_probe_begin(void);
void gj_probe_end(void);
int main(void) {
    char dst[3];
    gs_memcpy(dst, "abc", 3);
    (void)gs_reserve_region(NULL);
    void *before = malloc(11);
    free(before);
    gj_probe_begin();
    gs_memcpy(dst, "xyz", 3);
    (void)gs_reserve_region(NULL);
    void *p = malloc(7);
    void *q = calloc(2, 3);
    p = realloc(p, 9);
    free(p);
    free(q);
    gj_probe_end();
    gs_memcpy(dst, "abc", 3);
    return 0;
}
'''
        source = '#include <stdint.h>\n' + source
        with tempfile.TemporaryDirectory(prefix='gj-probe-control-') as directory:
            path = Path(directory)
            c = path / 'control.c'
            c.write_text(probe.instrument(source))
            binary = path / 'control'
            subprocess.run(['gcc', '-O2', '-fno-builtin', str(c), '-o', str(binary),
                            *['-Wl,--wrap=' + n for n in ('malloc', 'calloc', 'realloc', 'free')]],
                           check=True, capture_output=True)
            result = subprocess.run([str(binary)], check=True, capture_output=True, text=True)
            self.assertEqual(result.stdout, '')
            self.assertEqual(result.stderr, '1,3,1,1,1,1,2\n')


if __name__ == '__main__':
    unittest.main()
