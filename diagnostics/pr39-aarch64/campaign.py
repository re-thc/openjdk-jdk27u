#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 only, as published by
# the Free Software Foundation. See the LICENSE file for details.

"""One fixed, paired JMH campaign. No timing retries or adaptive sampling."""

import argparse
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import signal
import statistics
import subprocess
import time

BASE = "89885a6288e7aaabd01678a704a586272c0f96e3"
HEAD = "9fedf7ac9040bf1d46e383201524f1ca7a13a29e"
CANDIDATE = "d234724f75df8ec94427ba168533a5fc89fae714"
TREE = "b4693729ab5276f398ab6068b2377472284df285"
ARRAY = "org.openjdk.bench.java.util.ArraysMismatchEarlyExit"
MEMORY = "org.openjdk.bench.java.nio.MemoryMismatch"
HASH = "org.openjdk.bench.java.nio.BufferHashCode"
CHARS = "org.openjdk.bench.java.nio.CharBufferPutString"
MEASUREMENT_LIMIT = 29 * 60  # includes JVM startup, warmup, cold probes and analysis
MODES = {"c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=1000"],
         "c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"], "int": ["-Xint"]}


def row(benchmark, mode="c2", **params):
    return {"benchmark": benchmark, "mode": mode,
            "params": {k: str(v) for k, v in params.items()}}


def array(size, difference, kind="BYTE", offset=1, mode="c2", method="mismatch"):
    return row(ARRAY + "." + method, mode, size=size, difference=difference,
               kind=kind, offset=offset)


def memory(size, storage="NATIVE", difference="MATCH", method="segmentMismatch", mode="c2", alignment=1):
    return row(MEMORY + "." + method, mode, size=size, storage=storage,
               difference=difference, alignment=alignment)


def plan():
    screen = [array(size, at) for size in (8, 128) for at in range(1, 8)]
    screen += [array(64, 1, kind) for kind in
               ("BOOLEAN", "CHAR", "SHORT", "INT", "LONG", "FLOAT", "DOUBLE")]
    screen += [array(size, -1) for size in (8, 128, 65536)]
    screen += [array(65536, at) for at in (1, 7, 10)]
    screen += [array(131072, at) for at in (25, 82, 1267)]
    screen += [memory(65536, "NATIVE", "10"), memory(131072, "NATIVE", "25"),
               memory(131072, "HEAP_NATIVE", "82"), memory(131072, "NATIVE_HEAP", "1267")]
    main = []
    for storage in ("HEAP", "NATIVE", "HEAP_NATIVE", "NATIVE_HEAP", "DIRECT", "MAPPED"):
        main += [memory(size, storage) for size in (64, 128, 65537)]
        main += [memory(4096, storage, difference) for difference in ("MIDDLE", "LAST")]
    for storage in ("NATIVE", "DIRECT", "HEAP_NATIVE", "NATIVE_HEAP"):
        main += [memory(128, storage, difference) for difference in ("FIRST", "FIRST_WORD")]
    main += [memory(size) for size in (8, 63, 65, 127, 129, 4096, 65535, 65536, 1048576)]
    main += [memory(128, alignment=0), array(128, 7, offset=7)]
    for method in ("charMismatch", "intMismatch", "longMismatch"):
        for storage in ("NATIVE", "DIRECT", "HEAP_NATIVE"):
            main += [memory(128, storage, difference, method)
                     for difference in (("LAST",) if storage == "DIRECT" else ("MATCH", "LAST"))]
    for method in ("bufferMismatch", "bufferEquals", "bufferCompare"):
        main += [memory(128, "DIRECT", difference, method) for difference in ("MATCH", "FIRST_WORD")]
    main += [row(HASH + ".hash", size=size, kind=kind)
             for size in (3, 4, 1024) for kind in ("BYTE_DIRECT", "INT_VIEW")]
    char_cases = [("DIRECT", 31, "LATIN1"), ("DIRECT", 32, "LATIN1"),
                  ("DIRECT_SWAPPED", 63, "UTF16"), ("DIRECT_SWAPPED", 64, "UTF16"),
                  ("VIEW", 1025, "LATIN1"), ("VIEW_SWAPPED", 1025, "UTF16")]
    main += [row(CHARS + "." + method, kind=kind, length=length, coder=coder)
             for kind, length, coder in char_cases for method in ("put", "append")]
    for mode in ("c1", "int"):
        main += [array(128, at, mode=mode) for at in (-1, 7)]
        main += [memory(128, "NATIVE", difference, mode=mode) for difference in ("MATCH", "FIRST_WORD")]
        main += [memory(65537, "DIRECT", "MATCH", "bufferMismatch", mode)]
    return {"screen": screen, "main": main}


def save(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def run(command, log, timeout, cpu=None, cwd=None):
    """Bound the whole process group, including a timed-out JMH fork."""
    def prepare():
        os.setsid()
        if cpu is not None:
            os.sched_setaffinity(0, {cpu})
    with log.open("w") as output:
        output.write(json.dumps(command) + "\n")
        output.flush()
        process = subprocess.Popen(command, stdout=output, stderr=subprocess.STDOUT,
                                   preexec_fn=prepare, cwd=cwd)
        try:
            status = process.wait(timeout=timeout)
        except BaseException:
            os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            raise
    if status:
        raise RuntimeError(f"exit {status}: {log}")


def samples(path, case):
    results = json.loads(path.read_text())
    if len(results) != 1:
        raise ValueError(f"Expected one JMH result: {path}")
    result = results[0]
    metric = result["primaryMetric"]
    data = metric["rawData"]
    if (result["benchmark"] != case["benchmark"] or result.get("params") != case["params"]
            or result["forks"] != 1 or result["threads"] != 1
            or result["mode"] != "avgt" or metric["scoreUnit"] != "ns/op"
            or len(data) != 1 or len(data[0]) != 3):
        raise ValueError(f"Unexpected JMH result shape: {path}")
    values = data[0]
    if not all(math.isfinite(x) and x > 0 for x in values):
        raise ValueError(f"Invalid samples: {path}")
    return values


def verdict(observations, control=False):
    medians = {label: [statistics.median(block[label]) for block in observations]
               for label in ("base", "candidate")}
    ratios = [c / b for b, c in zip(medians["base"], medians["candidate"])]
    noise = any(max(values) / min(values) > 1.15
                for block in observations for values in block.values())
    noise |= any(max(values) / min(values) > 1.10 for values in medians.values())
    if control:
        status = "inconclusive" if noise or any(not 0.95 <= r <= 1.05 for r in ratios) else "pass"
    else:
        losses = [c > b * 1.05 and c - b > 1.0
                  for b, c in zip(medians["base"], medians["candidate"])]
        status = ("inconclusive" if noise else "regression" if all(losses)
                  else "inconclusive" if any(losses) else "pass")
    return {"status": status, "medians_ns": medians, "candidate_over_base": ratios}


def measure(root, evidence):
    if platform.system() != "Linux" or platform.machine() != "aarch64":
        raise RuntimeError("Native Linux AArch64 runner required; no emulated timing")
    if json.loads((evidence / "correctness-pass.json").read_text())["status"] != "pass":
        raise RuntimeError("Correctness gates must pass before timing")
    identity = json.loads((evidence / "source-identity.json").read_text())
    if (identity["base"], identity["head"], identity["candidate"], identity["candidate_tree"]) != (BASE, HEAD, CANDIDATE, TREE):
        raise RuntimeError("Source identity does not match the reviewed campaign")
    deadline = time.monotonic() + MEASUREMENT_LIMIT
    evidence.mkdir(parents=True, exist_ok=True)
    cases = plan()
    save(evidence / "plan.json", cases)
    cpu = min(os.sched_getaffinity(0))
    save(evidence / "measurement-host.json", {
        "cpu": cpu, "affinity": sorted(os.sched_getaffinity(0)),
        "uname": list(platform.uname()), "cpuinfo": Path("/proc/cpuinfo").read_text(),
        "os_release": Path("/etc/os-release").read_text(),
        "lscpu": subprocess.check_output(["lscpu", "-J"], text=True),
        "runner": {k: os.environ.get(k) for k in
                   ("ImageOS", "ImageVersion", "RUNNER_ARCH", "RUNNER_OS", "RUNNER_NAME", "GITHUB_RUN_ID", "GITHUB_RUN_ATTEMPT")}})
    java = {label: root / label / "build/qual-release/images/jdk/bin/java"
            for label in ("base", "candidate")}
    classpath = str(root / "classes") + ":" + str(root / "jmh/*")
    controls = [array(128, -1, method="control"),
                memory(4096, method="intMismatchOppositeOrder")]
    summary = []

    def invoke(case, name, block, label):
        remaining = deadline - time.monotonic()
        if remaining < 10:
            raise TimeoutError("Fixed 29 minute campaign limit reached")
        prefix = evidence / f"{name}-{block}-{label}"
        flags = ["-Xms256m", "-Xmx256m", "-XX:+UseG1GC", "--enable-native-access=ALL-UNNAMED",
                 "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED", "-XX:+PrintCompilation",
                 "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintIntrinsics"] + MODES[case["mode"]]
        command = [str(java["candidate"]), "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                   "-cp", classpath, "org.openjdk.jmh.Main", "^" + case["benchmark"] + "$",
                   "-jvm", str(java[label]), "-jvmArgs", " ".join(flags),
                   "-bm", "avgt", "-tu", "ns", "-wi", "2", "-w", "250ms",
                   "-i", "3", "-r", "250ms", "-f", "1", "-t", "1", "-foe", "true",
                   "-rf", "json", "-rff", str(prefix) + ".json"]
        for key, value in case["params"].items():
            command += ["-p", key + "=" + value]
        if case["benchmark"].startswith(CHARS):
            command += ["-prof", "gc"]
        with (evidence / "commands.jsonl").open("a") as output:
            output.write(json.dumps({"case": case, "name": name, "block": block, "label": label,
                                     "command": command, "time_ns": time.time_ns()}) + "\n")
        run(command, Path(str(prefix) + ".log"), min(90, remaining), cpu)
        return samples(Path(str(prefix) + ".json"), case)

    def pair(case, name, control=False):
        observations = []
        for block, order in enumerate((("base", "candidate"), ("candidate", "base"))):
            observations.append({label: invoke(case, name, block, label) for label in order})
        result = {"name": name, "case": case, "observations": observations,
                  **verdict(observations, control)}
        summary.append(result)
        save(evidence / "summary.json", summary)
        return result["status"]

    for stage, rows in cases.items():
        start = len(summary)
        for i, case in enumerate(controls):
            if pair(case, f"{stage}-control-before-{i}", True) != "pass":
                raise RuntimeError("Unstable control: campaign inconclusive, no retry")
        for i, case in enumerate(rows):
            print(f"{stage} {i + 1}/{len(rows)} {case}", flush=True)
            pair(case, f"{stage}-{i:03d}")
        for i, case in enumerate(controls):
            pair(case, f"{stage}-control-after-{i}", True)
        # Compare controls across both ends as well as within each balanced pair.
        for i in range(len(controls)):
            before = summary[start + i]
            after = summary[-len(controls) + i]
            for label in ("base", "candidate"):
                values = before["medians_ns"][label] + after["medians_ns"][label]
                if max(values) / min(values) > 1.10:
                    raise RuntimeError("Control drift: campaign inconclusive, no retry")
        if any(x["status"] != "pass" for x in summary[start:]):
            raise RuntimeError(f"{stage} gate failed: retain evidence; no extra samples")
    benefit = [x for x in summary if x["case"] == memory(4096)]
    if not benefit or not all(r <= 0.95 for r in benefit[0]["candidate_over_base"]):
        raise RuntimeError("No repeatable >=5% native 4 KiB equal-scan benefit; inconclusive")
    save(evidence / "performance-pass.json", {
        "status": "pass", "elapsed_seconds": MEASUREMENT_LIMIT - (deadline - time.monotonic()),
        "scope": "Fixed microbenchmark matrix on the recorded native Linux ARM CPU only"})


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("plan", "measure"))
    parser.add_argument("--root", type=Path)
    parser.add_argument("--evidence", type=Path)
    args = parser.parse_args()
    if args.action == "plan":
        print(json.dumps(plan(), indent=2))
    else:
        if not args.root or not args.evidence:
            parser.error("measure requires --root and --evidence")
        try:
            measure(args.root.resolve(), args.evidence.resolve())
        except Exception as error:
            args.evidence.mkdir(parents=True, exist_ok=True)
            save(args.evidence / "performance-stopped.json", {"status": "unqualified", "reason": str(error)})
            raise


if __name__ == "__main__":
    main()
