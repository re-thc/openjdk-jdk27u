#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 only, as published by
# the Free Software Foundation. See the LICENSE file for details.

"""Source identity, matched builds, common JMH classes and native safety gates."""

import argparse
import hashlib
import os
from pathlib import Path
import platform
import shutil
import subprocess
import tarfile
import time
import urllib.request

from campaign import BASE, HEAD, CANDIDATE, TREE, MODES, CommandSignal, Deadline, cancellation_signals, run, save

REPO = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
CORRECTNESS_LIMIT = 50 * 60
GIB = 1 << 30
ACTIVE_BUILD_ALLOWANCE = 5 * GIB
RETAINED_BUILD_ALLOWANCE = 2 * GIB
DISK_RESERVE = 2 * GIB
CCACHE_ALLOWANCE = GIB // 2
DEPS = {
    "org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar": "896f27e49105b35ea1964319c83d12082e7a79ef",
    "org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar": "da93888682df163144edf9b13d2b78e54166063a",
    "net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar": "4fdac2fbe92dfad86aa6e9301736f6b4342a3f5c",
    "org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar": "e4ba98f1d4b3c80ec46392f25e094a6a2e58fcbf",
}


def git(*args):
    return subprocess.check_output(["git", "-C", str(REPO), *args], text=True).strip()


def tree_bytes(path):
    return sum(p.stat().st_size for p in path.rglob("*") if p.is_file() and not p.is_symlink())


def capacity(path, evidence, label, required, **details):
    usage = shutil.disk_usage(path)
    record = {"path": str(path), "total_bytes": usage.total, "free_bytes": usage.free,
              "required_free_bytes": required, "admitted": usage.free >= required, **details}
    save(evidence / ("disk-" + label + ".json"), record)
    if not record["admitted"]:
        raise RuntimeError(f"Disk admission {label}: {usage.free} bytes free, {required} required; no further work admitted")


def prune_build(output, baseline):
    # Tests run from completed JDK/test images with test-only, without rebuilding C++.
    images = (output / "images").resolve()
    for path in images.rglob("*"):
        if path.is_symlink() and not path.resolve().is_relative_to(images):
            raise RuntimeError(f"Image link depends on external build output; refusing pruning: {path}")
    paths = ([p for p in output.iterdir() if p.name != "images"] if baseline else
             [output / "hotspot", output / "support/native"])
    for path in paths:
        if path.is_dir() and not path.is_symlink():
            shutil.rmtree(path)
        elif path.exists() or path.is_symlink():
            path.unlink()


def sources(root, evidence):
    if platform.system() != "Linux" or platform.machine() != "aarch64":
        raise RuntimeError("Native Linux AArch64 runner required")
    if os.environ.get("GITHUB_RUN_ATTEMPT") != "1":
        raise RuntimeError("Only the first campaign attempt is allowed")
    for ref, expected in (("refs/heads/claude/zealous-heisenberg-d1xxhi", HEAD), ("refs/heads/master", BASE)):
        actual = git("ls-remote", "origin", ref).split()[0]
        if actual != expected:
            raise RuntimeError(f"Concurrent source change at {ref}: {actual}; review new pins before launching")
    git("fetch", "--no-tags", "--depth=1", "origin", BASE, HEAD, CANDIDATE)
    if git("rev-parse", CANDIDATE + "^{tree}") != TREE:
        raise RuntimeError("Candidate merge tree changed")
    if git("rev-parse", "HEAD:src") != git("rev-parse", HEAD + ":src"):
        raise RuntimeError("Qualification branch has production edits outside the pinned candidate")
    parents = git("show", "-s", "--format=%P", CANDIDATE).split()
    if parents != [BASE, HEAD]:
        # --depth=1 can mark the commit as shallow: raw commit retains its parents.
        parents = [line.split()[1] for line in git("cat-file", "-p", CANDIDATE).splitlines() if line.startswith("parent ")]
    if parents != [BASE, HEAD]:
        raise RuntimeError(f"Unexpected candidate parents: {parents}")
    root.mkdir(parents=True, exist_ok=True)
    tracked_bytes = sum((REPO / p).stat().st_size for p in git("ls-files", "-z").split("\0") if p and (REPO / p).is_file())
    required = (2 * tracked_bytes + ACTIVE_BUILD_ALLOWANCE + RETAINED_BUILD_ALLOWANCE
                + CCACHE_ALLOWANCE + DISK_RESERVE)
    capacity(root, evidence, "campaign-admission", required, extra_checkout_bytes=2 * tracked_bytes,
             active_build_allowance=ACTIVE_BUILD_ALLOWANCE, retained_build_allowance=RETAINED_BUILD_ALLOWANCE,
             ccache_allowance=CCACHE_ALLOWANCE, safety_reserve=DISK_RESERVE)
    for label, sha in (("base", BASE), ("candidate", CANDIDATE)):
        git("worktree", "add", "--detach", str(root / label), sha)
    save(evidence / "source-identity.json", {
        "qualification_commit": git("rev-parse", "HEAD"),
        "qualification_tree": git("rev-parse", "HEAD^{tree}"),
        "base": BASE, "base_tree": git("rev-parse", BASE + "^{tree}"),
        "head": HEAD, "candidate": CANDIDATE, "candidate_tree": TREE,
        "candidate_parents": parents,
        "files": git("diff", "--name-status", BASE, CANDIDATE).splitlines()})
    (evidence / "production.patch").write_text(git("diff", BASE, CANDIDATE, "--", "src"))
    for command, name in ((["lscpu", "-J"], "lscpu"), (["gcc-16", "--version"], "gcc"),
                          (["g++-16", "--version"], "gxx"), (["ld", "--version"], "ld"),
                          (["dpkg-query", "-W"], "packages")):
        run(command, evidence / (name + ".log"), 30)
    (evidence / "cpuinfo.txt").write_text(Path("/proc/cpuinfo").read_text())
    (evidence / "meminfo.txt").write_text(Path("/proc/meminfo").read_text())
    (evidence / "os-release.txt").write_text(Path("/etc/os-release").read_text())
    save(evidence / "runner.json", {k: os.environ.get(k) for k in
         ("ImageOS", "ImageVersion", "RUNNER_ARCH", "RUNNER_OS", "RUNNER_NAME", "GITHUB_RUN_ID", "GITHUB_RUN_ATTEMPT")})


def build(root, evidence):
    os.environ.update(CC="gcc-16", CXX="g++-16", CONFIGURE_DEV_NO_MOLD="1",
                      CCACHE_DIR=str(root / "ccache"), CCACHE_MAXSIZE="512M")
    for label, level in (("base", "release"), ("candidate", "release"), ("candidate", "fastdebug")):
        source = root / label
        conf = "qual-" + level
        tag = label + "-" + level
        capacity(root, evidence, tag + "-admission", ACTIVE_BUILD_ALLOWANCE + DISK_RESERVE + CCACHE_ALLOWANCE)
        def guard():
            capacity(root, evidence, tag + "-live", DISK_RESERVE)
        options = ["bash", "bin/configure-dev", "--with-conf-name=" + conf,
                   "--with-debug-level=" + level, "--with-version-opt=pr39-qual", "--with-version-build=1",
                   "--with-source-date=2026-10-17T00:00:00Z",
                   "--with-boot-jdk=" + os.environ["BOOT_JDK"], "--with-jtreg=" + os.environ["JTREG"],
                   "--with-zlib=system", "--with-jmod-compress=zip-1", "--with-native-debug-symbols=none"]
        run(options, evidence / (tag + "-configure.log"), 600, cwd=source, disk_guard=guard)
        targets = ["images"] + (["test-image"] if label == "candidate" else [])
        run(["make", "CONF=" + conf, "JOBS=" + str(os.cpu_count()), *targets],
            evidence / (tag + "-build.log"), 3600, cwd=source, disk_guard=guard)
        output = source / "build" / conf
        shutil.copy2(output / "spec.gmk", evidence / (tag + "-spec.gmk"))
        shutil.copy2(output / "configure.log", evidence / (tag + "-configure-full.log"))
        image = output / "images/jdk"
        run(["bash", ".github/scripts/check-dev-profile.sh", str(image), str(output / "spec.gmk")],
            evidence / (tag + "-profile.log"), 120, cwd=source)
        hashes = {str(p.relative_to(image)): hashlib.sha256(p.read_bytes()).hexdigest()
                  for p in sorted(image.rglob("*")) if p.is_file()}
        save(evidence / (tag + "-image-sha256.json"), hashes)
        run([str(image / "bin/java"), "-XshowSettings:vm", "-version"],
            evidence / (tag + "-version.log"), 30)
        before = tree_bytes(output)
        prune_build(output, baseline=label == "base")
        save(evidence / (tag + "-footprint.json"), {"before_pruning_bytes": before,
             "retained_bytes": tree_bytes(output), "native_debug_symbols": "none"})
        capacity(root, evidence, tag + "-after-pruning", DISK_RESERVE)


def compile_fixtures(root, evidence):
    deps = root / "jmh"
    deps.mkdir()
    for path, expected in DEPS.items():
        data = urllib.request.urlopen("https://repo.maven.apache.org/maven2/" + path, timeout=60).read()
        if hashlib.sha1(data).hexdigest() != expected:
            raise RuntimeError("JMH dependency checksum mismatch: " + path)
        (deps / Path(path).name).write_bytes(data)
    save(evidence / "jmh-sha256.json", {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in deps.iterdir()})
    classes = root / "classes"
    classes.mkdir()
    micro = REPO / "test/micro/org/openjdk/bench/java"
    java_sources = [micro / "util/ArraysMismatchEarlyExit.java"]
    java_sources += [micro / ("nio/" + name + ".java") for name in
                     ("MemoryMismatch", "BufferHashCode", "CharBufferPutString")]
    java_sources += [HERE / "FixtureCheck.java", HERE / "ColdMismatch.java"]
    java = root / "candidate/build/qual-release/images/jdk/bin"
    cp = str(deps / "*")
    run([str(java / "javac"), "-cp", cp, "-processorpath", cp,
         "-processor", "org.openjdk.jmh.generators.BenchmarkProcessor",
         "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED", "-d", str(classes),
         *map(str, java_sources)], evidence / "compile-fixtures.log", 120)
    save(evidence / "fixture-source-sha256.json", {
        str(p.relative_to(REPO)): hashlib.sha256(p.read_bytes()).hexdigest() for p in java_sources})
    save(evidence / "fixture-class-sha256.json", {
        str(p.relative_to(classes)): hashlib.sha256(p.read_bytes()).hexdigest()
        for p in classes.rglob("*") if p.is_file()})
    for label in ("base", "candidate"):
        java = root / label / "build/qual-release/images/jdk/bin/java"
        run([str(java), "--enable-native-access=ALL-UNNAMED",
             "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
             "-cp", str(classes) + ":" + cp, "FixtureCheck"],
            evidence / (label + "-fixtures.log"), 180)


def correctness(root, evidence):
    deadline = Deadline(CORRECTNESS_LIMIT, "Correctness")
    pass_path = evidence / "correctness-pass.json"
    pass_path.unlink(missing_ok=True)
    candidate = root / "candidate"
    hotspot = ["compiler/intrinsics/NativeVectorizedMismatchTest.java#" + name
               for name in ("ir", "ir-serial", "ideal")]
    hotspot += ["compiler/intrinsics/InterpretedVectorizedMismatchTest.java#" + name
                for name in ("values", "no-intrinsics", "counted", "profiled")]
    hotspot += ["compiler/intrinsics/ShortNativeMismatchTest.java",
               "compiler/intrinsics/VectorizedMismatchTest.java#default",
               "compiler/igvn/RemoveDeadRegionFromVectorizedMismatchIntrinsic.java"]
    jdk = ["java/foreign/" + n + ".java" for n in
           ("TestNativeMismatch", "TestMappedNativeMismatch", "TestMismatchThreshold", "TestHandshake",
            "TestScopedOperations", "TestLongMismatch", "TestStringEncoding")]
    jdk = [p + "#default" if p.endswith("TestMappedNativeMismatch.java") else p for p in jdk]
    jdk += ["java/nio/Buffer/" + n + ".java" for n in
            ("BufferMismatchBoundaryTest", "DirectMismatchReachability", "BufferHashCode", "CharBufferViewPutString")]
    groups = [("fastdebug", "hotspot", None, ["test/hotspot/jtreg/" + p for p in hotspot]),
              ("release", "jdk-g1", "G1", ["test/jdk/" + p for p in jdk] +
               ["test/jdk/com/sun/jdi/VectorizedMismatchEventsTest.java"])]
    safety = [p for p in jdk if any(n in p for n in
              ("TestNativeMismatch.", "TestMappedNativeMismatch.", "TestHandshake.", "TestLongMismatch.",
               "BufferMismatchBoundaryTest.", "DirectMismatchReachability."))]
    groups += [("release", "jdk-" + gc.lower(), gc, ["test/jdk/" + p for p in safety]) for gc in ("Serial", "Z")]
    statuses = []
    for level, name, gc, tests in groups:
        deadline.remaining(minimum=1)
        # Serial graph tests select their own collector. Do not inject a conflicting GC.
        options = "JOBS=2;TIMEOUT_FACTOR=4;KEYWORDS=!manual"
        if gc:
            options += ";JAVA_OPTIONS=-XX:+Use" + gc + "GC"
        command = ["make", "CONF=qual-" + level, "test-only", "TEST=" + " ".join(tests), "JTREG=" + options]
        for directory in ("test-results", "test-support"):
            path = candidate / "build" / ("qual-" + level) / directory
            if path.exists():
                shutil.rmtree(path)
        passed = False
        interrupted = False
        try:
            run(command, evidence / (name + ".log"), deadline.remaining(minimum=1), cwd=candidate)
            deadline.remaining()
            verify_jtreg(candidate / "build" / ("qual-" + level) / "test-support", tests)
            deadline.remaining()
            passed = True
        except (CommandSignal, KeyboardInterrupt):
            interrupted = True
            raise
        finally:
            statuses.append({"group": name, "passed": passed, "tests": tests, "options": options})
            save(evidence / "correctness-status.json", statuses)
            if not interrupted:
                deadline.remaining()
                with tarfile.open(evidence / (name + "-jtreg.tar.gz"), "w:gz") as archive:
                    for directory in ("test-results", "test-support"):
                        deadline.remaining()
                        path = candidate / "build" / ("qual-" + level) / directory
                        if path.exists():
                            archive.add(path, arcname=directory)
                        deadline.remaining()
                deadline.remaining()
    # Fresh VMs check the unprofiled public entry before FixtureCheck or JMH warmup.
    for gc in ("Serial", "G1", "Z"):
        for mode in ("c2", "c1", "int"):
            for operation in ("array", "segment", "buffer", "int"):
                for size, at in ((128, 7), (65536, -1), (65540, 65539)):
                    command = [str(candidate / "build/qual-release/images/jdk/bin/java"),
                               "-XX:+Use" + gc + "GC", "--enable-native-access=ALL-UNNAMED", *MODES[mode],
                               "-cp", str(root / "classes"), "ColdMismatch", operation, str(size), str(at)]
                    run(command, evidence / f"cold-{gc}-{mode}-{operation}-{size}.log",
                        deadline.remaining(cap=30, minimum=1))
                    deadline.remaining()
    deadline.publish(pass_path, {"status": "pass", "groups": statuses, "fresh_vm_probes": 108,
                                "elapsed_seconds": time.monotonic() - deadline.start})


def verify_jtreg(work, tests):
    records = {}
    for path in work.rglob("*.jtr"):
        lines = path.read_text(errors="replace").splitlines()
        # jtreg serializes this field as a Java property, escaping the id separator.
        test = next((line[5:].replace("\\#", "#") for line in lines if line.startswith("test=")), None)
        status = next((line[11:] for line in lines if line.startswith("execStatus=")), "missing")
        if test:
            records[test] = status
    for test in tests:
        relative = test.removeprefix("test/hotspot/jtreg/").removeprefix("test/jdk/")
        selected = {name: status for name, status in records.items()
                    if name == relative or name.startswith(relative + "#")}
        if not selected or any(not status.startswith("Passed.") for status in selected.values()):
            raise RuntimeError(f"Missing, skipped, or failed required native test {relative}: {selected}")
    # These safety graph and event ids must execute, rather than being filtered by @requires.
    required = {
        "compiler/intrinsics/NativeVectorizedMismatchTest.java": ("ir", "ir-serial", "ideal"),
        "compiler/intrinsics/InterpretedVectorizedMismatchTest.java": ("values", "no-intrinsics", "counted", "profiled"),
        "java/foreign/TestMappedNativeMismatch.java": ("default",),
    }
    for test in tests:
        relative = test.removeprefix("test/hotspot/jtreg/").removeprefix("test/jdk/")
        for test_id in required.get(relative, ()):
            if not records.get(relative + "#" + test_id, "missing").startswith("Passed."):
                raise RuntimeError(f"Required test id not passed: {relative}#{test_id}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stage", choices=("sources", "build", "compile", "correctness"))
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--evidence", type=Path, required=True)
    args = parser.parse_args()
    root, evidence = args.root.resolve(), args.evidence.resolve()
    evidence.mkdir(parents=True, exist_ok=True)
    {"sources": sources, "build": build, "compile": compile_fixtures, "correctness": correctness}[args.stage](root, evidence)


if __name__ == "__main__":
    with cancellation_signals():
        main()
