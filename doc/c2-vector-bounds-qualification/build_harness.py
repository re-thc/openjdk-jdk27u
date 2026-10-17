#!/usr/bin/env python3
"""Offline future harness build. Dry run unless --execute; never downloads dependencies."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import os
import zipfile
import time
from process_control import run
from deadline import Budget
from audit import tree_digest

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; build preconditions are required")

CODEC = "6abf77e2f63b68cc9269d5823e206235ab254c04"
DEPENDENCIES = ("jmh-core-1.37.jar", "jmh-generator-annprocess-1.37.jar",
                "jopt-simple-5.0.4.jar", "commons-math3-3.6.1.jar")


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    started = time.monotonic()
    p = argparse.ArgumentParser(description=__doc__)
    for name in ("codec", "jdk", "deps", "out"):
        p.add_argument("--" + name, required=True, type=Path)
    p.add_argument("--execute", action="store_true")
    p.add_argument("--campaign", type=Path, help="shared campaign deadline required for execution")
    p.add_argument("--audit", type=Path, help="complete existing-image identity required for execution")
    a = p.parse_args()
    codec, jdk, deps, out = (getattr(a, x).resolve() for x in ("codec", "jdk", "deps", "out"))
    harness = Path(__file__).with_name("BoundsQualification.java").resolve()
    sources = sorted((codec / "src/main/java").rglob("*.java"))
    commands = [
        [str(jdk / "bin/javac"), "-J-Xmx1g", "-J-XX:ActiveProcessorCount=2", "--add-modules=jdk.incubator.vector", "-d", str(out / "classes"), *map(str, sources)],
        [str(jdk / "bin/javac"), "-J-Xmx1g", "-J-XX:ActiveProcessorCount=2", "--add-modules=jdk.incubator.vector", "-cp",
         os.pathsep.join([str(out / "classes"), str(deps / DEPENDENCIES[0])]),
         "-processorpath", os.pathsep.join(str(deps / x) for x in DEPENDENCIES[:2]),
         "-processor", "org.openjdk.jmh.generators.BenchmarkProcessor", "-s", str(out / "generated"),
         "-d", str(out / "classes"), str(harness)],
        [str(jdk / "bin/jar"), "-J-Xmx256m", "-J-XX:ActiveProcessorCount=2", "--create", "--file", str(out / "qualification.jar"), "-C", str(out / "classes"), "."],
    ]
    if not a.execute:
        print(json.dumps({"codec_commit": CODEC, "required_existing_jars": DEPENDENCIES, "commands": commands}, indent=2))
        return
    assert a.campaign, "execute through campaign.py; build cannot start a new campaign clock"
    budget = Budget.load(a.campaign)
    budget.remaining()
    assert a.audit, "complete existing-image audit required before executing javac/jar"
    audit = json.loads(a.audit.read_text())
    assert jdk == Path(audit["paths"]["receipts"]) / "baseline-release-jdk", "build must use audited baseline JDK"
    for expected in [audit["runtime_trees"]["baseline_release"], *audit["runtime_files"]["baseline_release"].values()]:
        assert tree_digest(Path(expected["path"])) == expected, "baseline build-tool runtime changed"
        budget.remaining()
    assert sources, "codec source checkout is required"
    assert subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=codec, text=True).strip() == CODEC
    assert not subprocess.check_output(["git", "status", "--porcelain"], cwd=codec), "codec checkout must be clean"
    for file in (harness, jdk / "bin/javac", jdk / "bin/jar", *(deps / x for x in DEPENDENCIES)):
        assert file.is_file(), f"Missing prerequisite; no automatic installation: {file}"
    out.mkdir(parents=True, exist_ok=False)
    (out / "classes").mkdir()
    (out / "generated").mkdir()
    env = {k: v for k, v in os.environ.items() if k not in
           ("_JAVA_OPTIONS", "JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "CLASSPATH")}
    for i, command in enumerate(commands):
        remaining = min(started + 600 - time.monotonic(), budget.remaining())
        assert remaining > 0, "10-minute harness stage limit reached"
        run(command, out / f"build-{i}.log", min(180, remaining), env)
        assert sum(x.stat().st_size for x in out.rglob("*") if x.is_file()) < 2 << 30, "build disk limit reached"
    jar = out / "qualification.jar"
    with zipfile.ZipFile(jar) as z:
        names = z.namelist()
        assert "META-INF/BenchmarkList" in names and "META-INF/CompilerHints" in names
        assert any(x.startswith("qualification/jmh_generated/") and x.endswith(".class") for x in names)
    classpath = [jar, *(deps / x for x in (DEPENDENCIES[0], *DEPENDENCIES[2:]))]
    manifest = {"codec_commit": CODEC, "classpath": list(map(str, classpath)),
                "harness_source_sha256": sha(harness), "javac_sha256": sha(jdk / "bin/javac"),
                "dependencies_sha256": {x: sha(deps / x) for x in DEPENDENCIES},
                "classpath_sha256": {str(x): sha(x) for x in classpath},
                "source_sha256": {str(x.relative_to(codec)): sha(x) for x in sources}}
    (out / "artifact.json").write_text(json.dumps(manifest, indent=2) + "\n")
    assert time.monotonic() - started <= 600, "build exceeded stage budget; keep receipts, do not use artifact"
    budget.remaining()
    print(out / "artifact.json")


if __name__ == "__main__":
    main()
