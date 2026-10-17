"""Offline controller tests. External process creation is forbidden throughout."""
import copy
from contextlib import redirect_stdout
from datetime import datetime, timedelta, timezone
import hashlib
import io
import json
import os
from pathlib import Path
import signal
import subprocess
import tempfile
import unittest
from unittest.mock import patch
import zipfile

import mechanism_validation as runner
import mechanism_evidence as evidence
from test_mechanism_evidence import synthetic_capture


PRODUCTION = "b7534f5ccac7847a22ba7b63a6ea18beb71580e2"
BASELINE = "01903ba375f94c0ab7f9193d3e36bd30fe663d7e"
CODEC = "7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6"
OLD_CANDIDATE = "75ee82dff6f86e41aad8cedfe947a90a2b9296df"
OLD_RUNNER = "7341a0fb7678d87e083794e12ca116f7ae0eaeb8"
RUNNER_REVISION = "a" * 40
CONFIG_HASH = "b" * 64
PACKAGE_HASH = "c" * 64


class OfflineTest(unittest.TestCase):
    def setUp(self):
        self.temporary = tempfile.TemporaryDirectory()
        self.addCleanup(self.temporary.cleanup)
        self.root = Path(self.temporary.name)
        for name in ("Popen", "run", "call", "check_call", "check_output"):
            blocker = patch.object(subprocess, name, side_effect=AssertionError("Offline tests cannot spawn: " + name))
            blocker.start()
            self.addCleanup(blocker.stop)
        for name, value in (("getitimer", (0.0, 0.0)), ("setitimer", (0.0, 0.0)), ("signal", None)):
            timer = patch.object(signal, name, return_value=value)
            timer.start()
            self.addCleanup(timer.stop)
        self.now = datetime(2026, 10, 17, 20, 0, tzinfo=timezone.utc)

    def approval(self):
        return dict(schema=1, kind="cold-call-mechanism-approval", execution_authorized=True,
                    candidate=PRODUCTION, baseline=BASELINE, codec=CODEC,
                    runner_revision=RUNNER_REVISION, config_sha256=CONFIG_HASH,
                    package_sha256=PACKAGE_HASH, started_utc=self.now.isoformat(),
                    deadline_utc=(self.now + timedelta(seconds=7200)).isoformat(),
                    run_id="offline-mechanism-check")

    def validate_approval(self, value, now=None):
        return runner.validate_approval(value, CONFIG_HASH, RUNNER_REVISION, PACKAGE_HASH,
                                        now=self.now if now is None else now)

    def config(self):
        return dict(schema=1, jdk_source=str(self.root / "normal-jdk-checkout"),
                    codec_source=str(self.root / "normal-codec-checkout"),
                    boot_jdk="/installed/boot-jdk", jtreg="/installed/jtreg",
                    junit="/installed/junit.jar", cc="/installed/gcc16/bin/gcc",
                    cxx="/installed/gcc16/bin/g++", environment={"PATH": "/installed/gcc16/bin:/usr/bin:/bin"},
                    configure=[])

    def host(self):
        return dict(system="Linux", machine="x86_64", native=True,
                    ram_bytes=16 * 1024**3, free_bytes=35 * 1024**3,
                    pid1_zombies=0, process_headroom=4096, probe_errors=[])


class ApprovalTests(OfflineTest):
    def test_exact_repaired_production_and_distinct_runner_are_pinned(self):
        self.assertEqual(runner.CANDIDATE, PRODUCTION)
        self.assertEqual(runner.BASELINE, BASELINE)
        self.assertEqual(runner.CODEC, CODEC)
        self.validate_approval(self.approval())
        for field, changed in (("candidate", OLD_CANDIDATE), ("candidate", OLD_RUNNER),
                               ("baseline", PRODUCTION), ("codec", "0" * 40),
                               ("runner_revision", OLD_RUNNER), ("config_sha256", "d" * 64),
                               ("package_sha256", "e" * 64)):
            value = self.approval()
            value[field] = changed
            with self.subTest(field=field, changed=changed), self.assertRaises(RuntimeError):
                self.validate_approval(value)

    def test_approval_requires_explicit_authorization_and_safe_identity(self):
        for field, changed in (("schema", 2), ("kind", "old-qualification"),
                               ("execution_authorized", False), ("execution_authorized", 1),
                               ("run_id", "../outside"), ("run_id", "")):
            value = self.approval()
            value[field] = changed
            with self.subTest(field=field, changed=changed), self.assertRaises(RuntimeError):
                self.validate_approval(value)
        for field in self.approval():
            value = self.approval()
            del value[field]
            with self.subTest(missing=field), self.assertRaises(RuntimeError):
                self.validate_approval(value)

    def test_original_two_hour_interval_cannot_be_reset_or_extended(self):
        value = self.approval()
        for seconds in (7199, 7201, 14400):
            value["deadline_utc"] = (self.now + timedelta(seconds=seconds)).isoformat()
            with self.subTest(seconds=seconds), self.assertRaises(RuntimeError):
                self.validate_approval(value)
        for current in (self.now - timedelta(seconds=1), self.now + timedelta(seconds=7200)):
            with self.subTest(now=current), self.assertRaises(RuntimeError):
                self.validate_approval(self.approval(), now=current)
        value = self.approval()
        value["started_utc"] = "2026-10-17T20:00:00"
        with self.assertRaises(RuntimeError):
            self.validate_approval(value)

    def test_approval_cannot_enable_timing_or_change_limits(self):
        for field, changed in (("timing", True), ("attempts_per_job", 2),
                               ("phase_caps_seconds", {"capture": 900}), ("resume", True)):
            value = self.approval()
            value[field] = changed
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                self.validate_approval(value)


class ConfigurationTests(OfflineTest):
    def test_valid_normal_checkout_configuration_is_not_mutated(self):
        value = self.config()
        before = copy.deepcopy(value)
        self.assertIsInstance(runner.validate_config(value), dict)
        self.assertEqual(value, before)

    def test_configuration_cannot_supply_old_images_runner_or_other_work(self):
        for field, changed in (("images", {"candidate-release": "/old/image"}),
                               ("runner", "/old/qualification_campaign.py"),
                               ("deadline_utc", "2099-01-01T00:00:00Z"), ("timing", True),
                               ("reuse", {"candidate": OLD_CANDIDATE}), ("jobs", [])):
            value = self.config()
            value[field] = changed
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                runner.validate_config(value)

    def test_all_source_and_installed_tool_paths_must_be_absolute(self):
        for field in ("jdk_source", "codec_source", "boot_jdk", "jtreg", "junit", "cc", "cxx"):
            for changed in ("relative/path", "", None):
                value = self.config()
                value[field] = changed
                with self.subTest(field=field, changed=changed), self.assertRaises(RuntimeError):
                    runner.validate_config(value)

    def test_configure_cannot_change_server_features_compiler_or_build_mode(self):
        for argument in ("--with-jvm-variants=client", "--with-debug-level=slowdebug",
                         "--disable-jvm-feature-compiler2", "--disable-jvm-feature-jvmti",
                         "--disable-warnings-as-errors", "--enable-ccache", "CC=/other/gcc",
                         "CXX=/other/g++", "--with-jobs=64"):
            value = self.config()
            value["configure"] = [argument]
            with self.subTest(argument=argument), self.assertRaises(RuntimeError):
                runner.validate_config(value)

    def test_environment_cannot_inject_compiler_java_or_linker_flags(self):
        for name in ("CC", "CXX", "CFLAGS", "CXXFLAGS", "LDFLAGS", "JAVA_TOOL_OPTIONS",
                     "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "LD_PRELOAD"):
            value = self.config()
            value["environment"][name] = "unapproved"
            with self.subTest(name=name), self.assertRaises(RuntimeError):
                runner.validate_config(value)

    def test_gcc_and_gxx_must_belong_to_one_installed_toolchain(self):
        value = self.config()
        value["cxx"] = "/other/installed/gcc16/bin/g++"
        with self.assertRaises(RuntimeError):
            runner.validate_config(value)

    def test_ambiguous_linker_selectors_cannot_enter_the_frozen_configuration(self):
        for flags in ("-B/one -B/two", "-fuse-ld=mold -fuse-ld=lld"):
            value = self.config()
            value["configure"] = ["--with-extra-ldflags=" + flags]
            with self.subTest(flags=flags), self.assertRaises(RuntimeError):
                runner.validate_config(value)


class HostAdmissionTests(OfflineTest):
    def test_exact_host_floors_are_admitted(self):
        runner.admit_host(self.host())
        initial = self.host()
        initial["pid1_zombies"] = 32
        runner.admit_host(initial)
        later = copy.deepcopy(initial)
        later["pid1_zombies"] += 64
        runner.admit_host(later, initial)

    def test_unsafe_or_ambiguous_host_fails_closed(self):
        for field, changed in (("system", "Darwin"), ("machine", "aarch64"), ("native", False),
                               ("ram_bytes", 16 * 1024**3 - 1), ("free_bytes", 35 * 1024**3 - 1),
                               ("pid1_zombies", 33), ("process_headroom", 4095),
                               ("probe_errors", ["unknown cgroup limit"])):
            value = self.host()
            value[field] = changed
            with self.subTest(field=field), self.assertRaises(RuntimeError):
                runner.admit_host(value)
        for field in self.host():
            value = self.host()
            del value[field]
            with self.subTest(missing=field), self.assertRaises(RuntimeError):
                runner.admit_host(value)

    def test_zombie_growth_retains_original_baseline(self):
        initial = self.host()
        initial["pid1_zombies"] = 12
        later = copy.deepcopy(initial)
        later["pid1_zombies"] = 77
        with self.assertRaises(RuntimeError):
            runner.admit_host(later, initial)


class FixedMatrixTests(OfflineTest):
    def test_phase_and_build_role_caps_match_the_single_7200_second_plan(self):
        self.assertEqual(runner.PHASE_CAPS, dict(preflight=300, builds=4800, prepare=300,
                                               safety=600, capture=300, review=840, cleanup=60))
        self.assertEqual(sum(runner.PHASE_CAPS.values()), 7200)
        self.assertEqual(runner.ROLE_CAPS, {"base-release": 1500, "candidate-release": 1500,
                                           "candidate-fastdebug": 1800})

    def test_exact_safety_invocations_and_capture_cells_are_preserved(self):
        self.assertEqual(len(runner.SAFETY_SUITES), 6)
        self.assertEqual(sum(len(suite["selectors"]) for suite in runner.SAFETY_SUITES), 15)
        self.assertEqual(set(runner.CAPTURE_CELLS), {"base", "default", "off", "on", "debug-off", "debug-on"})
        self.assertEqual(len(runner.CAPTURE_CELLS), 6)

    def test_zstd_headers_and_library_are_preflight_jobs_before_builds(self):
        expected = runner.JobRegistry().expected
        self.assertEqual(len(expected), 61)
        self.assertEqual(expected["tool-zstd-headers"], "preflight")
        self.assertEqual(expected["tool-zstd-library"], "preflight")
        self.assertNotIn("prepare-zstd-headers", expected)


class RegistryTests(OfflineTest):
    def test_all_fixed_jobs_can_be_claimed_once_and_only_once(self):
        registry = runner.JobRegistry()
        for name, kind in registry.expected.items():
            registry.claim(name, kind)
        registry.assert_complete()
        with self.assertRaises(RuntimeError):
            registry.claim("capture-on", "capture")

    def test_failed_or_successful_claim_has_no_retry_and_missing_job_stops(self):
        registry = runner.JobRegistry()
        registry.claim("capture-on", "capture")
        with self.assertRaises(RuntimeError):
            registry.claim("capture-on", "capture")
        with self.assertRaises(RuntimeError):
            registry.assert_complete()

    def test_timing_diagnostics_and_expanded_capture_cells_are_forbidden(self):
        for name, kind in (("throughput-on", "timing"), ("CodecProbe", "timing"),
                           ("native-throughput", "timing"), ("encoder-diagnostic", "diagnostics"),
                           ("capture-on-repeat", "capture"), ("safety-extra", "safety"),
                           ("capture-on", "objdump"), ("unreviewed-install", "prepare")):
            with self.subTest(name=name), self.assertRaises(RuntimeError):
                runner.JobRegistry().claim(name, kind)


class SpecTests(OfflineTest):
    def test_empty_spec_variable_cannot_consume_the_next_definition(self):
        self.assertEqual(runner.parse_spec("CFLAGS_CCACHE := \nBOOT_JDK := /installed/boot-jdk\n"),
                         {"CFLAGS_CCACHE": "", "BOOT_JDK": "/installed/boot-jdk"})

    def spec(self, role="candidate-release"):
        config = self.config()
        values = dict(CC_VERSION_NUMBER="16.2.0", CXX_VERSION_NUMBER="16.2.0", CC=config["cc"],
                      CXX=config["cxx"], BOOT_JDK=config["boot_jdk"], TOOLCHAIN_TYPE="gcc",
                      LD=config["cc"], LDCXX=config["cxx"], AS=config["cc"] + " -c",
                      EXTRA_LDFLAGS="-m64", JVM_LDFLAGS="",
                      WARNINGS_AS_ERRORS="true", JVM_VARIANTS="server",
                      JVM_FEATURES_server=" ".join(sorted(runner.FEATURES)),
                      DEBUG_LEVEL="fastdebug" if role == "candidate-fastdebug" else "release",
                      CFLAGS_CCACHE="")
        return "\n".join(key + " := " + value for key, value in values.items()) + "\n"

    def test_matched_release_and_fastdebug_use_full_server_and_installed_compilers(self):
        for role in runner.ROLE_CAPS:
            runner.validate_spec(self.spec(role), role, self.config())
        self.assertEqual(runner.FEATURES, set("cds compiler1 compiler2 epsilongc g1gc jfr jni-check "
                                            "jvmti management parallelgc serialgc services "
                                            "shenandoahgc vm-structs zgc".split()))

    def test_each_compiler_build_mode_and_tool_identity_is_enforced(self):
        for key, bad in (("CC_VERSION_NUMBER", "15.2.0"), ("CXX_VERSION_NUMBER", "16.1.0"),
                         ("CC", "/substitute/gcc"), ("CXX", "/substitute/g++"),
                         ("LD", "/substitute/ld"), ("LDCXX", "/substitute/ld++"), ("AS", "/substitute/as"),
                         ("BOOT_JDK", "/other/jdk"), ("TOOLCHAIN_TYPE", "clang"),
                         ("WARNINGS_AS_ERRORS", "false"), ("JVM_VARIANTS", "client"),
                         ("DEBUG_LEVEL", "fastdebug"), ("CFLAGS_CCACHE", "ccache"),
                         ("EXTRA_LDFLAGS", "-m64 -fuse-ld=lld"), ("JVM_LDFLAGS", "-B/other/linker")):
            spec = self.spec()
            old = next(line for line in spec.splitlines() if line.startswith(key + " :="))
            with self.subTest(key=key), self.assertRaises(RuntimeError):
                runner.validate_spec(spec.replace(old, key + " := " + bad), "candidate-release", self.config())

    def test_any_missing_server_feature_or_extra_feature_is_rejected(self):
        features = " ".join(sorted(runner.FEATURES))
        for feature in runner.FEATURES:
            changed = " ".join(sorted(runner.FEATURES - {feature}))
            with self.subTest(feature=feature), self.assertRaises(RuntimeError):
                runner.validate_spec(self.spec().replace(features, changed), "candidate-release", self.config())
        with self.assertRaises(RuntimeError):
            runner.validate_spec(self.spec().replace(features, features + " unknown-feature"), "candidate-release", self.config())

    def test_selected_installed_linker_is_identical_in_extra_and_jvm_flags(self):
        config = self.config()
        flags = "-B/installed/linkers -fuse-ld=mold -L/installed/library"
        config["configure"] = ["--with-extra-ldflags=" + flags]
        runner.validate_config(config)
        spec = self.spec().replace("EXTRA_LDFLAGS := -m64", "EXTRA_LDFLAGS := -m64 " + flags)
        spec = spec.replace("JVM_LDFLAGS := ", "JVM_LDFLAGS := -B/installed/linkers -fuse-ld=mold")
        runner.validate_spec(spec, "candidate-release", config)
        for changed in (spec.replace("JVM_LDFLAGS := -B/installed/linkers -fuse-ld=mold",
                                     "JVM_LDFLAGS := -B/other/linkers -fuse-ld=mold"),
                        spec.replace("EXTRA_LDFLAGS := -m64 " + flags, "EXTRA_LDFLAGS := -m64")):
            with self.assertRaises(RuntimeError):
                runner.validate_spec(changed, "candidate-release", config)


class SafetyReceiptTests(OfflineTest):
    def fixture(self, suite=None):
        suite = suite or runner.SAFETY_SUITES[1]
        work, report = self.root / "work", self.root / "report"
        work.mkdir(exist_ok=True)
        report.mkdir(exist_ok=True)
        for selector in suite["selectors"]:
            result = work / Path(selector).with_suffix(".jtr")
            result.parent.mkdir(parents=True, exist_ok=True)
            result.write_text("testresult=Passed. Execution successful\n")
        return suite, "Test results: passed: %d\n" % len(suite["selectors"]), report, work

    def test_each_fixed_selector_needs_a_passed_result_and_its_hash(self):
        for index, suite in enumerate(runner.SAFETY_SUITES):
            suite, stdout, report, work = self.fixture(suite)
            receipt = runner.validate_safety_receipt(suite, stdout, report, work)
            self.assertEqual(receipt["selected"], len(suite["selectors"]))
            self.assertEqual({r["selector"] for r in receipt["results"]}, set(suite["selectors"]))
            for row in receipt["results"]:
                self.assertEqual(row["sha256"], runner.sha256(row["path"]))

    def test_missing_failed_or_skipped_nested_result_cannot_pass(self):
        suite, stdout, report, work = self.fixture()
        result = work / Path(suite["selectors"][0]).with_suffix(".jtr")
        for text in ("testresult=Failed. Nested assertion failed\n", "testresult=Not run.\n",
                     "testresult=Passed.\nSkipped: fixture\n", "testresult=Passed.\n@requires false\n",
                     "testresult=Passed.\ntestresult=Failed.\n"):
            result.write_text(text)
            with self.subTest(text=text), self.assertRaises(RuntimeError):
                runner.validate_safety_receipt(suite, stdout, report, work)
        result.unlink()
        with self.assertRaises(RuntimeError):
            runner.validate_safety_receipt(suite, stdout, report, work)

    def test_missing_duplicate_or_wrong_summary_stops(self):
        suite, stdout, report, work = self.fixture()
        for text in ("", stdout + stdout, "Test results: passed: 2\n",
                     stdout.rstrip() + "; failed: 1\n", stdout.rstrip() + "; skipped: 1\n"):
            with self.subTest(text=text), self.assertRaises(RuntimeError):
                runner.validate_safety_receipt(suite, text, report, work)


class InventoryTests(OfflineTest):
    def test_inventory_covers_modules_and_release_not_only_libjvm(self):
        image = self.root / "image"
        for name in ("lib/server/libjvm.so", "lib/modules", "release", "bin/java"):
            path = image / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(name.encode())
        files = runner.inventory(image)
        self.assertEqual(set(files), {"lib/server/libjvm.so", "lib/modules", "release", "bin/java"})
        before = files["lib/modules"]["sha256"]
        (image / "lib/modules").write_bytes(b"changed modules")
        self.assertNotEqual(runner.inventory(image)["lib/modules"]["sha256"], before)

    def test_escaping_symlink_and_empty_inventory_are_rejected(self):
        image = self.root / "image"
        image.mkdir()
        with self.assertRaises(RuntimeError):
            runner.inventory(image)
        outside = self.root / "outside"
        outside.write_bytes(b"not an image file")
        (image / "escape").symlink_to(outside)
        with self.assertRaises(RuntimeError):
            runner.inventory(image)


class PackageTests(OfflineTest):
    def fixture(self):
        documents = self.root / "portable-package"
        documents.mkdir()
        files = {}
        for name in runner.PACKAGE_FILES:
            path = documents / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(("frozen package fixture " + name).encode())
            files[name] = runner.sha256(path)
        applied = patch.object(runner, "DOCUMENTS", documents)
        applied.start()
        self.addCleanup(applied.stop)
        return dict(schema=1, candidate=PRODUCTION, baseline=BASELINE, codec=CODEC, files=files), documents

    def test_package_requires_every_declared_portable_source_and_no_extras(self):
        manifest, _ = self.fixture()
        runner.verify_package(manifest)
        self.assertEqual(len(runner.PACKAGE_FILES), 19)
        for name in runner.PACKAGE_FILES:
            value = copy.deepcopy(manifest)
            del value["files"][name]
            with self.subTest(missing=name), self.assertRaises(RuntimeError):
                runner.verify_package(value)
        value = copy.deepcopy(manifest)
        value["files"]["unreviewed-helper.py"] = "0" * 64
        with self.assertRaises(RuntimeError):
            runner.verify_package(value)

    def test_package_rejects_old_candidate_and_any_changed_file(self):
        manifest, documents = self.fixture()
        value = copy.deepcopy(manifest)
        value["candidate"] = OLD_CANDIDATE
        with self.assertRaises(RuntimeError):
            runner.verify_package(value)
        for name in runner.PACKAGE_FILES:
            path = documents / name
            original = path.read_bytes()
            path.write_bytes(original + b"changed")
            with self.subTest(changed=name), self.assertRaises(RuntimeError):
                runner.verify_package(manifest)
            path.write_bytes(original)

    def test_plan_is_inert_and_does_not_grant_execution(self):
        output = io.StringIO()
        with redirect_stdout(output):
            self.assertEqual(runner.main(["plan"]), 0)
        plan = json.loads(output.getvalue())
        self.assertIs(plan["execution_authorized"], False)
        self.assertEqual(plan["candidate"], PRODUCTION)
        self.assertEqual(plan["phase_caps"], runner.PHASE_CAPS)

    def test_controller_has_no_old_runner_import_or_host_private_path_dependency(self):
        source = Path(runner.__file__).read_text()
        for forbidden in ("import qualification_campaign", "import resume_preparation", "/workspace/",
                          "campaign-fe251213", "continuation-jtreg-repair"):
            with self.subTest(forbidden=forbidden):
                self.assertNotIn(forbidden, source)


class ManualClock:
    def __init__(self):
        self.seconds = 7200.0

    def remaining(self, reserve=60):
        return self.seconds - reserve

    def record(self):
        return dict(deadline_utc="2026-10-17T22:00:00+00:00", remaining_seconds=self.remaining())


class BudgetTests(OfflineTest):
    def budget(self):
        self.tick = 100.0
        self.clock = ManualClock()
        return runner.Budget(self.clock, monotonic=lambda: self.tick)

    def test_reentering_a_phase_retains_its_previous_debit(self):
        budget = self.budget()
        budget.enter("preflight")
        self.tick += 250
        budget.enter("builds")
        self.tick += 20
        budget.enter("preflight")
        self.tick += 51
        with self.assertRaises(RuntimeError):
            budget.check()

    def test_phase_checks_charge_each_elapsed_interval_once(self):
        budget = self.budget()
        budget.enter("preflight")
        self.tick += 100
        budget.check()
        self.tick += 100
        budget.check()
        self.tick += 99
        budget.check()
        self.tick += 2
        with self.assertRaises(RuntimeError):
            budget.check()

    def test_configure_and_images_share_one_role_cap(self):
        budget = self.budget()
        budget.enter("builds")
        budget.start_role("base-release")
        self.tick += 180
        self.assertAlmostEqual(budget.remaining_role("base-release"), 1320.0)
        self.tick += 1321
        with self.assertRaises(RuntimeError):
            budget.remaining_role("base-release")

    def test_build_role_cannot_be_restarted_to_reset_its_debit(self):
        budget = self.budget()
        budget.enter("builds")
        budget.start_role("candidate-release")
        self.tick += 100
        with self.assertRaises(RuntimeError):
            budget.start_role("candidate-release")
        with self.assertRaises(RuntimeError):
            budget.start_role("unapproved-fourth-build")

    def test_outer_deadline_reserves_cleanup_before_any_new_work(self):
        budget = self.budget()
        budget.enter("review")
        self.clock.seconds = 60
        with self.assertRaises(RuntimeError):
            budget.check()

    def test_timing_and_unknown_phases_cannot_receive_a_budget(self):
        for phase in ("timing", "resources", "diagnostics", "expanded-safety"):
            budget = self.budget()
            with self.subTest(phase=phase), self.assertRaises(RuntimeError):
                budget.enter(phase)


class MockExecutor:
    """Create declared command artifacts in temporary directories, never processes."""
    def __init__(self, harness, output, clock, env, host_probe):
        self.harness, self.output = harness, Path(output)
        self.env, self.host_probe = dict(env), host_probe
        self.records, self.phases = [], []
        self.closed = False
        host_probe()

    def start_phase(self, name, cap, absolute_deadline=None):
        self.phases.append((name, cap, absolute_deadline))

    def run(self, name, argv, cwd, cap, role_remaining=None, role_deadline=None):
        self.host_probe()
        stdout, stderr = self.harness.command_artifacts(name, argv, Path(cwd))
        out, err = self.output / (name + ".stdout"), self.output / (name + ".stderr")
        out.write_text(stdout)
        err.write_text(stderr)
        record = dict(name=name, argv=argv, cwd=str(cwd), cap_seconds=cap,
                      role_deadline=role_deadline,
                      stdout_path=str(out), stderr_path=str(err), stdout_sha256=runner.sha256(out),
                      stderr_sha256=runner.sha256(err), exit_code=0, wall_seconds=0.001)
        self.records.append(record)
        if self.harness.after_command:
            self.harness.after_command(name)
        return record

    def close(self):
        self.closed = True
        return self.harness.cleanup_receipt or dict(active_groups=[], direct_children_reaped=True, failed=False, elapsed_seconds=0.0)

    def cancel_signal(self, signum):
        raise runner.Failure("mock cancellation " + str(signum))

    def constrain_cleanup_deadline(self, absolute):
        previous = getattr(self, "cleanup_deadline", absolute)
        self.cleanup_deadline = min(previous, absolute)


class LifecycleTests(OfflineTest):
    def fixture(self):
        self.after_command = None
        self.bad_image_revision = None
        self.fail_safety = None
        self.missing_capture_marker = None
        self.missing_zstd_headers = False
        self.missing_zstd_library = False
        self.different_prepare_library = False
        self.capture_stores = {}
        self.capture_log_mutator = None
        self.cleanup_receipt = None
        self.executors = []
        self.documents, self.jdk = self.root / "documents", self.root / "jdk"
        self.codec = self.root / "codec"
        self.documents.mkdir()
        self.jdk.mkdir()
        self.codec.mkdir()
        config = self.config()
        config.update(jdk_source=str(self.jdk), codec_source=str(self.codec),
                      boot_jdk=str(self.root / "installed/boot-jdk"), jtreg=str(self.root / "installed/jtreg"),
                      junit=str(self.root / "installed/junit.jar"), cc=str(self.root / "installed/gcc16/bin/gcc"),
                      cxx=str(self.root / "installed/gcc16/bin/g++"))
        command_tools = self.root / "installed/command-tools"
        command_tools.mkdir(parents=True)
        for name in ("git", "make", "bash", "objdump", "python3"):
            path = command_tools / name
            path.write_bytes(("installed command fixture " + name).encode())
            path.chmod(0o755)
        config["environment"]["PATH"] = str(command_tools) + ":" + str(Path(config["cc"]).parent)
        python_identity = patch.object(runner.sys, "executable", str(command_tools / "python3"))
        python_identity.start()
        self.addCleanup(python_identity.stop)
        for path in (Path(config["cc"]), Path(config["cxx"]), Path(config["junit"]),
                     Path(config["boot_jdk"]) / "bin/java", Path(config["boot_jdk"]) / "lib/modules",
                     Path(config["jtreg"]) / "bin/jtreg", Path(config["jtreg"]) / "lib/jtreg.jar",
                     *(Path(config["cc"]).parent / name for name in ("cc1", "cc1plus", "as", "ld"))):
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(("installed fixture " + path.name).encode())
        with zipfile.ZipFile(config["junit"], "w") as archive:
            archive.writestr("org/junit/jupiter/api/Test.class", b"fixed JUnit test annotation")
        self.zstd_library = self.root / "installed/libzstd.so"
        self.zstd_library.write_bytes(b"fixed zstd 1.5.7 library")
        self.configuration = config
        self.relative_source = "src/hotspot/share/opto/reg_split.cpp"
        self.source_bytes = b"pinned repaired allocator source\n"
        source = self.jdk / self.relative_source
        source.parent.mkdir(parents=True)
        source.write_bytes(self.source_bytes)
        freeze = dict(production_revision=PRODUCTION,
                      source_file_sha256={self.relative_source: hashlib.sha256(self.source_bytes).hexdigest()})
        (self.documents / "FUTURE-VALIDATION-PLAN.json").write_text(json.dumps(freeze))
        for index in range(37):
            source = self.codec / "src/main/java" / ("Class%02d.java" % index)
            source.parent.mkdir(parents=True, exist_ok=True)
            source.write_text("class Class%02d {}\n" % index)
        factory = self.codec / "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"
        factory.parent.mkdir(parents=True)
        factory.write_text("pinned fixed factory fixture\n")
        sources = sorted((self.codec / "src/main/java").glob("*.java"))
        corpus = b"".join(path.read_bytes() + b"\n" for path in sources)
        for name, value in (("REPOSITORY", self.jdk), ("DOCUMENTS", self.documents),
                            ("SOURCE_CORPUS_BYTES", len(corpus)),
                            ("SOURCE_CORPUS_SHA256", hashlib.sha256(corpus).hexdigest())):
            applied = patch.object(runner, name, value)
            applied.start()
            self.addCleanup(applied.stop)
        host = patch.object(runner, "host_snapshot", side_effect=lambda _: self.host())
        host.start()
        self.addCleanup(host.stop)
        self.config_path, self.approval_path = self.root / "config.json", self.root / "approval.json"
        self.manifest_path = self.documents / "MECHANISM-SOURCE-MANIFEST.json"
        self.config_path.write_text(json.dumps(config))
        self.manifest_path.write_text(json.dumps({"offline": "sealed mock package"}))
        approval = self.approval()
        approval["config_sha256"] = runner.sha256(self.config_path)
        approval["package_sha256"] = runner.sha256(self.manifest_path)
        self.approval_path.write_text(json.dumps(approval))
        def executor_factory(*args):
            executor = MockExecutor(self, *args)
            self.executors.append(executor)
            return executor
        self.campaign = runner.Mechanism(config, approval, self.root / "run", self.config_path,
                                        self.approval_path, self.manifest_path, clock=ManualClock(),
                                        executor_factory=executor_factory)
        self.asm = {}
        return self.campaign

    def make_spec(self, role):
        c = self.configuration
        values = dict(CC_VERSION_NUMBER="16.2.0", CXX_VERSION_NUMBER="16.2.0", CC=c["cc"], CXX=c["cxx"],
                      LD=c["cc"], LDCXX=c["cxx"], AS=c["cc"] + " -c", EXTRA_LDFLAGS="-m64", JVM_LDFLAGS="",
                      BOOT_JDK=c["boot_jdk"], TOOLCHAIN_TYPE="gcc", WARNINGS_AS_ERRORS="true",
                      JVM_VARIANTS="server", JVM_FEATURES_server=" ".join(sorted(runner.FEATURES)),
                      DEBUG_LEVEL="fastdebug" if role == "candidate-fastdebug" else "release", CFLAGS_CCACHE="")
        return "\n".join(key + " := " + value for key, value in values.items()) + "\n"

    def command_artifacts(self, name, argv, cwd):
        if name.startswith("source-"):
            if argv[-1] == "HEAD":
                repo = Path(argv[2])
                revision = CODEC if repo == self.codec or repo.name == "codec" else (
                    RUNNER_REVISION if repo == self.jdk else BASELINE if repo.name == "base-release" else PRODUCTION)
                return revision + "\n", ""
            return "", ""
        if name.startswith("checkout-"):
            destination = Path(argv[-2])
            if destination.name == "codec":
                for source in self.codec.rglob("*"):
                    if source.is_file():
                        target = destination / source.relative_to(self.codec)
                        target.parent.mkdir(parents=True, exist_ok=True)
                        target.write_bytes(source.read_bytes())
            else:
                source = destination / self.relative_source
                source.parent.mkdir(parents=True)
                source.write_bytes(self.source_bytes)
                helpers = destination / "doc/cold-call-qualification/scripts/jdk27/cold-call"
                helpers.mkdir(parents=True)
                for helper in ("qualify_decoder.py", "DecoderQualification.java"):
                    (helpers / helper).write_bytes((runner.HERE / helper).read_bytes())
            return "", ""
        if name in ("tool-cc", "tool-cxx"):
            return "installed GNU compiler 16.2.0\n", ""
        if name == "tool-boot-java" or name.startswith("provenance-"):
            return "", 'openjdk version "27" 2026-09-15\n'
        if name == "tool-jtreg":
            return "jtreg 8.3\n", ""
        if name.startswith("tool-resolve-"):
            return str(Path(self.configuration["cc"]).parent / name.removeprefix("tool-resolve-")) + "\n", ""
        if name.startswith("configure-"):
            spec = cwd / "build/mechanism/spec.gmk"
            spec.parent.mkdir(parents=True)
            spec.write_text(self.make_spec(name.removeprefix("configure-")))
            return "configured normal server\n", ""
        if name.startswith("images-"):
            role = name.removeprefix("images-")
            image = cwd / "build/mechanism/images/jdk"
            revision = BASELINE if role == "base-release" else self.bad_image_revision or PRODUCTION
            for relative, data in (("release", 'SOURCE=".:git:%s"\n' % revision),
                                   ("bin/java", "fixture java"), ("lib/modules", "fixture modules"),
                                   ("lib/server/libjvm.so", "fixture complete JVM " + role)):
                path = image / relative
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(data)
            return "images complete\n", ""
        if name == "tool-zstd-headers":
            text = "#define ZSTD_VERSION_MAJOR 1\n#define ZSTD_VERSION_MINOR 5\n"
            return text + ("" if self.missing_zstd_headers else "#define ZSTD_VERSION_RELEASE 7\n"), ""
        if name == "tool-zstd-library":
            if "--readiness" not in argv or "--helper" in argv:
                raise AssertionError("Preflight library identity must not invoke frame preparation")
            output = Path(argv[argv.index("--output") + 1])
            output.parent.mkdir(parents=True, exist_ok=True)
            libraries = {} if self.missing_zstd_library else {str(self.zstd_library): runner.sha256(self.zstd_library)}
            output.write_text(json.dumps(dict(version="1.5.7", libraries=libraries)))
            return "read-only loaded library identity fixture\n", ""
        if name == "prepare-frames":
            prepared = Path(argv[-1])
            classes, corpora = prepared / "classes", prepared / "corpora"
            classes.mkdir()
            corpora.mkdir()
            for index in range(37):
                (classes / ("Class%02d.class" % index)).write_bytes(b"fixed class " + str(index).encode())
            for relative in ("dev/jzstd/DecoderQualification.class", "dev/jzstd/internal/BlockDecoder.class",
                             "dev/jzstd/ComprehensiveRoundTripTest.class"):
                checker = classes / relative
                checker.parent.mkdir(parents=True, exist_ok=True)
                checker.write_bytes(b"fixed checker or production class")
            rows = []
            for index in range(19):
                source = corpora / ("input-%02d.bin" % index)
                source.write_bytes(b"fixed input " + str(index).encode())
                for level in (1, 3, 9):
                    frame = source.with_suffix(".l%d.zst" % level)
                    frame.write_bytes(b"fixed frame " + str((index, level)).encode())
                    rows.append(dict(source=source.name, frame=frame.name, level=level,
                                     source_sha256=runner.sha256(source), frame_sha256=runner.sha256(frame)))
            factory = self.campaign.codec / "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"
            (prepared / "frames.json").write_text(json.dumps(dict(native_version="1.5.7", rows=rows,
                                                                  factory_source_sha256=runner.sha256(factory))))
            library = self.zstd_library
            if self.different_prepare_library:
                library = self.root / "installed/different-libzstd.so"
                library.write_bytes(b"a different zstd 1.5.7 library")
            (prepared / "native-library.json").write_text(json.dumps(dict(version="1.5.7", libraries={str(library): runner.sha256(library)})))
            return "prepared fixed 57 frames\n", ""
        if name == "native-policy":
            Path(argv[-1]).write_bytes(b"native policy test library fixture")
            return "", ""
        if name.startswith("safety-"):
            suite = next(s for s in runner.SAFETY_SUITES if name == "safety-" + s["id"])
            work = Path(next(a[3:] for a in argv if a.startswith("-w:")))
            report = Path(next(a[3:] for a in argv if a.startswith("-r:")))
            report.mkdir()
            for selector in suite["selectors"]:
                path = work / Path(selector).with_suffix(".jtr")
                path.parent.mkdir(parents=True, exist_ok=True)
                status = "Failed." if self.fail_safety == name else "Passed."
                path.write_text("testresult=" + status + " Execution completed\n")
            return "Test results: passed: %d\n" % len(suite["selectors"]), ""
        if name.startswith("capture-"):
            cell = name.removeprefix("capture-")
            parser_cell = cell if cell.startswith("debug-") else "release-" + cell
            log, xml, asm = synthetic_capture(parser_cell, cell.startswith("debug-"),
                                               stores=self.capture_stores.get(cell, 19), activation=cell == "debug-on")
            if self.capture_log_mutator:
                log = self.capture_log_mutator(cell, log)
            self.asm[cell] = asm.split("\n", 1)[1]
            Path(next(a.split("=", 1)[1] for a in argv if a.startswith("-XX:LogFile="))).write_text(xml)
            marker = "" if self.missing_capture_marker == name else "PASS frames=57 rounds=32\n"
            return log + marker, ""
        if name.startswith("objdump-"):
            return self.asm[name.removeprefix("objdump-")], ""
        raise AssertionError("Unreviewed mock command: " + name)

    def test_complete_serial_mock_lifecycle_preserves_no_go_and_exact_scope(self):
        campaign = self.fixture()
        with patch.dict(os.environ, {"JAVA_TOOL_OPTIONS": "must not leak", "CC": "/wrong/compiler"}):
            status = campaign.run()
        self.assertEqual(status, "MECHANISM_NO_GO", (campaign.receipt.get("failure"), campaign.receipt.get("evidence")))
        self.assertEqual(campaign.receipt["previous_performance_verdict"], "NO-GO")
        self.assertEqual(sum(s["selected"] for s in campaign.receipt["safety"].values()), 15)
        self.assertEqual(set(campaign.receipt["captures"]), set(runner.CAPTURE_CELLS))
        self.assertEqual(set(campaign.receipt["images"]), set(runner.ROLE_CAPS))
        self.assertTrue(self.executors[0].closed)
        self.assertEqual(campaign.receipt["cleanup"]["active_groups"], [])
        self.assertNotIn("JAVA_TOOL_OPTIONS", self.executors[0].env)
        self.assertNotIn("CC", self.executors[0].env)
        commands = self.executors[0].records
        self.assertEqual(len([r for r in commands if r["name"].startswith("capture-")]), 6)
        self.assertEqual(len({r["name"] for r in commands}), len(commands))
        self.assertTrue(all(not any("CodecProbe" in a or "native-probe" in a or "throughput" in a
                                    for a in r["argv"]) for r in commands))
        names = [r["name"] for r in commands]
        self.assertLess(names.index("tool-zstd-headers"), names.index("configure-base-release"))
        self.assertLess(names.index("tool-zstd-library"), names.index("configure-base-release"))
        self.assertTrue(all(deadline is not None and deadline > 0
                            for _, _, deadline in self.executors[0].phases))
        for role, started in campaign.budget.roles.items():
            role_jobs = {prefix + "-" + role for prefix in ("configure", "images", "provenance")}
            role_jobs |= {"source-" + role + "-built-" + suffix for suffix in ("head", "status")}
            for record in commands:
                if record["name"] in role_jobs:
                    self.assertEqual(record["role_deadline"], started + runner.ROLE_CAPS[role])
        for record in commands:
            if record["name"].startswith("checkout-"):
                self.assertEqual(record["argv"][:5], ["git", "-C", str(self.codec if record["name"] == "checkout-codec" else self.jdk),
                                                       "worktree", "add"])
                self.assertEqual(record["argv"][5], "--detach")
        ledger = json.loads((campaign.output / "transport-ledger.json").read_text())
        self.assertEqual(len(ledger["store_accounting"]["release"]["old_stores"]), 19)
        self.assertEqual(len(ledger["store_accounting"]["debug"]["old_stores"]), 19)

    def test_unsafe_host_stops_before_executor_or_any_command(self):
        campaign = self.fixture()
        unsafe = self.host()
        unsafe["pid1_zombies"] = 33
        with patch.object(runner, "host_snapshot", return_value=unsafe):
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(self.executors, [])
        self.assertEqual(campaign.receipt["commands"], [])

    def test_missing_zstd_headers_stop_preflight_before_any_build(self):
        campaign = self.fixture()
        self.missing_zstd_headers = True
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(campaign.receipt["failure"]["phase"], "preflight")
        self.assertIn("zstd", campaign.receipt["failure"]["reason"].lower())
        self.assertFalse(any(r["name"].startswith(("configure-", "images-", "prepare-"))
                             for r in self.executors[0].records))
        self.assertTrue(self.executors[0].closed)

    def test_missing_zstd_library_stops_preflight_before_any_build(self):
        campaign = self.fixture()
        self.missing_zstd_library = True
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(campaign.receipt["failure"]["phase"], "preflight")
        self.assertIn("zstd", campaign.receipt["failure"]["reason"].lower())
        self.assertFalse(any(r["name"].startswith(("configure-", "images-", "prepare-"))
                             for r in self.executors[0].records))
        self.assertTrue(self.executors[0].closed)

    def test_preparation_library_must_match_admitted_preflight_identity(self):
        campaign = self.fixture()
        self.different_prepare_library = True
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(campaign.receipt["failure"]["phase"], "prepare")
        self.assertIn("native library differs", campaign.receipt["failure"]["reason"].lower())
        self.assertEqual(campaign.receipt["safety"], {})

    def test_executed_safety_failure_stops_without_captures_or_retry(self):
        campaign = self.fixture()
        self.fail_safety = "safety-release-focused"
        self.assertEqual(campaign.run(), "MECHANISM_NO_GO", campaign.receipt.get("failure"))
        names = [r["name"] for r in self.executors[0].records]
        self.assertEqual(names.count(self.fail_safety), 1)
        self.assertFalse(any(n.startswith("capture-") for n in names))
        self.assertTrue(self.executors[0].closed)

    def test_missing_capture_correctness_marker_stops_that_fixed_attempt(self):
        campaign = self.fixture()
        self.missing_capture_marker = "capture-base"
        self.assertEqual(campaign.run(), "MECHANISM_NO_GO", campaign.receipt.get("failure"))
        names = [r["name"] for r in self.executors[0].records]
        self.assertEqual([n for n in names if n.startswith("capture-")], ["capture-base"])

    def test_old_candidate_image_cannot_be_relabelled_as_new_source(self):
        campaign = self.fixture()
        self.bad_image_revision = OLD_CANDIDATE
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertIn("release source mismatch", campaign.receipt["failure"]["reason"])
        self.assertEqual(campaign.receipt["safety"], {})

    def test_input_receipt_tampering_stops_before_commands(self):
        campaign = self.fixture()
        self.approval_path.write_text("tampered approval receipt")
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(self.executors[0].records, [])
        self.assertIn("sealed input changed", campaign.receipt["failure"]["reason"])

    def assert_seal_tampering_stops(self, kind):
        campaign = self.fixture()
        def corrupt(name):
            if name != "prepare-frames":
                return
            path = (campaign.images["candidate-release"] / "lib/server/libjvm.so" if kind == "image" else
                    Path(campaign.config["cc"]) if kind == "tool" else
                    campaign.trees["candidate-release"] / self.relative_source)
            path.write_bytes(b"tampered sealed bytes")
        self.after_command = corrupt
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertRegex(campaign.receipt["failure"]["reason"], "(?:sealed input|sealed image|source/helper|installed tool) changed")
        self.assertEqual(campaign.receipt["safety"], {})

    def test_image_hashes_remain_sealed_before_later_work(self):
        self.assert_seal_tampering_stops("image")

    def test_installed_tool_hashes_remain_sealed_before_later_work(self):
        self.assert_seal_tampering_stops("tool")

    def test_source_hashes_remain_sealed_before_later_work(self):
        self.assert_seal_tampering_stops("source")

    def test_prepared_frame_tampering_stops_before_any_capture(self):
        campaign = self.fixture()
        def corrupt(name):
            if name == "safety-debug-handshake":
                next((campaign.prepared / "corpora").glob("*.zst")).write_bytes(b"tampered frame")
        self.after_command = corrupt
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(len(campaign.receipt["safety"]), 6)
        self.assertEqual(campaign.receipt["captures"], {})

    def test_prepared_class_tampering_stops_before_any_capture(self):
        campaign = self.fixture()
        def corrupt(name):
            if name == "safety-debug-handshake":
                (campaign.prepared / "classes/dev/jzstd/internal/BlockDecoder.class").write_bytes(b"changed class")
        self.after_command = corrupt
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(campaign.receipt["captures"], {})

    def test_accepted_jtreg_result_cannot_change_before_review(self):
        campaign = self.fixture()
        def corrupt(name):
            if name == "safety-debug-handshake":
                result = next((campaign.output / "jtreg-work-base-existing").rglob("*.jtr"))
                result.write_text("testresult=Failed. Changed after acceptance\n")
        self.after_command = corrupt
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertIn("sealed input changed", campaign.receipt["failure"]["reason"])
        self.assertEqual(campaign.receipt["captures"], {})

    def test_build_stdout_cannot_change_after_its_success_was_recorded(self):
        campaign = self.fixture()
        def corrupt(name):
            if name == "prepare-frames":
                (campaign.output / "images-base-release.stdout").write_text("rewritten build evidence")
        self.after_command = corrupt
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertIn("sealed input changed", campaign.receipt["failure"]["reason"])

    def test_missing_required_checker_class_stops_preparation(self):
        campaign = self.fixture()
        def corrupt(name):
            if name == "prepare-frames":
                (campaign.output / "prepared/classes/dev/jzstd/DecoderQualification.class").unlink()
        self.after_command = corrupt
        self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertIn("missing required checker/production class", campaign.receipt["failure"]["reason"])
        self.assertEqual(campaign.receipt["safety"], {})

    def test_default_off_code_difference_cannot_pass(self):
        campaign = self.fixture()
        self.capture_stores["default"] = 18
        self.assertEqual(campaign.run(), "MECHANISM_NO_GO")
        ledger = json.loads((campaign.output / "transport-ledger.json").read_text())
        self.assertFalse(ledger["checks"]["default_off_base_relocation_aware_equal"])

    def test_missing_real_packed_load_identity_cannot_pass(self):
        campaign = self.fixture()
        self.capture_log_mutator = lambda cell, text: text.replace("@ bci:360", "@ bci:361") if cell == "debug-on" else text
        self.assertNotEqual(campaign.run(), "MECHANISM_PASS")
        proof = json.loads((campaign.output / "proof-debug-on.json").read_text())
        self.assertFalse(proof["complete"])

    def test_compensating_final_hot_store_is_no_go(self):
        campaign = self.fixture()
        self.capture_stores.update(on=20, **{"debug-on": 20})
        self.assertEqual(campaign.run(), "MECHANISM_NO_GO")

    def test_missing_capture_receipt_stops_the_review(self):
        campaign = self.fixture()
        captures = campaign.captures
        def incomplete():
            captures()
            del campaign.receipt["captures"]["default"]
        with patch.object(campaign, "captures", side_effect=incomplete):
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertIn("missing capture receipt", campaign.receipt["failure"]["reason"])

    def test_missing_safety_receipt_stops_the_review(self):
        campaign = self.fixture()
        captures = campaign.captures
        def incomplete():
            captures()
            del campaign.receipt["safety"]["release-focused"]
        with patch.object(campaign, "captures", side_effect=incomplete):
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertIn("missing safety receipt", campaign.receipt["failure"]["reason"])

    def review_reply(self, campaign, decision="ACCEPT", bad_hash=False):
        request = campaign.output / "review-request.json"
        receipt = dict(schema=1, kind="cold-call-mechanism-review", run_id=campaign.approval["run_id"],
                       request_sha256="0" * 64 if bad_hash else runner.sha256(request),
                       decision=decision, reviewer="independent offline reviewer",
                       reason="Reviewed the exact mocked source, artifacts and full transport ledger")
        (campaign.output / "review.json").write_text(json.dumps(receipt))

    def assert_review_result(self, decision, expected, bad_hash=False):
        campaign = self.fixture()
        ledger = dict(verdict="MECHANISM_PASS", checks={"mocked_complete_hard_gates": True})
        with patch.object(runner, "compare_captures", return_value=ledger), \
                patch.object(runner.time, "sleep", side_effect=lambda _: self.review_reply(campaign, decision, bad_hash)) as wait:
            self.assertEqual(campaign.run(), expected, campaign.receipt.get("failure"))
        self.assertEqual(wait.call_count, 1)
        self.assertTrue(self.executors[0].closed)
        return campaign

    def test_mechanical_pass_requires_evidence_bound_independent_acceptance(self):
        campaign = self.assert_review_result("ACCEPT", "MECHANISM_PASS")
        self.assertEqual(campaign.receipt["evidence"]["review"]["decision"], "ACCEPT")

    def test_review_can_reject_the_mechanical_pass(self):
        self.assert_review_result("REJECT", "MECHANISM_NO_GO")

    def test_review_can_leave_the_mechanical_pass_inconclusive(self):
        self.assert_review_result("INCONCLUSIVE", "INCONCLUSIVE_INFRA")

    def test_review_receipt_must_bind_the_exact_hashed_request(self):
        campaign = self.assert_review_result("ACCEPT", "INCONCLUSIVE_INFRA", bad_hash=True)
        self.assertIn("review does not bind exact evidence", campaign.receipt["failure"]["reason"])

    def assert_review_artifact_tamper_stops(self, relative):
        campaign = self.fixture()
        def reply_then_tamper(_):
            self.review_reply(campaign)
            (campaign.output / relative).write_text("changed after review request was sealed")
        with patch.object(runner, "compare_captures", return_value=dict(verdict="MECHANISM_PASS")), \
                patch.object(runner.time, "sleep", side_effect=reply_then_tamper):
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")

    def test_ledger_cannot_change_after_review_request_is_hashed(self):
        self.assert_review_artifact_tamper_stops("transport-ledger.json")

    def test_capture_proof_cannot_change_after_review_request_is_hashed(self):
        self.assert_review_artifact_tamper_stops("proof-base.json")

    def test_absent_review_stops_at_original_deadline_without_new_work(self):
        campaign = self.fixture()
        def expire(_):
            campaign.clock.seconds = 60
        with patch.object(runner, "compare_captures", return_value=dict(verdict="MECHANISM_PASS")), \
                patch.object(runner.time, "sleep", side_effect=expire) as wait:
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(wait.call_count, 1)
        self.assertTrue(self.executors[0].closed)
        self.assertEqual(len([r for r in self.executors[0].records if r["name"].startswith("capture-")]), 6)

    def test_same_approval_cannot_launch_again_into_another_output_directory(self):
        campaign = self.fixture()
        self.assertEqual(campaign.run(), "MECHANISM_NO_GO")
        other = runner.Mechanism(campaign.config, campaign.approval, self.root / "second-run", self.config_path,
                                 self.approval_path, self.manifest_path, clock=ManualClock(),
                                 executor_factory=campaign.executor_factory)
        with self.assertRaises(FileExistsError):
            other.run()
        self.assertEqual(len(self.executors), 1)

    def test_live_owned_group_or_unreaped_child_prevents_terminal_pass(self):
        campaign = self.fixture()
        self.cleanup_receipt = dict(active_groups=[99999], direct_children_reaped=False, failed=True)
        with patch.object(runner, "compare_captures", return_value=dict(verdict="MECHANISM_PASS")), \
                patch.object(runner.time, "sleep", side_effect=lambda _: self.review_reply(campaign)):
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertIn("incomplete owned cleanup", campaign.receipt["cleanup_failure"])

    def semantic_compare(self, proofs, fail_hard_gate=False):
        # Keep the actual controller's capture proofs/identities. Only replace
        # the historical reference with this offline fixture's complete cycle.
        stores = [dict(offset=hex(row["offset"]), instruction=row["instruction"])
                  for row in proofs["off"]["common_store_inventory"]]
        reference = dict(schema=1, paths={name: dict(stores=copy.deepcopy(stores), stack_mov_stores=19)
                                         for name in ("cross_word", "within_word")})
        with patch.object(evidence, "_load_reference", return_value=(reference, "f" * 64)):
            ledger = evidence.compare_captures(proofs)
        if fail_hard_gate:
            ledger["checks"]["all_capture_evidence_complete"] = False
        self.semantic_ledger = ledger
        return ledger

    def semantic_reply(self, campaign, mode="complete"):
        request = json.loads((campaign.output / "review-request.json").read_text())
        self.assertEqual(request["deadline_utc"], campaign.approval["deadline_utc"])
        template = request["semantic_review_template"]
        self.assertIs(template["all_replacement_transport_reviewed"], False)
        self.assertTrue(template["bindings"])
        self.assertTrue(all(not b["disposition"] and not b["value_evidence"] and not b["path_evidence"]
                            and b["on_pcs"] == [] for b in template["bindings"]))
        self.review_reply(campaign)
        if mode == "missing-receipt":
            return
        semantic = copy.deepcopy(template)
        if mode != "unfilled-template":
            semantic["all_replacement_transport_reviewed"] = True
            for binding in semantic["bindings"]:
                rows = self.semantic_ledger["store_accounting"][binding["flavor"]]["old_stores"]
                row = next(row for row in rows if row["old_store"]["pc"] == binding["old_pc"])
                replacement = row["new_instruction"]
                binding.update(disposition="retained" if replacement is not None else "removed",
                               on_pcs=[replacement["pc"]] if replacement is not None else [],
                               value_evidence="Synthetic eax retains the same definition throughout this fixture loop.",
                               path_evidence="Every fixture common/refill path and replacement operand was examined.")
        if mode == "missing-binding":
            semantic["bindings"].pop()
        elif mode == "bad-pc":
            semantic["bindings"][0].update(disposition="moved", on_pcs=[-1])
        review_path = campaign.output / "review.json"
        receipt = json.loads(review_path.read_text())
        receipt["semantic_review"] = semantic
        review_path.write_text(json.dumps(receipt))

    def assert_semantic_result(self, mode, expected):
        campaign = self.fixture()
        self.capture_stores.update(on=16, **{"debug-on": 16})
        with patch.object(runner, "compare_captures", side_effect=self.semantic_compare), \
                patch.object(runner.time, "sleep", side_effect=lambda _: self.semantic_reply(campaign, mode)) as wait:
            self.assertEqual(campaign.run(), expected, campaign.receipt.get("failure"))
        self.assertEqual(wait.call_count, 1)
        self.assertEqual(self.semantic_ledger["verdict"], "INCONCLUSIVE_INFRA")
        self.assertEqual([key for key, value in self.semantic_ledger["checks"].items() if value is not True],
                         ["changed_transport_semantically_bound"])
        self.assertEqual(campaign.receipt["previous_performance_verdict"], "NO-GO")
        self.assertTrue(self.executors[0].closed)
        return campaign

    def test_semantic_only_result_needs_complete_bound_acceptance(self):
        campaign = self.assert_semantic_result("complete", "MECHANISM_PASS")
        reviewed_path = campaign.output / "reviewed-transport-ledger.json"
        reviewed = json.loads(reviewed_path.read_text())
        self.assertEqual(reviewed["verdict"], "MECHANISM_PASS")
        self.assertIs(reviewed["checks"]["changed_transport_semantically_bound"], True)
        self.assertEqual(reviewed["semantic_review_required"], [])
        self.assertEqual(campaign.receipt["evidence"]["reviewed_ledger_sha256"], runner.sha256(reviewed_path))
        self.assertEqual(campaign.receipt["evidence"]["verdict"], "INCONCLUSIVE_INFRA")
        self.assertEqual(campaign.receipt["evidence"]["review_verdict"], "MECHANISM_PASS")

    def test_semantic_only_accept_without_semantic_receipt_is_inconclusive(self):
        campaign = self.assert_semantic_result("missing-receipt", "INCONCLUSIVE_INFRA")
        self.assertIn("complete semantic store/operand bindings required", campaign.receipt["failure"]["reason"])

    def test_semantic_only_accept_with_missing_store_binding_is_inconclusive(self):
        campaign = self.assert_semantic_result("missing-binding", "INCONCLUSIVE_INFRA")
        self.assertIn("exact complete unresolved store set", campaign.receipt["failure"]["reason"])

    def test_semantic_only_accept_with_nonexistent_pc_is_inconclusive(self):
        campaign = self.assert_semantic_result("bad-pc", "INCONCLUSIVE_INFRA")
        self.assertIn("nonexistent on instruction", campaign.receipt["failure"]["reason"])

    def test_semantic_review_template_cannot_approve_itself(self):
        campaign = self.assert_semantic_result("unfilled-template", "INCONCLUSIVE_INFRA")
        self.assertIn("accept and cover all replacement transport", campaign.receipt["failure"]["reason"])

    def test_failed_hard_gate_never_enters_semantic_review(self):
        campaign = self.fixture()
        self.capture_stores.update(on=16, **{"debug-on": 16})
        with patch.object(runner, "compare_captures", side_effect=lambda p: self.semantic_compare(p, True)), \
                patch.object(runner.time, "sleep", side_effect=AssertionError("Hard gate cannot wait for review")) as wait:
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        wait.assert_not_called()
        request = json.loads((campaign.output / "review-request.json").read_text())
        self.assertNotIn("semantic_review_template", request)
        self.assertFalse((campaign.output / "reviewed-transport-ledger.json").exists())

    def test_semantic_review_wait_keeps_original_deadline_and_cleanup_reserve(self):
        campaign = self.fixture()
        self.capture_stores.update(on=16, **{"debug-on": 16})
        def expire(_):
            request = json.loads((campaign.output / "review-request.json").read_text())
            self.assertIn("semantic_review_template", request)
            self.assertEqual(request["deadline_utc"], campaign.approval["deadline_utc"])
            campaign.clock.seconds = 60
        with patch.object(runner, "compare_captures", side_effect=self.semantic_compare), \
                patch.object(runner.time, "sleep", side_effect=expire) as wait:
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(wait.call_count, 1)
        self.assertTrue(self.executors[0].closed)
        self.assertFalse((campaign.output / "reviewed-transport-ledger.json").exists())

    def assert_deadline_cleanup(self, campaign):
        self.assertEqual(campaign.receipt["status"], "INCONCLUSIVE_INFRA")
        self.assertEqual(campaign.receipt["failure"]["type"], "DeadlineExpired")
        self.assertTrue(self.executors[0].closed)
        self.assertIs(campaign.receipt["cleanup"]["direct_children_reaped"], True)
        self.assertEqual(campaign.receipt["cleanup"]["active_groups"], [])
        self.assertLessEqual(self.executors[0].cleanup_deadline, campaign.deadline_guard.expired_at + 60)
        captures = [row["name"] for row in self.executors[0].records if row["name"].startswith("capture-")]
        self.assertEqual(captures, ["capture-" + cell for cell in runner.CAPTURE_CELLS])
        self.assertEqual(len(captures), len(set(captures)))

    def test_synchronous_capture_analysis_cannot_overrun_outer_work_deadline(self):
        campaign = self.fixture()
        def expire(*_args):
            campaign.clock.seconds = 59
            campaign.deadline_guard._alarm(signal.SIGALRM, None)
        with patch.object(runner, "analyze_capture", side_effect=expire) as analyze:
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(analyze.call_count, 1)
        self.assert_deadline_cleanup(campaign)

    def test_synchronous_capture_analysis_cannot_reset_review_phase_allowance(self):
        campaign = self.fixture()
        def expire(*_args):
            campaign.budget.last -= 841
            campaign.deadline_guard._alarm(signal.SIGALRM, None)
        with patch.object(runner, "analyze_capture", side_effect=expire) as analyze:
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(analyze.call_count, 1)
        self.assertEqual(campaign.clock.seconds, 7200.0)
        self.assert_deadline_cleanup(campaign)

    def test_synchronous_ledger_comparison_obeys_original_review_phase_deadline(self):
        campaign = self.fixture()
        def expire(_proofs):
            campaign.budget.last -= 841
            campaign.deadline_guard._alarm(signal.SIGALRM, None)
        with patch.object(runner, "compare_captures", side_effect=expire) as compare:
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(compare.call_count, 1)
        self.assertEqual(campaign.clock.seconds, 7200.0)
        self.assert_deadline_cleanup(campaign)

    def test_synchronous_semantic_review_obeys_original_work_deadline(self):
        campaign = self.fixture()
        self.capture_stores.update(on=16, **{"debug-on": 16})
        def expire(_ledger, _review):
            campaign.clock.seconds = 59
            campaign.deadline_guard._alarm(signal.SIGALRM, None)
        with patch.object(runner, "compare_captures", side_effect=self.semantic_compare), \
                patch.object(runner.time, "sleep", side_effect=lambda _: self.semantic_reply(campaign)), \
                patch.object(evidence, "apply_semantic_review", side_effect=expire) as apply:
            self.assertEqual(campaign.run(), "INCONCLUSIVE_INFRA")
        self.assertEqual(apply.call_count, 1)
        self.assertFalse((campaign.output / "reviewed-transport-ledger.json").exists())
        self.assert_deadline_cleanup(campaign)


if __name__ == "__main__":
    unittest.main()
