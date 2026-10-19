#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Inspect saved complete-image SKY call graphs; diagnostic output is never timing evidence."""
import base64
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import platform
import re
import subprocess
import tarfile
import zipfile

HERE = Path(__file__).resolve().parent
SOURCE = "916ba895e834378e3f7eac7f030fc4abff641d33"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
SOURCE_RECORDS = {
    "original": {
        "revision": "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda",
        "runtime_trees": "040000 tree a90cc9b6106f06949724750dbb6be23227ecba82\tbin\n040000 tree 60b42189e64a5a7cfb3dbfcbed7faeff778493d6\tmake\n040000 tree 9483b1544a654c3c698ba7f8685cdf34059badd6\tsrc\n040000 tree 1d64a6e90f219918ee2872974bff8f9b75edf833\ttest"
    },
    "fork": {
        "revision": "916ba895e834378e3f7eac7f030fc4abff641d33",
        "runtime_trees": "040000 tree a90cc9b6106f06949724750dbb6be23227ecba82\tbin\n040000 tree 64d6b10b1481107be1627ebf1243cbd5c163f898\tmake\n040000 tree 7de52d62a1ff5ff5e6103c6d3caff7707894dddc\tsrc\n040000 tree 42c99f77685c06f481b60d8584700412bbc58eb0\ttest"
    }
}
CONTAINER = "ubuntu@sha256:42527649dbc4f9197a6073f426f488cbff0e9cc9f2afce32d91c383e4875634a"
HELPER_SHA = "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
BINDING_BLOB = "41ebed64cec7817b990413427ab1548f8b5ef127"
OUT = Path("sky-jit-output")
PRIVATE = OUT / "private"
PUBLIC = OUT / "compact"
WORK = Path(os.environ["RUNNER_TEMP"]) / "stringzilla-sky-jit"
CASES = (
    ("forward-utf16-char-miss", "indexOfChar", "UTF16", 4096, 4, "MISS"),
    ("mixed16-end", "lastIndexOf", "MIXED", 4096, 16, "END"),
    ("mixed31-end", "lastIndexOf", "MIXED", 4096, 31, "END"),
    ("mixed32-end", "lastIndexOf", "MIXED", 4096, 32, "END"),
    ("latin-char-end", "lastIndexOfChar", "LATIN1", 4096, 4, "END"),
    ("latin4-end", "lastIndexOf", "LATIN1", 4096, 4, "END"),
    ("utf16-char-end", "lastIndexOfChar", "UTF16", 4096, 4, "END"),
    ("utf16-equal", "equals", "UTF16", 4096, 4, "EQUAL"),
)
CONTROLS = ("original", "enabled", "disabled")
METHODS = (
    "java.lang.String::indexOf", "java.lang.String::lastIndexOf", "java.lang.String::equals",
    "java.lang.StringUTF16::indexOf", "java.lang.StringUTF16::indexOfChar0",
    "java.lang.StringUTF16::lastIndexOf", "java.lang.StringUTF16::lastIndexOfLatin1",
    "java.lang.StringUTF16::lastIndexOfLatin1Native",
    "java.lang.StringLatin1::lastIndexOf", "java.lang.StringLatin1::equals",
    "java.lang.StringZilla::matchesUTF16Latin1Reverse", "java.lang.StringZilla::matchesUTF16Latin1JavaReverse",
    "java.lang.StringZilla::lastIndexOfLatin1JavaC2", "java.lang.StringZilla::equalsLatin1",
    "jdk.internal.util.ArraysSupport::mismatch", "jdk.internal.util.ArraysSupport::vectorizedMismatch",
)
TARGET = re.compile(r"(?:java[./]lang[./]String(?:UTF16|Latin1|Zilla)?::|jdk[./]internal[./]util[./]ArraysSupport::|StringZillaSearch.*::)")
FLAGS_SELECTED = ("UseAVX", "UseStringZillaIntrinsics", "UseSSE", "UseSSE42Intrinsics", "SpecialStringIndexOf",
                  "MaxVectorSize", "UseCompressedOops", "UseCompressedClassPointers",
                  "ObjectAlignmentInBytes", "FreqInlineSize", "MaxInlineSize", "InlineSmallCode")

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)

def save(path, value):
    path.write_text(canonical(value) + "\n")

def emit(kind, value):
    print("STRINGZILLA_SKY_JIT_" + kind + " " + canonical(value), flush=True)

def api(path):
    return json.loads(subprocess.check_output(["gh", "api", "repos/re-thc/openjdk-jdk27u/" + path], text=True, timeout=60))

def compact_job(job):
    return {key: job[key] for key in ("id", "run_id", "head_sha", "name", "run_attempt", "status", "conclusion",
                                    "created_at", "started_at", "completed_at")}

def download(artifact_id, digest, name, job_id, run, head):
    metadata, job = api("actions/artifacts/" + str(artifact_id)), api("actions/jobs/" + str(job_id))
    assert metadata["id"] == artifact_id and metadata["name"] == name and metadata["digest"] == digest and not metadata["expired"]
    assert metadata["workflow_run"]["id"] == run and metadata["workflow_run"]["head_sha"] == head
    assert job["id"] == job_id and job["run_id"] == run and job["head_sha"] == head and job["run_attempt"] >= 1
    assert job["status"] == "completed" and job["conclusion"] == "success"
    raw = subprocess.check_output(["gh", "api", "repos/re-thc/openjdk-jdk27u/actions/artifacts/" + str(artifact_id) + "/zip"], timeout=300)
    assert "sha256:" + sha(raw) == digest
    bundle = zipfile.ZipFile(io.BytesIO(raw))
    assert len(bundle.namelist()) == len(set(bundle.namelist()))
    return bundle, {"artifact_id": artifact_id, "digest": digest, "name": name, "job": compact_job(job)}

def physical():
    cpu = min(os.sched_getaffinity(0))
    os.sched_setaffinity(0, {cpu})
    fields = next({key.strip(): value.strip() for key, value in (line.split(":", 1) for line in block.splitlines() if ":" in line)}
                  for block in Path("/proc/cpuinfo").read_text().strip().split("\n\n")
                  if re.search(r"(?m)^processor\s*:\s*" + str(cpu) + r"\s*$", block))
    required = {"avx", "avx2", "bmi1", "bmi2", "f16c", "fma", "movbe", "popcnt", "sse4_1", "sse4_2",
                "ssse3", "cx16", "avx512f", "avx512bw", "avx512vl"}
    flags = set(fields.get("flags", "").split())
    missing = sorted(required - flags)
    if not flags.intersection({"abm", "lzcnt"}):
        missing.append("lzcnt/abm")
    assert os.environ["EXPECTED_CONTAINER_IMAGE"] == CONTAINER and 'VERSION_ID="26.04"' in Path("/etc/os-release").read_text()
    available = platform.machine().lower() in ("amd64", "x86_64") and not missing
    save(PRIVATE / "physical-host.json", {"cpu": cpu, "fields": fields, "machine": platform.machine(),
                                        "container": CONTAINER, "available": available, "missing": missing})
    return {"available": available, "missing": missing, "container": CONTAINER,
            "physical_backend": "avx512", "timing_evidence": False}

def summarize_code(text, path):
    matches = list(re.finditer(r"(?m)^Compiled method \(c2\).*$", text))
    methods = []
    for index, match in enumerate(matches):
        header = match.group()
        if not TARGET.search(header):
            continue
        end = matches[index + 1].start() if index + 1 < len(matches) else len(text)
        segment = text[match.start():end]
        body = re.search(r"\[MachCode\]([\s\S]*?)\[/MachCode\]", segment)
        if not body:
            continue
        code = re.search(r"main code\s+\[(0x[0-9a-fA-F]+),\s*(0x[0-9a-fA-F]+)\]\s*=\s*(\d+)", segment)
        assert code
        start, finish, size = int(code[1], 16), int(code[2], 16), int(code[3])
        assert finish - start == size
        method = re.search(r"([A-Za-z0-9_.$/]+::[A-Za-z0-9_$<>]+)", header)
        assert method
        cells = {}
        for line in body[1].splitlines():
            encoded = re.match(r"^\s*(0x[0-9a-fA-F]+):\s*([0-9a-fA-F |]+)(?:\s*;.*)?$", line)
            if not encoded:
                continue
            address = int(encoded[1], 16)
            packed = encoded[2].replace(" ", "").replace("|", "")
            if not packed or len(packed) % 2:
                continue
            for offset, value in enumerate(bytes.fromhex(packed)):
                location = address + offset
                if start <= location < finish:
                    assert location not in cells
                    cells[location] = value
        row = {"method": method[1].replace("/", "."), "osr": "%" in header, "main_code_bytes": size,
               "entry_mod64": start % 64, "entry_mod4096": start % 4096,
               "machine_listing_sha256": sha(body[1].encode()), "timing_evidence": False}
        frames = set()
        for line in body[1].splitlines():
            frame = re.search(r";\s*-\s*(?:\(reexecute\)\s*)?([A-Za-z0-9_.$/]+::[A-Za-z0-9_$<>]+)@(\d+)", line)
            if frame and TARGET.search(frame[1]):
                frames.add((frame[1].replace("/", "."), int(frame[2])))
        row["selected_callframes"] = [{"method": name, "bci": bci} for name, bci in sorted(frames)]
        if len(cells) == size:
            binary = bytes(cells[address] for address in range(start, finish))
            code_path = path.with_name(path.stem + "-nmethod-" + str(index) + ".bin")
            code_path.write_bytes(binary)
            disassembly = subprocess.check_output(["objdump", "-D", "-b", "binary", "-m", "i386:x86-64", str(code_path)], text=True)
            code_path.with_suffix(".asm").write_text(disassembly)
            instructions = [line.split("\t")[-1].strip() for line in disassembly.splitlines()
                            if re.match(r"^\s*[0-9a-f]+:\s", line) and len(line.split("\t")) >= 3]
            mnemonics = [line.split()[0] for line in instructions if line]
            layout = []
            for line in disassembly.splitlines():
                address = re.match(r"^\s*([0-9a-f]+):\s", line)
                if not address or len(line.split("\t")) < 3:
                    continue
                instruction = line.split("\t")[-1].strip()
                if instruction and instruction.split()[0].startswith("v"):
                    layout.append((start + int(address[1], 16)) % 64)
            row.update({"vector_instruction_offsets_mod64": layout,
                        "main_code_sha256": sha(binary), "decoded_instructions": len(mnemonics),
                        "mnemonics_sha256": sha("\n".join(mnemonics).encode()),
                        "calls": sum(name.startswith("call") for name in mnemonics),
                        "conditional_branches": sum(name.startswith("j") and name != "jmp" for name in mnemonics),
                        "stack_subtract_bytes": sorted({int(value, 16) for value in
                            re.findall(r"\bsub\s+\$0x([0-9a-f]+),%rsp", disassembly)})})
        else:
            row["machine_bytes_scope"] = "Listing hash only; hex dump did not provide a complete main-code range."
        methods.append(row)
    return methods

def run():
    assert not OUT.exists() and not WORK.exists()
    PRIVATE.mkdir(parents=True)
    PUBLIC.mkdir()
    WORK.mkdir()
    gate = physical()
    if not gate["available"]:
        save(PUBLIC / "SKIPPED.json", {**gate, "source": SOURCE, "baseline": BASE, "diagnostic_runs": 0})
        emit("SKIPPED", {**gate, "diagnostic_runs": 0})
        return
    raw_binding = (HERE / "stringzilla-final-sky-jit-binding.json").read_bytes()
    assert hashlib.sha1(("blob " + str(len(raw_binding)) + "\0").encode() + raw_binding).hexdigest() == BINDING_BLOB
    binding = json.loads(raw_binding)
    assert binding["source"] == SOURCE and binding["baseline"] == BASE
    producer = binding["producer"]
    pair_zip, pair_meta = download(producer["pair_id"], producer["pair_digest"],
        "stringzilla-final-pair-avx2-" + producer["head"], producer["job_id"], producer["run"], producer["head"])
    passed = {step["name"]: step["conclusion"] for step in api("actions/jobs/" + str(producer["job_id"]))["steps"]}
    assert all(passed[name] == "success" for name in ("Verify and archive matched complete pair",
        "Publish complete images before tests", "Run profiles, jtreg and native contract checks"))
    result_zip, result_meta = download(binding["artifact"]["id"], binding["artifact"]["digest"],
        binding["artifact"]["name"], binding["job_id"], binding["run"], binding["head"])
    pair_raw = pair_zip.read("pair-receipt.json")
    assert pair_raw == result_zip.read("pair-receipt.json")
    pair, inventories = json.loads(pair_raw), json.loads(pair_zip.read("pair-inventories.json"))
    assert pair["sources"] == {"original": BASE, "fork": SOURCE} and pair["backend"] == "avx2"
    assert pair["source_trees"] == SOURCE_RECORDS
    assert str(pair["producer_run"]) == str(producer["run"]) and pair["producer_head"] == producer["head"]
    assert pair["helper_sha256"] == HELPER_SHA and pair["spec"]["SOURCE_DATE"] == "1792195200"
    assert pair["spec"]["DEBUG_LEVEL"] == "release" and pair["spec"]["VERSION_OPT"] == "stringzilla-benchmark"
    assert all(re.match(r"16\.", pair["spec"][key]) for key in ("CC_VERSION_NUMBER", "CXX_VERSION_NUMBER"))
    assert {key: row["tree_sha256"] for key, row in pair["image_hashes"].items()} == binding["image_hashes"]
    provenance = [json.loads(line.split(" ", 1)[1]) for line in result_zip.read("experiment.log").decode().splitlines()
                  if line.startswith("STRINGZILLA_PROVENANCE ")]
    assert len(provenance) == 1
    provenance = provenance[0]
    assert provenance["sources"] == pair["sources"] and provenance["spec"] == pair["spec"]
    assert provenance["runner_sha256"] == HELPER_SHA and provenance["harness_sha256"] == binding["harness_sha256"]
    assert {key: row["tree_sha256"] for key, row in provenance["image_hashes"].items()} == binding["image_hashes"]
    helper_raw = base64.b64decode(api("git/blobs/52c1221ec64bd1c0a5bbb50fb4c2a9dc06cd6517")["content"])
    assert sha(helper_raw) == HELPER_SHA
    helper_path = WORK / "frozen.py"
    helper_path.write_bytes(helper_raw)
    spec = importlib.util.spec_from_file_location("frozen_sky_jit", helper_path)
    helper = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(helper)
    images = WORK / "images"
    images.mkdir()
    for control in ("original", "fork"):
        raw = pair_zip.read(control + "-jdk.tar.gz")
        assert sha(raw) == pair_zip.read(control + "-jdk.tar.gz.sha256").decode().split()[0]
        with tarfile.open(fileobj=io.BytesIO(raw), mode="r:gz") as archive:
            assert all(member.name.split("/")[0] == control for member in archive.getmembers())
            archive.extractall(images, filter="data")
        actual = helper.image((images / control).resolve())
        assert actual["tree_sha256"] == binding["image_hashes"][control] and actual["files"] == inventories[control]["files"]
    harness = WORK / "harness"
    harness.mkdir()
    for relative, digest in provenance["harness_sha256"].items():
        key = relative if relative.startswith("classes/") else "jmh/" + relative
        assert not Path(key).is_absolute() and ".." not in Path(key).parts
        raw = result_zip.read(key)
        assert sha(raw) == digest
        target = harness / key
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(raw)
    before = {path.relative_to(harness).as_posix(): sha(path.read_bytes()) for path in harness.rglob("*") if path.is_file()}
    driver_raw = base64.b64decode(api("git/blobs/49c9c2646115ec60f0818d4158317c474441c228")["content"])
    assert sha(driver_raw) == "aa58816063dcd6abc6616874449017aa912d751eb329a7315025338444ee59d1"
    runtime_body = driver_raw.decode().split("def runtime_host(args):", 1)[1].split("\ndef ", 1)[0]
    expected_probe = runtime_body.split('source.write_text("""', 1)[1].split('""")', 1)[0].encode()
    probe = WORK / "runtime-probe"
    probe.mkdir()
    assert result_zip.read("runtime-probe/RuntimeProbe.java") == expected_probe
    for name in ("RuntimeProbe.java", "RuntimeProbe.class"):
        (probe / name).write_bytes(result_zip.read("runtime-probe/" + name))
    probe_hashes = {path.name: sha(path.read_bytes()) for path in probe.iterdir()}
    base_flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", "-XX:UseAVX=3", "-XX:-TieredCompilation"]
    attestations = {}
    for control in CONTROLS:
        image = "original" if control == "original" else "fork"
        flags = [*base_flags]
        if control != "original":
            flags += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics",
                      "--add-opens=java.base/java.lang=ALL-UNNAMED"]
        command = [str((images / image / "bin/java").resolve()), *flags, "-cp", str(probe.resolve()),
                   "RuntimeProbe", control, "3"]
        completed = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=90)
        (PRIVATE / ("runtime-" + control + ".log")).write_text(completed.stdout)
        expected = "3" if control == "original" else "3:2:" + str(control == "enabled").lower()
        actual = completed.stdout.strip().splitlines()[-1] if completed.stdout.strip() else ""
        assert completed.returncode == 0 and actual == expected
        attestations[control] = {"actual": actual, "expected": expected, "returncode": completed.returncode}
    classpath = os.pathsep.join(str((harness / relative).resolve()) for relative in
        ("classes", "jmh/jmh-core-1.37.jar", "jmh/jopt-simple-5.0.4.jar", "jmh/commons-math3-3.6.1.jar"))
    records = []
    for label, benchmark, coder, length, count, position in CASES:
        for control in CONTROLS:
            image = "original" if control == "original" else "fork"
            java = str((images / image / "bin/java").resolve())
            stub = "org.openjdk.bench.java.lang.jmh_generated.StringZillaSearch_" + benchmark + "_jmhTest::" + benchmark + "_avgt_jmhStub"
            methods = (*METHODS, "org.openjdk.bench.java.lang.StringZillaSearch::" + benchmark, stub)
            flags = [*base_flags]
            if control != "original":
                flags += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics"]
            flags += ["-Xbatch", "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintFlagsFinal", "-XX:+PrintCompilation",
                      "-XX:+PrintInlining", "-XX:+PrintIntrinsics", *["-XX:CompileCommand=print," + method for method in methods]]
            log = PRIVATE / (control + "-" + label + ".log")
            command = [java, *base_flags, "-cp", classpath, "org.openjdk.jmh.Main",
                r"org.openjdk.bench.java.lang.StringZillaSearch." + benchmark + "$",
                "-p", "coder=" + coder, "-p", "length=" + str(length), "-p", "needleLength=" + str(count),
                "-p", "position=" + position, "-f", "1", "-wi", "3", "-w", "500ms", "-i", "1", "-r", "500ms",
                "-foe", "true", "-jvm", java, "-jvmArgs", " ".join(flags)]
            with log.open("w") as stream:
                completed = subprocess.run(command, stdout=stream, stderr=subprocess.STDOUT, timeout=240)
            assert completed.returncode == 0, log.name
            raw = log.read_bytes()
            text = raw.decode("utf-8", errors="replace")
            assert "Result" in text and not re.search(r"JMH had finished, but|<failure>|Exception in thread", text)
            assert re.search(r"\bUseAVX\s+[:]?=\s+3\b", text)
            if control != "original":
                expected_toggle = "true" if control == "enabled" else "false"
                assert re.search(r"\bUseStringZillaIntrinsics\s+[:]?=\s+" + expected_toggle + r"\b", text)
            assert "Compiled method (c1)" not in text
            parameters = re.findall(r"(?m)^# Parameters: \((.*)\)$", text)
            assert parameters and all(dict(part.split(" = ", 1) for part in item.split(", ")) ==
                {"coder": coder, "length": str(length), "needleLength": str(count), "position": position} for item in parameters)
            inlining = list(dict.fromkeys(line.strip() for line in text.splitlines() if TARGET.search(line) and
                        re.search(r"\(\d+ bytes\)|inline|intrinsic|made not entrant", line) and
                        not re.match(r"^\s*(?:0x[0-9a-fA-F]+:|;|#)", line)))
            code = summarize_code(text, log)
            stub_records = [row for row in code if row["method"] == stub]
            assert stub_records, "No warmed C2 JMH stub was captured: " + log.name
            selected = {name: re.findall(r"(?m)^\s*(?:\w+)\s+" + re.escape(name) + r"\s+[:]?=\s+(\S+)", text)[-1:]
                        for name in FLAGS_SELECTED}
            record = {"source": BASE if control == "original" else SOURCE, "baseline": BASE, "control": control,
                      "case": label, "benchmark": "org.openjdk.bench.java.lang.StringZillaSearch." + benchmark,
                      "params": {"coder": coder, "length": str(length), "needleLength": str(count), "position": position},
                      "backend": "avx512", "tier": "c2", "jvmArgs": flags, "log": log.name, "log_sha256": sha(raw),
                      "timing_evidence": False, "selected_flags": selected, "inlining_lines": inlining,
                      "nmethods": code, "last_printed_jmh_stub": stub_records[-1],
                      "nmethod_scope": "Captured during the exact warmed diagnostic; main-code counts include cold branches and are not an executed hot-path trace.",
                      "code_hash_scope": "Raw main-code bytes when complete; mnemonic sequence hash ignores operands. No equality of hot paths is inferred from either alone."}
            records.append(record)
            save(PUBLIC / (control + "-" + label + ".json"), record)
            emit("RECORD", record)
    assert len(records) == 24
    assert before == {path.relative_to(harness).as_posix(): sha(path.read_bytes()) for path in harness.rglob("*") if path.is_file()}
    assert probe_hashes == {path.name: sha(path.read_bytes()) for path in probe.iterdir()}
    for image, digest in binding["image_hashes"].items():
        assert helper.image((images / image).resolve())["tree_sha256"] == digest
    receipt = {"source": SOURCE, "baseline": BASE, "image_hashes": binding["image_hashes"], "pair_receipt_sha256": sha(pair_raw),
               "producer": pair_meta, "saved_harness_result": result_meta, "harness_sha256": sha(canonical(before).encode()),
               "runtime_attestation": attestations, "physical": gate, "diagnostic_runs": len(records),
               "new_jdk_builds": 0, "new_java_compilations": 0, "timing_evidence": False,
               "images_unchanged": True, "harness_unchanged": True, "full_assembly_scope": "Original private GHA diagnostic artifact only"}
    save(PUBLIC / "receipt.json", receipt)
    emit("COMPLETE", receipt)

if __name__ == "__main__":
    run()
