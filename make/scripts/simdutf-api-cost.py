import json,os,platform,subprocess,sys
from pathlib import Path
head,base,output=[Path(s).resolve() for s in sys.argv[1:]]
output.mkdir(exist_ok=True)
root=Path("src/java.base/share/classes")
utf=(root/"sun/nio/cs/UTF_8.java").read_text()
util=(root/"jdk/internal/util/SimdUTF.java").read_text()
old="            int n = JLA.decodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));\n            sp += n;\n            dp += n;"
assert utf.count(old)==1
op=util.replace("    private static int operationMinimumLength(int operation) {","    @ForceInline\n    private static int operationMinimumLength(int operation) {")
empty="            int n = Math.min(sl - sp, dl - dp);\n            if (n > 0) {\n                n = JLA.decodeASCII(sa, sp, da, dp, n);\n                sp += n;\n                dp += n;\n            }"
skip=empty.replace("if (n > 0)","if (n > 0 && sa[sp] >= 0)")
patches={}
for mode,source,helper in (("op",utf,op),("empty",utf.replace(old,empty),op),("skip",utf.replace(old,skip),op)):
    source_root=output/(mode+"-source")
    for name,value in (("sun/nio/cs/UTF_8.java",source),("jdk/internal/util/SimdUTF.java",helper)):
        path=source_root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value)
    patch=output/(mode+"-patch");patch.mkdir()
    subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(source_root),
        "-d",str(patch),*[str(p) for p in source_root.rglob("*.java")]],check=True)
    patches[mode]=patch
cpu=min(os.sched_getaffinity(0));os.sched_setaffinity(0,{cpu})
cpp=Path("make/scripts/simdutf-api-cost.cpp")
flags=["-march=armv8.2-a","-mtune=generic"] if platform.machine()=="aarch64" else ["-march=x86-64-v3","-mtune=generic"]
subprocess.run(["g++-16","-O3","-std=c++17",*flags,"-Isrc/utils/simdutf",str(cpp),"src/utils/simdutf/simdutf.cpp","-o",str(output/"native-api")],check=True)
subprocess.run([str(output/"native-api")],check=True)
cp="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes=output/"classes";classes.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",cp,"-processorpath",cp,"-d",str(classes),
    "test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
cp=str(classes)+":"+cp
tiers={"c1":["-Xbatch","-XX:TieredStopAtLevel=1"],"c2":["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100"]}
for mode in ("base","on","op","empty","skip"):
    java=(base if mode=="base" else head)/"bin/java"
    extra=["--patch-module=java.base="+str(patches[mode])] if mode in patches else []
    for study,tier,methods,sizes,params in (
        ("fallback","c1","asciiCharsetDecode|charsetDecodeTight|charsetDecodeEmptyBuffer|charsetDecodeSmallBuffer|malformedCharsetDecode","31,128,4096",[]),
        ("malformed","c1","malformedSequenceDecode","128,4096",["-p","kind=surrogate,continuation","-p","action=REPORT,REPLACE"]),
        ("ascii","c2","asciiCharsetDecode","31,4096",[]),
        ("empty","c2","charsetDecodeEmptyBuffer","256",[])):
        label="-".join((study,mode,tier));path=output/(label+".json");log=output/(label+".log")
        args=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.("+methods+")$",
            "-p","size="+sizes,*params,"-f","2","-wi","3","-i","4","-w","300ms","-r","300ms",
            "-t","1","-prof","gc","-jvm",str(java),"-jvmArgs"," ".join(["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2",*tiers[tier],*extra]),"-rf","json","-rff",str(path)]
        with log.open("w")as stream:subprocess.run(args,stdout=stream,stderr=subprocess.STDOUT,check=True)
        rows=json.loads(path.read_text())
        expected=len(methods.split("|"))*len(sizes.split(","))*(4 if study=="malformed" else 1)
        assert len(rows)==expected and all(r["primaryMetric"].get("rawData")for r in rows),(label,len(rows),expected)
        for row in rows:print("COST_RESULT",json.dumps({"mode":mode,"tier":tier,"study":study,
            "method":row["benchmark"].rsplit(".",1)[1],"params":row["params"],
            "ns":row["primaryMetric"]["score"],"ci":row["primaryMetric"]["scoreConfidence"],
            "bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
    log=output/("inlining-"+mode+".log")
    with log.open("w")as stream:
        subprocess.run([str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.malformedSequenceDecode$",
            "-p","size=4096","-p","kind=surrogate","-p","action=REPLACE","-f","1","-wi","1","-i","1","-w","100ms","-r","100ms","-jvm",str(java),
            "-jvmArgs"," ".join(["-Xbatch","-XX:TieredStopAtLevel=1",*extra,"-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining"])],
            stdout=stream,stderr=subprocess.STDOUT,check=True)
    print("COST_INLINING",mode,json.dumps([l for l in log.read_text().splitlines()if any(k in l for k in ("operationMinimumLength","isEligibleUTF8Decoding","malformedLeadingSequenceLength","decodeASCII","countPositives0","inflate0"))][-70:]),flush=True)
print("COST_COMPLETE",flush=True)
