# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

"""One Windows release consumer; never builds, dispatches, retries or edits a PR."""

import argparse
import ctypes
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import stat
import struct
import subprocess
import sys
import zipfile

REPO = "re-thc/openjdk-jdk27u"
RUN = 39861228047
JOB = 120218865571
HEAD = "d26205119c9ac625fdf28d8455fb14618f912846"
BASE = "d5291018851658625d16c3d26a9a4be8974e6354"
SOURCE = "1694c2019ba5ad033983859c063c1c671d90cb01"
JDK_ID = 12483273390
JDK_SHA = "f18f64699b9ed5f6b6ff4f8918772c79873d1b9cac277bb8a422ab218c89b2e2"
JTREG_ID = 12461863760
JTREG_SHA = "df298065351436b48100f2790e062996a422c2916c4798cefdce9d43161e4b62"
TESTS = ("LocalSocketAddress", "LocalSocketPort")
OPTIONS = ("-Xcheck:jni", "-Djava.net.preferIPv4Stack=true",
           "-Djava.net.preferIPv6Addresses=true")
SOURCE_HASHES = {
    "src/java.base/share/classes/sun/nio/ch/Net.java": "0c87b8a7dff383d21470d7707c17c3de1aeb5dad1f656b089f3959f5f9156579",
    "src/java.base/share/classes/sun/nio/ch/NioSocketImpl.java": "0ee000cf22a933adb914ff96235eb8414818f53d9eff7c7155881e7e0398bc65",
    "src/java.base/windows/native/libnio/ch/Net.c": "60295c582131f6bd04bf28aa013e9fb341b5bceaa1e65598c45f7a0dc2d95225",
    "test/jdk/sun/nio/ch/LocalSocketAddress.java": "35bb089f44b1726d126327b6cff3c51f857070b62b838c7424c863b46edb4b23",
    "test/jdk/sun/nio/ch/LocalSocketPort.java": "e9e4b92c6c03d65ce75615b3eb58e15fd9b6980ef30f1167eeb427ca4b7f1b18",
}
IMAGE_FILES = ("bin/java.exe", "bin/java.dll", "bin/net.dll", "bin/nio.dll",
               "bin/server/jvm.dll", "lib/modules", "release")


class Prerequisite(Exception):
    pass


class Failure(Exception):
    pass


def require(condition, message):
    if not condition:
        raise Prerequisite(message)


def sha256(path):
    with path.open("rb") as stream:
        return hashlib.file_digest(stream, "sha256").hexdigest()


def api(path, destination=None):
    # gh handles the API's signed artifact redirect. No alternate URL or retry.
    require(path.startswith(("pulls/74", "git/commits/", "actions/")), "Invalid API path")
    with destination.open("wb") if destination else open(os.devnull, "wb") as sink:
        result = subprocess.run(["gh", "api", "--hostname", "github.com", "--method", "GET", f"repos/{REPO}/{path}"],
                                stdout=sink if destination else subprocess.PIPE,
                                stderr=subprocess.PIPE, check=False)
    if result.returncode:
        status = re.search(rb"HTTP (\d{3})", result.stderr)
        suffix = f" (HTTP {status[1].decode()})" if status else ""
        raise Prerequisite(f"GitHub GET {path.split('?')[0]} failed{suffix}; no retry")
    if not destination:
        return json.loads(result.stdout)


def admission(get=api):
    pr = get("pulls/74")
    require(pr["head"]["sha"] == HEAD and pr["base"]["sha"] == BASE
            and pr["merge_commit_sha"] == SOURCE, "PR/source identity changed")
    merge = get(f"git/commits/{SOURCE}")
    require([p["sha"] for p in merge["parents"]] == [BASE, HEAD], "Wrong merge parents")
    run = get(f"actions/runs/{RUN}")
    require(run["head_sha"] == HEAD and run["event"] == "pull_request"
            and run["run_attempt"] == 1 and run["workflow_id"] == 373882300,
            "Wrong ordinary run/attempt/workflow")
    require(any(w["sha"] == SOURCE and "build-windows.yml@" in w["path"]
                for w in run.get("referenced_workflows", [])), "Wrong Windows build source")
    job = get(f"actions/jobs/{JOB}")
    require(job["run_id"] == RUN and job["name"] == "windows-x64 / build (release)"
            and job["status"] == "completed" and job["conclusion"] == "success",
            "Ordinary Windows release build has not completed successfully")
    artifacts = []
    for page in range(1, 11):
        batch = get(f"actions/runs/{RUN}/artifacts?per_page=100&page={page}")["artifacts"]
        artifacts.extend(batch)
        if len(batch) < 100:
            break
    else:
        raise Prerequisite("Unexpected artifact pagination")
    selected = []
    for name in ("bundles-windows-x64", "bundles-jtreg-8.2.1+1"):
        matches = [a for a in artifacts if a["name"] == name]
        require(len(matches) == 1, f"Missing or ambiguous {name}")
        a = matches[0]
        require(not a["expired"] and a["workflow_run"]["id"] == RUN
                and a["workflow_run"]["head_sha"] == HEAD, "Wrong/expired artifact")
        require(re.fullmatch(r"sha256:[0-9a-f]{64}", a.get("digest", "")), "Missing digest")
        if name == "bundles-windows-x64":
            require(a["id"] == JDK_ID and a["digest"] == "sha256:" + JDK_SHA,
                    "Wrong pinned Windows release artifact")
            require(job["started_at"] <= a["created_at"] <= job["completed_at"],
                    "Artifact not from selected successful release build")
        else:
            require(a["id"] == JTREG_ID and a["digest"] == "sha256:" + JTREG_SHA,
                    "Wrong pinned jtreg artifact")
        selected.append(a)
    return selected


def download(artifact, destination, get=api):
    get(f"actions/artifacts/{artifact['id']}/zip", destination)
    require(destination.stat().st_size <= 1024**3, "Artifact exceeds size limit")
    require(sha256(destination) == artifact["digest"].removeprefix("sha256:"),
            "Artifact SHA256 mismatch")


def extract(archive, destination, only=None):
    destination.mkdir()  # Fresh directory: never merge an old image or follow old links.
    seen = set()
    with zipfile.ZipFile(archive) as z:
        entries = z.infolist()
        require(len(entries) <= 20000 and sum(e.file_size for e in entries) <= 4 * 1024**3,
                "Archive exceeds extraction limits")
        for e in entries:
            parts = e.filename.rstrip("/").split("/")
            mode = stat.S_IFMT(e.external_attr >> 16)
            require(mode in (0, stat.S_IFREG, stat.S_IFDIR), "Archive special file")
            require(all(p and p not in (".", "..") and not p.endswith((".", " "))
                        and not re.search(r'[\\:<>"|?*\x00-\x1f]', p)
                        and not re.fullmatch(r"(?i)(con|prn|aux|nul|com[1-9¹²³]|lpt[1-9¹²³]|conin\$|conout\$)(\..*)?", p)
                        for p in parts), "Unsafe Windows archive path")
            key = "/".join(parts).casefold()
            require(key not in seen, "Duplicate Windows archive path")
            seen.add(key)
            if only is not None and e.filename not in only:
                continue
            target = destination.joinpath(*PurePosixPath(e.filename).parts)
            if e.is_dir():
                target.mkdir(parents=True, exist_ok=True)
            else:
                target.parent.mkdir(parents=True, exist_ok=True)
                with z.open(e) as src, target.open("xb") as dst:
                    shutil.copyfileobj(src, dst)
        require(only is None or only <= set(z.namelist()), "Missing ordinary JDK ZIP payload")


def image_root(directory):
    roots = [p.parent.parent for p in directory.rglob("java.exe") if p.parent.name == "bin"]
    require(len(roots) == 1, "Expected one ordinary JDK root")
    return roots[0]


def check_image(jdk):
    for name in IMAGE_FILES:
        require((jdk / name).is_file(), f"Missing image component {name}")
    release = (jdk / "release").read_text()
    require(re.search(r'^SOURCE=".*git:' + SOURCE[:12], release, re.M), "Wrong release SOURCE")
    require(SOURCE in release, "Missing full build merge identity in release metadata")
    for name in IMAGE_FILES[:5]:
        with (jdk / name).open("rb") as f:
            require(f.read(2) == b"MZ", "Not a Windows PE image")
            f.seek(0x3c)
            offset = struct.unpack("<I", f.read(4))[0]
            f.seek(offset)
            require(f.read(6) == b"PE\0\0\x64\x86", "Not an AMD64 image")
    return {name: sha256(jdk / name) for name in IMAGE_FILES}


class WindowsJob:
    """Kill the gated launcher and all its descendants if this controller exits."""
    def __enter__(self):
        require(ctypes.sizeof(ctypes.c_void_p) == 8, "64-bit Windows Python required")
        class Basic(ctypes.Structure):
            _fields_ = [("times", ctypes.c_int64 * 2), ("flags", ctypes.c_uint32),
                        ("min", ctypes.c_size_t), ("max", ctypes.c_size_t),
                        ("active", ctypes.c_uint32), ("affinity", ctypes.c_size_t),
                        ("priority", ctypes.c_uint32), ("scheduling", ctypes.c_uint32)]
        class Limits(ctypes.Structure):
            _fields_ = [("basic", Basic), ("io", ctypes.c_uint64 * 6),
                        ("memory", ctypes.c_size_t * 4)]
        self.kernel = ctypes.WinDLL("kernel32", use_last_error=True)
        for name, args, result in (
            ("CreateJobObjectW", [ctypes.c_void_p, ctypes.c_wchar_p], ctypes.c_void_p),
            ("SetInformationJobObject", [ctypes.c_void_p, ctypes.c_int, ctypes.c_void_p, ctypes.c_uint32], ctypes.c_int),
            ("AssignProcessToJobObject", [ctypes.c_void_p, ctypes.c_void_p], ctypes.c_int),
            ("CloseHandle", [ctypes.c_void_p], ctypes.c_int)):
            fn = getattr(self.kernel, name)
            fn.argtypes, fn.restype = args, result
        self.handle = self.kernel.CreateJobObjectW(None, None)
        limits = Limits()
        limits.basic.flags = 0x2000  # JOB_OBJECT_LIMIT_KILL_ON_JOB_CLOSE
        if not self.handle:
            raise Prerequisite("Cannot create process-tree cleanup")
        if not self.kernel.SetInformationJobObject(
                self.handle, 9, ctypes.byref(limits), ctypes.sizeof(limits)):
            self.kernel.CloseHandle(self.handle)
            raise Prerequisite("Cannot set process-tree cleanup")
        return self

    def run(self, arguments):
        # The entire consumer waits for stdin before starting any gh/Java process.
        # Closing this parent's handle on job cancellation kills that whole tree.
        child = subprocess.Popen([sys.executable, __file__, "--child"], stdin=subprocess.PIPE)
        if not self.kernel.AssignProcessToJobObject(self.handle, int(child._handle)):
            child.kill()
            child.wait()
            raise Prerequisite("Cannot contain consumer process tree")
        child.communicate(json.dumps(arguments).encode())
        return child.returncode

    def __exit__(self, *args):
        self.kernel.CloseHandle(self.handle)


def properties(text):
    return dict(re.findall(r"^\s*([\w.]+)\s*=\s*(.*)$", text, re.M))


def check_runtime(text, jdk):
    p = properties(text)
    require(p.get("os.name", "").startswith("Windows") and p.get("os.arch") == "amd64"
            and p.get("sun.arch.data.model") == "64" and p.get("jdk.debug") == "release",
            "Wrong runtime OS/architecture/variant")
    require(Path(p.get("java.home", "")).resolve() == jdk.resolve(), "Wrong runtime java.home")
    require(SOURCE in p.get("java.runtime.version", ""), "Wrong runtime source build")
    return {k: p[k][:200] for k in ("java.runtime.version", "os.name", "os.arch",
                                    "sun.arch.data.model", "jdk.debug")} | {"java_home_matches": True}


def unescape(value):
    return re.sub(r"\\(.)", lambda m: {"n": "\n", "r": "\r", "t": "\t"}.get(m[1], m[1]), value)


def test_result(text, name, jdk):
    props = {k: unescape(v) for k, v in re.findall(r"^([\w.]+)=(.*)$", text, re.M)}
    require(props.get("testJDK_os.name", "").startswith("Windows"), "JTR is not Windows")
    require(Path(props.get("testJDK", "")).resolve() == jdk.resolve(), "Wrong JTR image")
    mains = re.findall(r"^#section:main\n(.*?)(?=^#section:|\Z)", text, re.M | re.S)
    require(len(mains) == 3, f"Missing actual actions for {name}")
    families, scoped = [], []
    for section, option in zip(mains, OPTIONS):
        require(f"command: main {option} {name}\n" in section, "Wrong declared test action")
        require("\nresult: Passed. Execution successful" in section, "Test action did not pass")
        require("SkippedException" not in section and "Skipped:" not in section, "Whole action skipped")
        if name == "LocalSocketAddress":
            found = re.findall(r"^Testing (INET6?)$", section, re.M)
            require("INET" in found, "No IPv4 Windows unbound checks executed")
            families.append(found)
            scoped.append("exercised" if "Testing scoped address " in section else
                          "unavailable" if "Skipping scoped IPv6:" in section else "not-applicable")
        else:
            require("virtual=false," in section and "virtual=true," in section,
                    "Missing platform/virtual lifecycle execution")
    require(props.get("execStatus") == "Passed. Execution successful", "Test record failed")
    return {"actions": 3, "families": families, "scoped_ipv6": scoped}


def selected_log(text):
    # Do not publish JTR host properties, configuration, rerun environment or dumps.
    lines, copying = [], False
    for line in text.splitlines():
        if line.startswith(("#section:", "command:", "result:", "test result:")):
            lines.append(line)
            copying = False
        if line.startswith("----------"):
            copying = line.startswith(("----------System.out:", "----------System.err:"))
        elif copying:
            lines.append(re.sub(r"Testing scoped address .*", "Testing scoped address [available]", line))
    return "\n".join(lines) + "\n"


def child_environment():
    return {k: v for k, v in os.environ.items()
            if not any(s in k.upper() for s in ("TOKEN", "SECRET"))}


def run_java(command, log, env):
    with log.open("wb") as stream:
        return subprocess.run(command, stdout=stream, stderr=subprocess.STDOUT,
                              env=env, check=False).returncode


def consume(source, work, output):
    summary = {"state": "prerequisite", "run": RUN, "job": JOB, "head": HEAD, "base": BASE,
               "ordinary_run_attempt": 1, "consumer_commit": os.environ.get("GITHUB_SHA"),
               "source_merge": SOURCE, "variant": "windows-x64-release"}
    output.mkdir()
    work.mkdir()
    try:
        require(sys.platform == "win32", "Native Windows executor required")
        summary["ambient_java_options"] = {}
        for name in ("JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS"):
            value = os.environ.pop(name, None)
            summary["ambient_java_options"][name] = None if value is None else hashlib.sha256(value.encode()).hexdigest()
        require(subprocess.check_output(["git", "-C", str(source), "rev-parse", "HEAD"], text=True).strip() == SOURCE,
                "Wrong source checkout")
        require(all(sha256(source / n) == h for n, h in SOURCE_HASHES.items()), "Changed source/tests")
        artifacts = admission()
        summary["artifacts"] = [{k: a[k] for k in ("id", "name", "digest")} for a in artifacts]
        for a, name in zip(artifacts, ("product", "jtreg")):
            archive = work / (name + ".zip")
            download(a, archive)
            extract(archive, work / name, {"jdk-windows-x64.zip"} if name == "product" else None)
        extract(work / "product/jdk-windows-x64.zip", work / "image")
        jdk = image_root(work / "image")
        jtreg = work / "jtreg/lib/jtreg.jar"
        require(jtreg.is_file(), "Wrong portable jtreg archive layout")
        summary["image_sha256"] = check_image(jdk)
        summary["release_source"] = re.search(r'^SOURCE="([^"]+)"',
                                               (jdk / "release").read_text(), re.M)[1][:200]
        env = child_environment()
        runtime = work / "runtime.txt"
        require(run_java([str(jdk / "bin/java.exe"), "-XshowSettings:properties", "-version"], runtime, env) == 0,
                "Windows JDK startup failed")
        summary["runtime"] = check_runtime(runtime.read_text(errors="replace"), jdk)
        summary["state"] = "failed"
        command = [str(jdk / "bin/java.exe"), "-jar", str(jtreg), f"-jdk:{jdk}",
                   f"-w:{work / 'jtreg-work'}", f"-r:{work / 'jtreg-report'}",
                   "-concurrency:1", "-timeoutFactor:1", "-verbose:summary"]
        command += [str(source / f"test/jdk/sun/nio/ch/{t}.java") for t in TESTS]
        status = run_java(command, work / "jtreg.txt", env)
        summary["jtreg_exit"] = status
        texts = {}
        for name in TESTS:
            record = work / f"jtreg-work/sun/nio/ch/{name}.jtr"
            if record.is_file():
                texts[name] = record.read_text(errors="replace").replace("\r\n", "\n")
                log = selected_log(texts[name])
                for root, label in ((jdk, "<jdk>"), (work, "<work>"), (source, "<source>")):
                    log = log.replace(str(root), label).replace(root.as_posix(), label)
                (output / (name + ".log")).write_text(log)
        require(set(texts) == set(TESTS), "Missing selected JTR records")
        summary["results"] = {name: test_result(texts[name], name, jdk) for name in TESTS}
        if status:
            raise Failure("jtreg returned a failure")
        summary["state"] = "passed"
    except (Prerequisite, Failure) as e:
        summary["reason"] = str(e)
    except BaseException as e:
        summary["reason"] = f"Controller stopped: {type(e).__name__}"
    finally:
        (output / "summary.json").write_text(json.dumps(summary, indent=2) + "\n")
    print(json.dumps({k: summary[k] for k in ("state", "head", "source_merge")}))
    return 0 if summary["state"] == "passed" else 1


if __name__ == "__main__":
    if sys.argv[1:] == ["--child"]:
        sys.exit(consume(*(Path(p) for p in json.load(sys.stdin))))
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ("source", "work", "output"):
        parser.add_argument("--" + name, type=Path, required=True)
    args = parser.parse_args()
    paths = [str(p.resolve()) for p in (args.source, args.work, args.output)]
    if os.name != "nt":
        sys.exit(consume(*(Path(p) for p in paths)))
    with WindowsJob() as job:
        sys.exit(job.run(paths))
