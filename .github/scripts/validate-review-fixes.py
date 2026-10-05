"""Validate review fixes and report real-corpus speed/size tradeoffs."""
import csv
import hashlib
import io
import json
import os
from pathlib import Path
import subprocess
import sys
import tarfile
import urllib.request
import importlib.util

ROOT = Path.cwd()
OUT = ROOT / "validation/results"
OUT.mkdir(parents=True, exist_ok=True)
spec = importlib.util.spec_from_file_location("common", ROOT / ".github/scripts/validate-zip-backend.py")
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
run = common.run

def native():
    area = ROOT / "validation/native"
    area.mkdir(parents=True, exist_ok=True)
    stock = ROOT / "src/java.base/share/native/libzip/zlib"
    objs = []
    for src in sorted(stock.glob("*.c")):
        if src.name.startswith("gz"): continue
        obj = area / (src.stem + ".o")
        run("stock-" + src.stem, ["gcc-14", "-O2", "-fPIC", "-DZ_HAVE_UNISTD_H", "-I", stock, "-c", src, "-o", obj])
        objs.append(obj)
    run("stock-archive", ["ar", "rcs", area / "stock.a"] + objs)
    ng = area / "ng"
    ng.mkdir(exist_ok=True)
    env = os.environ.copy()
    env.update(CC="gcc-14", AR="ar", CFLAGS="-O2 -fPIC")
    subprocess.run(["bash", str(ROOT / "src/java.base/share/native/libzip/zlib-ng/configure"),
                    "--static", "--zlib-compat", "--sprefix=jdk_ng_"], cwd=ng, env=env, check=True,
                   stdout=(OUT / "native-ng-configure.log").open("w"), stderr=subprocess.STDOUT)
    run("native-ng-build", ["make", "-j4", "libz.a"], ng)
    archive = area / "libdeflate.tar.gz"
    urllib.request.urlretrieve("https://codeload.github.com/ebiggers/libdeflate/tar.gz/refs/tags/v1.26", archive)
    if hashlib.sha256(archive.read_bytes()).hexdigest() != "bba03fffc5538576213675ce6968fcff6ce2e67d82e4d5febea2d05f9f13cf85":
        raise RuntimeError("libdeflate archive checksum")
    with tarfile.open(archive) as tf: tf.extractall(area, filter="data")
    ld = area / "libdeflate-1.26"
    run("ld-configure", ["cmake", "-S", ld, "-B", area / "ld", "-DCMAKE_BUILD_TYPE=Release",
         "-DCMAKE_C_FLAGS_RELEASE=-O2 -DNDEBUG", "-DLIBDEFLATE_BUILD_SHARED_LIB=OFF"])
    run("ld-build", ["cmake", "--build", area / "ld", "-j4"])
    exe = area / "compare"
    run("native-compile", ["gcc-14", "-O2", "-I", stock, "-I", ld,
        ROOT / "test/micro/native/zip/CompareBackends.c", area / "stock.a", ng / "libz.a",
        area / "ld/libdeflate.a", "-o", exe])
    patterns = {
        "java": "src/java.base/share/classes/java/util/*.java",
        "hotspot": "src/hotspot/share/runtime/*.cpp",
        "documentation": "doc/*.md",
    }
    rows = []
    manifest = {}
    for name, pattern in patterns.items():
        files = sorted(ROOT.glob(pattern))
        corpus = b"".join(p.read_bytes() for p in files)
        if not corpus: raise RuntimeError("Empty corpus " + name)
        file = area / (name + ".bin")
        file.write_bytes(corpus)
        manifest[name] = {"bytes": len(corpus), "sha256": hashlib.sha256(corpus).hexdigest(),
                         "files": {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest() for p in files}}
        for level in [1, 3, 6, 9]:
            for batch in range(3):
                output = run("native-" + name + "-" + str(level) + "-" + str(batch), [exe, file, str(level)])
                for row in csv.DictReader(io.StringIO(output)):
                    row.update(corpus=name, batch=batch)
                    rows.append(row)
    (OUT / "corpora.json").write_text(json.dumps(manifest, indent=2))
    with (OUT / "real-corpora.csv").open("w") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    import statistics
    print("CORPUS TABLE: whole-file inputs; median of three batches; all libraries -O2")
    print("corpus,bytes,level,library,compress_us,same_input_inflate_us,compressed_bytes")
    for name, info in manifest.items():
        for level in [1, 3, 6, 9]:
            for backend in ["zlib", "zlib-ng", "libdeflate"]:
                group = [r for r in rows if r["corpus"] == name and int(r["size"]) == info["bytes"]
                         and int(r["level"]) == level and r["library"] == backend]
                print(",".join(map(str, [name, info["bytes"], level, backend,
                    round(statistics.median(float(r["deflate_ns"]) for r in group) / 1000, 2),
                    round(statistics.median(float(r["inflate_ns"]) for r in group) / 1000, 2),
                    int(group[0]["compressed_bytes"])])), flush=True)

def defaults(jdk):
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
    run("compile-default-bench", [jdk / "bin/javac", "-cp", cp, "-processorpath", cp, "-d", classes] + sources)
    cp = str(classes) + os.pathsep + cp
    rows = []
    for tier, flags in [("int", ["-Xint"]), ("c1", ["-Xbatch", "-XX:TieredStopAtLevel=1"]),
                        ("c2", ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=1000"])]:
        for label, extra in [("stock-jni", ["-XX:-UseZlibNG", "-XX:+UnlockDiagnosticVMOptions", "-XX:-UseZipIntrinsics"]),
                             ("stock-intrinsic", ["-XX:-UseZlibNG"]),
                             ("ng-intrinsic", ["-XX:+UseZlibNG"])]:
            for group, pattern, params in [
                ("heap", "ZipBackend.(deflate|inflate|adler32)$", ["-p", "data=text", "-p", "size=64,1024,65536"]),
                ("buffers", "ZipBufferCalls.inflate$", ["-p", "input=heap,direct", "-p", "output=heap,direct",
                                                        "-p", "size=64,65536"]),
                ("streams", "ZipStreamCalls.(zip|gzip)$", ["-p", "size=64,1024,65536", "-p", "chunk=64,4096"])]:
                name = tier + "-" + label + "-" + group
                result = OUT / (name + ".json")
                run(name, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE", "-cp", cp, "org.openjdk.jmh.Main",
                           pattern] + params + ["-f", "2", "-wi", "2", "-i", "4", "-w", "500ms", "-r", "500ms",
                           "-jvm", jdk / "bin/java", "-jvmArgsAppend",
                           " ".join((["-XX:+UnlockDiagnosticVMOptions", "-XX:-UseAdler32Intrinsics"] if label == "stock-jni" and tier != "c2" else []) + ["-Xshare:off", "-Xms128m", "-Xmx128m", "-XX:+UseSerialGC", "-XX:ActiveProcessorCount=2"] + flags + extra),
                           "-rf", "json", "-rff", result])
                for row in json.loads(result.read_text()):
                    row.update(tier=tier, config=label)
                    rows.append(row)
    (OUT / "defaults-jmh.json").write_text(json.dumps(rows, indent=2))
    print("DEFAULT QUALIFICATION: ns/op +/- JMH 99.9% CI; two forks, 2x0.5s warmup, 4x0.5s measurement")
    for row in rows:
        print(row["tier"], row["config"], row["benchmark"].split(".")[-1], row["params"],
              round(row["primaryMetric"]["score"], 2), round(row["primaryMetric"]["scoreError"], 2), flush=True)

if __name__ == "__main__":
    if sys.argv[1] == "native": native()
    elif sys.argv[1] == "defaults": defaults(Path(sys.argv[2]).resolve())
