#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
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

"""Regenerate the vendored simdutf from an unmodified upstream release checkout."""
import argparse
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("checkout", type=Path, help="clean simdutf Git checkout at a release tag")
args = parser.parse_args()
upstream = args.checkout.resolve()
root = Path(__file__).resolve().parents[2]

def git(*arguments):
    return subprocess.check_output(["git", "-C", str(upstream), *arguments], text=True).strip()

if git("status", "--porcelain", "--untracked-files=no"):
    parser.error("upstream checkout has tracked modifications")
tag = git("describe", "--tags", "--exact-match")
match = re.fullmatch(r"v(\d+)\.(\d+)\.(\d+)", tag)
if not match or tuple(map(int, match.groups())) < (9, 2, 1):
    parser.error("select a stable release tag at least v9.2.1")
commit = git("rev-parse", "HEAD")
version = tag[1:]
version_header = (upstream / "include/simdutf/simdutf_version.h").read_text()
if f'#define SIMDUTF_VERSION "{version}"' not in version_header:
    parser.error("release tag does not match the source version")
destination = root / "src/utils/simdutf"
with tempfile.TemporaryDirectory(prefix="update-simdutf-") as temporary:
    subprocess.run([sys.executable, str(upstream / "singleheader/amalgamate.py"),
                    "--source-dir", str(upstream / "src"),
                    "--include-dir", str(upstream / "include"),
                    "--output-dir", temporary, "--no-zip", "--no-readme",
                    "--with-utf8", "--with-utf16", "--with-utf32", "--with-base64",
                    "--with-ascii", "--with-latin1"], check=True, cwd=upstream)
    destination.mkdir(parents=True, exist_ok=True)
    for name in ("simdutf.h", "simdutf.cpp"):
        shutil.copyfile(Path(temporary) / name, destination / name)
notice = (upstream / "include/simdutf/internal/isadetection.h").read_text()
notice = notice[notice.index("/* From") + 3:notice.index("*/")].strip()
license_text = (upstream / "LICENSE-MIT").read_text()
(root / "src/java.base/share/legal/simdutf.md").write_text(
    f"## simdutf v{version}\n\n### Notice\n\n"
    "simdutf is distributed under the MIT license. Its ISA detector includes\n"
    "code under the BSD 3-Clause license reproduced below.\n\n"
    f"### MIT License\n\n```\n{license_text}```\n\n"
    f"### ISA detector notice and BSD 3-Clause license\n\n```\n{notice}\n```\n")
(destination / "UPSTREAM").write_text(
    f"Repository: https://github.com/simdutf/simdutf\nRelease: {tag}\nCommit: {commit}\n"
    "License: MIT (ISA detector: BSD 3-Clause)\n"
    "Features: UTF-8, UTF-16, UTF-32, Latin-1, ASCII, Base64\n"
    "Local source changes: none\n"
    "Update: python3 make/scripts/update-simdutf.py /path/to/clean/release/checkout\n")
print(f"Updated simdutf to {tag} ({commit})")
