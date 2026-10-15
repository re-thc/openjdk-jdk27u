import json
import os
from pathlib import Path
import platform
import re
import subprocess
import sys

head, base, output = [Path(s).resolve() for s in sys.argv[1:]]
output.mkdir(exist_ok=True)
root = Path("src/java.base/share/classes")
current = {path:(root/path).read_text() for path in
    ("sun/nio/cs/UTF_8.java","java/lang/String.java","java/lang/StringLatin1.java")}
def edit(source, changes):
    result = source.copy()
    for path, old, new in changes:
        assert result[path].count(old) == 1, (path,old)
        result[path] = result[path].replace(old,new,1)
    return result
common = edit(current,json.loads("[[\"sun/nio/cs/UTF_8.java\",\"                    && (sa[sp] & 0xff) >= 0xc2 && (sa[sp] & 0xff) <= 0xf4\",\"                    && isValidSequence(sa, sp, sl)\"],[\"sun/nio/cs/UTF_8.java\",\"        private static CoderResult malformedN(ByteBuffer src, int nb) {\",\"        @ForceInline\\n        private static boolean isValidSequence(byte[] input, int offset, int limit) {\\n            int b1 = input[offset];\\n            int remaining = limit - offset;\\n            if (b1 < (byte)0xc2 || b1 > (byte)0xf4) {\\n                return false;\\n            }\\n            if (b1 < (byte)0xe0) {\\n                return remaining >= 2 && !isNotContinuation(input[offset + 1]);\\n            }\\n            if (b1 < (byte)0xf0) {\\n                return remaining >= 3\\n                        && !isMalformed3(b1, input[offset + 1], input[offset + 2])\\n                        && (b1 != (byte)0xed || (input[offset + 1] & 0xe0) != 0xa0);\\n            }\\n            return remaining >= 4\\n                    && !isMalformed4_2(b1 & 0xff, input[offset + 1] & 0xff)\\n                    && !isMalformed4(input[offset + 1], input[offset + 2], input[offset + 3]);\\n        }\\n\\n        private static CoderResult malformedN(ByteBuffer src, int nb) {\"],[\"sun/nio/cs/UTF_8.java\",\"                    if (isMalformed3(b1, b2, b3))\\n                        return malformed(src, sp, dst, dp, 3);\",\"                    if (isMalformed3(b1, b2, b3))\\n                        return malformedForLength(src, sp, dst, dp, isMalformed3_2(b1, b2) ? 1 : 2);\"],[\"sun/nio/cs/UTF_8.java\",\"                        return malformed(src, sp, dst, dp, 4);\",\"                        return malformedForLength(src, sp, dst, dp,\\n                                (b1 & 0xff) > 0xf4 || isMalformed4_2(b1 & 0xff, b2 & 0xff) ? 1 :\\n                                isNotContinuation(b3) ? 2 : 3);\"],[\"sun/nio/cs/UTF_8.java\",\"        private static boolean isMalformed4_2(int b1, int b2) {\",\"        @ForceInline\\n        private static boolean isMalformed4_2(int b1, int b2) {\"]]"))
variants = {"current":current,
    "prefix":edit(common, [["sun/nio/cs/UTF_8.java","            int n = JLA.decodeASCII(sa, sp, da, dp, Math.min(sl - sp, dl - dp));\n            sp += n;\n            dp += n;","            int n = Math.min(sl - sp, dl - dp);\n            if (n > 0 && sa[sp] >= 0) {\n                n = JLA.decodeASCII(sa, sp, da, dp, n);\n                sp += n;\n                dp += n;\n            }"]]),
    "api":edit(common,json.loads("[[\"java/lang/String.java\",\"    static int decodeASCII(byte[] sa, int sp, char[] da, int dp, int len) {\",\"    @ForceInline\\n    static int decodeASCII(byte[] sa, int sp, char[] da, int dp, int len) {\"],[\"java/lang/StringLatin1.java\",\"import jdk.internal.vm.annotation.IntrinsicCandidate;\",\"import jdk.internal.vm.annotation.ForceInline;\\nimport jdk.internal.vm.annotation.IntrinsicCandidate;\"],[\"java/lang/StringLatin1.java\",\"    static void inflate(byte[] src, int srcOff, char[] dst, int dstOff, int len) {\",\"    @ForceInline\\n    static void inflate(byte[] src, int srcOff, char[] dst, int dstOff, int len) {\"],[\"sun/nio/cs/UTF_8.java\",\"            n = SimdUTF.isEligible(sl - sp)\\n                    && (long)(dl - dp) * 3 >= sl - sp\",\"            n = (long) (dl - dp) * 3 >= sl - sp\\n                    && SimdUTF.isEligible(sl - sp)\"]]"))}
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
fixture = output/"SimdUTFMalformed.java"
fixture.write_text("package org.openjdk.bench.java.lang;\n\nimport java.nio.ByteBuffer;\nimport java.nio.CharBuffer;\nimport java.nio.charset.*;\nimport java.util.concurrent.TimeUnit;\nimport org.openjdk.jmh.annotations.*;\n\n@BenchmarkMode(Mode.AverageTime)\n@OutputTimeUnit(TimeUnit.NANOSECONDS)\n@State(Scope.Thread)\npublic class SimdUTFMalformed {\n    @Param({\"128\", \"4096\"}) public int size;\n    @Param({\"overlong\", \"surrogate\", \"range\", \"continuation\", \"tail\"}) public String kind;\n    @Param({\"REPLACE\", \"REPORT\"}) public String action;\n    private CharsetDecoder decoder;\n    private ByteBuffer input;\n    private CharBuffer output;\n\n    @Setup public void setup() {\n        byte[] pattern = switch (kind) {\n            case \"overlong\" -> new byte[]{(byte)0xe0, (byte)0x80, (byte)0x80};\n            case \"surrogate\" -> new byte[]{(byte)0xed, (byte)0xa0, (byte)0x80};\n            case \"range\" -> new byte[]{(byte)0xf4, (byte)0x90, (byte)0x80, (byte)0x80};\n            case \"continuation\" -> new byte[]{(byte)0xe6, 0x20, (byte)0x80};\n            default -> new byte[]{(byte)0xe6, (byte)0xbc, (byte)0xa2};\n        };\n        byte[] bytes = new byte[size];\n        for (int i = 0; i < size; i++) bytes[i] = pattern[i % pattern.length];\n        if (kind.equals(\"tail\")) bytes[size - 1] = (byte)0x80;\n        input = ByteBuffer.wrap(bytes);\n        output = CharBuffer.allocate(size);\n        decoder = StandardCharsets.UTF_8.newDecoder()\n                .onMalformedInput(action.equals(\"REPORT\") ? CodingErrorAction.REPORT : CodingErrorAction.REPLACE);\n    }\n\n    @Benchmark public CoderResult decode() {\n        decoder.reset();\n        input.rewind();\n        output.clear();\n        return decoder.decode(input, output, true);\n    }\n}\n")
classpath="jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated=output/"classes",output/"generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(head/"bin/javac"),"-cp",classpath,"-processorpath",classpath,
    "-d",str(classes),"-s",str(generated),"test/micro/org/openjdk/bench/java/lang/SimdUTF.java",str(fixture)],check=True)
classpath=str(classes)+os.pathsep+classpath
cpu=min(os.sched_getaffinity(0))
os.sched_setaffinity(0,{cpu})
print("FIX_METADATA",json.dumps({"arch":platform.machine(),"cpu":cpu,
    "base":"e206bae32b2a6cc1fa9464ad34d75f2df4b347e9",
    "head":"2072f7ee5fd21b378b391ae3053a4321f402f469",
    "candidate_source":"84683927 source; compare prefix bypass and inlined ASCII API, direct malformed lengths; diagnostic patches, not final-image validation"}),flush=True)
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
def malformed(mode,tier,action,sizes):
    java,extra=options(mode)
    label="-".join(("prefix",mode,tier,action))
    path=output/(label+".json")
    command=[str(java),"-cp",classpath,"org.openjdk.jmh.Main",
        "org.openjdk.bench.java.lang.SimdUTFMalformed.decode$","-p","size="+sizes,
        "-p","action="+action,"-f","2","-wi","3","-i","4","-w","300ms","-r","300ms",
        "-t","1","-prof","gc","-jvm",str(java),
        "-jvmArgs"," ".join([*common,*tiers[tier],*extra]),"-rf","json","-rff",str(path)]
    print("FIX_START",label,flush=True)
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
        print("FIX_RESULT",json.dumps({"study":"prefix","mode":mode,"tier":tier,
            "method":"malformedPrefix","kind":row["params"]["kind"],"action":action,
            "size":int(row["params"]["size"]),"ns":metric["score"],
            "ci":metric["scoreConfidence"],"bytes":row["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}),flush=True)
for mode in ("base","current","prefix","api"):
    malformed(mode,"c1","REPLACE","128,4096")
    malformed(mode,"c2","REPLACE","4096")
    malformed(mode,"interp","REPLACE","4096")
    malformed(mode,"c1","REPORT","4096")
    malformed(mode,"c2","REPORT","4096")
    measure("valid-boundary",mode,"c1","charsetDecodeTight","31,128,255,256,4096")
    measure("valid-ascii",mode,"c1","asciiCharsetDecode","31,4096")
    measure("array-api",mode,"c1","latin1ToChars","31,4096")
    measure("ascii-c2",mode,"c2","asciiCharsetDecode","31,255,4096")
    measure("malformed-control",mode,"c1","malformedCharsetDecode","4096")
    measure("malformed-control",mode,"c2","malformedCharsetDecode","4096")
    measure("valid-bulk",mode,"c2","charsetDecodeTight","4096")
    measure("small-output",mode,"c1","charsetDecodeEmptyBuffer|charsetDecodeSmallBuffer","256,1048576")
    measure("small-output",mode,"c2","charsetDecodeEmptyBuffer|charsetDecodeSmallBuffer","1048576")
for mode in ("api-off",):
    malformed(mode,"c1","REPLACE","128,4096")
    malformed(mode,"c1","REPORT","4096")
    measure("off-control",mode,"c1","charsetDecodeTight|asciiCharsetDecode|malformedCharsetDecode","31,4096")
for mode in ("base","api","prefix"):
    measure("interp-control",mode,"interp","asciiCharsetDecode|charsetDecodeEmptyBuffer","31,4096")
for mode in ("base","current","api","prefix"):
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
    lines=[line for line in log.read_text().splitlines() if any(key in line for key in ("decodeUTF8","countPositives0","inflate0","decodeASCII","isMalformed3","isMalformed4","isValidSequence"))]
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
            "loops":[{key:loop[key] for key in ("begin","end","instructions","stack_accesses")} for loop in loops[:3]]}),flush=True)
        if loops:
            begin,stop=int(loops[0]["begin"],16),int(loops[0]["end"],16)
            print("FULL_C1_LOOP",log.name,json.dumps([ins[3] for ins in instructions if begin<=ins[0]<=stop]),flush=True)


print("FIX_COMPLETE",flush=True)
