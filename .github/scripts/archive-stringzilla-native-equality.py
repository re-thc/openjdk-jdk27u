#!/usr/bin/env python3
#
# Copyright (c) 2026, re-thc. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
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
"""Archive completed native experiment evidence without rerunning it."""
import csv
import hashlib
import json
import math
from pathlib import Path
import shutil
import statistics
import subprocess
import tempfile

ROOT = Path.cwd()
DEST = ROOT / "doc/stringzilla/measurements/serial-equality-investigation"
DEST.mkdir(parents=True, exist_ok=True)
RUNS = {"first": 39055555124, "refined": 39056589977}
receipts = []
for campaign, run_id in RUNS.items():
    run = json.loads(subprocess.check_output(
        ["gh", "api", f"repos/re-thc/openjdk-jdk27u/actions/runs/{run_id}"], text=True))
    if run["status"] != "completed" or run["conclusion"] != "success":
        raise SystemExit(f"Native run {run_id} did not pass")
    artifacts = json.loads(subprocess.check_output(
        ["gh", "api", f"repos/re-thc/openjdk-jdk27u/actions/runs/{run_id}/artifacts?per_page=20"], text=True))
    (DEST / f"{campaign}-run.json").write_text(json.dumps(run, indent=2) + "\n")
    (DEST / f"{campaign}-artifacts.json").write_text(json.dumps(artifacts, indent=2) + "\n")
    with tempfile.TemporaryDirectory() as temp:
        subprocess.run(["gh", "run", "download", str(run_id), "--repo", "re-thc/openjdk-jdk27u", "--dir", temp], check=True)
        roots = list(Path(temp).rglob("metadata.json"))
        if len(roots) != 4:
            raise SystemExit(f"Expected four native configurations for {campaign}; got {len(roots)}")
        for metadata_file in sorted(roots):
            source = metadata_file.parent
            metadata = json.loads(metadata_file.read_text())
            compiler = "clang" if "clang" in metadata["compiler"].lower() else "gcc-16"
            target = DEST / campaign / metadata["architecture"] / compiler
            if target.exists():
                raise SystemExit(f"Repeated native configuration: {target}")
            hashes = json.loads((source / "sha256.json").read_text())
            for relative, digest in hashes.items():
                if hashlib.sha256((source / relative).read_bytes()).hexdigest() != digest:
                    raise SystemExit(f"Producer hash mismatch: {campaign}/{relative}")
            raw = list(csv.DictReader((source / "raw.csv").open()))
            variants = ("current", "patched") if campaign == "first" else ("current", "word", "patched", "probe")
            rounds = 10 if campaign == "first" else 12
            if len(raw) != 464 * len(variants) * rounds:
                raise SystemExit("Incomplete native raw sample count")
            grouped = {}
            for row in raw:
                key = (int(row["case"]), row["variant"])
                grouped.setdefault(key, []).append(float(row["ns_per_op"]))
            if len(grouped) != 464 * len(variants) or any(len(v) != rounds for v in grouped.values()):
                raise SystemExit("Incomplete paired native configuration")
            summary = json.loads((source / "summary.json").read_text())
            if len(summary) != 464:
                raise SystemExit("Incomplete native mean table")
            for row in summary:
                for variant in variants:
                    mean = statistics.mean(grouped[(row["case"], variant)])
                    recorded = row[variant + "_ns"] if campaign == "first" else row["means_ns"][variant]
                    if not math.isclose(mean, recorded, rel_tol=1e-12, abs_tol=1e-12):
                        raise SystemExit("Native mean differs from raw samples")
            target.mkdir(parents=True)
            for name in ("raw.csv", "summary.json", "metadata.json", "sha256.json", "wrapper.c", "unit.c", "driver.c",
                         "compiler.txt", "compiler-target-flags.log", "source-blobs.txt", "cpu.txt", "host.txt",
                         "jni-header-sha256.txt", "fixture-sanitizer-run.log", "patch-application.log",
                         "benchmark-build.log", "fixture-build.log"):
                if (source / name).exists():
                    shutil.copy2(source / name, target / name)
            for variant in variants:
                for name in ("optimized.s", "vendor/stringzilla/compare/serial.h"):
                    output = target / variant / name
                    output.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copy2(source / variant / name, output)
                for suffix in ("contract-build.log", "contract-run.log", "optimized-build.log", "sanitized-build.log"):
                    name = variant + "-" + suffix
                    shutil.copy2(source / name, target / name)
            higher = {}
            for variant in variants[1:]:
                higher[variant] = sum(
                    row["slower"] if campaign == "first" else row["higher_than_current"][variant]
                    for row in summary)
            receipt = {"campaign": campaign, "run_id": run_id, "run_url": run["html_url"],
                       "source_commit": metadata["experiment_commit"], "compiler": metadata["compiler"],
                       "architecture": metadata["architecture"], "cases": 464, "rounds": rounds,
                       "variants": list(variants), "samples": len(raw), "higher_means": higher,
                       "files": str(target.relative_to(DEST))}
            receipts.append(receipt)
            print("ARCHIVED_NATIVE_EQUALITY " + json.dumps(receipt), flush=True)
(DEST / "receipt.json").write_text(json.dumps({
    "scope": "Native serial primitive investigation; not whole-image Java/JIT benchmarks",
    "decision": "Do not apply an unconditional serial-word equality patch",
    "reason": "GCC 16 already vectorizes congruently aligned byte loops; word proposals regress those wins and some short inputs",
    "production_base": "da3ae24b030d8c9c0694bbb5b33412f76c27780c",
    "production_kernel_blob": "993fd1957118b4d45dee801a1977c15c3d982570",
    "configurations": receipts,
    "total_native_timed_samples": sum(row["samples"] for row in receipts),
    "validation": "All variants passed native kernel contract tests and exact-size unaligned equality fixtures under ASan/UBSan/alignment"
}, indent=2) + "\n")
manifest = {str(p.relative_to(DEST)): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in sorted(DEST.rglob("*")) if p.is_file()}
(DEST / "archive-sha256.json").write_text(json.dumps(manifest, indent=2) + "\n")
