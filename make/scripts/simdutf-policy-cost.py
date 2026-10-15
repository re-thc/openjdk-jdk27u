import json,os,subprocess,sys
from pathlib import Path
head,base,out=[Path(x).resolve()for x in sys.argv[1:]]
out.mkdir(exist_ok=True)
cp="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar";classes=out/"classes";classes.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",cp,"-processorpath",cp,"-d",str(classes),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
cp=str(classes)+":"+cp;os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
source=out/"source/sun/nio/cs/UTF_8.java";source.parent.mkdir(parents=True)
s=(Path("src/java.base/share/classes/sun/nio/cs/UTF_8.java")).read_text();assert s.count("SimdUTF.utf8DecoderPrefixThreshold()")==1
source.write_text(s.replace("SimdUTF.utf8DecoderPrefixThreshold()","0"))
patch=out/"patch";patch.mkdir();subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(out/"source"),"-d",str(patch),str(source)],check=True)
for mode in("base","on","off","noHint"):
    java=(base if mode=="base"else head)/"bin/java";extra=["-XX:-UseSIMDUTFIntrinsics"]if mode=="off"else["--patch-module=java.base="+str(patch)]if mode=="noHint"else[]
    for study,method,sizes,params,tiers in [("large","supplementaryDecode","1024,4096,16384,65536,1048576",[],["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100"]),("hint","malformedSequenceDecode","128,4096",["-p","kind=surrogate","-p","action=REPORT,REPLACE"],["-Xint"])]:
        if mode=="noHint"and study!="hint":continue
        path=out/(mode+"-"+study+".json")
        command=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF."+method+"$","-p","size="+sizes,*params,"-f","2","-wi","3","-i","4","-w","300ms","-r","300ms","-t","1","-prof","gc","-jvm",str(java),"-jvmArgs"," ".join(["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2",*tiers,*extra]),"-rf","json","-rff",str(path)]
        with path.with_suffix(".log").open("w")as stream:subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT,check=True)
        rows=json.loads(path.read_text());assert len(rows)==(5 if study=="large"else 4)
        for r in rows:print("POLICY_RESULT",json.dumps({"mode":mode,"study":study,"params":r["params"],"ns":r["primaryMetric"]["score"],"ci":r["primaryMetric"]["scoreConfidence"],"bytes":r["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
print("POLICY_COMPLETE",flush=True)
