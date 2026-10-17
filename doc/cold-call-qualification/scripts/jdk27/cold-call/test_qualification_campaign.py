#!/usr/bin/env python3
"""Offline runner regression tests; every process creation is mocked.

Run from this directory with: python3 -m unittest -v test_qualification_campaign
These tests never start a qualification campaign, Java, Git, or a build.
"""
import copy
from datetime import datetime, timedelta
import hashlib
import json
import os
from pathlib import Path
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch

import qualification_campaign as runner
import capture_timed_profile as diagnostics


class OpenClock:
    """Explicit injected clock for filesystem/orchestration unit tests only."""
    started_monotonic = 0.0

    def __init__(self, seconds=1000.0):
        self.seconds = seconds

    def remaining(self):
        return self.seconds

    def require_open(self):
        runner.require(self.seconds > 1, "offline injected clock expired")

    def record(self):
        return {"offline_injected_clock": True, "remaining_seconds": self.seconds,
                "original_started_utc": runner.ORIGINAL_STARTED_UTC, "deadline_utc": runner.DEADLINE_UTC}


class OfflineTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="cold-call-offline-")
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        # A missed mock is a test failure, never permission to spawn/reap a child.
        self.spawn = patch.object(runner.subprocess, "Popen", side_effect=AssertionError("offline test tried to spawn"))
        self.spawn.start()
        self.addCleanup(self.spawn.stop)
        self.wait = patch.object(runner.os, "wait4", side_effect=AssertionError("offline test tried to reap"))
        self.wait.start()
        self.addCleanup(self.wait.stop)
        self.read = patch.object(runner.os, "read", side_effect=AssertionError("offline test tried to read stdin"))
        self.read.start()
        self.addCleanup(self.read.stop)

    def config(self):
        return {"boot_jdk": "/installed/boot-jdk", "jtreg": "/installed/jtreg",
                "environment": {"PATH": "/usr/bin:/bin"}}

    def campaign(self, name="output", clock=None, **kwargs):
        return runner.Campaign(self.config(), self.root / name,
                               clock=clock if clock is not None else OpenClock(), **kwargs)


class ClockTests(OfflineTest):
    def setUp(self):
        super().setUp()
        self.deadline = datetime.fromisoformat("2026-10-17T14:31:01.403725+00:00")
        self.wall = self.deadline - timedelta(seconds=100)
        self.mono = 500.0
        self.wall_patch = patch.object(runner, "utc_now", side_effect=lambda: self.wall)
        self.mono_patch = patch.object(runner.time, "monotonic", side_effect=lambda: self.mono)
        self.wall_patch.start()
        self.mono_patch.start()
        self.addCleanup(self.wall_patch.stop)
        self.addCleanup(self.mono_patch.stop)

    def test_original_utc_window_is_fixed(self):
        self.assertEqual(runner.ORIGINAL_STARTED_UTC, "2026-10-17T10:31:01.403725+00:00")
        self.assertEqual(runner.DEADLINE_UTC, self.deadline.isoformat())
        self.assertEqual(runner.CLEANUP_GRACE_SECONDS, 10)
        clock = runner.ContinuationClock()
        self.assertEqual(clock.remaining(), 90)
        self.assertEqual(clock.deadline_monotonic - clock.started_monotonic, 14400)

    def test_wall_rollback_cannot_restore_monotonic_budget(self):
        clock = runner.ContinuationClock()
        self.wall -= timedelta(seconds=300)
        self.mono += 30
        self.assertEqual(clock.remaining(), 60)

    def test_forward_wall_jump_expires_existing_clock(self):
        clock = runner.ContinuationClock()
        self.wall = self.deadline - timedelta(seconds=10)
        self.assertEqual(clock.remaining(), 0)
        with self.assertRaises(RuntimeError):
            clock.require_open()

    def test_new_clock_after_monotonic_reset_keeps_utc_deadline(self):
        runner.ContinuationClock()
        self.mono = 0.0  # A later process/boot must not gain a new four hours.
        self.wall = self.deadline - timedelta(seconds=25)
        later = runner.ContinuationClock()
        self.assertEqual(later.remaining(), 15)
        self.wall = self.deadline + timedelta(seconds=1)
        with self.assertRaises(RuntimeError):
            runner.ContinuationClock()

    def test_expired_before_output_or_process_side_effect(self):
        self.wall = self.deadline + timedelta(seconds=1)
        config = self.config()
        config.update(deadline_utc="2099-01-01T00:00:00+00:00", total_seconds=99999999)
        output = self.root / "must-not-exist"
        with self.assertRaises(RuntimeError):
            runner.Campaign(config, output, phase_caps={"prepare": 99999999})
        self.assertFalse(output.exists())
        runner.subprocess.Popen.assert_not_called()

    def test_command_timeout_reserves_cleanup_from_global_deadline(self):
        clock = runner.ContinuationClock()
        campaign = self.campaign(clock=clock, phase_caps={"prepare": 1000})
        process = SimpleNamespace(pid=12345, returncode=None)
        usage = SimpleNamespace(ru_maxrss=42, ru_utime=0.1, ru_stime=0.2)
        with patch.object(runner.subprocess, "Popen", return_value=process) as spawn, \
                patch.object(runner.os, "wait4", return_value=(process.pid, 0, usage)):
            campaign.run("only-mocked-command", ["unavailable-test-program"], cap=1000)
        command = spawn.call_args.args[0]
        self.assertEqual(command[:3], ["timeout", "--kill-after=10s", "90s"])
        self.assertEqual(campaign.records[0]["timeout_seconds"], 90)
        self.assertIsNone(campaign.active)


class CampaignTests(OfflineTest):
    def test_boot_jdk_path_is_prepended_once_without_mutating_config(self):
        config = self.config()
        config["environment"]["PATH"] = "/bin:/installed/boot-jdk/bin:/usr/bin:/installed/boot-jdk/bin"
        before = copy.deepcopy(config)
        with patch.dict(os.environ, {"JAVA_TOOL_OPTIONS": "must-not-leak", "CC": "wrong-compiler"}):
            first = runner.Campaign(config, self.root / "first", clock=OpenClock())
            second = runner.Campaign(first.config, self.root / "second", clock=OpenClock())
        parts = first.env["PATH"].split(os.pathsep)
        self.assertEqual(parts[0], "/installed/boot-jdk/bin")
        self.assertEqual(parts.count("/installed/boot-jdk/bin"), 1)
        self.assertEqual(first.env["PATH"], second.env["PATH"])
        self.assertNotIn("JAVA_TOOL_OPTIONS", first.env)
        self.assertNotIn("CC", first.env)
        self.assertEqual(config, before)

    def test_phase_overrides_are_instance_local(self):
        original = copy.deepcopy(runner.PLAN)
        override = {"capture": 17}
        first = self.campaign("first", phase_caps=override)
        second = self.campaign("second")
        first.phase_caps["capture"] = 3
        self.assertEqual(second.phase_caps["capture"], original["phase_seconds"]["capture"])
        self.assertEqual(override, {"capture": 17})
        self.assertEqual(runner.PLAN, original)

    def test_expired_command_has_no_log_record_or_process(self):
        clock = OpenClock()
        campaign = self.campaign(clock=clock)
        manifest = (campaign.output / "campaign.json").read_bytes()
        clock.seconds = 0
        with self.assertRaises(RuntimeError):
            campaign.run("must-not-start", ["unavailable-test-program"])
        self.assertEqual(campaign.records, [])
        self.assertFalse((campaign.output / "must-not-start.log").exists())
        self.assertEqual((campaign.output / "campaign.json").read_bytes(), manifest)
        runner.subprocess.Popen.assert_not_called()

    def test_phase_cap_and_command_cap_both_limit_timeout(self):
        tick = [100.0]
        with patch.object(runner.time, "monotonic", side_effect=lambda: tick[0]):
            campaign = self.campaign(phase_caps={"prepare": 50, "capture": 7})
            tick[0] += 20
            process = SimpleNamespace(pid=12345, returncode=None)
            usage = SimpleNamespace(ru_maxrss=0, ru_utime=0, ru_stime=0)
            with patch.object(runner.subprocess, "Popen", return_value=process) as spawn, \
                    patch.object(runner.os, "wait4", return_value=(process.pid, 0, usage)):
                campaign.run("phase-limited", ["unavailable-test-program"], cap=40)
                campaign.start_phase("capture")
                campaign.run("command-limited", ["unavailable-test-program"], cap=4)
            self.assertEqual([call.args[0][2] for call in spawn.call_args_list], ["30s", "4s"])

    def test_failed_command_cannot_be_retried(self):
        campaign = self.campaign()
        process = SimpleNamespace(pid=12345, returncode=None)
        usage = SimpleNamespace(ru_maxrss=0, ru_utime=0, ru_stime=0)
        with patch.object(runner.subprocess, "Popen", return_value=process) as spawn, \
                patch.object(runner.os, "wait4", return_value=(process.pid, 1 << 8, usage)):
            with self.assertRaises(RuntimeError):
                campaign.run("failed-once", ["unavailable-test-program"])
            with self.assertRaises(RuntimeError):
                campaign.run("failed-once", ["unavailable-test-program"])
            self.assertEqual(spawn.call_count, 1)
        self.assertEqual(campaign.records[0]["exit_code"], 1)

    def test_interrupt_reaps_own_child_even_when_process_group_is_gone(self):
        with patch.object(runner.time, "monotonic", return_value=100.0):
            campaign = self.campaign()
            process = Mock(pid=12345, returncode=None)
            process.wait.return_value = 0
            with patch.object(runner.subprocess, "Popen", return_value=process), \
                    patch.object(runner.os, "wait4", side_effect=InterruptedError("offline interruption")), \
                    patch.object(runner.os, "killpg", side_effect=ProcessLookupError) as signal_group:
                with self.assertRaisesRegex(InterruptedError, "offline interruption"):
                    campaign.run("interrupted-once", ["unavailable-test-program"])
            signal_group.assert_called_once_with(process.pid, runner.signal.SIGTERM)
            process.wait.assert_called_once_with(timeout=9.0)
            self.assertIsNone(campaign.active)
            self.assertEqual(campaign.records[0]["status"], "interrupted")

    def test_safety_keeps_fifteen_selectors_and_driver_owned_flags(self):
        campaign = self.campaign()
        campaign.worktrees = {kind: self.root / kind for kind in runner.PLAN["builds"]}
        campaign.images = {kind: self.root / kind / "image" for kind in runner.PLAN["builds"]}
        campaign.native_dir = self.root / "native"

        def result(name, command, **kwargs):
            count = sum(str(item).endswith(".java") for item in command)
            return "Test results: passed: " + str(count) + "\n"

        campaign.run = Mock(side_effect=result)
        campaign.safety()
        calls = campaign.run.call_args_list
        counts = [sum(str(item).endswith(".java") for item in call.args[1]) for call in calls]
        self.assertEqual(counts, [2, 3, 2, 3, 3, 2])
        self.assertEqual(sum(counts), 15)
        for call in calls:
            name, command = call.args
            flag = "-vmoption:-XX:+UseColdCallSpillDeferral"
            self.assertEqual(flag in command, name.endswith("-existing") and not name.startswith("base"))
        runner.subprocess.Popen.assert_not_called()

    def test_capture_keeps_six_declared_cells(self):
        campaign = self.campaign()
        campaign.images = {kind: self.root / kind / "image" for kind in runner.PLAN["builds"]}
        campaign.classes = self.root / "classes"
        campaign.corpora = self.root / "corpora"
        campaign.run = Mock(return_value="offline capture fixture")
        campaign.decoder_proof = Mock()
        campaign.capture()
        self.assertEqual([call.args[0] for call in campaign.run.call_args_list], [
            "capture-release-base", "capture-release-default", "capture-release-off", "capture-release-on",
            "capture-debug-off", "capture-debug-on"])
        self.assertEqual(campaign.decoder_proof.call_count, 6)
        runner.subprocess.Popen.assert_not_called()

    def test_direct_timing_call_cannot_bypass_review_or_repeat_ensemble(self):
        campaign = self.campaign()
        campaign.run = Mock()
        with self.assertRaises(RuntimeError):
            campaign.timing()
        self.assertNotIn("timing", campaign.state)
        self.assertFalse(campaign.state["measurement_started"])
        campaign.state["reviews"] = {"pre-timing": {"decision": "CONTINUE_FIXED_ENSEMBLE"}}
        campaign.state["timing"] = []
        with self.assertRaises(RuntimeError):
            campaign.timing()
        campaign.run.assert_not_called()


class ProvenanceTests(OfflineTest):
    def test_inventory_hashes_complete_files_and_preserves_symlink_entries(self):
        data = b"first-chunk" + b"x" * (1 << 20) + b"last-chunk"
        (self.root / "z.bin").write_bytes(data)
        (self.root / "nested").mkdir()
        (self.root / "nested/a.txt").write_text("small\n")
        (self.root / "file-link").symlink_to("z.bin")
        (self.root / "directory-link").symlink_to("nested", target_is_directory=True)
        rows = runner.inventory(self.root, clock=OpenClock())
        self.assertEqual([row["path"] for row in rows], ["directory-link", "file-link", "nested/a.txt", "z.bin"])
        by_name = {row["path"]: row for row in rows}
        self.assertEqual(by_name["z.bin"], {"path": "z.bin", "bytes": len(data),
                                           "sha256": hashlib.sha256(data).hexdigest()})
        self.assertEqual(by_name["file-link"], {"path": "file-link", "symlink": "z.bin"})
        changed = data[:-1] + b"!"
        (self.root / "z.bin").write_bytes(changed)
        again = {row["path"]: row for row in runner.inventory(self.root)}
        self.assertNotEqual(again["z.bin"]["sha256"], by_name["z.bin"]["sha256"])

    def test_inventory_rejects_broken_symlink_or_empty_tree(self):
        with self.assertRaises(RuntimeError):
            runner.inventory(self.root)
        (self.root / "broken").symlink_to("missing")
        with self.assertRaises(RuntimeError):
            runner.inventory(self.root)

    def test_inventory_checks_deadline_before_hashing(self):
        (self.root / "file").write_bytes(b"data")
        with patch.object(runner, "sha") as digest:
            with self.assertRaises(RuntimeError):
                runner.inventory(self.root, clock=OpenClock(0))
            digest.assert_not_called()

    def test_spec_values_keeps_reviewed_configuration_without_truncating_values(self):
        path = self.root / "spec.gmk"
        path.write_text("CC_VERSION_NUMBER := 16.2.0\nCXX_VERSION_NUMBER:=16.2.0\n"
                        "CC := /installed/gcc -Dvalue:=kept\nWARNINGS_AS_ERRORS := true\n"
                        "JVM_VARIANTS := server\nJVM_FEATURES_server := compiler1 compiler2 g1gc\n"
                        "DEBUG_LEVEL := fastdebug\nCFLAGS_CCACHE :=\nUNRELATED_SECRET := excluded\n")
        values = runner.spec_values(path)
        self.assertEqual(values["CC"], "/installed/gcc -Dvalue:=kept")
        self.assertEqual(values["WARNINGS_AS_ERRORS"], "true")
        self.assertEqual(values["JVM_FEATURES_server"], "compiler1 compiler2 g1gc")
        self.assertEqual(values["CFLAGS_CCACHE"], "")
        self.assertNotIn("UNRELATED_SECRET", values)

    def test_changed_sealed_sidecar_fails_before_live_inventory_comparison(self):
        sidecars = (("full-image-provenance.json", "images_sha256"),
                    ("full-compiled-classes.json", "classes_sha256"),
                    ("full-production-sources.json", "production_sources_sha256"),
                    ("installed-tool-provenance.json", "tools_sha256"))
        for index, (changed, key) in enumerate(sidecars):
            with self.subTest(sidecar=changed):
                campaign = self.campaign("sealed-" + str(index))
                campaign.state["full_provenance"] = {}
                for name, sealed_key in sidecars:
                    path = campaign.output / name
                    path.write_text("[]\n")
                    campaign.state["full_provenance"][sealed_key] = runner.sha(path)
                (campaign.output / changed).write_text('["changed alongside live tree"]\n')
                with patch.object(runner, "inventory") as live_inventory:
                    with self.assertRaisesRegex(RuntimeError, "Sealed provenance inventory changed"):
                        campaign.verify_frozen()
                    live_inventory.assert_not_called()


class ReviewTests(OfflineTest):
    REQUEST_HASH = "a" * 64

    def review(self, stage="pre-timing"):
        return {"schema": 1, "stage": stage, "request_sha256": self.REQUEST_HASH,
                "reviewer": "Offline reviewer", "notes": "All requested evidence inspected in fixture.",
                "checks": {key: True for key in runner.REVIEW_CHECKS[stage]},
                "decision": "CONTINUE_FIXED_ENSEMBLE" if stage == "pre-timing" else "GO"}

    def test_each_stage_accepts_only_complete_bound_affirmative_review(self):
        for stage in ("pre-timing", "final"):
            with self.subTest(stage=stage):
                review = self.review(stage)
                self.assertEqual(runner.validate_review(review, self.REQUEST_HASH, stage), review["decision"])

    def test_stale_hash_wrong_schema_or_stage_cannot_open_gate(self):
        for field, bad in (("request_sha256", "b" * 64), ("schema", 2),
                           ("schema", True), ("schema", 1.0), ("stage", "final")):
            with self.subTest(field=field):
                review = self.review()
                review[field] = bad
                with self.assertRaises(RuntimeError):
                    runner.validate_review(review, self.REQUEST_HASH, "pre-timing")

    def test_every_required_check_is_fail_closed(self):
        for stage in ("pre-timing", "final"):
            for key in runner.REVIEW_CHECKS[stage]:
                for bad in (False, 1, "true", None, "missing"):
                    with self.subTest(stage=stage, key=key, bad=bad):
                        review = self.review(stage)
                        if bad == "missing":
                            del review["checks"][key]
                        else:
                            review["checks"][key] = bad
                        with self.assertRaises(RuntimeError):
                            runner.validate_review(review, self.REQUEST_HASH, stage)

    def test_extra_checks_blank_attribution_and_cross_stage_decisions_rejected(self):
        changes = [{"reviewer": " "}, {"notes": ""}, {"decision": "GO"},
                   {"checks": {**self.review()["checks"], "unexpected": True}}]
        for change in changes:
            with self.subTest(change=change):
                review = self.review()
                review.update(change)
                with self.assertRaises(RuntimeError):
                    runner.validate_review(review, self.REQUEST_HASH, "pre-timing")

    def test_negative_decisions_do_not_require_claiming_failed_checks_pass(self):
        for stage, decision in (("pre-timing", "STOP"), ("final", "NO-GO"), ("final", "INCONCLUSIVE")):
            with self.subTest(stage=stage, decision=decision):
                review = self.review(stage)
                review["decision"] = decision
                review["checks"][next(iter(review["checks"]))] = False
                self.assertEqual(runner.validate_review(review, self.REQUEST_HASH, stage), decision)


class ReviewGateTests(OfflineTest):
    def ready_campaign(self):
        campaign = self.campaign()
        campaign.verify_frozen = Mock()
        campaign.state["decoder_proofs"] = {name: {} for name in (
            "capture-release-base", "capture-release-default", "capture-release-off", "capture-release-on",
            "capture-debug-off", "capture-debug-on")}
        campaign.records.extend({"name": name} for name in (
            "base-release-existing", "candidate-release-focused", "candidate-release-existing",
            "candidate-fastdebug-focused", "candidate-fastdebug-existing",
            "candidate-fastdebug-handshake-prerequisite"))
        return campaign

    def submission(self, campaign, stage, request_hash=None, decision=None):
        request = campaign.output / (stage + "-review-request.json")
        review = {"schema": 1, "stage": stage,
                  "request_sha256": runner.sha(request) if request_hash is None else request_hash,
                  "reviewer": "Offline reviewer", "notes": "Offline complete-evidence fixture.",
                  "checks": {key: True for key in runner.REVIEW_CHECKS[stage]},
                  "decision": decision or ("CONTINUE_FIXED_ENSEMBLE" if stage == "pre-timing" else "GO")}
        path = self.root / "submitted-review.json"
        path.write_text(json.dumps(review))
        return path

    def test_missing_captures_or_safety_stops_before_waiting_for_review(self):
        for missing in ("captures", "safety"):
            with self.subTest(missing=missing):
                campaign = self.ready_campaign() if missing == "captures" else self.campaign("second")
                campaign.verify_frozen = Mock()
                if missing == "captures":
                    campaign.state["decoder_proofs"].pop("capture-debug-on")
                else:
                    campaign.state["decoder_proofs"] = {str(i): {} for i in range(6)}
                with patch.object(runner.select, "select") as wait:
                    with self.assertRaises(RuntimeError):
                        campaign.review_gate("pre-timing")
                    wait.assert_not_called()
                self.assertFalse((campaign.output / "pre-timing-review-request.json").exists())

    def test_bound_review_is_accepted_only_after_frozen_evidence_recheck(self):
        campaign = self.ready_campaign()
        stdin = Mock()
        stdin.fileno.return_value = 0

        def respond(*args):
            stdin.offline_data = (str(self.submission(campaign, "pre-timing")) + "\n").encode()
            return [stdin], [], []

        with patch.object(runner.sys, "stdin", stdin), \
                patch.object(runner.os, "read", side_effect=lambda *args: stdin.offline_data), \
                patch.object(runner.select, "select", side_effect=respond) as wait:
            decision = campaign.review_gate("pre-timing")
        self.assertEqual(decision, "CONTINUE_FIXED_ENSEMBLE")
        self.assertEqual(campaign.verify_frozen.call_count, 2)
        self.assertEqual(wait.call_args.args[3], 820)
        accepted = json.loads((campaign.output / "pre-timing-accepted-review.json").read_text())
        self.assertEqual(accepted["request_sha256"], runner.sha(campaign.output / "pre-timing-review-request.json"))
        runner.subprocess.Popen.assert_not_called()

    def test_stale_submission_never_creates_accepted_review(self):
        campaign = self.ready_campaign()
        stdin = Mock()
        stdin.fileno.return_value = 0

        def respond(*args):
            stdin.offline_data = (str(self.submission(campaign, "pre-timing", request_hash="0" * 64)) + "\n").encode()
            return [stdin], [], []

        with patch.object(runner.sys, "stdin", stdin), \
                patch.object(runner.os, "read", side_effect=lambda *args: stdin.offline_data), \
                patch.object(runner.select, "select", side_effect=respond):
            with self.assertRaises(RuntimeError):
                campaign.review_gate("pre-timing")
        self.assertFalse((campaign.output / "pre-timing-accepted-review.json").exists())
        self.assertNotIn("pre-timing", campaign.state.get("reviews", {}))

    def test_review_timeout_or_eof_does_not_accept_template(self):
        for response in ("timeout", "eof"):
            with self.subTest(response=response):
                campaign = self.ready_campaign() if response == "timeout" else self.campaign("second")
                if response == "eof":
                    campaign.verify_frozen = Mock()
                    campaign.state["decoder_proofs"] = {str(i): {} for i in range(6)}
                    campaign.records.extend({"name": name} for name in (
                        "base-release-existing", "candidate-release-focused", "candidate-release-existing",
                        "candidate-fastdebug-focused", "candidate-fastdebug-existing",
                        "candidate-fastdebug-handshake-prerequisite"))
                stdin = Mock()
                stdin.fileno.return_value = 0
                with patch.object(runner.sys, "stdin", stdin), \
                        patch.object(runner.os, "read", return_value=b""), \
                        patch.object(runner.select, "select", return_value=(([] if response == "timeout" else [stdin]), [], [])):
                    with self.assertRaises(RuntimeError):
                        campaign.review_gate("pre-timing")
                self.assertFalse((campaign.output / "pre-timing-accepted-review.json").exists())

    def test_manual_go_cannot_override_failed_numerical_gate(self):
        campaign = self.ready_campaign()
        campaign.require_complete = Mock()
        campaign.state["automatic_gates"] = {"primary_gain": False}
        stdin = Mock()
        stdin.fileno.return_value = 0

        def respond(*args):
            stdin.offline_data = (str(self.submission(campaign, "final")) + "\n").encode()
            return [stdin], [], []

        with patch.object(runner.sys, "stdin", stdin), \
                patch.object(runner.os, "read", side_effect=lambda *args: stdin.offline_data), \
                patch.object(runner.select, "select", side_effect=respond):
            with self.assertRaises(RuntimeError):
                campaign.review_gate("final")
        campaign.require_complete.assert_called_once()
        self.assertFalse((campaign.output / "final-accepted-review.json").exists())

    def test_partial_or_multiple_review_lines_are_rejected_without_waiting_again(self):
        for index, data in enumerate((b"/partial/path", b"/one\n/two\n")):
            with self.subTest(data=data):
                campaign = self.ready_campaign() if index == 0 else self.campaign("second")
                if index:
                    campaign.verify_frozen = Mock()
                    campaign.state["decoder_proofs"] = {str(i): {} for i in range(6)}
                    campaign.records.extend({"name": name} for name in (
                        "base-release-existing", "candidate-release-focused", "candidate-release-existing",
                        "candidate-fastdebug-focused", "candidate-fastdebug-existing",
                        "candidate-fastdebug-handshake-prerequisite"))
                stdin = Mock()
                stdin.fileno.return_value = 0
                with patch.object(runner.sys, "stdin", stdin), patch.object(runner.os, "read", return_value=data) as read, \
                        patch.object(runner.select, "select", return_value=([stdin], [], [])) as wait:
                    with self.assertRaises(RuntimeError):
                        campaign.review_gate("pre-timing")
                    read.assert_called_once_with(0, 65536)
                    self.assertEqual(wait.call_count, 1)
                self.assertFalse((campaign.output / "pre-timing-accepted-review.json").exists())

    @unittest.skipUnless(hasattr(os, "mkfifo"), "Named pipes are unavailable")
    def test_fifo_review_path_is_rejected_before_open(self):
        campaign = self.ready_campaign()
        path = self.root / "review.fifo"
        os.mkfifo(path)
        stdin = Mock()
        stdin.fileno.return_value = 0
        with patch.object(runner.sys, "stdin", stdin), \
                patch.object(runner.os, "read", return_value=(str(path) + "\n").encode()), \
                patch.object(runner.select, "select", return_value=([stdin], [], [])), \
                patch.object(Path, "read_text", side_effect=AssertionError("FIFO must never be opened")) as read:
            with self.assertRaisesRegex(RuntimeError, "regular JSON file"):
                campaign.review_gate("pre-timing")
            read.assert_not_called()
        self.assertFalse((campaign.output / "pre-timing-accepted-review.json").exists())


class NumericalGateTests(OfflineTest):
    def setUp(self):
        super().setUp()
        self.owner = self.campaign()
        comparison = {"on_over_off": 1.0, "off_over_base": 1.0,
                      "on_over_off_paired_bootstrap_95_interval": [0.99, 1.01],
                      "off_over_base_paired_bootstrap_95_interval": [0.99, 1.01]}
        self.owner.state["comparisons"] = {mode + "-" + corpus: copy.deepcopy(comparison)
            for mode in ("decode", "encode") for corpus in ("source", "periodic", "incompressible")}
        primary = self.owner.state["comparisons"]["decode-source"]
        primary.update(on_over_off=1.03, control_over_off=0.98,
                       on_over_off_paired_bootstrap_95_interval=[1.0001, 1.05],
                       control_over_off_paired_bootstrap_95_interval=[1.0, 1.0])
        self.owner.state["decoder_proofs"] = {}
        for repeat in range(3):
            for cell in ("base", "off", "on"):
                name = f"resource-parser-{repeat}-{cell}"
                self.owner.records.append({"name": name, "final_parser_compile_seconds": 0.1,
                    "parser_peak_arena_chunk_capacity_bytes": 1 << 20})
                self.owner.state["decoder_proofs"][name] = {"nmethods": [{"compile_id": "42"}],
                    "tasks": [{"compile_id": "42", "regalloc": [{"attempts": "1"}]}]}
                self.owner.records.append({"name": f"resource-javac-{repeat}-{cell}",
                    "wall_seconds": 10.0, "peak_rss_kib": 1000, "javac_citime_seconds": 2.0,
                    "javac_peak_arena_chunk_capacity_bytes": 20 << 20,
                    "jit_nmethods": [{"compiler": "c2", "method": "protected-method"}],
                    "jit_tasks": [{"failures": []}], "emitted_classes_sha256": "same-fixture-classes"})

    def set_metric(self, prefix, key, value):
        for row in self.owner.records:
            if row["name"].startswith(prefix) and row["name"].endswith("-on"):
                row[key] = value

    def test_threshold_equalities_and_strict_primary_interval(self):
        self.assertTrue(all(self.owner.numerical_gates().values()))
        primary = self.owner.state["comparisons"]["decode-source"]
        primary["control_over_off"] = 1.02
        self.assertTrue(self.owner.numerical_gates()["aa_control"])
        primary["on_over_off_paired_bootstrap_95_interval"][0] = 1.0
        self.assertFalse(self.owner.numerical_gates()["primary_gain"])
        primary["on_over_off_paired_bootstrap_95_interval"][0] = 1.0001
        primary["on_over_off"] = 1.029999
        self.assertFalse(self.owner.numerical_gates()["primary_gain"])

    def test_protected_median_and_interval_boundaries(self):
        item = self.owner.state["comparisons"]["decode-periodic"]
        item.update(on_over_off=0.98, off_over_base=0.99,
                    on_over_off_paired_bootstrap_95_interval=[0.97, 1.0])
        self.assertTrue(all(self.owner.numerical_gates().values()))
        item["on_over_off"] = 0.979999
        self.assertFalse(self.owner.numerical_gates()["protected_medians"])
        item["off_over_base"] = 0.989999
        self.assertFalse(self.owner.numerical_gates()["off_base"])
        item["on_over_off_paired_bootstrap_95_interval"][1] = 0.999999
        self.assertFalse(self.owner.numerical_gates()["protected_intervals"])

    def test_parser_and_javac_resource_tolerances_include_exact_boundary(self):
        self.set_metric("resource-parser-", "final_parser_compile_seconds", 0.11)
        self.set_metric("resource-parser-", "parser_peak_arena_chunk_capacity_bytes", 2 << 20)
        for key, value in (("wall_seconds", 10.5), ("peak_rss_kib", 1050),
                           ("javac_citime_seconds", 2.1), ("javac_peak_arena_chunk_capacity_bytes", 21 << 20)):
            self.set_metric("resource-javac-", key, value)
        self.assertTrue(all(self.owner.numerical_gates().values()))
        self.set_metric("resource-parser-", "final_parser_compile_seconds", 0.110001)
        self.assertFalse(self.owner.numerical_gates()["on_over_off_parser_time"])
        self.set_metric("resource-javac-", "peak_rss_kib", 1051)
        self.assertFalse(self.owner.numerical_gates()["on_over_off_javac_peak_rss_kib"])

    def test_nonfinite_or_negative_resource_medians_rejected(self):
        for value in (float("nan"), float("inf"), -1):
            with self.subTest(value=value):
                self.set_metric("resource-parser-", "final_parser_compile_seconds", value)
                with self.assertRaises(RuntimeError):
                    self.owner.numerical_gates()

    def test_method_failures_attempts_and_class_identity_are_protected(self):
        row = next(r for r in self.owner.records if r["name"] == "resource-javac-0-on")
        row.update(jit_nmethods=[], jit_tasks=[{"failures": [{"reason": "offline fixture"}]}],
                   emitted_classes_sha256="changed-classes")
        proof = self.owner.state["decoder_proofs"]["resource-parser-0-on"]
        proof["tasks"][0]["regalloc"][0]["attempts"] = "2"
        gates = self.owner.numerical_gates()
        for key in ("protected_c2_methods", "no_compilation_failures", "identical_javac_classes", "no_extra_target_attempts"):
            self.assertFalse(gates[key], key)


class CompletenessTests(OfflineTest):
    def complete_fixture(self):
        owner = self.campaign()
        owner.state["timing"] = [{} for _ in range(81)]
        owner.records.extend({"name": f"timing-fixture-{i}"} for i in range(81))
        owner.records.extend({"name": f"resource-fixture-{i}"} for i in range(18))
        directory = owner.output / "source-profile-diagnostics"
        directory.mkdir()
        parent = owner.output / "diagnostic-parent.json"
        parent.write_text('{"offline_parent_snapshot": true}\n')
        owner.state["diagnostic_parent_snapshot_sha256"] = runner.sha(parent)
        rows = []
        for level in ("release", "fastdebug"):
            for cell in ("off", "on"):
                for suffix in ("", "-objdump"):
                    name = level + "-" + cell + suffix
                    path = directory / (name + ".log")
                    path.write_text("Offline diagnostic fixture; no process executed.\n")
                    rows.append({"name": name, "status": "finished", "exit_code": 0, "log_sha256": runner.sha(path)})
        names = ("release-off", "release-on", "fastdebug-off", "fastdebug-on")
        proof = {"status": "profile-capture-complete-review-required",
                 "proofs": {name: {"diagnostic_rates_excluded": True} for name in names},
                 "main_manifest_sha256": owner.state["diagnostic_parent_snapshot_sha256"],
                 "outer_clock": {"deadline_utc": runner.DEADLINE_UTC}, "records": rows}
        (directory / "campaign.json").write_text(json.dumps(proof))
        owner.state["diagnostic_manifest_sha256"] = runner.sha(directory / "campaign.json")
        owner.numerical_gates = Mock(return_value={"offline_numeric_fixture": True})
        return owner, directory, proof

    def update_proof(self, owner, directory, proof):
        (directory / "campaign.json").write_text(json.dumps(proof))
        owner.state["diagnostic_manifest_sha256"] = runner.sha(directory / "campaign.json")

    def test_requires_fixed_81_18_4_counts_and_unchanged_diagnostic_logs(self):
        owner, directory, proof = self.complete_fixture()
        owner.require_complete()
        owner.numerical_gates.assert_called_once()
        (directory / "release-off.log").write_text("changed")
        with self.assertRaises(RuntimeError):
            owner.require_complete()

    def test_missing_ensemble_or_diagnostics_cannot_be_complete(self):
        owner, directory, proof = self.complete_fixture()
        owner.state["timing"].pop()
        with self.assertRaises(RuntimeError):
            owner.require_complete()
        owner.state["timing"].append({})
        owner.records.pop()
        with self.assertRaises(RuntimeError):
            owner.require_complete()
        owner.records.append({"name": "resource-fixture-last"})
        proof["proofs"].pop("fastdebug-on")
        self.update_proof(owner, directory, proof)
        with self.assertRaises(RuntimeError):
            owner.require_complete()
        owner.numerical_gates.assert_not_called()

    def test_diagnostic_deadline_cannot_differ_from_main(self):
        owner, directory, proof = self.complete_fixture()
        proof["outer_clock"]["deadline_utc"] = "2099-01-01T00:00:00+00:00"
        self.update_proof(owner, directory, proof)
        with self.assertRaises(RuntimeError):
            owner.require_complete()

    def test_diagnostics_from_different_parent_are_rejected(self):
        owner, directory, proof = self.complete_fixture()
        proof["main_manifest_sha256"] = "0" * 64
        self.update_proof(owner, directory, proof)
        with self.assertRaisesRegex(RuntimeError, "different parent"):
            owner.verify_diagnostics()

    def test_parent_snapshot_and_diagnostic_manifest_cannot_change(self):
        owner, directory, proof = self.complete_fixture()
        parent = owner.output / "diagnostic-parent.json"
        original = parent.read_bytes()
        parent.write_bytes(original + b" ")
        with self.assertRaisesRegex(RuntimeError, "parent snapshot changed"):
            owner.verify_diagnostics()
        parent.write_bytes(original)
        (directory / "campaign.json").write_text(json.dumps(proof) + " ")
        with self.assertRaisesRegex(RuntimeError, "manifest changed"):
            owner.verify_diagnostics()

    def test_same_count_wrong_cells_or_rate_inclusion_cannot_pass(self):
        owner, directory, proof = self.complete_fixture()
        expected = copy.deepcopy(proof)
        proof["proofs"]["substitute"] = proof["proofs"].pop("fastdebug-on")
        self.update_proof(owner, directory, proof)
        with self.assertRaises(RuntimeError):
            owner.verify_diagnostics()
        proof = copy.deepcopy(expected)
        proof["proofs"]["release-on"]["diagnostic_rates_excluded"] = False
        self.update_proof(owner, directory, proof)
        with self.assertRaises(RuntimeError):
            owner.verify_diagnostics()
        proof = copy.deepcopy(expected)
        proof["records"][0]["name"] = proof["records"][1]["name"]
        self.update_proof(owner, directory, proof)
        with self.assertRaises(RuntimeError):
            owner.verify_diagnostics()

    def test_final_frozen_recheck_detects_changed_diagnostics_first(self):
        owner, directory, proof = self.complete_fixture()
        (directory / "release-on.log").write_text("changed during review")
        with self.assertRaisesRegex(RuntimeError, "Diagnostic evidence incomplete/changed"):
            owner.verify_frozen()


class DiagnosticTests(OfflineTest):
    def test_four_diagnostics_share_clock_exclude_rates_and_leave_plan_unchanged(self):
        root = self.root / "main"
        root.mkdir()
        images = {}
        for level in ("release", "fastdebug"):
            path = root / ("candidate-" + level) / "build/qualification/images/jdk/lib/server/libjvm.so"
            path.parent.mkdir(parents=True)
            path.write_bytes(b"Offline image fixture, not a native library.")
            images["candidate-" + level] = {"libjvm_sha256": runner.sha(path)}
        corpora = root / "prepared/corpora"
        corpora.mkdir(parents=True)
        inputs = {}
        for name in ("source.bin", "source.l1.zst"):
            path = corpora / name
            path.write_bytes(b"Offline frame fixture, not a measured frame.")
            inputs[name] = {"sha256": runner.sha(path)}
        now = datetime.fromisoformat(runner.ORIGINAL_STARTED_UTC)
        original = {"status": "execution-complete-review-required", "config": self.config(),
                    "images": images, "inputs": inputs,
                    "outer_clock": {"deadline_utc": runner.DEADLINE_UTC, "observed_utc": now.isoformat()}}
        (root / "campaign.json").write_text(json.dumps(original))
        header = "Compiled method (c2) 1 42 dev.jzstd.internal.BlockDecoder::decodeSequencesRolling (991 bytes)"
        xml = runner.ET.ElementTree(runner.ET.fromstring(
            '<hotspot_log><nmethod method="BlockDecoder decodeSequencesRolling" compiler="c2" '
            'compile_id="42" stamp="1.0"/><task compile_id="42"/></hotspot_log>'))
        calls = []

        def fake_run(owner, name, command, **kwargs):
            calls.append((name, command))
            if name.endswith("-objdump"):
                return ""
            deferred = "CCDEFER fixture\n" if name.endswith("-on") else ""
            return ("CCINITIAL fixture\n" + deferred + header + "\n{static_call} *invokestatic readPartialLong "
                    "BlockDecoder::decodeSequencesRolling@684\nCOMPILER warmup_ms=8000 measured_ms=0 "
                    "boundary_uptime_ms=10000\n[/MachCode]\n")

        before = copy.deepcopy(runner.PLAN)
        clock = OpenClock()
        with patch.object(diagnostics, "utc_now", return_value=now), \
                patch.object(diagnostics, "Campaign", wraps=runner.Campaign) as factory, \
                patch.object(runner.Campaign, "run", fake_run), \
                patch.object(diagnostics.ET, "parse", return_value=xml), \
                patch.object(diagnostics, "extract", return_value=(header, 0, b"\x90")):
            result = diagnostics.run_diagnostics(root, clock=clock)
        self.assertIs(factory.call_args.kwargs["clock"], clock)
        self.assertEqual(factory.call_args.kwargs["phase_caps"], {"capture": 180})
        self.assertEqual(runner.PLAN, before)
        self.assertEqual([name for name, command in calls if not name.endswith("-objdump")],
                         ["release-off", "release-on", "fastdebug-off", "fastdebug-on"])
        self.assertEqual(len(result["proofs"]), 4)
        self.assertTrue(all(proof["diagnostic_rates_excluded"] for proof in result["proofs"].values()))
        self.assertEqual(result["outer_clock"]["deadline_utc"], runner.DEADLINE_UTC)
        runner.subprocess.Popen.assert_not_called()


if __name__ == "__main__":
    unittest.main()
