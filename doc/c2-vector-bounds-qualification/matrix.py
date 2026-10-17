#!/usr/bin/env python3
"""Print or execute a bounded future qualification matrix. Default is dry run."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import random
import re
import resource
import signal
import subprocess
import time
from audit import tree_digest

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; execution preconditions are required")

KINDS = ("source", "periodic", "lowAlphabet", "random")
COMMON = ["--add-modules=jdk.incubator.vector", "-Xms512m", "-Xmx512m", "-XX:+UseG1GC",
          "-XX:ActiveProcessorCount=2", "-Djdk.incubator.vector.VECTOR_ACCESS_OOB_CHECK=2"]
PHASES = ["AFTER_PARSING", "BEFORE_LOOP_OPTS", "BEFORE_LOOP_PREDICATION_RC", "AFTER_LOOP_PREDICATION_RC",
          "BEFORE_LOOP_UNROLLING", "AFTER_LOOP_UNROLLING", "AUTO_VECTORIZATION1_BEFORE_APPLY",
          "AUTO_VECTORIZATION5_AFTER_APPLY", "AFTER_LOOP_OPTS", "AFTER_MACRO_EXPANSION",
          "GLOBAL_CODE_MOTION", "REGISTER_ALLOCATION"]


def digest(path):
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(4 << 20), b""):
            h.update(block)
    return h.hexdigest()


def receipt_manifest(folder):
    return {str(x.relative_to(folder)): digest(x) for x in sorted(folder.rglob("*"))
            if x.is_file() and x.name != "receipt-manifest.json"}


def verify_receipt(path):
    manifest = json.loads(path.read_text())
    assert receipt_manifest(path.parent) == manifest, f"reviewed receipts changed: {path}"


def cells():
    out = [("decompressDirect", {"kind": k, "size": s}) for k in KINDS for s in (65536, 1048576)]
    out += [("decompressAllocated", {"kind": k, "size": 1048576}) for k in KINDS]
    out += [("compressControl", {"kind": k, "size": 65536}) for k in ("source", "random")]
    out += [("vectorCursor", {"size": s}) for s in (4096, 65536)]
    out += [(m, {"size": 65536}) for m in
            ("scalarSubrange", "invariantVector", "scalarMap", "nearMiss", "arrayCopyControl")]
    return out


def child_limits():
    resource.setrlimit(resource.RLIMIT_FSIZE, (256 << 20, 256 << 20))
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))


def run(command, log, timeout, env):
    with log.open("w") as stream:
        child = subprocess.Popen(command, stdout=stream, stderr=subprocess.STDOUT, env=env,
                                 start_new_session=True, preexec_fn=child_limits)
        try:
            status = child.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGTERM)
            try:
                child.wait(timeout=2)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid, signal.SIGKILL)
                child.wait()
            raise
        if status:
            raise RuntimeError(f"Exit {status}; preserve {log}; stop, no retry")


def main():
    stage_started = time.monotonic()
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("stage", choices=("preflight", "diagnostics", "timing"))
    for x in ("artifact", "receipts", "audit", "corpus", "out"):
        p.add_argument("--" + x, type=Path, required=True)
    p.add_argument("--repo", type=Path, required=True)
    p.add_argument("--cpus", required=True, help="two allowed logical CPUs on distinct physical cores")
    p.add_argument("--gate", type=Path, help="reviewed gate.json; mandatory for executing timing")
    p.add_argument("--execute", action="store_true")
    a = p.parse_args()
    artifact = json.loads(a.artifact.read_text())
    cp = os.pathsep.join(artifact["classpath"])
    root, out = a.receipts.resolve(), a.out.resolve()
    vm = {s: root / f"{s}-release-jdk/bin/java" for s in ("baseline", "candidate")}
    debug = {"baseline": root / "baseline-debug-jdk/bin/java",
             "candidate": a.repo.resolve() / "build/vector-bounds-debug/jdk/bin/java"}
    cpu_values = [int(x) for x in a.cpus.split(",")]
    assert len(cpu_values) == len(set(cpu_values)) == 2
    for path in [*artifact["classpath"], str(a.corpus.resolve()), str(out), *map(str, vm.values()), *map(str, debug.values())]:
        assert not any(c.isspace() for c in path), "JMH runner requires whitespace-free paths"
    common = COMMON + ["-Dqualification.corpus=" + str(a.corpus.resolve())]
    gate = json.loads(a.gate.read_text()) if a.gate else {}
    commands, tasks = [], []

    def add(name, command, timeout=60):
        commands.append({"name": name, "argv": ["taskset", "--cpu-list", a.cpus, *map(str, command)],
                         "timeout_seconds": timeout})

    def jmh(name, side, method, params, diag=False, nounroll=False, product_diag=False):
        prefix = out / name
        flags = common.copy()
        flags += ["-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                  "-XX:LogFile=" + str(prefix) + "-%p.xml"]
        java = debug[side] if diag and not product_diag else vm[side]
        if diag:
            directives_file = "directives-product.json" if product_diag else "directives.json"
            flags += ["-XX:+PrintFlagsFinal", "-XX:CompilerDirectivesFile=" + str(out / directives_file)]
            if nounroll:
                flags += ["-XX:LoopMaxUnroll=0"]
        command = [vm["baseline"], *common, "-cp", cp, "org.openjdk.jmh.Main",
                   "^qualification.BoundsQualification." + method + "$", "-t", "1", "-f", "1",
                   "-wi", "5", "-i", "1" if diag else "5", "-w", "1s", "-r", "1s",
                   "-bm", "thrpt", "-tu", "s", "-jvm", java, "-jvmArgs", " ".join(flags),
                   "-rf", "json", "-rff", str(prefix) + ".json", "-foe", "true"]
        for key, value in params.items():
            command += ["-p", f"{key}={value}"]
        add(name, command, 90 if diag else 60)

    if a.stage == "preflight":
        add("prepare", [vm["baseline"], *common, "-cp", cp, "qualification.BoundsQualification",
                        "prepare", a.corpus.resolve()], 120)
        for side in vm:
            add("verify-" + side, [vm[side], *common, "-cp", cp, "qualification.BoundsQualification",
                                  "verify", a.corpus.resolve()], 120)
            add("flags-" + side, [vm[side], *common, "-XX:+PrintFlagsFinal", "-XshowSettings:properties", "-version"], 30)
    elif a.stage == "diagnostics":
        for product in (False, True):
            kind_vm = "product" if product else "debug"
            for side in vm:
                for kind in KINDS:
                    jmh(f"{side}-{kind_vm}-codec-{kind}", side, "decompressDirect",
                        {"kind": kind, "size": 1048576}, diag=True, product_diag=product)
                for method in ("vectorCursor", "scalarSubrange", "invariantVector", "scalarMap", "nearMiss", "arrayCopyControl"):
                    jmh(f"{side}-{kind_vm}-{method}", side, method, {"size": 65536}, diag=True, product_diag=product)
                jmh(f"{side}-{kind_vm}-vectorCursor-nounroll", side, "vectorCursor", {"size": 65536},
                    diag=True, nounroll=True, product_diag=product)
    else:
        chosen = cells()
        if gate and not gate.get("codec_target_removed"):
            chosen = [(m, ps) for m, ps in chosen if not m.startswith("decompress") or
                      (m == "decompressDirect" and ps["kind"] in ("source", "random") and ps["size"] == 1048576)]
        rng = random.Random(20261017)
        for pair in range(6):
            indexes = list(range(len(chosen)))
            rng.shuffle(indexes)
            for index in indexes:
                method, params = chosen[index]
                sides = ("baseline", "candidate") if (pair + index) % 2 == 0 else ("candidate", "baseline")
                for side in sides:
                    name = f"pair{pair}-cell{index}-{side}"
                    jmh(name, side, method, params)
                    tasks.append({"name": name, "pair": pair, "cell": index, "side": side,
                                  "method": method, "params": params})
    plan = {"stage": a.stage, "commands": commands, "timing_tasks": tasks,
            "codec_target_removed": gate.get("codec_target_removed"),
            "wall_limit_minutes": {"preflight": 5, "diagnostics": 20, "timing": 55}[a.stage]}
    if not a.execute:
        print(json.dumps(plan, indent=2))
        return
    assert set(cpu_values).issubset(os.sched_getaffinity(0)), "requested CPUs unavailable"
    cores = []
    for cpu in cpu_values:
        topology = Path(f"/sys/devices/system/cpu/cpu{cpu}/topology")
        cores.append(tuple((topology / key).read_text().strip() for key in ("physical_package_id", "core_id")))
    assert cores[0] != cores[1], "select distinct physical cores"
    audit = json.loads(a.audit.read_text())
    assert audit["paths"] == {"repo": str(a.repo.resolve()), "receipts": str(root)}, "audit/launch roots differ"
    for side in vm:
        assert (root / f"{side}-release-jdk/lib/server/libjvm.so").samefile(root / f"{side}-release-vm/libjvm.so")
        for file, expected in audit["native_hashes"][side].items():
            assert digest(Path(file)) == expected, f"historical identity changed: {file}"
        if a.stage == "diagnostics":
            for file, expected in audit["debug_native_hashes"][side].items():
                assert digest(Path(file)) == expected, f"debug identity changed: {file}"
        for kind in (("release", "debug") if a.stage == "diagnostics" else ("release",)):
            expected = audit["runtime_trees"][side + "_" + kind]
            assert tree_digest(Path(expected["path"])) == expected, "runtime class tree changed"
    for file, expected in artifact["classpath_sha256"].items():
        assert digest(Path(file)) == expected, file
    if a.stage == "timing":
        assert type(gate.get("codec_target_removed")) is bool, "record an explicit applicability decision"
        for key in ("correctness_pass", "effective_flags_reviewed", "normal_c2_before_measurement",
                    "dependencies_preserved", "loop_and_schedule_reviewed", "debug_product_identity_reviewed"):
            assert gate.get(key) is True, f"timing gate missing: {key}"
        assert gate.get("artifact_sha256") == digest(a.artifact)
        assert gate.get("audit_sha256") == digest(a.audit)
        assert gate.get("corpus_manifest_sha256") == digest(a.corpus / "manifest.properties")
        for kind in ("preflight", "diagnostics"):
            file = Path(gate[kind + "_receipt_manifest"])
            assert gate[kind + "_receipt_manifest_sha256"] == digest(file)
            verify_receipt(file)
    out.mkdir(parents=True, exist_ok=False)
    (out / "plan.json").write_text(json.dumps(plan, indent=2) + "\n")
    directives = [{"match": pattern, "log": True, "PrintAssembly": True, "PrintInlining": True,
                   "PrintIdealPhase": ",".join(PHASES)} for pattern in
                  ("dev.jzstd.internal.WindowBuffer::executeSequencesDirect", "qualification.BoundsQualification::*",
                   "qualification.jmh_generated.*::*")]
    (out / "directives.json").write_text(json.dumps(directives, indent=2) + "\n")
    (out / "directives-product.json").write_text(json.dumps(
        [{k: v for k, v in d.items() if k != "PrintIdealPhase"} for d in directives], indent=2) + "\n")
    env = {k: v for k, v in os.environ.items() if k not in
           ("_JAVA_OPTIONS", "JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "CLASSPATH")}
    deadline = stage_started + plan["wall_limit_minutes"] * 60
    for command in commands:
        remaining = deadline - time.monotonic()
        assert remaining > 0, "stage wall limit reached; preserve incomplete pairs"
        run(command["argv"], out / (command["name"] + ".log"),
            min(command["timeout_seconds"], remaining), env)
        assert sum(x.stat().st_size for x in out.rglob("*") if x.is_file()) < 2 << 30, "receipt disk limit reached"
    if a.stage == "preflight":
        rejects = [re.findall(r"qualification-rejection=[^\r\n]+", (out / f"verify-{s}.log").read_text())
                   for s in ("baseline", "candidate")]
        assert len(rejects[0]) == 32 and rejects[0] == rejects[1], "rejection classes differ or checks missing"
    (out / "receipt-manifest.json").write_text(json.dumps(receipt_manifest(out), indent=2) + "\n")
    assert time.monotonic() <= deadline, "stage budget exceeded during final validation; campaign incomplete"
    print(out / "plan.json")


if __name__ == "__main__":
    main()
