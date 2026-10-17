#!/usr/bin/env python3
"""One approval-bound, serial, no-timing decoder mechanism qualification.

`plan` is inert. `run` requires a separately authorized, hashed approval receipt.
The historical performance campaign is deliberately not imported.
"""
import argparse
import datetime as dt
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import resource
import shlex
import shutil
import signal
import sys
import time

# Running the committed entry point must not dirty its normal source checkout.
sys.dont_write_bytecode = True
from mechanism_process import Clock, Executor, Failure
from mechanism_deadline import DeadlineGuard, deadline_check
from mechanism_storage import StorageGuard, RoleStaging, RESERVE_BYTES, POLL_SECONDS
from mechanism_evidence import analyze_capture, compare_captures
from decode_capture import extract

HERE = Path(__file__).resolve().parent
REPOSITORY = HERE.parents[4]
DOCUMENTS = HERE.parents[2]
BASELINE = "01903ba375f94c0ab7f9193d3e36bd30fe663d7e"
CANDIDATE = "b7534f5ccac7847a22ba7b63a6ea18beb71580e2"
CODEC = "7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6"
OLD_CANDIDATE = "75ee82dff6f86e41aad8cedfe947a90a2b9296df"
PHASE_CAPS = dict(preflight=300, builds=4800, prepare=300, safety=600,
                  capture=300, review=840, cleanup=60)
ROLE_CAPS = {"base-release": 1500, "candidate-release": 1500,
             "candidate-fastdebug": 1800}
FEATURES = set("cds compiler1 compiler2 epsilongc g1gc jfr jni-check jvmti "
               "management parallelgc serialgc services shenandoahgc vm-structs zgc".split())
COMMON = ["--add-modules", "jdk.incubator.vector", "-Xshare:off", "-Xms512m",
          "-Xmx512m", "-XX:+UseG1GC", "-Xbatch", "-XX:-TieredCompilation",
          "-XX:-UseOnStackReplacement", "-XX:CompileThresholdScaling=0.1"]
TARGET = "BlockDecoder::decodeSequencesRolling"
EXISTING = ("compiler/regalloc/TestC2IntPressure.java",
            "compiler/exceptions/TestSpilling.java")
FOCUSED = ("compiler/regalloc/TestColdCallSpillPolicy.java",
           "compiler/regalloc/TestColdCallSpillPlacement.java",
           "compiler/regalloc/TestColdCallDerivedPointers.java")
SAFETY_SUITES = (
    dict(id="base-existing", role="base-release", selectors=EXISTING, enabled=False, native=False),
    dict(id="release-focused", role="candidate-release", selectors=FOCUSED, enabled=False, native=True),
    dict(id="release-existing", role="candidate-release", selectors=EXISTING, enabled=True, native=False),
    dict(id="debug-focused", role="candidate-fastdebug", selectors=FOCUSED, enabled=False, native=True),
    dict(id="debug-existing", role="candidate-fastdebug", selectors=EXISTING +
         ("compiler/regalloc/TestVerifyRegisterAllocator.java",), enabled=True, native=False),
    dict(id="debug-handshake", role="candidate-fastdebug", selectors=
         ("runtime/handshake/AsyncHandshakeWalkStackTest.java", "runtime/Unsafe/InternalErrorTest.java"),
         enabled=False, native=False),
)
CAPTURE_CELLS = ("base", "default", "off", "on", "debug-off", "debug-on")
CONFIG_KEYS = {"schema", "jdk_source", "codec_source", "boot_jdk", "jtreg", "junit",
               "cc", "cxx", "environment", "configure"}
ENV_KEYS = {"PATH", "LD_LIBRARY_PATH", "LIBRARY_PATH", "CPATH", "PKG_CONFIG_PATH"}
CONFIGURE_PREFIXES = ("--with-toolchain-path=", "--with-extra-ldflags=", "--with-freetype=",
                      "--x-includes=", "--x-libraries=", "--with-cups-include=",
                      "--with-fontconfig-include=", "--with-alsa=")
SOURCE_CORPUS_BYTES = 764896
SOURCE_CORPUS_SHA256 = "dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9"
SHA_RE = re.compile(r"[0-9a-f]{64}\Z")
REV_RE = re.compile(r"[0-9a-f]{40}\Z")
PACKAGE_FILES = {"README.md", "MECHANISM-VALIDATION.md", "MECHANISM-VALIDATION-PLAN.json",
                 "MECHANISM-REFERENCE-STORES.json", "MECHANISM-CONFIG.example.json",
                 "MECHANISM-APPROVAL.example.json", "FUTURE-VALIDATION-PLAN.json"} | {
    "scripts/jdk27/cold-call/" + name for name in (
        "mechanism_validation.py", "mechanism_process.py", "mechanism_prepare.py", "mechanism_evidence.py", "mechanism_deadline.py",
        "mechanism_storage.py", "test_mechanism_storage.py",
        "test_mechanism_validation.py", "test_mechanism_process.py", "test_mechanism_evidence.py",
        "test_mechanism_deadline.py",
        "qualify_decoder.py", "DecoderQualification.java", "decode_capture.py")}


def require(condition, message):
    if not condition:
        raise Failure(message)


def sha256(path, check=None):
    check = check or deadline_check
    digest = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            if check:
                check()
            digest.update(block)
    return digest.hexdigest()


def json_bytes(value):
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode()


def save(path, value):
    path = Path(path)
    temporary = path.with_suffix(path.suffix + ".tmp")
    deadline_check()
    encoder = json.JSONEncoder(sort_keys=True, indent=2)
    with temporary.open("w") as stream:
        for piece in encoder.iterencode(value):
            deadline_check()
            stream.write(piece)
        deadline_check()
        stream.write("\n")
    deadline_check()
    temporary.replace(path)
    deadline_check()


def utc(value):
    try:
        parsed = dt.datetime.fromisoformat(value.replace("Z", "+00:00"))
    except (ValueError, TypeError, AttributeError) as error:
        raise Failure("invalid aware UTC approval timestamp") from error
    require(parsed.tzinfo is not None and parsed.utcoffset() == dt.timedelta(0),
            "approval timestamps must be explicit UTC")
    return parsed


def validate_approval(approval, config_sha256, runner_revision, package_sha256, now=None):
    require(isinstance(approval, dict), "approval must be an object")
    expected = dict(schema=1, kind="cold-call-mechanism-approval", execution_authorized=True,
                    candidate=CANDIDATE, baseline=BASELINE, codec=CODEC,
                    config_sha256=config_sha256, runner_revision=runner_revision,
                    package_sha256=package_sha256)
    required = set(expected) | {"run_id", "started_utc", "deadline_utc"}
    require(set(approval) == required, "approval fields differ from frozen schema")
    for key, value in expected.items():
        require(approval.get(key) == value and type(approval.get(key)) is type(value),
                "approval identity/authorization mismatch: " + key)
    require(REV_RE.fullmatch(runner_revision or "") is not None, "exact runner commit required")
    require(all(SHA_RE.fullmatch(s or "") for s in (config_sha256, package_sha256)),
            "approval requires exact config/package SHA256")
    require(re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9_.-]{0,79}", approval["run_id"] or ""),
            "invalid run identity")
    start, end = utc(approval["started_utc"]), utc(approval["deadline_utc"])
    require((end - start).total_seconds() == 7200, "one immutable 7200-second outer cap required")
    now = now or dt.datetime.now(dt.timezone.utc)
    require(now.tzinfo is not None, "current time must be aware")
    require(start <= now < end, "approval start is future or deadline expired")
    return approval


def validate_config(config):
    require(isinstance(config, dict) and set(config) == CONFIG_KEYS, "unknown/missing config fields")
    require(type(config["schema"]) is int and config["schema"] == 1, "unsupported config schema")
    for key in ("jdk_source", "codec_source", "boot_jdk", "jtreg", "junit", "cc", "cxx"):
        value = config[key]
        require(isinstance(value, str) and Path(value).is_absolute() and "\n" not in value
                and "\x00" not in value, "absolute ordinary source/tool path required: " + key)
    environment = config["environment"]
    require(isinstance(environment, dict) and set(environment) <= ENV_KEYS,
            "unreviewed inherited Java/compiler/environment setting")
    require("PATH" in environment, "frozen PATH required")
    for key, value in environment.items():
        require(isinstance(value, str) and "\x00" not in value and "\n" not in value,
                "invalid environment value: " + key)
        require(all(Path(p).is_absolute() for p in value.split(":")),
                "environment search paths must be absolute and nonempty")
    flags = config["configure"]
    require(isinstance(flags, list) and all(isinstance(f, str) for f in flags),
            "configure must be a list of reviewed dependency arguments")
    seen = set()
    for flag in flags:
        require(flag.startswith(CONFIGURE_PREFIXES) and flag.split("=", 1)[1],
                "unreviewed configure override: " + flag)
        key = flag.split("=", 1)[0]
        require(key not in seen, "duplicate configure override")
        seen.add(key)
        # Link search paths and an explicit installed linker are the only extra flags.
        if key == "--with-extra-ldflags":
            require(all(re.fullmatch(r"(?:-L/[^\s]+|-B/[^\s]+|-Wl,-rpath,/[^\s]+|-m64|-fuse-ld=(?:mold|bfd|gold|lld))", p)
                        for p in flag.split("=", 1)[1].split()), "unreviewed linker flags")
            pieces = flag.split("=", 1)[1].split()
            require(len([p for p in pieces if p.startswith("-fuse-ld=")]) <= 1
                    and len([p for p in pieces if p.startswith("-B")]) <= 1, "ambiguous linker selection")
        else:
            require(Path(flag.split("=", 1)[1]).is_absolute(), "dependency path must be absolute")
        require(not any(c in flag for c in ("\x00", "\n", "`", "$")), "unsafe configure text")
    require(Path(config["cc"]).name == "gcc" and Path(config["cxx"]).name == "g++",
            "installed GCC/G++ required; no compiler substitution")
    require(Path(config["cc"]).parent == Path(config["cxx"]).parent, "GCC/G++ must be one installed toolchain")
    return config


def linker_flags(config):
    return next((flag.split("=", 1)[1].split() for flag in config["configure"]
                 if flag.startswith("--with-extra-ldflags=")), [])


def host_snapshot(workspace):
    """Read-only Linux admission; no fork, workload, stress probe, or privileged action."""
    errors, processes, threads, zombies, uid_count = [], 0, 0, 0, 0
    try:
        for path in Path("/proc").iterdir():
            if not path.name.isdigit():
                continue
            try:
                status = (path / "status").read_text()
            except (FileNotFoundError, ProcessLookupError):
                continue
            fields = dict(line.split(":", 1) for line in status.splitlines() if ":" in line)
            processes += 1
            tasks = int(fields.get("Threads", "0").strip())
            require(tasks > 0, "missing live process thread accounting")
            threads += tasks
            if fields.get("PPid", "").strip() == "1" and fields.get("State", "").strip().startswith("Z"):
                zombies += 1
            if fields.get("Uid", "").split()[:1] == [str(os.getuid())]:
                uid_count += tasks
        mem = dict(line.split(":", 1) for line in Path("/proc/meminfo").read_text().splitlines())
        memory = int(mem["MemTotal"].split()[0]) * 1024
        headrooms = [int(Path("/proc/sys/kernel/pid_max").read_text()) - threads,
                     int(Path("/proc/sys/kernel/threads-max").read_text()) - threads]
        limit = resource.getrlimit(resource.RLIMIT_NPROC)[0]
        if limit != resource.RLIM_INFINITY:
            headrooms.append(limit - uid_count)
        cgroups = Path("/proc/self/cgroup").read_text().splitlines()
        unified = next((line.split(":", 2)[2] for line in cgroups if line.startswith("0::")), None)
        require(unified is not None, "unified cgroup process/memory limits unavailable")
        root = Path("/sys/fs/cgroup")
        current = root / unified.lstrip("/")
        # Some containers expose their current namespace root directly.
        if not current.is_dir():
            current = root
        while True:
            if (current / "pids.max").is_file():
                maximum = (current / "pids.max").read_text().strip()
                usage = int((current / "pids.current").read_text())
                if maximum != "max":
                    headrooms.append(int(maximum) - usage)
            else:
                errors.append("missing cgroup pids accounting")
            if (current / "memory.max").is_file():
                maximum = (current / "memory.max").read_text().strip()
                if maximum != "max":
                    memory = min(memory, int(maximum))
            if current == root:
                break
            require(root in current.parents, "cgroup path escaped hierarchy")
            current = current.parent
        executable = Path(sys.executable).read_bytes()[:20]
        native = executable[:6] == b"\x7fELF\x02\x01" and executable[18:20] == b"\x3e\x00"
        snapshot = dict(system=platform.system(), machine=platform.machine(), native=native,
                        ram_bytes=memory, free_bytes=shutil.disk_usage(workspace).free,
                        pid1_zombies=zombies, process_count=processes,
                        process_headroom=min(headrooms), probe_errors=errors,
                        observed_utc=dt.datetime.now(dt.timezone.utc).isoformat())
    except (OSError, ValueError, KeyError, Failure) as error:
        snapshot = dict(system=platform.system(), machine=platform.machine(), native=False,
                        ram_bytes=0, free_bytes=0, pid1_zombies=zombies, process_headroom=0,
                        probe_errors=errors + [str(error)])
    return snapshot


def admit_host(snapshot, initial=None):
    required = {"system", "machine", "native", "ram_bytes", "free_bytes", "pid1_zombies",
                "process_headroom", "probe_errors"}
    require(isinstance(snapshot, dict) and required <= snapshot.keys()
            and snapshot["probe_errors"] == [], "host readiness unavailable")
    require(snapshot.get("system") == "Linux" and snapshot.get("machine") == "x86_64"
            and snapshot.get("native") is True, "native Linux x86-64 required")
    require(snapshot.get("ram_bytes", 0) >= 16 * 1024**3, "16 GiB usable RAM required")
    # This is an explicit live stop reserve, not a claimed complete-build peak.
    require(snapshot.get("free_bytes", 0) > RESERVE_BYTES,
            "storage safety reserve reached")
    require(snapshot.get("process_headroom", 0) >= 4096, "insufficient process headroom")
    z = snapshot.get("pid1_zombies", -1)
    require(isinstance(z, int) and z >= 0, "PID1 zombie accounting unavailable")
    if initial is None:
        require(z <= 32, "unsafe initial PID1 zombie count")
    else:
        require(0 <= initial.get("pid1_zombies", -1) <= 32, "unsafe initial host identity")
        require(z <= initial["pid1_zombies"] + 64, "PID1 zombie growth exceeded 64")
    return snapshot


class Budget:
    """Aggregate phase and role clocks; switching phases never resets a debit."""
    def __init__(self, clock, monotonic=time.monotonic):
        self.clock, self.monotonic = clock, monotonic
        self.phase, self.last = None, monotonic()
        self.used = {name: 0.0 for name in PHASE_CAPS}
        self.roles = {}
        self.active_role = None

    def check(self):
        now = self.monotonic()
        require(now >= self.last, "monotonic clock moved backwards")
        if self.phase:
            self.used[self.phase] += now - self.last
            require(self.used[self.phase] < PHASE_CAPS[self.phase], "aggregate phase cap: " + self.phase)
        self.last = now
        require(self.clock.remaining(reserve=0 if self.phase == "cleanup" else 60) > 0,
                "immutable deadline/cleanup reserve exhausted")
        return min(PHASE_CAPS.get(self.phase, 7200) - self.used.get(self.phase, 0),
                   self.clock.remaining(reserve=0 if self.phase == "cleanup" else 60))

    def enter(self, phase):
        require(phase in PHASE_CAPS, "unknown phase")
        if phase == "cleanup" and self.phase != "cleanup":
            now = self.monotonic()
            require(now >= self.last, "monotonic clock moved backwards")
            if self.phase:
                self.used[self.phase] += now - self.last
            self.phase, self.last = phase, now
            return self.check()
        self.check()
        self.phase = phase
        return self.check()

    def start_role(self, role):
        self.check()
        require(role in ROLE_CAPS and role not in self.roles, "build role cannot restart")
        self.roles[role] = self.monotonic()
        self.active_role = role

    def remaining_role(self, role):
        self.check()
        require(role in self.roles, "build role has not started")
        remaining = ROLE_CAPS[role] - (self.monotonic() - self.roles[role])
        require(remaining > 0, "aggregate build role cap: " + role)
        return min(remaining, self.check())


class JobRegistry:
    """An exact one-shot registry: no timing, diagnostics, retries, or extra cells."""
    def __init__(self):
        self.claimed = {}
        self.expected = {"safety-" + s["id"]: "safety" for s in SAFETY_SUITES}
        self.expected.update({"capture-" + c: "capture" for c in CAPTURE_CELLS})
        self.expected.update({"objdump-" + c: "objdump" for c in CAPTURE_CELLS})
        for name in ("runner", "codec", "codec-copy", *ROLE_CAPS):
            self.expected.update({"source-" + name + "-" + suffix: "preflight" for suffix in ("head", "status")})
        self.expected.update({"checkout-" + role: "preflight" for role in (*ROLE_CAPS, "codec")})
        self.expected.update({"tool-" + name: "preflight" for name in
                              ("cc", "cxx", "boot-java", "jtreg", "resolve-cc1", "resolve-cc1plus", "resolve-as", "resolve-ld",
                               "zstd-headers", "zstd-library")})
        for role in ROLE_CAPS:
            self.expected.update({prefix + "-" + role: "build" for prefix in ("configure", "images", "provenance")})
            self.expected.update({"source-" + role + "-built-" + suffix: "build" for suffix in ("head", "status")})
        self.expected.update({name: "prepare" for name in ("prepare-frames", "native-policy")})

    def claim(self, name, kind):
        require(kind in {"safety", "capture", "objdump", "preflight", "build", "prepare"},
                "forbidden timing/diagnostic job")
        require(name not in self.claimed, "job retry/repeat forbidden: " + name)
        require(self.expected.get(name) == kind, "unexpected fixed job: " + name)
        self.claimed[name] = kind

    def assert_complete(self):
        require(all(self.claimed.get(name) == kind for name, kind in self.expected.items()),
                "missing fixed safety/capture/objdump job")


def parse_spec(text):
    return {match[1]: match[2].strip() for match in re.finditer(r"^([A-Za-z0-9_]+)[ \t]*:?=[ \t]*(.*)$", text, re.M)}


def validate_spec(spec_text, role, config):
    spec = parse_spec(spec_text)
    expected = dict(CC_VERSION_NUMBER="16.2.0", CXX_VERSION_NUMBER="16.2.0",
                    CC=config["cc"], CXX=config["cxx"], BOOT_JDK=config["boot_jdk"],
                    LD=config["cc"], LDCXX=config["cxx"], AS=config["cc"] + " -c",
                    TOOLCHAIN_TYPE="gcc", WARNINGS_AS_ERRORS="true", JVM_VARIANTS="server",
                    DEBUG_LEVEL="fastdebug" if role == "candidate-fastdebug" else "release")
    for key, value in expected.items():
        require(spec.get(key) == value, "build configuration mismatch: " + key)
    require(set(spec.get("JVM_FEATURES_server", "").split()) == FEATURES, "normal server features required")
    require(spec.get("CFLAGS_CCACHE") == "", "ccache/reused build cache forbidden")
    require(shlex.split(spec.get("EXTRA_LDFLAGS", "")) == ["-m64", *linker_flags(config)],
            "configured linker arguments differ from frozen configuration")
    selectors = [flag for flag in linker_flags(config) if flag.startswith(("-fuse-ld=", "-B"))]
    require([flag for flag in shlex.split(spec.get("JVM_LDFLAGS", ""))
             if flag.startswith(("-fuse-ld=", "-B"))] == selectors, "unreviewed JVM linker selection")
    return {key: spec[key] for key in expected} | {"JVM_FEATURES_server": sorted(FEATURES),
            "CFLAGS_CCACHE": "", "EXTRA_LDFLAGS": shlex.split(spec["EXTRA_LDFLAGS"])}


def validate_safety_receipt(suite, stdout, report_dir, work_dir=None):
    selectors = suite["selectors"]
    matches = re.findall(r"Test results:\s*passed:\s*(\d+)([^\n]*)", stdout)
    require(len(matches) == 1 and int(matches[0][0]) == len(selectors)
            and not re.search(r"failed|error|not run|skipped", matches[0][1], re.I),
            "missing/failed exact jtreg selector summary")
    work = Path(work_dir or report_dir)
    records = []
    for selector in selectors:
        expected = work / Path(selector).with_suffix(".jtr")
        require(expected.is_file(), "missing selected jtreg result: " + selector)
        result = expected.read_text(errors="replace")
        statuses = re.findall(r"^testresult=(.*)$", result, re.M)
        # JTR format uses either testresult or the final status line.
        if not statuses:
            statuses = re.findall(r"^test result:\s*(.*)$", result, re.M)
        require(statuses and all(s.startswith("Passed.") for s in statuses),
                "selected jtreg test did not pass: " + selector)
        require(not re.search(r"(?:@requires|not selected|Test ignored|Skipped:|skip test)", result, re.I),
                "selected jtreg test was skipped: " + selector)
        records.append(dict(selector=selector, path=str(expected), sha256=sha256(expected), status=statuses[-1]))
    require(Path(report_dir).is_dir(), "missing jtreg report directory")
    return dict(id=suite["id"], role=suite["role"], selected=len(selectors), results=records)


def inventory(root, budget=None, check=None):
    """A full byte inventory, including symlink targets; never just libjvm."""
    root, records = Path(root), {}
    require(root.is_dir(), "missing inventory root: " + str(root))
    for path in sorted(root.rglob("*")):
        if budget:
            budget.check()
        if check:
            check()
        relative = str(path.relative_to(root))
        if path.is_symlink():
            require(path.resolve().is_relative_to(root.resolve()), "inventory symlink escapes image")
            records[relative] = dict(symlink=os.readlink(path))
        elif path.is_file():
            records[relative] = dict(bytes=path.stat().st_size,
                                     sha256=sha256(path, check or (budget.check if budget else None)))
    require(records, "empty inventory")
    return records


class Mechanism:
    def __init__(self, config, approval, output, config_path, approval_path, manifest_path,
                 clock=None, executor_factory=Executor, deadline_guard=None):
        self.config, self.approval = config, approval
        self.output = Path(output)
        self.clock = clock or Clock(approval)
        self.budget = Budget(self.clock)
        self.registry = JobRegistry()
        self.receipt = dict(schema=1, scope="mechanism only; no timing", status="STARTING",
                            previous_performance_verdict="NO-GO", approval=approval,
                            commands=[], sources={}, images={}, safety={}, captures={})
        self.input_paths = [Path(config_path), Path(approval_path), Path(manifest_path)]
        self.seals = {str(p.resolve()): sha256(p) for p in self.input_paths}
        package = json.loads(Path(manifest_path).read_text())
        for relative, digest in package.get("files", {}).items():
            self.seals[str(DOCUMENTS / relative)] = digest
        self.image_seals = {}
        self.directory_seals = {}
        self.initial_host = None
        self.executor_factory, self.executor = executor_factory, None
        self.trees, self.images, self.source_seals, self.tool_seals = {}, {}, {}, {}
        self.failed = False
        self.deadline_guard = deadline_guard
        self.storage = StorageGuard(self.output)
        self.receipt["storage"] = self.storage.record
        self.receipt["staging"] = {}

    def controller_remaining(self):
        """Read absolute bounds without mutating the aggregate Budget clock."""
        budget = self.budget
        remaining = self.clock.remaining(reserve=0 if budget.phase == "cleanup" else 60)
        now = budget.monotonic()
        if budget.phase:
            remaining = min(remaining, PHASE_CAPS[budget.phase] - budget.used[budget.phase] - (now - budget.last))
        if budget.active_role and budget.phase != "cleanup":
            role = budget.active_role
            remaining = min(remaining, budget.roles[role] + ROLE_CAPS[role] - now)
        return remaining

    def defer_deadline(self):
        if self.executor and self.deadline_guard and self.deadline_guard.expired_at is not None:
            self.executor.constrain_cleanup_deadline(self.deadline_guard.expired_at + 60)
        if self.executor and (getattr(self.executor, "_launching", False) or getattr(self.executor, "_cleaning", False)):
            self.executor.cancel_signal(signal.SIGALRM)
            return True
        return False

    def persist(self):
        self.receipt["phase_seconds"] = self.budget.used
        self.receipt["clock"] = self.clock.record()
        save(self.output / "campaign.json", self.receipt)

    def host_probe(self):
        self.storage.check(force=True)
        snapshot = host_snapshot(self.output)
        admit_host(snapshot, self.initial_host)
        if self.initial_host is None:
            self.initial_host = snapshot
            self.receipt["initial_host"] = snapshot
        self.receipt["latest_host"] = snapshot
        snapshot["available_process_slots"] = snapshot["process_headroom"]
        return snapshot

    def verify_seals(self, full=False, check=None):
        check = check or self.budget.check
        check()
        for path, expected in self.seals.items():
            require(Path(path).is_file() and sha256(path, check) == expected, "sealed input changed: " + path)
        for path, expected in self.source_seals.items():
            require(Path(path).is_file() and sha256(path, check) == expected, "source/helper changed: " + path)
        for path, expected in self.tool_seals.items():
            require(Path(path).is_file() and sha256(path, check) == expected, "installed tool changed: " + path)
        if full:
            for path, expected in self.image_seals.items():
                check()
                require(Path(path).is_file() and sha256(path, check) == expected, "sealed image changed: " + path)
            for root, expected in self.directory_seals.items():
                require(inventory(root, check=check) == expected, "sealed directory inventory changed: " + root)

    def phase(self, phase):
        remaining = self.budget.enter(phase)
        self.executor.start_phase(phase, min(PHASE_CAPS[phase], remaining),
                                  absolute_deadline=self.budget.last + PHASE_CAPS[phase] - self.budget.used[phase])
        self.verify_seals(full=True)
        self.receipt["phase"] = phase
        self.persist()

    def command(self, name, argv, cwd, cap, kind, role=None):
        require(not self.failed, "campaign already stopped")
        self.verify_seals(check=(lambda: self.budget.remaining_role(role)) if role else None)
        self.registry.claim(name, kind)
        remaining = self.budget.remaining_role(role) if role else self.budget.check()
        try:
            record = self.executor.run(name, [str(a) for a in argv], Path(cwd),
                                       min(cap, remaining), role_remaining=remaining,
                                       role_deadline=self.budget.roles[role] + ROLE_CAPS[role] if role else None)
        except BaseException:
            self.failed = True
            raise
        self.receipt["commands"].append(record)
        for stream in ("stdout", "stderr"):
            path = record[stream + "_path"]
            require(sha256(path) == record[stream + "_sha256"], "command log hash mismatch")
            self.seals[path] = record[stream + "_sha256"]
        self.budget.remaining_role(role) if role else self.budget.check()
        self.persist()
        return Path(record["stdout_path"]).read_text(errors="replace"), record

    def git(self, name, repo, args, role=None):
        return self.command(name, ["git", "-C", repo, *args], self.output, 30,
                            "build" if role else "preflight", role)[0].strip()

    def clean_head(self, repo, revision, name, role=None):
        head = self.git("source-" + name + "-head", repo, ["rev-parse", "HEAD"], role)
        require(head == revision, "exact source revision mismatch: " + str(repo))
        status = self.git("source-" + name + "-status", repo,
                          ["status", "--porcelain=v1", "--untracked-files=normal"], role)
        require(not status, "dirty source checkout: " + str(repo))
        return head

    def preflight(self):
        self.phase("preflight")
        c = self.config
        require(Path(c["jdk_source"]).resolve() == REPOSITORY, "run the committed runner from its ordinary JDK checkout")
        for key in ("jdk_source", "codec_source", "boot_jdk", "jtreg"):
            require(Path(c[key]).is_dir(), "missing installed source/tool: " + key)
        for key in ("cc", "cxx", "junit"):
            require(Path(c[key]).is_file(), "missing installed prerequisite: " + key)
        self.clean_head(c["jdk_source"], self.approval["runner_revision"], "runner")
        self.clean_head(c["codec_source"], CODEC, "codec")
        for role, revision in (("base-release", BASELINE), ("candidate-release", CANDIDATE),
                               ("candidate-fastdebug", CANDIDATE)):
            tree = self.output / "trees" / role
            tree.parent.mkdir(exist_ok=True)
            self.command("checkout-" + role, ["git", "-C", c["jdk_source"], "worktree", "add",
                         "--detach", tree, revision], self.output, 60, "preflight")
            self.trees[role] = tree
            self.clean_head(tree, revision, role)
            self.receipt["sources"][role] = dict(revision=revision, path=str(tree))
        codec = self.output / "trees" / "codec"
        self.command("checkout-codec", ["git", "-C", c["codec_source"], "worktree", "add", "--detach", codec, CODEC],
                     self.output, 60, "preflight")
        self.clean_head(codec, CODEC, "codec-copy")
        self.codec = codec
        freeze = json.loads((DOCUMENTS / "FUTURE-VALIDATION-PLAN.json").read_text())
        require(freeze["production_revision"] == CANDIDATE, "source plan candidate mismatch")
        for role in ("candidate-release", "candidate-fastdebug"):
            for relative, digest in freeze["source_file_sha256"].items():
                path = self.trees[role] / relative
                require(sha256(path) == digest, "required b753 source bytes differ: " + relative)
                self.source_seals[str(path)] = digest
        for key in ("cc", "cxx"):
            text, record = self.command("tool-" + key, [c[key], "--version"], self.output, 10, "preflight")
            require(re.search(r"\b16\.2\.0\b", text.splitlines()[0]), "GCC/G++ 16.2.0 required")
            self.tool_seals[c[key]] = sha256(c[key])
        boot = Path(c["boot_jdk"]) / "bin/java"
        _, record = self.command("tool-boot-java", [boot, "-version"], self.output, 10, "preflight")
        version = Path(record["stderr_path"]).read_text()
        require(re.search(r'(?:openjdk|java) version "27(?:[.\-+\"]|$)', version), "boot JDK 27 required")
        jtreg = Path(c["jtreg"]) / "bin/jtreg"
        text, record = self.command("tool-jtreg", [jtreg, "-version"], self.output, 15, "preflight")
        require(re.search(r"jtreg[^\n]*\b8\.3\b", text + Path(record["stderr_path"]).read_text(), re.I),
                "jtreg 8.3 required")
        for path in (boot, Path(c["boot_jdk"]) / "lib/modules", jtreg, Path(c["junit"])):
            require(path.is_file(), "missing installed tool bytes")
            self.tool_seals[str(path)] = sha256(path)
        import zipfile
        with zipfile.ZipFile(c["junit"]) as junit:
            require("org/junit/jupiter/api/Test.class" in junit.namelist(), "JUnit Jupiter archive required")
        tool_paths = {}
        for name, compiler in (("cc1", c["cc"]), ("cc1plus", c["cxx"]), ("as", c["cc"]), ("ld", c["cc"])):
            flags, program = [], name
            if name == "ld":
                flags = [flag for flag in linker_flags(c) if flag.startswith("-B")]
                flavor = next((flag.split("=", 1)[1] for flag in linker_flags(c) if flag.startswith("-fuse-ld=")), None)
                program = "ld." + flavor if flavor else "ld"
            text, _ = self.command("tool-resolve-" + name, [compiler, *flags, "-print-prog-name=" + program],
                                   self.output, 10, "preflight")
            value = text.strip()
            resolved = Path(value) if Path(value).is_absolute() else Path(shutil.which(value, path=self.executor.env["PATH"]) or "")
            require(resolved.is_file(), "unresolved installed compiler subprogram: " + name)
            self.tool_seals[str(resolved.resolve())] = sha256(resolved)
            tool_paths[name] = str(resolved.resolve())
        for name, root in (("boot", Path(c["boot_jdk"])), ("jtreg", Path(c["jtreg"]) / "lib")):
            files = inventory(root, self.budget)
            self.directory_seals[str(root)] = files
            self.receipt[name + "_inventory"] = files
            for relative, identity in files.items():
                if "sha256" in identity:
                    self.tool_seals[str(root / relative)] = identity["sha256"]
        self.receipt["compiler_subprograms"] = tool_paths
        for flag in linker_flags(c):
            if flag.startswith("-B"):
                directory = Path(flag[2:])
                require(directory.is_dir() and all(not (directory / name).exists()
                        for name in ("gcc", "g++", "cc1", "cc1plus", "as")),
                        "linker prefix must not substitute a compiler or assembler")
                files = inventory(directory, self.budget)
                require(not any(Path(relative).name in {"gcc", "g++", "cc1", "cc1plus", "as"}
                                for relative in files), "linker prefix contains a nested compiler/assembler")
                self.directory_seals[str(directory)] = files
                self.receipt["linker_prefix_inventory"] = files
                for relative, identity in files.items():
                    if "sha256" in identity:
                        self.tool_seals[str(directory / relative)] = identity["sha256"]
        for name in ("git", "make", "bash", "objdump"):
            path = shutil.which(name, path=self.executor.env["PATH"])
            require(path is not None and Path(path).is_file(), "installed prerequisite missing: " + name)
            self.tool_seals[path] = sha256(path)
        self.tool_seals[str(Path(sys.executable).resolve())] = sha256(sys.executable)
        header_probe = self.output / "zstd-version.c"
        header_probe.write_text("#include <zstd.h>\n")
        text, _ = self.command("tool-zstd-headers", [c["cc"], "-E", "-dM", header_probe],
                               self.output, 15, "preflight")
        require(all(re.search(r"^#define ZSTD_VERSION_" + key + r"\s+" + value + r"\s*$", text, re.M)
                    for key, value in (("MAJOR", "1"), ("MINOR", "5"), ("RELEASE", "7"))),
                "zstd 1.5.7 headers required")
        native_path = self.output / "zstd-native-preflight.json"
        self.command("tool-zstd-library", [sys.executable, HERE / "mechanism_prepare.py", "--readiness", "--output", native_path],
                     self.output, 15, "preflight")
        native_identity = json.loads(native_path.read_text())
        require(native_identity["version"] == "1.5.7" and len(native_identity["libraries"]) == 1,
                "unresolved installed zstd 1.5.7 identity")
        for path, digest in native_identity["libraries"].items():
            require(sha256(path) == digest, "native zstd library changed during admission")
            self.tool_seals[path] = digest
        self.receipt["native_zstd"] = native_identity
        self.seals[str(native_path)] = sha256(native_path)
        self.receipt["tool_hashes"] = self.tool_seals.copy()
        self.receipt["resolved_config"] = c
        self.persist()

    def builds(self):
        self.phase("builds")
        specs = {}
        for role in ROLE_CAPS:
            self.budget.start_role(role)
            tree, c = self.trees[role], self.config
            check = lambda: self.budget.remaining_role(role)
            staging = RoleStaging(self.output, tree, role, self.approval["run_id"], save, sha256, check)
            self.receipt["staging"][role] = staging.record
            self.seals[str(staging.owner_path)] = staging.owner_hash
            debug = "fastdebug" if role == "candidate-fastdebug" else "release"
            configure = ["bash", "configure", "--with-conf-name=mechanism", "--with-debug-level=" + debug,
                         "--with-jobs=4", "--with-jvm-variants=server", "--with-boot-jdk=" + c["boot_jdk"],
                         "--with-jtreg=" + c["jtreg"], "--disable-ccache", "--enable-warnings-as-errors",
                         "CC=" + c["cc"], "CXX=" + c["cxx"], *c["configure"]]
            self.command("configure-" + role, configure, tree, 180, "build", role)
            spec = tree / "build/mechanism/spec.gmk"
            require(spec.is_file(), "configure did not create spec.gmk")
            specs[role] = validate_spec(spec.read_text(), role, c)
            self.command("images-" + role, ["make", "CONF=mechanism", "JOBS=4", "images"],
                         tree, ROLE_CAPS[role], "build", role)
            revision = BASELINE if role == "base-release" else CANDIDATE
            self.clean_head(tree, revision, role + "-built", role)
            image = tree / "build/mechanism/images/jdk"
            self.images[role] = image
            release = (image / "release").read_text()
            require(re.search(r"SOURCE=.*" + revision[:12], release), "built image release source mismatch")
            _, version_record = self.command("provenance-" + role, [image / "bin/java", "-version"],
                                              tree, 15, "build", role)
            version = Path(version_record["stderr_path"]).read_text()
            require(re.search(r'(?:openjdk|java) version "27(?:[.\-+\"]|$)', version), "built JDK version mismatch")
            files = inventory(image, self.budget, check=lambda: self.budget.remaining_role(role))
            self.directory_seals[str(image)] = files
            self.budget.remaining_role(role)
            self.receipt["images"][role] = dict(revision=revision, path=str(image), spec=specs[role],
                 spec_sha256=sha256(spec, lambda: self.budget.remaining_role(role)), configure_argv=configure, release=release,
                 files=files, libjvm_sha256=sha256(image / "lib/server/libjvm.so", lambda: self.budget.remaining_role(role)))
            self.seals[str(spec)] = sha256(spec)
            for path in image.rglob("*"):
                if path.is_file() and not path.is_symlink():
                    self.image_seals[str(path)] = files[str(path.relative_to(image))]["sha256"]
            self.persist()
            self.verify_seals(full=True, check=check)
            seal_path = self.output / ("image-seal-" + role + ".json")
            save(seal_path, dict(schema=1, run_id=self.approval["run_id"], role=role,
                                ownership_sha256=staging.owner_hash,
                                approval_sha256=sha256(self.input_paths[1]),
                                runner_revision=self.approval["runner_revision"],
                                config_sha256=self.approval["config_sha256"],
                                package_sha256=self.approval["package_sha256"],
                                source=self.receipt["sources"][role],
                                compiler_subprograms=self.receipt["compiler_subprograms"],
                                tool_hashes=self.tool_seals,
                                image=self.receipt["images"][role],
                                commands=[record for record in self.receipt["commands"]
                                          if record["name"].endswith("-" + role)
                                          or record["name"].startswith("source-" + role + "-")]))
            seal_hash = sha256(seal_path, check)
            self.seals[str(seal_path)] = seal_hash
            staging.compact(seal_path, seal_hash, lambda: self.verify_seals(full=True, check=check),
                            self.executor.assert_idle)
            for name in ("staging-" + role + "-objects.json", "staging-" + role + ".json"):
                self.seals[str(self.output / name)] = sha256(self.output / name, check)
            self.storage.check(force=True)
            self.receipt["images"][role]["role_elapsed_seconds"] = ROLE_CAPS[role] - self.budget.remaining_role(role)
            self.budget.active_role = None
            self.persist()
        left = specs["base-release"].copy()
        require(left == specs["candidate-release"], "release configurations are not matched")
        left["DEBUG_LEVEL"] = "fastdebug"
        require(left == specs["candidate-fastdebug"], "fastdebug configuration differs beyond debug level")

    def prepare(self):
        self.phase("prepare")
        sources = sorted((self.codec / "src/main/java").rglob("*.java"))
        for source in sources + [self.codec / "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"]:
            self.source_seals[str(source)] = sha256(source)
        corpus = b"".join(p.read_bytes() + b"\n" for p in sources)
        require(len(sources) == 37 and len(corpus) == SOURCE_CORPUS_BYTES
                and hashlib.sha256(corpus).hexdigest() == SOURCE_CORPUS_SHA256, "fixed source corpus differs")
        source_corpus = self.output / "source-corpus.bin"
        source_corpus.write_bytes(corpus)
        helper_dir = self.codec / "scripts/jdk27/cold-call"
        helper_dir.mkdir(parents=True, exist_ok=True)
        for name in ("qualify_decoder.py", "DecoderQualification.java"):
            source = self.trees["candidate-release"] / "doc/cold-call-qualification/scripts/jdk27/cold-call" / name
            destination = helper_dir / name
            require(source.is_file(), "exact b753 helper missing")
            if destination.exists():
                require(sha256(destination) == sha256(source), "codec checkout contains a conflicting helper")
            else:
                shutil.copyfile(source, destination)
            self.source_seals[str(destination)] = sha256(source)
        prepared = self.output / "prepared"
        prepared.mkdir()
        self.command("prepare-frames", [sys.executable, HERE / "mechanism_prepare.py", "--helper", helper_dir / "qualify_decoder.py",
                     "--java-home", self.images["candidate-release"], "--junit", self.config["junit"],
                     "--source-corpus", source_corpus, "--output", prepared], self.codec, 240, "prepare")
        frames = json.loads((prepared / "frames.json").read_text())
        native_identity = json.loads((prepared / "native-library.json").read_text())
        require(native_identity["version"] == "1.5.7" and len(native_identity["libraries"]) == 1,
                "unresolved exact native zstd library identity")
        require(native_identity == self.receipt["native_zstd"], "prepared native library differs from admitted identity")
        for path, digest in native_identity["libraries"].items():
            require(sha256(path) == digest, "native zstd library changed")
            self.tool_seals[path] = digest
        require(frames.get("native_version") == "1.5.7" and len(frames.get("rows", [])) == 57,
                "fixed 57 frames / zstd 1.5.7 required")
        sources_seen, frames_seen = set(), set()
        levels = {}
        for row in frames["rows"]:
            require(row["level"] in (1, 3, 9) and row["frame"] not in frames_seen, "frame matrix duplicate/expansion")
            for key in ("source", "frame"):
                require(Path(row[key]).name == row[key], "invalid frame path")
                path = prepared / "corpora" / row[key]
                require(sha256(path) == row[key + "_sha256"], "prepared frame/input hash mismatch")
            sources_seen.add(row["source"])
            frames_seen.add(row["frame"])
            levels.setdefault(row["source"], set()).add(row["level"])
            require(row["frame"] == str(Path(row["source"]).with_suffix(".l" + str(row["level"]) + ".zst")),
                    "frame matrix path/level mismatch")
        require(len(sources_seen) == 19 and len(frames_seen) == 57, "fixed input matrix missing")
        require(all(value == {1, 3, 9} for value in levels.values()), "fixed compression levels missing")
        factory = self.codec / "src/test/java/dev/jzstd/ComprehensiveRoundTripTest.java"
        require(frames["factory_source_sha256"] == sha256(factory), "factory source mismatch")
        require(len(list((prepared / "classes").rglob("*.class"))) >= 37, "missing checker/production classes")
        for required_class in ("dev/jzstd/DecoderQualification.class", "dev/jzstd/internal/BlockDecoder.class",
                               "dev/jzstd/ComprehensiveRoundTripTest.class"):
            require((prepared / "classes" / required_class).is_file(), "missing required checker/production class")
        for source in sources:
            expected = source.relative_to(self.codec / "src/main/java").with_suffix(".class")
            require((prepared / "classes" / expected).is_file(), "missing compiled production source: " + str(expected))
        native = self.output / "native-test"
        native.mkdir()
        image = self.images["candidate-release"]
        test_source = self.trees["candidate-release"] / "test/hotspot/jtreg/compiler/regalloc/libColdCallSpillPolicy.cpp"
        self.command("native-policy", [self.config["cxx"], "-std=c++17", "-fPIC", "-shared", "-Wall",
                     "-Wextra", "-Werror", "-I" + str(image / "include"), "-I" + str(image / "include/linux"),
                     test_source, *linker_flags(self.config), "-o", native / "libColdCallSpillPolicy.so"], self.output, 45, "prepare")
        self.prepared, self.native = prepared, native
        self.receipt["prepared_files"] = inventory(prepared, self.budget)
        self.receipt["native_files"] = inventory(native, self.budget)
        for root in (prepared, native):
            for path in root.rglob("*"):
                if path.is_file():
                    self.seals[str(path)] = sha256(path)
        self.seals[str(source_corpus)] = sha256(source_corpus)
        self.persist()

    def safety(self):
        self.phase("safety")
        for suite in SAFETY_SUITES:
            name, role = suite["id"], suite["role"]
            work, report = self.output / ("jtreg-work-" + name), self.output / ("jtreg-report-" + name)
            argv = [Path(self.config["jtreg"]) / "bin/jtreg", "-conc:1", "-othervm",
                    "-jdk:" + str(self.images[role]), "-w:" + str(work), "-r:" + str(report)]
            if suite["enabled"]:
                argv += ["-vmoption:-XX:+UnlockDiagnosticVMOptions", "-vmoption:-XX:+UseColdCallSpillDeferral"]
            if suite["native"]:
                argv += ["-nativepath:" + str(self.native)]
            argv += [str(self.trees[role] / "test/hotspot/jtreg" / s) for s in suite["selectors"]]
            text, _ = self.command("safety-" + name, argv, self.trees[role], 300, "safety")
            self.receipt["safety"][name] = validate_safety_receipt(suite, text, report, work)
            for root in (report, work):
                for path in root.rglob("*"):
                    if path.is_file():
                        self.budget.check()
                        self.seals[str(path)] = sha256(path)
            self.persist()
        require(sum(s["selected"] for s in self.receipt["safety"].values()) == 15, "missing safety selectors")

    def captures(self):
        self.phase("capture")
        for cell in CAPTURE_CELLS:
            debug = cell.startswith("debug-")
            role = "candidate-fastdebug" if debug else ("base-release" if cell == "base" else "candidate-release")
            prefix = self.output / ("capture-" + cell)
            xml, directives = prefix.with_suffix(".xml"), prefix.with_suffix(".directives.json")
            directive = dict(match="dev.jzstd.internal." + TARGET, PrintAssembly=True)
            if debug:
                directive["c2"] = dict(TraceSpilling=True)
            save(directives, [directive])
            flags = ["-XX:+UnlockDiagnosticVMOptions"]
            if cell not in ("base", "default"):
                flags.append("-XX:" + ("+" if cell.endswith("on") else "-") + "UseColdCallSpillDeferral")
            flags += ["-XX:+LogCompilation", "-XX:LogFile=" + str(xml),
                      "-XX:CompilerDirectivesFile=" + str(directives)]
            if debug:
                flags.append("-XX:+VerifyRegisterAllocator")
            argv = [self.images[role] / "bin/java", *COMMON, *flags, "-cp",
                    str(self.prepared / "classes") + ":" + self.config["junit"],
                    "dev.jzstd.DecoderQualification", "check", self.prepared / "corpora", "32"]
            text, record = self.command("capture-" + cell, argv, self.output, 45, "capture")
            require("PASS frames=57 rounds=32" in text, "missing fixed correctness capture marker")
            require(xml.is_file() and xml.stat().st_size > 0, "missing compilation XML")
            header, start, code = extract(text, TARGET)
            binary, assembly = prefix.with_suffix(".bin"), prefix.with_suffix(".asm")
            binary.write_bytes(code)
            decoded, _ = self.command("objdump-" + cell, ["objdump", "-D", "-b", "binary", "-m", "i386:x86-64",
                   "-M", "intel", "--insn-width=16", "--adjust-vma=" + hex(start), binary], self.output, 5, "objdump")
            assembly.write_text(header + "\n" + decoded)
            paths = dict(log=record["stdout_path"], stderr=record["stderr_path"], xml=str(xml),
                         binary=str(binary), assembly=str(assembly), directives=str(directives))
            self.receipt["captures"][cell] = dict(role=role, paths=paths,
                 sha256={key: sha256(path) for key, path in paths.items()}, main_code_bytes=len(code), header=header)
            for path in paths.values():
                self.seals[str(path)] = sha256(path)
            self.persist()

    def review(self):
        self.phase("review")
        self.registry.assert_complete()
        require(set(self.receipt["safety"]) == {s["id"] for s in SAFETY_SUITES}, "missing safety receipt")
        require(set(self.receipt["captures"]) == set(CAPTURE_CELLS), "missing capture receipt")
        proofs = {}
        for cell in CAPTURE_CELLS:
            self.verify_seals()
            paths = self.receipt["captures"][cell]["paths"]
            proofs[cell] = analyze_capture(Path(paths["log"]).read_text(), Path(paths["xml"]),
                                           Path(paths["assembly"]).read_text(), cell, cell.startswith("debug-"))
            self.budget.check()
            save(self.output / ("proof-" + cell + ".json"), proofs[cell])
            path = self.output / ("proof-" + cell + ".json")
            self.seals[str(path)] = sha256(path)
        ledger = compare_captures(proofs)
        self.budget.check()
        require(ledger.get("verdict") in {"MECHANISM_PASS", "MECHANISM_NO_GO", "INCONCLUSIVE_INFRA"},
                "invalid evidence analyzer verdict")
        save(self.output / "transport-ledger.json", ledger)
        self.seals[str(self.output / "transport-ledger.json")] = sha256(self.output / "transport-ledger.json")
        self.receipt["evidence"] = dict(proofs={cell: sha256(self.output / ("proof-" + cell + ".json"))
                                               for cell in CAPTURE_CELLS},
                                       ledger_sha256=sha256(self.output / "transport-ledger.json"),
                                       verdict=ledger["verdict"])
        # The independent reviewer receives a complete, hashed request. A
        # receipt may confirm or reject the mechanical result; it cannot waive
        # missing bytes, provenance, activation, or an adverse transport gate.
        hard_checks = {key: value for key, value in ledger.get("checks", {}).items()
                       if key != "changed_transport_semantically_bound"}
        semantic_only = (ledger["verdict"] == "INCONCLUSIVE_INFRA" and bool(hard_checks)
                         and all(value is True for value in hard_checks.values())
                         and ledger.get("checks", {}).get("changed_transport_semantically_bound") is False)
        request = dict(schema=1, kind="cold-call-mechanism-review-request", run_id=self.approval["run_id"],
                       candidate=CANDIDATE, deadline_utc=self.approval["deadline_utc"],
                       approval_sha256=sha256(self.input_paths[1]),
                       ledger_sha256=self.receipt["evidence"]["ledger_sha256"],
                       proof_sha256=self.receipt["evidence"]["proofs"],
                       mechanical_verdict=ledger["verdict"])
        if semantic_only:
            from mechanism_evidence import semantic_review_digest
            request["semantic_review_template"] = dict(
                decision="accept", ledger_sha256=semantic_review_digest(ledger),
                evidence_sha256=ledger["evidence_sha256"],
                capture_sha256={cell: proof["input_sha256"] for cell, proof in ledger["captures"].items()},
                all_replacement_transport_reviewed=False,
                bindings=[dict(flavor=item["flavor"], old_pc=item["old_pc"], disposition="",
                               on_pcs=[], value_evidence="", path_evidence="")
                          for item in ledger["semantic_review_required"]])
        request_path = self.output / "review-request.json"
        save(request_path, request)
        self.seals[str(request_path)] = sha256(request_path)
        self.persist()
        if ledger["verdict"] == "MECHANISM_PASS" or semantic_only:
            review_path = self.output / "review.json"
            while not review_path.is_file():
                remaining = self.budget.check()
                self.host_probe()
                self.verify_seals()
                time.sleep(min(5, remaining))
            review = json.loads(review_path.read_text())
            expected_keys = {"schema", "kind", "run_id", "request_sha256", "decision", "reviewer", "reason"}
            require(set(review) in (expected_keys, expected_keys | {"semantic_review"}) and review["schema"] == 1
                    and review["kind"] == "cold-call-mechanism-review"
                    and review["run_id"] == self.approval["run_id"]
                    and review["request_sha256"] == sha256(request_path), "review does not bind exact evidence")
            require(isinstance(review["reviewer"], str) and review["reviewer"].strip()
                    and isinstance(review["reason"], str) and review["reason"].strip(), "independent review identity/reason required")
            require(review["decision"] in {"ACCEPT", "REJECT", "INCONCLUSIVE"}, "unknown review decision")
            self.receipt["evidence"]["review"] = review
            self.seals[str(review_path)] = sha256(review_path)
            self.verify_seals()
            if review["decision"] == "ACCEPT" and semantic_only:
                from mechanism_evidence import apply_semantic_review
                require("semantic_review" in review, "complete semantic store/operand bindings required")
                reviewed = apply_semantic_review(ledger, review["semantic_review"])
                require(reviewed["verdict"] == "MECHANISM_PASS", "semantic review cannot waive a hard gate")
                reviewed_path = self.output / "reviewed-transport-ledger.json"
                save(reviewed_path, reviewed)
                self.seals[str(reviewed_path)] = sha256(reviewed_path)
                self.receipt["evidence"]["reviewed_ledger_sha256"] = sha256(reviewed_path)
                ledger = reviewed
            elif review["decision"] != "ACCEPT":
                ledger["verdict"] = "MECHANISM_NO_GO" if review["decision"] == "REJECT" else "INCONCLUSIVE_INFRA"
            self.receipt["evidence"]["review_verdict"] = ledger["verdict"]
        self.verify_seals(full=True)
        return ledger["verdict"]

    def run(self):
        if self.deadline_guard is not None:
            self.deadline_guard.rebind(self.controller_remaining, self.defer_deadline)
            return self._run()
        with DeadlineGuard(self.controller_remaining, lambda: self.clock.remaining(reserve=0),
                           self.defer_deadline) as guard:
            self.deadline_guard = guard
            return self._run()

    def _run(self):
        require(sum(PHASE_CAPS.values()) == 7200 and sum(ROLE_CAPS.values()) == PHASE_CAPS["builds"],
                "invalid frozen budget")
        self.output.mkdir(parents=True, exist_ok=False)
        # A receipt is single use even if the caller chooses another output path.
        # The claim travels beside the approval in a saved environment.
        claim = self.input_paths[1].with_name(self.input_paths[1].name + "." + self.approval["run_id"] + ".claim")
        with claim.open("xb") as stream:
            stream.write(json_bytes(dict(run_id=self.approval["run_id"], output=str(self.output),
                                         approval_sha256=sha256(self.input_paths[1]))))
        save(self.output / "claim.json", dict(run_id=self.approval["run_id"], approval=self.approval,
                                               immutable_deadline=self.approval["deadline_utc"]))
        status = "INCONCLUSIVE_INFRA"
        old_handlers = {}
        try:
            self.host_probe()  # Admission is before any external command.
            self.deadline_guard.work_check = self.storage.check
            env = {"LANG": "C", "LC_ALL": "C", "TZ": "UTC", **self.config["environment"],
                   "JTREG_JAVA": str(Path(self.config["boot_jdk"]) / "bin/java")}
            env["PATH"] = str(Path(self.config["boot_jdk"]) / "bin") + ":" + env["PATH"]
            toolchain_path = next((flag.split("=", 1)[1] for flag in self.config["configure"]
                                   if flag.startswith("--with-toolchain-path=")), None)
            if toolchain_path:
                env["PATH"] = toolchain_path + ":" + env["PATH"]
            self.executor = self.executor_factory(self.output, self.clock, env, self.host_probe)
            def cancel(signum, _frame):
                self.executor.cancel_signal(signum)
            for signum in (signal.SIGTERM, signal.SIGINT):
                old_handlers[signum] = signal.signal(signum, cancel)
            self.preflight()
            self.builds()
            self.prepare()
            self.safety()
            self.captures()
            status = self.review()
        except BaseException as error:
            self.failed = True
            if self.storage.failed_at is not None:
                self.deadline_guard._mark_expired(self.storage.failed_at - time.monotonic())
                self.defer_deadline()
            remaining = self.controller_remaining()
            if remaining <= 0:
                self.deadline_guard._mark_expired(remaining)
                self.defer_deadline()
            self.receipt["failure"] = dict(type=type(error).__name__, reason=str(error), phase=self.budget.phase)
            # An executed safety/correctness failure is a no-go. Missing evidence,
            # deadlines, preparation, and ownership failures remain inconclusive.
            records = self.executor.records if self.executor else []
            nonzero = (records and records[-1].get("exit_code") not in (None, 0)
                       and records[-1].get("failure", "").startswith("Command failed without retry:")
                       and not records[-1].get("cleanup", {}).get("error"))
            if self.budget.phase in {"safety", "capture"} and (nonzero or re.search(
                    r"did not pass|missing fixed correctness", str(error), re.I)):
                status = "MECHANISM_NO_GO"
        finally:
            cleanup_start = time.monotonic()
            if self.deadline_guard.expired_at is not None:
                cleanup_start = min(cleanup_start, self.deadline_guard.expired_at)
            try:
                self.deadline_guard.rebind(lambda: min(self.clock.remaining(reserve=0),
                                                       cleanup_start + 60 - time.monotonic()), self.defer_deadline)
            except Failure as error:
                self.receipt["cleanup_budget_failure"] = str(error)
                status = "INCONCLUSIVE_INFRA"
            try:
                self.budget.enter("cleanup")
            except Failure as error:
                self.receipt["cleanup_budget_failure"] = str(error)
                status = "INCONCLUSIVE_INFRA"
            try:
                cleanup = self.executor.close() if self.executor else dict(active_groups=[], direct_children_reaped=True)
                self.receipt["cleanup"] = cleanup
                require(not cleanup.get("active_groups") and cleanup.get("direct_children_reaped") is True
                        and not cleanup.get("failed"), "incomplete owned cleanup")
                require(time.monotonic() - cleanup_start <= 60 and self.clock.remaining(reserve=0) > 0,
                        "cleanup exceeded absolute/capped budget")
            except BaseException as error:
                self.receipt["cleanup_failure"] = str(error)
                status = "INCONCLUSIVE_INFRA"
            try:
                # Final sealing is charged to cleanup, including its absolute cap.
                index = {}
                for path in self.output.iterdir():
                    if path.name in {"trees", "campaign.json", "evidence-index.json"}:
                        continue
                    candidates = [path] if path.is_file() else path.rglob("*")
                    for entry in candidates:
                        if entry.is_file():
                            self.budget.check()
                            index[str(entry.relative_to(self.output))] = sha256(entry, self.budget.check)
                save(self.output / "evidence-index.json", index)
                self.receipt["evidence_index_sha256"] = sha256(self.output / "evidence-index.json")
                self.budget.check()
            except BaseException as error:
                self.receipt["final_seal_failure"] = str(error)
                status = "INCONCLUSIVE_INFRA"
            self.receipt["status"] = status
            try:
                self.persist()
            except Failure as error:
                status = "INCONCLUSIVE_INFRA"
                self.receipt["status"] = status
                self.receipt["final_receipt_failure"] = str(error)
            if self.clock.remaining(reserve=0) <= 0 or time.monotonic() - cleanup_start > 60:
                status = "INCONCLUSIVE_INFRA"
                self.receipt["status"] = status
                self.receipt["final_deadline_failure"] = "final receipt exceeded immutable cleanup/outer cap"
                try:
                    self.persist()
                except Failure:
                    pass  # No new I/O allowance after the immutable deadline.
            for signum, handler in old_handlers.items():
                signal.signal(signum, handler)
        return status


def verify_package(manifest):
    require(set(manifest) == {"schema", "candidate", "baseline", "codec", "files"}
            and manifest["schema"] == 1 and manifest["candidate"] == CANDIDATE
            and manifest["baseline"] == BASELINE and manifest["codec"] == CODEC,
            "package source identity mismatch")
    require(isinstance(manifest["files"], dict) and set(manifest["files"]) == PACKAGE_FILES,
            "incomplete/unreviewed executable package inventory")
    for name, digest in manifest["files"].items():
        relative = Path(name)
        require(not relative.is_absolute() and ".." not in relative.parts and SHA_RE.fullmatch(digest),
                "invalid package inventory path/hash")
        path = DOCUMENTS / relative
        require(path.is_file() and sha256(path) == digest, "committed package bytes mismatch: " + name)
    return manifest


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="action", required=True)
    sub.add_parser("plan", help="print fixed scope; does not execute commands")
    run = sub.add_parser("run")
    run.add_argument("--config", type=Path, required=True)
    run.add_argument("--approval", type=Path, required=True)
    run.add_argument("--approval-sha256", required=True)
    run.add_argument("--output", type=Path, required=True)
    args = parser.parse_args(argv)
    if args.action == "plan":
        print(json.dumps(dict(candidate=CANDIDATE, baseline=BASELINE, codec=CODEC,
                              phase_caps=PHASE_CAPS, role_caps=ROLE_CAPS,
                              safety_suites=SAFETY_SUITES, capture_cells=CAPTURE_CELLS,
                              storage_reserve_bytes=RESERVE_BYTES, storage_poll_seconds=POLL_SECONDS,
                              execution_authorized=False), indent=2))
        return 0
    try:
        require(args.output.is_absolute(), "absolute new output directory required")
        require(args.approval.stat().st_size <= 16384, "approval receipt exceeds bounded input size")
        approval = json.loads(args.approval.read_text())
        clock = Clock(approval)
        with DeadlineGuard(lambda: clock.remaining(), lambda: clock.remaining(reserve=0)) as guard:
            require(sha256(args.approval) == args.approval_sha256, "approval receipt hash mismatch")
            config = validate_config(json.loads(args.config.read_text()))
            for key in ("jdk_source", "codec_source", "boot_jdk", "jtreg"):
                require(not args.output.resolve().is_relative_to(Path(config[key]).resolve()),
                        "output must be outside source/tool checkouts")
            manifest_path = DOCUMENTS / "MECHANISM-SOURCE-MANIFEST.json"
            verify_package(json.loads(manifest_path.read_text()))
            validate_approval(approval, sha256(args.config), approval.get("runner_revision"), sha256(manifest_path))
            campaign = Mechanism(config, approval, args.output, args.config, args.approval, manifest_path,
                                 clock=clock, deadline_guard=guard)
            status = campaign.run()
        print(status + " " + str(args.output / "campaign.json"))
        return 0 if status == "MECHANISM_PASS" else 1
    except (Failure, OSError, ValueError, KeyError) as error:
        print("INCONCLUSIVE_INFRA: " + str(error), file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
