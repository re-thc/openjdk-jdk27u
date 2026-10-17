#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 only, as published by
# the Free Software Foundation. See the LICENSE file for details.

"""One fixed, paired JMH campaign. No timing retries or adaptive sampling."""

import argparse
from contextlib import contextmanager
import json
import math
import os
from pathlib import Path
import platform
import re
import signal
import statistics
import subprocess
import time
import xml.etree.ElementTree as ET

BASE = "89885a6288e7aaabd01678a704a586272c0f96e3"
HEAD = "9fedf7ac9040bf1d46e383201524f1ca7a13a29e"
REPAIR = "93926eadc57265249c5cfeef35a4975a551e827a"
MERGE_BASE = "e206bae32b2a6cc1fa9464ad34d75f2df4b347e9"
CANDIDATE = "a7ca575cbf71a0ad451b5986f3b50132489b8c0f"
TREE = "9587ce8f3a1076fea952b85fd27590ea002213c6"
MERGE_MESSAGE = "Merge repaired PR39 93926eadc572 into pinned master for native qualification\n"
MERGE_DATE = "2026-10-17T00:00:00+00:00"
ARRAY = "org.openjdk.bench.java.util.ArraysMismatchEarlyExit"
MEMORY = "org.openjdk.bench.java.nio.MemoryMismatch"
HASH = "org.openjdk.bench.java.nio.BufferHashCode"
CHARS = "org.openjdk.bench.java.nio.CharBufferPutString"
MEASUREMENT_LIMIT = 29 * 60  # includes JVM startup, warmup and analysis
CLEANUP_TERM_SECONDS = 2
CLEANUP_KILL_SECONDS = 2
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
    screen = [memory(4096)]
    screen += [array(size, at) for size in (8, 128) for at in range(1, 8)]
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
        main += [memory(4096, storage, "MIDDLE" if storage == "NATIVE" else "LAST")]
    main.remove(memory(64, "HEAP"))
    for storage in ("NATIVE", "DIRECT", "HEAP_NATIVE", "NATIVE_HEAP"):
        main += [memory(128, storage, difference) for difference in ("FIRST", "FIRST_WORD")]
    main += [memory(size) for size in (8, 63, 65, 127, 129, 65535, 65536, 1048576)]
    for method in ("charMismatch", "intMismatch", "longMismatch"):
        for storage in ("NATIVE", "DIRECT", "HEAP_NATIVE"):
            main += [memory(128, storage, difference, method)
                     for difference in (("LAST",) if storage == "DIRECT" else
                                        ("MATCH",) if storage == "HEAP_NATIVE" else ("MATCH", "LAST"))]
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
    for storage in ("HEAP", "HEAP_NATIVE", "NATIVE_HEAP"):
        main += [memory(size, storage, difference, mode="c1") for size in (64, 128)
                 for difference in ("MATCH", "FIRST_WORD")]
    return {"screen": screen, "main": main}


def save(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


class Deadline:
    def __init__(self, seconds, label):
        self.start = time.monotonic()
        self.end = self.start + seconds
        self.label = label

    def remaining(self, cap=None, minimum=0):
        remaining = self.end - time.monotonic()
        if remaining <= minimum:
            raise TimeoutError(self.label + " deadline reached")
        return remaining if cap is None else min(cap, remaining)

    def publish(self, path, value):
        """Late serialization or rename must not leave a passing marker."""
        pending = path.with_name(path.name + ".pending")
        try:
            self.remaining()
            save(pending, value)
            self.remaining()
            pending.replace(path)
            self.remaining()
        except BaseException:
            path.unlink(missing_ok=True)
            raise
        finally:
            pending.unlink(missing_ok=True)


class CommandSignal(SystemExit):
    def __init__(self, signum):
        self.signum = signum
        super().__init__(128 + signum)


@contextmanager
def cancellation_signals():
    """Cover non-command work, including atomic receipt publication."""
    previous = {}
    def interrupted(signum, frame):
        raise CommandSignal(signum)
    try:
        for signum in (signal.SIGTERM, signal.SIGINT, signal.SIGHUP):
            previous[signum] = signal.signal(signum, interrupted)
        yield
    finally:
        for signum, handler in previous.items():
            signal.signal(signum, handler)


def stop_owned_group(process, output):
    """TERM then KILL, including descendants after the leader exits."""
    if process.pid == os.getpgrp():
        raise RuntimeError("Refusing to signal the wrapper's process group")

    def send(signum):
        try:
            os.killpg(process.pid, signum)
        except ProcessLookupError:
            pass

    send(signal.SIGTERM)
    try:
        process.wait(timeout=CLEANUP_TERM_SECONDS)
    except subprocess.TimeoutExpired:
        output.write("Owned process group exceeded TERM grace; sending KILL\n")
        output.flush()
    finally:
        send(signal.SIGKILL)
    try:
        process.wait(timeout=CLEANUP_KILL_SECONDS)
    except subprocess.TimeoutExpired as error:
        raise RuntimeError("Owned child not reaped within cleanup bound") from error


def run(command, log, timeout, cpu=None, cwd=None, disk_guard=None):
    """Own the group through timeout, cancellation and the Popen return race."""
    if timeout <= 0:
        raise TimeoutError("No time remains to start a command")
    process = None
    received_signal = None
    stopping = False

    def interrupted(signum, frame):
        nonlocal received_signal
        received_signal = signum
        # Popen may have spawned but not returned: record ownership before raising.
        if process is not None and not stopping:
            raise CommandSignal(signum)

    def affinity():
        os.sched_setaffinity(0, {cpu})

    with log.open("w") as output:
        output.write(json.dumps(command) + "\n")
        output.flush()
        previous = {}
        try:
            for signum in (signal.SIGTERM, signal.SIGINT, signal.SIGHUP):
                previous[signum] = signal.signal(signum, interrupted)
            if received_signal is not None:
                raise CommandSignal(received_signal)
            if disk_guard:
                disk_guard()
            if received_signal is not None:
                raise CommandSignal(received_signal)
            process = subprocess.Popen(command, stdout=output, stderr=subprocess.STDOUT,
                                       start_new_session=True,
                                       preexec_fn=affinity if cpu is not None else None, cwd=cwd)
            if received_signal is not None:
                raise CommandSignal(received_signal)
            if disk_guard is None:
                status = process.wait(timeout=timeout)
            else:
                end = time.monotonic() + timeout
                while True:
                    disk_guard()
                    remaining = end - time.monotonic()
                    if remaining <= 0:
                        raise subprocess.TimeoutExpired(command, timeout)
                    try:
                        status = process.wait(timeout=min(2, remaining))
                        break
                    except subprocess.TimeoutExpired:
                        if time.monotonic() >= end:
                            raise
        finally:
            stopping = True
            cleaned = False
            try:
                if process is not None:
                    stop_owned_group(process, output)
                cleaned = True
            finally:
                for signum, handler in previous.items():
                    signal.signal(signum, handler)
                if received_signal is not None:
                    output.write(f"Wrapper signal {received_signal}; owned group cleanup {'completed' if cleaned else 'failed'}\n")
                    output.flush()
                    raise CommandSignal(received_signal)
    if status:
        raise RuntimeError(f"exit {status}: {log}")


class ProfilingUnavailable(ValueError):
    pass


def validate_gc(metrics, path):
    def metric(name, unit):
        item = metrics.get(name)
        if item is None:
            raise ProfilingUnavailable(f"Missing {name}: profiler unsupported or disabled in {path}")
        data = item.get("rawData", [])
        values = [item.get("score")] + (data[0] if len(data) == 1 else [])
        if (item.get("scoreUnit") != unit or len(data) != 1 or len(data[0]) != 3
                or not all(isinstance(x, (int, float)) and math.isfinite(x) and x >= 0 for x in values)):
            raise ProfilingUnavailable(f"Invalid {name}: profiling evidence unavailable in {path}")
        if name == "gc.count" and any(x != int(x) for x in data[0]):
            raise ProfilingUnavailable(f"Invalid collection count in {path}")
        return item

    rate = metric("gc.alloc.rate", "MB/sec")
    metric("gc.count", "counts")
    # JMH omits these when allocation is exactly zero or collection time unchanged.
    for name, unit in (("gc.alloc.rate.norm", "B/op"), ("gc.time", "ms")):
        item = metrics.get(name)
        if item is None:
            if name == "gc.alloc.rate.norm" and any(x > 0 for x in rate["rawData"][0]):
                raise ProfilingUnavailable(f"Positive allocation without normalized evidence in {path}")
            continue
        # Optional metrics can have fewer observations when omitted for zero deltas.
        score = item.get("score")
        if item.get("scoreUnit") != unit or not isinstance(score, (int, float)) or not math.isfinite(score) or score < 0:
            raise ProfilingUnavailable(f"Invalid optional metric {name} in {path}")


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
    validate_gc(result.get("secondaryMetrics", {}), path)
    return values


def benchmark_methods(case):
    klass, _, method = case["benchmark"].rpartition(".")
    package, _, simple = klass.rpartition(".")
    worker = package + ".jmh_generated." + simple + "_" + method + "_jmhTest"
    return ((klass, method), (worker, method + "_avgt_jmhStub"))


def callee_methods(case):
    # Descriptors come from the retained native screen's installed C2 records.
    vector = ("jdk.internal.util.ArraysSupport", "vectorizedMismatch",
              "(Ljava/lang/Object;JLjava/lang/Object;JII)I")
    if case["benchmark"] == ARRAY + ".mismatch":
        kind = {"BYTE": "B", "BOOLEAN": "Z", "CHAR": "C", "SHORT": "S",
                "INT": "I", "LONG": "J", "FLOAT": "F", "DOUBLE": "D"}[case["params"]["kind"]]
        return (vector, ("java.util.Arrays", "mismatch", f"([{kind}II[{kind}II)I"),
                ("jdk.internal.util.ArraysSupport", "mismatch", f"([{kind}I[{kind}II)I"))
    if case["benchmark"].startswith(MEMORY + "."):
        scoped = "(Ljdk/internal/foreign/MemorySessionImpl;Ljdk/internal/foreign/MemorySessionImpl;Ljava/lang/Object;JLjava/lang/Object;JJ)J"
        return (vector,
                ("jdk.internal.foreign.AbstractMemorySegmentImpl", "mismatch", "(Ljava/lang/foreign/MemorySegment;)J"),
                ("jdk.internal.foreign.SegmentBulkOperations", "mismatch",
                 "(Ljdk/internal/foreign/AbstractMemorySegmentImpl;JJLjdk/internal/foreign/AbstractMemorySegmentImpl;JJ)J"),
                ("jdk.internal.misc.ScopedMemoryAccess", "vectorizedMismatchLargeForBytes", scoped),
                ("jdk.internal.misc.ScopedMemoryAccess", "vectorizedMismatchLargeForBytesInternal", scoped))
    return ()


def print_commands(case):
    targets = [owner + "::" + method for owner, method in benchmark_methods(case)]
    targets += [owner + "::" + method + "," + signature
                for owner, method, signature in callee_methods(case)]
    return ["-XX:CompileCommand=print," + target for target in targets]


def compilation_windows(prefix, case):
    phase, events, boundaries = "startup", [], []
    for number, line in enumerate(prefix.with_suffix(".log").read_text().splitlines(), 1):
        marker = re.search(r"(# Warmup Iteration|(?<!Warmup )\bIteration)\s+(\d+):", line)
        if marker:
            phase = ("warmup" if marker[1].startswith("#") else "measurement") + "-" + marker[2]
            boundaries.append({"line": number, "phase": phase})
        event = re.search(r"(?:^|:\s+)(\d+)\s+(\d+)\s+.*?([\w.$/]+)::([\w$<>]+)", line)
        if event:
            events.append({"line": number, "phase": phase, "uptime_ms": int(event[1]),
                           "compile_id": event[2], "method": event[3] + "::" + event[4],
                           "text": line.strip()})
        if re.search(r"\b[0-9.]+ ns/op\s*$", line) or line.startswith(("Result ", "# Run complete")):
            phase = "between-iterations-or-post-measurement"
    save(prefix.with_name(prefix.name + "-compilation-windows.json"), {
        "boundaries": boundaries, "events": events,
        "measurement_events": [event for event in events if event["phase"].startswith("measurement-")],
        "print_commands": print_commands(case),
        "scope": "Console-order iteration brackets; review XML installation stamps, invalidations and raw code dumps before tier or instruction attribution. Missing helper/stub bytes limit conclusions to end-to-end call paths."})


def installed_tier(prefix, case):
    paths = list(prefix.parent.glob(prefix.name + "-compilation-*.xml"))
    if not paths:
        raise ValueError(f"Missing installed-code log for {prefix}")
    targets = benchmark_methods(case)
    records, callees = [], []
    for path in paths:
        for node in ET.parse(path).iter("nmethod"):
            spec = node.get("method", "").split()
            if len(spec) < 2:
                continue
            owner, name = spec[0].replace("/", "."), spec[1]
            if (owner, name) in targets:
                records.append(dict(node.attrib))
            if len(spec) >= 3 and (owner, name, spec[2]) in callee_methods(case):
                callees.append(dict(node.attrib))
    expected = {"c2": "c2", "c1": "c1", "int": None}[case["mode"]]
    if expected is None:
        valid = not records
    else:
        valid = any(n.get("compiler") == expected and
                    (expected != "c1" or n.get("level") == "1") for n in records)
    if not valid:
        raise ValueError(f"Installed benchmark tier disagrees with {case['mode']}: {prefix}")
    save(prefix.with_name(prefix.name + "-installed-code.json"), {
        "requested_mode": case["mode"], "installed_nmethods": records,
        "callee_nmethods": callees,
        "review": "Check installation stamps, measured-iteration boundaries and deoptimization before tier attribution"})


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
    if (identity["base"], identity["head"], identity["repair"], identity["candidate"], identity["candidate_tree"]) != (BASE, HEAD, REPAIR, CANDIDATE, TREE):
        raise RuntimeError("Source identity does not match the reviewed campaign")
    deadline = Deadline(MEASUREMENT_LIMIT, "Measurement")
    (evidence / "performance-pass.json").unlink(missing_ok=True)
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
        deadline.remaining(minimum=10)
        prefix = evidence / f"{name}-{block}-{label}"
        flags = ["-Xms256m", "-Xmx256m", "-XX:+UseG1GC", "--enable-native-access=ALL-UNNAMED",
                 "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED", "-XX:+PrintCompilation",
                 "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintIntrinsics", "-XX:+LogCompilation",
                 "-XX:LogFile=" + str(prefix) + "-compilation-%p.xml"]
        flags += print_commands(case)
        flags += MODES[case["mode"]]
        # A third fixed warmup can absorb the observed normal-worker recompile.
        # Retain the stability gates and allow no retries or extra measured samples.
        command = [str(java["candidate"]), "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED",
                   "-cp", classpath, "org.openjdk.jmh.Main", "^" + case["benchmark"] + "$",
                   "-jvm", str(java[label]), "-jvmArgs", " ".join(flags),
                   "-bm", "avgt", "-tu", "ns", "-wi", "3", "-w", "250ms",
                   "-i", "3", "-r", "250ms", "-f", "1", "-t", "1", "-foe", "true",
                   "-rf", "json", "-rff", str(prefix) + ".json"]
        for key, value in case["params"].items():
            command += ["-p", key + "=" + value]
        command += ["-prof", "gc"]
        with (evidence / "commands.jsonl").open("a") as output:
            output.write(json.dumps({"case": case, "name": name, "block": block, "label": label,
                                     "command": command, "time_ns": time.time_ns()}) + "\n")
        run(command, Path(str(prefix) + ".log"), deadline.remaining(cap=90, minimum=10), cpu)
        deadline.remaining()
        values = samples(Path(str(prefix) + ".json"), case)
        installed_tier(prefix, case)
        compilation_windows(prefix, case)
        deadline.remaining()
        return values

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
            status = pair(case, f"{stage}-{i:03d}")
            if stage == "screen" and i == 0:
                # Admit the remaining fixed matrix only after the existing native
                # equal-scan case passes stability and the benefit in both orders.
                if status != "pass" or not all(r <= 0.95 for r in summary[-1]["candidate_over_base"]):
                    raise RuntimeError("No stable paired >=5% native 4 KiB equal-scan benefit; stop before later rows, no retry")
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
    deadline.publish(evidence / "performance-pass.json", {
        "status": "pass", "elapsed_seconds": time.monotonic() - deadline.start,
        "scope": "Deterministic screen of the fixed observed matrix; no statistical confidence claim",
        "tier_attribution": "Review installed nmethods and measurement boundaries in retained logs before attributing results to a tier"})


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
    with cancellation_signals():
        main()
