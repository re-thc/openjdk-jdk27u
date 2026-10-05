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



"""Compare JNI and intrinsic overhead for every heap/direct buffer combination."""
import importlib.util
import json
from pathlib import Path
import sys
import urllib.request
import hashlib

REPO = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("zip_validation", REPO / ".github/scripts/validate-zip-backend.py")
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
OUT, run = common.OUT, common.run
jdk = Path(sys.argv[1]).resolve()
deps = OUT / "jmh"
deps.mkdir(exist_ok=True)
for name, (path, digest) in common.DEPS.items():
    target = deps / name
    if not target.exists():
        urllib.request.urlretrieve("https://repo.maven.apache.org/maven2/" + path, target)
    if hashlib.sha256(target.read_bytes()).hexdigest() != digest:
        raise RuntimeError("Dependency digest mismatch: " + name)
cp = ":".join(str(deps / p) for p in common.DEPS)
classes = OUT / "buffer-classes"
classes.mkdir(exist_ok=True)
run("compile-buffer-review", [jdk / "bin/javac", "-cp", cp, "-processorpath", cp,
    "-d", classes, REPO / ".github/diagnostics/ZipBufferCalls.java"])
cp = str(classes) + ":" + cp
flags = ["-Xms128m", "-Xmx128m", "-XX:+UseSerialGC", "-XX:ActiveProcessorCount=2",
         "-XX:+UseZlibNG", "-XX:+UnlockDiagnosticVMOptions"]
configs = [("jni", ["-XX:-UseZipIntrinsics"]), ("intrinsic", ["-XX:+UseZipIntrinsics"])]
tiers = [("int", ["-Xint"]), ("c1", ["-XX:TieredStopAtLevel=1", "-Xbatch"]),
         ("c2", ["-XX:-TieredCompilation", "-XX:CompileThreshold=1000", "-Xbatch"])]
rows = []
for tier, extra in tiers:
    for label, backend in configs:
        name = "buffer-" + tier + "-" + label
        result = OUT / (name + ".json")
        run(name, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE",
            "-cp", cp, "org.openjdk.jmh.Main", "ZipBufferCalls.inflate$", "-f", "2",
            "-wi", "3", "-i", "5", "-w", "500ms", "-r", "500ms",
            "-jvm", jdk / "bin/java", "-jvmArgsAppend", " ".join(flags + extra + backend),
            "-rf", "json", "-rff", result])
        measured = json.loads(result.read_text())
        if len(measured) != 8: raise RuntimeError("Incomplete buffer benchmark")
        for row in measured:
            row.update(tier=tier, backend=label)
            rows.append(row)
        (OUT / "buffer-jmh.json").write_text(json.dumps(rows, indent=2) + "\n")
lines = ["Same enabled library and encoded bytes; only the call path changes.",
         "| Tier | Bytes | Input | Output | JNI ns | Intrinsic ns | Gain |",
         "| --- | ---: | --- | --- | ---: | ---: | ---: |"]
for tier, _ in tiers:
    for size in ["64", "1024"]:
        for source in ["heap", "direct"]:
            for dest in ["heap", "direct"]:
                selected = {r["backend"]: r["primaryMetric"] for r in rows
                    if r["tier"] == tier and r["params"]["size"] == size
                    and r["params"]["input"] == source and r["params"]["output"] == dest}
                a, b = selected["jni"], selected["intrinsic"]
                lines.append("| " + " | ".join([tier, size, source, dest,
                    f'{a["score"]:.2f} ± {a["scoreError"]:.2f}',
                    f'{b["score"]:.2f} ± {b["scoreError"]:.2f}',
                    f'{a["score"]/b["score"]:.2f}x']) + " |")
(OUT / "buffer-table.md").write_text("\n".join(lines) + "\n")
print("\n".join(lines), flush=True)
