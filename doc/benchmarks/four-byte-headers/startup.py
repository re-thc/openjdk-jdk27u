# Copyright (c) 2026, Harry Chan. All rights reserved.
# This file is available under the GNU General Public License version 2.
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
    writer = csv.writer(output)
    writer.writerow(["layout", "gc", "round", "elapsed_ns"])
    for iteration in range(-5, 50):
        rng.shuffle(configurations)
        for layout, gc in configurations:
            jdk = baseline if layout == "baseline8" else candidate
            args = [jdk + "/bin/java", "-Xshare:on", "-Xms32m", "-Xmx32m",
                    "-XX:ActiveProcessorCount=4", "-XX:+Use" + gc + "GC"]
            if layout == "legacy12":
                args += ["-XX:-UseCompactObjectHeaders"]
            if layout == "four4":
                args += ["-XX:+UnlockExperimentalVMOptions", "-XX:+UseFourByteObjectHeaders"]
            start = time.perf_counter_ns()
            result = subprocess.run(args + ["-version"], stdout=subprocess.DEVNULL,
                                    stderr=subprocess.PIPE, check=True)
            elapsed = time.perf_counter_ns() - start
            if b"sharing" not in result.stderr:
                raise RuntimeError("Matching CDS archive was not used: " + layout + "/" + gc)
            if iteration >= 0:
                writer.writerow([layout, gc, iteration, elapsed])
                output.flush()
