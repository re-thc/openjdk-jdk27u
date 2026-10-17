#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

"""Source-only Stage A Linux supervisor. Not yet executed or qualified.

One owned run covers local Git preparation, normal builds, correctness,
measurement, analysis and cleanup. See doc/date-format-symbols-qualification.md.
No retry/resume or configurable budget, case, tolerance or collector exists.
"""

import argparse
import ctypes
import hashlib
import json
import os
import pathlib
import platform
import re
import resource
import shlex
import shutil
import signal
import subprocess
import sys
import threading
import time
import uuid

BASELINE = "89885a6288e7aaabd01678a704a586272c0f96e3"
PRODUCT = "src/java.base/share/classes/java/text/DateFormatSymbols.java"
PRODUCT_HASH = "792c0be285752dfa60844a71b9447e48bac42c8dea245d875a2f024544651e47"
DIRECTORY = "test/micro/org/openjdk/bench/java/text"
NAME = "DateFormatSymbolsQualificationSupervisor.py"
PHASES = {"prepare": 300, "build": 6900, "correctness": 1800,
          "measure": 6300, "analysis": 600}
WALL_SECONDS = 16200  # 4h30m, including reserved cleanup
CLEANUP_SECONDS = 120
RSS_LIMIT = 8 * 1024 ** 3
DISK_LIMIT = 20 * 1024 ** 3
PAGE_SIZE = os.sysconf("SC_PAGE_SIZE") if sys.platform == "linux" else 0


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + ".new")
    temporary.write_text(json.dumps(value, indent=2) + "\n")
    temporary.replace(path)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def process_table():
    table = {}
    for path in pathlib.Path("/proc").iterdir():
        if not path.name.isdigit():
            continue
        try:
            # comm may contain spaces or ')'; fields after its last ')' are fixed.
            fields = (path / "stat").read_text().rsplit(")", 1)[1].split()
            table[int(path.name)] = dict(ppid=int(fields[1]), start=int(fields[19]),
                                         rss=max(0, int(fields[21])) * PAGE_SIZE,
                                         state=fields[0])
        except FileNotFoundError:
            pass  # Exit between directory listing and stat read.
        except PermissionError:
            # Hidden unrelated processes are harmless; an owned unreadable PID
            # is detected below by comparing with our remembered identities.
            pass
    return table


def owned_processes(table, remembered):
    if os.getpid() not in table:
        raise RuntimeError("Cannot account for supervisor/worker process")
    live = {pid: row for pid, row in table.items()
            if pid == os.getpid() or remembered.get(pid) == row["start"]}
    while True:
        added = {pid: row for pid, row in table.items()
                 if row["ppid"] in live and pid not in live}
        if not added:
            break
        live.update(added)
    for pid, start in remembered.items():
        if pid not in table and pathlib.Path(f"/proc/{pid}").exists():
            raise RuntimeError(f"Cannot account for previously owned process {pid}/{start}")
    remembered.update({pid: row["start"] for pid, row in live.items()})
    return live


def signal_identity(pid, start, sig):
    handle = None
    try:
        # Open first: pidfd signaling cannot hit a replacement PID after stat.
        handle = os.pidfd_open(pid)
        fields = pathlib.Path(f"/proc/{pid}/stat").read_text().rsplit(")", 1)[1].split()
        if int(fields[19]) == start:
            signal.pidfd_send_signal(handle, sig)
    except ProcessLookupError:
        pass
    except FileNotFoundError:
        pass
    finally:
        if handle is not None:
            os.close(handle)


def disk_usage(root, stop):
    total = 0
    seen = set()
    def onerror(error):
        if not isinstance(error, FileNotFoundError):
            raise error
    # fwalk anchors stat calls to directory descriptors and does not follow
    # symlinks, including when temporary directory names change during a scan.
    for _, directories, files, descriptor in os.fwalk(root, follow_symlinks=False, onerror=onerror):
        if stop.is_set():
            raise RuntimeError("Storage scan cancelled")
        infos = [os.fstat(descriptor)]
        for name in directories + files:
            if stop.is_set():
                raise RuntimeError("Storage scan cancelled")
            try:
                infos.append(os.stat(name, dir_fd=descriptor, follow_symlinks=False))
            except FileNotFoundError:
                pass
        for info in infos:
            identity = (info.st_dev, info.st_ino)
            if identity not in seen:
                seen.add(identity)
                total += max(info.st_size, info.st_blocks * 512)
    return total


class StorageScan:
    """A bounded daemon thread keeps directory walking out of the monitor loop."""
    def __init__(self, root):
        self.started = time.monotonic()
        self.stop = threading.Event()
        self.result = None
        self.error = None
        def scan():
            try:
                self.result = disk_usage(root, self.stop)
            except Exception as error:
                self.error = repr(error)
        self.thread = threading.Thread(target=scan, daemon=True)
        self.thread.start()


def clean(root, token):
    if json.loads((root / "owner.json").read_text())["token"] != token:
        raise RuntimeError("Cleanup ownership marker differs")
    if not shutil.rmtree.avoids_symlink_attacks:
        raise RuntimeError("Cleanup requires fd-based symlink-safe rmtree")
    # Move the last partial test work before deletion, including failed/hung runs
    # that never reached the worker's successful per-invocation snapshot.
    for name in ("test-results", "test-support"):
        path = root / "candidate/build/dfs-qual" / name
        if path.exists() and not path.is_symlink():
            destination = root / "last-candidate-evidence"
            destination.mkdir(exist_ok=True)
            path.rename(destination / name)
    # Only these fixed children of the new mode-0700 root are disposable.
    names = ("baseline", "candidate", "repository", "boot-jdk", "cache", "tmp", "home")
    for name in names:
        path = root / name
        if path.is_symlink():
            path.unlink()
        elif path.exists():
            shutil.rmtree(path)
    write_json(root / "cleanup.json", dict(removed=list(names), remaining=[
        name for name in names if os.path.lexists(root / name)]))


def worker(args):
    root = args.root
    phase = "prepare"
    def enter(name):
        nonlocal phase
        phase = name
        write_json(root / "phase.json", dict(name=name, monotonic=time.monotonic()))
    enter("prepare")
    def command(name, argv, cwd=root, timeout=60, capture=False, configure=False):
        environment = os.environ.copy()
        if configure:
            # Configure rejects JAVA_TOOL_OPTIONS. Its boot facade supplies the
            # same fixed options as explicit launcher arguments, without notices.
            environment.pop("JAVA_TOOL_OPTIONS", None)
        with (root / "commands.jsonl").open("a") as stream:
            stream.write(json.dumps(dict(phase=phase, name=name, cwd=str(cwd),
                                         argv=list(map(str, argv)), timeout=timeout,
                                         javaContainment="explicit-boot-launchers" if configure else "managed-environment")) + "\n")
        log = root / "logs" / (name + ".log")
        with log.open("w") as stream:
            result = subprocess.run(list(map(str, argv)), cwd=cwd, stdout=stream,
                                    stderr=subprocess.STDOUT, stdin=subprocess.DEVNULL,
                                    env=environment, timeout=timeout)
        if result.returncode:
            raise RuntimeError(f"{name}: nonzero exit {result.returncode}")
        table = process_table()
        live = owned_processes(table, {})
        strays = [pid for pid, row in table.items() if row["state"] != "Z" and (
            (pid in live and pid != os.getpid()) or
            (row["ppid"] == int(os.environ["DFS_QUAL_SUPERVISOR"]) and pid != os.getpid()))]
        if strays:
            raise RuntimeError(f"{name}: command left live descendants {strays}")
        return log.read_text() if capture else log
    def git(name, source, *argv, timeout=10):
        return command(name, ["git", "-c", "gc.auto=0", "-c", "maintenance.auto=false",
            "-c", "core.hooksPath=/dev/null", "-C", source, *argv],
            timeout=timeout, capture=True).strip()
    if git("original-head", args.repo, "rev-parse", "HEAD") != args.candidate_ref:
        raise RuntimeError("Original checkout must be the approved exact qualification head")
    if git("original-status", args.repo, "status", "--porcelain"):
        raise RuntimeError("Original checkout is dirty")
    frozen = git("controller-identity", args.repo, "show", args.candidate_ref + ":" + DIRECTORY + "/" + NAME)
    if hashlib.sha256((frozen + "\n").encode()).hexdigest() != digest(pathlib.Path(__file__)):
        raise RuntimeError("Frozen supervisor differs from approved Git source")
    if digest(args.repo / PRODUCT) != PRODUCT_HASH:
        raise RuntimeError("Reviewed product hash differs")
    # Borrow source objects read-only; all new Git administrative writes stay in root.
    git("clone", args.repo, "clone", "--shared", "--no-checkout", "--local",
        args.repo, root / "repository", timeout=90)
    for label, ref in (("baseline", BASELINE), ("candidate", args.candidate_ref)):
        git("checkout-" + label, root / "repository", "worktree", "add", "--detach",
            root / label, ref, timeout=90)
    versions = {}
    for name, argv in (("gcc", ["gcc", "--version"]), ("mold", ["mold", "--version"]),
                       ("make", ["make", "--version"]),
                       ("boot", [args.boot_jdk / "bin/java", "-version"]),
                       ("jtreg", [args.jtreg / "bin/jtreg", "-version"])):
        versions[name] = command("version-" + name, argv, timeout=10, capture=True)
    write_json(root / "tool-identities.json", dict(versions=versions, path=os.environ["PATH"],
        python=sys.version, cpuInfo=pathlib.Path("/proc/cpuinfo").read_text(),
        bootJdk=str(args.boot_jdk), jtreg=str(args.jtreg), candidate=args.candidate_ref,
        baseline=BASELINE, productSha256=PRODUCT_HASH))
    # A source launcher facade around the installed boot JDK, not a copied JDK
    # or candidate runtime. Covers configure's bare java/jar/jtreg probes too.
    boot = root / "boot-jdk"
    boot.mkdir()
    (boot / "bin").mkdir()
    for entry in args.boot_jdk.iterdir():
        if entry.name != "bin":
            (boot / entry.name).symlink_to(entry.resolve(), target_is_directory=entry.is_dir())
    launchers = {}
    fixed = ["-Djava.io.tmpdir=" + str(root / "tmp"), "-Duser.home=" + str(root / "home"), "-XX:-UsePerfData"]
    for entry in (args.boot_jdk / "bin").iterdir():
        target = boot / "bin" / entry.name
        if entry.name in ("java", "javac", "jar", "javadoc"):
            options = fixed if entry.name == "java" else ["-J" + option for option in fixed]
            source = "#!/bin/sh\nexec " + shlex.join([str(entry.resolve()), *options]) + ' "$@"\n'
            target.write_text(source)
            target.chmod(0o755)
            launchers[entry.name] = source
        else:
            target.symlink_to(entry.resolve())
    if set(launchers) != {"java", "javac", "jar", "javadoc"}:
        raise RuntimeError("Installed boot JDK lacks required launcher tools")
    write_json(root / "control/boot-launchers.json", dict(installedBootJdk=str(args.boot_jdk),
        release=(args.boot_jdk / "release").read_text(), sources=launchers))
    enter("build")
    for label in ("baseline", "candidate"):
        source = root / label
        command("configure-" + label, ["bash", "bin/configure-dev", "--with-conf-name=dfs-qual",
            "--with-debug-level=release", "--with-native-debug-symbols=none",
            "--with-jvm-variants=server", "--disable-javac-server", "--with-boot-jdk=" + str(boot),
            "--with-jtreg=" + str(args.jtreg), "--with-jtreg-jdk=" + str(boot),
            "--with-jobs=4", "--with-memory-size=8192"],
            cwd=source, timeout=600, configure=True)
        command("build-" + label, ["make", "CONF=dfs-qual", "JOBS=4", "images"],
                cwd=source, timeout=PHASES["build"])
        identity = root / "build-identities" / label
        identity.mkdir(parents=True)
        for relative in ("spec.gmk", "images/jdk/release", "configure-support/config.log"):
            path = source / "build/dfs-qual" / relative
            if relative.endswith("config.log") and not path.exists():
                continue
            shutil.copyfile(path, identity / path.name)
    enter("correctness")
    candidate = root / "candidate"
    broad = ("jdk/java/text/Format/DateFormat", "jdk/java/util/Locale",
             "jdk/sun/util/locale/provider", "jdk/java/util/PluggableLocale")
    focused = tuple("jdk/java/text/Format/DateFormat/" + name + ".java" for name in (
        "DateFormatSymbolsSharingTest", "DateFormatSymbolsSerializationAliasesTest",
        "DateFormatSymbolsConcurrentSerializationTest"))
    correctness = {}
    forwarded = ("JAVA_TOOL_OPTIONS", "HOME", "TMPDIR", "TMP", "TEMP", "XDG_CACHE_HOME",
                 "XDG_CONFIG_HOME", "XDG_DATA_HOME", "XDG_STATE_HOME", "CCACHE_DISABLE",
                 "CCACHE_DIR", "CCACHE_TEMPDIR", "CCACHE_CONFIGPATH")
    def tests(name, cases, workers, options, expected):
        text = command(name, ["make", "CONF=dfs-qual", "JOBS=4", "test", "TEST=" + " ".join(cases),
            f"JTREG=JOBS={workers};TIMEOUT_FACTOR=4;JAVA_OPTIONS={options};OPTIONS=" +
            " ".join("-e:" + name for name in forwarded)],
            cwd=candidate, timeout=PHASES["correctness"], capture=True)
        # RunTests.gmk prints names longer than 49 columns on a separate line.
        actual = {}
        pending = None
        summary_text = text.split("Test summary")[-1]
        for line in summary_text.splitlines():
            match = re.fullmatch(r"\s*(jtreg:\S+)(?:\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+))?\s*", line)
            if match:
                pending = match[1].removeprefix("jtreg:test/")
                if match[2] is not None:
                    actual[pending] = list(map(int, match.groups()[1:]))
                    pending = None
            elif pending:
                counts = re.fullmatch(r"\s*(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s*", line)
                if not counts:
                    raise RuntimeError("Malformed wrapped jtreg summary")
                actual[pending] = list(map(int, counts.groups()))
                pending = None
        if actual != expected or "TEST SUCCESS" not in text:
            raise RuntimeError("Missing/changed correctness ledger: " + name)
        # Preserve full per-test results before the next make test replaces reports.
        destination = root / "correctness" / name
        shutil.copytree(candidate / "build/dfs-qual/test-results", destination / "reports", symlinks=True)
        shutil.copytree(candidate / "build/dfs-qual/test-support", destination / "work", symlinks=True)
        correctness[name] = actual
        write_json(root / "correctness.json", correctness)
    tests("broad", broad, 2, "-XX:ActiveProcessorCount=4 -Xmx512m", {
        broad[0]: [50, 50, 0, 0, 0], broad[1]: [56, 55, 0, 0, 1],
        broad[2]: [6, 6, 0, 0, 0], broad[3]: [15, 15, 0, 0, 0]})
    # SoftKeys.java is the existing @ignore/keyword exclusion, not a runtime skip.
    stats = candidate / "build/dfs-qual/test-results/jtreg_test_jdk_java_util_Locale/text/stats.txt"
    if "did not match keywords: 1" not in stats.read_text():
        raise RuntimeError("Locale exclusion is not the pre-existing keyword exclusion")
    for gc in ("Serial", "G1", "Z"):
        tests("focused-" + gc, focused, 1,
              "-XX:ActiveProcessorCount=2 -Xmx512m -XX:+Use" + gc + "GC",
              {case: [1, 1, 0, 0, 0] for case in focused})
    enter("measure")
    command("measure", [sys.executable, candidate / DIRECTORY / "DateFormatSymbolsQualification.py",
        "--baseline-source", root / "baseline", "--candidate-source", candidate,
        "--candidate-ref", args.candidate_ref, "--platform", "linux-x64", "--out", root / "results"],
        cwd=candidate, timeout=PHASES["measure"])
    enter("analysis")
    summary = json.loads((root / "results/summary.json").read_text())
    progress = json.loads((root / "results/progress.json").read_text())
    expected = dict(invocations=686, timing=576, startup=96, allocation=6, diagnostic=6)
    if progress != expected or len(correctness) != 4:
        raise RuntimeError("Incomplete fixed campaign")
    write_json(root / "worker-decision.json", dict(measurement=summary["measurementDecision"],
        correctness="pass", status="pending-outer-resource-and-cleanup-gates",
        counts=progress, candidate=args.candidate_ref))


def supervisor(args):
    started = time.monotonic()  # Before root preparation and every Git/tool call.
    if platform.system() != "Linux" or platform.machine().lower() not in ("x86_64", "amd64"):
        raise RuntimeError("Stage A supervisor requires native Linux x64")
    if not hasattr(os, "pidfd_open") or not hasattr(signal, "pidfd_send_signal"):
        raise RuntimeError("Python/Linux pidfd signaling support is required")
    original_controller = pathlib.Path(__file__).resolve()
    controller_hash = digest(original_controller)
    for name in ("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "LD_PRELOAD",
                 "DYLD_INSERT_LIBRARIES", "CONFIGURE_DEV_NO_MOLD"):
        if os.environ.get(name):
            raise RuntimeError("Remove ambient injection/profile override: " + name)
    if not re.fullmatch("[0-9a-f]{40}", args.candidate_ref):
        raise RuntimeError("Use the full approved immutable qualification SHA")
    for name in ("root", "repo", "boot_jdk", "jtreg"):
        setattr(args, name, getattr(args, name).resolve())
    if not re.fullmatch(r"[/A-Za-z0-9_.-]+", str(args.root)):
        raise RuntimeError("Use an ordinary ASCII root path without quoting metacharacters")
    if args.repo == args.root or args.repo in args.root.parents or args.root in args.repo.parents:
        raise RuntimeError("Use a new root separate from the original repository")
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
    resource.setrlimit(resource.RLIMIT_FSIZE, (2 * 1024 ** 3, 2 * 1024 ** 3))
    # Subreaping retains ownership when descendants double-fork or call setsid.
    libc = ctypes.CDLL(None, use_errno=True)
    if libc.prctl(36, 1, 0, 0, 0) != 0:  # PR_SET_CHILD_SUBREAPER
        raise OSError(ctypes.get_errno(), "Cannot become Linux child subreaper")
    allowed = sorted(os.sched_getaffinity(0))
    if len(allowed) < 4:
        raise RuntimeError("Four available CPUs are required; do not change workload workers")
    selected = set(allowed[:4])
    def interrupted(signum, frame):
        raise InterruptedError("Supervisor received signal " + str(signum))
    for signum in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP):
        signal.signal(signum, interrupted)
    args.root.mkdir(mode=0o700, parents=False, exist_ok=False)
    token = uuid.uuid4().hex
    remembered = {}
    peak_rss = peak_disk = 0
    failure = None
    scan = None
    child = None
    phase_index = -1
    phase_started = started
    phase_names = tuple(PHASES)
    last_scan = started - 30
    env = os.environ.copy()
    frozen = original_controller
    try:
        write_json(args.root / "owner.json", dict(token=token, candidate=args.candidate_ref,
            supervisorPid=os.getpid(), startedMonotonic=started, wallSeconds=WALL_SECONDS))
        (args.root / "logs").mkdir()
        (args.root / "control").mkdir()
        frozen = args.root / "control" / NAME
        shutil.copyfile(original_controller, frozen)
        if digest(frozen) != controller_hash:
            raise RuntimeError("Controller changed during the frozen copy")
        frozen.chmod(0o400)
        for path in ("tmp", "home", "cache", "cache/ccache", "cache/config", "cache/data", "cache/state"):
            (args.root / path).mkdir(exist_ok=True)
        env = os.environ.copy()
        for name in tuple(env):
            if name.startswith(("GIT_", "CCACHE_", "PYTHON")):
                del env[name]
        env.update(HOME=str(args.root / "home"), TMPDIR=str(args.root / "tmp"),
            TMP=str(args.root / "tmp"), TEMP=str(args.root / "tmp"),
            XDG_CACHE_HOME=str(args.root / "cache"), XDG_CONFIG_HOME=str(args.root / "cache/config"),
            XDG_DATA_HOME=str(args.root / "cache/data"), XDG_STATE_HOME=str(args.root / "cache/state"),
            CCACHE_DISABLE="1", CCACHE_DIR=str(args.root / "cache/ccache"),
            CCACHE_TEMPDIR=str(args.root / "tmp"), CCACHE_CONFIGPATH=str(args.root / "cache/ccache.conf"),
            GIT_CONFIG_GLOBAL="/dev/null", GIT_CONFIG_NOSYSTEM="1", GIT_OPTIONAL_LOCKS="0",
            PYTHONDONTWRITEBYTECODE="1", DFS_QUAL_ROOT=str(args.root),
            DFS_QUAL_SUPERVISOR=str(os.getpid()),
            JAVA_TOOL_OPTIONS='-Djava.io.tmpdir="' + str(args.root / "tmp") +
                '" -Duser.home="' + str(args.root / "home") + '" -XX:-UsePerfData')
        # Avoid inherited compiler wrappers/caches or redirects outside the owned root.
        for name in ("CC", "CXX", "CFLAGS", "CXXFLAGS", "LDFLAGS", "MAKEFLAGS", "MFLAGS",
                     "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "JAVA_HOME", "JAVACMD", "JAVA",
                     "JAVAC", "JAVADOC", "JAR", "JTREG_JAVA", "JTREG_JDK", "BOOT_JDK",
                     "CCACHE_PREFIX", "CCACHE_PREFIX_CPP", "CCACHE_PATH", "GIT_DIR", "GIT_WORK_TREE",
                     "GIT_INDEX_FILE", "GIT_OBJECT_DIRECTORY", "GIT_ALTERNATE_OBJECT_DIRECTORIES"):
            env.pop(name, None)
        # One affinity for every build/test/measurement child, identical for both JDKs.
        def child_limits():
            os.sched_setaffinity(0, selected)
            if libc.prctl(1, signal.SIGKILL, 0, 0, 0) != 0:  # PR_SET_PDEATHSIG
                os._exit(125)
            if os.getppid() != int(env["DFS_QUAL_SUPERVISOR"]):
                os._exit(125)
        command = [sys.executable, frozen, "--worker", "--repo", args.repo, "--root", args.root,
                   "--candidate-ref", args.candidate_ref, "--boot-jdk", args.boot_jdk, "--jtreg", args.jtreg]
        write_json(args.root / "limits.json", dict(rssBytes=RSS_LIMIT, storageBytes=DISK_LIMIT,
            wallSeconds=WALL_SECONDS, phaseSeconds=PHASES, cleanupSeconds=CLEANUP_SECONDS,
            cpus=sorted(selected), samplingSeconds=0.2, storageScanIntervalSeconds=30,
            storageScanTimeoutSeconds=10, supervisorSha256=digest(frozen), managedJavaOptions=env["JAVA_TOOL_OPTIONS"]))
        with (args.root / "logs/worker.log").open("w") as stream:
            child = subprocess.Popen(list(map(str, command)), stdout=stream, stderr=subprocess.STDOUT,
                env=env, start_new_session=True, preexec_fn=child_limits)
            with (args.root / "resources.jsonl").open("a", buffering=1) as ledger:
                while True:
                    now = time.monotonic()
                    live = owned_processes(process_table(), remembered)
                    for pid, row in live.items():
                        if pid != child.pid and row["ppid"] == os.getpid() and row["state"] == "Z":
                            os.waitpid(pid, os.WNOHANG)
                    rss = sum(row["rss"] for row in live.values())
                    peak_rss = max(peak_rss, rss)
                    if rss > RSS_LIMIT:
                        raise RuntimeError("Total owned RSS ceiling exhausted")
                    if now - started > WALL_SECONDS - CLEANUP_SECONDS:
                        raise TimeoutError("Whole-run deadline exhausted; cleanup reserve entered")
                    phase_path = args.root / "phase.json"
                    if phase_path.exists():
                        current = json.loads(phase_path.read_text())["name"]
                        index = phase_names.index(current)
                        if index != phase_index:
                            if index != phase_index + 1:
                                raise RuntimeError("Missing/reordered phase boundary")
                            phase_index, phase_started = index, now
                        if now - phase_started > PHASES[current]:
                            raise TimeoutError("Phase ceiling exhausted: " + current)
                    elif now - started > PHASES["prepare"]:
                        raise TimeoutError("Preparation failed to publish its boundary")
                    if scan is not None:
                        if not scan.thread.is_alive():
                            if scan.error:
                                raise RuntimeError("Storage accounting failed: " + scan.error)
                            peak_disk = max(peak_disk, scan.result)
                            ledger.write(json.dumps(dict(elapsed=now-started, storageBytes=scan.result)) + "\n")
                            if scan.result > DISK_LIMIT:
                                raise RuntimeError("Owned storage ceiling exhausted")
                            scan = None
                        elif now - scan.started > 10:
                            raise TimeoutError("Storage accounting deadline exhausted")
                    if scan is None and now - last_scan >= 30:
                        scan = StorageScan(args.root)
                        last_scan = now
                    ledger.write(json.dumps(dict(elapsed=now-started, rssBytes=rss,
                        pids={str(pid): row["start"] for pid, row in live.items()}, phase=phase_index)) + "\n")
                    if child.poll() is not None:
                        if child.returncode != 0:
                            raise RuntimeError("Worker failed; see logs/worker.log")
                        if phase_index != len(PHASES) - 1:
                            raise RuntimeError("Worker ended before analysis boundary")
                        break
                    time.sleep(0.2)
    except BaseException as error:
        failure = repr(error)
    finally:
        # A second ordinary termination request must not interrupt bounded cleanup.
        for signum in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP):
            signal.signal(signum, signal.SIG_IGN)
        cleanup_deadline = min(started + WALL_SECONDS, time.monotonic() + CLEANUP_SECONDS)
        (args.root / "logs").mkdir(exist_ok=True)
        if scan is not None:
            scan.stop.set()
            scan.thread.join(timeout=1)
            if scan.thread.is_alive():
                failure = failure or "Storage accounting thread did not stop"
        # Freeze/kill identities, not arbitrary users or machine-wide Java processes.
        # Repeated snapshots capture children created just before a parent stops.
        remaining = {}
        try:
            while time.monotonic() < cleanup_deadline - 5:
                live = owned_processes(process_table(), remembered)
                peak_rss = max(peak_rss, sum(row["rss"] for row in live.values()))
                if peak_rss > RSS_LIMIT:
                    failure = failure or "Total owned RSS ceiling exhausted during cleanup"
                remaining = {pid: row for pid, row in live.items() if pid != os.getpid()}
                if not remaining:
                    break
                for pid, row in remaining.items():
                    signal_identity(pid, row["start"], signal.SIGSTOP)
                for pid, row in remaining.items():
                    signal_identity(pid, row["start"], signal.SIGKILL)
                if child is not None:
                    child.poll()  # Reap Popen's child before waitpid(-1) can consume it.
                if child is None or child.returncode is not None:
                    while True:
                        try:
                            pid, _ = os.waitpid(-1, os.WNOHANG)
                            if pid == 0:
                                break
                        except ChildProcessError:
                            break
                time.sleep(0.1)
            if remaining:
                failure = failure or "Owned descendants did not terminate"
            if not remaining and time.monotonic() < cleanup_deadline - 2:
                # Final storage measurement is also monitored, before discarding builds.
                final_scan = StorageScan(args.root)
                while final_scan.thread.is_alive() and time.monotonic() < min(final_scan.started + 10, cleanup_deadline - 2):
                    live = owned_processes(process_table(), remembered)
                    peak_rss = max(peak_rss, sum(row["rss"] for row in live.values()))
                    time.sleep(0.1)
                if final_scan.thread.is_alive() or final_scan.error:
                    final_scan.stop.set()
                    failure = failure or "Final storage accounting incomplete"
                else:
                    peak_disk = max(peak_disk, final_scan.result)
                    if peak_disk > DISK_LIMIT:
                        failure = failure or "Owned storage ceiling exhausted"
                with (args.root / "logs/cleanup.log").open("w") as stream:
                    cleanup_controller = frozen if frozen.exists() and digest(frozen) == controller_hash else original_controller
                    if digest(cleanup_controller) != controller_hash:
                        raise RuntimeError("No unchanged controller remains for safe file cleanup")
                    cleaner = subprocess.Popen([sys.executable, str(cleanup_controller), "--clean", "--root",
                        str(args.root), "--token", token], env=env, stdout=stream,
                        stderr=subprocess.STDOUT, start_new_session=True)
                    while cleaner.poll() is None and time.monotonic() < cleanup_deadline - 1:
                        live = owned_processes(process_table(), remembered)
                        peak_rss = max(peak_rss, sum(row["rss"] for row in live.values()))
                        time.sleep(0.1)
                    if cleaner.poll() is None:
                        cleaner.kill()
                        failure = failure or "File cleanup deadline exhausted"
                        try:
                            cleaner.wait(timeout=max(0.1, cleanup_deadline - time.monotonic()))
                        except subprocess.TimeoutExpired:
                            failure = failure or "Cleaner did not terminate"
                    if cleaner.poll() != 0:
                        failure = failure or "File cleanup incomplete"
                live = owned_processes(process_table(), remembered)
                remaining = {pid: row for pid, row in live.items() if pid != os.getpid()}
                if remaining:
                    failure = failure or "Owned processes remain after file cleanup"
                if peak_rss > RSS_LIMIT:
                    failure = failure or "Total owned RSS ceiling exhausted during cleanup"
        except BaseException as error:
            failure = failure or "Cleanup error: " + repr(error)
        decision = None
        try:
            if (args.root / "worker-decision.json").exists():
                decision = json.loads((args.root / "worker-decision.json").read_text())
            cleanup_path = args.root / "cleanup.json"
            if not cleanup_path.exists() or json.loads(cleanup_path.read_text())["remaining"]:
                failure = failure or "Missing complete cleanup ledger"
        except Exception as error:
            failure = failure or "Terminal ledger error: " + repr(error)
        if time.monotonic() > cleanup_deadline:
            failure = failure or "Final cleanup/ledger deadline exhausted"
        report = dict(
            outcome="inconclusive" if failure or decision is None else (
                "worthwhile-on-linux-x64" if decision["measurement"] == "pass" else decision["measurement"]),
            failure=failure, worker=decision, elapsedSeconds=time.monotonic()-started,
            peakOwnedRssBytes=peak_rss, peakOwnedStorageBytes=peak_disk,
            remainingOwnedPids={str(pid): row["start"] for pid, row in remaining.items()},
            note="Sampling is not an instantaneous kernel quota. No mixed clone/serialization performance claim.")
        write_json(args.root / "decision.json", report)
        if time.monotonic() > cleanup_deadline and not failure:
            failure = "Terminal decision write exceeded final deadline"
            report.update(outcome="inconclusive", failure=failure, elapsedSeconds=time.monotonic()-started)
            write_json(args.root / "decision.json", report)
    return 0 if not failure and decision is not None else 1


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=pathlib.Path)
    parser.add_argument("--candidate-ref")
    parser.add_argument("--root", type=pathlib.Path, required=True)
    parser.add_argument("--boot-jdk", type=pathlib.Path)
    parser.add_argument("--jtreg", type=pathlib.Path)
    parser.add_argument("--worker", action="store_true", help=argparse.SUPPRESS)
    parser.add_argument("--clean", action="store_true", help=argparse.SUPPRESS)
    parser.add_argument("--token", help=argparse.SUPPRESS)
    args = parser.parse_args()
    if args.clean:
        clean(args.root, args.token)
        return 0
    if any(getattr(args, name) is None for name in ("repo", "candidate_ref", "boot_jdk", "jtreg")):
        parser.error("--repo, --candidate-ref, --boot-jdk and --jtreg are required")
    if args.worker:
        worker(args)
        return 0
    return supervisor(args)


if __name__ == "__main__":
    sys.exit(main())
