import json
import os
from pathlib import Path
import platform
import re
import subprocess
import sys

head, base, output = [Path(s).resolve() for s in sys.argv[1:]]
output.mkdir(exist_ok=True)
common = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2"]
tier = ["-Xbatch", "-XX:TieredStopAtLevel=1"]
exports = ["--add-exports=java.base/jdk.internal.access=ALL-UNNAMED"]
classpath = "jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated = output / "classes", output / "generated"
classes.mkdir()
generated.mkdir()
sources = ["test/micro/org/openjdk/bench/java/lang/SimdUTF.java",
           "test/micro/org/openjdk/bench/java/lang/SimdUTFDecoderAPI.java"]
subprocess.run([str(head/"bin/javac"), *exports, "-cp", classpath, "-processorpath", classpath,
    "-d", str(classes), "-s", str(generated), *sources], check=True)
classpath = str(classes) + os.pathsep + classpath
cpu = min(os.sched_getaffinity(0))
os.sched_setaffinity(0, {cpu})
print("API_METADATA", json.dumps({"arch":platform.machine(), "cpu":cpu,
    "base":"e206bae32b2a6cc1fa9464ad34d75f2df4b347e9",
    "head":"2072f7ee5fd21b378b391ae3053a4321f402f469", "patches":False}), flush=True)
for name, image in (("base",base), ("head",head)):
    print("IMAGE_RELEASE", name, (image/"release").read_text(), flush=True)

def measure(study, mode, klass, methods, params):
    java = (base if mode == "base" else head)/"bin/java"
    flags = common + tier + exports + (["-XX:-UseSIMDUTFIntrinsics"] if mode == "off" else [])
    label = study+"-"+mode
    path = output/(label+".json")
    command = [str(java), *exports, "-cp", classpath, "org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang."+klass+".("+methods+")$",
        "-f","2","-wi","3","-i","4","-w","300ms","-r","300ms","-t","1","-prof","gc",
        "-jvm",str(java),"-jvmArgs"," ".join(flags),"-rf","json","-rff",str(path)]
    for param in params:
        command += ["-p",param]
    print("API_START",label,flush=True)
    log = output/(label+".log")
    with log.open("w") as stream:
        result = subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT)
    if result.returncode:
        print(log.read_text()[-16000:],flush=True)
        raise SystemExit(result.returncode)
    rows = json.loads(path.read_text())
    assert rows and all(row["primaryMetric"].get("rawData") for row in rows)
    for row in rows:
        metric = row["primaryMetric"]
        print("API_RESULT",json.dumps({"study":study,"mode":mode,"method":row["benchmark"].rsplit(".",1)[1],
            "params":row["params"],"ns":metric["score"],"ci":metric["scoreConfidence"],
            "bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)

for mode in ("base","on","off"):
    measure("c1-tight",mode,"SimdUTF","charsetDecodeTight",["size=128,255,256,4096"])
    measure("c1-ascii",mode,"SimdUTF","asciiCharsetDecode",["size=31,4096"])
    measure("c1-malformed",mode,"SimdUTF","malformedCharsetDecode",["size=128,4096"])
    for kind, sizes in (("ascii","31,4096"),("bmp","255,4096"),("malformed","128,4096")):
        measure("c1-prefix-"+kind,mode,"SimdUTFDecoderAPI","asciiPrefix",["size="+sizes,"kind="+kind])

for mode in ("base","on","off"):
    java = (base if mode == "base" else head)/"bin/java"
    extra = ["-XX:-UseSIMDUTFIntrinsics"] if mode=="off" else []
    name = output/("inlining-"+mode+".log")
    flags = [*common,*tier,*extra,"-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining",
        "-XX:CompileCommand=print,sun/nio/cs/UTF_8$Decoder.decodeArrayLoop",
        "-XX:CompileCommand=print,sun/nio/cs/UTF_8$Decoder.decodeLoop"]
    command = [str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.charsetDecodeTight$","-p","size=255",
        "-f","1","-wi","1","-i","1","-w","200ms","-r","200ms",
        "-jvm",str(java),"-jvmArgs"," ".join(flags)]
    with name.open("w") as stream:
        subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT,check=True)
    lines = [s for s in name.read_text().splitlines()
             if any(k in s for k in ("countPositives0","inflate0","decodeUTF8","decodeASCII","decodeArrayLoop","decodeLoop"))]
    print("API_INLINING",mode,json.dumps(lines[-65:]),flush=True)
print("API_COMPLETE",flush=True)
