#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

"""Pure planning/input tests. These tests never launch Java or a benchmark."""
import importlib.util
import contextlib
import io
import itertools
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

spec = importlib.util.spec_from_file_location(
    'regex_bench', Path(__file__).with_name('benchmark-rust-regex.py'))
bench = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bench)


class BenchmarkInputs(unittest.TestCase):
    def test_complete_classpath_includes_resources_and_jars(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            classes = root / 'classes'
            (classes / 'META-INF').mkdir(parents=True)
            (classes / 'Bench.class').write_bytes(b'class input')
            (classes / 'META-INF' / 'BenchmarkList').write_text('benchmark input')
            jars = root / 'jars'
            jars.mkdir()
            (jars / 'jmh.jar').write_bytes(b'jar input')
            (jars / 'ignored.txt').write_text('not a Java wildcard dependency')
            cp = os.pathsep.join([str(classes), str(jars / '*'), str(classes)])
            self.assertEqual(bench.classpath_files(cp), sorted([
                (classes / 'Bench.class').resolve(),
                (classes / 'META-INF' / 'BenchmarkList').resolve(),
                (jars / 'jmh.jar').resolve()]))

    def test_invalid_classpath_cannot_silently_change_inputs(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            for cp in ['', str(root / '*'), str(root / 'absent.jar')]:
                with self.subTest(cp=cp), self.assertRaises(ValueError):
                    bench.classpath_files(cp)

    def test_every_control_has_an_observation_in_each_order(self):
        controls = ['original', 'disabled', 'native', 'jni']
        self.assertEqual(bench.control_order(controls, 0), controls)
        self.assertEqual(bench.control_order(controls, 1), list(reversed(controls)))
        self.assertEqual(bench.control_order(['disabled', 'native'], 1), ['native', 'disabled'])

    def test_worker_affinity_cannot_hide_a_mixed_parallel_cohort(self):
        self.assertEqual(bench.worker_count(['threads=4']), 4)
        self.assertEqual(bench.worker_count(['threads=1']), 1)
        self.assertEqual(bench.worker_count(['shape=prefix']), 1)
        with self.assertRaises(ValueError):
            bench.worker_count(['threads=1,4'])

    def test_qualification_preserves_all_families_and_tiers(self):
        tiers = ['interpreter', 'C1', 'C2']
        experiments = bench.qualification_experiments(tiers)
        for tier in tiers:
            cases = [case for case in experiments if case[1] == tier]
            families = {case[0].split('-')[0] for case in cases}
            self.assertEqual(families, {'state', 'anchored', 'candidates', 'routing',
                                       'continuation', 'fallback', 'digitForms', 'fallbackCandidates'})
            self.assertTrue(any('length=9,15,17,31,32,33,255,256,257' in case[3] for case in cases))
            self.assertTrue(all(bench.expected_rows(case[2], case[3]) > 0 for case in cases))

    def test_expected_rows_counts_both_anchored_operations(self):
        params = ['shape=ssn', 'length=11', 'position=miss,full,partial', 'endFlags=false,true']
        self.assertEqual(bench.expected_rows('RustRegexState.match$', params), 6)
        self.assertEqual(bench.expected_rows('RustRegexState.(matches|lookingAt)$', params), 12)

    def test_duplicate_rows_cannot_replace_a_missing_case(self):
        good = [{'benchmark': 'org.openjdk.bench.java.util.regex.RustRegexNative.match',
                 'params': {'length': size}, 'primaryMetric': {'score': 1.0}} for size in ['4', '8']]
        bench.validate_rows('RustRegexNative.match', ['length=4,8'], good)
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', ['length=4,8'], [good[0], good[0]])
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', ['length=4,8'], good[:1])

    def test_nonfinite_measurement_cannot_pass_as_a_complete_row(self):
        row = {'benchmark': 'org.openjdk.bench.java.util.regex.RustRegexNative.match',
               'params': {'length': '4'}, 'primaryMetric': {'score': float('nan')}}
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', ['length=4'], [row])

    def test_original_and_jni_controls_are_distinct_without_running_java(self):
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            java_images = []
            for label in ['candidate', 'upstream']:
                home = root / label
                (home / 'bin').mkdir(parents=True)
                (home / 'lib').mkdir()
                (home / 'bin/java').write_text('fixture; never executed')
                (home / 'lib/modules').write_text('fixture modules')
                java_images.append(home / 'bin/java')
            classes = root / 'classes'
            classes.mkdir()
            (classes / 'Bench.class').write_text('fixture; never executed')
            commands = []

            def fake_java(command, **kwargs):
                commands.append(command)
                if command[-1] == '-version':
                    return bench.subprocess.CompletedProcess(command, 0, stderr='fixture version')
                parameters = [command[i + 1] for i, value in enumerate(command) if value == '-p']
                axes = dict(parameter.split('=', 1) for parameter in parameters)
                rows = [{'benchmark': 'org.openjdk.bench.java.util.regex.RustRegexNative.match',
                         'params': dict(zip(axes, values)), 'primaryMetric': {'score': 1.0}}
                        for values in itertools.product(*(value.split(',') for value in axes.values()))]
                Path(command[command.index('-rff') + 1]).write_text(json.dumps(rows))
                return bench.subprocess.CompletedProcess(command, 0)

            argv = ['benchmark', '--java', str(java_images[0]), '--reference-java', str(java_images[1]),
                    '--include-jni', '--classpath', str(classes), '--output', str(root / 'out'),
                    '--suite', 'tiny', '--tiers', 'C1', '--pairs', '2', '--time-budget', '60']
            with patch('sys.argv', argv), patch.object(bench.subprocess, 'run', side_effect=fake_java), \
                    contextlib.redirect_stdout(io.StringIO()):
                bench.main()
            rows = [json.loads(line) for line in (root / 'out/results.jsonl').read_text().splitlines()]
            self.assertEqual({row['control'] for row in rows}, {'original', 'disabled', 'native', 'jni'})
            for command in commands:
                if command[0] == str(java_images[1]):
                    self.assertFalse(any(option.startswith('-XX:') and 'UseRustRegex' in option
                                         for option in command))
            self.assertTrue(any('-XX:-UseRustRegex' in command for command in commands))
            self.assertTrue(any('-XX:-UseRustRegexIntrinsics' in command for command in commands))


if __name__ == '__main__':
    unittest.main()
