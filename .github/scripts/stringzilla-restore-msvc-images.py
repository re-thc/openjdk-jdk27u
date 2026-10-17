#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Restore verified MSVC images and validate them before continuing qualification."""

import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tarfile

REPOSITORY = "re-thc/openjdk-jdk27u"
RUN = 39059898881
JOB = 117475848557
ARTIFACT = 12111869212
DIGEST = "sha256:c2c669638f3f2ca48c5d89cbb7eef7214ba88f77de44da4572bdcd5672a24182"
FORK = "adbea61e47c00f12cdd6458ed96777914ee22d99"
ORIGINAL = "e206bae32b2a6cc1fa9464ad34d75f2df4b347e9"
NAME = "stringzilla-qualification-images-msvc-" + FORK
ROOT = Path.cwd()
OUTPUT = ROOT / "perf-output"


def command(args):
    return subprocess.check_output([str(x) for x in args], text=True,
                                   stderr=subprocess.STDOUT).strip()


def api(path):
    return json.loads(command(["gh", "api", "repos/" + REPOSITORY + "/" + path]))


def main():
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    OUTPUT.mkdir()
    run = api("actions/runs/" + str(RUN))
    job = api("actions/jobs/" + str(JOB))
    artifact = api("actions/artifacts/" + str(ARTIFACT))
    assert run["head_sha"] == FORK and job["run_id"] == RUN
    assert job["name"] == "msvc complete images"
    assert artifact["name"] == NAME and artifact["digest"] == DIGEST and not artifact["expired"]
    assert artifact["workflow_run"]["id"] == RUN and artifact["workflow_run"]["head_sha"] == FORK
    sources = {"original": ORIGINAL, "fork": FORK}
    trees = {}
    for control, revision in sources.items():
        source = ROOT / ("original-source" if control == "original" else "fork-source")
        assert command(["git", "-C", source, "rev-parse", "HEAD"]) == revision
        command(["git", "-C", source, "diff", "--exit-code", "--", "src", "make", "test", "bin"])
        trees[control] = command(["git", "-C", source, "ls-tree", "HEAD", "--", "src", "make", "test", "bin"])
    archives = ROOT / "perf-image-archives"
    command(["gh", "run", "download", str(RUN), "--repo", REPOSITORY, "--name", NAME, "--dir", archives])
    images = ROOT / "perf-images"
    images.mkdir()
    receipt = {"producer_run": RUN, "producer_job": JOB, "artifact_id": ARTIFACT,
               "artifact_digest": DIGEST, "sources": sources, "runtime_trees": trees,
               "runtime_build_performed": False, "archives": {}}
    for control, revision in sources.items():
        archive = archives / (control + "-jdk.tar.gz")
        expected = (archives / (control + "-jdk.tar.gz.sha256")).read_text().split()[0]
        actual = hashlib.sha256(archive.read_bytes()).hexdigest()
        assert re.fullmatch(r"[0-9a-f]{64}", expected) and actual == expected
        with tarfile.open(archive, "r:gz") as bundle:
            assert all(member.name.split("/")[0] == control for member in bundle.getmembers())
            bundle.extractall(images, filter="data")
        release = (images / control / "release").read_text()
        source = re.search(r'^SOURCE="(.*)"$', release, re.MULTILINE)
        assert source is not None
        top = re.search(r"(?:^|\s)\.:git:([0-9a-f]{12})(\+?)(?=\s|$)", source[1])
        assert top is not None and top[1] == revision[:12], source[1]
        receipt["archives"][control] = {"sha256": actual, "release_source": source[1]}
        shutil.copy2(archives / (control + "-spec.gmk"), OUTPUT / (control + "-spec.gmk"))
    (OUTPUT / "artifact-reuse.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print("STRINGZILLA_IMAGE_REUSE " + json.dumps(receipt, separators=(",", ":")), flush=True)
    jdk = images / "fork"
    jtreg = ROOT / "jtreg/installed/lib/jtreg.jar"
    for label, tests in (
        ("search", ["test/jdk/java/lang/String/StringZillaSearch.java",
                    "test/jdk/java/lang/String/StringZillaBounded.java"]),
        ("bounds", ["test/hotspot/jtreg/compiler/intrinsics/string/TestStringZillaUTF16Bounds.java",
                    "test/hotspot/jtreg/compiler/intrinsics/string/TestStringZillaDispatch.java"])):
        args = [jdk / "bin/java.exe", "-jar", jtreg, "-jdk:" + str(jdk),
                "-w:" + str(OUTPUT / ("jtreg-" + label + "-work")),
                "-r:" + str(OUTPUT / ("jtreg-" + label + "-report")),
                "-javaoption:-XX:ActiveProcessorCount=2", "-verbose:summary", *tests]
        with (OUTPUT / ("jtreg-" + label + ".log")).open("w") as log:
            result = subprocess.run([str(x) for x in args], cwd=ROOT / "fork-source",
                                    text=True, stdout=log, stderr=subprocess.STDOUT)
        print((OUTPUT / ("jtreg-" + label + ".log")).read_text(), flush=True)
        if result.returncode:
            raise RuntimeError("MSVC jtreg " + label + " checks failed")


if __name__ == "__main__":
    main()
