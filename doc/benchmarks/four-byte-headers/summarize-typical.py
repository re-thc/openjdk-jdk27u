#!/usr/bin/env python3
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
"""Summarize complete independent-fork database and Spring measurements."""
import argparse
import csv
import json
import math
from pathlib import Path
import statistics as stats

from scipy.stats import t


def comparison(baseline, candidate):
    a, b = [math.log(x) for x in baseline], [math.log(x) for x in candidate]
    va, vb = stats.variance(a) / len(a), stats.variance(b) / len(b)
    delta = stats.mean(b) - stats.mean(a)
    if va + vb:
        df = (va + vb) ** 2 / (va ** 2 / (len(a) - 1) + vb ** 2 / (len(b) - 1))
        margin = t.ppf(.975, df) * math.sqrt(va + vb)
    else:
        margin = 0
    return [(math.exp(x) - 1) * 100 for x in (delta, delta - margin, delta + margin)]


def summarize(args):
    root = args.results
    layouts = ["baseline8", "default4"]
    rows = []

    def emit(workload, metric, unit, values, higher_better=False):
        baseline = values["baseline8"]
        candidate = values["default4"]
        delta, low, high = comparison(baseline, candidate)
        rows.append([workload, metric, unit, len(baseline),
                     stats.mean(baseline), stats.mean(candidate), delta, low, high,
                     "higher" if higher_better else "lower"])

    timings = {}
    heap, rss = {}, {}
    for layout in layouts:
        timings[layout] = []
        for fork in range(1, args.database_forks + 1):
            data = json.loads((root / f"db-timing-{layout}-{args.gc}-{fork}.json").read_text())
            assert data["data"]["db-shootout"]["termination"] == "normal"
            samples = data["data"]["db-shootout"]["results"]
            assert len(samples) == args.database_repeats
            timings[layout].append(stats.mean(x["duration_ns"] / 1e6
                                              for x in samples[len(samples) // 2:]))
        heap[layout], rss[layout] = [], []
        for fork in range(1, args.memory_forks + 1):
            data = json.loads((root / f"db-memory-{layout}-{args.gc}-{fork}.json").read_text())
            assert data["data"]["db-shootout"]["termination"] == "normal"
            samples = data["data"]["db-shootout"]["results"]
            assert len(samples) == 3
            heap[layout].append(stats.median(x["retained_heap_after_bytes"] for x in samples) / 2**20)
            rss[layout].append(stats.median(x["rss_after_bytes"] for x in samples) / 2**20)
    emit("db-shootout", "duration", "ms", timings)
    emit("db-shootout", "post-GC heap", "MiB", heap)
    emit("db-shootout", "post-GC RSS", "MiB", rss)

    spring = {}
    for layout in layouts:
        spring[layout] = []
        for fork in range(1, args.spring_forks + 1):
            data = json.loads((root / f"petclinic-{layout}-{args.gc}-{fork}.json").read_text())
            assert data["layout"] == layout and data["fork"] == fork
            assert data["errors"] == 0 and data["requests"] > 0
            assert not data.get("profiled", False), "Profiled runs are diagnostic only"
            assert data["four_byte_headers"] == (layout == "default4")
            assert set(data["endpoint_counts"]) == {"0", "1", "2"}
            assert data["busy_heap_samples_bytes"]
            spring[layout].append(data)
    for field, label, unit, divisor, higher in [
        ("requests_per_second", "throughput", "requests/s", 1, True),
        ("latency_p50_ms", "p50 latency", "ms", 1, False),
        ("latency_p95_ms", "p95 latency", "ms", 1, False),
        ("latency_p99_ms", "p99 latency", "ms", 1, False),
        ("post_gc_heap_bytes", "post-GC heap", "MiB", 2**20, False),
        ("rss_after_bytes", "RSS after load", "MiB", 2**20, False),
        ("post_gc_rss_bytes", "post-GC RSS", "MiB", 2**20, False),
        ("ready_seconds", "ready startup", "seconds", 1, False),
    ]:
        values = {layout: [x[field] / divisor for x in spring[layout]] for layout in layouts}
        emit("Spring Petclinic", label, unit, values, higher)
    busy = {layout: [stats.mean(x["busy_heap_samples_bytes"]) / 2**20
                      for x in spring[layout]] for layout in layouts}
    emit("Spring Petclinic", "busy heap", "MiB", busy)
    with (root / "typical-summary.csv").open("w", newline="") as out:
        writer = csv.writer(out, lineterminator="\n")
        writer.writerow(["workload", "metric", "unit", "forks", "baseline8", "default4",
                         "change_percent", "change_95ci_low", "change_95ci_high", "better"])
        writer.writerows(rows)
    print("| Workload | Metric | Original 8 bytes | Fork default 4 bytes | Change (95% interval) |")
    print("| --- | --- | ---: | ---: | ---: |")
    for workload, metric, unit, forks, old, new, delta, low, high, better in rows:
        print(f"| {workload} | {metric} ({unit}) | {old:.2f} | {new:.2f} | {delta:+.1f}% [{low:+.1f}, {high:+.1f}] |")
    requests = sum(x["requests"] for measurements in spring.values() for x in measurements)
    print(f"\nValidated measured HTTP responses: {requests:,}; errors: zero.")
    driver = max(x["load_driver_cpu_seconds"] / x["seconds"] for v in spring.values() for x in v)
    print(f"Maximum load-driver CPU use: {driver:.2f} CPU cores.")
    print("Database benchmark uses its upstream dummy validator; normal termination does not establish result correctness.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("results", type=Path)
    parser.add_argument("--gc", default="default")
    parser.add_argument("--database-forks", type=int, default=12)
    parser.add_argument("--database-repeats", type=int, default=16)
    parser.add_argument("--memory-forks", type=int, default=3)
    parser.add_argument("--spring-forks", type=int, default=6)
    summarize(parser.parse_args())
