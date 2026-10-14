"""One comparative job. Never retry a measurement or relax a failed control."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess

BASE = "02324e6bd026411407983df06284cd79460c33f6"
TIERS = "int,c1,c13,tiered,c2"
VARIANTS = "base,control,a,b2"
PREFIX = "src/java.base/share/classes/jdk/internal/foreign/abi/"
SOURCES = [PREFIX + n for n in ("CallingSequence.java", "DowncallLinker.java", "BindingSpecializer.java")]
CONTROL_POINT = (0.95, 1.05)
CONTROL_INTERVAL = (0.90, 1.10)

parser = argparse.ArgumentParser()
parser.add_argument("phase", choices=["build", "measure", "tests", "diagnostics"])
parser.add_argument("--repo", required=True)
parser.add_argument("--output", required=True)
parser.add_argument("--jtreg")
args = parser.parse_args()
repo = Path(args.repo).resolve()
out = Path(args.output).resolve()
payload = Path(__file__).resolve().parent
raw = out / "raw"
raw.mkdir(parents=True, exist_ok=True)
images = out / "images"
conf = "ffm-diagnostic"
image = repo / "build" / conf / "images/jdk"

def run(command, label, cwd=None, check=True):
    record = raw / (label + ".command.json")
    log = raw / (label + ".log")
    if record.exists() or log.exists():
        raise RuntimeError("Existing evidence: no retries or overwrite: " + label)
    record.write_text(json.dumps(command) + "\n")
    print(label, flush=True)
    with log.open("w") as stream:
        result = subprocess.run(command, cwd=cwd, stdout=stream, stderr=subprocess.STDOUT)
    if check and result.returncode:
        raise RuntimeError(f"{label} failed: {result.returncode}; see {log}")
    return result.returncode

def git(*words):
    return subprocess.check_output(["git", *words], cwd=repo, text=True).strip()

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def native_hashes(directory):
    return {str(p.relative_to(directory)): sha(p) for p in directory.rglob("*")
            if p.is_file() and (".so" in p.name or p.name == "java")}

def restore_sources():
    for name in SOURCES:
        data = subprocess.check_output(["git", "show", BASE + ":" + name], cwd=repo)
        target = repo / name
        if target.read_bytes() != data:
            target.write_bytes(data)

def build():
    if git("rev-parse", "HEAD") != BASE or git("status", "--porcelain"):
        raise RuntimeError("Build must start in a clean isolated pinned worktree")
    run(["make", "CONF=" + conf, "images"], "build-base", repo)
    images.mkdir()
    shutil.copytree(image, images / "base", symlinks=True)
    native = native_hashes(image)
    if len(native) != 39:
        raise RuntimeError(f"Expected the reviewed full desktop profile's 39 native files, got {len(native)}")
    records = {"base": {"source_ref": BASE, "native_hashes": native, "modules_sha256": sha(image / "lib/modules")}}
    (out / "images.json").write_text(json.dumps(records, indent=2) + "\n")
    try:
        for variant in ["a", "b2"]:
            restore_sources()
            run(["git", "apply", "--check", "--include=" + PREFIX + "*", str(payload / (variant + ".patch"))], "check-" + variant, repo)
            run(["git", "apply", "--include=" + PREFIX + "*", str(payload / (variant + ".patch"))], "apply-" + variant, repo)
            if variant == "b2":
                stale = repo / "build" / conf / "jdk/modules/java.base/jdk/internal/foreign/abi/DowncallLinker$SimpleDowncall.class"
                stale.unlink(missing_ok=True)
            run(["make", "CONF=" + conf, "images"], "build-" + variant, repo)
            if native_hashes(image) != native:
                raise RuntimeError("Native image changed in " + variant)
            listing = subprocess.check_output([str(image / "bin/jimage"), "list", str(image / "lib/modules")], text=True)
            selected = "DowncallLinker$SimpleDowncall.class" in listing
            if selected != (variant == "a"):
                raise RuntimeError("Missing or stale A class in " + variant)
            shutil.copytree(image, images / variant, symlinks=True)
            records[variant] = {"source_ref": BASE, "patch_sha256": sha(payload / (variant + ".patch")),
                                "native_hashes": native, "modules_sha256": sha(image / "lib/modules"),
                                "java_sources": {name: sha(repo / name) for name in SOURCES}}
            (out / "images.json").write_text(json.dumps(records, indent=2) + "\n")
    finally:
        restore_sources()
    # Compile the portable harness before opening the quiet measurement window.
    for name in ["Probe.java", "Steady.java", "native.c", "run_target.py", "analyze_target.py", "inlining_report.py"]:
        shutil.copy2(payload / name, out / name)
    (out / "classes").mkdir()
    run([str(images / "base/bin/javac"), "-d", str(out / "classes"), str(out / "Probe.java"), str(out / "Steady.java")], "compile-harness")
    run(["gcc", "-O2", "-fPIC", "-shared", "-pthread", str(out / "native.c"), "-o", str(out / "libprobe.so")], "compile-native-harness")
    metadata = {"baseline": BASE, "cpu_affinity": sorted(os.sched_getaffinity(0)),
                "cpu_model": next(s.split(":", 1)[1].strip() for s in Path("/proc/cpuinfo").read_text().splitlines() if s.startswith("model name")),
                "cpu_max": Path("/sys/fs/cgroup/cpu.max").read_text().strip(),
                "control_point_bounds": CONTROL_POINT, "control_interval_bounds": CONTROL_INTERVAL,
                "sources": {p.name: sha(p) for p in out.iterdir() if p.suffix in [".java", ".c", ".py"]}}
    (out / "environment.json").write_text(json.dumps(metadata, indent=2) + "\n")

def assess_control(summary, steady):
    rows = json.loads(summary.read_text())
    metrics = {"steady_cpu_ns", "steady_wall_ns"} if steady else {"wall_ns", "process_cpu_ns"}
    relevant = [r for r in rows if r["variant"] == "control" and r["metric"] in metrics]
    expected = 40 if steady else 30
    failures = []
    if len(relevant) != expected:
        failures.append({"reason": "missing control groups", "found": len(relevant), "expected": expected})
    for row in relevant:
        if row["n"] != 12 or not (CONTROL_POINT[0] <= row["ratio"] <= CONTROL_POINT[1]) or not (CONTROL_INTERVAL[0] <= row["lo"] <= row["hi"] <= CONTROL_INTERVAL[1]):
            failures.append(row)
    return failures

def measure():
    if 0 not in os.sched_getaffinity(0):
        raise RuntimeError("Reviewed measurement plan requires CPU0")
    cases = [("startup-off", "off", False), ("startup-default", "default", False), ("steady-default", "default", True)]
    report = {"qualified": False, "status": "collecting", "stages": []}
    target = out / "qualification.json"
    target.write_text(json.dumps(report, indent=2) + "\n")
    for name, cds, steady in cases:
        data = raw / (name + ".jsonl")
        command = ["python3", str(out / "run_target.py"), "--images", str(images), "--out", str(data),
                   "--rounds", "12", "--tiers", TIERS, "--variants", VARIANTS, "--cds", cds]
        command += ["--shapes", "bound,unbound,variable,variable-unbound", "--steady", "--warm", "30", "--samples", "10",
                    "--tier-counts", "int=10000,c1=100000,c13=100000,tiered=100000,c2=1000000"] if steady else ["--shapes", "empty,framework,i"]
        run(command, "measure-" + name)
        records = [json.loads(line) for line in data.read_text().splitlines()]
        expected = 960 if steady else 720
        if len(records) != expected or any(r["returncode"] for r in records):
            raise RuntimeError("Incomplete or failed forks: " + name)
        table = raw / (name + "-table.md")
        run(["python3", str(out / "analyze_target.py"), str(data), "--out", str(table)], "analyze-" + name)
        failures = assess_control(Path(str(table) + ".json"), steady)
        report["stages"].append({"name": name, "records": len(records), "control_failures": failures})
        if failures:
            report["status"] = "STOPPED_CONTROL_FAILURE"
            target.write_text(json.dumps(report, indent=2) + "\n")
            print("Qualification stopped at " + name + "; no retry or broader measurements", flush=True)
            return
        target.write_text(json.dumps(report, indent=2) + "\n")
    report["status"] = "CONTROLS_PASSED_REVIEW_REQUIRED"
    target.write_text(json.dumps(report, indent=2) + "\n")

def tests():
    if not args.jtreg:
        raise RuntimeError("JTReg path required")
    for variant in ["a", "b2"]:
        run(["git", "apply", "--include=test/*", str(payload / (variant + ".patch"))], "install-tests-" + variant, repo)
    native = out / "native"
    native.mkdir()
    run(["gcc", "-O2", "-fPIC", "-shared", "-pthread", "-I" + str(repo / "test/jdk/java/foreign"),
         "-I" + str(repo / "test/lib/native"), str(repo / "test/jdk/java/foreign/libScalarDowncalls.c"),
         "-o", str(native / "libScalarDowncalls.so")], "compile-scalar-native")
    foreign = repo / "test/jdk/java/foreign"
    for variant in ["base", "a", "b2"]:
        run([str(images / "base/bin/java"), "-jar", str(Path(args.jtreg) / "lib/jtreg.jar"), "-jdk:" + str(images / variant),
             "-nativepath:" + str(native), "-w:" + str(out / ("jtreg-" + variant + "-work")), "-r:" + str(out / ("jtreg-" + variant + "-report")),
             str(foreign / "TestScalarDowncalls.java"), str(foreign / "TestLinker.java"), str(foreign / "callarranger"),
             str(foreign / "TestZeroAllocationBindings.java")], "jtreg-" + variant)

def diagnostics():
    report = json.loads((out / "qualification.json").read_text())
    if report["status"] == "STOPPED_CONTROL_FAILURE":
        print("No further performance diagnostics after failed controls", flush=True)
        return
    for variant in ["base", "a", "b2"]:
        for tier, flags in [("c1", ["-XX:TieredStopAtLevel=1"]), ("c2", ["-Xbatch", "-XX:-TieredCompilation"])]:
            for mode in ["bound", "variable"]:
                name = f"diagnostic-{variant}-{tier}-{mode}"
                xml = raw / (name + ".xml")
                command = ["taskset", "-c", "0", str(images / variant / "bin/java"), "-Xms128m", "-Xmx128m",
                           "--enable-native-access=ALL-UNNAMED", *flags, "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                           "-XX:LogFile=" + str(xml), "-Dsteady.mode=" + mode, "-Dsteady.count=1000000", "-Dsteady.warm=30",
                           "-Dsteady.samples=1", "-Dsteady.library=" + str(out / "libprobe.so"), "-cp", str(out / "classes"), "Steady"]
                run(command, name)
                run(["python3", str(out / "inlining_report.py"), str(xml)], name + "-inlining")
        run([str(images / variant / "bin/java"), "--enable-native-access=ALL-UNNAMED", "-Xlog:class+load=info",
             "-cp", str(out / "classes"), "Probe", "i", str(out / "libprobe.so")], "class-load-" + variant)

{"build": build, "measure": measure, "tests": tests, "diagnostics": diagnostics}[args.phase]()
