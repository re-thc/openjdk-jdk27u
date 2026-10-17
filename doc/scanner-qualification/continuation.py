#!/usr/bin/env python3
"""One-shot retained-baseline binding for this Scanner qualification packet.

Preparation and verification launch no JDK, compiler or workload. A later explicit
runner invocation spends the claim; failures never restore it or reuse samples.
"""
import csv
from datetime import datetime
import hashlib
import json
import math
import os
from pathlib import Path
import re
import shlex
import shutil
import stat
import subprocess
import sys
import time

import image_manifest
from runner_process import Identity, PidfdEvidence, Uncertain, check_image, image_paths, snapshot

BASE = "89885a6288e7aaabd01678a704a586272c0f96e3"
BASE_TREES = ("5b1009acd19e2b3c8c981b6f3b3180f8088dd2d9", "637cb780fb6375f39f53ab223f10df91f50175ed")
CANDIDATE_TREES = ("4ac402957e32a6c54e566bdbee2d85f6e471b336", "46360397de0a70009ef238781d3ea9e77c0565a9")
PROFILE_KEYS = """CONFIGURE_COMMAND_LINE OPENJDK_TARGET_OS OPENJDK_TARGET_CPU
OPENJDK_TARGET_CPU_BITS COMPILE_TYPE DEBUG_LEVEL JVM_VARIANTS JVM_FEATURES_server
TOOLCHAIN_TYPE CC_VERSION_NUMBER CXX_VERSION_NUMBER BOOT_JDK CC CXX LD LDCXX AS
AR NM STRIP OBJCOPY CXXFILT JAVA_CMD JAVAC_CMD EXTRA_LDFLAGS SYSROOT FREETYPE_TO_USE
FREETYPE_LIBS FREETYPE_CFLAGS FONTCONFIG_CFLAGS CUPS_CFLAGS ALSA_LIBS ALSA_CFLAGS X_CFLAGS""".split()
BUILD_ENV = """LD_LIBRARY_PATH LIBRARY_PATH CPATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH
CFLAGS CXXFLAGS LDFLAGS CC CXX LD CONFIG_SITE GCC_EXEC_PREFIX COMPILER_PATH
LD_PRELOAD LD_AUDIT GLIBC_TUNABLES""".split()
BUILD_ENV += """MAKEFLAGS GNUMAKEFLAGS MFLAGS MAKEOVERRIDES SPEC USER_MAKE_VARS
MAKE_ARGS COMPARE_BUILD CUSTOM_ROOT CUSTOM_CONFIG_DIR CONFIGURE_ARGS CONFIGURE_COMMAND_LINE""".split()


def require(condition, reason):
    if not condition:
        raise Uncertain(reason)


def environment():
    values = {key: os.environ.get(key) for key in BUILD_ENV}
    require(not any(values.values()), "ambient configure/make/compiler/header/linker/loader overrides are unsupported")
    return values


def sha(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def pinned(path, digest):
    require(bool(re.fullmatch(r"[0-9a-f]{64}", digest)), "invalid SHA-256 pin")
    data = path.read_bytes()
    require(hashlib.sha256(data).hexdigest() == digest, f"changed witness: {path}")
    return json.loads(data)


def git(checkout, *args):
    return subprocess.check_output(["git", "-C", str(checkout), *args], text=True).strip()


def baseline_source(checkout):
    require(git(checkout, "rev-parse", "HEAD", "HEAD:src", "HEAD:test").splitlines()
            == [BASE, *BASE_TREES], "retained baseline source identity changed")
    subprocess.run(["git", "-C", str(checkout), "diff", "--exit-code", "HEAD", "--"], check=True)
    require(not git(checkout, "status", "--porcelain", "--untracked-files=all"),
            "retained baseline has modified/untracked inputs")


def profile(spec):
    values = dict(re.findall(r"^(\w+)[ \t]*:=[ \t]*(.*)$", spec.read_text(), re.M))
    require(all(key in values for key in PROFILE_KEYS), "incomplete build profile")
    keys = set(PROFILE_KEYS) | {key for key in values if re.match(
        r"(?:CXXFLAGS|CFLAGS|LDFLAGS|ASFLAGS|JVM_CFLAGS|JVM_LDFLAGS|JVM_ASFLAGS|JVM_CXXFLAGS|JVM_LIBS|CXX_O_FLAG|C_O_FLAG)", key)}
    checkout = str(spec.resolve().parents[2])
    result = {key: " ".join(shlex.split(values[key])).replace(checkout + "/", "<CHECKOUT>/") for key in keys}
    require(all(result[key] == value for key, value in {
        "OPENJDK_TARGET_OS": "linux", "OPENJDK_TARGET_CPU": "x86_64",
        "OPENJDK_TARGET_CPU_BITS": "64", "COMPILE_TYPE": "native", "DEBUG_LEVEL": "release",
        "JVM_VARIANTS": "server", "TOOLCHAIN_TYPE": "gcc"}.items()), "unsupported build profile")
    features = result["JVM_FEATURES_server"].split()
    require(all(value in features for value in ("cds", "serialgc", "g1gc", "zgc"))
            and "shenandoahgc" not in features, "unexpected collector/CDS profile")
    return result


def fingerprint(path, active=()):
    """Hash installed inputs, including resolved symlink contents and modes."""
    before = path.lstat()
    mode = stat.S_IMODE(before.st_mode)
    if stat.S_ISLNK(before.st_mode):
        target = path.resolve()
        item = ["link", mode, os.readlink(path), str(target),
                "ancestor" if target in active else fingerprint(target, active) if target.exists() else "missing"]
    elif stat.S_ISDIR(before.st_mode):
        item = ["directory", mode, [(child.name, fingerprint(child, (*active, path.resolve())))
                                   for child in sorted(path.iterdir())]]
    else:
        require(stat.S_ISREG(before.st_mode), f"unsupported toolchain entry: {path}")
        item = ["file", mode, before.st_size, sha(path)]
    after = path.lstat()
    require((before.st_dev, before.st_ino, before.st_size, before.st_mtime_ns, before.st_ctime_ns, before.st_mode)
            == (after.st_dev, after.st_ino, after.st_size, after.st_mtime_ns, after.st_ctime_ns, after.st_mode),
            f"input changed during hashing: {path}")
    return hashlib.sha256(json.dumps(item, separators=(",", ":")).encode()).hexdigest()


def native_link_inputs(directory=Path("/usr/lib/x86_64-linux-gnu")):
    required = {directory / name for name in ("Scrt1.o", "crti.o", "crtn.o", "libc_nonshared.a", "libc.so", "libm.so")}
    require(all(path.is_file() for path in required), "missing native startup objects/linker scripts")
    selected = set(required)
    for pattern in ("crt*.o", "?crt*.o", *("lib" + name + ".*" for name in
                   ("c", "m", "mvec", "pthread", "dl", "rt", "resolv", "util", "z", "stdc++", "gcc_s", "atomic"))):
        selected.update(directory.glob(pattern))
    return selected


def inputs(toolchains, build_profile):
    roots = [toolchains / name for name in
             ("activate.sh", "autom4te.cfg", "gcc16", "gcc16-root", "mold", "sysroot", "jdk27", "jtreg83")]
    roots.append(Path("/usr/include"))  # GCC's native system headers, outside the supplementary sysroot.
    roots.extend(native_link_inputs())
    tools = {Path(shlex.split(build_profile[key])[0]).resolve(strict=True)
             for key in ("CC", "CXX", "LD", "LDCXX", "AS", "AR", "NM", "STRIP", "OBJCOPY", "CXXFILT")}
    search = ":".join(str(toolchains / suffix) for suffix in
                      ("gcc16/bin", "mold/bin", "cargo/bin", "jdk27/bin", "sysroot/usr/bin")) + ":/usr/bin:/bin"
    for name in ("make", "as", "ld", "bash", "perl", "git", "python3", "timeout", "setsid", "taskset", "ldd"):
        found = shutil.which(name, path=search)
        require(found is not None, f"missing installed tool: {name}")
        tools.add(Path(found).resolve(strict=True))
    # The GCC entry points are wrappers. Include the actual binaries/backends
    # and the native loader/library closure reported by installed ldd. This is
    # ELF metadata inspection, never a compiler or Java invocation.
    elf = set(tools)
    elf.update(path for path in (toolchains / "gcc16-root/usr").rglob("*")
               if path.name in ("gcc-16", "g++-16", "cc1", "cc1plus", "collect2", "lto1") and path.is_file())
    elf.update((toolchains / "mold/bin/mold", toolchains / "jdk27/lib/server/libjvm.so"))
    environment = dict(os.environ, LD_LIBRARY_PATH=str(toolchains / "gcc16-root/usr/lib/x86_64-linux-gnu"))
    dependencies = set()
    for path in sorted(elf):
        with path.open("rb") as stream:
            if stream.read(4) != b"\x7fELF":
                continue
        result = subprocess.run([shutil.which("ldd", path=search), str(path)], env=environment, text=True,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=10)
        require("not found" not in result.stdout, f"unresolved tool dependency: {path}")
        require(result.returncode == 0 or (result.returncode == 1 and
                ("not a dynamic executable" in result.stdout or "statically linked" in result.stdout)),
                f"cannot inspect tool dependencies: {path}")
        dependencies.update(Path(value).resolve(strict=True)
                            for value in re.findall(r"(/[^\s()]+)", result.stdout))
    return {str(path): fingerprint(path) for path in sorted(set(roots) | tools | dependencies)}


def original(retained, manifest, provenance):
    require(provenance["baseline_commit"] == BASE and provenance["prior_campaign_status"] == 125
            and provenance["measurements"] == 0, "unexpected original campaign")
    require(Path(provenance["retained_attempt"]).resolve(strict=True) == retained, "wrong retained attempt")
    require({"base/build/scanner/configure.log", "base/build/scanner/spec.gmk", "base/build/scanner/build.log",
             "base-release.txt", "identity.txt", "launch-identity.json", "stages/4/complete.json"}
            <= provenance["provenance_file_sha256"].keys(), "incomplete original provenance")
    for relative, digest in provenance["provenance_file_sha256"].items():
        path = (retained / relative).resolve(strict=True)
        require(path.is_relative_to(retained), "provenance escapes retained attempt")
        require(sha(path) == digest, f"changed original provenance: {relative}")
    require(sha(manifest) == provenance["image_manifest_sha256"], "changed image manifest")
    footer = json.loads((retained / "stages/4/complete.json").read_text())
    require(footer["clean"] is True and footer["command_status"] == 0 and footer["stopped"] is False
            and footer["survivors"] is True, "not the documented completed baseline build")
    require(sorted(path.name for path in (retained / "stages").iterdir()) == ["1", "2", "3", "4"],
            "original attempt progressed beyond the retained build")
    baseline_source(retained / "base")
    image = image_paths(retained)["base"].resolve(strict=True)
    require(image_manifest.verify(image, manifest) == image, "wrong retained image")
    return image


def claim_path(retained, provenance):
    key = hashlib.sha256((str(retained) + provenance["provenance_file_sha256"]["launch-identity.json"]).encode()).hexdigest()
    return retained.parent / (".scanner-continuation-" + key + ".claim")


def packet_inputs():
    packet = Path(__file__).resolve().parent
    return {path.relative_to(packet).as_posix(): sha(path) for path in sorted(packet.rglob("*"))
            if path.is_file() and path.suffix in (".java", ".sh", ".py", ".md", ".json")}


def remaining(binding, now=None, boot=None, wall=None):
    deadline = binding["deadline_monotonic"]
    require(type(deadline) in (int, float) and math.isfinite(deadline), "invalid original deadline")
    boot = boot if boot is not None else Path("/proc/sys/kernel/random/boot_id").read_text().strip()
    require(boot == binding["boot_id"], "continuation requires the original Linux boot")
    utc = binding["deadline_utc"]
    require(type(utc) in (int, float) and math.isfinite(utc), "invalid original UTC deadline")
    seconds = math.floor(min(deadline - (time.monotonic() if now is None else now),
                             utc - (time.time() if wall is None else wall)))
    require(seconds > 0, "original absolute campaign deadline expired")
    return seconds


def prepare(retained, manifest, provenance_path, provenance_sha, toolchains, destination):
    build_environment = environment()
    retained, manifest, provenance_path, toolchains = (path.resolve(strict=True) for path in
                                                      (retained, manifest, provenance_path, toolchains))
    provenance = pinned(provenance_path, provenance_sha)
    image = original(retained, manifest, provenance)
    launch = json.loads((retained / "launch-identity.json").read_text())
    boot_epoch = time.time() - time.monotonic()
    observed = datetime.fromisoformat(launch["observed_utc"].replace("Z", "+00:00")).timestamp()
    deadline = launch["six_hour_deadline_monotonic"]
    require(type(deadline) in (int, float) and math.isfinite(deadline), "invalid original deadline")
    require(0 <= observed - (boot_epoch + deadline - 6 * 3600) <= 120,
            "original launch timestamp does not identify this boot")
    build_profile = profile(retained / "base/build/scanner/spec.gmk")
    require(build_profile["BOOT_JDK"] == str(toolchains / "jdk27"), "wrong installed toolchain root")
    claim = claim_path(retained, provenance)
    require(not claim.exists(), "original attempt already claimed")
    binding = {"format": 1, "retained": str(retained), "base_jdk": str(image),
               "manifest": str(manifest), "manifest_sha256": provenance["image_manifest_sha256"],
               "provenance": str(provenance_path), "provenance_sha256": provenance_sha,
               "toolchains": str(toolchains), "profile": build_profile, "inputs": inputs(toolchains, build_profile),
               "environment": build_environment,
               "packet": packet_inputs(),
               "custody_files": {name: sha(retained / name) for name in ("owner.json", "observer.json")},
               "claim": str(claim), "deadline_monotonic": deadline, "deadline_utc": boot_epoch + deadline,
               "boot_id": Path("/proc/sys/kernel/random/boot_id").read_text().strip()}
    # Preparation may finish after the original window; it grants no new time.
    require(not destination.resolve().is_relative_to(retained), "binding must be outside old evidence")
    with destination.open("x") as output:
        output.write(json.dumps(binding, sort_keys=True, indent=2) + "\n")
    return binding


def load(path, digest):
    binding = pinned(path, digest)
    require(binding["format"] == 1, "unsupported continuation binding")
    return binding


def predecessor(binding):
    """Validate the explicitly reviewed edge from the spent, failed attempt."""
    edge = binding["predecessor"]
    prior = load(Path(edge["binding"]), edge["binding_sha256"])
    require("predecessor" not in prior, "only one explicitly reviewed successor is supported")
    require(binding["claim"] == str(Path(prior["claim"]) / "successor"), "successor claim namespace changed")
    for key in ("retained", "base_jdk", "manifest", "manifest_sha256", "provenance", "provenance_sha256",
                "boot_id", "deadline_monotonic", "deadline_utc", "profile", "environment", "inputs",
                "toolchains", "custody_files"):
        require(binding[key] == prior[key], "successor changed baseline/original deadline")
    record = pinned(Path(prior["claim"]) / "claim.json", edge["claim_sha256"])
    failed = Path(edge["failed_output"])
    require(record["binding_sha256"] == edge["binding_sha256"] and record["output"] == str(failed),
            "predecessor claim/output mismatch")
    analysis = pinned(failed / "analysis.json", edge["analysis_sha256"])
    cleanup = pinned(failed / "cleanup.json", edge["cleanup_sha256"])
    require(sha(failed / "cleanup.csv") == edge["cleanup_csv_sha256"], "predecessor identity census changed")
    require(analysis["source_commit"] == record["candidate"] and analysis["binding_sha256"] == edge["binding_sha256"],
            "predecessor analysis/source claim mismatch")
    require(analysis["terminal_status"] == 125 and analysis["candidate_image_complete"] is False
            and analysis["required_runtime_observations"] == dict.fromkeys(
                ("cds", "jtreg_case_collector_executions", "host", "smoke", "workload_children"), 0),
            "predecessor is not the unmeasured incomplete build")
    require(not (failed / "stages/5/complete.json").exists()
            and not image_paths(failed)["candidate"].exists(), "unexpected predecessor build completion")
    require(cleanup["counts"]["live"] == 0 and cleanup["counts"]["error"] == 0
            and not cleanup["unledgered_matching_workers"] and not cleanup["current_snapshot_errors"],
            "predecessor has unresolved live/observation census")
    # This records the limitation; it never supplies the missing old ECHILD proof.
    require(edge["custody"] == "uncertain_missing_stage5_footer", "missing predecessor custody limitation")
    return failed


def prepare_successor(previous, previous_sha, failed, destination):
    prior = load(previous.resolve(strict=True), previous_sha)
    failed = failed.resolve(strict=True)
    claim = Path(prior["claim"]) / "successor"
    require(not claim.exists(), "successor already claimed")
    edge = {"binding": str(previous.resolve(strict=True)), "binding_sha256": previous_sha,
            "failed_output": str(failed), "claim_sha256": sha(Path(prior["claim"]) / "claim.json"),
            "analysis_sha256": sha(failed / "analysis.json"), "cleanup_sha256": sha(failed / "cleanup.json"),
            "cleanup_csv_sha256": sha(failed / "cleanup.csv"), "custody": "uncertain_missing_stage5_footer"}
    binding = dict(prior, predecessor=edge, claim=str(claim))
    predecessor(binding)
    toolchains = Path(prior["toolchains"])
    original(Path(prior["retained"]), Path(prior["manifest"]),
             pinned(Path(prior["provenance"]), prior["provenance_sha256"]))
    build_profile = profile(Path(prior["retained"]) / "base/build/scanner/spec.gmk")
    require(build_profile == prior["profile"] and environment() == prior["environment"]
            and inputs(toolchains, build_profile) == prior["inputs"], "original profile/environment/installed inputs changed")
    binding.update(packet=packet_inputs())
    require(not destination.resolve().is_relative_to(failed)
            and not destination.resolve().is_relative_to(Path(prior["retained"]))
            and not destination.resolve().is_relative_to(Path(prior["claim"])), "successor witness overlaps failed evidence/claim")
    with destination.open("x") as stream:
        stream.write(json.dumps(binding, sort_keys=True, indent=2) + "\n")
    return binding


def verify(binding, toolchains, timed=True):
    if timed:
        remaining(binding)
    retained = Path(binding["retained"])
    require(toolchains.resolve(strict=True) == Path(binding["toolchains"]), "toolchain root changed")
    require(environment() == binding["environment"], "build environment changed")
    provenance = pinned(Path(binding["provenance"]), binding["provenance_sha256"])
    if "predecessor" in binding:
        predecessor(binding)
    else:
        require(str(claim_path(retained, provenance)) == binding["claim"], "claim namespace changed")
    require(packet_inputs() == binding["packet"], "qualification packet changed")
    require(binding["manifest_sha256"] == provenance["image_manifest_sha256"], "manifest pin changed")
    image = original(retained, Path(binding["manifest"]), provenance)
    require(str(image) == binding["base_jdk"], "baseline image path changed")
    build_profile = profile(retained / "base/build/scanner/spec.gmk")
    require(build_profile == binding["profile"], "baseline profile changed")
    require(inputs(toolchains, build_profile) == binding["inputs"], "installed build inputs changed")
    if timed:
        remaining(binding)  # Hashing/verification consumes the original budget.
    return image


def quiescent(binding):
    retained = Path(binding["retained"])
    identities = json.loads((retained / "stages/4/complete.json").read_text())["members"]
    for name, digest in binding["custody_files"].items():
        require(sha(retained / name) == digest, "old custody identity changed")
        identities.append(json.loads((retained / name).read_text())["identity"])
    current = snapshot()
    if "predecessor" in binding:
        failed = predecessor(binding)
        with (failed / "cleanup.csv").open() as stream:
            identities.extend({key: int(row[key]) for key in ("pid", "birth", "uid")} for row in csv.DictReader(stream))
    with PidfdEvidence() as exits:
        for raw in identities:
            identity = Identity(**raw)
            item = current.get(identity.pid)
            # Different births are unrelated. No signals are sent by this census.
            if item is not None and item.birth == identity.birth:
                require(item.uid == identity.uid, "old birth changed UID")
                require(exits.status(identity, item) != "live", "original worker still live")


def preserved_outputs(binding):
    paths = [Path(binding["retained"]).resolve(strict=True)]
    if "predecessor" in binding:
        paths.append(Path(binding["predecessor"]["failed_output"]).resolve(strict=True))
    return paths


def claim(binding, digest, output, candidate):
    remaining(binding)
    output = output.resolve(strict=True)
    for retained in preserved_outputs(binding):
        require(not output.is_relative_to(retained) and not retained.is_relative_to(output), "output overlaps old attempt")
    require(not output.is_relative_to(Path(binding["toolchains"])), "output overlaps installed inputs")
    record = {"binding_sha256": digest, "candidate": candidate, "output": str(output),
              "base_jdk": binding["base_jdk"], "candidate_jdk": str(image_paths(output)["candidate"]),
              "deadline_monotonic": binding["deadline_monotonic"]}
    # mkdir is the shared atomic spend. Even a crash before claim.json stays spent.
    directory = Path(binding["claim"])
    directory.mkdir(mode=0o700)
    with (directory / "claim.json").open("x") as stream:
        stream.write(json.dumps(record, sort_keys=True) + "\n")
    with (output / "continuation.json").open("x") as stream:
        stream.write(json.dumps(record, sort_keys=True) + "\n")
    return record


def proposed_output(binding, output, toolchains, witness):
    """Read-only rejection before the shell creates OUT or starts observation."""
    require(not os.path.lexists(output), "continuation output already exists")
    target = output.resolve()
    target.parent.resolve(strict=True)
    require(toolchains.resolve(strict=True) == Path(binding["toolchains"]), "toolchain root changed")
    for protected in (*preserved_outputs(binding), Path(binding["toolchains"]), Path(binding["manifest"]),
                      Path(binding["provenance"]), Path(binding["claim"]), witness.resolve(strict=True)):
        require(not target.is_relative_to(protected) and not protected.is_relative_to(target),
                "proposed output overlaps retained inputs/witnesses")
    return target


def candidate_gate(binding, output, stage):
    remaining(binding)
    require(environment() == binding["environment"], "candidate build environment changed")
    record = json.loads((output / "continuation.json").read_text())
    require(json.loads((Path(binding["claim"]) / "claim.json").read_text()) == record, "claim does not match output")
    require(record["output"] == str(output.resolve(strict=True)) and record["base_jdk"] == binding["base_jdk"],
            "continuation image/output changed")
    checkout = output / "candidate"
    require(git(checkout, "rev-parse", "HEAD", "HEAD:src", "HEAD:test").splitlines()
            == [record["candidate"], *CANDIDATE_TREES], "candidate source identity changed")
    require(not git(checkout, "diff", "--exit-code", "HEAD", "--")
            and not git(checkout, "status", "--porcelain", "--untracked-files=all"), "candidate inputs changed")
    require(profile(checkout / "build/scanner/spec.gmk") == binding["profile"], "candidate build profile differs")
    if stage is not None:
        require(json.loads((stage / "identity.json").read_text())["kind"] == "build", "not an image-build stage")
        footer = json.loads((stage / "complete.json").read_text())
        require(footer["clean"] is True and footer["command_status"] == 0 and footer["stopped"] is False
                and footer["survivors"] is False and footer["drain_deadline_missed"] is False and footer["timed_out"] is False,
                "candidate build did not complete successfully")
        check_image(Path(record["candidate_jdk"]))
    return record


def main(args):
    if args[0] == "prepare-successor" and len(args) == 5:
        prepare_successor(Path(args[1]), args[2], Path(args[3]), Path(args[4]))
        print(sha(Path(args[4])))
        return
    if args[0] == "prepare" and len(args) == 7:
        prepare(Path(args[1]), Path(args[2]), Path(args[3]), args[4], Path(args[5]), Path(args[6]))
        print(sha(Path(args[6])))
        return
    action, witness, digest = args[:3]
    binding = load(Path(witness), digest)
    if action == "remaining" and len(args) == 3:
        print(remaining(binding))
    elif action == "preflight" and len(args) == 5:
        remaining(binding)
        proposed_output(binding, Path(args[3]), Path(args[4]), Path(witness))
    elif action == "bind" and len(args) == 6:
        image = verify(binding, Path(args[3]))
        quiescent(binding)
        claim(binding, digest, Path(args[4]), args[5])
        for source, name, expected in (
            (Path(witness), "continuation-binding.json", digest),
            (Path(binding["manifest"]), "baseline-image-manifest.json", binding["manifest_sha256"]),
            (Path(binding["provenance"]), "baseline-provenance-files.json", binding["provenance_sha256"])):
            data = source.read_bytes()
            require(hashlib.sha256(data).hexdigest() == expected, "witness changed before retention")
            with (Path(args[4]) / name).open("xb") as stream:
                stream.write(data)
        print(image)
        print(image_paths(Path(args[4]))["candidate"])
    elif action == "profile" and len(args) == 4:
        candidate_gate(binding, Path(args[3]), None)
    elif action == "gate" and len(args) == 5:
        candidate_gate(binding, Path(args[3]), Path(args[4]))
        verify(binding, Path(binding["toolchains"]))
    else:
        raise ValueError("usage: continuation.py prepare <retained> <manifest> <provenance> <provenance-sha> <toolchains> <new-binding>; prepare-successor <spent-binding> <sha> <failed-output> <new-binding>; remaining <binding> <sha>; bind <binding> <sha> <toolchains> <new-output> <candidate>; profile <binding> <sha> <output>; gate <binding> <sha> <output> <build-stage>")


if __name__ == "__main__":
    try:
        main(sys.argv[1:])
    except Exception as error:
        print(f"INCOMPLETE: {type(error).__name__}: {error}", file=sys.stderr)
        sys.exit(125)
