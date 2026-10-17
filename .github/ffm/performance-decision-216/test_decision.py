"""Offline synthetic fixtures only; no Java, builds, child launches or host admission."""

import copy
import json
import unittest
from collections import Counter
from unittest.mock import patch

import decision as d


PATHS = dict(base="/images/base/bin/java", template="/images/template/bin/java",
             classes="/experiment/classes", native="/experiment/libprobe.so")


def rows(stage, candidate=0.8):
    result = []
    for slot in d.make_schedule():
        if slot["stage"] != stage:
            continue
        cell = next(c for c in d.CELLS if c["id"] == slot["cell"])
        factor = candidate if slot["label"] == "template" else 1
        duration = int((100000000 + slot["block"] * 100000) * factor)
        m = dict(main_ns=int(1000000 * factor))
        if cell["shape"] != "empty":
            m.update(linker_ns=int(1000000 * factor), lookup_ns=int(1000000 * factor),
                     descriptor_symbol_ns=int(1000000 * factor))
        if cell["shape"] == "i":
            m.update(link_ns=int(1000000 * factor), first_ns=int(1000000 * factor),
                     early_ns=int(1000000 * factor), warm_ns=0, warm_count=2000000, sink=499500)
        if stage != "startup":
            count = d.PLAN["calls_per_batch"][cell["tier"]]
            m = dict(mode=cell["shape"], count=count, warm=30,
                     sink=count * (count - 1) // 2,
                     wall_ns=[int((10000000 + i * 1000) * factor) for i in range(10)],
                     cpu_ns=[int((10000000 + i * 1000) * factor) for i in range(10)])
        row = dict(slot, returncode=0, command=d.command(slot, PATHS), cds="default",
                   cpu_source="wait4-direct-child", pid=42, waited_pid=42,
                   host_witness_verified=True, start_monotonic_ns=1000000000,
                   end_monotonic_ns=1000000000 + duration, wall_ns=duration,
                   process_cpu_ns=duration, metrics=m, stdout=json.dumps(m), stderr="")
        result.append(row)
    return result


def modify_metric(row, metric, factor):
    row["metrics"][metric] = int(row["metrics"][metric] * factor)
    row["stdout"] = json.dumps(row["metrics"])


class ScheduleTests(unittest.TestCase):
    def test_frozen_size_and_reproducibility(self):
        self.assertEqual(d.make_schedule(), d.make_schedule())
        self.assertEqual(Counter(s["stage"] for s in d.make_schedule()),
                         {"startup": 108, "held-call-form": 36, "selected-counterparts": 72})

    def test_duplicate_missing_reordered_unknown_rejected(self):
        schedule = d.make_schedule()
        bad = [schedule[:-1], schedule + [schedule[0]], [schedule[1], schedule[0]] + schedule[2:]]
        duplicate = copy.deepcopy(schedule)
        duplicate[1]["label"] = duplicate[0]["label"]
        bad.append(duplicate)
        for value in bad:
            with self.subTest(value=value[:2]), self.assertRaises(ValueError):
                d.validate_schedule(value)

    def test_balanced_but_changed_schedule_is_distinct_from_frozen_file(self):
        original = d.make_schedule()
        changed = copy.deepcopy(original)
        for row in changed:
            row["label"] = {"base": "control", "control": "base", "template": "template"}[row["label"]]
        d.validate_schedule(changed)
        self.assertNotEqual(original, changed)  # Execution must also pin file hash, not just structure.

    def test_boolean_slot_and_extra_metric_are_rejected(self):
        schedule = d.make_schedule()
        schedule[0]["sequence"] = True
        with self.assertRaises(ValueError):
            d.validate_schedule(schedule)
        row = rows("startup")[0]
        slot = {k: row[k] for k in ["sequence", "stage", "cell", "block", "label"]}
        row["metrics"]["unreviewed_ns"] = 1
        row["stdout"] = json.dumps(row["metrics"])
        with self.assertRaises(ValueError):
            d.validate_row(row, slot, PATHS)

    def test_argv_has_exact_call_modes_and_no_diagnostic_or_startup_warm(self):
        for slot in d.make_schedule():
            argv = d.command(slot, PATHS)
            self.assertNotIn("warm", argv)
            self.assertFalse(any("diagnostic" in part for part in argv))
            self.assertEqual(argv[0], PATHS["base" if slot["label"] == "control" else slot["label"]])
            if slot["cell"] == "c2-unbound":
                self.assertIn("-Dsteady.mode=unbound", argv)
                self.assertIn("-Dsteady.count=1000000", argv)
            elif slot["cell"] == "c1-unbound":
                self.assertIn("-XX:TieredStopAtLevel=1", argv)
                self.assertIn("-Dsteady.count=100000", argv)


class RowTests(unittest.TestCase):
    def test_all_schemas(self):
        for stage in d.PLAN["stage_order"]:
            for row in rows(stage):
                slot = {k: row[k] for k in ["sequence", "stage", "cell", "block", "label"]}
                d.validate_row(row, slot, PATHS)

    def test_invalid_rows_fail_closed(self):
        row = next(r for r in rows("startup") if r["cell"] == "startup-i")
        slot = {k: row[k] for k in ["sequence", "stage", "cell", "block", "label"]}
        edits = [dict(returncode=False), dict(returncode=1), dict(error="failure"),
                 dict(process_cpu_ns=0), dict(pid=0), dict(waited_pid=13),
                 dict(host_witness_verified=False), dict(cpu_source="RUSAGE_CHILDREN-delta"),
                 dict(command=row["command"] + ["warm"]), dict(cds="off"),
                 dict(end_monotonic_ns=row["end_monotonic_ns"] + 1)]
        for edit in edits:
            bad = dict(row, **edit)
            with self.subTest(edit=edit), self.assertRaises(ValueError):
                d.validate_row(bad, slot, PATHS)
        for key in ["first_ns", "link_ns", "main_ns"]:
            bad = copy.deepcopy(row)
            del bad["metrics"][key]
            bad["stdout"] = json.dumps(bad["metrics"])
            with self.assertRaises(ValueError):
                d.validate_row(bad, slot, PATHS)

    def test_missing_extra_duplicate_reordered_rows_rejected(self):
        data = rows("held-call-form")
        for bad in [data[:-1], data + [data[0]], [data[1], data[0]] + data[2:], [data[0]] + data[:-1]]:
            with self.assertRaises(ValueError):
                d.assess(bad, "held-call-form", d.make_schedule(), PATHS)


class AnalysisTests(unittest.TestCase):
    def assess(self, stage, data=None, candidate=0.8):
        return d.assess(rows(stage, candidate) if data is None else data,
                        stage, d.make_schedule(), PATHS)

    def test_ratio_orientation_seed_and_units(self):
        a = d.ratio([2.0] * 12, [1.0] * 12)
        self.assertEqual(a["ratio"], 2)
        self.assertEqual(a, d.ratio([2.0] * 12, [1.0] * 12))
        self.assertEqual(a["lo"], a["hi"])
        r = self.assess("held-call-form")
        self.assertEqual(len(r["controls"]), 2)
        self.assertTrue(r["primary_resolved_favorably"])
        self.assertFalse(r["shipping_qualified"])

    def test_control_bounds_and_first_call_gate(self):
        data = rows("startup")
        for row in data:
            if row["cell"] == "startup-i" and row["label"] == "control":
                modify_metric(row, "first_ns", 1.2)
        report = self.assess("startup", data)
        self.assertEqual(len(report["controls"]), 7)
        self.assertEqual(report["status"], "STOPPED_CONTROL_FAILURE")
        self.assertEqual([r["metric"] for r in report["control_failures"]], ["first_ns"])
        self.assertIsNone(d.next_stage([report]))

    def test_candidate_interval_slowdown_hold(self):
        report = self.assess("held-call-form", candidate=1.1)
        self.assertEqual(report["status"], "HELD_CANDIDATE_SLOWDOWN")
        self.assertTrue(report["consistent_slowdown_signals"])
        self.assertIsNone(d.next_stage([self.assess("startup"), report]))

    def test_nine_block_hold_without_below_one_interval(self):
        # Hold remains >=9/12 even when a wide interval crosses 1.
        data = rows("held-call-form", candidate=1)
        for row in data:
            if row["label"] == "template":
                factor = 1.01 if row["block"] < 9 else 0.1
                for key in ["wall_ns", "cpu_ns"]:
                    row["metrics"][key] = [int(x * factor) for x in row["metrics"][key]]
                row["stdout"] = json.dumps(row["metrics"])
        report = self.assess("held-call-form", data)
        self.assertTrue(all(len(h["jointly_slower_blocks"]) == 9 for h in report["consistent_slowdown_signals"]))
        self.assertTrue(all(not h["intervals_entirely_below_one"] for h in report["consistent_slowdown_signals"]))

    def test_eight_slower_blocks_not_automatic_nine_block_hold(self):
        data = rows("held-call-form", candidate=1)
        for row in data:
            if row["label"] == "template":
                factor = 1.01 if row["block"] < 8 else 0.1
                for key in ["wall_ns", "cpu_ns"]:
                    row["metrics"][key] = [int(x * factor) for x in row["metrics"][key]]
                row["stdout"] = json.dumps(row["metrics"])
        self.assertFalse(self.assess("held-call-form", data)["consistent_slowdown_signals"])

    def test_equal_is_inconclusive_no_equivalence_claim(self):
        report = self.assess("held-call-form", candidate=1)
        self.assertEqual(report["status"], "INCONCLUSIVE_REVIEW_REQUIRED")
        self.assertFalse(report["primary_resolved_favorably"])

    def test_first_call_uncertain_prevents_optional_stage(self):
        data = rows("startup")
        for row in data:
            if row["cell"] == "startup-i" and row["label"] == "template":
                modify_metric(row, "first_ns", 1.25)  # Exact equality to both baseline labels.
        cold = self.assess("startup", data)
        retained = self.assess("held-call-form")
        self.assertFalse(cold["primary_resolved_favorably"])
        self.assertEqual(d.next_stage([cold]), "held-call-form")
        self.assertIsNone(d.next_stage([cold, retained]))

    def test_optional_only_after_two_favorable_primary_stages(self):
        self.assertEqual(d.next_stage([]), "startup")
        self.assertEqual(d.next_stage([self.assess("startup")]), "held-call-form")
        self.assertEqual(d.next_stage([self.assess("startup"), self.assess("held-call-form")]),
                         "selected-counterparts")
        self.assertIsNone(d.next_stage([self.assess("startup"), self.assess("held-call-form", candidate=1)]))


if __name__ == "__main__":
    unittest.main()
