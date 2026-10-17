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

    def test_complete_plans_preserve_review_and_qualification_counts(self):
        tiers = ['interpreter', 'C1', 'C2']
        review = bench.experiments_for('review', tiers)
        qualification = bench.experiments_for('qualification', tiers)
        self.assertEqual(len(review), 17)
        self.assertEqual(sum(bench.expected_rows(case[2], case[3]) for case in review) * 4, 1392)
        self.assertEqual(len(qualification), 109)
        self.assertEqual(sum(bench.expected_rows(case[2], case[3]) for case in qualification) * 8, 27888)
        self.assertEqual(sum(bench.expected_rows(case[2], case[3]) for case in qualification
                             if case[0].startswith('anchored-ssn-') and case[1] == 'C1'), 108)
        self.assertTrue(all(bench.worker_count(case[3]) in (1, 4) for case in qualification))

    def test_summary_keeps_methods_controls_and_units_separate(self):
        rows = []
        for method in ('matches', 'lookingAt'):
            for control, score in [('original', 20), ('disabled', 30), ('native', 10), ('jni', 15)]:
                rows.append({'suite': 'anchored', 'tier': 'C1', 'pair': 0, 'control': control,
                             'result': {'benchmark': 'RustRegexState.' + method, 'params': {'length': '16'},
                                        'primaryMetric': {'score': score, 'scoreUnit': 'ns/op',
                                                          'rawData': [[score]]}}})
        summaries = list(bench.paired_summaries(rows))
        self.assertEqual(len(summaries), 2)
        for summary in summaries:
            self.assertEqual(set(summary['processes']), {'original', 'disabled', 'native', 'jni'})
            self.assertEqual(summary['pairedRatios']['original/native'], [{'pair': 0, 'ratio': 2}])
            self.assertEqual(summary['pairedRatios']['disabled/native'], [{'pair': 0, 'ratio': 3}])
        with self.assertRaisesRegex(ValueError, 'duplicate process'):
            list(bench.paired_summaries(rows + [rows[0]]))
        rows[0]['result']['primaryMetric']['scoreUnit'] = 'us/op'
        separated = list(bench.paired_summaries(rows))
        self.assertEqual(len(separated), 3)
        self.assertTrue(all(not summary['pairedRatios']['original/native'] for summary in separated
                            if summary['benchmark'].endswith('.matches')))

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


class BenchmarkFailures(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        root = Path(self.temporary.name)
        java = root / 'jdk/bin/java'
        java.parent.mkdir(parents=True)
        java.write_text('fixture; never executed')
        classes = root / 'classes'
        classes.mkdir()
        (classes / 'Bench.class').write_bytes(b'fixture; never loaded')
        self.output = root / 'out'
        self.argv = ['benchmark', '--java', str(java), '--classpath', str(classes),
                     '--output', str(self.output), '--suite', 'tiny', '--tiers', 'C1',
                     '--pairs', '1', '--time-budget', '60']
        self.commands = []

    def fake_java(self, command, **kwargs):
        self.commands.append(command)
        if command[-1] == '-version':
            return bench.subprocess.CompletedProcess(command, 0, stderr='fixture version')
        params = [command[i + 1] for i, value in enumerate(command) if value == '-p']
        axes = dict(parameter.split('=', 1) for parameter in params)
        rows = [{'benchmark': 'org.openjdk.bench.java.util.regex.RustRegexNative.match',
                 'params': dict(zip(axes, values)), 'primaryMetric': {'score': 1.0}}
                for values in itertools.product(*(value.split(',') for value in axes.values()))]
        Path(command[command.index('-rff') + 1]).write_text(json.dumps(rows))
        return bench.subprocess.CompletedProcess(command, 0)

    def run_main(self, tool=None, resume=False):
        with patch('sys.argv', self.argv + (['--resume'] if resume else [])), \
                patch.object(bench.subprocess, 'run', side_effect=tool or self.fake_java), \
                contextlib.redirect_stdout(io.StringIO()), contextlib.redirect_stderr(io.StringIO()):
            bench.main()

    def test_malformed_success_output_is_terminal(self):
        def tool(command, **kwargs):
            result = self.fake_java(command, **kwargs)
            if '-rff' in command:
                Path(command[command.index('-rff') + 1]).write_text('not JSON')
            return result
        with self.assertRaises(ValueError):
            self.run_main(tool)
        self.assertTrue((self.output / 'failure.json').is_file())
        count = len(self.commands)
        with self.assertRaises(SystemExit):
            self.run_main(resume=True)
        self.assertEqual(len(self.commands), count)

    def test_success_without_result_file_is_terminal(self):
        def tool(command, **kwargs):
            result = self.fake_java(command, **kwargs)
            if '-rff' in command:
                Path(command[command.index('-rff') + 1]).unlink()
            return result
        with self.assertRaises(OSError):
            self.run_main(tool)
        self.assertTrue((self.output / 'failure.json').is_file())

    def test_resume_rejects_changed_records_even_when_count_matches(self):
        self.run_main()
        path = self.output / 'results.jsonl'
        rows = [json.loads(line) for line in path.read_text().splitlines()]
        rows[0]['result']['primaryMetric']['score'] = 9000
        path.write_text(''.join(json.dumps(row) + '\n' for row in rows))
        before = len([command for command in self.commands if '-rff' in command])
        with self.assertRaisesRegex(ValueError, 'stored records differ'):
            self.run_main(resume=True)
        self.assertEqual(before, len([command for command in self.commands if '-rff' in command]))
        self.assertTrue((self.output / 'failure.json').is_file())

    def test_unrecorded_attempt_cannot_be_replaced_on_resume(self):
        def tool(command, **kwargs):
            result = self.fake_java(command, **kwargs)
            if '-rff' in command:
                raise KeyboardInterrupt('fixture interruption after result write')
            return result
        with self.assertRaises(KeyboardInterrupt):
            self.run_main(tool)
        before = len([command for command in self.commands if '-rff' in command])
        with self.assertRaises(SystemExit):
            self.run_main(resume=True)
        self.assertEqual(before, len([command for command in self.commands if '-rff' in command]))
        self.assertTrue((self.output / 'failure.json').is_file())


if __name__ == '__main__':
    unittest.main()
