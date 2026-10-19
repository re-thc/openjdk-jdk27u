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
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parent
OUT = Path("evidence-output")
SOURCE = "916ba895e834378e3f7eac7f030fc4abff641d33"
RUNTIME_SOURCE = "34e3d8f99b053eec3f8f7e0d4c458de662a7d977"
SOURCE_TREE = "d3de6a4fcf40e5b45b58d7e0874ed2ab34fe2e01"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
HELPER = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
EXTRA_HELPER = "74ed5c71dd487e08d0ef017ead2f59172acbca9a7edad9b51ad976e54e80e532"
PRODUCER = {"run_id": 39164738566, "head": "8bd517316162bc8a638b8339da47ac9c36b40d1e"}
CONSUMERS = {"avx512": {"run_id": 39174300598, "head": "99609a52cd38d5eb3ef093e7c13f30c7215d96d1"},
             "normal": {"run_id": 39182567318, "head": "57d209684d4887100690410e326377759df13176"}}
SINGLE_HOST = {"run_id": 39187437768, "head": "4176f25bfc42a553d9192328d726b233c23b552f"}
SOURCE_INPUTS = {"original":{"revision":"416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda","runtime_trees":"040000 tree a90cc9b6106f06949724750dbb6be23227ecba82\tbin\n040000 tree 60b42189e64a5a7cfb3dbfcbed7faeff778493d6\tmake\n040000 tree 9483b1544a654c3c698ba7f8685cdf34059badd6\tsrc\n040000 tree 1d64a6e90f219918ee2872974bff8f9b75edf833\ttest"},"fork":{"revision":"916ba895e834378e3f7eac7f030fc4abff641d33","runtime_trees":"040000 tree a90cc9b6106f06949724750dbb6be23227ecba82\tbin\n040000 tree 64d6b10b1481107be1627ebf1243cbd5c163f898\tmake\n040000 tree 7de52d62a1ff5ff5e6103c6d3caff7707894dddc\tsrc\n040000 tree 42c99f77685c06f481b60d8584700412bbc58eb0\ttest"}}
PARENTS = {"stock": "d94afb1b86132ff7fb5ec6bdfa81f033076b9c1057a6aa0c8fe815b7e4ea760d",
           "periodic": "02e48d06c5d3fdec8fb897fdff26dc1e0b5231ad2001397cb0f08313048938c2",
           "utf16-probe": "06dc833fa691489a1869628aa94715ab3b3ff4ba550b3b936d590c6dee4ef834"}
EXTRAS = {"periodic": ("StringZillaPeriodicSearch.java", "fead0e50103b20ca4bb1f3eeb47a71b1fc79f52fd91d0c7bb9007a502f7de44b"),
          "utf16-probe": ("StringZillaUTF16Probe.java", "1ac9e865b12f3ecf87bef52789ade1a0709ddec569a896c0d4796c5583d6f1f7")}
BACKENDS = {"serial": (0, "0"), "avx2": (1, "2"), "avx512": (2, "3"), "neon": (4, None), "msvc": (0, "2")}
TIERS = {"interpreter": ["-Xint"], "c1": ["-XX:TieredStopAtLevel=1"], "c2": ["-XX:-TieredCompilation"]}
EXTRACTOR_SHA = "d015c96a325999a5b4dc9efbe30fd9fdd163277f0d69f5c114ec91ce060e1355"
PIN_FILE = ROOT / "stringzilla-final-saved-cases.json"
EXTRACTOR = ROOT / "stringzilla-raw-jmh.py"
ARCHIVE_CACHE = {}
MAX_COMPRESSED = 224 * 1024
MAX_PLAIN = 8 * 1024 * 1024


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
    assert document["runtime_source"] == RUNTIME_SOURCE and document["expected_triplets"] == 1886
    model_hashes = {"serial":"ea86271400a94d5bf2b281768dc655a44b88237a31b9fcc1ffccb45e11ece3fd","avx2":"5a07f6bca0b42e0376f8294c2668a05032d8ce1a69ad7d1d08b0c916df68e305","neon":"4a04743d3bfcdecc1b42c7eac34e2c49cb21a968db7bd90e96ff82a9ee0bb38e","msvc":"c56ca647b0e1d0dbe58df0a442d5379b422a1b730539febf6c454baea0f23f62","avx512":"af6857f40774f209b8cae6fedeec083ce6f644ccc4266a6c26acbd164ddd6720"}
    models, all_keys = {}, set()
    for backend, digest in model_hashes.items():
        raw = (ROOT / ("stringzilla-final-saved-model-" + backend + ".json")).read_bytes()
        assert sha(raw) == digest
        model = json.loads(raw)
        assert model["source"] == SOURCE and model["source_tree"] == SOURCE_TREE and model["base"] == BASE
        assert model["run"] == PRODUCER["run_id"] and model["head"] == PRODUCER["head"]
        assert model["backend"] == backend and model["records"] == 3 * model["triplets"]
        assert len(model["physical_keys"]) == len(set(model["physical_keys"])) == model["triplets"]
        assert not all_keys.intersection(model["physical_keys"])
        all_keys.update(model["physical_keys"])
        models[backend] = model
    assert len(all_keys) == 1886
    assert document["scope"] in ("partial", "final")
    cases = document["cases"]
    assert 1 <= len(cases) <= 15
    assert len({case["id"] for case in cases}) == len(cases)
    assert len({case["artifact"]["artifact_id"] for case in cases}) == len(cases)
    selected = set()
    for case in cases:
        backend, tier = case["backend"], case["tier"]
        assert backend in BACKENDS and tier in TIERS and case["id"] == backend + "-" + tier
        assert case["source"] == SOURCE and case["baseline"] == BASE and case["runtime_source"] == RUNTIME_SOURCE
        single_host = backend == "avx512" and tier in ("interpreter", "c1")
        expected_workflow = SINGLE_HOST if single_host else CONSUMERS["avx512" if backend == "avx512" else "normal"]
        assert case["workflow"] == expected_workflow
        expected_kind = "github-step" if single_host else "github-job"
        assert case["artifact"].get("execution_kind", "github-job") == expected_kind
        if single_host:
            wanted_steps = ["Measure missing SKY " + tier + " controls", "Retain completed SKY " + tier + " raw results"]
            assert [step["name"] for step in case["artifact"]["successful_steps"]] == wanted_steps
        case["auth_mode"] = "single-host-v1" if single_host else ("allfour-v1" if backend == "avx512" else "normal")
        assert case["producer"]["workflow"] == PRODUCER
        assert case["strict_validation"]["triplets"] > 0
        assert re.fullmatch(r"[0-9a-f]{40}", case["strict_validation"]["blob"])
        assert set(case["image_hashes"]) == {"original", "fork"}
        assert all(re.fullmatch(r"[0-9a-f]{64}", value) for value in case["image_hashes"].values())
        assert case["image_hashes"]["original"] != case["image_hashes"]["fork"]
        prior_pair_hash = case["producer"].get("pair_receipt_sha256")
        if prior_pair_hash is None:
            assert case["producer"]["pair_receipt_binding"] == "computed-from-authenticated-result-zip"
        else:
            assert re.fullmatch(r"[0-9a-f]{64}", prior_pair_hash)
        phases, case_keys = [], set()
        for name, projection in models[backend]["projections"][tier].items():
            if projection["triplets"] == 0:
                continue
            rows = list(csv.DictReader(io.StringIO(projection["manifest"]), delimiter="\t"))
            keys = sorted(canonical([backend, tier, "org.openjdk.bench.java.lang." + row["benchmark"],
                                     row_params(row)]) for row in rows)
            assert len(keys) == len(set(keys)) == projection["triplets"]
            assert set(keys).issubset(models[backend]["physical_keys"])
            assert not case_keys.intersection(keys)
            case_keys.update(keys)
            assert sha(projection["manifest"].encode("utf-8")) == projection["receipt"]["manifest_sha256"]
            phases.append({"phase": name, "triplets": projection["triplets"],
                           "manifest_sha256": projection["receipt"]["manifest_sha256"], "physical_keys": keys})
        expected = {key for key in models[backend]["physical_keys"] if json.loads(key)[1] == tier}
        assert case_keys == expected and not selected.intersection(case_keys)
        assert sum(phase["triplets"] for phase in phases) == case["strict_validation"]["triplets"]
        selected.update(case_keys)
        case["phases"] = phases
        case["campaign"] = "final"
        case["export_scope"] = document["scope"]
    jobs = {}
    for case in cases:
        key = case["workflow"]["run_id"], case["artifact"]["job_id"]
        jobs.setdefault(key, []).append(case)
    for shared in jobs.values():
        if len(shared) > 1:
            assert len(shared) == 2 and all(case["auth_mode"] == "single-host-v1" for case in shared)
            assert {case["tier"] for case in shared} == {"interpreter", "c1"}
            assert shared[0]["artifact"]["job_snapshot"] == shared[1]["artifact"]["job_snapshot"]
    if document["scope"] == "final":
        assert len(cases) == 15 and selected == all_keys, "Final publication requires all1886 triplets/5658 files"
    else:
        assert selected.issubset(all_keys)
    return cases, sorted(selected), sorted(all_keys)


def identity(binding, workflow, expected_name=None):
    artifact = api("actions/artifacts/" + str(binding["artifact_id"]))
    assert artifact["id"] == binding["artifact_id"] and artifact["digest"] == binding["digest"]
    assert artifact["name"] == (expected_name or binding["artifact_name"]) and not artifact["expired"]
    assert artifact["workflow_run"]["id"] == workflow["run_id"]
    assert artifact["workflow_run"]["head_sha"] == workflow["head"]
    job = api("actions/jobs/" + str(binding["job_id"]))
    assert job["id"] == binding["job_id"] and job["run_id"] == workflow["run_id"]
    assert job["head_sha"] == workflow["head"] and job["name"] == binding["job_name"]
    step_execution = binding.get("execution_kind", "github-job") == "github-step"
    assert job["status"] == "completed"
    if step_execution:
        assert workflow == SINGLE_HOST and job["name"] == "Single host missing SKY controls"
        saved = binding["successful_steps"]
        assert len(saved) == 2
        for expected_step in saved:
            actual = [step for step in job["steps"] if step["number"] == expected_step["number"]]
            assert len(actual) == 1 and actual[0] == expected_step
            assert actual[0]["status"] == "completed" and actual[0]["conclusion"] == "success"
    else:
        assert binding.get("execution_kind", "github-job") == "github-job" and job["conclusion"] == "success"
    # Artifact names and original immutable job IDs identify the execution attempt.
    # A sibling rerun can change GitHub's reported run_attempt for an old job ID.
    snapshot = binding["job_snapshot"]
    assert snapshot["id"] == job["id"] and snapshot["head_sha"] == job["head_sha"]
    assert snapshot["run_id"] == job["run_id"] and snapshot["name"] == job["name"]
    assert snapshot["run_attempt"] == binding["attempt"] and snapshot["created_at"] == job["created_at"]
    assert job["run_attempt"] >= binding["attempt"]
    if snapshot["status"] == "completed":
        if step_execution:
            assert snapshot["conclusion"] == job["conclusion"]
        else:
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
    prefix = {"stock": "", "periodic": "periodic/", "utf16-probe": "utf16-probe/"}[name]
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
    name = "positive-search-diagnostics.json"
    saved_raw = bundle.read(case.get("zip_root", "") + name)
    saved = json.loads(saved_raw)
    assert saved["source"] == SOURCE and saved.get("baseline", saved.get("base")) == BASE
    assert saved["backend"] == backend and saved["tier"] == "c2" and saved["timing_evidence"] is False
    assert {key.removeprefix("jmh/"): value for key, value in saved["harness_sha256"].items()} == harness
    expected = {
                    "utf16-4096-64-end": {"length": "4096", "needleLength": "64", "coder": "UTF16", "position": "END"},
                    "latin1-4096-4-end": {"length": "4096", "needleLength": "4", "coder": "LATIN1", "position": "END"},
                    "utf16-127-4-end": {"length": "127", "needleLength": "4", "coder": "UTF16", "position": "END"}}
    assert len(saved["runs"]) == 3 * len(expected)
    seen, reports = set(), []
    targeted = re.compile(r"(?:String(?:UTF16|Latin1)?::(?:lastIndexOf|indexOf)|StringZilla::|ArraysSupport::(?:mismatch|vectorizedMismatch)|StringZillaSearch.*::|(?:FreqInlineSize|InlineSmallCode|MaxInlineSize|C1MaxInlineSize)\s*=)")
    for item in saved["runs"]:
        control = item["control"]
        label = item["case"]
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
        path = "positive-search-diagnostics/" + control + "-" + label + ".log"
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




def verify_election_copy(bundle, case, temporary):
    algorithm = ROOT / "stringzilla-final-sky-election.py"
    assert sha(algorithm.read_bytes()) == "d893e2184a568fa8898af972eccd0cf5e263ee71676eb11e7ad543d3aa99a5f7"
    folder = Path(temporary)
    names = [name for name in bundle.namelist() if name.startswith("sky-election/") and not name.endswith("/")]
    assert names
    for name in names:
        relative = Path(name.removeprefix("sky-election/"))
        assert not relative.is_absolute() and ".." not in relative.parts
        target = folder / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(bundle.read(name))
    # The frozen helper revalidates all four saved facts and the unique elected
    # worker against their actual API identities. It never starts a JVM.
    values = {"SOURCE": SOURCE, "SOURCE_TREE": SOURCE_TREE, "TIER": case["tier"],
              "GITHUB_REPOSITORY": "re-thc/openjdk-jdk27u",
              "GITHUB_RUN_ID": str(case["workflow"]["run_id"]),
              "GITHUB_SHA": case["workflow"]["head"], "GITHUB_RUN_ATTEMPT": str(case["artifact"]["attempt"])}
    previous = {key: os.environ.get(key) for key in values}
    try:
        os.environ.update(values)
        spec = importlib.util.spec_from_file_location("saved_sky_election", algorithm)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        elected = module.verify_saved(folder, completed=True)
    finally:
        for key, value in previous.items():
            if value is None:
                os.environ.pop(key, None)
            else:
                os.environ[key] = value
    assert elected == json.loads(bundle.read("election-binding.json"))
    assert elected["job_id"] == case["artifact"]["job_id"] and elected["tier"] == case["tier"]
    return {key: elected[key] for key in ("source", "tier", "algorithm_sha256", "selected_slot", "job_id", "job_name")}


def election_data(bundle, case):
    if case["backend"] != "avx512":
        assert "election-binding.json" not in bundle.namelist()
        return None
    with tempfile.TemporaryDirectory(prefix="stringzilla-saved-election-") as temporary:
        return verify_election_copy(bundle, case, temporary)


def single_host_data(bundle, case, job):
    folder = ROOT / "single-host-validation"
    algorithm = folder / "stringzilla-single-sky.py"
    driver = folder / "stringzilla-final.py"
    assert sha(algorithm.read_bytes()) == "b1ddcd11e7303554836ae88c288d89c210bdb2da77cb595e7b5b2631974fa727"
    assert sha(driver.read_bytes()) == "aa58816063dcd6abc6616874449017aa912d751eb329a7315025338444ee59d1"
    values = {"GITHUB_REPOSITORY": "re-thc/openjdk-jdk27u",
              "GITHUB_RUN_ID": str(case["workflow"]["run_id"]),
              "GITHUB_SHA": case["workflow"]["head"], "GITHUB_RUN_ATTEMPT": str(case["artifact"]["attempt"])}
    previous = {key: os.environ.get(key) for key in values}
    try:
        os.environ.update(values)
        spec = importlib.util.spec_from_file_location("saved_single_host", algorithm)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        record = module.verify_tier_artifact(bundle, case["tier"], job)
    finally:
        for key, value in previous.items():
            if value is None:
                os.environ.pop(key, None)
            else:
                os.environ[key] = value
    assert record["fact"]["inputs"]["image_hashes"] == case["image_hashes"]
    assert record["triplets"] == sum(phase["triplets"] for phase in case["phases"])
    steps = {}
    for label, name in (("measure", "Measure missing SKY " + case["tier"] + " controls"),
                        ("retain", "Retain completed SKY " + case["tier"] + " raw results")):
        found = [step for step in job["steps"] if step["name"] == name]
        assert len(found) == 1 and found[0]["status"] == "completed" and found[0]["conclusion"] == "success"
        steps[label] = found[0]
    return {"mode": "single-host-v1", "source": SOURCE, "tier": case["tier"],
            "module_sha256": "b1ddcd11e7303554836ae88c288d89c210bdb2da77cb595e7b5b2631974fa727",
            "fact_binding": {key: record["fact_binding"][key] for key in
                             ("artifact_id", "artifact_digest", "proof_sha256")},
            "preparation_binding": {key: record["fact"]["preparation"][key] for key in
                                    ("artifact_id", "artifact_digest", "proof_sha256")},
            "execution_kind": "github-step", "execution": steps["measure"], "retained": steps["retain"],
            "parent_job": compact_job(job)}


def bundle_parts(payload):
    groups = {}
    for record in payload["raw_jmh"]:
        key = (record["phase"], record["case"])
        groups.setdefault(key, []).append(record)
    assert groups and all({row["control"] for row in rows} == {"original", "enabled", "disabled"}
                          and len(rows) == 3 for rows in groups.values())
    groups = [groups[key] for key in sorted(groups)]
    whole_records = len(payload["raw_jmh"])

    def encode(selected, index, count):
        rows = [row for group in selected for row in group]
        paths = {row["path"] for row in rows}
        assert len(paths) == len(rows)
        phase_counts = {phase["phase"]: sum(row["phase"] == phase["phase"] for row in rows) // 3
                        for phase in payload["phases"]}
        phases = [{**phase, "exported_triplets": phase_counts[phase["phase"]],
                   "raw_index": [row for row in phase["raw_index"] if row["path"] in paths]}
                  for phase in payload["phases"]]
        value = {**payload, "case_id": payload["logical_case_id"] + "-part-" + str(index).zfill(2),
                 "part_index": index, "parts": count, "whole_records": whole_records,
                 "exported_triplets": len(selected), "phases": phases, "raw_jmh": rows,
                 "jit": payload["jit"] if index == 0 else [],
                 "jit_excerpts_part": 0}
        plain = canonical(value).encode("ascii")
        compressed = gzip.compress(plain, mtime=0)
        return value, plain, compressed

    partitions = [groups]
    while True:
        encoded = [encode(selected, index, len(partitions)) for index, selected in enumerate(partitions)]
        oversized = [index for index, (_, plain, compressed) in enumerate(encoded)
                     if len(plain) > MAX_PLAIN or len(compressed) > MAX_COMPRESSED]
        if not oversized:
            break
        # Split only whole original/enabled/disabled triplets and re-evaluate all
        # parts after changing the encoded part count.
        for index in reversed(oversized):
            selected = partitions[index]
            assert len(selected) > 1, "One triplet plus compact provenance exceeds export bounds"
            middle = len(selected) // 2
            partitions[index:index + 1] = [selected[:middle], selected[middle:]]
    files = [row["path"] for value, _, _ in encoded for row in value["raw_jmh"]]
    assert len(files) == len(set(files)) == whole_records
    assert set(files) == {row["path"] for row in payload["raw_jmh"]}
    assert sum(value["exported_triplets"] for value, _, _ in encoded) * 3 == whole_records
    return encoded


def publish_parts(payload):
    encoded = bundle_parts(payload)
    for value, plain, compressed in encoded:
        text = base64.b64encode(compressed).decode("ascii")
        chunks = [text[start:start + 24576] for start in range(0, len(text), 24576)]
        receipt = {"schema": 2, "case_id": value["case_id"], "logical_case_id": value["logical_case_id"],
                   "part_index": value["part_index"], "parts": value["parts"],
                   "source": SOURCE, "runtime_source": RUNTIME_SOURCE, "baseline": BASE,
                   "workflow": value["workflow"], "artifact_id": value["artifact"]["id"],
                   "artifact_digest": value["artifact"]["digest"],
                   "phase_triplets": {phase["phase"]: phase["exported_triplets"] for phase in value["phases"]},
                   "records": len(value["raw_jmh"]), "whole_records": value["whole_records"],
                   "new_timing_executions": 0, "encoding": "gzip+base64",
                   "compressed_sha256": sha(compressed), "uncompressed_sha256": sha(plain),
                   "compressed_bytes": len(compressed), "uncompressed_bytes": len(plain),
                   "chunks": len(chunks), "chunk_characters": 24576}
        (OUT / (value["case_id"] + ".json.gz")).write_bytes(compressed)
        (OUT / (value["case_id"] + "-receipt.json")).write_text(canonical(receipt) + "\n")
        output("RECEIPT", receipt)
        for index, chunk in enumerate(chunks):
            output("CHUNK", {"case_id": value["case_id"], "index": index, "count": len(chunks), "content": chunk})
        output("COMPLETE", receipt)


def read(case):
    workflow, backend, tier = case["workflow"], case["backend"], case["tier"]
    alias = "avx2" if backend == "avx512" else backend
    producer = case["producer"]
    pair_meta, pair_job = identity(producer, PRODUCER,
        "stringzilla-final-pair-" + alias + "-" + PRODUCER["head"])
    assert pair_job["name"].endswith("/ " + alias + " validated pair")
    passed = {step["name"]: step["conclusion"] for step in pair_job["steps"]}
    assert all(passed[name] == "success" for name in (
        "Verify and archive matched complete pair", "Publish complete images before tests",
        "Run profiles, jtreg and native contract checks"))
    bundle, metadata, job = archive(case["artifact"], workflow)
    assert metadata["name"] == ("stringzilla-final-results-" + backend + "-" + tier + "-" +
                                workflow["head"] + "-attempt" + str(case["artifact"]["attempt"]))
    pair_raw = bundle.read("pair-receipt.json")
    prior_pair_hash = producer.get("pair_receipt_sha256")
    if prior_pair_hash is not None:
        assert sha(pair_raw) == prior_pair_hash
    else:
        assert producer["pair_receipt_binding"] == "computed-from-authenticated-result-zip"
    pair = json.loads(pair_raw)
    assert pair["sources"] == {"original": BASE, "fork": SOURCE} and pair["backend"] == alias
    assert str(pair["producer_run"]) == str(PRODUCER["run_id"]) and pair["producer_head"] == PRODUCER["head"]
    assert pair["source_trees"] == SOURCE_INPUTS
    assert pair["helper_sha256"] == HELPER and pair["parent_manifest_sha256"] == PARENTS["stock"]
    assert compact_images(pair["image_hashes"]) == case["image_hashes"]
    assert pair["spec"]["DEBUG_LEVEL"] == "release" and pair["spec"]["SOURCE_DATE"] == "1792195200"
    assert pair["spec"]["VERSION_OPT"] == "stringzilla-benchmark"
    for key in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"):
        assert re.match(r"19\.44\." if backend == "msvc" else r"16\.", pair["spec"][key])
    reused = json.loads(bundle.read("artifact-reuse.json"))
    assert reused["artifact"]["id"] == producer["artifact_id"] and reused["artifact"]["digest"] == producer["digest"]
    assert reused["downloaded_zip_sha256"] == producer["digest"].removeprefix("sha256:")
    assert reused["sources"] == pair["sources"] and reused["image_hashes"] == pair["image_hashes"]
    attested = json.loads(bundle.read("runtime-attestation.json"))
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
    if case["auth_mode"] == "single-host-v1":
        authorization = single_host_data(bundle, case, job)
    elif case["auth_mode"] == "allfour-v1":
        authorization = {"mode": "allfour-v1", **election_data(bundle, case)}
    else:
        assert "single-host-binding.json" not in bundle.namelist()
        assert election_data(bundle, case) is None
        authorization = {"mode": "normal"}
    if not any(phase["phase"] == "utf16-probe" for phase in case["phases"]):
        assert json.loads(bundle.read("utf16-probe/not-applicable.json")) == {
            "source": SOURCE, "backend": backend, "tier": tier, "applicable": False, "triplets": 0, "records": 0}
    assert sha(EXTRACTOR.read_bytes()) == EXTRACTOR_SHA
    spec = importlib.util.spec_from_file_location("raw_jmh", EXTRACTOR)
    extractor = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(extractor)
    payloads = []
    phases = [phase_data(bundle, case, phase, pair, extractor.extract_raw_jmh, payloads) for phase in case["phases"]]
    jit = jit_data(bundle, case, phases[0]["provenance"]["harness_sha256"])
    payload = {"schema": 2, "source": SOURCE, "runtime_source": RUNTIME_SOURCE, "baseline": BASE,
               "logical_case_id": case["id"], "campaign": "final", "export_scope": case["export_scope"],
               "backend": backend, "tier": tier,
               "workflow": workflow, "artifact": compact_artifact(metadata), "job": compact_job(job),
               "original_job_snapshot": compact_job(case["artifact"]["job_snapshot"]),
               "producer_artifact": compact_artifact(pair_meta), "producer_job": compact_job(pair_job),
               "pair_receipt_sha256": sha(pair_raw), "pair_receipt_hash_origin": ("independent-prior-binding" if prior_pair_hash else "computed-from-authenticated-result-zip"),
               "pair_receipt": compact_pair(pair),
               "strict_validation": case["strict_validation"],
               "runtime_attestation": {**{key: attested[key] for key in ("source", "backend", "tier", "available", "timed_records")},
                   "observations": {control: {key: row[key] for key in ("returncode", "actual", "expected", "jvmArgs")}
                                    for control, row in attested["observations"].items()}},
               "authorization": authorization, "execution_kind": case["artifact"].get("execution_kind", "github-job"),
               "phases": phases, "raw_jmh": payloads, "jit": jit,
               "new_timing_executions": 0}
    publish_parts(payload)


def main():
    global OUT
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("proof", "read"))
    parser.add_argument("--index", type=int)
    args = parser.parse_args()
    cases, keys, expected = pins()
    if args.mode == "proof":
        matrix = {"include": [{"index": index, "id": case["id"]} for index, case in enumerate(cases)]}
        with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
            stream.write("matrix=" + canonical(matrix) + "\n")
        output("MATRIX", {"source": SOURCE, "runtime_source": RUNTIME_SOURCE, "baseline": BASE,
                          "logical_groups": len(cases), "archives": len(cases), "triplets": len(keys),
                          "records": 3 * len(keys), "expected_final_triplets": len(expected),
                          "scope": cases[0]["export_scope"], "complete_final_scope": len(keys) == len(expected),
                          "physical_keys_sha256": sha((canonical(sorted(keys)) + "\n").encode("ascii")),
                          "new_timing_executions": 0})
    else:
        assert args.index is not None and 0 <= args.index < len(cases)
        OUT.mkdir(exist_ok=False)
        case = cases[args.index]
        OUT = OUT / case["id"]
        OUT.mkdir()
        read(case)


if __name__ == "__main__":
    main()
