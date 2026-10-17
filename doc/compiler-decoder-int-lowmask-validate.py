#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.

"""Print the decoder-only validation plan; --execute runs one assigned stage.

No builds, downloads, encodes, JMH runs or CI are launched by this driver.
See compiler-decoder-int-lowmask.md for image provenance and execution scope.
This is the separately pinned Git-reference cell, not a claimed reproduction
of the unbound historical 504.5/1511.9 x86 result.
"""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shlex
import signal
import statistics
import subprocess
import time


BASE = "89885a6288e7aaabd01678a704a586272c0f96e3"
CANDIDATE = "340ecf10da523566c71b0dad2f4b162a3adeada0"
CODEC = "7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6"
CELL = "git-source-native-l1-6901a47a"
CORPUS = "dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9"
FRAME = "6901a47a3100e2e1453a43a70017d5a6ad83fcc49a3f8b1be875d7ffe08dcab5"
INPUT_EVIDENCE = "983ffb34bd9e1ded6a9cd7685577d6251796191b"
PINS = {
    "src/hotspot/cpu/x86/x86.ad": "5f6bf6bf99b9109efd1d80e465b58eead798dd362d11ff22570996423889fe02",
    "test/hotspot/jtreg/compiler/intrinsics/bmi/TestBzhiIntMask.java":
        "75ac257b53e874ff871ea372c82e2fd5ac7003f92319ba5cb046034c652ce81f",
    "test/micro/org/openjdk/bench/vm/compiler/VariableIntLowMask.java":
        "b7c4672b32db157a2978a67b400fd875ea924d11c7813761bf22f6e59ca47f88",
}
FLAGS = ["--add-modules", "jdk.incubator.vector", "-XX:+UseSerialGC", "-Xms1g", "-Xmx1g"]
LIMITS = {"qualify": 1800, "prepare": 120, "diagnose": 300, "time": 180}
METHOD = "dev.jzstd.internal.BlockDecoder::decodeSequencesRolling"


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def git(root, *args):
    return subprocess.check_output(["git", "-C", str(root), *args], text=True).strip()


def image(root, debug=False):
    return root / "build" / ("lowmask-fastdebug" if debug else "lowmask-release") / "jdk"


def commands(args, stage):
    images = {"base": image(args.base_root), "candidate": image(args.jdk_root),
              "base-debug": image(args.base_root, True), "candidate-debug": image(args.jdk_root, True)}
    classes = args.output / "classes"
    tail = ["-Dprobe.warmup=2", "-cp", classes, "CodecProbe", "decode", args.corpus, "1", args.frame]
    test = args.jdk_root / "test/hotspot/jtreg/compiler/intrinsics/bmi/TestBzhiIntMask.java"
    if stage == "qualify":
        cases = [("candidate-debug", test, False),
                 ("candidate-debug-suite", test.parent, False),
                 ("candidate", test, False), ("base-debug", test, True)]
        for name, target, reference in cases:
            jdk = images["candidate-debug" if name.endswith("-suite") else name]
            cmd = [args.jtreg_home / "bin/jtreg", "-jdk:" + str(jdk), "-conc:1", "-timeoutFactor:2",
                   "-w:" + str(args.output / stage / (name + "-work")),
                   "-r:" + str(args.output / stage / (name + "-report"))]
            if reference:
                cmd.append("-javaoption:-DVerifyIR=false")
            yield name, cmd + [target]
    elif stage == "prepare":
        sources = sorted((args.codec_root / "src/main/java").rglob("*.java"))
        yield "compile-probe", [images["base"] / "bin/javac", "--add-modules", "jdk.incubator.vector",
                                "-d", classes, *sources, args.codec_root / "scripts/jdk27/CodecProbe.java"]
    elif stage == "diagnose":
        for name, jdk in images.items():
            yield name + "-flags", [jdk / "bin/java", *FLAGS, "-XX:+PrintFlagsFinal", "-version"]
            extra = ["-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                     "-XX:LogFile=" + str(args.output / stage / (name + ".xml")),
                     "-XX:CompileCommand=print," + METHOD,
                     "-XX:CompileCommand=PrintOptoAssembly," + METHOD]
            if name.endswith("-debug"):
                extra.append("-XX:CompileCommand=PrintIdealPhase," + METHOD
                             + ",BEFORE_MATCHING,MATCHING,REGISTER_ALLOCATION,FINAL_CODE")
            yield name, [jdk / "bin/java", *FLAGS, *extra, *tail]
    else:
        for index, name in enumerate(["base", "candidate", "candidate", "base",
                                      "candidate", "base", "base", "candidate"]):
            yield str(index) + "-" + name, [images[name] / "bin/java", *FLAGS, *tail]


def verify_sources(args):
    heads = {}
    for name, root, expected in [("base", args.base_root, BASE), ("codec", args.codec_root, CODEC),
                                 ("candidate", args.jdk_root, None)]:
        heads[name] = git(root, "rev-parse", "HEAD")
        if (expected and heads[name] != expected) or git(root, "status", "--porcelain"):
            raise ValueError("Wrong revision or local changes: " + str(root))
    allowed = {"doc/compiler-decoder-int-lowmask.md", "doc/compiler-decoder-int-lowmask-validate.py",
               "doc/compiler-decoder-int-lowmask-inputs.py",
               "test/hotspot/jtreg/compiler/intrinsics/bmi/TestBzhiIntMask.java"}
    if set(git(args.jdk_root, "diff", "--name-only", CANDIDATE, "HEAD").splitlines()) - allowed:
        raise ValueError("Candidate contains changes outside this preparation packet")
    for relative, expected in PINS.items():
        if digest(args.jdk_root / relative) != expected:
            raise ValueError("Candidate source changed: " + relative)
    for key in ("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "CLASSPATH"):
        if os.environ.get(key):
            raise ValueError("Unset ambient Java option: " + key)
    return heads


def files_manifest(args, stage, heads):
    files = {}
    if stage in ("diagnose", "time"):
        provenance = json.loads(args.input_manifest.read_text())
        if (provenance["cell_id"] != CELL or provenance["codec_pin"] != CODEC
                or provenance["evidence_commit"] != INPUT_EVIDENCE
                or provenance["corpus_sha256"] != CORPUS or provenance["frame_sha256"] != FRAME
                or provenance["historical_504_cell_identity_verified"] is not False):
            raise ValueError("Input provenance differs from the separately pinned reference cell")
        files[str(args.input_manifest)] = digest(args.input_manifest)
        for path, expected in [(args.corpus, args.corpus_sha256), (args.frame, args.frame_sha256)]:
            if not expected or not re.fullmatch("[0-9a-f]{64}", expected):
                raise ValueError("Expected pinned corpus and frame SHA256 values")
            if digest(path) != expected:
                raise ValueError("Input hash mismatch: " + str(path))
            files[str(path)] = expected
        classes = sorted((args.output / "classes").rglob("*.class"))
        if not (args.output / "classes/CodecProbe.class").is_file():
            raise ValueError("Run the assigned prepare stage first")
        files.update((str(path), digest(path)) for path in classes)
    if stage == "prepare":
        if (args.output / "classes").exists():
            raise ValueError("Refusing to reuse an existing classes directory")
        sources = sorted((args.codec_root / "src/main/java").rglob("*.java"))
        sources.append(args.codec_root / "scripts/jdk27/CodecProbe.java")
        files.update((str(path), digest(path)) for path in sources)
    for debug in (False, True):
        if stage in ("prepare", "time") and debug:
            continue
        for root in (args.base_root, args.jdk_root):
            jdk = image(root, debug)
            source = jdk.parent / "lowmask-source-head.txt"
            if source.read_text().strip() != heads["base" if root == args.base_root else "candidate"]:
                raise ValueError("Image build provenance differs from checkout: " + str(jdk))
            for path in (source, jdk.parent / "spec.gmk", jdk.parent / "lowmask-build-sha256.txt"):
                files[str(path)] = digest(path)
            for path in (jdk / "bin/java", jdk / "lib/server/libjvm.so", jdk / "lib/modules", jdk / "release"):
                files[str(path)] = digest(path)
    if stage == "prepare":
        javac = image(args.base_root) / "bin/javac"
        files[str(javac)] = digest(javac)
    return files


def classes_manifest(args):
    classes = args.output / "classes"
    if not (classes / "CodecProbe.class").is_file():
        raise ValueError("Missing compiled CodecProbe")
    return {str(path): digest(path) for path in sorted(classes.rglob("*.class"))}


def run_stage(args):
    stage = args.stage
    heads = verify_sources(args)
    files = files_manifest(args, stage, heads)
    prerequisites = {"qualify": [], "prepare": ["qualify"],
                     "diagnose": ["qualify", "prepare"], "time": ["qualify", "prepare", "diagnose"]}
    for previous in prerequisites[stage]:
        receipt = json.loads((args.output / previous / "manifest.json").read_text())
        if not receipt.get("completed") or receipt["heads"] != heads:
            raise ValueError("Incomplete or different-source prerequisite: " + previous)
        for file, expected in receipt["sha256"].items():
            if file in files and files[file] != expected:
                raise ValueError("Changed prerequisite input: " + file)
        if previous == "prepare" and receipt["classes_sha256"] != classes_manifest(args):
            raise ValueError("Class set differs from the pinned prepare stage")
    directory = args.output / stage
    directory.mkdir(parents=True, exist_ok=False)
    manifest = {"cell_id": CELL, "historical_504_cell_identity_verified": False,
                "stage": stage, "heads": heads, "sha256": files, "records": []}
    path = directory / "manifest.json"
    path.write_text(json.dumps(manifest, indent=2) + "\n")
    env = dict(os.environ, JAVA_HOME=str(args.jtreg_java_home), LC_ALL="C")
    deadline = time.monotonic() + LIMITS[stage]
    for name, command in commands(args, stage):
        command = list(map(str, command))
        record = {"name": name, "command": command}
        manifest["records"].append(record)
        path.write_text(json.dumps(manifest, indent=2) + "\n")
        with (directory / (name + ".log")).open("x") as log:
            if time.monotonic() >= deadline:
                raise TimeoutError("Stage ceiling reached before " + name)
            process = subprocess.Popen(command, cwd=directory, env=env, stdout=log,
                                       stderr=subprocess.STDOUT, start_new_session=True)
            try:
                record["exit_code"] = process.wait(timeout=max(0.01, deadline - time.monotonic()))
            except subprocess.TimeoutExpired:
                os.killpg(process.pid, signal.SIGKILL)
                process.wait()
                record["timed_out"] = True
            path.write_text(json.dumps(manifest, indent=2) + "\n")
        if record.get("timed_out") or record.get("exit_code") != 0:
            raise RuntimeError("Stopped at " + name + "; retain " + str(directory))
        if stage == "qualify" and not name.endswith("-suite"):
            output = (directory / (name + ".log")).read_text()
            if not re.search(r"Test results: passed: 1(?:\s|$)", output):
                raise ValueError("Focused test did not report one pass: " + name)
        if stage == "diagnose" and name.endswith("-flags"):
            output = (directory / (name + ".log")).read_text()
            if not re.search(r"\bUseBMI2Instructions\s+[:=]+\s+true\b", output):
                raise ValueError("BMI2 is not enabled under the original flags: " + name)
        if stage == "time":
            output = (directory / (name + ".log")).read_text()
            match = re.search(r"decode L1 input=\d+ frame=\d+ median=[\d.]+ MB/s samples=\[([^]]+)\]", output)
            if not match:
                raise ValueError("Missing decode samples: " + name)
            rates = [float(value) for value in match[1].split(",")]
            if len(rates) != 5 or any(not 0 < value < float("inf") for value in rates):
                raise ValueError("Invalid decode samples: " + name)
            record["samples_MB_s"] = rates
            record["median_MB_s"] = statistics.median(rates)
        path.write_text(json.dumps(manifest, indent=2) + "\n")
    if any(digest(Path(file)) != expected for file, expected in files.items()):
        raise ValueError("A recorded input or image changed during the stage")
    if verify_sources(args) != heads:
        raise ValueError("Source revision changed during the stage")
    if stage == "prepare":
        manifest["classes_sha256"] = classes_manifest(args)
    if stage == "time":
        pairs = []
        for first in range(0, 8, 2):
            pair = manifest["records"][first:first + 2]
            base = next(item for item in pair if item["name"].endswith("-base"))
            candidate = next(item for item in pair if item["name"].endswith("-candidate"))
            pairs.append({"order": [item["name"] for item in pair],
                          "candidate_over_base": candidate["median_MB_s"] / base["median_MB_s"]})
        manifest["pairs"] = pairs
    manifest["completed"] = True
    path.write_text(json.dumps(manifest, indent=2) + "\n")
    print(path)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", choices=LIMITS, help="select one stage; omitted prints all stages")
    parser.add_argument("--execute", action="store_true", help="run the selected, separately assigned stage")
    parser.add_argument("--jdk-root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--base-root", type=Path, default=Path("/workspace/executor-lowmask-base"))
    parser.add_argument("--codec-root", type=Path, default=Path("/workspace/executor-jzstd"))
    parser.add_argument("--jtreg-home", type=Path, default=Path("/workspace/toolchains/jtreg83"))
    parser.add_argument("--jtreg-java-home", type=Path, default=Path("/workspace/toolchains/jdk27"))
    parser.add_argument("--output", type=Path, default=Path("/workspace/executor-lowmask-validation"))
    parser.add_argument("--corpus", type=Path, default=Path("/workspace/decoder-lowmask-input/corpus.bin"))
    parser.add_argument("--frame", type=Path, default=Path("/workspace/decoder-lowmask-input/native.l1.zst"))
    parser.add_argument("--input-manifest", type=Path, default=Path("/workspace/decoder-lowmask-input/provenance.json"))
    parser.add_argument("--corpus-sha256", default=CORPUS, choices=[CORPUS])
    parser.add_argument("--frame-sha256", default=FRAME, choices=[FRAME])
    args = parser.parse_args()
    for key, value in vars(args).items():
        if isinstance(value, Path):
            setattr(args, key, value.resolve())
    if args.execute:
        if not args.stage:
            parser.error("--execute requires one --stage")
        run_stage(args)
    else:
        print("# cell: " + CELL + "; original 504.5/1511.9 x86 identity unverified")
        for stage in [args.stage] if args.stage else LIMITS:
            print("# " + stage + ": subprocess budget " + str(LIMITS[stage]) + " seconds")
            for name, command in commands(args, stage):
                print(name + ": " + shlex.join(map(str, command)))


if __name__ == "__main__":
    main()
