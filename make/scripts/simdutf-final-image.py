import json
import os
from pathlib import Path
import platform
import subprocess
import sys

head, base, debug, output = [Path(s).resolve() for s in sys.argv[1:]]
output.mkdir(exist_ok=True)
jtreg = Path("bundles/jtreg/lib/jtreg.jar").resolve()
assert jtreg.is_file(), jtreg
common=["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2"]
tiers={"interp":["-Xint"],"c1":["-Xbatch","-XX:TieredStopAtLevel=1"],
       "c2":["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100"]}
classpath="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes,generated=output/"classes",output/"generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",classpath,"-processorpath",classpath,
    "-d",str(classes),"-s",str(generated),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
classpath=str(classes)+os.pathsep+classpath
hotspot_tests = ["test/hotspot/jtreg/compiler/intrinsics/simdutf",
                 "test/hotspot/jtreg/compiler/escapeAnalysis/TestSimdUTFLeaf.java"]
charset_tests = ["test/jdk/java/nio/charset/CharsetDecoder",
                 "test/jdk/java/nio/charset/coders",
                 *["test/jdk/sun/nio/cs/"+name for name in
                   ("TestUTF8.java", "TestStringCodingUTF8.java", "TestUTF_16.java",
                    "TestUTF_32.java", "FindDecoderBugs.java", "DecoderOverflow.java",
                    "MalformedSurrogates.java")]]
for name, image, disabled in (("release",head,False),("fastdebug",debug,False),
                              ("release-off",head,True)):
    print("IMAGE_RELEASE",name,(image/"release").read_text(),flush=True)
    suites = [("charset",charset_tests)] if disabled else [
        ("hotspot",hotspot_tests),("charset",charset_tests)]
    for suite, tests in suites:
        label = name+"-"+suite
        log=output/("jtreg-"+label+".log")
        options="-XX:ActiveProcessorCount=2"+(" -XX:-UseSIMDUTFIntrinsics" if disabled else "")
        command=[str(head/"bin/java"),"-Xmx512m","-jar",str(jtreg),
            "-jdk:"+str(image),"-agentvm","-concurrency:2","-timeoutFactor:4","-verbose:summary",
            "-javaoptions:"+options,
            "-w:"+str(output/("JTwork-"+label)),"-r:"+str(output/("JTreport-"+label)),*tests]
        with log.open("w") as stream:
            result=subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT)
        print("JTREG_RESULT",label,"exit",result.returncode,log.read_text()[-20000:],flush=True)
        if result.returncode:
            raise SystemExit(result.returncode)
cpu=min(os.sched_getaffinity(0))
os.sched_setaffinity(0,{cpu})
print("FULL_METADATA",json.dumps({"arch":platform.machine(),"cpu":cpu,
    "base":"e206bae32b2a6cc1fa9464ad34d75f2df4b347e9",
    "head":"00f34e576f7d32f449dff21f0f657de3506e87e8",
    "normal_head_run":38783629855,"build":"fresh source release/fastdebug","base_run":38601904956,"patches":False}),flush=True)
print("BASE_RELEASE",(base/"release").read_text(),flush=True)
cpu_fields={"model name","CPU implementer","CPU part","CPU architecture"}
cpu_info=sorted({line.strip() for line in Path("/proc/cpuinfo").read_text().splitlines()
                 if ":" in line and line.split(":",1)[0].strip() in cpu_fields})
print("CPU_INFO",json.dumps({"fields":cpu_info,"kernel":platform.release(),"common":common,"tiers":tiers}),flush=True)
def measure(study,mode,tier,methods,sizes):
    java=(base if mode=="base" else head)/"bin/java"
    extra=(["-XX:-UseSIMDUTFIntrinsics"] if mode=="off" else
           ["-XX:SIMDUTFMinLength="+mode[9:]] if mode.startswith("threshold") else [])
    label="-".join((study,mode,tier))
    path=output/(label+".json")
    command=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.("+methods+")$","-p","size="+sizes,
        "-f","2","-wi","3","-i","4","-w","300ms","-r","300ms","-t","1","-prof","gc",
        "-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers[tier],*extra]),
        "-rf","json","-rff",str(path)]
    print("FULL_START",label,flush=True)
    log=output/(label+".log")
    with log.open("w") as stream:
        result=subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT)
    if result.returncode:
        print(log.read_text()[-16000:],flush=True)
        raise SystemExit(result.returncode)
    rows=json.loads(path.read_text())
    expected=len(methods.split("|"))*len(sizes.split(","))
    if len(rows)!=expected or not all(r["primaryMetric"].get("rawData") for r in rows):
        print(log.read_text()[-20000:],flush=True)
        raise AssertionError((label,len(rows),expected))
    for row in rows:
        metric=row["primaryMetric"]
        print("FULL_RESULT",json.dumps({"study":study,"mode":mode,"tier":tier,
            "method":row["benchmark"].rsplit(".",1)[1],"size":int(row["params"]["size"]),
            "ns":metric["score"],"ci":metric["scoreConfidence"],
            "bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
def measure_malformed(mode,tier,action,sizes):
    java=(base if mode=="base" else head)/"bin/java"
    extra=["-XX:-UseSIMDUTFIntrinsics"] if mode=="off" else []
    label="-".join(("malformed-sequence",mode,tier,action))
    path=output/(label+".json")
    command=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.malformedSequenceDecode$","-p","size="+sizes,
        "-p","action="+action,"-f","2","-wi","3","-i","4","-w","300ms","-r","300ms",
        "-t","1","-prof","gc","-jvm",str(java),
        "-jvmArgs"," ".join([*common,*tiers[tier],*extra]),"-rf","json","-rff",str(path)]
    print("FULL_START",label,flush=True)
    log=output/(label+".log")
    with log.open("w") as stream:
        result=subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT)
    if result.returncode:
        print(log.read_text()[-16000:],flush=True)
        raise SystemExit(result.returncode)
    rows=json.loads(path.read_text())
    assert len(rows)==5*len(sizes.split(",")) and all(r["primaryMetric"].get("rawData") for r in rows)
    for row in rows:
        metric=row["primaryMetric"]
        print("FULL_RESULT",json.dumps({"study":"malformed-sequence","mode":mode,"tier":tier,
            "method":"malformedSequenceDecode","kind":row["params"]["kind"],"action":action,
            "size":int(row["params"]["size"]),"ns":metric["score"],
            "ci":metric["scoreConfidence"],"bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
for mode in ("base","on","off"):
    for tier in ("c1","c2"):
        measure("utf16-copy",mode,tier,"utf16ToChars|utf16GetChars|utf16FromChars","1,31,4096")
    measure("utf16-copy",mode,"interp","utf16ToChars|utf16GetChars|utf16FromChars","1,4096")
for mode in ("base","on","off"):
    measure("boundary",mode,"c1","charsetDecodeTight","31,128,255,256,4096")
    measure("ascii",mode,"c1","asciiCharsetDecode","16,31,32,63,64,127,128,255,256,4096")
    measure("latin1-crossover",mode,"c1","latin1Decode","128,256,512,1024")
    measure("supplementary-crossover",mode,"c2","supplementaryDecode","128,256,512,1024")
    measure("ascii-api",mode,"c1","latin1ToChars","31,4096")
    measure("malformed",mode,"c1","malformedCharsetDecode|malformedCharsetEncode","128,4096")
    measure("charsets",mode,"c1","utf16CharsetDecode|utf32CharsetDecode|utf32TightCharsetDecode","31,128,4096")
    measure("string-short",mode,"c1","utf8Decode|latin1Decode|supplementaryDecode","16,31,64,85")
    measure("short-output",mode,"c1","charsetDecodeSmallBuffer|charsetDecodeEmptyBuffer","256,4096,1048576")
    measure("short-output",mode,"c2","charsetDecodeSmallBuffer|charsetDecodeEmptyBuffer","256,4096,1048576")
    measure("short-output",mode,"interp","charsetDecodeSmallBuffer|charsetDecodeEmptyBuffer","256,4096")
    measure("c2-short",mode,"c2","charsetDecodeTight","31,128,255,256,512,1024")
    measure("c2-roomy",mode,"c2","charsetDecode","32,85,86,128,256,512,1024")
    measure("c2-ascii",mode,"c2","asciiCharsetDecode","31,255,4096")
    measure("c2-malformed",mode,"c2","malformedCharsetDecode","4096")
    measure("interp-short",mode,"interp","asciiCharsetDecode","31")
    for tier in tiers:
        for action in ("REPORT","REPLACE"):
            measure_malformed(mode,tier,action,"128,4096")
        measure("bulk",mode,tier,
            "utf16Encode|latin1Encode|utf8Decode|latin1Decode|supplementaryDecode|charsetEncode|charsetDecodeTight|utf32SupplementaryCharsetEncode|codePointCount|base64Encode|base64Decode",
            "4096")
for mode in ("base","on","off"):
    measure("supplementary-large",mode,"c2","supplementaryDecode","16384,65536,1048576")
    measure("string-short-c2",mode,"c2","utf8Decode|latin1Decode|supplementaryDecode","16,31,64,85")
for mode in ("threshold128","threshold256"):
    measure("utf8-threshold",mode,"c1","charsetDecodeTight","64,128,255,256")
    measure("utf8-threshold",mode,"c2","charsetDecodeTight|charsetDecode","64,85,86,128,256")
for mode in ("base","on","off"):
    java=(base if mode=="base" else head)/"bin/java"
    extra=["-XX:-UseSIMDUTFIntrinsics"] if mode=="off" else []
    log=output/("inlining-"+mode+".log")
    command=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.charsetDecodeTight$","-p","size=255",
        "-f","1","-wi","1","-i","1","-w","200ms","-r","200ms",
        "-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers["c1"],*extra,
        "-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining",
        "-XX:CompileCommand=print,sun/nio/cs/UTF_8$Decoder.decodeArrayLoop",
        "-XX:CompileCommand=print,sun/nio/cs/UTF_8$Decoder.decodeLoop"])]
    with log.open("w") as stream:
        subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT,check=True)
    lines=[line for line in log.read_text().splitlines()
        if "@" in line and not line.lstrip().startswith(";")
        and any(key in line for key in ("countPositives0","inflate0","decodeUTF8","decodeASCII","decodeArrayLoop","decodeLoop","isMalformed3","isMalformed4","malformedLeadingSequenceLength","operationMinimumLength","utf8DecoderPrefixThreshold"))]
    print("FULL_INLINING",mode,json.dumps(lines[-65:]),flush=True)

for log in sorted(output.glob("inlining-*.log")):
    import re
    for index,section in enumerate(log.read_text().split("Compiled method (c1)")[1:]):
        heading=section.splitlines()[0]
        if "UTF_8$Decoder::decodeArrayLoop" not in heading or "%" in heading:
            continue
        main=re.search(r"main code\s+\[(0x[0-9a-f]+),\s*(0x[0-9a-f]+)\]",section)
        if not main:
            raise AssertionError(("missing C1 main code",log,heading))
        start,end=int(main[1],16),int(main[2],16)
        binary=bytearray(end-start)
        seen=0
        for line in section.splitlines():
            row=re.match(r"\s*(0x[0-9a-f]+):\s*([0-9a-f |]+)",line)
            if not row:
                continue
            address=int(row[1],16)
            raw=re.sub(r"[ |]","",row[2])
            if not raw or len(raw)%2 or not start<=address<end:
                continue
            data=bytes.fromhex(raw)[:end-address]
            binary[address-start:address-start+len(data)]=data
            seen+=len(data)
        if seen!=end-start:
            raise AssertionError(("incomplete C1 capture",log,seen,end-start))
        path=output/("code-"+log.stem+"-"+str(index)+".bin")
        path.write_bytes(binary)
        machine="aarch64" if platform.machine()=="aarch64" else "i386:x86-64"
        disassembly=subprocess.run(["objdump","-w","-D","-b","binary","-m",machine,
            "--adjust-vma="+hex(start),str(path)],check=True,text=True,capture_output=True).stdout
        path.with_suffix(".txt").write_text(disassembly)
        instructions=[]
        for line in disassembly.splitlines():
            columns=line.split("\t")
            if len(columns)<3 or not re.fullmatch(r"\s*[0-9a-f]+:\s*",columns[0]):
                continue
            address=int(columns[0].strip().removesuffix(":"),16)
            operation=" ".join(columns[2:]).strip().split(None,1)
            if operation:
                instructions.append((address,operation[0],operation[1] if len(operation)>1 else "",line))
        edges={}
        for address,mnemonic,operands,line in instructions:
            if mnemonic=="b" or mnemonic.startswith("b.") or mnemonic in ("cbz","cbnz","tbz","tbnz") or mnemonic.startswith("j"):
                targets=re.findall(r"(?:0x)?([0-9a-f]{6,})(?=\s|<|$)",operands)
                if targets:
                    target=int(targets[-1],16)
                    if start<=target<address and address-target>=64:
                        edges[target]=max(address,edges.get(target,0))
        loops=[]
        for begin,stop in sorted(edges.items()):
            body=[ins for ins in instructions if begin<=ins[0]<=stop]
            stack=[ins[3] for ins in body if re.search(r"\[sp[,\]]|\(%rsp",ins[2])]
            loops.append({"begin":hex(begin),"end":hex(stop),"instructions":len(body),
                "stack_accesses":len(stack),"stack_instructions":stack})
        print("FULL_C1_CODE",json.dumps({"file":log.name,"heading":heading,
            "main_bytes":end-start,"frame":re.findall(r"#\s*\[sp\+[^\n]+",section)[:1],
            "loops":[{key:loop[key] for key in ("begin","end","instructions","stack_accesses")} for loop in loops[:8]]}),flush=True)
        if loops:
            selected=None
            for loop in loops:
                begin,stop=int(loop["begin"],16),int(loop["end"],16)
                body=[ins for ins in instructions if begin<=ins[0]<=stop]
                if any((ins[1]=="asr" and re.search(r"#(?:0x)?5(?:,|$)",ins[2]))
                       or (ins[1]=="sar" and "$0x5" in ins[2]) for ins in body):
                    selected=(loop,body)
                    break
            if selected:
                print("FULL_C1_LOOP",log.name,json.dumps({"selected_utf8":True,
                    "begin":selected[0]["begin"],"end":selected[0]["end"],
                    "body":[ins[3] for ins in selected[1]]}),flush=True)
            else:
                print("FULL_C1_LOOP_UNSELECTED",log.name,flush=True)


for mode in ("base","on","off"):
    java=(base if mode=="base" else head)/"bin/java"
    extra=["-XX:-UseSIMDUTFIntrinsics"] if mode=="off" else []
    log=output/("latin1-inlining-"+mode+".log")
    command=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.latin1Decode$","-p","size=4096",
        "-f","1","-wi","1","-i","1","-w","200ms","-r","200ms",
        "-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers["c1"],*extra,
        "-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining",
        "-XX:CompileCommand=print,java/lang/String.utf8"])]
    with log.open("w") as stream:
        subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT,check=True)
    raw=log.read_text()
    decisions=[line for line in raw.splitlines() if "@" in line and not line.lstrip().startswith(";")
        and any(key in line for key in ("decodeUTF8Latin1","SimdUTF::decodeLatin1","operationMinimumLength","utf8DecoderPrefixThreshold"))]
    print("FULL_LATIN1_INLINING",mode,json.dumps(decisions[-30:]),flush=True)
    import re
    for section in raw.split("Compiled method (c1)")[1:]:
        heading=section.splitlines()[0]
        if "java.lang.String::utf8" in heading and "%" not in heading:
            match=re.search(r"main code\s+\[(0x[0-9a-f]+),\s*(0x[0-9a-f]+)\]",section)
            assert match,(mode,heading)
            print("FULL_C1_LATIN1",json.dumps({"mode":mode,"heading":heading,
                "main_bytes":int(match[2],16)-int(match[1],16),
                "frame":re.findall(r"#\s*\[sp\+[^\n]+",section)[:1]}),flush=True)

print("FULL_COMPLETE",flush=True)

for mode in ("base","on","off"):
    java=(base if mode=="base"else head)/"bin/java"
    extra=["-XX:-UseSIMDUTFIntrinsics"]if mode=="off"else[]
    log=output/("utf16-copy-inlining-"+mode+".log")
    command=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.(utf16GetChars|utf16FromChars)$","-p","size=1",
        "-f","1","-wi","1","-i","1","-w","300ms","-r","300ms","-jvm",str(java),
        "-jvmArgs"," ".join([*common,*tiers["c1"],*extra,"-XX:+UnlockDiagnosticVMOptions",
            "-XX:+PrintInlining","-XX:CompileCommand=print,java/lang/String.getChars",
            "-XX:CompileCommand=print,java/lang/StringUTF16.getChars0",
            "-XX:CompileCommand=print,jdk/internal/util/SimdUTF.copyUTF16"])]
    with log.open("w")as stream:subprocess.run(command,stdout=stream,stderr=subprocess.STDOUT,check=True)
    lines=[line for line in log.read_text().splitlines()if "@"in line and not line.lstrip().startswith(";")
        and any(key in line for key in("StringUTF16::getChars0","StringUTF16::getChars (","String::getChars (",
            "StringUTF16::toBytes0","SimdUTF::copyUTF16"))]
    print("FULL_COPY_INLINING",mode,json.dumps(lines[-100:]),flush=True)
print("FULL_ALL_COMPLETE",flush=True)
