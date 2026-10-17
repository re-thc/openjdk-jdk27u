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

Execution requires a separately authorized, create-once 120-minute campaign.
No downloads, encodes, JMH runs or CI are launched by this driver.
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
        "725dbbbd8beb91307dca54a93a7b719f7756696a79dcf7c0821be8e78ecffd55",
}
FLAGS = ["--add-modules", "jdk.incubator.vector", "-XX:+UseSerialGC", "-Xms1g", "-Xmx1g"]
LIMITS = {"init": 30, "build": 4200, "qualify": 1800, "prepare": 120,
          "diagnose": 300, "review": 600, "time": 180}
CAMPAIGN_SECONDS = 7200
CLEANUP_SECONDS = 10
OWNER = "Harry Chan <38070640+re-thc@users.noreply.github.com>"
ASSESSMENTS = {
    "bmi2_applicability": {name + "-flags.log" for name in
                           ("base", "candidate", "base-debug", "candidate-debug")},
    "site_291": {"candidate.log", "candidate.xml"},
    "site_293": {"candidate.log", "candidate.xml"},
    "release_allocation": {"base.log", "candidate.log"},
    "wrapping_saturation": {"candidate.log"},
    "release_copies_spills": {"base.log", "candidate.log"},
    "release_code_size": {"base.log", "candidate.log", "base.xml", "candidate.xml"},
    "release_compilation_cost": {"base.xml", "candidate.xml"},
}
METHOD = "dev.jzstd.internal.BlockDecoder::decodeSequencesRolling"
ACTIVE_BUDGET = None


def digest(path):
    result = hashlib.sha256()
    with path.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            result.update(chunk)
    return result.hexdigest()


def json_digest(value):
    return hashlib.sha256(json.dumps(value, sort_keys=True).encode()).hexdigest()


class Budget:
    """Linux watchdog covers Python I/O/hashing, Git, subprocesses and cleanup."""

    def __init__(self, seconds):
        self.end = time.monotonic() + seconds

    def remaining(self, cleanup=False):
        remaining = self.end - time.monotonic() - (0 if cleanup else CLEANUP_SECONDS)
        if remaining <= 0:
            raise TimeoutError("Campaign/stage ceiling reached; stop inconclusive")
        return remaining

    def arm(self, cleanup=False):
        signal.setitimer(signal.ITIMER_REAL, self.remaining(cleanup))

    def __enter__(self):
        global ACTIVE_BUDGET
        self.previous = ACTIVE_BUDGET
        ACTIVE_BUDGET = self
        def expired(signum, frame):
            raise TimeoutError("Campaign/stage ceiling reached; stop inconclusive")
        self.handler = signal.signal(signal.SIGALRM, expired)
        self.arm()
        return self

    def __exit__(self, *exc):
        global ACTIVE_BUDGET
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, self.handler)
        ACTIVE_BUDGET = self.previous


def boot_id():
    return Path("/proc/sys/kernel/random/boot_id").read_text().strip()


def init_campaign(args):
    # The clock starts before filesystem/provenance work, never at the first JVM.
    start = time.monotonic()
    campaign = {"version": 1, "cell_id": CELL, "boot_id": boot_id(),
                "output": str(args.output), "started_monotonic": start,
                "deadline_monotonic": start + CAMPAIGN_SECONDS,
                "started_unix": time.time(), "overall_seconds": CAMPAIGN_SECONDS}
    args.output.mkdir(parents=True, exist_ok=False)
    path = args.output / "campaign.json"
    with path.open("x") as target:
        target.write(json.dumps(campaign, indent=2) + "\n")
    path.chmod(0o444)
    print(path)


def load_campaign(args, budget):
    path = args.output / "campaign.json"
    campaign = json.loads(path.read_text())
    if (campaign.get("version") != 1 or campaign.get("cell_id") != CELL
            or campaign.get("boot_id") != boot_id() or campaign.get("output") != str(args.output)
            or campaign.get("overall_seconds") != CAMPAIGN_SECONDS
            or campaign["deadline_monotonic"] - campaign["started_monotonic"] != CAMPAIGN_SECONDS
            or not 0 <= campaign["started_monotonic"] <= time.monotonic()):
        raise ValueError("Invalid campaign clock, machine or output directory")
    budget.end = min(budget.end, campaign["deadline_monotonic"])
    budget.arm()
    return digest(path)


def run_process(command, budget, **kwargs):
    budget.remaining()
    process = None
    try:
        process = subprocess.Popen(command, start_new_session=True, **kwargs)
        output, _ = process.communicate(timeout=budget.remaining())
    except BaseException:
        if process is None:
            raise
        # Reserve cleanup inside BOTH ceilings; never use an unbounded wait.
        try:
            os.killpg(process.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
        budget.end = min(budget.end, time.monotonic() + CLEANUP_SECONDS)
        budget.arm(cleanup=True)
        process.wait(timeout=budget.remaining(cleanup=True))
        raise
    return process.returncode, output


def git(root, *args):
    code, output = run_process(["git", "-C", str(root), *args], ACTIVE_BUDGET,
                               stdout=subprocess.PIPE, text=True)
    if code:
        raise ValueError("Git provenance query failed: " + str(root))
    return output.strip()


def configuration(root, debug=False):
    return root / "build" / ("lowmask-fastdebug" if debug else "lowmask-release")


def image(root, debug=False):
    # The `jdk` target is exploded; `images` puts lib/modules here.
    return configuration(root, debug) / "images/jdk"


def commands(args, stage):
    images = {"base": image(args.base_root), "candidate": image(args.jdk_root),
              "base-debug": image(args.base_root, True), "candidate-debug": image(args.jdk_root, True)}
    classes = args.output / "classes"
    tail = ["-Dprobe.warmup=2", "-cp", classes, "CodecProbe", "decode", args.corpus, "1", args.frame]
    test = args.jdk_root / "test/hotspot/jtreg/compiler/intrinsics/bmi/TestBzhiIntMask.java"
    if stage == "build":
        yield "build-images", ["bash", args.jdk_root / "doc/compiler-decoder-int-lowmask-build.sh",
                               args.base_root, args.jdk_root]
    elif stage == "qualify":
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
    elif stage == "time":
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
               "doc/compiler-decoder-int-lowmask-build.sh",
               "doc/test-compiler-decoder-int-lowmask-validate.py",
               "test/hotspot/jtreg/compiler/intrinsics/bmi/TestBzhiIntMask.java",
               "test/micro/org/openjdk/bench/vm/compiler/VariableIntLowMask.java"}
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
    files = {str(args.jdk_root / relative): digest(args.jdk_root / relative) for relative in PINS}
    for relative in ("doc/compiler-decoder-int-lowmask-validate.py",
                     "doc/compiler-decoder-int-lowmask-build.sh"):
        files[str(args.jdk_root / relative)] = digest(args.jdk_root / relative)
    if stage == "build":
        return files
    if stage in ("diagnose", "review", "time"):
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
            build = configuration(root, debug)
            source = build / "lowmask-source-head.txt"
            if source.read_text().strip() != heads["base" if root == args.base_root else "candidate"]:
                raise ValueError("Image build provenance differs from checkout: " + str(jdk))
            for path in (source, build / "spec.gmk", build / "lowmask-build-sha256.txt"):
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


def diagnostic_artifacts(args):
    directory = args.output / "diagnose"
    artifacts = {str(path.relative_to(directory)): digest(path)
                 for path in sorted(directory.rglob("*"))
                 if path.is_file() and path != directory / "manifest.json"}
    required = {name + suffix for name in ("base", "candidate", "base-debug", "candidate-debug")
                for suffix in (".log", ".xml", "-flags.log")}
    if not required <= artifacts.keys():
        raise ValueError("Missing diagnostic logs/XML")
    return artifacts


def diagnostic_evidence(args, campaign, heads):
    path = args.output / "diagnose/manifest.json"
    receipt = json.loads(path.read_text())
    artifacts = diagnostic_artifacts(args)
    if (not receipt.get("completed") or receipt.get("campaign_sha256") != campaign
            or receipt.get("heads") != heads or receipt.get("artifacts_sha256") != artifacts):
        raise ValueError("Incomplete, changed or different-campaign diagnostic evidence")
    # Source heads, exact product pins, classes, inputs and ALL images are in
    # this receipt; hash it together with every captured file, not just inputs.
    evidence = {"diagnose_manifest_sha256": digest(path), "artifacts_sha256": artifacts,
                "heads": heads, "product_sha256": PINS, "campaign_sha256": campaign,
                "inputs_images_classes_sha256": receipt["sha256"]}
    return json_digest(evidence), artifacts


def verdict_template(evidence, artifacts):
    return {"owner": OWNER, "decision": "stop", "evidence_sha256": evidence,
            "assessments": {name: {"verified": False, "finding": "",
                                    "evidence": [{"path": path, "sha256": artifacts[path],
                                                  "locator": ""} for path in sorted(required)]}
                            for name, required in ASSESSMENTS.items()}}


def validate_verdict(args, campaign, heads):
    evidence, artifacts = diagnostic_evidence(args, campaign, heads)
    verdict = json.loads(args.owner_verdict.read_text())
    if (verdict.get("owner") != OWNER or verdict.get("decision") != "allow-timing"
            or verdict.get("evidence_sha256") != evidence):
        raise ValueError("Missing owner allow-timing verdict bound to exact diagnostic evidence")
    for name, required in ASSESSMENTS.items():
        assessment = verdict.get("assessments", {}).get(name, {})
        if assessment.get("verified") is not True or not assessment.get("finding", "").strip():
            raise ValueError("Missing verified owner assessment: " + name)
        references = assessment.get("evidence", [])
        if not required <= {ref.get("path") for ref in references}:
            raise ValueError("Missing required release/site evidence: " + name)
        for ref in references:
            if (ref.get("path") not in artifacts or artifacts[ref["path"]] != ref.get("sha256")
                    or not ref.get("locator", "").strip()):
                raise ValueError("Unbound or unlocated owner evidence: " + name)
    return {"owner_verdict_sha256": digest(args.owner_verdict), "evidence_sha256": evidence}


def review_window(args, campaign):
    receipt = json.loads((args.output / "diagnose/manifest.json").read_text())
    if not receipt.get("completed") or receipt.get("campaign_sha256") != campaign:
        raise ValueError("Review requires completed diagnostics from this campaign")
    # The human's review clock starts at diagnose completion, not when a later
    # review invocation happens. Inter-stage gaps cannot renew this window.
    start = receipt["completed_monotonic"]
    if not 0 <= start <= time.monotonic():
        raise ValueError("Invalid diagnostic completion clock")
    return start, start + LIMITS["review"]


def run_stage(args, budget):
    stage = args.stage
    campaign = load_campaign(args, budget)
    if stage == "review":
        _, end = review_window(args, campaign)
        budget.end = min(budget.end, end)
        budget.arm()
    heads = verify_sources(args)
    files = dict(files_manifest(args, stage, heads))
    prerequisites = {"build": [], "qualify": ["build"], "prepare": ["build", "qualify"],
                     "diagnose": ["build", "qualify", "prepare"],
                     "review": ["build", "qualify", "prepare", "diagnose"],
                     "time": ["build", "qualify", "prepare", "diagnose", "review"]}
    for previous in prerequisites[stage]:
        receipt = json.loads((args.output / previous / "manifest.json").read_text())
        if (not receipt.get("completed") or receipt["heads"] != heads
                or receipt.get("campaign_sha256") != campaign):
            raise ValueError("Incomplete or different-source prerequisite: " + previous)
        for file, expected in receipt["sha256"].items():
            if file in files and files[file] != expected:
                raise ValueError("Changed prerequisite input: " + file)
        if previous == "prepare" and receipt["classes_sha256"] != classes_manifest(args):
            raise ValueError("Class set differs from the pinned prepare stage")
    verdict = validate_verdict(args, campaign, heads) if stage in ("review", "time") else {}
    if stage == "time":
        review_path = args.output / "review/manifest.json"
        reviewed = json.loads(review_path.read_text())
        if any(reviewed.get(key) != value for key, value in verdict.items()):
            raise ValueError("Owner verdict or diagnostic evidence changed after review")
        start, end = review_window(args, campaign)
        if not start <= reviewed.get("completed_monotonic", -1) <= end - CLEANUP_SECONDS:
            raise ValueError("Owner review did not complete inside the fixed review window")
        files[str(review_path)] = digest(review_path)
    directory = args.output / stage
    directory.mkdir(parents=True, exist_ok=False)
    manifest = {"cell_id": CELL, "historical_504_cell_identity_verified": False,
                "stage": stage, "heads": heads, "sha256": files, "records": [],
                "campaign_sha256": campaign, **verdict}
    path = directory / "manifest.json"
    path.write_text(json.dumps(manifest, indent=2) + "\n")
    env = dict(os.environ, JAVA_HOME=str(args.jtreg_java_home), LC_ALL="C")
    for name, command in commands(args, stage):
        command = list(map(str, command))
        record = {"name": name, "command": command}
        manifest["records"].append(record)
        path.write_text(json.dumps(manifest, indent=2) + "\n")
        with (directory / (name + ".log")).open("x") as log:
            try:
                record["exit_code"], _ = run_process(command, budget, cwd=directory,
                    env=env, stdout=log, stderr=subprocess.STDOUT)
            except (subprocess.TimeoutExpired, TimeoutError):
                record["timed_out"] = True
                path.write_text(json.dumps(manifest, indent=2) + "\n")
                raise
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
    if stage == "build":
        # Post-build image/provenance hashing remains inside the build budget.
        manifest["sha256"] = files_manifest(args, "qualify", heads)
    if stage == "diagnose":
        manifest["artifacts_sha256"] = diagnostic_artifacts(args)
    if stage in ("review", "time") and validate_verdict(args, campaign, heads) != verdict:
        raise ValueError("Owner verdict changed during the stage")
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
    manifest["completed_monotonic"] = time.monotonic()
    if digest(args.output / "campaign.json") != campaign:
        raise ValueError("Campaign clock changed during the stage")
    budget.remaining()
    path.write_text(json.dumps(manifest, indent=2) + "\n")
    if stage == "diagnose":
        evidence, artifacts = diagnostic_evidence(args, campaign, heads)
        (args.output / "owner-verdict.template.json").write_text(
            json.dumps(verdict_template(evidence, artifacts), indent=2) + "\n")
    print(path)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--stage", choices=LIMITS, help="select one stage; omitted prints all stages")
    parser.add_argument("--execute", action="store_true", help="run the selected, separately assigned stage")
    parser.add_argument("--owner-verdict", type=Path, help="owner review JSON; defaults to output/owner-verdict.json")
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
    if args.owner_verdict is None:
        args.owner_verdict = args.output / "owner-verdict.json"
    if args.execute:
        if not args.stage:
            parser.error("--execute requires one --stage")
        # Arm before campaign receipt loading, source checks or image hashing.
        with Budget(LIMITS[args.stage]) as budget:
            if args.stage == "init":
                init_campaign(args)
            else:
                run_stage(args, budget)
    else:
        print("# cell: " + CELL + "; original 504.5/1511.9 x86 identity unverified")
        for stage in [args.stage] if args.stage else LIMITS:
            print("# " + stage + ": whole-stage ceiling " + str(LIMITS[stage])
                  + " seconds, including hashing and cleanup; campaign ceiling 7200 seconds")
            for name, command in commands(args, stage):
                print(name + ": " + shlex.join(map(str, command)))


if __name__ == "__main__":
    main()
