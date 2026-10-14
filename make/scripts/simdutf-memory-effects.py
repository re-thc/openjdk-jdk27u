import json
import os
from pathlib import Path
import platform
import subprocess
import sys

candidate, head, base, output = map(Path, sys.argv[1:])
cp = "jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated = output / "classes", output / "generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(candidate / "bin/javac"), "-cp", cp, "-processorpath", cp, "-d", str(classes),
                "-s", str(generated), "test/micro/org/openjdk/bench/java/lang/SimdUTF.java"], check=True)
cp = str(classes) + os.pathsep + cp
cpu = min(os.sched_getaffinity(0))
os.sched_setaffinity(0, {cpu})
common = ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100",
          "-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2"]
modes = [("base", base, []), ("old-off", head, ["-XX:-UseSIMDUTFIntrinsics"]),
         ("old-on", head, []), ("new-off", candidate, ["-XX:-UseSIMDUTFIntrinsics"]), ("new-on", candidate, [])]
print("MEMORY_METADATA", json.dumps({"arch": platform.machine(), "cpu": cpu,
      "base": "6d264328aefdc3ceff659360ead6567a8e36190c",
      "control": "6473e580c7dd5aeef99f3397793ab952c8f72433",
      "candidate": "read-only leaf memory effects"}), flush=True)
for mode, image, extra in modes:
    java = image / "bin/java"
    for study, methods, sizes in [
        ("count", "codePointCount|charArrayCodePointCount", "128,256,512,1024,4096,1048576"),
        ("validation", "unicodeValidation|asciiCharValidation|encodedLength", "128,4096")]:
        result = output / (study + "-" + mode + ".json")
        command = [str(java), "-cp", cp, "org.openjdk.jmh.Main",
                   "org.openjdk.bench.java.lang.SimdUTF.(" + methods + ")$", "-p", "size=" + sizes,
                   "-f", "3", "-wi", "5", "-i", "5", "-w", "500ms", "-r", "500ms",
                   "-t", "1", "-prof", "gc", "-jvm", str(java), "-jvmArgs", " ".join(common + extra),
                   "-rf", "json", "-rff", str(result)]
        with (output / (study + "-" + mode + ".log")).open("w") as log:
            p = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
        if p.returncode:
            print((output / (study + "-" + mode + ".log")).read_text()[-12000:], flush=True)
            raise SystemExit(p.returncode)
        for sample in json.loads(result.read_text()):
            metric = sample["primaryMetric"]
            print("MEMORY_RESULT", json.dumps({"mode": mode, "study": study,
                  "method": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
                  "ns": metric["score"], "ci": metric["scoreConfidence"]}), flush=True)
for mode, image, extra in modes:
    java = image / "bin/java"
    command = [str(java), "-cp", cp, "org.openjdk.jmh.Main", "org.openjdk.bench.java.lang.SimdUTF.codePointCount$",
               "-p", "size=128", "-f", "1", "-wi", "3", "-i", "1", "-w", "300ms", "-r", "100ms",
               "-jvm", str(java), "-jvmArgs", " ".join(common + extra + [
               "-XX:+UnlockDiagnosticVMOptions",
               "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.SimdUTF_codePointCount_jmhTest::*",
               "-XX:CompileCommand=PrintInlining,org.openjdk.bench.java.lang.jmh_generated.SimdUTF_codePointCount_jmhTest::*"])]
    with (output / ("assembly-count-" + mode + ".log")).open("w") as log:
        subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
print("MEMORY_COMPLETE", flush=True)
