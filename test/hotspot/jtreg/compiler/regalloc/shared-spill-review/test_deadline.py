# Copyright (c) 2026, Harry Chan. All rights reserved.
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

"""Offline checks. All process creation, signaling, threads and exits are mocked."""
import hashlib
import io
import json
from pathlib import Path
import signal
import subprocess
import tempfile
import unittest
from unittest import mock

import deadline
from deadline import DeadlineExpired, HardDeadline
from deadline_io import DeadlineIO


class Clock:
    def __init__(self):
        self.now = 0.0

    def __call__(self):
        return self.now


class DeadlineChecks(unittest.TestCase):
    def setUp(self):
        self.clock = Clock()
        self.budget = HardDeadline(3600, clock=self.clock)
        self.artifacts = DeadlineIO(self.budget)

    def process(self, *, live=False):
        process = mock.Mock(pid=123456, returncode=0)
        process.poll.return_value = None if live else 0
        process.communicate.return_value = (' metadata\n', '')
        return process

    def test_one_absolute_start_end(self):
        self.clock.now = 1200
        self.assertEqual(self.budget.start, 0)
        self.assertEqual(self.budget.end, 3600)
        self.assertEqual(self.budget.remaining(), 2400)
        self.clock.now = 3599.9
        self.assertAlmostEqual(self.budget.remaining(), .1)

    def test_exact_boundary_and_expired_latch(self):
        self.clock.now = 3600
        with self.assertRaises(DeadlineExpired):
            self.budget.check()
        self.clock.now = 1
        with self.assertRaises(DeadlineExpired):
            self.budget.remaining()
        self.assertFalse(issubclass(DeadlineExpired, OSError))

    def test_no_watchdog_or_process_on_import_or_construction(self):
        with mock.patch.object(deadline.threading, 'Thread') as thread:
            budget = HardDeadline(60, clock=self.clock)
        thread.assert_not_called()
        self.assertIsNone(budget.process)
        self.assertIsNone(budget.thread)

    def test_watchdog_is_explicit_daemon_and_starts_once(self):
        with mock.patch.object(deadline.threading, 'Thread') as thread:
            self.budget.start_watchdog()
            self.assertTrue(thread.call_args.kwargs['daemon'])
            thread.return_value.start.assert_called_once()
            with self.assertRaises(RuntimeError):
                self.budget.start_watchdog()

    def test_kill_only_current_tracked_live_group(self):
        first = self.process(live=True)
        second = self.process(live=True)
        second.pid = 234567
        with mock.patch.object(deadline.os, 'killpg') as kill:
            self.budget.track(first)
            self.budget.track(second)
            self.budget.untrack(first)
            self.budget.kill_owned()
            kill.assert_called_once_with(second.pid, signal.SIGKILL)
            self.budget.untrack(second)
            self.budget.kill_owned()
            self.assertEqual(kill.call_count, 1)

    def test_completed_process_is_not_signaled(self):
        with mock.patch.object(deadline.os, 'killpg') as kill:
            self.budget.track(self.process())
            self.budget.kill_owned()
        kill.assert_not_called()

    def test_expire_kills_then_immediately_exits_124(self):
        events = []
        def exit_mock(code):
            events.append(('exit', code))
            raise SystemExit(code)
        with mock.patch.object(self.budget, 'kill_owned',
                               side_effect=lambda: events.append('kill')), \
             mock.patch.object(deadline.os, '_exit', side_effect=exit_mock):
            with self.assertRaises(SystemExit) as result:
                self.budget.expire()
        self.assertEqual(result.exception.code, 124)
        self.assertEqual(events, ['kill', ('exit', 124)])
        self.assertTrue(self.budget.expired)

    def test_watchdog_waits_only_until_absolute_end(self):
        self.clock.now = 3599.9
        def wait(seconds):
            self.assertAlmostEqual(seconds, .1)
            self.clock.now = 3600
        with mock.patch.object(deadline.threading, 'Event') as event, \
             mock.patch.object(self.budget, 'expire') as expire:
            event.return_value.wait.side_effect = wait
            self.budget._watch()
        expire.assert_called_once()

    def test_metadata_uses_remaining_time_and_own_session(self):
        self.clock.now = 3590
        process = self.process()
        with mock.patch('deadline_io.subprocess.Popen', return_value=process) as spawn:
            self.assertEqual(self.artifacts.metadata(['git', 'rev-parse', 'HEAD']),
                             'metadata')
        self.assertTrue(spawn.call_args.kwargs['start_new_session'])
        process.communicate.assert_called_once_with(timeout=10)
        self.assertIsNone(self.budget.process)

    def test_expired_metadata_never_launches(self):
        self.clock.now = 3600
        with mock.patch('deadline_io.subprocess.Popen') as spawn:
            with self.assertRaises(DeadlineExpired):
                self.artifacts.metadata(['mock'])
        spawn.assert_not_called()

    def test_metadata_timeout_has_no_next_launch(self):
        process = self.process(live=True)
        process.communicate.side_effect = subprocess.TimeoutExpired(['mock'], 1)
        with mock.patch('deadline_io.subprocess.Popen', return_value=process) as spawn, \
             mock.patch.object(deadline.os, 'killpg') as kill:
            with self.assertRaises(DeadlineExpired):
                self.artifacts.metadata(['mock'])
            with self.assertRaises(DeadlineExpired):
                self.artifacts.metadata(['never-start'])
        self.assertEqual(spawn.call_count, 1)
        kill.assert_called_once_with(process.pid, signal.SIGKILL)
        self.assertIsNone(self.budget.process)

    def test_metadata_late_exit_zero_is_failure(self):
        process = self.process()
        def communicate(**kwargs):
            self.clock.now = 3601
            return ('late success', '')
        process.communicate.side_effect = communicate
        with mock.patch('deadline_io.subprocess.Popen', return_value=process):
            with self.assertRaises(DeadlineExpired):
                self.artifacts.metadata(['mock'])
        self.assertTrue(self.budget.expired)

    def test_metadata_nonzero_is_failure(self):
        process = self.process()
        process.returncode = 7
        with mock.patch('deadline_io.subprocess.Popen', return_value=process):
            with self.assertRaises(subprocess.CalledProcessError) as result:
                self.artifacts.metadata(['mock'])
        self.assertEqual(result.exception.returncode, 7)
        self.assertIsNone(self.budget.process)

    def test_hash_checks_between_chunks(self):
        stream = io.BytesIO(b'x' * 2097152)
        reads = 0
        original = stream.read
        def read(size):
            nonlocal reads
            reads += 1
            if reads == 2:
                self.clock.now = 3600
            return original(size)
        with mock.patch.object(Path, 'open', return_value=stream), \
             mock.patch.object(stream, 'read', side_effect=read):
            with self.assertRaises(DeadlineExpired):
                self.artifacts.sha256('mock.bin')
        self.assertEqual(reads, 2)

    def test_late_read_is_failure(self):
        def read(path):
            self.clock.now = 3600
            return 'late'
        with mock.patch.object(Path, 'read_text', autospec=True, side_effect=read):
            with self.assertRaises(DeadlineExpired):
                self.artifacts.read_text('mock')

    def test_late_write_is_failure(self):
        def write(path, value):
            self.clock.now = 3600
        with mock.patch.object(Path, 'write_text', autospec=True, side_effect=write):
            with self.assertRaises(DeadlineExpired):
                self.artifacts.write_text('mock', 'value')

    def test_final_receipt_samples_after_last_write(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            artifact = root / 'log.txt'
            artifact.write_text('synthetic')
            self.clock.now = 3599.5
            original = self.artifacts.write_text
            writes = []
            def write(path, value):
                original(path, value)
                writes.append(path)
                self.clock.now += .05
            with mock.patch.object(self.artifacts, 'write_text', side_effect=write):
                receipt = self.artifacts.finalize([artifact], root/'state.json',
                                                  root/'manifest.json', preserved=True)
            self.assertEqual(len(writes), 3)
            self.assertEqual(receipt['elapsed'], self.clock.now)
            self.assertTrue(receipt['elapsed_sampled_after_all_artifact_writes'])
            self.assertTrue(receipt['finalization_complete'])
            state = json.loads((root/'state.json').read_text())
            self.assertFalse(state['finalization_complete'])
            self.assertIsNone(state['within_total_deadline'])
            manifest = json.loads((root/'manifest.json').read_text())
            self.assertEqual(manifest['files'][str(artifact)],
                             hashlib.sha256(b'synthetic').hexdigest())

    def cross_during_finalization(self, operation):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            artifact = root/'log.txt'
            artifact.write_text('synthetic')
            self.clock.now = 3599.9
            if operation == 'hash':
                original = self.artifacts.sha256
                def hashing(path):
                    result = original(path)
                    self.clock.now = 3600
                    return result
                patch = mock.patch.object(self.artifacts, 'sha256', side_effect=hashing)
            else:
                original = self.artifacts.write_text
                count = 0
                def write(path, value):
                    nonlocal count
                    count += 1
                    original(path, value)
                    if count == (2 if operation == 'manifest' else 3):
                        self.clock.now = 3600
                patch = mock.patch.object(self.artifacts, 'write_text', side_effect=write)
            with patch, self.assertRaises(DeadlineExpired):
                self.artifacts.finalize([artifact], root/'state.json',
                                        root/'manifest.json', preserved=True)
            self.assertFalse(json.loads((root/'state.json').read_text())['finalization_complete'])

    def test_finalization_crossing_during_hash(self):
        self.cross_during_finalization('hash')

    def test_finalization_crossing_during_manifest_write(self):
        self.cross_during_finalization('manifest')

    def test_finalization_crossing_during_final_state_write(self):
        self.cross_during_finalization('state')

    def test_failed_preservation_never_reports_preserved(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            receipt = self.artifacts.finalize([], root/'state.json',
                                              root/'manifest.json', preserved=False)
            self.assertFalse(receipt['all_preserved'])

    def test_finalization_records_cannot_hash_themselves(self):
        with self.assertRaises(ValueError):
            self.artifacts.finalize([], 'same', 'same', preserved=True)
        with self.assertRaises(ValueError):
            self.artifacts.finalize(['state'], 'state', 'manifest', preserved=True)


if __name__ == '__main__':
    unittest.main()
