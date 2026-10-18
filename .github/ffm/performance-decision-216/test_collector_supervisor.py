"""Scripted ownership/clock tests. No processes, prctl, signals or host probes run."""

import signal
import unittest
from unittest.mock import Mock, patch

import collector_supervisor as s


class ScriptedOwner:
    def __init__(self, exit_at=None, kill_exits=True, descendant=False, stuck_child=False):
        self.now = 1
        self.pid = 41
        self.exit_at = exit_at
        self.kill_exits = kill_exits
        self.descendant = descendant
        self.stuck_child = stuck_child
        self.child_dead = False
        self.cancelled = False
        self.closed = False
        self.leader_reaped = False
        self.child_reaped = False
        self.events = []

    def start(self, command, cwd):
        self.events.append(("launch", self.pid))
        return self.pid

    def children(self):
        owned = set() if self.leader_reaped else {self.pid}
        if self.descendant and self.exited(self.pid) and not self.child_reaped:
            owned.add(42)  # reparented even when it left the collector's group
        return owned

    def exited(self, pid):
        return self.exit_at is not None and self.now >= self.exit_at

    def empty(self):
        return not self.children()

    def signal_group(self, pid, sig):
        assert pid == self.pid and not self.leader_reaped
        self.events.append(("group_signal", pid, sig))
        if sig == signal.SIGKILL and self.kill_exits:
            self.exit_at = self.now

    def signal_child(self, pid, sig):
        assert pid in self.children() and pid == 42
        self.events.append(("child_signal", pid, sig))
        if sig == signal.SIGKILL and not self.stuck_child:
            self.child_dead = True

    def reap(self, pid):
        assert pid in self.children()
        if pid == self.pid and self.exited(pid):
            self.events.append(("reap", pid))
            self.leader_reaped = True
            return 0 if self.exit_at < 8_000_000_000 else -9
        if pid == 42 and self.child_dead:
            self.events.append(("reap", pid))
            self.child_reaped = True
            return -9
        return None

    def pause(self, seconds):
        assert 0 <= seconds <= s.POLL_SECONDS
        self.now += max(1, int(seconds * 1_000_000_000))

    def close(self):
        self.closed = True


class SupervisorTests(unittest.TestCase):
    deadline = 10_000_000_001

    def run_owner(self, owner, launched=None):
        launched = Mock() if launched is None else launched
        result = s.supervise(["synthetic"], "fixture", self.deadline, launched, owner=owner,
                             clock=lambda: owner.now, pause=owner.pause)
        self.assertTrue(owner.closed)
        launched.assert_called_once_with(41)
        return result

    def test_normal_exit_reaped_once_without_intervention(self):
        owner = ScriptedOwner(exit_at=100_000_000)
        result = self.run_owner(owner)
        self.assertFalse(result["supervision_intervened"])
        self.assertTrue(result["supervisor_cleanup_complete"])
        self.assertEqual(result["process_return_code"], 0)
        self.assertEqual(result["signals"], [])
        self.assertEqual(owner.events, [("launch", 41), ("reap", 41)])

    def test_hung_collector_term_then_kill_and_reap_inside_original_deadline(self):
        owner = ScriptedOwner()
        result = self.run_owner(owner)
        self.assertEqual(result["supervision_reason"], "overall_deadline_reserve")
        self.assertTrue(result["supervisor_cleanup_complete"])
        self.assertEqual(result["process_return_code"], -9)
        self.assertEqual([r["signal"] for r in result["signals"]], [signal.SIGTERM, signal.SIGKILL])
        self.assertLessEqual(result["supervisor_cleanup_observed_monotonic_ns"], self.deadline)
        self.assertEqual(result["supervision_deadline_ns"], self.deadline)

    def test_term_ignored_but_natural_late_return_still_records_intervention(self):
        owner = ScriptedOwner(exit_at=8_500_000_000)
        result = self.run_owner(owner)
        self.assertTrue(result["supervision_intervened"])
        self.assertTrue(result["supervisor_cleanup_complete"])
        self.assertEqual([r["signal"] for r in result["signals"]], [signal.SIGTERM])

    def test_unreapable_collector_keeps_unknown_return_and_owned_pid(self):
        owner = ScriptedOwner(kill_exits=False)
        result = self.run_owner(owner)
        self.assertIsNone(result["process_return_code"])
        self.assertIsNone(result["process_return_monotonic_ns"])
        self.assertFalse(result["supervisor_cleanup_complete"])
        self.assertEqual(result["pending_owned_pids"], [41])
        self.assertEqual(owner.now, result["cleanup_deadline_ns"])

    def test_escaped_adopted_descendant_is_killed_and_reaped_before_group_anchor(self):
        owner = ScriptedOwner(exit_at=100_000_000, descendant=True)
        result = self.run_owner(owner)
        self.assertEqual(result["supervision_reason"], "adopted_descendants")
        self.assertTrue(result["supervisor_cleanup_complete"])
        self.assertEqual(result["reaped_adopted_children"], [dict(pid=42, returncode=-9)])
        self.assertLess(owner.events.index(("reap", 42)), owner.events.index(("reap", 41)))
        self.assertFalse(any(e[0].endswith("signal") for e in owner.events[owner.events.index(("reap", 41)) + 1:]))

    def test_stuck_descendant_is_pending_even_after_collector_reap(self):
        owner = ScriptedOwner(exit_at=100_000_000, descendant=True, stuck_child=True)
        result = self.run_owner(owner)
        self.assertFalse(result["supervisor_cleanup_complete"])
        self.assertEqual(result["pending_owned_pids"], [42])
        self.assertEqual(result["process_return_code"], 0)
        self.assertEqual(owner.now, result["cleanup_deadline_ns"])
        self.assertLess(owner.now, self.deadline)

    def test_adoption_between_first_inventory_and_exit_observation_is_not_missed(self):
        owner = ScriptedOwner(exit_at=1, descendant=True)
        children = owner.children
        first = [True]

        def raced_inventory():
            if first[0]:
                first[0] = False
                return {41}
            return children()

        owner.children = raced_inventory
        result = self.run_owner(owner)
        self.assertTrue(result["supervision_intervened"])
        self.assertTrue(owner.child_reaped)

    def test_launch_receipt_failure_stops_and_cleans_owned_collector(self):
        owner = ScriptedOwner()
        result = self.run_owner(owner, Mock(side_effect=OSError("synthetic write failure")))
        self.assertEqual(result["supervision_reason"], "launch_receipt_failure")
        self.assertTrue(result["supervisor_cleanup_complete"])
        self.assertIn("synthetic write failure", result["supervision_errors"][0])

    def test_cancel_request_uses_bounded_cleanup(self):
        owner = ScriptedOwner()
        def launched(pid):
            owner.cancelled = True
        result = self.run_owner(owner, Mock(side_effect=launched))
        self.assertEqual(result["supervision_reason"], "observer_cancelled")
        self.assertTrue(result["supervisor_cleanup_complete"])

    def test_no_launch_when_cleanup_reserve_unavailable(self):
        owner = ScriptedOwner()
        owner.now = self.deadline - s.TERM_RESERVE_NS
        with self.assertRaisesRegex(ValueError, "cleanup reserve"):
            self.run_owner(owner)
        self.assertEqual(owner.events, [])

    def test_delayed_wakeup_never_signals_after_deadline(self):
        owner = ScriptedOwner(kill_exits=False)
        owner.pause = lambda seconds: setattr(owner, "now", self.deadline + 1)
        result = self.run_owner(owner)
        self.assertEqual(result["signals"], [])
        self.assertFalse(result["supervisor_cleanup_complete"])
        self.assertEqual(result["pending_owned_pids"], [41])

    def test_late_natural_exit_cannot_pass_shorter_supervision_window(self):
        owner = ScriptedOwner(exit_at=self.deadline + 1)
        owner.pause = lambda seconds: setattr(owner, "now", self.deadline + 1)
        result = self.run_owner(owner)
        self.assertTrue(result["supervision_intervened"])
        self.assertEqual(result["supervision_reason"], "supervision_deadline_elapsed")
        self.assertEqual(result["signals"], [])
        self.assertTrue(result["supervisor_cleanup_complete"])

    def test_campaign_observation_only_shortens_original_deadline(self):
        owner = ScriptedOwner()
        shortened = 5_000_000_001
        result = s.supervise(["synthetic"], "fixture", self.deadline, Mock(),
                             deadline_update=lambda pid: shortened, owner=owner,
                             clock=lambda: owner.now, pause=owner.pause)
        self.assertEqual(result["supervision_deadline_ns"], shortened)
        self.assertLessEqual(result["supervisor_cleanup_observed_monotonic_ns"], shortened)
        owner = ScriptedOwner()
        result = s.supervise(["synthetic"], "fixture", self.deadline, Mock(),
                             deadline_update=lambda pid: self.deadline + 1, owner=owner,
                             clock=lambda: owner.now, pause=owner.pause)
        self.assertEqual(result["supervision_reason"], "campaign_budget_observation_failure")
        self.assertEqual(result["supervision_deadline_ns"], self.deadline)
        self.assertTrue(result["supervision_intervened"])

    def test_missing_campaign_marker_at_preparation_cutoff_stops_with_bounded_cleanup(self):
        owner = ScriptedOwner()
        preparation_cutoff = 2_000_000_001
        def missing_marker(pid):
            if owner.now >= preparation_cutoff:
                raise ValueError("preparation deadline reached without an actual campaign clock")
            return None
        result = s.supervise(["synthetic"], "fixture", self.deadline, Mock(),
                             deadline_update=missing_marker, owner=owner,
                             clock=lambda: owner.now, pause=owner.pause)
        self.assertEqual(result["supervision_reason"], "campaign_budget_observation_failure")
        self.assertTrue(result["supervisor_cleanup_complete"])
        self.assertTrue(result["supervision_intervened"])
        self.assertLessEqual(result["supervisor_cleanup_observed_monotonic_ns"],
                             preparation_cutoff + s.TERM_RESERVE_NS)

    def test_linux_backend_uses_nonblocking_exact_pid_waits(self):
        owner = s.LinuxOwner.__new__(s.LinuxOwner)
        owner.process = Mock(pid=41)
        owner.leader_reaped = False
        with patch.object(s.os, "waitid", return_value=None) as waitid, \
             patch.object(s.os, "waitpid", return_value=(41, 0)) as waitpid:
            self.assertFalse(owner.exited(41))
            self.assertEqual(owner.reap(41), 0)
        waitid.assert_called_once_with(s.os.P_PID, 41, s.os.WEXITED | s.os.WNOHANG | s.os.WNOWAIT)
        waitpid.assert_called_once_with(41, s.os.WNOHANG)
        self.assertTrue(owner.leader_reaped)

    def test_linux_backend_refuses_group_signal_after_reap_or_unowned_child(self):
        owner = s.LinuxOwner.__new__(s.LinuxOwner)
        owner.process = Mock(pid=41)
        owner.leader_reaped = True
        with patch.object(s.os, "killpg") as group_kill, patch.object(s.os, "kill") as kill, \
             patch.object(s.os, "waitid", side_effect=ChildProcessError):
            with self.assertRaises(ValueError):
                owner.signal_group(41, signal.SIGKILL)
            with self.assertRaises(ChildProcessError):
                owner.signal_child(99, signal.SIGKILL)
        group_kill.assert_not_called()
        kill.assert_not_called()

    def test_linux_backend_requires_echild_to_prove_empty_ownership(self):
        owner = s.LinuxOwner.__new__(s.LinuxOwner)
        with patch.object(s.os, "waitid", side_effect=[None, Mock(si_pid=42), ChildProcessError]) as waitid:
            self.assertFalse(owner.empty())
            self.assertFalse(owner.empty())
            self.assertTrue(owner.empty())
        self.assertEqual(waitid.call_count, 3)
        waitid.assert_called_with(s.os.P_ALL, 0, s.os.WEXITED | s.os.WNOHANG | s.os.WNOWAIT)

    def test_linux_inventory_retains_waitable_child_missing_from_proc(self):
        owner = s.LinuxOwner.__new__(s.LinuxOwner)
        with patch.object(s.Path, "read_text", return_value=""), \
             patch.object(s.os, "waitid", return_value=Mock(si_pid=42)):
            self.assertEqual(owner.children(), {42})

    def test_incomplete_proc_inventory_does_not_prove_cleanup(self):
        owner = ScriptedOwner(exit_at=1, descendant=True, stuck_child=True)
        children = owner.children
        owner.children = lambda: set() if owner.leader_reaped else {41}
        owner.empty = lambda: not children()
        result = self.run_owner(owner)
        self.assertFalse(result["supervisor_cleanup_complete"])
        self.assertFalse(result["owned_children_empty"])
        self.assertTrue(result["supervision_intervened"])
        self.assertEqual(result["signals"], [])  # never signal a released group anchor
        self.assertIsNotNone(result["process_return_code"])

    def test_descendant_found_after_anchor_reap_uses_only_owned_individual_signals(self):
        owner = ScriptedOwner(exit_at=1, descendant=True)
        children = owner.children
        owner.children = lambda: children() if owner.leader_reaped else {41}
        result = self.run_owner(owner)
        self.assertTrue(result["supervisor_cleanup_complete"])
        self.assertTrue(owner.child_reaped)
        self.assertTrue(result["supervision_intervened"])
        self.assertEqual({r["target"] for r in result["signals"]}, {"owned_child"})


if __name__ == "__main__":
    unittest.main()
