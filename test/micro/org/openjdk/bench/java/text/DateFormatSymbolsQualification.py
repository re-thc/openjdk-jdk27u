#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

"""Frozen qualification driver: source preparation does not execute this file.

See doc/date-format-symbols-qualification.md before authorizing execution.
Uses normal locally built images, standard JDK tools and Python3 only.
No retry, resume, case exclusion, affinity override or tolerance option exists.
"""

import argparse
import hashlib
import json
import math
import os
import platform
import pathlib
import random
import re
import statistics
import subprocess
import time

BASELINE = "89885a6288e7aaabd01678a704a586272c0f96e3"
REVIEWED_PRODUCT = "df0eeea79e4b568ed16051974d66485421ea5dd9"
PRODUCT_SHA256 = "792c0be285752dfa60844a71b9447e48bac42c8dea245d875a2f024544651e47"
PRODUCT = "src/java.base/share/classes/java/text/DateFormatSymbols.java"
MAIN = "org.openjdk.bench.java.text.DateFormatSymbolsQualification"
FOOTPRINT = "org.openjdk.bench.java.text.DateFormatSymbolsFootprint"
COLLECTORS = ("Serial", "G1", "Z")
CASES = (
    ("symbolsNew", 1), ("symbolsClone", 1), ("symbolsClone", 4),
    ("symbolsCloneShared", 4),
    ("symbolsCloneSerialized", 1), ("symbolsCloneSerialized", 4),
    ("symbolsCloneDeserialized", 1), ("symbolsCloneDeserialized", 4),
    ("symbolsCloneSubclass", 1), ("symbolsCloneSubclass", 4),
    ("symbolsCloneZones", 1), ("symbolsCloneZones", 4),
    ("formatterNewLocale", 1), ("formatterNewSymbols", 1),
    ("formatterClone", 1), ("formatUS", 1), ("parseUS", 1),
    ("formatJA", 1), ("parseJA", 1), ("parseInvalid", 1),
    ("serializeFresh", 1), ("serializeRepeated", 1),
    ("calendarControl", 1), ("numberCloneControl", 1),
)
CONTROLS = {"calendarControl", "numberCloneControl"}


def git(source, *arguments):
    return subprocess.check_output(["git", "-C", str(source), *arguments], text=True).strip()


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def interval(values):
    # Fork pairs are the units; the five within-fork samples are not replicates.
    rng = random.Random(20261017)
    means = sorted(statistics.mean(rng.choices(values, k=len(values))) for _ in range(20000))
    return [math.exp(means[index]) for index in (499, 19499)]


def paired(rows, metric):
    deltas = []
    ratios = []
    for block in sorted({r["block"] for r in rows}):
        pair = {r["label"]: statistics.median(r[metric]) for r in rows if r["block"] == block}
        ratio = pair["candidate"] / pair["baseline"]
        ratios.append(ratio)
        deltas.append(math.log(ratio))
    return dict(ratios=ratios, geometricMean=math.exp(statistics.mean(deltas)),
                interval95=interval(deltas))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline-source", type=pathlib.Path, required=True)
    parser.add_argument("--candidate-source", type=pathlib.Path, required=True)
    parser.add_argument("--candidate-ref", required=True)
    parser.add_argument("--platform", choices=("linux-x64", "linux-aarch64", "macos-arm64", "windows-x64"), required=True)
    parser.add_argument("--out", type=pathlib.Path, required=True)
    args = parser.parse_args()
    for name in ("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "LD_PRELOAD", "DYLD_INSERT_LIBRARIES"):
        if os.environ.get(name):
            raise RuntimeError("Remove ambient runtime injection before qualification: " + name)
    sources = {"baseline": args.baseline_source.resolve(), "candidate": args.candidate_source.resolve()}
    out = args.out.resolve()
    if any(out == source or source in out.parents for source in sources.values()):
        raise RuntimeError("Keep raw output outside both source trees")
    out.mkdir(parents=True, exist_ok=False)
    deadline = time.monotonic() + 11700  # 3h15m including compilation and all JVMs
    commits = {label: git(source, "rev-parse", "HEAD") for label, source in sources.items()}
    if commits["baseline"] != BASELINE:
        raise RuntimeError("Baseline identity mismatch")
    if commits["candidate"] != args.candidate_ref:
        raise RuntimeError("Candidate differs from the approved immutable revision")
    git(sources["candidate"], "merge-base", "--is-ancestor", REVIEWED_PRODUCT, "HEAD")
    for source in sources.values():
        if git(source, "status", "--porcelain"):
            raise RuntimeError("Source tree is dirty")
    if digest(sources["candidate"] / PRODUCT) != PRODUCT_SHA256:
        raise RuntimeError("Candidate production source differs from reviewed repair")
    here = sources["candidate"] / "test/micro/org/openjdk/bench/java/text"
    if pathlib.Path(__file__).resolve() != (here / pathlib.Path(__file__).name):
        raise RuntimeError("Use the candidate checkout's own driver")
    # Do not accidentally qualify unrelated or rejected product variants.
    changed = git(sources["candidate"], "diff", "--name-only", BASELINE, "HEAD").splitlines()
    for name in changed:
        if name != PRODUCT and not (name.startswith("doc/date-format-symbols-")
                or name.startswith("test/jdk/java/text/Format/DateFormat/DateFormatSymbols")
                or name.startswith("test/micro/org/openjdk/bench/java/text/DateFormatSymbols")):
            raise RuntimeError("Unrelated candidate change: " + name)
    expected_hosts = {
        "linux-x64": ("Linux", {"x86_64", "amd64"}),
        "linux-aarch64": ("Linux", {"aarch64", "arm64"}),
        "macos-arm64": ("Darwin", {"aarch64", "arm64"}),
        "windows-x64": ("Windows", {"amd64", "x86_64"}),
    }
    system, machines = expected_hosts[args.platform]
    if platform.system() != system or platform.machine().lower() not in machines:
        raise RuntimeError("Use a native matching platform and native Python interpreter")
    suffix = ".exe" if system == "Windows" else ""
    jdks = {label: source / "build/dfs-qual/images/jdk" for label, source in sources.items()}
    releases = {}
    profiles = {}
    for label, jdk in jdks.items():
        release = (jdk / "release").read_text()
        releases[label] = release
        fields = dict(re.findall(r'^([A-Z_]+)="(.*)"$', release, re.MULTILINE))
        if fields.get("OS_NAME") != system or fields.get("OS_ARCH", "").lower() not in machines:
            raise RuntimeError("Image is not native for the declared platform: " + label)
        forbidden_modules = {"java.desktop", "java.datatransfer", "java.se", "jdk.accessibility",
                             "jdk.editpad", "jdk.hotspot.agent", "jdk.jconsole", "jdk.jpackage",
                             "jdk.unsupported.desktop"}
        if not fields.get("MODULES") or forbidden_modules & set(fields["MODULES"].split()):
            raise RuntimeError("Image does not match the reduced module profile")
        spec = (sources[label] / "build/dfs-qual/spec.gmk").read_text()
        values = dict(re.findall(r'^([A-Z_a-z0-9]+)[ \t]*:=[ \t]*(.*)$', spec, re.MULTILINE))
        if values.get("ENABLE_DESKTOP") != "false" or values.get("ENABLE_HEADLESS_ONLY") != "true":
            raise RuntimeError("Use bin/configure-dev, not the full upstream profile")
        if values.get("JVM_VARIANTS", "").strip() != "server":
            raise RuntimeError("Use the pinned server-only profile")
        features = set(values.get("JVM_FEATURES_server", "").split())
        if {v for v in features if v.endswith("gc")} != {"serialgc", "g1gc", "zgc"}:
            raise RuntimeError("Unexpected collector profile")
        profiles[label] = {key: values[key].strip() for key in ("EXTRA_CFLAGS", "EXTRA_CXXFLAGS", "EXTRA_LDFLAGS")}
        expected_isa = {"linux-x64": "-march=x86-64-v3", "linux-aarch64": "-march=armv8.2-a",
                        "macos-arm64": "-mcpu=apple-m1", "windows-x64": "-arch:AVX2"}[args.platform]
        if any(expected_isa not in profiles[label][key] for key in ("EXTRA_CFLAGS", "EXTRA_CXXFLAGS")):
            raise RuntimeError("Repository CPU profile mismatch")
        if system == "Linux" and "-fuse-ld=mold" not in profiles[label]["EXTRA_LDFLAGS"]:
            raise RuntimeError("Repository Linux linker profile mismatch")
        source_line = next(line for line in release.splitlines() if line.startswith("SOURCE="))
        if commits[label][:12] not in source_line or "+" in source_line:
            raise RuntimeError("Image does not identify a clean pinned checkout: " + label)
    if profiles["baseline"] != profiles["candidate"]:
        raise RuntimeError("Baseline/candidate profile options differ")
    metadata = dict(platform=args.platform, commits=commits, reviewedProductAncestor=REVIEWED_PRODUCT,
                    productionSha256=PRODUCT_SHA256,
                    harnessHashes={p.name: digest(p) for p in (here / "DateFormatSymbolsQualification.java",
                        here / "DateFormatSymbolsQualification.py", here / "DateFormatSymbolsFootprint.java")},
                    releases=releases, profiles=profiles, blocks=8, cases=list(CASES), startupPairs=20,
                    operationBudgetRatio=1.02, startupBudget="max(5%,5ms)",
                    timingForks=1152, diagnosticForks=6, startupJvms=720, allocationJvms=6)
    (out / "identity.json").write_text(json.dumps(metadata, indent=2))

    completed = dict(invocations=0, timing=0, startup=0, allocation=0, diagnostic=0)

    def terminal(name, reason):
        (out / "terminal.json").write_text(json.dumps(dict(invocation=name, reason=reason,
                                                        completed=completed), indent=2))

    def run(command, name, limit=60):
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            raise TimeoutError("Fixed qualification deadline exhausted")
        with (out / "commands.jsonl").open("a") as stream:
            stream.write(json.dumps(dict(name=name, argv=list(map(str, command)))) + "\n")
        started = time.monotonic_ns()
        try:
            result = subprocess.run(list(map(str, command)), text=True, capture_output=True,
                                    timeout=min(limit, remaining))
        except subprocess.TimeoutExpired as error:
            partial = [str(error)]
            for value in (error.stdout, error.stderr):
                if value is not None:
                    partial.append(value.decode(errors="replace") if isinstance(value, bytes) else value)
            (out / (name + ".timeout.txt")).write_text("\n".join(partial))
            terminal(name, "invocation-timeout")
            raise
        elapsed = (time.monotonic_ns() - started) / 1e6
        (out / (name + ".txt")).write_text(result.stdout + result.stderr)
        if result.returncode:
            terminal(name, "nonzero-exit")
            raise RuntimeError("Failed invocation: " + name)
        completed["invocations"] += 1
        category = name.split("-", 1)[0]
        if category in completed:
            completed[category] += 1
        (out / "progress.json").write_text(json.dumps(completed, indent=2))
        return result.stdout, elapsed

    classes = out / "classes"
    run([jdks["candidate"] / ("bin/javac" + suffix), "-J-Xmx256m", "-J-XX:ActiveProcessorCount=4", "-d", classes,
         here / "DateFormatSymbolsQualification.java", here / "DateFormatSymbolsFootprint.java"], "compile", 120)
    manifest = out / "manifest"
    manifest.write_text("Premain-Class: " + FOOTPRINT + "\n")
    agent = out / "probe.jar"
    run([jdks["candidate"] / ("bin/jar" + suffix), "-J-Xmx256m", "-J-XX:ActiveProcessorCount=4", "--create", "--file", agent,
         "--manifest", manifest, "-C", classes, "."], "package", 120)

    def java(label, gc):
        return [jdks[label] / ("bin/java" + suffix), "-Xms512m", "-Xmx512m",
                "-XX:ActiveProcessorCount=4", "-XX:+Use" + gc + "GC",
                "-Duser.language=en", "-Duser.country=US", "-Duser.timezone=UTC"]

    # Every explicit GC must start; incompatible image/collector stops the run.
    allocation = {}
    for gc in COLLECTORS:
        allocation[gc] = {}
        for label in ("baseline", "candidate"):
            text, _ = run(java(label, gc) + ["--add-opens=java.base/java.text=ALL-UNNAMED",
                "-javaagent:" + str(agent), "-cp", classes, FOOTPRINT, "allocation"],
                "allocation-" + gc + "-" + label)
            cohorts = [dict(zip(("arrays", "slots", "arrayBytes", "instanceBytes"), map(int, row)))
                       for row in re.findall(r"retained clones=(?:false|true) arrays=(\d+) slots=(\d+) arrayBytes=(\d+) instanceBytes=(\d+)", text)]
            if len(cohorts) != 2:
                raise RuntimeError("Missing cohort measurements")
            allocation[gc][label] = cohorts
    (out / "allocation.json").write_text(json.dumps(allocation, indent=2))

    startup = []
    for block in range(20):
        labels = ("baseline", "candidate") if block % 2 == 0 else ("candidate", "baseline")
        for gc in COLLECTORS:
            for cds in ("off", "on"):
                for mode in ("noop", "symbols", "formatter"):
                    for label in labels:
                        name = f"startup-{block}-{gc}-{cds}-{mode}-{label}"
                        _, elapsed = run(java(label, gc) + ["-Xshare:" + cds, "-cp", classes,
                            MAIN + "$Startup", mode], name, 30)
                        row = dict(block=block, gc=gc, cds=cds, mode=mode,
                                   label=label, milliseconds=[elapsed])
                        startup.append(row)
                        with (out / "startup.jsonl").open("a") as stream:
                            stream.write(json.dumps(row) + "\n")
    # Separate first invocations above are retained; no OS caches are dropped.
    (out / "startup.json").write_text(json.dumps(startup, indent=2))

    rows = []
    for block in range(8):
        labels = ("baseline", "candidate") if block % 2 == 0 else ("candidate", "baseline")
        gc_order = COLLECTORS[block % 3:] + COLLECTORS[:block % 3]
        case_order = CASES[block % len(CASES):] + CASES[:block % len(CASES)]
        for gc in gc_order:
            for mode, threads in case_order:
                for label in labels:
                    name = f"timing-{block}-{gc}-{mode}-{threads}-{label}"
                    text, _ = run(java(label, gc) + ["-cp", classes, MAIN, mode, threads], name)
                    row = json.loads(text.strip().splitlines()[-1])
                    if row["mode"] != mode or row["threads"] != threads:
                        raise RuntimeError("Harness identity mismatch")
                    for metric in ("nsPerOp", "bytesPerOp"):
                        if len(row[metric]) != 5 or any(not math.isfinite(v) or v <= 0 for v in row[metric]):
                            raise RuntimeError("Invalid samples: " + name)
                    row.update(block=block, gc=gc, label=label)
                    rows.append(row)
                    with (out / "timing.jsonl").open("a") as stream:
                        stream.write(json.dumps(row) + "\n")
        print("completed timing block", block, flush=True)

    # One diagnostic per JDK/GC, never included among the timing fork pairs.
    for gc in COLLECTORS:
        for label in ("baseline", "candidate"):
            name = "diagnostic-" + gc + "-" + label
            run(java(label, gc) + ["-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                "-XX:LogFile=" + str(out / (name + ".xml")), "-XX:+PrintInlining",
                "-XX:CompileCommand=print,java.text.DateFormatSymbols::clone",
                "-XX:NativeMemoryTracking=summary", "-XX:+PrintNMTStatistics",
                "-cp", classes, MAIN, "symbolsCloneShared", "4"], name)

    summary = {}
    status = []
    invalid_controls = False
    retained_failure = False
    for gc in COLLECTORS:
        for mode, threads in CASES:
            if time.monotonic() > deadline:
                raise TimeoutError("Qualification deadline exhausted during analysis")
            key = f"{gc}/{mode}/{threads}"
            selected = [r for r in rows if r["gc"] == gc and r["mode"] == mode and r["threads"] == threads]
            observation = paired(selected, "nsPerOp")
            byte_ratios = paired(selected, "bytesPerOp")
            observation["allocation"] = byte_ratios
            lo, hi = observation["interval95"]
            if mode in CONTROLS:
                observation["gate"] = "pass" if lo >= 0.95 and hi <= 1.05 else "inconclusive"
                observation["allocationGate"] = "pass" if 0.99 <= byte_ratios["geometricMean"] <= 1.01 else "inconclusive"
                invalid_controls |= observation["gate"] != "pass" or observation["allocationGate"] != "pass"
            else:
                observation["gate"] = "pass" if hi <= 1.02 else ("regression" if lo > 1.02 else "inconclusive")
                # Sharing should materially reduce normal construction/clone
                # allocation. Fallback and reused paths must not increase it.
                allocation_limit = 0.30 if mode in ("symbolsNew", "symbolsClone", "symbolsCloneShared") else (
                    0.90 if mode in ("formatterNewLocale", "formatterNewSymbols", "formatterClone") else 1.01)
                if byte_ratios["geometricMean"] > allocation_limit:
                    observation["allocationGate"] = "fail"
                    status.append("regression")
                else:
                    observation["allocationGate"] = "pass"
            status.append(observation["gate"])
            summary[key] = observation
        for before, after in zip(allocation[gc]["baseline"], allocation[gc]["candidate"]):
            if before["arrays"] != 6000 or before["slots"] != 46000 or after["arrays"] != 6 or after["slots"] != 46:
                retained_failure = True
            if after["instanceBytes"] != before["instanceBytes"] or after["arrayBytes"] > 0.01 * before["arrayBytes"]:
                retained_failure = True
        for cds in ("off", "on"):
            for mode in ("noop", "symbols", "formatter"):
                selected = [r for r in startup if r["gc"] == gc and r["cds"] == cds and r["mode"] == mode]
                observation = paired(selected, "milliseconds")
                baseline_ms = statistics.median(r["milliseconds"][0] for r in selected if r["label"] == "baseline")
                limit = max(1.05, 1 + 5 / baseline_ms)
                lo, hi = observation["interval95"]
                observation["limitRatio"] = limit
                observation["gate"] = "pass" if hi <= limit else ("regression" if lo > limit else "inconclusive")
                if mode == "noop":
                    observation["gate"] = "pass" if lo >= 1 / limit and hi <= limit else "inconclusive"
                    invalid_controls |= observation["gate"] != "pass"
                status.append(observation["gate"])
                summary[f"startup/{gc}/{cds}/{mode}"] = observation
    summary["retainedCohortGate"] = "fail" if retained_failure else "pass"
    summary["controlValidity"] = "invalid" if invalid_controls else "valid"
    summary["measurementDecision"] = "not-qualified" if retained_failure else (
        "inconclusive" if invalid_controls else (
            "not-qualified" if "regression" in status else (
                "inconclusive" if "inconclusive" in status else "pass")))
    summary["qualificationDecision"] = "pending-correctness-ledger-review"
    summary["note"] = "Runner results alone cannot waive platform correctness or resource/identity checks. No historical timings are pooled."
    if time.monotonic() > deadline:
        raise TimeoutError("Qualification deadline exhausted before final summary")
    (out / "summary.json").write_text(json.dumps(summary, indent=2))
    print(json.dumps({key: summary[key] for key in ("measurementDecision", "qualificationDecision")}), flush=True)


if __name__ == "__main__":
    main()
