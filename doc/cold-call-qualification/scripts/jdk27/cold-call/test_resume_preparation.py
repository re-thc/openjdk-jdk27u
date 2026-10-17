"""Offline tests: subprocess creation is forbidden throughout this suite."""
import copy
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import Mock, patch

import qualification_campaign as base
import resume_preparation as repair


def stopped():
    records = [dict(name=n, status="finished", exit_code=0, wall_seconds=0.1,
                    phase="prepare" if n in repair.expected_records()[:5] else "builds")
               for n in repair.expected_records()]
    records[-1]["exit_code"] = 1
    return dict(status="stopped-no-retry", measurement_started=False,
                failure="Command failed; no retry: installed-jtreg-version",
                plan=copy.deepcopy(base.PLAN), phase_caps=copy.deepcopy(base.PLAN["phase_seconds"]),
                outer_clock=dict(deadline_utc=base.DEADLINE_UTC,
                                 observed_utc=base.ORIGINAL_STARTED_UTC,
                                 deadline_monotonic=20000.0, started_monotonic=5600.0), records=records,
                images={k: dict(commit=base.BASE if k == "base-release" else base.CANDIDATE)
                        for k in base.PLAN["builds"]})


class ResumeTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.spawn = patch.object(base.subprocess, "Popen", side_effect=AssertionError("offline spawn"))
        self.spawn.start()
        self.addCleanup(self.spawn.stop)

    def test_exact_preparation_stop_is_eligible(self):
        repair.validate_stop(stopped())

    def test_any_started_workload_or_review_is_rejected(self):
        for key in ("timing", "reviews", "decoder_proofs", "full_provenance"):
            value = stopped(); value[key] = {}
            with self.subTest(key=key), self.assertRaises(RuntimeError):
                repair.validate_stop(value)
        value = stopped(); value["measurement_started"] = True
        with self.assertRaises(RuntimeError): repair.validate_stop(value)

    def test_extra_missing_reordered_or_failed_command_is_rejected(self):
        for mode in ("extra", "missing", "reorder", "failed", "unfinished"):
            value = stopped()
            if mode == "extra": value["records"].append(copy.deepcopy(value["records"][0]))
            if mode == "missing": value["records"].pop(0)
            if mode == "reorder": value["records"].reverse()
            if mode == "failed": value["records"][0]["exit_code"] = 1
            if mode == "unfinished": value["records"][0]["status"] = "started"
            with self.subTest(mode=mode), self.assertRaises(RuntimeError): repair.validate_stop(value)

    def test_plan_caps_deadline_and_source_are_immutable(self):
        values = []
        p = stopped(); p["plan"]["jobs"] = 8; values.append(p)
        p = stopped(); p["phase_caps"]["timing"] += 1; values.append(p)
        p = stopped(); p["outer_clock"]["deadline_utc"] = "2099-01-01T00:00:00Z"; values.append(p)
        p = stopped(); p["images"]["base-release"]["commit"] = base.CANDIDATE; values.append(p)
        p = stopped(); p["records"][0]["wall_seconds"] = float("nan"); values.append(p)
        p = stopped(); p["outer_clock"]["deadline_monotonic"] += 60; values.append(p)
        for p in values:
            with self.assertRaises(RuntimeError): repair.validate_stop(p)

    def test_only_explicit_installed_jtreg_launcher_change_is_allowed(self):
        bundle = self.root / "bundle/doc/cold-call-qualification/SOURCE-MANIFEST.json"
        bundle.parent.mkdir(parents=True); bundle.write_text(json.dumps({"files": []}))
        old = dict(boot_jdk="/installed/boot", environment=dict(PATH="/bin"),
                   jdk_source=str(self.root / "bundle"))
        fixed = copy.deepcopy(old); fixed["environment"]["JTREG_JAVA"] = "/installed/boot/bin/java"
        repair.validate_config(old, fixed)
        for field, value in (("PATH", "/other"), ("JTREG_JAVA", "/other/bin/java")):
            changed = copy.deepcopy(fixed); changed["environment"][field] = value
            with self.assertRaises(RuntimeError): repair.validate_config(old, changed)
        changed = copy.deepcopy(fixed); changed["configure"] = ["--disable-warnings-as-errors"]
        with self.assertRaises(RuntimeError): repair.validate_config(old, changed)

    def fixture(self):
        parent_dir = self.root / "parent"; parent_dir.mkdir()
        old_path = self.root / "old.json"
        bundle = self.root / "bundle/doc/cold-call-qualification/SOURCE-MANIFEST.json"
        bundle.parent.mkdir(parents=True); bundle.write_text(json.dumps({"files": []}))
        old = dict(boot_jdk="/installed/boot", environment=dict(PATH="/bin"),
                   jdk_source=str(self.root / "bundle"))
        old_path.write_text(json.dumps(old))
        fixed = copy.deepcopy(old); fixed["environment"]["JTREG_JAVA"] = "/installed/boot/bin/java"
        fixed_path = self.root / "fixed.json"; fixed_path.write_text(json.dumps(fixed))
        p = stopped(); effective = copy.deepcopy(old)
        effective["environment"]["PATH"] = "/installed/boot/bin:/bin"
        p.update(config=effective, supplied_config=dict(path=str(old_path), sha256=repair.sha(old_path)),
                 bundle=dict(jdk_commit="published", manifest_sha256=repair.sha(bundle)), host={})
        inventories = {}
        for kind in base.PLAN["builds"]:
            tree = parent_dir / kind; tree.mkdir()
            image = tree / "build/qualification/images/jdk"
            (image / "lib/server").mkdir(parents=True)
            (image / "lib/server/libjvm.so").write_bytes(b"frozen JVM " + kind.encode())
            (image / "lib/modules").write_bytes(b"frozen modules")
            (image / "release").write_text("recorded release")
            spec = tree / "build/qualification/spec.gmk"; spec.write_text("recorded spec")
            (parent_dir / (kind + "-spec.gmk")).write_bytes(spec.read_bytes())
            p["images"][kind].update(libjvm_sha256=repair.sha(image / "lib/server/libjvm.so"),
                                      spec_sha256=repair.sha(spec), release=(image / "release").read_text())
            inv = parent_dir / (kind + "-full-image.json")
            inv.write_text(json.dumps(base.inventory(image))); inventories[kind] = repair.sha(inv)
            row = next(r for r in p["records"] if r["name"] == kind + "-checkout")
            row["command"] = ["git", "worktree", "add", "--detach", str(tree), p["images"][kind]["commit"]]
        for row in p["records"]:
            log = parent_dir / (row["name"] + ".log"); log.write_text(row["name"])
            row["log_sha256"] = repair.sha(log)
        provenance = parent_dir / "full-image-provenance.json"; provenance.write_text("recorded provenance")
        parent_path = parent_dir / "campaign.json"; parent_path.write_text(json.dumps(p))
        self.receipt_path = self.root / "receipt.json"
        self.receipt_path.write_text(json.dumps(dict(schema=1, deadline_utc=base.DEADLINE_UTC,
            parent_sha256=repair.sha(parent_path), old_config_sha256=repair.sha(old_path),
            fixed_config_sha256=repair.sha(fixed_path), parent_provenance_sha256=repair.sha(provenance),
            image_inventories=inventories)))
        self.receipt_hash = repair.sha(self.receipt_path)
        clock = Mock(); clock.require_open.return_value = None
        clock.started_monotonic = 0; clock.deadline_monotonic = 21000
        clock.record.return_value = {"offline": True}
        clock_patch = patch.object(repair, "ContinuationClock", return_value=clock)
        clock_patch.start(); self.addCleanup(clock_patch.stop)
        return parent_path, fixed_path

    def construct(self, parent, fixed, output):
        return repair.PreparationContinuation(parent, fixed, output, self.receipt_path, self.receipt_hash)

    def test_constructor_preserves_parent_debits_caps_and_claims_once(self):
        parent, fixed = self.fixture(); before = parent.read_bytes()
        campaign = self.construct(parent, fixed, self.root / "new")
        self.assertEqual(parent.read_bytes(), before)
        self.assertAlmostEqual(campaign.phase_caps["prepare"], 299.5)
        self.assertEqual(campaign.phase_caps["timing"], base.PLAN["phase_seconds"]["timing"])
        self.assertEqual(campaign.records, [])
        self.assertFalse(campaign.state["measurement_started"])
        self.assertEqual(campaign.clock.deadline_monotonic, 20000)
        self.assertEqual(campaign.clock.started_monotonic, 5600)
        for kind in base.PLAN["builds"]:
            self.assertEqual((campaign.output / kind).resolve(), parent.parent / kind)
        with self.assertRaises(FileExistsError):
            self.construct(parent, fixed, self.root / "second")
        self.assertEqual(parent.read_bytes(), before)

    def test_all_parent_image_spec_config_log_and_claim_tampering_is_rejected(self):
        parent, fixed = self.fixture()
        c = self.construct(parent, fixed, self.root / "new")
        c.verify_parent()
        paths = [parent, self.receipt_path, self.root / "old.json", parent.parent / "source-head.log", c.claim_path,
                 parent.parent / "full-image-provenance.json",
                 parent.parent / "base-release-full-image.json", parent.parent / "base-release-spec.gmk",
                 c.worktrees["base-release"] / "build/qualification/spec.gmk",
                 c.images["base-release"] / "lib/server/libjvm.so",
                 c.images["base-release"] / "lib/modules",
                 self.root / "bundle/doc/cold-call-qualification/SOURCE-MANIFEST.json"]
        for path in paths:
            before = path.read_bytes(); path.write_bytes(before + b"changed")
            with self.subTest(path=str(path)), self.assertRaises(RuntimeError): c.verify_parent()
            path.write_bytes(before)
        old_hash = c.source_hash; c.source_hash = "unreviewed"
        with self.assertRaises(RuntimeError): c.verify_parent()
        c.source_hash = old_hash
        alias = c.output / "base-release"; alias.unlink(); alias.symlink_to(self.root)
        with self.assertRaises(RuntimeError): c.verify_parent()

    def test_changed_parent_or_configuration_fails_before_output(self):
        parent, fixed = self.fixture()
        for target in (parent, fixed):
            before = target.read_bytes(); target.write_bytes(before + b" ")
            with self.assertRaises(RuntimeError):
                self.construct(parent, fixed, self.root / "forbidden")
            self.assertFalse((self.root / "forbidden").exists())
            target.write_bytes(before)

    def test_same_prepare_phase_cannot_reset_its_clock_and_completed_stage_cannot_restart(self):
        parent, fixed = self.fixture()
        c = self.construct(parent, fixed, self.root / "new")
        beginning = c.phase_started
        c.start_phase("prepare"); self.assertEqual(c.phase_started, beginning)
        c.start_phase("safety"); c.start_phase("capture")
        with self.assertRaises(RuntimeError): c.start_phase("safety")

    def test_expired_original_deadline_has_no_output_side_effect(self):
        with patch.object(repair, "ContinuationClock", side_effect=RuntimeError("expired")):
            with self.assertRaises(RuntimeError):
                repair.PreparationContinuation(self.root / "absent", self.root / "absent", self.root / "no-output",
                                               self.root / "absent-receipt", "0" * 64)
        self.assertFalse((self.root / "no-output").exists())

    def test_remaining_orchestration_never_builds_and_retains_both_reviews(self):
        c = Mock(); c.output = self.root; c.state = {}; c.clock = Mock()
        c.review_gate.side_effect = ["CONTINUE_FIXED_ENSEMBLE", "NO-GO"]
        with patch("capture_timed_profile.run_diagnostics") as diagnostic, patch("shutil.copyfile"), \
                patch.object(repair, "sha", return_value="sealed"):
            repair.execute(c)
        c.build.assert_not_called()
        c.adopt.assert_called_once(); c.verify_images.assert_called_once()
        c.safety.assert_called_once(); c.capture.assert_called_once()
        c.timing.assert_called_once(); c.resources.assert_called_once()
        self.assertEqual(c.review_gate.call_args_list[0].args, ("pre-timing",))
        self.assertEqual(c.review_gate.call_args_list[1].args, ("final",))
        diagnostic.assert_called_once_with(c.output, clock=c.clock)
        self.assertEqual(c.state["verdict"], "NO-GO")

    def test_receipt_hash_schema_deadline_and_image_set_cannot_be_overridden(self):
        self.fixture()
        before = self.receipt_path.read_bytes()
        with self.assertRaises(RuntimeError): repair.load_receipt(self.receipt_path, "0" * 64)
        for field, value in (("deadline_utc", "2099-01-01T00:00:00Z"), ("schema", True),
                             ("image_inventories", {}), ("parent_sha256", "unsealed")):
            receipt = json.loads(before); receipt[field] = value
            self.receipt_path.write_text(json.dumps(receipt))
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                repair.load_receipt(self.receipt_path, repair.sha(self.receipt_path))


if __name__ == "__main__":
    unittest.main()
