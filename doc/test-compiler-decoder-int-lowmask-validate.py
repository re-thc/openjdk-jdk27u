#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.

"""Offline deadline/evidence-gate regressions. Never launch Java or a build."""

import contextlib
import copy
import importlib.util
import io
import json
from pathlib import Path
import signal
import subprocess
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch

sys.dont_write_bytecode = True
spec = importlib.util.spec_from_file_location(
    "driver", Path(__file__).with_name("compiler-decoder-int-lowmask-validate.py"))
driver = importlib.util.module_from_spec(spec)
spec.loader.exec_module(driver)


class ValidationDriverTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.args = SimpleNamespace(output=self.root / "output", stage="time",
            jdk_root=self.root / "candidate", base_root=self.root / "base",
            codec_root=self.root / "codec", jtreg_home=self.root / "jtreg",
            jtreg_java_home=self.root / "boot", corpus=self.root / "corpus",
            frame=self.root / "frame")
        self.args.owner_verdict = self.args.output / "owner-verdict.json"
        self.clock = self.enterContext(patch.object(driver.time, "monotonic", return_value=100.0))
        self.enterContext(patch.object(driver, "boot_id", return_value="offline-boot"))
        self.timer = self.enterContext(patch.object(driver.signal, "setitimer"))
        self.handler = self.enterContext(patch.object(driver.signal, "signal"))
        self.popen = self.enterContext(patch.object(driver.subprocess, "Popen",
            side_effect=AssertionError("Offline tests must not launch a process")))
        self.enterContext(contextlib.redirect_stdout(io.StringIO()))

    def init(self):
        driver.init_campaign(self.args)
        return driver.digest(self.args.output / "campaign.json")

    def evidence(self):
        self.campaign = self.init()
        self.heads = {"base": "base-head", "candidate": "candidate-head", "codec": "codec-head"}
        source = self.root / "image"
        source.write_text("offline image fixture")
        self.files = {str(source): driver.digest(source)}
        self.classes = {"CodecProbe.class": "class-sha"}
        for stage in ("build", "qualify", "prepare", "diagnose"):
            directory = self.args.output / stage
            directory.mkdir()
            receipt = {"completed": True, "completed_monotonic": 100.0,
                       "campaign_sha256": self.campaign, "heads": self.heads,
                       "sha256": self.files}
            if stage == "prepare":
                receipt["classes_sha256"] = self.classes
            if stage == "diagnose":
                for name in ("base", "candidate", "base-debug", "candidate-debug"):
                    for suffix in (".log", ".xml", "-flags.log"):
                        (directory / (name + suffix)).write_text("offline captured " + name + suffix)
                receipt["artifacts_sha256"] = driver.diagnostic_artifacts(self.args)
            (directory / "manifest.json").write_text(json.dumps(receipt))
        digest, artifacts = driver.diagnostic_evidence(self.args, self.campaign, self.heads)
        self.verdict = driver.verdict_template(digest, artifacts)
        self.verdict["decision"] = "allow-timing"
        for assessment in self.verdict["assessments"].values():
            assessment.update(verified=True, finding="Offline fixture finding only")
            for reference in assessment["evidence"]:
                reference["locator"] = "offline compile_id=1 source range"
        self.save_verdict()

    def save_verdict(self):
        self.args.owner_verdict.write_text(json.dumps(self.verdict))

    def run_stage(self, stage):
        self.args.stage = stage
        with patch.object(driver, "verify_sources", return_value=self.heads), \
             patch.object(driver, "files_manifest", return_value=self.files), \
             patch.object(driver, "classes_manifest", return_value=self.classes), \
             driver.Budget(driver.LIMITS[stage]) as budget:
            driver.run_stage(self.args, budget)

    def test_campaign_is_create_once(self):
        before = self.init()
        self.clock.return_value = 500.0
        with self.assertRaises(FileExistsError):
            driver.init_campaign(self.args)
        self.assertEqual(before, driver.digest(self.args.output / "campaign.json"))
        self.assertEqual(0o444, (self.args.output / "campaign.json").stat().st_mode & 0o777)

    def test_missing_campaign_fails_before_source_hash_or_launch(self):
        with patch.object(driver, "verify_sources") as sources, driver.Budget(180) as budget:
            with self.assertRaises(FileNotFoundError):
                driver.run_stage(self.args, budget)
        sources.assert_not_called()
        self.popen.assert_not_called()

    def test_one_deadline_and_narrower_stage_limit(self):
        self.init()
        with driver.Budget(120) as budget:
            driver.load_campaign(self.args, budget)
            self.assertEqual(220.0, budget.end)
        self.clock.return_value = 7250.0
        with driver.Budget(180) as budget:
            driver.load_campaign(self.args, budget)
            self.assertEqual(7300.0, budget.end)
            self.assertEqual(40.0, budget.remaining())
        self.clock.return_value = 7291.0
        with driver.Budget(180) as budget:
            with self.assertRaises(TimeoutError):
                driver.load_campaign(self.args, budget)

    def test_machine_or_deadline_change_rejected(self):
        self.init()
        path = self.args.output / "campaign.json"
        original = json.loads(path.read_text())
        path.chmod(0o600)  # Simulate external corruption of the read-only receipt.
        for key, value in (("boot_id", "other-boot"), ("deadline_monotonic", 8000.0)):
            with self.subTest(key=key):
                changed = dict(original, **{key: value})
                path.write_text(json.dumps(changed))
                with driver.Budget(180) as budget, self.assertRaises(ValueError):
                    driver.load_campaign(self.args, budget)

    def test_alarm_armed_before_hashing_and_cleanup_bounded(self):
        self.evidence()
        def hashing(*args):
            self.assertTrue(self.timer.called)
            self.clock.return_value = 7291.0
            self.handler.call_args.args[1](signal.SIGALRM, None)
        with patch.object(driver, "verify_sources", side_effect=hashing), \
             driver.Budget(180) as budget, self.assertRaises(TimeoutError):
            driver.run_stage(self.args, budget)
        self.popen.assert_not_called()
        process = Mock(pid=123, returncode=None)
        process.communicate.side_effect = subprocess.TimeoutExpired("fixture", 1)
        self.clock.return_value = 100.0
        self.popen.side_effect = None
        self.popen.return_value = process
        with patch.object(driver.os, "killpg") as kill, driver.Budget(180) as budget:
            with self.assertRaises(subprocess.TimeoutExpired):
                driver.run_process(["offline-only"], budget)
            kill.assert_called_once_with(123, signal.SIGKILL)
            self.assertEqual(10.0, process.wait.call_args.kwargs["timeout"])
            self.assertEqual(110.0, budget.end)

    def test_changed_campaign_cannot_reuse_prerequisites(self):
        self.evidence()
        path = self.args.output / "campaign.json"
        changed = json.loads(path.read_text())
        changed["started_unix"] += 1
        path.chmod(0o600)  # Simulate external replacement rather than normal driver use.
        path.write_text(json.dumps(changed))
        with self.assertRaises(ValueError):
            self.run_stage("review")
        self.popen.assert_not_called()

    def test_review_delay_does_not_renew_window(self):
        self.evidence()
        self.clock.return_value = 691.0
        with patch.object(driver, "verify_sources") as sources:
            with driver.Budget(600) as budget, self.assertRaises(TimeoutError):
                self.args.stage = "review"
                driver.run_stage(self.args, budget)
        sources.assert_not_called()
        self.popen.assert_not_called()

    def test_diagnose_completed_alone_cannot_enable_time(self):
        self.evidence()
        self.args.owner_verdict.unlink()
        with self.assertRaises(FileNotFoundError):
            self.run_stage("review")
        with self.assertRaises(FileNotFoundError):
            self.run_stage("time")
        self.popen.assert_not_called()

    def test_owner_and_all_assessments_required(self):
        self.evidence()
        invalid = []
        for key, value in (("owner", "another owner"), ("decision", "stop"),
                           ("evidence_sha256", "0" * 64)):
            bad = copy.deepcopy(self.verdict)
            bad[key] = value
            invalid.append(bad)
        for name in driver.ASSESSMENTS:
            bad = copy.deepcopy(self.verdict)
            del bad["assessments"][name]
            invalid.append(bad)
        for key, value in (("verified", False), ("verified", 1), ("finding", ""),
                           ("evidence", [])):
            bad = copy.deepcopy(self.verdict)
            bad["assessments"]["site_291"][key] = value
            invalid.append(bad)
        for key, value in (("sha256", "0" * 64), ("locator", ""), ("path", "not-captured.log")):
            bad = copy.deepcopy(self.verdict)
            bad["assessments"]["release_allocation"]["evidence"][0][key] = value
            invalid.append(bad)
        for bad in invalid:
            with self.subTest(bad=bad):
                self.args.owner_verdict.write_text(json.dumps(bad))
                with self.assertRaises(ValueError):
                    driver.validate_verdict(self.args, self.campaign, self.heads)
        self.popen.assert_not_called()

    def test_diagnostic_add_remove_or_change_invalidates_verdict(self):
        self.evidence()
        directory = self.args.output / "diagnose"
        path = directory / "candidate.log"
        original = path.read_text()
        for change in ("edit", "remove", "add"):
            with self.subTest(change=change):
                path.write_text(original)
                extra = directory / "extra.log"
                extra.unlink(missing_ok=True)
                if change == "edit":
                    path.write_text("changed captured bytes")
                elif change == "remove":
                    path.unlink()
                else:
                    extra.write_text("new captured bytes")
                with self.assertRaises(ValueError):
                    driver.validate_verdict(self.args, self.campaign, self.heads)

    def test_source_image_or_class_identity_change_stops_time(self):
        self.evidence()
        self.run_stage("review")
        for stage, key, value in (("diagnose", "heads", {}), ("diagnose", "sha256", {}),
                                   ("prepare", "classes_sha256", {})):
            path = self.args.output / stage / "manifest.json"
            original = path.read_text()
            changed = json.loads(original)
            changed[key] = value
            path.write_text(json.dumps(changed))
            with self.subTest(stage=stage, key=key), self.assertRaises(ValueError):
                self.run_stage("time")
            path.write_text(original)
        self.popen.assert_not_called()

    def test_valid_review_enables_only_eight_clean_commands(self):
        self.evidence()
        self.clock.return_value = 110.0
        self.run_stage("review")
        self.clock.return_value = 900.0  # Timing may follow a completed fixed-window review.
        names = []
        def simulated(command, budget, **kwargs):
            self.assertIn("CodecProbe", command)
            self.assertFalse(any("CompileCommand" in value or "LogCompilation" in value
                                 for value in command))
            names.append("candidate" if "/candidate/" in command[0] else "base")
            kwargs["stdout"].write("decode L1 input=1 frame=1 median=3 MB/s samples=[1,2,3,4,5]\n")
            return 0, None
        with patch.object(driver, "run_process", side_effect=simulated):
            self.run_stage("time")
        self.assertEqual(["base", "candidate", "candidate", "base", "candidate", "base", "base", "candidate"], names)
        receipt = json.loads((self.args.output / "time/manifest.json").read_text())
        self.assertTrue(receipt["completed"])
        self.assertEqual(4, len(receipt["pairs"]))
        self.popen.assert_not_called()

    def test_changed_review_or_owner_verdict_stops_time(self):
        self.evidence()
        self.run_stage("review")
        path = self.args.output / "review/manifest.json"
        reviewed = json.loads(path.read_text())
        reviewed["completed_monotonic"] = 701.0
        path.write_text(json.dumps(reviewed))
        with self.assertRaises(ValueError):
            self.run_stage("time")
        reviewed["completed_monotonic"] = 100.0
        path.write_text(json.dumps(reviewed))
        self.verdict["assessments"]["site_293"]["finding"] += " changed"
        self.save_verdict()
        with self.assertRaises(ValueError):
            self.run_stage("time")
        self.popen.assert_not_called()

    def test_diagnostic_loops_and_clean_samples_remain_distinct(self):
        diagnostics = list(driver.commands(self.args, "diagnose"))
        self.assertEqual(8, len(diagnostics))
        probes = [command for _, command in diagnostics if "CodecProbe" in command]
        self.assertEqual(4, len(probes))
        for command in probes:
            self.assertNotIn("-Xcomp", command)
            self.assertNotIn("-XX:-TieredCompilation", command)
            self.assertFalse(any("compileonly" in str(value) for value in command))
        self.assertEqual(8, len(list(driver.commands(self.args, "time"))))
        self.assertEqual([], list(driver.commands(self.args, "review")))
        self.assertEqual("bash", list(driver.commands(self.args, "build"))[0][1][0])

    def test_default_plan_has_no_execution_or_output_side_effects(self):
        with patch.object(sys, "argv", ["validate.py", "--output", str(self.args.output),
                                        "--codec-root", str(self.args.codec_root)]):
            driver.main()
        self.assertFalse(self.args.output.exists())
        self.popen.assert_not_called()


if __name__ == "__main__":
    unittest.main(verbosity=2)
