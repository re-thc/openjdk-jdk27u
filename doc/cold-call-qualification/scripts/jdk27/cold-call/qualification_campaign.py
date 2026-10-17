#!/usr/bin/env python3
"""One-shot repaired cold-call continuation. `plan` is inert; `run` needs separate approval.

Uses existing GNU timeout, installed tools and ordinary detached Git worktrees.
No downloads, remote Git operations, installations, retries, overlays or CI.
"""
import argparse
import copy
import ctypes
from datetime import datetime, timezone
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import random
import re
import select
import shutil
import signal
import statistics
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

from decode_capture import extract

ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
ORIGINAL_STARTED_UTC = "2026-10-17T10:31:01.403725+00:00"
DEADLINE_UTC = "2026-10-17T14:31:01.403725+00:00"
CLEANUP_GRACE_SECONDS = 10
REVIEW_SECONDS = 1200
EXPECTED_FEATURES = frozenset("cds compiler1 compiler2 epsilongc g1gc jfr jni-check jvmti "
                              "management parallelgc serialgc services shenandoahgc vm-structs zgc".split())
REVIEW_CHECKS = {
    "pre-timing": ("all_15_safety_selectors_passed", "six_final_normal_c2_captures_valid",
                   "returning_call_bci684_retained", "enabled_selects_disabled_does_not",
                   "base_default_off_code_and_allocation_equivalence_explained",
                   "complete_hot_and_cold_transport_ledger_reviewed", "full_provenance_verified"),
    "final": ("all_pre_timing_gates_remain_valid", "four_source_profile_diagnostics_match",
              "primary_gain_and_paired_interval_pass", "aa_and_off_base_controls_pass",
              "secondary_and_encoder_protection_pass", "resource_and_method_set_protection_pass",
              "no_protected_interval_demonstrates_slowdown", "inverse_rate_gap_and_limits_reported"),
}
BASE = "01903ba375f94c0ab7f9193d3e36bd30fe663d7e"
CANDIDATE = "75ee82dff6f86e41aad8cedfe947a90a2b9296df"
CODEC = "7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6"
CORPUS_SHA = "dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9"
TARGET = "BlockDecoder::decodeSequencesRolling"
METHOD = "BlockDecoder decodeSequencesRolling"
COMMON = ["--add-modules", "jdk.incubator.vector", "-Xshare:off", "-Xms512m", "-Xmx512m",
          "-XX:+UseG1GC", "-Xbatch", "-XX:-TieredCompilation", "-XX:-UseOnStackReplacement",
          "-XX:CompileThresholdScaling=0.1"]
FOCUSED = ["compiler/regalloc/TestColdCallSpillPolicy.java",
           "compiler/regalloc/TestColdCallSpillPlacement.java",
           "compiler/regalloc/TestColdCallDerivedPointers.java"]
EXISTING = ["compiler/regalloc/TestC2IntPressure.java", "compiler/exceptions/TestSpilling.java"]
PLAN = dict(candidate=CANDIDATE, base=BASE, codec=CODEC, total_seconds=14400, jobs=4,
            builds=["base-release", "candidate-release", "candidate-fastdebug"],
            build_seconds=[2700, 2700, 3600],
            phase_seconds=dict(builds=9540, prepare=300, safety=900, capture=300,
                               timing=1200, resources=600),
            primary_decode_pairs=6, secondary_decode_pairs=3, encode_pairs=3,
            resource_repetitions=3, warmup_seconds=8, windows=5, window_ms=700,
            retries=0, native_version="1.5.7", default_change=False)


def sha(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def dump(path, data):
    path.write_text(json.dumps(data, indent=2) + "\n")


def utc_now():
    return datetime.now(timezone.utc)


class ContinuationClock:
    """The one approved continuation; no deadline/config/CLI override exists."""
    def __init__(self):
        self.deadline_utc = datetime.fromisoformat(DEADLINE_UTC)
        now_mono = time.monotonic()
        remaining = (self.deadline_utc - utc_now()).total_seconds()
        self.deadline_monotonic = now_mono + remaining
        self.started_monotonic = self.deadline_monotonic - PLAN["total_seconds"]
        self.require_open()

    def remaining(self):
        return min(self.deadline_monotonic - time.monotonic(),
                   (self.deadline_utc - utc_now()).total_seconds()) - CLEANUP_GRACE_SECONDS

    def require_open(self):
        require(self.remaining() > 1, "Original immutable UTC deadline exhausted: " + DEADLINE_UTC)

    def record(self):
        return dict(original_started_utc=ORIGINAL_STARTED_UTC, deadline_utc=DEADLINE_UTC,
                    deadline_monotonic=self.deadline_monotonic,
                    started_monotonic=self.started_monotonic,
                    observed_utc=utc_now().isoformat(), remaining_seconds=self.remaining(),
                    cleanup_grace_seconds=CLEANUP_GRACE_SECONDS)


def inventory(directory, clock=None):
    rows = []
    for path in sorted(Path(directory).rglob("*")):
        if clock is not None:
            clock.require_open()
        name = str(path.relative_to(directory))
        if path.is_symlink():
            require(path.exists(), "Broken provenance symlink: " + str(path))
            rows.append(dict(path=name, symlink=os.readlink(path)))
        elif path.is_file():
            rows.append(dict(path=name, bytes=path.stat().st_size, sha256=sha(path)))
    require(rows, "Empty provenance tree: " + str(directory))
    return rows


def spec_values(path):
    keys = {"CC_VERSION_NUMBER", "CXX_VERSION_NUMBER", "CC", "CXX", "BOOT_JDK", "TOOLCHAIN_TYPE",
            "WARNINGS_AS_ERRORS", "JVM_VARIANTS", "JVM_FEATURES_server", "DEBUG_LEVEL", "CFLAGS_CCACHE"}
    result = {}
    for line in Path(path).read_text().splitlines():
        if ":=" in line:
            key, value = line.split(":=", 1)
            if key.strip() in keys:
                result[key.strip()] = value.strip()
    return result


def validate_review(review, request_hash, stage):
    require(type(review.get("schema")) is int and review["schema"] == 1 and review.get("stage") == stage,
            "Wrong review schema/stage")
    require(review.get("request_sha256") == request_hash, "Review does not bind current evidence")
    require(isinstance(review.get("reviewer"), str) and review["reviewer"].strip(), "Missing reviewer")
    require(isinstance(review.get("notes"), str) and review["notes"].strip(), "Missing review explanation")
    checks = review.get("checks", {})
    require(set(checks) == set(REVIEW_CHECKS[stage]) and all(type(v) is bool for v in checks.values()),
            "Missing, extra or nonboolean review checks")
    decision = review.get("decision")
    choices = ("CONTINUE_FIXED_ENSEMBLE", "STOP") if stage == "pre-timing" else ("GO", "NO-GO", "INCONCLUSIVE")
    require(decision in choices, "Invalid review decision")
    if decision in ("CONTINUE_FIXED_ENSEMBLE", "GO"):
        require(all(checks.values()), "An affirmative decision requires every gate")
    return decision


class Campaign:
    def __init__(self, config, output, clock=None, phase_caps=None):
        self.clock = clock if clock is not None else ContinuationClock()
        self.clock.require_open()
        self.config = copy.deepcopy(config)
        self.output = output.resolve()
        # A failed or partial run cannot be resumed or silently overwritten.
        self.output.mkdir(parents=True, exist_ok=False)
        self.started = self.clock.started_monotonic
        self.phase_started = time.monotonic()
        self.phase_caps = dict(PLAN["phase_seconds"])
        if phase_caps:
            self.phase_caps.update(phase_caps)
        self.phase = "prepare"
        self.records = []
        self.review_elapsed = 0.0
        self.active = None
        self.env = os.environ.copy()
        for key in ("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "MAKEFLAGS",
                    "JAVA_HOME", "CLASSPATH", "CC", "CXX", "CFLAGS", "CXXFLAGS", "LDFLAGS"):
            self.env.pop(key, None)
        boot_bin = str(Path(self.config["boot_jdk"]) / "bin")
        paths = self.config["environment"]["PATH"].split(os.pathsep)
        self.config["environment"]["PATH"] = os.pathsep.join([boot_bin, *[p for p in paths if p != boot_bin]])
        self.env.update(self.config["environment"], LC_ALL="C.UTF-8", TZ="UTC")
        self.state = dict(plan=copy.deepcopy(PLAN), config=self.config, status="running", records=self.records,
                          phase_caps=self.phase_caps, outer_clock=self.clock.record(), measurement_started=False)
        self.save()

    def save(self):
        self.state["outer_clock"] = self.clock.record()
        dump(self.output / "campaign.json", self.state)

    def start_phase(self, phase):
        self.clock.require_open()
        self.phase = phase
        self.phase_started = time.monotonic()

    def run(self, name, command, cwd=ROOT, cap=180):
        require(not any(r["name"] == name for r in self.records), "No command retries: " + name)
        remaining = min(self.clock.remaining(),
                        self.phase_caps[self.phase] - (time.monotonic() - self.phase_started), cap)
        require(remaining > 1, "Frozen time budget exhausted")
        command = list(map(str, command))
        log = self.output / (name + ".log")
        row = dict(name=name, phase=self.phase, command=command, cwd=str(cwd),
                   timeout_seconds=int(remaining), status="started")
        self.records.append(row)
        self.save()
        start = time.monotonic()
        # GNU timeout supplies process-group termination; wait4 provides a
        # per-command high-water RSS without installing GNU time or a sampler.
        with log.open("w") as stream:
            process = subprocess.Popen(["timeout", "--kill-after=10s", str(int(remaining)) + "s",
                                        *command], cwd=cwd, env=self.env, stdout=stream,
                                        stderr=subprocess.STDOUT, start_new_session=True)
            self.active = process
            try:
                _, status, usage = os.wait4(process.pid, 0)
                process.returncode = os.waitstatus_to_exitcode(status)
            except BaseException:
                # This session belongs only to this command. Never touch PID 1,
                # unrelated workers, cgroups or a previous host's processes.
                cleanup_deadline = time.monotonic() + CLEANUP_GRACE_SECONDS
                try:
                    os.killpg(process.pid, signal.SIGTERM)
                except ProcessLookupError:
                    pass
                try:
                    process.wait(timeout=max(0.001, cleanup_deadline - time.monotonic() - 1))
                except subprocess.TimeoutExpired:
                    try:
                        os.killpg(process.pid, signal.SIGKILL)
                    except ProcessLookupError:
                        pass
                    process.wait(timeout=max(0.001, cleanup_deadline - time.monotonic()))
                row.update(status="interrupted", log_sha256=sha(log))
                self.save()
                raise
            finally:
                self.active = None
        row.update(status="finished", exit_code=process.returncode,
                   wall_seconds=time.monotonic() - start, peak_rss_kib=usage.ru_maxrss,
                   cpu_seconds=usage.ru_utime + usage.ru_stime, log_sha256=sha(log))
        self.save()
        require(process.returncode == 0, "Command failed; no retry: " + name)
        return log.read_text(errors="replace")

    def flag(self, cell):
        return [] if cell in ("base", "default") else ["-XX:+UnlockDiagnosticVMOptions",
                "-XX:" + ("+" if cell == "on" else "-") + "UseColdCallSpillDeferral"]

    def java(self, cell, debug=False):
        kind = "candidate-fastdebug" if debug else ("base-release" if cell == "base" else "candidate-release")
        return self.images[kind] / "bin/java"

    def build(self):
        c = self.config
        source = Path(c["jdk_source"]).resolve()
        require(not self.run("source-clean", ["git", "status", "--porcelain"], cwd=source).strip(),
                "JDK bundle checkout must be committed and clean")
        source_head = self.run("source-head", ["git", "rev-parse", "HEAD"], cwd=source).strip()
        manifest = source / "doc/cold-call-qualification/SOURCE-MANIFEST.json"
        bundle = json.loads(manifest.read_text())
        require((bundle["base"], bundle["candidate"], bundle["codec"]) == (BASE, CANDIDATE, CODEC),
                "Source bundle has different fixed revisions")
        for item in bundle["files"]:
            require(sha(ROOT / item["path"]) == item["sha256"], "Copied source differs: " + item["path"])
        self.state["bundle"] = dict(jdk_commit=source_head, manifest_sha256=sha(manifest))
        self.state["runner_commit"] = self.run("runner-head", ["git", "rev-parse", "HEAD"]).strip()
        clean = self.run("runner-clean", ["git", "status", "--porcelain"])
        require(not clean.strip(), "Runner checkout must be committed and clean")
        self.run("codec-pin", ["git", "diff", "--exit-code", CODEC, "--", "src/main/java",
                              "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"])
        self.state["host"] = dict(platform=platform.platform(), affinity=sorted(os.sched_getaffinity(0)),
                                  cpu=Path("/proc/cpuinfo").read_text(),
                                  memory_limit=Path("/sys/fs/cgroup/memory.max").read_text(),
                                  cpu_limit=Path("/sys/fs/cgroup/cpu.max").read_text())
        require(platform.system() == "Linux" and platform.machine() == "x86_64", "This bounded proposal is Linux x86-64")
        for key in ("boot_jdk", "jtreg", "junit", "cc", "cxx"):
            require(Path(c[key]).exists(), "Missing installed prerequisite: " + key)
        for arg in c["configure"]:
            require(arg.startswith(("--with-toolchain-path=", "--with-extra-ldflags=", "--with-freetype",
                                    "--x-includes=", "--x-libraries=", "--with-cups-include=",
                                    "--with-fontconfig-include=", "--with-alsa-")), "Unreviewed configure option: " + arg)
        self.start_phase("builds")
        self.images = {}
        self.worktrees = {}
        for kind, cap in zip(PLAN["builds"], PLAN["build_seconds"]):
            revision = BASE if kind.startswith("base") else CANDIDATE
            tree = self.output / kind
            self.run(kind + "-checkout", ["git", "worktree", "add", "--detach", tree, revision], cwd=source)
            actual = self.run(kind + "-head", ["git", "rev-parse", "HEAD"], cwd=tree).strip()
            require(actual == revision, "Wrong compiler commit")
            level = "fastdebug" if kind.endswith("fastdebug") else "release"
            options = ["--with-conf-name=qualification", "--with-jobs=4", "--with-jvm-variants=server",
                       "--with-debug-level=" + level, "--with-boot-jdk=" + c["boot_jdk"],
                       "--with-jtreg=" + c["jtreg"], *c["configure"]]
            self.run(kind + "-configure", ["bash", "configure", *options], cwd=tree, cap=180)
            self.run(kind + "-images", ["make", "CONF=qualification", "JOBS=4", "images"], cwd=tree, cap=cap)
            image = tree / "build/qualification/images/jdk"
            self.images[kind] = image
            self.worktrees[kind] = tree
            self.run(kind + "-version", [image / "bin/java", "-version"])
            self.state.setdefault("images", {})[kind] = dict(commit=revision,
                libjvm_sha256=sha(image / "lib/server/libjvm.so"),
                spec_sha256=sha(tree / "build/qualification/spec.gmk"),
                release=(image / "release").read_text())
        self.save()

    def verify_images(self):
        images, specs = {}, {}
        for kind in PLAN["builds"]:
            self.clock.require_open()
            tree, image = self.worktrees[kind], self.images[kind]
            require(not self.run(kind + "-source-clean", ["git", "status", "--porcelain"], cwd=tree).strip(),
                    "Build source/index changed: " + kind)
            spec_path = tree / "build/qualification/spec.gmk"
            spec = spec_values(spec_path)
            require(spec["CC_VERSION_NUMBER"] == spec["CXX_VERSION_NUMBER"] == "16.2.0",
                    "Actual build compiler must remain GCC/G++ 16.2.0")
            require(spec["TOOLCHAIN_TYPE"] == "gcc" and spec["CC"] == self.config["cc"] and
                    spec["CXX"] == self.config["cxx"], "Configured and native-test compilers differ")
            require(spec["WARNINGS_AS_ERRORS"] == "true" and spec["JVM_VARIANTS"] == "server",
                    "Ordinary server/warnings policy changed")
            require(spec["BOOT_JDK"] == self.config["boot_jdk"], "Actual boot JDK changed")
            require(spec["DEBUG_LEVEL"] == ("fastdebug" if kind.endswith("fastdebug") else "release"),
                    "Unexpected image debug level")
            require(frozenset(spec["JVM_FEATURES_server"].split()) == EXPECTED_FEATURES,
                    "Restricted or different ordinary server VM features")
            require(not spec.get("CFLAGS_CCACHE", ""), "Unexpected compiler cache")
            rows = inventory(image, self.clock)
            manifest = self.output / (kind + "-full-image.json")
            dump(manifest, rows)
            shutil.copyfile(spec_path, self.output / (kind + "-spec.gmk"))
            specs[kind] = spec
            images[kind] = dict(source=self.state["images"][kind]["commit"], path=str(image), spec=spec,
                spec_sha256=sha(spec_path), entries=len(rows), full_image_manifest_sha256=sha(manifest),
                release=(image / "release").read_text(), libjvm_sha256=sha(image / "lib/server/libjvm.so"))
        require(specs["base-release"] == specs["candidate-release"], "Release specifications differ")
        repair_hashes = {sha(self.worktrees[k] / "src/hotspot/share/runtime/javaThread.inline.hpp")
                         for k in PLAN["builds"]}
        require(repair_hashes == {"3ac2155d4523db34c42ee1a6e014d8ac5297d4842cb2284eb6d6c62969af097f"},
                "Exact common GCC prerequisite source differs")
        dump(self.output / "full-image-provenance.json", images)
        tools = {key: dict(path=self.config[key], sha256=sha(self.config[key])) for key in ("cc", "cxx", "junit")}
        boot = Path(self.config["boot_jdk"])
        tools["boot_jdk"] = dict(release=(boot / "release").read_text(), java_sha256=sha(boot / "bin/java"))
        require(re.search(r'JAVA_VERSION="27(?:[.+-][^"]*)?"', tools["boot_jdk"]["release"]),
                "Boot JDK major changed")
        jtreg_version = self.run("installed-jtreg-version", [Path(self.config["jtreg"]) / "bin/jtreg", "-version"])
        require(re.search(r"jtreg(?:\s+version)?\s+8\.3(?:\D|$)", jtreg_version, re.I), "Installed jtreg is not 8.3")
        tools["jtreg_version"] = jtreg_version
        tools["jtreg_launcher_sha256"] = sha(Path(self.config["jtreg"]) / "bin/jtreg")
        dump(self.output / "installed-tool-provenance.json", tools)
        self.state["image_provenance_sha256"] = sha(self.output / "full-image-provenance.json")
        self.save()

    def verify_prepared(self):
        classes = inventory(self.classes, self.clock)
        require(all(p["path"].endswith(".class") for p in classes), "Unexpected compiled-class product")
        dump(self.output / "full-compiled-classes.json", classes)
        dump(self.output / "full-production-sources.json", inventory(ROOT / "src/main/java", self.clock))
        frames = json.loads((self.prepared / "frames.json").read_text())
        require(frames["native_version"] == "1.5.7" and len(frames["rows"]) == 57, "Wrong frame set")
        for row in frames["rows"]:
            require(sha(self.corpora / row["source"]) == row["source_sha256"] and
                    sha(self.corpora / row["frame"]) == row["frame_sha256"], "Prepared frame identity changed")
        self.state["full_provenance"] = dict(images_sha256=self.state["image_provenance_sha256"],
            classes_sha256=sha(self.output / "full-compiled-classes.json"),
            production_sources_sha256=sha(self.output / "full-production-sources.json"),
            source_factory_sha256=sha(ROOT / "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"),
            frames_sha256=sha(self.prepared / "frames.json"), native_probe_sha256=sha(self.native),
            helper_library_sha256=sha(self.native_dir / "libColdCallSpillPolicy.so"),
            tools_sha256=sha(self.output / "installed-tool-provenance.json"))
        self.save()

    def verify_frozen(self):
        if "diagnostic_manifest_sha256" in self.state:
            self.verify_diagnostics()
        p = self.state["full_provenance"]
        for name, key in (("full-image-provenance.json", "images_sha256"),
                          ("full-compiled-classes.json", "classes_sha256"),
                          ("full-production-sources.json", "production_sources_sha256"),
                          ("installed-tool-provenance.json", "tools_sha256")):
            require(sha(self.output / name) == p[key], "Sealed provenance inventory changed: " + name)
        source_manifest = Path(self.config["jdk_source"]) / "doc/cold-call-qualification/SOURCE-MANIFEST.json"
        require(sha(source_manifest) == self.state["bundle"]["manifest_sha256"], "Source bundle manifest changed")
        for item in json.loads(source_manifest.read_text())["files"]:
            require(sha(ROOT / item["path"]) == item["sha256"], "Copied qualification source changed")
        supplied = self.state["supplied_config"]
        require(sha(supplied["path"]) == supplied["sha256"], "Supplied host configuration changed")
        image_provenance = json.loads((self.output / "full-image-provenance.json").read_text())
        for row in self.records:
            require(row["status"] == "finished" and row["exit_code"] == 0 and
                    sha(self.output / (row["name"] + ".log")) == row["log_sha256"],
                    "Command evidence changed or incomplete: " + row["name"])
        for kind, image in self.images.items():
            manifest = self.output / (kind + "-full-image.json")
            frozen = image_provenance[kind]
            require(sha(manifest) == frozen["full_image_manifest_sha256"] and
                    sha(self.worktrees[kind] / "build/qualification/spec.gmk") == frozen["spec_sha256"] and
                    sha(self.output / (kind + "-spec.gmk")) == frozen["spec_sha256"],
                    "Image inventory or generated spec changed: " + kind)
            require(inventory(image, self.clock) == json.loads(manifest.read_text()),
                    "Image changed after provenance: " + kind)
        require(inventory(self.classes, self.clock) == json.loads((self.output / "full-compiled-classes.json").read_text()),
                "Prepared classes changed")
        require(inventory(ROOT / "src/main/java", self.clock) ==
                json.loads((self.output / "full-production-sources.json").read_text()), "Production source changed")
        require(sha(self.prepared / "frames.json") == p["frames_sha256"] and
                sha(ROOT / "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java") == p["source_factory_sha256"] and
                sha(self.native) == p["native_probe_sha256"] and
                sha(self.native_dir / "libColdCallSpillPolicy.so") == p["helper_library_sha256"],
                "Prepared manifest/native code changed")
        for name, item in self.state["inputs"].items():
            require(sha(self.corpora / name) == item["sha256"], "Frozen input changed: " + name)
        tools = json.loads((self.output / "installed-tool-provenance.json").read_text())
        for key in ("cc", "cxx", "junit"):
            require(sha(self.config[key]) == tools[key]["sha256"], "Installed tool changed: " + key)
        boot = Path(self.config["boot_jdk"])
        require((boot / "release").read_text() == tools["boot_jdk"]["release"] and
                sha(boot / "bin/java") == tools["boot_jdk"]["java_sha256"] and
                sha(Path(self.config["jtreg"]) / "bin/jtreg") == tools["jtreg_launcher_sha256"],
                "Installed boot JDK/jtreg launcher changed")

    def review_gate(self, stage):
        self.clock.require_open()
        self.verify_frozen()
        if stage == "pre-timing":
            require(len(self.state.get("decoder_proofs", {})) == 6, "Missing six pre-timing captures")
            require(len([r for r in self.records if r["name"].endswith(("-focused", "-existing"))]) == 5 and
                    any(r["name"] == "candidate-fastdebug-handshake-prerequisite" for r in self.records),
                    "Missing fixed safety invocations")
        else:
            self.require_complete()
        request = self.output / (stage + "-review-request.json")
        self.save()
        dump(request, dict(stage=stage, deadline_utc=DEADLINE_UTC, manifest_sha256=sha(self.output / "campaign.json"),
                           evidence=self.state, checks=REVIEW_CHECKS[stage]))
        request_hash = sha(request)
        template = self.output / (stage + "-review.template.json")
        dump(template, dict(schema=1, stage=stage, request_sha256=request_hash, reviewer="", notes="",
                            checks={key: False for key in REVIEW_CHECKS[stage]},
                            decision="STOP" if stage == "pre-timing" else "INCONCLUSIVE"))
        self.state["status"] = "awaiting-" + stage + "-review"
        self.save()
        print("Review " + str(request) + ". Copy/edit " + str(template) +
              "; submit the completed review JSON path on stdin. Deadline remains " + DEADLINE_UTC, flush=True)
        wait = min(REVIEW_SECONDS - self.review_elapsed, self.clock.remaining() - 180)
        require(wait > 0, "No review/cleanup budget remains")
        began = time.monotonic()
        ready, _, _ = select.select([sys.stdin], [], [], wait)
        self.review_elapsed += time.monotonic() - began
        require(ready, "Review deadline exhausted")
        # select+readline could block forever on a partial pipe write. Read only
        # currently available bytes and fail closed unless a full line arrived.
        data = os.read(sys.stdin.fileno(), 65536)
        require(data.endswith(b"\n") and data.count(b"\n") == 1, "Incomplete review submission")
        submitted = data.decode("utf-8").strip()
        require(submitted, "Review EOF/empty submission; stop")
        review_path = Path(submitted).resolve()
        require(review_path.is_file(), "Review must be a regular JSON file")
        review = json.loads(review_path.read_text())
        decision = validate_review(review, request_hash, stage)
        if stage == "final" and decision == "GO":
            require(all(self.state["automatic_gates"].values()), "Numerical/completeness gates reject GO")
        self.clock.require_open()
        self.verify_frozen()
        destination = self.output / (stage + "-accepted-review.json")
        dump(destination, review)
        self.state.setdefault("reviews", {})[stage] = dict(decision=decision, sha256=sha(destination),
            request_sha256=request_hash, wait_seconds=self.review_elapsed)
        self.save()
        require(decision != "STOP", "Owner stopped before timing")
        return decision

    def prepare(self):
        self.start_phase("prepare")
        sources = sorted((ROOT / "src/main/java").rglob("*.java"))
        corpus = self.output / "source.bin"
        corpus.write_bytes(b"".join(p.read_bytes() + b"\n" for p in sources))
        require(len(sources) == 37 and sha(corpus) == CORPUS_SHA, "Pinned source corpus changed")
        self.prepared = self.output / "prepared"
        self.run("prepare-57-frames", ["python3", HERE / "qualify_decoder.py", "prepare",
            "--java-home", self.images["candidate-release"], "--junit", self.config["junit"],
            "--source-corpus", corpus, "--output", self.prepared])
        frames = json.loads((self.prepared / "frames.json").read_text())
        require(frames["native_version"] == PLAN["native_version"] and len(frames["rows"]) == 57,
                "Native version/frame coverage mismatch")
        self.classes = self.prepared / "classes"
        self.run("compile-probe", [self.images["candidate-release"] / "bin/javac",
            "--add-modules", "jdk.incubator.vector", "-cp", self.classes, "-d", self.classes,
            ROOT / "scripts/jdk27/CodecProbe.java"])
        self.native = self.output / "native-probe"
        self.run("compile-native-probe", [self.config["cc"], "-O3", ROOT / "scripts/jdk27/native-probe.c",
                                          "-lzstd", "-o", self.native])
        native_version = self.run("native-version", [self.native, "--version"])
        require("libzstd 1.5.7 (headers 1.5.7)" in native_version, "Native benchmark header/library version mismatch")
        native_dir = self.output / "native-test"
        native_dir.mkdir()
        test_source = self.worktrees["candidate-release"] / "test/hotspot/jtreg/compiler/regalloc/libColdCallSpillPolicy.cpp"
        self.run("compile-native-policy", [self.config["cxx"], "-std=c++17", "-fPIC", "-shared",
            "-Wall", "-Wextra", "-Werror", "-I" + str(self.images["candidate-release"] / "include"),
            "-I" + str(self.images["candidate-release"] / "include/linux"), test_source,
            "-o", native_dir / "libColdCallSpillPolicy.so"])
        self.native_dir = native_dir
        self.corpora = self.prepared / "corpora"
        rng = random.Random(20261017)
        block = bytes(rng.randrange(256) for _ in range(16384))
        (self.corpora / "periodic.bin").write_bytes(block * 256)
        (self.corpora / "incompressible.bin").write_bytes(bytes(rng.randrange(256) for _ in range(1 << 20)))
        zstd = ctypes.CDLL("libzstd.so.1")
        zstd.ZSTD_compressBound.argtypes = [ctypes.c_size_t]
        zstd.ZSTD_compressBound.restype = ctypes.c_size_t
        zstd.ZSTD_compress.argtypes = [ctypes.c_void_p, ctypes.c_size_t, ctypes.c_void_p, ctypes.c_size_t, ctypes.c_int]
        zstd.ZSTD_compress.restype = ctypes.c_size_t
        zstd.ZSTD_isError.argtypes = [ctypes.c_size_t]
        for name in ("periodic", "incompressible"):
            raw = (self.corpora / (name + ".bin")).read_bytes()
            buffer = ctypes.create_string_buffer(zstd.ZSTD_compressBound(len(raw)))
            size = zstd.ZSTD_compress(buffer, len(buffer), raw, len(raw), 1)
            require(not zstd.ZSTD_isError(size), "Native compression failed")
            (self.corpora / (name + ".l1.zst")).write_bytes(buffer.raw[:size])
        self.state["inputs"] = {p.name: dict(bytes=p.stat().st_size, sha256=sha(p))
                                for p in self.corpora.iterdir() if p.is_file()}
        self.state["tool_versions"] = {
            key: self.run("version-" + key, [self.config[key], "--version"]) for key in ("cc", "cxx")}
        self.save()

    def safety(self):
        self.start_phase("safety")
        for kind in PLAN["builds"]:
            tree, image = self.worktrees[kind], self.images[kind]
            suites = [] if kind.startswith("base") else [("focused", FOCUSED, False)]
            tests = EXISTING + (["compiler/regalloc/TestVerifyRegisterAllocator.java"] if kind.endswith("fastdebug") else [])
            suites.append(("existing", tests, not kind.startswith("base")))
            for suite, tests, enabled in suites:
                stem = kind + "-" + suite
                options = ["-vmoption:-XX:+UnlockDiagnosticVMOptions", "-vmoption:-XX:+UseColdCallSpillDeferral"] if enabled else []
                output = self.run(stem, [Path(self.config["jtreg"]) / "bin/jtreg", "-conc:1", "-othervm",
                    "-jdk:" + str(image), "-nativepath:" + str(self.native_dir),
                    "-w:" + str(self.output / (stem + "-work")), "-r:" + str(self.output / (stem + "-report")),
                    *options, *[tree / "test/hotspot/jtreg" / test for test in tests]], cap=300)
                require(re.search(r"Test results: passed: " + str(len(tests)) + r"(?:\s|$)", output),
                        "Missing exact focused test count: " + stem)

        # The exact common-source prerequisite gets one focused behavioral check.
        tree, image = self.worktrees["candidate-fastdebug"], self.images["candidate-fastdebug"]
        tests = ["runtime/handshake/AsyncHandshakeWalkStackTest.java",
                 "runtime/Unsafe/InternalErrorTest.java"]
        stem = "candidate-fastdebug-handshake-prerequisite"
        output = self.run(stem, [Path(self.config["jtreg"]) / "bin/jtreg", "-conc:1", "-othervm",
            "-jdk:" + str(image), "-w:" + str(self.output / (stem + "-work")),
            "-r:" + str(self.output / (stem + "-report")),
            *[tree / "test/hotspot/jtreg" / test for test in tests]], cap=300)
        require(re.search(r"Test results: passed: 2(?:\s|$)", output),
                "Missing exact handshake prerequisite test count")

    def decoder_command(self, cell, stem, debug=False, assembly=False, memory=False):
        flags = [*COMMON, *self.flag(cell), "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                 "-XX:LogFile=" + str(self.output / (stem + ".xml"))]
        if debug:
            flags += ["-XX:+VerifyRegisterAllocator"]
        if assembly:
            directive = self.output / (stem + "-directives.json")
            item = dict(match="dev.jzstd.internal." + TARGET, PrintAssembly=True)
            if debug:
                item["c2"] = dict(TraceSpilling=True)
            dump(directive, [item])
            flags += ["-XX:CompilerDirectivesFile=" + str(directive)]
        if memory:
            flags += ["-XX:CompileCommand=MemStat,dev.jzstd.internal.BlockDecoder::decodeSequencesRolling,print",
                      "-XX:+PrintCompilerMemoryStatisticsAtExit", "-XX:+CITime"]
        return [self.java(cell, debug), *flags, "-cp", self.classes,
                "dev.jzstd.DecoderQualification", "check", self.corpora, "32"]

    def decoder_proof(self, stem, log, cell, debug=False, assembly=False):
        require("PASS frames=57 rounds=32" in log, "Decoder correctness marker missing")
        xml = ET.parse(self.output / (stem + ".xml"))
        nmethods = [n.attrib for n in xml.iter("nmethod") if METHOD in n.get("method", "") and
                    n.get("compiler") == "c2" and n.get("compile_kind", "normal") == "normal"]
        require(nmethods, "No normal-entry production C2 parser")
        tasks = [t for t in xml.iter("task") if METHOD in t.get("method", "")]
        require(not any(list(t.iter("failure")) for t in tasks), "Target compilation bailout")
        proof = dict(nmethods=nmethods, tasks=[dict(t.attrib, regalloc=[n.attrib for n in t.iter("regalloc")],
                     done=[n.attrib for n in t.iter("task_done")]) for t in tasks])
        if assembly:
            header, address, code = extract(log, TARGET)
            header_pos = log.rfind(header)
            tail = log[header_pos:].split("[/MachCode]", 1)[0]
            compile_id = re.match(r"Compiled method \(c2\)\s+\d+\s+(\d+)\s+", header)[1]
            require(compile_id == nmethods[-1]["compile_id"], "Assembly/XML compile-ID mismatch")
            require(not any(n.get("compile_id") == compile_id for n in xml.iter("make_not_entrant")),
                    "Final parser compilation became nonentrant")
            require(re.search(r"\{static_call\}.{0,750}?\*invokestatic readPartialLong.{0,750}?"
                              r"BlockDecoder::decodeSequencesRolling@684", tail, re.S),
                    "Returning in-loop readPartialLong call missing")
            proof.update(header=header, compile_id=compile_id, main_code_bytes=len(code))
            if debug:
                begin = log.rfind("CCINITIAL ", 0, header_pos)
                require(begin >= 0, "Missing final-compile initial-allocation marker")
                proof["deferred"] = len(re.findall(r"^CCDEFER ", log[begin:header_pos], re.M))
                require((proof["deferred"] > 0) == (cell == "on"), "Intended production activation missing/unexpected")
            self.run(stem + "-disassemble", ["python3", HERE / "decode_capture.py", self.output / (stem + ".log"),
                     self.output / (stem + ".asm"), "--target", TARGET])
        self.state.setdefault("decoder_proofs", {})[stem] = proof
        self.save()
        return proof

    def capture(self):
        self.start_phase("capture")
        for debug, cells in ((False, ("base", "default", "off", "on")), (True, ("off", "on"))):
            for cell in cells:
                stem = "capture-" + ("debug-" if debug else "release-") + cell
                log = self.run(stem, self.decoder_command(cell, stem, debug, assembly=True))
                self.decoder_proof(stem, log, cell, debug, assembly=True)

    def timing(self):
        require(self.state.get("reviews", {}).get("pre-timing", {}).get("decision") == "CONTINUE_FIXED_ENSEMBLE",
                "Accepted evidence-bound pre-timing review required")
        require("timing" not in self.state, "Timing cannot be repeated or resumed")
        self.state["measurement_started"] = True
        self.start_phase("timing")
        rows = []
        self.state["timing"] = rows
        for mode in ("decode", "encode"):
            for corpus in ("source", "periodic", "incompressible"):
                pairs = 6 if mode == "decode" and corpus == "source" else 3
                cells = ["base", "off", "on"] + (["control"] if mode == "decode" and corpus == "source" else [])
                cells += ["native"] if mode == "decode" else []
                for pair in range(pairs):
                    order = cells[pair % len(cells):] + cells[:pair % len(cells)]
                    if pair % 2:
                        order = list(reversed(order))
                    for cell in order:
                        stem = f"timing-{mode}-{corpus}-{pair}-{cell}"
                        source = self.corpora / (corpus + ".bin")
                        frame = self.corpora / (corpus + ".l1.zst") if mode == "decode" else self.output / (stem + ".zst")
                        before = sha(frame) if mode == "decode" else None
                        program = [self.native] if cell == "native" else [self.java(cell), *COMMON, *self.flag(cell),
                            "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                            "-XX:LogFile=" + str(self.output / (stem + ".xml")),
                            "-Dprobe.warmup=8", "-Dprobe.compilerStats=true", "-cp", self.classes, "CodecProbe"]
                        log = self.run(stem, [*program, mode, source, "1", frame], cap=35)
                        rate = re.search(r"median=([\d.]+) MB/s", log)
                        require(rate is not None, "Missing throughput result")
                        row = dict(mode=mode, corpus=corpus, pair=pair, cell=cell,
                                   median_MB_s=float(rate[1]), frame_sha256=sha(frame), source_sha256=sha(source))
                        require(before is None or before == row["frame_sha256"], "Read-only timed frame changed")
                        if cell != "native":
                            comp = re.search(r"COMPILER warmup_ms=(\d+) measured_ms=(\d+) boundary_uptime_ms=(\d+)", log)
                            require(comp is not None, "Missing compilation stability counters")
                            row["measured_compilation_ms"] = int(comp[2])
                            require(int(comp[2]) <= 10, "Unsettled timed compilation; no retry")
                            xml = ET.parse(self.output / (stem + ".xml"))
                            boundary = int(comp[3]) / 1000
                            names = METHOD if mode == "decode" else "BlockCompressor parseFastCarriedSeven"
                            compiled = [n for n in xml.iter("nmethod") if names in n.get("method", "") and
                                        n.get("compiler") == "c2" and n.get("compile_kind", "normal") == "normal"]
                            row["target_nmethods"] = [n.attrib for n in compiled]
                            # Source exercises the parser. Raw/RLE controls may
                            # legitimately bypass it and are not activation claims.
                            if corpus == "source":
                                require(compiled and float(compiled[-1].get("stamp")) < boundary - 0.1,
                                        "Primary target not C2 before timing boundary")
                                selected_id = compiled[-1].get("compile_id")
                                require(not any(n.get("compile_id") == selected_id for n in xml.iter("make_not_entrant")),
                                    "Timed target was invalidated near/during measurement")
                        rows.append(row)
                        self.save()
                hashes = {r["frame_sha256"] for r in rows if r["mode"] == mode and r["corpus"] == corpus}
                require(len(hashes) == 1, "Frame bytes differ across variants/repetitions")

    def resources(self):
        self.start_phase("resources")
        # The parser process measures C2 itself. A full fresh javac of the pinned
        # production sources supplies one ordinary compiler-heavy protection case.
        sources = sorted((ROOT / "src/main/java").rglob("*.java"))
        reference_classes = None
        for repeat in range(3):
            cells = ["base", "off", "on"]
            cells = cells[repeat:] + cells[:repeat]
            for cell in cells:
                stem = f"resource-parser-{repeat}-{cell}"
                log = self.run(stem, self.decoder_command(cell, stem, memory=True))
                self.decoder_proof(stem, log, cell)
                proof = self.state["decoder_proofs"][stem]
                final_id = proof["nmethods"][-1]["compile_id"]
                peaks = [dict(compile_id=m[1], result=m[2], peak=int(m[3])) for m in re.finditer(
                    r"c2 \((\d+)\) \(([^)]+)\) Arena usage [^\r\n]*BlockDecoder::decodeSequencesRolling[^\r\n]*: Total Usage: (\d+)", log)]
                final_peaks = [p["peak"] for p in peaks if p["compile_id"] == final_id and p["result"] == "ok"]
                require(len(final_peaks) == 1, "No unambiguous final-compile parser arena peak")
                self.records[-1]["parser_arena_peaks"] = peaks
                self.records[-1]["parser_peak_arena_chunk_capacity_bytes"] = final_peaks[0]
                final_task = next(t for t in proof["tasks"] if t["compile_id"] == final_id)
                require(final_task["done"] and final_task["done"][-1].get("success") == "1", "Parser task did not succeed")
                self.records[-1]["final_parser_compile_seconds"] = (
                    float(final_task["done"][-1]["stamp"]) - float(final_task["stamp"]))
                stem = f"resource-javac-{repeat}-{cell}"
                classes = self.output / (stem + "-classes")
                image = self.images["base-release" if cell == "base" else "candidate-release"]
                flags = ["-J" + f for f in [*COMMON[2:], *self.flag(cell), "-XX:+UnlockDiagnosticVMOptions",
                         "-XX:+CITime", "-XX:CompileCommand=MemStat,com.sun.tools.javac.*::*,print",
                         "-XX:+LogCompilation", "-XX:LogFile=" + str(self.output / (stem + ".xml")),
                         "-XX:+PrintCompilerMemoryStatisticsAtExit"]]
                log = self.run(stem, [image / "bin/javac", *flags, "--add-modules", "jdk.incubator.vector",
                                      "-d", classes, *sources], cap=90)
                require("Arena usage com/sun/tools/javac" in log, "No C2 javac arena statistics")
                xml = ET.parse(self.output / (stem + ".xml"))
                self.records[-1]["jit_nmethods"] = [n.attrib for n in xml.iter("nmethod")]
                self.records[-1]["jit_tasks"] = [dict(t.attrib,
                    done=[n.attrib for n in t.iter("task_done")],
                    failures=[n.attrib for n in t.iter("failure")],
                    allocation=[n.attrib for n in t.iter("regalloc")]) for t in xml.iter("task")]
                peaks = [int(x) for x in re.findall(r"c2 .*Arena usage com/sun/tools/javac.*?: Total Usage: (\d+)", log)]
                require(peaks, "Missing per-task javac arena peaks")
                self.records[-1]["javac_peak_arena_chunk_capacity_bytes"] = max(peaks)
                citime = re.findall(r"Total compilation time\s*:\s*([\d.]+)\s*s", log)
                require(len(citime) == 1, "Missing/ambiguous javac CITime")
                self.records[-1]["javac_citime_seconds"] = float(citime[0])
                products = {str(p.relative_to(classes)): sha(p) for p in classes.rglob("*.class")}
                require(products and (reference_classes is None or products == reference_classes), "javac class output changed")
                reference_classes = products
                self.records[-1]["emitted_classes_sha256"] = hashlib.sha256(
                    json.dumps(products, sort_keys=True).encode()).hexdigest()
                self.save()

    def require_complete(self):
        require(len(self.state.get("timing", [])) == 81, "Fixed 81-process timing ensemble incomplete")
        require(len([r for r in self.records if r["name"].startswith("timing-")]) == 81,
                "Timing process count changed")
        require(len([r for r in self.records if r["name"].startswith("resource-")]) == 18,
                "Fixed 18-resource ensemble incomplete")
        self.verify_diagnostics()
        self.state["automatic_gates"] = self.numerical_gates()
        self.save()

    def verify_diagnostics(self):
        diagnostic = self.output / "source-profile-diagnostics/campaign.json"
        require(sha(diagnostic) == self.state["diagnostic_manifest_sha256"], "Diagnostic manifest changed")
        parent = self.output / "diagnostic-parent.json"
        parent_hash = self.state["diagnostic_parent_snapshot_sha256"]
        require(sha(parent) == parent_hash, "Diagnostic parent snapshot changed")
        proof = json.loads(diagnostic.read_text())
        require(proof["main_manifest_sha256"] == parent_hash, "Diagnostics belong to a different parent")
        names = {"release-off", "release-on", "fastdebug-off", "fastdebug-on"}
        require(proof["status"] == "profile-capture-complete-review-required" and set(proof["proofs"]) == names and
                all(p["diagnostic_rates_excluded"] is True for p in proof["proofs"].values()),
                "Four fixed profile diagnostics incomplete")
        require(proof["outer_clock"]["deadline_utc"] == DEADLINE_UTC, "Diagnostic deadline changed")
        require(len(proof["records"]) == 8 and {r["name"] for r in proof["records"]} ==
                names | {name + "-objdump" for name in names}, "Diagnostic command count/cells changed")
        for row in proof["records"]:
            require(row["status"] == "finished" and row["exit_code"] == 0 and
                    sha(diagnostic.parent / (row["name"] + ".log")) == row["log_sha256"],
                    "Diagnostic evidence incomplete/changed")

    def numerical_gates(self):
        comparisons = self.state["comparisons"]
        primary = comparisons["decode-source"]
        gates = dict(primary_gain=primary["on_over_off"] >= 1.03 and
                     primary["on_over_off_paired_bootstrap_95_interval"][0] > 1.0,
                     aa_control=0.98 <= primary["control_over_off"] <= 1.02 and
                     primary["control_over_off_paired_bootstrap_95_interval"][0] <= 1.0 <=
                     primary["control_over_off_paired_bootstrap_95_interval"][1],
                     off_base=all(c["off_over_base"] >= 0.99 for c in comparisons.values()),
                     protected_medians=all(c["on_over_off"] >= 0.98 for name, c in comparisons.items()
                                           if name != "decode-source"),
                     protected_intervals=all(c[metric][1] >= 1.0 for c in comparisons.values()
                         for metric in ("on_over_off_paired_bootstrap_95_interval",
                                        "off_over_base_paired_bootstrap_95_interval")))
        cells = {}
        for cell in ("base", "off", "on"):
            parsers = [r for r in self.records if r["name"].startswith("resource-parser-") and r["name"].endswith("-" + cell)]
            javacs = [r for r in self.records if r["name"].startswith("resource-javac-") and r["name"].endswith("-" + cell)]
            require(len(parsers) == len(javacs) == 3, "Resource cell missing")
            metrics = {}
            for key in ("final_parser_compile_seconds", "parser_peak_arena_chunk_capacity_bytes"):
                metrics[key] = statistics.median(r[key] for r in parsers)
            for key in ("wall_seconds", "peak_rss_kib", "javac_citime_seconds", "javac_peak_arena_chunk_capacity_bytes"):
                metrics[key] = statistics.median(r[key] for r in javacs)
            require(all(math.isfinite(v) and v >= 0 for v in metrics.values()), "Invalid resource metric")
            cells[cell] = metrics
        for numerator, denominator in (("on", "off"), ("off", "base"), ("on", "base")):
            a, b = cells[numerator], cells[denominator]
            label = numerator + "_over_" + denominator
            gates[label + "_parser_time"] = a["final_parser_compile_seconds"] <= b["final_parser_compile_seconds"] + max(
                0.05 * b["final_parser_compile_seconds"], 0.010)
            key = "parser_peak_arena_chunk_capacity_bytes"
            gates[label + "_parser_arena"] = a[key] <= b[key] + max(0.05 * b[key], 1 << 20)
            for key in ("wall_seconds", "peak_rss_kib", "javac_citime_seconds", "javac_peak_arena_chunk_capacity_bytes"):
                gates[label + "_javac_" + key] = a[key] <= 1.05 * b[key]
        protected_sets, allocation, failures, class_hashes = [], [], [], set()
        for repeat in range(3):
            jobs = {cell: next(r for r in self.records if r["name"] == f"resource-javac-{repeat}-{cell}")
                    for cell in ("base", "off", "on")}
            methods = {cell: {n["method"] for n in row["jit_nmethods"] if n.get("compiler") == "c2"}
                       for cell, row in jobs.items()}
            protected_sets.append(bool(methods["base"]) and all(methods["base"] <= methods[c] for c in ("off", "on")))
            for cell, row in jobs.items():
                failures.append(sum(len(t["failures"]) for t in row["jit_tasks"]))
                class_hashes.add(row["emitted_classes_sha256"])
            attempts = {}
            for cell in ("base", "off", "on"):
                proof = self.state["decoder_proofs"][f"resource-parser-{repeat}-{cell}"]
                final_id = proof["nmethods"][-1]["compile_id"]
                task = next(t for t in proof["tasks"] if t["compile_id"] == final_id)
                require(task["regalloc"], "Missing final-parser allocation accounting")
                attempts[cell] = sum(int(n.get("attempts", "1")) for n in task["regalloc"])
            allocation.append(attempts["off"] <= attempts["base"] and attempts["on"] <= attempts["off"])
        gates.update(protected_c2_methods=all(protected_sets), no_compilation_failures=not any(failures),
                     no_extra_target_attempts=all(allocation), identical_javac_classes=len(class_hashes) == 1)
        self.state["resource_medians"] = cells
        return gates

    def summarize(self):
        rows = self.state["timing"]
        comparisons = {}
        for mode in ("decode", "encode"):
            for corpus in ("source", "periodic", "incompressible"):
                selected = [r for r in rows if r["mode"] == mode and r["corpus"] == corpus]
                paired = []
                for pair in sorted({r["pair"] for r in selected}):
                    values = {r["cell"]: r["median_MB_s"] for r in selected if r["pair"] == pair}
                    paired.append(dict(on_over_off=values["on"] / values["off"],
                                       off_over_base=values["off"] / values["base"]))
                    if "control" in values:
                        paired[-1]["control_over_off"] = values["control"] / values["off"]
                comparisons[mode + "-" + corpus] = dict(pairs=paired,
                    on_over_off=statistics.median(p["on_over_off"] for p in paired),
                    off_over_base=statistics.median(p["off_over_base"] for p in paired))
        primary = [r for r in rows if r["mode"] == "decode" and r["corpus"] == "source"]
        rates = {cell: statistics.median(r["median_MB_s"] for r in primary if r["cell"] == cell)
                 for cell in ("base", "off", "on", "native")}
        denominator = 1 / rates["off"] - 1 / rates["native"]
        gap = (1 / rates["off"] - 1 / rates["on"]) / denominator if denominator > 0 else None
        rng = random.Random(20261017)
        for comparison in comparisons.values():
            pairs = comparison["pairs"]
            for metric in pairs[0]:
                bootstrap = sorted(statistics.median(rng.choice(pairs)[metric] for _ in pairs)
                                   for _ in range(10000))
                comparison[metric + "_paired_bootstrap_95_interval"] = [bootstrap[250], bootstrap[9749]]
                comparison[metric] = statistics.median(p[metric] for p in pairs)
        self.state.update(status="execution-complete-review-required", comparisons=comparisons,
                          primary_rates=rates, primary_time_gap_fraction_closed=gap,
                          manual_gates=["Review published doc/cold-call-qualification/PROTOCOL.md",
                            "Relocation-aware base/default/off code and regalloc equivalence",
                            "All-path transport ledger and target compilation-time/arena statistics",
                            "Paired process uncertainty and protected workload resource limits"],
                          integration="No automatic PR, default change, merge or publication")
        self.save()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["plan", "run"])
    parser.add_argument("--config", type=Path, default=HERE / "qualification-host.json")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.action == "plan":
        print(json.dumps(dict(plan=PLAN, config=json.loads(args.config.read_text()),
                              original_started_utc=ORIGINAL_STARTED_UTC, deadline_utc=DEADLINE_UTC,
                              remaining_seconds=(datetime.fromisoformat(DEADLINE_UTC) - utc_now()).total_seconds(),
                              execution="run is inert after expiry; no deadline override"), indent=2))
        return
    require(args.output is not None, "run requires a new --output directory")
    campaign = Campaign(json.loads(args.config.read_text()), args.output)
    campaign.state["supplied_config"] = dict(path=str(args.config.resolve()), sha256=sha(args.config))
    campaign.save()
    previous_term = signal.getsignal(signal.SIGTERM)
    def interrupted(signum, frame):
        raise InterruptedError("Owner received termination signal")
    signal.signal(signal.SIGTERM, interrupted)
    try:
        campaign.build()
        campaign.verify_images()
        campaign.prepare()
        campaign.verify_prepared()
        campaign.safety()
        campaign.capture()
        campaign.review_gate("pre-timing")
        campaign.timing()
        campaign.resources()
        campaign.summarize()
        from capture_timed_profile import run_diagnostics
        parent = campaign.output / "diagnostic-parent.json"
        shutil.copyfile(campaign.output / "campaign.json", parent)
        run_diagnostics(campaign.output, clock=campaign.clock)
        campaign.state["diagnostic_parent_snapshot_sha256"] = sha(parent)
        campaign.state["diagnostic_manifest_sha256"] = sha(campaign.output / "source-profile-diagnostics/campaign.json")
        decision = campaign.review_gate("final")
        campaign.state.update(status="complete-owner-verdict", verdict=decision,
                              review_seconds=campaign.review_elapsed,
                              cleanup="All direct command children reaped; no active command remains",
                              publication="None; no automatic CI/PR/default change")
        campaign.save()
    except BaseException as error:
        campaign.state.update(status="stopped-no-retry", failure=str(error))
        campaign.save()
        raise
    finally:
        signal.signal(signal.SIGTERM, previous_term)


if __name__ == "__main__":
    main()
