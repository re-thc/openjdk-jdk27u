import csv
import json
import os
from pathlib import Path
import platform
import subprocess
import sys

base, head, output = map(Path, sys.argv[1:])
output.mkdir(exist_ok=True)
jars = sorted((head / "jmh").glob("*.jar"))
classpath = os.pathsep.join(map(str, jars))
classes = output / "classes"
generated = output / "generated"
classes.mkdir(exist_ok=True)
generated.mkdir(exist_ok=True)
source = head / "test/micro/org/openjdk/bench/java/lang/SimdUTF.java"
subprocess.run([str(head / "build/review/images/jdk/bin/javac"), "-cp", classpath,
                "-processorpath", classpath, "-d", str(classes), "-s", str(generated), str(source)], check=True)
classpath = str(classes) + os.pathsep + classpath
available = os.sched_getaffinity(0)
cpu = min(available)
os.sched_setaffinity(0, {cpu})
metadata = {"architecture": platform.machine(), "cpu": cpu, "base": "6d264328aefdc3ceff659360ead6567a8e36190c",
            "head": "6473e580c7dd5aeef99f3397793ab952c8f72433", "forks": 2, "warmups": "3 x 200ms", "measurements": "4 x 200ms",
            "gc": "Serial", "heap": "1 GiB"}
(output / "metadata.json").write_text(json.dumps(metadata, indent=2))
print("BENCHMARK_METADATA", json.dumps(metadata), flush=True)
workloads = "latin1Decode|asciiDecode|latin1CharsetEncode|latin1Encode|utf16Encode|charsetEncode|charsetDecode|charsetDecodeTight|utf32SupplementaryCharsetEncode|codePointCount|base64Encode|base64Decode|base64StreamEncode"
studies = [
    ("bulk", workloads, "4096,65536"),
    ("blocker-repeat", "latin1Decode|codePointCount|malformedCharsetEncode|malformedCharsetDecode", "128,4096,1048576"),
    ("tight-example", "charsetDecodeTight", "12288"),
    ("threshold-ascii", "asciiDecode", "31,32,33,255,256,257"),
    ("threshold-utf16", "utf16Encode", "127,128,129"),
    ("threshold-decode", "charsetDecodeTight", "255,256,257"),
    ("threshold-count", "codePointCount", "126,128,130,256,512,1022,1024,1026,2048"),
    ("malformed", "malformedCharsetDecode|malformedCharsetEncode", "128,4096,1048577"),
    ("large", "latin1Encode|latin1Decode|utf16Encode|charsetDecodeTight|codePointCount|base64Encode|base64Decode", "1048575,1048576,1048577,1048578,4194304")
]
tiers = {"interp": ["-Xint"], "c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"],
         "c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"]}
images = {"base": base / "build/base/images/jdk/bin/java", "off": head / "build/review/images/jdk/bin/java",
          "on": head / "build/review/images/jdk/bin/java"}
studies.sort(key=lambda study: ({"malformed": 0, "large": 1}.get(study[0], 2)))
for study, methods, sizes in studies:
    for tier, tier_flags in tiers.items():
        if study == "blocker-repeat" and tier != "c2": continue
        for image, java in images.items():
            label = f"{study}-{tier}-{image}"
            flags = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2", *tier_flags]
            if image == "off": flags.append("-XX:-UseSIMDUTFIntrinsics")
            command = [str(java), "-XX:ActiveProcessorCount=2", "-cp", classpath, "org.openjdk.jmh.Main",
                       f"org.openjdk.bench.java.lang.SimdUTF.({methods})$", "-p", f"size={sizes}",
                       "-f", "3" if study == "blocker-repeat" else "2", "-wi", "5" if study == "blocker-repeat" else "3",
                       "-i", "5" if study == "blocker-repeat" else "4", "-w", "500ms" if study == "blocker-repeat" else "200ms",
                       "-r", "500ms" if study == "blocker-repeat" else "200ms", "-t", "1",
                       "-prof", "gc", "-jvm", str(java), "-jvmArgs", " ".join(flags), "-rf", "json",
                       "-rff", str(output / (label + ".json"))]
            print("BENCHMARK_START", label, flush=True)
            with (output / (label + ".log")).open("w") as log:
                result = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
            if result.returncode:
                print((output / (label + ".log")).read_text()[-16000:], flush=True)
                raise SystemExit(result.returncode)
            samples = json.loads((output / (label + ".json")).read_text())
            if not samples or any("error" in sample or not sample["primaryMetric"].get("rawData") for sample in samples):
                print((output / (label + ".log")).read_text()[-16000:], flush=True)
                raise RuntimeError("Missing benchmark measurements: " + label)
            for sample in samples:
                primary = sample["primaryMetric"]
                allocation = sample["secondaryMetrics"]["gc.alloc.rate.norm"]
                record = {"study": study, "tier": tier, "image": image,
                          "workload": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
                          "ns": primary["score"], "ci": primary["scoreConfidence"],
                          "bytes_per_op": allocation["score"], "alloc_ci": allocation["scoreConfidence"]}
                print("BENCHMARK_RESULT", json.dumps(record), flush=True)
print("BENCHMARK_COMPLETE", flush=True)
