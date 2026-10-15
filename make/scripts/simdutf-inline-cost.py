import json,os,platform,re,subprocess,sys
from pathlib import Path
head,base,out=[Path(x).resolve() for x in sys.argv[1:]]
out.mkdir(exist_ok=True)
root=Path("src/java.base/share/classes")
string=(root/"java/lang/String.java").read_text()
coding=(root/"java/lang/StringCoding.java").read_text()
utf=(root/"sun/nio/cs/UTF_8.java").read_text()
old="    @ForceInline\n    private static byte[] decodeUTF8Latin1("
assert string.count(old)==1
start=string.index(old)
end=string.index("\n    private static String iso88591",start)
no=string[:start]+"    private static byte[] decodeUTF8Latin1(byte[] src, int sp, int len, byte[] dst, int dp) {\n        return null;\n    }\n"+string[end:]
old_count="        if (len > 0 && ba[off] < 0) {\n            return 0;\n        }\n        int count = SimdUTF.isEligible(len) ? SimdUTF.countAscii(ba, off, len) : -1;"
new_count="        int count = len >= 32 && ba[off] >= 0 && SimdUTF.isEligible(len)\n                ? SimdUTF.countAscii(ba, off, len) : -1;"
assert coding.count(old_count)==1
util=(root/"jdk/internal/util/SimdUTF.java").read_text()
count_annotation="    @ForceInline\n    @IntrinsicCandidate\n    private static int countPositives0"
assert coding.count(count_annotation)==1
noForce=coding.replace(count_annotation,count_annotation.replace("    @ForceInline\n",""))
count_ascii="    @ForceInline\n    public static int countAscii"
assert util.count(count_ascii)==1
outlined_ascii=util.replace(count_ascii,count_ascii.replace("@ForceInline","@DontInline"))
variants={"noForceCount":{"java/lang/StringCoding.java":noForce},
          "outlineAscii":{"jdk/internal/util/SimdUTF.java":outlined_ascii},
          "both":{"java/lang/StringCoding.java":noForce,"jdk/internal/util/SimdUTF.java":outlined_ascii}}

patches={}
for mode,files in variants.items():
    source=out/(mode+"-source")
    for name,value in files.items():
        path=source/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value)
    target=out/(mode+"-patch");target.mkdir()
    subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(source),"-d",str(target),*[str(p)for p in source.rglob("*.java")]],check=True)
    patches[mode]=target
cp="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes=out/"classes";classes.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",cp,"-processorpath",cp,"-d",str(classes),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
cp=str(classes)+":"+cp
os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
tiers={"c1":["-Xbatch","-XX:TieredStopAtLevel=1"],"c2":["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100"]}
common=["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2"]
for mode in ("base","on",*variants):
    java=(base if mode=="base" else head)/"bin/java"
    extra=(["--patch-module=java.base="+str(patches[mode])]if mode in patches else ["-XX:-UseSIMDUTFIntrinsics"]if mode=="off"else[])
    studies=[("ascii","c1","asciiCharsetDecode","31,128,4096"),("latin1","c1","latin1Decode","31,256,4096"),("tight","c1","charsetDecodeTight","31,128,255,256,4096")]
    if platform.machine()=="x86_64":
        studies +=[("latin1","c2","latin1Decode","4096"),("tight","c2","charsetDecodeTight","128,255")]
    for study,tier,methods,sizes in studies:
        path=out/("-".join((mode,study,tier))+".json")
        log=path.with_suffix(".log")
        args=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.("+methods+")$",
            "-p","size="+sizes,"-f","2","-wi","3","-i","4","-w","200ms","-r","200ms",
            "-t","1","-prof","gc","-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers[tier],*extra]),
            "-rf","json","-rff",str(path)]
        with log.open("w")as stream:subprocess.run(args,stdout=stream,stderr=subprocess.STDOUT,check=True)
        rows=json.loads(path.read_text())
        assert len(rows)==len(sizes.split(","))and all(r["primaryMetric"].get("rawData")for r in rows)
        for row in rows:print("ISOLATE_RESULT",json.dumps({"mode":mode,"tier":tier,"study":study,
            "method":row["benchmark"].rsplit(".",1)[1],"size":int(row["params"]["size"]),
            "ns":row["primaryMetric"]["score"],"ci":row["primaryMetric"]["scoreConfidence"],
            "bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
    if platform.machine()!="x86_64":
        continue
    log=out/("c2-trace-"+mode+".log")
    with log.open("w")as stream:
        subprocess.run([str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.latin1Decode$",
            "-p","size=4096","-f","1","-wi","3","-i","1","-w","500ms","-r","300ms","-jvm",str(java),
            "-jvmArgs"," ".join([*common,*tiers["c2"],*extra,"-XX:+UnlockDiagnosticVMOptions",
            "-XX:+PrintCompilation","-XX:+PrintInlining",
            "-XX:CompileCommand=print,java/lang/String.utf8",
            "-XX:CompileCommand=print,java/lang/String.decodeUTF8Latin1",
            "-XX:CompileCommand=print,jdk/internal/util/SimdUTF.decodeLatin1"])],
            stdout=stream,stderr=subprocess.STDOUT,check=True)
    raw=log.read_text()
    decisions=[l for l in raw.splitlines()if not l.lstrip().startswith(";")and
        any(k in l for k in("String::utf8","String::decodeUTF8Latin1","SimdUTF::decodeLatin1",
                            "SimdUTF::process0","COMPILE SKIPPED","made not entrant"))]
    print("ISOLATE_TRACE",mode,json.dumps(decisions[-100:]),flush=True)
    for section in raw.split("Compiled method (c2)")[1:]:
        title=section.splitlines()[0]
        if not any(k in title for k in("String::utf8","decodeUTF8Latin1","SimdUTF::decodeLatin1")):
            continue
        match=re.search(r"main code\s+\[(0x[0-9a-f]+),\s*(0x[0-9a-f]+)\]",section)
        print("ISOLATE_C2_CODE",mode,json.dumps({"heading":title,"main_bytes":int(match[2],16)-int(match[1],16)if match else None,
            "calls":[l for l in section.splitlines()if "call" in l or "runtime_call" in l][:40]}),flush=True)
print("ISOLATE_COMPLETE",flush=True)
