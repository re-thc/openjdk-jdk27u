import os
from pathlib import Path
import shutil
import subprocess
import sys

release, debug, jtreg, output = map(lambda value: Path(value).resolve(), sys.argv[1:])
output.mkdir(exist_ok=True)
sources = output / "patch-src"
classes = output / "patch"
target = sources / "sun/nio/cs/UTF_8.java"
target.parent.mkdir(parents=True)
shutil.copyfile("src/java.base/share/classes/sun/nio/cs/UTF_8.java", target)
classes.mkdir()
subprocess.run([str(release / "bin/javac"), "--patch-module", "java.base=" + str(sources),
                "-d", str(classes), str(target)], check=True)
tests = ["test/hotspot/jtreg/compiler/intrinsics/simdutf",
         "test/hotspot/jtreg/compiler/escapeAnalysis/TestSimdUTFLeaf.java",
         "test/jdk/sun/nio/cs/TestUTF8.java",
         "test/jdk/sun/nio/cs/TestStringCodingUTF8.java",
         "test/jdk/sun/nio/cs/TestUTF8BOM.java",
         "test/jdk/sun/nio/cs/MalformedSurrogates.java",
         "test/jdk/sun/nio/cs/MalformedSurrogateStringTest.java",
         "test/jdk/sun/nio/cs/LeftOverSurrogate.java",
         "test/jdk/sun/nio/cs/DecoderOverflow.java",
         "test/jdk/sun/nio/cs/EncodingNothing.java"]
for level, image in (("release", release), ("debug", debug)):
    log = output / ("jtreg-" + level + ".log")
    command = [str(release / "bin/java"), "-jar", str(jtreg / "lib/jtreg.jar"),
               "-jdk:" + str(image), "-agentvm", "-concurrency:2", "-timeoutFactor:5",
               "-javaoptions:--patch-module=java.base=" + str(classes) + " -XX:ActiveProcessorCount=2",
               "-vmoptions:-XX:ActiveProcessorCount=2",
               "-w:" + str(output / ("work-" + level)),
               "-r:" + str(output / ("report-" + level)), *tests]
    with log.open("w") as stream:
        result = subprocess.run(command, stdout=stream, stderr=subprocess.STDOUT)
    print(log.read_text()[-12000:], flush=True)
    if result.returncode:
        raise SystemExit(result.returncode)
    print("FINAL_JTREG_PASSED", level, flush=True)
