"""Control class sharing, order and buffer allocation effects for direct inflation."""
import importlib.util
import hashlib
import json
from pathlib import Path
import sys
import urllib.request

REPO = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("zip_validation", REPO / ".github/scripts/validate-zip-backend.py")
common = importlib.util.module_from_spec(spec)
spec.loader.exec_module(common)
OUT, run = common.OUT, common.run
jdk = Path(sys.argv[1]).resolve()
source = OUT / "control-src/java/util/zip/Inflater.java"
source.parent.mkdir(parents=True, exist_ok=True)
source.write_text((REPO / "src/java.base/share/classes/java/util/zip/Inflater.java").read_text())
patch = OUT / "control-classes"
patch.mkdir(exist_ok=True)
run("compile-control-patch", [jdk / "bin/javac", "--patch-module",
    "java.base=" + str(OUT / "control-src"), "-d", patch, source])
deps = OUT / "jmh"
deps.mkdir(exist_ok=True)
for name, (path, digest) in common.DEPS.items():
    target = deps / name
    urllib.request.urlretrieve("https://repo.maven.apache.org/maven2/" + path, target)
    if hashlib.sha256(target.read_bytes()).hexdigest() != digest:
        raise RuntimeError("Dependency digest mismatch: " + name)
cp = ":".join(str(deps / p) for p in common.DEPS)
classes = OUT / "control-benchmark"
classes.mkdir(exist_ok=True)
run("compile-control-benchmark", [jdk / "bin/javac", "-cp", cp, "-processorpath", cp,
    "-d", classes, REPO / "test/micro/org/openjdk/bench/java/util/zip/ZipBufferCalls.java",
    REPO / ".github/diagnostics/ZipBufferPoolCalls.java"])
cp = str(classes) + ":" + cp
jvm_flags = ["-Xms128m", "-Xmx128m", "-Xshare:off", "-XX:+UseSerialGC",
    "-XX:ActiveProcessorCount=2", "-XX:+UseZlibNG", "-XX:+UnlockDiagnosticVMOptions",
    "-XX:-TieredCompilation", "-XX:CompileThreshold=1000", "-Xbatch",
    "--add-opens=java.base/java.nio=ALL-UNNAMED"]
configs = [("original-jni", ["-XX:-UseZipIntrinsics"]),
    ("original-intrinsic", ["-XX:+UseZipIntrinsics"]),
    ("selected-jni", ["-XX:+UseZipIntrinsics", "--patch-module=java.base=" + str(patch)]),
    ("patched-jni-control", ["-XX:-UseZipIntrinsics", "--patch-module=java.base=" + str(patch)])]
rows = []
for passno, ordered in enumerate([configs, list(reversed(configs))]):
    for label, flags in ordered:
        name = "direct-control-" + str(passno) + "-" + label
        result = OUT / (name + ".json")
        run(name, [jdk / "bin/java", "-Djmh.blackhole.mode=FULL_DONTINLINE", "-cp", cp,
            "org.openjdk.jmh.Main", "ZipBufferPoolCalls.inflate$", "-f", "1", "-wi", "3",
            "-i", "5", "-w", "500ms", "-r", "500ms", "-jvm", jdk / "bin/java",
            "-jvmArgsAppend", " ".join(jvm_flags + flags), "-rf", "json", "-rff", result])
        measured = json.loads(result.read_text())
        if len(measured) != 6: raise RuntimeError("Incomplete controlled benchmark")
        for row in measured: row.update(passno=passno, backend=label)
        rows.extend(measured)
        (OUT / "direct-controlled-jmh.json").write_text(json.dumps(rows, indent=2) + "\n")
lines = ["All C2 forks use -Xshare:off; two opposite-order passes; 99.9% intervals retained per pass.",
    "| Pass | Streams | Bytes | Original JNI ns | Original intrinsic ns | Selected JNI ns | Patched JNI control ns |",
    "| --- | ---: | ---: | ---: | ---: | ---: | ---: |"]
for p in [0, 1]:
    for count in ["1", "16"]:
        for size in ["1024", "16384", "65536"]:
            selected = {r["backend"]: r["primaryMetric"] for r in rows if r["passno"] == p and
                r["params"]["contexts"] == count and r["params"]["size"] == size}
            vals = [f'{selected[label]["score"]:.2f} ± {selected[label]["scoreError"]:.2f}' for label, _ in configs]
            lines.append("| " + " | ".join([str(p), count, size] + vals) + " |")
(OUT / "direct-controlled-table.md").write_text("\n".join(lines) + "\n")
print("\n".join(lines), flush=True)
