#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Measure only SKY ABC and primary tiers proven to contain no earlier timings."""

import argparse
from contextlib import contextmanager
import csv
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import shutil
import zipfile

SOURCE = "4592230b14fc2f4b537b162fd7f6b791e882b615"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
RUN = 39121850979
HEAD = "8dbbc5a78e113630a5f6e9fa15be19cddd8bc3b3"
PAIR_ID = 12136383132
PAIR_DIGEST = "sha256:eacc03474b8dd7cc4d2eec96ec23c7901e62472b26d6087871654694a74fbde4"
PRODUCER_JOB = 117670856710
HELPER_HASH = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
MANIFEST_HASH = "9272cdc6717737bede09521cb304d20b92a5aef52b5b8b1b5fa501fb98133ef6"
DRIVER_HASH = "2f4dd375b33250dc0a322ce8b142def923eb06a721e386254cf872378310b8d5"
COUNTS = {"interpreter": 129, "c1": 120}
JOB_NAME = "Missing SKY ABC interpreter and C1 controls"
PINS = [
    {
        "label": "interpreter",
        "job": 117676794961,
        "artifact": 12139543436,
        "digest": "sha256:1c57c6e166cfc2c1806a7cf4bf8ae4e9bd0408c888d8dfee1492714af89febfb",
        "name": "stringzilla-sharded-results-avx512-interpreter-8dbbc5a78e113630a5f6e9fa15be19cddd8bc3b3-attempt1"
    },
    {
        "label": "c1",
        "job": 117676794993,
        "artifact": 12140116321,
        "digest": "sha256:63e0bc250675bec042b960c5bb178752d565e87aeb25ce38ef3dc8eb4301affd",
        "name": "stringzilla-sharded-results-avx512-c1-8dbbc5a78e113630a5f6e9fa15be19cddd8bc3b3-attempt1"
    }
]
for pin in PINS:
    pin.update(run=RUN, head=HEAD, attempt=1, kind="primary", tier=pin["label"])
ABC_RUN = 39133706140
ABC_HEAD = "bef5407df2d4da71cc1414da26a90a5d665f014b"
PINS += [
    {"label": "abc-attempt1", "job": 117693851322, "artifact": 12139488074,
     "digest": "sha256:a2b98ea49e4ec99875cb253a4185e381570976251af025571436bfd90479a2c8",
     "name": "stringzilla-periodic-controls-avx512-" + ABC_HEAD + "-attempt1",
     "run": ABC_RUN, "head": ABC_HEAD, "attempt": 1, "kind": "abc", "tier": "all"},
    {"label": "abc-attempt2", "job": 117707149157, "artifact": 12140982007,
     "digest": "sha256:55f005bde71663cddaf3e693246dbfc9aeb18d3689703bba9f9de5f335a7db1f",
     "name": "stringzilla-periodic-controls-avx512-" + ABC_HEAD + "-attempt2",
     "run": ABC_RUN, "head": ABC_HEAD, "attempt": 2, "kind": "abc", "tier": "all"}
]
ABC_WRAPPER_HASH = "ffe38cfcfa76a402e59a52cd459f5868759b96cb2c9431b185dac3f7c1235dcf"
ROOT = Path.cwd()
OUT = ROOT / "perf-output"
RESTORE = OUT / "restore"
frozen_path = ROOT / "producer/.github/scripts/stringzilla-sharded.py"
assert hashlib.sha256(frozen_path.read_bytes()).hexdigest() == DRIVER_HASH
spec = importlib.util.spec_from_file_location("frozen_sharded", frozen_path)
frozen = importlib.util.module_from_spec(spec)
spec.loader.exec_module(frozen)
abc_path = ROOT / "periodic/.github/scripts/stringzilla-periodic-controls.py"
assert hashlib.sha256(abc_path.read_bytes()).hexdigest() == ABC_WRAPPER_HASH
abc_spec = importlib.util.spec_from_file_location("frozen_periodic", abc_path)
abc = importlib.util.module_from_spec(abc_spec)
abc_spec.loader.exec_module(abc)
# Both immutable wrappers share the one restored pair and current output directory.
abc.module = frozen


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def current():
    return {"run_id": int(os.environ["GITHUB_RUN_ID"]), "head": os.environ["GITHUB_SHA"],
            "attempt": int(os.environ["GITHUB_RUN_ATTEMPT"])}


def jobs(run):
    return frozen.api("actions/runs/" + str(run) + "/jobs?per_page=100&filter=all")["jobs"]


@contextmanager
def producer_context():
    previous = {key: os.environ[key] for key in ("GITHUB_RUN_ID", "GITHUB_SHA")}
    os.environ.update(GITHUB_RUN_ID=str(RUN), GITHUB_SHA=HEAD)
    try:
        yield
    finally:
        os.environ.update(previous)


def args_for(pair=None, tier="interpreter"):
    return argparse.Namespace(source=SOURCE, backend="avx512", tier=tier,
        artifact_id=str(PAIR_ID), artifact_digest=PAIR_DIGEST,
        original_hash=None if pair is None else pair["image_hashes"]["original"]["tree_sha256"],
        fork_hash=None if pair is None else pair["image_hashes"]["fork"]["tree_sha256"],
        helper_hash=HELPER_HASH, parent_manifest_hash=MANIFEST_HASH)


def inputs(baseline=True):
    frozen.check_sources(SOURCE, baseline=baseline)
    assert sha(frozen.HELPER) == HELPER_HASH and sha(frozen.MANIFEST) == MANIFEST_HASH
    expected, counts = frozen.expected_keys()
    assert {tier: counts["avx512"][tier] for tier in COUNTS} == COUNTS
    assert len([key for key in expected if json.loads(key)[0] == "avx512" and
                json.loads(key)[1] in COUNTS]) == 249


def skip_payload(pin, archive):
    with zipfile.ZipFile(archive) as bundle:
        names = bundle.namelist()
        assert len(names) == 2 and set(names) == {"SKIPPED.json", "physical-host.json"}
        assert all(0 < bundle.getinfo(name).file_size < 65536 for name in names)
        raw = {name: bundle.read(name) for name in names}
    receipt = json.loads(raw["SKIPPED.json"])
    assert receipt == json.loads(raw["physical-host.json"])
    assert receipt["available"] is False
    assert type(receipt["timed_records"]) is int and receipt["timed_records"] == 0
    assert receipt["source"] == SOURCE and receipt["backend"] == "avx512"
    assert receipt["tier"] == pin["tier"]
    return raw, receipt


def container_provenance():
    assert frozen.command(["uname", "-m"]) == "x86_64"
    release = Path("/etc/os-release").read_text()
    assert 'VERSION_ID="26.04"' in release
    image_reference = "ubuntu@sha256:42527649dbc4f9197a6073f426f488cbff0e9cc9f2afce32d91c383e4875634a"
    assert os.environ["EXPECTED_CONTAINER_IMAGE"] == image_reference
    roots = [Path("/etc/os-release"), Path("/var/lib/dpkg/status"), Path("/usr/lib/x86_64-linux-gnu/libc.so.6")]
    provenance = {"image_reference": image_reference,
        "expected_image_id": "sha256:b9e485d4a3bc6efa60fc5150444a82f3d96991fdcec7caa1d0f3e7a0b5859321",
        "image_information_git_blob": "9652094fbc0721470dc3ecb94e7dc5c4aedf965e",
        "host_runner_label": "ubuntu-24.04", "host_runner_os": os.environ["RUNNER_OS"],
        "native_execution": True, "source": SOURCE, "uname": frozen.command(["uname", "-a"]),
        "os_release": release, "glibc": frozen.command(["ldd", "--version"]),
        "packages": frozen.command(["dpkg-query", "-W", "base-files", "libc6", "gcc-16", "python3", "git", "gh"]),
        "affinity_before": sorted(os.sched_getaffinity(0)),
        "host_image_environment": {key: os.environ.get(key) for key in ("ImageOS", "ImageVersion")},
        "actual_root_files_sha256": {str(path): sha(path) for path in roots}}
    write(OUT / "container-provenance.json", provenance)
    print("STRINGZILLA_MISSING_CONTAINER " + json.dumps(provenance, separators=(",", ":")), flush=True)


def failed_replay_proof():
    run_id, head, job_id = 39141121791, "f0b69202c6b6809187c571b5696c23856a624d09", 117715594103
    run = frozen.api("actions/runs/" + str(run_id))
    assert run["head_sha"] == head and run["status"] == "completed" and run["conclusion"] == "failure"
    matching = [job for job in jobs(run_id) if job["id"] == job_id]
    assert len(matching) == 1
    job = matching[0]
    assert job["head_sha"] == head and job["status"] == "completed" and job["conclusion"] == "failure"
    steps = {step["name"]: step["conclusion"] for step in job["steps"]}
    assert steps["Verify all four original zero-timing ZIPs before checking this CPU"] == "failure"
    assert steps["Restore archived complete pair and attest actual SKY runtime and native contracts"] == "skipped"
    assert steps["Measure only six ABC triplets then missing interpreter and C1 projections"] == "skipped"
    artifacts = frozen.api("actions/runs/" + str(run_id) + "/artifacts?per_page=100")["artifacts"]
    assert artifacts == [], "The failed setup produced no measurement artifact"
    receipt = {"source": SOURCE, "run_id": run_id, "head": head, "job": job,
               "artifacts": artifacts, "timed_records": 0, "failure_phase": "preflight-before-restore"}
    write(OUT / "failed-replay-proof.json", receipt)
    print("STRINGZILLA_MISSING_FAILED_REPLAY " + json.dumps(receipt, separators=(",", ":")), flush=True)
    return receipt


def preflight():
    failed_replay_proof()
    try:
        inputs()
    except Exception as error:
        print("STRINGZILLA_MISSING_INPUT_ERROR " + str(getattr(error, "output", error)), flush=True)
        raise
    assert current()["attempt"] == 1, "A timed replay may not be rerun"
    container_provenance()
    folder = OUT / "old-skips"
    folder.mkdir()
    proofs = []
    for pin in PINS:
        old_run = frozen.api("actions/runs/" + str(pin["run"]))
        assert old_run["head_sha"] == pin["head"]
        selected = [job for job in jobs(pin["run"]) if job["id"] == pin["job"]]
        assert len(selected) == 1
        job = selected[0]
        assert job["run_id"] == pin["run"] and job["run_attempt"] == pin["attempt"]
        assert job["status"] == "completed" and job["conclusion"] == "success"
        steps = {step["name"]: step["conclusion"] for step in job["steps"]}
        if pin["kind"] == "primary":
            assert job["name"].endswith("/ avx512-" + pin["tier"] + " controls")
            assert steps["Check physical CPU and compiled profile prerequisites"] == "success"
            assert steps["Restore complete pair and project the fixed manifest"] == "skipped"
            assert steps["Measure sequential original enabled and disabled triplets"] == "skipped"
        else:
            assert job["name"] == "avx512 periodic controls"
            assert steps["Validate fixed inputs and physical CPU prerequisites"] == "success"
            assert steps["Restore archived pairs after Linux and recovered MSVC qualification"] == "skipped"
            assert steps["Measure only periodic original enabled and disabled triplets"] == "skipped"
        archive = folder / (pin["label"] + ".zip")
        metadata = frozen.download(pin["artifact"], pin["digest"], pin["run"], pin["head"], archive)
        assert metadata["name"] == pin["name"]
        raw, receipt = skip_payload(pin, archive)
        for name, data in raw.items():
            (folder / (pin["label"] + "-" + name)).write_bytes(data)
        proof = {"pin": pin, "run_id": pin["run"], "head": pin["head"], "job": job,
                 "downloaded_zip_sha256": sha(archive), "receipt": receipt,
                 "files_sha256": {name: hashlib.sha256(data).hexdigest() for name, data in raw.items()}}
        proofs.append(proof)
        print("STRINGZILLA_MISSING_OLD_SKIP " + json.dumps(proof, separators=(",", ":")), flush=True)
    write(OUT / "old-skip-proof.json", {"source": SOURCE, "proofs": proofs, "timed_records": 0})
    frozen.OUT = OUT
    frozen.physical_host(args_for())
    physical = json.loads((OUT / "physical-host.json").read_text())
    print("STRINGZILLA_MISSING_PHYSICAL " + json.dumps(physical, separators=(",", ":")), flush=True)
    assert physical["available"] is True, "Unsupported host: zero measurements; retain hardware receipt"


def prepare():
    inputs()
    assert current()["attempt"] == 1
    assert json.loads((OUT / "physical-host.json").read_text())["available"] is True
    proofs = json.loads((OUT / "old-skip-proof.json").read_text())
    assert proofs["source"] == SOURCE and len(proofs["proofs"]) == 4 and proofs["timed_records"] == 0
    producer = [job for job in jobs(RUN) if job["id"] == PRODUCER_JOB]
    assert len(producer) == 1 and producer[0]["conclusion"] == "success"
    assert producer[0]["name"].endswith("/ avx2 validated pair")
    archive = ROOT / "candidate-pair.zip"
    metadata = frozen.download(PAIR_ID, PAIR_DIGEST, RUN, HEAD, archive)
    assert metadata["name"] == "stringzilla-sharded-pair-avx2-" + HEAD
    with zipfile.ZipFile(archive) as bundle:
        pair = json.loads(bundle.read("pair-receipt.json"))
    assert pair["producer_run"] == str(RUN) and pair["producer_head"] == HEAD
    assert pair["sources"] == {"original": BASE, "fork": SOURCE} and pair["backend"] == "avx2"
    assert pair["helper_sha256"] == HELPER_HASH and pair["parent_manifest_sha256"] == MANIFEST_HASH
    RESTORE.mkdir()
    frozen.OUT = RESTORE
    # The exact frozen restore downloads and verifies the pinned archive again,
    # preserving its original producer identity rather than relabeling it.
    with producer_context():
        frozen.restore(args_for(pair))
    shutil.copy2(frozen.ARCHIVES / "pair-inventories.json", RESTORE / "pair-inventories.json")
    assert pair == json.loads((RESTORE / "pair-receipt.json").read_text())
    assert pair["source_trees"] == frozen.check_sources(SOURCE)
    frozen.runtime_host(args_for(pair))
    assert json.loads((RESTORE / "runtime-attestation.json").read_text())["available"] is True
    frozen.native()
    assert "requested=2 selected=2 executable=1" in (RESTORE / "native-validation/run.log").read_text()
    assert json.loads((RESTORE / "native-validation.json").read_text())["passed"] is True
    context = current()
    own = [job for job in jobs(context["run_id"]) if job["name"] == JOB_NAME and
           job["run_attempt"] == context["attempt"]]
    assert len(own) == 1 and own[0]["status"] == "in_progress"
    context.update(job_id=own[0]["id"], job_name=JOB_NAME)
    preparation = {
        "schema": "stringzilla-avx512-missing-v1", "source": SOURCE, "base": BASE,
        "replay": context, "original_producer": {"run_id": RUN, "head": HEAD,
             "job_id": PRODUCER_JOB, "conclusion": "success", "backend": "avx2"},
        "pair_artifact": {"id": PAIR_ID, "digest": PAIR_DIGEST},
        "pair_receipt_sha256": sha(RESTORE / "pair-receipt.json"),
        "producer_image_hashes": pair["image_hashes"], "source_trees": pair["source_trees"],
        "helper_sha256": HELPER_HASH, "parent_manifest_sha256": MANIFEST_HASH,
        "driver_sha256": DRIVER_HASH, "old_skip_proof_sha256": sha(OUT / "old-skip-proof.json"),
        "failed_replay_proof_sha256": sha(OUT / "failed-replay-proof.json"),
        "requested_counts": COUNTS, "abc_triplets": 6, "runtime_sky_attested": True, "native_sky_contract_passed": True,
        "container_provenance_sha256": sha(OUT / "container-provenance.json"),
        "abc_wrapper_sha256": ABC_WRAPPER_HASH, "abc_helper_sha256": abc.EXTRA_HELPER_SHA,
        "abc_manifest_sha256": abc.PERIODIC_SHA, "abc_application_sha256": abc.EXTRA_SOURCE_SHA,
        "timed_records_at_preparation": 0}
    write(OUT / "replay-preparation.json", preparation)


def project(pair, tier, folder):
    cases, columns = frozen.rows()
    selected = [dict(row, backends="avx2", tiers=tier) for row in cases if
                "avx2" in row["backends"].split(",") and tier in row["tiers"].split(",")]
    assert len(selected) == COUNTS[tier]
    target = folder / "shard-cases.tsv"
    with target.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=columns, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(selected)
    write(folder / "shard-receipt.json", {"backend": "avx512", "tier": tier, "source": SOURCE,
        "manifest_sha256": sha(target), "runner_sha256": HELPER_HASH,
        "parent_manifest_sha256": MANIFEST_HASH, "triplets": COUNTS[tier],
        "producer_image_hashes": pair["image_hashes"]})
    return target.read_text()


def measure():
    inputs()
    assert current()["attempt"] == 1, "No repeated timed attempt"
    preparation = json.loads((OUT / "replay-preparation.json").read_text())
    assert preparation["source"] == SOURCE and preparation["requested_counts"] == COUNTS
    assert preparation["native_sky_contract_passed"] is True and preparation["runtime_sky_attested"] is True
    assert sha(OUT / "old-skip-proof.json") == preparation["old_skip_proof_sha256"]
    pair = json.loads((RESTORE / "pair-receipt.json").read_text())
    assert sha(RESTORE / "pair-receipt.json") == preparation["pair_receipt_sha256"]
    abc.validate_inputs()
    folder = OUT / "abc"
    folder.mkdir()
    for name in ("original", "fork"):
        shutil.copy2(RESTORE / (name + "-spec.gmk"), folder / (name + "-spec.gmk"))
    text, triplets = abc.projection("avx512")
    assert triplets == 6
    (folder / "shard-cases.tsv").write_bytes(text.encode())
    receipt = {"source": SOURCE, "baseline": BASE, "backend": "avx512",
        "producer_run": RUN, "producer_head": HEAD, "producer_job_id": PRODUCER_JOB,
        "pair_artifact": {"id": PAIR_ID, "digest": PAIR_DIGEST},
        "pair_receipt_sha256": preparation["pair_receipt_sha256"],
        "producer_image_hashes": pair["image_hashes"], "source_trees": pair["source_trees"],
        "parent_manifest_sha256": MANIFEST_HASH, "periodic_manifest_sha256": abc.PERIODIC_SHA,
        "manifest_sha256": sha(folder / "shard-cases.tsv"), "producer_runner_sha256": HELPER_HASH,
        "runner_sha256": abc.EXTRA_HELPER_SHA, "extra_benchmark_source_sha256": abc.EXTRA_SOURCE_SHA,
        "frozen_periodic_driver_sha256": ABC_WRAPPER_HASH, "replay": preparation["replay"],
        "triplets": 6, "controls": ["original", "enabled", "disabled"], "runtime_unchanged": True,
        "extra_uniform_diagnostics": False}
    write(folder / "periodic-receipt.json", receipt)
    frozen.OUT = folder
    observations = {}
    for tier in frozen.TIERS:
        frozen.runtime_host(args_for(pair, tier))
        observations[tier] = json.loads((folder / "runtime-attestation.json").read_text())
        assert observations[tier]["available"] is True
        shutil.copy2(folder / "runtime-attestation.json", folder / ("runtime-" + tier + ".json"))
        (folder / "runtime-probe").rename(folder / ("runtime-probe-" + tier))
    write(folder / "periodic-runtime.json", {"available": True, "observations": observations})
    abc.character_c2_diagnostics(args_for(pair, "c2"))
    abc.measure(args_for(pair))
    abc_complete = {"triplets": 6, "experiment_sha256": sha(folder / "experiment.log"),
                    "manifest_sha256": sha(folder / "shard-cases.tsv"),
                    "receipt_sha256": sha(folder / "periodic-receipt.json")}
    completed = {}
    for tier in COUNTS:
        folder = OUT / tier
        folder.mkdir()
        project(pair, tier, folder)
        for name in ("original", "fork"):
            shutil.copy2(RESTORE / (name + "-spec.gmk"), folder / (name + "-spec.gmk"))
        frozen.OUT = folder
        frozen.runtime_host(args_for(pair, tier))
        assert json.loads((folder / "runtime-attestation.json").read_text())["available"] is True
        frozen.measure(args_for(pair, tier))
        inputs()
        completed[tier] = {"triplets": COUNTS[tier], "experiment_sha256": sha(folder / "experiment.log"),
                           "manifest_sha256": sha(folder / "shard-cases.tsv"),
                           "runtime_attestation_sha256": sha(folder / "runtime-attestation.json")}
    write(OUT / "replay-complete.json", {"preparation_sha256": sha(OUT / "replay-preparation.json"),
          "source": SOURCE, "replay": preparation["replay"], "completed_tiers": completed,
          "abc": abc_complete, "expected_triplets": 255, "expected_records": 765})


def collection():
    inputs(baseline=False)
    context = current()
    artifact_id = int(os.environ["MEASUREMENT_ARTIFACT_ID"])
    digest = os.environ["MEASUREMENT_ARTIFACT_DIGEST"]
    archive = OUT / "missing-results.zip"
    metadata = frozen.download(artifact_id, digest, context["run_id"], context["head"], archive)
    assert metadata["name"] == "stringzilla-avx512-missing-" + context["head"] + "-attempt1"
    folder = OUT / "collected"
    with zipfile.ZipFile(archive) as bundle:
        names = ["replay-preparation.json", "replay-complete.json", "old-skip-proof.json",
                 "physical-host.json", "failed-replay-proof.json", "restore/pair-receipt.json", "restore/native-validation.json",
                 "restore/native-validation/run.log", "container-provenance.json"]
        names += ["old-skips/" + pin["label"] + ".zip" for pin in PINS]
        names += [name for name in bundle.namelist() if name.startswith("abc/") and not name.endswith("/")]
        names += [tier + "/" + name for tier in COUNTS for name in
                  ("experiment.log", "shard-cases.tsv", "shard-receipt.json", "runtime-attestation.json")]
        for name in names:
            target = folder / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(bundle.read(name))
    archive.unlink()
    preparation = json.loads((folder / "replay-preparation.json").read_text())
    complete = json.loads((folder / "replay-complete.json").read_text())
    assert complete["preparation_sha256"] == sha(folder / "replay-preparation.json")
    assert preparation["source"] == complete["source"] == SOURCE and preparation["base"] == BASE
    assert preparation["helper_sha256"] == HELPER_HASH and preparation["parent_manifest_sha256"] == MANIFEST_HASH
    assert preparation["driver_sha256"] == DRIVER_HASH
    replay = preparation["replay"]
    assert replay == complete["replay"]
    assert replay["run_id"] == context["run_id"] and replay["head"] == context["head"]
    assert replay["attempt"] == 1 and replay["job_name"] == JOB_NAME
    matching = [job for job in jobs(context["run_id"]) if job["id"] == replay["job_id"]]
    assert len(matching) == 1 and matching[0]["conclusion"] == "success"
    job = matching[0]
    assert job["name"] == JOB_NAME and job["run_attempt"] == 1
    assert next(step for step in job["steps"] if step["name"] ==
                "Measure only six ABC triplets then missing interpreter and C1 projections")["conclusion"] == "success"
    assert json.loads((folder / "physical-host.json").read_text())["available"] is True
    assert preparation["runtime_sky_attested"] is True and preparation["native_sky_contract_passed"] is True
    assert json.loads((folder / "restore/native-validation.json").read_text())["passed"] is True
    assert "requested=2 selected=2 executable=1" in (folder / "restore/native-validation/run.log").read_text()
    assert sha(folder / "failed-replay-proof.json") == preparation["failed_replay_proof_sha256"]
    assert json.loads((folder / "failed-replay-proof.json").read_text()) == failed_replay_proof()
    assert sha(folder / "old-skip-proof.json") == preparation["old_skip_proof_sha256"]
    old = json.loads((folder / "old-skip-proof.json").read_text())
    assert old["source"] == SOURCE and old["timed_records"] == 0 and len(old["proofs"]) == 4
    assert {item["pin"]["job"] for item in old["proofs"]} == {pin["job"] for pin in PINS}
    for item in old["proofs"]:
        pin = next(pin for pin in PINS if pin["job"] == item["pin"]["job"])
        assert item["pin"] == pin and item["run_id"] == pin["run"] and item["head"] == pin["head"]
        skipped_zip = folder / ("old-skips/" + pin["label"] + ".zip")
        assert "sha256:" + sha(skipped_zip) == pin["digest"]
        assert sha(skipped_zip) == item["downloaded_zip_sha256"]
        raw, skipped = skip_payload(pin, skipped_zip)
        assert skipped == item["receipt"]
        assert item["files_sha256"] == {name: hashlib.sha256(data).hexdigest() for name, data in raw.items()}
    pair = json.loads((folder / "restore/pair-receipt.json").read_text())
    assert sha(folder / "restore/pair-receipt.json") == preparation["pair_receipt_sha256"]
    assert pair["sources"] == {"original": BASE, "fork": SOURCE}
    assert pair["image_hashes"] == preparation["producer_image_hashes"]
    assert pair["source_trees"] == preparation["source_trees"]
    assert pair["source_trees"]["fork"] == frozen.check_sources(SOURCE, baseline=False)["fork"]
    assert pair["producer_run"] == str(RUN) and pair["producer_head"] == HEAD
    assert preparation["pair_artifact"] == {"id": PAIR_ID, "digest": PAIR_DIGEST}
    assert sha(folder / "container-provenance.json") == preparation["container_provenance_sha256"]
    container = json.loads((folder / "container-provenance.json").read_text())
    assert container["native_execution"] is True and container["source"] == SOURCE
    assert container["image_reference"] == "ubuntu@sha256:42527649dbc4f9197a6073f426f488cbff0e9cc9f2afce32d91c383e4875634a"
    assert len(container["actual_root_files_sha256"]) == 3 and container["host_runner_label"] == "ubuntu-24.04"
    abc.validate_inputs()
    abc_folder = folder / "abc"
    abc_text, abc_triplets = abc.projection("avx512")
    assert abc_triplets == complete["abc"]["triplets"] == preparation["abc_triplets"] == 6
    assert (abc_folder / "shard-cases.tsv").read_bytes() == abc_text.encode()
    assert sha(abc_folder / "experiment.log") == complete["abc"]["experiment_sha256"]
    assert sha(abc_folder / "periodic-receipt.json") == complete["abc"]["receipt_sha256"]
    abc_receipt = json.loads((abc_folder / "periodic-receipt.json").read_text())
    assert abc_receipt["producer_image_hashes"] == pair["image_hashes"]
    assert abc_receipt["source_trees"] == pair["source_trees"]
    assert abc_receipt["pair_receipt_sha256"] == preparation["pair_receipt_sha256"]
    assert abc_receipt["replay"] == replay and abc_receipt["runtime_unchanged"] is True
    assert abc_receipt["runner_sha256"] == preparation["abc_helper_sha256"] == abc.EXTRA_HELPER_SHA
    assert abc_receipt["periodic_manifest_sha256"] == preparation["abc_manifest_sha256"] == abc.PERIODIC_SHA
    assert abc_receipt["extra_benchmark_source_sha256"] == preparation["abc_application_sha256"] == abc.EXTRA_SOURCE_SHA
    assert preparation["abc_wrapper_sha256"] == abc_receipt["frozen_periodic_driver_sha256"] == ABC_WRAPPER_HASH
    assert json.loads((abc_folder / "periodic-complete.json").read_text()) == {
        "records": 18, "triplets": 6, "images_unchanged": True}
    diagnostics = json.loads((abc_folder / "reverse-character-c2-diagnostics.json").read_text())
    assert diagnostics["source"] == SOURCE and diagnostics["baseline"] == BASE
    assert diagnostics["backend"] == "avx512" and diagnostics["timing_evidence"] is False
    assert diagnostics["compiled_once_with"] == "original" and len(diagnostics["runs"]) == 6
    assert diagnostics["application_sha256"]["StringZillaCharInlining.java"] == abc.CHAR_SOURCE_SHA
    for path, digest in diagnostics["application_sha256"].items():
        assert sha(abc_folder / "reverse-character-c2-diagnostics" / path) == digest
    for run in diagnostics["runs"]:
        assert run["timing_evidence"] is False and run["tier"] == "c2"
        assert sha(abc_folder / run["path"]) == run["sha256"]
    entries = [{"kind": "abc", "backend": "avx512", "job": job, "source": SOURCE, "base": BASE,
        "manifest": abc_text, "log_path": str(abc_folder / "experiment.log"),
        "expected": {"manifest_sha256": sha(abc_folder / "shard-cases.tsv"),
            "runner_sha256": abc.EXTRA_HELPER_SHA, "producer_image_hashes": pair["image_hashes"],
            "extra_benchmark_source_sha256": abc.EXTRA_SOURCE_SHA}}]
    for tier in COUNTS:
        measured = folder / tier
        expected_folder = OUT / ("expected-" + tier)
        expected_folder.mkdir()
        manifest = project(pair, tier, expected_folder)
        assert (measured / "shard-cases.tsv").read_bytes() == manifest.encode()
        assert sha(measured / "experiment.log") == complete["completed_tiers"][tier]["experiment_sha256"]
        assert sha(measured / "runtime-attestation.json") == complete["completed_tiers"][tier]["runtime_attestation_sha256"]
        assert json.loads((measured / "runtime-attestation.json").read_text())["available"] is True
        assert json.loads((measured / "shard-receipt.json").read_text()) == json.loads(
            (expected_folder / "shard-receipt.json").read_text())
        entries.append({"kind": "primary", "backend": "avx512", "job": job, "source": SOURCE, "base": BASE,
            "manifest": manifest, "log_path": str(measured / "experiment.log"),
            "expected": {"manifest_sha256": sha(measured / "shard-cases.tsv"), "runner_sha256": HELPER_HASH,
                         "producer_image_hashes": {name: pair["image_hashes"][name]["tree_sha256"]
                                                  for name in ("original", "fork")}}})
    expected = [key for key in frozen.expected_keys()[0] if json.loads(key)[0] == "avx512" and
                json.loads(key)[1] in COUNTS]
    assert len(expected) == 249
    abc_expected = [key for key in abc.validate_inputs()[2] if json.loads(key)[0] == "avx512"]
    assert len(abc_expected) == 6 and not set(expected).intersection(abc_expected)
    expected += abc_expected
    assert len(expected) == complete["expected_triplets"] == 255 and complete["expected_records"] == 765
    write(OUT / "collection-input.json", {"entries": entries, "expected_physical_keys": expected,
          "counts": {"avx512": COUNTS}, "recovery": preparation})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("preflight", "prepare", "measure", "collection"))
    args = parser.parse_args()
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    OUT.mkdir(exist_ok=True)
    {"preflight": preflight, "prepare": prepare, "measure": measure, "collection": collection}[args.mode]()
