import json,os,subprocess,sys
from pathlib import Path
head,base,out=[Path(x).resolve()for x in sys.argv[1:]]
out.mkdir(exist_ok=True)
root=Path("src/java.base/share/classes");source=out/"source";patch=out/"patch";patch.mkdir()
for name in ("java/lang/String.java","java/lang/StringCoding.java","sun/nio/cs/UTF_8.java","jdk/internal/util/SimdUTF.java"):
    value=(root/name).read_text()
    if name.endswith("SimdUTF.java"):
        value=value.replace("    @ForceInline\n    @IntrinsicCandidate\n    public static int utf8DecoderPrefixThreshold()","    @ForceInline\n    public static int utf8DecoderPrefixThreshold()")
    path=source/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value)
subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(source),"-d",str(patch),*[str(p)for p in source.rglob("*.java")]],check=True)
cp="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar";classes=out/"classes";classes.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",cp,"-processorpath",cp,"-d",str(classes),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
cp=str(classes)+":"+cp;os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
for mode in("base","policy"):
    java=(base if mode=="base"else head)/"bin/java";extra=["--patch-module=java.base="+str(patch)]if mode=="policy"else[]
    for study,methods,sizes,params,expected in(
        ("short","asciiCharsetDecode|charsetDecodeTight","31,128",[],4),
        ("bulk","asciiCharsetDecode|charsetDecodeTight|malformedCharsetDecode","4096",[],3),
        ("malformed","malformedSequenceDecode","128,4096",["-p","kind=continuation,surrogate","-p","action=REPORT,REPLACE"],8)):
        path=out/(mode+"-"+study+".json")
        args=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.("+methods+")$",
            "-p","size="+sizes,*params,"-f","2","-wi","3","-i","4","-w","200ms","-r","200ms","-t","1","-prof","gc",
            "-jvm",str(java),"-jvmArgs"," ".join(["-Xint","-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2",*extra]),
            "-rf","json","-rff",str(path)]
        with path.with_suffix(".log").open("w")as stream:subprocess.run(args,stdout=stream,stderr=subprocess.STDOUT,check=True)
        rows=json.loads(path.read_text());assert len(rows)==expected and all(r["primaryMetric"].get("rawData")for r in rows)
        for r in rows:print("INTERP_POLICY_RESULT",json.dumps({"mode":mode,"study":study,"method":r["benchmark"].rsplit(".",1)[1],
            "params":r["params"],"ns":r["primaryMetric"]["score"],"ci":r["primaryMetric"]["scoreConfidence"],
            "bytes":r["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
print("INTERP_POLICY_COMPLETE",flush=True)
