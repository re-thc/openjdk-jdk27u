#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Qualify AVX-512 using existing complete images, without rebuilding them."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess
import sys
import tarfile

REPOSITORY = "re-thc/openjdk-jdk27u"
PRODUCER_RUN = 39059898881
PRODUCER_JOB = 117475848485
ARTIFACT_ID = 12111243496
ARTIFACT_DIGEST = "sha256:ac161044f1e19a16f0b0dc4d39603cbb18018ca92dc33c1753e2b1ecbd469625"
FORK = "adbea61e47c00f12cdd6458ed96777914ee22d99"
ORIGINAL = "e206bae32b2a6cc1fa9464ad34d75f2df4b347e9"
ARTIFACT_NAME = "stringzilla-qualification-images-avx2-" + FORK
WORKSPACE = Path.cwd()
OUTPUT = WORKSPACE / "perf-output"
DRIVER_SOURCE = Path(__file__).resolve().parents[2]


def command(values, **kwargs):
    return subprocess.check_output([str(x) for x in values], text=True,
                                   stderr=subprocess.STDOUT, **kwargs).strip()


def write_json(name, value):
    (OUTPUT / name).write_text(json.dumps(value, indent=2) + "\n")


def notice(value):
    print("STRINGZILLA_AVX512 " + json.dumps(value, separators=(",", ":")), flush=True)


def probe():
    OUTPUT.mkdir(exist_ok=True)
    allowed = sorted(os.sched_getaffinity(0))
    cpu = allowed[0]
    blocks = Path("/proc/cpuinfo").read_text().strip().split("\n\n")
    fields = next(dict(line.split(":", 1) for line in block.splitlines() if ":" in line)
                  for block in blocks
                  if re.search(r"(?m)^processor\s*:\s*" + str(cpu) + r"\s*$", block))
    fields = {key.strip(): value.strip() for key, value in fields.items()}
    flags = set(fields.get("flags", "").split())
    required = {"avx2", "bmi1", "bmi2", "avx512f", "avx512bw", "avx512vl"}
    missing = sorted(required - flags)
    if not ({"abm", "lzcnt"} & flags):
        missing.append("lzcnt/abm")
    available = platform.machine().lower() in ("x86_64", "amd64") and not missing
    receipt = {
        "status": "eligible" if available else "skipped-unsupported-physical-cpu",
        "machine": platform.machine(), "cpu": cpu, "allowed_cpus": allowed,
        "model": fields.get("model name"), "vendor": fields.get("vendor_id"),
        "family": fields.get("cpu family"), "model_number": fields.get("model"),
        "flags": sorted(flags), "missing": missing,
        "required_runtime_backend": 2, "required_UseAVX": 3,
        "producer_run": PRODUCER_RUN, "producer_job": PRODUCER_JOB,
        "artifact_id": ARTIFACT_ID, "artifact_name": ARTIFACT_NAME,
        "image_sources": {"original": ORIGINAL, "fork": FORK},
        "runtime_build_performed": False, "measurements_performed": False,
    }
    write_json("physical-cpu.json", receipt)
    (OUTPUT / "lscpu.json").write_text(command(["lscpu", "--json"]) + "\n")
    if os.environ.get("GITHUB_OUTPUT"):
        with open(os.environ["GITHUB_OUTPUT"], "a") as output:
            output.write("available=" + str(available).lower() + "\n")
    if not available:
        write_json("SKIPPED.json", receipt)
        if os.environ.get("GITHUB_STEP_SUMMARY"):
            with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as summary:
                summary.write("AVX-512 measurement skipped on " + str(receipt["model"]) +
                              "; missing: " + ", ".join(missing) +
                              ". No timing or replacement-host search was performed.\n")
    notice(receipt)


def api(path):
    return json.loads(command(["gh", "api", "repos/" + REPOSITORY + "/" + path]))


def source_revision(image, expected):
    text = (image / "release").read_text()
    source = re.search(r'^SOURCE="(.*)"$', text, re.MULTILINE)
    if source is None:
        raise RuntimeError("Image release file lacks SOURCE: " + str(image))
    top = re.search(r"(?:^|\s)\.:git:([0-9a-f]{12})(\+?)(?=\s|$)", source[1])
    if top is None or top[1] != expected[:12]:
        raise RuntimeError("Image SOURCE differs from pinned runtime source: " + source[1])
    return {"SOURCE": source[1], "top_revision_prefix": top[1],
            "dirty_marker": bool(top[2]), "expected_full_revision": expected}


def runtime_probe(images):
    folder = OUTPUT / "avx512-runtime-probe"
    folder.mkdir()
    java = folder / "Avx512RuntimeProbe.java"
    java.write_text("""public class Avx512RuntimeProbe {
    public static void main(String[] args) throws Exception {
        var diagnostic = java.lang.management.ManagementFactory.getPlatformMXBean(
                com.sun.management.HotSpotDiagnosticMXBean.class);
        String avx = diagnostic.getVMOption("UseAVX").getValue();
        if (args[0].equals("original")) {
            System.out.println(avx);
            return;
        }
        Class<?> type = Class.forName("java.lang.StringZilla");
        var backend = type.getDeclaredField("BACKEND");
        var enabled = type.getDeclaredField("ENABLED");
        backend.setAccessible(true);
        enabled.setAccessible(true);
        System.out.println(avx + ":" + backend.getInt(null) + ":" + enabled.getBoolean(null));
    }
}
""")
    command([images / "original/bin/javac", "-d", folder, java])
    observations = {}
    for control in ("original", "enabled", "disabled"):
        image = images / ("original" if control == "original" else "fork")
        flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", "-XX:UseAVX=3"]
        if control != "original":
            flags += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics",
                      "--add-opens=java.base/java.lang=ALL-UNNAMED"]
        completed = subprocess.run([str(image / "bin/java"), *flags, "-cp", str(folder),
                                    "Avx512RuntimeProbe", control],
                                   text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        (folder / (control + ".log")).write_text(completed.stdout)
        actual = completed.stdout.strip().splitlines()[-1] if completed.stdout.strip() else ""
        expected = "3" if control == "original" else "3:2:" + str(control == "enabled").lower()
        observations[control] = {"jvmArgs": flags, "actual": actual, "expected": expected,
                                 "returncode": completed.returncode}
    receipt = {"observations": observations, "requested_UseAVX": 3, "required_backend": 2,
               "passed": all(row["returncode"] == 0 and row["actual"] == row["expected"]
                             for row in observations.values())}
    write_json("runtime-attestation.json", receipt)
    return receipt


def measure():
    physical = json.loads((OUTPUT / "physical-cpu.json").read_text())
    if physical["status"] != "eligible":
        raise RuntimeError("Refusing to measure an unsupported physical CPU")
    os.sched_setaffinity(0, {physical["cpu"]})
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    run = api("actions/runs/" + str(PRODUCER_RUN))
    job = api("actions/jobs/" + str(PRODUCER_JOB))
    artifact = api("actions/artifacts/" + str(ARTIFACT_ID))
    assert run["head_sha"] == FORK and job["run_id"] == PRODUCER_RUN
    assert job["name"] == "avx2 complete images", job["name"]
    assert artifact["name"] == ARTIFACT_NAME and not artifact["expired"]
    assert artifact["digest"] == ARTIFACT_DIGEST
    assert artifact["workflow_run"]["id"] == PRODUCER_RUN
    assert artifact["workflow_run"]["head_sha"] == FORK
    write_json("producer-run.json", run)
    write_json("producer-job.json", job)
    write_json("producer-artifact.json", artifact)
    source_roots = {"original": WORKSPACE / "original-source", "fork": WORKSPACE / "fork-source"}
    sources = {}
    for control, root in source_roots.items():
        revision = command(["git", "-C", root, "rev-parse", "HEAD"])
        assert revision == (ORIGINAL if control == "original" else FORK)
        command(["git", "-C", root, "diff", "--exit-code", "--", "src", "make", "test", "bin"])
        sources[control] = {"revision": revision,
                            "runtime_trees": command(["git", "-C", root, "ls-tree", "HEAD", "--",
                                                      "src", "make", "test", "bin"])}
    archives = WORKSPACE / "perf-image-archives"
    command(["gh", "run", "download", str(PRODUCER_RUN), "--repo", REPOSITORY,
             "--name", ARTIFACT_NAME, "--dir", archives])
    images = WORKSPACE / "perf-images"
    images.mkdir()
    receipt = {"image_sources": sources,
               "measurement_helper_commit": command(["git", "-C", DRIVER_SOURCE, "rev-parse", "HEAD"]),
               "producer_run": PRODUCER_RUN, "producer_job": PRODUCER_JOB,
               "artifact_id": ARTIFACT_ID, "artifact_digest": ARTIFACT_DIGEST,
               "runtime_build_performed": False, "archives": {}}
    for control in ("original", "fork"):
        archive = archives / (control + "-jdk.tar.gz")
        expected = (archives / (control + "-jdk.tar.gz.sha256")).read_text().split()[0]
        digest = hashlib.sha256(archive.read_bytes()).hexdigest()
        assert re.fullmatch(r"[0-9a-f]{64}", expected) and digest == expected
        with tarfile.open(archive, "r:gz") as bundle:
            if any(member.name.split("/")[0] != control for member in bundle.getmembers()):
                raise RuntimeError("Unexpected image archive prefix")
            bundle.extractall(images, filter="data")
        revision = source_revision(images / control, sources[control]["revision"])
        receipt["archives"][control] = {"sha256": digest, "release": revision}
        shutil.copy2(archives / (control + "-spec.gmk"), OUTPUT / (control + "-spec.gmk"))
        shutil.copy2(images / control / "release", OUTPUT / (control + "-release.txt"))
        command(["bash", source_roots["fork"] / ".github/scripts/check-dev-profile.sh",
                 images / control, OUTPUT / (control + "-spec.gmk")])
    write_json("artifact-reuse.json", receipt)
    runtime = runtime_probe(images)
    if not runtime["passed"]:
        skipped = {"status": "skipped-runtime-avx512-unavailable",
                   "reason": "UseAVX=3 and actual StringZilla BACKEND=2 are required before timing",
                   "physical_cpu": physical, "runtime": runtime,
                   "runtime_build_performed": False, "measurements_performed": False}
        write_json("SKIPPED.json", skipped)
        if os.environ.get("GITHUB_STEP_SUMMARY"):
            with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as summary:
                summary.write("AVX-512 timing skipped: runtime probes did not all select UseAVX=3 " +
                              "and fork BACKEND=2. Actual observations: " +
                              json.dumps(runtime["observations"]) + "\n")
        notice(skipped)
        return
    notice({"status": "measuring", "backend": 2, "UseAVX": 3,
            "artifact_id": ARTIFACT_ID, "image_sources": {"original": ORIGINAL, "fork": FORK}})
    subprocess.run([sys.executable, DRIVER_SOURCE / ".github/scripts/stringzilla-performance.py",
                    "--original", images / "original", "--fork", images / "fork",
                    "--original-source", source_roots["original"], "--fork-source", source_roots["fork"],
                    "--output", OUTPUT, "--backend", "avx512",
                    "--manifest", source_roots["fork"] / "doc/stringzilla/qualification-cases.tsv"],
                   check=True)
    for root in source_roots.values():
        command(["git", "-C", root, "diff", "--exit-code", "--", "src", "make", "test", "bin"])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("probe", "measure"))
    arguments = parser.parse_args()
    probe() if arguments.mode == "probe" else measure()
