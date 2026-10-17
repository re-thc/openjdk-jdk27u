#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

"""Deterministic offline cleanup fixtures; never launch a campaign or touch /proc.

Run: python3 -B test/micro/org/openjdk/bench/java/text/DateFormatSymbolsQualificationSupervisorTest.py
"""

import importlib.util
import pathlib
import unittest
from unittest import mock

SPEC = importlib.util.spec_from_file_location("dfs_supervisor",
    pathlib.Path(__file__).with_name("DateFormatSymbolsQualificationSupervisor.py"))
SUPERVISOR = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(SUPERVISOR)
PROCESS_TABLE = SUPERVISOR.process_table
OWNER = 100
CHILD = 200
START = 12345


def row(parent, start=START, state="S"):
    return dict(ppid=parent, start=start, rss=4096, state=state)


class CleanupFixtures(unittest.TestCase):
    def setUp(self):
        for target in ("process_table", "subprocess.Popen", "os.pidfd_open",
                       "signal.pidfd_send_signal", "os.waitpid"):
            # The module is deliberately not installed as a normal import.
            parts = target.split(".")
            owner = SUPERVISOR
            for part in parts[:-1]:
                owner = getattr(owner, part)
            patcher = mock.patch.object(owner, parts[-1],
                side_effect=AssertionError("Offline fixture attempted live observation/action"))
            patcher.start()
            self.addCleanup(patcher.stop)
        patcher = mock.patch.object(SUPERVISOR.os, "getpid", return_value=OWNER)
        patcher.start()
        self.addCleanup(patcher.stop)

    def snapshot(self, children, remembered=None, exists=False):
        table = {OWNER: row(1, start=1000, state="R"), **children}
        evidence = {}
        with mock.patch.object(SUPERVISOR, "process_table", return_value=table), \
             mock.patch.object(SUPERVISOR.pathlib.Path, "stat",
                 side_effect=None if exists else FileNotFoundError()):
            owned, live, zombies = SUPERVISOR.cleanup_snapshot(
                {} if remembered is None else remembered, evidence)
        return owned, live, zombies, evidence

    def test_live_owned_child_blocks_cleanup(self):
        _, live, zombies, evidence = self.snapshot({CHILD: row(OWNER)})
        self.assertEqual(set(live), {CHILD})
        self.assertEqual(zombies, {})
        self.assertEqual(evidence, {})

    def test_zombie_is_terminated_and_retains_identity_evidence(self):
        _, live, zombies, evidence = self.snapshot({CHILD: row(OWNER, state="Z")})
        self.assertEqual(live, {})
        self.assertEqual(set(zombies), {CHILD})
        self.assertEqual(evidence, {f"{CHILD}/{START}": dict(pid=CHILD, **row(OWNER, state="Z"))})

    def test_residual_owned_zombie_under_another_parent_is_not_live(self):
        _, live, zombies, _ = self.snapshot({CHILD: row(999, state="Z")}, {CHILD: START})
        self.assertEqual(live, {})
        self.assertEqual(set(zombies), {CHILD})

    def test_live_survivor_is_not_hidden_by_a_zombie(self):
        _, live, zombies, _ = self.snapshot({CHILD: row(OWNER, state="Z"), 201: row(OWNER)})
        self.assertEqual(set(live), {201})
        self.assertEqual(set(zombies), {CHILD})

    def test_disappeared_owned_process_is_not_a_survivor(self):
        _, live, zombies, _ = self.snapshot({}, {CHILD: START})
        self.assertEqual((live, zombies), ({}, {}))

    def test_terminated_zombie_still_gets_a_reaping_attempt(self):
        remembered = {CHILD: START}
        _, live, zombies, _ = self.snapshot({CHILD: row(OWNER, state="Z")}, remembered)
        reaped = []
        with mock.patch.object(SUPERVISOR.os, "waitpid", side_effect=[(CHILD, 0), (0, 0)]) as wait:
            self.assertFalse(SUPERVISOR.reap_owned_children(None, remembered, reaped))
        self.assertEqual((live, set(zombies)), ({}, {CHILD}))
        self.assertEqual(reaped, [dict(pid=CHILD, start=START, status=0)])
        self.assertEqual(wait.call_count, 2)

    def test_reaping_unknown_identity_is_reported_as_uncertain(self):
        reaped = []
        with mock.patch.object(SUPERVISOR.os, "waitpid", side_effect=[(CHILD, 0), (0, 0)]):
            self.assertTrue(SUPERVISOR.reap_owned_children(None, {}, reaped))
        self.assertEqual(reaped, [dict(pid=CHILD, start=None, status=0)])

    def test_running_popen_child_is_not_reaped_by_the_general_reaper(self):
        child = mock.Mock(returncode=None)
        with mock.patch.object(SUPERVISOR.os, "waitpid") as wait:
            self.assertFalse(SUPERVISOR.reap_owned_children(child, {}, []))
        child.poll.assert_called_once_with()
        wait.assert_not_called()

    def test_reused_pid_cannot_be_certified_as_a_terminated_owned_zombie(self):
        for parent in (OWNER, 999):
            with self.subTest(parent=parent), self.assertRaisesRegex(RuntimeError, "PID was reused"):
                self.snapshot({CHILD: row(parent, start=START + 1, state="Z")}, {CHILD: START})

    def test_missing_but_still_existing_identity_is_uncertain(self):
        with self.assertRaisesRegex(RuntimeError, "Cannot account"):
            self.snapshot({}, {CHILD: START}, exists=True)

    def test_unknown_state_is_not_treated_as_terminated(self):
        for state in ("?", "", None):
            with self.subTest(state=state), self.assertRaisesRegex(RuntimeError, "Unknown owned process state"):
                self.snapshot({CHILD: row(OWNER, state=state)})

    def test_other_dead_transition_stays_conservatively_live(self):
        _, live, zombies, _ = self.snapshot({CHILD: row(OWNER, state="X")})
        self.assertEqual(set(live), {CHILD})
        self.assertEqual(zombies, {})

    def test_missing_owner_cannot_certify_cleanup(self):
        with mock.patch.object(SUPERVISOR, "process_table", return_value={}), \
             self.assertRaisesRegex(RuntimeError, "Cannot account"):
            SUPERVISOR.cleanup_snapshot({}, {})

    def test_observer_error_cannot_be_an_empty_successful_snapshot(self):
        with mock.patch.object(SUPERVISOR, "process_table", side_effect=OSError("fixture observer failed")), \
             self.assertRaisesRegex(OSError, "fixture observer failed"):
            SUPERVISOR.cleanup_snapshot({}, {})

    def test_identity_existence_observer_error_propagates(self):
        with mock.patch.object(SUPERVISOR, "process_table", return_value={OWNER: row(1)}), \
             mock.patch.object(SUPERVISOR.pathlib.Path, "stat", side_effect=PermissionError("fixture denied")), \
             self.assertRaises(PermissionError):
            SUPERVISOR.cleanup_snapshot({CHILD: START}, {})

    def test_unreadable_proc_entry_cannot_be_assumed_unrelated(self):
        entry = mock.MagicMock()
        entry.name = str(CHILD)
        (entry / "stat").read_text.side_effect = PermissionError("fixture denied")
        with mock.patch.object(SUPERVISOR.pathlib.Path, "iterdir", return_value=[entry]), \
             self.assertRaisesRegex(RuntimeError, "Cannot observe process ownership"):
            PROCESS_TABLE()

    def test_signal_does_not_target_a_reused_identity(self):
        fields = ["S", "1"] + ["0"] * 17 + [str(START + 1), "0", "0"]
        with mock.patch.object(SUPERVISOR.os, "pidfd_open", return_value=55), \
             mock.patch.object(SUPERVISOR.pathlib.Path, "read_text", return_value="200 (fixture) " + " ".join(fields)), \
             mock.patch.object(SUPERVISOR.os, "close") as close, \
             mock.patch.object(SUPERVISOR.signal, "pidfd_send_signal") as send, \
             self.assertRaisesRegex(RuntimeError, "PID identity changed"):
            SUPERVISOR.signal_identity(CHILD, START, SUPERVISOR.signal.SIGKILL)
        send.assert_not_called()
        close.assert_called_once_with(55)


if __name__ == "__main__":
    unittest.main()
