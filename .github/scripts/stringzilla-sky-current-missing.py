#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Recover exactly 77 untimed current-source SKY triplets from frozen complete images."""
import argparse
import base64
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

SOURCE = "e036e637a5aff1e2506ff82953a3fbd9fdba6a9d"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
RUN = 39145136082
HEAD = "f7003b74572a93b774ffb9fe79fcc35a3efcdcb0"
PAIR_ID = 12144279572
PAIR_DIGEST = "sha256:95f054971f775b13b52ece43e6c36297c9d89591713cff363fd8790b7c8a184d"
PRODUCER_JOB = 117733444034
IMAGE_HASHES = {"original": "be4c017b8a04e2a8c400ea3753a5a3816d0b354b8da6ca8b1952cee61e9442c9",
                "fork": "bc1eb0494e08b9ec068f0b19f68ce9cd60508aecc81c23f900faccf9f794aa4e"}
HELPER_HASH = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
MANIFEST_HASH = "8e616004ffc43ed6910c227d0c2bb847170a35e86292dcb41c72456435d4419f"
DRIVER_HASH = "2c67a3fc0e4ed04abdc6139b93550f5d71e133e8641f6aad01bdff8e0ee1cde4"
S54_DRIVER_HASH = "e0c4870246f111166d1a21a4e7c1a24459b095ecd9e1188a3bd5b3a2760d6a14"
COUNTS = {"interpreter": 30, "c2": 42}
PROJECTIONS = {
    ("interpreter", "stock"): (30, "7d43319d38647aac023a3ae6b9408f64f53a1b854342da0dbae16b6fcf4d25a0"),
    ("interpreter", "periodic"): (2, "58e26818a2a3d95ba2c4b37f80c52565ce8b759804cdb139701aada143f48099"),
    ("c2", "stock"): (42, "528b88541e444c8394c0ff72f052cc4bafc22c9db297883693fe18b7eb3cd264"),
    ("c2", "periodic"): (2, "fdbeb9bf5c434080f67b2d348c6bda82fc2bc4fbdac8af819de17d0d26aabd2d"),
    ("c2", "s54"): (1, "eed877de4ea926559aadd96c9f859ece003983c29582663f92598cde45b5b6d3")}
S54_RUN = 39152364859
S54_HEAD = "5eb741f73bc6cce9478793ba2101d719a40d3fc7"
PINS = [
    {"label": "pilot-interpreter", "run": RUN, "head": HEAD, "job": 117742226314,
     "artifact": 12145454627, "digest": "sha256:382007e8f8ae7253faebecb2a9470f7e4176301d08dbf7da6be2e825a3bbe438",
     "tier": "interpreter", "campaign": "pilot", "triplets": 32},
    {"label": "pilot-c2", "run": RUN, "head": HEAD, "job": 117742226277,
     "artifact": 12145813889, "digest": "sha256:2aafe6191ad321cb8f296aedd4cdb8322060e7d90464a152320f332ef151a3c9",
     "tier": "c2", "campaign": "pilot", "triplets": 44},
    {"label": "s54-c2", "run": S54_RUN, "head": S54_HEAD, "job": 117751315790,
     "artifact": 12146211256, "digest": "sha256:5bc8096d33a7adefc79a32ff3795b4cdab44b4eb23fbdc2243f32466c9a36efc",
     "tier": "c2", "campaign": "s54", "triplets": 1}]
READERS = [
    {"run": 39154305154, "head": "6e958fc9b97592f17aea464e5960b0f81cde6c22",
     "job": 117754226462, "blob": "ed49c12ac8b357a30631c6a33a9b52a12c05b37c"},
    {"run": 39155646645, "head": "f561bba36a4f202b1c01d5f0868c8337905c4839",
     "job": 117758202290, "blob": "ebf65270564127fcd0bfe91604460c117fdb7873"}]
ROOT = Path.cwd()
AUX = Path(__file__).resolve().parents[2]
OUT = ROOT / "perf-output"
RESTORE = OUT / "restore"
MEASURE_STEP = "Measure only missing current SKY interpreter and C2 projections plus S54 C2"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def module(path, name, digest):
    assert sha(path) == digest
    spec = importlib.util.spec_from_file_location(name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


frozen = module(ROOT / "pilot/.github/scripts/stringzilla-candidate-pilot.py", "frozen_pilot", DRIVER_HASH)
s54 = module(ROOT / "losses/.github/scripts/stringzilla-candidate-losses.py", "frozen_s54", S54_DRIVER_HASH)
s54.frozen = frozen


def context():
    assert os.environ["GITHUB_REPOSITORY"] == frozen.REPO
    return {"run_id": int(os.environ["GITHUB_RUN_ID"]), "head": os.environ["GITHUB_SHA"],
            "attempt": int(os.environ["GITHUB_RUN_ATTEMPT"])}


def jobs(run):
    data = frozen.api("actions/runs/" + str(run) + "/jobs?per_page=100&filter=all")
    assert data["total_count"] <= 100
    return data["jobs"]


def one_job(run, job_id, head):
    matches = [job for job in jobs(run) if job["id"] == job_id]
    assert len(matches) == 1
    job = matches[0]
    assert job["run_id"] == run and job["head_sha"] == head and job["run_attempt"] == 1
    return job


def step(job, name, conclusion):
    matches = [item for item in job["steps"] if item["name"] == name]
    assert len(matches) == 1 and matches[0]["status"] == "completed" and matches[0]["conclusion"] == conclusion


def election(folder, completed=False):
    path = AUX / ".github/scripts/stringzilla-sky-current-election.py"
    spec = importlib.util.spec_from_file_location("e036_allfour", path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result.verify_saved(folder, completed=completed)


def projected(tier, phase):
    assert (tier, phase) in PROJECTIONS and tier != "c1"
    if phase == "stock":
        cases, columns = frozen.rows()
        selected = [dict(row, backends="avx2", tiers=tier) for row in cases
                    if "avx2" in row["backends"].split(",") and tier in row["tiers"].split(",")]
        target = io.StringIO(newline="")
        writer = csv.DictWriter(target, fieldnames=columns, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(selected)
        text = target.getvalue()
    elif phase == "periodic":
        text = frozen.periodic_projection("avx512", tier)
    else:
        text, count = s54.projection("avx512", tier)
        assert count == 1
    rows = list(csv.DictReader(io.StringIO(text), delimiter="\t"))
    count, digest = PROJECTIONS[(tier, phase)]
    assert len(rows) == count and hashlib.sha256(text.encode()).hexdigest() == digest
    return text


def expected_keys():
    result = []
    for tier, phase in PROJECTIONS:
        for row in csv.DictReader(io.StringIO(projected(tier, phase)), delimiter="\t"):
            assert row["backends"] == "avx2" and row["tiers"] == tier
            result.append(frozen.physical("avx512", tier,
                "org.openjdk.bench.java.lang." + row["benchmark"], frozen.params(row)))
    assert len(result) == len(set(result)) == 77
    assert all(json.loads(key)[1] in COUNTS for key in result)
    return sorted(result)


def inputs(baseline=True):
    frozen.check_sources(SOURCE, baseline=baseline)
    assert sha(frozen.HELPER) == HELPER_HASH and sha(frozen.MANIFEST) == MANIFEST_HASH
    assert s54.SOURCE == SOURCE and s54.PILOT_HEAD == HEAD and s54.PILOT_RUN == RUN
    s54.matrix()
    for tier in COUNTS:
        assert frozen.utf16_probe_projection("avx512", tier)[1] == 0
    expected_keys()


@contextmanager
def producer_context():
    saved = {key: os.environ[key] for key in ("GITHUB_RUN_ID", "GITHUB_SHA")}
    os.environ.update(GITHUB_RUN_ID=str(RUN), GITHUB_SHA=HEAD)
    try:
        yield
    finally:
        os.environ.update(saved)


def args(tier):
    assert tier in COUNTS
    return argparse.Namespace(source=SOURCE, backend="avx512", tier=tier,
        artifact_id=str(PAIR_ID), artifact_digest=PAIR_DIGEST, original_hash=IMAGE_HASHES["original"],
        fork_hash=IMAGE_HASHES["fork"], helper_hash=HELPER_HASH, parent_manifest_hash=MANIFEST_HASH)


def zero_proofs():
    folder = OUT / "old-skips"
    folder.mkdir(exist_ok=True)
    independent = {}
    reader_bindings = []
    for pin in READERS:
        job = one_job(pin["run"], pin["job"], pin["head"])
        assert job["status"] == "completed" and job["conclusion"] == "success"
        payload = frozen.api("git/blobs/" + pin["blob"])
        assert payload["encoding"] == "base64" and payload["sha"] == pin["blob"]
        raw = base64.b64decode(payload["content"])
        assert hashlib.sha1(("blob " + str(len(raw)) + "\0").encode() + raw).hexdigest() == pin["blob"]
        saved = json.loads(raw)
        assert saved["schema"] == 1 and saved["reader"] == {key: pin[key] for key in ("run", "head", "job")}
        (folder / ("reader-" + str(pin["job"]) + ".json")).write_bytes(raw)
        for record in saved["records"]:
            artifact_id = record["binding"]["artifact"]
            assert artifact_id not in independent and record["new_timing_executions"] == 0
            independent[artifact_id] = record
        reader_bindings.append({**pin, "job_metadata": job, "sha256": hashlib.sha256(raw).hexdigest()})
    assert set(independent) == {pin["artifact"] for pin in PINS}
    proofs = []
    for pin in PINS:
        job = one_job(pin["run"], pin["job"], pin["head"])
        assert job["status"] == "completed" and job["conclusion"] == "success"
        if pin["campaign"] == "pilot":
            step(job, "Check physical CPU and compiled profile prerequisites", "success")
            for name in ("Restore complete pair and project the fixed manifest",
                         "Execute native AVX-512 contract on this physical host",
                         "Measure sequential original enabled and disabled triplets",
                         "Measure the separate external ABC fixture on the same complete images",
                         "Measure applicable external UTF-16 negative probe controls"):
                step(job, name, "skipped")
            expected_name = "stringzilla-candidate-pilot-results-avx512-" + pin["tier"] + "-" + pin["head"] + "-attempt1"
        else:
            step(job, "Check the actual backend before image downloads or timings", "success")
            for name in ("Restore only validated complete pilot images and attest runtime",
                         "Measure only the disjoint original enabled and disabled triplets"):
                step(job, name, "skipped")
            expected_name = "stringzilla-candidate-losses-avx512-c2-" + pin["head"] + "-attempt1"
        archive = folder / (pin["label"] + ".zip")
        artifact = frozen.download(pin["artifact"], pin["digest"], pin["run"], pin["head"], archive)
        assert artifact["name"] == expected_name
        with zipfile.ZipFile(archive) as bundle:
            assert len(bundle.namelist()) == 2 and set(bundle.namelist()) == {"SKIPPED.json", "physical-host.json"}
            raw = {name: bundle.read(name) for name in bundle.namelist()}
        saved = {name: json.loads(data) for name, data in raw.items()}
        receipt = saved["SKIPPED.json"]
        assert receipt == saved["physical-host.json"]
        assert receipt["source"] == SOURCE and receipt["backend"] == "avx512" and receipt["tier"] == pin["tier"]
        assert receipt["available"] is False and type(receipt["timed_records"]) is int and receipt["timed_records"] == 0
        flags = set(receipt["physical"]["fields"]["flags"].split())
        assert sorted({"avx512f", "avx512bw", "avx512vl"} - flags) == receipt["physical"]["missing"]
        record = independent[pin["artifact"]]
        assert record["binding"] == {"run": pin["run"], "head": pin["head"], "job": pin["job"],
            "artifact": pin["artifact"], "digest": pin["digest"].removeprefix("sha256:"), "name": expected_name}
        for name, data in raw.items():
            witness = record["saved"][name]
            assert witness["sha256"] == hashlib.sha256(data).hexdigest() and witness["bytes"] == len(data)
            assert witness["receipt"] == saved[name]
        proofs.append({"pin": pin, "job": job, "artifact": artifact, "receipt": receipt,
                       "files_sha256": {name: hashlib.sha256(data).hexdigest() for name, data in raw.items()}})
    qualified_c1 = one_job(RUN, 117742226206, HEAD)
    assert qualified_c1["status"] == "completed" and qualified_c1["conclusion"] == "success"
    step(qualified_c1, "Measure sequential original enabled and disabled triplets", "success")
    step(qualified_c1, "Measure the separate external ABC fixture on the same complete images", "success")
    result = {"source": SOURCE, "base": BASE, "proofs": proofs, "readers": reader_bindings,
              "missing_triplets": 77, "timed_records": 0, "qualified_c1_preserved": qualified_c1}
    write(OUT / "old-skip-proof.json", result)
    return result


def preflight():
    assert context()["attempt"] == 1, "No timed reruns"
    shutil.copytree(Path(os.environ["RUNNER_TEMP"]) / "stringzilla-sky-election", OUT / "election")
    write(OUT / "election-binding.json", election(OUT / "election"))
    inputs()
    proof = zero_proofs()
    assert sum(item["pin"]["triplets"] for item in proof["proofs"]) == 77
    image = os.environ["EXPECTED_CONTAINER_IMAGE"]
    assert image == "ubuntu@sha256:42527649dbc4f9197a6073f426f488cbff0e9cc9f2afce32d91c383e4875634a"
    roots = [Path("/etc/os-release"), Path("/var/lib/dpkg/status"), Path("/usr/lib/x86_64-linux-gnu/libc.so.6")]
    assert 'VERSION_ID="26.04"' in roots[0].read_text()
    write(OUT / "container-provenance.json", {"image": image, "native_execution": True,
        "source": SOURCE, "host_label": os.environ["SKY_HOST_LABEL"],
        "uname": frozen.command(["uname", "-a"]), "affinity": sorted(os.sched_getaffinity(0)),
        "packages": frozen.command(["dpkg-query", "-W", "base-files", "libc6", "libc6-dev", "gcc-16", "libasan8", "libubsan1", "git", "python3"]),
        "files_sha256": {str(path): sha(path) for path in roots}})
    print("STRINGZILLA_CURRENT_MISSING_PREFLIGHT source=" + SOURCE + " zero_triplets=77", flush=True)


def prepare():
    inputs()
    binding = election(OUT / "election")
    producer = s54.producer("avx512")
    assert producer["job"]["id"] == PRODUCER_JOB
    assert producer["artifact"]["id"] == PAIR_ID and producer["artifact"]["digest"] == PAIR_DIGEST
    RESTORE.mkdir()
    frozen.OUT = RESTORE
    with producer_context():
        frozen.restore(args("interpreter"))
    pair = json.loads((RESTORE / "pair-receipt.json").read_text())
    assert {key: value["tree_sha256"] for key, value in pair["image_hashes"].items()} == IMAGE_HASHES
    assert pair["source_trees"] == frozen.check_sources(SOURCE)
    shutil.copy2(frozen.ARCHIVES / "pair-inventories.json", RESTORE / "pair-inventories.json")
    assert pair["spec"]["DEBUG_LEVEL"] == "release" and pair["spec"]["SOURCE_DATE"] == "1792195200"
    assert all(pair["spec"][key].startswith("16.") for key in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"))
    frozen.runtime_host(args("interpreter"))
    assert json.loads((RESTORE / "runtime-attestation.json").read_text())["available"] is True
    frozen.native()
    assert json.loads((RESTORE / "native-validation.json").read_text())["passed"] is True
    assert "requested=2 selected=2 executable=1" in (RESTORE / "native-validation/run.log").read_text()
    write(OUT / "preparation.json", {"schema": "stringzilla-current-sky-missing-v1",
        "source": SOURCE, "base": BASE, "replay": context(), "election": binding, "producer": producer,
        "pair_artifact": {"id": PAIR_ID, "digest": PAIR_DIGEST}, "pair_receipt_sha256": sha(RESTORE / "pair-receipt.json"),
        "image_hashes": pair["image_hashes"], "source_trees": pair["source_trees"],
        "old_skip_proof_sha256": sha(OUT / "old-skip-proof.json"),
        "container_provenance_sha256": sha(OUT / "container-provenance.json"),
        "helper_sha256": HELPER_HASH, "pilot_driver_sha256": DRIVER_HASH, "s54_driver_sha256": S54_DRIVER_HASH,
        "pilot_manifest_sha256": MANIFEST_HASH, "runtime_sky_attested": True, "native_sky_contract_passed": True,
        "triplets": 77, "records": 231, "timed_records_at_preparation": 0})


def stage(tier, phase, pair, folder):
    text = projected(tier, phase)
    for name in ("original", "fork"):
        shutil.copy2(RESTORE / (name + "-spec.gmk"), folder / (name + "-spec.gmk"))
    (folder / "shard-cases.tsv").write_bytes(text.encode())
    receipt = {"backend": "avx512", "tier": tier, "source": SOURCE,
        "manifest_sha256": hashlib.sha256(text.encode()).hexdigest(), "runner_sha256": HELPER_HASH,
        "parent_manifest_sha256": MANIFEST_HASH, "triplets": PROJECTIONS[(tier, phase)][0],
        "producer_image_hashes": pair["image_hashes"]}
    if phase == "s54":
        receipt.update(base=BASE, parent_manifest_sha256=s54.MANIFEST_HASH,
            producer=s54.producer("avx512"), pair_receipt_sha256=sha(RESTORE / "pair-receipt.json"))
    write(folder / "shard-receipt.json", receipt)
    return receipt


def measure():
    inputs()
    preparation = json.loads((OUT / "preparation.json").read_text())
    assert preparation["replay"] == context()
    pair = json.loads((RESTORE / "pair-receipt.json").read_text())
    assert sha(RESTORE / "pair-receipt.json") == preparation["pair_receipt_sha256"]
    completed = []
    for tier, phase in (("c2", "s54"), ("interpreter", "stock"), ("c2", "stock")):
        election(OUT / "election")
        folder = OUT / (phase + "-" + tier)
        folder.mkdir()
        stage(tier, phase, pair, folder)
        frozen.OUT = folder
        frozen.runtime_host(args(tier))
        assert json.loads((folder / "runtime-attestation.json").read_text())["available"] is True
        if phase == "s54":
            s54.OUT = folder
            s54.measure(args(tier))
        else:
            assert not (folder / "experiment.log").exists()
            frozen.measure(args(tier))
            election(OUT / "election")
            frozen.periodic(args(tier))
        completed.append({"folder": folder.name, "tier": tier, "phase": phase,
            "experiment_sha256": sha(folder / "experiment.log"), "receipt_sha256": sha(folder / "shard-receipt.json"),
            "runtime_sha256": sha(folder / "runtime-attestation.json"),
            **({"periodic_experiment_sha256": sha(folder / "periodic/experiment.log"),
                "periodic_receipt_sha256": sha(folder / "periodic/shard-receipt.json")} if phase == "stock" else {})})
    write(OUT / "complete.json", {"source": SOURCE, "replay": context(),
        "preparation_sha256": sha(OUT / "preparation.json"), "parts": completed, "triplets": 77, "records": 231})


def compilation_proofs(folder):
    cases = {
        "utf16-4096-64-end": {"length": "4096", "needleLength": "64", "coder": "UTF16", "position": "END"},
        "latin1-4096-4-end": {"length": "4096", "needleLength": "4", "coder": "LATIN1", "position": "END"},
        "utf16-127-4-end": {"length": "127", "needleLength": "4", "coder": "UTF16", "position": "END"}}
    result = {}
    for name, count in (("positive-search-diagnostics", 9), ("uniform-diagnostics", 6)):
        receipt = json.loads((folder / (name + ".json")).read_text())
        assert receipt["source"] == SOURCE and receipt["baseline"] == BASE
        assert receipt["backend"] == "avx512" and receipt["tier"] == "c2"
        assert receipt["timing_evidence"] is False and len(receipt["runs"]) == count
        for path, digest in receipt["harness_sha256"].items():
            assert sha(folder / path) == digest
        seen = set()
        for record in receipt["runs"]:
            control = record["control"]
            assert control in ("original", "enabled", "disabled")
            assert record["source"] == (BASE if control == "original" else SOURCE)
            assert record["tier"] == "c2" and record["timing_evidence"] is False
            if name == "positive-search-diagnostics":
                case = record["case"]
                assert case in cases and record["params"] == cases[case]
            else:
                case = record["params"]["length"]
                assert case in ("129", "130")
                assert record["params"] == {"length": case, "needleLength": "129", "shape": "UTF16_UNIFORM_END"}
            assert (control, case) not in seen
            seen.add((control, case))
            assert record["path"] == name + "/" + control + "-" + case + ".log"
            assert sha(folder / record["path"]) == record["sha256"] and record["returncode"] == 0
        assert len(seen) == count
        result[name] = receipt
    return result


def collection():
    inputs(baseline=False)
    data = frozen.api("actions/runs/" + str(context()["run_id"]) + "/artifacts?per_page=100")
    assert data["total_count"] <= 100
    matches = [item for item in data["artifacts"] if item["name"] ==
        "stringzilla-sky-current-missing-" + context()["head"] + "-attempt1" and not item["expired"]]
    assert len(matches) == 1
    artifact = matches[0]
    archive = OUT / "results.zip"
    frozen.download(artifact["id"], artifact["digest"], context()["run_id"], context()["head"], archive)
    folder = OUT / "collected"
    with zipfile.ZipFile(archive) as bundle:
        names = bundle.namelist()
        assert len(names) == len(set(names))
        assert all(not name.startswith("/") and ".." not in name.split("/") for name in names)
        for name in names:
            if name.endswith("/"):
                continue
            target = folder / name
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(bundle.read(name))
    archive.unlink()
    preparation = json.loads((folder / "preparation.json").read_text())
    complete = json.loads((folder / "complete.json").read_text())
    assert preparation["source"] == complete["source"] == SOURCE and preparation["base"] == BASE
    assert preparation["replay"] == complete["replay"] == context()
    assert complete["preparation_sha256"] == sha(folder / "preparation.json")
    assert preparation["triplets"] == complete["triplets"] == 77 and preparation["records"] == complete["records"] == 231
    assert preparation["helper_sha256"] == HELPER_HASH and preparation["pilot_driver_sha256"] == DRIVER_HASH
    assert preparation["s54_driver_sha256"] == S54_DRIVER_HASH and preparation["pilot_manifest_sha256"] == MANIFEST_HASH
    binding = election(folder / "election", completed=True)
    assert binding == preparation["election"] == json.loads((folder / "election-binding.json").read_text())
    job = one_job(context()["run_id"], binding["job_id"], context()["head"])
    assert job["status"] == "completed" and job["conclusion"] == "success"
    step(job, MEASURE_STEP, "success")
    assert sha(folder / "old-skip-proof.json") == preparation["old_skip_proof_sha256"]
    assert json.loads((folder / "old-skip-proof.json").read_text()) == zero_proofs()
    assert sha(folder / "container-provenance.json") == preparation["container_provenance_sha256"]
    assert preparation["runtime_sky_attested"] is True and preparation["native_sky_contract_passed"] is True
    assert json.loads((folder / "restore/native-validation.json").read_text())["passed"] is True
    assert "requested=2 selected=2 executable=1" in (folder / "restore/native-validation/run.log").read_text()
    pair = json.loads((folder / "restore/pair-receipt.json").read_text())
    assert sha(folder / "restore/pair-receipt.json") == preparation["pair_receipt_sha256"]
    assert pair["sources"] == {"original": BASE, "fork": SOURCE}
    assert pair["producer_run"] == str(RUN) and pair["producer_head"] == HEAD
    assert pair["image_hashes"] == preparation["image_hashes"]
    assert {key: value["tree_sha256"] for key, value in pair["image_hashes"].items()} == IMAGE_HASHES
    assert pair["source_trees"] == preparation["source_trees"] == frozen.check_sources(SOURCE)
    producer = s54.producer("avx512")
    assert producer["job"]["id"] == preparation["producer"]["job"]["id"] == PRODUCER_JOB
    assert producer["artifact"]["id"] == PAIR_ID and producer["artifact"]["digest"] == PAIR_DIGEST
    assert preparation["pair_artifact"] == {"id": PAIR_ID, "digest": PAIR_DIGEST}
    entries = []
    diagnostics = compilation_proofs(folder / "stock-c2")
    assert len(complete["parts"]) == 3
    assert {(item["tier"], item["phase"]) for item in complete["parts"]} == {("interpreter", "stock"), ("c2", "stock"), ("c2", "s54")}
    for part in complete["parts"]:
        tier, phase = part["tier"], part["phase"]
        assert part["folder"] == phase + "-" + tier
        measured = folder / part["folder"]
        receipt = json.loads((measured / "shard-receipt.json").read_text())
        text = projected(tier, phase)
        assert (measured / "shard-cases.tsv").read_bytes() == text.encode()
        assert sha(measured / "experiment.log") == part["experiment_sha256"]
        assert sha(measured / "shard-receipt.json") == part["receipt_sha256"]
        assert sha(measured / "runtime-attestation.json") == part["runtime_sha256"]
        assert json.loads((measured / "runtime-attestation.json").read_text())["available"] is True
        assert receipt["source"] == SOURCE and receipt["backend"] == "avx512" and receipt["tier"] == tier
        assert receipt["triplets"] == PROJECTIONS[(tier, phase)][0]
        assert receipt["manifest_sha256"] == hashlib.sha256(text.encode()).hexdigest()
        assert receipt["runner_sha256"] == HELPER_HASH and receipt["producer_image_hashes"] == pair["image_hashes"]
        assert receipt["parent_manifest_sha256"] == (s54.MANIFEST_HASH if phase == "s54" else MANIFEST_HASH)
        if phase == "s54":
            assert receipt["pair_receipt_sha256"] == preparation["pair_receipt_sha256"]
            assert receipt["producer"]["job"]["id"] == PRODUCER_JOB
            assert receipt["producer"]["artifact"]["id"] == PAIR_ID and receipt["producer"]["artifact"]["digest"] == PAIR_DIGEST
        entries.append({"kind": "stock", "backend": "avx512", "job": job, "source": SOURCE, "base": BASE,
            "manifest": text, "log_path": str(measured / "experiment.log"),
            "expected": {"manifest_sha256": hashlib.sha256(text.encode()).hexdigest(),
                         "runner_sha256": HELPER_HASH, "producer_image_hashes": IMAGE_HASHES}})
        if phase == "stock":
            periodic = measured / "periodic"
            text = projected(tier, "periodic")
            assert (periodic / "shard-cases.tsv").read_bytes() == text.encode()
            assert sha(periodic / "experiment.log") == part["periodic_experiment_sha256"]
            assert sha(periodic / "shard-receipt.json") == part["periodic_receipt_sha256"]
            receipt = json.loads((periodic / "shard-receipt.json").read_text())
            assert receipt == {"source": SOURCE, "backend": "avx512", "tier": tier, "triplets": 2,
                "manifest_sha256": hashlib.sha256(text.encode()).hexdigest(),
                "parent_manifest_sha256": frozen.PERIODIC_MANIFEST_SHA256, "runner_sha256": frozen.PERIODIC_HELPER_SHA256,
                "extra_benchmark_source_sha256": frozen.PERIODIC_SOURCE_SHA256, "producer_image_hashes": pair["image_hashes"]}
            entries.append({"kind": "abc", "backend": "avx512", "job": job, "source": SOURCE, "base": BASE,
                "manifest": text, "log_path": str(periodic / "experiment.log"),
                "expected": {key: receipt[key] for key in ("manifest_sha256", "runner_sha256",
                    "extra_benchmark_source_sha256", "producer_image_hashes")}})
    assert len(entries) == 5
    write(OUT / "collection-input.json", {"entries": entries, "expected_physical_keys": expected_keys(),
          "recovery": preparation, "compilation_proofs": diagnostics})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("preflight", "prepare", "measure", "collection"))
    selected = parser.parse_args().mode
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    OUT.mkdir(exist_ok=True)
    {"preflight": preflight, "prepare": prepare, "measure": measure, "collection": collection}[selected]()
