"""Check the bulk-checksum candidate using a completed qualification image."""
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sys
import urllib.request

ROOT = Path.cwd()
OUT = ROOT / "validation/results"
OUT.mkdir(parents=True, exist_ok=True)
spec = importlib.util.spec_from_file_location("common", ROOT / ".github/scripts/validate-zip-backend.py")
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
run = common.run
OLD = ROOT / "validation/old-jdk"
NEW = ROOT / "validation/new-jdk"
DEBUG = ROOT / "validation/debug-jdk"

def prepare():
    # Measure a 1 KiB candidate; keep this experiment out of the production diff.
    for name in ["src/hotspot/cpu/x86/stubGenerator_x86_64_adler.cpp",
                 "src/hotspot/cpu/aarch64/stubGenerator_aarch64.cpp"]:
        path = ROOT / name
        text = path.read_text()
        needle = "c_rarg2, 65536"
        if text.count(needle) != 1:
            raise RuntimeError("Missing checksum threshold")
        path.write_text(text.replace(needle, "c_rarg2, 1024"))
    stub = ROOT / "src/hotspot/cpu/x86/stubGenerator_x86_64_adler.cpp"
    text = stub.read_text()
    gate = ("address bulk_adler = VM_Version::supports_avx512_vnni()\n"
            "      ? ZipLibrary::adler32_address() : nullptr;")
    if text.count(gate) != 1:
        raise RuntimeError("Missing x86 checksum gate")
    stub.write_text(text.replace(gate, "address bulk_adler = ZipLibrary::adler32_address();"))
    fixture = ROOT / "test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAdler32.java"
    text = fixture.read_text()
    fixture.write_text(text.replace("{65535, 65536, 65537}",
                                    "{1023, 1024, 1025, 65535, 65536, 65537}"))
    (OUT / "candidate.txt").write_text("C2 Adler32 threshold: 1024 bytes; x86 native call without AVX-512 gate\n")
    run("candidate-diff", ["git", "diff", "--check"])

def regenerate(jdk):
    for archive in sorted((jdk / "lib/server").glob("classes*.jsa")):
        flags = ["-XX:-UseCompressedOops"] if "_nocoops" in archive.stem else []
        flags += ["-XX:+UnlockExperimentalVMOptions",
                  "-XX:-UseCompactObjectHeaders" if "_nocoh" in archive.stem
                  else "-XX:+UseCompactObjectHeaders"]
        run(jdk.name + "-archive-" + archive.stem,
            [jdk / "bin/java", "-Xshare:dump", "-Xms128m", "-Xmx128m", "-XX:+UseG1GC",
             "-XX:SharedArchiveFile=" + str(archive)] + flags)

def tests():
    for jdk in [NEW, DEBUG]:
        regenerate(jdk)
    classes = OUT / "classes"
    classes.mkdir(exist_ok=True)
    fixture = ROOT / "test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAdler32.java"
    run("compile-fixture", [NEW / "bin/javac", "-d", classes, fixture])
    for collector in ["Serial", "Parallel", "G1", "Z", "Shenandoah"]:
        for mode, extra in [("intrinsic", []),
                            ("jni", ["-XX:+UnlockDiagnosticVMOptions", "-XX:-UseAdler32Intrinsics"])]:
            run("checksum-" + collector + "-" + mode,
                [DEBUG / "bin/java", "-Xshare:off", "-Xmx64m", "-Xbatch",
                 "-XX:-TieredCompilation", "-XX:CompileThreshold=1000",
                 "-XX:+Use" + collector + "GC", "-XX:+UnlockDiagnosticVMOptions",
                 "-XX:+VerifyOops"] + extra + ["-cp", classes, "TestZlibNGAdler32"])
    jtreg = ROOT / "jtreg/installed/lib/jtreg.jar"
    for jdk in [NEW, DEBUG]:
        run("jtreg-" + jdk.name, [jdk / "bin/java", "-Dprogram=jtreg", "-jar", jtreg,
             "-jdk:" + str(jdk), "-w:" + str(OUT / (jdk.name + "-work")),
             "-r:" + str(OUT / (jdk.name + "-report")), "-conc:2", "-timeoutFactor:4",
             ROOT / "test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAdler32.java",
             ROOT / "test/hotspot/jtreg/compiler/intrinsics/zip/TestZlibNGAOT.java",
             ROOT / "test/hotspot/jtreg/compiler/intrinsics/zip/TestAdler32.java"])
    (OUT / "tests-passed.txt").write_text("Checksum boundaries, five collectors, VerifyOops and AOT passed\n")

def bench():
    deps = OUT / "jmh"
    deps.mkdir(exist_ok=True)
    for name, (path, digest) in common.DEPS.items():
        target = deps / name
        urllib.request.urlretrieve("https://repo.maven.apache.org/maven2/" + path, target)
        if hashlib.sha256(target.read_bytes()).hexdigest() != digest:
            raise RuntimeError("JMH digest")
    classes = deps / "classes"
    classes.mkdir(exist_ok=True)
    cp = os.pathsep.join(str(deps / p) for p in common.DEPS)
    run("compile-bench", [NEW / "bin/javac", "-cp", cp, "-processorpath", cp,
                         "-d", classes, ROOT / "test/micro/org/openjdk/bench/java/util/zip/ZipBackend.java"])
    cp = str(classes) + os.pathsep + cp
    rows = []
    for order in range(2):
        labels = [("old", OLD), ("new", NEW)] if order == 0 else [("new", NEW), ("old", OLD)]
        for label, jdk in labels:
            result = OUT / ("adler-" + str(order) + "-" + label + ".json")
            options = ["-Xshare:off", "-Xms128m", "-Xmx128m", "-XX:+UseSerialGC",
                       "-XX:ActiveProcessorCount=2", "-Xbatch", "-XX:-TieredCompilation",
                       "-XX:CompileThreshold=1000"]
            run(result.stem, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE",
                 "-cp", cp, "org.openjdk.jmh.Main", "ZipBackend.adler32$", "-p", "data=text",
                 "-p", "size=64,256,512,1024,4096,16384,65536", "-f", "3", "-wi", "3", "-i", "6",
                 "-w", "500ms", "-r", "500ms", "-jvm", jdk / "bin/java",
                 "-jvmArgsAppend", " ".join(options), "-rf", "json", "-rff", result])
            for row in json.loads(result.read_text()):
                row.update(order=order, config=label)
                rows.append(row)
    (OUT / "adler-jmh.json").write_text(json.dumps(rows, indent=2))
    for row in rows:
        m = row["primaryMetric"]
        print("ADLER", row["order"], row["config"], row["params"]["size"],
              m["score"], m["scoreError"], flush=True)
    for size in ["64", "256", "512"]:
        bad = []
        for order in range(2):
            metrics = {r["config"]: r["primaryMetric"] for r in rows
                       if r["order"] == order and r["params"]["size"] == size}
            before, after = metrics["old"], metrics["new"]
            bad.append(after["score"] / before["score"] > 1.02 and
                       after["score"] - after["scoreError"] > before["score"] + before["scoreError"])
        if all(bad):
            raise RuntimeError("Confirmed short-input regression: " + size)
    print("Paired checksum comparison passed", flush=True)

globals()[sys.argv[1]]()
