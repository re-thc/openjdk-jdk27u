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
import copy
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


# Synthetic JMH 1.37 avgt/ss fixtures: schema and sample counts match the
# producer, but their paths and numbers are fictional, never benchmark evidence.
DATA = Path(__file__).parent / 'tests/data'
META_ID = 'a' * 64
COMMAND_ID = 'b' * 64


def result_fixture(benchmark='RustRegexNative.match', params=None, score=10.0,
                   java='/fixture/jdk/bin/java', jvm_args=None, suite='qualification'):
    params = params or {'length': '16', 'regexType': 'prefix', 'scenario': 'miss', 'operation': 'find'}
    cold = benchmark.startswith('RustRegexLifetime.') and params.get('reuse') == 'cold'
    row = json.loads((DATA / ('rust-regex-jmh-ss.json' if cold else 'rust-regex-jmh-avgt.json')).read_text())
    row.update(benchmark='org.openjdk.bench.java.util.regex.' + benchmark, params=dict(params), jvm=str(java))
    if jvm_args is not None:
        row['jvmArgs'] = list(jvm_args)
    if not cold:
        row['warmupTime'] = row['measurementTime'] = '200 ms' if suite == 'qualification' else '300 ms'
    metric = row['primaryMetric']
    metric.update(score=score, scoreUnit='us/op' if benchmark.startswith('RustRegexLifetime.') else 'ns/op',
                  scoreConfidence=[score, score], rawData=[[score] * (20 if cold else 3)],
                  scorePercentiles={'0.0': score, '50.0': score, '100.0': score})
    return row


def command_fixtures(command):
    parameters = [command[i + 1] for i, value in enumerate(command) if value == '-p']
    axes = dict(parameter.split('=', 1) for parameter in parameters)
    benchmark = command[command.index('org.openjdk.jmh.Main') + 1].removesuffix('$')
    prefix, method = benchmark.rsplit('.', 1)
    methods = method[1:-1].split('|') if method.startswith('(') else [method]
    suite = 'qualification' if '-w' not in command or command[command.index('-w') + 1] == '200ms' else 'review'
    return [result_fixture(prefix + '.' + name, dict(zip(axes, values)), java=command[0],
                           jvm_args=command[1:command.index('-cp')], suite=suite)
            for name in methods for values in itertools.product(*(value.split(',') for value in axes.values()))]


def summary_fixture():
    policy = {'java': '/fixture/jdk/bin/java', 'reference': '/fixture/upstream/bin/java',
              'jni': True, 'pairs': 1, 'tiers': ['C1'], 'suite': 'qualification', 'classpath': '/fixture/classes'}
    case = next(case for case in bench.experiments_for('qualification', ['C1']) if case[0] == 'anchored-prefix')
    suite, tier, benchmark, parameters = case
    rows = []
    axes = dict(parameter.split('=', 1) for parameter in parameters)
    for control, score in [('original', 20.0), ('disabled', 30.0), ('native', 10.0), ('jni', 15.0)]:
        for method in ('matches', 'lookingAt'):
            for values in itertools.product(*(value.split(',') for value in axes.values())):
                params = dict(zip(axes, values))
                result = result_fixture('RustRegexState.' + method, params, score,
                                        java=bench.controls_for(policy)[control],
                                        jvm_args=bench.jvm_arguments(control, tier, parameters))
                rows.append({'suite': suite, 'tier': tier, 'pair': 0, 'control': control,
                             'enabled': {'native': True, 'disabled': False}.get(control),
                             'metadata_sha256': META_ID, 'command_sha256': COMMAND_ID, 'result': result})
    return rows, policy


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

    def test_summary_keeps_methods_and_all_four_controls_separate(self):
        rows, policy = summary_fixture()
        summaries = bench.paired_summaries(rows, policy, META_ID)
        self.assertEqual(len(summaries), 32)
        self.assertEqual({row['benchmark'].rsplit('.', 1)[1] for row in summaries}, {'matches', 'lookingAt'})
        for summary in summaries:
            self.assertEqual(set(summary['processes']), {'original', 'disabled', 'native', 'jni'})
            self.assertEqual(summary['pairedRatios']['original/native'], [{'pair': 0, 'ratio': 2}])
            self.assertEqual(summary['pairedRatios']['disabled/native'], [{'pair': 0, 'ratio': 3}])
        with self.assertRaises(ValueError):
            bench.paired_summaries(rows + [rows[0]], policy, META_ID)
        rows[0]['result']['primaryMetric']['scoreUnit'] = 'us/op'
        with self.assertRaisesRegex(ValueError, 'scoreUnit'):
            bench.paired_summaries(rows, policy, META_ID)

    def test_duplicate_rows_cannot_replace_a_missing_case(self):
        params = ['length=4,8', 'regexType=prefix', 'scenario=miss', 'operation=find']
        good = [result_fixture(params={'length': size, 'regexType': 'prefix', 'scenario': 'miss', 'operation': 'find'})
                for size in ['4', '8']]
        bench.validate_rows('RustRegexNative.match', params, good)
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', params, [good[0], good[0]])
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', params, good[:1])

    def test_nonfinite_measurement_cannot_pass_as_a_complete_row(self):
        row = result_fixture()
        row['primaryMetric']['score'] = float('nan')
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', [key + '=' + value for key, value in row['params'].items()], [row])

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
                rows = command_fixtures(command)
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


class ResultContract(unittest.TestCase):
    def setUp(self):
        self.row = result_fixture()
        self.params = [key + '=' + value for key, value in self.row['params'].items()]

    def rejected(self, row):
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', self.params, [row])

    def test_realistic_average_and_single_shot_rows(self):
        bench.validate_rows('RustRegexNative.match', self.params, [self.row])
        params = {'length': '16', 'expression': 'email', 'calls': '1', 'scenario': 'miss',
                  'threads': '1', 'reuse': 'cold'}
        row = result_fixture('RustRegexLifetime.lifetime', params)
        bench.validate_rows('RustRegexLifetime.lifetime', [k + '=' + v for k, v in params.items()], [row])
        row['primaryMetric']['rawData'][0].pop()
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexLifetime.lifetime', [k + '=' + v for k, v in params.items()], [row])

    def test_every_required_jmh_metadata_field_is_required(self):
        for field in ['jmhVersion', 'benchmark', 'mode', 'threads', 'forks', 'jvm', 'jvmArgs',
                      'jdkVersion', 'vmName', 'vmVersion', 'warmupIterations', 'warmupTime',
                      'warmupBatchSize', 'measurementIterations', 'measurementTime',
                      'measurementBatchSize', 'params', 'primaryMetric', 'secondaryMetrics']:
            with self.subTest(field=field):
                row = copy.deepcopy(self.row)
                del row[field]
                self.rejected(row)

    def test_missing_or_wrong_primary_fields_are_rejected(self):
        for field in ['score', 'scoreUnit', 'rawData']:
            with self.subTest(field=field):
                row = copy.deepcopy(self.row)
                del row['primaryMetric'][field]
                self.rejected(row)
        for metric in [{'score': 1.0}, None, [], 'metric']:
            with self.subTest(metric=metric):
                row = copy.deepcopy(self.row)
                row['primaryMetric'] = metric
                self.rejected(row)
        for unit in ['us/op', 'ops/s', '', None, ['ns/op']]:
            with self.subTest(unit=unit):
                row = copy.deepcopy(self.row)
                row['primaryMetric']['scoreUnit'] = unit
                self.rejected(row)

    def test_raw_samples_require_one_complete_finite_numeric_series(self):
        for raw in [None, [], [[]], [10, 10, 10], [[10]], [[10, 10]], [[10] * 4],
                    [[10] * 3, [10] * 3], {'0': [10] * 3}, [[True, 10, 10]],
                    [['10', 10, 10]], [[None, 10, 10]], [[-1, 10, 10]],
                    [[float('nan'), 10, 10]], [[float('inf'), 10, 10]],
                    [[float('-inf'), 10, 10]], [[10 ** 400, 10, 10]]]:
            with self.subTest(raw=raw):
                row = copy.deepcopy(self.row)
                row['primaryMetric']['rawData'] = raw
                self.rejected(row)

    def test_incompatible_jmh_metadata_is_rejected(self):
        for field, value in [('jmhVersion', '1.36'), ('mode', 'thrpt'), ('mode', 'ss'),
                             ('threads', 2), ('threads', True), ('forks', 1), ('forks', False),
                             ('warmupIterations', 1), ('warmupTime', '1 s'), ('warmupBatchSize', 2),
                             ('measurementIterations', 2), ('measurementTime', '1 s'),
                             ('measurementBatchSize', 2), ('jvm', ''), ('jvmArgs', None),
                             ('jvmArgs', ['']), ('jvmArgs', [1]), ('vmName', None),
                             ('secondaryMetrics', []), ('benchmark', 'other.RustRegexNative.match')]:
            with self.subTest(field=field, value=value):
                row = copy.deepcopy(self.row)
                row[field] = value
                self.rejected(row)
        for score in [True, '10', None, 0, -1, float('nan'), float('inf'), 10 ** 400]:
            with self.subTest(score=score):
                row = copy.deepcopy(self.row)
                row['primaryMetric']['score'] = score
                self.rejected(row)

    def test_actual_jvm_metadata_must_match_the_selected_policy(self):
        arguments = self.row['jvmArgs']
        bench.validate_rows('RustRegexNative.match', self.params, [self.row],
                            java=self.row['jvm'], jvm_args=arguments)
        extra = copy.deepcopy(self.row)
        extra['jvmArgs'].append('--add-opens=java.base/java.util.regex=ALL-UNNAMED')
        bench.validate_rows('RustRegexNative.match', self.params, [extra], jvm_args=arguments)
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', self.params, [self.row], java='/fixture/other/bin/java')
        extra['jvmArgs'].append('-XX:-UseRustRegex')
        with self.assertRaises(ValueError):
            bench.validate_rows('RustRegexNative.match', self.params, [extra], jvm_args=arguments)

    def test_invalid_result_containers_are_rejected(self):
        for rows in [[], None, {}, 'rows', [None], [[]], [1]]:
            with self.subTest(rows=rows), self.assertRaises(ValueError):
                bench.validate_rows('RustRegexNative.match', self.params, rows)

    def test_summary_uses_the_same_contract_before_emitting_any_summary(self):
        for field in ['scoreUnit', 'rawData']:
            rows, policy = summary_fixture()
            del rows[-1]['result']['primaryMetric'][field]
            with self.subTest(field=field), self.assertRaises(ValueError):
                bench.paired_summaries(rows, policy, META_ID)
        rows, policy = summary_fixture()
        rows[-1]['enabled'] = 0
        with self.assertRaises(ValueError):
            bench.paired_summaries(rows, policy, META_ID)
        rows, policy = summary_fixture()
        rows[-1]['pair'] = True
        with self.assertRaises(ValueError):
            bench.paired_summaries(rows, policy, META_ID)

    def test_ratio_overflow_is_rejected(self):
        rows, policy = summary_fixture()
        for row in rows:
            score = 1e-308 if row['control'] == 'native' else 1e308
            row['result']['primaryMetric']['score'] = score
            row['result']['primaryMetric']['rawData'] = [[score] * 3]
        with self.assertRaisesRegex(ValueError, 'paired ratio'):
            bench.paired_summaries(rows, policy, META_ID)

    def test_nonstandard_or_duplicate_json_fields_are_rejected(self):
        for text in ['{"score":1,"score":2}', '{"rawData":[[NaN]]}',
                     '{"score":Infinity}', '{"score":1e999}']:
            with self.subTest(text=text), self.assertRaises(ValueError):
                bench.strict_json(text)
        self.assertEqual(bench.strict_json('{"scoreError":"NaN"}'), {'scoreError': 'NaN'})


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
        rows = command_fixtures(command)
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
        with self.assertRaisesRegex(ValueError, 'unrecorded prior attempt'):
            self.run_main(resume=True)
        self.assertEqual(before, len([command for command in self.commands if '-rff' in command]))
        self.assertTrue((self.output / 'failure.json').is_file())

    def test_incomplete_primary_output_is_terminal_at_ingestion(self):
        for field in ['scoreUnit', 'rawData']:
            output = self.output.with_name('out-' + field)
            argv = list(self.argv)
            argv[argv.index('--output') + 1] = str(output)
            def tool(command, **kwargs):
                result = self.fake_java(command, **kwargs)
                if '-rff' in command:
                    path = Path(command[command.index('-rff') + 1])
                    rows = json.loads(path.read_text())
                    del rows[0]['primaryMetric'][field]
                    path.write_text(json.dumps(rows))
                return result
            with self.subTest(field=field), patch('sys.argv', argv), \
                    patch.object(bench.subprocess, 'run', side_effect=tool), \
                    contextlib.redirect_stdout(io.StringIO()), self.assertRaises(ValueError):
                bench.main()
            self.assertTrue((output / 'failure.json').is_file())
            self.assertFalse((output / 'results.jsonl').exists())

    def test_resume_rejects_incomplete_metrics_even_if_raw_file_and_records_agree(self):
        self.run_main()
        rows_file = self.output / 'results.jsonl'
        rows = bench.read_records(rows_file)
        target = rows[0]
        tag = bench.attempt_tag(target['suite'], target['tier'], target['pair'], target['control'])
        raw_file = self.output / (tag + '.json')
        raw = json.loads(raw_file.read_text())
        del raw[0]['primaryMetric']['rawData']
        del target['result']['primaryMetric']['rawData']
        raw_file.write_text(json.dumps(raw))
        rows_file.write_text(''.join(json.dumps(row) + '\n' for row in rows))
        before = len(self.commands)
        with self.assertRaises(ValueError):
            self.run_main(resume=True)
        self.assertEqual(len(self.commands), before)
        with self.assertRaises(ValueError):
            bench.session_summaries(self.output)

    def test_resume_requires_missing_original_metadata_without_regenerating_it(self):
        self.run_main()
        metadata = self.output / 'metadata.json'
        metadata.unlink()
        Path(self.argv[self.argv.index('--java') + 1]).write_text('changed executable at the same path')
        (self.output.parent / 'classes/Bench.class').write_bytes(b'changed class at the same path')
        before = len(self.commands)
        with self.assertRaisesRegex(ValueError, 'original verified metadata'):
            self.run_main(resume=True)
        self.assertEqual(len(self.commands), before)
        self.assertFalse(metadata.exists())
        self.assertTrue((self.output / 'failure.json').is_file())

    def test_resume_rejects_changed_jdk_contents_at_stable_path(self):
        self.run_main()
        metadata = (self.output / 'metadata.json').read_bytes()
        before = len([command for command in self.commands if '-rff' in command])
        Path(self.argv[self.argv.index('--java') + 1]).write_text('changed fixture executable')
        with self.assertRaisesRegex(ValueError, 'resume input contents differ'):
            self.run_main(resume=True)
        self.assertEqual(before, len([command for command in self.commands if '-rff' in command]))
        self.assertEqual(metadata, (self.output / 'metadata.json').read_bytes())

    def test_resume_rejects_changed_classpath_contents_at_stable_path(self):
        self.run_main()
        metadata = (self.output / 'metadata.json').read_bytes()
        before = len([command for command in self.commands if '-rff' in command])
        (self.output.parent / 'classes/Bench.class').write_bytes(b'changed class fixture')
        with self.assertRaisesRegex(ValueError, 'resume input contents differ'):
            self.run_main(resume=True)
        self.assertEqual(before, len([command for command in self.commands if '-rff' in command]))
        self.assertEqual(metadata, (self.output / 'metadata.json').read_bytes())

    def test_resume_requires_every_original_command_receipt(self):
        self.run_main()
        receipt = sorted(self.output.glob('*-command.json'))[-1]
        receipt.unlink()
        before = len(self.commands)
        with self.assertRaisesRegex(ValueError, 'command receipt'):
            self.run_main(resume=True)
        self.assertEqual(len(self.commands), before)
        self.assertFalse(receipt.exists())

    def test_resume_rejects_mismatched_command_receipt(self):
        self.run_main()
        receipt = sorted(self.output.glob('*-command.json'))[-1]
        command = json.loads(receipt.read_text())
        command.append('-changed-fixture-option')
        receipt.write_text(json.dumps(command))
        before = len(self.commands)
        with self.assertRaisesRegex(ValueError, 'command receipt'):
            self.run_main(resume=True)
        self.assertEqual(len(self.commands), before)
        self.assertEqual(command, json.loads(receipt.read_text()))

    def test_command_content_hash_cannot_be_bypassed_by_equivalent_json(self):
        self.run_main()
        receipt = sorted(self.output.glob('*-command.json'))[-1]
        receipt.write_text(json.dumps(json.loads(receipt.read_text()), separators=(',', ':')))
        with self.assertRaisesRegex(ValueError, 'command identity'):
            self.run_main(resume=True)

    def test_metadata_cannot_be_replaced_at_the_same_path(self):
        self.run_main()
        path = self.output / 'metadata.json'
        metadata = json.loads(path.read_text())
        metadata['classpath_sha256'] = {}
        path.write_text(json.dumps(metadata))
        with self.assertRaisesRegex(ValueError, 'original verified metadata'):
            self.run_main(resume=True)
        self.assertEqual(metadata, json.loads(path.read_text()))

    def test_resume_rejects_changed_native_library_contents_at_stable_path(self):
        library = Path(self.argv[self.argv.index('--java') + 1]).parent.parent / 'lib/server/libjvm.so'
        library.parent.mkdir(parents=True)
        library.write_bytes(b'native fixture; never loaded')
        self.run_main()
        library.write_bytes(b'changed native fixture')
        before = len([command for command in self.commands if '-rff' in command])
        with self.assertRaisesRegex(ValueError, 'resume input contents differ'):
            self.run_main(resume=True)
        self.assertEqual(before, len([command for command in self.commands if '-rff' in command]))

    def test_missing_metadata_seal_cannot_be_regenerated(self):
        self.run_main()
        path = self.output / 'clock.json'
        clock = json.loads(path.read_text())
        del clock['metadata_sha256']
        path.write_text(json.dumps(clock))
        before = len(self.commands)
        with self.assertRaisesRegex(ValueError, 'original verified metadata'):
            self.run_main(resume=True)
        self.assertEqual(before, len(self.commands))
        self.assertNotIn('metadata_sha256', json.loads(path.read_text()))

    def test_frozen_summary_rejects_changed_execution_policy(self):
        self.run_main()
        path = self.output / 'clock.json'
        clock = json.loads(path.read_text())
        clock['policy']['pairs'] = 9
        path.write_text(json.dumps(clock))
        with self.assertRaisesRegex(ValueError, 'execution policy identity'):
            bench.session_summaries(self.output)

    def test_complete_valid_resume_and_summary_do_not_repeat_measurements(self):
        self.run_main()
        original = {path.name: path.read_bytes() for path in self.output.iterdir() if path.is_file()}
        before = len([command for command in self.commands if '-rff' in command])
        self.run_main(resume=True)
        self.assertEqual(before, len([command for command in self.commands if '-rff' in command]))
        self.assertEqual(original, {path.name: path.read_bytes() for path in self.output.iterdir() if path.is_file()})
        with patch.object(bench.subprocess, 'run') as run:
            summaries = bench.session_summaries(self.output)
            run.assert_not_called()
        self.assertTrue(summaries[0]['completeCampaign'])
        self.assertEqual(summaries[0]['completedProcesses'], 4)

    def test_frozen_summary_is_portable_without_access_to_original_jdk_paths(self):
        import shutil
        self.run_main()
        moved = self.output.with_name('archived-results')
        shutil.move(str(self.output), moved)
        with patch.object(bench.subprocess, 'run') as run:
            summaries = bench.session_summaries(moved)
            run.assert_not_called()
        self.assertTrue(summaries[0]['completeCampaign'])


if __name__ == '__main__':
    unittest.main()
