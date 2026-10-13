import json
import os
from pathlib import Path
import subprocess
import sys

head, base, output = map(Path, sys.argv[1:])
output.mkdir(exist_ok=True)
src = Path("src/java.base/share/classes/sun/nio/cs/UTF_8.java")
original = src.read_text()
old = """SimdUTF.isEligible(sl - sp)
                    && (sa[sp] & 0xff) >= 0xc2 && (sa[sp] & 0xff) <= 0xf4"""
new = """sp < sl && (sa[sp] & 0xff) >= 0xc2 && (sa[sp] & 0xff) <= 0xf4
                    && SimdUTF.isEligible(sl - sp)"""
assert original.count(old) == 1
patchsrc = output / "patch-src/sun/nio/cs/UTF_8.java"
patchsrc.parent.mkdir(parents=True)
patchsrc.write_text(original.replace(old, new))
patch = output / "patch-classes"
patch.mkdir()
subprocess.run([str(head / "bin/javac"), "--patch-module", "java.base=" + str(output / "patch-src"),
                "-d", str(patch), str(patchsrc)], check=True)
testclasses = output / "tests"
testclasses.mkdir()
subprocess.run([str(head / "bin/javac"), "--add-exports", "java.base/jdk.internal.util=ALL-UNNAMED",
                "-d", str(testclasses), "test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java"], check=True)
tiers = {"interp": ["-Xint"], "c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"],
         "c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"]}
common = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2"]
for tier, flags in tiers.items():
    subprocess.run([str(head / "bin/java"), "--patch-module", "java.base=" + str(patch),
                    "--add-exports", "java.base/jdk.internal.util=ALL-UNNAMED",
                    "--add-opens", "java.base/jdk.internal.util=ALL-UNNAMED",
                    *common, *flags, "-cp", str(testclasses), "SimdUTFTest"], check=True)
classpath = "jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated = output / "classes", output / "generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(head / "bin/javac"), "-cp", classpath, "-processorpath", classpath,
                "-d", str(classes), "-s", str(generated), "test/micro/org/openjdk/bench/java/lang/SimdUTF.java"], check=True)
classpath = str(classes) + os.pathsep + classpath
os.sched_setaffinity(0, {min(os.sched_getaffinity(0))})

def measure(study, mode, tier, methods, sizes, java, extra):
    label = "-".join((study, mode, tier))
    result = output / (label + ".json")
    command = [str(java), "-cp", classpath, "org.openjdk.jmh.Main",
               "org.openjdk.bench.java.lang.SimdUTF.(" + methods + ")$", "-p", "size=" + sizes,
               "-f", "2", "-wi", "3", "-i", "4", "-w", "300ms", "-r", "300ms", "-t", "1",
               "-prof", "gc", "-jvm", str(java), "-jvmArgs", " ".join([*common, *tiers[tier], *extra]),
               "-rf", "json", "-rff", str(result)]
    print("RESIDUAL_START", label, flush=True)
    with (output / (label + ".log")).open("w") as log:
        run = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
    if run.returncode:
        print((output / (label + ".log")).read_text()[-12000:], flush=True)
        raise SystemExit(run.returncode)
    samples = json.loads(result.read_text())
    assert samples and all(s["primaryMetric"].get("rawData") for s in samples)
    for sample in samples:
        p = sample["primaryMetric"]
        print("RESIDUAL_RESULT", json.dumps({"study": study, "mode": mode, "tier": tier,
              "method": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
              "ns": p["score"], "ci": p["scoreConfidence"], "bytes": sample["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}), flush=True)

for tier in tiers:
    for mode in ("base", "off", "on", "precheck-off", "precheck-on"):
        java = (base if mode == "base" else head) / "bin/java"
        extra = ["-XX:-UseSIMDUTFIntrinsics"] if mode.endswith("off") else []
        if mode.startswith("precheck"): extra += ["--patch-module=java.base=" + str(patch)]
        measure("malformed", mode, tier, "malformedCharsetDecode", "128,4096,1048577", java, extra)
        measure("valid", mode, tier, "charsetDecodeTight", "255,256,257,4096,12288", java, extra)
for tier in ("c1", "c2"):
    for mode in ("base", "off", "on", "no-count-inline"):
        java = (base if mode == "base" else head) / "bin/java"
        extra = ["-XX:-UseSIMDUTFIntrinsics"] if mode == "off" else []
        if mode == "no-count-inline":
            extra = ["-XX:CompileCommand=dontinline,jdk.internal.util.SimdUTF::countCodePoints"]
        measure("count", mode, tier, "codePointCount", "128,256,512,1024,2048,4096", java, extra)
print("RESIDUAL_COMPLETE", flush=True)
