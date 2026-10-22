#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Reproduce source identity checks with real Git tracked/untracked states."""
import importlib.util
from pathlib import Path
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True


def main():
    path = Path(__file__).resolve().parents[1] / "check-instant-native.py"
    spec = importlib.util.spec_from_file_location("instant_controller", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    cases = 0
    with tempfile.TemporaryDirectory(prefix="instant-source-regression-") as directory:
        root = Path(directory)

        def git(*args):
            return subprocess.check_output(["git", "-C", str(root), *args], text=True,
                                           stderr=subprocess.STDOUT).strip()

        git("init", "--quiet")
        (root / "tracked.java").write_text("class Test {}\n")
        git("add", "tracked.java")
        git("-c", "user.name=Harry Chan", "-c",
            "user.email=38070640+re-thc@users.noreply.github.com",
            "commit", "--quiet", "-m", "Source fixture")
        head = git("rev-parse", "HEAD")

        def release(revision=head, marker=""):
            return ('SOURCE=".:git:' + revision[:12] + marker + '"\n'
                    'JAVA_RUNTIME_VERSION="27.0.2-internal-' + revision + '"\n')

        def check(label, text=None, actual=head, fails=False):
            nonlocal cases
            cases += 1
            try:
                module.verify_source(text or release(), head, actual,
                    git("status", "--porcelain", "--untracked-files=no"),
                    git("status", "--porcelain", "--untracked-files=normal"))
            except RuntimeError:
                assert fails, label + " unexpectedly rejected"
            else:
                assert not fails, label + " unexpectedly accepted"
            print(label + " PASS")

        check("clean tracked checkout")
        for name in ("bootjdk", "instant-native-evidence"):
            (root / name).mkdir()
            (root / name / "output.txt").write_text("normal setup or output")
        assert git("status", "--porcelain", "--untracked-files=normal")
        assert not git("status", "--porcelain", "--untracked-files=no")
        check("SOURCE+ from untracked build/evidence directories", release(marker="+"))
        (root / "tracked.java").write_text("class Changed {}\n")
        check("tracked source edit rejected", release(marker="+"), fails=True)
        git("restore", "tracked.java")
        (root / "new-source.java").write_text("class Injected {}\n")
        check("untracked source addition rejected", release(marker="+"), fails=True)
        git("config", "status.showUntrackedFiles", "no")
        check("hidden untracked source addition rejected", release(), fails=True)
        git("config", "--unset", "status.showUntrackedFiles")
        (root / "new-source.java").unlink()
        check("wrong actual HEAD rejected", release(marker="+"), actual="0" * 40, fails=True)
        check("stale image SOURCE rejected", release("0" * 40, "+"), fails=True)
        check("stale runtime version rejected",
              release(marker="+").replace("-" + head, "-wrong"), fails=True)
        check("missing image SOURCE rejected",
              'JAVA_RUNTIME_VERSION="27.0.2-internal-' + head + '"\n', fails=True)
    print(f"{cases} actual-Git source identity regression cases PASS")


if __name__ == "__main__":
    main()
