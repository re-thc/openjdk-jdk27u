import json
import os
from pathlib import Path
import platform
import re
import subprocess
import sys

head, base, output = [Path(s).resolve() for s in sys.argv[1:]]
output.mkdir(exist_ok=True)
changes = json.loads("{\"probe\":[[\"sun/nio/cs/UTF_8.java\",\"import jdk.internal.util.SimdUTF;\",\"import jdk.internal.util.SimdUTF;\\nimport jdk.internal.vm.annotation.DontInline;\"],[\"sun/nio/cs/UTF_8.java\",\"            // Keep the ASCII intrinsic and reject invalid leading bytes before bulk conversion.\\n            int converted = SimdUTF.isEligible(sl - sp)\\n                    && (sa[sp] & 0xff) >= 0xc2 && (sa[sp] & 0xff) <= 0xf4\\n                    ? SimdUTF.decodeUTF8(sa, sp, sl - sp, da, dp, dl - dp) : -1;\\n            if (converted >= 0) {\\n                updatePositions(src, sl, dst, dp + converted);\\n                return CoderResult.UNDERFLOW;\\n            }\\n\",\"            if (SimdUTF.isEligibleUTF8Decoding(sl - sp)\\n                    && (sa[sp] & 0xff) >= 0xc2 && (sa[sp] & 0xff) <= 0xf4) {\\n                updatePositions(src, sp, dst, dp);\\n                CoderResult result = decodeArrayLoopSIMD(src, dst);\\n                if (result != null) {\\n                    return result;\\n                }\\n            }\\n\"],[\"sun/nio/cs/UTF_8.java\",\"        private CoderResult decodeBufferLoop(ByteBuffer src,\",\"        // Keep bulk call arguments out of the scalar decoder's C1 compilation.\\n        @DontInline\\n        private CoderResult decodeArrayLoopSIMD(ByteBuffer src, CharBuffer dst) {\\n            int sp = src.arrayOffset() + src.position();\\n            int dp = dst.arrayOffset() + dst.position();\\n            int converted = SimdUTF.decodeUTF8(src.array(), sp, src.remaining(),\\n                    dst.array(), dp, dst.remaining());\\n            if (converted < 0) {\\n                return null;\\n            }\\n            updatePositions(src, src.arrayOffset() + src.limit(), dst, dp + converted);\\n            return CoderResult.UNDERFLOW;\\n        }\\n\\n        private CoderResult decodeBufferLoop(ByteBuffer src,\"],[\"sun/nio/cs/UTF_8.java\",\"return malformed(src, sp, dst, dp, 1);\",\"return malformedForLength(src, sp, dst, dp, 1);\"],[\"jdk/internal/util/SimdUTF.java\",\"    @ForceInline\\n    public static boolean useIndexOfPrefix()\",\"    @ForceInline\\n    public static boolean isEligibleUTF8Decoding(int len) {\\n        int threshold = minLength;\\n        return threshold > 0 && len >= (automatic\\n                ? Math.max(threshold, operationMinimumLength(DECODE_UTF8)) : threshold);\\n    }\\n\\n    @ForceInline\\n    public static boolean useIndexOfPrefix()\"]],\"guard\":[[\"java/lang/StringLatin1.java\",\"        String.checkBoundsOffCount(dstOff, len, dst.length);    // Implicit null check on `dst`\\n        inflate0(src, srcOff, dst, dstOff, len);\",\"        String.checkBoundsOffCount(dstOff, len, dst.length);    // Implicit null check on `dst`\\n        if (len != 0) {\\n            inflate0(src, srcOff, dst, dstOff, len);\\n        }\"],[\"java/lang/StringLatin1.java\",\"    private static void inflate0(byte[] src, int srcOff, char[] dst, int dstOff, int len) {\\n        if (len == 0) {\\n            return;\\n        }\",\"    private static void inflate0(byte[] src, int srcOff, char[] dst, int dstOff, int len) {\"]]}")
root = Path("src/java.base/share/classes")
variants = {}
changed = {}
for name, edits in changes.items():
    changed = changed.copy()
    for path, old, new in edits:
        source = changed.get(path, (root/path).read_text())
        assert source.count(old) == 1, (name, path, old)
        changed[path] = source.replace(old, new, 1)
    variants[name] = changed
patches = {}
for name, changed in variants.items():
    directory, classes = output/("src-"+name), output/("patch-"+name)
    files = []
    for path, source in changed.items():
        file = directory/path
        file.parent.mkdir(parents=True,exist_ok=True)
        file.write_text(source)
        files.append(str(file))
    classes.mkdir()
    subprocess.run([str(head/"bin/javac"),"--patch-module","java.base="+str(directory),
        "-d",str(classes),*files],check=True)
    patches[name] = ["--patch-module=java.base="+str(classes)]
tests=output/"tests"
tests.mkdir()
subprocess.run([str(head/"bin/javac"),"--add-exports","java.base/jdk.internal.util=ALL-UNNAMED",
    "-d",str(tests),"test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java"],check=True)
common=["-XX:+UseSerialGC","-Xms1g","-Xmx1g","-XX:ActiveProcessorCount=2"]
tiers={"interp":["-Xint"],"c1":["-Xbatch","-XX:TieredStopAtLevel=1"],
       "c2":["-Xbatch","-XX:-TieredCompilation","-XX:CompileThreshold=100"]}
for name in variants:
    for tier, flags in tiers.items():
        subprocess.run([str(head/"bin/java"),*patches[name],*common,*flags,
            "--add-exports","java.base/jdk.internal.util=ALL-UNNAMED",
            "--add-opens","java.base/jdk.internal.util=ALL-UNNAMED",
            "-cp",str(tests),"SimdUTFTest"],check=True)
classpath="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated=output/"classes",output/"generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",classpath,"-processorpath",classpath,
    "-d",str(classes),"-s",str(generated),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java"],check=True)
classpath=str(classes)+os.pathsep+classpath
cpu=min(os.sched_getaffinity(0))
os.sched_setaffinity(0,{cpu})
print("FIX_METADATA",json.dumps({"arch":platform.machine(),"cpu":cpu,
    "base":"e206bae32b2a6cc1fa9464ad34d75f2df4b347e9",
    "head":"2072f7ee5fd21b378b391ae3053a4321f402f469",
    "candidate_source":"diagnostic module patches; not final-image validation"}),flush=True)
def options(mode):
    java=(base if mode=="base" else head)/"bin/java"
    extra=patches.get(mode.removesuffix("-off"),[])+(["-XX:-UseSIMDUTFIntrinsics"] if mode.endswith("-off") else [])
    return java,extra
def measure(study,mode,tier,methods,sizes):
    java,extra=options(mode)
    label="-".join((study,mode,tier))
    path=output/(label+".json")
    cmd=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.("+methods+")$","-p","size="+sizes,
        "-f","2","-wi","3","-i","4","-w","300ms","-r","300ms","-t","1","-prof","gc",
        "-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers[tier],*extra]),
        "-rf","json","-rff",str(path)]
    print("FIX_START",label,flush=True)
    log=output/(label+".log")
    with log.open("w") as stream:
        result=subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT)
    if result.returncode:
        print(log.read_text()[-16000:],flush=True)
        raise SystemExit(result.returncode)
    rows=json.loads(path.read_text())
    assert rows and all(r["primaryMetric"].get("rawData") for r in rows)
    for row in rows:
        metric=row["primaryMetric"]
        print("FIX_RESULT",json.dumps({"study":study,"mode":mode,"tier":tier,
            "method":row["benchmark"].rsplit(".",1)[1],"size":int(row["params"]["size"]),
            "ns":metric["score"],"ci":metric["scoreConfidence"],
            "bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
for mode in ("base","on","probe","guard","probe-off"):
    measure("boundary",mode,"c1","charsetDecodeTight","31,128,255,256,4096")
    measure("controls",mode,"c1","asciiCharsetDecode|malformedCharsetDecode","31,4096")
for mode in ("base","on","probe","guard","probe-off"):
    measure("other-tiers",mode,"c2","charsetDecodeTight|asciiCharsetDecode|malformedCharsetDecode","31,255,4096")
for mode in ("base","on","probe"):
    measure("interpreter",mode,"interp","charsetDecodeTight|asciiCharsetDecode|malformedCharsetDecode","31,4096")
for mode in ("base","on","probe","guard"):
    java,extra=options(mode)
    log=output/("inlining-"+mode+".log")
    cmd=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTF.charsetDecodeTight$","-p","size=255",
        "-f","1","-wi","1","-i","1","-w","200ms","-r","200ms",
        "-jvm",str(java),"-jvmArgs"," ".join([*common,*tiers["c1"],*extra,
        "-XX:+UnlockDiagnosticVMOptions","-XX:+PrintInlining",
        "-XX:CompileCommand=print,sun/nio/cs/UTF_8$Decoder.decodeArrayLoop*"])]
    with log.open("w") as stream:
        subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT,check=True)
    lines=[line for line in log.read_text().splitlines() if "decodeUTF8" in line or "countPositives0" in line]
    print("FIX_INLINING",mode,json.dumps(lines[-20:]),flush=True)

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
            stack=[ins[3] for ins in body if re.search(r"\[(?:sp|x29)[,\]]|\(%(?:rsp|rbp)",ins[2])]
            loops.append({"begin":hex(begin),"end":hex(stop),"instructions":len(body),
                "stack_accesses":len(stack),"stack_instructions":stack})
        print("FULL_C1_CODE",json.dumps({"file":log.name,"heading":heading,
            "main_bytes":end-start,"frame":re.findall(r"#\s*\[sp\+[^\n]+",section)[:1],
            "loops":loops}),flush=True)
        if loops:
            begin,stop=int(loops[0]["begin"],16),int(loops[0]["end"],16)
            print("FULL_C1_LOOP",log.name,json.dumps([ins[3] for ins in instructions if begin<=ins[0]<=stop]),flush=True)


print("FIX_COMPLETE",flush=True)
