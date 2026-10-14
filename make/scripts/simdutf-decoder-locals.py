import json
import os
from pathlib import Path
import platform
import re
import subprocess
import sys

head, base, output = [Path(s).resolve() for s in sys.argv[1:]]
output.mkdir(exist_ok=True)
changes = json.loads("{\"locals\":[[\"sun/nio/cs/UTF_8.java\",\"            // Keep the ASCII intrinsic and reject invalid leading bytes before bulk conversion.\\n            int converted = SimdUTF.isEligible(sl - sp)\\n                    && (sa[sp] & 0xff) >= 0xc2 && (sa[sp] & 0xff) <= 0xf4\\n                    ? SimdUTF.decodeUTF8(sa, sp, sl - sp, da, dp, dl - dp) : -1;\\n            if (converted >= 0) {\\n                updatePositions(src, sl, dst, dp + converted);\\n                return CoderResult.UNDERFLOW;\\n            }\\n\",\"            // Keep the ASCII intrinsic and reject invalid leading bytes before bulk conversion.\\n            n = SimdUTF.isEligible(sl - sp)\\n                    && (sa[sp] & 0xff) >= 0xc2 && (sa[sp] & 0xff) <= 0xf4\\n                    ? SimdUTF.decodeUTF8(sa, sp, sl - sp, da, dp, dl - dp) : -1;\\n            if (n >= 0) {\\n                updatePositions(src, sl, dst, dp + n);\\n                return CoderResult.UNDERFLOW;\\n            }\\n\"]],\"leaf\":[[\"sun/nio/cs/UTF_8.java\",\"n = SimdUTF.isEligible(sl - sp)\",\"n = SimdUTF.isEligibleUTF8Decoding(sl - sp)\"],[\"jdk/internal/util/SimdUTF.java\",\"    @ForceInline\\n    public static boolean useIndexOfPrefix()\",\"    @ForceInline\\n    public static boolean isEligibleUTF8Decoding(int len) {\\n        int threshold = minLength;\\n        return threshold > 0 && len >= (automatic\\n                ? Math.max(threshold, operationMinimumLength(DECODE_UTF8)) : threshold);\\n    }\\n\\n    @ForceInline\\n    public static boolean useIndexOfPrefix()\"],[\"jdk/internal/util/SimdUTF.java\",\"    @ForceInline\\n    public static int decodeUTF8\",\"    @DontInline\\n    public static int decodeUTF8\"],[\"java/lang/String.java\",\"int converted = SimdUTF.isEligible(sl - sp)\\n                ? SimdUTF.decodeUTF8\",\"int converted = SimdUTF.isEligibleUTF8Decoding(sl - sp)\\n                ? SimdUTF.decodeUTF8\"]],\"prefix\":[[\"sun/nio/cs/UTF_8.java\",\"            int n = JLA.decodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));\",\"            int n = sp < sl && sa[sp] < 0 ? 0\\n                    : JLA.decodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));\"]]}")
root = Path("src/java.base/share/classes")
variants = {}
changed = {}
for name, edits in changes.items():
    changed = changed.copy()
    for path, old, new in edits:
        source = changed.get(path, (root/path).read_text())
        assert source.count(old) == 1, (name, path, old)
        changed[path] = source.replace(old, new, 1)
    variants[name] = changed
patches = {}
for name, changed in variants.items():
    directory, classes = output/("src-"+name), output/("patch-"+name)
    files = []
    for path, source in changed.items():
        file = directory/path
        file.parent.mkdir(parents=True,exist_ok=True)
        file.write_text(source)
        files.append(str(file))
    classes.mkdir()
    subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(directory),
        "-d",str(classes),*files],check=True)
    patches[name] = ["--patch-module=java.base="+str(classes)]
tests=output/"tests"
tests.mkdir()
subprocess.run([str(head/"bin/javac"),"--add-exports","java.base/jdk.internal.util=ALL-UNNAMED",
    "-d",str(tests),"test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java"],check=True)
common=["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2"]
tiers={"interp":["-Xint"],"c1":["-Xbatch","-XX:TieredStopAtLevel=1"],
       "c2":["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100"]}
for name in variants:
    for tier, flags in tiers.items():
        subprocess.run([str(head/"bin/java"),*patches[name],*common,*flags,
            "--add-exports","java.base/jdk.internal.util=ALL-UNNAMED",
            "--add-opens","java.base/jdk.internal.util=ALL-UNNAMED",
            "-cp",str(tests),"SimdUTFTest"],check=True)
classpath="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated=output/"classes",output/"generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",classpath,"-processorpath",classpath,
    "-d",str(classes),"-s",str(generated),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
classpath=str(classes)+os.pathsep+classpath
cpu=min(os.sched_getaffinity(0))
os.sched_setaffinity(0,{cpu})
print("FIX_METADATA",json.dumps({"arch":platform.machine(),"cpu":cpu,
    "base":"e206bae32b2a6cc1fa9464ad34d75f2df4b347e9",
    "head":"2072f7ee5fd21b378b391ae3053a4321f402f469",
    "candidate_source":"diagnostic module patches; not final-image validation"}),flush=True)
def options(mode):
    java=(base if mode=="base" else head)/"bin/java"
    extra=patches.get(mode.removesuffix("-off"),[])+(["-XX:-UseSIMDUTFIntrinsics"] if mode.endswith("-off") else [])
    return java,extra
def measure(study,mode,tier,methods,sizes):
    java,extra=options(mode)
    label="-".join((study,mode,tier))
    path=output/(label+".json")
    cmd=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.("+methods+")$","-p","size="+sizes,
        "-f","2","-wi","3","-i","4","-w","300ms","-r","300ms","-t","1","-prof","gc",
        "-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers[tier],*extra]),
        "-rf","json","-rff",str(path)]
    print("FIX_START",label,flush=True)
    log=output/(label+".log")
    with log.open("w") as stream:
        result=subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT)
    if result.returncode:
        print(log.read_text()[-16000:],flush=True)
        raise SystemExit(result.returncode)
    rows=json.loads(path.read_text())
    assert rows and all(r["primaryMetric"].get("rawData") for r in rows)
    for row in rows:
        metric=row["primaryMetric"]
        print("FIX_RESULT",json.dumps({"study":study,"mode":mode,"tier":tier,
            "method":row["benchmark"].rsplit(".",1)[1],"size":int(row["params"]["size"]),
            "ns":metric["score"],"ci":metric["scoreConfidence"],
            "bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
for mode in ("base","on","locals","leaf","prefix","prefix-off"):
    measure("boundary",mode,"c1","charsetDecodeTight","31,128,255,256,4096")
    measure("controls",mode,"c1","asciiCharsetDecode|malformedCharsetDecode","31,4096")
for mode in ("base","on","prefix","prefix-off"):
    measure("other-tiers",mode,"c2","charsetDecodeTight|asciiCharsetDecode|malformedCharsetDecode","31,255,4096")
for mode in ("base","on","prefix"):
    measure("interpreter",mode,"interp","charsetDecodeTight|asciiCharsetDecode|malformedCharsetDecode","31,4096")
for mode in ("base","on","locals","leaf","prefix"):
    java,extra=options(mode)
    log=output/("inlining-"+mode+".log")
    cmd=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.charsetDecodeTight$","-p","size=255",
        "-f","1","-wi","1","-i","1","-w","200ms","-r","200ms",
        "-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers["c1"],*extra,
        "-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining",
        "-XX:CompileCommand=print,sun/nio/cs/UTF_8$Decoder.decodeArrayLoop"])]
    with log.open("w") as stream:
        subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT,check=True)
    lines=[line for line in log.read_text().splitlines() if "decodeUTF8" in line or "countPositives0" in line]
    print("FIX_INLINING",mode,json.dumps(lines[-20:]),flush=True)
print("FIX_COMPLETE",flush=True)
