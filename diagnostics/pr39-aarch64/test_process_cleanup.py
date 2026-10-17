#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 only, as published by
# the Free Software Foundation. See the LICENSE file for details.

"""Real Python-only subprocess cancellation; no JVM or benchmark is launched."""
import json
import os
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
import time
import unittest
from unittest import mock

import campaign


def running(pid):
    try:
        # An orphan zombie cannot execute; only its adopting parent can reap it.
        return Path(f"/proc/{pid}/stat").read_text().rsplit(")", 1)[1].split()[0] != "Z"
    except FileNotFoundError:
        return False


class CleanupTests(unittest.TestCase):
    def test_wrapper_term_and_int_kill_detached_child_and_grandchild(self):
        child = """
import json, os, signal, subprocess, sys, time
from pathlib import Path
signal.signal(signal.SIGTERM, signal.SIG_IGN)
p = subprocess.Popen([sys.executable, '-c', 'import time; time.sleep(60)'])
Path(sys.argv[1]).write_text(json.dumps([os.getpid(), p.pid]))
time.sleep(60)
"""
        module_dir = str(Path(campaign.__file__).parent)
        wrapper = """
import sys
from pathlib import Path
sys.path.insert(0, sys.argv[1])
import campaign
campaign.CLEANUP_TERM_SECONDS = 0.1
campaign.CLEANUP_KILL_SECONDS = 0.5
campaign.run([sys.executable, '-c', sys.argv[2], sys.argv[3]], Path(sys.argv[4]), 60)
Path(sys.argv[5]).write_text('incorrectly continued')
"""
        for signum in (signal.SIGTERM, signal.SIGINT):
            with self.subTest(signal=signum), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                pidfile = root / "pids.json"
                continued = root / "continued"
                process = subprocess.Popen([sys.executable, "-c", wrapper, module_dir, child,
                                            str(pidfile), str(root / "child.log"), str(continued)],
                                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
                                           start_new_session=True)
                pids = []
                try:
                    end = time.monotonic() + 5
                    while not pidfile.exists() and time.monotonic() < end and process.poll() is None:
                        time.sleep(0.01)
                    self.assertTrue(pidfile.exists(), "owned child did not start")
                    pids = json.loads(pidfile.read_text())
                    os.kill(process.pid, signum)
                    self.assertEqual(process.wait(timeout=3), 128 + signum)
                    end = time.monotonic() + 1
                    while any(running(pid) for pid in pids) and time.monotonic() < end:
                        time.sleep(0.01)
                    self.assertFalse(any(running(pid) for pid in pids), "detached descendants survived")
                    self.assertFalse(continued.exists())
                finally:
                    if process.poll() is None:
                        process.kill()
                        process.wait(timeout=2)
                    if pids:
                        try:
                            os.killpg(pids[0], signal.SIGKILL)
                        except ProcessLookupError:
                            pass

    def test_signal_before_popen_returns_records_and_cleans_the_child(self):
        original_popen = subprocess.Popen
        children = []
        old_handler = signal.getsignal(signal.SIGTERM)
        def spawning(*args, **kwargs):
            child = original_popen(*args, **kwargs)
            children.append(child)
            os.kill(os.getpid(), signal.SIGTERM)
            return child
        with tempfile.TemporaryDirectory() as directory, \
             mock.patch("campaign.subprocess.Popen", side_effect=spawning), \
             mock.patch("campaign.CLEANUP_TERM_SECONDS", 0.1), \
             mock.patch("campaign.CLEANUP_KILL_SECONDS", 0.5):
            with self.assertRaises(campaign.CommandSignal):
                campaign.run([sys.executable, "-c", "import time; time.sleep(60)"],
                             Path(directory) / "spawn.log", 10)
        self.assertEqual(len(children), 1)
        self.assertIsNotNone(children[0].poll())
        self.assertEqual(signal.getsignal(signal.SIGTERM), old_handler)

    def test_timeout_is_bounded_and_zero_budget_does_not_spawn(self):
        with tempfile.TemporaryDirectory() as directory, \
             mock.patch("campaign.CLEANUP_TERM_SECONDS", 0.1), \
             mock.patch("campaign.CLEANUP_KILL_SECONDS", 0.5):
            start = time.monotonic()
            with self.assertRaises(subprocess.TimeoutExpired):
                campaign.run([sys.executable, "-c", "import signal,time; signal.signal(signal.SIGTERM,signal.SIG_IGN); time.sleep(60)"],
                             Path(directory) / "timeout.log", 0.1)
            self.assertLess(time.monotonic() - start, 2)
            with mock.patch("campaign.subprocess.Popen") as spawn, self.assertRaises(TimeoutError):
                campaign.run(["unused"], Path(directory) / "zero.log", 0)
            spawn.assert_not_called()

    def test_cancellation_during_admission_does_not_spawn(self):
        with tempfile.TemporaryDirectory() as directory, mock.patch("campaign.subprocess.Popen") as spawn:
            def cancel():
                os.kill(os.getpid(), signal.SIGTERM)
            with self.assertRaises(campaign.CommandSignal):
                campaign.run(["unused"], Path(directory) / "cancel.log", 10, disk_guard=cancel)
            spawn.assert_not_called()

    def test_stage_cancellation_cannot_leave_a_pass_receipt(self):
        original_save = campaign.save
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "correctness-pass.json"
            def interrupted_save(target, value):
                original_save(target, value)
                os.kill(os.getpid(), signal.SIGTERM)
            with campaign.cancellation_signals(), mock.patch("campaign.save", side_effect=interrupted_save):
                with self.assertRaises(campaign.CommandSignal):
                    campaign.Deadline(10, "fixture").publish(path, {"status": "pass"})
            self.assertFalse(path.exists())
            self.assertFalse(path.with_name(path.name + ".pending").exists())


if __name__ == "__main__":
    unittest.main()
