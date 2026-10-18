#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Restore only a pinned original image, then qualify one complete MSVC candidate."""

import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tarfile
import zipfile

REPOSITORY = "re-thc/openjdk-jdk27u"
CANDIDATE = "d06f7647c1b080c075f2d632fe7d9fae8479eb04"
ORIGINAL = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
PRODUCER_RUN = 39073742791
PRODUCER_HEAD = "9adc53b852aae7610a560e20034d6d777b5db9d3"
PRODUCER_JOB = 117516727687
ARTIFACT_ID = 12117585451
ARTIFACT_DIGEST = "sha256:6e31e01a744f3aa25a6bb475d2e0ad2545cfe4ace417cc13b398c67951331316"
MANIFEST_HASH = "db63b9133da43d3d4004e207816b01600f5f3f40420e329ba470dd8bb56a4703"
ROOT = Path.cwd()
DRIVER = Path(__file__).resolve().parents[2]
OUTPUT = ROOT / "perf-output"
IMAGES = ROOT / "perf-images"
ARCHIVES = ROOT / "perf-image-archives"
HELPER = ROOT / ".github/scripts/stringzilla-performance.py"


def command(args, **kwargs):
    return subprocess.check_output([str(x) for x in args], text=True,
                                   stderr=subprocess.STDOUT, **kwargs).strip()


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_json(name, value):
    (OUTPUT / name).write_text(json.dumps(value, indent=2) + "\n")


def module():
    spec = importlib.util.spec_from_file_location("candidate_performance", HELPER)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def check_sources():
    assert os.name == "nt", "This qualification requires native MSVC Windows"
    assert re.fullmatch(r"[0-9a-f]{40}", CANDIDATE), "Fill the candidate runtime SHA before launch"
    for root, expected in ((ROOT, CANDIDATE), (ROOT / "baseline", ORIGINAL)):
        assert command(["git", "-C", root, "rev-parse", "HEAD"]) == expected
        command(["git", "-C", root, "diff", "--exit-code", "--", "src", "make", "test", "bin",
                 ".github/scripts/stringzilla-performance.py"])


def api(path):
    return json.loads(command(["gh", "api", "repos/" + REPOSITORY + "/" + path]))


def embedded_source(image, expected):
    text = (image / "release").read_text()
    source = re.search(r'^SOURCE="(.*)"$', text, re.MULTILINE)
    assert source is not None, "Missing image SOURCE field"
    if source[1]:
        top = re.search(r"(?:^|\s)\.:git:([0-9a-f]{12})(\+?)(?=\s|$)", source[1])
        assert top is not None and top[1] == expected[:12], source[1]
    return {"SOURCE": source[1], "embedded_revision_available": bool(source[1]),
            "expected_full_revision": expected}


def restore():
    OUTPUT.mkdir(exist_ok=True)
    IMAGES.mkdir()
    ARCHIVES.mkdir()
    run = api("actions/runs/" + str(PRODUCER_RUN))
    job = api("actions/jobs/" + str(PRODUCER_JOB))
    artifact = api("actions/artifacts/" + str(ARTIFACT_ID))
    assert run["head_sha"] == PRODUCER_HEAD and job["run_id"] == PRODUCER_RUN
    assert job["name"] == "msvc complete images"
    assert artifact["id"] == ARTIFACT_ID and not artifact["expired"]
    assert artifact["digest"] == ARTIFACT_DIGEST
    assert artifact["workflow_run"]["id"] == PRODUCER_RUN
    assert artifact["workflow_run"]["head_sha"] == PRODUCER_HEAD
    steps = {step["name"]: step for step in job["steps"]}
    for name in ("Record sources and vendoring", "Retain both complete images before validation and timing"):
        assert steps[name]["conclusion"] == "success", name
    workflow = api("contents/.github/workflows/stringzilla-performance.yml?ref=" + PRODUCER_HEAD)
    import base64
    workflow_text = base64.b64decode(workflow["content"]).decode()
    assert "ref: " + ORIGINAL in workflow_text
    for name, value in (("producer-run.json", run), ("producer-job.json", job),
                        ("producer-artifact.json", artifact)):
        write_json(name, value)
    archive_zip = ROOT / "producer-images.zip"
    with archive_zip.open("wb") as output:
        subprocess.run(["gh", "api", "repos/" + REPOSITORY + "/actions/artifacts/" +
                        str(ARTIFACT_ID) + "/zip"], stdout=output, check=True)
    assert "sha256:" + sha(archive_zip) == ARTIFACT_DIGEST
    # Do not extract or copy the producer's fork image, specs, binaries or classes.
    names = ("original-jdk.tar.gz", "original-jdk.tar.gz.sha256", "original-spec.gmk")
    with zipfile.ZipFile(archive_zip) as bundle:
        for name in names:
            with bundle.open(name) as source, (ARCHIVES / name).open("wb") as target:
                shutil.copyfileobj(source, target)
    archive = ARCHIVES / "original-jdk.tar.gz"
    digest = sha(archive)
    assert (ARCHIVES / "original-jdk.tar.gz.sha256").read_text().split()[0] == digest
    with tarfile.open(archive, "r:gz") as bundle:
        assert all(member.name.split("/")[0] == "original" for member in bundle.getmembers())
        bundle.extractall(IMAGES, filter="data")
    shutil.copy2(ARCHIVES / "original-spec.gmk", OUTPUT / "original-spec.gmk")
    original = module().image((IMAGES / "original").resolve())
    assert original["tree_sha256"] == "97417c894aac491cf065347d490002f9638a1f6bf5633fbce4e6626d03d50202"
    write_json("original-image-inventory.json", original)
    receipt = {"runtime_sources": {"original": ORIGINAL, "fork": CANDIDATE},
               "producer_run": PRODUCER_RUN, "producer_head": PRODUCER_HEAD,
               "producer_job": PRODUCER_JOB, "artifact_id": ARTIFACT_ID,
               "artifact_digest": ARTIFACT_DIGEST, "downloaded_zip_sha256": sha(archive_zip),
               "original_tar_sha256": digest,
               "original_image_sha256": original["tree_sha256"],
               "release": embedded_source(IMAGES / "original", ORIGINAL),
               "old_fork_extracted": False,
               "driver_commit": command(["git", "-C", DRIVER, "rev-parse", "HEAD"]),
               "driver_sha256": sha(Path(__file__))}
    write_json("original-reuse.json", receipt)
    print("STRINGZILLA_ORIGINAL_REUSE " + json.dumps(receipt, separators=(",", ":")), flush=True)
    archive_zip.unlink()


def archive():
    helper = module()
    specs = {name: helper.read_spec(OUTPUT / (name + "-spec.gmk")) for name in ("original", "fork")}
    assert specs["original"] == specs["fork"], specs
    spec = specs["fork"]
    assert spec["TOOLCHAIN_TYPE"] == "microsoft" and spec["TOOLCHAIN_VERSION"] == "2026"
    assert spec["DEBUG_LEVEL"] == "release" and spec["SOURCE_DATE"] == "1792195200"
    assert spec["VERSION_OPT"] == "stringzilla-benchmark"
    for compiler in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"):
        assert spec[compiler].startswith("19.44."), spec
    images = {name: helper.image((IMAGES / name).resolve()) for name in ("original", "fork")}
    original = json.loads((OUTPUT / "original-image-inventory.json").read_text())
    assert images["original"] == original, "Restored original changed during candidate build"
    assert images["original"]["tree_sha256"] != images["fork"]["tree_sha256"]
    shutil.copy2(OUTPUT / "fork-spec.gmk", ARCHIVES / "fork-spec.gmk")
    fork_archive = ARCHIVES / "fork-jdk.tar.gz"
    with tarfile.open(fork_archive, "w:gz") as bundle:
        bundle.add(IMAGES / "fork", arcname="fork")
    (ARCHIVES / "fork-jdk.tar.gz.sha256").write_text(sha(fork_archive) + "  fork-jdk.tar.gz\n")
    write_json("candidate-image-inventory.json", images)
    receipt = {"sources": {"original": ORIGINAL, "fork": CANDIDATE}, "spec": spec,
               "image_hashes": {name: {"tree_sha256": value["tree_sha256"]} for name, value in images.items()},
               "fork_release": embedded_source(IMAGES / "fork", CANDIDATE),
               "helper_sha256": sha(HELPER), "manifest_sha256": sha(DRIVER / "doc/stringzilla/tail-cases.tsv"),
               "complete_fork_build": True, "old_fork_reused": False}
    assert receipt["manifest_sha256"] == MANIFEST_HASH
    write_json("candidate-pair.json", receipt)
    print("STRINGZILLA_CANDIDATE_PAIR " + json.dumps(receipt, separators=(",", ":")), flush=True)


def native_tests(jtreg):
    folder = (OUTPUT / "native-validation").resolve()
    folder.mkdir()
    library = folder / "StringZillaKernelsTest.dll"
    obj = folder / "StringZillaKernelsTest.obj"
    includes = [ROOT / "src/java.base/share/native/libjava",
                ROOT / "src/java.base/share/native/libjava/stringzilla",
                ROOT / "src/hotspot/share/include", ROOT / "src/hotspot/os/windows/include",
                IMAGES / "fork/include", IMAGES / "fork/include/win32"]
    args = ["cl.exe", "/nologo", "/std:c11", "/O2", "/utf-8", "/LD",
            *["/I" + str(path.resolve()) for path in includes],
            str(ROOT / "test/jdk/java/lang/String/libStringZillaKernelsTest.c"),
            "/Fo" + str(obj), "/Fe" + str(library)]
    quoted = lambda values: " ".join('"' + str(value) + '"' for value in values)
    batch = folder / "build-native.cmd"
    batch.write_text('@echo off\ncall "C:\\Program Files\\Microsoft Visual Studio\\18\\Enterprise\\vc\\auxiliary\\build\\vcvars64.bat" -vcvars_ver=14.44\n'
                     'if errorlevel 1 exit /b %errorlevel%\n' + quoted(args) + '\n'
                     'if errorlevel 1 exit /b %errorlevel%\n')
    env = os.environ.copy()
    env.pop("CL", None)
    env.pop("_CL_", None)
    with (folder / "build.log").open("w") as log:
        completed = subprocess.run(["cmd.exe", "/d", "/c", batch.name], cwd=folder, env=env,
                                   stdout=log, stderr=subprocess.STDOUT)
    if completed.returncode:
        print((folder / "build.log").read_text(), flush=True)
        raise RuntimeError("Candidate native kernel DLL compilation failed")
    with (folder / "jtreg.log").open("w") as log:
        completed = subprocess.run([str(IMAGES / "fork/bin/java.exe"), "-jar", str(jtreg.resolve()),
            "-jdk:" + str((IMAGES / "fork").resolve()), "-nativepath:" + str(folder),
            "-w:" + str(folder / "work"), "-r:" + str(folder / "report"),
            "-javaoption:-XX:ActiveProcessorCount=2", "-verbose:summary",
            str(ROOT / "test/jdk/java/lang/String/StringZillaKernelsTest.java")],
            stdout=log, stderr=subprocess.STDOUT)
    print((folder / "jtreg.log").read_text(), flush=True)
    assert completed.returncode == 0, "Candidate native kernel jtreg failed"
    write_json("native-validation.json", {"compiler_args": args, "passed": True,
               "files_sha256": {path.name: sha(path) for path in folder.iterdir() if path.is_file()}})


def measure():
    helper = module()
    before = json.loads((OUTPUT / "candidate-image-inventory.json").read_text())
    for name in ("original", "fork"):
        assert helper.image((IMAGES / name).resolve()) == before[name], "Image changed during validation"
    receipt = json.loads((OUTPUT / "candidate-pair.json").read_text())
    manifest = DRIVER / "doc/stringzilla/tail-cases.tsv"
    assert sha(HELPER) == receipt["helper_sha256"] and sha(manifest) == MANIFEST_HASH
    subprocess.run([sys.executable, str(HELPER), "--original", str(IMAGES / "original"),
        "--fork", str(IMAGES / "fork"), "--original-source", str(ROOT / "baseline"),
        "--fork-source", str(ROOT), "--output", str(OUTPUT), "--backend", "msvc",
        "--manifest", str(manifest)], check=True)
    check_sources()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("restore", "archive", "native-tests", "measure"))
    parser.add_argument("--jtreg", type=Path)
    options = parser.parse_args()
    check_sources()
    if options.mode == "restore":
        restore()
    elif options.mode == "archive":
        archive()
    elif options.mode == "native-tests":
        assert options.jtreg is not None
        native_tests(options.jtreg)
    else:
        measure()
