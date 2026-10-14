import csv
import json
import os
from pathlib import Path
import platform
import subprocess
import sys

base, head, output = map(Path, sys.argv[1:])
output.mkdir(exist_ok=True)
jars = sorted(Path("jmh").glob("*.jar"))
classpath = os.pathsep.join(map(str, jars))
classes = output / "classes"
generated = output / "generated"
classes.mkdir(exist_ok=True)
generated.mkdir(exist_ok=True)
source = Path("test/micro/org/openjdk/bench/java/lang/SimdUTF.java")
subprocess.run([str(head / "bin/javac"), "-cp", classpath,
                "-processorpath", classpath, "-d", str(classes), "-s", str(generated), str(source)], check=True)
classpath = str(classes) + os.pathsep + classpath
available = os.sched_getaffinity(0)
cpu = min(available)
os.sched_setaffinity(0, {cpu})
metadata = {"architecture": platform.machine(), "cpu": cpu, "base": "02324e6bd026411407983df06284cd79460c33f6",
            "head": "476da17dc22e68cd0d5b28221d662514468ddbf7", "forks": 2, "warmups": "3 x 300ms", "measurements": "4 x 300ms",
            "gc": "Serial", "heap": "1 GiB"}
(output / "metadata.json").write_text(json.dumps(metadata, indent=2))
print("BENCHMARK_METADATA", json.dumps(metadata), flush=True)
studies = [
    ("bulk", "utf16Encode|latin1Encode|charsetEncode|charsetDecodeTight|utf32SupplementaryCharsetEncode|codePointCount|base64Encode|base64Decode", "4096"),
    ("ascii", "asciiDecode|asciiCharsetDecode", "31,256"),
    ("short-count", "codePointCount|charArrayCodePointCount", "128"),
    ("malformed", "malformedCharsetDecode|malformedCharsetEncode", "128,4096"),
    ("tight-threshold", "charsetDecodeTight", "255,256"),
    ("large-control", "latin1Decode", "1048576,4194304")
]
tiers = {"interp": ["-Xint"], "c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"],
         "c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"]}
images = {"base": base / "bin/java", "off": head / "bin/java",
          "on": head / "bin/java"}
studies.sort(key=lambda study: ({"malformed": 0, "large": 1}.get(study[0], 2)))
for study, methods, sizes in studies:
    for tier, tier_flags in tiers.items():
        if study == "large-control" and tier != "c2": continue
        for image, java in images.items():
            label = f"{study}-{tier}-{image}"
            flags = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2", *tier_flags]
            if image == "off": flags.append("-XX:-UseSIMDUTFIntrinsics")
            command = [str(java), "-XX:ActiveProcessorCount=2", "-cp", classpath, "org.openjdk.jmh.Main",
                       f"org.openjdk.bench.java.lang.SimdUTF.({methods})$", "-p", f"size={sizes}",
                       "-f", "3" if study == "large-control" else "2", "-wi", "5" if study == "large-control" else "3",
                       "-i", "5" if study == "large-control" else "4", "-w", "500ms" if study == "large-control" else "300ms",
                       "-r", "500ms" if study == "large-control" else "300ms", "-t", "1",
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
