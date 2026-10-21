#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
"""Matched native Apple indexing comparison; fixed bounds, no retries or extra samples."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import signal
import statistics
import subprocess
import time
import urllib.request
import xml.etree.ElementTree as ET
import probe
import native_ci
import apple_decode

SOURCES = {"A": "456afea88231bc9ebf17dfa48811db90a8bae8b8",
           "B": "2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1"}
OWN = Path(__file__).resolve().parent
TARGET = "org.simdjson.StructuralIndexer index128 "
WORKLOADS = ["long", "escaped", "short-tail"]
ENV = {k: v for k, v in os.environ.items()
       if k not in ["JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "CLASSPATH"]}

def sha(p):
    h = hashlib.sha256()
    with Path(p).open("rb") as f:
        for block in iter(lambda: f.read(1048576), b""):
            h.update(block)
    return h.hexdigest()

def save(p, value):
    Path(p).write_text(json.dumps(value, indent=2) + "\n")

def command(args, log, seconds, cwd=None):
    started = time.time()
    result = {"command": list(map(str, args)), "timeout_seconds": seconds}
    with Path(log).open("w") as output:
        try:
            p = subprocess.Popen(list(map(str, args)), cwd=cwd, env=ENV, stdout=output,
                                 stderr=subprocess.STDOUT, start_new_session=True)
            p.wait(timeout=seconds)
            result["returncode"] = p.returncode
        except subprocess.TimeoutExpired:
            os.killpg(p.pid, signal.SIGKILL)
            p.wait()
            result["timeout"] = True
    result["elapsed_seconds"] = time.time() - started
    save(str(log) + ".receipt.json", result)
    return result.get("returncode") == 0

def checked(args, log, seconds, cwd=None):
    if not command(args, log, seconds, cwd):
        raise RuntimeError("Command failed; inspect " + str(log))

def validate_host(system, machine, arm64, translated, uname):
    if system != "Darwin" or machine not in ["arm64", "aarch64"] or uname.strip() != "arm64":
        raise RuntimeError("Require native Darwin ARM64, not a runner-label inference")
    if arm64.strip() != "1" or translated.strip() not in ["", "0"]:
        raise RuntimeError("Require ARM64 hardware and no translated execution")

def host(out):
    def output(args):
        return subprocess.check_output(args, text=True, timeout=30, env=ENV).strip()
    system, machine = platform.system(), platform.machine()
    if system != "Darwin":
        raise RuntimeError("Native Darwin required")
    arm64 = output(["sysctl", "-n", "hw.optional.arm64"])
    translated = output(["sysctl", "-in", "sysctl.proc_translated"])
    uname = output(["uname", "-m"])
    validate_host(system, machine, arm64, translated, uname)
    record = {"system": system, "machine": machine, "uname_machine": uname,
              "hw.optional.arm64": arm64, "sysctl.proc_translated": translated or "not exposed",
              "hardware": output(["sysctl", "hw.model", "machdep.cpu.brand_string", "hw.ncpu", "hw.memsize"]),
              "os": output(["sw_vers"]), "xcode": output(["xcodebuild", "-version"]),
              "clang": output(["xcrun", "clang", "--version"]),
              "otool": output(["xcrun", "--find", "otool"])}
    if not record["xcode"].startswith("Xcode 26.6\n"):
        raise RuntimeError("Require the repository's Xcode 26.6 recipe")
    save(out / "host.json", record)
    checked(["df", "-h"], out / "disk.txt", 30)
    return record

def bind(out):
    out.mkdir(exist_ok=False)
    if (os.environ.get("GITHUB_REPOSITORY") != native_ci.REPO or
        os.environ.get("GITHUB_REF") != "refs/heads/codex/pr43-macos-qualification" or
        os.environ.get("GITHUB_EVENT_NAME") != "workflow_dispatch" or
        os.environ.get("GITHUB_RUN_ATTEMPT") != "1"):
        raise RuntimeError("Require one manual attempt on the existing qualification branch")
    event=json.loads(Path(os.environ["GITHUB_EVENT_PATH"]).read_text())
    inputs=event["inputs"]
    assert str(inputs.get("pr43_apple_comparison")).lower()=="true"
    for other in ["pr43_native_comparison", "pr43_native_parser_probe", "pr43_full_parser_sve"]:
        assert str(inputs.get(other, False)).lower()=="false"
    req=urllib.request.Request("https://api.github.com/repos/"+native_ci.REPO+"/pulls/43",
        headers={"Authorization":"Bearer "+os.environ["GITHUB_TOKEN"]})
    with urllib.request.urlopen(req,timeout=30) as response: pr=json.load(response)
    assert pr["head"]["sha"]==SOURCES["B"] and pr["state"]=="open" and not pr["merged"]
    save(out/"binding.json", {"qualification_sha":os.environ["GITHUB_SHA"], "sources":SOURCES,
        "parser":probe.PARSER,"pr":pr,"run_id":os.environ["GITHUB_RUN_ID"]})
    # Host/decoder checks follow standard toolchain selection, before either JDK build.

def macho_arm64(path):
    import struct
    header=Path(path).read_bytes()[:8]
    if len(header)!=8 or struct.unpack("<II",header)!=(0xfeedfacf,0x0100000c):
        raise RuntimeError("Require a thin native ARM64 Mach-O executable: "+str(path))

def decoder_control(out):
    import struct
    obj=out/"decoder-control.o"
    obj.write_bytes(apple_decode.macho_object(struct.pack("<II",0xd2800020,0xd65f03c0)))
    listing=out/"decoder-control.txt"
    checked(["xcrun","otool","-tvV",obj],listing,30)
    if not apple_decode.verify_otool_control(listing.read_text()):
        raise RuntimeError("Mach-O/otool known-byte control failed")

def build(root, out, boot, label):
    out.mkdir(exist_ok=True)
    directory=out/label
    directory.mkdir(exist_ok=False)
    host(directory)
    decoder_control(directory)
    macho_arm64(boot/"bin/java")
    tree=root/label
    actual=subprocess.check_output(["git","rev-parse","HEAD"],cwd=tree,text=True).strip()
    dirty=subprocess.check_output(["git","status","--porcelain","--untracked-files=no"],cwd=tree,text=True)
    if actual!=SOURCES[label] or dirty:
        raise RuntimeError("Require clean exact source "+label)
    source=SOURCES[label]
    begin=time.monotonic()
    def remaining(reserve=0):
        available=int(2670-(time.monotonic()-begin)-reserve)
        if available<=0: raise RuntimeError("Build budget exhausted; no retry or extension")
        return available
    flags=["bash","bin/configure-dev","--with-conf-name=pr43","--with-debug-level=release",
           "--with-version-opt=pr43-"+source,"--with-boot-jdk="+str(boot),
           "--with-zlib=system","--with-jmod-compress=zip-1",
           "--with-external-symbols-in-bundles=none","--with-native-debug-symbols-level=1"]
    try:
        checked(flags,directory/"configure.log",min(300,remaining()),tree)
        checked(["make","CONF=pr43","JOBS="+str(os.cpu_count()),"images"],directory/"build.log",remaining(30),tree)
        checked(["bash",".github/scripts/check-dev-profile.sh","build/pr43/images/jdk","build/pr43/spec.gmk"],
                directory/"profile.log",min(30,remaining()),tree)
    finally:
        for rel in ["build/pr43/spec.gmk","build/pr43/configure.log","build/pr43/config.log"]:
            if (tree/rel).exists():shutil.copyfile(tree/rel,directory/Path(rel).name)
    jdk=tree/"build/pr43/images/jdk"
    macho_arm64(jdk/"bin/java")
    save(out/(label+"-image.json"),{"source":source,"flags":flags,"java":sha(jdk/"bin/java"),
        "libjvm":sha(jdk/"lib/server/libjvm.dylib"),"release":(jdk/"release").read_text(),
        "elapsed_seconds":time.monotonic()-begin,"boot_java":sha(boot/"bin/java"),"boot_release":(boot/"release").read_text()})

def vm_flags(directory):
    return ["--add-modules", "jdk.incubator.vector", "-Dorg.simdjson.species=128",
            "-XX:UseSVE=0", "-XX:MaxVectorSize=16", "-XX:-TieredCompilation", "-Xbatch",
            "-XX:CompileThreshold=1000", "-XX:CICompilerCount=1", "-Xms256m", "-Xmx256m",
            "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation", "-XX:+PrintCompilation",
            "-XX:LogFile=" + str(directory / "hotspot.xml"),
            "-XX:CompileCommand=dontinline,org.simdjson.StructuralIndexer::index128"]

def stability(directory):
    console = (directory / "console.log").read_text()
    root = ET.parse(directory / "hotspot.xml").getroot()
    methods = [dict(e.attrib) for e in root.iter("nmethod") if e.get("method", "").startswith(TARGET)]
    ids = {e["compile_id"] for e in methods}
    # LogCompilation puts runtime records inside <tty>. Also accept root-level
    # records for older/synthetic logs; never descend into compilation tasks.
    runtime_records = list(root)
    for tty in root.findall("tty"):
        runtime_records.extend(tty)
    events = [dict(e.attrib, event=e.tag) for e in runtime_records if e.tag in
              ["uncommon_trap", "make_not_entrant", "deoptimized"] and e.get("compile_id") in ids]
    windows = {}
    for name in WORKLOADS:
        starts = re.findall(r"^MEASURE_BEGIN " + name + r" (\d+)$", console, re.M)
        ends = re.findall(r"^MEASURE_END " + name + r" (\d+)$", console, re.M)
        reasons = []
        if len(starts) != 1 or len(ends) != 1:
            windows[name] = {"eligible": False, "reasons": ["missing measurement markers"]}
            continue
        start, end = int(starts[0])/1000, int(ends[0])/1000
        normals = [e for e in methods if e.get("compile_kind") != "osr" and e.get("compiler") == "c2" and float(e["stamp"]) < start-.002]
        if not normals:
            reasons.append("no normal C2 nmethod installed before measurement")
        else:
            latest = max(normals, key=lambda e: float(e["stamp"]))
            if any(e.get("compile_id") == latest["compile_id"] and e["event"] in
                   ["make_not_entrant", "deoptimized"] and float(e["stamp"]) <= end+.002 for e in events):
                reasons.append("normal nmethod invalidated before/during measurement")
        if any(start-.002 <= float(e["stamp"]) <= end+.002 for e in methods + events):
            reasons.append("parser installation/runtime event overlaps measurement (2ms guard)")
        windows[name] = {"start": start, "end": end, "eligible": not reasons, "reasons": reasons}
    return {"nmethods": methods, "runtime_events": events, "windows": windows}

def all_runtime(directory, windows):
    root=ET.parse(directory/"hotspot.xml").getroot()
    methods=[dict(e.attrib) for e in root.iter("nmethod") if e.get("method","").startswith("org.simdjson.")]
    ids={e["compile_id"] for e in methods}
    records=list(root)
    for tty in root.findall("tty"): records.extend(tty)
    events=[dict(e.attrib,event=e.tag) for e in records if e.tag in ["uncommon_trap","make_not_entrant","deoptimized"] and e.get("compile_id") in ids]
    overlaps={w:[e for e in methods+events if v["start"]-.002<=float(e["stamp"])<=v["end"]+.002]
              for w,v in windows.items() if "start" in v}
    return {"nmethods":methods,"runtime_events":events,"guarded_window_overlaps":overlaps,
            "scope":"All org.simdjson methods, including timing harness; no observations excluded or replaced by this audit"}

def diagnostic(jdk, classes, directory, label):
    directory.mkdir()
    args = [jdk / "bin/java"] + vm_flags(directory) + [
        "-XX:CompileCommand=print,org.simdjson.StructuralIndexer::index128", "-cp", classes,
        "org.simdjson.PR43ParserProbe"]
    ok = command(args, directory / "console.log", 180)
    text = (directory / "console.log").read_text()
    result = {"process_ok": ok, "semantic_pass": "PR43_PARSER_PASS checks=1701 " in text,
              "nmethods": [], "raw_review_required": True}
    try:
        for meta, body in native_ci.code_blocks(text):
            binary = directory / (meta["compile_id"] + ".bin")
            binary.write_bytes(body)
            listing = directory / (meta["compile_id"] + ".asm")
            obj=directory/(meta["compile_id"]+".o")
            obj.write_bytes(apple_decode.macho_object(body))
            checked(["xcrun","otool","-tvV",obj],listing,30)
            if not listing.read_text().strip(): raise RuntimeError("Empty native listing")
            fused=apple_decode.fused_sequences(body)
            meta.update({"sha256": sha(binary), "instructions": len(body)//4,
                         "fused_sequences": fused, "fused_count": len(fused)})
            result["nmethods"].append(meta)
        result["code_gate"] = (any(x["kind"] == "normal" for x in result["nmethods"])
                               and all(x["fused_count"] == (40 if label == "B" else 0)
                                       and all(s["all_operands_valid"] for s in x["fused_sequences"])
                                       for x in result["nmethods"]))
    except Exception as error:
        result["error"] = str(error)
        result["code_gate"] = False
    save(directory / "review.json", result)
    print("PR43_DIAGNOSTIC " + json.dumps(result), flush=True)
    return ok and result["semantic_pass"] and result["code_gate"]

def summarize(records):
    result = {}
    for workload in WORKLOADS:
        pairs = []
        for pair in range(12):
            rows = {r["label"]: r for r in records if r["pair"] == pair}
            entry = {"pair": pair, "order": "AB" if pair % 2 == 0 else "BA"}
            if len(rows) == 2 and all(workload in r.get("results", {}) for r in rows.values()):
                entry["B_over_A"] = rows["B"]["results"][workload]["bytes_per_second"] / rows["A"]["results"][workload]["bytes_per_second"]
                entry["eligible"] = all(r.get("process_ok") and r.get("stability", {}).get("windows", {}).get(workload, {}).get("eligible", False) for r in rows.values())
                entry["reasons"] = {k: r.get("stability", {}).get("windows", {}).get(workload, {}).get("reasons", ["missing stability"]) for k, r in rows.items()}
                if rows["A"].get("corpus") != rows["B"].get("corpus") or rows["A"]["results"][workload]["checksum"] != rows["B"]["results"][workload]["checksum"]:
                    entry["eligible"] = False
                    entry["data_mismatch"] = True
            else:
                entry.update(eligible=False, reasons="missing result or process failure")
            pairs.append(entry)
        def stats(xs):
            return {"n": len(xs), "median": statistics.median(xs), "min": min(xs), "max": max(xs),
                    "q1": statistics.quantiles(xs, n=4, method="inclusive")[0] if len(xs)>1 else xs[0],
                    "q3": statistics.quantiles(xs, n=4, method="inclusive")[2] if len(xs)>1 else xs[0]} if xs else {"n": 0}
        result[workload] = {"pairs": pairs,
                            "all_observed": stats([x["B_over_A"] for x in pairs if "B_over_A" in x]),
                            "stable_pairs": stats([x["B_over_A"] for x in pairs if x["eligible"]])}
    return result

def parse_results(text):
    corpus = re.findall(r"^CORPUS (\S+) ([0-9a-f]{64})$", text, re.M)
    results = re.findall(r"^RESULT (\S+) (\d+) (\d+) (\d+) (-?\d+)$", text, re.M)
    if sorted(w for w,_ in corpus) != sorted(WORKLOADS) or sorted(row[0] for row in results) != sorted(WORKLOADS):
        raise RuntimeError("Require exactly one corpus and result for each workload")
    parsed={}
    for w,n,b,ns,c in results:
        if min(int(n),int(b),int(ns))<=0: raise RuntimeError("Nonpositive measurement extent")
        parsed[w]={"iterations":int(n),"bytes_per_batch":int(b),"nanos":int(ns),"checksum":c,
                   "bytes_per_second":int(n)*int(b)*1e9/int(ns)}
    return {"corpus":dict(corpus),"results":parsed}

def compare(root, out):
    out.mkdir(exist_ok=False)
    deadline = time.monotonic() + 1740  # Leave one minute for final records before the step cap.
    host(out)
    decoder_control(out)
    source = out / "source/org/simdjson"
    source.mkdir(parents=True)
    for name, expected in probe.EXPECTED.items():
        url = f"https://raw.githubusercontent.com/simdjson/simdjson-java/{probe.PARSER}/src/main/java/org/simdjson/{name}"
        with urllib.request.urlopen(url, timeout=30) as response:
            body = response.read()
        if hashlib.sha256(body).hexdigest() != expected:
            raise RuntimeError("Parser hash mismatch")
        (source / name).write_bytes(body)
    for name in ["PR43ParserProbe.java", "PR43ParserTiming.java"]:
        shutil.copyfile(OWN / name, source / name)
    jdks = {k: root / k / "build/pr43/images/jdk" for k in SOURCES}
    images = {k: {"source": SOURCES[k], "java": sha(p / "bin/java"), "libjvm": sha(p / "lib/server/libjvm.dylib")} for k,p in jdks.items()}
    built = {k: json.loads((root / "apple-build-evidence" / (k+"-image.json")).read_text()) for k in SOURCES}
    for k in SOURCES:
        if any(images[k][field] != built[k][field] for field in ["source", "java", "libjvm"]):
            raise RuntimeError("Image changed after build")
    save(out / "inputs.json", {"images": images, "parser": probe.PARSER,
                               "source_hashes": {p.name: sha(p) for p in source.glob("*.java")},
                               "pairs": 12, "warmup_total_seconds": 15, "measurement_total_seconds": 30})
    classes = out / "classes"
    checked([jdks["A"] / "bin/javac", "--add-modules", "jdk.incubator.vector", "-encoding", "UTF-8",
             "-d", classes] + sorted(source.glob("*.java")), out / "javac.log", 60)
    gates = {k: diagnostic(jdks[k], classes, out / ("diagnostic-" + k), k) for k in SOURCES}
    save(out / "diagnostic-gates.json", gates)
    if not all(gates.values()):
        raise RuntimeError("Diagnostic gate failed; no timing launches")
    records = []
    for pair in range(12):
        for label in ("AB" if pair % 2 == 0 else "BA"):
            if time.monotonic() + 60 > deadline:
                save(out / "summary.json", summarize(records))
                save(out / "completion.json", {"launches": len(records), "status": "budget-exhausted", "planned_launches": 24})
                raise RuntimeError("Comparison budget exhausted; no replacement or extension")
            directory = out / f"pair-{pair:02d}-{label}"
            directory.mkdir()
            args = [jdks[label] / "bin/java"] + vm_flags(directory) + ["-cp", classes, "org.simdjson.PR43ParserTiming", str(pair % 3)]
            row = {"pair": pair, "label": label, "process_ok": command(args, directory / "console.log", 60)}
            text = (directory / "console.log").read_text()
            try:
                row.update(parse_results(text))
            except Exception as error:
                row["result_error"] = str(error)
            try:
                row["stability"] = stability(directory)
            except Exception as error:
                row["stability_error"] = str(error)
            try:
                row["all_parser_and_harness_runtime"] = all_runtime(directory, row.get("stability",{}).get("windows",{}))
            except Exception as error:
                row["runtime_audit_error"] = str(error)
            records.append(row)
            save(out / "observations.json", records)
            print("PR43_OBSERVATION " + json.dumps(row), flush=True)
    result = summarize(records)
    save(out / "summary.json", result)
    print("PR43_PAIRED_SUMMARY " + json.dumps(result), flush=True)
    unchanged = all(images[k]["java"] == sha(p / "bin/java") and images[k]["libjvm"] == sha(p / "lib/server/libjvm.dylib") for k,p in jdks.items())
    incomplete = [r for r in records if set(r.get("results", {})) != set(WORKLOADS)
                  or set(r.get("corpus", {})) != set(WORKLOADS) or "stability_error" in r or "runtime_audit_error" in r]
    mismatched = any(p.get("data_mismatch") for w in result.values() for p in w["pairs"])
    save(out / "completion.json", {"launches": len(records), "images_unchanged": unchanged,
                                   "stable_pair_counts": {w: x["stable_pairs"]["n"] for w,x in result.items()},
                                   "incomplete_observations": len(incomplete), "data_mismatch": mismatched,
                                   "scope": "Native Apple stage-one indexing plus index consumption; parser-stable subset, separate harness event audit; no universal-win gate"})
    if not unchanged or incomplete or mismatched or any(not r["process_ok"] for r in records):
        raise RuntimeError("Recorded process/image failure; observations retained without replacement")

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("action", choices=["bind", "build", "compare"])
    parser.add_argument("--label",choices=["A","B"])
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--boot", type=Path)
    args = parser.parse_args()
    root, out = args.root.resolve(), args.out.resolve()
    try:
        if args.action == "bind":
            bind(out)
        elif args.action == "build":
            if not args.label or not args.boot: raise RuntimeError("Build needs label and BootJDK")
            build(root, out, args.boot.resolve(), args.label)
        else:
            compare(root, out)
    finally:
        if out.exists():
            save(out / "manifest.json", {str(p.relative_to(out)): sha(p) for p in out.rglob("*") if p.is_file() and p.name != "manifest.json"})

if __name__ == "__main__":
    main()
