#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
"""One retained-image SVE correctness/IR check; no builds or retries."""
import argparse
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess
import tarfile
import time
import xml.etree.ElementTree as ET

from compare import command, save, sha

PRODUCT = "2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1"
IMAGE_SOURCE = "f09e3bcdd4ab29af3270136ca02bc12674b337e1"
TEST_REL = "test/hotspot/jtreg/compiler/c2/aarch64/TestByteMaskToLongSVE.java"
TARGET = "compiler.c2.aarch64.TestByteMaskToLong "
METHODS = ("byte128", "byte64")


def audit(out):
    jtrs = list((out / "work").rglob("TestByteMaskToLongSVE.jtr"))
    if len(jtrs) != 1:
        raise RuntimeError("Require exactly one SVE test result; a skipped test is not evidence")
    text = jtrs[0].read_text()
    if not re.search(r"^testresult=Passed\.", text, re.M):
        raise RuntimeError("The SVE test did not pass")
    if not re.search(r"\bUseSVE\s*:?=\s*1\b", text):
        raise RuntimeError("No effective UseSVE=1 flag record in the actual test output")
    for method in METHODS:
        if not re.search(r"^- " + method + r": 3\s*$", text, re.M):
            raise RuntimeError("Missing active SVE IR rule 3 for " + method)
        if not re.search(r"^Verifying IR rules for " + method + r":", text, re.M):
            raise RuntimeError("Missing executed IR verification for " + method)
    phases = []
    errors = []
    for path in (out / "work").rglob("hotspot*.log"):
        try:
            root = ET.parse(path).getroot()
        except ET.ParseError as error:
            errors.append({"file": str(path.relative_to(out)), "error": str(error)})
            continue
        methods = {e.get("compile_id"): e.get("method") for e in root.iter("nmethod")
                   if e.get("method", "").startswith(TARGET)
                   and e.get("compiler") == "c2" and e.get("compile_kind") != "osr"}
        for ideal in root.iter("ideal"):
            method = methods.get(ideal.get("compile_id"), "")
            name = method.split()[1] if method else ""
            if name not in METHODS or ideal.get("compile_phase") not in ("MATCHING", "After Matching", "Matching"):
                continue
            body = "".join(ideal.itertext())
            sve = re.findall(r"^\s*\d+\s+vmask_tolong_sve(?:2)?\b", body, re.M)
            fused = re.findall(r"^\s*\d+\s+vstoremask_tolongB16_neon\b", body, re.M)
            phases.append({"file": str(path.relative_to(out)), "compile_id": ideal.get("compile_id"),
                           "method": name, "phase": ideal.get("compile_phase"),
                           "sve_to_long_count": len(sve), "neon_fused_count": len(fused)})
    result = {"jtr": str(jtrs[0].relative_to(out)), "active_rules": {m: [3] for m in METHODS},
              "effective_UseSVE": 1, "matching_phases": phases, "xml_parse_errors": errors}
    save(out / "ir-audit.json", result)
    for method in METHODS:
        records = [p for p in phases if p["method"] == method]
        if not records or any(p["sve_to_long_count"] != 1 or p["neon_fused_count"] != 0 for p in records):
            raise RuntimeError("Missing/incorrect retained SVE Matching evidence for " + method)
    return result


def check(root, out):
    started = time.monotonic()
    out.mkdir(exist_ok=False)
    if platform.system() != "Linux" or platform.machine() != "aarch64":
        raise RuntimeError("Native Linux AArch64 required")
    cpuinfo = Path("/proc/cpuinfo").read_text()
    (out / "cpuinfo.txt").write_text(cpuinfo)
    if not re.search(r"^Features\s*:.*\bsve\b", cpuinfo, re.M):
        raise RuntimeError("Runner exposes no SVE; do not accept an @requires skip")
    product = root / "product"
    actual = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=product, text=True).strip()
    dirty = subprocess.check_output(["git", "status", "--porcelain", "--untracked-files=no"], cwd=product, text=True)
    if actual != PRODUCT or dirty:
        raise RuntimeError("Require clean pinned product checkout")
    archives = list((root / "fastdebug-download").rglob("jdk-linux-aarch64-debug.tar.gz"))
    jars = list((root / "jtreg").rglob("jtreg.jar"))
    if len(archives) != 1 or len(jars) != 1:
        raise RuntimeError("Require exactly one pinned fastdebug archive and JTReg jar")
    image = root / "sve-image"
    image.mkdir(exist_ok=False)
    with tarfile.open(archives[0]) as archive:
        archive.extractall(image, filter="data")
    jdks = [p.parent.parent for p in image.rglob("bin/java")]
    if len(jdks) != 1:
        raise RuntimeError("Expected exactly one extracted JDK")
    jdk = jdks[0]
    elf = (jdk / "bin/java").read_bytes()[:20]
    if elf[:6] != b"\x7fELF\x02\x01" or int.from_bytes(elf[18:20], "little") != 183:
        raise RuntimeError("Image is not little-endian ELF64 AArch64")
    release = (jdk / "release").read_text()
    if IMAGE_SOURCE not in release:
        raise RuntimeError("Image release file does not name the pinned ordinary-CI merge source")
    (out / "release.txt").write_text(release)
    save(out / "inputs.json", {"product_source": PRODUCT, "image_source": IMAGE_SOURCE,
         "ordinary_ci_run": 39266688701, "image_artifact": 12194059473,
         "jtreg_artifact": 12192388544, "qualification_sha": os.environ.get("GITHUB_SHA"),
         "fastdebug_tar_sha256": sha(archives[0]), "jtreg_jar_sha256": sha(jars[0]),
         "java_sha256": sha(jdk / "bin/java"), "libjvm_sha256": sha(jdk / "lib/server/libjvm.so"),
         "test_sha256": sha(product / TEST_REL),
         "oracle_sha256": sha(product / TEST_REL.replace("ToLongSVE", "ToLong")),
         "scope": "One SVE correctness/exclusion test; no performance measurement or JDK build"})
    if not command([jdk / "bin/java", "-XX:UseSVE=1", "-XX:+UnlockDiagnosticVMOptions",
                    "-XX:+PrintFlagsFinal", "-XshowSettings:properties", "-version"],
                   out / "image-properties.log", 30):
        raise RuntimeError("SVE image preflight failed")
    props = (out / "image-properties.log").read_text()
    if not re.search(r"\bUseSVE\s*:?=\s*1\b", props) or "jdk.debug = fastdebug" not in props:
        raise RuntimeError("Image does not report effective SVE=1 and fastdebug")
    args = [jdk / "bin/java", "-jar", jars[0], "-jdk:" + str(jdk), "-conc:1", "-retain:all", "-verbose:all",
            "-w:" + str(out / "work"), "-r:" + str(out / "report"),
            "-javaoption:-DVerifyIR=true", "-javaoption:-DExcludeRandom=false",
            "-javaoption:-DReportStdout=true", "-javaoption:-DVerbose=true",
            "-javaoption:-DPrintApplicableIRRules=true", "-javaoption:-DPrintRuleMatchingTime=true",
            "-javaoption:-XX:+UnlockDiagnosticVMOptions", "-javaoption:-XX:+PrintFlagsFinal",
            "-javaoption:-XX:+LogCompilation", product / TEST_REL]
    # Reserve 30 seconds for auditing and failure records inside the 10-minute step.
    remaining = max(1, int(570 - (time.monotonic() - started)))
    ok = command(args, out / "jtreg.log", remaining, cwd=product)
    reviewed = audit(out)
    if not ok:
        raise RuntimeError("JTReg process failed; retain all records")
    return {"status": "passed", "elapsed_seconds": time.monotonic() - started,
            "semantic_scope": "Original exhaustive masks, shared/normalized/nonbyte/FP/block controls; all 16 targets checked C2 before and after",
            "ir_audit": reviewed}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path.cwd())
    parser.add_argument("--out", type=Path, required=True)
    args = parser.parse_args()
    out = args.out.resolve()
    result = {"status": "incomplete"}
    try:
        result = check(args.root.resolve(), out)
    except Exception as error:
        result["error"] = f"{type(error).__name__}: {error}"
        raise
    finally:
        if out.exists():
            save(out / "summary.json", result)
            save(out / "manifest.json", {str(p.relative_to(out)): sha(p) for p in out.rglob("*")
                                         if p.is_file() and p.name != "manifest.json"})
            print("PR43_SVE_SUMMARY " + json.dumps(result), flush=True)


if __name__ == "__main__":
    main()
