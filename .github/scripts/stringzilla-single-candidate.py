#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Measure disjoint controls using verified final complete images."""
import argparse
from contextlib import contextmanager
import csv
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import zipfile
from types import SimpleNamespace

ROOT = Path.cwd()
AUX = Path(__file__).resolve().parents[2]
PRODUCER = ROOT / "producer"
SOURCE = "4592230b14fc2f4b537b162fd7f6b791e882b615"
RUN = 39121850979
HEAD = "8dbbc5a78e113630a5f6e9fa15be19cddd8bc3b3"
HELPER_SHA = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
MAIN_SHA = "9272cdc6717737bede09521cb304d20b92a5aef52b5b8b1b5fa501fb98133ef6"
SUPPLEMENT_SHA = "c91795fcaa4712617ca72ad1303f838ed5833a7aa42d5bc37584fbb2bfd6f133"
DRIVER_SHA = "2f4dd375b33250dc0a322ce8b142def923eb06a721e386254cf872378310b8d5"
SUPPLEMENT = AUX / ".github/scripts/stringzilla-single-candidate-cases.tsv"
DRIVER = PRODUCER / ".github/scripts/stringzilla-sharded.py"

assert hashlib.sha256(DRIVER.read_bytes()).hexdigest() == DRIVER_SHA
spec = importlib.util.spec_from_file_location("sharded", DRIVER)
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


@contextmanager
def producer_environment():
    previous = {name: os.environ[name] for name in ("GITHUB_RUN_ID", "GITHUB_SHA")}
    os.environ.update(GITHUB_RUN_ID=str(RUN), GITHUB_SHA=HEAD)
    try:
        yield
    finally:
        os.environ.update(previous)


def validate_inputs():
    module.check_sources(SOURCE)
    assert module.sha(module.HELPER) == HELPER_SHA
    assert module.sha(module.MANIFEST) == MAIN_SHA
    assert module.sha(SUPPLEMENT) == SUPPLEMENT_SHA
    with SUPPLEMENT.open(newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        rows, fields = list(reader), reader.fieldnames
    assert fields == module.rows()[1] and len(rows) == 5
    assert len({row["id"] for row in rows}) == 5
    primary, _ = module.expected_keys()
    primary = set(primary)
    expected, counts = set(), {}
    for backend in module.BACKENDS:
        alias = "avx2" if backend == "avx512" else backend
        counts[backend] = 0
        for row in rows:
            if alias not in row["backends"].split(","):
                continue
            for tier in row["tiers"].split(","):
                assert tier in module.TIERS
                key = module.physical(backend, tier, "org.openjdk.bench.java.lang." + row["benchmark"],
                                      module.params(row))
                assert key not in expected and key not in primary
                expected.add(key)
                counts[backend] += 1
    assert len(expected) == 35 and counts == {"serial": 9, "avx2": 3, "neon": 11, "msvc": 9, "avx512": 3}
    return rows, fields, sorted(expected)


def projection(backend):
    rows, fields, _ = validate_inputs()
    alias = "avx2" if backend == "avx512" else backend
    selected = [dict(row, backends=alias) for row in rows if alias in row["backends"].split(",")]
    stream = io.StringIO(newline="")
    writer = csv.DictWriter(stream, fieldnames=fields, delimiter="\t", lineterminator="\n")
    writer.writeheader()
    writer.writerows(selected)
    return stream.getvalue(), sum(len(row["tiers"].split(",")) for row in selected)


def producer_artifact(backend):
    producer = "avx2" if backend == "avx512" else backend
    run = module.api("actions/runs/" + str(RUN))
    assert run["head_sha"] == HEAD
    jobs = module.api("actions/runs/" + str(RUN) + "/jobs?per_page=100&filter=latest")["jobs"]
    name = producer + " validated pair"
    jobs = [job for job in jobs if job["name"] == name or job["name"].endswith("/ " + name)]
    assert len(jobs) == 1 and jobs[0]["conclusion"] == "success", "Wait for the validated producer: " + name
    artifacts = module.api("actions/runs/" + str(RUN) + "/artifacts?per_page=100")["artifacts"]
    name = "stringzilla-sharded-pair-" + producer + "-" + HEAD
    matches = [artifact for artifact in artifacts if artifact["name"] == name and not artifact["expired"]]
    assert len(matches) == 1, name
    return jobs[0], matches[0]


def physical(args):
    validate_inputs()
    args.tier = "all"
    module.physical_host(args)


def prepare(args):
    validate_inputs()
    job, artifact = producer_artifact(args.backend)
    archive = ROOT / "candidate-pair.zip"
    with producer_environment():
        metadata = module.download(artifact["id"], artifact["digest"], RUN, HEAD, archive)
    with zipfile.ZipFile(archive) as bundle:
        pair_bytes = bundle.read("pair-receipt.json")
    pair = json.loads(pair_bytes)
    assert pair["sources"] == {"original": module.BASE, "fork": SOURCE}
    assert pair["producer_run"] == str(RUN) and pair["producer_head"] == HEAD
    args.artifact_id, args.artifact_digest = artifact["id"], artifact["digest"]
    args.original_hash = pair["image_hashes"]["original"]["tree_sha256"]
    args.fork_hash = pair["image_hashes"]["fork"]["tree_sha256"]
    args.helper_hash, args.parent_manifest_hash = HELPER_SHA, MAIN_SHA
    args.tier = "interpreter"
    download = module.download

    def verified_archive(artifact_id, digest, run_id, head, destination):
        assert (artifact_id, digest, run_id, head, destination) == (artifact["id"], artifact["digest"], str(RUN), HEAD, archive)
        expected = digest.removeprefix("sha256:")
        assert module.sha(archive) == expected
        return metadata

    # Reuse the already digest-verified ZIP for restore; no second large download.
    module.download = verified_archive
    try:
        with producer_environment():
            module.restore(args)
    finally:
        module.download = download
    shutil.copy2(module.OUT / "shard-cases.tsv", module.OUT / "primary-projection.tsv")
    text, triplets = projection(args.backend)
    manifest = module.OUT / "shard-cases.tsv"
    manifest.write_bytes(text.encode())
    receipt = {"source": SOURCE, "baseline": module.BASE, "backend": args.backend,
               "producer_run": RUN, "producer_head": HEAD, "producer_job": job, "artifact": metadata,
               "pair_receipt_sha256": hashlib.sha256(pair_bytes).hexdigest(),
               "producer_image_hashes": pair["image_hashes"], "parent_manifest_sha256": MAIN_SHA,
               "supplement_manifest_sha256": SUPPLEMENT_SHA, "manifest_sha256": module.sha(manifest),
               "runner_sha256": HELPER_SHA, "aux_driver_sha256": module.sha(Path(__file__)),
               "triplets": triplets, "controls": ["original", "enabled", "disabled"],
               "runtime_unchanged": True, "extra_uniform_diagnostics": False}
    module.write("supplement-receipt.json", receipt)
    observations = {}
    for tier in module.TIERS:
        args.tier = tier
        module.runtime_host(args)
        observations[tier] = json.loads((module.OUT / "runtime-attestation.json").read_text())
        shutil.copy2(module.OUT / "runtime-attestation.json", module.OUT / ("runtime-" + tier + ".json"))
        (module.OUT / "runtime-probe").rename(module.OUT / ("runtime-probe-" + tier))
    available = all(value["available"] for value in observations.values())
    module.write("supplement-runtime.json", {"available": available, "observations": observations})
    if not available:
        module.write("SKIPPED.json", {"available": False, "timed_records": 0, "backend": args.backend,
                                     "source": SOURCE, "observations": observations})
    module.output("available", str(available).lower())
    print("STRINGZILLA_SUPPLEMENT_RECEIPT " + json.dumps(receipt, separators=(",", ":")), flush=True)


def measure(args):
    validate_inputs()
    assert not (module.OUT / "SKIPPED.json").exists()
    assert json.loads((module.OUT / "supplement-runtime.json").read_text())["available"]
    receipt = json.loads((module.OUT / "supplement-receipt.json").read_text())
    assert module.sha(module.OUT / "shard-cases.tsv") == receipt["manifest_sha256"]
    assert not (module.OUT / "experiment.log").exists()
    for name in ("original", "fork"):
        assert module.helper().image((module.IMAGES / name).resolve())["tree_sha256"] == receipt["producer_image_hashes"][name]["tree_sha256"]
    values = [sys.executable, module.HELPER, "--original", module.IMAGES / "original", "--fork", module.IMAGES / "fork",
              "--original-source", ROOT / "baseline", "--fork-source", ROOT, "--output", module.OUT,
              "--backend", args.backend, "--manifest", module.OUT / "shard-cases.tsv"]
    # The helper, its two-fork protocol and its 57 non-timing diagnostics are unchanged.
    with (module.OUT / "experiment.log").open("w") as log:
        child = subprocess.Popen([str(value) for value in values], text=True, stdout=subprocess.PIPE,
                                 stderr=subprocess.STDOUT, bufsize=1)
        for line in child.stdout:
            log.write(line)
            print(line, end="", flush=True)
        assert child.wait() == 0, "Retain partial raw evidence from failed supplemental measurement"
    for name in ("original", "fork"):
        assert module.helper().image((module.IMAGES / name).resolve())["tree_sha256"] == receipt["producer_image_hashes"][name]["tree_sha256"]
    assert module.sha(module.OUT / "shard-cases.tsv") == receipt["manifest_sha256"]
    validate_inputs()
    module.write("supplement-complete.json", {"records": receipt["triplets"] * 3,
                                             "triplets": receipt["triplets"], "images_unchanged": True})


def collection(args):
    _, _, expected = validate_inputs()
    current_run, current_head = os.environ["GITHUB_RUN_ID"], os.environ["GITHUB_SHA"]
    artifacts = module.api("actions/runs/" + current_run + "/artifacts?per_page=100")["artifacts"]
    jobs = module.api("actions/runs/" + current_run + "/jobs?per_page=100&filter=all")["jobs"]
    entries = []
    for backend in module.BACKENDS:
        prefix = "stringzilla-single-candidate-" + backend + "-" + current_head + "-attempt"
        matches = [artifact for artifact in artifacts if artifact["name"].startswith(prefix)]
        assert 1 <= len(matches) <= 2, "At most one unsupported-host retry is allowed"
        label = backend + " reused controls"
        selected = [job for job in jobs if job["name"] == label or job["name"].endswith("/ " + label)]
        assert selected
        latest = max(job["run_attempt"] for job in selected)
        selected = [job for job in selected if job["run_attempt"] == latest]
        assert len(selected) == 1 and selected[0]["conclusion"] == "success"
        timed, skipped = [], []
        for artifact in matches:
            attempt = artifact["name"][len(prefix):]
            assert re.fullmatch(r"[1-9][0-9]*", attempt)
            folder = module.OUT / (backend + "-attempt" + attempt)
            archive = module.OUT / (backend + "-attempt" + attempt + ".zip")
            module.download(artifact["id"], artifact["digest"], current_run, current_head, archive)
            with zipfile.ZipFile(archive) as bundle:
                names = set(bundle.namelist())
                if "experiment.log" in names:
                    module.unpack_files(archive, ["experiment.log", "shard-cases.tsv", "supplement-receipt.json",
                                                  "supplement-complete.json"], folder)
                    timed.append((int(attempt), folder))
                else:
                    assert "SKIPPED.json" in names
                    module.unpack_files(archive, ["SKIPPED.json"], folder)
                    value = json.loads((folder / "SKIPPED.json").read_text())
                    assert value["available"] is False and value["timed_records"] == 0
                    skipped.append(int(attempt))
            archive.unlink()
        assert len(timed) == 1 and timed[0][0] == latest
        assert all(attempt < latest for attempt in skipped)
        folder = timed[0][1]
        text, triplets = projection(backend)
        assert (folder / "shard-cases.tsv").read_bytes() == text.encode()
        receipt = json.loads((folder / "supplement-receipt.json").read_text())
        job, artifact = producer_artifact(backend)
        assert receipt["producer_run"] == RUN and receipt["producer_head"] == HEAD
        assert receipt["producer_job"]["id"] == job["id"] and receipt["artifact"]["id"] == artifact["id"]
        assert receipt["artifact"]["digest"] == artifact["digest"]
        assert receipt["source"] == SOURCE and receipt["baseline"] == module.BASE
        assert receipt["parent_manifest_sha256"] == MAIN_SHA and receipt["supplement_manifest_sha256"] == SUPPLEMENT_SHA
        assert receipt["runner_sha256"] == HELPER_SHA and receipt["triplets"] == triplets
        complete = json.loads((folder / "supplement-complete.json").read_text())
        assert complete == {"records": triplets * 3, "triplets": triplets, "images_unchanged": True}
        entries.append({"backend": backend, "job": selected[0], "source": SOURCE, "base": module.BASE,
                        "manifest": text, "log_path": str(folder / "experiment.log"),
                        "expected": {"manifest_sha256": hashlib.sha256(text.encode()).hexdigest(),
                                     "runner_sha256": HELPER_SHA, "producer_image_hashes": receipt["producer_image_hashes"]}})
    module.write("collection-input.json", {"entries": entries, "expected_physical_keys": expected})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("physical", "prepare", "measure", "collection"))
    parser.add_argument("--backend", choices=tuple(module.BACKENDS))
    args = parser.parse_args()
    args.source = SOURCE
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    module.OUT.mkdir(exist_ok=True)
    {"physical": physical, "prepare": prepare, "measure": measure, "collection": collection}[args.mode](args)
