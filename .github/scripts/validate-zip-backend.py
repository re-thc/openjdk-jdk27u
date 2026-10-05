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


"""Reproduce ZIP regression and JMH comparisons on an idle build/test host."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import urllib.request

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "validation/results"
OUT.mkdir(parents=True, exist_ok=True)


def run(name, args, cwd=None):
    args = [str(x) for x in args]
    print(name, flush=True)
    (OUT / (name + ".command.json")).write_text(json.dumps(args, indent=2) + "\n")
    try:
        with (OUT / (name + ".log")).open("w") as log:
            subprocess.run(args, cwd=cwd or REPO, stdout=log, stderr=subprocess.STDOUT,
                           check=True, timeout=10800)
    except (subprocess.CalledProcessError, subprocess.TimeoutExpired, OSError):
        print((OUT / (name + ".log")).read_text(errors="replace")[-20000:], flush=True)
        if name.startswith("jtreg-"):
            for result in sorted(OUT.glob("**/*.jtr")):
                content = result.read_text(errors="replace")
                if "test result: Failed." in content:
                    print(str(result) + "\n" + content[-20000:], flush=True)
        raise
    output = (OUT / (name + ".log")).read_text(errors="replace")
    if name.startswith("jtreg-") or name.startswith("compressed-size-"):
        print(output[-3000:], flush=True)
    return output


def gc_matrix(jdk, verify=False):
    java = jdk / "bin/java"
    if verify:
        # The assertion-enabled VM replaces the release VM in the image.
        # Regenerate every default archive for that VM before testing AOT.
        for archive in sorted((jdk / "lib/server").glob("classes*.jsa")):
            flags = ["-XX:-UseCompressedOops"] if "_nocoops" in archive.stem else []
            flags += ["-XX:+UnlockExperimentalVMOptions",
                      "-XX:-UseCompactObjectHeaders" if "_nocoh" in archive.stem
                      else "-XX:+UseCompactObjectHeaders"]
            run("fastdebug-cds-" + archive.stem,
                [java, "-Xshare:dump", "-Xms128m", "-Xmx128m", "-XX:+UseG1GC",
                 "-XX:SharedArchiveFile=" + str(archive)] + flags)
    classes = OUT / "classes"
    classes.mkdir(exist_ok=True)
    run("compile-fixture", [jdk / "bin/javac", "-d", classes,
        REPO / "test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNG.java"])
    prefix = "fastdebug" if verify else "release"
    for collector in ["Serial", "Parallel", "G1", "Z", "Shenandoah"]:
        for tier, flags in [
            ("c1", ["-XX:TieredStopAtLevel=1"]),
            ("c2", ["-XX:-TieredCompilation", "-XX:CompileThreshold=1000"])]:
            options = ["-XX:+UseZlibNG", "-Xbatch", "-Xmx64m",
                       "-XX:ActiveProcessorCount=2", "-XX:+Use" + collector + "GC"]
            if verify:
                options += ["-XX:+UnlockDiagnosticVMOptions", "-XX:+VerifyOops"]
            run(prefix + "-" + collector + "-" + tier,
                [java] + options + flags + ["-cp", classes, "TestZlibNG"])

    if verify:
        jtreg = Path(os.environ["JTREG_PATH"])
        for mode, flag in [("ng", "-XX:+UseZlibNG"), ("stock", "-XX:-UseZlibNG")]:
            run("jtreg-aot-" + mode, [jdk / "bin/java", "-Dprogram=jtreg", "-jar",
                jtreg / "lib/jtreg.jar", "-jdk:" + str(jdk),
                "-w:" + str(OUT / ("aot-" + mode + "-work")),
                "-r:" + str(OUT / ("aot-" + mode + "-report")),
                "-conc:2", "-timeoutFactor:4", "-javaoptions:" + flag,
                REPO / "test/hotspot/jtreg/runtime/cds/appcds/aotCache/HelloAOTCache.java",
                REPO / "test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeTest.java",
                REPO / "test/hotspot/jtreg/runtime/cds/MetaspaceAllocGaps.java",
                REPO / "test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAOT.java"])


def tests(jdk, jtreg):
    os.environ["JAVA_HOME"] = str(jdk)
    os.environ["PATH"] = str(jdk / "bin") + os.pathsep + os.environ["PATH"]
    suites = ["test/jdk/java/util/zip",
              "test/hotspot/jtreg/compiler/intrinsics/zip",
              "test/jdk/jdk/nio/zipfs/Basic.java"]
    for mode, flag in [("ng", "-XX:+UseZlibNG"), ("stock", "-XX:-UseZlibNG")]:
        run("jtreg-" + mode, [jdk / "bin/java", "-Dprogram=jtreg", "-jar", jtreg / "lib/jtreg.jar", "-ignore:quiet",
            "-jdk:" + str(jdk), "-w:" + str(OUT / (mode + "-work")),
            "-r:" + str(OUT / (mode + "-report")), "-conc:2", "-timeoutFactor:4",
            "-javaoptions:" + flag] + [REPO / s for s in suites])
    run("jtreg-heap", [jdk / "bin/java", "-Dprogram=jtreg", "-jar", jtreg / "lib/jtreg.jar", "-jdk:" + str(jdk),
        "-w:" + str(OUT / "heap-work"), "-r:" + str(OUT / "heap-report"),
        "-timeoutFactor:4", "-javaoptions:-XX:+UseZlibNG",
        REPO / "test/hotspot/jtreg/serviceability/dcmd/gc/HeapDumpCompressedTest.java"])
    gc_matrix(jdk)
    java = jdk / "bin/java"
    classes = OUT / "classes"
    run("interpreter-checked-jni", [java, "-XX:+UseZlibNG", "-Xint", "-Xcheck:jni",
        "-Xmx64m", "-cp", classes, "TestZlibNG"])
    run("jar-create", [jdk / "bin/jar", "--create", "--file", OUT / "fixture.jar",
        "-C", classes, "TestZlibNG.class"])
    run("jar-class-loader", [java, "-XX:+UseZlibNG", "-Xmx64m", "-cp",
        OUT / "fixture.jar", "TestZlibNG"])
    for dump_flag in ["-XX:+UseZlibNG", "-XX:-UseZlibNG"]:
        name = "ng" if "+" in dump_flag else "stock"
        archive = OUT / (name + ".jsa")
        run("cds-dump-" + name, [java, dump_flag, "-Xshare:dump",
            "-XX:SharedArchiveFile=" + str(archive)])
        for use_flag in ["-XX:+UseZlibNG", "-XX:-UseZlibNG"]:
            use_name = "ng" if "+" in use_flag else "stock"
            options = [use_flag, "-Xshare:on", "-XX:SharedArchiveFile=" + str(archive),
                       "-Xmx64m", "-Xbatch", "-XX:-TieredCompilation",
                       "-XX:CompileThreshold=1000"]
            if use_name == "ng":
                options += ["-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintIntrinsics"]
            output = run("cds-" + name + "-to-" + use_name,
                [java] + options + ["-cp", classes, "TestZlibNG"])
            if use_name == "ng" and not re.search(r"ZipUtils::process.*\(intrinsic\)", output):
                print(output[-20000:], flush=True)
                raise RuntimeError("Compression intrinsic absent in CDS run")
    linked = OUT / "linked-jdk"
    run("jlink", [jdk / "bin/jlink", "-J-XX:+UseZlibNG", "--module-path",
        jdk / "jmods", "--add-modules", "java.base", "--compress=zip-6",
        "--output", linked])
    run("jlink-runtime", [linked / "bin/java", "-XX:+UseZlibNG", "-Xmx64m",
        "-cp", classes, "TestZlibNG"])
    shutil.rmtree(linked)
    for archive in OUT.glob("*.jsa"):
        archive.unlink()
    (OUT / "tests-passed.txt").write_text("jtreg, GC, JNI, CDS, JAR, zipfs and jlink passed\n")


DEPS = {
    "jmh-core.jar": ("org/openjdk/jmh/jmh-core/1.37/jmh-core-1.37.jar",
                    "dc0eaf2bbf0036a70b60798c785d6e03a9daf06b68b8edb0f1ba9eb3421baeb3"),
    "jmh-generator.jar": ("org/openjdk/jmh/jmh-generator-annprocess/1.37/jmh-generator-annprocess-1.37.jar",
                         "6a5604b5b804e0daca1145df1077609321687734a8b49387e49f10557c186c77"),
    "jopt-simple.jar": ("net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar",
                        "df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28"),
    "commons-math3.jar": ("org/apache/commons/commons-math3/3.6.1/commons-math3-3.6.1.jar",
                         "1e56d7b058d28b65abd256b8458e3885b674c1d588fa43cd7d1cbb9c7ef2b308"),
}


def benchmarks(jdk, baseline):
    deps = OUT / "jmh"
    deps.mkdir(exist_ok=True)
    for name, (path, digest) in DEPS.items():
        target = deps / name
        if not target.exists():
            urllib.request.urlretrieve("https://repo.maven.apache.org/maven2/" + path, target)
        if hashlib.sha256(target.read_bytes()).hexdigest() != digest:
            raise RuntimeError("Dependency digest mismatch: " + name)
    classes = deps / "classes"
    classes.mkdir(exist_ok=True)
    cp = os.pathsep.join(str(deps / p) for p in DEPS)
    run("compile-benchmark", [jdk / "bin/javac", "-cp", cp, "-processorpath", cp,
        "-d", classes, REPO / "test/micro/org/openjdk/bench/java/util/zip/ZipBackend.java"])
    cp = str(classes) + os.pathsep + cp
    common = ["-Xms128m", "-Xmx128m", "-XX:+UseSerialGC", "-XX:ActiveProcessorCount=2"]
    configs = [
        ("baseline", baseline, []),
        ("default", jdk, ["-XX:-UseZlibNG"]),
        ("ng-jni", jdk, ["-XX:+UseZlibNG", "-XX:+UnlockDiagnosticVMOptions", "-XX:-UseZipIntrinsics"]),
        ("ng-intrinsic", jdk, ["-XX:+UseZlibNG"])]
    tiers = [
        ("int", ["-Xint"]),
        ("c1", ["-XX:TieredStopAtLevel=1", "-Xbatch"]),
        ("c2", ["-XX:-TieredCompilation", "-XX:CompileThreshold=1000", "-Xbatch"])]

    sizes_source = deps / "ZipSizes.java"
    sizes_source.write_text("""
import org.openjdk.bench.java.util.zip.ZipBackend;
public class ZipSizes {
    public static void main(String[] args) throws Exception {
        var field = ZipBackend.class.getDeclaredField("compressedLength");
        field.setAccessible(true);
        System.out.println("data,bytes,compressed_bytes");
        for (String data : new String[]{"text", "random"}) {
            for (int size : new int[]{64, 1024, 65536}) {
                ZipBackend b = new ZipBackend();
                b.data = data; b.size = size; b.setup();
                System.out.println(data + "," + size + "," + field.getInt(b));
                b.tearDown();
            }
        }
    }
}
""")
    run("compile-size-record", [jdk / "bin/javac", "-cp", cp, "-d", classes, sizes_source])
    for label, target, extra in configs:
        run("compressed-size-" + label, [target / "bin/java"] + extra +
            ["-cp", cp, "ZipSizes"])

    all_results = []
    for tier, flags in tiers:
        for label, target, extra in configs:
            run("version-" + label, [target / "bin/java"] + extra + ["-version"])
            for group, pattern, data in [
                ("compression", "ZipBackend.(deflate|inflate)$", "text,random"),
                ("checksum", "ZipBackend.(adler32|crc32|crc32c)$", "text")]:
                name = tier + "-" + label + "-" + group
                result_file = OUT / (name + ".json")
                run(name, [target / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE",
                    "-cp", cp, "org.openjdk.jmh.Main", pattern,
                    "-p", "size=64,1024,65536", "-p", "data=" + data,
                    "-f", "2", "-wi", "3", "-i", "5", "-w", "1s", "-r", "500ms",
                    "-jvm", target / "bin/java", "-jvmArgsAppend", " ".join(common + flags + extra),
                    "-rf", "json", "-rff", result_file])
                rows = json.loads(result_file.read_text())
                expected = 12 if group == "compression" else 9
                if len(rows) != expected:
                    raise RuntimeError("Incomplete benchmark group: " + name)
                for row in rows:
                    row["tier"] = tier
                    row["backend"] = label
                    all_results.append(row)
                (OUT / "all-jmh.json").write_text(json.dumps(all_results, indent=2) + "\n")
    groups = {}
    for row in all_results:
        key = (row["tier"], row["benchmark"].rsplit(".", 1)[1],
               row["params"]["data"], int(row["params"]["size"]))
        groups.setdefault(key, {})[row["backend"]] = row["primaryMetric"]
    lines = [
        "All values are ns/op. Errors are JMH 99.9% confidence intervals.",
        "Two forks; three 1 s warmups and five 0.5 s measurements per fork.",
        "Serial GC, 128 MiB heap, two active processors; reusable streams.",
        "Inflater setup uses the selected compressor, so encoded sizes may differ.",
        "",
        "| Tier | Operation | Data | Bytes | Baseline | Default | ng JNI | ng intrinsic | Speedup |",
        "| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |"]
    def fmt(metric):
        return f'{metric["score"]:.1f} ± {metric["scoreError"]:.1f}'
    for key, variants in sorted(groups.items()):
        values = [fmt(variants[v]) for v in ["baseline", "default", "ng-jni", "ng-intrinsic"]]
        speedup = variants["baseline"]["score"] / variants["ng-intrinsic"]["score"]
        lines.append("| " + " | ".join(map(str, key)) + " | " + " | ".join(values)
                     + f" | {speedup:.2f}× |")
    (OUT / "jmh-table.md").write_text("\n".join(lines) + "\n")
    print("\n".join(lines), flush=True)
    (OUT / "benchmarks-passed.txt").write_text("All 252 JMH cases completed\n")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("action", choices=["tests", "gc", "benchmarks"])
    parser.add_argument("--jdk", type=Path, required=True)
    parser.add_argument("--jtreg", type=Path)
    parser.add_argument("--baseline", type=Path)
    parser.add_argument("--verify-oops", action="store_true")
    options = parser.parse_args()
    jdk = options.jdk.resolve()
    if options.action == "tests":
        tests(jdk, options.jtreg.resolve())
    elif options.action == "gc":
        gc_matrix(jdk, options.verify_oops)
    else:
        benchmarks(jdk, options.baseline.resolve())
