# Copyright (c) 2026, Harry Chan. All rights reserved.
# This file is available under the GNU General Public License version 2.
"""Summarize raw measurements; performance comparisons use independent fork means.

Usage: python3 summarize.py RESULTS_DIR
Requires scipy for Welch confidence intervals.
"""
import csv
import json
import math
from pathlib import Path
import statistics as stats
import sys

from scipy.stats import t

root = Path(sys.argv[1])
layouts = ("baseline8", "default8", "legacy12", "four4")
collectors = ("Serial", "G1", "Z")

for pattern, expected in (("memory-*.json", 12), ("footprint-*.json", 12),
                          ("jmh-*.json", 12), ("perf-*.json", 36)):
    files = list(root.glob(pattern))
    if files and len(files) != expected:
        raise ValueError(f"Incomplete {pattern} matrix: {len(files)} of {expected} files")


def read(name):
    path = root / name
    return json.loads(path.read_text()) if path.exists() else None


def comparison(baseline, candidate):
    """95% Welch interval for the ratio of geometric means of fork means."""
    a, b = [math.log(x) for x in baseline], [math.log(x) for x in candidate]
    va, vb = stats.variance(a) / len(a), stats.variance(b) / len(b)
    delta = stats.mean(b) - stats.mean(a)
    if va + vb == 0:
        margin = 0
    else:
        df = (va + vb) ** 2 / (va ** 2 / (len(a) - 1) + vb ** 2 / (len(b) - 1))
        margin = t.ppf(0.975, df) * math.sqrt(va + vb)
    return [(math.exp(x) - 1) * 100 for x in (delta, delta - margin, delta + margin)]


def write(name, header, rows):
    with (root / name).open("w", newline="") as stream:
        writer = csv.writer(stream)
        writer.writerow(header)
        writer.writerows(rows)


memory, footprint, timing, micro, startup = [], [], [], [], []
for gc in collectors:
    for layout in layouts:
        data = read(f"memory-{layout}-{gc}.json")
        if data:
            for name, item in data["data"].items():
                samples = item["results"]
                memory.append([gc, layout, name, len(samples),
                               stats.median(x["retained_heap_after_bytes"] for x in samples),
                               stats.median(x["rss_after_bytes"] for x in samples),
                               stats.median(x["non_heap_after_bytes"] for x in samples)])
        data = read(f"footprint-{layout}-{gc}.json")
        if data:
            footprint.append([gc, layout, data["objects"], data["unhashed_graph_bytes"],
                              data["hashed_after_gc_graph_bytes"], data["unhashed_cell_bytes"],
                              data["hashed_cell_bytes"]])
    for name in ("scrabble", "scala-doku"):
        forks = {}
        for layout in layouts:
            values = []
            for fork in (1, 2, 3):
                data = read(f"perf-{layout}-{gc}-{fork}.json")
                if data:
                    samples = data["data"][name]["results"]
                    if len(samples) != 10:
                        raise ValueError("Expected ten validated operations per fork")
                    values.append(stats.mean(x["duration_ns"] for x in samples[5:]) / 1e6)
            if len(values) == 3:
                forks[layout] = values
        if "baseline8" in forks:
            for layout, values in forks.items():
                change = [0, 0, 0] if layout == "baseline8" else comparison(forks["baseline8"], values)
                timing.append([gc, name, layout, len(values), stats.mean(values), *change])
    benchmarks = {}
    for layout in layouts:
        data = read(f"jmh-{layout}-{gc}.json")
        if data is not None:
            expected = {"allocate", "firstHash", "storedHash", "identityMapLookup", "identityMapChurn"}
            actual = {item["benchmark"].rsplit(".", 1)[1] for item in data}
            if actual != expected:
                raise ValueError(f"Incomplete JMH benchmarks for {layout}/{gc}: {actual}")
            for item in data:
                forks = item["primaryMetric"]["rawData"]
                if len(forks) != 3 or any(len(fork) != 5 for fork in forks):
                    raise ValueError(f"Incomplete JMH forks for {item['benchmark']}/{layout}/{gc}")
            benchmarks[layout] = {item["benchmark"].rsplit(".", 1)[1]: item for item in data}
    if "baseline8" in benchmarks:
        for name, base in benchmarks["baseline8"].items():
            a = [stats.mean(fork) for fork in base["primaryMetric"]["rawData"]]
            for layout, items in benchmarks.items():
                item = items[name]
                metric = item["primaryMetric"]
                b = [stats.mean(fork) for fork in metric["rawData"]]
                change = [0, 0, 0] if layout == "baseline8" else comparison(a, b)
                allocation = item["secondaryMetrics"].get("gc.alloc.rate.norm", {}).get("score", "")
                micro.append([gc, name, layout, len(b), metric["score"], metric["scoreError"],
                              allocation, *change])

path = root / "startup.csv"
if path.exists():
    samples = {}
    with path.open() as stream:
        for row in csv.DictReader(stream):
            samples.setdefault((row["gc"], row["layout"]), []).append(int(row["elapsed_ns"]) / 1e6)
    for (gc, layout), values in samples.items():
        p95 = sorted(values)[math.ceil(len(values) * 0.95) - 1]
        startup.append([gc, layout, len(values), stats.median(values), p95])

write("memory-summary.csv", ["gc", "layout", "workload", "operations", "post_gc_heap_bytes", "rss_bytes", "non_heap_bytes"], memory)
write("footprint-summary.csv", ["gc", "layout", "objects", "unhashed_graph_bytes", "hashed_graph_bytes", "unhashed_cell_bytes", "hashed_cell_bytes"], footprint)
write("renaissance-summary.csv", ["gc", "workload", "layout", "forks", "mean_ms", "change_percent", "change_95ci_low", "change_95ci_high"], timing)
write("jmh-summary.csv", ["gc", "benchmark", "layout", "forks", "mean_ns", "jmh_99_9ci_error_ns", "bytes_per_op", "change_percent", "change_95ci_low", "change_95ci_high"], micro)
write("startup-summary.csv", ["gc", "layout", "forks", "median_ms", "p95_ms"], startup)
print("Rows:", "memory", len(memory), "footprint", len(footprint), "renaissance", len(timing),
      "JMH", len(micro), "startup", len(startup))
