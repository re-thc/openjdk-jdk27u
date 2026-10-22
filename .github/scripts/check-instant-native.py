#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""CI-only bounded integration: no retries, throughput tests or tool installation."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys


def verify_source(release, expected, head, tracked_status, status):
    source = re.search(r'^SOURCE="\.:git:([0-9a-f]{12})(\+?)"\s*$', release, re.MULTILINE)
    version = re.search(r'^JAVA_RUNTIME_VERSION="([^"]+)"', release, re.MULTILINE)
    if expected:
        if head != expected or tracked_status.strip():
            raise RuntimeError("Workflow commit or tracked source changed during the build")
        if any(line not in ("?? bootjdk/", "?? instant-native-evidence/")
               for line in status.splitlines()):
            raise RuntimeError("Unexpected untracked source or build input")
        if not source or not expected.startswith(source.group(1)):
            raise RuntimeError("Image SOURCE does not match the workflow commit")
        if not version or not version.group(1).endswith("-" + expected):
            raise RuntimeError("Image runtime version does not contain the configured workflow commit")
    # OpenJDK marks SOURCE with '+' for untracked dependency/evidence directories
    # as well as tracked edits. Check tracked edits directly instead of treating
    # that build metadata marker as proof that source was modified.
    return {"git_head": head, "tracked_status": tracked_status,
            "untracked_status": status,
            "image_source": source.group(0) if source else None,
            "untracked_marker": bool(source and source.group(2)),
            "image_version": version.group(1) if version else None}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--image", required=True, type=Path)
    parser.add_argument("--spec", required=True, type=Path)
    parser.add_argument("--onload", required=True, type=Path)
    parser.add_argument("--target", required=True)
    parser.add_argument("--out", required=True, type=Path)
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[2]
    image, out = args.image.resolve(), args.out.resolve()
    out.mkdir(parents=True, exist_ok=True)
    commands = []
    identities = {"source": os.environ.get("GITHUB_SHA"), "platform": sys.platform,
                  "python": sys.version, "files": {}}
    result = {"status": "failed", "target": args.target, "passed": []}

    def run(label, command, timeout=120):
        command = list(map(str, command))
        commands.append({"label": label, "argv": command, "timeout_seconds": timeout})
        (out / "commands.json").write_text(json.dumps(commands, indent=2) + "\n")
        print("RUN " + label, flush=True)
        with (out / (label + ".log")).open("w") as log:
            log.write(json.dumps(command) + "\n")
            log.flush()
            completed = subprocess.run(command, cwd=root, stdout=log,
                                       stderr=subprocess.STDOUT, timeout=timeout)
        text = (out / (label + ".log")).read_text(errors="replace")
        print(text, end="", flush=True)
        if completed.returncode:
            raise RuntimeError(f"{label}: exit {completed.returncode}")
        if re.search(r"WARNING[^\n]*(?:JNI|native method)|FATAL ERROR[^\n]*native method",
                     text, re.IGNORECASE):
            raise RuntimeError(f"{label}: JNI diagnostic despite exit 0")
        result["passed"].append(label)
        return text.partition("\n")[2].strip()

    def fingerprint(path):
        path = path.resolve()
        digest = hashlib.sha256()
        with path.open("rb") as stream:
            for chunk in iter(lambda: stream.read(1024 * 1024), b""):
                digest.update(chunk)
        identities["files"][str(path)] = {"bytes": path.stat().st_size, "sha256": digest.hexdigest()}

    try:
        spec = args.spec.read_text()
        if not re.search(r"^ENABLE_INSTANT_SPEEDATE\s*:?=\s*true\s*$", spec, re.MULTILINE):
            raise RuntimeError("Native backend not enabled in production spec")
        if not re.search(r"^SPEEDATE_RUST_TARGET\s*:?=\s*" + re.escape(args.target) + r"\s*$",
                         spec, re.MULTILINE):
            raise RuntimeError("Unexpected Rust target in production spec")
        configure_log = args.spec.with_name("configure.log").read_text()
        if "speedate Instant parser should be built... enabled, from default 'auto'" not in configure_log:
            raise RuntimeError("Configure did not prove default automatic enablement")
        windows = sys.platform == "win32"
        extension = ".exe" if windows else ""
        library = image / ("bin/instant.dll" if windows else
                           "lib/libinstant.dylib" if sys.platform == "darwin" else "lib/libinstant.so")
        if not library.is_file() or not args.onload.is_file():
            raise RuntimeError("Packaged parser or normal-build JNI callback library is missing")
        java = image / ("bin/java" + extension)
        for path in (java, image / ("bin/javac" + extension), image / "release",
                     image / "lib/modules", library, args.onload, args.spec,
                     root / ".github/scripts/instant-native/InstantNativeProbe.java",
                     root / "src/java.base/share/native/libinstant/rust/Cargo.lock"):
            fingerprint(path)
        vm = image / ("bin/server/jvm.dll" if windows else
                      "lib/server/libjvm.dylib" if sys.platform == "darwin" else "lib/server/libjvm.so")
        fingerprint(vm)
        git = os.environ.get("INSTANT_GIT", "git")
        head = run("git-head", [git, "rev-parse", "HEAD"])
        tracked = run("git-tracked-status", [git, "status", "--porcelain", "--untracked-files=no"])
        status = run("git-status", [git, "status", "--porcelain", "--untracked-files=normal"])
        identities["source_check"] = verify_source((image / "release").read_text(),
                                                   os.environ.get("GITHUB_SHA"), head, tracked, status)
        run("git-version", [git, "--version"])
        run("java-version", [java, "-Xinternalversion"])
        run("java-settings", [java, "-XshowSettings:properties", "-version"])
        for name in ("RUSTC", "CARGO"):
            executable = os.environ.get("INSTANT_" + name)
            if executable:
                fingerprint(Path(executable))
                run(name.lower() + "-version", [executable, "-vV" if name == "RUSTC" else "-V"])
        classes = out / "classes"
        classes.mkdir(exist_ok=True)
        source = root / ".github/scripts/instant-native/InstantNativeProbe.java"
        controls = root / "test/jdk/java/time/nonjunit/java/time"
        run("compile", [image / ("bin/javac" + extension), "-J-XX:ActiveProcessorCount=2",
                        "-d", classes, source, controls / "InstantSpeedateDisabled.java",
                        controls / "InstantSpeedateUnavailable.java"])
        common = [java, "-XX:ActiveProcessorCount=2", "-Xms32m", "-Xmx96m", "-Xcheck:jni",
                  "--enable-native-access=ALL-UNNAMED",
                  "--add-opens=java.base/java.time=ALL-UNNAMED",
                  "--add-opens=java.base/jdk.internal.loader=ALL-UNNAMED",
                  "--add-exports=java.base/jdk.internal.misc=ALL-UNNAMED", "-cp", classes]
        for compact, flag in (("compact", "-XX:+CompactStrings"), ("utf16", "-XX:-CompactStrings")):
            native = common + [flag, "-Dprobe.native=true"]
            run("differential-" + compact, native + ["InstantNativeProbe", "test"])
            run("cold-load-race-" + compact, native + ["InstantNativeProbe", "race"])
            run("onload-" + compact, native + ["-Dprobe.parser.library=" + str(library),
                "-Dprobe.onload.library=" + str(args.onload.resolve()), "InstantNativeProbe", "onload"])
            for collector in ("Serial", "G1", "Z"):
                run("gc-" + collector + "-" + compact,
                    native + ["-XX:+Use" + collector + "GC", "InstantNativeProbe", "stress"])
            run("startup-disabled-" + compact, common + [flag, "-Djdk.time.instantSpeedate=false",
                "-Djava.system.class.loader=InstantSpeedateDisabled$EarlyLoader", "InstantSpeedateDisabled"])
            run("missing-native-" + compact, common + [flag, "InstantSpeedateUnavailable"])
        result["status"] = "passed"
        print("PASS native integration " + args.target)
    except BaseException as ex:
        result["error"] = str(ex)
        raise
    finally:
        (out / "identities.json").write_text(json.dumps(identities, indent=2) + "\n")
        (out / "result.json").write_text(json.dumps(result, indent=2) + "\n")


if __name__ == "__main__":
    main()
