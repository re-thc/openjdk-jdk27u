import json, os, subprocess, sys
from pathlib import Path
head,base,out=[Path(s).resolve() for s in sys.argv[1:]]
out.mkdir(exist_ok=True)
names=["java/lang/String.java","java/lang/StringUTF16.java","jdk/internal/util/SimdUTF.java","java/util/Base64.java"]
originals={name:(Path("src/java.base/share/classes")/name).read_text() for name in names}
edits=json.loads("{\"control\":[],\"opcode\":[{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? ENCODE_BASE64_URL : ENCODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64);\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? DECODE_BASE64_URL : DECODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64);\"}],\"inline\":[{\"path\":\"java/util/Base64.java\",\"before\":\"        @IntrinsicCandidate\\n        private void encodeBlock(\",\"after\":\"        @ForceInline\\n        @IntrinsicCandidate\\n        private void encodeBlock(\"}],\"copy\":[{\"path\":\"java/lang/StringUTF16.java\",\"before\":\"    static void getChars(byte[] value, int srcBegin, int srcEnd, char[] dst, int dstBegin) {\\n        checkBoundsBeginEnd(srcBegin, srcEnd, value);                           // Implicit null check on `value` via `checkBoundsBeginEnd()`\\n        String.checkBoundsOffCount(dstBegin, srcEnd - srcBegin, dst.length);    // Implicit null check on `dst`\\n        getChars0(value, srcBegin, srcEnd, dst, dstBegin);\\n    }\",\"after\":\"    @ForceInline\\n    static void getChars(byte[] value, int srcBegin, int srcEnd, char[] dst, int dstBegin) {\\n        checkBoundsBeginEnd(srcBegin, srcEnd, value);\\n        String.checkBoundsOffCount(dstBegin, srcEnd - srcBegin, dst.length);\\n        if (srcEnd - srcBegin == 1) {\\n            dst[dstBegin] = getChar(value, srcBegin);\\n        } else {\\n            getChars0(value, srcBegin, srcEnd, dst, dstBegin);\\n        }\\n    }\"}]}")
edits["inline"].insert(0,{"path":"java/util/Base64.java","before":"import jdk.internal.vm.annotation.IntrinsicCandidate;","after":"import jdk.internal.vm.annotation.ForceInline;\nimport jdk.internal.vm.annotation.IntrinsicCandidate;"})
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

modes=("base","on","control","opcode","inline","copy","off","opcodeOff","copyOff","native1")
for mode in modes:
    java=(base if mode=="base" else head)/"bin/java"
    variant={"opcodeOff":"opcode","copyOff":"copy"}.get(mode,mode)
    extra=["--patch-module=java.base="+str(patches[variant])] if variant in patches else []
    if mode.endswith("Off") or mode=="off":extra.append("-XX:-UseSIMDUTFIntrinsics")
    if mode=="native1":extra.append("-XX:SIMDUTFMinLength=1")
    b64=[("base64","c1","base64Encode|base64Decode","3,31,63,255,258,4096",12),("base64-c2","c2","base64Encode|base64Decode","63,4096",4),("base64-interp","interp","base64Encode","3,31,63",3)]
    copying=[("copy","c1","utf16GetChars|utf16ToChars","1,31,4096",6),("copy-c2","c2","utf16GetChars|utf16ToChars","1,31,4096",6)]
    if mode in ("base","on","control"):cases=b64+copying
    elif mode in ("opcode","inline"):cases=b64
    elif mode=="copy":cases=copying
    elif mode=="off":cases=[b64[0],copying[0]]
    elif mode=="opcodeOff":cases=[b64[0]]
    elif mode=="copyOff":cases=[copying[0]]
    else:cases=[]
    if mode in ("base","on","native1"):
        cases.append(("crossover","c1","base64Encode","12,18,24,27,30",5))
        cases.append(("crossover-interp","interp","base64Encode","12,18,24,27,30",5))
    for study,tier,methods,sizes,expected in cases:
        flags=["-Xint"] if tier=="interp" else ["-XX:TieredStopAtLevel=1"] if tier=="c1" else ["-XX:-TieredCompilation","-XX:CompileThreshold=100"]
        result=out/(mode+"-"+study+".json")
        cmd=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.("+methods+")$","-p","size="+sizes,"-f","2","-wi","3","-i","3","-w","200ms","-r","200ms","-t","1","-prof","gc","-jvm",str(java),"-jvmArgs"," ".join([*common,*flags,*extra]),"-rf","json","-rff",str(result)]
        print("SMALL_API_START",mode,study,flush=True)
        with result.with_suffix(".log").open("w")as stream:status=subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT)
        if status.returncode:
            print(result.with_suffix(".log").read_text()[-16000:],flush=True);raise SystemExit(status.returncode)
        rows=json.loads(result.read_text());assert len(rows)==expected
        for row in rows:print("SMALL_API_RESULT",json.dumps({"mode":mode,"tier":tier,"study":study,"method":row["benchmark"].rsplit(".",1)[1],"size":int(row["params"]["size"]),"ns":row["primaryMetric"]["score"],"ci":row["primaryMetric"]["scoreConfidence"],"bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
print("SMALL_API_DIAGNOSTIC_COMPLETE_NOT_FINAL_IMAGE",flush=True)
