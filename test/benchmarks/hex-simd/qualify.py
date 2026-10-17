#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

"""One opt-in Linux qualification batch. Source-prepared; do not import to run it.

No installations, CI, PR, push or merge. All subprocesses use argument arrays.
Exit 0: LOCAL_GO; 2: measured NO_GO; 3: INCONCLUSIVE; 4: incomplete/invalid;
64: invocation error; 124: watchdog forced exit. result.json is authoritative.
"""
import argparse
import csv
import ctypes
import hashlib
import json
import math
import os
from pathlib import Path
import re
import resource
import shlex
import shutil
import signal
import statistics
import subprocess
import sys
import threading
import time

START = time.monotonic()
BASE = "89885a6288e7aaabd01678a704a586272c0f96e3"
LOCK_SHA = "c9e0c1f477d6afb94459ac1fde0afd70bac57c3dfebbf6554b85948d47a60e37"
TOTAL = 6 * 60 * 60
RAM = 8 * 1024**3
DISK = 40 * 1024**3
POST_BUILD_RESERVE = 105 * 60  # combined build window, not an individual build timeout
MEASUREMENT_WINDOW = 75 * 60  # nominal loops alone take 2,754 s (45.9 min)
PLAIN_G1 = [0, 1, 8, 16, 32, 64, 127, 128, 129, 511, 512, 1023, 1024, 1025, 4096, 65536, 1048576]
PLAIN_OTHER = [0, 32, 128, 1024, 4096, 65536]
PLAIN_UTF16 = [32, 128, 1024, 65536]
PROTECTED = {"sha256-hex": 65536, "fingerprint": 32, "uppercase-offset-encode": 4096,
             "offset-decode": 65536, "charsequence": 65536, "appendable": 4096,
             "late-invalid": 65536, "utf16-invalid": 65536, "mixed-101": 65536}
ERRORS = {"late-invalid", "utf16-invalid"}
BAD_JNI = re.compile(r"WARNING in native method|FATAL ERROR in native method|JNI DETECTED ERROR|WARNING: JNI local refs", re.I)


class Stop(Exception):
    def __init__(self, category, detail):
        self.category, self.detail = category, detail
        super().__init__(detail)


class Arguments(argparse.ArgumentParser):
    def error(self, message):
        self.print_usage(sys.stderr)
        self.exit(64, "qualification invocation: " + message + "\n")


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")
    temporary.replace(path)


def proc_snapshot():
    result = {}
    for entry in Path("/proc").iterdir():
        if not entry.name.isdigit():
            continue
        try:
            raw = (entry / "stat").read_text()
            fields = raw[raw.rfind(")") + 2:].split()
            result[int(entry.name)] = {"parent": int(fields[1]), "start": int(fields[19]),
                                      "rss": max(0, int(fields[21])) * os.sysconf("SC_PAGE_SIZE"),
                                      "state": fields[0]}
        except (OSError, ValueError, IndexError):
            continue  # processes can exit while /proc is sampled
    return result


def process_start(pid):
    raw = (Path("/proc") / str(pid) / "stat").read_text()
    return int(raw[raw.rfind(")") + 2:].split()[19])


class Supervisor:
    """Own descendants only, including daemonized grandchildren adopted by subreaper."""
    def __init__(self, root):
        self.root = root
        self.logs = root / "logs"
        self.logs.mkdir()
        self.end = START + TOTAL
        self.work_end = self.end - 10  # cleanup and final record stay inside six hours
        self.stop = threading.Event()
        self.abort = threading.Event()
        self.reason = None
        self.abort_at = None
        self.active_end = self.work_end
        self.active = "preparation"
        self.owned = {}  # pid -> kernel starttime, never signal a reused PID
        self.meta_roots = []
        self.lock = threading.RLock()
        self.disk_lock = threading.RLock()
        self.peak_rss = self.peak_disk = 0
        self.disk_full = self.disk_fast_base = 0
        self.fast = False
        self.commands = []
        self.pid = os.getpid()
        self.cpus = sorted(os.sched_getaffinity(0))[:2]
        if len(self.cpus) < 2:
            raise Stop("ENVIRONMENT", "two available CPU affinity slots are required")
        os.sched_setaffinity(0, self.cpus)
        resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
        libc = ctypes.CDLL(None, use_errno=True)
        libc.prctl.argtypes = [ctypes.c_int, ctypes.c_ulong, ctypes.c_ulong, ctypes.c_ulong, ctypes.c_ulong]
        libc.prctl.restype = ctypes.c_int
        if libc.prctl(36, 1, 0, 0, 0) != 0:  # PR_SET_CHILD_SUBREAPER
            raise Stop("ENVIRONMENT", "cannot enable Linux child subreaper: errno " + str(ctypes.get_errno()))
        # pidfds bind signals to the original process, including after PID reuse.
        try:
            fd = os.pidfd_open(self.pid)
            os.close(fd)
        except OSError as error:
            raise Stop("ENVIRONMENT", "pidfd ownership-safe cleanup unavailable: " + str(error)) from error
        self.disk_check(full=True)
        self.watch = threading.Thread(target=self.watch_processes, daemon=True)
        self.disk_watch = threading.Thread(target=self.watch_disk, daemon=True)
        self.watch.start()
        self.disk_watch.start()

    def owned_now(self):
        snapshot = proc_snapshot()
        with self.lock:
            identities = {pid for pid, start in self.owned.items()
                          if pid in snapshot and snapshot[pid]["start"] == start}
            parents = identities | {self.pid}
            while True:
                found = {pid for pid, info in snapshot.items() if info["parent"] in parents}
                if found <= parents:
                    break
                parents |= found
            parents.discard(self.pid)
            for pid in parents:
                if pid in snapshot:
                    self.owned[pid] = snapshot[pid]["start"]
            return {pid: snapshot[pid] for pid in parents if pid in snapshot}

    def signal_owned(self, sig):
        for pid, info in self.owned_now().items():
            if info["state"] != "Z":
                fd = None
                try:
                    fd = os.pidfd_open(pid)
                    if process_start(pid) == info["start"]:
                        signal.pidfd_send_signal(fd, sig)
                except (ProcessLookupError, FileNotFoundError):
                    pass
                finally:
                    if fd is not None:
                        os.close(fd)

    def request_abort(self, reason):
        with self.lock:
            if not self.abort.is_set():
                self.reason, self.abort_at = reason, time.monotonic()
                self.abort.set()
        self.signal_owned(signal.SIGTERM)

    def cleanup(self):
        # TERM then KILL; also reap adopted javac servers and other orphans.
        for sig, grace in [(signal.SIGTERM, 1.5), (signal.SIGKILL, 1.5)]:
            self.signal_owned(sig)
            until = time.monotonic() + grace
            while time.monotonic() < until:
                live = self.owned_now()
                for pid in live:
                    try:
                        os.waitpid(pid, os.WNOHANG)
                    except ChildProcessError:
                        pass
                if not any(i["state"] != "Z" for i in self.owned_now().values()):
                    return
                time.sleep(0.05)
        live = {str(pid): info for pid, info in self.owned_now().items() if info["state"] != "Z"}
        if live:
            raise Stop("CLEANUP_UNCERTAIN", "owned processes did not exit: " + json.dumps(live))

    def footprint(self, roots):
        total, seen = 0, set()
        pending = list(roots)
        while pending:
            self.check()
            path = pending.pop()
            try:
                stat = path.lstat()
                identity = stat.st_dev, stat.st_ino
                if identity in seen:
                    continue
                seen.add(identity)
                total += max(stat.st_blocks * 512, stat.st_size)
                if path.is_dir() and not path.is_symlink():
                    pending.extend(path.iterdir())
            except FileNotFoundError:
                pass
        return total

    def disk_check(self, full):
        with self.disk_lock:
            self.disk_check_locked(full)

    def disk_check_locked(self, full):
        # During closed Java measurement workloads only logs/tmp can grow:
        # no file-I/O workload, perfdata disabled, ErrorFile directed to logs.
        # Full scans bracket closed measurement phases, not every fresh JVM:
        # otherwise scanning two whole JDK trees would dominate cold wall time.
        fast_size = self.footprint([self.logs, self.root / "tmp", *self.root.glob("*.json*")])
        if full:
            size = self.footprint([self.root, *self.meta_roots])
            self.disk_full, self.disk_fast_base = size, fast_size
        else:
            size = self.disk_full + max(0, fast_size - self.disk_fast_base)
        self.peak_disk = max(self.peak_disk, size)
        if size > DISK:
            raise Stop("RESOURCE", f"owned disk ceiling exceeded: {size} > {DISK}")

    def watch_disk(self):
        while not self.stop.wait(5):
            try:
                with self.disk_lock:
                    self.disk_check_locked(full=not self.fast)
            except Exception as error:
                self.request_abort("disk monitor: " + str(error))
                return

    def watch_processes(self):
        while not self.stop.wait(0.25):
            try:
                now = time.monotonic()
                own = self.owned_now()
                rss = sum(i["rss"] for i in own.values())
                me = proc_snapshot().get(self.pid)
                if me:
                    rss += me["rss"]
                self.peak_rss = max(self.peak_rss, rss)
                if rss > RAM:
                    self.request_abort(f"aggregate owned RSS ceiling exceeded: {rss} > {RAM}")
                if now >= self.active_end or now >= self.work_end:
                    self.request_abort("deadline exhausted during " + self.active)
                if self.abort.is_set() and now >= self.abort_at + 2:
                    self.signal_owned(signal.SIGKILL)
                if now >= self.end or (self.abort.is_set() and now >= self.abort_at + 5):
                    self.signal_owned(signal.SIGKILL)
                    # A stuck result filesystem must not disable the deadline.
                    recorder = threading.Thread(target=self.emergency_record, daemon=True)
                    recorder.start()
                    recorder.join(timeout=0.1)
                    os._exit(124)
            except Exception as error:
                self.request_abort("process monitor: " + str(error))

    def emergency_record(self):
        write_json(self.root / "result.json", {"status": "INCOMPLETE_RESOURCE_OR_CLEANUP",
                   "reason": self.reason, "command": self.active,
                   "live_owned": self.owned_now(), "peak_rss": self.peak_rss,
                   "peak_disk": self.peak_disk, "elapsed_s": time.monotonic() - START})

    def check(self):
        if self.abort.is_set():
            raise Stop("RESOURCE_OR_INTERRUPTION", self.reason)
        if time.monotonic() >= self.work_end:
            raise Stop("RESOURCE", "six-hour work deadline exhausted; cleanup reserve reached")

    def run(self, label, argv, cwd, env, deadline=None, timeout=None, measurement=False):
        self.check()
        self.cleanup()  # no abandoned compiler/server during a timing process
        with self.disk_lock:
            self.disk_check_locked(full=not (self.fast and measurement))
            self.fast = measurement  # no full scan can overlap a timed JVM
        limit = min(self.work_end, deadline or self.work_end)
        if timeout is not None:
            limit = min(limit, time.monotonic() + timeout)
        if limit <= time.monotonic():
            raise Stop("RESOURCE", "no remaining budget for " + label)
        output, errors = self.logs / (label + ".stdout"), self.logs / (label + ".stderr")
        entry = {"label": label, "argv": list(map(str, argv)), "cwd": str(cwd),
                 "remaining_s": limit - time.monotonic(), "measurement": measurement,
                 "stdout": str(output), "stderr": str(errors)}
        self.commands.append(entry)
        write_json(self.root / "commands.json", self.commands)
        self.active, self.active_end = label, limit
        process = None
        try:
            with output.open("w") as stdout, errors.open("w") as stderr:
                # Accurate cold wall time begins after monitoring/log setup.
                started = time.perf_counter_ns()
                process = subprocess.Popen(list(map(str, argv)), cwd=cwd, env=env,
                        stdin=subprocess.DEVNULL, stdout=stdout, stderr=stderr, start_new_session=True)
                with self.lock:
                    snapshot = proc_snapshot().get(process.pid)
                    if snapshot:
                        self.owned[process.pid] = snapshot["start"]
                code = process.wait()  # watchdog handles deadlines without 50-ms wait polling
                wall_ns = time.perf_counter_ns() - started
            entry.update(returncode=code, process_wall_ns=wall_ns)
            self.check()
            if time.monotonic() >= limit:
                raise Stop("RESOURCE", "command completed after its deadline: " + label)
            if code != 0:
                raise Stop("COMMAND_FAILED", f"{label}: exit {code}; see {output} and {errors}")
            return output, errors, wall_ns
        finally:
            self.active_end = self.work_end
            self.cleanup()
            write_json(self.root / "commands.json", self.commands)
            self.disk_check(full=not measurement)

    def finish(self):
        self.cleanup()
        self.disk_check(full=True)

    def close_watchers(self):
        self.stop.set()
        self.watch.join(timeout=1)
        self.disk_watch.join(timeout=1)


def digest(path, supervisor):
    result = hashlib.sha256()
    with path.open("rb") as stream:
        while data := stream.read(4 * 1024**2):
            supervisor.check()
            result.update(data)
    return result.hexdigest()


def require(condition, message):
    if not condition:
        raise Stop("EVIDENCE_OR_CORRECTNESS", message)


def parse_hexformat_testng(records):
    """Require one known summary in the expected JTR; no generic-Passed fallback."""
    records = [(Path(path), text) for path, text in records]
    hex_records = [(path, text) for path, text in records if path.name == "HexFormatTest.jtr"]
    require(len(hex_records) == 1, "expected exactly one HexFormatTest JTR")
    path, text = hex_records[0]
    summaries = [(record, line) for record, contents in records for line in contents.splitlines()
                 if re.match(r"^\s*Total tests run\b", line, re.I)]
    require(len(summaries) == 1 and summaries[0][0] == path,
            "expected exactly one HexFormatTest TestNG summary: " + str(path))
    totals = re.fullmatch(r"Total tests run: ([0-9]+), Passes: ([0-9]+), Failures: ([0-9]+), Skips: ([0-9]+)",
                          summaries[0][1])
    require(totals is not None, "unrecognized TestNG summary format: " + str(path))
    total, passed, failed, skipped = map(int, totals.groups())
    require(total == 154 and failed == 0 and total == passed + skipped,
            "TestNG failures/incomplete cases: " + str(path))
    outcomes = re.findall(r"test HexFormatTest\.(\w+)\((?:(?!test HexFormatTest\.).)*?\):\s*(success|failure|skip\w*)",
                          text, re.I | re.S)
    skipped_methods = [method for method, outcome in outcomes if outcome.lower().startswith("skip")]
    require(len(skipped_methods) == skipped and (not skipped or
            (set(skipped_methods) == {"testOOME"} and
             ("Insufficient Memory to test OOME" in text or "OOME: total mem:" in text))),
            "unexpected TestNG skip: " + str(path))
    return {"total": total, "passed": passed, "expected_low_heap_skips": skipped, "record": str(path)}


def require_gc_profile(text):
    """Require the frozen server/C2/CDS/GC profile; ignore empty inactive rows."""
    declarations = re.findall(r"^(JVM_VARIANTS|JVM_VARIANT_MAIN|JVM_FEATURES_[A-Za-z0-9_]+)[ \t]*:=[ \t]*([^\r\n]*)$",
                              text, re.M)
    settings = dict(declarations)
    require(len(settings) == len(declarations), "duplicate development profile declaration")
    variants = settings.get("JVM_VARIANTS", "").split()
    require(variants == ["server"], "qualification requires only the frozen server JVM variant")
    require(settings.get("JVM_VARIANT_MAIN", "").strip() == "server", "qualification main JVM variant must be server")
    features = settings.get("JVM_FEATURES_server", "").split()
    require({"compiler2", "cds"} <= set(features), "qualification server profile requires compiler2 and cds")
    require(sorted(f for f in features if f.endswith("gc")) == ["g1gc", "serialgc", "zgc"],
            "development collector profile differs for server")
    return variants


def validate_platform_options(options):
    """Reject configure overrides of frozen settings, retaining dependency paths."""
    forbidden = ("--with-conf-name", "--with-debug-level", "--with-jobs", "--with-memory-size", "--with-boot-jdk",
                 "--with-jtreg", "--with-version-opt", "--enable-hex-simd", "--disable-hex-simd",
                 "--enable-jvm-feature", "--disable-jvm-feature", "--with-jvm-features", "--without-jvm-features",
                 "--with-jvm-variants", "--without-jvm-variants")
    for option in options:
        # Autoconf accepts single-dash spellings of these long options too.
        normalized = "-" + option if option.startswith("-") and not option.startswith("--") else option
        if normalized.startswith(forbidden):
            raise ValueError("platform option overrides a frozen qualification setting: " + option)


def read_bench(path, kind, sizes, state):
    text = path.read_text()
    require(f"# nativeAvailable={str(state == 'enabled').lower()}" in text, "wrong availability: " + str(path))
    require("warmupMs=1000; sampleMs=100; samples=5" in text, "wrong measurement settings: " + str(path))
    expected = {(size, name + suffix) for size in sizes for name in ["encode", "decode"]
                for suffix in ["-jdk", "-native"]} if kind == "plain" else {
                (size, name + suffix) for name, size in PROTECTED.items() for suffix in ["-jdk", "-native"]}
    groups = {}
    for row in csv.DictReader(line for line in text.splitlines() if not line.startswith("#")):
        key = int(row["bytes"]), row["operation"]
        ns, allocation = float(row["ns_per_call"]), float(row["java_bytes_per_call"])
        require(math.isfinite(ns) and ns > 0 and math.isfinite(allocation) and allocation >= 0
                and int(row["calls"]) > 0, "invalid timing/allocation: " + str(path))
        group = groups.setdefault(key, {})
        sample = int(row["sample"])
        require(sample not in group, "duplicate sample: " + str(path))
        group[sample] = ns, allocation
    require(set(groups) == expected and all(set(g) == set(range(5)) for g in groups.values()),
            "missing/unexpected measurement cells: " + str(path))
    return {key: {"ns": statistics.median(v[0] for v in samples.values()),
                  "bytes": statistics.median(v[1] for v in samples.values()),
                  "observations": [samples[i][0] for i in range(5)],
                  "allocation_observations": [samples[i][1] for i in range(5)]}
            for key, samples in groups.items()}


def adjudicate(index, cold, root, supervisor):
    """Explicit per-fork cross-image gates. summarize.py is not an adjudicator."""
    datasets = {}
    for entry in index:
        supervisor.check()
        key = entry["kind"], entry["compact"], entry["gc"], entry["state"], entry["fork"]
        require(key not in datasets, "duplicate benchmark process cell")
        datasets[key] = read_bench(Path(entry["file"]), entry["kind"], entry["sizes"], entry["state"])
    expected_keys = {(kind, compact, gc, state, fork)
            for fork in [1, 2, 3] for gc in ["G1", "Serial", "Z"]
            for state in ["baseline", "disabled", "enabled"]
            for compact in ([True, False] if gc == "G1" else [True])
            for kind in ["plain", "protected"]}
    require(set(datasets) == expected_keys, "not all 72 independently started throughput JVMs completed")
    noise, failures, rows = [], [], []
    bad_ranges = {}
    for kind, compact, gc, state, fork in sorted(expected_keys):
        if state != "enabled":
            continue
        key = kind, compact, gc, state, fork
        selected = datasets[key]
        off = datasets[kind, compact, gc, "disabled", fork]
        base = datasets[kind, compact, gc, "baseline", fork]
        for (size, operation), value in selected.items():
            if not operation.endswith("-native"):
                continue
            name = operation.removesuffix("-native")
            is_error = name in ERRORS
            old, disabled = base[size, operation], off[size, operation]
            row = {"kind": kind, "compact": compact, "gc": gc, "fork": fork,
                   "bytes": size, "operation": name, "baseline": old, "disabled": disabled,
                   "enabled": value, "baseline_speedup": old["ns"] / value["ns"],
                   "disabled_speedup": disabled["ns"] / value["ns"]}
            rows.append(row)
            label = f"{kind}/{compact}/{gc}/{fork}/{size}/{name}"
            if not is_error:
                if abs(disabled["ns"] - old["ns"]) > max(0.10 * old["ns"], 5):
                    noise.append(label + ": disabled/baseline control drift")
                # The unchanged reference is a second cross-image consistency check.
                reference = operation.removesuffix("-native") + "-jdk"
                reference_base = base[size, reference]["ns"]
                for tag, dataset in [("baseline", base), ("disabled", off), ("enabled", selected)]:
                    if tag != "baseline" and abs(dataset[size, reference]["ns"] - reference_base) > max(0.10 * reference_base, 5):
                        noise.append(label + ": unchanged reference drift in " + tag)
                    if tag != "baseline" and abs(dataset[size, operation]["bytes"] - old["bytes"]) > 16:
                        failures.append(label + ": " + tag + " Java allocation differs from baseline by >16 B/call")
                    if abs(dataset[size, operation]["bytes"] - dataset[size, reference]["bytes"]) > 16:
                        failures.append(label + ": " + tag + " within-VM Java allocation differs by >16 B/call")
            for tag, control in [("baseline", old), ("disabled", disabled)]:
                allowance = max(control["ns"] * (0.25 if is_error else 0.05), 1000 if is_error else 5)
                if name == "mixed-101":
                    allowance = control["ns"] * 0.05
                if value["ns"] - control["ns"] > allowance:
                    failures.append(label + ": regression versus " + tag)
                if not is_error and tag == "disabled" and abs(value["bytes"] - control["bytes"]) > 16:
                    failures.append(label + ": Java allocation differs by >16 B/call versus " + tag)
            if kind == "plain" and compact:
                required = 1.10 if (name, size) in [("encode", 1024), ("decode", 128)] else None
                if size in [4096, 65536]:
                    required = 1.20 if name == "encode" else 2.0
                if required is not None:
                    for tag, control in [("baseline", old), ("disabled", disabled)]:
                        if control["ns"] / value["ns"] < required:
                            failures.append(label + f": speedup versus {tag} below {required}")
                    if selected[size, name + "-jdk"]["ns"] < value["ns"]:
                        noise.append(label + ": within-VM reference reverses claimed benefit")
                    for tag, control in [("baseline", old), ("disabled", disabled), ("enabled", value)]:
                        if max(control["observations"]) > 2 * min(control["observations"]):
                            bad_ranges.setdefault((gc, size, name, tag), set()).add(fork)
    for cell, forks in bad_ranges.items():
        if len(forks) >= 2:
            noise.append(str(cell) + ": >2x observation range in at least two forks")
    expected_cold = {(gc, state, round, mode) for gc in ["G1", "Serial", "Z"]
                     for state in ["baseline", "disabled", "enabled"] for round in range(1, 6)
                     for mode in ["empty", "tiny", "encode", "decode", "bulk-session"]}
    seen = {(r["gc"], r["state"], r["round"], r["mode"]) for r in cold}
    require(len(cold) == len(seen) and seen == expected_cold, "cold dataset incomplete or duplicated")
    cold_rows = []
    for gc in ["G1", "Serial", "Z"]:
        for mode in ["empty", "tiny", "encode", "decode", "bulk-session"]:
            med = {state: {metric: statistics.median(r[metric] for r in cold
                    if r["gc"] == gc and r["state"] == state and r["mode"] == mode)
                    for metric in ["wall_ns", "call_ns"]} for state in ["baseline", "disabled", "enabled"]}
            cold_rows.append({"gc": gc, "mode": mode, "medians": med})
            if abs(med["disabled"]["wall_ns"] - med["baseline"]["wall_ns"]) > max(0.10 * med["baseline"]["wall_ns"], 10_000_000):
                noise.append(f"cold/{gc}/{mode}: disabled/baseline process-wall control drift")
            for state in ["baseline", "disabled"]:
                if mode in ["empty", "tiny"] and med["enabled"]["wall_ns"] - med[state]["wall_ns"] > max(0.05 * med[state]["wall_ns"], 10_000_000):
                    failures.append(f"cold/{gc}/{mode}: process wall regression versus {state}")
                if mode in ["encode", "decode"] and med["enabled"]["call_ns"] - med[state]["call_ns"] > 20_000_000:
                    failures.append(f"cold/{gc}/{mode}: first public call exceeds +20ms versus {state}")
                if mode == "bulk-session" and med[state]["wall_ns"] / med["enabled"]["wall_ns"] < 1.10:
                    failures.append(f"fixed-128-pair-session/{gc}: <1.10x wall speedup versus {state}")
    status = "INCONCLUSIVE_NOISE" if noise else "NO_GO_MEASURED" if failures else "LOCAL_GO"
    report = {"status": status, "noise": noise, "failures": failures,
              "steady_cells": rows, "cold_cells": cold_rows,
              "fixed_session": {"pairs": 128, "bytes_each_direction": 128 * 65536,
                                "scope": "one observed fixed session; no measured amortization crossover"},
              "java_allocation_only": True, "extra_platform_performance_required": False}
    write_json(root / "acceptance.json", report)
    return report


class Campaign:
    def __init__(self, args, supervisor, repo):
        self.args, self.s, self.repo = args, supervisor, repo
        self.root, self.env = supervisor.root, os.environ.copy()
        for key in ["JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "_JAVAC_OPTIONS",
                    "JDK_JAVAC_OPTIONS", "JAVA_OPTS", "RUSTFLAGS", "CARGO_ENCODED_RUSTFLAGS",
                    "MAKEFLAGS", "MFLAGS", "CARGO_MAKEFLAGS", "GIT_DIR", "GIT_WORK_TREE", "GIT_INDEX_FILE",
                    "GIT_COMMON_DIR", "GIT_OBJECT_DIRECTORY", "GIT_ALTERNATE_OBJECT_DIRECTORIES",
                    "GIT_TRACE", "GIT_TRACE_CURL", "GIT_CURL_VERBOSE", "CARGO_HTTP_DEBUG"]:
            self.env.pop(key, None)
        for name in ["tmp", "cargo-home", "ccache"]:
            (self.root / name).mkdir()
        self.env.update(TMPDIR=str(self.root / "tmp"), CARGO_HOME=str(self.root / "cargo-home"),
                        CCACHE_DIR=str(self.root / "ccache"), RUSTUP_AUTO_INSTALL="0", GIT_TERMINAL_PROMPT="0")
        if not shutil.which("mold", path=self.env.get("PATH")):
            self.env["CONFIGURE_DEV_NO_MOLD"] = "1"
        self.sources = {state: self.root / state for state in ["baseline", "candidate"]}
        self.jdks = {"baseline": self.sources["baseline"] / "build/hex-base/images/jdk",
                     "candidate": self.sources["candidate"] / "build/hex-qual/images/jdk"}
        self.harness = self.root / "harness"
        self.exp = self.sources["candidate"] / "test/benchmarks/hex-simd"
        self.manifest = {"revision": args.revision, "baseline": BASE, "affinity": self.s.cpus,
                         "total_deadline_s": TOTAL, "ram_bytes": RAM, "disk_bytes": DISK,
                         "platform_options": args.platform_option, "removed_environment_option_names":
                         [k for k in ["JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "RUSTFLAGS",
                          "CARGO_ENCODED_RUSTFLAGS", "JDK_JAVAC_OPTIONS"] if k in os.environ],
                         "measurement_floor_s": 2754, "throughput_jvms": 72, "cold_jvms": 225,
                         "artifacts": {}, "testng": []}
        self.manifest["runner_sha256"] = digest(Path(__file__), self.s)
        self.unrelated_legal = {}
        self.rust_notices = None
        self.common = ["--with-debug-level=release", "--with-jobs=2", "--with-memory-size=8192",
                       "--with-version-opt=hex-qual", "--with-boot-jdk=" + str(args.boot_jdk),
                       "--with-jtreg=" + str(args.jtreg),
                       "--with-boot-jdk-jvmargs=-XX:ActiveProcessorCount=2 -XX:+UseG1GC -Djava.io.tmpdir=" + str(self.root / "tmp")]

    def run(self, label, argv, cwd=None, env=None, **kwargs):
        return self.s.run(label, argv, cwd or self.repo, env or self.env, **kwargs)

    def java_opts(self, gc="G1", heap=512):
        return ["-Xms128m", f"-Xmx{heap}m", "-XX:ActiveProcessorCount=2", "-XX:+Use" + gc + "GC",
                "-XX:-UsePerfData", "-Djava.io.tmpdir=" + str(self.root / "tmp"),
                "-XX:ErrorFile=" + str(self.s.logs / "hs_err_pid%p.log")]

    def java(self, state):
        return self.jdks["baseline" if state == "baseline" else "candidate"] / "bin/java"

    def patched(self, state, options, main, *args):
        return [self.java(state), *options, "--patch-module", "java.base=" + str(self.harness / "patch"),
                "--add-exports", "java.base/jdk.internal.util=ALL-UNNAMED", "-cp", self.harness / "classes", main, *args]

    def preflight_and_build(self):
        for name, argv in [("head", ["git", "rev-parse", "HEAD"]),
                           ("status", ["git", "status", "--porcelain"]),
                           ("boot-version", [self.args.boot_jdk / "bin/java", *self.java_opts(), "-version"]),
                           ("rust-version", [self.args.rustc, "-vV"]),
                           ("cargo-version", [self.args.cargo, "--version"]),
                           ("cpu", ["lscpu"]), ("os", ["uname", "-a"]),
                           ("compiler", ["gcc", "--version"]), ("linker", ["ld", "--version"])]:
            self.run("preflight-" + name, argv, timeout=120)
        require((self.s.logs / "preflight-head.stdout").read_text().strip() == self.args.revision,
                "runner checkout does not match reviewed revision")
        require(not (self.s.logs / "preflight-status.stdout").read_text().strip(), "runner checkout is dirty")
        cpu = (self.s.logs / "preflight-cpu.stdout").read_text().lower()
        flags = ["avx", "avx2", "bmi1", "bmi2", "f16c", "fma", "movbe", "xsave",
                 "cx16", "lahf_lm", "popcnt", "ssse3", "sse4_1", "sse4_2"]
        require(all(re.search(r"\b" + flag + r"\b", cpu) for flag in flags)
                and any(re.search(r"\b" + flag + r"\b", cpu) for flag in ["abm", "lzcnt"])
                and any(re.search(r"\b" + flag + r"\b", cpu) for flag in ["pni", "sse3"]),
                "host does not establish required x86-64-v3 ISA")
        for state, revision in [("candidate", self.args.revision), ("baseline", BASE)]:
            self.run("worktree-" + state, ["git", "worktree", "add", "--detach", self.sources[state], revision])
            gitdir = (self.sources[state] / ".git").read_text().strip().removeprefix("gitdir: ")
            self.s.meta_roots.append(Path(gitdir))
        lock = self.sources["candidate"] / "src/java.base/share/native/libhexsimd/rust/Cargo.lock"
        require(digest(lock, self.s) == LOCK_SHA, "dependency lock identity differs")
        self.manifest["lock_sha256"] = LOCK_SHA
        manifest = self.sources["candidate"] / "src/java.base/share/native/libhexsimd/rust/Cargo.toml"
        self.run("cargo-fetch", [self.args.cargo, "fetch", "--locked", "--manifest-path", manifest], timeout=600)
        build_end = self.s.work_end - POST_BUILD_RESERVE
        for state in ["candidate", "baseline"]:
            self.configure(state, enabled=state == "candidate", deadline=build_end)
            conf = "hex-qual" if state == "candidate" else "hex-base"
            self.run("build-" + state, ["make", "CONF=" + conf, "JOBS=2", "images"],
                     cwd=self.sources[state], deadline=build_end)
            self.record_image(state, self.jdks[state], expected_library=state == "candidate")
        self.env.update(JAVA_HOME=str(self.jdks["candidate"]), HEX_SIMD_OUT=str(self.harness))
        self.run("harness-build", ["bash", self.exp / "build.sh"], cwd=self.sources["candidate"])
        write_json(self.root / "manifest.json", self.manifest)

    def configure(self, state, enabled, deadline=None):
        conf = "hex-qual" if state == "candidate" else "hex-base"
        argv = ["bash", "bin/configure-dev", *self.common, *self.args.platform_option, "--with-conf-name=" + conf]
        if state == "candidate":
            argv += ["--enable-hex-simd" if enabled else "--disable-hex-simd",
                     "CARGO=" + (str(self.args.cargo) if enabled else "/missing/cargo"),
                     "RUSTC=" + (str(self.args.rustc) if enabled else "/missing/rustc")]
        self.run("configure-" + state + ("-disabled" if not enabled and state == "candidate" else ""),
                 argv, cwd=self.sources[state], deadline=deadline)
        spec = self.sources[state] / "build" / conf / "spec.gmk"
        text = spec.read_text()
        require_gc_profile(text)
        label = state + ("-disabled" if not enabled and state == "candidate" else "")
        snapshot = self.s.logs / ("spec-" + label + ".gmk")
        shutil.copyfile(spec, snapshot)
        self.manifest["spec-" + label] = {
                "sha256": digest(snapshot, self.s), "path": str(snapshot), "configure_argv": argv}
        if state == "candidate" and enabled:
            def setting(name):
                match = re.search(r"^" + name + r"\s*:=\s*(.*)$", text, re.M)
                require(match is not None, "missing configured " + name)
                return Path(match.group(1).strip())
            self.rust_notices = setting("RUST_RUNTIME_NOTICES"), setting("RUST_RUNTIME_COPYRIGHT")

    def record_image(self, label, jdk, expected_library):
        paths = ["release", "bin/java", "jmods/java.base.jmod", "lib/modules", "lib/server/libjvm.so"]
        paths += [str(p.relative_to(jdk)) for p in (jdk / "lib/server").glob("*.jsa")]
        if (jdk / "lib/libjava.so").is_file():
            paths.append("lib/libjava.so")
        require((jdk / "lib/libhexsimd.so").is_file() == expected_library, "wrong library packaging: " + label)
        if expected_library:
            paths.append("lib/libhexsimd.so")
        self.manifest["artifacts"][label] = {"measured_or_built_path": str(jdk), "retained_path": str(jdk),
                "sha256": {p: digest(jdk / p, self.s) for p in paths}}
        self.run("version-" + label, [jdk / "bin/java", *self.java_opts(), "-version"])
        listing, _, _ = self.run("jmod-" + label, [jdk / "bin/jmod", *["-J" + o for o in self.java_opts()],
                                          "list", jdk / "jmods/java.base.jmod"])
        entries = listing.read_text().splitlines()
        require(("lib/libhexsimd.so" in entries) == expected_library, "jmod native entry differs: " + label)
        require(("legal/hex-simd.md" in entries) == expected_library, "jmod MIT notice differs: " + label)
        require(any(e.startswith("legal/rust/") and "COPYRIGHT" in e for e in entries) == expected_library,
                "Rust copyright packaging differs: " + label)
        if expected_library:
            require((jdk / "legal/java.base/hex-simd.md").is_file(), "missing image MIT notice")
            require(any((jdk / "legal/java.base/rust").glob("COPYRIGHT*")), "missing image Rust copyright")
            legal = jdk / "legal/java.base"
            require(digest(legal / "hex-simd.md", self.s) == digest(self.sources["candidate"] / "src/java.base/share/legal/hex-simd.md", self.s),
                    "dependency MIT notice differs from pinned source")
            notice_root, copyright_file = self.rust_notices
            notices = [copyright_file, *notice_root.glob("licenses/*.txt"), *notice_root.glob("LICENSE*")]
            require(len(notices) > 1, "matching Rust runtime license files unavailable")
            for source in notices:
                require(source.is_file(), "non-file Rust license notice: " + str(source))
                destination = legal / "rust" / source.relative_to(notice_root)
                require(destination.is_file() and digest(source, self.s) == digest(destination, self.s),
                        "Rust runtime notice mismatch: " + str(source))
            self.unrelated_legal = {str(p.relative_to(legal)): digest(p, self.s)
                    for p in legal.rglob("*") if p.is_file() and p.name != "hex-simd.md"
                    and "rust" not in p.relative_to(legal).parts}
            exports, _, _ = self.run("exports", ["nm", "-D", "--defined-only", jdk / "lib/libhexsimd.so"])
            symbols = [line.split()[-1].split("@")[0] for line in exports.read_text().splitlines() if line.strip()]
            require(symbols == ["Java_jdk_internal_util_HexFormatSupport_init0"], "unexpected JNI exports")
            deps, _, _ = self.run("dependencies", ["ldd", jdk / "lib/libhexsimd.so"])
            require("not found" not in deps.read_text(), "unresolved native dependencies")

    def correctness(self):
        for state in ["candidate", "baseline"]:
            opts = self.java_opts() + ["-Xcheck:jni", "-XX:+CompactStrings"]
            work = self.root / ("jtreg-" + state + "-work")
            argv = [self.args.boot_jdk / "bin/java", *opts, "-jar", self.args.jtreg / "lib/jtreg.jar",
                    "-jdk:" + str(self.jdks[state]), "-othervm", "-conc:1", "-w:" + str(work),
                    "-r:" + str(self.root / ("jtreg-" + state + "-report")),
                    *["-vmoption:" + o for o in opts],
                    "-vmoption:-Dhexsimd.expectNative=" + str(state == "candidate").lower(),
                    "test/jdk/java/util/HexFormat"]
            self.run("jtreg-" + state, argv, cwd=self.sources[state])
            records = list(work.rglob("*.jtr"))
            require(len(records) == (2 if state == "candidate" else 1), "unexpected jtreg test count")
            record_texts = []
            for path in records:
                text = path.read_text()
                record_texts.append((path, text))
                require("test result: Passed." in text, "jtreg did not pass: " + str(path))
                require(not BAD_JNI.search(text), "JNI warning in " + str(path))
                for flag in ["-Xmx512m", "-XX:ActiveProcessorCount=2", "-XX:+UseG1GC"]:
                    require(flag in text, "missing child JVM flag " + flag)
            summary = parse_hexformat_testng(record_texts)
            self.manifest["testng"].append({"state": state, **summary})
            for gc in ["Serial", "G1", "Z"]:
                self.run("profile-" + state + "-" + gc, [self.jdks[state] / "bin/java", *self.java_opts(gc),
                          self.sources["candidate"] / ".github/scripts/DevProfileSmoke.java"])
        self.run("rust-test", [self.args.cargo, "test", "--frozen", "--release", "--jobs", "2",
                 "--manifest-path", self.sources["candidate"] / "src/java.base/share/native/libhexsimd/rust/Cargo.toml",
                 "--target-dir", self.root / "rust-test"], env={**self.env, "RUSTC": str(self.args.rustc)})
        for name in ["base-image", "no-library-image"]:
            argv = [self.jdks["candidate"] / "bin/jlink", *["-J" + o for o in self.java_opts()],
                    "--module-path", self.jdks["candidate"] / "jmods", "--add-modules", "java.base",
                    "--output", self.root / name]
            if name == "no-library-image":
                argv += ["--exclude-files", "**/*hexsimd*"]
            self.run("jlink-" + name, argv)
        require(digest(self.root / "base-image/lib/modules", self.s) == digest(self.root / "no-library-image/lib/modules", self.s),
                "excluded-library image changed Java modules")
        require(not (self.root / "no-library-image/lib/libhexsimd.so").exists(), "library exclusion failed")
        extra = shlex.join(["-XX:-UsePerfData", "-Djava.io.tmpdir=" + str(self.root / "tmp"),
                           "-XX:ErrorFile=" + str(self.s.logs / "hs_err_pid%p.log")])
        env = {**self.env, "HEX_SIMD_NO_LIBRARY_JDK": str(self.root / "no-library-image"),
               "HEX_SIMD_VERIFY_VM_OPTIONS": extra}
        output, errors, _ = self.run("verify-matrix", ["bash", self.exp / "verify.sh"], env=env)
        require(not BAD_JNI.search(output.read_text() + errors.read_text()), "JNI warning in verify matrix")
        for gc in ["G1", "Serial", "Z"]:
            for compact in ["+", "-"]:
                text = (self.harness / f"correctness-{gc}-{compact}.txt").read_text()
                require(f"nativeAvailable=true; nativeDecode={str(compact == '+').lower()}" in text,
                        "wrong native decode route: " + gc + compact)
            for state in ["baseline", "disabled", "enabled", "absent"]:
                opts = self.java_opts(gc) + ["-Xcheck:jni", "-Dhexsimd.expectNative=" + str(state == "enabled").lower()]
                if state == "disabled":
                    opts.append("-Djdk.hexFormat.useNative=false")
                argv = self.patched(state, opts, "FirstUse", "race")
                if state == "absent":
                    argv[0] = self.root / "no-library-image/bin/java"
                out, err, _ = self.run("race-" + state + "-" + gc, argv, timeout=30)
                require("PASS concurrent first use" in out.read_text() and not BAD_JNI.search(out.read_text() + err.read_text()),
                        "concurrent first use failed")
        write_json(self.root / "manifest.json", self.manifest)

    def cold(self):
        rows = []
        for gc in ["G1", "Serial", "Z"]:
            for round in range(1, 6):
                states = ["baseline", "disabled", "enabled"]
                if round % 2 == 0:
                    states.reverse()
                for state in states:
                    opts = self.java_opts(gc, heap=128)
                    if state == "disabled":
                        opts += ["-Djdk.hexFormat.useNative=false"]
                    for mode in ["empty", "tiny", "encode", "decode", "bulk-session"]:
                        argv = [self.java(state), *opts, "-cp", self.harness / "classes", "FirstUse", mode]
                        out, err, wall = self.run(f"cold-{gc}-{round}-{state}-{mode}", argv, timeout=15, measurement=True)
                        values = out.read_text().strip().split(",")
                        require(len(values) == 3 and values[0] == mode, "invalid cold record")
                        call, length = int(values[1]), int(values[2])
                        expected_length = {"empty": 0, "tiny": 64, "encode": 2048, "decode": 128, "bulk-session": 65536}[mode]
                        require(call > 0 and length == expected_length and not BAD_JNI.search(err.read_text()), "wrong cold result")
                        rows.append({"gc": gc, "state": state, "round": round, "mode": mode,
                                     "wall_ns": wall, "call_ns": call, "length": length})
                        write_json(self.root / "cold.json", rows)
        for mode in ["empty", "tiny", "encode", "decode"]:
            out, err, _ = self.run("library-" + mode, [self.java("enabled"), *self.java_opts(heap=128),
                    "-Xlog:library=debug", "-cp", self.harness / "classes", "FirstUse", mode])
            loaded = bool(re.search(r"Loaded library.*libhexsimd\.so", out.read_text() + err.read_text()))
            require(loaded == (mode in ["encode", "decode"]), "wrong cold library loading: " + mode)
        return rows

    def measurements(self):
        # More than nominal loop time, with cleanup/report reserve under global deadline.
        minimum = 2754 + 10 * 60 + 15 * 60
        if self.s.work_end - time.monotonic() < minimum:
            raise Stop("RESOURCE", "insufficient total budget for declared measurement batch and cleanup")
        end = min(self.s.work_end - 15 * 60, time.monotonic() + MEASUREMENT_WINDOW)
        index = []
        for fork in [1, 2, 3]:
            states = ["baseline", "disabled", "enabled"]
            if fork == 2:
                states.reverse()
            for gc in ["G1", "Serial", "Z"]:
                for state in states:
                    for compact in ([True, False] if gc == "G1" else [True]):
                        sizes = PLAIN_UTF16 if not compact else PLAIN_G1 if gc == "G1" else PLAIN_OTHER
                        opts = self.java_opts(gc) + ["-Xms512m", "-XX:" + ("+" if compact else "-") + "CompactStrings",
                                "-Dhexsimd.expectNative=" + str(state == "enabled").lower(),
                                "-Dhexsimd.warmupMs=1000", "-Dhexsimd.sampleMs=100", "-Dhexsimd.samples=5"]
                        if state == "disabled":
                            opts.append("-Djdk.hexFormat.useNative=false")
                        for kind in ["plain", "protected"]:
                            args = list(map(str, sizes)) if kind == "plain" else ["protected"]
                            out, err, _ = self.run(f"bench-{kind}-{compact}-{gc}-{state}-{fork}",
                                    self.patched(state, opts, "Bench", *args), deadline=end, measurement=True)
                            require(not BAD_JNI.search(out.read_text() + err.read_text()), "JNI warning in timing process")
                            read_bench(out, kind, sizes, state)
                            index.append({"kind": kind, "compact": compact, "gc": gc, "state": state,
                                          "fork": fork, "sizes": sizes, "file": str(out)})
                            write_json(self.root / "measurements.json", index)
        return index

    def disabled_cleanup(self):
        self.jdks["candidate"].rename(self.root / "enabled-image")
        self.manifest["artifacts"]["candidate"]["retained_path"] = str(self.root / "enabled-image")
        self.configure("candidate", enabled=False)
        self.run("build-disabled", ["make", "CONF=hex-qual", "JOBS=2", "images"], cwd=self.sources["candidate"])
        self.record_image("reconfigured-disabled", self.jdks["candidate"], expected_library=False)
        modules = self.sources["candidate"] / "build/hex-qual/support"
        require(not list(modules.glob("modules_libs*/java.base/*hexsimd*")), "stale native/debug files after disabling")
        require(not (modules / "modules_legal/java.base/hex-simd.md").exists()
                and not (modules / "modules_legal/java.base/rust").exists(), "stale owned notices")
        require((self.jdks["candidate"] / "legal/java.base/ASSEMBLY_EXCEPTION").exists(), "unrelated legal notice lost")
        for relative, previous_hash in self.unrelated_legal.items():
            file = self.jdks["candidate"] / "legal/java.base" / relative
            require(file.is_file() and digest(file, self.s) == previous_hash,
                    "unrelated legal notice changed during disabling: " + relative)
        opts = self.java_opts() + ["-Xcheck:jni", "-XX:+CompactStrings",
                "-Dhexsimd.expectNative=false", "-Dhexsimd.expectDecodeNative=false"]
        out, err, _ = self.run("correctness-reconfigured", self.patched("enabled", opts, "Correctness"))
        require("nativeAvailable=false; nativeDecode=false" in out.read_text()
                and not BAD_JNI.search(out.read_text() + err.read_text()), "disabled reconfiguration fallback failed")
        write_json(self.root / "manifest.json", self.manifest)

    def verify_frozen_sources(self, checkpoint):
        for state, revision in [("candidate", self.args.revision), ("baseline", BASE)]:
            out, _, _ = self.run("frozen-head-" + state + "-" + checkpoint, ["git", "rev-parse", "HEAD"], cwd=self.sources[state])
            require(out.read_text().strip() == revision, "source head changed: " + state)
            out, _, _ = self.run("frozen-status-" + state + "-" + checkpoint, ["git", "status", "--porcelain"], cwd=self.sources[state])
            require(not out.read_text().strip(), "source changed: " + state)


def main():
    parser = Arguments(description=__doc__)
    parser.add_argument("--execute", action="store_true", help="explicitly run the future qualification batch")
    parser.add_argument("--revision", required=True, help="full reviewed source commit")
    parser.add_argument("--output", required=True, type=Path, help="fresh output/worktree/cache directory")
    parser.add_argument("--boot-jdk", required=True, type=Path)
    parser.add_argument("--jtreg", required=True, type=Path)
    parser.add_argument("--cargo", default=shutil.which("cargo"), type=Path)
    parser.add_argument("--rustc", default=shutil.which("rustc"), type=Path)
    parser.add_argument("--platform-option", action="append", default=[], help="normal configure option, use --platform-option=VALUE")
    args = parser.parse_args()
    if not args.execute:
        parser.error("execution is opt-in: pass --execute only for an authorized batch")
    if sys.platform != "linux" or os.uname().machine != "x86_64":
        parser.error("Stage 1 runner requires native Linux x86_64")
    if not hasattr(os, "pidfd_open") or not hasattr(signal, "pidfd_send_signal"):
        parser.error("Python with Linux pidfd support is required for ownership-safe cleanup")
    if not re.fullmatch(r"[0-9a-f]{40}", args.revision):
        parser.error("--revision must be a full commit ID")
    repo = Path(__file__).resolve().parents[3]
    for attr in ["output", "boot_jdk", "jtreg", "cargo", "rustc"]:
        value = getattr(args, attr)
        if value is None:
            parser.error("missing installed executable: " + attr)
        value = value.expanduser().absolute()
        if not re.fullmatch(r"[A-Za-z0-9_./@:+-]+", str(value)):
            parser.error("qualification paths must use shell-safe ASCII letters/digits and _./@:+-")
        setattr(args, attr, value)
    try:
        validate_platform_options(args.platform_option)
    except ValueError as error:
        parser.error(str(error))
    if args.output.exists():
        parser.error("--output must not exist; logs/worktrees are never overwritten")
    for executable in [args.boot_jdk / "bin/java", args.boot_jdk / "bin/javac", args.cargo, args.rustc]:
        if not executable.is_file() or not os.access(executable, os.X_OK):
            parser.error("installed executable unavailable: " + str(executable))
    if not (args.jtreg / "lib/jtreg.jar").is_file():
        parser.error("jtreg jar unavailable")
    try:
        args.output.mkdir(parents=True)
    except OSError as error:
        parser.error("cannot create fresh output directory: " + str(error))
    supervisor = None
    result = {"status": "INCOMPLETE", "revision": args.revision, "baseline": BASE}
    exit_code = 4
    try:
        supervisor = Supervisor(args.output)
        signal.signal(signal.SIGINT, lambda *_: supervisor.request_abort("interrupted by SIGINT"))
        signal.signal(signal.SIGTERM, lambda *_: supervisor.request_abort("interrupted by SIGTERM"))
        campaign = Campaign(args, supervisor, repo)
        campaign.preflight_and_build()
        campaign.verify_frozen_sources("after-build")
        campaign.correctness()
        cold = campaign.cold()
        index = campaign.measurements()
        report = adjudicate(index, cold, args.output, supervisor)
        # Packaging cleanup is mandatory even when a clean measured loss occurs.
        campaign.disabled_cleanup()
        campaign.verify_frozen_sources("final")
        result.update(status=report["status"], acceptance="acceptance.json", manifest="manifest.json")
        exit_code = 0 if report["status"] == "LOCAL_GO" else 3 if report["status"] == "INCONCLUSIVE_NOISE" else 2
    except Stop as error:
        result.update(status="INCOMPLETE", category=error.category, detail=error.detail)
    except Exception as error:
        result.update(status="INCOMPLETE_RUNNER", detail=repr(error))
    finally:
        if supervisor is not None:
            try:
                supervisor.finish()
            except Exception as error:
                result.update(status="INCOMPLETE_CLEANUP", detail=str(error))
                exit_code = 4
            result.update(peak_owned_rss=supervisor.peak_rss, peak_owned_disk=supervisor.peak_disk,
                          live_owned=supervisor.owned_now(), last_command=supervisor.active,
                          command_ledger="commands.json")
            if supervisor.abort.is_set():
                result.update(status="INCOMPLETE_RESOURCE_OR_INTERRUPTION", detail=supervisor.reason)
                exit_code = 4
        result["elapsed_s"] = time.monotonic() - START
        write_json(args.output / "result.json", result)
        if supervisor is not None:
            supervisor.close_watchers()
    print(json.dumps(result, indent=2))
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
