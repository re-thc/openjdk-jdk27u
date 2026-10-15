import re, subprocess, tarfile, zipfile
from pathlib import Path
out = Path("semantic-results")
out.mkdir()
image = out / "image"
image.mkdir()
archives = list(Path("bundles").glob("*"))
print("ARCHIVES", [str(p) for p in archives], flush=True)
for archive in archives:
    if archive.name.endswith((".tar.gz", ".tgz", ".tar")):
        with tarfile.open(archive) as stream:
            stream.extractall(image, filter="data")
    elif archive.suffix == ".zip":
        with zipfile.ZipFile(archive) as stream:
            stream.extractall(image)
java = next(image.rglob("java.exe"))
javac = java.with_name("javac.exe")
classes = out / "classes"
classes.mkdir()
def run(args):
    print("RUN", args, flush=True)
    subprocess.run([str(x) for x in args], check=True)
run([javac, "-d", classes, "test/jdk/java/nio/charset/CharsetDecoder/ReplacementCopy.java",
     "make/jdk/src/classes/build/tools/spp/Spp.java"])
gmk = Path("make/modules/java.base/gensrc/GensrcCharsetCoder.gmk").read_text()
section = gmk.split("REPLACEMENTS :=", 1)[1].split("))", 1)[0]
variables = dict(re.findall(r"([A-Za-z0-9_-]+)='([^']*)'", section))
variables = {k: v.replace("$$(SPACE)", " ") for k, v in variables.items()}
source = out / "source/java/nio/charset"
source.mkdir(parents=True)
generated = source / "CharsetDecoder.java"
run([java, "-cp", classes, "build.tools.spp.Spp", "-Kdecoder",
     *["-D" + k + "=" + v for k, v in variables.items()],
     "-isrc/java.base/share/classes/java/nio/charset/Charset-X-Coder.java.template", "-o" + str(generated)])
patch = out / "patch"
patch.mkdir()
run([javac, "--patch-module", "java.base=" + str(out / "source"), "-d", patch, generated])
for mode in ("base", "patched"):
    for tier, flags in [("interp", ["-Xint"]), ("c1", ["-Xbatch", "-XX:TieredStopAtLevel=1"]),
                        ("c2", ["-Xbatch", "-XX:-TieredCompilation", "-XX:CompileThreshold=100"])]:
        extra = ["--patch-module=java.base=" + str(patch)] if mode == "patched" else []
        run([java, *extra, *flags, "-cp", classes, "ReplacementCopy"])
        print("SEMANTIC_PASS", mode, tier, flush=True)
print("TARGETED_SEMANTICS_COMPLETE_NOT_FINAL_IMAGE", flush=True)
