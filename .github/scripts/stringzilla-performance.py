#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Measure complete original/on/off images on one native host; retain every result."""

import argparse
import csv
import ctypes
import hashlib
import json
import math
import os
from pathlib import Path
import platform
import re
import subprocess
import sys
import urllib.request

BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
CONTROLS = ("enabled", "disabled", "original")


def emit(kind, value):
    print("STRINGZILLA_" + kind + " " + json.dumps(value, separators=(",", ":")), flush=True)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def command(args, **kwargs):
    return subprocess.check_output([str(x) for x in args], text=True, stderr=subprocess.STDOUT, **kwargs).strip()


def image(root):
    required = ["bin/java.exe", "bin/javac.exe", "bin/server/jvm.dll", "bin/java.dll"] if os.name == "nt" else [
        "bin/java", "bin/javac", "lib/server/libjvm.so", "lib/libjava.so"]
    for name in required + ["lib/modules", "release"]:
        if not (root / name).is_file():
            raise RuntimeError("Incomplete image: " + str(root / name))
    rows = []
    for path in sorted(root.rglob("*")):
        name = path.relative_to(root).as_posix()
        if path.is_symlink():
            rows.append([name, "link", os.readlink(path)])
        elif path.is_file():
            rows.append([name, path.stat().st_size, sha(path)])
    digest = hashlib.sha256(json.dumps(rows, separators=(",", ":")).encode()).hexdigest()
    return {"root": str(root), "tree_sha256": digest, "files": rows}


def pin_cpu():
    if hasattr(os, "sched_getaffinity"):
        cpu = min(os.sched_getaffinity(0))
        os.sched_setaffinity(0, {cpu})
        return {"method": "sched_setaffinity", "cpu": cpu}
    if os.name == "nt":
        from ctypes import wintypes
        kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        kernel.GetCurrentProcess.restype = wintypes.HANDLE
        kernel.GetProcessAffinityMask.argtypes = [wintypes.HANDLE, ctypes.POINTER(ctypes.c_size_t), ctypes.POINTER(ctypes.c_size_t)]
        kernel.SetProcessAffinityMask.argtypes = [wintypes.HANDLE, ctypes.c_size_t]
        handle = kernel.GetCurrentProcess()
        process_mask, system_mask = ctypes.c_size_t(), ctypes.c_size_t()
        if not kernel.GetProcessAffinityMask(handle, ctypes.byref(process_mask), ctypes.byref(system_mask)):
            raise ctypes.WinError(ctypes.get_last_error())
        mask = process_mask.value & -process_mask.value
        if not mask or not kernel.SetProcessAffinityMask(handle, mask):
            raise ctypes.WinError(ctypes.get_last_error())
        return {"method": "SetProcessAffinityMask", "mask": mask}
    raise RuntimeError("CPU affinity is not implemented for this host")


def read_spec(path):
    selected = {}
    names = {
        "TOOLCHAIN_TYPE", "TOOLCHAIN_VERSION", "CC_VERSION_NUMBER", "CXX_VERSION_NUMBER",
        "EXTRA_CFLAGS", "EXTRA_CXXFLAGS", "EXTRA_LDFLAGS", "DEBUG_LEVEL",
        "JVM_VARIANTS", "JVM_FEATURES_server", "VERSION_STRING", "VERSION_OPT", "SOURCE_DATE"
    }
    for line in path.read_text().splitlines():
        match = re.match(r"^([A-Za-z0-9_]+)\s*:?=\s*(.*)$", line)
        if match and match[1] in names:
            selected[match[1]] = match[2]
    for name in ("TOOLCHAIN_TYPE", "CC_VERSION_NUMBER", "CXX_VERSION_NUMBER", "DEBUG_LEVEL", "SOURCE_DATE"):
        if not selected.get(name):
            raise RuntimeError("Missing matched build field: " + name)
    return selected


def download_jmh(folder):
    artifacts = [
        ("org/openjdk/jmh", "jmh-core", "1.37"),
        ("org/openjdk/jmh", "jmh-generator-annprocess", "1.37"),
        ("net/sf/jopt-simple", "jopt-simple", "5.0.4"),
        ("org/apache/commons", "commons-math3", "3.6.1"),
    ]
    folder.mkdir()
    jars = []
    for group, artifact, version in artifacts:
        name = artifact + "-" + version + ".jar"
        url = "https://repo.maven.apache.org/maven2/" + "/".join((group, artifact, version, name))
        data = urllib.request.urlopen(url, timeout=60).read()
        checksum = urllib.request.urlopen(url + ".sha1", timeout=60).read().decode().split()[0]
        if hashlib.sha1(data).hexdigest() != checksum:
            raise RuntimeError("Maven checksum mismatch: " + name)
        path = folder / name
        path.write_bytes(data)
        jars.append(path)
    return jars


def verify_result(path, java, options, row):
    data = json.loads(path.read_text())
    if len(data) != 1:
        raise RuntimeError("Expected exactly one benchmark result")
    result = data[0]
    params = {"length": row["length"], "needleLength": row["needleLength"]}
    params.update({"shape": row["shape"]} if row["shape"] != "-" else {"coder": row["coder"], "position": row["position"]})
    assert Path(result["jvm"]).resolve() == java.resolve()
    assert result["jvmArgs"] == options and result["params"] == params
    assert result["benchmark"].endswith("." + row["benchmark"])
    assert result["forks"] == 2 and result["warmupIterations"] == 3 and result["measurementIterations"] == 5
    assert result["warmupTime"] == result["measurementTime"] == "500 ms"
    metric = result["primaryMetric"]
    assert metric["scoreUnit"] == "ns/op" and [len(x) for x in metric["rawData"]] == [5, 5]
    assert math.isfinite(metric["scoreError"])
    assert math.isclose(metric["score"], sum(map(sum, metric["rawData"])) / 10)
    return result


def msvc_baseline_probe(output, source):
    folder = output / "msvc-baseline"
    folder.mkdir()
    wrappers = "\n".join(
        f"__declspec(noinline) int probe_{bits}_{op}(sz_u{bits}_t x) {{ return sz_u{bits}_{op}(x); }}"
        for bits in (32, 64) for op in ("clz", "ctz", "popcount"))
    code = '#define SZ_USE_WESTMERE 0\n#define SZ_USE_HASWELL 0\n#define SZ_USE_SKYLAKE 0\n#define SZ_USE_ICELAKE 0\n#define SZ_AVOID_LIBC 1\n#include "stringzilla/types.h"\n' + wrappers + """
int main(void) {
    unsigned i;
    if (probe_32_clz(0) != 32 || probe_32_ctz(0) != 32 || probe_64_clz(0) != 64 || probe_64_ctz(0) != 64) return 1;
    if (probe_32_popcount(0x01234567U) != 12 || probe_64_popcount(0x0123456789ABCDEFULL) != 32) return 5;
    if (probe_32_popcount(0) || probe_64_popcount(0) || probe_32_popcount(~0U) != 32 || probe_64_popcount(~0ULL) != 64) return 2;
    for (i = 0; i < 32; ++i)
        if (probe_32_clz(1U << i) != 31 - i || probe_32_ctz(1U << i) != i || probe_32_popcount(1U << i) != 1) return 3;
    for (i = 0; i < 64; ++i)
        if (probe_64_clz(1ULL << i) != 63 - i || probe_64_ctz(1ULL << i) != i || probe_64_popcount(1ULL << i) != 1) return 4;
    return 0;
}
"""
    probe_source = folder / "SerialProbe.c"
    probe_source.write_text(code)
    assembly, obj, executable = [folder / ("SerialProbe." + suffix) for suffix in ("asm", "obj", "exe")]
    vcvars = r"C:\Program Files\Microsoft Visual Studio\18\Enterprise\vc\auxiliary\build\vcvars64.bat"
    includes = source / "src/java.base/share/native/libjava/stringzilla"
    compile_args = ["cl.exe", "/nologo", "/std:c11", "/O2", "/utf-8", "/c", "/FAs", "/Fa" + str(assembly),
                    "/Fo" + str(obj), "/I" + str(includes), str(probe_source)]
    link_args = ["cl.exe", "/nologo", str(obj), "/Fe" + str(executable)]
    quoted = lambda values: " ".join('"' + str(value) + '"' for value in values)
    batch = folder / "build-probe.cmd"
    batch.write_text('@echo off\ncall "' + vcvars + '" -vcvars_ver=14.44\n'
                     'if errorlevel 1 exit /b %errorlevel%\n' + quoted(compile_args) + '\n'
                     'if errorlevel 1 exit /b %errorlevel%\n' + quoted(link_args) + '\n'
                     'if errorlevel 1 exit /b %errorlevel%\n')
    probe_env = os.environ.copy()
    probe_env.pop("CL", None)
    probe_env.pop("_CL_", None)
    completed = subprocess.run(["cmd.exe", "/d", "/c", batch.name], cwd=folder, env=probe_env,
                               text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (folder / "build.log").write_text(completed.stdout)
    if completed.returncode:
        print(completed.stdout[-12000:], flush=True)
        raise RuntimeError("MSVC baseline probe compilation failed; see msvc-baseline/build.log")
    listing = assembly.read_text(errors="replace")
    assert not re.search(r"(?im)^[^\r\n;]*\b(?:lzcnt|tzcnt|popcnt)\b", listing), "Optional ISA in baseline serial bit operations"
    command([executable])
    receipt = {"compiler_args": compile_args, "runtime_passed": True, "forbidden_instructions_absent": True,
               "files_sha256": {p.name: sha(p) for p in folder.iterdir() if p.is_file()}}
    (folder / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    emit("MSVC_BASELINE", receipt)


def compilation_traces(output, java_paths, backend_flags, classpath, source_shas):
    folder = output / "compilation-traces"
    folder.mkdir()
    for tier, tier_flags in (("c1", ["-XX:TieredStopAtLevel=1"]), ("c2", ["-XX:-TieredCompilation"])):
        for control in CONTROLS:
            base = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", *backend_flags, *tier_flags]
            if control != "original":
                base += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics"]
            diagnostic = [*base, "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintCompilation", "-XX:+PrintInlining"]
            workloads = (("mixed64", "lastIndexOf", "4096", "MIXED", "END", "64"),
                         ("equals4096", "equals", "4096", "LATIN1", "EQUAL", "4"),
                         ("latin255", "lastIndexOf", "255", "LATIN1", "MISS", "4"),
                         ("utf16-127", "lastIndexOf", "127", "UTF16", "MISS", "4"),
                         ("utf16-128", "lastIndexOf", "128", "UTF16", "MISS", "4"),
                         ("utf16-511", "lastIndexOf", "511", "UTF16", "MISS", "4"),
                         ("tiny-latin", "lastIndexOf", "4", "LATIN1", "MISS", "4"),
                         ("tiny-utf16", "lastIndexOf", "4", "UTF16", "MISS", "4"),
                         ("equals-utf16-4096", "equals", "4096", "UTF16", "EQUAL", "4"))
            if tier == "c1":
                workloads += (("utf16-128-end", "lastIndexOf", "128", "UTF16", "END", "4"),)
            for case, benchmark, length, coder, position, needle in workloads:
                path = folder / (tier + "-" + control + "-" + case + ".log")
                options = diagnostic
                if case == "equals-utf16-4096":
                    options = [*diagnostic, "-XX:+PrintIntrinsics",
                        "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaSearch_equals_jmhTest::equals_avgt_jmhStub",
                        "-XX:CompileCommand=print,org.openjdk.bench.java.lang.StringZillaSearch::equals"]
                with path.open("w") as log:
                    completed = subprocess.run([str(java_paths[control]), *base, "-cp", classpath, "org.openjdk.jmh.Main",
                        "StringZillaSearch." + benchmark + "$", "-p", "length=" + length, "-p", "coder=" + coder,
                        "-p", "position=" + position, "-p", "needleLength=" + needle,
                        "-f", "1", "-wi", "1", "-w", "200ms", "-i", "1", "-r", "200ms", "-foe", "true",
                        "-jvm", str(java_paths[control]), "-jvmArgs", " ".join(options)],
                        stdout=log, stderr=subprocess.STDOUT, timeout=120)
                assert completed.returncode == 0, path
                methods = "lastIndexOf|compilerTier|rfind|matches" if benchmark == "lastIndexOf" else "equals"
                trace = path.read_text()
                lines = [line for line in trace.splitlines()
                         if re.search(r"java.lang.String(?:Zilla|UTF16|Latin1)?::(?:" + methods + ")", line)]
                code = re.findall(r"\[MachCode\][\s\S]*?\[/MachCode\]", trace) if case == "equals-utf16-4096" else []
                emit("COMPILATION", {"case": case, "tier": tier, "control": control, "benchmark": benchmark,
                     "params": {"length": length, "coder": coder, "position": position, "needleLength": needle}, "jvmArgs": options,
                     "source": source_shas["original" if control == "original" else "fork"],
                     "timing_evidence": False, "log_sha256": sha(path), "selected_lines": lines[-120:],
                     "omitted_matching_lines": max(0, len(lines) - 120),
                     "printed_methods": re.findall(r"(?m)^Compiled method.*$", trace),
                     "machine_code": code})


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--original", type=Path, required=True)
    parser.add_argument("--fork", type=Path, required=True)
    parser.add_argument("--original-source", type=Path, required=True)
    parser.add_argument("--fork-source", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--backend", choices=("avx2", "avx512", "serial", "neon", "msvc"), required=True)
    parser.add_argument("--manifest", type=Path, help="Use a focused workload manifest.")
    args = parser.parse_args()
    args.original, args.fork = args.original.resolve(), args.fork.resolve()
    args.original_source, args.fork_source = args.original_source.resolve(), args.fork_source.resolve()
    args.output = args.output.resolve()
    args.output.mkdir(exist_ok=True)
    lock = args.output / ".running"
    lock.mkdir()
    try:
        run(args)
    finally:
        lock.rmdir()


def run(args):
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    original_sha = command(["git", "-C", args.original_source, "rev-parse", "HEAD"])
    fork_sha = command(["git", "-C", args.fork_source, "rev-parse", "HEAD"])
    assert original_sha == BASE
    specs = {name: read_spec(args.output / (name + "-spec.gmk")) for name in ("original", "fork")}
    assert specs["original"] == specs["fork"], specs
    assert specs["fork"]["DEBUG_LEVEL"] == "release"
    images = {name: image(root) for name, root in (("original", args.original), ("fork", args.fork))}
    assert images["original"]["tree_sha256"] != images["fork"]["tree_sha256"]
    if os.name == "nt":
        msvc_baseline_probe(args.output, args.fork_source)
    affinity = pin_cpu()
    machine = {"system": platform.platform(), "machine": platform.machine(), "processor": platform.processor(), "affinity": affinity}
    if Path("/proc/cpuinfo").exists():
        machine["cpuinfo"] = Path("/proc/cpuinfo").read_text().split("\n\n")[0]
    elif os.name == "nt":
        machine["cpuinfo"] = command(["powershell", "-NoProfile", "-Command",
            "Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors | ConvertTo-Json -Compress"])
    executable = "java.exe" if os.name == "nt" else "java"
    java_paths = {"original": args.original / "bin" / executable, "enabled": args.fork / "bin" / executable, "disabled": args.fork / "bin" / executable}
    manifest = args.manifest.resolve() if args.manifest else args.fork_source / "doc/stringzilla/native-cases.tsv"
    rows = list(csv.DictReader(manifest.open(newline=""), delimiter="\t"))
    assert len({row["id"] for row in rows}) == len(rows)
    jars = download_jmh(args.output / "jmh")
    classes = args.output / "classes"
    classes.mkdir()
    javac = args.original / "bin" / ("javac.exe" if os.name == "nt" else "javac")
    sources = [args.fork_source / "test/micro/org/openjdk/bench/java/lang" / (name + ".java")
               for name in ("StringZillaSearch", "StringZillaLongNeedle")]
    command([javac, "-cp", jars[0], "-processorpath", os.pathsep.join(str(x) for x in jars[:2]),
             "-processor", "org.openjdk.jmh.generators.BenchmarkProcessor", "-d", classes, *sources])
    classpath = os.pathsep.join(str(x) for x in [classes, jars[0], *jars[2:]])
    harness_hashes = {p.relative_to(args.output).as_posix(): sha(p) for p in sorted(classes.rglob("*")) if p.is_file()}
    harness_hashes.update({p.name: sha(p) for p in jars})
    arm = platform.machine().lower() in ("aarch64", "arm64")
    assert (args.backend == "neon") == arm
    assert (args.backend == "msvc") == (os.name == "nt")
    backends = [(args.backend, [] if arm else ["-XX:UseAVX=" +
                ("0" if args.backend == "serial" else "3" if args.backend == "avx512" else "2")])]
    probe = args.output / "backend-probe"
    probe.mkdir()
    probe_source = probe / "BackendProbe.java"
    probe_source.write_text("""public class BackendProbe {
        public static void main(String[] args) throws Exception {
            Class<?> type = Class.forName("java.lang.StringZilla");
            var backend = type.getDeclaredField("BACKEND");
            var enabled = type.getDeclaredField("ENABLED");
            backend.setAccessible(true);
            enabled.setAccessible(true);
            System.out.println(backend.getInt(null) + ":" + enabled.getBoolean(null));
        }
    }
""")
    command([javac, "-d", probe, probe_source])
    attestation = {}
    expected_backend = {"serial": 0, "msvc": 0, "avx2": 1, "avx512": 2, "neon": 4}[args.backend]
    for control in ("enabled", "disabled"):
        probe_flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", *backends[0][1], "-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics"]
        selected = command([java_paths[control], *probe_flags, "--add-opens=java.base/java.lang=ALL-UNNAMED",
                            "-cp", probe, "BackendProbe"])
        assert selected == str(expected_backend) + ":" + str(control == "enabled").lower(), selected
        attestation[control] = {"backend": expected_backend, "enabled": control == "enabled", "jvmArgs": probe_flags}
    probe_hashes = {p.name: sha(p) for p in probe.iterdir() if p.is_file()}
    provenance = {
        "sources": {"original": original_sha, "fork": fork_sha}, "spec": specs["fork"], "machine": machine,
        "control_images": {"original": "original", "enabled": "fork", "disabled": "fork"},
        "image_hashes": {name: {k: v for k, v in data.items() if k != "files"} for name, data in images.items()},
        "harness_sha256": harness_hashes, "manifest_sha256": sha(manifest), "runner_sha256": sha(Path(__file__)),
        "backend_controls": backends, "backend_attestation": attestation, "probe_sha256": probe_hashes, "msvc_stringzilla_backend": "serial" if os.name == "nt" else None,
        "versions": {control: command([java, "-version"]) for control, java in java_paths.items()},
        "method": {"forks": 2, "warmup": "3 x 500ms", "measurement": "5 x 500ms", "cds": "off", "gc": "Serial"},
    }
    (args.output / "provenance.json").write_text(json.dumps(provenance, indent=2) + "\n")
    (args.output / "image-inventory.json").write_text(json.dumps(images, separators=(",", ":")) + "\n")
    emit("PROVENANCE", provenance)
    records = []
    summaries = []
    rotation = 0
    for backend, backend_flags in backends:
        for tier, tier_flags in (("interpreter", ["-Xint"]), ("c1", ["-XX:TieredStopAtLevel=1"]), ("c2", ["-XX:-TieredCompilation"])):
            for row in rows:
                manifest_backend = "avx2" if backend == "avx512" else backend
                if manifest_backend not in row["backends"].split(",") or tier not in row["tiers"].split(","):
                    continue
                group = []
                for offset in range(3):
                    control = CONTROLS[(rotation + offset) % 3]
                    java = java_paths[control]
                    options = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", *backend_flags, *tier_flags]
                    if control != "original":
                        options += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics"]
                    name = "-".join((backend, tier, row["id"], control))
                    result_path = args.output / (name + ".json")
                    if result_path.exists():
                        raise RuntimeError("Refusing to replace retained measurement: " + name)
                    params = ["-p", "length=" + row["length"], "-p", "needleLength=" + row["needleLength"]]
                    params += ["-p", "shape=" + row["shape"]] if row["shape"] != "-" else ["-p", "coder=" + row["coder"], "-p", "position=" + row["position"]]
                    log_path = args.output / (name + ".log")
                    with log_path.open("w") as log:
                        completed = subprocess.run([str(java), *options, "-cp", classpath, "org.openjdk.jmh.Main",
                            row["benchmark"] + "$", *params, "-f", "2", "-wi", "3", "-w", "500ms",
                            "-i", "5", "-r", "500ms", "-foe", "true", "-jvm", str(java),
                            "-jvmArgs", " ".join(options), "-rf", "json", "-rff", str(result_path)],
                            stdout=log, stderr=subprocess.STDOUT, timeout=180)
                    if completed.returncode:
                        print(log_path.read_text()[-12000:], flush=True)
                        raise RuntimeError("JMH failed: " + name)
                    result = verify_result(result_path, java, options, row)
                    metric = result["primaryMetric"]
                    record = {
                        "case": row["id"], "backend_control": backend, "tier": tier, "control": control,
                        "source": original_sha if control == "original" else fork_sha, "java": str(java),
                        "params": result["params"], "benchmark": result["benchmark"], "jvmArgs": options,
                        "score": metric["score"], "error": metric["scoreError"], "rawData": metric["rawData"],
                        "json_sha256": sha(result_path),
                    }
                    records.append(record)
                    group.append(record)
                    emit("RESULT", record)
                    (args.output / "results.json").write_text(json.dumps(records, indent=2) + "\n")
                by_control = {record["control"]: record for record in group}
                enabled = by_control["enabled"]
                summary = {"case": row["id"], "backend_control": backend, "tier": tier, "comparisons": {}}
                for control in ("original", "disabled"):
                    other = by_control[control]
                    summary["comparisons"][control] = {
                        "enabled_ns": enabled["score"], "control_ns": other["score"],
                        "speedup": other["score"] / enabled["score"],
                        "slower_mean": enabled["score"] > other["score"],
                        "intervals_overlap": abs(enabled["score"] - other["score"]) <= enabled["error"] + other["error"],
                    }
                emit("SUMMARY", summary)
                summaries.append((backend, tier, row["id"], by_control))
                rotation += 1
    compilation_traces(args.output, java_paths, backends[0][1], classpath, provenance["sources"])
    table = ["# Native complete-image StringZilla measurements", "",
        "Original: `" + original_sha + "`; fork: `" + fork_sha + "`.", "",
        "Two forks, 3 x 500 ms warmup and 5 x 500 ms measurement per fork. Values are ns/op with JMH error.",
        "All higher enabled means are marked using unrounded scores; overlapping intervals do not establish equivalence.", "",
        "| Backend control | Tier | Workload | Original | Enabled | Disabled | Higher enabled mean |",
        "| --- | --- | --- | ---: | ---: | ---: | --- |"]
    for backend, tier, case, controls in summaries:
        higher = [name for name in ("original", "disabled") if controls["enabled"]["score"] > controls[name]["score"]]
        cells = [f'{controls[name]["score"]:.3f} +/- {controls[name]["error"]:.3f}' for name in ("original", "enabled", "disabled")]
        table.append("| " + " | ".join([backend, tier, case, *cells, ", ".join(higher) or "-"]) + " |")
    markdown = "\n".join(table) + "\n"
    (args.output / "SUMMARY.md").write_text(markdown)
    if os.environ.get("GITHUB_STEP_SUMMARY"):
        with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as summary_file:
            summary_file.write(markdown)
    for name, root in (("original", args.original), ("fork", args.fork)):
        assert image(root) == images[name], "Image changed during campaign"
    assert sha(manifest) == provenance["manifest_sha256"]
    assert sha(Path(__file__)) == provenance["runner_sha256"]
    assert {p.relative_to(args.output).as_posix(): sha(p) for p in sorted(classes.rglob("*")) if p.is_file()} == {
        key: value for key, value in harness_hashes.items() if key.startswith("classes/")}
    assert all(sha(p) == harness_hashes[p.name] for p in jars)
    assert all(sha(probe / name) == digest for name, digest in probe_hashes.items())
    emit("COMPLETE", {"measurements": len(records), "triplets": len(records) // 3, "sources": provenance["sources"],
                      "images_unchanged": True, "all_means_retained": True})


if __name__ == "__main__":
    main()
