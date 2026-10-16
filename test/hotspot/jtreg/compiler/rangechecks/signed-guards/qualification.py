#!/usr/bin/env python3
"""Prepare/run one fixed source-based qualification batch; no timing campaign.

prepare performs source and dependency checks only. run launches the frozen
commands and returns 75 at internal technical-review gates, never auto-qualifying
graphs. A continuation uses the same request, clock, attempts and evidence.
"""
import argparse
import fcntl
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import time

import bounded_step

BASE = "758f41576fc79d35a62a3896dbe5ab97c448c436"
GIB = 1024 ** 3
HERE = Path(__file__).resolve().parent
COMPILER = "src/hotspot/share/opto/ifnode.cpp"
TESTDIR = "test/hotspot/jtreg/compiler/rangechecks"
SOURCES = [COMPILER] + [TESTDIR + "/" + name + ".java" for name in (
    "TestDominatingSignedRangeChecks", "TestDominatingSignedRangeDependencies",
    "Lookup64CaptureDriver", "RemainingRangeCaptureDriver")]
REGRESSIONS = [TESTDIR + "/" + name + ".java" for name in (
    "TestRangeCheckSmearing", "TestRangeCheckSmearingLoopOpts",
    "TestRangeCheckCastIISplitThruPhi", "TestRangeCheckCmpUUnderflow",
    "TestRangeCheckCmpUOverflow", "TestRangeCheckCmpUOverflowVsSub",
    "TestArrayAccessAboveRCAfterSmearingOrPredication",
    "TestArrayAccessAboveRCAfterSplitIf", "TestArrayAccessAboveRCAfterUnswitching",
    "TestArrayAccessCastIIAboveRC", "TestFoldedIfsWrongReexec",
    "TestFoldCompares", "TestFoldComparesFuzzer")]
REGRESSIONS += ["test/hotspot/jtreg/compiler/types/TestTypePropagationToCmpU.java"]
TARGETS = [
    ("TestDominatingSignedRangeChecks", "testLookup64"),
    ("TestDominatingSignedRangeChecks", "testLookup131"),
    *[("TestDominatingSignedRangeDependencies", name) for name in (
        "testAliasedReadBeforeWrite", "testDuplicateUpperGuard", "testDuplicateLowerGuard",
        "testDiamondIndex", "testInvariantLoop", "testGuardBeforeLoop")],
]


def git(repo, *args):
    return subprocess.check_output(["git", "-C", str(repo), *args], text=True).strip()


def prepare(args):
    repo, root, request = args.repository.resolve(), args.output.resolve(), args.request.resolve()
    if root.exists() or request.exists() or request.is_relative_to(root):
        raise RuntimeError("output must be absent; request must be new and outside output")
    if git(repo, "status", "--porcelain"):
        raise RuntimeError("review source must be a clean committed checkout")
    if not (repo / "test/lib/jdk/test/whitebox/WhiteBox.java").is_file():
        raise RuntimeError("a full source checkout is required")
    inputs = {}
    for p in [HERE / "qualification.py", HERE / "bounded_step.py", *[repo / p for p in SOURCES]]:
        inputs[str(p)] = bounded_step.digest(p)
    tools = {}
    for name in ("git", "bash", "gmake", "cp", "timeout"):
        path = shutil.which(name)
        if path is None:
            raise RuntimeError("missing existing prerequisite: " + name)
        tools[name] = str(Path(path).resolve())
        inputs[tools[name]] = bounded_step.digest(tools[name])
    for p in (args.boot_jdk / "bin/javac", args.boot_jdk / "bin/jar",
              args.boot_jdk / "bin/javap", args.jtreg / "bin/jtreg",
              args.jtreg / "lib/jtreg.jar", args.jtreg / "lib/javatest.jar"):
        inputs[str(p.resolve())] = bounded_step.digest(p)
    cpus = [int(v) for v in args.cpus.split(",")]
    if len(cpus) != 2 or len(set(cpus)) != 2 or not set(cpus) <= os.sched_getaffinity(0):
        raise RuntimeError("exactly two distinct allowed CPUs required; no substitution")
    source, steps, checkpoints = root / "source", [], []
    images = {name: root / "images" / name for name in (
        "baseline-release", "baseline-fastdebug", "candidate-fastdebug", "candidate-release")}

    def add(label, argv, seconds=60, rss=2 * GIB, one_cpu=False, **extra):
        step = dict(id=f"{len(steps):02d}-" + label, argv=list(map(str, argv)),
                    cwd=str(source), seconds=seconds, rss_bytes=rss,
                    cpus=cpus[:1] if one_cpu else cpus, **extra)
        steps.append(step)
        return step["id"]

    def configure(conf, debug):
        add("configure-" + conf, [tools["bash"], "./configure", "--with-conf-name=" + conf,
            "--with-debug-level=" + debug, "--with-jobs=2",
            "--with-boot-jdk=" + str(args.boot_jdk.resolve()),
            "--with-jtreg=" + str(args.jtreg.resolve()), *args.configure_arg], 180, 4 * GIB)

    def build(conf, label, target, seconds=1800):
        add("build-" + label, [tools["gmake"], "CONF=" + conf, "JOBS=2",
                              *args.make_arg, target], seconds, 6 * GIB, per_file_bytes=GIB)

    def snapshot(label, runtime, conf):
        dependencies = [] if label == "baseline-release" else ["identities/baseline-release.json"]
        add("copy-" + label, [tools["cp"], "-a", "--reflink=auto", runtime, images[label]],
            90, mkdir=["images"] if label == "baseline-release" else [],
            generated_input_manifests=dependencies)
        if label != "baseline-release":
            add("install-" + label, [tools["cp"], "--remove-destination",
                source / "build" / conf / "jdk/lib/server/libjvm.so",
                images[label] / "lib/server/libjvm.so"], generated_input_manifests=dependencies)
        add("seal-" + label, [sys.executable, HERE / "qualification.py", "seal", request,
                             label, images[label]], 90, generated_input_manifests=dependencies)

    add("checkout", [tools["git"], "-C", repo, "-c", "core.hooksPath=/dev/null",
        "worktree", "add", "--detach", source, BASE], 120)
    steps[0]["cwd"] = str(repo)
    configure("qualification-release", "release")
    build("qualification-release", "baseline-release", "images")
    snapshot("baseline-release", source / "build/qualification-release/images/jdk", "qualification-release")
    configure("qualification-debug", "fastdebug")
    build("qualification-debug", "baseline-fastdebug", "hotspot")
    snapshot("baseline-fastdebug", images["baseline-release"], "qualification-debug")
    for path in SOURCES:
        add("overlay-" + Path(path).stem.lower().replace("_", "-"),
            [tools["cp"], repo / path, source / path])
    build("qualification-debug", "candidate-fastdebug", "hotspot", 600)
    snapshot("candidate-fastdebug", images["baseline-release"], "qualification-debug")
    javac = args.boot_jdk.resolve() / "bin/javac"
    add("compile-whitebox", [javac, "-J-Xmx512m", "-proc:none", "-sourcepath", source / "test/lib",
        "-d", root / "wb-classes", source / "test/lib/jdk/test/whitebox/WhiteBox.java"],
        mkdir=["wb-classes", "classes"])
    add("jar-whitebox", [args.boot_jdk.resolve() / "bin/jar", "--create", "--file", root / "wb.jar",
                        "-C", root / "wb-classes", "."])
    classpath = os.pathsep.join(map(str, (root / "wb.jar", args.jtreg.resolve() / "lib/jtreg.jar",
                                        args.jtreg.resolve() / "lib/javatest.jar")))
    add("compile-common", [javac, "-J-Xmx512m", "-proc:none", "-cp", classpath, "-sourcepath",
        str(source / "test/lib") + os.pathsep + str(source / "test/hotspot/jtreg"),
        "-d", root / "classes", *[source / path for path in SOURCES[1:]]])
    add("seal-classes", [sys.executable, HERE / "qualification.py", "seal", request,
                        "common-classes", root / "classes"])
    add("record-bytecode", [args.boot_jdk.resolve() / "bin/javap", "-p", "-c", "-s", "-classpath",
        root / "classes", "compiler.rangechecks.TestDominatingSignedRangeChecks",
        "compiler.rangechecks.TestDominatingSignedRangeDependencies"],
        generated_input_manifests=["identities/common-classes.json"])

    def capture(label, holder, method):
        directory = "capture/" + label + "-" + method.lower()
        driver = "Lookup64CaptureDriver" if method == "testLookup64" else "RemainingRangeCaptureDriver"
        argv = [images[label] / "bin/java", "-Xshare:off", "-XX:+UseSerialGC", "-Xms512m", "-Xmx512m",
            "-XX:+UnlockDiagnosticVMOptions", "-XX:+WhiteBoxAPI", "-Xbootclasspath/a:" + str(root / "wb.jar"),
            "-XX:-TieredCompilation", "-XX:-BackgroundCompilation", "-XX:CompileThresholdScaling=10000",
            "-XX:ProfileMaturityPercentage=0",
            "-XX:CompileCommand=compileonly,compiler/rangechecks/" + holder + "::" + method,
            "-XX:PrintIdealGraphLevel=0", "-XX:PrintIdealGraphFile=" + str(root / directory / "ideal.xml"),
            "-XX:CompileCommand=IGVPrintLevel,compiler/rangechecks/" + holder + "::" + method + ",5",
            "-XX:+LogCompilation", "-XX:LogFile=" + str(root / directory / "compilation.xml"),
            "-XX:ErrorFile=" + str(root / directory / "hs_err_pid%p.log"), "-cp", root / "classes",
            "compiler.rangechecks." + driver]
        if driver != "Lookup64CaptureDriver":
            argv.append(method)
        return add("capture-" + label + "-" + method.lower(), argv, 120, one_cpu=True,
                   mkdir=[directory], generated_input_manifests=["identities/" + label + ".json",
                                                               "identities/common-classes.json"])

    for index, (holder, method) in enumerate(TARGETS):
        for label in ("baseline-fastdebug", "candidate-fastdebug"):
            last = capture(label, holder, method)
        if index in (0, len(TARGETS) - 1):
            checkpoints.append(dict(after=last, record="reviews/" + ("lookup64" if index == 0 else "dependencies") + ".json",
                reviewer="internal-review" if index == 0 else "internal-independent-review"))
    build("qualification-release", "candidate-release", "hotspot")
    snapshot("candidate-release", images["baseline-release"], "qualification-release")

    def jtreg(label, selection, mode):
        identity = label + "-" + mode
        flags = "-Xms1g -Xmx1g -Djdk.test.lib.random.seed=1597463007"
        if mode == "functional" or mode == "stress":
            flags += " -DVerifyIR=false"
        if mode == "stress":
            flags += (" -XX:+UnlockDiagnosticVMOptions -XX:+StressIGVN -XX:StressSeed=1597463007"
                      " -XX:VerifyIterativeGVN=111111 -XX:+VerifyLoopOptimizations")
        return add("jtreg-" + identity, [args.jtreg.resolve() / "bin/jtreg", "-retain:all", "-conc:1",
            "-verbose:summary", "-timeoutFactor:1", "-jdk:" + str(images[label]), "-javaoptions:" + flags,
            "-w:" + str(root / "jtreg" / identity / "work"), "-r:" + str(root / "jtreg" / identity / "report"),
            *[source / path for path in selection]], 600, 4 * GIB,
            generated_input_manifests=["identities/" + label + ".json", "identities/common-classes.json"])

    for label in images:
        jtreg(label, SOURCES[1:3], "ir" if label == "candidate-fastdebug" else "functional")
        jtreg(label, REGRESSIONS, "regressions")
    for label in ("baseline-fastdebug", "candidate-fastdebug"):
        jtreg(label, SOURCES[1:3], "stress")
    last = jtreg("baseline-fastdebug", SOURCES[1:2], "negative")
    steps[-1]["expected_ir_negative"] = True
    checkpoints.append(dict(after=last, record="reviews/baseline-negative.json", reviewer="internal-review"))
    inputs[str(Path(sys.executable).resolve())] = bounded_step.digest(Path(sys.executable).resolve())
    baseline_source = subprocess.check_output([tools["git"], "-C", str(repo), "show", BASE + ":" + COMPILER])
    plan = dict(schema=1, root=str(root), repository=str(repo), source_commit=git(repo, "rev-parse", "HEAD"),
        compiler_sources=dict(baseline=hashlib.sha256(baseline_source).hexdigest(),
                              candidate=inputs[str(repo / COMPILER)]),
        base_commit=BASE, inputs=inputs, timeout_program=tools["timeout"],
        limits=dict(overall_seconds=7200, termination_grace_seconds=2, start_free_bytes=13 * GIB,
            minimum_free_bytes=4 * GIB, root_bytes=9 * GIB, per_file_bytes=512 * 1024 ** 2,
            xml_bytes=256 * 1024 ** 2, log_bytes=64 * 1024 ** 2),
        clear_environment=["JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS", "JDK_JAVAC_OPTIONS",
                           "CLASSPATH", "MAKEFLAGS", "MFLAGS"],
        environment={}, review_checkpoints=checkpoints, steps=steps)
    request.parent.mkdir(parents=True, exist_ok=True)
    bounded_step.write_new(request, plan)
    print(json.dumps(dict(request=str(request), sha256=bounded_step.digest(request), steps=len(steps),
                          overall_seconds=7200, individual_ceiling_sum=sum(s["seconds"] for s in steps)), indent=2))


def seal(request_file, name, directory):
    plan = json.loads(request_file.read_text())
    root = Path(plan["root"])
    if name == "common-classes":
        files = list(directory.rglob("*.class")) + [root / "wb.jar"]
    else:
        expected = plan["compiler_sources"]["baseline" if name.startswith("baseline") else "candidate"]
        compiler_actual = bounded_step.digest(root / "source" / COMPILER)
        if compiler_actual != expected:
            raise RuntimeError("compiler source identity differs from declared variant")
        files = [p for p in directory.rglob("*") if p.is_file()]
        common = root / "images/baseline-release"
        if name != "baseline-release":
            reference = {p.relative_to(common) for p in common.rglob("*") if p.is_file()}
            actual_files = {p.relative_to(directory) for p in files}
            if reference != actual_files:
                raise RuntimeError("runtime file set changed")
            for relative in reference - {Path("lib/server/libjvm.so")}:
                if bounded_step.digest(common / relative) != bounded_step.digest(directory / relative):
                    raise RuntimeError("common runtime differs: " + str(relative))
    if not files:
        raise RuntimeError("cannot seal empty outputs")
    target = root / "identities" / (name + ".json")
    target.parent.mkdir(exist_ok=True)
    metadata = dict(request_sha256=bounded_step.digest(request_file),
        frozen_files={str(p): bounded_step.digest(p) for p in sorted(files)})
    if name != "common-classes":
        conf = "qualification-debug" if name.endswith("fastdebug") else "qualification-release"
        spec = root / "source/build" / conf / "spec.gmk"
        metadata.update(compiler_source_sha256=compiler_actual, configure_spec=str(spec),
                        configure_spec_sha256=bounded_step.digest(spec))
    bounded_step.write_new(target, metadata)


def run(request):
    plan = json.loads(request.read_text())
    root, request_hash = Path(plan["root"]), bounded_step.digest(request)
    def check_clock():
        if root.exists():
            origin = json.loads((root / "execution-start.json").read_text())
            if origin["request_sha256"] != request_hash:
                raise RuntimeError("request changed after execution started")
            if origin["boot_id"] != Path("/proc/sys/kernel/random/boot_id").read_text().strip():
                raise RuntimeError("host rebooted; execution identity changed")
            if time.monotonic() - origin["monotonic"] >= plan["limits"]["overall_seconds"]:
                raise RuntimeError("overall ceiling elapsed, including internal reviews")
    check_clock()
    lock = request.with_suffix(request.suffix + ".lock").open("a")
    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
    for step in plan["steps"]:
        check_clock()
        record = root / "records" / (step["id"] + ".result.json")
        started = root / "records" / (step["id"] + ".started.json")
        if not record.exists():
            if started.exists():
                raise RuntimeError("uncertain prior outcome; do not repeat: " + step["id"])
            subprocess.run([sys.executable, HERE / "bounded_step.py", request, step["id"]], check=False)
        result = json.loads(record.read_text())
        negative = step.get("expected_ir_negative") and result["reason"] is None and result["returncode"] == 1
        if not result["success"] and not negative:
            raise RuntimeError("fixed step failed; no retry: " + step["id"])
        if step.get("expected_ir_negative") and not negative:
            raise RuntimeError("expected baseline IR negative did not occur")
        if negative:
            unqualified = root / "reviews/baseline-negative.unqualified.json"
            unqualified.parent.mkdir(exist_ok=True)
            if not unqualified.exists():
                bounded_step.write_new(unqualified, dict(request_sha256=request_hash,
                    classification="UNQUALIFIED nonzero jtreg outcome; not a pass",
                    result_record=str(record.relative_to(root)), result_sha256=bounded_step.digest(record),
                    required_review="Only the exact redundant-check IR mismatch qualifies; all other failures stop"))
        for checkpoint in plan.get("review_checkpoints", []):
            if checkpoint["after"] == step["id"]:
                if not (root / checkpoint["record"]).exists():
                    print(json.dumps(dict(internal_review_required=checkpoint,
                        request_sha256=request_hash, continuation="same run command; no new approval or retries")))
                    return 75
                bounded_step.review_ready(root, checkpoint, request_hash)
    check_clock()
    print("Fixed qualification commands and internal review gates complete; no speed claim.")
    return 0


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="action", required=True)
    p = sub.add_parser("prepare")
    for flag in ("repository", "output", "request", "boot-jdk", "jtreg"):
        p.add_argument("--" + flag, type=Path, required=True)
    p.add_argument("--cpus", default="0,1")
    p.add_argument("--configure-arg", action="append", default=[])
    p.add_argument("--make-arg", action="append", default=[])
    p = sub.add_parser("run")
    p.add_argument("request", type=Path)
    p = sub.add_parser("seal")
    p.add_argument("request", type=Path)
    p.add_argument("name")
    p.add_argument("directory", type=Path)
    args = parser.parse_args()
    if args.action == "prepare":
        prepare(args)
    elif args.action == "run":
        return run(args.request.resolve())
    else:
        seal(args.request.resolve(), args.name, args.directory.resolve())
    return 0


if __name__ == "__main__":
    sys.exit(main())
