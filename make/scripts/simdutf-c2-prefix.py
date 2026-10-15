import json,os,re,subprocess,sys
from pathlib import Path
head,base,out=[Path(x).resolve() for x in sys.argv[1:]]
out.mkdir(exist_ok=True)
root=Path("src/java.base/share/classes")
utf=(root/"sun/nio/cs/UTF_8.java").read_text()
old="            int n = Math.min(sl - sp, dl - dp);\n            if (n > 0 && sa[sp] >= 0) {\n                n = JLA.decodeASCII(sa, sp, da, dp, n);\n                sp += n;\n                dp += n;\n            }"
assert utf.count(old)==1
jla=utf.replace(old,"            int n = JLA.decodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));\n            sp += n;\n            dp += n;")
bad="            int first = sa[sp];\n            if (first < (byte)0xc2 || (first < 0 && first > (byte)0xf4)) {\n                return malformedForLength(src, sp, dst, dp, 1);\n            }\n\n"
assert jla.count(bad)==1
variants={"jla":jla,"jlaNoEarly":jla.replace(bad,"")}
patches={}
for mode,decoder in variants.items():
    source=out/(mode+"-source");p=source/"sun/nio/cs/UTF_8.java";p.parent.mkdir(parents=True);p.write_text(decoder)
    target=out/(mode+"-patch");target.mkdir()
    subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(source),"-d",str(target),str(p)],check=True)
    patches[mode]=target
cp="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes=out/"classes";classes.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",cp,"-processorpath",cp,"-d",str(classes),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
cp=str(classes)+":"+cp
os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
for mode in ("base","on",*variants):
    java=(base if mode=="base"else head)/"bin/java"
    extra=["--patch-module=java.base="+str(patches[mode])]if mode in patches else[]
    for study,method,params,expected in(("valid","charsetDecodeTight",["-p","size=31,64,128,255"],4),
        ("malformed","malformedSequenceDecode",["-p","size=128","-p","kind=surrogate,tail","-p","action=REPORT,REPLACE"],4)):
        path=out/("-".join((mode,study))+".json");log=path.with_suffix(".log")
        args=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF."+method+"$",*params,
            "-f","2","-wi","3","-i","4","-w","200ms","-r","200ms","-t","1","-prof","gc","-jvm",str(java),
            "-jvmArgs"," ".join(["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2","-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100",*extra]),
            "-rf","json","-rff",str(path)]
        with log.open("w")as stream:subprocess.run(args,stdout=stream,stderr=subprocess.STDOUT,check=True)
        rows=json.loads(path.read_text());assert len(rows)==expected and all(r["primaryMetric"].get("rawData")for r in rows)
        for row in rows:print("C2_PREFIX_RESULT",json.dumps({"mode":mode,"study":study,"method":method,"params":row["params"],
            "ns":row["primaryMetric"]["score"],"ci":row["primaryMetric"]["scoreConfidence"],"bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
    log=out/("compiled-"+mode+".log")
    with log.open("w")as stream:
        subprocess.run([str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.malformedSequenceDecode$",
            "-p","size=128","-p","kind=tail","-p","action=REPORT","-f","1","-wi","2","-i","1","-w","200ms","-r","200ms","-jvm",str(java),
            "-jvmArgs"," ".join(["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100","-XX:ActiveProcessorCount=2",*extra,
            "-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining","-XX:CompileCommand=print,sun/nio/cs/UTF_8$Decoder.decodeArrayLoop"])],
            stdout=stream,stderr=subprocess.STDOUT,check=True)
    raw=log.read_text()
    for section in raw.split("Compiled method (c2)")[1:]:
        title=section.splitlines()[0]
        if "UTF_8$Decoder::decodeArrayLoop" not in title:continue
        match=re.search(r"main code\s+\[(0x[0-9a-f]+),\s*(0x[0-9a-f]+)\]",section)
        print("C2_PREFIX_CODE",mode,json.dumps({"heading":title,"main_bytes":int(match[2],16)-int(match[1],16)if match else None}),flush=True)
print("C2_PREFIX_COMPLETE",flush=True)
