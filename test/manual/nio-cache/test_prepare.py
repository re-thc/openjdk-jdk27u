# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
import prepare


class PreparationTests(unittest.TestCase):
    def test_portable_inputs_and_one_shot(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            jdk, classes, jars, packet = [root / x for x in ('jdk', 'classes', 'jars', 'packet')]
            for p in (jdk / 'bin', classes / 'META-INF', jars, packet):
                p.mkdir(parents=True)
            (jdk / 'bin/java').write_text('not an executable; preparation must never launch it')
            for name in ('BenchmarkList', 'CompilerHints'):
                (classes / 'META-INF' / name).write_text('fixture')
            for name in ('commons-math3-3.6.1.jar', 'jopt-simple-5.0.4.jar',
                         'jmh-core-1.37.jar', 'jmh-generator-annprocess-1.37.jar'):
                (jars / name).write_text('synthetic jar')
            (packet / 'NioCachePaths.java').write_text('synthetic source')
            with patch.object(prepare, 'ROOT', packet):
                prepare.prepare(jdk, classes, jars)
                command = json.loads((packet / 'command.json').read_text())
                freeze = json.loads((packet / 'freeze.json').read_text())
                self.assertEqual(command[3], str(jdk / 'bin/java'))
                self.assertIn('--sun-misc-unsafe-memory-access=allow', command)
                self.assertIn('--sun-misc-unsafe-memory-access=allow', command[-1])
                self.assertEqual(set(freeze['environment']), {'PATH', 'LANG', 'LC_ALL'})
                self.assertNotIn('/workspace/', json.dumps(command))
                with self.assertRaisesRegex(ValueError, 'fresh checkout'):
                    prepare.prepare(jdk, classes, jars)

    def test_missing_image_fails_without_launch(self):
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaisesRegex(ValueError, 'bin/java'):
                prepare.prepare(tmp, tmp, tmp)


if __name__ == '__main__':
    unittest.main()
