#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# Distributed under GNU GPL version 2; see the repository LICENSE file.
"""Summarize retained C2 records without granting native ARM qualification."""
import argparse
from collections import Counter
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET

TARGET = "org.simdjson.StructuralIndexer index128 "

def main():
    p = argparse.ArgumentParser()
    p.add_argument("directory", type=Path)
    a = p.parse_args()
    records = []
    for path in sorted(a.directory.glob("hotspot-*.log")):
        root = ET.parse(path).getroot()
        methods = [e.attrib for e in root.iter("nmethod") if e.get("method", "").startswith(TARGET)]
        ids = {m["compile_id"] for m in methods}
        tasks = [e for e in root.iter("task") if e.get("method", "").startswith(TARGET)]
        phases = []
        for ideal in root.iter("ideal"):
            if ideal.get("compile_id") not in ids:
                continue
            body = "".join(ideal.itertext())
            r = {"compile_id": ideal.get("compile_id"), "compile_kind": ideal.get("compile_kind", "normal"),
                 "phase": ideal.get("compile_phase"), "lines": len(body.splitlines())}
            if r["phase"] in ["Before Matching", "BEFORE_MATCHING"]:
                nodes = {}
                for line in body.splitlines():
                    m = re.match(r"\s*(\d+)\s+(\w+)\s+===\s*(.*?)\[\[(.*?)\]\](.*)", line)
                    if m:
                        nodes[m[1]] = {"op": m[2], "inputs": m[3].split(), "outputs": m[4].split(), "type": m[5]}
                pairs = []
                for nid, n in nodes.items():
                    if n["op"] != "VectorMaskToLong":
                        continue
                    source = nodes.get(n["inputs"][1], {}) if len(n["inputs"]) > 1 else {}
                    raw = nodes.get(source.get("inputs", [None, None])[1], {}) if len(source.get("inputs", [])) > 1 else {}
                    size = nodes.get(source.get("inputs", [None, None, None])[2], {}) if len(source.get("inputs", [])) > 2 else {}
                    bci = re.search(r"StructuralIndexer::index128 @ bci:(\d+)", raw.get("type", ""))
                    shape = re.search(r"#vector\w*<[^>]+>", raw.get("type", ""))
                    pairs.append({"node": nid, "input_op": source.get("op"), "raw_op": raw.get("op"),
                                  "source_bci": int(bci[1]) if bci else None,
                                  "raw_shape": shape[0] if shape else None,
                                  "raw_type": raw.get("type"), "size_type": size.get("type"),
                                  "store_mask_outputs": source.get("outputs", [])})
                r["toLong_count"] = len(pairs)
                r["through_store_mask"] = sum(x["input_op"] == "VectorStoreMask" for x in pairs)
                r["raw_operations"] = dict(Counter(x["raw_op"] for x in pairs))
                r["pairs"] = pairs
            phases.append(r)
        runtime = [e.attrib | {"event": e.tag} for e in root.iter()
                   if e.tag in ["uncommon_trap", "make_not_entrant", "deoptimized"]
                   and e.get("compile_id") in ids]
        records.append({"file": path.name, "nmethods": methods, "phases": phases,
                        "compilation_failures": [
                            {"compile_id": t.get("compile_id"), "failures": [x.attrib for x in t.iter("failure")]}
                            for t in tasks if list(t.iter("failure"))],
                        "runtime_events": runtime})
    out = {"target": TARGET.strip(), "records": records,
           "scope": "Actual parser C2 records on the recorded image only. x64 records do not prove ARM matching, ARM allocated code, spills or profitability. Runtime events are reported separately from compiled trap sites."}
    (a.directory / "analysis.json").write_text(json.dumps(out, indent=2) + "\n")
    for record in records:
        print(json.dumps({"file": record["file"],
                          "nmethods": [{k: m.get(k) for k in ["compile_id", "compile_kind", "compiler", "size"]} for m in record["nmethods"]],
                          "before_matching": [{k: x[k] for k in ["compile_id", "compile_kind", "toLong_count", "through_store_mask", "raw_operations"]} for x in record["phases"] if x["phase"] in ["Before Matching", "BEFORE_MATCHING"]],
                          "runtime_events": record["runtime_events"],
                          "failures": record["compilation_failures"]}))

if __name__ == "__main__":
    main()
