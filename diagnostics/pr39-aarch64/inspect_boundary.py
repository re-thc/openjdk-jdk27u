#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 only, as published by
# the Free Software Foundation. See the LICENSE file for details.

"""Read retained C2 boundary graphs, compilation XML and exact replay sizes."""

import argparse
import hashlib
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET


def inspect(log, compilation):
    xml = ET.parse(compilation).getroot()
    pid = xml.attrib["process"]
    tasks = {t.attrib["compile_id"]: t for t in xml.iter("task")}
    methods = []
    for block in log.read_text().split("ARRAY-CALL-BOUNDARY ")[1:]:
        name, _, text = block.partition("\n")
        if name == "end":
            continue
        capture = re.search(r"replay_pid(\d+)_compid(\d+)\.log", text)
        if capture is None or capture[1] != pid:
            raise ValueError(f"Missing matching replay identity for {name}")
        replay = log.parent / capture[0]
        task = tasks[capture[2]]
        if task.attrib["method"].split()[1] != name:
            raise ValueError(f"Task identity differs for {name}")
        types = {e.attrib["id"]: e.attrib["name"] for e in task.iter()
                 if e.tag in ("type", "klass")}
        primitives = dict(boolean="Z", byte="B", char="C", short="S", int="I",
                          long="J", float="F", double="D", void="V")

        def descriptor(type_id):
            value = types[type_id]
            return primitives.get(value, value if value.startswith("[")
                                  else "L" + value.replace(".", "/") + ";")

        callees = {}
        for e in task.iter("method"):
            signature = "(" + "".join(descriptor(t) for t in e.attrib.get("arguments", "").split()) + ")" + descriptor(e.attrib["return"])
            callees[e.attrib["id"]] = types[e.attrib["holder"]] + " " + e.attrib["name"] + " " + signature
        failures = []
        for parse in task.iter("parse"):
            callee = None
            for e in parse:
                if e.tag == "call":
                    callee = callees[e.attrib["method"]]
                elif e.tag == "inline_fail":
                    failures.append({"callee": callee, "reason": e.attrib["reason"]})
        sizes = {}
        for line in replay.read_text().splitlines():
            fields = line.split()
            if (len(fields) == 9 and fields[0] == "ciMethod" and
                    fields[1] in ("java/util/Arrays", "jdk/internal/util/ArraysSupport") and
                    fields[2].startswith("mismatch")):
                sizes[" ".join(fields[1:4])] = int(fields[-1])
        nodes = [line for line in text.splitlines()
                 if re.match(r"\s*o?\d+\s+\w+\s+===", line)]
        targets = [re.search(r"# Static  (\S+) ", line)[1]
                   for line in nodes if "CallStaticJava" in line and "# Static  " in line]
        methods.append({
            "method": name, "compile_id": capture[2],
            "task": task.attrib,
            "inline_failures": failures,
            "inline_instruction_bytes": sizes,
            "java_call_targets": targets,
            "stores": sum(bool(re.match(r"\s*o?\d+\s+Store[B-CDFILS]\s+===", n)) for n in nodes),
            "prefix_loads": [n.strip() for n in nodes
                             if re.match(r"\s*o?\d+\s+Load[LDF]\s+===", n) and
                             ("ArraysSupport::mismatchPrefix" in n or "ArraysSupport::mismatch @" in n)],
            "replay_sha256": hashlib.sha256(replay.read_bytes()).hexdigest(),
        })
    return {
        "process": pid,
        "size_definition": "Exact cached ciMethod.inline_instructions_size from replay's final ciMethod field; -1 means not queried, 0 means no compiled size at that decision. Includes HotSpot's skipped-instruction subtraction.",
        "log_sha256": hashlib.sha256(log.read_bytes()).hexdigest(),
        "xml_sha256": hashlib.sha256(compilation.read_bytes()).hexdigest(),
        "methods": methods,
    }


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("log", type=Path)
    parser.add_argument("compilation", type=Path)
    args = parser.parse_args()
    print(json.dumps(inspect(args.log, args.compilation), indent=2))
