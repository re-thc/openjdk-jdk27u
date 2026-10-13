import json
import os
from pathlib import Path
import platform
import subprocess
import sys
head, base, output = map(Path, sys.argv[1:])
output.mkdir(exist_ok=True)
tiers = {"c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"]}
common = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2",
          "-XX:+UnlockDiagnosticVMOptions", "-XX:+PrintInlining"]
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
               "-f", "3", "-wi", "5", "-i", "5", "-w", "500ms", "-r", "500ms", "-t", "1",
               "-prof", "gc", "-jvm", str(java), "-jvmArgs", " ".join([*common, *tiers[tier], *extra]),
               "-rf", "json", "-rff", str(result)]
    print("ENCODER_START", label, flush=True)
    with (output / (label + ".log")).open("w") as log:
        run = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
    if run.returncode:
        print((output / (label + ".log")).read_text()[-12000:], flush=True)
        raise SystemExit(run.returncode)
    samples = json.loads(result.read_text())
    assert samples and all(s["primaryMetric"].get("rawData") for s in samples)
    for sample in samples:
        p = sample["primaryMetric"]
        print("ENCODER_RESULT", json.dumps({"study": study, "mode": mode, "tier": tier,
              "method": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
              "ns": p["score"], "ci": p["scoreConfidence"], "bytes": sample["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}), flush=True)


for mode in ("base", "off", "on", "slow-inline", "slow-no-inline"):
    java = (base if mode == "base" else head) / "bin/java"
    extra = ["-XX:-UseSIMDUTFIntrinsics"] if mode == "off" else []
    if mode == "slow-inline":
        extra = ["-XX:CompileCommand=inline,sun.nio.cs.UTF_8$Encoder::encodeArrayLoopSlow"]
    if mode == "slow-no-inline":
        extra = ["-XX:CompileCommand=dontinline,sun.nio.cs.UTF_8$Encoder::encodeArrayLoopSlow"]
    measure("encoder", mode, "c1", "malformedCharsetEncode", "128,4096,1048577", java, extra)
    for line in (output / ("encoder-" + mode + "-c1.log")).read_text().splitlines():
        if "UTF_8$Encoder::encodeArrayLoopSlow" in line:
            print("ENCODER_INLINING", mode, line, flush=True)
print("ENCODER_COMPLETE", flush=True)
