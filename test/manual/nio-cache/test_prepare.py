# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
import prepare
from test_admission import marker_class
from test_observer import fixture
import admission


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
            target = classes / 'org/openjdk/bench/nioqual/NioCachePaths.class'
            target.parent.mkdir(parents=True)
            target.write_bytes(marker_class())
            with patch.object(prepare, 'ROOT', packet), patch.object(prepare, 'visibility', return_value={'readable': True}):
                prepare.prepare(jdk, classes, jars)
                command = json.loads((packet / 'command.json').read_text())
                freeze = json.loads((packet / 'freeze.json').read_text())
                self.assertEqual(command[3], str(jdk / 'bin/java'))
                self.assertIn('--sun-misc-unsafe-memory-access=allow', command)
                self.assertIn('--sun-misc-unsafe-memory-access=allow', command[-1])
                self.assertEqual(set(freeze['environment']), {'PATH', 'LANG', 'LC_ALL'})
                self.assertNotIn('/workspace/', json.dumps(command))
                self.assertIn('org.openjdk.jmh.Main', command)
                self.assertEqual(command[command.index('-f') + 1], '1')
                self.assertEqual(command[command.index('-wf') + 1], '0')
                self.assertIn('-Dnio.observer.nonce=' + freeze['binding_nonce'], command[-1])
                self.assertIn('-Dnio.observer.binding=' + str(packet / 'run/binding.txt'), command[-1])
                with self.assertRaisesRegex(ValueError, 'fresh checkout'):
                    prepare.prepare(jdk, classes, jars)
                # Exercise the actual prepared target flags through the binding
                # verifier, including JMH's extra hint-file/cp/ForkedMain args.
                proc, cg, co, fo, th = fixture(root / 'kernel')
                for child_view in proc.rglob('children'):
                    child_view.unlink()
                (proc / '20/task/21/comm').write_text('arbitrary-worker')
                (proc / '20/exe').symlink_to(jdk / 'bin/java')
                binding = packet / 'run/binding.txt'
                binding.parent.mkdir()
                nonce = freeze['binding_nonce']
                line = ('NIO_BIND protocol=nio-bind-v1 nonce=' + nonce
                        + ' pid=20 tid=21 start=100 benchmark=' + admission.BENCHMARK + '\n')
                binding.write_text(line)
                args = [command[3]] + command[-1].split() + [
                    '-XX:CompileCommandFile=/tmp/synthetic-compiler-hints', '-cp',
                    command[command.index('-cp') + 1], 'org.openjdk.jmh.runner.ForkedMain', '127.0.0.1', '34717']
                (proc / '20/cmdline').write_bytes(('\0'.join(args) + '\0').encode())
                bound = admission.read_binding(binding, nonce, {})
                actual_fork, actual_thread = admission.verify_binding(
                    bound, {'pid': 10, **admission.read_identity(10, proc)}, jdk / 'bin/java', binding, nonce, proc)
                self.assertEqual((actual_fork['pid'], actual_thread['tid']), (20, 21))

    def test_missing_image_fails_without_launch(self):
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaisesRegex(ValueError, 'bin/java'):
                prepare.prepare(tmp, tmp, tmp)


if __name__ == '__main__':
    unittest.main()
