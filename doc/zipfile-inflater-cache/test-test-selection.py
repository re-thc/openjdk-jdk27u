#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
"""Offline Bash/GNU make argument regression; no build, jtreg or JVM launch."""
import json
from pathlib import Path
import runpy
import subprocess
import tempfile
import unittest


class TestSelectionTest(unittest.TestCase):
    directory = Path(__file__).resolve().parent
    repository = directory.parents[1]

    def selections(self):
        result = subprocess.check_output(
            ['bash', '-eu', '-c', 'source "$1"; printf "%s\\0" "$cache_tests" "$consumer_tests" "$candidate_tests"',
             'fixture', str(self.directory / 'test-selections.sh')])
        return result.decode().split('\0')[:-1]

    def make_selection(self, selection):
        # Include the repository's real MAKEOVERRIDES/USER_MAKE_VARS parser,
        # then cross its sub-make argv boundary. The leaf only prints inputs.
        with tempfile.TemporaryDirectory(prefix='zip-make-argv-') as temporary:
            path = Path(temporary)
            (path / 'leaf.mk').write_text('''capture:
\t@$(PYTHON) -c 'import json,sys; print(json.dumps(sys.argv[1:]))' "$(TEST)" $(USER_MAKE_VARS)
''')
            (path / 'outer.mk').write_text('''include $(REPOSITORY)/make/PreInitSupport.gmk
capture:
\t@$(MAKE) --no-print-directory -f $(LEAF) $(USER_MAKE_VARS) capture
''')
            result = subprocess.run(
                ['make', '--no-print-directory', '-f', str(path / 'outer.mk'),
                 'REPOSITORY=' + str(self.repository), 'LEAF=' + str(path / 'leaf.mk'),
                 'PYTHON=python3', 'JDK_IMAGE_DIR=/fixture/images/jdk',
                 'TEST=' + selection, 'capture'],
                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=10)
            return result

    def test_both_normalized_make_selections(self):
        cache, consumer, candidate = self.selections()
        self.assertEqual(len(cache.split(' ')), 15)
        self.assertEqual(candidate.split(' '), cache.split(' ') + consumer.split(' '))
        for selection, count in ((consumer, 6), (candidate, 21)):
            self.assertNotIn('\n', selection)
            self.assertNotIn('\r', selection)
            result = self.make_selection(selection)
            self.assertEqual(result.returncode, 0, result.stdout)
            argv = json.loads(result.stdout.strip().splitlines()[-1])
            self.assertEqual(argv[0], selection)
            self.assertEqual(len(argv[0].split(' ')), count)
            self.assertEqual(len(set(argv[0].split(' '))), count)
            for name in argv[0].split(' '):
                self.assertTrue((self.repository / name).is_file(), name)
            # No test path may leak into a non-control assignment or make goal.
            self.assertFalse(any('test/jdk/' in value for value in argv[1:]), argv)

    def test_original_mixed_newline_boundary_fails_actual_make(self):
        cache, consumer, _ = self.selections()
        old = cache.replace(' ', '\n') + ' ' + consumer.replace(' ', '\n')
        result = self.make_selection(old)
        self.assertNotEqual(result.returncode, 0, result.stdout)
        boundary = cache.split(' ')[-1] + ' ' + consumer.split(' ')[0]
        self.assertIn("No rule to make target '" + boundary + "'", result.stdout)

    def test_continuation_jtreg_commands_preserve_groups_and_output_roots(self):
        build = runpy.run_path(str(self.directory / 'run-retained-jtreg.py'))['command']
        _, consumer, candidate = self.selections()
        root = Path('/fresh-output')
        for label, tests in (('base', consumer), ('candidate', candidate)):
            for gc in ('Serial', 'G1', 'Z'):
                for test in tests.split(' '):
                    args, work, report = build(Path('/boot'), Path('/jtreg'),
                                              Path('/retained') / label,
                                              Path('/retained') / label / 'images/jdk',
                                              root, label, gc, test)
                    self.assertEqual(args[-1], test)
                    self.assertIn('-testjdk:/retained/' + label + '/images/jdk', args)
                    self.assertIn('-javaoption:-XX:+Use' + gc + 'GC', args)
                    self.assertIn('-javaoption:-Xmx128m', args)
                    self.assertIn('-concurrency:2', args)
                    self.assertIn('-timeoutFactor:4', args)
                    self.assertTrue(work.is_relative_to(root))
                    self.assertTrue(report.is_relative_to(root))
                    self.assertIn('-workDir:' + str(work), args)
                    self.assertIn('-reportDir:' + str(report), args)
        self.assertNotIn('DeleteTempJarTest.java', candidate)
        self.assertIn('EnumerateAfterClose.java', candidate)

    def test_image_inventory_detects_bytes_modes_and_symlinks(self):
        inventory = runpy.run_path(str(self.directory / 'retained-images.py'))['tree_identity']
        with tempfile.TemporaryDirectory(prefix='zip-image-binding-') as temporary:
            root = Path(temporary)
            file = root / 'java'
            file.write_bytes(b'one')
            before = inventory(root)
            file.write_bytes(b'two')
            self.assertNotEqual(inventory(root), before)
            before = inventory(root)
            file.chmod(file.stat().st_mode ^ 0o100)
            self.assertNotEqual(inventory(root), before)
            (root / 'other').write_bytes(b'two')
            (root / 'alias').symlink_to('java')
            before = inventory(root)
            (root / 'alias').unlink()
            (root / 'alias').symlink_to('other')
            self.assertNotEqual(inventory(root), before)


if __name__ == '__main__':
    unittest.main()
