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

"""Local fixture tests; no network, JDK execution, build or CI dispatch."""

import copy
import importlib.util
import io
import json
from pathlib import Path
import struct
import subprocess
import tempfile
import unittest
from unittest.mock import Mock, patch
import zipfile

spec = importlib.util.spec_from_file_location("consumer", Path(__file__).with_name("validate-socket-endpoint-windows.py"))
c = importlib.util.module_from_spec(spec)
spec.loader.exec_module(c)
ROOT = Path(__file__).resolve().parents[2]


def archives(files):
    buffer = io.BytesIO()
    with zipfile.ZipFile(buffer, "w") as z:
        for name, value in files.items():
            z.writestr(name, value)
    return buffer.getvalue()


def pe():
    value = bytearray(128)
    value[:2] = b"MZ"
    struct.pack_into("<I", value, 0x3c, 64)
    value[64:70] = b"PE\0\0\x64\x86"
    return bytes(value)


def record(name, jdk):
    header = ("execStatus=Passed. Execution successful\n"
              "testJDK_os.name=Windows Server 2025\n"
              f"testJDK={jdk}\n"
              "hostname=private-host\nrun=planned-actions-only\n")
    sections = []
    for option in c.OPTIONS:
        output = ("Testing INET\nSkipping IPv6: unavailable\n" if name == "LocalSocketAddress"
                  else "virtual=false, address=/127.0.0.1\nvirtual=true, address=/127.0.0.1\n")
        sections.append(f"#section:main\ncommand: main {option} {name}\n"
                        "----------System.out:(2/20)----------\n" + output +
                        "----------System.err:(1/15)----------\nSTATUS:Passed.\n"
                        "----------rerun:(2/40)*----------\nPRIVATE_TOKEN=do-not-publish\n"
                        "result: Passed. Execution successful\n")
    return header + "".join(sections) + "test result: Passed. Execution successful\n"


class ConsumerTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.artifacts = [
            {"id": 1, "name": "bundles-windows-x64", "expired": False,
             "digest": "sha256:" + "a" * 64, "created_at": "2026-10-23T06:01:00Z",
             "workflow_run": {"id": c.RUN, "head_sha": c.HEAD}},
            {"id": c.JTREG_ID, "name": "bundles-jtreg-8.2.1+1", "expired": False,
             "digest": "sha256:" + c.JTREG_SHA, "workflow_run": {"id": c.RUN, "head_sha": c.HEAD}},
        ]
        self.responses = {
            "pulls/74": {"head": {"sha": c.HEAD}, "base": {"sha": c.BASE}, "merge_commit_sha": c.SOURCE},
            f"git/commits/{c.SOURCE}": {"parents": [{"sha": c.BASE}, {"sha": c.HEAD}]},
            f"actions/runs/{c.RUN}": {"head_sha": c.HEAD, "event": "pull_request", "run_attempt": 1,
                                     "workflow_id": 373882300,
                                     "referenced_workflows": [{"sha": c.SOURCE, "path": "build-windows.yml@" + c.SOURCE}]},
            f"actions/jobs/{c.JOB}": {"run_id": c.RUN, "name": "windows-x64 / build (release)",
                                     "status": "completed", "conclusion": "success",
                                     "started_at": "2026-10-23T06:00:00Z", "completed_at": "2026-10-23T06:02:00Z"},
            f"actions/runs/{c.RUN}/artifacts?per_page=100&page=1": {"artifacts": self.artifacts},
        }

    def test_successful_ordinary_release_admission(self):
        self.assertEqual(c.admission(self.responses.__getitem__), self.artifacts)

    def test_pending_wrong_or_failed_build_has_no_download(self):
        for field, bad in [("status", "queued"), ("conclusion", "failure"),
                           ("run_id", 0), ("name", "windows-x64 / build (debug)")]:
            with self.subTest(field=field):
                values = copy.deepcopy(self.responses)
                values[f"actions/jobs/{c.JOB}"][field] = bad
                get = Mock(side_effect=values.__getitem__)
                with self.assertRaises(c.Prerequisite):
                    c.admission(get)
                self.assertFalse(any("/zip" in call.args[0] for call in get.call_args_list))

    def test_run_source_and_artifact_identity_fail_closed(self):
        mutations = [
            ("pulls/74", "merge_commit_sha", "wrong"),
            (f"actions/runs/{c.RUN}", "run_attempt", 2),
            (f"actions/runs/{c.RUN}", "head_sha", "wrong"),
        ]
        for key, field, bad in mutations:
            values = copy.deepcopy(self.responses)
            values[key][field] = bad
            with self.subTest(field=field), self.assertRaises(c.Prerequisite):
                c.admission(values.__getitem__)
        for field, bad in [("expired", True), ("digest", ""), ("created_at", "2025-01-01T00:00:00Z")]:
            values = copy.deepcopy(self.responses)
            values[f"actions/runs/{c.RUN}/artifacts?per_page=100&page=1"]["artifacts"][0][field] = bad
            with self.subTest(field=field), self.assertRaises(c.Prerequisite):
                c.admission(values.__getitem__)

    def test_missing_duplicate_or_wrong_jtreg_artifact(self):
        for items in [self.artifacts[1:], self.artifacts + self.artifacts[:1],
                      [self.artifacts[0], dict(self.artifacts[1], id=0)]]:
            values = dict(self.responses)
            values[f"actions/runs/{c.RUN}/artifacts?per_page=100&page=1"] = {"artifacts": items}
            with self.subTest(items=items), self.assertRaises(c.Prerequisite):
                c.admission(values.__getitem__)

    def test_api_denial_one_call_no_url_leak(self):
        result = subprocess.CompletedProcess([], 1, b"", b"HTTP 403 https://signed.invalid/?secret=hidden")
        with patch.object(c.subprocess, "run", return_value=result) as run:
            with self.assertRaises(c.Prerequisite) as error:
                c.api("actions/artifacts/1/zip", self.root / "archive.zip")
        self.assertEqual(run.call_count, 1)
        self.assertNotIn("hidden", str(error.exception))
        self.assertIn("HTTP 403", str(error.exception))

    def test_download_digest_mismatch_stops(self):
        target = self.root / "a.zip"
        get = Mock(side_effect=lambda path, dest: dest.write_bytes(b"wrong"))
        with self.assertRaises(c.Prerequisite):
            c.download(self.artifacts[0], target, get)
        self.assertEqual(get.call_count, 1)

    def test_ordinary_nested_jdk_and_direct_jtreg_layout(self):
        inner = archives({"jdk-27/bin/java.exe": pe(), "jdk-27/release": b"release"})
        outer = self.root / "outer.zip"
        outer.write_bytes(archives({"jdk-windows-x64.zip": inner, "tests-windows-x64.tar.gz": b"unused"}))
        c.extract(outer, self.root / "product", {"jdk-windows-x64.zip"})
        self.assertFalse((self.root / "product/tests-windows-x64.tar.gz").exists())
        c.extract(self.root / "product/jdk-windows-x64.zip", self.root / "image")
        self.assertEqual(c.image_root(self.root / "image"), self.root / "image/jdk-27")
        jtreg = self.root / "jtreg.zip"
        jtreg.write_bytes(archives({"lib/jtreg.jar": b"fixture"}))
        c.extract(jtreg, self.root / "jtreg")
        self.assertTrue((self.root / "jtreg/lib/jtreg.jar").is_file())

    def test_unsafe_windows_archive_paths(self):
        names = ["../x", "/absolute", "C:/x", "a\\b", "a:stream", "a/../b", "a./b",
                 "a /b", "CON.txt", "aux", "LPT1.log", "COM¹.txt", "LPT²", "//server/share", "a//b"]
        for index, name in enumerate(names):
            z = self.root / f"bad{index}.zip"
            z.write_bytes(archives({name: b"x"}))
            with self.subTest(name=name), self.assertRaises(c.Prerequisite):
                c.extract(z, self.root / f"out{index}")

    def test_archive_symlink_case_collision_missing_payload_and_old_output(self):
        z = self.root / "bad.zip"
        with zipfile.ZipFile(z, "w") as f:
            link = zipfile.ZipInfo("link")
            link.external_attr = 0o120777 << 16
            f.writestr(link, "outside")
        with self.assertRaises(c.Prerequisite):
            c.extract(z, self.root / "links")
        z.write_bytes(archives({"A": b"x", "a": b"y"}))
        with self.assertRaises(c.Prerequisite):
            c.extract(z, self.root / "case")
        z.write_bytes(archives({"wrong.zip": b"x"}))
        with self.assertRaises(c.Prerequisite):
            c.extract(z, self.root / "missing", {"jdk-windows-x64.zip"})
        with self.assertRaises(FileExistsError):
            c.extract(z, self.root / "missing")

    def make_image(self):
        root = self.root / "jdk"
        for name in c.IMAGE_FILES:
            p = root / name
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_bytes(pe() if name.startswith("bin/") else b"modules")
        (root / "release").write_text(f'SOURCE=".:git:{c.SOURCE[:12]}"\nJAVA_RUNTIME_VERSION="27-{c.SOURCE}"\n')
        return root

    def test_image_architecture_and_source(self):
        jdk = self.make_image()
        self.assertEqual(set(c.check_image(jdk)), set(c.IMAGE_FILES))
        (jdk / "bin/nio.dll").write_bytes(b"ELF")
        with self.assertRaises(c.Prerequisite):
            c.check_image(jdk)

    def test_runtime_release_source_and_target_identity(self):
        jdk = self.root / "jdk"
        good = (f"os.name = Windows Server 2025\nos.arch = amd64\nsun.arch.data.model = 64\n"
                f"jdk.debug = release\njava.home = {jdk}\njava.runtime.version = 27-{c.SOURCE}\n")
        c.check_runtime(good, jdk)
        for bad in [good.replace("release", "fastdebug"), good.replace("amd64", "aarch64"),
                    good.replace(c.SOURCE, c.HEAD), good.replace("Windows", "Linux")]:
            with self.subTest(bad=bad), self.assertRaises(c.Prerequisite):
                c.check_runtime(bad, jdk)

    def test_actual_actions_required_not_run_metadata_or_exit_status(self):
        for name in c.TESTS:
            good = record(name, self.root)
            self.assertEqual(c.test_result(good, name, self.root)["actions"], 3)
            cases = [good.replace("#section:main", "#section:build"),
                     good.replace("result: Passed.", "result: Failed.", 1),
                     good.replace("Execution successful", "Skipped: no protocols", 1),
                     good.replace("Windows Server 2025", "Linux"),
                     good.replace(c.OPTIONS[1], c.OPTIONS[0]),
                     good.replace("Testing INET", "Skipping IPv4") if name == c.TESTS[0]
                     else good.replace("virtual=true,", "virtual=missing,")]
            for text in cases:
                with self.subTest(name=name), self.assertRaises(c.Prerequisite):
                    c.test_result(text, name, self.root)

    def test_selected_log_excludes_host_configuration_and_rerun(self):
        log = c.selected_log(record("LocalSocketAddress", self.root))
        self.assertIn("Testing INET", log)
        self.assertEqual(log.count("result: Passed."), 4)
        for private in ["private-host", "PRIVATE_TOKEN", "testJDK=", "hostname=", "run=planned"]:
            self.assertNotIn(private, log)

    def test_windows_java_property_path_escaping(self):
        target = Path(r"C:\runtime\jdk")
        text = record("LocalSocketAddress", self.root)
        text = text.replace(f"testJDK={self.root}\n", r"testJDK=C\:\\runtime\\jdk" + "\n")
        self.assertEqual(c.test_result(text, "LocalSocketAddress", target)["actions"], 3)

    def test_java_environment_does_not_inherit_tokens(self):
        with patch.dict(c.os.environ, {"GH_TOKEN": "hidden", "ACTIONS_RUNTIME_TOKEN": "hidden",
                                       "OTHER_SECRET": "hidden", "SYSTEMROOT": "Windows"}, clear=True):
            self.assertEqual(c.child_environment(), {"SYSTEMROOT": "Windows"})

    def test_containment_assignment_precedes_child_gate(self):
        calls = []
        class Function:
            def __init__(self, name, value):
                self.name, self.value = name, value
            def __call__(self, *args):
                calls.append(self.name)
                if self.name == "SetInformationJobObject":
                    self_test.assertEqual(args[3], 144)
                return self.value
        kernel = Mock()
        for name, value in [("CreateJobObjectW", 42), ("SetInformationJobObject", 1),
                            ("AssignProcessToJobObject", 1), ("CloseHandle", 1)]:
            setattr(kernel, name, Function(name, value))
        child = Mock(_handle=7, returncode=0)
        child.communicate.side_effect = lambda data: calls.append("gate")
        self_test = self
        with patch.object(c.ctypes, "WinDLL", return_value=kernel, create=True), \
                patch.object(c.subprocess, "Popen", return_value=child):
            with c.WindowsJob() as job:
                self.assertEqual(job.run(["source", "work", "output"]), 0)
        self.assertEqual(calls, ["CreateJobObjectW", "SetInformationJobObject",
                                 "AssignProcessToJobObject", "gate", "CloseHandle"])

    def test_complete_fixture_consumer_once_and_keeps_failed_selected_logs(self):
        # Fake PE/ZIP/runtime/JTR data only; no JDK or native Windows code executes.
        files = {"jdk-27/" + n: pe() if n.startswith("bin/") else b"modules" for n in c.IMAGE_FILES}
        files["jdk-27/release"] = f'SOURCE=".:git:{c.SOURCE[:12]}"\nJAVA_RUNTIME_VERSION="27-{c.SOURCE}"\n'
        product = archives({"jdk-windows-x64.zip": archives(files)})
        portable = archives({"lib/jtreg.jar": b"fixture"})
        for failed in (False, True):
            with self.subTest(failed=failed):
                work, out = self.root / f"work{failed}", self.root / f"out{failed}"
                def fake_download(artifact, dest):
                    dest.write_bytes(product if artifact["name"] == "bundles-windows-x64" else portable)
                def fake_java(command, log, env):
                    self.assertNotIn("GH_TOKEN", env)
                    jdk = work / "image/jdk-27"
                    if "-version" in command:
                        log.write_text(f"os.name = Windows Server 2025\nos.arch = amd64\nsun.arch.data.model = 64\n"
                                       f"jdk.debug = release\njava.home = {jdk}\njava.runtime.version = 27-{c.SOURCE}\n")
                        return 0
                    self.assertEqual(command.count("-concurrency:1"), 1)
                    self.assertEqual(command[-2:], [str(ROOT / f"test/jdk/sun/nio/ch/{n}.java") for n in c.TESTS])
                    for name in c.TESTS:
                        p = work / f"jtreg-work/sun/nio/ch/{name}.jtr"
                        p.parent.mkdir(parents=True, exist_ok=True)
                        text = record(name, jdk)
                        if failed and name == c.TESTS[0]:
                            text = text.replace("execStatus=Passed.", "execStatus=Failed.")
                        p.write_text(text)
                    return 1 if failed else 0
                with patch.object(c.sys, "platform", "win32"), \
                        patch.object(c.subprocess, "check_output", return_value=c.SOURCE + "\n"), \
                        patch.object(c, "admission", return_value=self.artifacts), \
                        patch.object(c, "download", side_effect=fake_download) as downloads, \
                        patch.object(c, "run_java", side_effect=fake_java) as java, \
                        patch.dict(c.os.environ, {"GH_TOKEN": "hidden", "JAVA_TOOL_OPTIONS": "hidden"}), \
                        patch("builtins.print"):
                    self.assertEqual(c.consume(ROOT, work, out), 1 if failed else 0)
                self.assertEqual(downloads.call_count, 2)
                self.assertEqual(java.call_count, 2)  # startup + one jtreg invocation
                status = json.loads((out / "summary.json").read_text())
                self.assertEqual(status["state"], "failed" if failed else "passed")
                self.assertEqual(status["runtime"]["jdk.debug"], "release")
                self.assertEqual(len(list(out.glob("*.log"))), 2)
                self.assertNotIn("hidden", (out / "summary.json").read_text())

    def test_pending_consumer_does_not_download_or_launch_java(self):
        with patch.object(c.sys, "platform", "win32"), \
                patch.object(c.subprocess, "check_output", return_value=c.SOURCE + "\n"), \
                patch.object(c, "admission", side_effect=c.Prerequisite("Windows build queued")), \
                patch.object(c, "download") as download, patch.object(c, "run_java") as java, \
                patch("builtins.print"):
            out = self.root / "pending-output"
            self.assertEqual(c.consume(ROOT, self.root / "pending-work", out), 1)
        self.assertFalse(download.called or java.called)
        self.assertEqual(json.loads((out / "summary.json").read_text())["state"], "prerequisite")

    def test_workflow_only_manual_single_release_consumer(self):
        text = (ROOT / ".github/workflows/main.yml").read_text()
        self.assertIn("workflow_dispatch:", text)
        self.assertNotIn("pull_request:", text)
        self.assertNotIn("push:", text)
        self.assertNotIn("workflow_run:", text)
        self.assertNotIn("matrix:", text)
        self.assertIn("timeout-minutes: 20", text)
        self.assertIn("runs-on: windows-2025", text)
        self.assertEqual(text.count("validate-socket-endpoint-windows.py"), 1)
        self.assertEqual(text.count("persist-credentials: false"), 2)
        self.assertNotIn("make ", text)
        upload = text.split("path: |", 1)[1]
        self.assertEqual(len(upload.strip().splitlines()), 3)
        self.assertNotIn(".zip", upload)


if __name__ == "__main__":
    unittest.main()
