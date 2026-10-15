import json,os,subprocess,sys
from pathlib import Path
head,base,out=[Path(x).resolve() for x in sys.argv[1:]]
out.mkdir(exist_ok=True)
root=Path("src/java.base/share/classes")
util=(root/"jdk/internal/util/SimdUTF.java").read_text()
utf=(root/"sun/nio/cs/UTF_8.java").read_text()
assert util.count("case DECODE_UTF8 -> 256;")==1
lower=util.replace("case DECODE_UTF8 -> 256;","case DECODE_UTF8 -> 128;")
anchor="    @ForceInline\n    @IntrinsicCandidate\n    public static int decodeLatin1("
assert lower.count(anchor)==1
prefix=lower.replace(anchor,"    // Retry an already validated prefix without applying the initial crossover again.\n    @ForceInline\n    public static int decodeUTF8Prefix(byte[] src, int sp, int len,\n                                       Object dst, int dp, int capacity) {\n        return len <= MAX_CHUNK ? process0(src, sp, len, dst, dp, capacity, DECODE_UTF8)\n                               : processChunks(src, sp, len, dst, dp, capacity, DECODE_UTF8);\n    }\n\n"+anchor)
lines=utf.splitlines()
hits=[i for i,l in enumerate(lines)if "SimdUTF.decodeUTF8" in l]
assert len(hits)==2,hits
lines[hits[1]]=lines[hits[1]].replace("SimdUTF.decodeUTF8","SimdUTF.decodeUTF8Prefix")
prefix_utf="\n".join(lines)+"\n"
patches={}
for mode,helper,decoder in(("lower",lower,utf),("lowerPrefix",prefix,prefix_utf)):
    source=out/(mode+"-source")
    for name,value in (("jdk/internal/util/SimdUTF.java",helper),("sun/nio/cs/UTF_8.java",decoder)):
        p=source/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(value)
    target=out/(mode+"-patch");target.mkdir()
    subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(source),"-d",str(target),*[str(p)for p in source.rglob("*.java")]],check=True)
    patches[mode]=target
cp="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes=out/"classes";classes.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",cp,"-processorpath",cp,"-d",str(classes),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
cp=str(classes)+":"+cp
os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
tiers={"c1":["-Xbatch","-XX:TieredStopAtLevel=1"],"c2":["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100"]}
for mode in ("base","on","lower","lowerPrefix"):
    java=(base if mode=="base"else head)/"bin/java"
    extra=["--patch-module=java.base="+str(patches[mode])]if mode in patches else[]
    for tier,flags in tiers.items():
        for study,method,params,expected in(("valid","charsetDecodeTight",["-p","size=64,128,255,256"],4),
                                           ("malformed","malformedSequenceDecode",["-p","size=128","-p","kind=surrogate,tail","-p","action=REPORT,REPLACE"],4)):
            path=out/("-".join((mode,tier,study))+".json")
            log=path.with_suffix(".log")
            args=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF."+method+"$",
                *params,"-f","2","-wi","3","-i","4","-w","200ms","-r","200ms","-t","1","-prof","gc",
                "-jvm",str(java),"-jvmArgs"," ".join(["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2",*flags,*extra]),
                "-rf","json","-rff",str(path)]
            with log.open("w")as stream:subprocess.run(args,stdout=stream,stderr=subprocess.STDOUT,check=True)
            rows=json.loads(path.read_text())
            assert len(rows)==expected and all(r["primaryMetric"].get("rawData")for r in rows)
            for row in rows:print("FLOOR_RESULT",json.dumps({"mode":mode,"tier":tier,"study":study,"method":method,
                "params":row["params"],"ns":row["primaryMetric"]["score"],"ci":row["primaryMetric"]["scoreConfidence"],
                "bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
print("FLOOR_COMPLETE",flush=True)
