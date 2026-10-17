#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Reproduce the fixed actual-image qualification/measurement protocol."""
import argparse
import csv
import json
import os
from pathlib import Path
import platform
import re
import shutil
import statistics
import subprocess
import time

parser = argparse.ArgumentParser()
parser.add_argument("action", choices=["prepare", "verify", "measure", "load-diagnostic"])
parser.add_argument("--jdk", required=True, type=Path)
parser.add_argument("--baseline", required=True, type=Path)
parser.add_argument("--cached-patch", required=True, type=Path)
parser.add_argument("--out", type=Path, default=Path("/tmp/instant-production-probe"))
parser.add_argument("--fault-dir", type=Path, help="precompiled fault libraries (required on Windows)")
args = parser.parse_args()
here = Path(__file__).resolve().parent
repo = here.parents[2]
out = args.out.resolve()
evidence = out / "evidence"
evidence.mkdir(parents=True, exist_ok=True)
wall_times = {}
system = platform.system()
windows = system.startswith(("Windows", "CYGWIN", "MSYS"))
macos = system == "Darwin"
executable_suffix = ".exe" if windows else ""
native_suffix = ".dll" if windows else (".dylib" if macos else ".so")
native_prefix = "" if windows else "lib"
native_dir = "bin" if windows else "lib"
native_name = native_prefix + "instant" + native_suffix
load_pattern = r"Loaded library [^\n]*instant(?:\.so|\.dylib|\.dll)"

def invoke(name, command, timeout=240):
    begin = time.monotonic_ns()
    try:
        result = subprocess.run([str(s) for s in command], text=True, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT, timeout=timeout)
    except subprocess.TimeoutExpired as ex:
        output = ex.stdout or b""
        if isinstance(output, bytes): output = output.decode(errors="replace")
        (evidence / (name + ".log")).write_text(json.dumps([str(s) for s in command]) + "\nTIMEOUT\n" + output)
        raise
    wall_times[name] = time.monotonic_ns() - begin
    (evidence / (name + ".log")).write_text(json.dumps([str(s) for s in command]) +
        "\nprocess_wall_ns=" + str(wall_times[name]) + "\n" + result.stdout)
    if result.returncode:
        raise RuntimeError(f"{name} failed: exit{result.returncode}; {evidence / (name + '.log')}")
    return result.stdout

def java(mode, compact=True, gc="G1", stress=False):
    home = args.baseline if mode in ("baseline", "cached") else (out / "fault-jdk" if mode == "fault" else args.jdk)
    cmd = [home / ("bin/java" + executable_suffix), "-Xms64m" if stress else "-Xms256m", "-Xmx64m" if stress else "-Xmx256m",
           "-XX:ActiveProcessorCount=2", f"-XX:+Use{gc}GC", "-XX:+CompactStrings" if compact else "-XX:-CompactStrings"]
    if mode == "cached": cmd += ["--patch-module", f"java.base={args.cached_patch}"]
    if mode == "disabled": cmd += ["-Djdk.time.instantSpeedate=false"]
    return cmd

def run(name, mode, action, flags=(), compact=True, gc="G1", stress=False):
    return invoke(name, java(mode, compact, gc, stress) + list(flags) +
                  ["-cp", out / "classes", "ProductionProbe"] + list(action))

if args.action == "prepare":
    (out / "classes").mkdir(exist_ok=True)
    invoke("compile-probe", [args.jdk / ("bin/javac" + executable_suffix), "--add-exports", "java.base/jdk.internal.misc=ALL-UNNAMED",
                             "-d", out / "classes", here / "ProductionProbe.java"])
    # Fault injection is confined to a scratch image copy; actual images stay intact.
    source = repo / "src/java.base/share/native/libinstant/InstantParser.c"
    for fault, macro in [("failure", "INSTANT_SPEEDATE_FORCE_FAILURE"), ("symbol", "INSTANT_SPEEDATE_NO_SYMBOL"), ("onload", None)]:
        name = native_prefix + "instant_" + fault + native_suffix
        if args.fault_dir:
            shutil.copyfile(args.fault_dir / name, out / name)
        else:
            if windows: raise RuntimeError("Windows prepare requires --fault-dir; see PLATFORM_VALIDATION.md")
            invoke("compile-" + fault, [os.environ.get("CC", "cc"), "-O2", "-dynamiclib" if macos else "-shared",
                "-fPIC"] + (["-D" + macro] if macro else []) + ["-I" + str(args.jdk / "include"),
                "-I" + str(args.jdk / ("include/darwin" if macos else "include/linux")),
                source if macro else here / "OnLoad.c", "-o", out / name])
    # Image legal files are deliberately read-only; replace the scratch tree
    # rather than trying to overwrite those files on a repeated prepare.
    if (out / "fault-jdk").exists(): shutil.rmtree(out / "fault-jdk")
    (out / "fault-jdk").mkdir()
    invoke("copy-fault-image", ["cp", "-a"] + (["--reflink=auto"] if system == "Linux" else []) +
           [str(args.jdk) + "/.", out / "fault-jdk"])
    print("prepared", out)
elif args.action == "load-diagnostic":
    # Separate diagnostic: reflection setup dominates the original load action.
    # This patch adds only a measurement class, not a parser replacement.
    patch = out / "load-patch"; patch.mkdir(exist_ok=True)
    invoke("compile-direct-load", [args.jdk / ("bin/javac" + executable_suffix),
        "--patch-module", f"java.base={here}", "-d", patch, here / "LibraryLoadProbe.java"])
    rows = []
    for fork in range(10):
        name = f"direct-load-{fork}"
        result = invoke(name, [args.jdk / ("bin/java" + executable_suffix), "-Xms256m", "-Xmx256m",
            "-XX:ActiveProcessorCount=2", "--patch-module", f"java.base={patch}",
            "-m", "java.base/java.time.LibraryLoadProbe"])
        found = re.search(r"direct_bootstrap_load_ns=(\d+),first_parse_after_load_ns=(\d+)", result)
        rows.append([fork, int(found.group(1)), int(found.group(2)), wall_times[name]])
    with (evidence / "direct-loads.csv").open("w", newline="") as f:
        w = csv.writer(f, lineterminator="\n")
        w.writerow(["fork", "direct_bootstrap_load_ns", "first_parse_after_load_ns", "process_wall_ns"])
        w.writerows(rows)
elif args.action == "verify":
    digest = None
    for mode in ("baseline", "cached", "production", "disabled"):
        for compact in (True, False):
            flags = ["-Xcheck:jni", "--add-opens", "java.base/java.time=ALL-UNNAMED"]
            if mode == "production": flags += ["-Dprobe.native=true"]
            name = f"verify-{mode}-compact-{compact}"
            result = run(name, mode, ["test"], flags, compact)
            observed = re.search(r"corpus_sha256=([0-9a-f]+)", result).group(1)
            if digest is None: digest = observed
            assert digest == observed, name
            print(name, result.strip().replace("\n", "; "), flush=True)
    fault_target = out / "fault-jdk" / native_dir / native_name
    for fault in ("missing", "failure", "symbol"):
        if fault_target.exists(): fault_target.unlink()
        if fault != "missing": shutil.copyfile(out / (native_prefix + "instant_" + fault + native_suffix), fault_target)
        for compact in (True, False):
            name = f"verify-{fault}-compact-{compact}"
            result = run(name, "fault", ["test"], ["-Xcheck:jni"], compact)
            assert re.search(r"corpus_sha256=([0-9a-f]+)", result).group(1) == digest, name
            print(name, result.strip().replace("\n", "; "), flush=True)
    for gc in ("Serial", "G1", "Z"):
        for compact in (True, False):
            name = f"stress-{gc}-compact-{compact}"
            result = run(name, "production", ["stress"], ["-Xcheck:jni", "-Xlog:gc=info",
                "--add-opens", "java.base/java.time=ALL-UNNAMED", "-Dprobe.native=true"], compact, gc, True)
            assert "concurrent_checked=90000" in result and "native_coverage=hits,misses,epoch-floor" in result
            collections = sum("GC(" in s and "->" in s and "Aborted" not in s for s in result.splitlines())
            assert collections > 0, name
            print(name, "comparisons=90000,completed_gc_records=" + str(collections), flush=True)
    opens = ["--add-opens", "java.base/java.time=ALL-UNNAMED"]
    result = run("bootstrap", "production", ["bootstrap"], opens + ["--add-exports", "java.base/jdk.internal.misc=ALL-UNNAMED",
                 "-Xlog:library=info", "-Djava.system.class.loader=ProductionProbe$EarlyLoader", "-Xcheck:jni"])
    loaded = re.findall(load_pattern, result)
    assert len(loaded) == 1 and result.index("preboot_parse_completed") < result.index(loaded[0])
    assert result.index("postboot_parse_begin") < result.index(loaded[0])
    print("bootstrap: preboot fallback, postboot native, one library load", flush=True)
    result = run("cold-race", "production", ["race"], opens + ["-Xlog:library=info", "-Xcheck:jni"])
    assert "cold_race_checked=8000" in result and len(re.findall(load_pattern, result)) == 1
    print("cold-race:8000 comparisons, one load", flush=True)
    result = run("onload-race", "production", ["onload"], opens + ["--add-opens", "java.base/jdk.internal.loader=ALL-UNNAMED",
        "-Xcheck:jni", "-Dprobe.onload.library=" + str(out / (native_prefix + "instant_onload" + native_suffix)),
        "-Dprobe.parser.library=" + str((args.jdk / native_dir / native_name).resolve())])
    assert "onload_race_checked=callback-fallback,post-load-native" in result
    print("onload-race: forced per-library-lock contention, callback fallback, native after load", flush=True)
    print(run("eligibility", "production", ["eligibility"], opens).strip(), flush=True)
    invoke("cds-smoke", [args.jdk / ("bin/java" + executable_suffix), "-Xshare:on", "-version"])
elif args.action == "measure":
    rows = []
    modes = ["baseline", "cached", "production", "disabled"]
    flags = ["-Xbatch", "-Dprobe.warmup=400000", "-Dprobe.iterations=200000", "-Dprobe.rounds=5"]
    for compact in (True, False):
        for corpus in ("happy", "mixed", "invalid"):
            for fork in range(3):
                order = modes[fork:] + modes[:fork]
                for mode in order:
                    name = f"bench-{mode}-{corpus}-compact-{compact}-fork-{fork}"
                    result = run(name, mode, ["bench", corpus], flags, compact)
                    for line in result.splitlines():
                        if line.startswith("bench,"):
                            _, _, round_id, ns, size, checksum = line.split(",")
                            rows.append([mode, compact, corpus, fork, int(round_id), float(ns), float(size), checksum])
                    print(name, flush=True)
    with (evidence / "measurements.csv").open("w", newline="") as f:
        w = csv.writer(f, lineterminator="\n"); w.writerow(["mode", "compact", "corpus", "fork", "round", "ns_per_op", "bytes_per_op", "checksum"]); w.writerows(rows)
    summary = []
    for compact in (True, False):
        for corpus in ("happy", "mixed", "invalid"):
            for round_id in range(5):
                assert len({r[7] for r in rows if r[1] == compact and r[2] == corpus and r[4] == round_id}) == 1
            data = {}
            for mode in modes:
                selected = [r for r in rows if r[0] == mode and r[1] == compact and r[2] == corpus and r[4] >= 1]
                med = statistics.median(r[5] for r in selected)
                forks = [statistics.median(r[5] for r in selected if r[3] == n) for n in range(3)]
                summary.append([mode, compact, corpus, med, statistics.median(r[6] for r in selected), min(forks), max(forks)])
                data[mode] = med
            print("summary", compact, corpus, data, flush=True)
            if corpus == "happy": passed = data["baseline"] / data["production"] >= 1.5 and data["cached"] / data["production"] >= 1.25
            else: passed = data["production"] <= 1.03 * data["baseline"]
            print("criterion", compact, corpus, "PASS" if passed else "MISS", flush=True)
    with (evidence / "summary.csv").open("w", newline="") as f:
        w = csv.writer(f, lineterminator="\n"); w.writerow(["mode", "compact", "corpus", "median_ns", "median_bytes", "min_fork_median_ns", "max_fork_median_ns"]); w.writerows(summary)
    first = []
    for mode in modes:
        for fork in range(10):
            name = f"first-{mode}-{fork}"; result = run(name, mode, ["first"])
            first.append([mode, fork, int(re.search(r"first_parse_ns=(\d+)", result).group(1)), wall_times[name]])
    with (evidence / "first.csv").open("w", newline="") as f:
        w = csv.writer(f, lineterminator="\n"); w.writerow(["mode", "fork", "first_parse_ns", "process_wall_ns"]); w.writerows(first)
    loads = []
    for fork in range(10):
        name = f"load-{fork}"; result = run(name, "production", ["load"], ["--add-opens", "java.base/java.time=ALL-UNNAMED"])
        found = re.search(r"library_load_ns=(\d+),warm_library_first_parse_ns=(\d+)", result)
        loads.append([fork, int(found.group(1)), int(found.group(2)), wall_times[name]])
    with (evidence / "loads.csv").open("w", newline="") as f:
        w = csv.writer(f, lineterminator="\n"); w.writerow(["fork", "library_load_ns", "warm_library_first_parse_ns", "process_wall_ns"]); w.writerows(loads)
