#!/usr/bin/env python3
"""Offline process mechanics tests: every process/OS operation is mocked.

No JVM, native workload, subprocess or fork is executed by these tests.
"""
from datetime import datetime, timedelta, timezone
import json
from pathlib import Path
import signal
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import mechanism_process as subject


APPROVAL = dict(started_utc="2026-11-01T00:00:00+00:00", deadline_utc="2026-11-01T02:00:00+00:00")


class Time:
    def __init__(self, minute=10):
        self.utc = datetime(2026, 11, 1, 0, minute, tzinfo=timezone.utc)
        self.mono = 1000.0

    def advance(self, seconds):
        self.mono += seconds
        self.utc += timedelta(seconds=seconds)

    def clock(self):
        return subject.Clock(APPROVAL, lambda: self.utc, lambda: self.mono)


class Model:
    def __init__(self, exited=True, stubborn=False):
        self.process = SimpleNamespace(pid=42001, returncode=None)
        self.exited = exited
        self.code = 0
        self.stubborn = stubborn
        self.descendants = stubborn
        self.reaped = False
        self.signals = []
        self.events = []
        self.ticks = 123456

    def identity(self, pid):
        return (pid, pid, pid, self.ticks)

    def waitid(self, kind, pid, flags):
        if self.reaped:
            raise ChildProcessError("already reaped")
        if not flags & subject.os.WNOWAIT:
            raise AssertionError("Observation must preserve leader identity")
        return (SimpleNamespace(si_pid=pid, si_code=subject.os.CLD_EXITED, si_status=self.code)
                if self.exited else None)

    def members(self, pid):
        live = ([] if self.exited else [pid]) + ([pid + 1] if self.descendants else [])
        return dict(live=live, zombies=[pid] if self.exited else [])

    def killpg(self, pid, sig):
        if self.reaped:
            raise AssertionError("Signalled a released group identity")
        self.signals.append(sig)
        self.events.append("signal:" + str(sig))
        if sig == signal.SIGKILL or not self.stubborn:
            was_exited = self.exited
            self.exited = True
            self.descendants = False
            if self.code == 0 and not was_exited:
                self.code = 128 + sig

    def waitpid(self, pid, flags):
        if not self.exited or self.descendants or self.reaped:
            raise AssertionError("Premature or duplicate reap")
        if flags != subject.os.WNOHANG:
            raise AssertionError("Reap may not block")
        self.reaped = True
        self.events.append("reap")
        return (pid, self.code << 8)


class ClockTests(unittest.TestCase):
    def test_exact_interval_and_aware_utc(self):
        for update in (dict(deadline_utc="2026-11-01T02:00:01Z"),
                       dict(deadline_utc="2026-11-01T01:59:59Z"),
                       dict(started_utc="2026-11-01T00:00:00"),
                       dict(started_utc="2026-11-01T00:00:00+01:00")):
            with self.subTest(update=update), self.assertRaises(subject.Failure):
                subject.Clock(dict(APPROVAL, **update), lambda: Time().utc, lambda: 1000.0)

    def test_future_start_and_past_deadline_rejected(self):
        for value in (datetime(2026, 10, 31, tzinfo=timezone.utc),
                      datetime(2026, 11, 1, 2, tzinfo=timezone.utc)):
            with self.subTest(value=value), self.assertRaises(subject.Failure):
                subject.Clock(APPROVAL, lambda: value, lambda: 1000.0)

    def test_utc_rollback_does_not_extend_monotonic_budget(self):
        timer = Time()
        clock = timer.clock()
        before = clock.remaining()
        timer.mono += 100
        timer.utc -= timedelta(seconds=100)
        self.assertEqual(clock.remaining(), before - 100)

    def test_utc_forward_step_shortens_budget(self):
        timer = Time()
        clock = timer.clock()
        before = clock.remaining()
        timer.utc += timedelta(seconds=100)
        self.assertEqual(clock.remaining(), before - 100)

    def test_fresh_host_keeps_absolute_deadline(self):
        timer = Time()
        before = timer.clock().remaining()
        timer.utc += timedelta(seconds=600)
        timer.mono = 0
        restarted = timer.clock()
        self.assertEqual(restarted.remaining(), before - 600)
        self.assertEqual(restarted.record()["deadline_utc"], APPROVAL["deadline_utc"])

    def test_cleanup_reserve_stops_work_early(self):
        timer = Time()
        timer.utc = datetime(2026, 11, 1, 1, 58, 59, tzinfo=timezone.utc)
        clock = timer.clock()
        timer.advance(1)
        with self.assertRaises(subject.Failure):
            clock.require_open()
        self.assertEqual(clock.remaining(0), 60)


class ExecutorTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.output = Path(self.directory.name)
        self.timer = Time()
        self.model = Model()
        self.snapshots = []
        self.host_values = [dict(pid1_zombies=0, available_process_slots=8192)]
        self.patches = [
            patch.object(subject.subprocess, "Popen", side_effect=self.launch),
            patch.object(subject, "_identity", side_effect=lambda pid: self.model.identity(pid)),
            patch.object(subject, "_group_members", side_effect=lambda pid: self.model.members(pid)),
            patch.object(subject.os, "waitid", side_effect=lambda *args: self.model.waitid(*args)),
            patch.object(subject.os, "waitpid", side_effect=lambda *args: self.model.waitpid(*args)),
            patch.object(subject.os, "killpg", side_effect=lambda *args: self.model.killpg(*args)),
            patch.object(subject.signal, "pthread_sigmask", return_value=set()),
            patch.object(subject.time, "sleep", side_effect=self.timer.advance),
        ]
        self.mocks = [patcher.start() for patcher in self.patches]
        for patcher in self.patches:
            self.addCleanup(patcher.stop)
        self.executor = None
        self.on_launch = None

    def host(self):
        self.snapshots.append(self.timer.mono)
        return self.host_values.pop(0) if len(self.host_values) > 1 else self.host_values[0]

    def create(self):
        self.executor = subject.Executor(self.output, self.timer.clock(), {"PATH": "/installed/bin"}, self.host)
        self.executor.start_phase("preflight", 900)
        return self.executor

    def launch(self, argv, **kwargs):
        receipt = json.loads((self.output / "process-receipt.json").read_text())
        row = receipt["records"][-1]
        self.assertEqual(row["status"], "registered")
        self.assertTrue(Path(row["stdout_path"]).is_file())
        self.assertTrue(Path(row["stderr_path"]).is_file())
        self.assertIs(kwargs["shell"], False)
        self.assertIs(kwargs["start_new_session"], True)
        self.assertEqual(kwargs["stdin"], subject.subprocess.DEVNULL)
        if self.on_launch:
            self.on_launch()
        return self.model.process

    def test_intermediate_cleanup_requires_idle_and_every_owned_leader_reaped(self):
        executor = self.create()
        executor.assert_idle()
        def during_launch():
            with self.assertRaisesRegex(subject.Failure, "every owned command"):
                executor.assert_idle()
        self.on_launch = during_launch
        self.run_command()
        executor.assert_idle()
        executor._owned[0].ownership_lost = True
        with self.assertRaisesRegex(subject.Failure, "every owned command"):
            executor.assert_idle()

    def test_live_storage_failure_terminates_owned_group_and_forbids_more_work(self):
        executor = self.create()
        self.model.exited = False
        def fail():
            raise subject.Failure("storage safety reserve reached")
        self.on_launch = lambda: setattr(executor, "host_probe", fail)
        with self.assertRaisesRegex(subject.Failure, "storage safety reserve"):
            self.run_command()
        self.assertEqual(self.model.signals, [signal.SIGTERM, signal.SIGKILL])
        self.assertTrue(self.model.reaped)
        self.assertEqual(executor.close()["active_groups"], [])
        with self.assertRaises(subject.Failure):
            self.run_command("forbidden-retry")

    def test_storage_cleanup_constraint_also_bounds_normal_log_hashing_and_receipts(self):
        executor = self.create()
        path = self.output / "log"
        path.write_bytes(b"retained log")
        executor.constrain_cleanup_deadline(self.timer.mono + 1)
        self.timer.advance(1)
        self.assertGreater(executor.clock.remaining(), 100)
        with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
            executor._hash_file(path, self.timer.mono + 100)
        with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
            executor._write_json(self.output / "new-receipt.json", {}, self.timer.mono + 100)
        self.assertFalse((self.output / "new-receipt.json").exists())

    def run_command(self, name="check", cap=30, role_remaining=None, role_deadline=None):
        return self.executor.run(name, ["/installed/bin/tool", "literal;$()"], self.output,
                                 cap, role_remaining=role_remaining, role_deadline=role_deadline)

    def test_success_registers_logs_and_reaps_after_group_cleanup(self):
        self.create()
        record = self.run_command()
        self.assertEqual(record["exit_code"], 0)
        self.assertEqual(len(record["stdout_sha256"]), 64)
        self.assertEqual(len(record["stderr_sha256"]), 64)
        self.assertEqual(self.model.events[-1], "reap")
        cleanup = self.executor.close()
        self.assertTrue(cleanup["direct_children_reaped"])
        self.assertEqual(cleanup["active_groups"], [])
        self.assertFalse(cleanup["failed"])
        self.assertIs(self.executor.close(), cleanup)
        self.assertEqual(self.mocks[0].call_count, 1)

    def test_successful_leader_with_stubborn_descendants_killed_before_reap(self):
        self.model = Model(exited=True, stubborn=True)
        self.create()
        self.run_command()
        self.assertEqual(self.model.signals, [signal.SIGTERM, signal.SIGKILL])
        self.assertEqual(self.model.events[-1], "reap")
        self.assertLessEqual(self.timer.mono - 1000, 60)

    def test_cancellation_during_popen_handoff_still_cleans_owned_child(self):
        self.model = Model(exited=False)
        self.create()
        self.on_launch = lambda: self.executor.cancel_signal(signal.SIGTERM)
        with self.assertRaisesRegex(subject.Failure, "cancellation"):
            self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertTrue(self.executor.close()["direct_children_reaped"])
        self.assertEqual(self.mocks[0].call_count, 1)

    def test_signal_before_launch_cannot_launch(self):
        self.create()
        with self.assertRaises(subject.Failure):
            self.executor.cancel_signal(signal.SIGINT)
        with self.assertRaises(subject.Failure):
            self.run_command()
        self.mocks[0].assert_not_called()

    def test_pid_reuse_never_signals_unrelated_identity(self):
        self.create()
        identities = 0
        def changed(pid):
            nonlocal identities
            identities += 1
            return (pid, pid, pid, 1 if identities == 1 else 2)
        self.mocks[1].side_effect = changed
        with self.assertRaisesRegex(subject.Failure, "cleanup"):
            self.run_command()
        self.assertEqual(self.model.signals, [])
        cleanup = self.executor.close()
        self.assertTrue(cleanup["failed"])
        self.assertFalse(cleanup["direct_children_reaped"])
        self.assertTrue(cleanup["active_groups"][0]["ownership_lost"])

    def test_external_reap_never_signals_reused_group(self):
        self.create()
        self.mocks[3].side_effect = ChildProcessError("external waiter")
        with self.assertRaisesRegex(subject.Failure, "cleanup"):
            self.run_command()
        self.assertEqual(self.model.signals, [])
        self.assertTrue(self.executor.close()["failed"])

    def test_command_and_role_caps_stop_without_retry(self):
        self.model = Model(exited=False)
        self.create()
        with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
            self.run_command(cap=1)
        self.assertTrue(self.model.reaped)
        with self.assertRaises(subject.Failure):
            self.run_command("second")

    def test_role_remaining_shortens_command_cap(self):
        self.model = Model(exited=False)
        self.create()
        with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
            self.run_command(cap=30, role_remaining=1)
        self.assertTrue(self.model.reaped)
        self.assertLess(self.timer.mono - 1000, 2)

    def test_cancellation_during_cleanup_is_deferred_but_not_reported_success(self):
        self.create()
        original = self.model.killpg
        def cancel_in_cleanup(pid, sig):
            self.executor.cancel_signal(signal.SIGINT)
            original(pid, sig)
        self.mocks[5].side_effect = cancel_in_cleanup
        with self.assertRaisesRegex(subject.Failure, "cancellation"):
            self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertTrue(self.executor.close()["direct_children_reaped"])

    def test_late_launch_exhaustion_keeps_child_registered_for_cleanup(self):
        self.model = Model(exited=False)
        self.create()
        self.on_launch = lambda: self.timer.advance(self.executor.clock.remaining())
        with self.assertRaisesRegex(subject.Failure, "cleanup reserve"):
            self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertGreaterEqual(self.executor.clock.remaining(0), 59)

    def test_failed_cleanup_cannot_renew_its_sixty_second_allowance(self):
        self.model = Model(exited=False, stubborn=True)
        self.create()
        def unkillable(pid, sig):
            self.model.signals.append(sig)
        self.mocks[5].side_effect = unkillable
        with self.assertRaisesRegex(subject.Failure, "cleanup incomplete"):
            self.run_command(cap=1)
        after_run = self.timer.mono
        receipt = self.executor.close()
        self.assertLessEqual(self.timer.mono - after_run, 0.001)
        self.assertTrue(receipt["failed"])
        self.assertFalse(receipt["direct_children_reaped"])

    def test_phase_cap_is_not_reset_by_next_command(self):
        self.create()
        self.executor._phase_deadline = self.timer.mono + 1
        self.timer.advance(1)
        with self.assertRaisesRegex(subject.Failure, "budget exhausted"):
            self.run_command()
        self.mocks[0].assert_not_called()
        with self.assertRaises(subject.Failure):
            self.executor.start_phase("preflight", 900)

    def test_duplicate_names_rejected(self):
        self.create()
        self.run_command()
        with self.assertRaisesRegex(subject.Failure, "cannot be repeated"):
            self.run_command()
        self.assertEqual(self.mocks[0].call_count, 1)

    def test_deadline_expiry_stops_then_reaps_within_reserved_time(self):
        self.timer.utc = datetime(2026, 11, 1, 1, 58, 59, tzinfo=timezone.utc)
        self.model = Model(exited=False)
        self.create()
        with self.assertRaisesRegex(subject.Failure, "cleanup reserve"):
            self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertGreaterEqual(self.executor.clock.remaining(0), 59)
        self.assertFalse(self.executor.close()["failed"])

    def test_unsafe_initial_host_never_launches(self):
        for value in (dict(pid1_zombies=33, available_process_slots=8192),
                      dict(pid1_zombies=0, available_process_slots=4095)):
            self.host_values = [value]
            with self.subTest(value=value), self.assertRaises(subject.Failure):
                self.create()
        self.mocks[0].assert_not_called()

    def test_dynamic_zombie_growth_stops_and_cleans(self):
        self.model = Model(exited=False)
        self.host_values = [dict(pid1_zombies=0, available_process_slots=8192)] * 3 + [
            dict(pid1_zombies=65, available_process_slots=8192)]
        self.create()
        with self.assertRaisesRegex(subject.Failure, "growth exceeds"):
            self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertTrue(any(t >= 1005 for t in self.snapshots))
        self.assertLessEqual(max(b - a for a, b in zip(self.snapshots, self.snapshots[1:])), 5.001)

    def test_dynamic_headroom_loss_stops_and_cleans(self):
        self.model = Model(exited=False)
        self.host_values = [dict(pid1_zombies=0, available_process_slots=8192)] * 3 + [
            dict(pid1_zombies=0, available_process_slots=4095)]
        self.create()
        with self.assertRaisesRegex(subject.Failure, "headroom"):
            self.run_command()
        self.assertTrue(self.model.reaped)

    def test_fork_failure_stops_without_retry_or_group_signal(self):
        self.create()
        self.mocks[0].side_effect = BlockingIOError(11, "fork unavailable")
        with self.assertRaisesRegex(subject.Failure, "fork unavailable"):
            self.run_command()
        self.assertEqual(self.model.signals, [])
        with self.assertRaises(subject.Failure):
            self.run_command("another")
        self.assertEqual(self.mocks[0].call_count, 1)
        self.assertTrue(self.executor.close()["direct_children_reaped"])

    def test_host_probe_exception_prevents_launch(self):
        self.create()
        self.executor.host_probe = lambda: (_ for _ in ()).throw(OSError("unreadable host counters"))
        with self.assertRaisesRegex(subject.Failure, "Host readiness probe failed"):
            self.run_command()
        self.mocks[0].assert_not_called()
        self.executor.host_probe = self.host
        with self.assertRaises(subject.Failure):
            self.run_command("after-repaired-probe")
        self.mocks[0].assert_not_called()

    def test_first_prelaunch_unsafe_host_permanently_fails_executor(self):
        self.create()
        self.host_values = [dict(pid1_zombies=0, available_process_slots=4095)]
        with self.assertRaisesRegex(subject.Failure, "headroom"):
            self.run_command()
        self.host_values = [dict(pid1_zombies=0, available_process_slots=8192)]
        with self.assertRaises(subject.Failure):
            self.run_command("after-host-recovery")
        self.mocks[0].assert_not_called()

    def test_host_probe_time_cannot_extend_role_cap(self):
        self.create()
        original = self.executor.host_probe
        def slow_probe():
            self.timer.advance(2)
            return original()
        self.executor.host_probe = slow_probe
        with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
            self.run_command(cap=30, role_remaining=1)
        self.mocks[0].assert_not_called()
        self.assertEqual(self.executor.records[-1]["deadline_monotonic"], 1001)
        with self.assertRaises(subject.Failure):
            self.run_command("after-slow-probe")
        self.mocks[0].assert_not_called()

    def test_host_probe_time_cannot_extend_phase_cap(self):
        self.create()
        self.executor._phase_deadline = self.timer.mono + 1
        original = self.executor.host_probe
        def slow_probe():
            self.timer.advance(2)
            return original()
        self.executor.host_probe = slow_probe
        with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
            self.run_command(cap=30)
        self.mocks[0].assert_not_called()
        self.assertEqual(self.executor.records[-1]["deadline_monotonic"], 1001)
        with self.assertRaises(subject.Failure):
            self.run_command("after-phase-expiry")
        self.mocks[0].assert_not_called()

    def test_receipt_write_time_cannot_extend_command_cap(self):
        self.create()
        original = self.executor._save
        def slow_save():
            self.timer.advance(2)
            original()
        with patch.object(self.executor, "_save", side_effect=slow_save):
            with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
                self.run_command(cap=1)
        self.mocks[0].assert_not_called()

    def test_absolute_role_deadline_covers_controller_handoff_time(self):
        self.create()
        controller_deadline = self.timer.mono + 1
        stale_remaining = 1
        self.timer.advance(2)
        with self.assertRaisesRegex(subject.Failure, "budget exhausted before launch"):
            self.run_command(role_remaining=stale_remaining, role_deadline=controller_deadline)
        self.mocks[0].assert_not_called()
        with self.assertRaises(subject.Failure):
            self.run_command("after-expired-handoff")

    def test_absolute_role_deadline_limits_active_command(self):
        self.model = Model(exited=False)
        self.create()
        with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
            self.run_command(role_remaining=30, role_deadline=self.timer.mono + 1)
        self.assertTrue(self.model.reaped)
        self.assertLess(self.timer.mono - 1000, 2)

    def test_absolute_phase_deadline_covers_phase_handoff_time(self):
        self.create()
        controller_deadline = self.timer.mono + 1
        self.executor.start_phase("build", 900, absolute_deadline=controller_deadline)
        self.assertEqual(self.executor._phase_deadline, controller_deadline)
        self.timer.advance(2)
        with self.assertRaisesRegex(subject.Failure, "budget exhausted before launch"):
            self.run_command()
        self.mocks[0].assert_not_called()

    def test_absolute_phase_deadline_cannot_enlarge_local_cap(self):
        self.create()
        self.executor.start_phase("build", 1, absolute_deadline=self.timer.mono + 900)
        self.assertEqual(self.executor._phase_deadline, self.timer.mono + 1)

    def test_absolute_deadlines_reject_nonfinite_and_boolean_values(self):
        self.create()
        for value in (float("inf"), float("nan"), True):
            with self.subTest(value=value), self.assertRaises(subject.Failure):
                self.executor.start_phase("bad", 900, absolute_deadline=value)
        self.mocks[0].assert_not_called()

    def test_exact_five_second_watch_during_long_command(self):
        self.model = Model(exited=False)
        self.create()
        original = self.model.waitid
        def eventually_exits(*args):
            if self.timer.mono >= 1016:
                self.model.exited = True
            return original(*args)
        self.mocks[3].side_effect = eventually_exits
        self.run_command(cap=30)
        observed = sorted(set(self.snapshots))
        self.assertEqual(observed, [1000.0, 1005.0, 1010.0, 1015.0])
        self.assertTrue(self.model.reaped)

    def test_keyboard_interrupt_during_execution_still_cleans_and_fails_closed(self):
        self.model = Model(exited=False)
        self.create()
        original = self.model.waitid
        calls = 0
        def interrupted_once(*args):
            nonlocal calls
            calls += 1
            if calls == 2:
                raise KeyboardInterrupt("offline injected interruption")
            return original(*args)
        self.mocks[3].side_effect = interrupted_once
        with self.assertRaisesRegex(subject.Failure, "KeyboardInterrupt"):
            self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertEqual(self.model.signals, [signal.SIGTERM, signal.SIGKILL])
        self.assertEqual(self.executor.records[0]["status"], "failed")
        with self.assertRaises(subject.Failure):
            self.run_command("after-interrupt")

    def test_system_exit_during_execution_is_a_terminal_failure(self):
        self.model = Model(exited=False)
        self.create()
        original = self.model.waitid
        calls = 0
        def exits_once(*args):
            nonlocal calls
            calls += 1
            if calls == 2:
                raise SystemExit("offline injected exit")
            return original(*args)
        self.mocks[3].side_effect = exits_once
        with self.assertRaisesRegex(subject.Failure, "SystemExit"):
            self.run_command()
        self.assertTrue(self.model.reaped)

    def test_cleanup_scan_exception_still_sends_final_kill_before_later_reap(self):
        self.create()
        original = self.model.members
        calls = 0
        def interrupted_scan(pid):
            nonlocal calls
            calls += 1
            if calls == 1:
                raise KeyboardInterrupt("offline scan interruption")
            return original(pid)
        self.mocks[2].side_effect = interrupted_scan
        with self.assertRaisesRegex(subject.Failure, "cleanup incomplete"):
            self.run_command()
        self.assertEqual(self.model.signals, [signal.SIGTERM, signal.SIGKILL])
        self.assertFalse(self.model.reaped)
        cleanup = self.executor.close()
        self.assertFalse(cleanup["failed"])
        self.assertTrue(self.model.reaped)
        self.assertEqual(self.model.events[-1], "reap")

    def test_success_always_sends_final_kill_before_reaping_anchor(self):
        self.create()
        self.run_command()
        self.assertEqual(self.model.signals, [signal.SIGTERM, signal.SIGKILL])
        self.assertEqual(self.model.events[-1], "reap")
        self.assertIn(signal.SIGALRM, self.mocks[6].call_args_list[0].args[1])

    def test_slow_log_hash_expires_absolute_role_cap_after_owned_cleanup(self):
        self.create()
        self.on_launch = lambda: Path(self.executor.records[-1]["stdout_path"]).write_text("offline log fixture")
        original = subject.hashlib.sha256
        updates = []
        class SlowDigest:
            def __init__(inner):
                inner.digest = original()
            def update(inner, chunk):
                updates.append(len(chunk))
                self.timer.advance(1)
                inner.digest.update(chunk)
            def hexdigest(inner):
                return inner.digest.hexdigest()
        with patch.object(subject.hashlib, "sha256", side_effect=SlowDigest):
            with self.assertRaisesRegex(subject.Failure, "Log evidence incomplete.*cap exhausted"):
                self.run_command(cap=30, role_deadline=self.timer.mono + 1)
        self.assertEqual(len(updates), 1)
        self.assertTrue(self.model.reaped)
        self.assertEqual(self.model.signals, [signal.SIGTERM, signal.SIGKILL])
        self.assertNotIn("stdout_sha256", self.executor.records[-1])
        self.assertEqual(self.executor.records[-1]["status"], "failed")
        self.assertTrue(self.executor.close()["direct_children_reaped"])
        with self.assertRaises(subject.Failure):
            self.run_command("after-hash-expiry")
        self.assertEqual(self.mocks[0].call_count, 1)

    def test_hash_processing_preserves_outer_cleanup_reserve(self):
        self.timer.utc = datetime(2026, 11, 1, 1, 58, 59, tzinfo=timezone.utc)
        self.create()
        self.on_launch = lambda: Path(self.executor.records[-1]["stdout_path"]).write_text("offline log fixture")
        original = subject.hashlib.sha256
        class SlowDigest:
            def __init__(inner):
                inner.digest = original()
            def update(inner, chunk):
                self.timer.advance(1)
                inner.digest.update(chunk)
            def hexdigest(inner):
                return inner.digest.hexdigest()
        with patch.object(subject.hashlib, "sha256", side_effect=SlowDigest):
            with self.assertRaisesRegex(subject.Failure, "cleanup reserve"):
                self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertEqual(self.executor.clock.remaining(0), 60)
        self.assertFalse(self.executor.close()["failed"])

    def test_slow_json_encoding_after_launch_expires_cap_but_still_reaps(self):
        self.create()
        original = subject.json.JSONEncoder.iterencode
        advanced = []
        def slow_encoding(encoder, data, *args, **kwargs):
            for chunk in original(encoder, data, *args, **kwargs):
                if self.executor._owned and not advanced:
                    advanced.append(True)
                    self.timer.advance(1)
                yield chunk
        with patch.object(subject.json.JSONEncoder, "iterencode", new=slow_encoding):
            with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
                self.run_command(cap=1)
        self.assertTrue(self.model.reaped)
        self.assertEqual(self.model.signals, [signal.SIGTERM, signal.SIGKILL])
        self.assertEqual(self.executor.records[-1]["status"], "failed")
        # The partial running receipt did not replace the registered receipt.
        previous = json.loads((self.output / "process-receipt.json").read_text())
        self.assertEqual(previous["records"][-1]["status"], "registered")
        self.assertTrue(self.executor.close()["direct_children_reaped"])

    def test_slow_json_writer_expires_phase_cap_but_still_reaps(self):
        self.create()
        self.executor._phase_deadline = self.timer.mono + 1
        original = Path.open
        advanced = []
        class SlowWriter:
            def __init__(inner, handle):
                inner.handle = handle
            def __enter__(inner):
                inner.handle.__enter__()
                return inner
            def __exit__(inner, *args):
                return inner.handle.__exit__(*args)
            def write(inner, chunk):
                result = inner.handle.write(chunk)
                if self.executor._owned and not advanced:
                    advanced.append(True)
                    self.timer.advance(1)
                return result
        def opening(path, mode="r", *args, **kwargs):
            handle = original(path, mode, *args, **kwargs)
            return SlowWriter(handle) if mode == "w" and path.name.endswith(".json.tmp") else handle
        with patch.object(Path, "open", new=opening):
            with self.assertRaisesRegex(subject.Failure, "cap exhausted"):
                self.run_command()
        self.assertTrue(self.model.reaped)
        self.assertEqual(self.executor.records[-1]["status"], "failed")
        self.assertEqual(len(advanced), 1)
        self.assertTrue(self.executor.close()["direct_children_reaped"])

    def test_cleanup_json_uses_one_shared_deadline_without_renewal(self):
        self.create()
        self.run_command()
        self.executor._close_deadline = self.timer.mono + 1
        original = subject.json.JSONEncoder.iterencode
        encodings = []
        def slow_encoding(encoder, data, *args, **kwargs):
            encodings.append(True)
            self.timer.advance(1)
            yield from original(encoder, data, *args, **kwargs)
        with patch.object(subject.json.JSONEncoder, "iterencode", new=slow_encoding):
            receipt = self.executor.close()
            ended = self.timer.mono
            self.assertIs(self.executor.close(), receipt)
        self.assertEqual(self.timer.mono, ended)
        self.assertEqual(len(encodings), 1)
        self.assertTrue(receipt["failed"])
        self.assertTrue(receipt["direct_children_reaped"])
        self.assertEqual(receipt["elapsed_seconds"], 1)
        self.assertFalse((self.output / "cleanup-receipt.json").exists())
        self.assertIn("Shared cleanup deadline", receipt["errors"][-1])

    def test_first_expiry_constrains_cleanup_before_delayed_launch_handoff(self):
        self.model = Model(exited=False, stubborn=True)
        self.create()
        first_expiry = self.timer.mono
        def delayed_handoff():
            self.executor.constrain_cleanup_deadline(first_expiry + 60)
            self.executor.cancel_signal(signal.SIGALRM)  # Deferred in Popen handoff.
            self.timer.advance(10)
            self.assertEqual(self.executor._cleanup_deadline() - self.timer.mono, 50)
        self.on_launch = delayed_handoff
        def unkillable(pid, sig):
            self.model.signals.append(sig)
        self.mocks[5].side_effect = unkillable
        with self.assertRaisesRegex(subject.Failure, "cleanup incomplete"):
            self.run_command(cap=120)
        self.assertAlmostEqual(self.timer.mono, first_expiry + 60)
        self.assertEqual(self.executor._owned[0].cleanup_deadline, first_expiry + 60)
        self.executor.constrain_cleanup_deadline(first_expiry + 600)
        self.assertEqual(self.executor._cleanup_deadline(), first_expiry + 60)
        ended = self.timer.mono
        cleanup = self.executor.close()
        self.assertEqual(self.timer.mono, ended)
        self.assertEqual(cleanup["deadline_monotonic"], first_expiry + 60)
        self.assertTrue(cleanup["failed"])
        with self.assertRaises(subject.Failure):
            self.run_command("after-expiry")
        self.assertEqual(self.mocks[0].call_count, 1)

    def test_constraint_can_tighten_already_running_owned_cleanup(self):
        self.model = Model(exited=False, stubborn=True)
        self.create()
        tightened = []
        def unkillable(pid, sig):
            self.model.signals.append(sig)
            if not tightened:
                tightened.append(True)
                self.executor.constrain_cleanup_deadline(self.timer.mono + 1)
        self.mocks[5].side_effect = unkillable
        with self.assertRaisesRegex(subject.Failure, "cleanup incomplete"):
            self.run_command(cap=2)
        self.assertAlmostEqual(self.timer.mono, 1003)
        self.assertEqual(self.executor._owned[0].cleanup_deadline, 1003)
        self.assertTrue(self.executor.close()["failed"])


if __name__ == "__main__":
    unittest.main()
