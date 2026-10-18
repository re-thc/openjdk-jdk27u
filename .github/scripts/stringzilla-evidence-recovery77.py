#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Read-only receipt adapter for the three groups in one current SKY recovery ZIP.

validate_recovery77(bundle, pin, archive_info) receives the reader case as pin,
and {"artifact": actual_API_artifact, "job": actual_API_job} as archive_info.
The caller authenticates those API objects using its existing identity function.
Real artifact_id/digest must be filled after upload; empty placeholders fail.
Returned zip_root/physical_output_suffix values preserve original ZIP paths and
diagnostic command classpaths. No ZIP entry, runtime image or class is rewritten.
"""
import hashlib
import io
import json
import re
import zipfile

SOURCE = "e036e637a5aff1e2506ff82953a3fbd9fdba6a9d"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
REPLAY = {"run_id": 39156708874, "head": "7583b0ade72a6ee47fe66b5ed648f1ddea30a7f2", "attempt": 1}
WORKER = 117761327661
PILOT = {"run_id": 39145136082, "head": "f7003b74572a93b774ffb9fe79fcc35a3efcdcb0"}
PRODUCER = 117733444034
PAIR_ID = 12144279572
PAIR_DIGEST = "sha256:95f054971f775b13b52ece43e6c36297c9d89591713cff363fd8790b7c8a184d"
IMAGES = {"original": "be4c017b8a04e2a8c400ea3753a5a3816d0b354b8da6ca8b1952cee61e9442c9",
          "fork": "bc1eb0494e08b9ec068f0b19f68ce9cd60508aecc81c23f900faccf9f794aa4e"}
HELPER = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
EXTRA_HELPER = "74ed5c71dd487e08d0ef017ead2f59172acbca9a7edad9b51ad976e54e80e532"
DRIVER = "2c67a3fc0e4ed04abdc6139b93550f5d71e133e8641f6aad01bdff8e0ee1cde4"
S54_DRIVER = "e0c4870246f111166d1a21a4e7c1a24459b095ecd9e1188a3bd5b3a2760d6a14"
PARENTS = {"stock": "8e616004ffc43ed6910c227d0c2bb847170a35e86292dcb41c72456435d4419f",
           "periodic": "02e48d06c5d3fdec8fb897fdff26dc1e0b5231ad2001397cb0f08313048938c2",
           "supplement": "fc74f5d630a0d240150070c14e5686c75ea40677b2cefb484833bbbdad424ada"}
EXTRA_SOURCE = "fead0e50103b20ca4bb1f3eeb47a71b1fc79f52fd91d0c7bb9007a502f7de44b"
PROJECTIONS = {
    ("stock-interpreter", "stock"): (30, "7d43319d38647aac023a3ae6b9408f64f53a1b854342da0dbae16b6fcf4d25a0"),
    ("stock-interpreter", "periodic"): (2, "58e26818a2a3d95ba2c4b37f80c52565ce8b759804cdb139701aada143f48099"),
    ("stock-c2", "stock"): (42, "528b88541e444c8394c0ff72f052cc4bafc22c9db297883693fe18b7eb3cd264"),
    ("stock-c2", "periodic"): (2, "fdbeb9bf5c434080f67b2d348c6bda82fc2bc4fbdac8af819de17d0d26aabd2d"),
    ("s54-c2", "supplement"): (1, "eed877de4ea926559aadd96c9f859ece003983c29582663f92598cde45b5b6d3")}
ZERO = {
    "pilot-interpreter": (39145136082, PILOT["head"], 117742226314, 12145454627,
        "sha256:382007e8f8ae7253faebecb2a9470f7e4176301d08dbf7da6be2e825a3bbe438", "interpreter"),
    "pilot-c2": (39145136082, PILOT["head"], 117742226277, 12145813889,
        "sha256:2aafe6191ad321cb8f296aedd4cdb8322060e7d90464a152320f332ef151a3c9", "c2"),
    "s54-c2": (39152364859, "5eb741f73bc6cce9478793ba2101d719a40d3fc7", 117751315790, 12146211256,
        "sha256:5bc8096d33a7adefc79a32ff3795b4cdab44b4eb23fbdc2243f32466c9a36efc", "c2")}
READERS = {117754226462: "ed49c12ac8b357a30631c6a33a9b52a12c05b37c",
           117758202290: "ebf65270564127fcd0bfe91604460c117fdb7873"}
MEASURE_STEP = "Measure only missing current SKY interpreter and C2 projections plus S54 C2"


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def require_step(job, name, conclusion):
    rows = [row for row in job["steps"] if row["name"] == name]
    assert len(rows) == 1 and rows[0]["status"] == "completed" and rows[0]["conclusion"] == conclusion


def runtime(receipt, tier):
    assert receipt["source"] == SOURCE and receipt["backend"] == "avx512" and receipt["tier"] == tier
    assert receipt["available"] is True and type(receipt["timed_records"]) is int and receipt["timed_records"] == 0
    assert set(receipt["observations"]) == {"original", "enabled", "disabled"}
    for control, row in receipt["observations"].items():
        flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", "-XX:UseAVX=3"]
        flags += ["-Xint"] if tier == "interpreter" else ["-XX:-TieredCompilation"]
        expected = "3"
        if control != "original":
            enabled = control == "enabled"
            flags += ["-XX:" + ("+" if enabled else "-") + "UseStringZillaIntrinsics",
                      "--add-opens=java.base/java.lang=ALL-UNNAMED"]
            expected += ":2:" + str(enabled).lower()
        assert row["returncode"] == 0 and row["actual"] == row["expected"] == expected
        assert row["jvmArgs"] == flags


def validate_recovery77(bundle, pin, archive_info):
    """Validate one authenticated raw ZIP once; return all three explicit roots."""
    descriptor, metadata, job = pin["artifact"], archive_info["artifact"], archive_info["job"]
    assert pin["workflow"] == {key: REPLAY[key] for key in ("run_id", "head")}
    assert pin["backend"] == "avx512" and pin["image_hashes"] == IMAGES
    assert type(descriptor["artifact_id"]) is int and descriptor["artifact_id"] > 0
    assert re.fullmatch(r"sha256:[a-f0-9]{64}", descriptor["digest"])
    assert descriptor["job_id"] == WORKER and descriptor["attempt"] == 1
    assert metadata["id"] == descriptor["artifact_id"] and metadata["digest"] == descriptor["digest"]
    assert metadata["name"] == "stringzilla-sky-current-missing-" + REPLAY["head"] + "-attempt1"
    assert metadata["expired"] is False
    assert metadata["workflow_run"]["id"] == REPLAY["run_id"] and metadata["workflow_run"]["head_sha"] == REPLAY["head"]
    assert job["id"] == WORKER and job["run_id"] == REPLAY["run_id"] and job["head_sha"] == REPLAY["head"]
    assert job["run_attempt"] == 1 and job["status"] == "completed" and job["conclusion"] == "success"
    require_step(job, MEASURE_STEP, "success")
    stream, position = bundle.fp, bundle.fp.tell()
    stream.seek(0)
    hashed = hashlib.sha256()
    for block in iter(lambda: stream.read(1024 * 1024), b""):
        hashed.update(block)
    stream.seek(position)
    assert hashed.hexdigest() == descriptor["digest"].removeprefix("sha256:")
    names = bundle.namelist()
    assert len(names) == len(set(names)) and all(not name.startswith("/") and "\\" not in name
        and ".." not in name.split("/") for name in names)
    def raw(path):
        return bundle.read(path)
    def saved(path):
        return json.loads(raw(path))
    prep, complete = saved("preparation.json"), saved("complete.json")
    assert prep["schema"] == "stringzilla-current-sky-missing-v1"
    assert prep["source"] == complete["source"] == SOURCE and prep["base"] == BASE
    assert prep["replay"] == complete["replay"] == REPLAY
    assert complete["preparation_sha256"] == digest(raw("preparation.json"))
    assert prep["triplets"] == complete["triplets"] == 77 and prep["records"] == complete["records"] == 231
    assert type(prep["timed_records_at_preparation"]) is int and prep["timed_records_at_preparation"] == 0
    assert prep["helper_sha256"] == HELPER and prep["pilot_driver_sha256"] == DRIVER
    assert prep["s54_driver_sha256"] == S54_DRIVER and prep["pilot_manifest_sha256"] == PARENTS["stock"]
    assert prep["runtime_sky_attested"] is True and prep["native_sky_contract_passed"] is True
    election = saved("election-binding.json")
    assert election == prep["election"] and election["job_id"] == WORKER and election["job_name"] == job["name"]
    assert election["runner_id"] == job["runner_id"]
    if "election_algorithm_sha256" in pin:
        assert election["algorithm_sha256"] == pin["election_algorithm_sha256"]
    pair_raw = raw("restore/pair-receipt.json")
    pair = json.loads(pair_raw)
    assert digest(pair_raw) == prep["pair_receipt_sha256"]
    assert pair["sources"] == {"original": BASE, "fork": SOURCE} and pair["backend"] == "avx2"
    assert str(pair["producer_run"]) == str(PILOT["run_id"]) and pair["producer_head"] == PILOT["head"]
    assert pair["helper_sha256"] == HELPER and pair["parent_manifest_sha256"] == PARENTS["stock"]
    assert pair["image_hashes"] == prep["image_hashes"]
    assert {key: row["tree_sha256"] for key, row in pair["image_hashes"].items()} == IMAGES
    assert pair["source_trees"] == prep["source_trees"]
    if "source_trees" in pin:
        assert pair["source_trees"] == pin["source_trees"]
    assert pair["spec"]["SOURCE_DATE"] == "1792195200" and pair["spec"]["DEBUG_LEVEL"] == "release"
    assert all(pair["spec"][key].startswith("16.") for key in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"))
    assert prep["pair_artifact"] == {"id": PAIR_ID, "digest": PAIR_DIGEST}
    assert prep["producer"]["job"]["id"] == PRODUCER and prep["producer"]["job"]["conclusion"] == "success"
    assert prep["producer"]["artifact"]["id"] == PAIR_ID and prep["producer"]["artifact"]["digest"] == PAIR_DIGEST
    reused = saved("restore/artifact-reuse.json")
    assert reused["artifact"]["id"] == PAIR_ID and reused["artifact"]["digest"] == PAIR_DIGEST
    assert reused["downloaded_zip_sha256"] == PAIR_DIGEST.removeprefix("sha256:")
    assert reused["sources"] == pair["sources"] and reused["image_hashes"] == pair["image_hashes"]
    assert digest(raw("container-provenance.json")) == prep["container_provenance_sha256"]
    assert saved("restore/native-validation.json")["passed"] is True
    assert b"requested=2 selected=2 executable=1" in raw("restore/native-validation/run.log")
    runtime(saved("restore/runtime-attestation.json"), "interpreter")
    old = saved("old-skip-proof.json")
    assert digest(raw("old-skip-proof.json")) == prep["old_skip_proof_sha256"]
    assert old["source"] == SOURCE and old["base"] == BASE and old["missing_triplets"] == 77 and old["timed_records"] == 0
    assert len(old["proofs"]) == 3 and {item["pin"]["label"] for item in old["proofs"]} == set(ZERO)
    witnesses = {}
    assert len(old["readers"]) == 2 and {item["job"] for item in old["readers"]} == set(READERS)
    for reader in old["readers"]:
        blob = raw("old-skips/reader-" + str(reader["job"]) + ".json")
        git = hashlib.sha1(b"blob " + str(len(blob)).encode() + b"\0" + blob).hexdigest()
        assert git == reader["blob"] == READERS[reader["job"]] and digest(blob) == reader["sha256"]
        decoded = json.loads(blob)
        assert decoded["reader"] == {key: reader[key] for key in ("run", "head", "job")}
        for row in decoded["records"]:
            assert row["new_timing_executions"] == 0 and row["binding"]["artifact"] not in witnesses
            witnesses[row["binding"]["artifact"]] = row
    assert set(witnesses) == {row[3] for row in ZERO.values()}
    for proof in old["proofs"]:
        label, pin0 = proof["pin"]["label"], proof["pin"]
        run, head, job_id, artifact_id, artifact_digest, tier = ZERO[label]
        assert (pin0["run"], pin0["head"], pin0["job"], pin0["artifact"], pin0["digest"], pin0["tier"]) == ZERO[label]
        original_job = proof["job"]
        assert original_job["id"] == job_id and original_job["run_id"] == run and original_job["head_sha"] == head
        assert original_job["status"] == "completed" and original_job["conclusion"] == "success"
        skipped = ("Measure only the disjoint original enabled and disabled triplets",) if label == "s54-c2" else (
            "Measure sequential original enabled and disabled triplets",
            "Measure the separate external ABC fixture on the same complete images",
            "Measure applicable external UTF-16 negative probe controls")
        for step_name in skipped:
            require_step(original_job, step_name, "skipped")
        archive_raw = raw("old-skips/" + label + ".zip")
        assert digest(archive_raw) == artifact_digest.removeprefix("sha256:")
        with zipfile.ZipFile(io.BytesIO(archive_raw)) as original:
            assert len(original.namelist()) == 2 and set(original.namelist()) == {"SKIPPED.json", "physical-host.json"}
            files = {name: original.read(name) for name in original.namelist()}
        receipt = json.loads(files["SKIPPED.json"])
        assert receipt == json.loads(files["physical-host.json"]) == proof["receipt"]
        assert receipt["source"] == SOURCE and receipt["backend"] == "avx512" and receipt["tier"] == tier
        assert receipt["available"] is False and type(receipt["timed_records"]) is int and receipt["timed_records"] == 0
        flags = set(receipt["physical"]["fields"]["flags"].split())
        missing = sorted({"avx512f", "avx512bw", "avx512vl"} - flags)
        assert missing and missing == receipt["physical"]["missing"]
        witness = witnesses[artifact_id]
        assert witness["binding"]["run"] == run and witness["binding"]["head"] == head and witness["binding"]["job"] == job_id
        assert witness["binding"]["digest"] == artifact_digest.removeprefix("sha256:")
        for name, data in files.items():
            assert proof["files_sha256"][name] == digest(data)
            assert witness["saved"][name]["sha256"] == digest(data) and witness["saved"][name]["bytes"] == len(data)
            assert witness["saved"][name]["receipt"] == json.loads(data)
    c1 = old["qualified_c1_preserved"]
    assert c1["id"] == 117742226206 and c1["run_id"] == PILOT["run_id"] and c1["head_sha"] == PILOT["head"]
    assert c1["status"] == "completed" and c1["conclusion"] == "success"
    for step_name in ("Measure sequential original enabled and disabled triplets",
                      "Measure the separate external ABC fixture on the same complete images"):
        require_step(c1, step_name, "success")
    parts = complete["parts"]
    assert [(row["folder"], row["tier"], row["phase"]) for row in parts] == [
        ("s54-c2", "c2", "s54"), ("stock-interpreter", "interpreter", "stock"), ("stock-c2", "c2", "stock")]
    assert {name for name in names if name.endswith("experiment.log")} == {
        root + ("/periodic" if phase == "periodic" else "") + "/experiment.log" for root, phase in PROJECTIONS}
    groups = {}
    for part in parts:
        root, tier = part["folder"], part["tier"]
        runtime_raw = raw(root + "/runtime-attestation.json")
        assert digest(runtime_raw) == part["runtime_sha256"]
        runtime(json.loads(runtime_raw), tier)
        phases = []
        for (folder, phase), (count, projected_hash) in PROJECTIONS.items():
            if folder != root:
                continue
            prefix = root + ("/periodic/" if phase == "periodic" else "/")
            manifest_raw, receipt_raw = raw(prefix + "shard-cases.tsv"), raw(prefix + "shard-receipt.json")
            receipt = json.loads(receipt_raw)
            assert digest(manifest_raw) == projected_hash == receipt["manifest_sha256"]
            assert receipt["source"] == SOURCE and receipt["backend"] == "avx512" and receipt["tier"] == tier
            assert receipt["triplets"] == count and receipt["producer_image_hashes"] == pair["image_hashes"]
            assert receipt["runner_sha256"] == (EXTRA_HELPER if phase == "periodic" else HELPER)
            assert receipt["parent_manifest_sha256"] == PARENTS[phase]
            key = "periodic_" if phase == "periodic" else ""
            assert digest(receipt_raw) == part[key + "receipt_sha256"]
            assert digest(raw(prefix + "experiment.log")) == part[key + "experiment_sha256"]
            if phase == "periodic":
                assert receipt["extra_benchmark_source_sha256"] == EXTRA_SOURCE
            if phase == "supplement":
                assert receipt["pair_receipt_sha256"] == prep["pair_receipt_sha256"]
                assert receipt["producer"]["job"]["id"] == PRODUCER
                assert receipt["producer"]["artifact"]["id"] == PAIR_ID and receipt["producer"]["artifact"]["digest"] == PAIR_DIGEST
            phases.append({"phase": phase, "zip_prefix": prefix, "triplets": count,
                           "manifest_sha256": projected_hash, "runner_sha256": receipt["runner_sha256"],
                           "manifest_path": prefix + "shard-cases.tsv", "receipt_path": prefix + "shard-receipt.json",
                           "experiment_path": prefix + "experiment.log"})
        groups[root] = {"zip_root": root + "/", "physical_output_suffix": root, "tier": tier,
                        "pair_path": "restore/pair-receipt.json", "reuse_path": "restore/artifact-reuse.json",
                        "runtime_path": root + "/runtime-attestation.json", "receipt_path": root + "/shard-receipt.json",
                        "phases": phases}
    assert sum(phase["triplets"] for group in groups.values() for phase in group["phases"]) == 77
    if "zip_root" in pin:
        assert pin["zip_root"].rstrip("/") in groups and groups[pin["zip_root"].rstrip("/")]["tier"] == pin["tier"]
    return {"schema": "stringzilla-recovery77-reader-v1", "source": SOURCE, "baseline": BASE,
            "replay": REPLAY, "job_id": WORKER, "artifact_id": metadata["id"], "artifact_digest": metadata["digest"],
            "preparation_sha256": digest(raw("preparation.json")), "complete_sha256": digest(raw("complete.json")),
            "pair_receipt_sha256": prep["pair_receipt_sha256"], "image_hashes": IMAGES,
            "source_trees": pair["source_trees"], "old_skip_proof_sha256": prep["old_skip_proof_sha256"],
            "container_provenance_sha256": prep["container_provenance_sha256"],
            "qualified_c1_preserved_job_id": c1["id"], "new_timing_executions": 0, "groups": groups}
