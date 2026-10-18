#!/usr/bin/env python3
"""Check the test-only GCC16 fortified-copy fix; no JVM or benchmark execution."""
import hashlib
import io
import json
import os
from pathlib import Path
import platform
import re
import shlex
import subprocess
import tarfile
import zipfile

REPO = "re-thc/openjdk-jdk27u"
SOURCE = "c73d3586b13764f912c52c9f407020866f0e252c"
RUNTIME = "916ba895e834378e3f7eac7f030fc4abff641d33"
PILOT_RUN = 39145136082
PILOT_HEAD = "f7003b74572a93b774ffb9fe79fcc35a3efcdcb0"
FAILURE = (12149944507, "6bb0334dae50c69b2d7d12137a19e2527539d434e175f412a98178415a328350")
ROOT = Path.cwd()
OUT = ROOT / "native-fortify-output"
OUT.mkdir()
PAIRS = {
    "x64": (12144279572, "95f054971f775b13b52ece43e6c36297c9d89591713cff363fd8790b7c8a184d", 117733444034, "avx2"),
    "arm64": (12145196750, "cadca6cd0ea155af4e92c1efe55d9ac9c2a02cb84006a3357ac4cfe30af7480f", 117733444047, "neon"),
}

def sha(data):
    return hashlib.sha256(data).hexdigest()

def api(path):
    return json.loads(subprocess.check_output(["gh", "api", "repos/" + REPO + "/" + path], text=True))

def download(identity, run, head, name):
    artifact_id, digest = identity
    meta = api("actions/artifacts/" + str(artifact_id))
    assert meta["id"] == artifact_id and meta["digest"] == "sha256:" + digest
    assert not meta["expired"] and meta["workflow_run"]["id"] == run
    assert meta["workflow_run"]["head_sha"] == head
    path = OUT / name
    with path.open("wb") as stream:
        subprocess.run(["gh", "api", "repos/" + REPO + "/actions/artifacts/" + str(artifact_id) + "/zip"],
                       stdout=stream, check=True)
    assert sha(path.read_bytes()) == digest
    return path, meta

def run(args, name, expected=None, env=None):
    path = OUT / name
    with path.open("w") as stream:
        result = subprocess.run([str(value) for value in args], stdout=stream, stderr=subprocess.STDOUT, env=env)
    print(json.dumps({"command": [str(value) for value in args], "returncode": result.returncode,
                      "log": name, "sha256": sha(path.read_bytes())}), flush=True)
    print(path.read_text(errors="replace")[-16000:], flush=True)
    if expected is not None:
        assert (result.returncode == 0) == expected, name
    return result.returncode, path

assert subprocess.check_output(["git", "rev-parse", "HEAD"], text=True).strip() == SOURCE
test = ROOT / "test/jdk/java/lang/String/libStringZillaKernelsTest.c"
assert subprocess.check_output(["git", "hash-object", test], text=True).strip() == "350a0fc7cee17e1ec4a035be96ab9d81efcb2e1e"
assert subprocess.check_output(["git", "hash-object", ROOT / "src/java.base/share/native/libjava/StringZillaKernels.c"], text=True).strip() == "ef4bcc989fcea08c8ce17bd8e37b50669708b503"
fixed = test.read_text()
old = fixed.replace("jint count = dense_short_counts[n];\n        CHECK(count >= 33 && count <= 128);\n        jint stride",
                    "jint count = dense_short_counts[n], stride")
assert old != fixed
old_path = OUT / "old-libStringZillaKernelsTest.c"
old_path.write_text(old)
assert subprocess.check_output(["git", "hash-object", old_path], text=True).strip() == "51657fdf5a621ca88f70c11362c874a86785eb0b"

failure_zip, failure_meta = download(FAILURE, 39164642050, RUNTIME, "failure.zip")
failure_job = api("actions/jobs/117788188146")
assert failure_job["run_id"] == 39164642050 and failure_job["head_sha"] == RUNTIME
assert failure_job["conclusion"] == "failure"
with zipfile.ZipFile(failure_zip) as bundle:
    names = [name for name in bundle.namelist() if name.endswith(".cmdline") and "StringZillaKernelsTest" in name]
    assert len(names) == 1, bundle.namelist()
    command = bundle.read(names[0])
(OUT / "actual-failing.cmdline").write_bytes(command)
words = shlex.split(command.decode().replace("\\\n", " "))
assert any("gcc" in word or "ccache" in word for word in words), words[:4]
assert any("libStringZillaKernelsTest.c" in word for word in words)
optimizations = [word for word in words if re.fullmatch(r"-O[0-3gsz]", word)]
fortify = [word for word in words if re.fullmatch(r"-D_FORTIFY_SOURCE=[123]", word)]
assert optimizations and fortify, {"optimization": optimizations, "fortify": fortify, "command": words}
warnings = [word for word in words if word.startswith("-W")]
assert "-Werror" in warnings or "-Werror=stringop-overflow" in warnings
flags = [word for word in words if word.startswith(("-O", "-D", "-U", "-W", "-f", "-std="))]
flags = [word for word in flags if not word.startswith(("-fdebug-prefix-map=", "-ffile-prefix-map=", "-fmacro-prefix-map="))]
flags = [word for word in flags if not word.startswith(("-DAARCH64", "-DAMD64", "-DARCH="))]
if os.environ["TEST_ARCH"] == "arm64":
    flags += [word for word in words if word.startswith("-m")]
flags += [word for word in words if word == "-pthread"]
flags += ["-Wno-unknown-pragmas", "-Werror=stringop-overflow", "-fPIC"]
print("STRINGZILLA_FORTIFY_COMMAND " + json.dumps({"source": SOURCE, "runtime_source": RUNTIME,
      "failure_artifact": failure_meta, "cmdline_path": names[0], "cmdline_sha256": sha(command),
      "matched_optimization": optimizations, "matched_fortify": fortify, "native_compile_flags": flags,
      "scope": "Replay architecture-independent C/optimization/fortify/warning options with local JNI includes; no performance claim"}), flush=True)

arch = os.environ["TEST_ARCH"]
artifact_id, digest, producer_id, backend = PAIRS[arch]
job = api("actions/jobs/" + str(producer_id))
assert job["run_id"] == PILOT_RUN and job["head_sha"] == PILOT_HEAD
assert job["status"] == "completed" and job["conclusion"] == "success"
steps = {step["name"]: step["conclusion"] for step in job["steps"]}
assert all(steps[name] == "success" for name in ("Verify and archive matched complete pair",
           "Publish complete images before tests", "Run profiles, jtreg and native contract checks"))
pair_zip, pair_meta = download((artifact_id, digest), PILOT_RUN, PILOT_HEAD, "validated-pair.zip")
include = OUT / "prior-jdk-headers"
include.mkdir()
with zipfile.ZipFile(pair_zip) as bundle:
    receipt = json.loads(bundle.read("pair-receipt.json"))
    assert receipt["sources"] == {"original": "416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda",
                                  "fork": "e036e637a5aff1e2506ff82953a3fbd9fdba6a9d"}
    assert receipt["backend"] == backend
    expected = bundle.read("fork-jdk.tar.gz.sha256").decode().split()[0]
    tar_path = OUT / "prior-fork-jdk.tar.gz"
    with bundle.open("fork-jdk.tar.gz") as source, tar_path.open("wb") as target:
        while data := source.read(1024 * 1024):
            target.write(data)
assert sha(tar_path.read_bytes()) == expected
extracted = []
with tarfile.open(tar_path, "r:gz") as archive:
    for entry in archive:
        if entry.name.startswith("fork/include/") and entry.isfile():
            relative = Path(entry.name).relative_to("fork/include")
            assert ".." not in relative.parts
            target = include / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(archive.extractfile(entry).read())
            extracted.append(str(relative))
assert (include / "jni.h").is_file() and (include / "linux/jni_md.h").is_file()
tar_path.unlink()
pair_zip.unlink()
includes = [ROOT / "src/java.base/share/native/libjava",
            ROOT / "src/java.base/share/native/libjava/stringzilla",
            ROOT / "src/hotspot/share/include", ROOT / "src/hotspot/os/posix/include",
            include, include / "linux"]
args = ["gcc-16", *flags, *["-I" + str(path) for path in includes], "-c"]
old_status, old_log = run([*args, old_path, "-o", OUT / "old.o"], "old-compile.log")
fixed_status, fixed_log = run([*args, test, "-o", OUT / "fixed.o"], "fixed-compile.log", expected=True)
reproduced = old_status != 0 and "stringop-overflow" in old_log.read_text(errors="replace")
if arch == "arm64":
    assert reproduced, "Original ARM warning was not reproduced with extracted CI options"
driver = OUT / "driver.c"
driver.write_text('#include "' + str(test) + '"\n#include <stdio.h>\n'
    'int main(void) { for (jint mask=0; mask<8; mask++) { requested_capabilities=mask; test_initialize(); '
    'printf("requested=%d selected=%d executable=%d\\n",mask,published->capabilities,can_execute(published->capabilities)); } '
    'int failure=check_kernels(); if(failure) fprintf(stderr,"Native failure line %d\\n",failure); return failure?1:0; }\n')
sanitizer = OUT / "native-sanitizers"
run(["gcc-16", "-std=c11", "-O2", "-g", "-fno-omit-frame-pointer",
     "-fsanitize=address,undefined,alignment", "-fno-sanitize-recover=all", "-Wno-unknown-pragmas",
     *["-I" + str(path) for path in includes], driver, "-o", sanitizer], "sanitizer-build.log", expected=True)
run([sanitizer], "sanitizer-run.log", expected=True,
    env={**os.environ, "ASAN_OPTIONS": "abort_on_error=1:detect_leaks=1:strict_string_checks=1",
         "UBSAN_OPTIONS": "halt_on_error=1:print_stacktrace=1"})
result = {"source": SOURCE, "runtime_source": RUNTIME, "test_blob": "350a0fc7cee17e1ec4a035be96ab9d81efcb2e1e",
          "old_test_blob": "51657fdf5a621ca88f70c11362c874a86785eb0b",
          "architecture": platform.machine(), "compiler": subprocess.check_output(["gcc-16", "--version"], text=True),
          "old_warning_reproduced": reproduced, "fixed_compile_passed": fixed_status == 0,
          "address_undefined_alignment_passed": True, "new_timing_executions": 0,
          "header_pair_artifact": pair_meta, "header_producer_job": producer_id,
          "headers": {name: sha((include / name).read_bytes()) for name in extracted},
          "commands": {"failing_cmdline_sha256": sha(command), "flags": flags},
          "logs": {path.name: sha(path.read_bytes()) for path in OUT.glob("*.log")}}
(OUT / "receipt.json").write_text(json.dumps(result, indent=2) + "\n")
print("STRINGZILLA_FORTIFY_COMPLETE " + json.dumps(result, separators=(",", ":")), flush=True)
