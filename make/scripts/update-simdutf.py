#!/usr/bin/env python3
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
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.

"""Regenerate the vendored simdutf from an unmodified upstream release checkout."""
import argparse
import hashlib
import os
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
patch = root / "make/data/simdutf/base64-no-whitespace.patch"
with tempfile.TemporaryDirectory(prefix="update-simdutf-") as temporary:
    patched = Path(temporary) / "source"
    subprocess.run(["git", "clone", "--quiet", "--shared", "--no-checkout",
                    str(upstream), str(patched)], check=True)
    subprocess.run(["git", "checkout", "--quiet", "--detach", commit], cwd=patched, check=True)
    subprocess.run(["git", "apply", "--check", str(patch)], cwd=patched, check=True)
    subprocess.run(["git", "apply", str(patch)], cwd=patched, check=True)
    environment = os.environ.copy()
    for name in ("AMALGAMATE_SOURCE_PATH", "AMALGAMATE_INCLUDE_PATH", "AMALGAMATE_OUTPUT_PATH"):
        environment.pop(name, None)
    subprocess.run([sys.executable, str(patched / "singleheader/amalgamate.py"),
                    "--source-dir", str(patched / "src"),
                    "--include-dir", str(patched / "include"),
                    "--output-dir", temporary, "--no-zip", "--no-readme",
                    "--with-utf8", "--with-utf16", "--with-utf32", "--with-base64",
                    "--with-ascii", "--with-latin1"], check=True, cwd=patched, env=environment)
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
checksums = "".join(
    f"SHA-256 ({name}): {hashlib.sha256((destination / name).read_bytes()).hexdigest()}\n"
    for name in ("simdutf.h", "simdutf.cpp"))
(destination / "UPDATING.txt").write_text(
    f"Repository: https://github.com/simdutf/simdutf\nRelease: {tag}\nCommit: {commit}\n"
    "Features: UTF-8, UTF-16, UTF-32, Latin-1, ASCII, Base64\n"
    "Local source changes: decode-only basic/URL no-whitespace options\n"
    "Patch: make/data/simdutf/base64-no-whitespace.patch (includes upstream tests)\n"
    f"SHA-256 (patch): {hashlib.sha256(patch.read_bytes()).hexdigest()}\n"
    f"{checksums}"
    "Update: python3 make/scripts/update-simdutf.py /path/to/clean/release/checkout\n")
print(f"Updated simdutf to {tag} ({commit})")
