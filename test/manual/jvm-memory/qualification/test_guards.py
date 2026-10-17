# Copyright (c) 2026, Harry Chan. SPDX-License-Identifier: GPL-2.0-only
"""Offline regressions: fake child/clock/signals, no compiler/JVM/process launch."""
import io
from pathlib import Path
import signal
import tempfile
import time
from types import SimpleNamespace
import unittest
from unittest.mock import patch

from cancellation import Cancellation
from process_cleanup import LinuxProcesses
from storage_guard import RESERVE, TIMED_ALLOWANCE, StorageError, StorageGuard
import run as controller


class StorageTests(unittest.TestCase):
    def setUp(self):
        self.now = 0
        self.free = 4 * RESERVE
        self.probes = 0

    def usage(self, path):
        self.probes += 1
        return SimpleNamespace(free=self.free)

    def guard(self, measured=False):
        return StorageGuard(['/output'], measured=measured, usage=self.usage, clock=lambda: self.now)

    def test_all_writer_admission(self):
        self.free = RESERVE
        with self.assertRaises(StorageError):
            self.guard().admit()

    def test_active_build_jtreg_reserve_and_poll_bound(self):
        g = self.guard(); g.admit()
        self.free = RESERVE - 1
        for instant in [.1, .5, .999]:
            self.now = instant; g.poll()
        self.assertEqual(self.probes, 1)
        self.now = 1
        with self.assertRaises(StorageError):
            g.poll()

    def test_timed_admission_includes_bounded_writes(self):
        self.free = RESERVE + TIMED_ALLOWANCE
        with self.assertRaises(StorageError):
            self.guard(True).admit()

    def test_no_storage_probes_in_timed_interval(self):
        g = self.guard(True); g.admit()
        for instant in [1, 2, 60]:
            self.now = instant; g.poll()
        self.assertEqual(self.probes, 1)
        self.free -= 1024
        receipt = g.finish()
        self.assertEqual(self.probes, 2)
        self.assertEqual(receipt['active_storage_polls'], 0)

    def test_post_exit_reserve_and_allowance_rejections(self):
        g = self.guard(True); g.admit()
        self.free -= TIMED_ALLOWANCE + 1
        with self.assertRaises(StorageError):
            g.finish()
        self.free = RESERVE - 1
        with self.assertRaises(StorageError):
            g.finish()


class Stream(io.BytesIO):
    def fileno(self):
        return 99


class FakeProcess:
    def __init__(self, running=False):
        self.pid = 123
        self.stdin = Stream()
        self.stdout = Stream()
        self.running = running

    def poll(self):
        return None if self.running else 0

    def wait(self, timeout):
        if self.running:
            raise AssertionError('A closed stdout must not bypass the guard via blocking wait')
        return 0


class EmptySelector:
    def register(self, *args):
        pass

    def get_map(self):
        return {}  # Child deliberately closes stdout while still running.

    def close(self):
        pass


class ControllerTests(unittest.TestCase):
    def exercise(self, label, when=None, disk_failure=False, exit_tail=False, build_stage=False):
        with tempfile.TemporaryDirectory() as folder:
            campaign = object.__new__(controller.Campaign)
            campaign.out = Path(folder)
            campaign.cancel = Cancellation()
            campaign.backend = object()
            campaign.number = 0
            campaign.records = []
            campaign.stage = 'offline-mock'
            campaign.deadline = campaign.stage_end = campaign.invocation_end = time.monotonic() + 120
            campaign.env = {}
            proc = FakeProcess(running=disk_failure)
            closed = []

            class Guard:
                def __init__(self, *args, **kwargs):
                    pass
                def admit(self):
                    pass
                def poll(self):
                    if disk_failure:
                        raise StorageError('mock low disk')
                def finish(self):
                    return {'policy': 'mock'}

            class Scope:
                def __init__(self, *args, **kwargs):
                    pass
                def close(self, child, deadline):
                    closed.append(child)
                    if when == 'cleanup':
                        campaign.cancel.request(signal.SIGHUP)
                        campaign.cancel.request(signal.SIGTERM)  # No interrupted cleanup.
                    proc.running = False
                    return {'complete': True, 'seen_pids': [123], 'remaining': [],
                            'live_descendants_after_launcher_exit': [], 'errors': []}
                def drain(self, child, deadline, check):
                    return {'complete': False, 'errors': ['persistent mock child'],
                            'commands': [{'pid': 456, 'command': ['fake-server']}],
                            'remaining': [{'pid': 456, 'state': 'S'}]}

            def launch(*args, **kwargs):
                if exit_tail:
                    def finish_with_tail(timeout):
                        # Each stream is below 48 MiB; only the final sum is over.
                        stdout=next(campaign.out.glob('*.stdout'))
                        with stdout.open('r+b') as stream:
                            stream.truncate(24*1024**2)
                        kwargs['stderr'].truncate(24*1024**2+1)
                        kwargs['stderr'].flush()
                        return 0
                    proc.wait=finish_with_tail
                if when == 'launch':
                    campaign.cancel.request(signal.SIGTERM)
                return proc

            with patch.object(controller, 'require_no_children'), \
                 patch.object(controller, 'StorageGuard', Guard), \
                 patch.object(controller, 'ChildScope', Scope), \
                 patch.object(controller.selectors, 'DefaultSelector', EmptySelector), \
                 patch.object(controller.subprocess, 'Popen', side_effect=launch), \
                 patch.object(controller.os, 'set_blocking'):
                with self.assertRaises(RuntimeError):
                    campaign.run(label, ['never-executed'], workload=False, build_stage=build_stage)
            self.assertEqual(closed, [proc])
            self.assertTrue(campaign.records[-1]['cleanup']['complete'])
            self.assertIsNotNone(campaign.records[-1]['error'])
            return campaign.records[-1]

    def test_build_and_jtreg_low_disk_after_closed_stdout(self):
        for label in ['build-C-release', 'jtreg-C-0']:
            row = self.exercise(label, disk_failure=True)
            self.assertIn('mock low disk', row['error'])

    def test_signal_during_launch_reaches_owned_cleanup(self):
        row = self.exercise('launch', when='launch')
        self.assertEqual(row['cancellation_signal'], signal.SIGTERM)

    def test_repeated_signals_during_cleanup_do_not_interrupt(self):
        row = self.exercise('cleanup', when='cleanup')
        self.assertEqual(row['cancellation_signal'], signal.SIGHUP)

    def test_exit_tail_combined_output_cannot_pass(self):
        row=self.exercise('exit-tail',exit_tail=True)
        self.assertIn('Final combined invocation output cap',row['error'])
        self.assertEqual(row['combined_output_bytes'],48*1024**2+1)

    def test_persistent_build_drain_stays_failed_after_complete_cleanup(self):
        row = self.exercise('build-C-release', build_stage=True)
        self.assertFalse(row['build_drain']['complete'])
        self.assertTrue(row['cleanup']['complete'])
        self.assertIn('persistent mock child', row['error'])
        self.assertEqual(row['build_drain']['commands'][0]['command'], ['fake-server'])

    def test_cancellation_handlers_only_latch_first_request(self):
        latch = Cancellation()
        with patch('cancellation.signal.signal', return_value=signal.SIG_DFL) as install:
            latch.install()
            self.assertEqual(install.call_count, 3)
            latch.request(signal.SIGTERM)
            latch.request(signal.SIGHUP)
            self.assertEqual(latch.signum, signal.SIGTERM)
            latch.restore()
            self.assertEqual(install.call_count, 6)


class PidfdTests(unittest.TestCase):
    def backend(self):
        return LinuxProcesses()

    def test_pidfd_admission_checks_self_without_delivering_a_signal(self):
        backend=self.backend()
        with patch('process_cleanup.os.pidfd_open',return_value=77), \
             patch('process_cleanup.signal.pidfd_send_signal') as send, \
             patch('process_cleanup.os.waitid',side_effect=ChildProcessError), \
             patch('process_cleanup.os.close') as close:
            backend.verify_support()
        send.assert_called_once_with(77,0,None,0)
        close.assert_called_once_with(77)

    def test_unsupported_pidfd_admission_has_no_numeric_fallback(self):
        backend=self.backend()
        with patch('process_cleanup.os.pidfd_open',side_effect=OSError('unsupported')), \
             patch('process_cleanup.signal.pidfd_send_signal') as send, \
             patch('process_cleanup.os.kill') as numeric, \
             patch('process_cleanup.os.killpg') as group:
            with self.assertRaises(OSError):
                backend.verify_support()
        send.assert_not_called();numeric.assert_not_called();group.assert_not_called()

    def test_identity_changes_before_descriptor_validation(self):
        backend=self.backend()
        with patch('process_cleanup.os.pidfd_open',return_value=77), \
             patch.object(backend,'read',return_value={'start':200}), \
             patch('process_cleanup.os.close') as close, \
             patch('process_cleanup.signal.pidfd_send_signal') as send, \
             patch('process_cleanup.os.kill') as numeric, \
             patch('process_cleanup.os.killpg') as group:
            backend.kill(123,100)
        send.assert_not_called();numeric.assert_not_called();group.assert_not_called()
        close.assert_called_once_with(77)

    def test_same_start_tick_unrelated_process_rejected_by_kernel_ownership(self):
        backend=self.backend()
        with patch('process_cleanup.os.pidfd_open',return_value=77), \
             patch.object(backend,'read',return_value={'start':100}), \
             patch('process_cleanup.os.waitid',side_effect=ChildProcessError), \
             patch('process_cleanup.os.close') as close, \
             patch('process_cleanup.signal.pidfd_send_signal') as send:
            backend.kill(123,100)
        send.assert_not_called();close.assert_called_once_with(77)

    def test_reuse_after_validation_signals_only_held_identity(self):
        backend=self.backend()
        numeric_target={'pid': 'original'}
        delivered=[]
        def validate(*args):
            # Numeric PID now names an unrelated task after the ownership check.
            numeric_target['pid']='unrelated'
            return None
        def send(fd,*args):
            self.assertEqual(numeric_target['pid'],'unrelated')
            self.assertEqual(fd,77)  # Descriptor still denotes original task.
            delivered.append('original')
        with patch('process_cleanup.os.pidfd_open',return_value=77), \
             patch.object(backend,'read',return_value={'start':100}), \
             patch('process_cleanup.os.waitid',side_effect=validate), \
             patch('process_cleanup.os.close') as close, \
             patch('process_cleanup.signal.pidfd_send_signal',side_effect=send), \
             patch('process_cleanup.os.kill') as numeric, \
             patch('process_cleanup.os.killpg') as group:
            backend.kill(123,100)
        self.assertEqual(delivered,['original'])
        numeric.assert_not_called();group.assert_not_called();close.assert_called_once_with(77)

    def test_original_exit_does_not_fall_back_to_recycled_pid(self):
        backend=self.backend()
        with patch('process_cleanup.os.pidfd_open',return_value=77), \
             patch.object(backend,'read',return_value={'start':100}), \
             patch('process_cleanup.os.waitid',return_value=None), \
             patch('process_cleanup.os.close') as close, \
             patch('process_cleanup.signal.pidfd_send_signal',side_effect=ProcessLookupError), \
             patch('process_cleanup.os.kill') as numeric, \
             patch('process_cleanup.os.killpg') as group:
            backend.kill(123,100)
        numeric.assert_not_called();group.assert_not_called();close.assert_called_once_with(77)

    def test_reap_uses_the_held_descriptor(self):
        backend=self.backend()
        with patch('process_cleanup.os.pidfd_open',return_value=77), \
             patch.object(backend,'read',return_value={'start':100}), \
             patch('process_cleanup.os.waitid',return_value=None) as wait, \
             patch('process_cleanup.os.close') as close, \
             patch('process_cleanup.os.waitpid') as numeric:
            backend.reap(123,100)
        self.assertEqual(len(wait.call_args_list),2)
        self.assertTrue(all(call.args[0]==controller.os.P_PIDFD and call.args[1]==77
                            for call in wait.call_args_list))
        numeric.assert_not_called();close.assert_called_once_with(77)


if __name__ == '__main__':
    unittest.main()
