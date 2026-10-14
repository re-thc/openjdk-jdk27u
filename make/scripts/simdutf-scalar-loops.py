import json
import os
from pathlib import Path
import platform
import subprocess
import sys

head, base, output = map(Path, sys.argv[1:])
root = Path("src/java.base/share/classes")
sources = {p: (root / p).read_text() for p in ("java/lang/StringUTF16.java",
           "java/lang/Character.java", "java/lang/StringLatin1.java")}
def replace_method(source, needle, replacement):
    start = source.index(needle)
    brace = source.index("{", start)
    depth, end = 1, brace + 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return source[:start] + replacement + source[end:]
vector_string = """private static int codePointCount(byte[] value, int beginIndex, int endIndex, boolean checked) {
        assert beginIndex <= endIndex;
        if (checked && beginIndex < endIndex) {
            checkBoundsBeginEnd(beginIndex, endIndex, value);
        }
        int count = endIndex - beginIndex;
        if (count <= 1) {
            return count;
        }
        for (int i = beginIndex + 1; i < endIndex; i++) {
            int pair = ((getChar(value, i - 1) >>> 10) ^ 0x36)
                    | ((getChar(value, i) >>> 10) ^ 0x37);
            count -= (pair - 1) >>> 31;
        }
        return count;
    }"""
vector_chars = """static int codePointCountImpl(char[] a, int offset, int count) {
        if (count <= 1) {
            return count;
        }
        int endIndex = offset + count;
        int n = count;
        for (int i = offset + 1; i < endIndex; i++) {
            int pair = ((a[i - 1] >>> 10) ^ 0x36) | ((a[i] >>> 10) ^ 0x37);
            n -= (pair - 1) >>> 31;
        }
        return n;
    }"""
patches = {}
def compile_patch(name, changed):
    source_dir, classes = output / ("src-" + name), output / ("patch-" + name)
    files = []
    for path, text in changed.items():
        file = source_dir / path
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(text)
        files.append(str(file))
    classes.mkdir()
    subprocess.run([str(head / "bin/javac"), "--patch-module", "java.base=" + str(source_dir),
                    "-d", str(classes), *files], check=True)
    patches[name] = ["--patch-module=java.base=" + str(classes)]
compile_patch("vector-count", {
    "java/lang/StringUTF16.java": replace_method(sources["java/lang/StringUTF16.java"],
        "private static int codePointCount(byte[] value", vector_string),
    "java/lang/Character.java": replace_method(sources["java/lang/Character.java"],
        "static int codePointCountImpl(", vector_chars)})
s = sources["java/lang/StringLatin1.java"]
needle = "        if (SimdUTF.isEligible(len) && SimdUTF.inflateLatin1("
assert s.count(needle) == 2
compile_patch("empty-inflate", {"java/lang/StringLatin1.java": s.replace(needle,
    "        if (len == 0) {\n            return;\n        }\n" + needle)})
test = output / "CountOracle.java"
test.write_text("""import java.util.Random;
public class CountOracle {
    static int expected(char[] a, int offset, int length) {
        int n = length, end = offset + length;
        for (int i = offset; i < end; i++) {
            if (Character.isHighSurrogate(a[i]) && i + 1 < end && Character.isLowSurrogate(a[i + 1])) {
                n--; i++;
            }
        }
        return n;
    }
    public static void main(String[] args) {
        Random r = new Random(833791);
        for (int trial = 0; trial < 10000; trial++) {
            char[] a = new char[r.nextInt(128)];
            for (int i = 0; i < a.length; i++) {
                a[i] = switch(r.nextInt(4)) {
                    case 0 -> (char)(0xd800 + r.nextInt(1024));
                    case 1 -> (char)(0xdc00 + r.nextInt(1024));
                    default -> (char)r.nextInt(0x10000);
                };
            }
            String s = new String(a);
            int offset = r.nextInt(a.length + 1);
            int length = r.nextInt(a.length - offset + 1);
            int n = expected(a, offset, length);
            if (Character.codePointCount(a, offset, length) != n || s.codePointCount(offset, offset + length) != n
                    || Character.codePointCount(new StringBuilder(s), offset, offset + length) != n
                    || Character.codePointCount(new StringBuffer(s), offset, offset + length) != n) {
                throw new AssertionError("trial " + trial);
            }
        }
        System.out.println("COUNT_ORACLE_PASS");
    }
}
""")
testclasses = output / "tests"
testclasses.mkdir()
subprocess.run([str(head / "bin/javac"), "-d", str(testclasses), str(test)], check=True)
tiers = {"interp": ["-Xint"], "c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"],
         "c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"]}
common = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2"]
for tier, flags in tiers.items():
    subprocess.run([str(head / "bin/java"), *common, *flags, *patches["vector-count"],
                    "-cp", str(testclasses), "CountOracle"], check=True)
cp = "jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated = output / "classes", output / "generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(head / "bin/javac"), "-cp", cp, "-processorpath", cp, "-d", str(classes),
                "-s", str(generated), "test/micro/org/openjdk/bench/java/lang/SimdUTF.java"], check=True)
cp = str(classes) + os.pathsep + cp
cpu = min(os.sched_getaffinity(0))
os.sched_setaffinity(0, {cpu})
print("SCALAR_METADATA", json.dumps({"arch": platform.machine(), "cpu": cpu,
      "base": "6d264328aefdc3ceff659360ead6567a8e36190c",
      "head": "6473e580c7dd5aeef99f3397793ab952c8f72433"}), flush=True)
def measure(study, mode, tier, methods, sizes):
    java = (base if mode == "base" else head) / "bin/java"
    extra = ["-XX:-UseSIMDUTFIntrinsics"] if mode == "off" or mode.endswith("-off") else []
    patch = mode.removesuffix("-off")
    if patch in patches: extra += patches[patch]
    label = "-".join((study, mode, tier))
    result = output / (label + ".json")
    command = [str(java), "-cp", cp, "org.openjdk.jmh.Main",
               "org.openjdk.bench.java.lang.SimdUTF.(" + methods + ")$", "-p", "size=" + sizes,
               "-f", "3", "-wi", "5", "-i", "5", "-w", "500ms", "-r", "500ms", "-t", "1", "-prof", "gc",
               "-jvm", str(java), "-jvmArgs", " ".join([*common, *tiers[tier], *extra]),
               "-rf", "json", "-rff", str(result)]
    with (output / (label + ".log")).open("w") as log:
        p = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
    if p.returncode:
        print((output / (label + ".log")).read_text()[-12000:], flush=True)
        raise SystemExit(p.returncode)
    for sample in json.loads(result.read_text()):
        m = sample["primaryMetric"]
        print("SCALAR_RESULT", json.dumps({"study": study, "mode": mode, "tier": tier,
              "method": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
              "ns": m["score"], "ci": m["scoreConfidence"]}), flush=True)
for mode in ("base", "off", "on", "vector-count"):
    measure("count", mode, "c2", "codePointCount|charArrayCodePointCount", "128,256,512,1024,4096")
for tier in tiers:
    for mode in ("base", "off", "on", "empty-inflate", "empty-inflate-off"):
        measure("malformed", mode, tier, "malformedCharsetDecode", "128,4096,1048577")
for mode in ("base", "on", "vector-count"):
    java = (base if mode == "base" else head) / "bin/java"
    extra = patches.get(mode, [])
    command = [str(java), "-cp", cp, "org.openjdk.jmh.Main", "org.openjdk.bench.java.lang.SimdUTF.codePointCount$",
       "-p", "size=128", "-f", "1", "-wi", "3", "-i", "1", "-w", "300ms", "-r", "100ms", "-jvm", str(java),
       "-jvmArgs", " ".join([*common, *tiers["c2"], *extra, "-XX:+UnlockDiagnosticVMOptions",
       "-XX:CompileCommand=print,org.openjdk.bench.java.lang.jmh_generated.SimdUTF_codePointCount_jmhTest::*"])]
    label = "assembly-count-" + mode
    file = output / (label + ".log")
    with file.open("w") as log:
        subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
    text = file.read_text()
    blocks = text.split("Compiled method (c2)")[1:]
    for block in blocks[-4:]:
        if "codePointCount_avgt_jmhStub" in block:
            print("SCALAR_ASSEMBLY_BEGIN", mode, flush=True)
            print("Compiled method (c2)" + block[:40000], flush=True)
            print("SCALAR_ASSEMBLY_END", mode, flush=True)
print("SCALAR_COMPLETE", flush=True)
