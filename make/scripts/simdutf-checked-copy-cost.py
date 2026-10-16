import json, os, subprocess, sys
from pathlib import Path
head,base,out=[Path(s).resolve() for s in sys.argv[1:]]
out.mkdir(exist_ok=True)
names=["java/lang/String.java","java/lang/StringUTF16.java","jdk/internal/util/SimdUTF.java","java/util/Base64.java"]
originals={name:(Path("src/java.base/share/classes")/name).read_text() for name in names}
edits=json.loads("{\"control\":[{\"path\":\"java/lang/StringUTF16.java\",\"before\":\"    static char[] toChars(byte[] value) {\\n        char[] dst\",\"after\":\"    @ForceInline\\n    static char[] toChars(byte[] value) {\\n        if (value.length == 2) {\\n            return new char[] { getChar(value, 0) };\\n        }\\n        char[] dst\"}],\"internal\":[{\"path\":\"java/lang/StringUTF16.java\",\"before\":\"    static char[] toChars(byte[] value) {\\n        char[] dst\",\"after\":\"    @ForceInline\\n    static char[] toChars(byte[] value) {\\n        if (value.length == 2) {\\n            return new char[] { getChar(value, 0) };\\n        }\\n        char[] dst\"},{\"path\":\"java/lang/StringUTF16.java\",\"before\":\"        getChars(value, 0, dst.length, dst, 0);\",\"after\":\"        getChars0(value, 0, dst.length, dst, 0);\"}],\"both\":[{\"path\":\"java/lang/StringUTF16.java\",\"before\":\"    static char[] toChars(byte[] value) {\\n        char[] dst\",\"after\":\"    @ForceInline\\n    static char[] toChars(byte[] value) {\\n        if (value.length == 2) {\\n            return new char[] { getChar(value, 0) };\\n        }\\n        char[] dst\"},{\"path\":\"java/lang/StringUTF16.java\",\"before\":\"        getChars(value, 0, dst.length, dst, 0);\",\"after\":\"        getChars0(value, 0, dst.length, dst, 0);\"},{\"path\":\"java/lang/StringUTF16.java\",\"before\":\"    private static void getChars0(byte[] value, int srcBegin, int srcEnd, char[] dst, int dstBegin) {\",\"after\":\"    static void getChars0(byte[] value, int srcBegin, int srcEnd, char[] dst, int dstBegin) {\"},{\"path\":\"java/lang/String.java\",\"before\":\"            StringUTF16.getChars(value, srcBegin, srcEnd, dst, dstBegin);\",\"after\":\"            StringUTF16.getChars0(value, srcBegin, srcEnd, dst, dstBegin);\"}]}")
variants={}
for mode,changes in edits.items():
    variants[mode]=dict(originals)
    for change in changes:
        old=variants[mode][change["path"]]
        assert old.count(change["before"])==1,(mode,change["path"])
        variants[mode][change["path"]]=old.replace(change["before"],change["after"],1)
patches={}
for mode,files in variants.items():
    root=out/(mode+"-source");patch=out/(mode+"-patch");patch.mkdir()
    for name,value in files.items():
        path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(value)
    result=subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(root),"-d",str(patch),*[str(p) for p in root.rglob("*.java")]],text=True,capture_output=True)
    if result.returncode:
        print(result.stdout,result.stderr,flush=True);raise SystemExit(result.returncode)
    patches[mode]=patch
cp="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes=out/"classes";classes.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",cp,"-processorpath",cp,"-d",str(classes),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
cp=str(classes)+":"+cp
os.sched_setaffinity(0,{min(os.sched_getaffinity(0))})
common=["-Xbatch","-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2"]


for mode in ("base","on","control","internal","both","off","internalOff","bothOff","native1"):
    java=(base if mode=="base" else head)/"bin/java"
    variant={"internalOff":"internal","bothOff":"both","native1":"control"}.get(mode,mode)
    extra=["--patch-module=java.base="+str(patches[variant])] if variant in patches else []
    if mode.endswith("Off") or mode=="off":extra.append("-XX:-UseSIMDUTFIntrinsics")
    if mode=="native1":extra.append("-XX:SIMDUTFMinLength=1")
    cases=[("c1","1,31,32,64,128,256,4096"),("c2","1,31,4096"),("interp","1,31,4096")]
    if mode.endswith("Off") or mode in ("off","native1"):cases=[cases[0]]
    for tier,sizes in cases:
        flags=["-Xint"] if tier=="interp" else ["-XX:TieredStopAtLevel=1"] if tier=="c1" else ["-XX:-TieredCompilation","-XX:CompileThreshold=100"]
        result=out/(mode+"-"+tier+".json")
        cmd=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.(utf16GetChars|utf16ToChars)$","-p","size="+sizes,"-f","2","-wi","3","-i","3","-w","200ms","-r","200ms","-t","1","-prof","gc","-jvm",str(java),"-jvmArgs"," ".join([*common,*flags,*extra]),"-rf","json","-rff",str(result)]
        print("CHECKED_COPY_START",mode,tier,flush=True)
        with result.with_suffix(".log").open("w")as stream:status=subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT)
        if status.returncode:
            print(result.with_suffix(".log").read_text()[-16000:],flush=True);raise SystemExit(status.returncode)
        rows=json.loads(result.read_text());assert len(rows)==2*len(sizes.split(","))
        for row in rows:print("CHECKED_COPY_RESULT",json.dumps({"mode":mode,"tier":tier,"method":row["benchmark"].rsplit(".",1)[1],"size":int(row["params"]["size"]),"ns":row["primaryMetric"]["score"],"ci":row["primaryMetric"]["scoreConfidence"],"bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
    if mode in ("control","internal","both"):
        log=out/(mode+"-compiled.log")
        cmd=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.(utf16GetChars|utf16ToChars)$","-p","size=31","-f","1","-wi","1","-i","1","-w","200ms","-r","200ms","-jvm",str(java),"-jvmArgs"," ".join([*common,"-XX:TieredStopAtLevel=1",*extra,"-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining","-XX:CompileCommand=print,java/lang/String.getChars","-XX:CompileCommand=print,java/lang/StringUTF16.toChars"])]
        with log.open("w")as stream:subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT,check=True)
        lines=[line for line in log.read_text().splitlines() if "@"in line and not line.lstrip().startswith(";") and any(k in line for k in("StringUTF16::getChars (","StringUTF16::getChars0 ","StringUTF16::toChars ","String::getChars "))]
        print("CHECKED_COPY_INLINING",mode,json.dumps(lines[-50:]),flush=True)
print("CHECKED_COPY_DIAGNOSTIC_COMPLETE_NOT_FINAL_IMAGE",flush=True)
