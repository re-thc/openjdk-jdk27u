#!/usr/bin/env python3
"""One native Mac qualification; all command arguments and source refs are fixed."""
import argparse
from contextlib import contextmanager
import hashlib
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import statistics
import subprocess
import sys
import time
import traceback

BASE = "8d030adbd245b19e6339e3ccd052eb7fe3635319"
B = "a1d7a297b6a22d72bde8a051d6aa3a910cdcf77c"
C = "28a8b6162eaf5b4584e9b5d66c28359a336aa831"
PREVIOUS_VALIDATION = "a343d648a9b5a0cd9ab85a4f3c466db203bd07ae"
BRANCH = "refs/heads/qualify/native-kqueue-macos-once"
BREW_VERSIONS = {"autoconf": "2.73", "make": "4.4.1", "m4": "1.4.21"}
HOST_TOOLS = ("awk", "basename", "bash", "brew", "cat", "chmod", "cp", "curl",
              "cut", "date", "diff", "dirname", "echo", "expr", "file", "find",
              "git", "grep", "gunzip", "gzip", "head", "ln", "ls", "mkdir",
              "mktemp", "mv", "perl", "printf", "ps", "rm", "rmdir", "sed",
              "sh", "sort", "sw_vers", "tail", "tar", "tee", "touch", "tr",
              "uname", "unzip", "wc", "xargs", "xattr", "xcodebuild", "xcrun", "zip")
STAGE_CAPS = {"setup": 300, "build-baseline": 2400, "build-candidate": 600,
              "build-fastdebug": 2400, "correctness": 1200, "measurements": 900}
BOOT_URL = "https://download.java.net/java/GA/jdk26/c3cc523845074aa0af4f5e1e1ed4151d/35/GPL/openjdk-26_macos-aarch64_bin.tar.gz"
BOOT_SHA = "254586bcd1bf6dcd125ad667ac32562cb1e2ab1abf3a61fb117b6fabb571e765"
JTREG_URL = "https://ci.adoptium.net/job/dependency_pipeline/20/artifact/jtreg/jtreg-8.3+1.tar.gz"
JTREG_SHA = "6b5a36898448d35ee86024379fc3df81f08be5225b26db0db2b7e3d31feb0d88"
SELECTOR = "java/nio/channels/Selector/"
DATAGRAM = "java/nio/channels/DatagramChannel/"
SHARED = [SELECTOR + n + ".java" for n in (
    "ChangingInterests", "LotsOfUpdatesTest", "RaceUpdatesAndClose", "RacyDeregister",
    "CloseThenRegister", "RegAfterPreClose", "SelectAndCancel", "SelectAndClose",
    "Wakeup", "WakeupNow", "WakeupOverflow")]
SHARED += [DATAGRAM + n + ".java" for n in ("Disconnect", "AfterDisconnect")]
DEBUG_SHARED = [SELECTOR + n + ".java" for n in (
    "RaceUpdatesAndClose", "RegAfterPreClose", "Wakeup")]
DEBUG_SHARED += [DATAGRAM + n + ".java" for n in ("Disconnect", "AfterDisconnect")]
VT = ["java/nio/channels/vthread/SelectorOps.java#" + n for n in ("default", "poller-modes")]
MAIN_CASES = ("stable", "single", "bulk", "backpressure")
CONTROL_CASES = ("register63", "register64", "register65", "construct")


ARTIFACT_SOURCE_FILES = (
    "controller.py", "supervise.py", "manifest_image.py", "NativePollingBench.java",
    "native/signal.c", "native/mock/test.c", "native/mock/sys/event.h",
    "native/stubs/jlong.h", "native/stubs/jni_util.h", "native/stubs/nio.h",
    "native/stubs/nio_util.h")


def snapshot_runtime_sources(code, destination):
    """Copy only executable test inputs; documentation and private notes are excluded."""
    hashes = {}
    for name in ARTIFACT_SOURCE_FILES:
        source = Path(code) / name
        target = Path(destination) / name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
        hashes[name] = sha256(source)
    return hashes


ARTIFACT_ROOT_FILES = (
    "job-start.json", "collection.json", "status.json", "source-identities.json",
    "release-vm-comparison.json", "measurement-plan.json", "observations.json",
    "paired-summary.json", "benchmark-class-hashes.json", "controller-source-hashes.json",
    "native-helper-sha256.json", "bootjdk-download.json", "jtreg-download.json",
    "baseline-image.json", "candidate-image.json", "fastdebug-image.json",
    "master.commit", "baseline.commit", "candidate.commit", "validation.commit")
ARTIFACT_TREE_SUFFIXES = {
    "commands": {".log", ".json"},
    "phases": {".json"},
    "jtreg": {".jtr", ".log", ".txt", ".xml", ".json", ".html", ".css", ".js", ".properties"},
    "source-snapshots": {".java", ".c"},
    "build-metadata": {".log"},
    "native-diagnostics": {".json", ".h"}}


def export_artifacts(output, destination):
    """Export scoped inputs/results; runtime images and private state stay local."""
    output, destination = Path(output), Path(destination)
    destination.mkdir(parents=True, exist_ok=True)
    if any(destination.iterdir()):
        raise CommandFailure("Artifact export directory must be empty")
    selected = {name for name in ARTIFACT_ROOT_FILES if (output / name).is_file()}
    for directory, suffixes in ARTIFACT_TREE_SUFFIXES.items():
        for path in (output / directory).rglob("*"):
            if not path.is_file() or path.is_symlink() or path.suffix not in suffixes:
                continue
            if directory == "commands" and path.name not in {"output.log", "command.json", "receipt.json"}:
                continue
            if directory == "phases" and path.name not in {name + ".json" for name in STAGE_CAPS}:
                continue
            selected.add(str(path.relative_to(output)))
    for name in ARTIFACT_SOURCE_FILES:
        if (output / "validation-source" / name).is_file():
            selected.add("validation-source/" + name)
    manifest = []
    for name in sorted(selected):
        source, target = output / name, destination / name
        if source.is_symlink():
            raise CommandFailure("Unexpected artifact symlink: " + name)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
        manifest.append({"path": name, "size": target.stat().st_size, "sha256": sha256(target)})
    write_json(destination / "artifact-manifest.json", manifest)
    return manifest


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, allow_nan=False) + "\n")
    os.replace(temporary, path)


def sha256(path):
    h = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for data in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(data)
    return h.hexdigest()


def start_identity(pid):
    return subprocess.check_output(
        ["ps", "-p", str(pid), "-o", "lstart="], text=True, timeout=3).strip()


def stop_group(pid):
    # The supervisor catches TERM and stays alive until KILL; do not reap it
    # between these signals, so a new process cannot acquire this PID/PGID.
    for sig in (signal.SIGTERM, signal.SIGKILL):
        try:
            os.killpg(pid, sig)
        except ProcessLookupError:
            break
        if sig == signal.SIGTERM:
            time.sleep(0.2)


def cleanup_registry(output):
    registry = Path(output) / "active-processes.json"
    if not registry.exists():
        return []
    data = json.loads(registry.read_text())
    results = []
    for row in data:
        try:
            if start_identity(row["pid"]) != row["start_identity"]:
                results.append({"pid": row["pid"], "status": "identity-mismatch-no-signal"})
                continue
            stop_group(row["pid"])
            results.append({"pid": row["pid"], "status": "terminated"})
        except (subprocess.CalledProcessError, ProcessLookupError):
            results.append({"pid": row["pid"], "status": "already-exited"})
    write_json(Path(output) / "cleanup.json", results)
    return results


class CommandFailure(RuntimeError):
    pass


class Runner:
    def __init__(self, output, supervisor, deadline):
        self.output = Path(output)
        self.output.mkdir(parents=True, exist_ok=True)
        self.supervisor = Path(supervisor)
        self.deadline = deadline
        self.phase_deadline = deadline
        self.sequence = 0
        self.active = {}
        self.env = os.environ.copy()
        for key in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS", "CLASSPATH"):
            self.env.pop(key, None)
        write_json(self.output / "active-processes.json", [])

    @contextmanager
    def phase(self, name, seconds):
        previous = self.phase_deadline
        start = time.monotonic()
        self.phase_deadline = min(self.deadline, start + seconds)
        status = {"phase": name, "start_monotonic": start, "cap_seconds": seconds,
                  "effective_deadline": self.phase_deadline, "status": "running"}
        write_json(self.output / "phases" / (name + ".json"), status)
        try:
            yield
            status["status"] = "passed"
        except BaseException as exc:
            status.update(status="failed", error=repr(exc))
            raise
        finally:
            status["elapsed_seconds"] = time.monotonic() - start
            write_json(self.output / "phases" / (name + ".json"), status)
            self.phase_deadline = previous

    def run(self, name, argv, *, cwd=None, cap=180):
        self.sequence += 1
        safe = re.sub(r"[^a-zA-Z0-9_.-]", "_", name)
        directory = self.output / "commands" / f"{self.sequence:03d}-{safe}"
        directory.mkdir(parents=True)
        receipt = directory / "receipt.json"
        start = time.monotonic()
        limit = min(self.deadline, self.phase_deadline, start + cap)
        record = {"name": name, "argv": [str(x) for x in argv], "cwd": str(cwd or Path.cwd()),
                  "cap_seconds": cap, "start_monotonic": start, "deadline": limit,
                  "status": "not-started", "log": str(directory / "output.log")}
        write_json(directory / "command.json", record)
        print(json.dumps({"event": "command_start", "name": name, "cap_seconds": cap}), flush=True)
        if limit <= start:
            raise CommandFailure(f"Deadline exhausted before {name}")
        process = None
        try:
            with (directory / "output.log").open("wb") as stream:
                process = subprocess.Popen(
                    [sys.executable, str(self.supervisor), str(receipt), *map(str, argv)],
                    cwd=cwd, env=self.env, stdout=stream, stderr=subprocess.STDOUT,
                    start_new_session=True)
                row = {"pid": process.pid, "start_identity": start_identity(process.pid),
                       "command": str(directory)}
                self.active[process.pid] = row
                write_json(self.output / "active-processes.json", list(self.active.values()))
                record["status"] = "running"
                write_json(directory / "command.json", record)
                last_progress = start
                while not receipt.exists():
                    if time.monotonic() - last_progress >= 60:
                        print(json.dumps({"event": "command_running", "name": name,
                            "elapsed_seconds": time.monotonic() - start}), flush=True)
                        last_progress = time.monotonic()
                    if time.monotonic() >= limit:
                        record["status"] = "timeout"
                        raise CommandFailure(f"Command deadline: {name}")
                    time.sleep(min(0.05, max(0, limit - time.monotonic())))
                result = json.loads(receipt.read_text())
                record.update(result)
                record["status"] = "passed" if result["returncode"] == 0 else "failed"
                if result["returncode"] != 0:
                    raise CommandFailure(f"{name} exited {result['returncode']}; see {directory}")
            record["directory"] = str(directory)
            return record
        except BaseException as exc:
            record["error"] = repr(exc)
            if record["status"] in ("running", "not-started"):
                record["status"] = "interrupted"
            raise
        finally:
            old_mask = signal.pthread_sigmask(signal.SIG_BLOCK, {signal.SIGTERM, signal.SIGINT})
            try:
                if process is not None:
                    stop_group(process.pid)
                    record["supervisor_exit"] = process.wait(timeout=10)
                    record["group_teardown"] = "TERM then KILL before supervisor reap"
                    self.active.pop(process.pid, None)
                    write_json(self.output / "active-processes.json", list(self.active.values()))
                record["elapsed_seconds"] = time.monotonic() - start
                write_json(directory / "command.json", record)
                print(json.dumps({"event": "command_end", "name": name, "status": record["status"],
                    "elapsed_seconds": record["elapsed_seconds"]}), flush=True)
            finally:
                signal.pthread_sigmask(signal.SIG_SETMASK, old_mask)


def git(repo, *args):
    return subprocess.check_output(["git", "-C", str(repo), *args], text=True, timeout=20).strip()


def validate_sources(repo, expected):
    if not re.fullmatch(r"[0-9a-f]{40}", expected or ""):
        raise CommandFailure("expected_validation_sha must be a full lowercase SHA")
    if git(repo, "rev-parse", "HEAD") != expected:
        raise CommandFailure("Validation checkout does not match expected SHA")
    if (git(repo, "rev-parse", "HEAD^") != PREVIOUS_VALIDATION or
            git(repo, "rev-parse", PREVIOUS_VALIDATION + "^") != C):
        raise CommandFailure("Validation correction must directly follow the frozen first validation")
    if git(repo, "rev-parse", C + "^") != B or git(repo, "rev-parse", B + "^") != BASE:
        raise CommandFailure("Comparison ancestry mismatch")
    if git(repo, "status", "--porcelain"):
        raise CommandFailure("Dirty validation checkout")
    changed = git(repo, "diff", "--name-only", C, expected).splitlines()
    if not changed or any(not (x == ".github/workflows/main.yml" or
                              x.startswith(".github/native-polling/")) for x in changed):
        raise CommandFailure("Validation commit contains non-CI changes")
    if git(repo, "diff", "--name-only", BASE, B).splitlines() != [
            "src/java.base/macosx/classes/sun/nio/ch/KQueueSelectorImpl.java"]:
        raise CommandFailure("Baseline contains more than the reset repair")
    reset = git(repo, "diff", "--unified=0", BASE, B)
    additions = [s for s in reset.splitlines() if s.startswith("+") and not s.startswith("+++")]
    if len(additions) != 2 or not any(s.strip() == "+                        ski.registeredEvents(0);" for s in additions):
        raise CommandFailure("Unexpected baseline repair")
    for path in ("src/java.base/share/classes/sun/nio/ch/SelectionKeyImpl.java",
                 "src/java.base/linux"):
        if git(repo, "diff", "--name-only", BASE, C, "--", path):
            raise CommandFailure("Queue deduplication/Linux change in Mac comparison")
    return {label: {"commit": sha, "tree": git(repo, "rev-parse", sha + "^{tree}")}
            for label, sha in (("master", BASE), ("baseline", B), ("candidate", C),
                               ("validation", expected))}


def check_brew_versions(text):
    formulae = {row["name"]: row for row in json.loads(text)["formulae"]}
    for name, version in BREW_VERSIONS.items():
        row = formulae.get(name, {})
        if row.get("tap") != "homebrew/core" or row.get("versions", {}).get("stable") != version:
            raise CommandFailure("Unexpected Homebrew formula/version: " + name)


def image_manifest(image, output, source):
    rows = []
    for path in sorted(Path(image).rglob("*")):
        if path.is_symlink():
            rows.append({"path": str(path.relative_to(image)), "target": os.readlink(path)})
        elif path.is_file():
            rows.append({"path": str(path.relative_to(image)), "size": path.stat().st_size,
                         "mode": oct(path.stat().st_mode & 0o777), "sha256": sha256(path)})
    tree = hashlib.sha256(json.dumps(rows, sort_keys=True, separators=(",", ":")).encode()).hexdigest()
    release = (Path(image) / "release").read_text()
    if source[:12] not in release:
        raise CommandFailure("Image release metadata does not identify the requested source")
    if not re.search(r'OS_ARCH="(?:aarch64|arm64)"', release):
        raise CommandFailure("Native arm64 image required; no Rosetta comparison")
    result = {"source": source, "image_tree_sha256": tree, "files": rows, "release": release}
    write_json(output, result)
    return result


def trial_plan():
    rows = []
    for cases, warmup, measure, cap in ((MAIN_CASES, 2000, 6000, 16),
                                      (CONTROL_CASES, 1000, 2000, 8)):
        for round_number in range(4):
            # Rotate case order and alternate the order within every matched pair.
            ordered = cases[round_number % len(cases):] + cases[:round_number % len(cases)]
            for index, case in enumerate(ordered):
                order = ("baseline", "candidate") if (round_number + cases.index(case)) % 2 == 0 else ("candidate", "baseline")
                pair = f"{case}-{round_number}"
                for arm in order:
                    rows.append({"pair": pair, "case": case, "round": round_number,
                                 "arm": arm, "warmup_ms": warmup,
                                 "measure_ms": measure, "command_cap_seconds": cap})
    return rows


def parse_benchmark(log):
    lines = Path(log).read_text().splitlines()
    values = [json.loads(line.removeprefix("NATIVE_POLLING_RESULT ")) for line in lines
              if line.startswith("NATIVE_POLLING_RESULT ")]
    if len(values) != 1:
        raise CommandFailure("Expected exactly one benchmark result")
    value = values[0]
    for name in ("wall_ns", "cpu_ns", "units", "operations"):
        if not isinstance(value.get(name), (int, float)) or not math.isfinite(value[name]) or value[name] <= 0:
            raise CommandFailure(f"Invalid benchmark field: {name}")
    if value.get("verified") is not True:
        raise CommandFailure("Unverified benchmark payload/cleanup")
    if value.get("case") == "stable" and value.get("effective_filter_changes") != 0:
        raise CommandFailure("Stable-interest control changed filters")
    if value.get("case") in ("single", "bulk", "backpressure") and value.get("effective_filter_changes", 0) <= 0:
        raise CommandFailure("Update workload did not change filters")
    if value.get("case") == "backpressure" and value.get("partial_writes", 0) <= 0:
        raise CommandFailure("Backpressure was not induced")
    return value


def summarize(observations):
    pairs = {}
    for row in observations:
        pairs.setdefault(row["pair"], {})[row["arm"]] = row
    result = {"observations": len(observations), "pairs": [], "complete_pairs": 0}
    for pair, arms in sorted(pairs.items()):
        if set(arms) != {"baseline", "candidate"} or any("result" not in a or a.get("status") != "passed" for a in arms.values()):
            result["pairs"].append({"pair": pair, "status": "incomplete", "arms": arms})
            continue
        b, c = arms["baseline"]["result"], arms["candidate"]["result"]
        row = {"pair": pair, "case": arms["baseline"]["case"], "status": "complete",
               "candidate_over_baseline_wall_per_unit": (c["wall_ns"] / c["units"]) / (b["wall_ns"] / b["units"]),
               "candidate_over_baseline_cpu_per_unit": (c["cpu_ns"] / c["units"]) / (b["cpu_ns"] / b["units"])}
        row["candidate_over_baseline_throughput"] = (c["units"] / c["wall_ns"]) / (b["units"] / b["wall_ns"])
        ba, ca = b.get("allocated_main_thread_bytes"), c.get("allocated_main_thread_bytes")
        if isinstance(ba, int) and isinstance(ca, int) and ba >= 0 and ca >= 0:
            row["allocation_delta_bytes_per_unit"] = ca / c["units"] - ba / b["units"]
        for metric in ("latency_p50_upper_ns", "latency_p95_upper_ns", "latency_p99_upper_ns"):
            if b.get(metric, 0) > 0 and c.get(metric, 0) > 0:
                row["candidate_over_baseline_" + metric] = c[metric] / b[metric]
        bp, cp = arms["baseline"].get("complete_jvm_process_ns"), arms["candidate"].get("complete_jvm_process_ns")
        if bp and cp:
            row["candidate_over_baseline_complete_jvm_process"] = cp / bp
        result["pairs"].append(row)
        result["complete_pairs"] += 1
    result["case_summaries"] = {}
    for case in MAIN_CASES + CONTROL_CASES:
        ratios = [r["candidate_over_baseline_wall_per_unit"] for r in result["pairs"]
                  if r.get("case") == case and r["status"] == "complete"]
        if ratios:
            result["case_summaries"][case] = {"pairs": len(ratios), "median": statistics.median(ratios),
                "min": min(ratios), "max": max(ratios), "ratios_above_one": sum(r > 1 for r in ratios)}
    return result


class Qualification:
    def __init__(self, repo, output, expected):
        self.repo = Path(repo).resolve()
        self.output = Path(output).resolve()
        self.expected = expected
        self.code = self.repo / ".github/native-polling"
        init = self.output / "job-start.json"
        if not init.exists():
            write_json(init, {"monotonic": time.monotonic(), "source": "local invocation"})
        self.deadline = json.loads(init.read_text())["monotonic"] + 140 * 60
        self.runner = Runner(self.output, self.code / "supervise.py", self.deadline)
        self.jobs = min(os.cpu_count() or 1, 3)
        self.workspace = self.output.parent / "native-polling-build"
        self.source = self.workspace / "source"
        self.images = {}
        self.observations = []

    def command(self, *args, **kwargs):
        return self.runner.run(*args, **kwargs)

    def command_output(self, *args, **kwargs):
        return Path(self.command(*args, **kwargs)["log"]).read_text().strip()

    def prepare_tools(self):
        developer = "/Applications/Xcode_26.6.app/Contents/Developer"
        missing = [name for name in HOST_TOOLS if not shutil.which(name)]
        if not Path(developer).is_dir():
            missing.append(developer)
        if missing:
            raise CommandFailure("Required runner tools missing: " + ", ".join(missing))
        if shutil.disk_usage(self.output).free < 10 * 1024**3:
            raise CommandFailure("Less than 10 GiB free for sources/builds/images")
        self.runner.env["DEVELOPER_DIR"] = developer
        xcode = self.command_output("xcode-version", ["xcodebuild", "-version"], cap=20)
        sdk = self.command_output("sdk-version", ["xcrun", "--sdk", "macosx", "--show-sdk-version"], cap=20)
        if xcode.splitlines() != ["Xcode 26.6", "Build version 17F113"] or sdk != "26.5":
            raise CommandFailure("Expected Xcode 26.6 (17F113) and macOS SDK 26.5")
        failures = []
        for tool in ("clang", "clang++", "ar", "nm", "strip", "dsymutil", "mig",
                     "SetFile", "otool", "install_name_tool", "lipo", "codesign"):
            try:
                self.command("xcode-find-" + tool, ["xcrun", "--find", tool], cap=10)
            except CommandFailure:
                failures.append(tool)
        for tool in ("metal", "metallib"):
            try:
                self.command("xcode-version-" + tool,
                             ["xcrun", "--sdk", "macosx", tool, "--version"], cap=20)
            except CommandFailure:
                failures.append(tool)
        if failures:
            raise CommandFailure("Required Xcode tools unavailable: " + ", ".join(failures))
        # Use the ordinary macOS build's Homebrew formulae, without unrelated maintenance.
        self.runner.env.update(HOMEBREW_NO_AUTO_UPDATE="1", HOMEBREW_NO_INSTALL_CLEANUP="1",
                               HOMEBREW_NO_INSTALL_UPGRADE="1")
        info = self.command_output("brew-build-tool-formulae",
            ["brew", "info", "--json=v2", "--formula", *["homebrew/core/" + name for name in BREW_VERSIONS]], cap=20)
        check_brew_versions(info)
        self.command("install-build-tools",
                     ["brew", "install", "--formula", "homebrew/core/autoconf", "homebrew/core/make"], cap=120)
        prefix = Path(self.command_output("brew-prefix", ["brew", "--prefix"], cap=10))
        if prefix != Path("/opt/homebrew"):
            raise CommandFailure("Native arm64 Homebrew prefix required")
        tools = {"autoconf": prefix / "opt/autoconf/bin/autoconf",
                 "make": prefix / "opt/make/bin/gmake", "m4": prefix / "opt/m4/bin/m4"}
        for name, program in tools.items():
            version = self.command_output(name + "-version", [program, "--version"], cap=20).splitlines()[0]
            if not version.endswith(" " + BREW_VERSIONS[name]):
                raise CommandFailure("Installed build tool version mismatch: " + name)
        self.make = str(tools["make"])
        self.runner.env.update(AUTOCONF=str(tools["autoconf"]), M4=str(tools["m4"]), MAKE=self.make)
        self.runner.env["PATH"] = str(prefix / "opt/make/libexec/gnubin") + ":" + self.runner.env["PATH"]
        for name, argv in (("sw-vers", ["sw_vers"]), ("clang-version", ["xcrun", "clang", "--version"]),
                           ("sdk", ["xcrun", "--show-sdk-path"])):
            self.command(name, argv, cap=20)

    def setup(self):
        with self.runner.phase("setup", STAGE_CAPS["setup"]):
            identities = validate_sources(self.repo, self.expected)
            write_json(self.output / "source-identities.json", identities)
            if sys.platform != "darwin" or os.uname().machine != "arm64":
                raise CommandFailure("Native Darwin arm64 required; no emulation/fallback")
            if os.environ.get("GITHUB_REF") != BRANCH:
                raise CommandFailure("Dedicated validation branch required")
            self.prepare_tools()
            dependencies = self.workspace / "dependencies"
            dependencies.mkdir(parents=True)
            for label, url, expected in (("bootjdk", BOOT_URL, BOOT_SHA), ("jtreg", JTREG_URL, JTREG_SHA)):
                package = dependencies / (label + ".tar.gz")
                self.command("download-" + label,
                             ["curl", "--fail", "--location", "--connect-timeout", "20", "--max-time", "240",
                              "--output", package, url], cap=250)
                actual = sha256(package)
                write_json(self.output / (label + "-download.json"), {"url": url, "expected_sha256": expected, "actual_sha256": actual})
                if actual != expected:
                    raise CommandFailure(label + " checksum mismatch")
                target = dependencies / label
                target.mkdir()
                self.command("extract-" + label, ["tar", "-xzf", package, "-C", target, "--strip-components", "1"], cap=60)
            self.boot = dependencies / "bootjdk/Contents/Home"
            self.jtreg = dependencies / "jtreg"
            if not (self.boot / "bin/java").is_file() or not (self.jtreg / "lib/jtreg.jar").is_file():
                raise CommandFailure("Unexpected pinned dependency layout")
            self.runner.env["JAVA_HOME"] = str(self.boot)
            self.command("bootjdk-version", [self.boot / "bin/java", "-version"], cap=20)
            self.command("jtreg-version", [self.boot / "bin/java", "-jar", self.jtreg / "lib/jtreg.jar", "-version"], cap=20)
            self.command("build-worktree", ["git", "-C", self.repo, "worktree", "add", "--detach", self.source, B], cap=120)
            hashes = snapshot_runtime_sources(self.code, self.output / "validation-source")
            self.runner.supervisor = self.output / "validation-source/supervise.py"
            for label, sha in (("master", BASE), ("baseline", B), ("candidate", C), ("validation", self.expected)):
                raw = subprocess.check_output(["git", "-C", self.repo, "cat-file", "commit", sha], timeout=20)
                (self.output / (label + ".commit")).write_bytes(raw)
            source_paths = ["src/java.base/macosx/native/libnio/ch/KQueue.c",
                "src/java.base/macosx/classes/sun/nio/ch/KQueue.java",
                "src/java.base/macosx/classes/sun/nio/ch/KQueueSelectorImpl.java",
                "src/java.base/share/classes/sun/nio/ch/SelectionKeyImpl.java",
                "test/jdk/sun/nio/ch/KQueueRegistration.java",
                "test/jdk/java/nio/channels/Selector/KQueueBatchUpdates.java"]
            for sha in (B, C):
                for name in source_paths:
                    result = subprocess.run(["git", "-C", str(self.repo), "show", sha + ":" + name],
                                            stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=20)
                    if result.returncode == 0:
                        target = self.output / "source-snapshots" / sha / name
                        target.parent.mkdir(parents=True, exist_ok=True)
                        target.write_bytes(result.stdout)
                    elif sha == C or not name.startswith("test/"):
                        raise CommandFailure("Missing frozen source: " + name)
            write_json(self.output / "controller-source-hashes.json", hashes)

    def build(self, label, sha, debug, seconds):
        conf = "native-release" if debug == "release" else "native-fastdebug"
        try:
            with self.runner.phase("build-" + label, seconds):
                self.command("source-" + label, ["git", "-C", self.source, "switch", "--detach", sha], cap=30)
                conf = "native-release" if debug == "release" else "native-fastdebug"
                if not (self.source / "build" / conf / "spec.gmk").exists():
                    arguments = ["bash", "configure", "--with-conf-name=" + conf,
                                 "--with-debug-level=" + debug, "--with-boot-jdk=" + str(self.boot),
                                 "--with-jtreg=" + str(self.jtreg), "--with-jobs=" + str(self.jobs),
                                 "--with-version-opt=native-polling-validation", "--with-native-debug-symbols=none"]
                    self.command("configure-" + label, arguments, cwd=self.source, cap=180)
                self.command("build-" + label, [self.make, "CONF=" + conf, "JOBS=" + str(self.jobs), "images"],
                             cwd=self.source, cap=seconds)
                if git(self.source, "rev-parse", "HEAD") != sha or git(self.source, "status", "--porcelain"):
                    raise CommandFailure("Build source identity/cleanliness changed")
                image = self.workspace / "images" / label
                image.parent.mkdir(parents=True, exist_ok=True)
                self.command("copy-image-" + label, ["cp", "-R", "-p", self.source / "build" / conf / "images/jdk", image], cap=120)
                # Hashing is streamed in a supervised subprocess and obeys the same build cap.
                self.command("hash-image-" + label, [sys.executable, self.code / "manifest_image.py",
                             image, self.output / (label + "-image.json"), sha], cap=120)
                shutil.copy2(self.source / "build" / conf / "spec.gmk", self.output / (label + "-spec.gmk"))
                self.images[label] = image
        finally:
            metadata = self.output / "build-metadata" / label
            metadata.mkdir(parents=True, exist_ok=True)
            for name in ("spec.gmk", "configure.log", "config.log"):
                path = self.source / "build" / conf / name
                if path.is_file(): shutil.copy2(path, metadata / name)
            for name in ("configure.log", "config.log"):
                path = self.source / name
                if path.is_file(): shutil.copy2(path, metadata / ("root-" + name))
    def jt(self, arm, test, suffix="", cap=180):
        safe = re.sub(r"[^a-zA-Z0-9_.-]", "_", test + suffix)
        directory = self.output / "jtreg" / arm / safe
        self.command("jtreg-" + arm + "-" + safe,
            [self.boot / "bin/java", "-jar", self.jtreg / "lib/jtreg.jar", "-jdk:" + str(self.images[arm]),
             "-nativepath:" + str(self.native_helper), "-va", "-timeoutFactor:1",
             "-javaoptions:-ea", "-javaoptions:-esa",
             "-w:" + str(directory / "work"), "-r:" + str(directory / "report"),
             str(self.repo / "test/jdk" / test)], cap=cap)

    def correctness(self):
        with self.runner.phase("correctness", STAGE_CAPS["correctness"]):
            helper = self.workspace / "native-helper"
            helper.mkdir()
            self.native_helper = helper
            self.command("pinner-helper", ["xcrun", "clang", "-dynamiclib", "-O2", "-I" + str(self.repo / "test/lib/native"),
                         self.repo / "test/lib/jdk/test/lib/thread/libVThreadPinner.c", "-o", helper / "libVThreadPinner.dylib"], cap=30)
            write_json(self.output / "native-helper-sha256.json", {
                "libVThreadPinner.dylib": sha256(helper / "libVThreadPinner.dylib")})
            for arm in ("baseline", "candidate"):
                for test in SHARED + VT:
                    self.jt(arm, test)
            for arm in ("baseline", "candidate", "fastdebug"):
                for repeat in range(5):
                    self.jt(arm, SELECTOR + "KQueueBatchUpdates.java", suffix="-" + str(repeat), cap=120)
            for arm in ("candidate", "fastdebug"):
                self.jt(arm, "sun/nio/ch/KQueueRegistration.java", cap=60)
            for test in DEBUG_SHARED:
                self.jt("fastdebug", test)
            classes = self.workspace / "benchmark-classes"
            classes.mkdir()
            self.command("compile-benchmark", [self.images["candidate"] / "bin/javac", "-d", classes,
                         self.code / "NativePollingBench.java"], cap=45)
            self.classes = classes
            native = self.output / "native-diagnostics"
            native.mkdir()
            native_runtime = self.workspace / "native-diagnostics"
            native_runtime.mkdir()
            self.command("generate-jni-header", [self.images["candidate"] / "bin/javac", "--patch-module",
                "java.base=" + str(self.repo / "src/java.base/macosx/classes"), "-h", native, "-d", native_runtime,
                self.repo / "src/java.base/macosx/classes/sun/nio/ch/KQueue.java"], cap=45)
            include = ["-I" + str(self.code / "native/stubs"), "-I" + str(native),
                       "-I" + str(self.repo / "src/java.base/macosx/native/libnio/ch"),
                       "-I" + str(self.boot / "include"), "-I" + str(self.boot / "include/darwin")]
            for name in ("mock", "signal"):
                extra = ["-I" + str(self.code / "native/mock")] if name == "mock" else []
                src = self.code / ("native/mock/test.c" if name == "mock" else "native/signal.c")
                binary = native_runtime / name
                self.command("compile-native-" + name, ["xcrun", "clang", "-std=c11", "-D_POSIX_C_SOURCE=200809L", "-D_DARWIN_C_SOURCE",
                    "-Wall", "-Wextra", "-Werror", "-Wno-unused-parameter", "-O1", "-g",
                    "-fsanitize=address,undefined", "-pthread", *extra, *include, src, "-o", binary], cap=60)
                write_json(native / (name + "-identity.json"), {"binary_sha256": sha256(binary),
                    "driver_sha256": sha256(src), "kqueue_source_sha256": sha256(self.repo / "src/java.base/macosx/native/libnio/ch/KQueue.c")})
                self.command("run-native-" + name, [binary], cap=60)
    def verify_release_vm(self):
        b = sha256(self.images["baseline"] / "lib/server/libjvm.dylib")
        c = sha256(self.images["candidate"] / "lib/server/libjvm.dylib")
        write_json(self.output / "release-vm-comparison.json", {"baseline": b, "candidate": c, "identical": b == c})
        if b != c:
            raise CommandFailure("Release VM binaries differ; timing blocked pending explanation")

    def measurements(self):
        with self.runner.phase("measurements", STAGE_CAPS["measurements"]):
            plan = trial_plan()
            image_ids = {arm: json.loads((self.output / (arm + "-image.json")).read_text())["image_tree_sha256"]
                         for arm in ("baseline", "candidate")}
            class_hashes = {p.name: sha256(p) for p in sorted(self.classes.glob("*.class"))}
            write_json(self.output / "benchmark-class-hashes.json", class_hashes)
            write_json(self.output / "measurement-plan.json", {"pairs": 32, "jvms": 64,
                "fixed_windows_seconds": 352, "trial_cap_sum_seconds": sum(r["command_cap_seconds"] for r in plan),
                "phase_cap_seconds": 900, "trials": plan})
            for trial in plan:
                observation = dict(trial)
                observation.update(source_commit=B if trial["arm"] == "baseline" else C,
                                   image_tree_sha256=image_ids[trial["arm"]],
                                   benchmark_class_sha256=class_hashes)
                start = time.monotonic()
                try:
                    command = self.command("measure-" + trial["pair"] + "-" + trial["arm"],
                        [self.images[trial["arm"]] / "bin/java", "-cp", self.classes, "NativePollingBench",
                         trial["case"], str(trial["warmup_ms"]), str(trial["measure_ms"])],
                        cap=trial["command_cap_seconds"])
                    value = parse_benchmark(command["log"])
                    if value["case"] != trial["case"] or value["warmup_ms"] != trial["warmup_ms"] or value["measure_ms"] != trial["measure_ms"]:
                        raise CommandFailure("Result does not match frozen trial inputs")
                    observation.update(result=value, command=command, status="passed",
                        complete_jvm_process_ns=command["child_end_ns"] - command["child_start_ns"])
                    prior = next((r for r in self.observations if r["pair"] == trial["pair"]), None)
                    if prior is not None:
                        for key in ("case", "warmup_ms", "measure_ms", "unit", "send_buffer_min",
                                    "send_buffer_max", "peer_receive_buffer_min", "peer_receive_buffer_max"):
                            if prior["result"].get(key) != value.get(key):
                                raise CommandFailure("Matched pair parameter/socket-buffer mismatch: " + key)
                except BaseException as exc:
                    observation.update(status="failed", error=repr(exc))
                    raise
                finally:
                    observation["elapsed_seconds"] = time.monotonic() - start
                    self.observations.append(observation)
                    write_json(self.output / "observations.json", self.observations)
                    write_json(self.output / "paired-summary.json", summarize(self.observations))
            if len(self.observations) != 64 or summarize(self.observations)["complete_pairs"] != 32:
                raise CommandFailure("Incomplete measurement campaign")

    def execute(self):
        status = {"status": "running", "validation_sha": self.expected,
                  "started_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
                  "work_deadline_monotonic": self.deadline}
        write_json(self.output / "status.json", status)
        try:
            self.setup()
            self.build("baseline", B, "release", STAGE_CAPS["build-baseline"])
            self.build("candidate", C, "release", STAGE_CAPS["build-candidate"])
            self.verify_release_vm()
            self.build("fastdebug", C, "fastdebug", STAGE_CAPS["build-fastdebug"])
            self.correctness()
            self.measurements()
            status["status"] = "passed"
        except BaseException as exc:
            status.update(status="failed", error=repr(exc), traceback=traceback.format_exc())
            raise
        finally:
            status["finished_utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
            write_json(self.output / "status.json", status)
            cleanup_registry(self.output)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[2])
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--expected-sha")
    parser.add_argument("--cleanup", action="store_true")
    parser.add_argument("--export-dir", type=Path)
    args = parser.parse_args()
    if args.cleanup:
        cleanup_registry(args.output)
        return
    if args.export_dir is not None:
        export_artifacts(args.output, args.export_dir)
        return
    def interrupted(signum, _frame):
        raise CommandFailure(f"Controller interrupted by signal {signum}")
    signal.signal(signal.SIGTERM, interrupted)
    signal.signal(signal.SIGINT, interrupted)
    Qualification(args.repo, args.output, args.expected_sha).execute()


if __name__ == "__main__":
    main()
