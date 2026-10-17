# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Deterministic fake-kernel owner tests: no native child/JVM/workload launch."""
import copy
import io
import os
import signal
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from cancellation import Cancellation
from process_cleanup import ChildScope
import supervise


class Kernel:
    """Model direct-child authority, delayed death and progressive adoption.

    Unrelated task 77 shares neither ancestry nor ownership. A kill request is
    effective only for a direct child; a deeper descendant must first be adopted.
    Fake time and delayed exits force cleanup to progress over multiple scans.
    """
    def __init__(self, delay=.75):
        self.parent = 9000
        self.time = 0.
        self.delay = delay
        self.tasks = {77: self.task(1, 77)}
        self.pending = {}
        self.signals = []
        self.rejected = []
        self.hidden = set()
        self.unkillable = set()
        self.on_pause = lambda: None

    @staticmethod
    def task(ppid, pid):
        return {'ppid': ppid, 'start': pid, 'state': 'S',
                'pgrp': pid, 'session': pid, 'code': None}

    def add(self, pid, parent):
        self.tasks[pid] = self.task(parent, pid)

    def exit(self, pid, code):
        self.tasks[pid].update(state='Z', code=code)
        for row in self.tasks.values():
            if row['ppid'] == pid:
                row['ppid'] = self.parent

    def snapshot(self):
        return {p: dict(row) for p, row in self.tasks.items() if p not in self.hidden}

    def no_children(self):
        return not any(row['ppid'] == self.parent for row in self.tasks.values())

    def describe(self, pid, start):
        row = self.tasks.get(pid)
        if row and row['ppid'] == self.parent and row['start'] == start:
            return {'pid': pid, 'start': start, 'command': ['fake-owned-child'], 'executable': '/fake'}
        return None

    def kill(self, pid, start):
        row = self.tasks.get(pid)
        if row is None or row['start'] != start or row['ppid'] != self.parent:
            self.rejected.append(pid)
            return
        if pid not in self.pending:
            self.signals.append((pid, self.time))
            if pid not in self.unkillable:
                self.pending[pid] = self.time + self.delay

    def reap(self, pid, start):
        row = self.tasks.get(pid)
        if (row and row['start'] == start and row['ppid'] == self.parent
                and row['state'] == 'Z'):
            del self.tasks[pid]

    def now(self):
        return self.time

    def pause(self, seconds):
        if seconds < 0:
            raise AssertionError('Negative deadline wait')
        self.time += seconds
        self.on_pause()
        for pid, due in list(self.pending.items()):
            if due <= self.time:
                self.exit(pid, -signal.SIGKILL)
                del self.pending[pid]


class Root:
    def __init__(self, kernel):
        self.pid = 100
        self.kernel = kernel
        self.returncode = None
        self.closed = False

    def poll(self):
        if self.returncode is None:
            row = self.kernel.tasks[self.pid]
            if row['state'] == 'Z':
                self.returncode = row['code']
                self.kernel.reap(self.pid, row['start'])
        return self.returncode

    def close(self):
        self.closed = True


class SupervisorTests(unittest.TestCase):
    def setUp(self):
        # Any accidental escape from the fake boundary fails instead of spawning
        # a child or signalling a host process. No monkeypatch reaches the host.
        for name in ['os.fork', 'os.execv', 'os.pidfd_open', 'os.waitpid',
                     'os.kill', 'os.killpg', 'signal.pidfd_send_signal']:
            mocked = patch(name, side_effect=AssertionError('Native operation: ' + name))
            mocked.start()
            self.addCleanup(mocked.stop)
        self.kernel = Kernel()
        self.cancel = Cancellation()
        self.receipts = []
        self.root = None

    def launch(self, argv, exit_code=None, layers=0):
        self.kernel.add(100, self.kernel.parent)
        previous = 100
        for i in range(layers):
            pid = 200 + i
            self.kernel.add(pid, previous)
            previous = pid
        self.root = Root(self.kernel)
        if exit_code is not None:
            self.kernel.exit(100, exit_code)
        return self.root

    def run_owner(self, launch, **kwargs):
        owner = supervise.Supervisor(self.kernel, self.cancel, launch,
                                     lambda r: self.receipts.append(copy.deepcopy(r)),
                                     seconds=10, cleanup_seconds=4, report_seconds=1,
                                     **kwargs)
        return owner.run(['not-executed-controller'])

    def test_normal_completion_requires_closed_owner_and_final_audit(self):
        row = self.run_owner(lambda a: self.launch(a, exit_code=0))
        self.assertEqual(row['status'], 'COMPLETED')
        self.assertTrue(row['cleanup']['complete'])
        self.assertTrue(row['final_child_audit'])
        self.assertTrue(self.root.closed)
        self.assertEqual(self.kernel.signals, [])
        self.assertFalse(row['supervisor_uncatchable_death_contained'])

    def test_multiple_adoption_layers_use_outer_window_without_unrelated_signals(self):
        row = self.run_owner(lambda a: self.launch(a, exit_code=-signal.SIGKILL, layers=4))
        self.assertEqual(row['controller_exit'], -signal.SIGKILL)
        self.assertNotEqual(row['status'], 'COMPLETED')
        self.assertTrue(row['cleanup']['complete'])
        self.assertTrue(row['final_child_audit'])
        self.assertGreater(self.kernel.time, 2)  # Inner two-second cap would fail.
        self.assertLess(self.kernel.time, 4)
        self.assertEqual([p for p, t in self.kernel.signals], [200, 201, 202, 203])
        self.assertIn(201, self.kernel.rejected)  # Not signalled before adoption.
        self.assertEqual(set(self.kernel.tasks), {77})

    def test_inner_nonzero_exit_never_becomes_success(self):
        row = self.run_owner(lambda a: self.launch(a, exit_code=2))
        self.assertEqual(row['status'], 'INNER_FAILED')
        self.assertTrue(row['cleanup']['complete'])
        self.assertEqual(row['controller_exit'], 2)

    def test_cancellation_during_launch_assigns_then_cleans_root(self):
        def launch(argv):
            root = self.launch(argv, layers=2)
            self.cancel.request(signal.SIGTERM)
            return root
        self.kernel.on_pause = lambda: self.cancel.request(signal.SIGHUP)
        row = self.run_owner(launch)
        self.assertEqual(row['status'], 'CANCELLED')
        self.assertEqual(row['controller_pid'], 100)
        self.assertEqual(row['cancellation_signal'], signal.SIGTERM)
        self.assertTrue(row['cleanup']['complete'])
        self.assertTrue(self.root.closed)
        self.assertEqual(set(self.kernel.tasks), {77})

    def test_partial_launch_exception_still_cleans_unknown_birth(self):
        def launch(argv):
            self.launch(argv, layers=1)
            self.cancel.request(signal.SIGINT)
            raise RuntimeError('bind failed after fork')
        row = self.run_owner(launch)
        self.assertEqual(row['status'], 'CANCELLED')
        self.assertIsNone(row['controller_pid'])
        self.assertIn('bind failed', row['errors'][0])
        self.assertTrue(row['cleanup']['complete'])
        self.assertEqual(set(self.kernel.tasks), {77})

    def test_deadline_cutoff_reserves_cleanup_without_resetting_hard_cap(self):
        row = self.run_owner(lambda a: self.launch(a, layers=1))
        self.assertEqual(row['status'], 'DEADLINE_EXCEEDED')
        self.assertEqual(row['hard_deadline_monotonic'], 10)
        self.assertEqual(row['run_cutoff_monotonic'], 5)
        self.assertTrue(row['cleanup']['complete'])
        self.assertTrue(row['final_child_audit'])
        self.assertGreaterEqual(self.kernel.signals[0][1], 5)
        self.assertLess(self.kernel.time, 9)

    def test_exhausted_deadline_makes_one_bounded_attempt_and_reports_remaining(self):
        def launch(argv):
            root = self.launch(argv)
            self.kernel.unkillable.add(100)
            self.kernel.time = 11  # Launch consumed the original hard deadline.
            return root
        row = self.run_owner(launch)
        self.assertEqual(row['status'], 'DEADLINE_EXCEEDED')
        self.assertTrue(row['deadline_exceeded'])
        self.assertFalse(row['cleanup']['complete'])
        self.assertFalse(row['final_child_audit'])
        self.assertEqual(self.kernel.time, 11)
        self.assertEqual(len(self.kernel.signals), 1)
        self.assertEqual(row['cleanup']['remaining'][0]['pid'], 100)

    def test_hidden_live_child_blocks_empty_snapshot_and_final_audit(self):
        def launch(argv):
            root = self.launch(argv, exit_code=0, layers=1)
            self.kernel.hidden.add(200)
            return root
        row = self.run_owner(launch)
        self.assertEqual(row['status'], 'HOLD')
        self.assertFalse(row['cleanup']['complete'])
        self.assertFalse(row['final_child_audit'])
        self.assertTrue(any('Final child audit' in e for e in row['errors']))

    def test_existing_child_admission_failure_never_signals_it(self):
        self.kernel.add(500, self.kernel.parent)
        def forbidden(argv):
            self.fail('Must not launch with a pre-existing child')
        row = self.run_owner(forbidden)
        self.assertEqual(row['status'], 'HOLD')
        self.assertEqual(self.kernel.signals, [])
        self.assertIn(500, self.kernel.tasks)

    def test_receipt_crossing_original_deadline_cannot_report_completion(self):
        def record(row):
            self.receipts.append(copy.deepcopy(row))
            if row['status'] == 'COMPLETED':
                self.kernel.time = 11
        owner = supervise.Supervisor(self.kernel, self.cancel,
                                     lambda a: self.launch(a, exit_code=0), record,
                                     seconds=10, cleanup_seconds=4, report_seconds=1)
        row = owner.run(['not-executed-controller'])
        self.assertEqual(row['status'], 'DEADLINE_EXCEEDED')
        self.assertEqual(self.receipts[-1]['status'], 'DEADLINE_EXCEEDED')

    def test_cancellation_during_final_receipt_cannot_report_completion(self):
        def record(row):
            self.receipts.append(copy.deepcopy(row))
            if row['status'] == 'COMPLETED':
                self.cancel.request(signal.SIGTERM)
        owner = supervise.Supervisor(self.kernel, self.cancel,
                                     lambda a: self.launch(a, exit_code=0), record,
                                     seconds=10, cleanup_seconds=4, report_seconds=1)
        row = owner.run(['not-executed-controller'])
        self.assertEqual(row['status'], 'CANCELLED')
        self.assertEqual(row['cancellation_signal'], signal.SIGTERM)
        self.assertEqual(self.receipts[-1]['status'], 'CANCELLED')

    def test_inner_cleanup_default_remains_two_seconds(self):
        self.launch([], layers=4)
        receipt = ChildScope(self.kernel, protect_existing=False).close(self.root, 20)
        self.assertFalse(receipt['complete'])
        self.assertAlmostEqual(self.kernel.time, 2)


class NativeBoundaryTests(unittest.TestCase):
    def test_fork_child_reaps_once_using_held_pidfd(self):
        backend = SimpleNamespace(read=lambda p: {'start': 100},
                                  child_handle=lambda p, s: 88)
        child = supervise.ForkChild(100, backend)
        with patch.object(supervise.os, 'waitid', return_value=SimpleNamespace(
                si_code=os.CLD_EXITED, si_status=3)) as wait, \
             patch.object(supervise.os, 'waitpid') as numeric, \
             patch.object(supervise.os, 'close') as close:
            self.assertEqual(child.poll(), 3)
            self.assertEqual(child.poll(), 3)
            child.close()
        wait.assert_called_once_with(os.P_PIDFD, 88, os.WEXITED | os.WNOHANG)
        numeric.assert_not_called()
        close.assert_called_once_with(88)

    def test_parent_fork_path_has_no_blocking_exec_handshake(self):
        backend = SimpleNamespace(read=lambda p: {'start': 100},
                                  child_handle=lambda p, s: 88)
        with patch.object(supervise.os, 'fork', return_value=100), \
             patch.object(supervise.os, 'execv') as execute, \
             patch.object(supervise.os, 'close'):
            child = supervise.fork_controller(['never-executed'], backend, 1, 2)
            child.close()
        self.assertEqual(child.pid, 100)
        execute.assert_not_called()

    def test_cli_requires_execute_before_any_native_admission(self):
        with patch.object(supervise.sys, 'argv', ['supervise.py', '--owner-output', '/not-created']), \
             patch.object(supervise, 'LinuxProcesses') as native, \
             patch.object(supervise.sys, 'stderr', io.StringIO()):
            with self.assertRaises(SystemExit) as stopped:
                supervise.main()
        self.assertEqual(stopped.exception.code, 2)
        native.assert_not_called()

    def test_failed_child_exec_always_exits_even_if_diagnostic_write_fails(self):
        class ChildExit(BaseException):
            pass
        with patch.object(supervise.os, 'fork', return_value=0), \
             patch.object(supervise.os, 'setsid'), \
             patch.object(supervise.os, 'dup2'), \
             patch.object(supervise.os, 'execv', side_effect=OSError('exec denied')), \
             patch.object(supervise.os, 'write', side_effect=OSError('disk full')), \
             patch.object(supervise.os, '_exit', side_effect=ChildExit) as exit_child:
            with self.assertRaises(ChildExit):
                supervise.fork_controller(['not-executed'], object(), 1, 2)
        exit_child.assert_called_once_with(127)


if __name__ == '__main__':
    unittest.main()
