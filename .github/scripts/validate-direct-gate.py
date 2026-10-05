#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#



"""Validate the direct-to-direct JNI call policy on a cached, ABI-compatible VM."""
import importlib.util
import json
from pathlib import Path
import hashlib
import urllib.request
import sys

REPO = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("zip_validation", REPO / ".github/scripts/validate-zip-backend.py")
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
OUT, run = common.OUT, common.run
jdk = Path(sys.argv[1]).resolve()
source = OUT / "gate-src/java/util/zip/Inflater.java"
source.parent.mkdir(parents=True, exist_ok=True)
source.write_text((REPO / "src/java.base/share/classes/java/util/zip/Inflater.java").read_text())
patch = OUT / "gate-classes"
patch.mkdir(exist_ok=True)
run("compile-direct-gate", [jdk / "bin/javac", "--patch-module",
    "java.base=" + str(OUT / "gate-src"), "-d", patch, source])
classes = OUT / "gate-tests"
classes.mkdir(exist_ok=True)
run("compile-gate-fixture", [jdk / "bin/javac", "-d", classes,
    REPO / "test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNG.java"])
patch_flags = ["--patch-module=java.base=" + str(patch)]
base = ["-Xmx64m", "-XX:ActiveProcessorCount=2"]
modes = [("default", ["-XX:-UseZlibNG"]),
         ("int", ["-XX:+UseZlibNG", "-Xint"]),
         ("c1", ["-XX:+UseZlibNG", "-Xbatch", "-XX:TieredStopAtLevel=1"]),
         ("c2", ["-XX:+UseZlibNG", "-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=1000"]),
         ("jni", ["-XX:+UseZlibNG", "-XX:+UnlockDiagnosticVMOptions", "-XX:-UseZipIntrinsics"]),
         ("checked-jni", ["-XX:+UseZlibNG", "-Xint", "-Xcheck:jni"])]
for label, flags in modes:
    run("gate-fixture-" + label, [jdk / "bin/java"] + patch_flags + base + flags +
        ["-cp", classes, "TestZlibNG"])
    print("Gate fixture passed: " + label, flush=True)
for collector in ["Serial", "Parallel", "G1", "Z", "Shenandoah"]:
    for tier, flags in [("c1", ["-XX:TieredStopAtLevel=1"]),
                        ("c2", ["-XX:-TieredCompilation", "-XX:CompileThreshold=1000"])]:
        run("gate-gc-" + collector + "-" + tier,
            [jdk / "bin/java"] + patch_flags + base + ["-XX:+UseZlibNG", "-Xbatch",
             "-XX:+Use" + collector + "GC"] + flags + ["-cp", classes, "TestZlibNG"])
        print("Gate GC fixture passed: " + collector + " " + tier, flush=True)
deps = OUT / "jmh"
deps.mkdir(exist_ok=True)
for name, (path, digest) in common.DEPS.items():
    target = deps / name
    urllib.request.urlretrieve("https://repo.maven.apache.org/maven2/" + path, target)
    if hashlib.sha256(target.read_bytes()).hexdigest() != digest:
        raise RuntimeError("Dependency digest mismatch: " + name)
cp = ":".join(str(deps / p) for p in common.DEPS)
bench_classes = OUT / "gate-benchmark"
bench_classes.mkdir(exist_ok=True)
run("compile-gate-benchmark", [jdk / "bin/javac", "-cp", cp, "-processorpath", cp,
    "-d", bench_classes, REPO / "test/micro/org/openjdk/bench/java/util/zip/ZipBufferCalls.java"])
cp = str(bench_classes) + ":" + cp
jvm_flags = ["-Xms128m", "-Xmx128m", "-XX:+UseSerialGC", "-XX:ActiveProcessorCount=2",
             "-XX:+UseZlibNG", "-XX:+UnlockDiagnosticVMOptions"]
configs = [("jni", ["-XX:-UseZipIntrinsics"]),
           ("intrinsic", ["-XX:+UseZipIntrinsics"]),
           ("gated", ["-XX:+UseZipIntrinsics"] + patch_flags)]
tiers = [("int", ["-Xint"]), ("c1", ["-XX:TieredStopAtLevel=1", "-Xbatch"]),
         ("c2", ["-XX:-TieredCompilation", "-XX:CompileThreshold=1000", "-Xbatch"])]
rows = []
for tier, extra in tiers:
    for label, flags in configs:
        name = "direct-gate-" + tier + "-" + label
        result = OUT / (name + ".json")
        run(name, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE",
            "-cp", cp, "org.openjdk.jmh.Main", "ZipBufferCalls.inflate$",
            "-p", "input=direct", "-p", "output=direct", "-p", "size=64,1024,4096,16384,65536",
            "-f", "2", "-wi", "3", "-i", "5", "-w", "500ms", "-r", "500ms",
            "-jvm", jdk / "bin/java", "-jvmArgsAppend", " ".join(jvm_flags + extra + flags),
            "-rf", "json", "-rff", result])
        measured = json.loads(result.read_text())
        if len(measured) != 5: raise RuntimeError("Incomplete gated benchmark")
        for row in measured:
            row.update(tier=tier, backend=label)
            rows.append(row)
        (OUT / "direct-gate-jmh.json").write_text(json.dumps(rows, indent=2) + "\n")
lines = ["All operations use direct input and output; only the JNI/runtime selection changes.",
         "| Tier | Bytes | Original JNI ns | Original intrinsic ns | Selected JNI ns |",
         "| --- | ---: | ---: | ---: | ---: |"]
for tier, _ in tiers:
    for size in ["64", "1024", "4096", "16384", "65536"]:
        selected = {r["backend"]: r["primaryMetric"] for r in rows
                    if r["tier"] == tier and r["params"]["size"] == size}
        values = [f'{selected[label]["score"]:.2f} ± {selected[label]["scoreError"]:.2f}'
                  for label, _ in configs]
        lines.append("| " + " | ".join([tier, size] + values) + " |")
(OUT / "direct-gate-table.md").write_text("\n".join(lines) + "\n")
print("\n".join(lines), flush=True)
