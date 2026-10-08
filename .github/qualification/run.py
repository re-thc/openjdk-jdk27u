import hashlib, json, os, subprocess, sys
from pathlib import Path
root = Path.cwd()
output = root / "qualification"
output.mkdir(exist_ok=True)
script_dir = Path(__file__).resolve().parent
release, debug, jtreg, native = map(Path, sys.argv[1:5])
vm = ["-XX:ActiveProcessorCount=1", "-XX:CICompilerCount=2", "-XX:+UseSerialGC", "-XX:-UsePerfData", "-XX:+DisableAttachMechanism", "-Xrs", "-Xms32m", "-Xmx256m", "-Dseed=42"]
results = []
def run(name, image, tests, extra=[]):
    command = [str(release / "bin/java"), "-Xint"] + vm + ["-jar", str(jtreg / "lib/jtreg.jar"), "-jdk:" + str(image), "-othervm", "-conc:1", "-timeoutFactor:4", "-nativepath:" + str(native), "-vmoptions:" + " ".join(vm + extra), "-w:" + str(output / (name + "-work")), "-r:" + str(output / (name + "-report"))] + tests
    print(name + " running", flush=True)
    with (output / (name + ".log")).open("w") as log:
        code = subprocess.run(command, stdout=log, stderr=subprocess.STDOUT).returncode
    summary = output / (name + "-report/text/summary.txt")
    text = summary.read_text() if summary.exists() else ""
    results.append(dict(selection=name, exit_code=code, summary=text, command=command))
    (output / "jtreg.json").write_text(json.dumps(results, indent=2) + "\n")
    print(name + " exit " + str(code), flush=True)
run("release-common", release, ["test/hotspot/jtreg/compiler/intrinsics/common"])
run("debug-common", debug, ["test/hotspot/jtreg/compiler/intrinsics/common"], ["-XX:+UnlockDiagnosticVMOptions", "-XX:+CheckUnhandledOops", "-XX:+VerifyOops"])
run("release-hotspot", release, script_dir.joinpath("hotspot-tests.txt").read_text().splitlines())
run("release-jdk", release, script_dir.joinpath("jdk-tests.txt").read_text().splitlines())
if any(r["exit_code"] for r in results):
    targeted = ["test/jdk/java/math/BigInteger/BigIntegerTest.java", "test/jdk/java/math/BigInteger/ModPow.java", "test/jdk/java/math/BigDecimal/SquareRootTests.java"]
    for mode, options in [("off", ["-XX:-UseCommonIntrinsics"]), ("int", ["-Xint"]), ("c1", ["-Xbatch", "-XX:TieredStopAtLevel=1"])]:
        run("math-control-" + mode, release, targeted, options)
    raise SystemExit(1)
print("All targeted jtreg selections passed", flush=True)
