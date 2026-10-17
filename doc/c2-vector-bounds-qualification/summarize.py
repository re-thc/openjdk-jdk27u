#!/usr/bin/env python3
"""Offline paired-fork analysis. No new JVM or workload is ever launched."""
import argparse
import itertools
import json
import math
from pathlib import Path
import random
import re
import statistics
import xml.etree.ElementTree as ET
from matrix import verify_receipt
from deadline import Budget
from compiler_cost import parse_log, compiler_screen

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; analysis preconditions are required")


def interval(log_ratios):
    rng = random.Random(20261017)
    n = len(log_ratios)
    draws = sorted(statistics.mean(rng.choices(log_ratios, k=n)) for _ in range(20000))
    return [100 * math.expm1(draws[i]) for i in (499, 19499)]


def c2_evidence(root, task):
    text = (root / (task["name"] + ".log")).read_text()
    clock = re.search(r"qualification-iteration=6 uptime-ms=(\d+)", text)
    if not clock:
        return {"needs_review": "first measured iteration clock missing"}
    start = int(clock[1]) / 1000
    names = (["dev.jzstd.internal.WindowBuffer executeSequencesDirect "]
             if task["method"].startswith("decompress") else
             ["qualification.BoundsQualification " + task["method"] + " "])
    found = []
    for path in root.glob(task["name"] + "-*.xml"):
        xml = path.read_text()
        for tag in re.findall(r"<nmethod\b[^>]*?/>", xml):
            a = ET.fromstring(tag).attrib
            if (a.get("compiler") == "c2" and a.get("compile_kind") != "osr"
                and float(a["stamp"]) < start and any(a.get("method", "").startswith(s) for s in names)):
                invalidations = [ET.fromstring(t).attrib for t in re.findall(r"<make_not_entrant\b[^>]*?/>", xml)]
                found.append({"compile_id": a["compile_id"], "method": a["method"], "stamp": a["stamp"],
                              "invalidated_before_measurement_start": any(
                                  v.get("compile_id") == a["compile_id"] and float(v["stamp"]) < start for v in invalidations),
                              "invalidated_after_measurement_start": any(
                                  v.get("compile_id") == a["compile_id"] and float(v["stamp"]) >= start for v in invalidations)})
    return {"normal_c2_before_measurement": found,
            "needs_review": None if any(not x["invalidated_before_measurement_start"]
                                        and not x["invalidated_after_measurement_start"] for x in found)
                            else "inspect C2 caller inlining/recompilation; no qualifying standalone nmethod proven"}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("results", type=Path)
    p.add_argument("--out", type=Path, required=True)
    p.add_argument("--campaign", type=Path, help="shared deadline when part of a live campaign")
    a = p.parse_args()
    budget = Budget.load(a.campaign) if a.campaign else None
    if budget:
        budget.remaining()
    verify_receipt(a.results / "receipt-manifest.json")
    plan = json.loads((a.results / "plan.json").read_text())
    rows, evidence = {}, {}
    for task in plan["timing_tasks"]:
        if budget:
            budget.remaining()
        data = json.loads((a.results / (task["name"] + ".json")).read_text())
        assert len(data) == 1
        assert data[0]["benchmark"] == "qualification.BoundsQualification." + task["method"]
        assert data[0].get("params", {}) == {k: str(v) for k, v in task["params"].items()}
        metric = data[0]["primaryMetric"]
        assert metric["scoreUnit"] == "ops/s" and len(metric["rawData"]) == 1
        samples = metric["rawData"][0]
        assert len(samples) == 5 and all(math.isfinite(v) and v > 0 for v in samples)
        row = rows.setdefault(task["cell"], {"method": task["method"], "params": task["params"], "pairs": {}})
        row["pairs"].setdefault(task["pair"], {})[task["side"]] = statistics.mean(samples)
        logs = list(a.results.glob(task["name"] + "-*.xml"))
        assert len(logs) == 1, "one matched product compilation log required per fork"
        costs = parse_log(logs[0])
        clock = re.search(r"qualification-iteration=6 uptime-ms=(\d+)",
                          (a.results / (task["name"] + ".log")).read_text())
        costs["measurement_start_seconds"] = int(clock[1]) / 1000 if clock else None
        row.setdefault("compiler_cost_pairs", {}).setdefault(task["pair"], {})[task["side"]] = costs
        evidence[task["name"]] = c2_evidence(a.results, task)
    primary_by_pair = {}
    for row in rows.values():
        assert set(row["pairs"]) == set(range(6)), "incomplete pairs: no selective retry or pooling"
        logs = []
        for pair, scores in sorted(row["pairs"].items()):
            assert set(scores) == {"baseline", "candidate"}
            value = math.log(scores["candidate"] / scores["baseline"])
            logs.append(value)
            if row["method"] == "decompressDirect":
                primary_by_pair.setdefault(pair, []).append(value)
        row["fork_pair_percent"] = [100 * math.expm1(v) for v in logs]
        row["geomean_percent"] = 100 * math.expm1(statistics.mean(logs))
        row["paired_bootstrap_95_percent"] = interval(logs)
        row["negative_pairs"] = sum(v < 0 for v in logs)
    primary = None
    if plan["codec_target_removed"] and all(len(v) == 8 for v in primary_by_pair.values()):
        logs = [statistics.mean(primary_by_pair[pair]) for pair in range(6)]
        observed = abs(statistics.mean(logs))
        pvalue = sum(abs(statistics.mean(s * v for s, v in zip(signs, logs))) >= observed - 1e-15
                     for signs in itertools.product((-1, 1), repeat=6)) / 64
        primary = {"endpoint": "geomean of eight direct-decode cells, paired by block",
                   "geomean_percent": 100 * math.expm1(statistics.mean(logs)),
                   "paired_bootstrap_95_percent": interval(logs), "two_sided_sign_flip_p": pvalue}
    report = {"cells": rows, "primary_codec_endpoint": primary, "c2_evidence": evidence,
              "compiler_cost_screen": compiler_screen(rows),
              "limitations": ["Six fork pairs; bootstrap interval is descriptive and may be wide.",
                              "Secondary cell intervals are not multiplicity-adjusted gain claims.",
                              "Identical minimal compilation logging is enabled in timed forks.",
                              "No applicability evidence means no codec-gain attribution, regardless of scores."]}
    a.out.open("x").write(json.dumps(report, indent=2) + "\n")
    if budget:
        budget.remaining()
    print(a.out)


if __name__ == "__main__":
    main()
