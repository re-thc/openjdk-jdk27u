#!/usr/bin/env python3
"""Bounded Windows-only experiment. No publication, dispatch or installers."""
import argparse
import csv
import hashlib
import json
import os
from pathlib import Path
import shlex
import shutil
import signal
import statistics
import subprocess
import sys
import time

BASE = "d5291018851658625d16c3d26a9a4be8974e6354"
CORRECTNESS = "63264edcdf6547222838997f22672ab909f13317"
COMBINED = "0af48a47dd33cb58e514b860ae044959434aa4d3"
COMBINED_TREE = "1848a6b40594f7ce3aff5f09c167197c0d6cbad8"
STATES = {"baseline": BASE, "correctness": CORRECTNESS, "combined": COMBINED}
TESTS = [
    "java/nio/channels/SocketChannel/GatheringWriteBackpressure.java",
    "java/nio/channels/SocketChannel/ShortWrite.java",
    "java/nio/channels/SocketChannel/VectorIO.java",
    "java/nio/channels/SocketChannel/VectorParams.java",
    "java/nio/channels/SocketChannel/ConnectionReset.java",
    "java/nio/channels/SocketChannel/ReadWriteAfterClose.java",
    "sun/nio/ch/SynchronousVectorIO.java",
    "java/nio/channels/DatagramChannel/Truncate.java",
    "java/nio/channels/DatagramChannel/EmptyBuffer.java",
    "java/nio/channels/DatagramChannel/ConnectedSend.java",
    "java/nio/channels/DatagramChannel/SendReceiveMaxSize.java",
]
OVERLAY = [TESTS[0], TESTS[6]]
CAPS = {"configure": 180, "build": 2700, "normal_tests": 360,
        "required_short": 120, "measurement": 6, "comparison": 360,
        "controller": 175 * 60}


def description():
    return {"states": STATES, "combined_tree": COMBINED_TREE,
            "profiles": ["release"], "builds": 3,
            "test_paths": TESTS, "normal_descriptions_per_image": 14,
            "required_short_descriptions_per_image": 1,
            "maximum_test_jvms": 45, "maximum_measurement_jvms": 48,
            "jtreg_harness_jvms": 6, "benchmark_javac_processes": 1,
            "caps_seconds": CAPS, "windows_job_minutes": 210,
            "artifacts": ["selected source hashes", "command exit/timing records",
                          "configure/build logs", "jtreg .jtr and text summaries",
                          "all measurement CSV rows and subprocess logs"],
            "excluded_artifacts": ["JDK images", "object/class files", "core/heap dumps",
                                   "full environment or host inventories"]}


class Runner:
    def __init__(self, output, seconds=CAPS["controller"]):
        self.output = Path(output)
        self.output.mkdir(parents=True, exist_ok=True)
        self.deadline = time.monotonic() + seconds
        self.records = []

    def save(self):
        (self.output / "commands.json").write_text(json.dumps(self.records, indent=2) + "\n")

    def run(self, name, args, cwd, seconds, env=None):
        remaining = self.deadline - time.monotonic()
        if remaining <= 0:
            raise TimeoutError("controller time budget exhausted")
        log = self.output / (name + ".log")
        start = time.monotonic()
        record = {"name": name, "command": list(map(str, args)),
                  "cap_seconds": min(seconds, remaining), "timed_out": False}
        record["exit_code"] = None
        try:
            with log.open("w", encoding="utf-8") as stream:
                proc = subprocess.Popen(list(map(str, args)), cwd=cwd, env=env,
                                        stdout=stream, stderr=subprocess.STDOUT,
                                        start_new_session=os.name != "nt")
                try:
                    record["exit_code"] = proc.wait(timeout=min(seconds, remaining))
                except subprocess.TimeoutExpired:
                    record["timed_out"] = True
                    try:
                        if os.name == "nt":
                            killed = subprocess.run(["taskkill.exe", "/PID", str(proc.pid), "/T", "/F"],
                                                    stdout=stream, stderr=subprocess.STDOUT, timeout=15)
                            record["termination_exit_code"] = killed.returncode
                        else:
                            os.killpg(proc.pid, signal.SIGKILL)
                        proc.wait(timeout=15)
                    except (OSError, subprocess.TimeoutExpired) as error:
                        record["termination_error"] = str(error)
                        # Do not leave the controller parent waiting indefinitely.
                        # The job deadline remains the outer bound for descendants.
                        proc.kill()
                    record["exit_code"] = -1
        except OSError as error:
            record["launch_error"] = str(error)
        finally:
            record["elapsed_seconds"] = round(time.monotonic() - start, 3)
            self.records.append(record)
            self.save()
        print(json.dumps(record), flush=True)
        if "termination_error" in record:
            raise RuntimeError("Process-tree cleanup is uncertain; see commands.json")
        return record["exit_code"] == 0


def spec_versions(text):
    keys = ("TOOLCHAIN_TYPE", "TOOLCHAIN_VERSION", "CC_VERSION_NUMBER", "CXX_VERSION_NUMBER")
    values = {}
    for line in text.splitlines():
        fields = line.split()
        if len(fields) >= 3 and fields[0] in keys:
            values[fields[0]] = fields[2]
    if values.get("TOOLCHAIN_TYPE") != "microsoft" or values.get("TOOLCHAIN_VERSION") != "2026":
        raise ValueError("The ordinary Microsoft VS 2026 configuration was not selected")
    if any(not values.get(k, "").startswith("19.44.") for k in keys[2:]):
        raise ValueError("Configured C/C++ compilers must both be MSVC 19.44.x")
    return values


def collect_tests(work, report, dest):
    dest.mkdir(parents=True, exist_ok=True)
    for p in work.rglob("*.jtr"):
        target = dest / p.relative_to(work)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(p, target)
    summary = report / "text" / "summary.txt"
    if summary.exists():
        shutil.copy2(summary, dest / "summary.txt")


def summarize_measurements(path):
    with path.open(newline="") as stream:
        rows = list(csv.DictReader(stream))
    pairs = {}
    for row in rows:
        if row["status"] == "ok":
            key = (row["pair"], row["protocol"], row["vectors"], row["bytes"])
            pairs.setdefault(key, {})[row["image"]] = row
    observations = []
    for key, images in pairs.items():
        if {"correctness", "combined"} <= images.keys():
            c, co = images["correctness"], images["combined"]
            observations.append({"pair": key[0], "protocol": key[1], "vectors": key[2],
                                 "bytes": key[3], "wall_ratio_CO_over_C": int(co["wall_ns"])/int(c["wall_ns"]),
                                 "cpu_delta_ns_CO_minus_C": int(co["cpu_ns"])-int(c["cpu_ns"])})
    summary = []
    for protocol in ("tcp", "udp"):
        for vectors in ("1", "16"):
            for size in ("64", "4096"):
                group = [o for o in observations if (o["protocol"], o["vectors"], o["bytes"])
                         == (protocol, vectors, size)]
                if group:
                    ratios = [o["wall_ratio_CO_over_C"] for o in group]
                    summary.append({"protocol": protocol, "vectors": vectors, "bytes": size,
                                    "complete_pairs": len(group), "median_wall_ratio_CO_over_C": statistics.median(ratios),
                                    "wall_ratio_range": [min(ratios), max(ratios)]})
    return {"all_pairs_including_slowdowns": observations, "summary": summary,
            "successful_rows": sum(r["status"] == "ok" for r in rows), "attempted_rows": len(rows)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--describe", action="store_true")
    args = parser.parse_args()
    if args.describe:
        print(json.dumps(description(), indent=2))
        return 0
    if os.name != "nt":
        parser.error("Native execution requires Windows; --describe is safe elsewhere")
    root = Path(__file__).resolve().parents[2]
    runner = Runner(root / "windows-nio-results")
    (runner.output / "plan.json").write_text(json.dumps(description(), indent=2) + "\n")
    scratch = Path(os.environ["RUNNER_TEMP"]) / "windows-nio"
    scratch.mkdir(exist_ok=True)
    bash = shutil.which("bash.exe")
    if not bash:
        raise RuntimeError("The ordinary get-msys2 action must run first")
    # Mirror the ordinary Windows configure step's minimal PATH; retain the
    # PowerShell directory added by get-msys2 for make's normal memory probe.
    bash_env = os.environ.copy()
    powershell = shutil.which("powershell.exe")
    if not powershell:
        raise RuntimeError("Ordinary Windows PowerShell prerequisite is missing")
    bash_env["PATH"] = os.pathsep.join([str(Path(bash).parent), str(Path(powershell).parent)])

    def shell(name, argv, cwd, seconds):
        return runner.run(name, [bash, "--login", "-eo", "pipefail", "-c",
                                "exec " + shlex.join(list(map(str, argv)))],
                          cwd, seconds, bash_env)

    def native_path(value):
        return Path(subprocess.check_output([bash, "-lc", "cygpath -w " + shlex.quote(value)],
                                           text=True, timeout=10).strip())

    boot = native_path(os.environ["BOOT_JDK"])
    jtreg = native_path(os.environ["JTREG_HOME"]) / "lib" / "jtreg.jar"
    head = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=root, text=True).strip()
    (runner.output / "controller-head.txt").write_text(head + "\n")
    # Depth-one checkout is enough for the controller. Fetch only the three
    # fixed ancestors needed for the experiment, rather than full JDK history.
    if not runner.run("fetch-exact-sources", ["git", "fetch", "--no-tags", "--depth=1",
                                             "origin", *STATES.values()], root, 300):
        return 1
    tree = subprocess.check_output(["git", "rev-parse", COMBINED + "^{tree}"],
                                   cwd=root, text=True).strip()
    if tree != COMBINED_TREE:
        raise RuntimeError("Combined source tree does not match the reviewed tree")
    images, normal_ok, required_ok, metadata = {}, {}, {}, {}
    builds = {label: "not-started" for label in STATES}
    for label, source in STATES.items():
        builds[label] = "incomplete-or-failed"
        worktree = scratch / label
        if not runner.run(label + "-worktree", ["git", "worktree", "add", "--detach",
                                               worktree, source], root, 90):
            continue
        try:
            for relative in OVERLAY:
                target = worktree / "test" / "jdk" / relative
                target.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(root / "test" / "jdk" / relative, target)
            if not runner.run(label + "-verify-product", ["git", "diff", "--exit-code",
                                                         "HEAD", "--", "src", "make"], worktree, 30):
                continue
            metadata[label] = {"source_commit": source, "dispatcher_sha256": {}}
            for filename in ("SocketDispatcher.c", "DatagramDispatcher.c"):
                p = worktree / "src/java.base/windows/native/libnio/ch" / filename
                metadata[label]["dispatcher_sha256"][filename] = hashlib.sha256(p.read_bytes()).hexdigest()
            configure = ["bash", "bin/configure-dev", "--with-conf-name=windows-nio",
                         "--with-debug-level=release", "--with-version-opt=windows-nio-validation",
                         "--with-boot-jdk=" + os.environ["BOOT_JDK"],
                         "--with-jtreg=" + os.environ["JTREG_HOME"],
                         "--with-gtest=" + os.environ["GTEST_HOME"],
                         "--with-toolchain-version=2026", "--with-msvc-toolset-version=14.44",
                         "--with-jmod-compress=zip-1", "--with-external-symbols-in-bundles=none"]
            if not shell(label + "-configure", configure, worktree, CAPS["configure"]):
                continue
            metadata[label]["toolchain"] = spec_versions((worktree / "build/windows-nio/spec.gmk").read_text())
            (runner.output / "source-and-toolchain.json").write_text(json.dumps(metadata, indent=2) + "\n")
            if not shell(label + "-build", ["make", "CONF=windows-nio", "images", "test-image"],
                         worktree, CAPS["build"]):
                continue
            builds[label] = "passed"
            (runner.output / "build-status.json").write_text(json.dumps(builds, indent=2) + "\n")
            image = worktree / "build/windows-nio/images/jdk"
            for phase, tests, cap in [("normal", TESTS, CAPS["normal_tests"]),
                                      ("required-short", [TESTS[0]], CAPS["required_short"])]:
                test_work = scratch / (label + "-" + phase + "-work")
                report = scratch / (label + "-" + phase + "-report")
                command = [boot / "bin/java.exe", "-jar", jtreg, "-jdk:" + str(image),
                           "-othervm", "-conc:1", "-timeoutFactor:1",
                           "-vmoption:-XX:-CreateCoredumpOnCrash",
                           "-w:" + str(test_work), "-r:" + str(report)]
                if phase == "required-short":
                    command += ["-vmoption:-Dtest.requireShortBatch=true"]
                command += [str(worktree / "test/jdk" / t) for t in tests]
                ok = runner.run(label + "-" + phase, command, worktree, cap)
                collect_tests(test_work, report, runner.output / "tests" / label / phase)
                (normal_ok if phase == "normal" else required_ok)[label] = ok
            if label != "baseline":
                preserved = scratch / (label + "-jdk")
                shutil.copytree(image, preserved)
                images[label] = preserved
        finally:
            (runner.output / "build-status.json").write_text(json.dumps(builds, indent=2) + "\n")
            # Keep at most one object/test build tree plus the two small complete
            # JDK images needed for the paired comparison. Images stay local.
            runner.run(label + "-cleanup", ["git", "worktree", "remove", "--force", worktree], root, 90)

    benchmark_ok = False
    if all(normal_ok.get(k) and k in images for k in ("correctness", "combined")):
        # Missing short-batch coverage is reported by the required regression;
        # it does not act as an optional observer gate on this diagnostic.
        comparison_deadline = min(runner.deadline, time.monotonic() + CAPS["comparison"])
        classes = scratch / "cost-classes"
        classes.mkdir(exist_ok=True)
        driver = root / ".github/scripts/WindowsVectorIOCost.java"
        compile_ok = runner.run("cost-compile", [images["correctness"] / "bin/javac.exe",
                                                 "-d", classes, driver], root, 20)
        benchmark_ok = compile_ok
        with (runner.output / "measurement.csv").open("w", newline="") as stream:
            writer = csv.writer(stream)
            writer.writerow(["pair", "image", "protocol", "vectors", "bytes", "iterations",
                             "wall_ns", "cpu_ns", "java_calls", "status"])
            if compile_ok:
                for pair, order in enumerate([("correctness", "combined"),
                                               ("combined", "correctness"),
                                               ("correctness", "combined")]):
                    for protocol in ("tcp", "udp"):
                        for vectors in (1, 16):
                            for size in (64, 4096):
                                for label in order:
                                    if time.monotonic() >= comparison_deadline:
                                        benchmark_ok = False
                                        continue
                                    name = f"cost-{pair}-{protocol}-{vectors}-{size}-{label}"
                                    ok = runner.run(name, [images[label] / "bin/java.exe", "-cp", classes,
                                                          "WindowsVectorIOCost", protocol, str(vectors),
                                                          str(size), "10000"], root,
                                                    min(CAPS["measurement"], comparison_deadline-time.monotonic()))
                                    raw = (runner.output / (name + ".log")).read_text().strip().splitlines()
                                    fields = raw[-1].split(",") if raw else []
                                    if ok and len(fields) == 7:
                                        writer.writerow([pair, label, *fields, "ok"])
                                    else:
                                        writer.writerow([pair, label, protocol, vectors, size, 10000,
                                                         "", "", "", "failed-or-timeout"])
                                        benchmark_ok = False
                                    stream.flush()
        summary = summarize_measurements(runner.output / "measurement.csv")
        (runner.output / "measurement-summary.json").write_text(json.dumps(summary, indent=2) + "\n")
        benchmark_ok = benchmark_ok and summary["successful_rows"] == 48
    result = {"builds": builds, "normal_tests": normal_ok, "required_short": required_ok,
              "benchmark_complete": benchmark_ok,
              "candidate_public_api_qualification": "passed" if all(normal_ok.get(k) and required_ok.get(k)
                                                 for k in ("correctness", "combined")) else "incomplete-or-failed",
              "baseline_control_complete": builds["baseline"] == "passed"
                                           and "baseline" in normal_ok and "baseline" in required_ok,
              "baseline_result_may_reproduce_defect": True,
              "native_fallback_abi_and_allocator_profile": "not qualified by these public API tests"}
    (runner.output / "outcome.json").write_text(json.dumps(result, indent=2) + "\n")
    return 0 if (result["candidate_public_api_qualification"] == "passed"
                 and result["baseline_control_complete"] and benchmark_ok) else 1


if __name__ == "__main__":
    sys.exit(main())
