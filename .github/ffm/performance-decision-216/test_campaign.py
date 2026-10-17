"""Synthetic controller replay; collect_child, Java and host snapshots never run."""

import copy
import json
from pathlib import Path
from tempfile import TemporaryDirectory
import unittest

import decision as d
import measure_once as m
from test_decision import PATHS, rows


class CampaignTests(unittest.TestCase):
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
