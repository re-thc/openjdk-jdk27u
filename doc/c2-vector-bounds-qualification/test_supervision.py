"""Bounded Python-only process/deadline tests; never invokes Java or a build."""
import ctypes
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import threading
import time
import unittest
from unittest.mock import patch

from campaign import campaign, wait_for_gate
from deadline import Budget, TOTAL_SECONDS, CLEANUP_RESERVE_SECONDS
from process_control import Cancelled, proc_identity, run, signal_owned_group

HERE = Path(__file__).resolve().parent
LIBC = ctypes.CDLL(None, use_errno=True)


def wait_until(predicate, seconds=2):
    end = time.monotonic() + seconds
    while not predicate():
        if time.monotonic() >= end:
            raise AssertionError("bounded process-test wait expired")
        time.sleep(0.01)


class SupervisionTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.previous = ctypes.c_int()
        if LIBC.prctl(37, ctypes.byref(cls.previous), 0, 0, 0) or LIBC.prctl(36, 1, 0, 0, 0):
            raise RuntimeError("Linux subreaper required to reap test descendants")

    @classmethod
    def tearDownClass(cls):
        LIBC.prctl(36, cls.previous.value, 0, 0, 0)

    def fixture(self, root, mode):
        pid_file = root / "descendant.json"
        script = root / "leader.py"
        descendant = ("import os,signal,time,json,pathlib;signal.signal(signal.SIGTERM,signal.SIG_IGN);"
                      f"pathlib.Path({str(pid_file)!r}).write_text(json.dumps(dict(pid=os.getpid(),leader=os.getppid(),group=os.getpgrp())));"
                      "time.sleep(30)")
        script.write_text("import os,signal,subprocess,sys,time,pathlib\n"
                          "assert signal.getsignal(signal.SIGTERM) == signal.SIG_DFL\n"
                          f"subprocess.Popen([sys.executable,'-c',{descendant!r}])\n"
                          f"while not pathlib.Path({str(pid_file)!r}).is_file():time.sleep(.01)\n"
                          + ({"zero": "sys.exit(0)\n", "nonzero": "sys.exit(7)\n",
                              "sleep": "time.sleep(30)\n", "anchor-death": "os.kill(os.getppid(),signal.SIGKILL);time.sleep(30)\n"}[mode]))
        return [sys.executable, str(script)], pid_file

    def reap_fixture(self, file):
        if not file.exists():
            return
        identities = json.loads(file.read_text())
        for key in ("pid", "leader", "group"):
            pid = identities[key]
            try:
                wait_until(lambda: proc_identity(pid) is None or proc_identity(pid)["state"] == "Z")
            finally:
                # These are known descendant PIDs still reserved as our children.
                # Never signal by a stale PID after an attempted reap.
                try:
                    identity = proc_identity(pid)
                    if identity is not None and identity["parent"] == os.getpid() and identity["state"] != "Z":
                        os.kill(pid, signal.SIGKILL)
                    os.waitpid(pid, os.WNOHANG)
                except ChildProcessError:
                    pass

    def test_cleanup_after_zero_nonzero_timeout_and_anchor_death(self):
        for mode in ("zero", "nonzero", "sleep", "anchor-death"):
            with self.subTest(mode=mode), tempfile.TemporaryDirectory(prefix="c2-process-test-") as directory:
                root = Path(directory)
                command, file = self.fixture(root, mode)
                began = time.monotonic()
                try:
                    if mode == "zero":
                        result = run(command, root / "run.log", 3)
                        self.assertGreater(result["cleanup"]["term_resistant_descendants"], 0)
                    else:
                        with self.assertRaises((RuntimeError, subprocess.TimeoutExpired)):
                            run(command, root / "run.log", 0.5 if mode == "sleep" else 3)
                    self.assertTrue(json.loads((root / "run.log.process.json").read_text())["cleanup"]["anchor_reaped"])
                finally:
                    self.reap_fixture(file)
                self.assertLess(time.monotonic() - began, 5)

    def test_sigint_sigterm_and_sighup_cancellation(self):
        for sig in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP):
            with self.subTest(signal=sig), tempfile.TemporaryDirectory(prefix="c2-cancel-test-") as directory:
                root = Path(directory)
                command, file = self.fixture(root, "sleep")

                def cancel():
                    wait_until(file.exists)
                    os.kill(os.getpid(), sig)

                thread = threading.Thread(target=cancel)
                thread.start()
                try:
                    with self.assertRaises(Cancelled):
                        run(command, root / "run.log", 4)
                finally:
                    thread.join(timeout=2)
                    self.reap_fixture(file)

    def test_missing_executable_and_reused_identity_refused(self):
        with tempfile.TemporaryDirectory(prefix="c2-exec-test-") as directory:
            with self.assertRaises(RuntimeError):
                run([str(Path(directory) / "missing-command")], Path(directory) / "run.log", 2)
        with patch("process_control.proc_identity", return_value={"start_ticks": 2, "group": 123, "session": 123}), \
                patch("process_control.os.killpg") as send:
            with self.assertRaisesRegex(RuntimeError, "possibly reused"):
                signal_owned_group(123, 1, signal.SIGKILL)
            send.assert_not_called()

    def test_parent_death_lifeline_cleans_group(self):
        with tempfile.TemporaryDirectory(prefix="c2-parent-death-") as directory:
            root = Path(directory)
            command, file = self.fixture(root, "sleep")
            code = (f"import sys,pathlib;sys.path.insert(0,{str(HERE)!r});from process_control import run;"
                    f"run({command!r},pathlib.Path({str(root / 'run.log')!r}),20)")
            parent = subprocess.Popen([sys.executable, "-c", code])
            try:
                wait_until(file.exists)
                parent.kill()
                parent.wait(timeout=1)
                self.reap_fixture(file)
            finally:
                if parent.poll() is None:
                    parent.kill()
                    parent.wait(timeout=1)

    def test_term_is_unblocked_and_delivered_before_kill(self):
        with tempfile.TemporaryDirectory(prefix="c2-term-mask-") as directory:
            root = Path(directory)
            marker = root / "term-received"
            code = ("import signal,time,pathlib,sys;"
                    f"signal.signal(signal.SIGTERM,lambda s,f:(pathlib.Path({str(marker)!r}).write_text('term'),sys.exit(0)));"
                    "time.sleep(30)")
            with self.assertRaises(subprocess.TimeoutExpired):
                run([sys.executable, "-c", code], root / "run.log", 0.4)
            self.assertTrue(marker.is_file(), "workload inherited blocked TERM instead of receiving it")

    def test_whole_campaign_alarm_is_deferred_until_final_reap(self):
        import process_control
        original = process_control.cleanup_anchor
        with tempfile.TemporaryDirectory(prefix="c2-cleanup-alarm-") as directory:
            root = Path(directory)
            command, file = self.fixture(root, "zero")

            def alarm(sig, frame):
                raise TimeoutError("campaign alarm during cleanup")

            def cleanup(anchor, ticks):
                signal.setitimer(signal.ITIMER_REAL, 0.02)
                return original(anchor, ticks)

            before = signal.signal(signal.SIGALRM, alarm)
            try:
                with patch("process_control.cleanup_anchor", side_effect=cleanup), self.assertRaises(TimeoutError):
                    run(command, root / "run.log", 3)
                self.assertTrue(json.loads((root / "run.log.process.json").read_text())["cleanup"]["anchor_reaped"])
            finally:
                signal.setitimer(signal.ITIMER_REAL, 0)
                signal.signal(signal.SIGALRM, before)
                self.reap_fixture(file)

    def test_incomplete_verification_still_kills_and_stops(self):
        with tempfile.TemporaryDirectory(prefix="c2-incomplete-cleanup-") as directory:
            root = Path(directory)
            command, file = self.fixture(root, "zero")
            try:
                with patch("process_control.live_group_members", return_value=([], False)):
                    with self.assertRaisesRegex(RuntimeError, "verification incomplete"):
                        run(command, root / "run.log", 3)
                self.assertIn("cleanup_error", json.loads((root / "run.log.process.json").read_text()))
            finally:
                self.reap_fixture(file)


class DeadlineTest(unittest.TestCase):
    def test_one_clock_includes_checkout_build_review_summary_and_reserve(self):
        now = [100.0]
        budget = Budget.start(clock=lambda: now[0])
        with tempfile.TemporaryDirectory(prefix="c2-deadline-") as directory:
            state = Path(directory) / "deadline.json"
            budget.save(state)
            for elapsed in (120, 600, 300, 1200, 1500, 180):
                now[0] += elapsed
                loaded = Budget.load(state, clock=lambda: now[0])
                self.assertEqual(loaded.state, budget.state)
                self.assertAlmostEqual(loaded.remaining(), TOTAL_SECONDS - CLEANUP_RESERVE_SECONDS - (now[0] - 100))
            now[0] = 100 + TOTAL_SECONDS - CLEANUP_RESERVE_SECONDS
            with self.assertRaises(TimeoutError):
                Budget.load(state, clock=lambda: now[0]).remaining()

    def test_graph_review_cannot_wait_past_shared_deadline(self):
        class Expiring:
            def remaining(self):
                raise TimeoutError("global deadline")
        with self.assertRaisesRegex(TimeoutError, "global deadline"):
            wait_for_gate(Path("/no/such/gate"), Expiring())

    def test_campaign_dry_run_does_not_create_a_new_run(self):
        from types import SimpleNamespace
        with tempfile.TemporaryDirectory(prefix="c2-campaign-dry-") as directory:
            root = Path(directory)
            args = SimpleNamespace(out=root / "absent-run", receipts=root / "receipts", deps=root / "deps",
                                   audit=root / "audit.json", repo=root / "repo", cpus="0,1", execute=False)
            plan = campaign(args, Budget.start())
            self.assertFalse(args.out.exists())
            self.assertEqual(plan["total_seconds"], 5700)
            self.assertEqual(plan["cleanup_inside_total_seconds"], 5)
            self.assertFalse(plan["review_clock_pauses"])
            for step in plan["steps"]:
                self.assertIn("--campaign", step["argv"])

    def test_review_time_expires_before_timing_without_starting_more_work(self):
        from types import SimpleNamespace
        now = [100.0]
        budget = Budget.start(clock=lambda: now[0])
        calls = []
        with tempfile.TemporaryDirectory(prefix="c2-shared-clock-") as directory:
            root = Path(directory)
            args = SimpleNamespace(out=root / "run", receipts=root / "receipts", deps=root / "deps",
                                   audit=root / "audit.json", repo=root / "repo", cpus="0,1", execute=True)

            def fake_run(argv, log, timeout, env):
                self.assertLessEqual(timeout, budget.remaining())
                calls.append(str(log))
                now[0] += 1

            def review(path, inherited):
                self.assertIs(inherited, budget)
                now[0] += 5700
                inherited.remaining()

            with patch("campaign.run", side_effect=fake_run), patch("campaign.wait_for_gate", side_effect=review), \
                    patch("campaign.time.monotonic", side_effect=lambda: now[0]):
                with self.assertRaises(TimeoutError):
                    campaign(args, budget)
            self.assertFalse(any("stage-timing" in x or "stage-summary" in x for x in calls))
            self.assertEqual(json.loads((args.out / "outcome.json").read_text())["status"], "incomplete")


if __name__ == "__main__":
    unittest.main()
