#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
# This code is distributed without any warranty. See the GNU GPL version 2
# for details (a copy is included in the repository LICENSE file).
"""Bounded, untimed source/IR probe. Does not build a JDK or install anything."""
import argparse
import datetime
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess
import urllib.request

PARSER = "afee2c32e1b8070a20214e8728079d6759663c8f"
EXPECTED = {
    "StructuralIndexer.java": "fa8e8a84eeb3eafcfb758615593636b66a9bcb571ea533a6eb1f0aa2cb5570fe",
    "VectorUtils.java": "31b34c1e486cc07682bb97b8d3dc099367004e0e3c79e967e98b5de99e410910",
    "BitIndexes.java": "b7de5732da99c0b05afd73a41bc75ef750c7a800f0e1849ccf087ca48ef8c884",
    "JsonParsingException.java": "ba927f5899a2023e0d88c96e4ee62866aada5709651b7dfabf3a6ce4ffc4f24c",
}

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--jdk", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True, help="New directory; must not exist")
    p.add_argument("--source-sha", required=True, help="Actual JDK image source, including any CI merge")
    p.add_argument("--mode", choices=["frontend-x64", "neon-arm64"], required=True)
    p.add_argument("--seconds", type=int, default=180)
    a = p.parse_args()
    if not re.fullmatch(r"[0-9a-f]{40}", a.source_sha) or not 1 <= a.seconds <= 600:
        p.error("Require a full source SHA and fresh JVM budget of 1..600 seconds")
    machine = platform.machine().lower()
    allowed = ["x86_64", "amd64"] if a.mode == "frontend-x64" else ["aarch64", "arm64"]
    if machine not in allowed:
        p.error("Host architecture does not match the requested diagnostic mode")
    a.jdk = a.jdk.resolve()
    a.out = a.out.resolve()
    a.out.mkdir(parents=True, exist_ok=False)
    own = Path(__file__).resolve().parent
    suffix = ".exe" if os.name == "nt" else ""
    java, javac = [a.jdk / "bin" / (n + suffix) for n in ["java", "javac"]]
    env = dict(os.environ)
    removed = [n for n in ["JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "CLASSPATH"] if n in env]
    for n in removed:
        del env[n]
    receipt = {
        "started_utc": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "mode": a.mode, "machine": machine, "platform": platform.platform(),
        "reported_image_source_sha": a.source_sha, "parser_source_sha": PARSER,
        "fresh_jvm_budget_seconds": a.seconds, "timing_collected": False,
        "removed_injected_option_names": removed, "status": "started",
    }
    try:
        version = subprocess.run([str(java), "-Xinternalversion"], env=env, text=True,
                                 stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                 check=True, timeout=30).stdout
        (a.out / "image-version.txt").write_text(version)
        if "fastdebug" not in version or a.source_sha[:11] not in version:
            raise RuntimeError("Require fastdebug and a source stamp consistent with the supplied actual image SHA")
        receipt["image_version"] = version.strip()
        libraries = [a.jdk / "lib/server/libjvm.so", a.jdk / "lib/server/libjvm.dylib",
                     a.jdk / "bin/server/jvm.dll"]
        libjvm = next(x for x in libraries if x.is_file())
        receipt["image_sha256"] = {"java": digest(java), "libjvm": digest(libjvm)}
        source = a.out / "source/org/simdjson"
        source.mkdir(parents=True)
        for name, expected in EXPECTED.items():
            url = f"https://raw.githubusercontent.com/simdjson/simdjson-java/{PARSER}/src/main/java/org/simdjson/{name}"
            with urllib.request.urlopen(url, timeout=30) as response:
                body = response.read()
            if hashlib.sha256(body).hexdigest() != expected:
                raise RuntimeError("Pinned parser source hash mismatch: " + name)
            (source / name).write_bytes(body)
        shutil.copyfile(own / "PR43ParserProbe.java", source / "PR43ParserProbe.java")
        shutil.copyfile(own / "parser-directives.json", a.out / "directives.json")
        receipt["source_sha256"] = {x.name: digest(x) for x in source.glob("*.java")}
        classes = a.out / "classes"
        compile_command = [str(javac), "-encoding", "UTF-8", "--add-modules", "jdk.incubator.vector",
                           "-d", str(classes)] + [str(x) for x in sorted(source.glob("*.java"))]
        with (a.out / "javac.log").open("w") as log:
            subprocess.run(compile_command, env=env, stdout=log, stderr=subprocess.STDOUT,
                           check=True, timeout=60)
        flags = ["-XX:UseAVX=2"] if a.mode == "frontend-x64" else ["-XX:UseSVE=0"]
        command = [str(java), "--add-modules", "jdk.incubator.vector",
                   "-Dorg.simdjson.species=128", "-XX:MaxVectorSize=16"] + flags + [
                   "-XX:-TieredCompilation", "-XX:CompileThreshold=1000", "-XX:CICompilerCount=1", "-Xbatch",
                   "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation", "-XX:+PrintCompilation",
                   "-XX:LogFile=" + str(a.out / "hotspot-%p.log"),
                   "-XX:CompileCommand=dontinline,org.simdjson.StructuralIndexer::index128",
                   "-XX:CompilerDirectivesFile=" + str(a.out / "directives.json"),
                   "-cp", str(classes), "org.simdjson.PR43ParserProbe"]
        receipt["command"] = command
        with (a.out / "console.log").open("w") as log:
            subprocess.run(command, env=env, stdout=log, stderr=subprocess.STDOUT,
                           check=True, timeout=a.seconds)
        console = (a.out / "console.log").read_text()
        if "PR43_PARSER_PASS checks=1701 " not in console:
            raise RuntimeError("Missing completed semantic oracle result")
        if "Before Matching" not in console and not any(
                "Before Matching" in x.read_text() for x in a.out.glob("hotspot-*.log")):
            raise RuntimeError("No Before Matching record was retained")
        receipt["status"] = "semantic-pass-records-captured"
        receipt["acceptance_scope"] = (
            "Raw records require compile-ID/node/allocation review. frontend-x64 never qualifies ARM "
            "matching, allocated ARM code, spills or profitability. neon-arm64 does not qualify SVE "
            "or profitability. No historical evidence is recreated.")
        receipt["image_hashes_unchanged"] = receipt["image_sha256"] == {
            "java": digest(java), "libjvm": digest(libjvm)}
        if not receipt["image_hashes_unchanged"]:
            raise RuntimeError("Image hashes changed during execution")
    except Exception as e:
        receipt["status"] = "failed"
        receipt["error"] = f"{type(e).__name__}: {e}"
        raise
    finally:
        receipt["finished_utc"] = datetime.datetime.now(datetime.timezone.utc).isoformat()
        (a.out / "receipt.json").write_text(json.dumps(receipt, indent=2) + "\n")
    print(json.dumps({"status": receipt["status"], "out": str(a.out), "mode": a.mode}))

if __name__ == "__main__":
    main()
