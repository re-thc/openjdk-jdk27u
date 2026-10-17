#!/usr/bin/env python3
#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
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
#

"""Refresh the bundled regex crates, lockfile, checksums and MIT notices."""
import argparse
import datetime
import json
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import urllib.request

INDEX = "https://index.crates.io/re/ge/regex"
ROOT = Path(__file__).resolve().parents[2]
BASE = ROOT / "src/hotspot/share/runtime/rustregex"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", help="select a non-yanked version instead of the latest stable")
    parser.add_argument("--check", action="store_true", help="verify the current version without changing files")
    args = parser.parse_args()
    with urllib.request.urlopen(INDEX) as response:
        releases = [json.loads(line) for line in response.read().decode().splitlines()]
    stable = [r for r in releases if not r["yanked"] and "-" not in r["vers"]]
    latest = max(stable, key=lambda r: tuple(map(int, r["vers"].split("."))))
    selected = next((r for r in stable if r["vers"] == args.version), None) if args.version else latest
    if selected is None:
        parser.error("requested version is unavailable, prerelease, or yanked")
    manifest = (BASE / "Cargo.toml").read_text()
    current = re.search(r'^regex = "=([^"]+)"', manifest, re.M).group(1)
    print(f"Bundled regex {current}; latest stable {latest['vers']} (live index)")
    if args.check:
        raise SystemExit(0 if current == latest["vers"] else 1)
    manifest = re.sub(r'^regex = "=[^"]+"', f'regex = "={selected["vers"]}"', manifest, flags=re.M)
    # Resolve outside the checkout so its offline vendor configuration does not
    # prevent downloading new crates. Do not touch checked-in files on failure.
    with tempfile.TemporaryDirectory(prefix="jdk-regex-update-") as tmp:
        stage = Path(tmp)
        (stage / "Cargo.toml").write_text(manifest)
        (stage / "adapter.rs").write_text("")
        subprocess.run(["cargo", "generate-lockfile"], cwd=stage, check=True)
        subprocess.run(["cargo", "vendor", "--locked", "vendor"], cwd=stage, check=True, stdout=subprocess.DEVNULL)
        crates = []
        # Cargo.lock is TOML. Parse just registry package records, avoiding a
        # Python version requirement for tomllib.
        for package in (stage / "Cargo.lock").read_text().split("[[package]]")[1:]:
            name = re.search(r'^name = "([^"]+)"', package, re.M).group(1)
            version = re.search(r'^version = "([^"]+)"', package, re.M).group(1)
            if name != "jdk-rust-regex":
                crates.append((name, version))
        legal_path = ROOT / "src/java.base/share/legal/rust_regex.md"
        rust_std = legal_path.read_text().split("## Rust standard library", 1)[1]
        legal = "# Rust regex and dependencies\n\nThe bundled crates are used under their MIT license option.\n\n"
        for name, version in sorted(crates):
            license_file = stage / "vendor" / name / "LICENSE-MIT"
            legal += f"## {name} {version}\n\nUpstream: https://crates.io/crates/{name}/{version}\n\n```\n"
            legal += license_file.read_text().rstrip() + "\n```\n\n"
        (BASE / "Cargo.toml").write_text(manifest)
        shutil.copyfile(stage / "Cargo.lock", BASE / "Cargo.lock")
        shutil.rmtree(BASE / "vendor")
        shutil.copytree(stage / "vendor", BASE / "vendor")
        legal_path.write_text(legal + "## Rust standard library" + rust_std)
    evidence = {"index": INDEX, "verified_at": datetime.datetime.now(datetime.timezone.utc).isoformat(),
                "latest_stable": latest["vers"], "selected": selected["vers"],
                "published_at": selected.get("pubtime"), "crate_sha256": selected["cksum"]}
    (BASE / "UPSTREAM.json").write_text(json.dumps(evidence, indent=2) + "\n")
    print("Updated vendor sources, Cargo.lock, MIT notices, and release evidence. Run the tests in doc/rust-regex.md.")


if __name__ == "__main__":
    main()
