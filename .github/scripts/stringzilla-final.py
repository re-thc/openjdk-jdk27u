#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Qualify one final source using matched complete images and the frozen measurement protocol."""

import argparse
import base64
import csv
import ctypes
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess
import sys
import tarfile
import zipfile

REPO = "re-thc/openjdk-jdk27u"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
QUALIFIED_RUN = 39164738566
QUALIFIED_HEAD = "8bd517316162bc8a638b8339da47ac9c36b40d1e"
RECOVERY_SKY_TIERS = ("interpreter", "c1", "c2")
OLD_RUN = 39073742791
OLD_HEAD = "9adc53b852aae7610a560e20034d6d777b5db9d3"
OLD_ARTIFACTS = {
    "msvc": {
        "job": 117516727687,
        "id": 12117585451,
        "name": "stringzilla-performance-images-msvc-9adc53b852aae7610a560e20034d6d777b5db9d3",
        "digest": "sha256:6e31e01a744f3aa25a6bb475d2e0ad2545cfe4ace417cc13b398c67951331316"
    },
    "neon": {
        "job": 117516727893,
        "id": 12118586766,
        "name": "stringzilla-performance-images-neon-9adc53b852aae7610a560e20034d6d777b5db9d3",
        "digest": "sha256:e344610459e10604f19cadcde2df2e6dcc97e184129c7f44ce219b27ad5661ae"
    },
    "serial": {
        "job": 117516727847,
        "id": 12118163827,
        "name": "stringzilla-performance-images-serial-9adc53b852aae7610a560e20034d6d777b5db9d3",
        "digest": "sha256:93d2fe194c762ce06e9323c1e90c33d4db5f9fb5d145a6f0ddf1f36a8ae6e0ca"
    },
    "avx2": {
        "job": 117516727905,
        "id": 12118664019,
        "name": "stringzilla-performance-images-avx2-9adc53b852aae7610a560e20034d6d777b5db9d3",
        "digest": "sha256:806f1f32d16b735fdd4dcc119e23854140afb70c26af8969b5c40ef6e540d1d8"
    }
}
ROOT = Path.cwd()
DRIVER = Path(__file__).resolve().parents[2]
OUT = ROOT / "perf-output"
IMAGES = ROOT / "perf-images"
ARCHIVES = ROOT / "perf-image-archives"
HELPER = ROOT / ".github/scripts/stringzilla-performance.py"
MANIFEST = DRIVER / ".github/scripts/stringzilla-final-cases.tsv"
FROZEN_HELPER_SHA256 = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
PERIODIC_MANIFEST = DRIVER / ".github/scripts/stringzilla-periodic-cases.tsv"
PERIODIC_HELPER = DRIVER / ".github/scripts/stringzilla-performance-extra.py"
PERIODIC_SOURCE = DRIVER / ".github/scripts/StringZillaPeriodicSearch.java"
PERIODIC_MANIFEST_SHA256 = "02e48d06c5d3fdec8fb897fdff26dc1e0b5231ad2001397cb0f08313048938c2"
PERIODIC_HELPER_SHA256 = "74ed5c71dd487e08d0ef017ead2f59172acbca9a7edad9b51ad976e54e80e532"
PERIODIC_SOURCE_SHA256 = "fead0e50103b20ca4bb1f3eeb47a71b1fc79f52fd91d0c7bb9007a502f7de44b"
UTF16_PROBE_MANIFEST = DRIVER / ".github/scripts/stringzilla-utf16-probe-cases.tsv"
UTF16_PROBE_SOURCE = DRIVER / ".github/scripts/StringZillaUTF16Probe.java"
UTF16_PROBE_COLLECTOR = DRIVER / ".github/scripts/stringzilla-utf16-probe-collector.js"
UTF16_PROBE_MANIFEST_SHA256 = "06dc833fa691489a1869628aa94715ab3b3ff4ba550b3b936d590c6dee4ef834"
UTF16_PROBE_SOURCE_SHA256 = "1ac9e865b12f3ecf87bef52789ade1a0709ddec569a896c0d4796c5583d6f1f7"
UTF16_PROBE_COLLECTOR_SHA256 = "9e32812135573ff1ea9ba202a3f41016bec7a0e3c2536e3d5890574e2fe8c23c"
TIERS = {"interpreter": ["-Xint"], "c1": ["-XX:TieredStopAtLevel=1"], "c2": ["-XX:-TieredCompilation"]}
BACKENDS = {"serial": (0, "0"), "avx2": (1, "2"), "neon": (4, None), "msvc": (0, "2"), "avx512": (2, "3")}


def command(args, **kwargs):
    return subprocess.check_output([str(x) for x in args], text=True, stderr=subprocess.STDOUT, **kwargs).strip()


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + "\n")


def output(name, value):
    with open(os.environ["GITHUB_OUTPUT"], "a") as stream:
        stream.write(name + "=" + str(value) + "\n")


def api(path):
    return json.loads(command(["gh", "api", "repos/" + REPO + "/" + path]))


def helper():
    spec = importlib.util.spec_from_file_location("performance", HELPER)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


def check_sources(source, baseline=True):
    assert sha(HELPER) == FROZEN_HELPER_SHA256, "The normal performance harness must remain frozen"
    assert re.fullmatch(r"[0-9a-f]{40}", source) and source != "0" * 40
    roots = [(ROOT, source)] + ([(ROOT / "baseline", BASE)] if baseline else [])
    result = {}
    for root, revision in roots:
        assert command(["git", "-C", root, "rev-parse", "HEAD"]) == revision
        command(["git", "-C", root, "diff", "--exit-code", "--", "src", "make", "test", "bin",
                 ".github/scripts/stringzilla-performance.py", "doc/stringzilla/native-cases.tsv"])
        result["original" if root.name == "baseline" else "fork"] = {
            "revision": revision,
            "runtime_trees": command(["git", "-C", root, "ls-tree", "HEAD", "--", "src", "make", "test", "bin"])}
    return result


def rows():
    with MANIFEST.open(newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        result, columns = list(reader), reader.fieldnames
    assert columns == ["id", "benchmark", "length", "coder", "position", "needleLength", "shape", "backends", "tiers"]
    assert result and len({row["id"] for row in result}) == len(result)
    for row in result:
        backends, tiers = row["backends"].split(","), row["tiers"].split(",")
        assert backends and len(set(backends)) == len(backends) and set(backends) <= {"serial", "avx2", "neon", "msvc"}
        assert tiers and len(set(tiers)) == len(tiers) and set(tiers) <= set(TIERS)
        assert re.fullmatch(r"StringZilla(?:Search|LongNeedle|TailSearch)\.[A-Za-z]+", row["benchmark"])
    return result, columns


def params(row):
    return {"length": row["length"], "needleLength": row["needleLength"],
            **({"shape": row["shape"]} if row["shape"] != "-" else
               {"coder": row["coder"], "position": row["position"]})}


def physical(backend, tier, benchmark, values):
    return json.dumps([backend, tier, benchmark, values], sort_keys=True, separators=(",", ":"))


def expected_keys(cases=None):
    if cases is None:
        cases, _ = rows()
    expected, counts = set(), {}
    for backend in BACKENDS:
        counts[backend] = {}
        for tier in TIERS:
            selected = [row for row in cases if ("avx2" if backend == "avx512" else backend) in
                        row["backends"].split(",") and tier in row["tiers"].split(",")]
            counts[backend][tier] = len(selected)
            for row in selected:
                key = physical(backend, tier, "org.openjdk.bench.java.lang." + row["benchmark"], params(row))
                assert key not in expected, "Duplicate physical configuration: " + row["id"]
                expected.add(key)
    assert len(expected) == sum(sum(values.values()) for values in counts.values())
    return sorted(expected), counts



def periodic_rows():
    for path, expected in ((PERIODIC_MANIFEST, PERIODIC_MANIFEST_SHA256),
                           (PERIODIC_HELPER, PERIODIC_HELPER_SHA256),
                           (PERIODIC_SOURCE, PERIODIC_SOURCE_SHA256)):
        assert sha(path) == expected, "The external periodic experiment must remain frozen: " + str(path)
    with PERIODIC_MANIFEST.open(newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        cases, columns = list(reader), reader.fieldnames
    assert columns == rows()[1] and len(cases) == 2 and len({row["id"] for row in cases}) == 2
    assert {(row["length"], row["needleLength"], row["shape"]) for row in cases} == {
        ("4095", "513", "LATIN_PERIOD3_ABC_MISS"), ("2047", "257", "UTF16_PERIOD3_ABC_MISS")}
    for row in cases:
        assert row["benchmark"] == "StringZillaPeriodicSearch.lastIndexOf"
        assert row["coder"] == row["position"] == "-"
        assert row["backends"] == "serial,avx2,neon,msvc" and row["tiers"] == "interpreter,c1,c2"
    return cases, columns


def periodic_projection(backend, tier):
    cases, columns = periodic_rows()
    alias = "avx2" if backend == "avx512" else backend
    selected = [dict(row, backends=alias, tiers=tier) for row in cases
                if alias in row["backends"].split(",") and tier in row["tiers"].split(",")]
    assert len(selected) == 2
    projected = io.StringIO(newline="")
    writer = csv.DictWriter(projected, fieldnames=columns, delimiter="\t", lineterminator="\n")
    writer.writeheader()
    writer.writerows(selected)
    return projected.getvalue()



def utf16_probe_rows():
    for path, expected in ((UTF16_PROBE_MANIFEST, UTF16_PROBE_MANIFEST_SHA256),
                           (UTF16_PROBE_SOURCE, UTF16_PROBE_SOURCE_SHA256),
                           (UTF16_PROBE_COLLECTOR, UTF16_PROBE_COLLECTOR_SHA256),
                           (PERIODIC_HELPER, PERIODIC_HELPER_SHA256)):
        assert sha(path) == expected, "The external UTF-16 probe must remain frozen: " + str(path)
    with UTF16_PROBE_MANIFEST.open(newline="") as stream:
        reader = csv.DictReader(stream, delimiter="\t")
        cases, columns = list(reader), reader.fieldnames
    assert columns == rows()[1] and len(cases) == 20 and len({row["id"] for row in cases}) == 20
    for row in cases:
        assert row["benchmark"] == "StringZillaUTF16Probe.lastIndexOf"
        assert row["coder"] == row["position"] == "-" and row["tiers"] == "c2"
        assert row["shape"] in ("PENULTIMATE_MISS", "NEAR_END_MISS")
        assert set(row["backends"].split(",")) <= {"serial", "neon", "msvc"}
    return cases, columns


def utf16_probe_projection(backend, tier):
    cases, columns = utf16_probe_rows()
    selected = [dict(row, backends=backend, tiers=tier) for row in cases
                if backend in row["backends"].split(",") and tier in row["tiers"].split(",")]
    projected = io.StringIO(newline="")
    writer = csv.DictWriter(projected, fieldnames=columns, delimiter="\t", lineterminator="\n")
    writer.writeheader()
    writer.writerows(selected)
    return projected.getvalue(), len(selected)


def require_previous_controls(expected):
    path = DRIVER / ".github/scripts/stringzilla-final-required-e036.json"
    assert sha(path) == "c8c130babfc745a5a81c2a2f9ef487535361f58bce1d4582c24621c0c0d31277", "The previously qualified control set must remain immutable"
    required = json.loads(path.read_text())
    assert required["schema"] == "stringzilla-required-qualified-controls-v1"
    assert required["source"] == "e036e637a5aff1e2506ff82953a3fbd9fdba6a9d" and required["baseline"] == BASE
    keys = required["physical_keys"]
    assert required["triplets"] == len(keys) == len(set(keys)) == 630
    assert set(keys) <= set(expected), "A previously measured input was omitted from final qualification"
    return sha(path)


def proof(source):
    check_sources(source, baseline=False)
    # The first 254 rows retain the complete qualified matrix and all single-candidate controls.
    baseline = b"\n".join(MANIFEST.read_bytes().splitlines()[:255]) + b"\n"
    assert hashlib.sha256(baseline).hexdigest() == "d9c83eae0f98b6b543c4e7f91803490200848532a74355ff6d4169ea6a016478"
    expected, counts = expected_keys()
    periodic_expected, periodic_counts = expected_keys(periodic_rows()[0])
    assert len(periodic_expected) == 30 and not set(expected).intersection(periodic_expected)
    probe_expected, probe_counts = expected_keys(utf16_probe_rows()[0])
    assert len(probe_expected) == 28 and not (set(expected) | set(periodic_expected)).intersection(probe_expected)
    required_hash = require_previous_controls(expected + periodic_expected + probe_expected)
    total_counts = {backend: {tier: counts[backend][tier] + periodic_counts[backend][tier] +
                                  probe_counts[backend][tier] for tier in TIERS} for backend in BACKENDS}
    receipt = {"source": source, "parent_manifest_sha256": sha(MANIFEST), "helper_sha256": sha(HELPER),
               "rows": len(rows()[0]), "triplets": len(expected), "records": len(expected) * 3,
               "max_shard_triplets": max(value for tiers in total_counts.values() for value in tiers.values()),
               "total_counts": total_counts,
               "counts": counts, "physical_keys": expected,
               "previous_controls_sha256": required_hash, "previous_controls": 630,
               "periodic": {"triplets": len(periodic_expected), "records": len(periodic_expected) * 3,
                            "counts": periodic_counts, "physical_keys": periodic_expected,
                            "manifest_sha256": PERIODIC_MANIFEST_SHA256,
                            "helper_sha256": PERIODIC_HELPER_SHA256, "source_sha256": PERIODIC_SOURCE_SHA256},
               "utf16_probe": {"triplets": len(probe_expected), "records": len(probe_expected) * 3,
                               "counts": probe_counts, "physical_keys": probe_expected,
                               "manifest_sha256": UTF16_PROBE_MANIFEST_SHA256,
                               "helper_sha256": PERIODIC_HELPER_SHA256,
                               "source_sha256": UTF16_PROBE_SOURCE_SHA256},
               "total_triplets": len(expected) + len(periodic_expected) + len(probe_expected),
               "total_records": (len(expected) + len(periodic_expected) + len(probe_expected)) * 3}
    write("matrix-proof.json", receipt)
    for name in ("parent_manifest_sha256", "helper_sha256"):
        output(name.replace("_", "-"), receipt[name])
    print("STRINGZILLA_MATRIX " + json.dumps({key: value for key, value in receipt.items() if key != "physical_keys"},
                                            separators=(",", ":")), flush=True)


def release(image, revision):
    match = re.search(r'^SOURCE="(.*)"$', (image / "release").read_text(), re.MULTILINE)
    assert match is not None, "Missing SOURCE field"
    if match[1]:
        top = re.search(r"(?:^|\s)\.:git:([0-9a-f]{12})(\+?)(?=\s|$)", match[1])
        assert top is not None and top[1] == revision[:12], match[1]
    else:
        assert os.name == "nt", "Linux image lacks embedded revision"
    return {"SOURCE": match[1], "embedded_revision_available": bool(match[1]), "expected_full_revision": revision}


def download(artifact_id, digest, run_id, head, destination):
    digest = digest if digest.startswith("sha256:") else "sha256:" + digest
    assert re.fullmatch(r"sha256:[0-9a-f]{64}", digest)
    metadata = api("actions/artifacts/" + str(artifact_id))
    assert metadata["id"] == int(artifact_id) and not metadata["expired"]
    assert metadata["digest"] == digest and metadata["workflow_run"]["id"] == int(run_id)
    assert metadata["workflow_run"]["head_sha"] == head
    with destination.open("wb") as stream:
        subprocess.run(["gh", "api", "repos/" + REPO + "/actions/artifacts/" + str(artifact_id) + "/zip"],
                       stdout=stream, check=True)
    assert "sha256:" + sha(destination) == digest
    return metadata


def unpack_files(archive, names, destination):
    destination.mkdir(exist_ok=True)
    with zipfile.ZipFile(archive) as bundle:
        for name in names:
            assert "/" not in name and "\\" not in name
            with bundle.open(name) as source, (destination / name).open("wb") as target:
                shutil.copyfileobj(source, target)


def unpack_image(control):
    archive = ARCHIVES / (control + "-jdk.tar.gz")
    digest = sha(archive)
    assert (ARCHIVES / (control + "-jdk.tar.gz.sha256")).read_text().split()[0] == digest
    with tarfile.open(archive, "r:gz") as bundle:
        assert all(member.name.split("/")[0] == control for member in bundle.getmembers())
        bundle.extractall(IMAGES, filter="data")
    shutil.copy2(ARCHIVES / (control + "-spec.gmk"), OUT / (control + "-spec.gmk"))
    return digest


def original(args):
    expected = OLD_ARTIFACTS[args.backend]
    job = api("actions/jobs/" + str(expected["job"]))
    run = api("actions/runs/" + str(OLD_RUN))
    assert run["head_sha"] == OLD_HEAD and job["run_id"] == OLD_RUN
    assert job["name"] == args.backend + " complete images"
    for name in ("Record sources and vendoring", "Retain both complete images before validation and timing"):
        assert next(step for step in job["steps"] if step["name"] == name)["conclusion"] == "success"
    workflow = api("contents/.github/workflows/stringzilla-performance.yml?ref=" + OLD_HEAD)
    assert "ref: " + BASE in base64.b64decode(workflow["content"]).decode()
    archive = ROOT / "old-images.zip"
    metadata = download(expected["id"], expected["digest"], OLD_RUN, OLD_HEAD, archive)
    assert metadata["name"] == expected["name"]
    IMAGES.mkdir()
    ARCHIVES.mkdir()
    # The historical fork is never extracted, copied or patched.
    unpack_files(archive, ["original-jdk.tar.gz", "original-jdk.tar.gz.sha256", "original-spec.gmk"], ARCHIVES)
    digest = unpack_image("original")
    inventory = helper().image((IMAGES / "original").resolve())
    write("original-inventory.json", inventory)
    write("original-reuse.json", {"producer_job": job, "artifact": metadata, "downloaded_zip_sha256": sha(archive),
          "original_tar_sha256": digest, "release": release(IMAGES / "original", BASE),
          "historical_fork_reused": False})
    archive.unlink()


def pair(args):
    module = helper()
    specs = {name: module.read_spec(OUT / (name + "-spec.gmk")) for name in ("original", "fork")}
    assert specs["original"] == specs["fork"], specs
    spec = specs["fork"]
    assert spec["DEBUG_LEVEL"] == "release" and spec["SOURCE_DATE"] == "1792195200"
    assert spec["VERSION_OPT"] == "stringzilla-benchmark"
    assert spec["TOOLCHAIN_TYPE"] == ("microsoft" if args.backend == "msvc" else "gcc")
    for name in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"):
        assert re.match(r"19\.44\." if args.backend == "msvc" else r"16\.", spec[name])
    if args.backend == "msvc":
        assert spec["TOOLCHAIN_VERSION"] == "2026"
    inventories = {name: module.image((IMAGES / name).resolve()) for name in ("original", "fork")}
    assert inventories["original"] == json.loads((OUT / "original-inventory.json").read_text())
    assert inventories["original"]["tree_sha256"] != inventories["fork"]["tree_sha256"]
    assert sha(MANIFEST) == args.parent_manifest_hash and sha(HELPER) == args.helper_hash
    shutil.copy2(OUT / "fork-spec.gmk", ARCHIVES / "fork-spec.gmk")
    archive = ARCHIVES / "fork-jdk.tar.gz"
    with tarfile.open(archive, "w:gz") as bundle:
        bundle.add(IMAGES / "fork", arcname="fork")
    (ARCHIVES / "fork-jdk.tar.gz.sha256").write_text(sha(archive) + "  fork-jdk.tar.gz\n")
    receipt = {"sources": {"original": BASE, "fork": args.source}, "source_trees": check_sources(args.source),
               "backend": args.backend, "spec": spec, "helper_sha256": sha(HELPER),
               "parent_manifest_sha256": sha(MANIFEST),
               "image_hashes": {name: {"tree_sha256": value["tree_sha256"]} for name, value in inventories.items()},
               "release": {name: release(IMAGES / name, BASE if name == "original" else args.source) for name in inventories},
               "producer_run": os.environ["GITHUB_RUN_ID"], "producer_head": os.environ["GITHUB_SHA"],
               "original_reuse": json.loads((OUT / "original-reuse.json").read_text())}
    write("pair-receipt.json", receipt)
    write("pair-inventories.json", inventories)
    for name in ("pair-receipt.json", "pair-inventories.json"):
        shutil.copy2(OUT / name, ARCHIVES / name)
    for name in ("original", "fork"):
        output(name + "-image-hash", receipt["image_hashes"][name]["tree_sha256"])


def run_log(args, path, env=None, cwd=None):
    with path.open("w") as log:
        completed = subprocess.run([str(value) for value in args], stdout=log, stderr=subprocess.STDOUT,
                                   env=env, cwd=cwd)
    print(path.read_text(errors="replace"), flush=True)
    assert completed.returncode == 0, str(path)


def jtreg(tests, suffix, native=None):
    args = [IMAGES / "fork/bin" / ("java.exe" if os.name == "nt" else "java"), "-jar",
            ROOT / "jtreg/installed/lib/jtreg.jar", "-jdk:" + str((IMAGES / "fork").resolve()),
            "-w:" + str(OUT / (suffix + "-work")), "-r:" + str(OUT / (suffix + "-report")),
            "-javaoption:-XX:ActiveProcessorCount=2", "-verbose:summary"]
    if native:
        args.append("-nativepath:" + str(native))
    run_log([*args, *tests], OUT / (suffix + ".log"))


def native():
    folder = (OUT / "native-validation").resolve()
    folder.mkdir()
    includes = [ROOT, ROOT / "src/java.base/share/native/libjava",
                ROOT / "src/java.base/share/native/libjava/stringzilla",
                ROOT / "src/hotspot/share/include", IMAGES / "fork/include"]
    if os.name == "nt":
        includes += [ROOT / "src/hotspot/os/windows/include", IMAGES / "fork/include/win32"]
        args = ["cl.exe", "/nologo", "/std:c11", "/O2", "/utf-8", "/LD",
                *["/I" + str(path.resolve()) for path in includes],
                str(ROOT / "test/jdk/java/lang/String/libStringZillaKernelsTest.c"),
                "/Fo" + str(folder / "kernels.obj"), "/Fe" + str(folder / "StringZillaKernelsTest.dll")]
        quote = lambda values: " ".join('"' + str(value) + '"' for value in values)
        batch = folder / "build.cmd"
        batch.write_text('@echo off\ncall "C:\\Program Files\\Microsoft Visual Studio\\18\\Enterprise\\vc\\auxiliary\\build\\vcvars64.bat" -vcvars_ver=14.44\n'
                         'if errorlevel 1 exit /b %errorlevel%\n' + quote(args) +
                         '\nif errorlevel 1 exit /b %errorlevel%\n')
        env = os.environ.copy()
        env.pop("CL", None)
        env.pop("_CL_", None)
        run_log(["cmd.exe", "/d", "/c", batch.name], folder / "build.log", env, cwd=folder)
        jtreg(["test/jdk/java/lang/String/StringZillaKernelsTest.java"], "jtreg-native", folder)
    else:
        includes += [ROOT / "src/hotspot/os/posix/include", IMAGES / "fork/include/linux"]
        source = folder / "driver.c"
        source.write_text('#include "test/jdk/java/lang/String/libStringZillaKernelsTest.c"\n#include <stdio.h>\n'
                          'int main(void) { for (jint mask=0; mask<8; mask++) { requested_capabilities=mask; test_initialize(); '
                          'printf("requested=%d selected=%d executable=%d\\n",mask,published->capabilities,can_execute(published->capabilities)); } '
                          'int failure=check_kernels(); if(failure) fprintf(stderr,"Native failure line %d\\n",failure); return failure?1:0; }\n')
        binary = folder / "native-sanitizers"
        args = ["gcc-16", "-std=c11", "-O2", "-g", "-fno-omit-frame-pointer",
                "-fsanitize=address,undefined,alignment", "-fno-sanitize-recover=all", "-Wno-unknown-pragmas",
                *["-I" + str(path.resolve()) for path in includes], source, "-o", binary]
        run_log(args, folder / "build.log")
        env = {**os.environ, "ASAN_OPTIONS": "abort_on_error=1:detect_leaks=1:strict_string_checks=1",
               "UBSAN_OPTIONS": "halt_on_error=1:print_stacktrace=1"}
        run_log([binary], folder / "run.log", env)
    write("native-validation.json", {"passed": True})


def diagnostic_log(values, path, timeout=180):
    with path.open("w") as log:
        completed = subprocess.run([str(value) for value in values], stdout=log,
                                   stderr=subprocess.STDOUT, timeout=timeout)
    if completed.returncode:
        print(path.read_text(errors="replace")[-12000:], flush=True)
    assert completed.returncode == 0, str(path)
    return {"path": path.relative_to(OUT).as_posix(), "sha256": sha(path),
            "command": [str(value) for value in values], "returncode": completed.returncode}


def diagnostic_flags(backend, control, tier):
    _, avx = BACKENDS[backend]
    return ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off",
            *([] if avx is None else ["-XX:UseAVX=" + avx]), *TIERS[tier],
            *([] if control == "original" else
              ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics"])]


def character_diagnostics(args):
    folder = OUT / "character-diagnostics"
    folder.mkdir()
    source = DRIVER / ".github/scripts/StringZillaCharInlining.java"
    assert sha(source) == "add8823a1e3d31406cc200c22d935989041ab726ed02018c34456b8d4d172563"
    copied = folder / source.name
    shutil.copy2(source, copied)
    classes = folder / "classes"
    classes.mkdir()
    exe = ".exe" if os.name == "nt" else ""
    diagnostic_log([IMAGES / ("original/bin/javac" + exe), "-d", classes, copied], folder / "javac.log")
    fingerprints = {path.relative_to(folder).as_posix(): sha(path)
                    for path in [copied, *sorted(classes.rglob("*.class"))]}
    assert len(fingerprints) > 1
    receipt = {"source": args.source, "baseline": BASE, "backend": args.backend,
               "timing_evidence": False, "affinity": helper().pin_cpu(),
               "compiled_once_with": "original", "application_sha256": fingerprints, "javap": {}, "runs": [],
               "reverse_runs": []}
    for name in ("original", "fork"):
        for klass in ("StringLatin1", "StringUTF16"):
            log = folder / (name + "-" + klass + ".javap.log")
            record = diagnostic_log([IMAGES / (name + "/bin/javap" + exe), "-sysinfo", "-c", "-p",
                                     "java.lang." + klass], log)
            text = log.read_text(errors="replace")
            match = re.search(r"(?ms)^  (?:private|static|public|protected)[^\n]*\bindexOfChar0\([^\n]*\n.*?(?=^  (?:private|static|public|protected)|\Z)", text)
            record["indexOfChar0_bytecode"] = match[0] if match else ""
            match = re.search(r"(?ms)^  (?:private|static|public|protected)[^\n]*\blastIndexOf\(byte\[\], int, int\);[^\n]*\n.*?(?=^  (?:private|static|public|protected)|\Z)", text)
            assert match, name + "/" + klass + " reverse character bytecode missing"
            record["lastIndexOfChar_bytecode"] = match[0]
            receipt["javap"][name + "/" + klass] = record
            print("STRINGZILLA_AUX_CHAR_JAVAP " + json.dumps({"image": name, "class": klass, **record}, separators=(",", ":")), flush=True)
    for control in ("original", "enabled", "disabled"):
        java = (IMAGES / (("original" if control == "original" else "fork") + "/bin/java" + exe)).resolve()
        flags = [*diagnostic_flags(args.backend, control, "c1"), "-Xbatch",
                 "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintCompilation", "-XX:+PrintInlining",
                 "-XX:CompileCommand=dontinline,StringZillaCharInlining::search",
                 "-XX:CompileCommand=print,java.lang.StringLatin1::indexOfChar0",
                 "-XX:CompileCommand=print,java.lang.StringUTF16::indexOfChar0",
                 "-XX:CompileCommand=print,StringZillaCharInlining::search"]
        for coder, lengths in (("UTF16", (128, 129, 257)), ("LATIN1", (255, 256, 257))):
            for length in lengths:
                log = folder / (control + "-" + coder + "-" + str(length) + ".log")
                record = diagnostic_log([java, *flags, "-cp", classes, "StringZillaCharInlining",
                                         str(length), "0", coder], log)
                text = log.read_text(errors="replace")
                assert "Character-search compilation check passed: length=" + str(length) + " from=0" in text
                record.update({"control": control, "tier": "c1", "coder": coder, "length": length, "jvmArgs": flags,
                               "source": BASE if control == "original" else args.source, "timing_evidence": False,
                               "selected_lines": [line for line in text.splitlines() if re.search(
                                   r"String(?:UTF16|Latin1)::(?:indexOfChar0|indexOf)|StringZilla::indexOfChar|StringZillaCharInlining::search", line)][-100:]})
                receipt["runs"].append(record)
                print("STRINGZILLA_AUX_CHAR_COMPILATION " + json.dumps(record, separators=(",", ":")), flush=True)
    for control in ("original", "enabled", "disabled"):
        java = (IMAGES / (("original" if control == "original" else "fork") + "/bin/java" + exe)).resolve()
        flags = [*diagnostic_flags(args.backend, control, "c1"), "-Xbatch",
                 "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintCompilation", "-XX:+PrintInlining",
                 "-XX:CompileCommand=dontinline,StringZillaCharInlining::searchReverse",
                 "-XX:CompileCommand=print,java.lang.StringLatin1::lastIndexOf",
                 "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOf",
                 "-XX:CompileCommand=print,StringZillaCharInlining::searchReverse"]
        for coder, lengths in (("UTF16", (127, 128, 129, 255, 256, 257, 4096)),
                               ("LATIN1", (255, 256, 257, 4096))):
            for length in lengths:
                from_index = length - 1
                expected = length - 4
                log = folder / (control + "-reverse-" + coder + "-" + str(length) + ".log")
                record = diagnostic_log([java, *flags, "-cp", classes, "StringZillaCharInlining",
                                         str(length), str(from_index), coder, "reverse"], log)
                text = log.read_text(errors="replace")
                assert ("Reverse character-search compilation check passed: length=" + str(length)
                        + " from=" + str(from_index) + " coder=" + coder + " expected=" + str(expected)) in text
                assert "StringZillaCharInlining::searchReverse" in text
                record.update({"control": control, "tier": "c1", "direction": "reverse", "coder": coder,
                               "length": length, "fromIndex": from_index, "expected": expected, "jvmArgs": flags,
                               "source": BASE if control == "original" else args.source, "timing_evidence": False,
                               "selected_lines": [line for line in text.splitlines() if re.search(
                                   r"String(?:UTF16|Latin1)::lastIndexOf|StringZilla::(?:rfindChar|searchCharLarge|useCharUTF16)|StringZillaCharInlining::searchReverse", line)][-100:]})
                receipt["reverse_runs"].append(record)
                print("STRINGZILLA_AUX_CHAR_REVERSE_COMPILATION " + json.dumps(record, separators=(",", ":")), flush=True)
    assert len(receipt["runs"]) == 18 and len(receipt["reverse_runs"]) == 33
    assert fingerprints == {path.relative_to(folder).as_posix(): sha(path)
                            for path in [copied, *sorted(classes.rglob("*.class"))]}
    write("character-diagnostics.json", receipt)


def uniform_diagnostics(args):
    if args.tier != "c2":
        return
    folder = OUT / "uniform-diagnostics"
    folder.mkdir()
    classes = OUT / "classes"
    jars = [OUT / "jmh" / name for name in
            ("jmh-core-1.37.jar", "jopt-simple-5.0.4.jar", "commons-math3-3.6.1.jar")]
    assert classes.is_dir() and all(path.is_file() for path in jars)
    files = [*sorted(classes.rglob("*")), *sorted((OUT / "jmh").glob("*.jar"))]
    fingerprints = {path.relative_to(OUT).as_posix(): sha(path) for path in files if path.is_file()}
    assert fingerprints
    classpath = os.pathsep.join(str(path.resolve()) for path in [classes, *jars])
    affinity = helper().pin_cpu()
    exe = ".exe" if os.name == "nt" else ""
    receipt = {"source": args.source, "baseline": BASE, "backend": args.backend, "tier": args.tier,
               "timing_evidence": False, "affinity": affinity, "harness_sha256": fingerprints, "runs": []}
    for control in ("original", "enabled", "disabled"):
        java = (IMAGES / (("original" if control == "original" else "fork") + "/bin/java" + exe)).resolve()
        base = diagnostic_flags(args.backend, control, "c2")
        flags = [*base, "-Xbatch", "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintCompilation", "-XX:+PrintInlining",
                 "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOf",
                 "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOfJava",
                 "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaTailSearch_lastIndexOf_jmhTest::lastIndexOf_avgt_jmhStub"]
        for length in (129, 130):
            log = folder / (control + "-" + str(length) + ".log")
            record = diagnostic_log([java, *base, "-cp", classpath, "org.openjdk.jmh.Main",
                r"org.openjdk.bench.java.lang.StringZillaTailSearch.lastIndexOf$", "-p", "length=" + str(length),
                "-p", "needleLength=129", "-p", "shape=UTF16_UNIFORM_END",
                "-f", "1", "-wi", "1", "-w", "500ms", "-i", "1", "-r", "500ms", "-foe", "true",
                "-jvm", java, "-jvmArgs", " ".join(flags)], log)
            text = log.read_text(errors="replace")
            record.update({"control": control, "source": BASE if control == "original" else args.source,
                "tier": "c2", "params": {"length": str(length), "needleLength": "129", "shape": "UTF16_UNIFORM_END"},
                "jvmArgs": flags, "timing_evidence": False,
                "printed_methods": re.findall(r"(?m)^Compiled method.*$", text),
                "machine_code": re.findall(r"\[MachCode\][\s\S]*?\[/MachCode\]", text),
                "selected_lines": [line for line in text.splitlines() if re.search(
                    r"StringUTF16::lastIndexOf|StringZillaTailSearch.*::", line)][-100:]})
            receipt["runs"].append(record)
            print("STRINGZILLA_AUX_UNIFORM_COMPILATION " + json.dumps(record, separators=(",", ":")), flush=True)
    assert fingerprints == {path.relative_to(OUT).as_posix(): sha(path) for path in files if path.is_file()}
    write("uniform-diagnostics.json", receipt)



def positive_search_diagnostics(args):
    if args.tier != "c2":
        return
    folder = OUT / "positive-search-diagnostics"
    folder.mkdir()
    classes = OUT / "classes"
    jars = [OUT / "jmh" / name for name in
            ("jmh-core-1.37.jar", "jopt-simple-5.0.4.jar", "commons-math3-3.6.1.jar")]
    assert classes.is_dir() and all(path.is_file() for path in jars)
    files = [*sorted(classes.rglob("*")), *sorted((OUT / "jmh").glob("*.jar"))]
    fingerprints = {path.relative_to(OUT).as_posix(): sha(path) for path in files if path.is_file()}
    assert fingerprints
    classpath = os.pathsep.join(str(path.resolve()) for path in [classes, *jars])
    affinity = helper().pin_cpu()
    exe = ".exe" if os.name == "nt" else ""
    receipt = {"source": args.source, "baseline": BASE, "backend": args.backend, "tier": args.tier,
               "timing_evidence": False, "affinity": affinity, "harness_sha256": fingerprints, "runs": []}
    cases = (("utf16-4096-64-end", "4096", "64", "UTF16"),
             ("latin1-4096-4-end", "4096", "4", "LATIN1"),
             ("utf16-127-4-end", "127", "4", "UTF16"))
    for control in ("original", "enabled", "disabled"):
        java = (IMAGES / (("original" if control == "original" else "fork") + "/bin/java" + exe)).resolve()
        base = diagnostic_flags(args.backend, control, "c2")
        flags = [*base, "-Xbatch", "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintCompilation", "-XX:+PrintInlining",
                 "-XX:+PrintFlagsFinal", "-XX:CompileCommand=print,java.lang.String::lastIndexOf",
                 "-XX:CompileCommand=print,java.lang.StringLatin1::lastIndexOf",
                 "-XX:CompileCommand=print,java.lang.StringZilla::lastIndexOfLatin1JavaC2",
                 "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOf",
                 "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOfJava",
                 "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaSearch_lastIndexOf_jmhTest::lastIndexOf_avgt_jmhStub"]
        for case, length, count, coder in cases:
            log = folder / (control + "-" + case + ".log")
            record = diagnostic_log([java, *base, "-cp", classpath, "org.openjdk.jmh.Main",
                r"org.openjdk.bench.java.lang.StringZillaSearch.lastIndexOf$", "-p", "length=" + length,
                "-p", "needleLength=" + count, "-p", "coder=" + coder, "-p", "position=END",
                "-f", "1", "-wi", "1", "-w", "500ms", "-i", "1", "-r", "500ms", "-foe", "true",
                "-jvm", java, "-jvmArgs", " ".join(flags)], log)
            text = log.read_text(errors="replace")
            record.update({"control": control, "source": BASE if control == "original" else args.source,
                "case": case, "tier": "c2", "params": {"length": length, "needleLength": count, "coder": coder, "position": "END"},
                "jvmArgs": flags, "timing_evidence": False,
                "printed_methods": re.findall(r"(?m)^Compiled method.*$", text),
                "machine_code": re.findall(r"\[MachCode\][\s\S]*?\[/MachCode\]", text),
                "selected_lines": [line for line in text.splitlines() if re.search(
                    r"String(?:UTF16|Latin1)?::lastIndexOf|StringZilla::(?:matchesUTF16C2|lastIndexOf)|ArraysSupport::(?:mismatch|vectorizedMismatch)|StringZillaSearch.*::|(?:FreqInlineSize|MaxInlineSize|C1MaxInlineSize)\s*=", line)][-100:]})
            receipt["runs"].append(record)
            print("STRINGZILLA_AUX_POSITIVE_SEARCH_COMPILATION " + json.dumps(record, separators=(",", ":")), flush=True)
    assert len(receipt["runs"]) == 9
    assert fingerprints == {path.relative_to(OUT).as_posix(): sha(path) for path in files if path.is_file()}
    write("positive-search-diagnostics.json", receipt)



def forced_jni_validation(args):
    folder = OUT / "forced-jni-validation"
    folder.mkdir()
    classes = folder / "classes"
    classes.mkdir()
    source = ROOT / "test/jdk/java/lang/String/StringZillaBounded.java"
    exe = ".exe" if os.name == "nt" else ""
    run_log([IMAGES / ("original/bin/javac" + exe), "-d", classes, source], folder / "javac.log")
    fingerprints = {str(source): sha(source), **{
        path.relative_to(folder).as_posix(): sha(path) for path in sorted(classes.rglob("*.class"))}}
    disabled = ("_stringzillaEqualsRange,_stringzillaFindLatin1,_stringzillaFindUTF16,"
                "_stringzillaRfindLatin1,_stringzillaRfindUTF16,_stringzillaFindUTF16Latin1,"
                "_stringzillaRfindUTF16Latin1,_stringzillaFindCharLatin1,_stringzillaFindCharUTF16,"
                "_stringzillaRfindCharLatin1,_stringzillaRfindCharUTF16,"
                "_indexOfL,_indexOfU,_indexOfUL,_indexOfIL,_indexOfIU,_indexOfIUL,"
                "_indexOfL_char,_indexOfU_char,_equalsL")
    runs = []
    for avx in ((None,) if args.backend == "neon" else ("0", "2")):
        for tier, flags in TIERS.items():
            values = [IMAGES / ("fork/bin/java" + exe), "-XX:ActiveProcessorCount=2",
                      "-XX:+UnlockDiagnosticVMOptions", "-XX:+UseStringZillaIntrinsics",
                      "-Xlog:jni+resolve=debug", "-XX:DisableIntrinsic=" + disabled,
                      *([] if avx is None else ["-XX:UseAVX=" + avx]), *flags,
                      "-Xbatch", "-cp", classes, "StringZillaBounded", "overlaps"]
            log = folder / (tier + "-avx" + (avx or "arm") + ".log")
            run_log(values, log)
            resolutions = [line for line in log.read_text(errors="replace").splitlines()
                           if re.search(r"java\.lang\.StringZilla(?:::|\.)(?:find|rfind|equalsRange)", line)]
            assert resolutions, "Forced-JNI validation must actually resolve a StringZilla search method"
            runs.append({"tier": tier, "UseAVX": avx, "command": [str(value) for value in values],
                         "log": log.relative_to(OUT).as_posix(), "sha256": sha(log),
                         "native_search_resolutions": resolutions})
    write("forced-jni-validation.json", {"source": args.source, "backend": args.backend,
          "compiled_once_with": "original", "application_sha256": fingerprints, "runs": runs, "passed": True})


def validate(args):
    inventories = json.loads((OUT / "pair-inventories.json").read_text())
    for name in ("original", "fork"):
        if os.name == "nt":
            values = ["C:/msys64/usr/bin/bash.exe",
                      (ROOT / ".github/scripts/check-dev-profile.sh").resolve().as_posix(),
                      (IMAGES / name).resolve().as_posix(),
                      (OUT / (name + "-spec.gmk")).resolve().as_posix()]
        else:
            values = ["bash", ROOT / ".github/scripts/check-dev-profile.sh", IMAGES / name,
                      OUT / (name + "-spec.gmk")]
        run_log(values, OUT / (name + "-profile.log"))
    native()
    forced_jni_validation(args)
    jtreg(["test/jdk/java/lang/String/StringZillaSearch.java",
           "test/jdk/java/lang/String/StringZillaBounded.java"], "jtreg-smoke")
    jtreg(["test/hotspot/jtreg/compiler/intrinsics/string/TestStringZillaUTF16Bounds.java",
           "test/hotspot/jtreg/compiler/intrinsics/string/TestStringZillaDispatch.java"], "jtreg-dispatch")
    character_diagnostics(args)
    for name in ("original", "fork"):
        assert helper().image((IMAGES / name).resolve()) == inventories[name], "Validation changed an archived image"


def physical_host(args):
    machine = platform.machine().lower()
    if os.name == "nt":
        available = args.backend == "msvc" and machine in ("amd64", "x86_64") and bool(
            ctypes.WinDLL("kernel32").IsProcessorFeaturePresent(40))
        details = {"avx2_available": available, "cpu": command(["powershell", "-NoProfile", "-Command",
            "Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors | ConvertTo-Json -Compress"])}
    else:
        cpu = min(os.sched_getaffinity(0))
        blocks = Path("/proc/cpuinfo").read_text().strip().split("\n\n")
        fields = next({key.strip(): value.strip() for key, value in (line.split(":", 1) for line in block.splitlines() if ":" in line)}
                      for block in blocks if re.search(r"(?m)^processor\s*:\s*" + str(cpu) + r"\s*$", block))
        flags = set(fields.get("flags", fields.get("Features", "")).split())
        if args.backend == "neon":
            missing = sorted({"asimd", "atomics", "crc32", "asimdrdm"} - flags)
            available = machine in ("arm64", "aarch64") and not missing
        else:
            required = {"avx", "avx2", "bmi1", "bmi2", "f16c", "fma", "movbe", "popcnt", "sse4_1", "sse4_2", "ssse3", "cx16"}
            if args.backend == "avx512":
                required |= {"avx512f", "avx512bw", "avx512vl"}
            missing = sorted(required - flags)
            if not flags.intersection({"abm", "lzcnt"}):
                missing.append("lzcnt/abm")
            available = machine in ("amd64", "x86_64") and not missing
        details = {"cpu": cpu, "fields": fields, "missing": missing}
    receipt = {"available": available, "backend": args.backend, "tier": args.tier,
               "source": args.source, "machine": machine, "physical": details, "timed_records": 0}
    write("physical-host.json", receipt)
    if not available:
        write("SKIPPED.json", receipt)
    output("available", str(available).lower())


def sky_election(tier):
    os.environ["TIER"] = tier
    path = DRIVER / ".github/scripts/stringzilla-final-sky-election.py"
    spec = importlib.util.spec_from_file_location("final_sky_election_" + tier, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def single_sky():
    path = DRIVER / ".github/scripts/stringzilla-single-sky.py"
    spec = importlib.util.spec_from_file_location("single_sky_authorization", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sky_authorization(tier, phase):
    mode = os.environ.get("STRINGZILLA_SKY_AUTHORIZATION", "allfour-v1")
    if mode == "allfour-v1":
        module = sky_election(tier)
        return module.verify_saved(module.FOLDER)
    assert mode == "single-host-v1", "Unknown SKY authorization mode"
    return single_sky().verify_saved(tier, phase, OUT)


def restore(args):
    if args.backend == "avx512":
        sky_authorization(args.tier, "restore")
    producer = "avx2" if args.backend == "avx512" else args.backend
    archive = ROOT / "candidate-pair.zip"
    metadata = download(args.artifact_id, args.artifact_digest, QUALIFIED_RUN,
                        QUALIFIED_HEAD, archive)
    assert metadata["name"] == "stringzilla-final-pair-" + producer + "-" + QUALIFIED_HEAD
    ARCHIVES.mkdir()
    IMAGES.mkdir()
    names = ["pair-receipt.json", "pair-inventories.json"] + [
        control + suffix for control in ("original", "fork") for suffix in ("-jdk.tar.gz", "-jdk.tar.gz.sha256", "-spec.gmk")]
    unpack_files(archive, names, ARCHIVES)
    receipt = json.loads((ARCHIVES / "pair-receipt.json").read_text())
    assert receipt["sources"] == {"original": BASE, "fork": args.source} and receipt["backend"] == producer
    assert receipt["producer_head"] == QUALIFIED_HEAD and receipt["producer_run"] == str(QUALIFIED_RUN)
    assert receipt["source_trees"] == check_sources(args.source)
    assert receipt["helper_sha256"] == sha(HELPER) == args.helper_hash
    assert receipt["parent_manifest_sha256"] == sha(MANIFEST) == args.parent_manifest_hash
    inventories = json.loads((ARCHIVES / "pair-inventories.json").read_text())
    for control, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert receipt["image_hashes"][control]["tree_sha256"] == expected_hash
        unpack_image(control)
        actual = helper().image((IMAGES / control).resolve())
        assert actual["tree_sha256"] == expected_hash and actual["files"] == inventories[control]["files"]
        assert release(IMAGES / control, BASE if control == "original" else args.source) == receipt["release"][control]
    specs = [helper().read_spec(OUT / (name + "-spec.gmk")) for name in ("original", "fork")]
    assert specs[0] == specs[1] == receipt["spec"]
    shutil.copy2(ARCHIVES / "pair-receipt.json", OUT / "pair-receipt.json")
    write("artifact-reuse.json", {"artifact": metadata, "downloaded_zip_sha256": sha(archive),
                                "sources": receipt["sources"], "image_hashes": receipt["image_hashes"]})
    archive.unlink()
    cases, columns = rows()
    selected = [dict(row, backends=producer, tiers=args.tier) for row in cases if producer in
                row["backends"].split(",") and args.tier in row["tiers"].split(",")]
    assert selected
    manifest = OUT / "shard-cases.tsv"
    with manifest.open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=columns, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(selected)
    write("shard-receipt.json", {"backend": args.backend, "tier": args.tier, "source": args.source,
          "manifest_sha256": sha(manifest), "runner_sha256": sha(HELPER), "parent_manifest_sha256": sha(MANIFEST),
          "triplets": len(selected), "producer_image_hashes": receipt["image_hashes"]})


def runtime_host(args):
    folder = OUT / "runtime-probe"
    folder.mkdir()
    source = folder / "RuntimeProbe.java"
    source.write_text("""public class RuntimeProbe {
    public static void main(String[] args) throws Exception {
        String avx = args[1].equals("arm") ? "arm" : java.lang.management.ManagementFactory
            .getPlatformMXBean(com.sun.management.HotSpotDiagnosticMXBean.class).getVMOption("UseAVX").getValue();
        if (args[0].equals("original")) { System.out.println(avx); return; }
        Class<?> type = Class.forName("java.lang.StringZilla");
        var backend = type.getDeclaredField("BACKEND"); var enabled = type.getDeclaredField("ENABLED");
        backend.setAccessible(true); enabled.setAccessible(true);
        System.out.println(avx + ":" + backend.getInt(null) + ":" + enabled.getBoolean(null));
    }
}
""")
    exe = ".exe" if os.name == "nt" else ""
    command([IMAGES / ("original/bin/javac" + exe), "-d", folder, source])
    observations = {}
    selected, avx = BACKENDS[args.backend]
    for control in ("original", "enabled", "disabled"):
        flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off",
                 *([] if avx is None else ["-XX:UseAVX=" + avx]), *TIERS[args.tier]]
        if control != "original":
            flags += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics",
                      "--add-opens=java.base/java.lang=ALL-UNNAMED"]
        completed = subprocess.run([str(IMAGES / (("original" if control == "original" else "fork") + "/bin/java" + exe)),
            *flags, "-cp", str(folder), "RuntimeProbe", control, avx or "arm"],
            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        (folder / (control + ".log")).write_text(completed.stdout)
        expected = avx or "arm"
        if control != "original":
            expected += ":" + str(selected) + ":" + str(control == "enabled").lower()
        actual = completed.stdout.strip().splitlines()[-1] if completed.stdout.strip() else ""
        observations[control] = {"actual": actual, "expected": expected, "returncode": completed.returncode, "jvmArgs": flags}
    available = all(value["returncode"] == 0 and value["actual"] == value["expected"] for value in observations.values())
    receipt = {"available": available, "backend": args.backend, "tier": args.tier, "source": args.source,
               "observations": observations, "timed_records": 0}
    write("runtime-attestation.json", receipt)
    if not available:
        write("SKIPPED.json", receipt)
    output("available", str(available).lower())


def measure(args):
    if args.backend == "avx512":
        sky_authorization(args.tier, "measure")
    receipt = json.loads((OUT / "shard-receipt.json").read_text())
    assert sha(OUT / "shard-cases.tsv") == receipt["manifest_sha256"] and sha(HELPER) == args.helper_hash
    for name, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert helper().image((IMAGES / name).resolve())["tree_sha256"] == expected_hash
    values = [sys.executable, HELPER, "--original", IMAGES / "original", "--fork", IMAGES / "fork",
              "--original-source", ROOT / "baseline", "--fork-source", ROOT, "--output", OUT,
              "--backend", args.backend, "--manifest", OUT / "shard-cases.tsv"]
    with (OUT / "experiment.log").open("w") as log:
        child = subprocess.Popen([str(value) for value in values], text=True, stdout=subprocess.PIPE,
                                 stderr=subprocess.STDOUT, bufsize=1)
        for line in child.stdout:
            log.write(line)
            print(line, end="", flush=True)
        assert child.wait() == 0, "Shard measurement failed; retain all partial raw data"
    uniform_diagnostics(args)
    positive_search_diagnostics(args)
    for name, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert helper().image((IMAGES / name).resolve())["tree_sha256"] == expected_hash



def periodic(args):
    if args.backend == "avx512":
        sky_authorization(args.tier, "periodic")
    receipt = json.loads((OUT / "shard-receipt.json").read_text())
    assert receipt["source"] == args.source and receipt["backend"] == args.backend and receipt["tier"] == args.tier
    folder = OUT / "periodic"
    folder.mkdir()
    text = periodic_projection(args.backend, args.tier)
    manifest = folder / "shard-cases.tsv"
    manifest.write_text(text, newline="")
    for name, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert helper().image((IMAGES / name).resolve())["tree_sha256"] == expected_hash
        shutil.copy2(OUT / (name + "-spec.gmk"), folder / (name + "-spec.gmk"))
    periodic_receipt = {"source": args.source, "backend": args.backend, "tier": args.tier,
        "triplets": 2, "manifest_sha256": sha(manifest), "parent_manifest_sha256": PERIODIC_MANIFEST_SHA256,
        "runner_sha256": PERIODIC_HELPER_SHA256, "extra_benchmark_source_sha256": PERIODIC_SOURCE_SHA256,
        "producer_image_hashes": receipt["producer_image_hashes"]}
    (folder / "shard-receipt.json").write_text(json.dumps(periodic_receipt, indent=2) + "\n")
    values = [sys.executable, PERIODIC_HELPER, "--original", IMAGES / "original", "--fork", IMAGES / "fork",
              "--original-source", ROOT / "baseline", "--fork-source", ROOT, "--output", folder,
              "--backend", args.backend, "--manifest", manifest, "--extra-benchmark-source", PERIODIC_SOURCE]
    with (folder / "experiment.log").open("w") as log:
        child = subprocess.Popen([str(value) for value in values], text=True, stdout=subprocess.PIPE,
                                 stderr=subprocess.STDOUT, bufsize=1)
        for line in child.stdout:
            log.write(line)
            print(line, end="", flush=True)
        assert child.wait() == 0, "Periodic measurement failed; retain all partial raw data"
    for name, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert helper().image((IMAGES / name).resolve())["tree_sha256"] == expected_hash
    assert manifest.read_bytes() == text.encode()
    periodic_rows()


def utf16_probe(args):
    if args.backend == "avx512":
        sky_authorization(args.tier, "utf16-probe")
    receipt = json.loads((OUT / "shard-receipt.json").read_text())
    assert receipt["source"] == args.source and receipt["backend"] == args.backend and receipt["tier"] == args.tier
    folder = OUT / "utf16-probe"
    folder.mkdir()
    text, triplets = utf16_probe_projection(args.backend, args.tier)
    if triplets == 0:
        (folder / "not-applicable.json").write_text(json.dumps({
            "source": args.source, "backend": args.backend, "tier": args.tier,
            "applicable": False, "triplets": 0, "records": 0}, indent=2) + "\n")
        return
    manifest = folder / "shard-cases.tsv"
    manifest.write_text(text, newline="")
    for name, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert helper().image((IMAGES / name).resolve())["tree_sha256"] == expected_hash
        shutil.copy2(OUT / (name + "-spec.gmk"), folder / (name + "-spec.gmk"))
    probe_receipt = {"source": args.source, "backend": args.backend, "tier": args.tier,
        "triplets": triplets, "manifest_sha256": sha(manifest), "parent_manifest_sha256": UTF16_PROBE_MANIFEST_SHA256,
        "runner_sha256": PERIODIC_HELPER_SHA256, "extra_benchmark_source_sha256": UTF16_PROBE_SOURCE_SHA256,
        "producer_image_hashes": receipt["producer_image_hashes"]}
    (folder / "shard-receipt.json").write_text(json.dumps(probe_receipt, indent=2) + "\n")
    values = [sys.executable, PERIODIC_HELPER, "--original", IMAGES / "original", "--fork", IMAGES / "fork",
              "--original-source", ROOT / "baseline", "--fork-source", ROOT, "--output", folder,
              "--backend", args.backend, "--manifest", manifest, "--extra-benchmark-source", UTF16_PROBE_SOURCE]
    with (folder / "experiment.log").open("w") as log:
        child = subprocess.Popen([str(value) for value in values], text=True, stdout=subprocess.PIPE,
                                 stderr=subprocess.STDOUT, bufsize=1)
        for line in child.stdout:
            log.write(line)
            print(line, end="", flush=True)
        assert child.wait() == 0, "UTF-16 probe measurement failed; retain all partial raw data"
    for name, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert helper().image((IMAGES / name).resolve())["tree_sha256"] == expected_hash
    assert manifest.read_bytes() == text.encode()
    utf16_probe_rows()



def collection(args):
    expected, counts = expected_keys()
    periodic_expected, periodic_counts = expected_keys(periodic_rows()[0])
    probe_expected, probe_counts = expected_keys(utf16_probe_rows()[0])
    require_previous_controls(expected + periodic_expected + probe_expected)
    single_mode = os.environ.get("STRINGZILLA_SKY_AUTHORIZATION", "allfour-v1") == "single-host-v1"
    allowed = ({("avx512", tier) for tier in single_sky().selected_tiers()} if single_mode else
               {(backend, tier) for backend in BACKENDS for tier in TIERS
                if backend != "avx512" or tier in RECOVERY_SKY_TIERS})
    expected = [key for key in expected if tuple(json.loads(key)[:2]) in allowed]
    periodic_expected = [key for key in periodic_expected if tuple(json.loads(key)[:2]) in allowed]
    probe_expected = [key for key in probe_expected if tuple(json.loads(key)[:2]) in allowed]
    for phase_counts in (counts, periodic_counts, probe_counts):
        if single_mode:
            for backend in BACKENDS:
                for tier in TIERS:
                    if (backend, tier) not in allowed:
                        phase_counts[backend][tier] = 0
        else:
            for tier in TIERS:
                if tier not in RECOVERY_SKY_TIERS:
                    phase_counts["avx512"][tier] = 0
    artifacts = api("actions/runs/" + os.environ["GITHUB_RUN_ID"] + "/artifacts?per_page=100")["artifacts"]
    jobs = api("actions/runs/" + os.environ["GITHUB_RUN_ID"] + "/jobs?per_page=100&filter=all")["jobs"]
    producers = {name: json.loads(os.environ["PAIR_" + name.upper()]) for name in
                 (("avx2",) if single_mode else ("serial", "avx2", "neon", "msvc"))}
    entries, periodic_entries, probe_entries = [], [], []
    for backend in BACKENDS:
        if not any((backend, tier) in allowed for tier in TIERS):
            continue
        producer = producers["avx2" if backend == "avx512" else backend]
        for tier in TIERS:
            if (backend, tier) not in allowed:
                continue
            prefix = "stringzilla-final-results-" + backend + "-" + tier + "-" + os.environ["GITHUB_SHA"] + "-attempt"
            matches = [artifact for artifact in artifacts if artifact["name"].startswith(prefix)]
            assert 1 <= len(matches) <= 2, "Missing result or exceeded one unsupported-host retry: " + prefix
            label = backend + "-" + tier + " controls"
            matching_jobs = [job for job in jobs if job["name"] == label or job["name"].endswith("/ " + label)]
            if backend == "avx512" and single_mode:
                matching_jobs = [job for job in jobs if job["name"] == single_sky().WORKER and
                    any(step["name"] == "Measure missing SKY " + tier + " controls" and step["conclusion"] == "success"
                        for step in job["steps"])]
            elif backend == "avx512":
                prefix_name = "avx512_controls (" + tier + ") / Final SKY " + tier + " slot "
                candidates = [job for job in jobs if job["name"].startswith(prefix_name)]
                assert len(candidates) == 4 and all(job["run_attempt"] == 1 for job in candidates)
                step_name = "Measure final SKY " + tier + " original enabled and disabled controls"
                matching_jobs = [job for job in candidates if any(step["name"] == step_name and
                                 step["conclusion"] == "success" for step in job["steps"])]
            assert matching_jobs, label
            latest_attempt = max(job["run_attempt"] for job in matching_jobs)
            matching_jobs = [job for job in matching_jobs if job["run_attempt"] == latest_attempt]
            assert len(matching_jobs) == 1, label
            if single_mode:
                assert matching_jobs[0]["status"] == "completed", label
            else:
                assert matching_jobs[0]["conclusion"] == "success", label
            execution_context = {}
            if single_mode:
                measured = [step for step in matching_jobs[0]["steps"] if
                            step["name"] == "Measure missing SKY " + tier + " controls"]
                assert len(measured) == 1 and measured[0]["status"] == "completed" and measured[0]["conclusion"] == "success"
                execution_context = {"execution_kind": "github-step", "execution": measured[0],
                                     "parent_job": matching_jobs[0]}
            timed, skipped_attempts = [], []
            for artifact in matches:
                attempt = artifact["name"][len(prefix):]
                assert re.fullmatch(r"[1-9][0-9]*", attempt)
                folder = OUT / (backend + "-" + tier + "-attempt" + attempt)
                archive = OUT / (backend + "-" + tier + "-attempt" + attempt + ".zip")
                download(artifact["id"], artifact["digest"], os.environ["GITHUB_RUN_ID"], os.environ["GITHUB_SHA"], archive)
                with zipfile.ZipFile(archive) as bundle:
                    names = set(bundle.namelist())
                    if "experiment.log" in names:
                        unpack_files(archive, ["experiment.log", "shard-cases.tsv", "shard-receipt.json"], folder)
                        if backend == "avx512" and single_mode:
                            binding = single_sky().verify_tier_artifact(bundle, tier, matching_jobs[0])
                            for name in ("single-host-binding.json", "single-host-fact.json", "tier-console.log"):
                                (folder / name).write_bytes(bundle.read(name))
                        elif backend == "avx512":
                            election_folder = folder / "sky-election"
                            election_folder.mkdir()
                            required = ["eligibility.json", "selection.json"] + [
                                "fact-" + slot + suffix for slot in ("0", "1", "2", "3") for suffix in (".zip", ".json")]
                            for name in required:
                                (election_folder / name).write_bytes(bundle.read("sky-election/" + name))
                            module = sky_election(tier)
                            elected = module.verify_saved(election_folder, completed=True)
                            assert elected["job_id"] == matching_jobs[0]["id"] and elected["tier"] == tier
                            saved_binding = json.loads(bundle.read("election-binding.json"))
                            assert saved_binding == elected
                            (folder / "election-binding.json").write_text(json.dumps(elected, indent=2) + "\n")
                        periodic_folder = folder / "periodic"
                        periodic_folder.mkdir()
                        for name in ("experiment.log", "shard-cases.tsv", "shard-receipt.json"):
                            with bundle.open("periodic/" + name) as source, (periodic_folder / name).open("wb") as target:
                                shutil.copyfileobj(source, target)
                        probe_text, probe_triplets = utf16_probe_projection(backend, tier)
                        if probe_triplets:
                            probe_folder = folder / "utf16-probe"
                            probe_folder.mkdir()
                            for name in ("experiment.log", "shard-cases.tsv", "shard-receipt.json"):
                                with bundle.open("utf16-probe/" + name) as source, (probe_folder / name).open("wb") as target:
                                    shutil.copyfileobj(source, target)
                        else:
                            not_applicable = json.loads(bundle.read("utf16-probe/not-applicable.json"))
                            assert not_applicable == {"source": args.source, "backend": backend, "tier": tier,
                                                      "applicable": False, "triplets": 0, "records": 0}
                        if tier == "c2":
                            diagnostics = json.loads(bundle.read("positive-search-diagnostics.json"))
                            assert diagnostics["source"] == args.source and diagnostics["baseline"] == BASE
                            assert diagnostics["backend"] == backend and diagnostics["tier"] == "c2"
                            assert diagnostics["timing_evidence"] is False and len(diagnostics["runs"]) == 9
                            diagnostic_cases = {
                                "utf16-4096-64-end": {"length": "4096", "needleLength": "64", "coder": "UTF16", "position": "END"},
                                "latin1-4096-4-end": {"length": "4096", "needleLength": "4", "coder": "LATIN1", "position": "END"},
                                "utf16-127-4-end": {"length": "127", "needleLength": "4", "coder": "UTF16", "position": "END"}}
                            assert {(record["control"], record["case"]) for record in diagnostics["runs"]} == {
                                (control, case) for control in ("original", "enabled", "disabled") for case in diagnostic_cases}
                            for record in diagnostics["runs"]:
                                control, case = record["control"], record["case"]
                                assert record["source"] == (BASE if control == "original" else args.source)
                                assert record["timing_evidence"] is False and record["tier"] == "c2"
                                assert record["params"] == diagnostic_cases[case]
                                assert record["path"] == "positive-search-diagnostics/" + control + "-" + case + ".log"
                                raw = bundle.read(record["path"])
                                assert hashlib.sha256(raw).hexdigest() == record["sha256"]
                                destination = folder / record["path"]
                                destination.parent.mkdir(exist_ok=True)
                                destination.write_bytes(raw)
                            (folder / "positive-search-diagnostics.json").write_text(
                                json.dumps(diagnostics, indent=2) + "\n")
                        timed.append((int(attempt), folder))
                    else:
                        assert "SKIPPED.json" in names, "Incomplete shard without zero-timing unsupported receipt"
                        unpack_files(archive, ["SKIPPED.json"], folder)
                        skipped = json.loads((folder / "SKIPPED.json").read_text())
                        assert skipped["available"] is False and skipped["timed_records"] == 0
                        skipped_attempts.append(int(attempt))
                archive.unlink()
            assert len(timed) == 1, "Missing complete measurement or competing timed attempts: " + prefix
            assert latest_attempt == timed[0][0] and all(attempt < timed[0][0] for attempt in skipped_attempts)
            folder = timed[0][1]
            # Recreate the projection from pinned source bytes rather than trusting the shard receipt.
            cases, columns = rows()
            alias = "avx2" if backend == "avx512" else backend
            selected = [dict(row, backends=alias, tiers=tier) for row in cases if alias in
                        row["backends"].split(",") and tier in row["tiers"].split(",")]
            projected = io.StringIO(newline="")
            writer = csv.DictWriter(projected, fieldnames=columns, delimiter="\t", lineterminator="\n")
            writer.writeheader()
            writer.writerows(selected)
            text = projected.getvalue()
            assert (folder / "shard-cases.tsv").read_bytes() == text.encode()
            receipt = {"manifest_sha256": hashlib.sha256(text.encode()).hexdigest(), "runner_sha256": sha(HELPER),
                       "producer_image_hashes": {"original": producer["original-image-hash"], "fork": producer["fork-image-hash"]}}
            entries.append({"backend": backend, "job": matching_jobs[0], **execution_context, "source": args.source, "base": BASE,
                            "manifest": text, "log_path": str(folder / "experiment.log"), "expected": receipt})
            text = periodic_projection(backend, tier)
            periodic_folder = folder / "periodic"
            assert (periodic_folder / "shard-cases.tsv").read_bytes() == text.encode()
            periodic_receipt = {"source": args.source, "backend": backend, "tier": tier, "triplets": 2,
                "manifest_sha256": hashlib.sha256(text.encode()).hexdigest(),
                "parent_manifest_sha256": PERIODIC_MANIFEST_SHA256, "runner_sha256": PERIODIC_HELPER_SHA256,
                "extra_benchmark_source_sha256": PERIODIC_SOURCE_SHA256,
                "producer_image_hashes": {"original": {"tree_sha256": producer["original-image-hash"]},
                                          "fork": {"tree_sha256": producer["fork-image-hash"]}}}
            assert json.loads((periodic_folder / "shard-receipt.json").read_text()) == periodic_receipt
            periodic_entries.append({"backend": backend, "job": matching_jobs[0], **execution_context, "source": args.source, "base": BASE,
                "manifest": text, "log_path": str(periodic_folder / "experiment.log"),
                "expected": {name: periodic_receipt[name] for name in ("manifest_sha256", "runner_sha256",
                    "producer_image_hashes", "extra_benchmark_source_sha256")}})
            text, triplets = utf16_probe_projection(backend, tier)
            if triplets:
                probe_folder = folder / "utf16-probe"
                assert (probe_folder / "shard-cases.tsv").read_bytes() == text.encode()
                probe_receipt = {"source": args.source, "backend": backend, "tier": tier, "triplets": triplets,
                    "manifest_sha256": hashlib.sha256(text.encode()).hexdigest(),
                    "parent_manifest_sha256": UTF16_PROBE_MANIFEST_SHA256, "runner_sha256": PERIODIC_HELPER_SHA256,
                    "extra_benchmark_source_sha256": UTF16_PROBE_SOURCE_SHA256,
                    "producer_image_hashes": {"original": {"tree_sha256": producer["original-image-hash"]},
                                              "fork": {"tree_sha256": producer["fork-image-hash"]}}}
                assert json.loads((probe_folder / "shard-receipt.json").read_text()) == probe_receipt
                probe_entries.append({"backend": backend, "job": matching_jobs[0], **execution_context, "source": args.source, "base": BASE,
                    "manifest": text, "log_path": str(probe_folder / "experiment.log"),
                    "expected": {name: probe_receipt[name] for name in ("manifest_sha256", "runner_sha256",
                        "producer_image_hashes", "extra_benchmark_source_sha256")}})
    write("collection-input.json", {"entries": entries, "expected_physical_keys": expected, "counts": counts,
          "periodic_entries": periodic_entries, "periodic_expected_physical_keys": periodic_expected,
          "periodic_counts": periodic_counts, "utf16_probe_entries": probe_entries,
          "utf16_probe_expected_physical_keys": probe_expected, "utf16_probe_counts": probe_counts})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("proof", "original", "pair", "validate", "physical", "restore", "runtime", "native", "measure", "periodic", "utf16-probe", "collection"))
    parser.add_argument("--source", required=True)
    parser.add_argument("--backend", choices=tuple(BACKENDS))
    parser.add_argument("--tier", choices=tuple(TIERS))
    parser.add_argument("--artifact-id")
    parser.add_argument("--artifact-digest")
    parser.add_argument("--original-hash")
    parser.add_argument("--fork-hash")
    parser.add_argument("--helper-hash")
    parser.add_argument("--parent-manifest-hash")
    args = parser.parse_args()
    for name in ("JAVA_TOOL_OPTIONS", "_JAVA_OPTIONS", "JDK_JAVA_OPTIONS"):
        os.environ.pop(name, None)
    OUT.mkdir(exist_ok=True)
    check_sources(args.source, baseline=args.mode not in ("proof", "collection"))
    functions = {"proof": lambda: proof(args.source), "original": lambda: original(args), "pair": lambda: pair(args),
                 "validate": lambda: validate(args), "physical": lambda: physical_host(args), "restore": lambda: restore(args),
                 "runtime": lambda: runtime_host(args), "native": native, "measure": lambda: measure(args),
                 "periodic": lambda: periodic(args), "utf16-probe": lambda: utf16_probe(args),
                 "collection": lambda: collection(args)}
    functions[args.mode]()
    check_sources(args.source, baseline=args.mode not in ("proof", "collection"))
