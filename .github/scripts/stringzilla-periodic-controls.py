#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Measure external ABC-periodic workloads using verified final complete images."""
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

ROOT = Path.cwd()
AUX = Path(__file__).resolve().parents[2]
PRODUCER = ROOT / "producer"
SOURCE = "4592230b14fc2f4b537b162fd7f6b791e882b615"
RUN = 39121850979
HEAD = "8dbbc5a78e113630a5f6e9fa15be19cddd8bc3b3"
# Pin the completed artifact-only recovery before creating this auxiliary branch.
RECOVERY_RUN = 39132175965
RECOVERY_HEAD = "8fe46ab0dd39998266a77b9b81d70e5468cd66fb"
HELPER_SHA = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
MAIN_SHA = "9272cdc6717737bede09521cb304d20b92a5aef52b5b8b1b5fa501fb98133ef6"
PERIODIC_SHA = "02e48d06c5d3fdec8fb897fdff26dc1e0b5231ad2001397cb0f08313048938c2"
EXTRA_HELPER_SHA = "74ed5c71dd487e08d0ef017ead2f59172acbca9a7edad9b51ad976e54e80e532"
EXTRA_SOURCE_SHA = "fead0e50103b20ca4bb1f3eeb47a71b1fc79f52fd91d0c7bb9007a502f7de44b"
CHAR_SOURCE_SHA = "add8823a1e3d31406cc200c22d935989041ab726ed02018c34456b8d4d172563"
PRECEDING_SHA = "c91795fcaa4712617ca72ad1303f838ed5833a7aa42d5bc37584fbb2bfd6f133"
DRIVER_SHA = "2f4dd375b33250dc0a322ce8b142def923eb06a721e386254cf872378310b8d5"
PERIODIC = AUX / ".github/scripts/stringzilla-periodic-cases.tsv"
PRECEDING = AUX / ".github/scripts/stringzilla-single-candidate-cases.tsv"
EXTRA_HELPER = AUX / ".github/scripts/stringzilla-performance-extra.py"
EXTRA_SOURCE = AUX / ".github/scripts/StringZillaPeriodicSearch.java"
CHAR_SOURCE = AUX / ".github/scripts/StringZillaCharInlining.java"
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
    assert module.sha(PRECEDING) == PRECEDING_SHA
    assert module.sha(PERIODIC) == PERIODIC_SHA
    assert module.sha(EXTRA_HELPER) == EXTRA_HELPER_SHA
    assert module.sha(EXTRA_SOURCE) == EXTRA_SOURCE_SHA
    assert module.sha(CHAR_SOURCE) == CHAR_SOURCE_SHA
    with PERIODIC.open(newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        rows, fields = list(reader), reader.fieldnames
    with PRECEDING.open(newline="") as stream:
        prior = list(csv.DictReader(stream, delimiter="\t"))
    assert fields == module.rows()[1] and len(rows) == 2 and len(prior) == 5
    assert len({row["id"] for row in rows}) == 2
    assert {(row["length"], row["needleLength"], row["shape"]) for row in rows} == {
        ("4095", "513", "LATIN_PERIOD3_ABC_MISS"), ("2047", "257", "UTF16_PERIOD3_ABC_MISS")}
    assert all(row["coder"] == row["position"] == "-" for row in rows)
    primary, _ = module.expected_keys()
    primary = set(primary)
    assert len(primary) == 1635
    preceding = set()
    expected, counts = set(), {}
    for backend in module.BACKENDS:
        alias = "avx2" if backend == "avx512" else backend
        for row in prior:
            if alias not in row["backends"].split(","):
                continue
            for tier in row["tiers"].split(","):
                key = module.physical(backend, tier, "org.openjdk.bench.java.lang." + row["benchmark"],
                                      module.params(row))
                assert key not in primary and key not in preceding
                preceding.add(key)
        counts[backend] = 0
        for row in rows:
            assert row["benchmark"] == "StringZillaPeriodicSearch.lastIndexOf"
            assert alias in row["backends"].split(",")
            assert row["tiers"] == "interpreter,c1,c2"
            for tier in row["tiers"].split(","):
                key = module.physical(backend, tier, "org.openjdk.bench.java.lang." + row["benchmark"],
                                      module.params(row))
                assert key not in expected and key not in primary and key not in preceding
                expected.add(key)
                counts[backend] += 1
    assert len(preceding) == 35 and len(expected) == 30
    assert counts == {"serial": 6, "avx2": 6, "neon": 6, "msvc": 6, "avx512": 6}
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


def recovery_validation():
    assert RECOVERY_RUN > 0 and re.fullmatch(r"[0-9a-f]{40}", RECOVERY_HEAD)
    assert RECOVERY_HEAD != "0" * 40, "Pin the successful archived-pair recovery before launch"
    run = module.api("actions/runs/" + str(RECOVERY_RUN))
    assert run["head_sha"] == RECOVERY_HEAD
    jobs = module.api("actions/runs/" + str(RECOVERY_RUN) + "/jobs?per_page=100&filter=latest")["jobs"]
    jobs = [job for job in jobs if job["name"] == "msvc archived pair validation"]
    assert len(jobs) == 1 and jobs[0]["conclusion"] == "success", "Wait for MSVC archived-pair validation"
    artifacts = module.api("actions/runs/" + str(RECOVERY_RUN) + "/artifacts?per_page=100")["artifacts"]
    name = "stringzilla-msvc-recovery-validation-" + RECOVERY_HEAD
    artifacts = [artifact for artifact in artifacts if artifact["name"] == name and not artifact["expired"]]
    assert len(artifacts) == 1, name
    artifact, job = artifacts[0], jobs[0]
    archive = module.OUT / "msvc-recovery-validation.zip"
    metadata = module.download(artifact["id"], artifact["digest"], RECOVERY_RUN, RECOVERY_HEAD, archive)
    with zipfile.ZipFile(archive) as bundle:
        raw = bundle.read("recovery-validation.json")
        receipt = json.loads(raw)
        assert receipt["schema"] == "stringzilla-msvc-recovery-v1"
        assert receipt["source"] == SOURCE and receipt["base"] == module.BASE
        assert receipt["original_producer"] == {
            "run_id": RUN, "head": HEAD, "job_id": 117670856747, "conclusion": "failure"}
        assert receipt["pair_artifact"] == {"id": 12137252930,
            "digest": "sha256:b063eda10cb8213507850a01a34704d09973f7a0517694a29d09ae1e98fefa9d"}
        recovery = receipt["recovery"]
        assert recovery["run_id"] == RECOVERY_RUN and recovery["head"] == RECOVERY_HEAD
        assert recovery["job_id"] == job["id"] and recovery["job_name"] == job["name"]
        assert recovery["attempt"] == job["run_attempt"] and receipt["timed_records"] == 0
        assert receipt["helper_sha256"] == HELPER_SHA and receipt["parent_manifest_sha256"] == MAIN_SHA
        assert receipt["driver"] == {"original_git_blob": "24ae08447d825bba9afd0327741f23ab587710a1",
                                     "original_sha256": DRIVER_SHA,
                                     "validation_copy_sha256": "a077bc269123aa2fd7ad9fd3afac943de9eeea88cbd1e77254ff4dbdc61e0f3f"}
        assert receipt["profile_shell"] == "C:/msys64/usr/bin/bash.exe"
        assert receipt["source_trees"] == module.check_sources(SOURCE)
        assert re.fullmatch(r"[0-9a-f]{64}", receipt["pair_receipt_sha256"])
        assert re.fullmatch(r"[0-9a-f]{64}", receipt["spec_sha256"])
        images = receipt["producer_image_hashes"]
        assert set(images) == {"original", "fork"}
        assert all(set(value) == {"tree_sha256"} and re.fullmatch(r"[0-9a-f]{64}", value["tree_sha256"])
                   for value in images.values())
        assert images["original"]["tree_sha256"] != images["fork"]["tree_sha256"]
        flags = receipt["validation"]
        assert set(flags) == {"profiles_original", "profiles_fork", "jtreg_search_bounds", "jtreg_dispatch",
                              "native_contract", "character_diagnostics", "image_inventories_unchanged"}
        assert all(value is True for value in flags.values())
        pair_raw = bundle.read("pair-receipt.json")
        pair = json.loads(pair_raw)
        assert pair["sources"] == {"original": module.BASE, "fork": SOURCE}
        assert pair["producer_run"] == str(RUN) and pair["producer_head"] == HEAD
        assert pair["helper_sha256"] == HELPER_SHA and pair["parent_manifest_sha256"] == MAIN_SHA
        verify_recovered_pair(pair, pair_raw, {"receipt": receipt})
        assert hashlib.sha256(bundle.read("pair-inventories.json")).hexdigest() == receipt["pair_inventories_sha256"]
        for control in ("original", "fork"):
            assert hashlib.sha256(bundle.read(control + "-spec.gmk")).hexdigest() == receipt["spec_file_sha256"][control]
        logs = receipt["log_sha256"]
        required = {"original-profile.log", "fork-profile.log", "jtreg-smoke.log", "jtreg-dispatch.log",
                    "jtreg-native.log", "native-validation/build.log", "character-diagnostics/javac.log"}
        required.update("character-diagnostics/" + control + "-" + klass + ".javap.log"
                        for control in ("original", "fork") for klass in ("StringLatin1", "StringUTF16"))
        assert required <= set(logs)
        for path, digest in logs.items():
            assert path and not path.startswith("/") and "\\" not in path
            assert not any(part in ("", ".", "..") for part in path.split("/"))
            assert re.fullmatch(r"[0-9a-f]{64}", digest)
            assert hashlib.sha256(bundle.read(path)).hexdigest() == digest, path
    archive.unlink()
    chain = {"run_id": RECOVERY_RUN, "head": RECOVERY_HEAD, "job_id": job["id"],
             "artifact_id": metadata["id"], "artifact_digest": metadata["digest"],
             "receipt_sha256": hashlib.sha256(raw).hexdigest(), "receipt": receipt}
    module.write("msvc-recovery-binding.json", chain)
    return chain


def verify_recovered_pair(pair, raw, recovery):
    receipt = recovery["receipt"]
    assert receipt["pair_receipt_sha256"] == hashlib.sha256(raw).hexdigest()
    assert receipt["producer_image_hashes"] == pair["image_hashes"]
    assert receipt["source_trees"] == pair["source_trees"]
    canonical = json.dumps(pair["spec"], sort_keys=True, separators=(",", ":")).encode()
    assert receipt["spec_sha256"] == hashlib.sha256(canonical).hexdigest()


def producer_artifact(backend):
    producer = "avx2" if backend == "avx512" else backend
    run = module.api("actions/runs/" + str(RUN))
    assert run["head_sha"] == HEAD
    jobs = module.api("actions/runs/" + str(RUN) + "/jobs?per_page=100&filter=latest")["jobs"]
    for required in ("serial", "avx2", "neon", "msvc"):
        label = required + " validated pair"
        selected = [job for job in jobs if job["name"] == label or job["name"].endswith("/ " + label)]
        assert len(selected) == 1
        if required == "msvc":
            assert selected[0]["id"] == 117670856747 and selected[0]["conclusion"] == "failure"
        else:
            assert selected[0]["conclusion"] == "success", "Wait for the validated producer: " + label
    recovery = recovery_validation()
    label = producer + " validated pair"
    selected = [job for job in jobs if job["name"] == label or job["name"].endswith("/ " + label)]
    assert len(selected) == 1
    artifacts = module.api("actions/runs/" + str(RUN) + "/artifacts?per_page=100")["artifacts"]
    name = "stringzilla-sharded-pair-" + producer + "-" + HEAD
    matches = [artifact for artifact in artifacts if artifact["name"] == name and not artifact["expired"]]
    assert len(matches) == 1, name
    if producer == "msvc":
        assert matches[0]["id"] == recovery["receipt"]["pair_artifact"]["id"]
        assert matches[0]["digest"] == recovery["receipt"]["pair_artifact"]["digest"]
    return selected[0], matches[0], recovery


def physical(args):
    validate_inputs()
    args.tier = "all"
    module.physical_host(args)


def prepare(args):
    validate_inputs()
    job, artifact, recovery = producer_artifact(args.backend)
    archive = ROOT / "candidate-pair.zip"
    with producer_environment():
        metadata = module.download(artifact["id"], artifact["digest"], RUN, HEAD, archive)
    with zipfile.ZipFile(archive) as bundle:
        pair_bytes = bundle.read("pair-receipt.json")
    pair = json.loads(pair_bytes)
    assert pair["sources"] == {"original": module.BASE, "fork": SOURCE}
    assert pair["producer_run"] == str(RUN) and pair["producer_head"] == HEAD
    if args.backend == "msvc":
        verify_recovered_pair(pair, pair_bytes, recovery)
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
               "msvc_recovery": recovery,
               "pair_receipt_sha256": hashlib.sha256(pair_bytes).hexdigest(),
               "producer_image_hashes": pair["image_hashes"], "parent_manifest_sha256": MAIN_SHA,
               "periodic_manifest_sha256": PERIODIC_SHA, "manifest_sha256": module.sha(manifest),
               "producer_runner_sha256": HELPER_SHA, "runner_sha256": EXTRA_HELPER_SHA,
               "extra_benchmark_source_sha256": EXTRA_SOURCE_SHA, "aux_driver_sha256": module.sha(Path(__file__)),
               "triplets": triplets, "controls": ["original", "enabled", "disabled"],
               "runtime_unchanged": True, "extra_uniform_diagnostics": False}
    module.write("periodic-receipt.json", receipt)
    observations = {}
    for tier in module.TIERS:
        args.tier = tier
        module.runtime_host(args)
        observations[tier] = json.loads((module.OUT / "runtime-attestation.json").read_text())
        shutil.copy2(module.OUT / "runtime-attestation.json", module.OUT / ("runtime-" + tier + ".json"))
        (module.OUT / "runtime-probe").rename(module.OUT / ("runtime-probe-" + tier))
    available = all(value["available"] for value in observations.values())
    module.write("periodic-runtime.json", {"available": available, "observations": observations})
    if not available:
        module.write("SKIPPED.json", {"available": False, "timed_records": 0, "backend": args.backend,
                                     "source": SOURCE, "observations": observations})
    module.output("available", str(available).lower())
    print("STRINGZILLA_PERIODIC_RECEIPT " + json.dumps(receipt, separators=(",", ":")), flush=True)


def character_c2_diagnostics(args):
    validate_inputs()
    assert not (module.OUT / "SKIPPED.json").exists()
    assert json.loads((module.OUT / "periodic-runtime.json").read_text())["available"]
    pair = json.loads((module.OUT / "periodic-receipt.json").read_text())
    for name in ("original", "fork"):
        assert module.helper().image((module.IMAGES / name).resolve())["tree_sha256"] == pair["producer_image_hashes"][name]["tree_sha256"]
    folder = module.OUT / "reverse-character-c2-diagnostics"
    folder.mkdir()
    copied = folder / CHAR_SOURCE.name
    shutil.copy2(CHAR_SOURCE, copied)
    assert module.sha(copied) == CHAR_SOURCE_SHA
    classes = folder / "classes"
    classes.mkdir()
    exe = ".exe" if os.name == "nt" else ""
    module.diagnostic_log([module.IMAGES / ("original/bin/javac" + exe), "-d", classes, copied], folder / "javac.log")
    files = [copied, *sorted(classes.rglob("*.class"))]
    fingerprints = {path.relative_to(folder).as_posix(): module.sha(path) for path in files}
    assert len(fingerprints) > 1
    receipt = {"source": SOURCE, "baseline": module.BASE, "backend": args.backend, "tier": "c2",
               "timing_evidence": False, "compiled_once_with": "original",
               "application_sha256": fingerprints, "affinity": module.helper().pin_cpu(), "runs": []}
    for control in ("original", "enabled", "disabled"):
        java = (module.IMAGES / (("original" if control == "original" else "fork") + "/bin/java" + exe)).resolve()
        flags = [*module.diagnostic_flags(args.backend, control, "c2"), "-Xbatch",
                 "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintCompilation", "-XX:+PrintInlining",
                 "-XX:+PrintFlagsFinal",
                 "-XX:CompileCommand=dontinline,StringZillaCharInlining::searchReverse",
                 "-XX:CompileCommand=print,java.lang.StringLatin1::lastIndexOf",
                 "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOf",
                 "-XX:CompileCommand=print,StringZillaCharInlining::searchReverse"]
        for coder in ("LATIN1", "UTF16"):
            log = folder / (control + "-" + coder + "-4096.log")
            record = module.diagnostic_log([java, *flags, "-cp", classes, "StringZillaCharInlining",
                                            "4096", "4095", coder, "reverse"], log)
            text = log.read_text(errors="replace")
            assert ("Reverse character-search compilation check passed: length=4096 from=4095 coder="
                    + coder + " expected=4092") in text
            assert "StringZillaCharInlining::searchReverse" in text
            inline_flags = {}
            for flag in ("FreqInlineSize", "MaxInlineSize", "C1MaxInlineSize"):
                match = re.search(r"(?m)^\s*(?:intx|uintx|int|uint)\s+" + flag + r"\s*:?=\s*(\d+)\b[^\n]*$", text)
                assert match, flag + " missing from actual image PrintFlagsFinal"
                inline_flags[flag] = {"value": int(match[1]), "raw": match[0].strip()}
            record.update({"control": control, "tier": "c2", "coder": coder, "length": 4096,
                           "position": "END", "fromIndex": 4095, "expected": 4092, "jvmArgs": flags,
                           "source": module.BASE if control == "original" else SOURCE,
                           "timing_evidence": False, "inline_flags": inline_flags,
                           "selected_lines": [line for line in text.splitlines() if re.search(
                               r"String::lastIndexOf|String(?:UTF16|Latin1)::lastIndexOf|StringZilla::(?:rfindChar|searchCharLarge|useCharUTF16)|StringZillaCharInlining::searchReverse", line)][-200:]})
            receipt["runs"].append(record)
            print("STRINGZILLA_AUX_REVERSE_CHAR_C2 " + json.dumps(record, separators=(",", ":")), flush=True)
    assert len(receipt["runs"]) == 6
    assert fingerprints == {path.relative_to(folder).as_posix(): module.sha(path) for path in files}
    assert {path for path in classes.rglob("*.class")} == {path for path in files if path.suffix == ".class"}
    assert module.sha(CHAR_SOURCE) == CHAR_SOURCE_SHA
    for name in ("original", "fork"):
        assert module.helper().image((module.IMAGES / name).resolve())["tree_sha256"] == pair["producer_image_hashes"][name]["tree_sha256"]
    module.write("reverse-character-c2-diagnostics.json", receipt)


def measure(args):
    validate_inputs()
    assert not (module.OUT / "SKIPPED.json").exists()
    assert json.loads((module.OUT / "periodic-runtime.json").read_text())["available"]
    receipt = json.loads((module.OUT / "periodic-receipt.json").read_text())
    assert module.sha(module.OUT / "shard-cases.tsv") == receipt["manifest_sha256"]
    assert not (module.OUT / "experiment.log").exists()
    for name in ("original", "fork"):
        assert module.helper().image((module.IMAGES / name).resolve())["tree_sha256"] == receipt["producer_image_hashes"][name]["tree_sha256"]
    values = [sys.executable, EXTRA_HELPER, "--original", module.IMAGES / "original", "--fork", module.IMAGES / "fork",
              "--original-source", ROOT / "baseline", "--fork-source", ROOT, "--output", module.OUT,
              "--backend", args.backend, "--manifest", module.OUT / "shard-cases.tsv",
              "--extra-benchmark-source", EXTRA_SOURCE]
    # The external fixture shares one original-javac compilation and classpath for all controls.
    # The extra helper preserves the two-fork protocol and 57 main diagnostics.
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
    module.write("periodic-complete.json", {"records": receipt["triplets"] * 3,
                                             "triplets": receipt["triplets"], "images_unchanged": True})


def collection(args):
    _, _, expected = validate_inputs()
    current_run, current_head = os.environ["GITHUB_RUN_ID"], os.environ["GITHUB_SHA"]
    artifacts = module.api("actions/runs/" + current_run + "/artifacts?per_page=100")["artifacts"]
    jobs = module.api("actions/runs/" + current_run + "/jobs?per_page=100&filter=all")["jobs"]
    entries, reverse_character_c2 = [], []
    for backend in module.BACKENDS:
        prefix = "stringzilla-periodic-controls-" + backend + "-" + current_head + "-attempt"
        matches = [artifact for artifact in artifacts if artifact["name"].startswith(prefix)]
        assert 1 <= len(matches) <= 2, "At most one unsupported-host retry is allowed"
        label = backend + " periodic controls"
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
                    module.unpack_files(archive, ["experiment.log", "shard-cases.tsv", "periodic-receipt.json",
                                                  "periodic-complete.json", "pair-receipt.json",
                                                  "reverse-character-c2-diagnostics.json"], folder)
                    diagnostics = json.loads((folder / "reverse-character-c2-diagnostics.json").read_text())
                    assert diagnostics["source"] == SOURCE and diagnostics["baseline"] == module.BASE
                    assert diagnostics["backend"] == backend and diagnostics["tier"] == "c2"
                    assert diagnostics["timing_evidence"] is False and diagnostics["compiled_once_with"] == "original"
                    assert len(diagnostics["runs"]) == 6
                    assert {(run["control"], run["coder"]) for run in diagnostics["runs"]} == {
                        (control, coder) for control in ("original", "enabled", "disabled") for coder in ("LATIN1", "UTF16")}
                    fingerprints = diagnostics["application_sha256"]
                    assert fingerprints["StringZillaCharInlining.java"] == CHAR_SOURCE_SHA
                    assert "classes/StringZillaCharInlining.class" in fingerprints
                    for path, digest in fingerprints.items():
                        assert hashlib.sha256(bundle.read("reverse-character-c2-diagnostics/" + path)).hexdigest() == digest
                    for run in diagnostics["runs"]:
                        assert run["timing_evidence"] is False and run["tier"] == "c2"
                        assert run["length"] == 4096 and run["expected"] == 4092 and run["fromIndex"] == 4095
                        assert run["source"] == (module.BASE if run["control"] == "original" else SOURCE)
                        assert hashlib.sha256(bundle.read(run["path"])).hexdigest() == run["sha256"]
                        assert set(run["inline_flags"]) == {"FreqInlineSize", "MaxInlineSize", "C1MaxInlineSize"}
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
        receipt = json.loads((folder / "periodic-receipt.json").read_text())
        job, artifact, recovery = producer_artifact(backend)
        assert receipt["producer_run"] == RUN and receipt["producer_head"] == HEAD
        assert receipt["msvc_recovery"] == recovery
        assert receipt["producer_job"]["id"] == job["id"] and receipt["artifact"]["id"] == artifact["id"]
        assert receipt["artifact"]["digest"] == artifact["digest"]
        assert receipt["source"] == SOURCE and receipt["baseline"] == module.BASE
        assert receipt["parent_manifest_sha256"] == MAIN_SHA and receipt["periodic_manifest_sha256"] == PERIODIC_SHA
        assert receipt["producer_runner_sha256"] == HELPER_SHA and receipt["runner_sha256"] == EXTRA_HELPER_SHA
        assert receipt["extra_benchmark_source_sha256"] == EXTRA_SOURCE_SHA and receipt["triplets"] == triplets
        assert receipt["aux_driver_sha256"] == module.sha(Path(__file__))
        assert receipt["runtime_unchanged"] is True and receipt["controls"] == ["original", "enabled", "disabled"]
        pair_bytes = (folder / "pair-receipt.json").read_bytes()
        pair = json.loads(pair_bytes)
        assert hashlib.sha256(pair_bytes).hexdigest() == receipt["pair_receipt_sha256"]
        assert pair["sources"] == {"original": module.BASE, "fork": SOURCE}
        assert pair["producer_run"] == str(RUN) and pair["producer_head"] == HEAD
        assert pair["helper_sha256"] == HELPER_SHA and pair["parent_manifest_sha256"] == MAIN_SHA
        assert pair["image_hashes"] == receipt["producer_image_hashes"]
        if backend == "msvc":
            verify_recovered_pair(pair, pair_bytes, recovery)
        complete = json.loads((folder / "periodic-complete.json").read_text())
        assert complete == {"records": triplets * 3, "triplets": triplets, "images_unchanged": True}
        reverse_character_c2.append({"backend": backend, "job": selected[0],
                                     "diagnostics": json.loads((folder / "reverse-character-c2-diagnostics.json").read_text())})
        entries.append({"backend": backend, "job": selected[0], "source": SOURCE, "base": module.BASE,
                        "manifest": text, "log_path": str(folder / "experiment.log"),
                        "expected": {"manifest_sha256": hashlib.sha256(text.encode()).hexdigest(),
                                     "runner_sha256": EXTRA_HELPER_SHA, "producer_image_hashes": receipt["producer_image_hashes"],
                                     "extra_benchmark_source_sha256": EXTRA_SOURCE_SHA}})
    module.write("collection-input.json", {"entries": entries, "expected_physical_keys": expected,
                                           "reverse_character_c2": reverse_character_c2, "msvc_recovery": recovery})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("physical", "prepare", "character-c2", "measure", "collection"))
    parser.add_argument("--backend", choices=tuple(module.BACKENDS))
    args = parser.parse_args()
    args.source = SOURCE
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    module.OUT.mkdir(exist_ok=True)
    {"physical": physical, "prepare": prepare, "character-c2": character_c2_diagnostics, "measure": measure, "collection": collection}[args.mode](args)
