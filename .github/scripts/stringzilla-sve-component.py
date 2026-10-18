#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Run an isolated native NEON/SVE component comparison; never build or modify a JDK."""
import hashlib
import json
import os
from pathlib import Path
import platform
import statistics
import subprocess
import sys

ROOT = Path.cwd()
AUX = Path(__file__).resolve().parents[2]
OUT = ROOT / "component-output"
SOURCE = "4592230b14fc2f4b537b162fd7f6b791e882b615"
HISTORICAL_GCC_PACKAGE = "16-20260322-1ubuntu1"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def capture(values):
    return subprocess.check_output([str(value) for value in values], text=True, stderr=subprocess.STDOUT).strip()


def run(values, log, environment=None, timeout=300):
    with log.open("w") as stream:
        child = subprocess.run([str(value) for value in values], stdout=stream, stderr=subprocess.STDOUT,
                               env=environment, timeout=timeout)
    if child.returncode:
        print(log.read_text(errors="replace")[-16000:], flush=True)
        raise RuntimeError("Component command failed: " + str(log))
    return {"command": [str(value) for value in values], "log": log.name, "log_sha256": sha(log)}


def records(log, name):
    prefix = "STRINGZILLA_SVE_" + name + " "
    return [json.loads(line[len(prefix):]) for line in log.read_text().splitlines() if line.startswith(prefix)]


def main():
    assert platform.machine().lower() in ("aarch64", "arm64")
    assert capture(["git", "rev-parse", "HEAD"]) == SOURCE
    capture(["git", "diff", "--exit-code", "--", "src", "make", "test", "bin"])
    OUT.mkdir()
    (OUT / "inputs").mkdir()
    includes = OUT / "include"
    includes.mkdir()
    template = ROOT / "src/java.base/share/native/include/classfile_constants.h.template"
    constants = template.read_text().replace("@@VERSION_CLASSFILE_MAJOR@@", "71").replace("@@VERSION_CLASSFILE_MINOR@@", "0")
    assert "@@" not in constants
    (includes / "classfile_constants.h").write_text(constants)
    source = AUX / ".github/scripts/stringzilla-sve-component.c"
    compiler = capture(["gcc-16", "--version"])
    assert capture(["gcc-16", "-dumpversion"]) == "16"
    flags = ["gcc-16", "-std=c11", "-O3", "-march=armv8.2-a", "-fno-lto", "-fno-omit-frame-pointer",
             "-Wall", "-Wextra", "-Wno-unknown-pragmas",
             *["-I" + str(path.resolve()) for path in (
                 ROOT, includes, ROOT / "src/java.base/share/native/libjava",
                 ROOT / "src/java.base/share/native/libjava/stringzilla",
                 ROOT / "src/java.base/share/native/include", ROOT / "src/java.base/unix/native/include",
                 ROOT / "src/hotspot/share/include", ROOT / "src/hotspot/os/posix/include")]]
    benchmark, sanitized = OUT / "sve-component", OUT / "sve-correctness"
    provenance = {"source": SOURCE, "auxiliary_head": os.environ["GITHUB_SHA"],
                  "compiler": compiler, "compiler_fullversion": capture(["gcc-16", "-dumpfullversion", "-dumpversion"]),
                  "historical_compiler_package": HISTORICAL_GCC_PACKAGE,
                  "matches_historical_compiler_package": HISTORICAL_GCC_PACKAGE in compiler,
                  "machine": platform.platform(), "cpuinfo": Path("/proc/cpuinfo").read_text(),
                  "timing_scope": "Native component calls only; no JVM, Java dispatch, JMH or original-Java comparison",
                  "header_generation": {"template_sha256": sha(template), "major": 71, "minor": 0},
                  "production_kernel_sha256": sha(ROOT / "src/java.base/share/native/libjava/StringZillaKernels.c"),
                  "harness_sha256": sha(source), "runner_sha256": sha(Path(__file__))}
    provenance["unsanitized_build"] = run([*flags, source, "-o", benchmark], OUT / "build.log")
    provenance["assembly"] = run(["objdump", "-d", benchmark], OUT / "assembly.log")
    provenance["sanitized_build"] = run([*flags, "-fsanitize=address,undefined,alignment",
        "-fno-sanitize-recover=all", source, "-o", sanitized], OUT / "sanitized-build.log")
    provenance["sanitized_correctness"] = run([sanitized, "--check-only"], OUT / "correctness.log",
        {**os.environ, "ASAN_OPTIONS": "abort_on_error=1:detect_leaks=1:strict_string_checks=1",
         "UBSAN_OPTIONS": "halt_on_error=1:print_stacktrace=1"})
    host = records(OUT / "correctness.log", "HOST")
    assert len(host) == 1
    if not host[0]["available"]:
        provenance["unsupported"] = host[0]
        (OUT / "provenance.json").write_text(json.dumps(provenance, indent=2) + "\n")
        print("STRINGZILLA_SVE_SKIPPED " + json.dumps(host[0], separators=(",", ":")), flush=True)
        return
    correctness = records(OUT / "correctness.log", "CHECK")
    assert len(correctness) == 76 and len({record["case"] for record in correctness}) == 76
    assert records(OUT / "correctness.log", "COMPONENT") == []
    provenance["unsanitized_execution"] = run([benchmark], OUT / "timings.jsonl")
    measured_host = records(OUT / "timings.jsonl", "HOST")
    assert len(measured_host) == 1 and measured_host[0]["available"]
    assert measured_host[0]["vector_bytes"] == host[0]["vector_bytes"]
    provenance["host"] = measured_host[0]
    measured_checks = records(OUT / "timings.jsonl", "CHECK")
    assert measured_checks == correctness
    raw = records(OUT / "timings.jsonl", "COMPONENT")
    expected = {record["case"] for record in correctness if record["classification"] == "eligible"}
    assert len(raw) == 74 and len(expected) == 74 and {record["case"] for record in raw} == expected
    complete = records(OUT / "timings.jsonl", "COMPLETE")
    assert len(complete) == 1 and complete[0]["cases"] == 76 and not complete[0]["check_only"]
    rows = []
    table = ["Native component measurements only. These omit JVM/Java dispatch and are not end-to-end JMH results.",
             "", "| Case | NEON ns/call +/- SEM | SVE ns/call +/- SEM | NEON/SVE | Higher SVE mean |",
             "| --- | ---: | ---: | ---: | --- |"]
    for record in raw:
        assert record["samples_per_backend"] == 15 and record["warmups_per_backend"] == 3
        iterations = record["iterations_per_sample"]
        assert iterations >= 128
        means, sems = {}, {}
        for backend in ("neon", "sve"):
            samples = record["raw_batch_ns"][backend]
            assert len(samples) == 15 and all(isinstance(value, int) and value > 0 for value in samples)
            values = [value / iterations for value in samples]
            means[backend] = statistics.mean(values)
            sems[backend] = statistics.stdev(values) / (15 ** .5)
        row = {**record, "mean_ns": means, "sem_ns": sems, "neon_over_sve": means["neon"] / means["sve"],
               "higher_sve_mean": means["sve"] > means["neon"],
               "same_function_control": host[0]["vector_bytes"] == 16 and record["operation"] in (2, 3)}
        rows.append(row)
        table.append("| " + " | ".join((record["case"],
            f'{means["neon"]:.3f} +/- {sems["neon"]:.3f}', f'{means["sve"]:.3f} +/- {sems["sve"]:.3f}',
            f'{row["neon_over_sve"]:.3f}', "yes" if row["higher_sve_mean"] else "-")) + " |")
        print("STRINGZILLA_SVE_RESULT " + json.dumps(row, separators=(",", ":")), flush=True)
    provenance["binaries_sha256"] = {path.name: sha(path) for path in (benchmark, sanitized)}
    provenance["inputs_sha256"] = {path.name: sha(path) for path in sorted((OUT / "inputs").glob("*.bin"))}
    assert len(provenance["inputs_sha256"]) == 152
    provenance["raw_timings_sha256"] = sha(OUT / "timings.jsonl")
    provenance["eligible_cases"] = 74
    provenance["outside_bound_cases_not_timed"] = 2
    (OUT / "results.json").write_text(json.dumps({"provenance": provenance, "results": rows}, indent=2) + "\n")
    (OUT / "RESULTS.md").write_text("\n".join(table) + "\n")
    (OUT / "provenance.json").write_text(json.dumps(provenance, indent=2) + "\n")
    print("STRINGZILLA_SVE_PROVENANCE " + json.dumps(provenance, separators=(",", ":")), flush=True)
    capture(["git", "diff", "--exit-code", "--", "src", "make", "test", "bin"])


if __name__ == "__main__":
    main()
