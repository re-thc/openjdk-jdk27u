#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Export existing complete-image JMH evidence without running a compiler or JVM."""
import argparse
import base64
import csv
import gzip
import hashlib
import importlib.util
import io
import json
import math
import os
from pathlib import Path
import re
import subprocess
import zipfile

ROOT = Path(__file__).resolve().parent
OUT = Path("evidence-output")
SOURCE = "e036e637a5aff1e2506ff82953a3fbd9fdba6a9d"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
PILOT = {"run_id": 39145136082, "head": "f7003b74572a93b774ffb9fe79fcc35a3efcdcb0"}
SUPPLEMENT = {"run_id": 39152364859, "head": "5eb741f73bc6cce9478793ba2101d719a40d3fc7"}
RECOVERY = {"run_id": 39156708874, "head": "7583b0ade72a6ee47fe66b5ed648f1ddea30a7f2"}
NEIGHBORS = {"run_id": 39156969698, "head": "bedfa1d0a952fd088bb826995f95ae57a7b93287"}
HELPER = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
EXTRA_HELPER = "74ed5c71dd487e08d0ef017ead2f59172acbca9a7edad9b51ad976e54e80e532"
PARENTS = {"stock": "8e616004ffc43ed6910c227d0c2bb847170a35e86292dcb41c72456435d4419f",
           "supplement": "fc74f5d630a0d240150070c14e5686c75ea40677b2cefb484833bbbdad424ada",
           "neighbors": "7d611184420079f7b797abd6a4f91edfc7afc1e46e319e30bd9bd9998d983eda",
           "periodic": "02e48d06c5d3fdec8fb897fdff26dc1e0b5231ad2001397cb0f08313048938c2",
           "utf16-probe": "06dc833fa691489a1869628aa94715ab3b3ff4ba550b3b936d590c6dee4ef834"}
EXTRAS = {"periodic": ("StringZillaPeriodicSearch.java", "fead0e50103b20ca4bb1f3eeb47a71b1fc79f52fd91d0c7bb9007a502f7de44b"),
          "utf16-probe": ("StringZillaUTF16Probe.java", "1ac9e865b12f3ecf87bef52789ade1a0709ddec569a896c0d4796c5583d6f1f7")}
BACKENDS = {"serial": (0, "0"), "avx2": (1, "2"), "avx512": (2, "3"), "neon": (4, None), "msvc": (0, "2")}
TIERS = {"interpreter": ["-Xint"], "c1": ["-XX:TieredStopAtLevel=1"], "c2": ["-XX:-TieredCompilation"]}
EXTRACTOR_SHA = "4a926b93c3a01968314966c12622da5f58c99102a7c25a9b8b34abb359328c80"
PIN_FILE = ROOT / "stringzilla-evidence-reader-cases.json"
EXTRACTOR = ROOT / "stringzilla-raw-jmh.py"
RECOVERY_ADAPTER = ROOT / "stringzilla-evidence-recovery77.py"
RECOVERY_ADAPTER_SHA = "7aaec419735643f02d9d82ddc684a9cc5d0bf176e4707dc8515e8b0958f8ec9d"
ARCHIVE_CACHE = {}
RECOVERY_CACHE = {}


def sha(data):
    return hashlib.sha256(data).hexdigest()


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def api(path):
    return json.loads(subprocess.check_output(["gh", "api", "repos/re-thc/openjdk-jdk27u/" + path], text=True))


def output(kind, value):
    print("STRINGZILLA_EVIDENCE_" + kind + " " + canonical(value), flush=True)


def pins():
    document = json.loads(PIN_FILE.read_bytes())
    assert document["source"] == SOURCE and document["baseline"] == BASE
    cases = document["cases"]
    assert cases and len(cases) == 26, "Pin15 primary,10 disjoint supplement and1 neighbor logical groups"
    assert len({case["id"] for case in cases}) == len(cases)
    expected = set()
    counts = {}
    stock = {"serial": (30, 30, 50), "avx2": (30, 30, 42), "avx512": (30, 30, 42),
             "neon": (30, 31, 41), "msvc": (30, 35, 29)}
    extra_counts = {"serial-interpreter": 1, "serial-c1": 7, "serial-c2": 6,
                    "avx2-c1": 4, "avx2-c2": 3, "avx512-c2": 1,
                    "neon-interpreter": 1, "neon-c1": 14, "neon-c2": 10, "msvc-c2": 7}
    for case in cases:
        campaign, backend, tier = case["campaign"], case["backend"], case["tier"]
        assert campaign in ("pilot", "supplement", "neighbors") and backend in BACKENDS and tier in TIERS
        assert case["source"] == SOURCE and case["baseline"] == BASE
        origin = {"pilot": PILOT, "supplement": SUPPLEMENT, "neighbors": NEIGHBORS}[campaign]
        if case.get("recovery77"):
            assert backend == "avx512" and ((campaign == "pilot" and tier in ("interpreter", "c2"))
                                          or (campaign == "supplement" and tier == "c2"))
            assert case["workflow"] == RECOVERY and case["origin_workflow"] == origin
            assert case["zip_root"] == (("stock-" + tier + "/") if campaign == "pilot" else "s54-c2/")
        else:
            assert case["workflow"] == origin and not case.get("zip_root")
            assert not case.get("origin_workflow")
        assert case["producer"]["workflow"] == PILOT
        assert set(case["image_hashes"]) == {"original", "fork"}
        assert all(re.fullmatch(r"[0-9a-f]{64}", value) for value in case["image_hashes"].values())
        assert case["image_hashes"]["original"] != case["image_hashes"]["fork"]
        phase_counts = {}
        for phase in case["phases"]:
            name = phase["phase"]
            assert name in PARENTS and re.fullmatch(r"[0-9a-f]{64}", phase["manifest_sha256"])
            assert phase["triplets"] > 0 and len(phase["physical_keys"]) == phase["triplets"]
            assert name not in phase_counts
            assert (name == "supplement") == (campaign == "supplement")
            assert (name == "neighbors") == (campaign == "neighbors")
            for key in phase["physical_keys"]:
                assert key not in expected, "Duplicate timed physical input"
                expected.add(key)
            phase_counts[name] = phase["triplets"]
        assert case["id"] == campaign + "-" + backend + "-" + tier
        if case["id"] == "supplement-serial-c1":
            assert case["artifact"]["attempt"] == 2 and case["artifact"]["job_id"] == 117770722427
            prior = case["zero_timing_prior_attempt"]
            assert prior["job_id"] == 117751315857 and prior["artifact_id"] == 12146739652
            assert prior["proof_blob"] == "f866345d3bb295d5782aecec9ec5fa1bc3fda961"
            assert prior["artifact_digest"] == "sha256:0c36c86bdd01aa0be77ffdf68d3c3b2caf1c1096ff5015bea44f0f9f169d073a"
        if campaign == "pilot":
            expected_counts = {"stock": stock[backend][list(TIERS).index(tier)], "periodic": 2}
            if tier == "c2" and backend in ("serial", "neon", "msvc"):
                expected_counts["utf16-probe"] = 20 if backend == "serial" else 4
        elif campaign == "supplement":
            expected_counts = {"supplement": extra_counts[backend + "-" + tier]}
        else:
            assert backend == "msvc" and tier == "c2"
            expected_counts = {"neighbors": 4}
        assert phase_counts == expected_counts
        counts[case["id"]] = phase_counts
    assert len(expected) == 626
    assert sum(sum(values.values()) for values in counts.values()) == 626
    recovery = [case for case in cases if case.get("recovery77")]
    assert len(recovery) == 3 and sum(sum(counts[case["id"]].values()) for case in recovery) == 77
    assert len({case["artifact"]["artifact_id"] for case in recovery}) == 1
    assert len({case["artifact"]["artifact_id"] for case in cases}) == 24
    return cases, sorted(expected), counts


def identity(binding, workflow, expected_name=None):
    artifact = api("actions/artifacts/" + str(binding["artifact_id"]))
    assert artifact["id"] == binding["artifact_id"] and artifact["digest"] == binding["digest"]
    assert artifact["name"] == (expected_name or binding["artifact_name"]) and not artifact["expired"]
    assert artifact["workflow_run"]["id"] == workflow["run_id"]
    assert artifact["workflow_run"]["head_sha"] == workflow["head"]
    job = api("actions/jobs/" + str(binding["job_id"]))
    assert job["id"] == binding["job_id"] and job["run_id"] == workflow["run_id"]
    assert job["head_sha"] == workflow["head"] and job["name"] == binding["job_name"]
    assert job["status"] == "completed" and job["conclusion"] == "success"
    # Artifact names and original immutable job IDs identify the execution attempt.
    # A sibling rerun can change GitHub's reported run_attempt for an old job ID.
    snapshot = binding["job_snapshot"]
    assert snapshot["id"] == job["id"] and snapshot["head_sha"] == job["head_sha"]
    assert snapshot["run_id"] == job["run_id"] and snapshot["name"] == job["name"]
    assert snapshot["run_attempt"] == binding["attempt"] and snapshot["created_at"] == job["created_at"]
    assert job["run_attempt"] >= binding["attempt"]
    if snapshot["status"] == "completed":
        assert snapshot["conclusion"] == "success"
        assert snapshot["started_at"] == job["started_at"] and snapshot["completed_at"] == job["completed_at"]
    assert re.fullmatch(r"sha256:[0-9a-f]{64}", binding["digest"])
    return artifact, job


def archive(binding, workflow):
    key = (binding["artifact_id"], binding["digest"], canonical(workflow))
    if key in ARCHIVE_CACHE:
        saved_binding, saved_archive = ARCHIVE_CACHE[key]
        assert saved_binding == canonical(binding), "Conflicting logical-group binding for shared archive"
        return saved_archive
    metadata, job = identity(binding, workflow)
    raw = subprocess.check_output(["gh", "api", "repos/re-thc/openjdk-jdk27u/actions/artifacts/" +
                                   str(binding["artifact_id"]) + "/zip"])
    assert "sha256:" + sha(raw) == binding["digest"]
    bundle = zipfile.ZipFile(io.BytesIO(raw))
    assert len(bundle.namelist()) == len(set(bundle.namelist()))
    saved_archive = (bundle, metadata, job)
    ARCHIVE_CACHE[key] = (canonical(binding), saved_archive)
    return saved_archive


def objects(raw):
    result = {}
    for line in raw.decode("utf-8").splitlines():
        match = re.fullmatch(r"STRINGZILLA_(PROVENANCE|COMPLETE|RESULT|SUMMARY|COMPILATION|MSVC_BASELINE) (\{.*\})", line)
        if match:
            result.setdefault(match[1], []).append(json.loads(match[2]))
    assert len(result.get("PROVENANCE", [])) == len(result.get("COMPLETE", [])) == 1
    return result


def row_params(row):
    return ({"length": row["length"], "needleLength": row["needleLength"], "shape": row["shape"]}
            if row["shape"] != "-" else
            {"length": row["length"], "needleLength": row["needleLength"], "coder": row["coder"], "position": row["position"]})


def compact_job(job):
    return {key: job[key] for key in ("id", "run_id", "head_sha", "name", "run_attempt",
            "status", "conclusion", "created_at", "started_at", "completed_at") if key in job}


def compact_artifact(artifact):
    return {key: artifact[key] for key in ("id", "name", "digest", "size_in_bytes",
            "created_at", "expired", "workflow_run") if key in artifact}


def compact_images(images):
    return {key: row["tree_sha256"] for key, row in images.items()}


def compact_spec(spec):
    names = ("SOURCE_DATE", "DEBUG_LEVEL", "CC_VERSION_NUMBER", "CXX_VERSION_NUMBER",
             "TOOLCHAIN_TYPE", "OPENJDK_TARGET_CPU", "OPENJDK_TARGET_OS", "JVM_VARIANTS",
             "JVM_VARIANT_MAIN", "COMPILE_TYPE", "VERSION_OPT", "VERSION_STRING", "JDK_VARIANT")
    return {key: spec[key] for key in names if key in spec}


def compact_receipt(receipt):
    names = ("source", "base", "baseline", "backend", "tier", "triplets", "manifest_sha256",
             "runner_sha256", "parent_manifest_sha256", "extra_benchmark_source_sha256", "pair_receipt_sha256")
    result = {key: receipt[key] for key in names if key in receipt}
    result["producer_image_hashes"] = compact_images(receipt["producer_image_hashes"])
    if "producer" in receipt:
        result["producer"] = {"job_id": receipt["producer"]["job"]["id"],
                              "artifact_id": receipt["producer"]["artifact"]["id"],
                              "artifact_digest": receipt["producer"]["artifact"]["digest"]}
    return result


def compact_provenance(provenance):
    names = ("sources", "runner_sha256", "manifest_sha256", "control_images",
             "harness_sha256", "method", "probe_sha256")
    result = {key: provenance[key] for key in names if key in provenance}
    result["spec"] = compact_spec(provenance["spec"])
    result["validated_spec_json_sha256"] = sha(canonical(provenance["spec"]).encode("ascii"))
    result["image_hashes"] = compact_images(provenance["image_hashes"])
    if "extra_benchmark_sources" in provenance:
        result["extra_benchmark_sources"] = {key.replace(chr(92), "/").rsplit("/", 1)[-1]: value
            for key, value in provenance["extra_benchmark_sources"].items()}
    return result


def compact_pair(pair):
    names = ("sources", "backend", "producer_run", "producer_head", "helper_sha256",
             "parent_manifest_sha256", "source_trees")
    result = {key: pair[key] for key in names if key in pair}
    result["spec"] = compact_spec(pair["spec"])
    result["image_hashes"] = compact_images(pair["image_hashes"])
    return result


def phase_data(bundle, case, phase, pair, extract, payloads):
    name, backend, tier = phase["phase"], case["backend"], case["tier"]
    prefix = case.get("zip_root", "") + {"stock": "", "supplement": "", "neighbors": "", "periodic": "periodic/", "utf16-probe": "utf16-probe/"}[name]
    manifest_raw = bundle.read(prefix + "shard-cases.tsv")
    assert sha(manifest_raw) == phase["manifest_sha256"]
    rows = list(csv.DictReader(io.StringIO(manifest_raw.decode("utf-8")), delimiter="\t"))
    assert rows and len(rows) == phase["triplets"]
    alias = "avx2" if backend == "avx512" else backend
    assert all(row["backends"] == alias and row["tiers"] == tier for row in rows)
    assert len({row["id"] for row in rows}) == len(rows)
    physical = sorted(canonical([backend, tier, "org.openjdk.bench.java.lang." + row["benchmark"], row_params(row)]) for row in rows)
    assert physical == sorted(phase["physical_keys"])
    receipt = json.loads(bundle.read(prefix + "shard-receipt.json"))
    helper = EXTRA_HELPER if name in EXTRAS else HELPER
    assert receipt["source"] == SOURCE and receipt["backend"] == backend and receipt["tier"] == tier
    assert receipt["triplets"] == len(rows) and receipt["manifest_sha256"] == phase["manifest_sha256"]
    assert receipt["runner_sha256"] == helper and receipt["parent_manifest_sha256"] == PARENTS[name]
    assert receipt["producer_image_hashes"] == pair["image_hashes"]
    kinds = objects(bundle.read(prefix + "experiment.log"))
    provenance, complete = kinds["PROVENANCE"][0], kinds["COMPLETE"][0]
    records = kinds.get("RESULT", [])
    assert provenance["sources"] == complete["sources"] == {"original": BASE, "fork": SOURCE}
    assert provenance["runner_sha256"] == helper and provenance["manifest_sha256"] == phase["manifest_sha256"]
    assert provenance["spec"] == pair["spec"]
    assert provenance["control_images"] == {"original": "original", "enabled": "fork", "disabled": "fork"}
    assert {key: provenance["image_hashes"][key]["tree_sha256"] for key in ("original", "fork")} == case["image_hashes"]
    assert complete["measurements"] == len(records) == len(rows) * 3
    assert complete["triplets"] == len(rows) and complete["images_unchanged"] is True
    assert complete["all_means_retained"] is True
    assert provenance["method"] == {"forks": 2, "warmup": "3 x 500ms", "measurement": "5 x 500ms", "cds": "off", "gc": "Serial"}
    if name in EXTRAS:
        basename, digest = EXTRAS[name]
        sources = provenance["extra_benchmark_sources"]
        assert len(sources) == 1 and next(iter(sources)).replace("\\", "/").endswith("/" + basename)
        assert list(sources.values()) == [digest] and receipt["extra_benchmark_source_sha256"] == digest
    else:
        assert not provenance.get("extra_benchmark_sources")
    for key, digest in provenance["harness_sha256"].items():
        path = key if key.startswith("classes/") else "jmh/" + key
        assert sha(bundle.read(prefix + path)) == digest
    expected = {(row["id"], control): row for row in rows for control in ("original", "enabled", "disabled")}
    seen = set()
    _, avx = BACKENDS[backend]
    for record in records:
        key = record["case"], record["control"]
        assert key in expected and key not in seen
        seen.add(key)
        row = expected[key]
        assert record["benchmark"] == "org.openjdk.bench.java.lang." + row["benchmark"]
        assert record["params"] == row_params(row)
        flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off"]
        flags += [] if avx is None else ["-XX:UseAVX=" + avx]
        flags += TIERS[tier]
        if record["control"] != "original":
            flags += ["-XX:" + ("+" if record["control"] == "enabled" else "-") + "UseStringZillaIntrinsics"]
        assert record["jvmArgs"] == flags
        image = "original" if record["control"] == "original" else "fork"
        root = provenance["image_hashes"][image]["root"].replace("\\", "/").rstrip("/")
        windows = provenance["machine"]["system"].startswith("Windows")
        expected_java = root + "/bin/java" + (".exe" if windows else "")
        actual_java = record["java"].replace("\\", "/")
        assert (actual_java.lower() == expected_java.lower()) if windows else (actual_java == expected_java)
        samples = record["rawData"]
        assert len(samples) == 2 and all(len(values) == 5 for values in samples)
        values = sum(samples, [])
        assert all(math.isfinite(value) and value > 0 for value in values)
        mean = sum(values) / 10
        variance = sum((value - mean) ** 2 for value in values) / 9
        error = 4.78091258593355 * math.sqrt(variance / 10)
        assert abs(mean - record["score"]) <= 1e-9 * max(mean, record["score"])
        assert abs(error - record["error"]) <= 1e-8 * max(error, record["error"], 1e-12)
    assert seen == set(expected)
    diagnostics = kinds.get("COMPILATION", [])
    assert len(diagnostics) == 57 and all(value["timing_evidence"] is False for value in diagnostics)
    binding = {"source": SOURCE, "baseline": BASE, "workflow": case["workflow"], "phase": name,
               "backend": backend, "tier": tier}
    def emit(kind, value):
        assert kind == "SAVED_JMH_JSON"
        payloads.append(value)
        target = OUT / "raw" / name / Path(value["path"]).name
        target.parent.mkdir(parents=True, exist_ok=True)
        raw = base64.b64decode(value["content"], validate=True)
        assert sha(raw) == value["sha256"]
        target.write_bytes(raw)
    index = extract(bundle, records, binding, emit, prefix)
    return {"phase": name, "triplets": len(rows), "manifest_sha256": phase["manifest_sha256"],
            "manifest": manifest_raw.decode("utf-8"), "receipt": compact_receipt(receipt),
            "provenance": compact_provenance(provenance),
            "provenance_scope": "Validated original host details remain in source artifact; compact hashes/flags only are exported.",
            "source_experiment_sha256": sha(bundle.read(prefix + "experiment.log")),
            "complete": complete, "raw_index": index, "compilation_diagnostics": 57}


def jit_data(bundle, case, harness):
    backend, tier = case["backend"], case["tier"]
    if tier != "c2":
        return []
    name = ("forward-positive-diagnostics.json" if case["campaign"] == "supplement" and backend == "serial"
            else "positive-search-diagnostics.json" if case["campaign"] == "pilot" else None)
    if name is None:
        return []
    saved_raw = bundle.read(case.get("zip_root", "") + name)
    saved = json.loads(saved_raw)
    assert saved["source"] == SOURCE and saved.get("baseline", saved.get("base")) == BASE
    assert saved["backend"] == backend and saved["tier"] == "c2" and saved["timing_evidence"] is False
    assert {key.removeprefix("jmh/"): value for key, value in saved["harness_sha256"].items()} == harness
    expected = ({"forward": {"length": "128", "needleLength": "4", "coder": "MIXED", "position": "START"}}
                if case["campaign"] == "supplement" else {
                    "utf16-4096-64-end": {"length": "4096", "needleLength": "64", "coder": "UTF16", "position": "END"},
                    "latin1-4096-4-end": {"length": "4096", "needleLength": "4", "coder": "LATIN1", "position": "END"},
                    "utf16-127-4-end": {"length": "127", "needleLength": "4", "coder": "UTF16", "position": "END"}})
    assert len(saved["runs"]) == 3 * len(expected)
    seen, reports = set(), []
    targeted = re.compile(r"(?:String(?:UTF16|Latin1)?::(?:lastIndexOf|indexOf)|StringZilla::|ArraysSupport::(?:mismatch|vectorizedMismatch)|StringZillaSearch.*::|(?:FreqInlineSize|InlineSmallCode|MaxInlineSize|C1MaxInlineSize)\s*=)")
    for item in saved["runs"]:
        control = item["control"]
        label = "forward" if case["campaign"] == "supplement" else item["case"]
        assert (control, label) not in seen and control in ("original", "enabled", "disabled")
        seen.add((control, label))
        assert item["params"] == expected[label] and item["tier"] == "c2"
        assert item["source"] == (BASE if control == "original" else SOURCE)
        assert item["timing_evidence"] is False and item["returncode"] == 0
        _, avx = BACKENDS[backend]
        flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off"]
        flags += [] if avx is None else ["-XX:UseAVX=" + avx]
        flags += TIERS["c2"]
        if control != "original":
            flags += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics"]
        assert item["jvmArgs"][:len(flags)] == flags
        assert all(flag in item["jvmArgs"] for flag in ("-Xbatch", "-XX:+UnlockDiagnosticVMOptions",
                   "-XX:+PrintFlagsFinal", "-XX:+PrintCompilation", "-XX:+PrintInlining"))
        assert item["command"][-2:] == ["-jvmArgs", " ".join(item["jvmArgs"])]
        path = ("forward-positive-diagnostics/" + control + ".log" if case["campaign"] == "supplement"
                else "positive-search-diagnostics/" + control + "-" + label + ".log")
        assert item["path"] == path
        raw = bundle.read(case.get("zip_root", "") + path)
        assert sha(raw) == item["sha256"] and len(raw) <= 32 * 1024 * 1024
        lines = raw.decode("utf-8", errors="replace").splitlines()
        indices = [index for index, line in enumerate(lines) if targeted.search(line)
                   and not re.match(r"^\s*(?:0x[0-9a-f]+:|;)", line)]
        context = sorted({near for index in indices for near in range(max(0, index - 3), min(len(lines), index + 4))})
        reports.append({"control": control, "case": label, "source": item["source"], "params": item["params"],
                        "jvmArgs": item["jvmArgs"], "path": case.get("zip_root", "") + path, "sha256": item["sha256"],
                        "bytes": len(raw), "line_count": len(lines), "matching_lines": len(indices),
                        "lines": [{"line": index + 1, "text": lines[index]} for index in context
                                  if not re.match(r"^\s*(?:0x[0-9a-f]+:|;)", lines[index])],
                        "timing_evidence": False})
    assert seen == {(control, label) for control in ("original", "enabled", "disabled") for label in expected}
    destination = OUT / "positive-inlining-excerpts.json"
    destination.write_text(canonical({"source": SOURCE, "backend": backend, "tier": tier,
                                      "timing_evidence": False, "reports": reports}) + "\n")
    return reports


def read(case):
    workflow, backend, tier = case["workflow"], case["backend"], case["tier"]
    alias = "avx2" if backend == "avx512" else backend
    producer = case["producer"]
    pair_meta, pair_job = identity(producer, PILOT,
        "stringzilla-candidate-pilot-pair-" + alias + "-" + PILOT["head"])
    assert pair_job["name"].endswith("/ " + alias + " validated pair")
    passed = {step["name"]: step["conclusion"] for step in pair_job["steps"]}
    assert all(passed[name] == "success" for name in (
        "Verify and archive matched complete pair", "Publish complete images before tests",
        "Run profiles, jtreg and native contract checks"))
    bundle, metadata, job = archive(case["artifact"], workflow)
    recovery = None
    if case.get("recovery77"):
        artifact_id = metadata["id"]
        if artifact_id not in RECOVERY_CACHE:
            assert sha(RECOVERY_ADAPTER.read_bytes()) == RECOVERY_ADAPTER_SHA
            spec = importlib.util.spec_from_file_location("recovery77", RECOVERY_ADAPTER)
            adapter = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(adapter)
            RECOVERY_CACHE[artifact_id] = adapter.validate_recovery77(bundle, case, {"artifact": metadata, "job": job})
        recovery = RECOVERY_CACHE[artifact_id]
        mapped = recovery["groups"][case["zip_root"].rstrip("/")]
        assert mapped["zip_root"] == case["zip_root"] and mapped["tier"] == tier
        assert [(row["phase"], row["triplets"], row["manifest_sha256"]) for row in mapped["phases"]] == [
            (row["phase"], row["triplets"], row["manifest_sha256"]) for row in case["phases"]]
        pair_path, reuse_path = mapped["pair_path"], mapped["reuse_path"]
        runtime_path, shard_path = mapped["runtime_path"], mapped["receipt_path"]
    else:
        prefix = {"pilot": "stringzilla-candidate-pilot-results-", "supplement": "stringzilla-candidate-losses-",
                  "neighbors": "stringzilla-candidate-msvc-utf-neighbors-"}[case["campaign"]]
        assert metadata["name"] == prefix + backend + "-" + tier + "-" + workflow["head"] + "-attempt" + str(case["artifact"]["attempt"])
        pair_path, reuse_path = "pair-receipt.json", "artifact-reuse.json"
        runtime_path, shard_path = "runtime-attestation.json", "shard-receipt.json"
    pair_raw = bundle.read(pair_path)
    pair = json.loads(pair_raw)
    assert pair["sources"] == {"original": BASE, "fork": SOURCE} and pair["backend"] == alias
    assert str(pair["producer_run"]) == str(PILOT["run_id"]) and pair["producer_head"] == PILOT["head"]
    assert pair["helper_sha256"] == HELPER and pair["parent_manifest_sha256"] == PARENTS["stock"]
    assert {key: pair["image_hashes"][key]["tree_sha256"] for key in ("original", "fork")} == case["image_hashes"]
    shard = json.loads(bundle.read(shard_path))
    if case["campaign"] == "pilot":
        reused = json.loads(bundle.read(reuse_path))
        assert reused["artifact"]["id"] == producer["artifact_id"] and reused["artifact"]["digest"] == producer["digest"]
        assert reused["downloaded_zip_sha256"] == producer["digest"].removeprefix("sha256:")
        assert reused["sources"] == pair["sources"] and reused["image_hashes"] == pair["image_hashes"]
    else:
        assert shard["producer"]["artifact"]["id"] == producer["artifact_id"]
        assert shard["producer"]["artifact"]["digest"] == producer["digest"]
        assert shard["producer"]["job"]["id"] == producer["job_id"]
        assert shard["pair_receipt_sha256"] == sha(pair_raw)
    attested = json.loads(bundle.read(runtime_path))
    assert attested["source"] == SOURCE and attested["backend"] == backend and attested["tier"] == tier
    assert attested["available"] is True and attested["timed_records"] == 0
    assert set(attested["observations"]) == {"original", "enabled", "disabled"}
    selected, avx = BACKENDS[backend]
    for control, value in attested["observations"].items():
        flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off"]
        flags += [] if avx is None else ["-XX:UseAVX=" + avx]
        flags += TIERS[tier]
        expected = avx or "arm"
        if control != "original":
            enabled = control == "enabled"
            flags += ["-XX:" + ("+" if enabled else "-") + "UseStringZillaIntrinsics",
                      "--add-opens=java.base/java.lang=ALL-UNNAMED"]
            expected += ":" + str(selected) + ":" + str(enabled).lower()
        assert value["returncode"] == 0 and value["actual"] == value["expected"] == expected
        assert value["jvmArgs"] == flags
    assert sha(EXTRACTOR.read_bytes()) == EXTRACTOR_SHA
    spec = importlib.util.spec_from_file_location("raw_jmh", EXTRACTOR)
    extractor = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(extractor)
    payloads = []
    phases = [phase_data(bundle, case, phase, pair, extractor.extract_raw_jmh, payloads) for phase in case["phases"]]
    jit = jit_data(bundle, case, phases[0]["provenance"]["harness_sha256"])
    payload = {"schema": 1, "source": SOURCE, "baseline": BASE, "case_id": case["id"],
               "campaign": case["campaign"], "backend": backend, "tier": tier, "workflow": workflow,
               "artifact": compact_artifact(metadata), "job": compact_job(job),
               "original_job_snapshot": compact_job(case["artifact"]["job_snapshot"]),
               "producer_artifact": compact_artifact(pair_meta), "producer_job": compact_job(pair_job),
               "pair_receipt_sha256": sha(pair_raw), "pair_receipt": compact_pair(pair),
               "runtime_attestation": {**{key: attested[key] for key in ("source", "backend", "tier", "available", "timed_records")},
                   "observations": {control: {key: row[key] for key in ("returncode", "actual", "expected", "jvmArgs")}
                                    for control, row in attested["observations"].items()}},
               "recovery77": recovery,
               "origin_workflow": case.get("origin_workflow"), "zip_root": case.get("zip_root", ""),
               "zero_timing_prior_attempt": case.get("zero_timing_prior_attempt"),
               "phases": phases, "raw_jmh": payloads, "jit": jit, "new_timing_executions": 0}
    plain = canonical(payload).encode("ascii")
    assert len(plain) <= 8 * 1024 * 1024
    compressed = gzip.compress(plain, mtime=0)
    assert len(compressed) <= 224 * 1024, "Split a read-only export if actual compressed output exceeds the bounded log budget"
    encoded = base64.b64encode(compressed).decode("ascii")
    chunks = [encoded[start:start + 24576] for start in range(0, len(encoded), 24576)]
    receipt = {"schema": 1, "case_id": case["id"], "source": SOURCE, "baseline": BASE,
               "workflow": workflow, "artifact_id": metadata["id"], "artifact_digest": metadata["digest"],
               "phase_triplets": {phase["phase"]: phase["triplets"] for phase in phases},
               "records": len(payloads), "new_timing_executions": 0,
               "encoding": "gzip+base64", "compressed_sha256": sha(compressed), "uncompressed_sha256": sha(plain),
               "compressed_bytes": len(compressed), "uncompressed_bytes": len(plain),
               "chunks": len(chunks), "chunk_characters": 24576}
    (OUT / "payload.json.gz").write_bytes(compressed)
    (OUT / "reader-receipt.json").write_text(canonical(receipt) + "\n")
    output("RECEIPT", receipt)
    for index, chunk in enumerate(chunks):
        output("CHUNK", {"case_id": case["id"], "index": index, "count": len(chunks), "content": chunk})
    output("COMPLETE", receipt)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("proof", "read"))
    parser.add_argument("--index", type=int)
    args = parser.parse_args()
    cases, keys, counts = pins()
    if args.mode == "proof":
        groups = {}
        for index, case in enumerate(cases):
            groups.setdefault(case["artifact"]["artifact_id"], []).append(index)
        matrix = {"include": [{"index": index, "id": cases[indices[0]]["id"]}
                              for index, indices in enumerate(groups.values())]}
        with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
            stream.write("matrix=" + canonical(matrix) + "\n")
        output("MATRIX", {"source": SOURCE, "baseline": BASE, "logical_groups": len(cases), "archives": len(groups),
                          "triplets": len(keys), "records": 3 * len(keys), "counts": counts,
                          "physical_keys": keys, "new_timing_executions": 0})
    else:
        groups = {}
        for index, case in enumerate(cases):
            groups.setdefault(case["artifact"]["artifact_id"], []).append(index)
        groups = list(groups.values())
        assert args.index is not None and 0 <= args.index < len(groups)
        export_root = OUT
        export_root.mkdir(exist_ok=False)
        for index in groups[args.index]:
            case = cases[index]
            assert re.fullmatch(r"[a-z0-9-]+", case["id"])
            OUT = export_root / case["id"]
            OUT.mkdir(exist_ok=False)
            read(case)
