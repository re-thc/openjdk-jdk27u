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


coding = sources["java/lang/StringCoding.java"]
guard = "        if (len > 0 && ba[off] < 0) {\n            return 0;\n        }\n"
assert coding.count(guard) == 1
coding = coding.replace(guard, "").replace("        return countPositives0(ba, off, len);",
                                          guard + "        return countPositives0(ba, off, len);")
compile_patch("prefix", {"java/lang/StringCoding.java": coding})
testclasses = output / "tests"
testclasses.mkdir()
subprocess.run([str(head / "bin/javac"), "--add-exports", "java.base/jdk.internal.util=ALL-UNNAMED",
                "-d", str(testclasses), "test/hotspot/jtreg/compiler/intrinsics/simdutf/SimdUTFTest.java"], check=True)
tiers = {"interp": ["-Xint"], "c1": ["-Xbatch", "-XX:TieredStopAtLevel=1"],
         "c2": ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"]}
common = ["-XX:+UseSerialGC", "-Xms1g", "-Xmx1g", "-XX:ActiveProcessorCount=2"]
for name in ("prefix",):
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
print("GATE_METADATA", json.dumps({"arch": platform.machine(), "cpu": cpu,
      "base": "02324e6bd026411407983df06284cd79460c33f6",
      "head": "476da17dc22e68cd0d5b28221d662514468ddbf7",
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
    print("GATE_START", label, flush=True)
    with (output / (label + ".log")).open("w") as log:
        run = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT)
    if run.returncode:
        print((output / (label + ".log")).read_text()[-12000:], flush=True)
        raise SystemExit(run.returncode)
    samples = json.loads(result.read_text())
    assert samples and all(s["primaryMetric"].get("rawData") for s in samples)
    for sample in samples:
        p = sample["primaryMetric"]
        print("GATE_RESULT", json.dumps({"study": study, "mode": mode, "tier": tier,
              "method": sample["benchmark"].rsplit(".", 1)[1], "size": int(sample["params"]["size"]),
              "ns": p["score"], "ci": p["scoreConfidence"],
              "bytes": sample["secondaryMetrics"]["gc.alloc.rate.norm"]["score"]}), flush=True)


for tier in tiers:
    for mode in ("base", "off", "on", "prefix", "prefix-off"):
        measure("malformed", mode, tier, "malformedCharsetDecode", "128,4096")
        measure("ascii", mode, tier, "asciiDecode|asciiCharsetDecode", "31,4096")
        measure("valid", mode, tier, "charsetDecodeTight", "255,4096")

print("GATE_COMPLETE", flush=True)

# Capture C1 inlining decisions and sampled stacks for the malformed-input path.
for mode in ("base", "on", "prefix"):
    java, extra = options(mode)
    recording = output / ("c1-profile-" + mode + ".jfr")
    logfile = output / ("c1-profile-" + mode + ".log")
    args = [*common, *tiers["c1"], *extra, "-XX:+UnlockDiagnosticVMOptions",
            "-XX:+PrintInlining", "-XX:+DebugNonSafepoints",
            "-XX:StartFlightRecording=filename=" + str(recording) + ",settings=profile,dumponexit=true"]
    command = [str(java), "-cp", classpath, "org.openjdk.jmh.Main",
               "org.openjdk.bench.java.lang.SimdUTF.malformedCharsetDecode$",
               "-p", "size=4096", "-f", "1", "-wi", "3", "-i", "5",
               "-w", "1s", "-r", "1s", "-t", "1", "-jvm", str(java),
               "-jvmArgs", " ".join(args)]
    with logfile.open("w") as log:
        subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
    print("C1_INLINING", mode, json.dumps([line.strip() for line in logfile.read_text().splitlines()
          if "StringCoding::countPositives" in line or "StringLatin1::inflate" in line][-60:]), flush=True)
    profile = output / ("c1-profile-" + mode + ".json")
    with profile.open("w") as f:
        subprocess.run([str(head / "bin/jfr"), "print", "--json", "--events",
                        "jdk.ExecutionSample,jdk.NativeMethodSample", str(recording)], stdout=f, check=True)
    from collections import Counter
    leaves, ancestors = Counter(), Counter()
    total = 0
    for event in json.loads(profile.read_text())["recording"]["events"]:
        frames = (event["values"].get("stackTrace") or {}).get("frames") or []
        names = [frame["method"]["type"]["name"] + "::" + frame["method"]["name"] for frame in frames]
        if not any("org/openjdk/bench/java/lang/SimdUTF" in name or
                   "org.openjdk.bench.java.lang.SimdUTF" in name for name in names):
            continue
        total += 1
        if names:
            leaves[names[0]] += 1
        ancestors.update(set(names))
    print("C1_PROFILE", json.dumps({"mode": mode, "samples": total,
          "leaves": leaves.most_common(12), "ancestors": ancestors.most_common(20)}), flush=True)
