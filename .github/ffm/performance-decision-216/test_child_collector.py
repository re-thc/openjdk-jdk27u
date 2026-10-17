"""Mock-only individual-child collector tests: no fork, Java or host witness."""

import json
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import child_collector as c


class CollectorTests(unittest.TestCase):
    def test_per_child_quota_drift_invalidates_observation(self):
        host = dict(cgroup_limits={"/cg": {"cpu.max": "max 100000", "cpuset.cpus.effective": "3"}})
        evidence = dict(cgroup_ancestor_counters={"/cg": {"cpu.max": "10000 100000\n",
                                                        "cpuset.cpus.effective": "3\n"}},
                        executable_stat={"st_ino": 1})
        witness = c.witness_for_inputs(host, {"/java": {"st_ino": 1}}, lambda *args: evidence)
        with self.assertRaisesRegex(ValueError, "limits changed"):
            witness(42, 3, "/java")

    def test_per_child_executable_identity_checked(self):
        limits = {"/cg": {"cpu.max": "max 100000", "cpuset.cpus.effective": "3"}}
        evidence = dict(cgroup_ancestor_counters=limits, executable_stat={"st_ino": 1})
        witness = c.witness_for_inputs(dict(cgroup_limits=limits),
                                        {"/java": {"st_ino": 1}}, lambda *args: evidence)
        self.assertEqual(witness(42, 3, "/java"), evidence)
        evidence["executable_stat"] = {"st_ino": 2}
        with self.assertRaisesRegex(ValueError, "identity changed"):
            witness(42, 3, "/java")

    def invoke(self, waits, witness=None, clocks=None, launch_error=None,
               output=b'{"answer":42}\n', diagnostic_output=False):
        with TemporaryDirectory() as temporary:
            out, err = Path(temporary) / "out", Path(temporary) / "err"
            process = SimpleNamespace(pid=42, returncode=None)
            usage = SimpleNamespace(ru_utime=0.010, ru_stime=0.002)
            calls = [(pid, status, usage if pid else None) for pid, status in waits]

            def launch(argv, **kwargs):
                if launch_error:
                    raise launch_error
                kwargs["stdout"].write(output)
                kwargs["stderr"].write(b'preserved stderr\n')
                return process

            witness = witness or (lambda *args: {"verified": True, "pid": 42})
            clock_values = clocks or [1000000000, 1000000000, 1005000000, 1020000000]
            values = iter(clock_values)
            with patch.object(c.platform, "system", return_value="Linux"), \
                 patch.object(c.threading, "active_count", return_value=1), \
                 patch.object(c.os, "sched_getaffinity", return_value={3}), \
                 patch.object(c.subprocess, "Popen", side_effect=launch) as popen, \
                 patch.object(c.os, "wait4", side_effect=calls) as wait4, \
                 patch.object(c.os, "kill") as kill, \
                 patch.object(c.time, "sleep"):
                row = c.collect_child(["/images/java", "Main"], 3, 2000000000,
                                      out, err, witness=witness,
                                      clock=lambda: next(values, clock_values[-1]),
                                      diagnostic_output=diagnostic_output)
            return row, popen, wait4, kill, process

    def test_untimed_marker_is_explicitly_separate_from_normal_output(self):
        output = b'DIAGNOSTIC_WARMED uptime_ms=123\n{"answer":42}\n'
        row, *_ = self.invoke([(42, 0)], output=output, diagnostic_output=True)
        self.assertNotIn("error", row)
        self.assertTrue(row["diagnostic_output"])
        self.assertEqual(row["diagnostic_warm_uptime_ms"], 123)
        row, *_ = self.invoke([(42, 0)], output=output)
        self.assertIn("invalid raw JSON", row["error"])

    def test_individual_usage_and_exact_pid_not_cumulative_children(self):
        row, popen, wait4, kill, process = self.invoke([(0, 0), (42, 0)])
        self.assertEqual(row["process_cpu_ns"], 12000000)
        self.assertEqual(row["waited_pid"], row["pid"])
        self.assertEqual(row["cpu_source"], "wait4-direct-child")
        self.assertEqual(row["metrics"], {"answer": 42})
        self.assertEqual(process.returncode, 0)
        self.assertNotIn("error", row)
        self.assertEqual(wait4.call_count, 2)
        self.assertEqual(popen.call_count, 1)
        kill.assert_not_called()

    def test_timeout_kills_and_reaps_owned_child_once_no_retry(self):
        row, popen, wait4, kill, process = self.invoke(
            [(0, 0), (42, 9)], clocks=[1000000000, 1000000000, 2100000000, 2200000000])
        self.assertIn("deadline", row["error"])
        self.assertEqual(row["returncode"], -9)
        self.assertEqual(row["stderr"], "preserved stderr\n")
        self.assertEqual(wait4.call_args.args, (42, c.os.WNOHANG))
        self.assertEqual(popen.call_count, 1)
        kill.assert_called_once_with(42, c.signal.SIGKILL)

    def test_failed_witness_kills_reaps_and_preserves_error(self):
        row, popen, wait4, kill, process = self.invoke(
            [(42, 9)], witness=lambda *args: {"verified": False})
        self.assertFalse(row["host_witness_verified"])
        self.assertIn("witness", row["error"])
        self.assertEqual(row["waited_pid"], 42)
        self.assertEqual(popen.call_count, 1)
        kill.assert_called_once()

    def test_non_reaping_child_stops_with_explicit_pending_cleanup(self):
        row, popen, wait4, kill, process = self.invoke(
            [(0, 0), (0, 0)], clocks=[1000000000, 1000000000, 2100000000, 2200000000, 2300000000])
        self.assertTrue(row["cleanup_pending"])
        self.assertEqual(row["unreaped_child_pid"], 42)
        self.assertEqual(row["returncode"], -1)
        self.assertIn("cleanup incomplete", row["error"])
        self.assertEqual(popen.call_count, 1)
        self.assertTrue(all(call.args[1] == c.os.WNOHANG for call in wait4.call_args_list))

    def test_nonzero_exit_preserved_without_retry(self):
        row, popen, wait4, kill, process = self.invoke([(42, 256)])
        self.assertEqual(row["returncode"], 1)
        self.assertIn("nonzero", row["error"])
        self.assertEqual(popen.call_count, 1)
        kill.assert_not_called()

    def test_launch_failure_has_no_unowned_kill_or_wait(self):
        row, popen, wait4, kill, process = self.invoke([], launch_error=OSError("fork unavailable"))
        self.assertEqual(row["returncode"], -1)
        self.assertEqual(row["process_cpu_ns"], 0)
        self.assertIn("fork unavailable", row["error"])
        wait4.assert_not_called()
        kill.assert_not_called()

    def test_existing_output_is_preserved(self):
        with TemporaryDirectory() as temporary:
            out, err = Path(temporary) / "out", Path(temporary) / "err"
            out.write_text("old data")
            with patch.object(c.platform, "system", return_value="Linux"), \
                 patch.object(c.threading, "active_count", return_value=1), \
                 patch.object(c.os, "sched_getaffinity", return_value={3}), \
                 patch.object(c.subprocess, "Popen") as popen:
                with self.assertRaises(FileExistsError):
                    c.collect_child(["/java"], 3, 2000000000, out, err,
                                    clock=lambda: 1000000000)
                popen.assert_not_called()
            self.assertEqual(out.read_text(), "old data")


if __name__ == "__main__":
    unittest.main()
