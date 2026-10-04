#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

"""Compare a pristine baseline JDK with a simdutf-enabled JDK, sequentially."""
import argparse
import json
from pathlib import Path
import shlex
import subprocess

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--baseline", required=True, type=Path)
parser.add_argument("--enabled", required=True, type=Path)
parser.add_argument("--classpath", required=True)
parser.add_argument("--output", required=True, type=Path)
parser.add_argument("--tiers", default="c2,c1,interpreter")
parser.add_argument("--sizes", default="32,4096,65536")
parser.add_argument("--filter", default="org.openjdk.bench.java.lang.SimdUTF.*")
parser.add_argument("--forks", default="2")
parser.add_argument("--warmup", default="2")
parser.add_argument("--measurements", default="3")
parser.add_argument("--time", default="300ms")
parser.add_argument("--jvm-args", default="-XX:+UseSerialGC -XX:ActiveProcessorCount=1 -XX:CICompilerCount=2",
                    help="additional VM arguments, applied equally to both JDKs and the JMH driver")
parser.add_argument("--resume", action="store_true", help="reuse completed results for unchanged JDKs and parameters")
args = parser.parse_args()
args.output.mkdir(parents=True, exist_ok=True)
tiers = {"interpreter": "-Xint", "c1": "-XX:TieredStopAtLevel=1",
         "c2": "-XX:-TieredCompilation"}
for tier in args.tiers.split(","):
    for label, jdk in (("baseline", args.baseline), ("enabled", args.enabled)):
        flags = tiers[tier] + " -Xms512m -Xmx512m " + args.jvm_args
        if label == "enabled":
            flags += " -XX:+UseSIMDUTFIntrinsics"
        target = args.output / f"{tier}-{label}"
        if args.resume and target.with_suffix(".json").is_file():
            with target.with_suffix(".json").open() as previous:
                results = json.load(previous)
            if (results and {r["params"]["size"] for r in results} == set(args.sizes.split(","))
                    and all(r["forks"] == int(args.forks)
                            and r["jvmArgs"] == shlex.split(flags)
                            and r["warmupIterations"] == int(args.warmup)
                            and r["measurementIterations"] == int(args.measurements)
                            for r in results)):
                print(f"Reusing {tier} {label}", flush=True)
                continue
        print(f"Running {tier} {label}: {jdk}", flush=True)
        command = [str(args.enabled.resolve() / "bin/java"), *shlex.split(args.jvm_args),
                   "-cp", args.classpath,
                   "org.openjdk.jmh.Main", args.filter, "-jvm", str(jdk.resolve() / "bin/java"),
                   "-jvmArgs", flags, "-p", "size=" + args.sizes, "-f", args.forks,
                   "-wi", args.warmup, "-i", args.measurements,
                   "-w", args.time, "-r", args.time,
                   "-foe", "true", "-rf", "json", "-rff", str(target.with_suffix(".json"))]
        with target.with_suffix(".log").open("w") as log:
            subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
        print(f"Finished {tier} {label}", flush=True)
