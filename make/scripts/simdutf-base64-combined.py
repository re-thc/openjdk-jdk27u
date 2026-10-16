import json, os, subprocess, sys
from pathlib import Path
head,base,out=[Path(s).resolve() for s in sys.argv[1:]]
out.mkdir(exist_ok=True)
names=["java/lang/String.java","java/lang/StringUTF16.java","jdk/internal/util/SimdUTF.java","java/util/Base64.java"]
originals={name:(Path("src/java.base/share/classes")/name).read_text() for name in names}
edits=json.loads("{\"control\":[],\"combo\":[{\"path\":\"java/util/Base64.java\",\"before\":\"import jdk.internal.vm.annotation.IntrinsicCandidate;\",\"after\":\"import jdk.internal.vm.annotation.ForceInline;\\nimport jdk.internal.vm.annotation.IntrinsicCandidate;\"},{\"path\":\"java/util/Base64.java\",\"before\":\"        @IntrinsicCandidate\\n        private void encodeBlock(\",\"after\":\"        @ForceInline\\n        @IntrinsicCandidate\\n        private void encodeBlock(\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? ENCODE_BASE64_URL : ENCODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64);\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? DECODE_BASE64_URL : DECODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64);\"}],\"cutoff\":[{\"path\":\"java/util/Base64.java\",\"before\":\"import jdk.internal.vm.annotation.IntrinsicCandidate;\",\"after\":\"import jdk.internal.vm.annotation.ForceInline;\\nimport jdk.internal.vm.annotation.IntrinsicCandidate;\"},{\"path\":\"java/util/Base64.java\",\"before\":\"        @IntrinsicCandidate\\n        private void encodeBlock(\",\"after\":\"        @ForceInline\\n        @IntrinsicCandidate\\n        private void encodeBlock(\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? ENCODE_BASE64_URL : ENCODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64);\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? DECODE_BASE64_URL : DECODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64);\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"    @ForceInline\\n    public static boolean isEligible(int len) {\",\"after\":\"    @ForceInline\\n    public static boolean isEligibleBase64Encoding(int len) {\\n        int tier = utf8DecoderPrefixThreshold();\\n        return minLength > 0 && len >= (tier == 0 ? minLength : 24);\\n    }\\n\\n    @ForceInline\\n    public static boolean isEligible(int len) {\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        if (!isEligible(len) || (automatic && len < operationMinimumLength(operation))) {\",\"after\":\"        if (!(operation == ENCODE_BASE64 || operation == ENCODE_BASE64_URL\\n                ? isEligibleBase64Encoding(len) : isEligible(len))\\n                || (automatic && len < operationMinimumLength(operation))) {\"},{\"path\":\"java/util/Base64.java\",\"before\":\"if (SimdUTF.isEligible(sl - sp) && SimdUTF.encodeBase64(\",\"after\":\"if (SimdUTF.isEligibleBase64Encoding(sl - sp) && SimdUTF.encodeBase64(\"}],\"static\":[{\"path\":\"java/util/Base64.java\",\"before\":\"import jdk.internal.vm.annotation.IntrinsicCandidate;\",\"after\":\"import jdk.internal.vm.annotation.ForceInline;\\nimport jdk.internal.vm.annotation.IntrinsicCandidate;\"},{\"path\":\"java/util/Base64.java\",\"before\":\"        @IntrinsicCandidate\\n        private void encodeBlock(\",\"after\":\"        @ForceInline\\n        @IntrinsicCandidate\\n        private void encodeBlock(\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? ENCODE_BASE64_URL : ENCODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, ENCODE_BASE64);\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        return process(src, sp, len, dst, dp, dst.length - dp, url ? DECODE_BASE64_URL : DECODE_BASE64);\",\"after\":\"        if (url) {\\n            return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64_URL);\\n        }\\n        return process(src, sp, len, dst, dp, dst.length - dp, DECODE_BASE64);\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"    @ForceInline\\n    public static boolean isEligible(int len) {\",\"after\":\"    @ForceInline\\n    public static boolean isEligibleBase64Encoding(int len) {\\n        int tier = utf8DecoderPrefixThreshold();\\n        return minLength > 0 && len >= (tier == 0 ? minLength : 24);\\n    }\\n\\n    @ForceInline\\n    public static boolean isEligible(int len) {\"},{\"path\":\"jdk/internal/util/SimdUTF.java\",\"before\":\"        if (!isEligible(len) || (automatic && len < operationMinimumLength(operation))) {\",\"after\":\"        if (!(operation == ENCODE_BASE64 || operation == ENCODE_BASE64_URL\\n                ? isEligibleBase64Encoding(len) : isEligible(len))\\n                || (automatic && len < operationMinimumLength(operation))) {\"},{\"path\":\"java/util/Base64.java\",\"before\":\"if (SimdUTF.isEligible(sl - sp) && SimdUTF.encodeBase64(\",\"after\":\"if (SimdUTF.isEligibleBase64Encoding(sl - sp) && SimdUTF.encodeBase64(\"},{\"path\":\"java/util/Base64.java\",\"before\":\"if (SimdUTF.isEligibleBase64Encoding(sl - sp) && SimdUTF.encodeBase64(\",\"after\":\"if (sl - sp >= 24 && SimdUTF.isEligibleBase64Encoding(sl - sp) && SimdUTF.encodeBase64(\"}]}")
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


for mode in ("base","on","control","combo","cutoff","static","off","comboOff","cutoffOff","staticOff"):
    java=(base if mode=="base" else head)/"bin/java"
    variant=mode.removesuffix("Off")
    extra=["--patch-module=java.base="+str(patches[variant])] if variant in patches else []
    if mode.endswith("Off") or mode=="off":extra.append("-XX:-UseSIMDUTFIntrinsics")
    cases=[("encoder","c1","base64Encode","3,12,18,24,31,63,255,258,4096",9),
           ("encoder","c2","base64Encode","3,31,63,4096",4),
           ("encoder","interp","base64Encode","3,12,24,31,63,4096",6)]
    if mode.endswith("Off") or mode=="off":cases=[cases[0]]
    for study,tier,methods,sizes,expected in cases:
        flags=["-Xint"] if tier=="interp" else ["-XX:TieredStopAtLevel=1"] if tier=="c1" else ["-XX:-TieredCompilation","-XX:CompileThreshold=100"]
        result=out/(mode+"-"+tier+".json")
        cmd=[str(java),"-cp",cp,"org.openjdk.jmh.Main","org.openjdk.bench.java.lang.SimdUTF.("+methods+")$","-p","size="+sizes,"-f","2","-wi","3","-i","3","-w","200ms","-r","200ms","-t","1","-prof","gc","-jvm",str(java),"-jvmArgs"," ".join([*common,*flags,*extra]),"-rf","json","-rff",str(result)]
        print("COMBINED_START",mode,tier,flush=True)
        with result.with_suffix(".log").open("w")as stream:status=subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT)
        if status.returncode:
            print(result.with_suffix(".log").read_text()[-16000:],flush=True);raise SystemExit(status.returncode)
        rows=json.loads(result.read_text());assert len(rows)==expected
        for row in rows:print("COMBINED_RESULT",json.dumps({"mode":mode,"tier":tier,"method":row["benchmark"].rsplit(".",1)[1],"size":int(row["params"]["size"]),"ns":row["primaryMetric"]["score"],"ci":row["primaryMetric"]["scoreConfidence"],"bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
print("COMBINED_DIAGNOSTIC_COMPLETE_NOT_FINAL_IMAGE",flush=True)
