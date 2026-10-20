#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
"""One pinned, untimed native CI capture. No builds, installs or timing."""
import argparse
from collections import Counter
import datetime
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import struct
import subprocess
import sys
import tarfile
import urllib.request
import xml.etree.ElementTree as ET

REPO = "re-thc/openjdk-jdk27u"
PRODUCT = "2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1"
IMAGE_SOURCE = "f09e3bcdd4ab29af3270136ca02bc12674b337e1"
IMAGE_TREE = "7e9be0fb61d956b8982a01d1d12279d9e1faad6b"
BASE = "e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4"
RUN = 39266688701
ARTIFACT = 12194059473
ARCHIVE_DIGEST = "sha256:b25f7a24708dea4147028dd5520d4ba09cce9b82bcedb28e652890a5f1d6857e"
TARGET = "org.simdjson.StructuralIndexer index128 "
RULE = "vstoremask_tolongB16_neon"
OWN = Path(__file__).resolve().parent


def save(path, value):
    path.write_text(json.dumps(value, indent=2) + "\n")


def sha(path):
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def run(command, **kwargs):
    return subprocess.run(command, check=True, text=True, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, timeout=60, **kwargs).stdout


def bind(out):
    out.mkdir(parents=True, exist_ok=False)
    if (os.environ.get("GITHUB_REPOSITORY") != REPO
            or os.environ.get("GITHUB_REF") != "refs/heads/codex/pr43-macos-qualification"
            or os.environ.get("GITHUB_EVENT_NAME") != "workflow_dispatch"):
        raise RuntimeError("Require the existing authorized repository/branch and manual event")
    machine = platform.machine().lower()
    if machine not in ["aarch64", "arm64"] or platform.system() != "Linux":
        raise RuntimeError("Require native Linux AArch64")
    if not shutil.which("objdump"):
        raise RuntimeError("Preinstalled GNU objdump required; no installation attempted")
    for name, command in [("lscpu", ["lscpu"]), ("uname", ["uname", "-a"]),
                          ("objdump-version", ["objdump", "--version"])]:
        (out / (name + ".txt")).write_text(run(command))
    for src, name in [("/proc/cpuinfo", "cpuinfo.txt"),
                      ("/sys/fs/cgroup/cpu.max", "cpu.max"),
                      ("/sys/fs/cgroup/memory.max", "memory.max")]:
        if Path(src).is_file():
            shutil.copyfile(src, out / name)
    print("PR43_NATIVE_HARDWARE " + json.dumps({"lscpu": (out / "lscpu.txt").read_text(),
          "uname": (out / "uname.txt").read_text(),
          "cgroup": {x: (out / x).read_text() for x in ["cpu.max", "memory.max"] if (out / x).is_file()}}))
    def get(resource):
        req = urllib.request.Request("https://api.github.com/repos/" + REPO + "/" + resource,
                                     headers={"Authorization": "Bearer " + os.environ["GITHUB_TOKEN"],
                                              "Accept": "application/vnd.github+json"})
        with urllib.request.urlopen(req, timeout=30) as response:
            return json.load(response)
    pr = get("pulls/43")
    ci = get(f"actions/runs/{RUN}")
    artifacts = get(f"actions/runs/{RUN}/artifacts?per_page=100")
    image = get("git/commits/" + IMAGE_SOURCE)
    save(out / "binding-inputs.json", {"pr": pr, "ci": ci, "image_commit": image,
                                      "artifacts": artifacts})
    artifact = next(x for x in artifacts["artifacts"] if x["id"] == ARTIFACT)
    if not (pr["head"]["sha"] == PRODUCT and pr["state"] == "open" and pr["draft"] and not pr["merged"]
            and ci["head_sha"] == PRODUCT and ci["status"] == "completed"
            and ci["conclusion"] == "success" and ci["run_attempt"] == 1
            and image["sha"] == IMAGE_SOURCE and image["tree"]["sha"] == IMAGE_TREE
            and [x["sha"] for x in image["parents"]] == [BASE, PRODUCT]
            and artifact["name"] == "bundles-linux-aarch64-debug" and not artifact["expired"]
            and artifact["digest"] == ARCHIVE_DIGEST and artifact["size_in_bytes"] == 338244197
            and artifact["workflow_run"]["head_sha"] == PRODUCT):
        raise RuntimeError("Pinned product/CI/image binding changed; stop without replacement")
    receipt = {"status": "bound", "utc": datetime.datetime.now(datetime.timezone.utc).isoformat(),
               "diagnostic_sha": os.environ["GITHUB_SHA"], "machine": machine,
               "run_id": os.environ["GITHUB_RUN_ID"], "run_attempt": os.environ["GITHUB_RUN_ATTEMPT"],
               "product_sha": PRODUCT, "image_source_sha": IMAGE_SOURCE, "image_tree": IMAGE_TREE,
               "image_ci_run": RUN, "artifact_id": ARTIFACT, "api_archive_digest": ARCHIVE_DIGEST,
               "digest_scope": "API archive digest pinned; download-artifact verifies transfer and logs its result. "
                               "This helper receives extracted files, not the outer ZIP, so does not independently hash that ZIP. "
                               "Inner tar and executed java/libjvm hashes are computed separately.",
               "probe_source_sha256": {x.name: sha(x) for x in sorted(OWN.iterdir()) if x.is_file()},
               "timing_collected": False, "mode": "Linux AArch64 NEON, UseSVE=0, MaxVectorSize=16"}
    save(out / "binding.json", receipt)
    print("PR43_NATIVE_BIND " + json.dumps(receipt))


def code_blocks(console):
    """Read abstract-disassembler hex as memory bytes, never integer words."""
    results = []
    for block in re.split(r"(?=^Compiled method \(c2\))", console, flags=re.M):
        first = block.splitlines()[0] if block else ""
        if "org.simdjson.StructuralIndexer::index128" not in first:
            continue
        cid = re.match(r"Compiled method \(c2\)\s+\d+\s+(\d+)\b", first)
        extent = re.search(r"main code\s+\[0x([0-9a-f]+),\s*0x([0-9a-f]+)\]\s*=\s*(\d+)", block)
        mach = re.search(r"\[MachCode\](.*?)\[/MachCode\]", block, re.S)
        if not cid or not extent or not mach:
            raise RuntimeError("Missing compile ID, main code range or raw MachCode: " + first)
        start, end, length = [int(extent[1], 16), int(extent[2], 16), int(extent[3])]
        if end - start != length:
            raise RuntimeError("Inconsistent main code extent")
        memory = {}
        for row in mach[1].splitlines():
            m = re.match(r"\s*0x([0-9a-f]+):\s*(.*)", row)
            if not m:
                continue
            address = int(m[1], 16)
            tokens = m[2].split(";", 1)[0].replace("|", " ").split()
            if not tokens:
                continue
            if not all(re.fullmatch(r"(?:[0-9a-f]{2}|[0-9a-f]{4})", x) for x in tokens):
                raise RuntimeError("Unrecognized raw byte format; do not guess: " + row)
            for byte in bytes.fromhex("".join(tokens)):
                if address in memory and memory[address] != byte:
                    raise RuntimeError("Conflicting raw byte records")
                memory[address] = byte
                address += 1
        if not all(x in memory for x in range(start, end)):
            raise RuntimeError("Incomplete main code bytes for compile " + cid[1])
        results.append(({"compile_id": cid[1], "kind": "osr" if "%" in first else "normal",
                         "header": first, "start": start, "end": end, "length": length},
                        bytes(memory[x] for x in range(start, end))))
    if not results:
        raise RuntimeError("No installed parser C2 nmethod bytes retained")
    return results


def sequences(disassembly):
    instructions = []
    for line in disassembly.splitlines():
        m = re.match(r"\s*([0-9a-f]+):\s+([0-9a-f]{8})\s+(\w+)\s*(.*)", line)
        if m:
            instructions.append((int(m[1], 16), int(m[2], 16), m[3], re.sub(r"\s+", "", m[4].split("//")[0])))
    found = []
    for i in range(len(instructions) - 9):
        s = instructions[i:i + 10]
        if any(s[j][0] != s[0][0] + 4 * j for j in range(10)):
            continue
        if s[0][1] & 0xff800000 != 0xd2800000 or any(x[1] & 0xff800000 != 0xf2800000 for x in s[1:4]):
            continue
        rd, value, shifts = s[0][1] & 31, 0, set()
        for x in s[:4]:
            shift = ((x[1] >> 21) & 3) * 16
            shifts.add(shift)
            value |= ((x[1] >> 5) & 65535) << shift
        if value != 0x8040201008040201 or len(shifts) != 4 or any(x[1] & 31 != rd for x in s[:4]):
            continue
        if [x[2] for x in s[4:]] != ["dup", "and", "addp", "addp", "addp", "umov"]:
            continue
        dup = re.fullmatch(r"v(\d+)\.2d,x(\d+)", s[4][3])
        mask = re.fullmatch(r"v(\d+)\.16b,v(\d+)\.16b,v(\d+)\.16b", s[5][3])
        if not dup or not mask:
            continue
        tmp, source = dup[1], mask[2]
        operands_ok = (int(dup[2]) == rd and mask[1] == tmp and mask[3] == tmp and source != tmp
                       and all(x[3] == f"v{tmp}.16b,v{tmp}.16b,v{tmp}.16b" for x in s[6:9])
                       and s[9][3] == f"w{rd},v{tmp}.h[0]")
        found.append({"address": hex(s[0][0]), "scalar_result": f"x{rd}", "raw_mask": f"v{source}",
                      "vector_temp": f"v{tmp}", "all_operands_valid": operands_ok,
                      "raw_mask_distinct_from_temp": source != tmp})
    return instructions, found


def decode(out):
    native = out / "native-code"
    native.mkdir(exist_ok=False)
    # Known MOVZ x0,#1; RET bytes verify byte order and the preinstalled decoder.
    test = native / "decoder-control.bin"
    test.write_bytes(struct.pack("<II", 0xd2800020, 0xd65f03c0))
    control = run(["objdump", "-D", "-b", "binary", "-m", "aarch64", str(test)])
    (native / "decoder-control.txt").write_text(control)
    if not re.search(r"d2800020\s+mov\s+x0,\s*#0x1\b", control) or not re.search(r"d65f03c0\s+ret\b", control):
        raise RuntimeError("Native objdump byte-order control failed")
    reports = []
    for meta, body in code_blocks((out / "capture/console.log").read_text()):
        binary = native / (meta["compile_id"] + "-main.bin")
        binary.write_bytes(body)
        listing = run(["objdump", "-D", "-b", "binary", "-m", "aarch64",
                       "--adjust-vma=" + str(meta["start"]), str(binary)])
        (native / (meta["compile_id"] + "-main.txt")).write_text(listing)
        instructions, fused = sequences(listing)
        meta.update({"sha256": sha(binary), "decoded_instruction_count": len(instructions),
                     "fused_sequences": fused, "fused_sequence_count": len(fused),
                     "sp_relative_load_store_count": sum(x[2].startswith(("ld", "st")) and "[sp" in x[3]
                                                         for x in instructions),
                     "stack_scope": "SP-relative accesses include frame/call state; inspect allocation records before calling them spills."})
        reports.append(meta)
    phase_records = []
    for path in (out / "capture").glob("hotspot-*.log"):
        root = ET.parse(path).getroot()
        ids = {e.get("compile_id") for e in root.iter("nmethod") if e.get("method", "").startswith(TARGET)}
        for ideal in root.iter("ideal"):
            if ideal.get("compile_id") not in ids:
                continue
            lines = "".join(ideal.itertext()).splitlines()
            selected = [x for x in lines if re.match(r"\s*\d+\s+" + RULE + r"\b", x)]
            copies = [x for x in lines if re.match(r"\s*\d+\s+\w*SpillCopy\b", x)]
            phase_records.append({"compile_id": ideal.get("compile_id"), "phase": ideal.get("compile_phase"),
                                  "toLong_count": sum(bool(re.match(r"\s*\d+\s+VectorMaskToLong\b", x)) for x in lines),
                                  "selected_rule_count": len(selected), "selected_rule_lines": selected,
                                  "allocation_copy_count": len(copies),
                                  "allocation_copy_reasons": dict(Counter(x.split()[1] for x in copies)),
                                  "allocation_copy_lines": copies,
                                  "copy_scope": "Reason-specific SpillCopy nodes include register moves; stack operands and native code require review before classifying loads/stores as spills."})
    result = {"status": "decoded", "nmethods": reports, "phases": phase_records,
              "scope": "Current image/parser/flags on recorded Linux ARM host only. No timing, Apple-generation or SVE qualification."}
    save(out / "native-analysis.json", result)
    print("PR43_NATIVE_CODE " + json.dumps(result))
    if not any(x["kind"] == "normal" for x in reports):
        raise RuntimeError("No normal-entry C2 parser code")
    if not all(x["fused_sequence_count"] == 40 and all(s["all_operands_valid"] for s in x["fused_sequences"]) for x in reports):
        raise RuntimeError("Native pattern/operand count differs from expected 40; review retained records")
    for method in reports:
        for names in [("BEFORE_MATCHING", "Before Matching"), ("MATCHING", "Matching"),
                      ("REGISTER_ALLOCATION", "Register Allocation")]:
            phases = [x for x in phase_records if x["compile_id"] == method["compile_id"] and x["phase"] in names]
            count = "toLong_count" if names[0] == "BEFORE_MATCHING" else "selected_rule_count"
            if len(phases) != 1 or phases[0][count] != 40:
                raise RuntimeError("Missing 40-node requested phase record for compile " + method["compile_id"])


def capture(out, download):
    binding = json.loads((out / "binding.json").read_text())
    if binding["status"] != "bound" or binding["diagnostic_sha"] != os.environ["GITHUB_SHA"]:
        raise RuntimeError("Missing same-source binding")
    bundles = list(download.rglob("jdk-linux-aarch64-debug.tar.gz"))
    if len(bundles) != 1:
        raise RuntimeError("Require exactly the pinned native debug JDK tar")
    save(out / "downloaded-files.json", {"files": {str(x.relative_to(download)): sha(x) for x in sorted(download.rglob("*")) if x.is_file()},
                                        "archive_scope": binding["digest_scope"]})
    image = out.parent / "native-image"
    image.mkdir(exist_ok=False)
    with tarfile.open(bundles[0], "r:gz") as archive:
        archive.extractall(image, filter="data")
    jdk = image / "jdk-27.0.2/fastdebug"
    elf = (jdk / "bin/java").read_bytes()[:20]
    if elf[:6] != b"\x7fELF\x02\x01" or int.from_bytes(elf[18:20], "little") != 183:
        raise RuntimeError("Image java is not little-endian ELF64 AArch64")
    command = [sys.executable, str(OWN / "probe.py"), "--jdk", str(jdk.resolve()), "--source-sha", IMAGE_SOURCE,
               "--mode", "neon-arm64", "--seconds", "180", "--out", str((out / "capture").resolve())]
    summary = {"semantic_status": "pending", "decode_status": "pending", "timing_collected": False}
    try:
        with (out / "runner.log").open("w") as log:
            result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, timeout=330)
        receipt = json.loads((out / "capture/receipt.json").read_text())
        summary["semantic_status"] = receipt["status"]
        print("PR43_NATIVE_SEMANTIC " + json.dumps(receipt))
        analyzed = subprocess.run([sys.executable, str(OWN / "analyze.py"), str(out / "capture")],
                                  text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=60)
        (out / "analyze.log").write_text(analyzed.stdout)
        print(analyzed.stdout)
        summary["decode_status"] = "started"
        decode(out)
        summary["decode_status"] = "decoded-and-40-sequences-per-nmethod-validated"
        if result.returncode or analyzed.returncode:
            raise RuntimeError("Probe or phase analyzer failed; inspect retained records")
        summary["status"] = "functional-and-native-codegen-pass"
    except Exception as error:
        summary["status"] = "incomplete"
        summary["error"] = f"{type(error).__name__}: {error}"
        raise
    finally:
        save(out / "summary.json", summary)
        save(out / "manifest.json", {str(x.relative_to(out)): sha(x) for x in sorted(out.rglob("*")) if x.is_file() and x.name != "manifest.json"})
        print("PR43_NATIVE_SUMMARY " + json.dumps(summary))
        if os.environ.get("GITHUB_STEP_SUMMARY"):
            with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as f:
                f.write("PR43 native parser capture (untimed):\n\n```json\n" + json.dumps(summary, indent=2) + "\n```\n")


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("action", choices=["bind", "capture"])
    p.add_argument("--out", required=True, type=Path)
    p.add_argument("--download", type=Path)
    a = p.parse_args()
    if a.action == "bind":
        bind(a.out)
    elif a.download is None:
        p.error("capture requires --download")
    else:
        capture(a.out, a.download)


if __name__ == "__main__":
    main()
