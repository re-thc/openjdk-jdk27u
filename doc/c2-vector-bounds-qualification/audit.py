#!/usr/bin/env python3
"""Audit archived receipts only. Never runs a JVM, compiler or benchmark."""
import argparse
import hashlib
import html
import json
from pathlib import Path
import re
import shlex
import subprocess
import tarfile
import xml.etree.ElementTree as ET

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; audit assertions are required")

BASE = "89885a6288e7aaabd01678a704a586272c0f96e3"
PREREQ = "0c097b2e91d2a0b9cf32db95166650dbed35871e"
CANDIDATE = "c4be5c3a666ff4e237133474ac830bbd1e09ad6c"
CODEC = "6abf77e2f63b68cc9269d5823e206235ab254c04"
METHODS = ("copy", "ordered", "differentOffset", "differentIndex",
           "differentArray", "signed", "conditional")
HASH_CACHE = {}


def digest(path):
    stat = path.stat()
    identity = (stat.st_dev, stat.st_ino, stat.st_size, stat.st_mtime_ns)
    if identity in HASH_CACHE:
        return HASH_CACHE[identity]
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(4 << 20), b""):
            h.update(block)
    HASH_CACHE[identity] = h.hexdigest()
    return HASH_CACHE[identity]


def tree_digest(root):
    h = hashlib.sha256()
    count, size = 0, 0
    for path in sorted(root.rglob("*")):
        if path.is_file():
            h.update(str(path.relative_to(root)).encode() + b"\0" + digest(path).encode() + b"\n")
            count += 1
            size += path.stat().st_size
    return {"path": str(root), "sha256": h.hexdigest(), "files": count, "bytes": size}


def tags(text, name):
    return [ET.fromstring(t).attrib for t in re.findall(
        rf"<{name}\b[^>]*?/>", text)]


def graph_summary(text):
    nodes = [s for s in html.unescape(text).splitlines()
             if re.match(r"\s*\d+\s+\w+\s+===", s)]
    return {
        "range_checks": sum(bool(re.match(r"\s*\d+\s+RangeCheck\b", s)) for s in nodes),
        "source_vector_range_checks": sum(bool(re.match(
            r"\s*\d+\s+RangeCheck\b.*Objects::checkIndex.*ByteVector::fromArray", s)) for s in nodes),
        "byte_vector_loads_16": sum(bool(re.match(
            r"\s*\d+\s+LoadVector\b.*#vector\w*<B,16>", s)) for s in nodes),
        "nonfloating_casts": sum(bool(re.match(
            r"\s*\d+\s+CastII\b.*non-floating", s)) for s in nodes),
    }


def ir_receipt(path):
    text = path.read_text()
    nmethods = {n["compile_id"]: n for n in tags(text, "nmethod")}
    result = {}
    for attrs, graph in re.findall(r"<ideal\b([^>]*)>(.*?)</ideal>", text, re.S):
        a = ET.fromstring("<ideal " + attrs + "/>").attrib
        n = nmethods.get(a["compile_id"], {})
        if n.get("compiler") != "c2" or n.get("compile_kind") == "osr":
            continue
        if a.get("compile_phase") != "AFTER_MACRO_EXPANSION":
            continue
        method = n.get("method", "").split()
        if len(method) < 2 or method[1] not in METHODS:
            continue
        result[method[1]] = {"compile_id": a["compile_id"], "compiler": "c2",
                             "entry": "normal", **graph_summary(graph)}
    assert set(result) == set(METHODS), (path, result.keys())
    for method, r in result.items():
        if method == "copy":
            r["assertions_hold"] = r["source_vector_range_checks"] == 0 and r["byte_vector_loads_16"] == 1
        elif method == "ordered":
            r["assertions_hold"] = (r["range_checks"] == 0 and r["byte_vector_loads_16"] == 1
                                     and r["nonfloating_casts"] >= 1)
        else:
            r["assertions_hold"] = r["range_checks"] >= 1
    return result


def assembly_receipt(path):
    result = []
    for block in re.split(r"(?=Compiled method \(c2\))", path.read_text())[1:]:
        header = block.splitlines()[0]
        m = re.search(r"main code\s+\[[^\n]*= (\d+)", block)
        assert m, header
        result.append({"header": header.strip(), "entry": "osr" if "%" in header else "normal",
                       "main_code_bytes": int(m[1])})
    assert {r["entry"] for r in result} == {"osr", "normal"}
    return result


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--repo", type=Path, required=True)
    p.add_argument("--receipts", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True, help="new private directory")
    args = p.parse_args()
    repo, root, out = args.repo.resolve(), args.receipts.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=False)
    selected = []
    report = {"paths": {"repo": str(repo), "receipts": str(root)},
              "source": {"base": BASE, "shared_prerequisite": PREREQ, "candidate": CANDIDATE,
                         "codec": CODEC}, "ir": {}, "assembly": {}, "flags": {}}
    for side, pid, flag_pid in [("baseline", "76944", "76889"), ("candidate", "79849", "79795")]:
        scratch = root / f"jtreg-{side}-debug-work/scratch"
        log = scratch / f"hotspot_pid{pid}.log"
        selected += [log, scratch / f"pid-{pid}-output.log", scratch / f"pid-{flag_pid}-output.log",
                     scratch / f"test-vm-flags-pid-{flag_pid}.log",
                     scratch / f"test-vm-compile-commands-pid-{flag_pid}.log",
                     root / f"jtreg-{side}-debug-work/compiler/vectorapi/TestDuplicateVectorBounds.jtr"]
        selected.append(root / f"jtreg-{side}-debug-work/classes/compiler/vectorapi/TestDuplicateVectorBounds.d/compiler/vectorapi/TestDuplicateVectorBounds.class")
        report["ir"][side] = ir_receipt(log)
        output = (scratch / f"pid-{pid}-output.log").read_text()
        assert "-DShouldDoIRVerification=true" in output
        assert "-XX:LoopMaxUnroll=0" in output
        assert "-Djdk.incubator.vector.VECTOR_ACCESS_OOB_CHECK=2" in output
        report["flags"][side + "_ir"] = {
            "framework_ir_enabled": True, "LoopMaxUnroll": 0, "VECTOR_ACCESS_OOB_CHECK": 2,
            "BackgroundCompilation": False, "MaxVectorSize_numeric": None,
            "rule_socket_encoding_archived": False,
            "capability_evidence": "normal C2 graph contains 16-byte byte-vector loads; baseline failed applicable rules",
        }
        for suffix in ("matched", "nounroll"):
            asm, xml = root / f"{side}-{suffix}.asm", root / f"{side}-{suffix}.xml"
            selected += [asm, xml, root / f"{side}-{suffix}-1.dis"]
            report["assembly"][side + "_" + suffix] = assembly_receipt(asm)
            text = xml.read_text()
            report["flags"][side + "_" + suffix] = html.unescape(re.search(
                r"<vm_arguments>.*?<args>(.*?)</args>", text, re.S)[1]).strip()
            ns = [n for n in tags(text, "nmethod") if n.get("compiler") == "c2"
                  and n.get("method", "").startswith("Copy copy ")]
            assert any(n.get("compile_kind") != "osr" for n in ns)
        assert all(v["assertions_hold"] for k, v in report["ir"][side].items()
                   if k not in ("copy", "ordered"))
    assert {k for k, v in report["ir"]["baseline"].items() if not v["assertions_hold"]} == {"copy", "ordered"}
    assert all(v["assertions_hold"] for v in report["ir"]["candidate"].values())
    selected += [root / f for f in ["ifnode.original.cpp", "RESULTS.md", "Copy.java", "Copy.class",
                 "baseline-ordered-graph.txt", "candidate-ordered-graph.txt",
                 "incremental-release.py", "incremental-release-candidate.py",
                 "baseline-debug-vm/compile-args.txt"]]
    selected += sorted(root.glob("test-*.log"))
    selected += sorted(p for p in (root / "qualification-reference").rglob("*") if p.is_file())
    native = {}
    object_lists = []
    for side in ("baseline", "candidate"):
        vm = root / f"{side}-release-vm"
        selected += [vm / f for f in ("objects.txt", "compile.log", "link.log")]
        objects = shlex.split((vm / "objects.txt").read_text())
        object_lists.append(["<replaced-ifnode>" if Path(f).name == "ifnode.o" else f for f in objects])
        jdk = root / f"{side}-release-jdk"
        runtime = [jdk / "lib/modules"] if (jdk / "lib/modules").is_file() else [
            jdk / "modules/java.base/java/lang/Object.class",
            jdk / "modules/jdk.incubator.vector/jdk/incubator/vector/ByteVector.class",
            jdk / "modules/jdk.incubator.vector/jdk/incubator/vector/VectorIntrinsics.class"]
        native[side] = [vm / "libjvm.so", vm / "ifnode.o", jdk / "bin/java", *runtime]
        assert (root / f"{side}-release-jdk/lib/server/libjvm.so").samefile(vm / "libjvm.so")
    assert object_lists[0] == object_lists[1], "non-ifnode link inputs differ"
    report["native_link"] = {"same_non_ifnode_object_paths": True,
                             "object_count": len(object_lists[0]),
                             "historical_object_hashes_archived": False}
    for conf in ("cloud-gcc16", "vector-bounds-debug"):
        objs = repo / f"build/{conf}/hotspot/variant-server/libjvm/objs"
        selected += [repo / f"build/{conf}/spec.gmk", objs / "ifnode.o.cmdline", objs / "BUILD_LIBJVM_run_ld.cmdline"]
    selected += [repo / "src/hotspot/share/opto/ifnode.cpp",
                 repo / "src/hotspot/share/runtime/javaThread.inline.hpp",
                 repo / "test/hotspot/jtreg/compiler/vectorapi/TestDuplicateVectorBounds.java"]
    for side, paths in native.items():
        report.setdefault("native_hashes", {})[side] = {str(x): digest(x) for x in paths}
    for side, jdk in [("baseline", root / "baseline-debug-jdk"),
                      ("candidate", repo / "build/vector-bounds-debug/jdk")]:
        paths = [jdk / "bin/java", jdk / "lib/server/libjvm.so",
                 jdk / "modules/java.base/java/lang/Object.class",
                 jdk / "modules/jdk.incubator.vector/jdk/incubator/vector/ByteVector.class",
                 jdk / "modules/jdk.incubator.vector/jdk/incubator/vector/VectorIntrinsics.class"]
        report.setdefault("debug_native_hashes", {})[side] = {str(x): digest(x) for x in paths}
    for kind, side, jdk in [(kind, side, root / f"{side}-{kind}-jdk")
                            for kind in ("release", "debug") for side in ("baseline", "candidate")]:
        if kind == "debug" and side == "candidate":
            jdk = repo / "build/vector-bounds-debug/jdk"
        report.setdefault("runtime_trees", {})[side + "_" + kind] = tree_digest(jdk / "modules")
    assert report["runtime_trees"]["baseline_release"]["sha256"] == report["runtime_trees"]["candidate_release"]["sha256"]
    b = root / "baseline-debug-jdk/modules"
    c = repo / "build/vector-bounds-debug/jdk/modules"
    before = {str(x.relative_to(b)): x for x in b.rglob("*") if x.is_file()}
    after = {str(x.relative_to(c)): x for x in c.rglob("*") if x.is_file()}
    differences = {"removed": sorted(before.keys() - after.keys()), "added": sorted(after.keys() - before.keys()),
                   "changed": sorted(x for x in before.keys() & after.keys() if digest(before[x]) != digest(after[x]))}
    assert differences == {"removed": [], "changed": [],
                           "added": ["jdk.jlink/jdk/tools/jlink/internal/plugins/default_jli_trace.txt"]}
    report["debug_runtime_differences"] = differences
    tools = [Path("/workspace/toolchains/gcc16/bin/g++"), Path("/workspace/toolchains/gcc16/bin/gcc"),
             Path("/workspace/toolchains/jdk27/release")]
    report["toolchain_hashes"] = {str(x): digest(x) for x in tools}
    report["limitations"] = [
        "No throughput measurement; default code growth coincides with unroll stride 1 to 2.",
        "The archived VM build date belongs to the shared VMVersion object, not the replaced ifnode object.",
        "No archived numeric effective MaxVectorSize/UseAVX/GC flags or per-rule socket messages; do not invent them.",
        "Stress run disabled IR matching and supplies semantic/debug evidence only.",
        "Source pins plus binary hashes identify these incremental VMs; they are not two clean independent builds.",
        "Codec explicit signed cursor bound does not directly match the new rule; compiled-code applicability is unproven.",
    ]
    manifest = []
    with tarfile.open(out / "text-receipts.tar.gz", "w:gz", dereference=True) as archive:
        for x in sorted(set(selected)):
            assert x.is_file(), x
            name = ("receipts/" + str(x.relative_to(root))) if x.is_relative_to(root) else "jdk/" + str(x.relative_to(repo))
            manifest.append({"path": str(x), "archive_path": name, "bytes": x.stat().st_size, "sha256": digest(x)})
            archive.add(x, arcname=name, recursive=False)
    for source, expected_commit in [(repo / "src/hotspot/share/opto/ifnode.cpp", CANDIDATE),
                                    (repo / "test/hotspot/jtreg/compiler/vectorapi/TestDuplicateVectorBounds.java", CANDIDATE)]:
        content = subprocess.check_output(["git", "show", expected_commit + ":" + str(source.relative_to(repo))], cwd=repo)
        assert hashlib.sha256(content).hexdigest() == digest(source), source
    original = subprocess.check_output(["git", "show", BASE + ":src/hotspot/share/opto/ifnode.cpp"], cwd=repo)
    assert hashlib.sha256(original).hexdigest() == digest(root / "ifnode.original.cpp")
    (out / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
    (out / "audit.json").write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({"out": str(out), "archived_files": len(manifest), "normal_c2_graph_assertions": "baseline fails copy/ordered; candidate passes all seven", "runs_started": 0}))


if __name__ == "__main__":
    main()
