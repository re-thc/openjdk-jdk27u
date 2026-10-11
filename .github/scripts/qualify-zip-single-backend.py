"""Qualify one ZIP backend and compare it with an upstream stock-zlib image."""
import hashlib
import json
import os
from pathlib import Path
import re
import sys
import urllib.request
import importlib.util

ROOT = Path.cwd()
OUT = ROOT / "validation/results"
OUT.mkdir(parents=True, exist_ok=True)
spec = importlib.util.spec_from_file_location("common", ROOT / ".github/scripts/validate-zip-backend.py")
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
run = common.run
CRC32C_CONTROL = '''package org.openjdk.bench.java.util.zip;
import java.util.Random;
import java.util.concurrent.TimeUnit;
import java.util.zip.CRC32C;
import org.openjdk.jmh.annotations.*;
@State(Scope.Thread)
@BenchmarkMode(Mode.AverageTime)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
public class CRC32CControl {
    @Param({"64", "1024", "65536"}) public int size;
    private byte[] input;
    private CRC32C crc;
    @Setup public void setup() {
        input = new byte[size];
        new Random(12345).nextBytes(input);
        crc = new CRC32C();
    }
    @Benchmark public long update() {
        crc.reset();
        crc.update(input);
        return crc.getValue();
    }
}'''

def defaults(jdk, baseline_jdk):
    deps = OUT / "jmh"
    deps.mkdir(exist_ok=True)
    for name, (path, digest) in common.DEPS.items():
        target = deps / name
        urllib.request.urlretrieve("https://repo.maven.apache.org/maven2/" + path, target)
        if hashlib.sha256(target.read_bytes()).hexdigest() != digest: raise RuntimeError("JMH digest")
    classes = deps / "classes"
    classes.mkdir(exist_ok=True)
    cp = os.pathsep.join(str(deps / p) for p in common.DEPS)
    sources = [ROOT / "test/micro/org/openjdk/bench/java/util/zip" / f for f in ["ZipBackend.java", "ZipBufferCalls.java", "ZipStreamCalls.java"]]
    control = deps / "CRC32CControl.java"
    control.write_text(CRC32C_CONTROL)
    sources.append(control)
    run("compile-default-bench", [jdk / "bin/javac", "-cp", cp, "-processorpath", cp, "-d", classes] + sources)
    cp = str(classes) + os.pathsep + cp
    sizes = deps / "ZipSizes.java"
    sizes.write_text('''import org.openjdk.bench.java.util.zip.ZipBackend;
public class ZipSizes {
  public static void main(String[] args) throws Exception {
    var field = ZipBackend.class.getDeclaredField("compressedLength");
    field.setAccessible(true);
    for (String data : new String[]{"text", "random"}) {
      for (int size : new int[]{64, 1024, 65536}) {
        ZipBackend b = new ZipBackend();
        b.data = data; b.size = size; b.setup();
        System.out.println(data + "," + size + "," + field.getInt(b));
        b.tearDown();
      }
    }
  }
}''')
    run("compile-sizes", [jdk / "bin/javac", "-cp", cp, "-d", classes, sizes])
    for label, target, extra in [("baseline", baseline_jdk, []), ("ng", jdk, [])]:
        output = run("compressed-size-" + label, [target / "bin/java"] + extra +
                     ["-cp", cp, "ZipSizes"])
        print("COMPRESSED SIZES", label, output, flush=True)
    rows = []
    for tier, flags in [("int", ["-Xint"]), ("c1", ["-Xbatch", "-XX:TieredStopAtLevel=1"]),
                        ("c2", ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=1000"])]:
        for label, target, extra in [("baseline", baseline_jdk, []),
                                     ("jni", jdk, ["-XX:-UseZipIntrinsics"]),
                                     ("intrinsic", jdk, ["-XX:+UseZipIntrinsics"])]:
            for group, pattern, params in [
                ("heap", "ZipBackend.(deflate|inflate)$", ["-p", "data=text", "-p", "size=64,1024,65536"]),
                ("checksums", "ZipBackend.(adler32|crc32)$", ["-p", "data=text", "-p", "size=64,1024,65536"]),
                ("crc32c-control", "CRC32CControl.update$", ["-p", "size=64,1024,65536"]),
                ("buffers", "ZipBufferCalls.inflate$", ["-p", "input=heap,direct", "-p", "output=heap,direct",
                                                        "-p", "size=64,65536"]),
                ("streams", "ZipStreamCalls.(zip|gzip)$", ["-p", "size=64,1024,65536", "-p", "chunk=64,4096"])]:
                name = tier + "-" + label + "-" + group
                result = OUT / (name + ".json")
                run(name, [target / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE", "-cp", cp, "org.openjdk.jmh.Main",
                           pattern] + params + ["-f", "2", "-wi", "2", "-i", "4", "-w", "500ms", "-r", "500ms",
                           "-jvm", target / "bin/java", "-jvmArgsAppend",
                           " ".join(([]) + ["-Xshare:off", "-Xms128m", "-Xmx128m", "-XX:+UseSerialGC", "-XX:ActiveProcessorCount=2"] + flags + extra),
                           "-rf", "json", "-rff", result])
                for row in json.loads(result.read_text()):
                    row.update(tier=tier, config=label)
                    rows.append(row)
    for tier, flags in [("int", ["-Xint"]), ("c1", ["-Xbatch", "-XX:TieredStopAtLevel=1"]),
                        ("c2", ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=1000"])]:
        name = tier + "-native-checksums"
        result = OUT / (name + ".json")
        options = ["-Xshare:off", "-Xms128m", "-Xmx128m", "-XX:+UseSerialGC",
                   "-XX:ActiveProcessorCount=2", "-XX:+UnlockDiagnosticVMOptions",
                   "-XX:-UseAdler32Intrinsics", "-XX:-UseCRC32Intrinsics"] + flags
        run(name, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE", "-cp", cp,
                   "org.openjdk.jmh.Main", "ZipBackend.(adler32|crc32)$", "-p", "data=text",
                   "-p", "size=64,1024,65536", "-f", "2", "-wi", "2", "-i", "4",
                   "-w", "500ms", "-r", "500ms", "-jvm", jdk / "bin/java",
                   "-jvmArgsAppend", " ".join(options), "-rf", "json", "-rff", result])
        for row in json.loads(result.read_text()):
            row.update(tier=tier, config="native-checksums")
            rows.append(row)
    (OUT / "defaults-jmh.json").write_text(json.dumps(rows, indent=2))
    print("DEFAULT QUALIFICATION: ns/op +/- JMH 99.9% CI; two forks, 2x0.5s warmup, 4x0.5s measurement")
    for row in rows:
        print(row["tier"], row["config"], row["benchmark"].split(".")[-1], row["params"],
              round(row["primaryMetric"]["score"], 2), round(row["primaryMetric"]["scoreError"], 2), flush=True)
    # Require confidence intervals to exclude equality before rejecting a
    # slowdown. Preserve raw measurements and the full report on failure.
    def key(row):
        return (row["tier"], row["benchmark"], tuple(sorted(row["params"].items())))
    baseline = {key(row): row for row in rows if row["config"] == "jni"}
    regressions = []
    for row in rows:
        if row["config"] != "intrinsic":
            continue
        before = baseline[key(row)]["primaryMetric"]
        after = row["primaryMetric"]
        ratio = after["score"] / before["score"]
        if ratio > 1.02 and after["score"] - after["scoreError"] > before["score"] + before["scoreError"]:
            regressions.append((row["tier"], row["benchmark"], row["params"], round(ratio, 3)))
    confirmed = []
    for index, (tier, benchmark, params, ratio) in enumerate(regressions):
        # Confirm on the same host in both orders; configurations are otherwise
        # separated by several minutes in the broad discovery matrix.
        flags = dict([("int", ["-Xint"]), ("c1", ["-Xbatch", "-XX:TieredStopAtLevel=1"]),
                      ("c2", ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=1000"])])[tier]
        parameter_args = [arg for key, value in sorted(params.items()) for arg in ["-p", key + "=" + value]]
        evidence = []
        for order in range(2):
            metrics = {}
            labels = ["jni", "intrinsic"] if order == 0 else ["intrinsic", "jni"]
            for label in labels:
                target = jdk
                name = f"confirmation-{index}-{order}-{label}"
                result = OUT / (name + ".json")
                extra = ["-XX:-UseZipIntrinsics"] if label == "jni" else ["-XX:+UseZipIntrinsics"]
                options = [ "-Xshare:off", "-Xms128m", "-Xmx128m", "-XX:+UseSerialGC", "-XX:ActiveProcessorCount=2"] + flags + extra
                run(name, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE", "-cp", cp, "org.openjdk.jmh.Main",
                           "^" + re.escape(benchmark) + "$"] + parameter_args + ["-f", "3", "-wi", "3", "-i", "6", "-w", "500ms", "-r", "500ms",
                           "-jvm", jdk / "bin/java", "-jvmArgsAppend", " ".join(options), "-rf", "json", "-rff", result])
                group = json.loads(result.read_text())
                if len(group) != 1:
                    raise RuntimeError("Missing confirmation result")
                metrics[label] = group[0]["primaryMetric"]
            before = metrics["jni"]
            after = metrics["intrinsic"]
            paired_ratio = after["score"] / before["score"]
            significant = after["score"] - after["scoreError"] > before["score"] + before["scoreError"]
            evidence.append(paired_ratio > 1.02 and significant)
            print("CONFIRMATION", tier, benchmark, params, order, paired_ratio, significant, flush=True)
        if all(evidence):
            confirmed.append((tier, benchmark, params, ratio))
    if confirmed:
        raise RuntimeError("Confirmed default-path slowdowns above 2%: " + repr(confirmed))
    print("Default-path performance check passed: no confirmed significant slowdowns above 2%", flush=True)

if __name__ == "__main__":
    defaults(Path(sys.argv[1]).resolve(), Path(sys.argv[2]).resolve())
