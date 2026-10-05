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



"""Measure an experimental Java scalar Adler32 path without changing production sources."""
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
patch_src = OUT / "patch-src/java/util/zip/Adler32.java"
patch_src.parent.mkdir(parents=True, exist_ok=True)
original = (REPO / "src/java.base/share/classes/java/util/zip/Adler32.java").read_text()
old = """    public void update(int b) {
        adler = update(adler, b);
    }"""
new = """    public void update(int b) {
        if (ZipUtils.USE_ZIP_INTRINSICS) {
            int low = (adler & 0xffff) + (b & 0xff);
            if (low >= 65521) low -= 65521;
            int high = (adler >>> 16) + low;
            if (high >= 65521) high -= 65521;
            adler = (high << 16) | low;
        } else {
            adler = update(adler, b);
        }
    }"""
if original.count(old) != 1:
    raise RuntimeError("Expected Adler32 method missing")
patch_src.write_text(original.replace(old, new))
patch_classes = OUT / "patch-classes"
patch_classes.mkdir(exist_ok=True)
run("compile-scalar-patch", [jdk / "bin/javac", "--patch-module",
    "java.base=" + str(OUT / "patch-src"), "-d", patch_classes, patch_src])
check = OUT / "AdlerScalarCheck.java"
check.write_text("""
import java.util.zip.Adler32;
public class AdlerScalarCheck {
    public static void main(String[] args) {
        Adler32 actual = new Adler32();
        long low = 1, high = 0;
        int bits = 12345;
        for (int i = 0; i < 1000000; i++) {
            bits ^= bits << 13; bits ^= bits >>> 17; bits ^= bits << 5;
            int value = switch (i & 7) {
                case 0 -> Integer.MIN_VALUE;
                case 1 -> Integer.MAX_VALUE;
                case 2 -> -1;
                case 3 -> 256;
                default -> bits;
            };
            actual.update(value);
            low = (low + (value & 255)) % 65521;
            high = (high + low) % 65521;
            if (actual.getValue() != ((high << 16) | low))
                throw new AssertionError("mismatch at " + i);
            if (i % 7777 == 0) {
                byte[] bytes = {(byte)bits, (byte)(bits >>> 8), (byte)(bits >>> 16)};
                actual.update(bytes);
                for (byte b : bytes) {
                    low = (low + (b & 255)) % 65521;
                    high = (high + low) % 65521;
                }
            }
            if (i % 65535 == 65534) {
                actual.reset(); low = 1; high = 0;
            }
        }
        System.out.println("One million scalar updates verified, including signed bytes, wrapping, bulk interleaving and reset");
    }
}
""")
classes = OUT / "scalar-classes"
classes.mkdir(exist_ok=True)
run("compile-scalar-reference", [jdk / "bin/javac", "-d", classes, check])
deps = OUT / "jmh"
deps.mkdir(exist_ok=True)
for name, (path, digest) in common.DEPS.items():
    target = deps / name
    urllib.request.urlretrieve("https://repo.maven.apache.org/maven2/" + path, target)
    if hashlib.sha256(target.read_bytes()).hexdigest() != digest:
        raise RuntimeError("Dependency digest mismatch: " + name)
cp = ":".join(str(deps / p) for p in common.DEPS)
run("compile-scalar-benchmark", [jdk / "bin/javac", "-cp", cp, "-processorpath", cp,
    "-d", classes, REPO / ".github/diagnostics/AdlerScalar.java"])
cp = str(classes) + ":" + cp
flags = ["-Xms128m", "-Xmx128m", "-XX:+UseSerialGC", "-XX:ActiveProcessorCount=2"]
configs = [("stock-jni", ["-XX:-UseZlibNG"]),
           ("ng-jni", ["-XX:+UseZlibNG"]),
           ("java-experiment", ["-XX:+UseZlibNG", "--patch-module=java.base=" + str(patch_classes)])]
tiers = [("int", ["-Xint"]), ("c1", ["-XX:TieredStopAtLevel=1", "-Xbatch"]),
         ("c2", ["-XX:-TieredCompilation", "-XX:CompileThreshold=1000", "-Xbatch"])]
rows = []
for tier, extra in tiers:
    for label, backend in configs:
        name = "scalar-" + tier + "-" + label
        output = run(name + "-reference", [jdk / "bin/java"] + flags + extra + backend +
                     ["-cp", classes, "AdlerScalarCheck"])
        print(name + ": " + output.strip(), flush=True)
        result = OUT / (name + ".json")
        run(name, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE",
            "-cp", cp, "org.openjdk.jmh.Main", "AdlerScalar.update$", "-f", "2",
            "-wi", "3", "-i", "5", "-w", "500ms", "-r", "500ms",
            "-jvm", jdk / "bin/java", "-jvmArgsAppend", " ".join(flags + extra + backend),
            "-rf", "json", "-rff", result])
        measured = json.loads(result.read_text())
        if len(measured) != 2: raise RuntimeError("Incomplete scalar benchmark")
        for row in measured:
            row.update(tier=tier, backend=label)
            rows.append(row)
        (OUT / "scalar-jmh.json").write_text(json.dumps(rows, indent=2) + "\n")
lines = ["Experimental patched Java implementation; production source is unchanged.",
         "| Tier | Byte | Stock JNI ns | ng JNI ns | Java experiment ns |",
         "| --- | ---: | ---: | ---: | ---: |"]
for tier, _ in tiers:
    for value in ["0", "255"]:
        selected = {r["backend"]: r["primaryMetric"] for r in rows
                    if r["tier"] == tier and r["params"]["value"] == value}
        values = [f'{selected[label]["score"]:.2f} ± {selected[label]["scoreError"]:.2f}'
                  for label, _ in configs]
        lines.append("| " + " | ".join([tier, value] + values) + " |")
(OUT / "scalar-table.md").write_text("\n".join(lines) + "\n")
print("\n".join(lines), flush=True)
