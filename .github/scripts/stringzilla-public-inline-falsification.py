#!/usr/bin/env python3
"""Falsify two public-wrapper inline directives on unchanged complete images; no performance qualification."""
import base64, hashlib, importlib.util, io, json, os, pathlib, re, shutil, subprocess, sys, tarfile, zipfile
SOURCE = "e036e637a5aff1e2506ff82953a3fbd9fdba6a9d"
BASE = "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda"
HEAD = "f7003b74572a93b774ffb9fe79fcc35a3efcdcb0"
RUN = 39145136082
backend = sys.argv[1]
assert backend in ("msvc", "avx2")
tier = "c2"
binding = {
    "msvc": {"pair_id": 12145286531, "pair_digest": "b4a435c46b18ca0085172e85c334f628a0f40d93516017978eae4576ae11c51c", "producer": 117733444153,
             "result_id": 12146267731, "result_digest": "75213da9a591c3fb9f49c5d615d0fe23509b9a02ab462af4277196fd32a6a175", "result_job": 117744727914,
             "result_run": RUN, "result_head": HEAD, "result_name": "stringzilla-candidate-pilot-results-msvc-c2-" + HEAD + "-attempt1",
             "hashes": {"original": "97417c894aac491cf065347d490002f9638a1f6bf5633fbce4e6626d03d50202", "fork": "889f3ffa57c02045d46158afbafc862f2a0fdc91452f812eb2316f9d3e0ced42"}},
    "avx2": {"pair_id": 12144279572, "pair_digest": "95f054971f775b13b52ece43e6c36297c9d89591713cff363fd8790b7c8a184d", "producer": 117733444034,
             "result_id": 12146008710, "result_digest": "eb83a0e51f4f2bc75fb653202991100d60e08b87822371ea863c96dfb69e5ded", "result_job": 117751315754,
             "result_run": 39152364859, "result_head": "5eb741f73bc6cce9478793ba2101d719a40d3fc7",
             "result_name": "stringzilla-candidate-losses-avx2-c2-5eb741f73bc6cce9478793ba2101d719a40d3fc7-attempt1",
             "hashes": {"original": "be4c017b8a04e2a8c400ea3753a5a3816d0b354b8da6ca8b1952cee61e9442c9", "fork": "bc1eb0494e08b9ec068f0b19f68ce9cd60508aecc81c23f900faccf9f794aa4e"}}
}[backend]
cases = [("lastIndexOf", "UTF16", 127, 4, "END")] if backend == "msvc" else [
    ("lastIndexOf", "MIXED", 4096, 9, "END"), ("lastIndexOfChar", "UTF16", 129, 4, "MISS")]
DIRECTIVES = [
    "-XX:CompileCommand=inline,java.lang.String::lastIndexOf,(Ljava/lang/String;)I",
    "-XX:CompileCommand=inline,java.lang.String::lastIndexOf,(II)I"]
OUT = pathlib.Path("public-inline-diagnostics")
OUT.mkdir()
IMAGES = OUT / "images"
IMAGES.mkdir()
HARNESS = OUT / "harness"
HARNESS.mkdir()
def sha(raw): return hashlib.sha256(raw).hexdigest()
def api(path): return json.loads(subprocess.check_output(["gh", "api", "repos/re-thc/openjdk-jdk27u/" + path], text=True))
def bundle(artifact_id, digest, name, job_id, run=RUN, head=HEAD):
    metadata, job = api("actions/artifacts/" + str(artifact_id)), api("actions/jobs/" + str(job_id))
    assert metadata["id"] == artifact_id and metadata["digest"] == "sha256:" + digest and metadata["name"] == name
    assert metadata["workflow_run"]["id"] == run and metadata["workflow_run"]["head_sha"] == head and not metadata["expired"]
    assert job["id"] == job_id and job["run_id"] == run and job["head_sha"] == head and job["run_attempt"] >= 1
    assert job["conclusion"] == "success" and job["status"] == "completed"
    raw = subprocess.check_output(["gh", "api", "repos/re-thc/openjdk-jdk27u/actions/artifacts/" + str(artifact_id) + "/zip"])
    assert sha(raw) == digest
    archive = zipfile.ZipFile(io.BytesIO(raw))
    assert len(archive.namelist()) == len(set(archive.namelist()))
    return archive, {"artifact": metadata, "job": job}
pair_zip, pair_binding = bundle(binding["pair_id"], binding["pair_digest"],
    "stringzilla-candidate-pilot-pair-" + backend + "-" + HEAD, binding["producer"])
steps = {step["name"]: step["conclusion"] for step in pair_binding["job"]["steps"]}
assert all(steps[name] == "success" for name in ("Verify and archive matched complete pair", "Publish complete images before tests", "Run profiles, jtreg and native contract checks"))
result_zip, result_binding = bundle(binding["result_id"], binding["result_digest"], binding["result_name"],
    binding["result_job"], binding["result_run"], binding["result_head"])
pair = json.loads(pair_zip.read("pair-receipt.json"))
inventories = json.loads(pair_zip.read("pair-inventories.json"))
assert pair == json.loads(result_zip.read("pair-receipt.json"))
assert pair["sources"] == {"original": BASE, "fork": SOURCE} and pair["backend"] == backend
assert str(pair["producer_run"]) == str(RUN) and pair["producer_head"] == HEAD
expected_hashes = binding["hashes"]
assert {k: pair["image_hashes"][k]["tree_sha256"] for k in expected_hashes} == expected_hashes
provenance = [json.loads(l.split(" ", 1)[1]) for l in result_zip.read("experiment.log").decode().splitlines() if l.startswith("STRINGZILLA_PROVENANCE ")]
assert len(provenance) == 1
provenance = provenance[0]
assert provenance["sources"] == pair["sources"] and provenance["runner_sha256"] == "e07344dcabe1355c0352ad6e171aa4e53bfdf027492197bb65eb1f1d7c8cedea"
helper_raw = base64.b64decode(api("git/blobs/52c1221ec64bd1c0a5bbb50fb4c2a9dc06cd6517")["content"])
assert sha(helper_raw) == provenance["runner_sha256"]
helper_path = OUT / "frozen.py"
helper_path.write_bytes(helper_raw)
spec = importlib.util.spec_from_file_location("frozen", helper_path)
helper = importlib.util.module_from_spec(spec)
spec.loader.exec_module(helper)
for control in ("original", "fork"):
    raw = pair_zip.read(control + "-jdk.tar.gz")
    assert sha(raw) == pair_zip.read(control + "-jdk.tar.gz.sha256").decode().split()[0]
    with tarfile.open(fileobj=io.BytesIO(raw), mode="r:gz") as archive:
        assert all(m.name.split("/")[0] == control for m in archive.getmembers())
        archive.extractall(IMAGES, filter="data")
    actual = helper.image((IMAGES / control).resolve())
    assert actual["tree_sha256"] == expected_hashes[control]
    assert actual["files"] == inventories[control]["files"]
for relative, digest in provenance["harness_sha256"].items():
    key = relative if relative.startswith("classes/") else "jmh/" + relative
    raw = result_zip.read(key)
    assert sha(raw) == digest
    target = HARNESS / key
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(raw)
before = {str(p.relative_to(HARNESS)): sha(p.read_bytes()) for p in HARNESS.rglob("*") if p.is_file()}
affinity = helper.pin_cpu()
assert affinity["method"] == ("SetProcessAffinityMask" if backend == "msvc" else "sched_setaffinity")
jars = ["jmh-core-1.37.jar", "jopt-simple-5.0.4.jar", "commons-math3-3.6.1.jar"]
classpath = os.pathsep.join([str((HARNESS / "classes").resolve())] + [str((HARNESS / "jmh" / name).resolve()) for name in jars])
assert len(list((HARNESS / "jmh").glob("*.jar"))) == 4
PROBE = OUT / "backend-probe"
PROBE.mkdir()
for relative, digest in provenance["probe_sha256"].items():
    raw = result_zip.read("backend-probe/" + relative)
    assert sha(raw) == digest
    (PROBE / relative).write_bytes(raw)
assert "BackendProbe.class" in provenance["probe_sha256"]
backend_attestation = {}
for control in ("enabled", "disabled"):
    flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", "-XX:UseAVX=2"]
    flags += ["-XX:TieredStopAtLevel=1"] if tier == "c1" else ["-XX:-TieredCompilation"]
    flags += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics",
              "--add-opens=java.base/java.lang=ALL-UNNAMED"]
    java = IMAGES / "fork" / "bin" / ("java.exe" if os.name == "nt" else "java")
    values = [str(java.resolve()), *flags, "-cp", str(PROBE.resolve()), "BackendProbe"]
    actual = subprocess.check_output(values, text=True, stderr=subprocess.STDOUT).strip()
    expected = ("0" if backend == "msvc" else "1") + ":" + str(control == "enabled").lower()
    assert actual == expected
    backend_attestation[control] = {"actual": actual, "expected": expected, "command": values}
records = []
for benchmark, coder, length, count, position in cases:
    for control in ("original", "enabled", "disabled"):
        image = "original" if control == "original" else "fork"
        java = str((IMAGES / image / "bin" / ("java.exe" if os.name == "nt" else "java")).resolve())
        flags = ["-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", "-XX:UseAVX=2", * (["-XX:TieredStopAtLevel=1"] if tier == "c1" else ["-XX:-TieredCompilation"])]
        if control != "original":
            flags += ["-XX:" + ("+" if control == "enabled" else "-") + "UseStringZillaIntrinsics"]
        flags += ["-Xbatch", "-XX:+UnlockDiagnosticVMOptions", *DIRECTIVES, "-XX:+PrintFlagsFinal", "-XX:+PrintCompilation", "-XX:+PrintInlining",
            "-XX:CompileCommand=print,java.lang.String::lastIndexOf",
            "-XX:CompileCommand=print,org.openjdk.bench.java.lang.StringZillaSearch::lastIndexOf",
            "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOfLatin1",
            "-XX:CompileCommand=print,java.lang.StringUTF16::lastIndexOf",
            "-XX:CompileCommand=print,org.openjdk.bench.java.lang.StringZillaSearch::lastIndexOfChar",
            "-XX:CompileCommand=print,java.lang.StringZilla::lastIndexOfUTF16Latin1C1",
            "-XX:CompileCommand=print,java.lang.StringZilla::matchesUTF16Latin1JavaReverse",
            "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaSearch_lastIndexOf_jmhTest::lastIndexOf_avgt_jmhStub",
            "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.StringZillaSearch_lastIndexOfChar_jmhTest::lastIndexOfChar_avgt_jmhStub"]
        path = OUT / (control + "-" + benchmark + "-" + coder + "-" + str(length) + "-" + str(count) + "-" + position + ".log")
        values = [java, "-XX:ActiveProcessorCount=1", "-XX:+UseSerialGC", "-Xshare:off", "-cp", classpath,
            "org.openjdk.jmh.Main", "StringZillaSearch." + benchmark + "$", "-p", "coder=" + coder, "-p", "length=" + str(length),
            "-p", "needleLength=" + str(count), "-p", "position=" + position, "-f", "1", "-wi", "1", "-w", "500ms",
            "-i", "1", "-r", "500ms", "-foe", "true", "-jvm", java, "-jvmArgs", " ".join(flags)]
        with path.open("w", encoding="utf-8", newline="") as stream:
            completed = subprocess.run(values, stdout=stream, stderr=subprocess.STDOUT, timeout=180)
        assert completed.returncode == 0, path
        raw = path.read_bytes()
        text = raw.decode("utf-8")
        assert "Compiled method (" + tier + ")" in text
        assert "Compiled method (" + ("c2" if tier == "c1" else "c1") + ")" not in text
        assert re.search(r"\bUseAVX\s+[:]?=\s+2\b", text)
        assert "Benchmark" in text and "Result" in text and not re.search(r"JMH had finished, but|<failure>|Exception in thread|CompileCommand: An error occurred", text)
        registrations = [line for line in text.splitlines() if line.startswith("CompileCommand: inline ")]
        assert len(registrations) == 2, registrations
        assert any("java/lang/String.lastIndexOf(Ljava/lang/String;)I" in line for line in registrations), registrations
        assert any("java/lang/String.lastIndexOf(II)I" in line for line in registrations), registrations
        target_lines = [line for line in text.splitlines() if re.search(
            r"java.lang.String(?:Zilla|UTF16|Latin1)?::(?:lastIndexOf|lastIndexOfLatin1|lastIndexOfUTF16Latin1C1|matchesUTF16Latin1)|Compiled method|InlineSmallCode|MaxInlineSize|FreqInlineSize|CompileCommand: inline", line)]
        compiled_headers = re.findall(r"(?ms)^Compiled method [^\n]*\n[\s\S]{0,5000}?(?=^\[MachCode\])", text)
        assert compiled_headers
        receipt = {"compiled_headers": compiled_headers, "control": control, "source": BASE if control == "original" else SOURCE, "backend": backend, "tier": tier,
            "benchmark": "org.openjdk.bench.java.lang.StringZillaSearch." + benchmark,
            "params": {"coder": coder, "length": str(length), "needleLength": str(count), "position": position},
            "command": values, "jvmArgs": flags, "log": path.name, "log_sha256": sha(raw), "returncode": completed.returncode,
            "timing_evidence": False, "inline_directives": DIRECTIVES, "directive_registrations": registrations,
            "selected_lines": target_lines, "all_targeted_lines_retained": True}
        records.append(receipt)
        print("STRINGZILLA_PUBLIC_INLINE_FALSIFICATION " + json.dumps(receipt, separators=(",", ":")), flush=True)
assert before == {str(p.relative_to(HARNESS)): sha(p.read_bytes()) for p in HARNESS.rglob("*") if p.is_file()}
assert {path.name: sha(path.read_bytes()) for path in PROBE.iterdir()} == provenance["probe_sha256"]
for control, digest in expected_hashes.items():
    assert helper.image((IMAGES / control).resolve())["tree_sha256"] == digest
receipt = {"schema": 1, "source": SOURCE, "baseline": BASE, "pair_binding": pair_binding,
    "result_binding": result_binding, "provenance": provenance, "image_hashes": expected_hashes,
    "backend": backend, "tier": tier, "affinity": affinity, "backend_attestation": backend_attestation,
    "probe_sha256": provenance["probe_sha256"], "harness_sha256": before, "records": records, "diagnostic_runs": len(cases) * 3, "timing_evidence": False, "inline_directives": DIRECTIVES,
    "new_jdk_builds": 0, "new_java_compilations": 0}
(OUT / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
print("STRINGZILLA_PUBLIC_INLINE_FALSIFICATION_COMPLETE " + json.dumps({"runs": len(cases) * 3, "timing_evidence": False, "images_unchanged": True, "harness_unchanged": True}), flush=True)
