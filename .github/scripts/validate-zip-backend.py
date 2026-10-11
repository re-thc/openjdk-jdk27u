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
                if "test result: Failed." in content or "test result: Error." in content:
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
            options = ["-XX:+UseZipIntrinsics", "-Xbatch", "-Xmx64m",
                       "-XX:ActiveProcessorCount=2", "-XX:+Use" + collector + "GC"]
            if verify:
                options += ["-XX:+UnlockDiagnosticVMOptions", "-XX:+VerifyOops"]
            run(prefix + "-" + collector + "-" + tier,
                [java] + options + flags + ["-cp", classes, "TestZlibNG"])

    if verify:
        jtreg = Path(os.environ["JTREG_PATH"])
        for mode, flag in [("intrinsic", "-XX:+UseZipIntrinsics"), ("jni", "-XX:-UseZipIntrinsics")]:
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
    for mode, flag in [("intrinsic", "-XX:+UseZipIntrinsics"), ("jni", "-XX:-UseZipIntrinsics")]:
        run("jtreg-" + mode, [jdk / "bin/java", "-Dprogram=jtreg", "-jar", jtreg / "lib/jtreg.jar", "-ignore:quiet",
            "-jdk:" + str(jdk), "-w:" + str(OUT / (mode + "-work")),
            "-r:" + str(OUT / (mode + "-report")), "-conc:2", "-timeoutFactor:4",
            "-javaoptions:" + flag] + [REPO / s for s in suites])
    run("jtreg-heap", [jdk / "bin/java", "-Dprogram=jtreg", "-jar", jtreg / "lib/jtreg.jar", "-jdk:" + str(jdk),
        "-w:" + str(OUT / "heap-work"), "-r:" + str(OUT / "heap-report"),
        "-timeoutFactor:4", "-javaoptions:-XX:+UseZipIntrinsics",
        REPO / "test/hotspot/jtreg/serviceability/dcmd/gc/HeapDumpCompressedTest.java"])
    gc_matrix(jdk)
    java = jdk / "bin/java"
    classes = OUT / "classes"
    run("interpreter-checked-jni", [java, "-XX:+UseZipIntrinsics", "-Xint", "-Xcheck:jni",
        "-Xmx64m", "-cp", classes, "TestZlibNG"])
    run("jar-create", [jdk / "bin/jar", "--create", "--file", OUT / "fixture.jar",
        "-C", classes, "TestZlibNG.class"])
    run("jar-class-loader", [java, "-XX:+UseZipIntrinsics", "-Xmx64m", "-cp",
        OUT / "fixture.jar", "TestZlibNG"])
    for dump_flag in ["-XX:+UseZipIntrinsics", "-XX:-UseZipIntrinsics"]:
        name = "intrinsic" if "+" in dump_flag else "jni"
        archive = OUT / (name + ".jsa")
        run("cds-dump-" + name, [java, dump_flag, "-Xshare:dump",
            "-XX:SharedArchiveFile=" + str(archive)])
        for use_flag in ["-XX:+UseZipIntrinsics", "-XX:-UseZipIntrinsics"]:
            use_name = "intrinsic" if "+" in use_flag else "jni"
            options = [use_flag, "-Xshare:on", "-XX:SharedArchiveFile=" + str(archive),
                       "-Xmx64m", "-Xbatch", "-XX:-TieredCompilation",
                       "-XX:CompileThreshold=1000"]
            if use_name == "intrinsic":
                options += ["-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintIntrinsics"]
            output = run("cds-" + name + "-to-" + use_name,
                [java] + options + ["-cp", classes, "TestZlibNG"])
            if use_name == "intrinsic" and not re.search(r"ZipUtils::process.*\(intrinsic\)", output):
                print(output[-20000:], flush=True)
                raise RuntimeError("Compression intrinsic absent in CDS run")
    linked = OUT / "linked-jdk"
    run("jlink", [jdk / "bin/jlink", "-J-XX:+UseZipIntrinsics", "--module-path",
        jdk / "jmods", "--add-modules", "java.base", "--compress=zip-6",
        "--output", linked])
    run("jlink-runtime", [linked / "bin/java", "-XX:+UseZipIntrinsics", "-Xmx64m",
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


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("mode", choices=["tests", "gc"])
    parser.add_argument("--jdk", type=Path, required=True)
    parser.add_argument("--jtreg", type=Path)
    parser.add_argument("--verify-oops", action="store_true")
    args = parser.parse_args()
    if args.mode == "tests":
        tests(args.jdk.resolve(), args.jtreg.resolve())
    else:
        gc_matrix(args.jdk.resolve(), args.verify_oops)
