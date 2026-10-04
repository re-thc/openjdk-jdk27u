#!/usr/bin/env python3
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.

"""Refresh the vendored headers from an unmodified upstream release checkout."""
import argparse
from pathlib import Path
import shutil
import re
import subprocess
import tempfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("upstream", type=Path, help="clean checkout of fastfloat/fast_float at a release tag")
args = parser.parse_args()
upstream = args.upstream.resolve()
root = Path(__file__).resolve().parents[2]

def git(*argv):
    return subprocess.check_output(["git", "-C", str(upstream), *argv], text=True).strip()

version = git("describe", "--tags", "--exact-match", "HEAD")
release = re.fullmatch(r"v([0-9]+)\.([0-9]+)\.([0-9]+)", version)
if not release or tuple(map(int, release.groups())) < (8, 3, 0):
    raise SystemExit("The vendor checkout must be a release tag at least v8.3.0")
commit = git("rev-parse", "HEAD")
if git("status", "--porcelain", "--untracked-files=all", "--", "include/fast_float", "LICENSE-MIT"):
    raise SystemExit("The upstream headers and MIT license must be unmodified, without untracked files")
headers = sorted((upstream / "include/fast_float").glob("*.h"))
if not headers:
    raise SystemExit("No fast_float headers in the upstream checkout")
with tempfile.TemporaryDirectory() as tmp:
    staged = Path(tmp)
    for header in headers:
        shutil.copyfile(header, staged / header.name)
    subprocess.run(["patch", "--batch", "--forward", "--fuzz=0", "-p1", "-i", str(root / "make/data/fast_float/layout.patch")], cwd=staged, check=True)
    destination = root / "src/hotspot/share/utilities/fast_float"
    for old in destination.glob("*.h"):
        if not (staged / old.name).exists():
            old.unlink()
    for header in staged.glob("*.h"):
        shutil.copyfile(header, destination / header.name)
license_text = (upstream / "LICENSE-MIT").read_text()
(root / "src/java.base/share/legal/fast_float.md").write_text(
    f"## fast_float {version}\n\n### fast_float License\n\n"
    "The fast_float library is used under the MIT license.\n\n```\n" + license_text + "```\n")
(root / "make/data/fast_float/version.txt").write_text(f"{version}\n{commit}\n")
print(f"Vendored {version} ({commit}); run the parsing tests and tier benchmarks before committing.")
