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
common = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2"]
tiers = {"interp": ["-Xint"], "c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"],
         "c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"]}
modes = [("base", base, []), ("old-off", head, ["-XX:-UseSIMDUTFIntrinsics"]),
         ("old-on", head, []), ("new-off", candidate, ["-XX:-UseSIMDUTFIntrinsics"]), ("new-on", candidate, [])]
print("ASCII_METADATA", json.dumps({"arch": platform.machine(), "cpu": cpu,
      "base": "6d264328aefdc3ceff659360ead6567a8e36190c",
      "control": "6473e580c7dd5aeef99f3397793ab952c8f72433",
      "candidate": "bounded ASCII interpreter entry"}), flush=True)
for tier, flags in tiers.items():
  for mode, image, extra in modes:
    java = image / "bin/java"
    for study, methods, sizes in [
        ("ascii", "asciiDecode|asciiCharsetDecode", "31,32,33,255,256,4096"),
        ("malformed", "malformedCharsetDecode", "128,4096"),
        ("latin1", "latin1Decode", "128,4096")]:
        label = study + "-" + mode + "-" + tier
        result = output / (label + ".json")
        command = [str(java), "-cp", cp, "org.openjdk.jmh.Main",
                   "org.openjdk.bench.java.lang.SimdUTF.(" + methods + ")$", "-p", "size=" + sizes,
                   "-f", "2", "-wi", "3", "-i", "4", "-w", "300ms", "-r", "300ms",
                   "-t", "1", "-prof", "gc", "-jvm", str(java), "-jvmArgs", " ".join(common + flags + extra),
                   "-rf", "json", "-rff", str(result)]
        with (output / (label + ".log")).open("w") as log:
            p = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
        if p.returncode:
            print((output / (label + ".log")).read_text()[-12000:], flush=True)
            raise SystemExit(p.returncode)
        for sample in json.loads(result.read_text()):
            metric = sample["primaryMetric"]
            print("ASCII_RESULT", json.dumps({"mode": mode, "study": study, "tier": tier,
                  "method": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
                  "ns": metric["score"], "ci": metric["scoreConfidence"]}), flush=True)
print("ASCII_COMPLETE", flush=True)
