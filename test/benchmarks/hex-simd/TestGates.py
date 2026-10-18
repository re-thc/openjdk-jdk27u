#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""Numerical fixtures and mocked Popen only; no Java, signals or live timing."""
import contextlib
import io
import json
from pathlib import Path
import signal
import time
import types
import unittest
from unittest.mock import Mock, patch
import compare
import matrix as m
from TestPreflight import Offline


def dataset(state, kind='plain', sizes=(32, 128, 1024, 4096, 65536)):
    cells = [(n, op) for n in sizes for op in ['encode', 'decode']] if kind == 'plain' else list((n, op) for op, n in m.PROTECTED.items())
    return {(n, op + suffix): {'ns': 25.0 if state == 'enabled' and kind == 'plain' and suffix == '-native' else 100.0,
                'bytes': 64.0, 'observations': [25.0 if state == 'enabled' and kind == 'plain' and suffix == '-native' else 100.0] * 5,
                'allocation_observations': [64.0] * 5}
            for n, op in cells for suffix in ['-jdk', '-native']}


def cold_rows():
    return [{'gc': gc, 'state': state, 'round': round, 'mode': mode,
             'wall_ns': 80_000_000 if state == 'enabled' else 100_000_000,
             'call_ns': 10_000_000, 'length': 0}
            for gc, state, round, mode in sorted(m.EXPECTED_COLD)]


class Gates(Offline):
    def test_incomplete_is_pending_and_full_grid_required_for_success(self):
        self.assertEqual(m.evaluate({}, [])['status'], 'PENDING')
        with self.assertRaises(m.Stop):
            m.evaluate({}, [], complete=True)
        data = {key: dataset(key[3], key[0]) for key in m.EXPECTED_KEYS}
        report = m.evaluate(data, cold_rows(), complete=True)
        self.assertEqual(report['status'], 'LOCAL_GO')
        self.assertEqual(report['steady_processes_completed'], 72)
        self.assertEqual(report['cold_observations_completed'], 225)
        self.assertTrue(report['complete_grid'])

    def test_all_existing_steady_gate_families(self):
        cases = [
            ('disabled', 32, 'encode-native', 'ns', 120, 'control drift'),
            ('enabled', 32, 'encode-jdk', 'ns', 120, 'reference drift'),
            ('enabled', 32, 'encode-native', 'bytes', 81, 'allocation'),
            ('baseline', 32, 'encode-native', 'bytes', 81, 'within-VM'),
            ('enabled', 32, 'encode-native', 'ns', 106, 'regression'),
            ('enabled', 128, 'decode-native', 'ns', 92, 'below 1.1'),
            ('enabled', 1024, 'encode-native', 'ns', 92, 'below 1.1'),
            ('enabled', 4096, 'encode-native', 'ns', 84, 'below 1.2'),
            ('enabled', 65536, 'decode-native', 'ns', 51, 'below 2.0'),
            ('enabled', 128, 'decode-native', 'ns', 101, 'reverses claimed benefit')]
        for state, size, op, field, value, reason in cases:
            with self.subTest(reason=reason):
                data = {('plain', True, 'G1', st, 1): dataset(st) for st in m.STATES}
                data['plain', True, 'G1', state, 1][size, op][field] = value
                report = m.evaluate(data, [])
                self.assertTrue(any(reason in s for s in report['noise'] + report['failures']))
        for op, value in [('mixed-101', 106), ('late-invalid', 1101)]:
            data = {('protected', True, 'G1', st, 1): dataset(st, 'protected') for st in m.STATES}
            data['protected', True, 'G1', 'enabled', 1][m.PROTECTED[op], op + '-native']['ns'] = value
            self.assertTrue(any(op + ': regression' in s for s in m.evaluate(data, [])['failures']))

    def test_two_forks_required_for_wide_observation_gate(self):
        data = {}
        for fork in [1, 2]:
            data['plain', True, 'G1', 'baseline', fork] = dataset('baseline')
            data['plain', True, 'G1', 'baseline', fork][1024, 'encode-native']['observations'] = [100, 201, 100, 100, 100]
            flags = m.evaluate(data, [])['noise']
            self.assertEqual(any('observation range' in s for s in flags), fork == 2)

    def test_reverse_state_order_evaluates_pair_without_baseline(self):
        enabled = dataset('enabled')
        enabled[32, 'encode-native']['ns'] = 106
        data = {('plain', True, 'G1', 'enabled', 2): enabled}
        self.assertEqual(m.evaluate(data, [])['status'], 'PENDING')
        data['plain', True, 'G1', 'disabled', 2] = dataset('disabled')
        self.assertIn('regression versus disabled', m.evaluate(data, [])['failures'][0])

    def test_cold_waits_for_exact_five_round_operands(self):
        rows = [r for r in cold_rows() if r['gc'] == 'G1' and r['mode'] == 'bulk-session' and r['state'] != 'enabled']
        for r in rows:
            if r['state'] == 'disabled': r['wall_ns'] = 120_000_000
        held = rows.pop()
        self.assertEqual(m.evaluate({}, rows)['status'], 'PENDING')
        rows.append(held)
        self.assertEqual(m.evaluate({}, rows)['status'], 'INCONCLUSIVE_NOISE')
        with self.assertRaises(m.Stop):
            m.evaluate({}, rows + [held])

    def test_cold_performance_gates_work_with_one_control(self):
        for mode, metric, value, reason in [('empty', 'wall_ns', 111_000_000, 'wall regression'),
                ('tiny', 'wall_ns', 111_000_000, 'wall regression'),
                ('encode', 'call_ns', 30_000_001, 'first public call'),
                ('decode', 'call_ns', 30_000_001, 'first public call'),
                ('bulk-session', 'wall_ns', 100_000_000, 'wall speedup')]:
            rows = [r for r in cold_rows() if r['gc'] == 'G1' and r['mode'] == mode and r['state'] != 'baseline']
            for r in rows:
                if r['state'] == 'enabled': r[metric] = value
            with self.subTest(mode=mode):
                self.assertTrue(any(reason in s for s in m.evaluate({}, rows)['failures']))

    def campaign(self):
        c = m.Campaign()
        c.root = c.repo = c.harness = self.root
        c.env = {}
        c.jdks = {'baseline': self.root / 'base', 'candidate': self.root / 'candidate'}
        c.s = types.SimpleNamespace(logs=self.root, work_end=time.monotonic() + 7200)
        c.library_preflight_complete = True
        return c

    def test_cold_campaign_stops_before_next_launch_and_preserves_failed_record(self):
        c, calls = self.campaign(), []
        def run(label, argv, **kwargs):
            calls.append(label)
            _, gc, round, state, mode = label.split('-', 4)
            lengths = {'empty': 0, 'tiny': 64, 'encode': 2048, 'decode': 128, 'bulk-session': 65536}
            out, err = self.root / 'out', self.root / 'err'
            out.write_text(f'{mode},10000000,{lengths[mode]}\n'); err.write_text('')
            return out, err, 120_000_000 if mode == 'bulk-session' and state == 'disabled' else 80_000_000 if state == 'enabled' else 100_000_000
        c.run = run
        with self.assertRaises(m.Stop) as raised:
            c.cold()
        self.assertEqual(raised.exception.category, 'INCONCLUSIVE_NOISE')
        self.assertEqual(calls[-1], 'cold-G1-5-disabled-bulk-session')
        self.assertEqual(len(calls), 70)
        self.assertEqual(len(json.loads((self.root / 'cold.json').read_text())), 70)
        self.assertFalse(json.loads((self.root / 'early-stop.json').read_text())['complete_grid'])

    def test_steady_stops_on_control_pair_or_first_enabled_failure(self):
        for reject in ['control', 'performance', 'allocation']:
            c, calls = self.campaign(), []
            def run(label, argv, **kwargs):
                calls.append(label)
                _, kind, compact, gc, state, fork = label.split('-')
                sizes = m.PLAIN_UTF16 if compact == 'False' else m.PLAIN_G1
                data = dataset(state, kind, sizes)
                if reject == 'control' and state == 'disabled': data[0, 'encode-native']['ns'] = 120
                if reject == 'performance' and state == 'enabled': data[1024, 'encode-native']['ns'] = 100
                if reject == 'allocation': data[0, 'encode-native']['bytes'] = 81
                out, err = self.root / (label + '.out'), self.root / (label + '.err')
                lines = [f'# nativeAvailable={str(state == "enabled").lower()}', '# warmupMs=1000; sampleMs=100; samples=5',
                         'bytes,operation,sample,ns_per_call,java_bytes_per_call,calls']
                lines += [f'{n},{op},{sample},{v["ns"]},{v["bytes"]},10' for (n, op), v in data.items() for sample in range(5)]
                out.write_text('\n'.join(lines) + '\n'); err.write_text('')
                return out, err, 1
            c.run = run
            with self.subTest(reject=reject), self.assertRaises(m.Stop):
                c.measurements([])
            self.assertEqual(len(calls), {'control': 5, 'performance': 9, 'allocation': 1}[reject])
            self.assertEqual(len(json.loads((self.root / 'measurements.json').read_text())), len(calls))


class Cancellation(Offline):
    def test_main_reports_early_failure_and_post_identity_override(self):
        for category, corrupt, expected, code in [
                ('INCONCLUSIVE_NOISE', False, 'INCONCLUSIVE_NOISE', 3),
                ('NO_GO_MEASURED', False, 'NO_GO_MEASURED', 2),
                ('INCONCLUSIVE_NOISE', True, 'INCOMPLETE', 4)]:
            root = self.root / (category + str(corrupt)); root.mkdir()
            image = root / 'jdk'; (image / 'bin').mkdir(parents=True); (image / 'lib').mkdir()
            (image / 'bin/java').write_text('fixture')
            (image / 'lib/libhexsimd.so').write_text('fixture')
            output, receipt = root / 'output', root / 'receipt'
            argv = ['compare.py', '--execute', '--baseline', str(image), '--candidate', str(image),
                    '--harness', str(root), '--receipt', str(receipt), '--receipt-sha256', 'a' * 64,
                    '--package-revision', 'b' * 40, '--output', str(output)]
            def verify(when):
                if corrupt and when == 'after': raise m.Stop('EVIDENCE_OR_CORRECTNESS', 'changed')
            campaign = types.SimpleNamespace(library_preflight=lambda: None,
                cold=Mock(side_effect=m.Stop(category, 'fixture failure')),
                measurements=Mock(side_effect=AssertionError('launched after gate failure')))
            with patch('sys.argv', argv), patch.object(compare.platform, 'system', return_value='Linux'), \
                    patch.object(compare.platform, 'platform', return_value='fixture-platform'), \
                    patch.object(compare.platform, 'machine', return_value='x86_64'), \
                    patch.object(compare.signal, 'signal'), patch.object(m, 'Campaign', return_value=campaign), \
                    patch.object(compare, 'FrozenInputs', return_value=types.SimpleNamespace(verify=verify)), \
                    contextlib.redirect_stdout(io.StringIO()):
                self.assertEqual(compare.main(), code)
            result = json.loads((output / 'result.json').read_text())
            self.assertEqual(result['status'], expected)
            self.assertEqual('early_stop' in result, not corrupt)
            campaign.measurements.assert_not_called()

    def test_sigterm_and_keyboard_interrupt_reap_direct_child_and_verify_identity(self):
        for sigterm in [False, True]:
            root = self.root / str(sigterm); root.mkdir()
            runs = compare.JavaRuns(root)
            child = Mock(returncode=-9)
            def wait(timeout=None):
                if timeout is not None: return -9
                if sigterm: compare.interrupted(signal.SIGTERM, None)
                raise KeyboardInterrupt()
            child.wait.side_effect = wait
            child.poll.return_value = None
            timer, events = Mock(), []
            frozen = types.SimpleNamespace(verify=lambda when: events.append(when))
            c = types.SimpleNamespace(root=root, s=runs, library_preflight=lambda: None,
                cold=lambda: runs.run('interrupted', ['mock-java'], root, {}),
                measurements=Mock(side_effect=AssertionError('launched after cancellation')))
            with patch.object(compare.subprocess, 'Popen', return_value=child), patch.object(compare.threading, 'Timer', return_value=timer), self.assertRaises(KeyboardInterrupt):
                compare.execute(c, frozen)
            child.kill.assert_called_once()
            self.assertEqual(child.wait.call_args.kwargs, {'timeout': 5})
            timer.cancel.assert_called_once(); timer.join.assert_called_once()
            self.assertEqual(events, ['before', 'after'])
            record = json.loads((root / 'commands.json').read_text())[0]
            self.assertEqual(record['returncode'], -9)
            self.assertTrue(record['interrupted'])
            c.measurements.assert_not_called()

    def test_deadline_reaps_direct_child_without_retry(self):
        runs = compare.JavaRuns(self.root)
        child = Mock(returncode=-9)
        child.wait.return_value = child.poll.return_value = -9
        timer = Mock()
        def factory(seconds, expire):
            timer.start.side_effect = expire
            return timer
        with patch.object(compare.subprocess, 'Popen', return_value=child) as popen, patch.object(compare.threading, 'Timer', side_effect=factory), self.assertRaises(m.Stop) as raised:
            runs.run('timeout', ['mock-java'], self.root, {}, timeout=1)
        self.assertEqual(raised.exception.category, 'DEADLINE')
        popen.assert_called_once(); child.kill.assert_called_once(); child.wait.assert_called_once()
        timer.cancel.assert_called_once(); timer.join.assert_called_once()
        self.assertEqual(json.loads((self.root / 'commands.json').read_text())[0]['returncode'], -9)

    def test_early_gate_still_verifies_after_and_identity_failure_overrides(self):
        for corrupt in [False, True]:
            events = []
            def verify(when):
                events.append(when)
                if corrupt and when == 'after': raise m.Stop('EVIDENCE_OR_CORRECTNESS', 'changed')
            c = types.SimpleNamespace(root=self.root, s=None, library_preflight=lambda: None,
                cold=Mock(side_effect=m.Stop('INCONCLUSIVE_NOISE', 'control drift')),
                measurements=Mock(side_effect=AssertionError('launched after gate failure')))
            with self.assertRaises(m.Stop) as raised:
                compare.execute(c, types.SimpleNamespace(verify=verify))
            self.assertEqual(raised.exception.category, 'EVIDENCE_OR_CORRECTNESS' if corrupt else 'INCONCLUSIVE_NOISE')
            self.assertEqual(events, ['before', 'after']); c.measurements.assert_not_called()


if __name__ == '__main__':
    unittest.main()
