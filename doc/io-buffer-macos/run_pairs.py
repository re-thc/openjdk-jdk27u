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

"""Small local A/B runner. No dependencies; raw output retained per JVM."""
import argparse
import json
import pathlib
import subprocess
import time

ROOT = pathlib.Path(__file__).resolve().parents[2]
OUT = ROOT / "build/io-20261030"
OUT.mkdir(parents=True, exist_ok=True)
JDK = {
    "A": ROOT / "build/io-20261030/baseline-src/build/io-baseline/jdk",
    "B": ROOT / "build/io-candidate/jdk",
}

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--label", required=True)
    p.add_argument("--pairs", type=int, default=8)
    p.add_argument("--warmups", type=int, default=5)
    p.add_argument("--samples", type=int, default=5)
    p.add_argument("--case", action="append", help="kind:size:quota:thread[:ops]")
    p.add_argument("--vm-option", action="append", default=[])
    p.add_argument("--a-option", action="append", default=[])
    p.add_argument("--b-option", action="append", default=[])
    p.add_argument("--candidate", type=pathlib.Path)
    p.add_argument("--baseline", type=pathlib.Path)
    p.add_argument("--classes", type=pathlib.Path, default=OUT / "classes-extended")
    args = p.parse_args()
    if args.candidate: JDK["B"] = args.candidate.resolve()
    if args.baseline: JDK["A"] = args.baseline.resolve()
    cases = args.case or [
        f"{kind}:{size}:{quota}:platform"
        for kind, size in [("socket", 7), ("socket", 8192), ("socket", 65536),
                           ("socket", 1048576), ("empty", 8192), ("arbitrary", 7),
                           ("arbitrary", 8192)]
        for quota in (["available", "exhausted"] if kind != "arbitrary" else ["available"])
    ]
    logdir = OUT / args.label
    logdir.mkdir()  # Refuse an existing label; keep paired samples unambiguous.
    with (logdir / "raw.jsonl").open("a") as raw:
        for pair in range(args.pairs):
            # Rotate cases and reverse alternating rounds to spread time effects.
            ordered = cases[pair % len(cases):] + cases[:pair % len(cases)]
            if pair % 2: ordered.reverse()
            for case in ordered:
                fields = case.split(":")
                kind, size, quota, thread = fields[:4]
                size = int(size)
                ops = int(fields[4]) if len(fields) > 4 else (
                    100000 if kind == "empty" else max(300, min(60000, (64 << 20) // max(1, size))))
                for variant in (["A", "B"] if pair % 2 == 0 else ["B", "A"]):
                    stem = logdir / f"{pair:02}-{case.replace(':', '-')}-{variant}"
                    command = [str(JDK[variant] / "bin/java"), "-Xms256m", "-Xmx256m",
                               "-Xshare:off", "-XX:MaxDirectMemorySize=1m",
                               "-Djdk.virtualThreadScheduler.parallelism=2",
                               "--add-exports=java.base/jdk.internal.access=ALL-UNNAMED",
                               "-Dbench.results=" + str(stem.with_suffix(".metrics")),
                               *args.vm_option, *(args.a_option if variant == "A" else args.b_option),
                               "-cp", str(args.classes.resolve()),
                               "SocketFileBench", kind, str(size), quota, str(ops),
                               str(args.warmups), str(args.samples), thread]
                    started = time.time()
                    with stem.with_suffix(".out").open("w") as stdout, stem.with_suffix(".err").open("w") as stderr:
                        subprocess.run(command, cwd=ROOT, stdout=stdout, stderr=stderr,
                                       check=True, timeout=180)
                    metric_file = stem.with_suffix(".metrics")
                    if not metric_file.exists(): metric_file = stem.with_suffix(".out")
                    rows = [json.loads(s) for s in metric_file.read_text().splitlines() if s.startswith("{")]
                    if len(rows) != args.samples: raise RuntimeError(f"missing samples: {stem}")
                    for row in rows:
                        row.update(pair=pair, variant=variant, case=case, started=started,
                                   command=command)
                        raw.write(json.dumps(row) + "\n")
                    raw.flush()
                print(f"{args.label} pair {pair + 1}/{args.pairs}: {case}", flush=True)

if __name__ == "__main__": main()
