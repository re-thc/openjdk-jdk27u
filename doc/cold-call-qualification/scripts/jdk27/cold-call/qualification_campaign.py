#!/usr/bin/env python3
"""One-shot repaired cold-call continuation. `plan` is inert; `run` needs separate approval.

Uses existing GNU timeout, installed tools and ordinary detached Git worktrees.
No downloads, remote Git operations, installations, retries, overlays or CI.
"""
import argparse
import ctypes
import hashlib
import json
import os
from pathlib import Path
import platform
import random
import re
import statistics
import subprocess
import time
import xml.etree.ElementTree as ET

from decode_capture import extract

ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
BASE = "01903ba375f94c0ab7f9193d3e36bd30fe663d7e"
CANDIDATE = "75ee82dff6f86e41aad8cedfe947a90a2b9296df"
CODEC = "7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6"
CORPUS_SHA = "dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9"
TARGET = "BlockDecoder::decodeSequencesRolling"
METHOD = "BlockDecoder decodeSequencesRolling"
COMMON = ["--add-modules", "jdk.incubator.vector", "-Xshare:off", "-Xms512m", "-Xmx512m",
          "-XX:+UseG1GC", "-Xbatch", "-XX:-TieredCompilation", "-XX:-UseOnStackReplacement",
          "-XX:CompileThresholdScaling=0.1"]
FOCUSED = ["compiler/regalloc/TestColdCallSpillPolicy.java",
           "compiler/regalloc/TestColdCallSpillPlacement.java",
           "compiler/regalloc/TestColdCallDerivedPointers.java"]
EXISTING = ["compiler/regalloc/TestC2IntPressure.java", "compiler/exceptions/TestSpilling.java"]
PLAN = dict(candidate=CANDIDATE, base=BASE, codec=CODEC, total_seconds=14400, jobs=4,
            builds=["base-release", "candidate-release", "candidate-fastdebug"],
            build_seconds=[2700, 2700, 3600],
            phase_seconds=dict(builds=9540, prepare=300, safety=900, capture=300,
                               timing=1200, resources=600),
            primary_decode_pairs=6, secondary_decode_pairs=3, encode_pairs=3,
            resource_repetitions=3, warmup_seconds=8, windows=5, window_ms=700,
            retries=0, native_version="1.5.7", default_change=False)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def dump(path, data):
    path.write_text(json.dumps(data, indent=2) + "\n")


class Campaign:
    def __init__(self, config, output):
        self.config = config
        self.output = output.resolve()
        # A failed or partial run cannot be resumed or silently overwritten.
        self.output.mkdir(parents=True, exist_ok=False)
        self.started = time.monotonic()
        self.phase_started = self.started
        self.phase = "prepare"
        self.records = []
        self.env = os.environ.copy()
        for key in ("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "MAKEFLAGS",
                    "JAVA_HOME", "CLASSPATH", "CC", "CXX", "CFLAGS", "CXXFLAGS", "LDFLAGS"):
            self.env.pop(key, None)
        self.env.update(config["environment"], LC_ALL="C.UTF-8", TZ="UTC")
        self.state = dict(plan=PLAN, config=config, status="running", records=self.records)
        self.save()

    def save(self):
        dump(self.output / "campaign.json", self.state)

    def start_phase(self, phase):
        self.phase = phase
        self.phase_started = time.monotonic()

    def run(self, name, command, cwd=ROOT, cap=180):
        require(not any(r["name"] == name for r in self.records), "No command retries: " + name)
        remaining = min(PLAN["total_seconds"] - (time.monotonic() - self.started),
                        PLAN["phase_seconds"][self.phase] - (time.monotonic() - self.phase_started), cap)
        require(remaining > 1, "Frozen time budget exhausted")
        command = list(map(str, command))
        log = self.output / (name + ".log")
        row = dict(name=name, phase=self.phase, command=command, cwd=str(cwd),
                   timeout_seconds=int(remaining), status="started")
        self.records.append(row)
        self.save()
        start = time.monotonic()
        # GNU timeout supplies process-group termination; wait4 provides a
        # per-command high-water RSS without installing GNU time or a sampler.
        with log.open("w") as stream:
            process = subprocess.Popen(["timeout", "--kill-after=10s", str(int(remaining)) + "s",
                                        *command], cwd=cwd, env=self.env, stdout=stream,
                                       stderr=subprocess.STDOUT)
            _, status, usage = os.wait4(process.pid, 0)
            process.returncode = os.waitstatus_to_exitcode(status)
        row.update(status="finished", exit_code=process.returncode,
                   wall_seconds=time.monotonic() - start, peak_rss_kib=usage.ru_maxrss,
                   cpu_seconds=usage.ru_utime + usage.ru_stime, log_sha256=sha(log))
        self.save()
        require(process.returncode == 0, "Command failed; no retry: " + name)
        return log.read_text(errors="replace")

    def flag(self, cell):
        return [] if cell in ("base", "default") else ["-XX:+UnlockDiagnosticVMOptions",
                "-XX:" + ("+" if cell == "on" else "-") + "UseColdCallSpillDeferral"]

    def java(self, cell, debug=False):
        kind = "candidate-fastdebug" if debug else ("base-release" if cell == "base" else "candidate-release")
        return self.images[kind] / "bin/java"

    def build(self):
        c = self.config
        source = Path(c["jdk_source"]).resolve()
        self.run("source-clean", ["git", "diff", "--exit-code"], cwd=source)
        self.state["runner_commit"] = self.run("runner-head", ["git", "rev-parse", "HEAD"]).strip()
        clean = self.run("runner-clean", ["git", "status", "--porcelain"])
        require(not clean.strip(), "Runner checkout must be committed and clean")
        self.run("codec-pin", ["git", "diff", "--exit-code", CODEC, "--", "src/main/java",
                              "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"])
        self.state["host"] = dict(platform=platform.platform(), affinity=sorted(os.sched_getaffinity(0)),
                                  cpu=Path("/proc/cpuinfo").read_text(),
                                  memory_limit=Path("/sys/fs/cgroup/memory.max").read_text(),
                                  cpu_limit=Path("/sys/fs/cgroup/cpu.max").read_text())
        require(platform.system() == "Linux" and platform.machine() == "x86_64", "This bounded proposal is Linux x86-64")
        for key in ("boot_jdk", "jtreg", "junit", "cc", "cxx"):
            require(Path(c[key]).exists(), "Missing installed prerequisite: " + key)
        for arg in c["configure"]:
            require(arg.startswith(("--with-toolchain-path=", "--with-extra-ldflags=", "--with-freetype",
                                    "--x-includes=", "--x-libraries=", "--with-cups-include=",
                                    "--with-fontconfig-include=", "--with-alsa-")), "Unreviewed configure option: " + arg)
        self.start_phase("builds")
        self.images = {}
        self.worktrees = {}
        for kind, cap in zip(PLAN["builds"], PLAN["build_seconds"]):
            revision = BASE if kind.startswith("base") else CANDIDATE
            tree = self.output / kind
            self.run(kind + "-checkout", ["git", "worktree", "add", "--detach", tree, revision], cwd=source)
            actual = self.run(kind + "-head", ["git", "rev-parse", "HEAD"], cwd=tree).strip()
            require(actual == revision, "Wrong compiler commit")
            level = "fastdebug" if kind.endswith("fastdebug") else "release"
            options = ["--with-conf-name=qualification", "--with-jobs=4", "--with-jvm-variants=server",
                       "--with-debug-level=" + level, "--with-boot-jdk=" + c["boot_jdk"],
                       "--with-jtreg=" + c["jtreg"], *c["configure"]]
            self.run(kind + "-configure", ["bash", "configure", *options], cwd=tree, cap=180)
            self.run(kind + "-images", ["make", "CONF=qualification", "JOBS=4", "images"], cwd=tree, cap=cap)
            image = tree / "build/qualification/images/jdk"
            self.images[kind] = image
            self.worktrees[kind] = tree
            self.run(kind + "-version", [image / "bin/java", "-version"])
            self.state.setdefault("images", {})[kind] = dict(commit=revision,
                libjvm_sha256=sha(image / "lib/server/libjvm.so"),
                spec_sha256=sha(tree / "build/qualification/spec.gmk"),
                release=(image / "release").read_text())
        self.save()

    def prepare(self):
        self.start_phase("prepare")
        sources = sorted((ROOT / "src/main/java").rglob("*.java"))
        corpus = self.output / "source.bin"
        corpus.write_bytes(b"".join(p.read_bytes() + b"\n" for p in sources))
        require(len(sources) == 37 and sha(corpus) == CORPUS_SHA, "Pinned source corpus changed")
        self.prepared = self.output / "prepared"
        self.run("prepare-57-frames", ["python3", HERE / "qualify_decoder.py", "prepare",
            "--java-home", self.images["candidate-release"], "--junit", self.config["junit"],
            "--source-corpus", corpus, "--output", self.prepared])
        frames = json.loads((self.prepared / "frames.json").read_text())
        require(frames["native_version"] == PLAN["native_version"] and len(frames["rows"]) == 57,
                "Native version/frame coverage mismatch")
        self.classes = self.prepared / "classes"
        self.run("compile-probe", [self.images["candidate-release"] / "bin/javac",
            "--add-modules", "jdk.incubator.vector", "-cp", self.classes, "-d", self.classes,
            ROOT / "scripts/jdk27/CodecProbe.java"])
        self.native = self.output / "native-probe"
        self.run("compile-native-probe", [self.config["cc"], "-O3", ROOT / "scripts/jdk27/native-probe.c",
                                          "-lzstd", "-o", self.native])
        native_version = self.run("native-version", [self.native, "--version"])
        require("libzstd 1.5.7 (headers 1.5.7)" in native_version, "Native benchmark header/library version mismatch")
        native_dir = self.output / "native-test"
        native_dir.mkdir()
        test_source = self.worktrees["candidate-release"] / "test/hotspot/jtreg/compiler/regalloc/libColdCallSpillPolicy.cpp"
        self.run("compile-native-policy", [self.config["cxx"], "-std=c++17", "-fPIC", "-shared",
            "-Wall", "-Wextra", "-Werror", "-I" + str(self.images["candidate-release"] / "include"),
            "-I" + str(self.images["candidate-release"] / "include/linux"), test_source,
            "-o", native_dir / "libColdCallSpillPolicy.so"])
        self.native_dir = native_dir
        self.corpora = self.prepared / "corpora"
        rng = random.Random(20261017)
        block = bytes(rng.randrange(256) for _ in range(16384))
        (self.corpora / "periodic.bin").write_bytes(block * 256)
        (self.corpora / "incompressible.bin").write_bytes(bytes(rng.randrange(256) for _ in range(1 << 20)))
        zstd = ctypes.CDLL("libzstd.so.1")
        zstd.ZSTD_compressBound.argtypes = [ctypes.c_size_t]
        zstd.ZSTD_compressBound.restype = ctypes.c_size_t
        zstd.ZSTD_compress.argtypes = [ctypes.c_void_p, ctypes.c_size_t, ctypes.c_void_p, ctypes.c_size_t, ctypes.c_int]
        zstd.ZSTD_compress.restype = ctypes.c_size_t
        zstd.ZSTD_isError.argtypes = [ctypes.c_size_t]
        for name in ("periodic", "incompressible"):
            raw = (self.corpora / (name + ".bin")).read_bytes()
            buffer = ctypes.create_string_buffer(zstd.ZSTD_compressBound(len(raw)))
            size = zstd.ZSTD_compress(buffer, len(buffer), raw, len(raw), 1)
            require(not zstd.ZSTD_isError(size), "Native compression failed")
            (self.corpora / (name + ".l1.zst")).write_bytes(buffer.raw[:size])
        self.state["inputs"] = {p.name: dict(bytes=p.stat().st_size, sha256=sha(p))
                                for p in self.corpora.iterdir() if p.is_file()}
        self.state["tool_versions"] = {
            key: self.run("version-" + key, [self.config[key], "--version"]) for key in ("cc", "cxx")}
        self.save()

    def safety(self):
        self.start_phase("safety")
        for kind in PLAN["builds"]:
            tree, image = self.worktrees[kind], self.images[kind]
            suites = [] if kind.startswith("base") else [("focused", FOCUSED, False)]
            tests = EXISTING + (["compiler/regalloc/TestVerifyRegisterAllocator.java"] if kind.endswith("fastdebug") else [])
            suites.append(("existing", tests, not kind.startswith("base")))
            for suite, tests, enabled in suites:
                stem = kind + "-" + suite
                options = ["-vmoption:-XX:+UnlockDiagnosticVMOptions", "-vmoption:-XX:+UseColdCallSpillDeferral"] if enabled else []
                output = self.run(stem, [Path(self.config["jtreg"]) / "bin/jtreg", "-conc:1", "-othervm",
                    "-jdk:" + str(image), "-nativepath:" + str(self.native_dir),
                    "-w:" + str(self.output / (stem + "-work")), "-r:" + str(self.output / (stem + "-report")),
                    *options, *[tree / "test/hotspot/jtreg" / test for test in tests]], cap=300)
                require(re.search(r"Test results: passed: " + str(len(tests)) + r"(?:\s|$)", output),
                        "Missing exact focused test count: " + stem)

        # The exact common-source prerequisite gets one focused behavioral check.
        tree, image = self.worktrees["candidate-fastdebug"], self.images["candidate-fastdebug"]
        tests = ["runtime/handshake/AsyncHandshakeWalkStackTest.java",
                 "runtime/Unsafe/InternalErrorTest.java"]
        stem = "candidate-fastdebug-handshake-prerequisite"
        output = self.run(stem, [Path(self.config["jtreg"]) / "bin/jtreg", "-conc:1", "-othervm",
            "-jdk:" + str(image), "-w:" + str(self.output / (stem + "-work")),
            "-r:" + str(self.output / (stem + "-report")),
            *[tree / "test/hotspot/jtreg" / test for test in tests]], cap=300)
        require(re.search(r"Test results: passed: 2(?:\s|$)", output),
                "Missing exact handshake prerequisite test count")

    def decoder_command(self, cell, stem, debug=False, assembly=False, memory=False):
        flags = [*COMMON, *self.flag(cell), "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                 "-XX:LogFile=" + str(self.output / (stem + ".xml"))]
        if debug:
            flags += ["-XX:+VerifyRegisterAllocator"]
        if assembly:
            directive = self.output / (stem + "-directives.json")
            item = dict(match="dev.jzstd.internal." + TARGET, PrintAssembly=True)
            if debug:
                item["c2"] = dict(TraceSpilling=True)
            dump(directive, [item])
            flags += ["-XX:CompilerDirectivesFile=" + str(directive)]
        if memory:
            flags += ["-XX:CompileCommand=MemStat,dev.jzstd.internal.BlockDecoder::decodeSequencesRolling,print",
                      "-XX:+PrintCompilerMemoryStatisticsAtExit", "-XX:+CITime"]
        return [self.java(cell, debug), *flags, "-cp", self.classes,
                "dev.jzstd.DecoderQualification", "check", self.corpora, "32"]

    def decoder_proof(self, stem, log, cell, debug=False, assembly=False):
        require("PASS frames=57 rounds=32" in log, "Decoder correctness marker missing")
        xml = ET.parse(self.output / (stem + ".xml"))
        nmethods = [n.attrib for n in xml.iter("nmethod") if METHOD in n.get("method", "") and
                    n.get("compiler") == "c2" and n.get("compile_kind", "normal") == "normal"]
        require(nmethods, "No normal-entry production C2 parser")
        tasks = [t for t in xml.iter("task") if METHOD in t.get("method", "")]
        require(not any(list(t.iter("failure")) for t in tasks), "Target compilation bailout")
        proof = dict(nmethods=nmethods, tasks=[dict(t.attrib, regalloc=[n.attrib for n in t.iter("regalloc")],
                     done=[n.attrib for n in t.iter("task_done")]) for t in tasks])
        if assembly:
            header, address, code = extract(log, TARGET)
            header_pos = log.rfind(header)
            tail = log[header_pos:].split("[/MachCode]", 1)[0]
            compile_id = re.match(r"Compiled method \(c2\)\s+\d+\s+(\d+)\s+", header)[1]
            require(compile_id == nmethods[-1]["compile_id"], "Assembly/XML compile-ID mismatch")
            require(not any(n.get("compile_id") == compile_id for n in xml.iter("make_not_entrant")),
                    "Final parser compilation became nonentrant")
            require(re.search(r"\{static_call\}.{0,750}?\*invokestatic readPartialLong.{0,750}?"
                              r"BlockDecoder::decodeSequencesRolling@684", tail, re.S),
                    "Returning in-loop readPartialLong call missing")
            proof.update(header=header, compile_id=compile_id, main_code_bytes=len(code))
            if debug:
                begin = log.rfind("CCINITIAL ", 0, header_pos)
                require(begin >= 0, "Missing final-compile initial-allocation marker")
                proof["deferred"] = len(re.findall(r"^CCDEFER ", log[begin:header_pos], re.M))
                require((proof["deferred"] > 0) == (cell == "on"), "Intended production activation missing/unexpected")
            self.run(stem + "-disassemble", ["python3", HERE / "decode_capture.py", self.output / (stem + ".log"),
                     self.output / (stem + ".asm"), "--target", TARGET])
        self.state.setdefault("decoder_proofs", {})[stem] = proof
        self.save()
        return proof

    def capture(self):
        self.start_phase("capture")
        for debug, cells in ((False, ("base", "default", "off", "on")), (True, ("off", "on"))):
            for cell in cells:
                stem = "capture-" + ("debug-" if debug else "release-") + cell
                log = self.run(stem, self.decoder_command(cell, stem, debug, assembly=True))
                self.decoder_proof(stem, log, cell, debug, assembly=True)

    def timing(self):
        self.start_phase("timing")
        rows = []
        self.state["timing"] = rows
        for mode in ("decode", "encode"):
            for corpus in ("source", "periodic", "incompressible"):
                pairs = 6 if mode == "decode" and corpus == "source" else 3
                cells = ["base", "off", "on"] + (["control"] if mode == "decode" and corpus == "source" else [])
                cells += ["native"] if mode == "decode" else []
                for pair in range(pairs):
                    order = cells[pair % len(cells):] + cells[:pair % len(cells)]
                    if pair % 2:
                        order = list(reversed(order))
                    for cell in order:
                        stem = f"timing-{mode}-{corpus}-{pair}-{cell}"
                        source = self.corpora / (corpus + ".bin")
                        frame = self.corpora / (corpus + ".l1.zst") if mode == "decode" else self.output / (stem + ".zst")
                        before = sha(frame) if mode == "decode" else None
                        program = [self.native] if cell == "native" else [self.java(cell), *COMMON, *self.flag(cell),
                            "-XX:+UnlockDiagnosticVMOptions", "-XX:+LogCompilation",
                            "-XX:LogFile=" + str(self.output / (stem + ".xml")),
                            "-Dprobe.warmup=8", "-Dprobe.compilerStats=true", "-cp", self.classes, "CodecProbe"]
                        log = self.run(stem, [*program, mode, source, "1", frame], cap=35)
                        rate = re.search(r"median=([\d.]+) MB/s", log)
                        require(rate is not None, "Missing throughput result")
                        row = dict(mode=mode, corpus=corpus, pair=pair, cell=cell,
                                   median_MB_s=float(rate[1]), frame_sha256=sha(frame), source_sha256=sha(source))
                        require(before is None or before == row["frame_sha256"], "Read-only timed frame changed")
                        if cell != "native":
                            comp = re.search(r"COMPILER warmup_ms=(\d+) measured_ms=(\d+) boundary_uptime_ms=(\d+)", log)
                            require(comp is not None, "Missing compilation stability counters")
                            row["measured_compilation_ms"] = int(comp[2])
                            require(int(comp[2]) <= 10, "Unsettled timed compilation; no retry")
                            xml = ET.parse(self.output / (stem + ".xml"))
                            boundary = int(comp[3]) / 1000
                            names = METHOD if mode == "decode" else "BlockCompressor parseFastCarriedSeven"
                            compiled = [n for n in xml.iter("nmethod") if names in n.get("method", "") and
                                        n.get("compiler") == "c2" and n.get("compile_kind", "normal") == "normal"]
                            row["target_nmethods"] = [n.attrib for n in compiled]
                            # Source exercises the parser. Raw/RLE controls may
                            # legitimately bypass it and are not activation claims.
                            if corpus == "source":
                                require(compiled and float(compiled[-1].get("stamp")) < boundary - 0.1,
                                        "Primary target not C2 before timing boundary")
                                selected_id = compiled[-1].get("compile_id")
                                require(not any(n.get("compile_id") == selected_id for n in xml.iter("make_not_entrant")),
                                    "Timed target was invalidated near/during measurement")
                        rows.append(row)
                        self.save()
                hashes = {r["frame_sha256"] for r in rows if r["mode"] == mode and r["corpus"] == corpus}
                require(len(hashes) == 1, "Frame bytes differ across variants/repetitions")

    def resources(self):
        self.start_phase("resources")
        # The parser process measures C2 itself. A full fresh javac of the pinned
        # production sources supplies one ordinary compiler-heavy protection case.
        sources = sorted((ROOT / "src/main/java").rglob("*.java"))
        reference_classes = None
        for repeat in range(3):
            cells = ["base", "off", "on"]
            cells = cells[repeat:] + cells[:repeat]
            for cell in cells:
                stem = f"resource-parser-{repeat}-{cell}"
                log = self.run(stem, self.decoder_command(cell, stem, memory=True))
                self.decoder_proof(stem, log, cell)
                proof = self.state["decoder_proofs"][stem]
                final_id = proof["nmethods"][-1]["compile_id"]
                peaks = [dict(compile_id=m[1], result=m[2], peak=int(m[3])) for m in re.finditer(
                    r"c2 \((\d+)\) \(([^)]+)\) Arena usage [^\r\n]*BlockDecoder::decodeSequencesRolling[^\r\n]*: Total Usage: (\d+)", log)]
                final_peaks = [p["peak"] for p in peaks if p["compile_id"] == final_id and p["result"] == "ok"]
                require(len(final_peaks) == 1, "No unambiguous final-compile parser arena peak")
                self.records[-1]["parser_arena_peaks"] = peaks
                self.records[-1]["parser_peak_arena_chunk_capacity_bytes"] = final_peaks[0]
                final_task = next(t for t in proof["tasks"] if t["compile_id"] == final_id)
                require(final_task["done"] and final_task["done"][-1].get("success") == "1", "Parser task did not succeed")
                self.records[-1]["final_parser_compile_seconds"] = (
                    float(final_task["done"][-1]["stamp"]) - float(final_task["stamp"]))
                stem = f"resource-javac-{repeat}-{cell}"
                classes = self.output / (stem + "-classes")
                image = self.images["base-release" if cell == "base" else "candidate-release"]
                flags = ["-J" + f for f in [*COMMON[2:], *self.flag(cell), "-XX:+UnlockDiagnosticVMOptions",
                         "-XX:+CITime", "-XX:CompileCommand=MemStat,com.sun.tools.javac.*::*,print",
                         "-XX:+LogCompilation", "-XX:LogFile=" + str(self.output / (stem + ".xml")),
                         "-XX:+PrintCompilerMemoryStatisticsAtExit"]]
                log = self.run(stem, [image / "bin/javac", *flags, "--add-modules", "jdk.incubator.vector",
                                      "-d", classes, *sources], cap=90)
                require("Arena usage com/sun/tools/javac" in log, "No C2 javac arena statistics")
                xml = ET.parse(self.output / (stem + ".xml"))
                self.records[-1]["jit_nmethods"] = [n.attrib for n in xml.iter("nmethod")]
                self.records[-1]["jit_tasks"] = [dict(t.attrib,
                    done=[n.attrib for n in t.iter("task_done")],
                    failures=[n.attrib for n in t.iter("failure")],
                    allocation=[n.attrib for n in t.iter("regalloc")]) for t in xml.iter("task")]
                peaks = [int(x) for x in re.findall(r"c2 .*Arena usage com/sun/tools/javac.*?: Total Usage: (\d+)", log)]
                require(peaks, "Missing per-task javac arena peaks")
                self.records[-1]["javac_peak_arena_chunk_capacity_bytes"] = max(peaks)
                products = {str(p.relative_to(classes)): sha(p) for p in classes.rglob("*.class")}
                require(products and (reference_classes is None or products == reference_classes), "javac class output changed")
                reference_classes = products
                self.save()

    def summarize(self):
        rows = self.state["timing"]
        comparisons = {}
        for mode in ("decode", "encode"):
            for corpus in ("source", "periodic", "incompressible"):
                selected = [r for r in rows if r["mode"] == mode and r["corpus"] == corpus]
                paired = []
                for pair in sorted({r["pair"] for r in selected}):
                    values = {r["cell"]: r["median_MB_s"] for r in selected if r["pair"] == pair}
                    paired.append(dict(on_over_off=values["on"] / values["off"],
                                       off_over_base=values["off"] / values["base"]))
                    if "control" in values:
                        paired[-1]["control_over_off"] = values["control"] / values["off"]
                comparisons[mode + "-" + corpus] = dict(pairs=paired,
                    on_over_off=statistics.median(p["on_over_off"] for p in paired),
                    off_over_base=statistics.median(p["off_over_base"] for p in paired))
        primary = [r for r in rows if r["mode"] == "decode" and r["corpus"] == "source"]
        rates = {cell: statistics.median(r["median_MB_s"] for r in primary if r["cell"] == cell)
                 for cell in ("base", "off", "on", "native")}
        denominator = 1 / rates["off"] - 1 / rates["native"]
        gap = (1 / rates["off"] - 1 / rates["on"]) / denominator if denominator > 0 else None
        rng = random.Random(20261017)
        for comparison in comparisons.values():
            pairs = comparison["pairs"]
            for metric in pairs[0]:
                bootstrap = sorted(statistics.median(rng.choice(pairs)[metric] for _ in pairs)
                                   for _ in range(10000))
                comparison[metric + "_paired_bootstrap_95_interval"] = [bootstrap[250], bootstrap[9749]]
                comparison[metric] = statistics.median(p[metric] for p in pairs)
        self.state.update(status="execution-complete-review-required", comparisons=comparisons,
                          primary_rates=rates, primary_time_gap_fraction_closed=gap,
                          manual_gates=["Review published doc/cold-call-qualification/PROTOCOL.md",
                            "Relocation-aware base/default/off code and regalloc equivalence",
                            "All-path transport ledger and target compilation-time/arena statistics",
                            "Paired process uncertainty and protected workload resource limits"],
                          integration="No automatic PR, default change, merge or publication")
        self.save()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["plan", "run"])
    parser.add_argument("--config", type=Path, default=HERE / "qualification-host.json")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.action == "plan":
        print(json.dumps(dict(plan=PLAN, config=json.loads(args.config.read_text())), indent=2))
        return
    require(args.output is not None, "run requires a new --output directory")
    campaign = Campaign(json.loads(args.config.read_text()), args.output)
    try:
        campaign.build()
        campaign.prepare()
        campaign.safety()
        campaign.capture()
        campaign.timing()
        campaign.resources()
        campaign.summarize()
    except BaseException as error:
        campaign.state.update(status="stopped-no-retry", failure=str(error))
        campaign.save()
        raise


if __name__ == "__main__":
    main()
