#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Build complete candidate pairs once; measure disjoint native backend/tier shards."""

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
MANIFEST = ROOT / "doc/stringzilla/native-cases.tsv"
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


def expected_keys():
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


def proof(source):
    check_sources(source, baseline=False)
    expected, counts = expected_keys()
    receipt = {"source": source, "parent_manifest_sha256": sha(MANIFEST), "helper_sha256": sha(HELPER),
               "rows": len(rows()[0]), "triplets": len(expected), "records": len(expected) * 3,
               "max_shard_triplets": max(value for tiers in counts.values() for value in tiers.values()),
               "counts": counts, "physical_keys": expected}
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


def validate(args):
    inventories = json.loads((OUT / "pair-inventories.json").read_text())
    for name in ("original", "fork"):
        run_log(["C:/msys64/usr/bin/bash.exe",
                 (ROOT / ".github/scripts/check-dev-profile.sh").resolve().as_posix(),
                 (IMAGES / name).resolve().as_posix(),
                 (OUT / (name + "-spec.gmk")).resolve().as_posix()], OUT / (name + "-profile.log"))
    jtreg(["test/jdk/java/lang/String/StringZillaSearch.java",
           "test/jdk/java/lang/String/StringZillaBounded.java"], "jtreg-smoke")
    jtreg(["test/hotspot/jtreg/compiler/intrinsics/string/TestStringZillaUTF16Bounds.java",
           "test/hotspot/jtreg/compiler/intrinsics/string/TestStringZillaDispatch.java"], "jtreg-dispatch")
    native()
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


def restore(args):
    producer = "avx2" if args.backend == "avx512" else args.backend
    archive = ROOT / "candidate-pair.zip"
    metadata = download(args.artifact_id, args.artifact_digest, os.environ["GITHUB_RUN_ID"],
                        os.environ["GITHUB_SHA"], archive)
    assert metadata["name"] == "stringzilla-sharded-pair-" + producer + "-" + os.environ["GITHUB_SHA"]
    ARCHIVES.mkdir()
    IMAGES.mkdir()
    names = ["pair-receipt.json", "pair-inventories.json"] + [
        control + suffix for control in ("original", "fork") for suffix in ("-jdk.tar.gz", "-jdk.tar.gz.sha256", "-spec.gmk")]
    unpack_files(archive, names, ARCHIVES)
    receipt = json.loads((ARCHIVES / "pair-receipt.json").read_text())
    assert receipt["sources"] == {"original": BASE, "fork": args.source} and receipt["backend"] == producer
    assert receipt["producer_head"] == os.environ["GITHUB_SHA"] and receipt["producer_run"] == os.environ["GITHUB_RUN_ID"]
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
    for name, expected_hash in (("original", args.original_hash), ("fork", args.fork_hash)):
        assert helper().image((IMAGES / name).resolve())["tree_sha256"] == expected_hash


def collection(args):
    expected, counts = expected_keys()
    artifacts = api("actions/runs/" + os.environ["GITHUB_RUN_ID"] + "/artifacts?per_page=100")["artifacts"]
    jobs = api("actions/runs/" + os.environ["GITHUB_RUN_ID"] + "/jobs?per_page=100&filter=all")["jobs"]
    producers = {name: json.loads(os.environ["PAIR_" + name.upper()]) for name in ("serial", "avx2", "neon", "msvc")}
    entries = []
    for backend in BACKENDS:
        producer = producers["avx2" if backend == "avx512" else backend]
        for tier in TIERS:
            prefix = "stringzilla-sharded-results-" + backend + "-" + tier + "-" + os.environ["GITHUB_SHA"] + "-attempt"
            matches = [artifact for artifact in artifacts if artifact["name"].startswith(prefix)]
            assert 1 <= len(matches) <= 2, "Missing result or exceeded one unsupported-host retry: " + prefix
            label = backend + "-" + tier + " controls"
            matching_jobs = [job for job in jobs if job["name"] == label or job["name"].endswith("/ " + label)]
            assert matching_jobs, label
            latest_attempt = max(job["run_attempt"] for job in matching_jobs)
            matching_jobs = [job for job in matching_jobs if job["run_attempt"] == latest_attempt]
            assert len(matching_jobs) == 1 and matching_jobs[0]["conclusion"] == "success", label
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
            entries.append({"backend": backend, "job": matching_jobs[0], "source": args.source, "base": BASE,
                            "manifest": text, "log_path": str(folder / "experiment.log"), "expected": receipt})
    write("collection-input.json", {"entries": entries, "expected_physical_keys": expected, "counts": counts})


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("mode", choices=("proof", "original", "pair", "validate", "physical", "restore", "runtime", "native", "measure", "collection"))
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
                 "collection": lambda: collection(args)}
    functions[args.mode]()
    check_sources(args.source, baseline=args.mode not in ("proof", "collection"))
