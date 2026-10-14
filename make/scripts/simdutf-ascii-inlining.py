import json
import os
from pathlib import Path
import platform
import subprocess
import sys

head, base, output = map(Path, sys.argv[1:])
output.mkdir(exist_ok=True)
root = Path("src/java.base/share/classes")
constants = json.loads("{\"ascii\":\"private static int countPositives0(byte[] ba, int off, int len) {\\n        int limit = off + len;\\n        for (int i = off; i < limit; i++) {\\n            if (ba[i] < 0) {\\n                return i - off;\\n            }\\n        }\\n        return len;\\n    }\",\"b64encode\":\"private void encodeBlock(byte[] src, int sp, int sl, byte[] dst, int dp, boolean isURL) {\\n            char[] base64 = isURL ? toBase64URL : toBase64;\\n            for (int sp0 = sp, dp0 = dp ; sp0 < sl; ) {\\n                int bits = (src[sp0++] & 0xff) << 16 |\\n                           (src[sp0++] & 0xff) <<  8 |\\n                           (src[sp0++] & 0xff);\\n                dst[dp0++] = (byte)base64[(bits >>> 18) & 0x3f];\\n                dst[dp0++] = (byte)base64[(bits >>> 12) & 0x3f];\\n                dst[dp0++] = (byte)base64[(bits >>> 6)  & 0x3f];\\n                dst[dp0++] = (byte)base64[bits & 0x3f];\\n            }\\n        }\",\"b64decode\":\"private int decodeBlock(byte[] src, int sp, int sl, byte[] dst, int dp, boolean isURL, boolean isMIME) {\\n            int[] base64 = isURL ? fromBase64URL : fromBase64;\\n            int sl0 = sp + ((sl - sp) & ~0b11);\\n            int new_dp = dp;\\n            while (sp < sl0) {\\n                int b1 = base64[src[sp++] & 0xff];\\n                int b2 = base64[src[sp++] & 0xff];\\n                int b3 = base64[src[sp++] & 0xff];\\n                int b4 = base64[src[sp++] & 0xff];\\n                if ((b1 | b2 | b3 | b4) < 0) {    // non base64 byte\\n                    return new_dp - dp;\\n                }\\n                int bits0 = b1 << 18 | b2 << 12 | b3 << 6 | b4;\\n                dst[new_dp++] = (byte)(bits0 >> 16);\\n                dst[new_dp++] = (byte)(bits0 >>  8);\\n                dst[new_dp++] = (byte)(bits0);\\n            }\\n            return new_dp - dp;\\n        }\"}")
sources = {name: (root / name).read_text() for name in
    ("jdk/internal/util/SimdUTF.java", "java/lang/StringUTF16.java", "java/lang/Character.java",
     "java/lang/StringCoding.java", "java/lang/StringLatin1.java", "sun/nio/cs/UTF_8.java", "java/util/Base64.java")}

def method(source, needle):
    start = source.index(needle)
    brace = source.index("{", start)
    depth, end = 1, brace + 1
    while depth:
        depth += (source[end] == "{") - (source[end] == "}")
        end += 1
    return start, end

def replace_method(source, needle, replacement):
    start, end = method(source, needle)
    return source[:start] + replacement + source[end:]

patches = {}
def compile_patch(name, changed):
    directory = output / ("src-" + name)
    classes = output / ("patch-" + name)
    files = []
    for path, text in changed.items():
        file = directory / path
        file.parent.mkdir(parents=True, exist_ok=True)
        file.write_text(text)
        files.append(str(file))
    classes.mkdir()
    subprocess.run([str(head / "bin/javac"), "--patch-module", "java.base=" + str(directory),
                    "-d", str(classes), *files], check=True)
    patches[name] = ["--patch-module=java.base=" + str(classes)]


s = sources["java/lang/StringCoding.java"]
needle = "    @IntrinsicCandidate\n    private static int countPositives0("
assert needle in s
s = s.replace("import jdk.internal.vm.annotation.IntrinsicCandidate;",
              "import jdk.internal.vm.annotation.ForceInline;\nimport jdk.internal.vm.annotation.IntrinsicCandidate;")
s = s.replace(needle, "    @ForceInline\n" + needle)
compile_patch("force", {"java/lang/StringCoding.java": s})
testclasses = output / "tests"
testclasses.mkdir()
subprocess.run([str(head / "bin/javac"), "--add-exports", "java.base/jdk.internal.util=ALL-UNNAMED",
                "-d", str(testclasses), "test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java"], check=True)
tiers = {"c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"],
         "c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"]}
common = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2"]
for name in ("force",):
    for tier, flags in tiers.items():
        subprocess.run([str(head / "bin/java"), *patches[name],
                        "--add-exports", "java.base/jdk.internal.util=ALL-UNNAMED",
                        "--add-opens", "java.base/jdk.internal.util=ALL-UNNAMED",
                        *common, *flags, "-cp", str(testclasses), "SimdUTFTest"], check=True)

classpath = "jmh/core.jar:jmh/generator.jar:jmh/options.jar:jmh/math.jar"
classes, generated = output / "classes", output / "generated"
classes.mkdir()
generated.mkdir()
subprocess.run([str(head / "bin/javac"), "-cp", classpath, "-processorpath", classpath,
                "-d", str(classes), "-s", str(generated), "test/micro/org/openjdk/bench/java/lang/SimdUTF.java"], check=True)
classpath = str(classes) + os.pathsep + classpath
cpu = min(os.sched_getaffinity(0))
os.sched_setaffinity(0, {cpu})
print("FORCE_METADATA", json.dumps({"arch": platform.machine(), "cpu": cpu,
      "base": "6d264328aefdc3ceff659360ead6567a8e36190c",
      "head": "6473e580c7dd5aeef99f3397793ab952c8f72433",
      "candidate_source": "module patches recorded in artifacts"}), flush=True)

def options(mode):
    java = (base if mode == "base" else head) / "bin/java"
    extra = ["-XX:-UseSIMDUTFIntrinsics"] if mode == "off" or mode.endswith("-off") else []
    patch = mode.removesuffix("-off")
    if patch in patches:
        extra += patches[patch]
    return java, extra

def measure(study, mode, tier, methods, sizes, strong=False):
    java, extra = options(mode)
    label = "-".join((study, mode, tier))
    result = output / (label + ".json")
    timing = ["-f", "2", "-wi", "3", "-i", "4", "-w", "300ms", "-r", "300ms"]
    command = [str(java), "-cp", classpath, "org.openjdk.jmh.Main",
               "org.openjdk.bench.java.lang.SimdUTF.(" + methods + ")$", "-p", "size=" + sizes,
               *timing, "-t", "1", "-prof", "gc", "-jvm", str(java),
               "-jvmArgs", " ".join([*common, *tiers[tier], *extra]),
               "-rf", "json", "-rff", str(result)]
    print("FORCE_START", label, flush=True)
    with (output / (label + ".log")).open("w") as log:
        run = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
    if run.returncode:
        print((output / (label + ".log")).read_text()[-12000:], flush=True)
        raise SystemExit(run.returncode)
    samples = json.loads(result.read_text())
    assert samples and all(s["primaryMetric"].get("rawData") for s in samples)
    for sample in samples:
        p = sample["primaryMetric"]
        print("FORCE_RESULT", json.dumps({"study": study, "mode": mode, "tier": tier,
              "method": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
              "ns": p["score"], "ci": p["scoreConfidence"],
              "bytes": sample["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}), flush=True)


for tier in tiers:
    for mode in ("base", "off", "on", "force", "force-off"):
        measure("malformed", mode, tier, "malformedCharsetDecode", "128,4096")
        measure("ascii", mode, tier, "asciiDecode|asciiCharsetDecode", "31,32,4096")
print("FORCE_COMPLETE", flush=True)
