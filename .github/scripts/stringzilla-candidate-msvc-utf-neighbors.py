#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Measure four previously unmeasured UTF-16 neighbors using validated complete MSVC images."""
import argparse
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

SOURCE = "e036e637a5aff1e2506ff82953a3fbd9fdba6a9d"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
PILOT_RUN = 39145136082
PILOT_HEAD = "f7003b74572a93b774ffb9fe79fcc35a3efcdcb0"
HELPER_HASH = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
PILOT_MANIFEST_HASH = "8e616004ffc43ed6910c227d0c2bb847170a35e86292dcb41c72456435d4419f"
MANIFEST_HASH = "7d611184420079f7b797abd6a4f91edfc7afc1e46e319e30bd9bd9998d983eda"
COVERED_HASH = "fc74f5d630a0d240150070c14e5686c75ea40677b2cefb484833bbbdad424ada"
PILOT_DRIVER_HASH = "2c67a3fc0e4ed04abdc6139b93550f5d71e133e8641f6aad01bdff8e0ee1cde4"
ROOT = Path.cwd()
AUX = Path(__file__).resolve().parents[2]
OUT = ROOT / "perf-output"
MANIFEST = AUX / ".github/scripts/stringzilla-candidate-msvc-utf-neighbors.tsv"
COVERED = AUX / ".github/scripts/stringzilla-candidate-msvc-utf-neighbors-covered.tsv"
DRIVER = ROOT / "pilot/.github/scripts/stringzilla-candidate-pilot.py"
assert hashlib.sha256(DRIVER.read_bytes()).hexdigest() == PILOT_DRIVER_HASH
spec = importlib.util.spec_from_file_location("pilot", DRIVER)
frozen = importlib.util.module_from_spec(spec)
spec.loader.exec_module(frozen)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def api(path):
    return frozen.api(path)


def matrix():
    frozen.check_sources(SOURCE, baseline=False)
    assert sha(frozen.HELPER) == HELPER_HASH and sha(frozen.MANIFEST) == PILOT_MANIFEST_HASH
    assert sha(MANIFEST) == MANIFEST_HASH and sha(COVERED) == COVERED_HASH
    with MANIFEST.open(newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        cases, columns = list(reader), reader.fieldnames
    assert columns == frozen.rows()[1] and len(cases) == 4
    assert len({row["id"] for row in cases}) == 4
    covered = set(frozen.expected_keys()[0])
    covered.update(frozen.expected_keys(frozen.periodic_rows()[0])[0])
    covered.update(frozen.expected_keys(frozen.utf16_probe_rows()[0])[0])
    assert len(covered) == 568
    with COVERED.open(newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        previous = list(reader)
        assert reader.fieldnames == columns and len(previous) == 54
    for row in previous:
        key = frozen.physical(row["backends"], row["tiers"],
            "org.openjdk.bench.java.lang." + row["benchmark"], frozen.params(row))
        assert key not in covered
        covered.add(key)
    assert len(covered) == 622
    expected = set()
    for row in cases:
        assert row["backends"] == "msvc" and row["tiers"] == "c2"
        assert row["benchmark"] == "StringZillaSearch.lastIndexOf"
        assert row["length"] == "4096" and row["coder"] == "UTF16" and row["shape"] == "-"
        assert (row["needleLength"], row["position"]) in {("128", "MISS"), ("129", "END"), ("130", "MISS"), ("130", "END")}
        key = frozen.physical("msvc", "c2", "org.openjdk.bench.java.lang." + row["benchmark"], frozen.params(row))
        assert key not in expected and key not in covered, "Refusing to repeat an existing physical input"
        expected.add(key)
    assert len(expected) == 4 and len(covered | expected) == 626
    return cases, columns, sorted(expected), {"msvc": {"c2": 4}}

def projection(backend, tier):
    cases, columns, _, _ = matrix()
    # Select the actual requested control before aliasing SKY for the frozen helper.
    selected = [dict(row, backends="avx2" if backend == "avx512" else backend, tiers=tier)
                for row in cases if row["backends"] == backend and row["tiers"] == tier]
    assert selected
    output = io.StringIO(newline="")
    writer = csv.DictWriter(output, fieldnames=columns, delimiter="\t", lineterminator="\n")
    writer.writeheader()
    writer.writerows(selected)
    return output.getvalue(), len(selected)


def producer(backend):
    backend = "avx2" if backend == "avx512" else backend
    run = api("actions/runs/" + str(PILOT_RUN))
    assert run["head_sha"] == PILOT_HEAD and run["run_attempt"] == 1
    jobs = api("actions/runs/" + str(PILOT_RUN) + "/jobs?per_page=100&filter=all")["jobs"]
    matches = [job for job in jobs if job["name"].endswith("/ " + backend + " validated pair")
               and job["run_attempt"] == 1]
    assert len(matches) == 1
    job = matches[0]
    assert job["status"] == "completed" and job["conclusion"] == "success", "Wait for validated " + backend + " producer"
    assert job["run_id"] == PILOT_RUN and job["head_sha"] == PILOT_HEAD
    steps = {step["name"]: step["conclusion"] for step in job["steps"]}
    for step in ("Verify and archive matched complete pair", "Publish complete images before tests",
                 "Run profiles, jtreg and native contract checks"):
        assert steps[step] == "success"
    name = "stringzilla-candidate-pilot-pair-" + backend + "-" + PILOT_HEAD
    artifacts = api("actions/runs/" + str(PILOT_RUN) + "/artifacts?per_page=100")["artifacts"]
    matches = [artifact for artifact in artifacts if artifact["name"] == name and not artifact["expired"]]
    assert len(matches) == 1
    artifact = matches[0]
    assert artifact["workflow_run"]["id"] == PILOT_RUN and artifact["workflow_run"]["head_sha"] == PILOT_HEAD
    assert re.fullmatch(r"sha256:[0-9a-f]{64}", artifact["digest"])
    return {"backend": backend, "job": job, "artifact": artifact}


def proof():
    _, _, expected, counts = matrix()
    producers = {name: producer(name) for name in ("serial", "avx2", "neon", "msvc")}
    receipt = {"source": SOURCE, "base": BASE, "pilot_run": PILOT_RUN, "pilot_head": PILOT_HEAD,
        "triplets": 4, "records": 12, "covered_triplets": 622, "combined_triplets": 626,
        "disjoint": True, "physical_keys": expected, "counts": counts, "producers": producers,
        "helper_sha256": HELPER_HASH, "manifest_sha256": MANIFEST_HASH}
    write(OUT / "supplement-proof.json", receipt)
    print("STRINGZILLA_SUPPLEMENT_PROOF " + json.dumps(receipt, separators=(",", ":")), flush=True)


def physical(args):
    matrix()
    frozen.OUT = OUT
    frozen.physical_host(argparse.Namespace(source=SOURCE, backend=args.backend, tier=args.tier))


def prepare(args):
    matrix()
    frozen.check_sources(SOURCE)
    binding = producer(args.backend)
    assert args.backend == "msvc" and args.tier == "c2"
    assert binding["job"]["id"] == 117733444153
    artifact = binding["artifact"]
    assert artifact["id"] == 12145286531 and artifact["digest"] == "sha256:b4a435c46b18ca0085172e85c334f628a0f40d93516017978eae4576ae11c51c"
    archive = ROOT / "validated-pair.zip"
    metadata = frozen.download(artifact["id"], artifact["digest"], PILOT_RUN, PILOT_HEAD, archive)
    assert metadata["name"] == artifact["name"]
    frozen.ARCHIVES.mkdir()
    frozen.IMAGES.mkdir()
    names = ["pair-receipt.json", "pair-inventories.json"] + [
        name + suffix for name in ("original", "fork")
        for suffix in ("-jdk.tar.gz", "-jdk.tar.gz.sha256", "-spec.gmk")]
    frozen.unpack_files(archive, names, frozen.ARCHIVES)
    pair = json.loads((frozen.ARCHIVES / "pair-receipt.json").read_text())
    inventories = json.loads((frozen.ARCHIVES / "pair-inventories.json").read_text())
    assert pair["sources"] == {"original": BASE, "fork": SOURCE}
    assert pair["backend"] == binding["backend"]
    assert pair["producer_run"] == str(PILOT_RUN) and pair["producer_head"] == PILOT_HEAD
    assert pair["helper_sha256"] == HELPER_HASH and pair["parent_manifest_sha256"] == PILOT_MANIFEST_HASH
    assert pair["source_trees"] == frozen.check_sources(SOURCE)
    frozen.OUT = OUT
    for name in ("original", "fork"):
        frozen.unpack_image(name)
        actual = frozen.helper().image((frozen.IMAGES / name).resolve())
        assert actual["tree_sha256"] == pair["image_hashes"][name]["tree_sha256"]
        assert actual["files"] == inventories[name]["files"]
        assert frozen.release(frozen.IMAGES / name, BASE if name == "original" else SOURCE) == pair["release"][name]
    specs = [frozen.helper().read_spec(OUT / (name + "-spec.gmk")) for name in ("original", "fork")]
    assert specs[0] == specs[1] == pair["spec"]
    assert specs[0]["DEBUG_LEVEL"] == "release" and specs[0]["SOURCE_DATE"] == "1792195200"
    for key in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"):
        assert re.match(r"19\.44\." if args.backend == "msvc" else r"16\.", specs[0][key])
    text, count = projection(args.backend, args.tier)
    (OUT / "shard-cases.tsv").write_bytes(text.encode())
    receipt = {"source": SOURCE, "base": BASE, "backend": args.backend, "tier": args.tier,
        "triplets": count, "manifest_sha256": hashlib.sha256(text.encode()).hexdigest(),
        "runner_sha256": HELPER_HASH, "parent_manifest_sha256": MANIFEST_HASH,
        "producer_image_hashes": pair["image_hashes"], "producer": binding,
        "pair_receipt_sha256": sha(frozen.ARCHIVES / "pair-receipt.json")}
    write(OUT / "shard-receipt.json", receipt)
    shutil.copy2(frozen.ARCHIVES / "pair-receipt.json", OUT / "pair-receipt.json")
    write(OUT / "pair-inventories.json", inventories)
    archive.unlink()
    frozen.runtime_host(argparse.Namespace(source=SOURCE, backend=args.backend, tier=args.tier))
    assert json.loads((OUT / "runtime-attestation.json").read_text())["available"] is True
    if args.backend == "avx512":
        frozen.native()
        assert "requested=2 selected=2 executable=1" in (OUT / "native-validation/run.log").read_text()


def measure(args):
    matrix()
    receipt = json.loads((OUT / "shard-receipt.json").read_text())
    text, count = projection(args.backend, args.tier)
    assert count == receipt["triplets"] and (OUT / "shard-cases.tsv").read_bytes() == text.encode()
    for name in ("original", "fork"):
        assert frozen.helper().image((frozen.IMAGES / name).resolve())["tree_sha256"] == receipt["producer_image_hashes"][name]["tree_sha256"]
    values = [sys.executable, frozen.HELPER, "--original", frozen.IMAGES / "original",
        "--fork", frozen.IMAGES / "fork", "--original-source", ROOT / "baseline",
        "--fork-source", ROOT, "--output", OUT, "--backend", args.backend, "--manifest", OUT / "shard-cases.tsv"]
    assert not (OUT / "experiment.log").exists()
    with (OUT / "experiment.log").open("w") as log:
        child = subprocess.Popen([str(value) for value in values], text=True, stdout=subprocess.PIPE,
                                 stderr=subprocess.STDOUT, bufsize=1)
        for line in child.stdout:
            log.write(line)
            print(line, end="", flush=True)
        assert child.wait() == 0, "Retain all partial supplement results"
    for name in ("original", "fork"):
        assert frozen.helper().image((frozen.IMAGES / name).resolve())["tree_sha256"] == receipt["producer_image_hashes"][name]["tree_sha256"]
    matrix()


def collection():
    _, _, expected, counts = matrix()
    run_id, head = os.environ["GITHUB_RUN_ID"], os.environ["GITHUB_SHA"]
    artifacts = api("actions/runs/" + run_id + "/artifacts?per_page=100")["artifacts"]
    jobs = api("actions/runs/" + run_id + "/jobs?per_page=100&filter=all")["jobs"]
    entries = []
    for backend, tiers in counts.items():
        binding = producer(backend)
        for tier in tiers:
            prefix = "stringzilla-candidate-msvc-utf-neighbors-" + backend + "-" + tier + "-" + head + "-attempt"
            matches = [artifact for artifact in artifacts if artifact["name"].startswith(prefix)]
            assert 1 <= len(matches) <= 2
            selected_jobs = [job for job in jobs if job["name"] == backend + "-" + tier + " UTF neighbors"]
            assert selected_jobs
            latest = max(job["run_attempt"] for job in selected_jobs)
            selected_jobs = [job for job in selected_jobs if job["run_attempt"] == latest]
            assert len(selected_jobs) == 1 and selected_jobs[0]["conclusion"] == "success"
            timed, skipped = [], []
            for artifact in matches:
                attempt = int(artifact["name"][len(prefix):])
                folder = OUT / (backend + "-" + tier + "-attempt" + str(attempt))
                archive = OUT / (folder.name + ".zip")
                frozen.download(artifact["id"], artifact["digest"], int(run_id), head, archive)
                with zipfile.ZipFile(archive) as bundle:
                    if "experiment.log" in bundle.namelist():
                        frozen.unpack_files(archive, ["experiment.log", "shard-cases.tsv", "shard-receipt.json",
                                                     "pair-receipt.json", "runtime-attestation.json"], folder)
                        timed.append((attempt, folder))
                    else:
                        frozen.unpack_files(archive, ["SKIPPED.json"], folder)
                        receipt = json.loads((folder / "SKIPPED.json").read_text())
                        assert receipt["available"] is False and receipt["timed_records"] == 0
                        skipped.append(attempt)
                archive.unlink()
            assert len(timed) == 1 and timed[0][0] == latest and all(attempt < latest for attempt in skipped)
            folder = timed[0][1]
            text, count = projection(backend, tier)
            assert (folder / "shard-cases.tsv").read_bytes() == text.encode()
            receipt = json.loads((folder / "shard-receipt.json").read_text())
            assert receipt["source"] == SOURCE and receipt["backend"] == backend and receipt["tier"] == tier
            assert receipt["triplets"] == count and receipt["parent_manifest_sha256"] == MANIFEST_HASH
            assert receipt["manifest_sha256"] == hashlib.sha256(text.encode()).hexdigest()
            assert receipt["runner_sha256"] == HELPER_HASH
            assert all(receipt["producer"]["artifact"][key] == binding["artifact"][key]
                       for key in ("id", "digest", "name"))
            assert receipt["producer"]["job"]["id"] == binding["job"]["id"]
            pair = json.loads((folder / "pair-receipt.json").read_text())
            assert sha(folder / "pair-receipt.json") == receipt["pair_receipt_sha256"]
            assert pair["sources"] == {"original": BASE, "fork": SOURCE}
            assert pair["producer_run"] == str(PILOT_RUN) and pair["producer_head"] == PILOT_HEAD
            assert receipt["producer_image_hashes"] == pair["image_hashes"]
            assert json.loads((folder / "runtime-attestation.json").read_text())["available"] is True
            entries.append({"backend": backend, "job": selected_jobs[0], "manifest": text,
                "source": SOURCE, "base": BASE, "log_path": str(folder / "experiment.log"),
                "expected": {"manifest_sha256": receipt["manifest_sha256"], "runner_sha256": HELPER_HASH,
                             "producer_image_hashes": receipt["producer_image_hashes"]}})
    write(OUT / "collection-input.json", {"entries": entries, "expected_physical_keys": expected, "counts": counts})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("proof", "physical", "prepare", "measure", "collection"))
    parser.add_argument("--backend", choices=tuple(frozen.BACKENDS))
    parser.add_argument("--tier", choices=tuple(frozen.TIERS))
    args = parser.parse_args()
    for key in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(key, None)
    OUT.mkdir(exist_ok=True)
    {"proof": proof, "physical": lambda: physical(args), "prepare": lambda: prepare(args),
     "measure": lambda: measure(args), "collection": collection}[args.mode]()
