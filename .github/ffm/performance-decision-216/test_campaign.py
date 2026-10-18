"""Synthetic controller replay; collect_child, Java and host snapshots never run."""

import copy
import json
from pathlib import Path
from tempfile import TemporaryDirectory
import unittest
from unittest.mock import Mock, patch

import decision as d
import measure_once as m
from budget import final_budget_observation
from observe_return import cleanup_observation
import observe_return as terminal
from test_decision import PATHS, rows


class CampaignTests(unittest.TestCase):
    def budget(self):
        return dict(start_monotonic_ns=1, preparation_deadline_ns=5100_000_000_001,
                    overall_deadline_ns=9000_000_000_001, boot_id="fixture")

    def test_final_write_crossing_deadline_cannot_leave_authoritative_pass(self):
        budget = self.budget()
        now = [budget["overall_deadline_ns"] - 1]
        report = dict(status="SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED",
                      shipping_qualified=False, overall_budget_passed=True)

        def slow_final_write(out, value):
            m.write_report(out, value)
            now[0] = budget["overall_deadline_ns"] + 1  # synthetic final I/O overrun

        with TemporaryDirectory() as temporary:
            out = Path(temporary)
            m.write_pre_seal_report(out, report, budget, clock=lambda: now[0], writer=slow_final_write)
            persisted = json.loads((out / "status.json").read_text())
        self.assertTrue(persisted["pre_seal_budget_passed"])
        self.assertTrue(persisted["budget_check_provisional"])
        self.assertTrue(persisted["terminal_observation_required"])
        self.assertNotIn("overall_budget_passed", persisted)
        observed = final_budget_observation(budget, report["status"], 0, now[0], now[0] + 1, True)
        self.assertFalse(observed["overall_budget_passed"])
        self.assertFalse(observed["terminal_observation_passed"])
        self.assertEqual(observed["status"], "STOPPED_OVERALL_BUDGET")

    def test_owner_observes_actual_return_after_simulated_late_final_write(self):
        budget = self.budget()
        end = budget["overall_deadline_ns"]
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            (root / "EXECUTION_BINDINGS.json").write_text("{}")

            def worker_return(command, cwd, deadline, launched, **kwargs):
                self.assertEqual(deadline, end)
                launched(7)
                out = root / "run"
                out.mkdir()
                (out / "campaign-budget.json").write_text(json.dumps(dict(
                    collector_pid=7, start_monotonic_ns=2, campaign_deadline_ns=3600_000_000_002)))
                m.write_pre_seal_report(out, dict(status="SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED"),
                                        budget, clock=lambda: end - 1)
                for suffix, value in [("intent", {}), ("launch", dict(pid=42)),
                                       ("receipt", dict(pid=42, waited_pid=42, returncode=0))]:
                    (out / ("fork-001." + suffix + ".json")).write_text(json.dumps(value))
                return dict(collector_pid=7, process_return_code=0,
                            process_return_monotonic_ns=end + 1,
                            supervisor_cleanup_complete=True, supervision_intervened=False)

            with patch.object(terminal, "__file__", str(root / "observe_return.py")), \
                 patch("inputs.get_budget", return_value=budget), \
                 patch.object(terminal, "supervise", side_effect=worker_return) as launch, \
                 patch.object(terminal.time, "monotonic_ns", side_effect=[2, end + 2]), \
                 patch("builtins.print"):
                terminal.main()
            observed = json.loads((root / "local/process-return.json").read_text())
            self.assertEqual(launch.call_count, 1)
            self.assertEqual(json.loads((root / "local/collector-launch.json").read_text())["collector_pid"], 7)
            self.assertEqual(observed["collector_pid"], 7)
            self.assertTrue(observed["final_cleanup_complete"])
            self.assertFalse(observed["overall_budget_passed"])
            self.assertEqual(observed["status"], "STOPPED_OVERALL_BUDGET")

    def test_supervisor_intervention_cannot_salvage_zero_exit_or_original_hold(self):
        for status in ["SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED", "STOPPED_CONTROL_FAILURE",
                       "HELD_CANDIDATE_SLOWDOWN", "INCONCLUSIVE_REVIEW_REQUIRED"]:
            observed = final_budget_observation(self.budget(), status, 0, 2, 3, True, True)
            self.assertEqual(observed["collector_status"], status)
            self.assertEqual(observed["status"], "STOPPED_EXECUTION_FAILURE")
            self.assertFalse(observed["terminal_observation_passed"])
            self.assertFalse(observed["overall_budget_passed"])
            self.assertFalse(observed["shipping_qualified"])

    def test_unknown_return_is_explicit_and_cannot_claim_authoritative_cleanup(self):
        observed = final_budget_observation(self.budget(), "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED",
                                            None, None, 3, False, True)
        self.assertIsNone(observed["process_return_code"])
        self.assertIsNone(observed["process_return_monotonic_ns"])
        self.assertEqual(observed["status"], "STOPPED_CLEANUP_INCOMPLETE")
        self.assertFalse(observed["process_return_observed"])
        self.assertFalse(observed["authoritative_process_return_and_cleanup"])
        self.assertFalse(observed["terminal_observation_passed"])
        with self.assertRaises(ValueError):
            final_budget_observation(self.budget(), "fixture", None, None, 3, True)

    def test_missing_malformed_or_collecting_status_never_passes_terminal_observation(self):
        for content in [None, "{", json.dumps(dict(status="COLLECTING")),
                        json.dumps(dict(status="UNKNOWN"))]:
            with self.subTest(content=content), TemporaryDirectory() as temporary:
                root = Path(temporary)
                (root / "EXECUTION_BINDINGS.json").write_text("{}")

                def worker(command, cwd, deadline, launched, **kwargs):
                    launched(7)
                    out = root / "run"
                    out.mkdir()
                    if content is not None:
                        (out / "status.json").write_text(content)
                    return dict(collector_pid=7, process_return_code=0, process_return_monotonic_ns=2,
                                supervisor_cleanup_complete=True, supervision_intervened=False)

                with patch.object(terminal, "__file__", str(root / "observe_return.py")), \
                     patch("inputs.get_budget", return_value=self.budget()), \
                     patch.object(terminal, "supervise", side_effect=worker), \
                     patch.object(terminal.time, "monotonic_ns", return_value=3), patch("builtins.print"):
                    terminal.main()
                observed = json.loads((root / "local/process-return.json").read_text())
                self.assertFalse(observed["terminal_observation_passed"])
                self.assertEqual(observed["status"], "STOPPED_CLEANUP_INCOMPLETE")
                self.assertIn("cleanup_observation_error", observed)

    def test_campaign_marker_anchors_window_after_delayed_preflight(self):
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            self.assertIsNone(terminal.campaign_endpoint(root, self.budget(), 7))
            with self.assertRaisesRegex(ValueError, "preparation deadline"):
                terminal.campaign_endpoint(root, self.budget(), 7,
                                           self.budget()["preparation_deadline_ns"])
            (root / "run").mkdir()
            start = 240_000_000_001  # synthetic four-minute input validation
            marker = root / "run/campaign-budget.json"
            record = dict(collector_pid=7, start_monotonic_ns=start,
                          campaign_deadline_ns=start + 3600_000_000_000)
            marker.write_text(json.dumps(record))
            self.assertEqual(terminal.campaign_endpoint(root, self.budget(), 7),
                             start + 3900_000_000_000)
            record["collector_pid"] = 8
            marker.write_text(json.dumps(record))
            with self.assertRaises(ValueError):
                terminal.campaign_endpoint(root, self.budget(), 7)
            record["collector_pid"] = 7
            record["start_monotonic_ns"] = self.budget()["preparation_deadline_ns"] + 1
            record["campaign_deadline_ns"] = record["start_monotonic_ns"] + 3600_000_000_000
            marker.write_text(json.dumps(record))
            with self.assertRaisesRegex(ValueError, "preparation budget expired"):
                terminal.campaign_endpoint(root, self.budget(), 7)

    def test_final_cleanup_overrun_overrides_timely_process_return(self):
        budget = self.budget()
        end = budget["overall_deadline_ns"]
        observed = final_budget_observation(budget, "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED",
                                            0, end - 1, end + 1, True)
        self.assertEqual(observed["status"], "STOPPED_OVERALL_BUDGET")
        self.assertFalse(observed["overall_budget_passed"])

    def test_incomplete_cleanup_overrides_favorable_collector(self):
        budget = self.budget()
        observed = final_budget_observation(budget, "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED",
                                            0, 2, 3, False)
        self.assertEqual(observed["status"], "STOPPED_CLEANUP_INCOMPLETE")
        self.assertFalse(observed["overall_budget_passed"])
        self.assertFalse(observed["terminal_observation_passed"])

    def test_timely_terminal_observation_never_clears_statistical_holds(self):
        for status in ["HELD_CANDIDATE_SLOWDOWN", "STOPPED_CONTROL_FAILURE", "INCONCLUSIVE_REVIEW_REQUIRED",
                       "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED"]:
            observed = final_budget_observation(self.budget(), status, 0, 2, 3, True)
            self.assertEqual(observed["status"], status)
            self.assertTrue(observed["overall_budget_passed"])
            self.assertFalse(observed["shipping_qualified"])

    def test_nonzero_collector_return_cannot_be_accepted(self):
        observed = final_budget_observation(self.budget(), "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED",
                                            1, 2, 3, True)
        self.assertEqual(observed["status"], "STOPPED_EXECUTION_FAILURE")
        self.assertFalse(observed["terminal_observation_passed"])

    def test_final_cleanup_requires_complete_matching_reap_receipts(self):
        with TemporaryDirectory() as temporary:
            out = Path(temporary)
            (out / "fork-001.intent.json").write_text("{}")
            (out / "fork-001.launch.json").write_text(json.dumps(dict(pid=42)))
            receipt = out / "fork-001.receipt.json"
            receipt.write_text(json.dumps(dict(pid=42, waited_pid=42, returncode=0)))
            self.assertTrue(cleanup_observation(out))
            receipt.write_text(json.dumps(dict(pid=42, waited_pid=42, returncode=0, cleanup_pending=True)))
            self.assertFalse(cleanup_observation(out))
            receipt.unlink()
            self.assertFalse(cleanup_observation(out))

    def test_bad_schedule_rejected_before_collect_or_output(self):
        schedule = d.make_schedule()
        schedule[0], schedule[1] = schedule[1], schedule[0]
        with TemporaryDirectory() as temporary:
            path = Path(temporary)
            with self.assertRaises(ValueError):
                m.collect_stages(path, dict(paths=PATHS, cpu=3), schedule, 1000000000000,
                                 collect=lambda *args: self.fail("must not launch"),
                                 telemetry=lambda: self.fail("must not probe"), clock=lambda: 1)
            self.assertEqual(list(path.iterdir()), [])

    def replay(self, fixtures):
        calls, pending = [], iter(fixtures)

        def collect(argv, cpu, deadline, out, err):
            row = copy.deepcopy(next(pending))
            self.assertEqual(row["command"], argv)
            calls.append(row["sequence"])
            return row

        with TemporaryDirectory() as temporary:
            path = Path(temporary)
            report = m.collect_stages(path, dict(paths=PATHS, cpu=3), d.make_schedule(),
                                      1000000000000, collect=collect,
                                      telemetry=lambda: dict(synthetic=True), clock=lambda: 1)
            files = {p.name: p.read_text() for p in path.iterdir() if p.is_file()}
        return report, calls, files

    def test_full_favorable_ceiling_is_216_never_shipping(self):
        fixtures = [r for s in d.PLAN["stage_order"] for r in rows(s)]
        report, calls, files = self.replay(fixtures)
        self.assertEqual(calls, list(range(1, 217)))
        self.assertEqual(report["status"], "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED")
        self.assertFalse(report["shipping_qualified"])
        self.assertEqual(report["automatic_retries"], 0)
        self.assertEqual(len([f for f in files if f.endswith("-table.md")]), 3)

    def test_inconclusive_still_answers_historical_mode_stops_at_144(self):
        fixtures = rows("startup", candidate=1) + rows("held-call-form", candidate=1)
        report, calls, files = self.replay(fixtures)
        self.assertEqual(len(calls), 144)
        self.assertEqual(report["status"], "INCONCLUSIVE_REVIEW_REQUIRED")
        self.assertNotIn("selected-counterparts.jsonl", files)

    def test_failed_control_stops_before_any_later_stage(self):
        fixtures = rows("startup")
        for row in fixtures:
            if row["label"] == "control":
                row["wall_ns"] *= 2
                row["end_monotonic_ns"] = row["start_monotonic_ns"] + row["wall_ns"]
        report, calls, files = self.replay(fixtures)
        self.assertEqual(report["status"], "STOPPED_CONTROL_FAILURE")
        self.assertEqual(len(calls), 108)
        self.assertNotIn("held-call-form.jsonl", files)

    def test_invalid_fork_stops_once_and_retains_raw(self):
        fixtures = rows("startup")
        fixtures[0]["error"] = "fixture timeout"
        report, calls, files = self.replay(fixtures)
        self.assertEqual(report["status"], "STOPPED_INVALID_FORK")
        self.assertEqual(len(calls), 1)
        self.assertEqual(json.loads(files["startup.jsonl"])["error"], "fixture timeout")
        self.assertNotIn("startup-analysis.json", files)


if __name__ == "__main__":
    unittest.main()
