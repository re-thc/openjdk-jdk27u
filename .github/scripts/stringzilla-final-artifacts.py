#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Validate pinned complete-image archives and measure additional workloads."""

import argparse
import base64
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
import zipfile

REPOSITORY = "re-thc/openjdk-jdk27u"
PRODUCER_RUN = 39073742791
PRODUCER_HEAD = "9adc53b852aae7610a560e20034d6d777b5db9d3"
FORK = "2550a2100281b5a6d6aa7a9310a9e6b047937e2c"
ORIGINAL = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
ARTIFACTS = {
    "msvc": {
        "job": 117516727687,
        "id": 12117585451,
        "name": "stringzilla-performance-images-msvc-9adc53b852aae7610a560e20034d6d777b5db9d3",
        "digest": "sha256:6e31e01a744f3aa25a6bb475d2e0ad2545cfe4ace417cc13b398c67951331316"
    },
    "neon": {
        "job": 117516727893,
        "id": 12118586766,
        "name": "stringzilla-performance-images-neon-9adc53b852aae7610a560e20034d6d777b5db9d3",
        "digest": "sha256:e344610459e10604f19cadcde2df2e6dcc97e184129c7f44ce219b27ad5661ae"
    }
}
WORKSPACE = Path.cwd()
OUTPUT = WORKSPACE / "perf-output"
DRIVER_SOURCE = Path(__file__).resolve().parents[2]


def command(values, **kwargs):
    return subprocess.check_output([str(x) for x in values], text=True,
                                   stderr=subprocess.STDOUT, **kwargs).strip()


def write_json(name, value):
    (OUTPUT / name).write_text(json.dumps(value, indent=2) + "\n")


def notice(value):
    print("STRINGZILLA_IMAGE_REUSE " + json.dumps(value, separators=(",", ":")), flush=True)


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
        "producer_run": PRODUCER_RUN, "producer_head": PRODUCER_HEAD,
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
    if source[1]:
        assert top is not None and top[1] == expected[:12], source[1]
    else:
        assert os.name == "nt", "Missing embedded revision on a Linux image"
    return {"SOURCE": source[1], "embedded_revision_available": bool(source[1]),
            "expected_full_revision": expected}


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



def restore(backend):
    OUTPUT.mkdir(exist_ok=True)
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    producer = "avx2" if backend == "avx512" else backend
    expected = ARTIFACTS[producer]
    run = api("actions/runs/" + str(PRODUCER_RUN))
    job = api("actions/jobs/" + str(expected["job"]))
    artifact = api("actions/artifacts/" + str(expected["id"]))
    assert run["head_sha"] == PRODUCER_HEAD and job["run_id"] == PRODUCER_RUN
    assert job["name"] == producer + " complete images"
    assert artifact["name"] == expected["name"] and not artifact["expired"]
    assert artifact["digest"] == expected["digest"]
    assert artifact["workflow_run"]["id"] == PRODUCER_RUN
    assert artifact["workflow_run"]["head_sha"] == PRODUCER_HEAD
    steps = {step["name"]: step for step in job["steps"]}
    for label in ("Record sources and vendoring", "Retain both complete images before validation and timing"):
        assert steps[label]["conclusion"] == "success", label
    workflow = api("contents/.github/workflows/stringzilla-performance.yml?ref=" + PRODUCER_HEAD)
    workflow_text = base64.b64decode(workflow["content"]).decode()
    assert "ref: " + FORK in workflow_text and "ref: " + ORIGINAL in workflow_text
    write_json("producer-run.json", run)
    write_json("producer-job.json", job)
    write_json("producer-artifact.json", artifact)
    roots = {"original": WORKSPACE / "original-source", "fork": WORKSPACE / "fork-source"}
    sources = {}
    for control, root in roots.items():
        revision = command(["git", "-C", root, "rev-parse", "HEAD"])
        assert revision == (ORIGINAL if control == "original" else FORK)
        command(["git", "-C", root, "diff", "--exit-code", "--", "src", "make", "test", "bin"])
        sources[control] = {"revision": revision,
                           "runtime_trees": command(["git", "-C", root, "ls-tree", "HEAD", "--",
                                                     "src", "make", "test", "bin"])}
    archives = WORKSPACE / "perf-image-archives"
    archives.mkdir()
    archive_zip = WORKSPACE / "producer-images.zip"
    with archive_zip.open("wb") as output:
        subprocess.run(["gh", "api", "repos/" + REPOSITORY + "/actions/artifacts/" +
                        str(expected["id"]) + "/zip"], stdout=output, check=True)
    zip_digest = hashlib.sha256(archive_zip.read_bytes()).hexdigest()
    assert "sha256:" + zip_digest == expected["digest"]
    with zipfile.ZipFile(archive_zip) as bundle:
        assert all(not Path(name).is_absolute() and ".." not in Path(name).parts
                   for name in bundle.namelist())
        bundle.extractall(archives)
    images = WORKSPACE / "perf-images"
    images.mkdir()
    receipt = {"image_sources": sources, "producer_head": PRODUCER_HEAD,
               "measurement_helper_commit": command(["git", "-C", DRIVER_SOURCE, "rev-parse", "HEAD"]),
               "producer_workflow_blob": workflow["sha"],
               "producer_run": PRODUCER_RUN, "producer_job": expected["job"],
               "artifact_id": expected["id"], "artifact_digest": expected["digest"],
               "downloaded_zip_sha256": zip_digest,
               "runtime_build_performed": False, "archives": {}}
    for control in ("original", "fork"):
        archive = archives / (control + "-jdk.tar.gz")
        recorded = (archives / (control + "-jdk.tar.gz.sha256")).read_text().split()[0]
        digest = hashlib.sha256(archive.read_bytes()).hexdigest()
        assert re.fullmatch(r"[0-9a-f]{64}", recorded) and digest == recorded
        with tarfile.open(archive, "r:gz") as bundle:
            assert all(member.name.split("/")[0] == control for member in bundle.getmembers())
            bundle.extractall(images, filter="data")
        revision = source_revision(images / control, sources[control]["revision"])
        receipt["archives"][control] = {"sha256": digest, "release": revision}
        shutil.copy2(archives / (control + "-spec.gmk"), OUTPUT / (control + "-spec.gmk"))
        shutil.copy2(images / control / "release", OUTPUT / (control + "-release.txt"))
        if os.name != "nt":
            command(["bash", roots["fork"] / ".github/scripts/check-dev-profile.sh",
                     images / control, OUTPUT / (control + "-spec.gmk")])
    write_json("artifact-reuse.json", receipt)
    notice(receipt)
    if backend == "avx512":
        assert runtime_probe(images)["passed"], "UseAVX=3 and BACKEND=2 are required before timing"


def measure(backend):
    args = [sys.executable, WORKSPACE / "fork-source/.github/scripts/stringzilla-performance.py",
            "--original", WORKSPACE / "perf-images/original", "--fork", WORKSPACE / "perf-images/fork",
            "--original-source", WORKSPACE / "original-source", "--fork-source", WORKSPACE / "fork-source",
            "--output", OUTPUT, "--backend", backend,
            "--manifest", WORKSPACE / "fork-source/doc/stringzilla/native-cases.tsv"]
    subprocess.run([str(value) for value in args], check=True)
    for name in ("original-source", "fork-source"):
        command(["git", "-C", WORKSPACE / name, "diff", "--exit-code", "--", "src", "make", "test", "bin"])


def measure_tail(backend):
    folder = WORKSPACE / "perf-tail-output"
    folder.mkdir()
    for control in ("original", "fork"):
        shutil.copy2(OUTPUT / (control + "-spec.gmk"), folder / (control + "-spec.gmk"))
    args = [sys.executable, DRIVER_SOURCE / ".github/scripts/stringzilla-tail-performance.py",
            "--original", WORKSPACE / "perf-images/original", "--fork", WORKSPACE / "perf-images/fork",
            "--original-source", WORKSPACE / "original-source", "--fork-source", WORKSPACE / "fork-source",
            "--output", folder, "--backend", backend,
            "--manifest", DRIVER_SOURCE / "doc/stringzilla/tail-cases.tsv",
            "--harness-source", DRIVER_SOURCE / "test/micro/org/openjdk/bench/java/lang"]
    with (folder / "experiment.log").open("w") as log:
        child = subprocess.Popen([str(value) for value in args], text=True,
                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT, bufsize=1)
        for line in child.stdout:
            log.write(line)
            print(line.replace("STRINGZILLA_", "STRINGZILLA_TAIL_"), end="", flush=True)
        if child.wait():
            raise RuntimeError("Reverse-tail benchmark failed")
    for name in ("original-source", "fork-source"):
        command(["git", "-C", WORKSPACE / name, "diff", "--exit-code", "--", "src", "make", "test", "bin"])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("probe", "restore", "measure", "measure-tail"))
    parser.add_argument("--backend", choices=("serial", "avx2", "avx512", "neon", "msvc"))
    args = parser.parse_args()
    if args.mode == "probe":
        probe()
    elif args.mode == "restore":
        restore(args.backend)
    elif args.mode == "measure-tail":
        measure_tail(args.backend)
    else:
        measure(args.backend)
