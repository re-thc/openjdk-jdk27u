#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Revalidate the archived Windows pair; measure its first three tier shards."""

import argparse
from contextlib import contextmanager
import hashlib
import importlib.util
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import subprocess
import zipfile

REPO = "re-thc/openjdk-jdk27u"
SOURCE = "4592230b14fc2f4b537b162fd7f6b791e882b615"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
PRODUCER_RUN = 39121850979
PRODUCER_HEAD = "8dbbc5a78e113630a5f6e9fa15be19cddd8bc3b3"
PRODUCER_JOB = 117670856747
PAIR_ID = 12137252930
PAIR_DIGEST = "sha256:b063eda10cb8213507850a01a34704d09973f7a0517694a29d09ae1e98fefa9d"
JTREG_ID = 12135393269
JTREG_DIGEST = "sha256:204a593fc22cb7f3b4f635848816c4aa4d196cc3b5b203c9604ec6d95085a088"
HELPER_HASH = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
MANIFEST_HASH = "9272cdc6717737bede09521cb304d20b92a5aef52b5b8b1b5fa501fb98133ef6"
DRIVER_HASH = "2f4dd375b33250dc0a322ce8b142def923eb06a721e386254cf872378310b8d5"
PATCHED_HASH = "a077bc269123aa2fd7ad9fd3afac943de9eeea88cbd1e77254ff4dbdc61e0f3f"
JOB_NAME = "msvc archived pair validation"
FLAGS = ("profiles_original", "profiles_fork", "jtreg_search_bounds", "jtreg_dispatch",
         "native_contract", "character_diagnostics", "image_inventories_unchanged")
COUNTS = {"interpreter": 94, "c1": 120, "c2": 102}
ROOT = Path.cwd()
SCRIPTS = Path(__file__).resolve().parent
OUT = ROOT / "perf-output"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode()).hexdigest()


def module(name, filename, expected):
    path = SCRIPTS / filename
    assert sha(path) == expected, filename + " changed"
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


frozen = module("frozen_sharded", "stringzilla-sharded.py", DRIVER_HASH)
patched = module("recovery_sharded", "stringzilla-msvc-recovery-driver.py", PATCHED_HASH)


def current():
    return {"run_id": int(os.environ["GITHUB_RUN_ID"]), "head": os.environ["GITHUB_SHA"],
            "attempt": int(os.environ["GITHUB_RUN_ATTEMPT"])}


def jobs(run):
    return frozen.api("actions/runs/" + str(run) + "/jobs?per_page=100&filter=all")["jobs"]


def unique_job(run, label, job_id=None):
    matches = [job for job in jobs(run) if job["name"] == label or job["name"].endswith("/ " + label)]
    if job_id is not None:
        matches = [job for job in matches if job["id"] == job_id]
    assert len(matches) == 1, "Missing or ambiguous live job: " + label
    return matches[0]


@contextmanager
def producer_context():
    # Only the frozen restore's original run/head checks see this context.
    # All newly emitted receipts and live job checks use the actual recovery run.
    previous = {key: os.environ[key] for key in ("GITHUB_RUN_ID", "GITHUB_SHA")}
    os.environ.update(GITHUB_RUN_ID=str(PRODUCER_RUN), GITHUB_SHA=PRODUCER_HEAD)
    try:
        yield
    finally:
        os.environ.update(previous)


def check_pair(pair):
    assert pair["sources"] == {"original": BASE, "fork": SOURCE}
    assert pair["backend"] == "msvc"
    assert pair["producer_run"] == str(PRODUCER_RUN) and pair["producer_head"] == PRODUCER_HEAD
    assert pair["helper_sha256"] == HELPER_HASH and pair["parent_manifest_sha256"] == MANIFEST_HASH
    assert set(pair["image_hashes"]) == {"original", "fork"}
    assert pair["spec"]["TOOLCHAIN_TYPE"] == "microsoft"
    for key in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"):
        assert pair["spec"][key].startswith("19.44.")
    assert pair["spec"]["TOOLCHAIN_VERSION"] == "2026"
    return pair


def arguments(pair, tier):
    return argparse.Namespace(source=SOURCE, backend="msvc", tier=tier,
        artifact_id=str(PAIR_ID), artifact_digest=PAIR_DIGEST,
        original_hash=pair["image_hashes"]["original"]["tree_sha256"],
        fork_hash=pair["image_hashes"]["fork"]["tree_sha256"],
        helper_hash=HELPER_HASH, parent_manifest_hash=MANIFEST_HASH)


def restore_pair(tier):
    frozen.check_sources(SOURCE)
    assert sha(frozen.HELPER) == HELPER_HASH and sha(frozen.MANIFEST) == MANIFEST_HASH
    producer = unique_job(PRODUCER_RUN, "msvc validated pair", PRODUCER_JOB)
    assert producer["status"] == "completed" and producer["conclusion"] == "failure"
    steps = {step["name"]: step["conclusion"] for step in producer["steps"]}
    assert steps["Verify and archive matched complete pair"] == "success"
    assert steps["Publish complete images before tests"] == "success"
    assert steps["Run profiles, jtreg and native contract checks"] == "failure"
    old_timing = [job for job in jobs(PRODUCER_RUN) if "msvc" in job["name"] and "controls" in job["name"]]
    assert old_timing and all(job["conclusion"] == "skipped" for job in old_timing)
    bootstrap = ROOT / "recovery-pair-bootstrap.zip"
    metadata = frozen.download(PAIR_ID, PAIR_DIGEST, PRODUCER_RUN, PRODUCER_HEAD, bootstrap)
    assert metadata["name"] == "stringzilla-sharded-pair-msvc-" + PRODUCER_HEAD
    with zipfile.ZipFile(bootstrap) as bundle:
        pair = check_pair(json.loads(bundle.read("pair-receipt.json")))
    bootstrap.unlink()
    args = arguments(pair, tier)
    with producer_context():
        frozen.restore(args)
    # restore verifies the pinned ZIP, both inner tar hashes, every image file,
    # releases, source trees, specs, helper and exact projected manifest.
    shutil.copy2(frozen.ARCHIVES / "pair-inventories.json", OUT / "pair-inventories.json")
    assert check_pair(json.loads((OUT / "pair-receipt.json").read_text())) == pair
    assert pair["source_trees"] == frozen.check_sources(SOURCE)
    for name in ("original", "fork"):
        assert frozen.helper().image((frozen.IMAGES / name).resolve())["tree_sha256"] == pair["image_hashes"][name]["tree_sha256"]
    frozen.write("recovery-origin.json", {
        "original_producer": {"run_id": PRODUCER_RUN, "head": PRODUCER_HEAD,
                             "job_id": PRODUCER_JOB, "conclusion": "failure"},
        "pair_artifact": {"id": PAIR_ID, "digest": PAIR_DIGEST},
        "original_skipped_timing_jobs": [{"id": job["id"], "name": job["name"],
                                         "conclusion": job["conclusion"]} for job in old_timing]})
    return pair, args


def extract(archive, destination):
    destination.mkdir(parents=True, exist_ok=False)
    with zipfile.ZipFile(archive) as bundle:
        for info in bundle.infolist():
            path = PurePosixPath(info.filename)
            assert not path.is_absolute() and ".." not in path.parts and "\\" not in info.filename
            assert ((info.external_attr >> 16) & 0o170000) != 0o120000, "ZIP symlink"
        bundle.extractall(destination)


def jtreg_tool():
    prepare = unique_job(PRODUCER_RUN, "prepare-jtreg", 117664827349)
    assert prepare["conclusion"] == "success"
    archive = ROOT / "recovery-jtreg.zip"
    metadata = frozen.download(JTREG_ID, JTREG_DIGEST, PRODUCER_RUN, PRODUCER_HEAD, archive)
    assert metadata["name"] == "bundles-jtreg-8.2.1+1"
    target = ROOT / "jtreg/installed"
    extract(archive, target)
    archive.unlink()
    jar = target / "lib/jtreg.jar"
    assert jar.is_file()
    frozen.write("recovery-jtreg.json", {"artifact": {"id": JTREG_ID, "digest": JTREG_DIGEST},
                                       "producer_run": PRODUCER_RUN, "producer_head": PRODUCER_HEAD,
                                       "prepare_job_id": prepare["id"], "jar_sha256": sha(jar)})


def toolset():
    vcvars = Path("C:/Program Files/Microsoft Visual Studio/18/Enterprise/vc/auxiliary/build/vcvars64.bat")
    assert vcvars.is_file()
    folder = OUT / "msvc-toolset"
    folder.mkdir(exist_ok=True)
    batch = folder / "check.cmd"
    batch.write_text('@echo off\ncall "' + str(vcvars) + '" -vcvars_ver=14.44\nexit /b %errorlevel%\n')
    def installed():
        result = subprocess.run(["cmd.exe", "/d", "/c", batch.name], cwd=folder,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        (folder / "check.log").write_text(result.stdout)
        print(result.stdout, flush=True)
        return result.returncode == 0
    if not installed():
        installer = Path("C:/Program Files (x86)/Microsoft Visual Studio/Installer/vs_installer.exe")
        completed = subprocess.run([str(installer), "modify", "--quiet", "--installPath",
            "C:\\Program Files\\Microsoft Visual Studio\\18\\Enterprise",
            "--add", "Microsoft.VisualStudio.Component.VC.14.44.x86.x64"])
        assert completed.returncode in (0, 3010), completed.returncode
        assert installed(), "Required 14.44 toolset unavailable"


def validate():
    assert os.name == "nt" and Path("C:/msys64/usr/bin/bash.exe").is_file()
    pair, args = restore_pair("interpreter")
    jtreg_tool()
    patched.validate(args)
    assert json.loads((OUT / "native-validation.json").read_text())["passed"] is True
    character = json.loads((OUT / "character-diagnostics.json").read_text())
    assert character["source"] == SOURCE and character["baseline"] == BASE
    assert len(character["runs"]) == 18 and len(character["reverse_runs"]) == 33
    assert len(character["javap"]) == 4
    inventories = json.loads((OUT / "pair-inventories.json").read_text())
    for name in ("original", "fork"):
        assert frozen.helper().image((frozen.IMAGES / name).resolve()) == inventories[name]
    context = current()
    assert context["attempt"] == 1, "No duplicate timing campaign through workflow rerun"
    job = unique_job(context["run_id"], JOB_NAME)
    assert job["status"] == "in_progress" and int(job["run_attempt"]) == context["attempt"]
    context.update(job_name=JOB_NAME, job_id=job["id"])
    receipt = {
        "schema": "stringzilla-msvc-recovery-v1", "source": SOURCE, "base": BASE,
        "original_producer": {"run_id": PRODUCER_RUN, "head": PRODUCER_HEAD,
                             "job_id": PRODUCER_JOB, "conclusion": "failure"},
        "pair_artifact": {"id": PAIR_ID, "digest": PAIR_DIGEST},
        "pair_receipt_sha256": sha(OUT / "pair-receipt.json"),
        "producer_image_hashes": pair["image_hashes"], "source_trees": pair["source_trees"],
        "source_trees_sha256": canonical_sha(pair["source_trees"]),
        "spec_sha256": canonical_sha(pair["spec"]),
        "helper_sha256": HELPER_HASH, "parent_manifest_sha256": MANIFEST_HASH,
        "pair_inventories_sha256": sha(OUT / "pair-inventories.json"),
        "spec_file_sha256": {name: sha(OUT / (name + "-spec.gmk")) for name in ("original", "fork")},
        "driver": {"original_git_blob": "24ae08447d825bba9afd0327741f23ab587710a1",
                   "original_sha256": DRIVER_HASH, "validation_copy_sha256": PATCHED_HASH},
        "profile_shell": "C:/msys64/usr/bin/bash.exe", "recovery": context, "timed_records": 0,
        "validation": {key: True for key in FLAGS},
        "jtreg": json.loads((OUT / "recovery-jtreg.json").read_text()),
        "log_sha256": {path.relative_to(OUT).as_posix(): sha(path) for path in sorted(OUT.rglob("*.log"))}}
    frozen.write("recovery-validation.json", receipt)
    for name in ("original", "fork"):
        frozen.output(name + "-image-hash", pair["image_hashes"][name]["tree_sha256"])
    frozen.output("receipt-sha256", sha(OUT / "recovery-validation.json"))
    frozen.check_sources(SOURCE)
    print("STRINGZILLA_RECOVERY_VALIDATION " + json.dumps(receipt, separators=(",", ":")), flush=True)


def verify_recovery():
    context = current()
    assert context["attempt"] == 1
    artifact_id = int(os.environ["VALIDATION_ARTIFACT_ID"])
    digest = os.environ["VALIDATION_ARTIFACT_DIGEST"]
    archive = OUT / "recovery-validation.zip"
    metadata = frozen.download(artifact_id, digest, context["run_id"], context["head"], archive)
    assert metadata["name"] == "stringzilla-msvc-recovery-validation-" + context["head"]
    folder = OUT / "recovery-validation-evidence"
    extract(archive, folder)
    archive.unlink()
    receipt = json.loads((folder / "recovery-validation.json").read_text())
    assert receipt["schema"] == "stringzilla-msvc-recovery-v1"
    assert receipt["source"] == SOURCE and receipt["base"] == BASE and receipt["timed_records"] == 0
    assert receipt["original_producer"] == {"run_id": PRODUCER_RUN, "head": PRODUCER_HEAD,
                                           "job_id": PRODUCER_JOB, "conclusion": "failure"}
    assert receipt["pair_artifact"] == {"id": PAIR_ID, "digest": PAIR_DIGEST}
    assert receipt["helper_sha256"] == HELPER_HASH and receipt["parent_manifest_sha256"] == MANIFEST_HASH
    assert receipt["validation"] == {key: True for key in FLAGS}
    recovery = receipt["recovery"]
    assert {key: recovery[key] for key in context} == context and recovery["job_name"] == JOB_NAME
    job = unique_job(context["run_id"], JOB_NAME, recovery["job_id"])
    assert job["conclusion"] == "success" and int(job["run_attempt"]) == context["attempt"]
    assert receipt["driver"] == {"original_git_blob": "24ae08447d825bba9afd0327741f23ab587710a1",
                                "original_sha256": DRIVER_HASH, "validation_copy_sha256": PATCHED_HASH}
    assert receipt["log_sha256"]
    for relative, expected in receipt["log_sha256"].items():
        path = PurePosixPath(relative)
        assert not path.is_absolute() and ".." not in path.parts
        assert sha(folder / relative) == expected, relative
    pair = check_pair(json.loads((folder / "pair-receipt.json").read_text()))
    assert sha(folder / "pair-receipt.json") == receipt["pair_receipt_sha256"]
    assert pair["image_hashes"] == receipt["producer_image_hashes"]
    assert pair["source_trees"] == receipt["source_trees"]
    assert canonical_sha(pair["spec"]) == receipt["spec_sha256"]
    assert sha(folder / "pair-inventories.json") == receipt["pair_inventories_sha256"]
    for name in ("original", "fork"):
        assert sha(folder / (name + "-spec.gmk")) == receipt["spec_file_sha256"][name]
    shutil.copy2(folder / "recovery-validation.json", OUT / "recovery-validation.json")
    frozen.write("recovery-validation-artifact.json", {"id": artifact_id, "digest": digest,
                 "run_id": context["run_id"], "head": context["head"],
                 "receipt_sha256": sha(OUT / "recovery-validation.json"), "validation_job_id": job["id"]})
    return receipt, pair


def measure(tier):
    recovery, recovered_pair = verify_recovery()
    pair, args = restore_pair(tier)
    assert pair == recovered_pair
    assert pair["image_hashes"] == recovery["producer_image_hashes"]
    assert sha(OUT / "pair-receipt.json") == recovery["pair_receipt_sha256"]
    assert json.loads((OUT / "shard-receipt.json").read_text())["triplets"] == COUNTS[tier]
    frozen.physical_host(args)
    assert json.loads((OUT / "physical-host.json").read_text())["available"] is True
    frozen.runtime_host(args)
    assert json.loads((OUT / "runtime-attestation.json").read_text())["available"] is True
    frozen.measure(args)
    frozen.check_sources(SOURCE)


def collection():
    frozen.check_sources(SOURCE, baseline=False)
    recovery, pair = verify_recovery()
    context = current()
    artifacts = frozen.api("actions/runs/" + str(context["run_id"]) + "/artifacts?per_page=100")["artifacts"]
    entries = []
    for tier, count in COUNTS.items():
        label = "msvc-" + tier + " recovered controls"
        job = unique_job(context["run_id"], label)
        assert job["conclusion"] == "success" and job["run_attempt"] == 1
        assert next(step for step in job["steps"] if step["name"] ==
                    "Measure first archived-pair original enabled disabled triplets")["conclusion"] == "success"
        name = "stringzilla-msvc-recovery-results-" + tier + "-" + context["head"] + "-attempt1"
        matches = [artifact for artifact in artifacts if artifact["name"] == name]
        assert len(matches) == 1
        artifact = matches[0]
        archive = OUT / (tier + ".zip")
        frozen.download(artifact["id"], artifact["digest"], context["run_id"], context["head"], archive)
        folder = OUT / ("msvc-" + tier)
        required = ["experiment.log", "shard-cases.tsv", "shard-receipt.json",
                    "recovery-validation.json", "physical-host.json", "runtime-attestation.json"]
        frozen.unpack_files(archive, required, folder)
        archive.unlink()
        assert sha(folder / "recovery-validation.json") == sha(OUT / "recovery-validation.json")
        assert json.loads((folder / "physical-host.json").read_text())["available"] is True
        assert json.loads((folder / "runtime-attestation.json").read_text())["available"] is True
        cases, columns = frozen.rows()
        selected = [dict(row, backends="msvc", tiers=tier) for row in cases if
                    "msvc" in row["backends"].split(",") and tier in row["tiers"].split(",")]
        assert len(selected) == count
        import csv, io
        projected = io.StringIO(newline="")
        writer = csv.DictWriter(projected, fieldnames=columns, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(selected)
        text = projected.getvalue()
        assert (folder / "shard-cases.tsv").read_bytes() == text.encode()
        shard = json.loads((folder / "shard-receipt.json").read_text())
        assert shard["source"] == SOURCE and shard["backend"] == "msvc" and shard["tier"] == tier
        assert shard["triplets"] == count and shard["producer_image_hashes"] == pair["image_hashes"]
        assert shard["runner_sha256"] == HELPER_HASH and shard["parent_manifest_sha256"] == MANIFEST_HASH
        assert shard["manifest_sha256"] == hashlib.sha256(text.encode()).hexdigest()
        entries.append({"backend": "msvc", "job": job, "source": SOURCE, "base": BASE,
            "manifest": text, "log_path": str(folder / "experiment.log"),
            "expected": {"manifest_sha256": shard["manifest_sha256"], "runner_sha256": HELPER_HASH,
                         "producer_image_hashes": {name: pair["image_hashes"][name]["tree_sha256"]
                                                  for name in ("original", "fork")}}})
    expected = [key for key in frozen.expected_keys()[0] if json.loads(key)[0] == "msvc"]
    assert len(expected) == 316
    frozen.write("collection-input.json", {"entries": entries, "expected_physical_keys": expected,
                 "counts": {"msvc": COUNTS}, "recovery": recovery})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("toolset", "validate", "measure", "collection"))
    parser.add_argument("--tier", choices=tuple(COUNTS))
    args = parser.parse_args()
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    OUT.mkdir(exist_ok=True)
    assert sha(frozen.HELPER) == HELPER_HASH and sha(frozen.MANIFEST) == MANIFEST_HASH
    if args.mode == "toolset":
        toolset()
    elif args.mode == "validate":
        validate()
    elif args.mode == "measure":
        assert args.tier in COUNTS
        measure(args.tier)
    else:
        collection()
