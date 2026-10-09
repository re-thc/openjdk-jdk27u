#
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
"""Interleave fresh JVM startup measurements; require each matching CDS archive."""
import csv
import random
import subprocess
import sys
import time

baseline, candidate, destination = sys.argv[1:]
configurations = [(layout, gc) for layout in ("baseline8", "default8", "legacy12", "four4")
                  for gc in ("Serial", "G1", "Z")]
rng = random.Random(8347710)
with open(destination, "w", newline="") as output:
    writer = csv.writer(output, lineterminator="\n")
    writer.writerow(["layout", "gc", "round", "elapsed_ns"])
    for iteration in range(-5, 50):
        rng.shuffle(configurations)
        for layout, gc in configurations:
            jdk = baseline if layout == "baseline8" else candidate
            args = [jdk + "/bin/java", "-Xshare:on", "-Xms32m", "-Xmx32m",
                    "-XX:ActiveProcessorCount=4", "-XX:+Use" + gc + "GC"]
            if layout == "default8":
                args += ["-XX:-UseFourByteObjectHeaders"]
            if layout == "legacy12":
                args += ["-XX:-UseCompactObjectHeaders"]
            if layout == "four4":
                args += ["-XX:+UseFourByteObjectHeaders"]
            start = time.perf_counter_ns()
            result = subprocess.run(args + ["-version"], stdout=subprocess.DEVNULL,
                                    stderr=subprocess.PIPE, check=True)
            elapsed = time.perf_counter_ns() - start
            if b"sharing" not in result.stderr:
                raise RuntimeError("Matching CDS archive was not used: " + layout + "/" + gc)
            if iteration >= 0:
                writer.writerow([layout, gc, iteration, elapsed])
                output.flush()
