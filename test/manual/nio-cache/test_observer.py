# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch
from observer import BoundSampler, Costs, children, worker
from process_cleanup import LinuxProcesses, ChildScope, cleanup_errors


def stat(pid, parent, group=10, start=100):
    fields = ['S'] + ['0'] * 37
    fields[1:4] = [str(parent), str(group), str(group)]
    fields[19], fields[36] = str(start), '2'
    return str(pid) + ' (test process) ' + ' '.join(fields)


def fixture(root):
    proc = root / 'proc'
    for pid, parent in ((10, 1), (20, 10)):
        path = proc / str(pid)
        path.mkdir(parents=True)
        (path / 'stat').write_text(stat(pid, parent))
    task = proc / '20/task/21'
    task.mkdir(parents=True)
    (task / 'stat').write_text(stat(21, 10))
    (task / 'comm').write_text('org.ope..rker-1\n')
    (task / 'children').write_text('')
    (task / 'schedstat').write_text('1000 10 2\n')
    (task / 'sched').write_text('se.nr_migrations : 0\nnr_switches : 2\nnr_voluntary_switches : 1\nnr_involuntary_switches : 1\n')
    ct = proc / '10/task/10'
    ct.mkdir(parents=True)
    (ct / 'children').write_text('20\n')
    (ct / 'stat').write_text(stat(10, 1))
    (proc / 'stat').write_text('cpu  10 0 1 100 0 0 0 0 0 0\n')
    cgroup = root / 'cpu.stat'
    cgroup.write_text('usage_usec 100\nnr_throttled 0\nthrottled_usec 0\n')
    return proc, cgroup, {'pid': 10, 'start': 100}, {'pid': 20, 'start': 100}, {'tid': 21, 'start': 100}


class ObserverTests(unittest.TestCase):
    def test_fixed_files_no_enumeration_or_global_snapshot(self):
        with tempfile.TemporaryDirectory() as directory:
            proc, cg, co, fo, th = fixture(Path(directory))
            sampler = BoundSampler(co, fo, th, proc, cg)
            try:
                with patch.object(Path, 'iterdir', side_effect=AssertionError('enumeration in sampling')), \
                     patch.object(Path, 'glob', side_effect=AssertionError('glob in sampling')), \
                     patch.object(LinuxProcesses, 'snapshot', side_effect=AssertionError('global scan in sampling')):
                    with patch.object(sampler, 'read', wraps=sampler.read) as reads:
                        samples = [sampler.sample() for _ in range(3)]
                    self.assertEqual(reads.call_count, 24)
                self.assertEqual(len(sampler.files), 7)
                self.assertEqual(samples[0]['runtime_ns'], 1000)
                self.assertEqual(samples[0]['tid'], 21)
            finally:
                sampler.close()
            self.assertTrue(all(f.closed for f in sampler.files.values()))

    def test_each_bound_identity_is_checked(self):
        for key, relative in [('coordinator', '10/stat'), ('fork', '20/stat'), ('worker', '20/task/21/stat')]:
            with self.subTest(key=key), tempfile.TemporaryDirectory() as directory:
                proc, cg, co, fo, th = fixture(Path(directory))
                sampler = BoundSampler(co, fo, th, proc, cg)
                try:
                    (proc / relative).write_text(stat(20, 10, start=101))
                    with self.assertRaisesRegex(ValueError, 'identity reused'):
                        sampler.sample()
                finally:
                    sampler.close()

    def test_worker_reset_during_read(self):
        with tempfile.TemporaryDirectory() as directory:
            proc, cg, co, fo, th = fixture(Path(directory))
            sampler = BoundSampler(co, fo, th, proc, cg)
            original = sampler.read
            calls = [0]
            def read(key):
                if key == 'worker':
                    calls[0] += 1
                    if calls[0] == 2:
                        return stat(21, 10, start=101)
                return original(key)
            try:
                with patch.object(sampler, 'read', side_effect=read):
                    with self.assertRaisesRegex(ValueError, 'identity reused'):
                        sampler.sample()
            finally:
                sampler.close()

    def test_disappearance_no_rebinding(self):
        with tempfile.TemporaryDirectory() as directory:
            proc, cg, co, fo, th = fixture(Path(directory))
            sampler = BoundSampler(co, fo, th, proc, cg)
            try:
                (proc / '20/task/21/schedstat').write_text('')
                with self.assertRaisesRegex(ValueError, 'empty/oversized'):
                    sampler.sample()
            finally:
                sampler.close()

    def test_bounded_read_size(self):
        with tempfile.TemporaryDirectory() as directory:
            proc, cg, co, fo, th = fixture(Path(directory))
            cg.write_text('x' * 16385)
            sampler = BoundSampler(co, fo, th, proc, cg)
            try:
                with self.assertRaisesRegex(ValueError, 'empty/oversized'):
                    sampler.sample()
            finally:
                sampler.close()

    def test_admission_only_children_and_worker(self):
        with tempfile.TemporaryDirectory() as directory:
            proc, cg, co, fo, th = fixture(Path(directory))
            self.assertEqual(children(10, co, proc), {20})
            self.assertEqual(worker(20, fo, proc)[0], 21)
            extra = proc / '20/task/22'
            extra.mkdir()
            (extra / 'comm').write_text('org.ope..rker-1\n')
            (extra / 'stat').write_text(stat(22, 10))
            with self.assertRaisesRegex(ValueError, 'ambiguous'):
                worker(20, fo, proc)

    def test_cost_attribution_on_failure(self):
        costs = Costs()
        def fail():
            raise ValueError('synthetic failure')
        with self.assertRaises(ValueError):
            costs.measure('reads', fail)
        self.assertEqual(costs.stages['reads']['calls'], 1)
        self.assertGreater(costs.stages['reads']['wall_ns'], 0)

    def test_group_signal_only_for_verified_owned_member(self):
        backend = LinuxProcesses()
        row = {'start': 100, 'pgrp': 10, 'session': 10, 'state': 'R'}
        with patch.object(backend, 'read', return_value=row), patch('process_cleanup.os.killpg') as kill:
            self.assertTrue(backend.kill_group(10, {20: row}))
            kill.assert_called_once()
        with patch.object(backend, 'read', return_value={**row, 'start': 101}), patch('process_cleanup.os.killpg') as kill:
            self.assertFalse(backend.kill_group(10, {20: row}))
            kill.assert_not_called()
        with patch.object(backend, 'read', return_value=row), patch('process_cleanup.os.killpg') as kill:
            self.assertFalse(backend.kill_group(10, {20: {**row, 'session': 99}}))
            kill.assert_not_called()

    def test_individual_signal_rechecks_identity_without_global_scan(self):
        backend = LinuxProcesses()
        with patch.object(backend, 'snapshot', side_effect=AssertionError('unbounded kill scan')), \
             patch.object(backend, 'read', return_value={'start': 101}), patch('process_cleanup.os.kill') as kill:
            backend.kill(20, 100)
            kill.assert_not_called()


class CleanupTests(unittest.TestCase):
    def test_group_and_escaped_descendant_cleanup_preserve_outside(self):
        class Backend:
            parent = 100
            def __init__(self):
                self.table = {500: {'ppid': 100, 'start': 1, 'state': 'R', 'pgrp': 500, 'session': 500}}
                self.killed, self.groups = [], []
            def snapshot(self):
                return dict(self.table)
            def no_children(self):
                return not self.table
            def kill_group(self, group, owned):
                self.groups.append(group)
                for pid, row in owned.items():
                    if row['pgrp'] == group and row['session'] == group:
                        self.table.pop(pid, None)
            def kill(self, pid, start):
                self.killed.append(pid)
                self.table.pop(pid, None)
            def reap(self, pid):
                pass
            def now(self):
                return 0
            def pause(self, seconds):
                raise AssertionError('unexpected cleanup wait')
        class Proc:
            pid = 10
            def poll(self):
                return 0
        backend = Backend()
        scope = ChildScope(backend)
        # Fork adopted by the subreaper after coordinator exits; one escaped
        # descendant has created a different session. Both must be cleaned.
        backend.table.update({20: {'ppid': 100, 'start': 2, 'state': 'R', 'pgrp': 10, 'session': 10},
                              30: {'ppid': 20, 'start': 3, 'state': 'R', 'pgrp': 30, 'session': 30}})
        result = scope.close(Proc(), 2)
        self.assertTrue(result['complete'])
        self.assertEqual(backend.groups, [10])
        self.assertEqual(set(backend.killed), {20, 30})
        self.assertEqual(set(backend.table), {500})
        self.assertTrue(cleanup_errors(result))  # Live leftovers remain inconclusive.


class SnapshotTests(unittest.TestCase):
    def test_audit_uses_one_root_scan_and_direct_pids(self):
        from types import SimpleNamespace
        backend = LinuxProcesses()
        names = [SimpleNamespace(name=n) for n in ('10', '20', 'self', '２０')]
        from unittest.mock import MagicMock
        scan = MagicMock()
        scan.__enter__.return_value = iter(names)
        def read(pid):
            if pid == 20:
                raise FileNotFoundError('concurrent process exit')
            return {'start': 1, 'state': 'R', 'ppid': 1, 'pgrp': 10, 'session': 10}
        with patch('process_cleanup.os.scandir', return_value=scan) as scandir, \
             patch.object(Path, 'glob', side_effect=AssertionError('nested process glob')), \
             patch.object(backend, 'read', side_effect=read) as reads:
            self.assertEqual(set(backend.snapshot()), {10})
            scandir.assert_called_once_with('/proc')
            self.assertEqual([c.args[0] for c in reads.call_args_list], [10, 20])
