# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Offline original-UTC, owned preflight and prospective toolchain fixtures."""
import io
import json
from pathlib import Path
import signal
import subprocess
import tempfile
import unittest
from unittest.mock import patch

from cancellation import Cancellation, Cancelled
from deadline import FixedCutoff, UTC_CUTOFF, PREPARATION_UTC_CUTOFF
from supervise import Supervisor
from test_supervisor import Kernel, Root
import continuation
import supervise
import toolchain_inputs


class ClockTests(unittest.TestCase):
    def test_reboot_uses_remaining_utc_not_old_monotonic_epoch(self):
        clock = FixedCutoff(monotonic=lambda: 1, wall=lambda: UTC_CUTOFF - 8)
        self.assertEqual(clock.deadline, 9)

    def test_wall_rollback_cannot_extend_initial_monotonic_bound(self):
        state = {'mono': 0, 'wall': UTC_CUTOFF - 100}
        clock = FixedCutoff(monotonic=lambda: state['mono'], wall=lambda: state['wall'])
        state.update(mono=20, wall=UTC_CUTOFF - 1000)
        clock.check(); self.assertEqual(clock.deadline, 100)
        state['mono'] = 101
        with self.assertRaises(RuntimeError): clock.check()

    def test_wall_forward_or_expired_utc_stops_even_after_monotonic_reset(self):
        state = {'wall': UTC_CUTOFF - 100}
        clock = FixedCutoff(monotonic=lambda: 1, wall=lambda: state['wall'])
        state['wall'] = UTC_CUTOFF + 1
        with self.assertRaises(RuntimeError): clock.check()
        expired = FixedCutoff(monotonic=lambda: 0, wall=lambda: UTC_CUTOFF + 1)
        with self.assertRaises(RuntimeError): expired.check()

    def test_preparation_cannot_receive_a_fresh_stage_after_reboot(self):
        clock = FixedCutoff(monotonic=lambda: 1, wall=lambda: PREPARATION_UTC_CUTOFF + 1)
        clock.check()  # Whole UTC budget remains, but the preparation stage does not.
        with self.assertRaises(RuntimeError): clock.check_preparation()


class PreflightTests(unittest.TestCase):
    def setUp(self):
        self.kernel = Kernel(); self.cancel = Cancellation(); self.launched = []

    def owner(self, admit, wall=None):
        def forbidden(argv):
            self.launched.append(argv)
            raise AssertionError('No controller should launch after failed preflight')
        return Supervisor(self.kernel, self.cancel, forbidden, lambda row: json.dumps(row),
                          seconds=10, cleanup_seconds=4, report_seconds=1,
                          utc_cutoff=UTC_CUTOFF, wall_now=wall or (lambda: UTC_CUTOFF - 10),
                          admit=admit)

    def test_delayed_preflight_cannot_reset_deadline_or_launch(self):
        def delayed(): self.kernel.time = 6
        row = self.owner(delayed).run(['not-executed'])
        self.assertEqual(row['status'], 'DEADLINE_EXCEEDED')
        self.assertEqual(row['hard_deadline_monotonic'], 10)
        self.assertTrue(row['final_child_audit']); self.assertFalse(self.launched)

    def test_cancelled_preflight_cleans_partial_birth_and_audits(self):
        def cancelled():
            self.kernel.add(200, self.kernel.parent)
            self.cancel.request(signal.SIGTERM)
        row = self.owner(cancelled).run(['not-executed'])
        self.assertEqual(row['status'], 'CANCELLED')
        self.assertTrue(row['cleanup']['complete']); self.assertTrue(row['final_child_audit'])
        self.assertFalse(self.launched); self.assertEqual(set(self.kernel.tasks), {77})

    def test_preflight_error_still_owns_children_and_runs_final_audit(self):
        def failed():
            self.kernel.add(200, self.kernel.parent)
            self.kernel.add(201, 200)
            raise OSError('preflight failed after partial birth')
        row = self.owner(failed).run(['not-executed'])
        self.assertEqual(row['status'], 'HOLD')
        self.assertTrue(row['cleanup']['complete']); self.assertTrue(row['final_child_audit'])
        self.assertEqual(set(self.kernel.tasks), {77}); self.assertFalse(self.launched)

    def test_expired_utc_skips_preflight_and_controller_after_reboot(self):
        row = self.owner(lambda: self.fail('Expired admission'),
                         wall=lambda: UTC_CUTOFF + 1).run(['not-executed'])
        self.assertEqual(row['status'], 'DEADLINE_EXCEEDED')
        self.assertTrue(row['final_child_audit']); self.assertFalse(self.launched)

    def test_slow_verification_child_is_owned_until_deadline_cleanup(self):
        def launch(argv):
            self.kernel.add(100, self.kernel.parent); self.kernel.add(200, 100)
            return Root(self.kernel)
        row = Supervisor(self.kernel, self.cancel, launch, lambda row: None,
                         seconds=10, cleanup_seconds=4, report_seconds=1,
                         utc_cutoff=UTC_CUTOFF, wall_now=lambda: UTC_CUTOFF - 10).run(['verification-worker'])
        self.assertEqual(row['status'], 'DEADLINE_EXCEEDED')
        self.assertTrue(row['cleanup']['complete']); self.assertTrue(row['final_child_audit'])
        self.assertEqual(set(self.kernel.tasks), {77})

    def test_cancelled_git_verification_reaps_all_owned_descendants(self):
        kernel, cancel = self.kernel, self.cancel
        kernel.verify_support = lambda: None
        records = []
        class Process(Root):
            def __init__(self):
                kernel.add(100, kernel.parent); kernel.add(200, 100)
                super().__init__(kernel)
                self.stdout, self.stderr = io.StringIO(), io.StringIO()
            def communicate(self, timeout):
                cancel.request(signal.SIGINT)
                raise subprocess.TimeoutExpired('fake git', timeout)
        with patch.object(continuation, 'LinuxProcesses', return_value=kernel), \
             patch.object(continuation, 'enable_subreaper'), \
             patch.object(continuation.time, 'monotonic', side_effect=kernel.now), \
             patch.object(continuation.subprocess, 'Popen', side_effect=lambda *a, **k: Process()):
            with continuation.verification(cancel.check, records, deadline=10):
                with self.assertRaises(Cancelled): continuation.git('/fake', 'status')
        self.assertTrue(records[0]['cleanup']['complete'])
        self.assertEqual(records[0]['cleanup']['remaining'], [])
        self.assertEqual(set(kernel.tasks), {77}); json.dumps(records)

    def test_chunk_hash_checks_cancellation_before_finishing_large_input(self):
        with tempfile.TemporaryDirectory() as folder:
            p = Path(folder) / 'input'; p.write_bytes(b'x' * (2 * 1024**2))
            count = 0
            def cancelled():
                nonlocal count
                count += 1
                if count == 3: self.cancel.request(signal.SIGTERM)
                self.cancel.check()
            with continuation.verification(cancelled):
                with self.assertRaises(Cancelled): continuation.sha(p)
            self.assertEqual(count, 3)

    def test_chunk_hash_deadline_exhaustion_is_not_deferred_until_end(self):
        state = {'mono': 0, 'wall': UTC_CUTOFF - 10}
        clock = FixedCutoff(monotonic=lambda: state['mono'], wall=lambda: state['wall'])
        calls = 0
        def delayed():
            nonlocal calls
            calls += 1
            if calls == 3: state['mono'] = 11
            clock.check()
        with tempfile.TemporaryDirectory() as folder:
            p = Path(folder) / 'input'; p.write_bytes(b'x' * (2 * 1024**2))
            with continuation.verification(delayed, deadline=10):
                with self.assertRaises(RuntimeError): continuation.sha(p)
        self.assertEqual(calls, 3)

    def test_failed_git_launch_cleans_partial_birth_before_returning_error(self):
        kernel = self.kernel; kernel.verify_support = lambda: None; records = []
        def launch(*args, **kwargs):
            kernel.add(100, kernel.parent); kernel.add(200, 100)
            raise OSError('failed after birth')
        with patch.object(continuation, 'LinuxProcesses', return_value=kernel), \
             patch.object(continuation, 'enable_subreaper'), \
             patch.object(continuation.time, 'monotonic', side_effect=kernel.now), \
             patch.object(continuation.subprocess, 'Popen', side_effect=launch):
            with continuation.verification(lambda: None, records, deadline=10):
                with self.assertRaises(OSError): continuation.git('/fake', 'status')
        self.assertTrue(records[0]['cleanup']['complete'])
        self.assertEqual(set(kernel.tasks), {77}); json.dumps(records)

    def test_cli_defers_all_continuation_verification_until_owned_controller(self):
        with tempfile.TemporaryDirectory() as folder:
            owner = Path(folder) / 'owner'; invoked = []
            class OwnedEntry:
                def __init__(self, *args, **kwargs):
                    self.utc = kwargs['utc_cutoff']
                    self.admit = kwargs['admit']
                def run(self, argv):
                    invoked.append(argv)
                    self_test.assertEqual(self.utc, UTC_CUTOFF)
                    self_test.assertIn('--matched-rebuild', argv)
                    return {'status': 'HOLD'}
            self_test = self
            args = ['supervise.py','--execute','--owner-output',str(owner),
                    '--continuation','/not-read-in-parent','--continuation-sha256','0'*64,
                    '--matched-rebuild','--','--output',str(Path(folder)/'output')]
            with patch.object(supervise.sys, 'argv', args), \
                 patch.object(supervise, 'LinuxProcesses', return_value=self.kernel), \
                 patch.object(supervise, 'Supervisor', OwnedEntry), \
                 patch.object(continuation, 'load', side_effect=AssertionError('Verification outside owned root')), \
                 patch.object(supervise.signal, 'signal', return_value=signal.SIG_DFL), \
                 patch.object(supervise.sys, 'stdout', io.StringIO()):
                self.assertEqual(supervise.main(), 2)
            self.assertEqual(len(invoked), 1)


class ToolchainTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(); self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name); self.boot = self.root / 'boot'; self.native = self.root / 'native'
        for root, names in [(self.boot, ['bin/java','bin/javac','lib/modules','release']),
                            (self.native, ['bin/gcc-16','bin/g++-16','libexec/cc1','libexec/cc1plus','bin/mold'])]:
            for name in names:
                p = root / name; p.parent.mkdir(parents=True, exist_ok=True)
                p.write_bytes((b'\x7fELF' if root == self.native else b'') + b'original')
        self.captured = toolchain_inputs.capture(self.boot, [self.native], lambda: None)

    def test_prospective_full_boot_and_compiler_hashes_serialize(self):
        toolchain_inputs.verify(self.captured, lambda: None)
        self.assertIn('lib/modules', self.captured['boot_catalog']['entries'])
        self.assertTrue(toolchain_inputs.covers(self.captured, self.native / 'bin/gcc-16'))
        self.assertEqual(json.loads(json.dumps(self.captured)), self.captured)

    def test_same_size_boot_modules_change_fails_matched_identity(self):
        (self.boot / 'lib/modules').write_text('modified')
        with self.assertRaises(RuntimeError): toolchain_inputs.verify(self.captured, lambda: None)

    def test_same_version_path_native_compiler_change_fails_matched_identity(self):
        (self.native / 'libexec/cc1plus').write_text('modified')
        with self.assertRaises(RuntimeError): toolchain_inputs.verify(self.captured, lambda: None)

    def test_wrappers_alone_are_not_native_compiler_provenance(self):
        wrappers = self.root / 'wrappers'; wrappers.mkdir(); (wrappers / 'gcc').write_text('wrapper')
        with self.assertRaises(RuntimeError): toolchain_inputs.capture(self.boot, [wrappers], lambda: None)


if __name__ == '__main__': unittest.main()
