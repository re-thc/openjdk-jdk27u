"""Offline LogCompilation costs: compiler-task WALL time, never compiler CPU time."""
import argparse
from collections import Counter
from decimal import Decimal
import json
from pathlib import Path
import re
import xml.etree.ElementTree as ET

if not __debug__:
    raise SystemExit("Run without -O/PYTHONOPTIMIZE; analysis preconditions are required")


def attrs(text, name):
    return [ET.fromstring(t).attrib for t in re.findall(rf"<{name}\b[^>]*?/>", text)]


def event_attrs(text, name):
    # Runtime traps contain nested <jvms> and need not be self-closing.
    return [ET.fromstring("<" + name + " " + m.rstrip().removesuffix("/") + "/>").attrib
            for m in re.findall(rf"<{name}\b([^>]*)>", text)]


def elapsed_ms(start, end):
    values = Decimal(start), Decimal(end)
    if not all(x.is_finite() and x >= 0 for x in values) or values[1] < values[0]:
        raise ValueError("negative/non-finite compilation timestamp or interval")
    return float((values[1] - values[0]) * 1000)


def totals(rows):
    durations = [x["task_wall_ms"] for x in rows if x["task_wall_ms"] is not None]
    keys = Counter(x["entry_key"] for x in rows)
    return {"tasks": len(rows), "normal": sum(x["kind"] == "normal" for x in rows),
            "osr": sum(x["kind"] == "osr" for x in rows),
            "successful": sum(x["success"] is True for x in rows),
            "failed": sum(x["success"] is False for x in rows),
            "missing_completions": sum(x["success"] is None for x in rows),
            "task_wall_total_ms": round(sum(durations), 3),
            "task_wall_max_ms": max(durations, default=0),
            "repeated_entry_tasks": sum(max(0, n - 1) for n in keys.values()),
            "repeated_entry_keys": sum(n > 1 for n in keys.values())}


def parse_log(path):
    text = Path(path).read_text()
    installed = {x["compile_id"]: x for x in attrs(text, "nmethod") if x.get("compiler") == "c2"}
    queues = {x["compile_id"]: x for x in attrs(text, "task_queued")}
    rows = []
    # Thread identity classifies failed C2 tasks too: these have no nmethod.
    sections = list(re.finditer(r"<compilation_log\b[^>]*>", text))
    incomplete_sections = 0
    for index, section in enumerate(sections):
        body = text[section.end():sections[index + 1].start() if index + 1 < len(sections) else len(text)]
        closing = body.find("</compilation_log>")
        if closing < 0:
            incomplete_sections += 1
        else:
            body = body[:closing]
        headers = attrs(body, "start_compile_thread")
        if not headers or not headers[0].get("name", "").startswith("C2 "):
            continue
        for task_attrs, task_body in re.findall(r"<task\b([^>]*)>(.*?)(?:</task>|\Z)", body, re.S):
            task = ET.fromstring("<task " + task_attrs + "/>").attrib
            done = attrs(task_body, "task_done")
            if len(done) > 1:
                raise ValueError("ambiguous compilation completion")
            done = done[0] if done else None
            number, start = task["compile_id"], task["stamp"]
            install, queued = installed.get(number), queues.get(number)
            kind = "osr" if task.get("compile_kind") == "osr" else "normal"
            key = task["method"] + " | " + kind + " | " + task.get("osr_bci", "-")
            rows.append({"compile_id": number, "method": task["method"], "kind": kind,
                         "osr_bci": task.get("osr_bci"), "entry_key": key, "start_seconds": float(start),
                         "end_seconds": float(done["stamp"]) if done else None,
                         "success": done.get("success") == "1" if done else None,
                         "failure_reasons": [x.get("reason", "unspecified") for x in attrs(task_body, "failure")],
                         "task_wall_ms": elapsed_ms(start, done["stamp"]) if done else None,
                         "queue_latency_ms": elapsed_ms(queued["stamp"], start) if queued else None,
                         "install_latency_ms": elapsed_ms(start, install["stamp"]) if install else None,
                         "post_install_wall_ms": elapsed_ms(install["stamp"], done["stamp"]) if install and done else None})
    rows.sort(key=lambda x: (x["start_seconds"], int(x["compile_id"])))
    generations = Counter()
    for row in rows:
        generations[row["entry_key"]] += 1
        row["entry_generation"] = generations[row["entry_key"]]
    tty = re.split(r"<compilation_log\b", text, maxsplit=1)[0]
    invalidations = [x for x in attrs(tty, "make_not_entrant") if x.get("compile_id") in installed]
    traps = [x for x in event_attrs(tty, "uncommon_trap") if x.get("compile_id") in installed and "stamp" in x]
    args = re.search(r"<vm_arguments>.*?<args>(.*?)</args>", text, re.S)
    settings = args[1].strip() if args else "not retained"
    target = [x for x in rows if x["method"].startswith(("Copy copy ", "compiler.vectorapi.TestDuplicateVectorBounds ",
                "qualification.BoundsQualification ", "qualification.jmh_generated.",
                "dev.jzstd.internal.WindowBuffer executeSequencesDirect "))]
    return {"summary": totals(rows), "target_summary": totals(target), "tasks": rows,
            "incomplete_compilation_sections": incomplete_sections,
            "installations_without_task": sorted(installed.keys() - {r["compile_id"] for r in rows}),
            "c2_installations": len(installed), "c2_invalidations": invalidations, "c2_runtime_traps": traps,
            "instrumentation": {"vm_arguments": settings, "log_compilation": True,
                                "ideal_graphs": "<ideal " in text,
                                "assembly_printing": "Compiled method (c2)" in text or "CompileCommand=print" in settings},
            "definitions": {"task_wall_ms": "task_done.stamp minus task.stamp; includes waiting/printing/cleanup; not CPU",
                            "queue_latency_ms": "task.stamp minus task_queued.stamp; separate from task execution",
                            "install_latency_ms": "nmethod.stamp minus task.stamp; installation observation, not CPU",
                            "post_install_wall_ms": "task_done.stamp minus nmethod.stamp; may include assembly printing",
                            "repeated_entry_tasks": "later C2 generations for same method/signature/normal-or-OSR/BCI; cause not inferred"}}


def existing_report(root):
    root = Path(root)
    result = {}
    for suffix in ("matched", "nounroll"):
        result[suffix] = {side: parse_log(root / f"{side}-{suffix}.xml") for side in ("baseline", "candidate")}
    result["debug_ir"] = {
        "baseline": parse_log(root / "jtreg-baseline-debug-work/scratch/hotspot_pid76944.log"),
        "candidate": parse_log(root / "jtreg-candidate-debug-work/scratch/hotspot_pid79849.log")}
    return {"captures": result, "paired_cost_screen_applicable": False,
            "limitation": "single archived instrumented captures; no compiler CPU/per-phase time; no statistical regression claim"}


def compiler_screen(rows):
    """Use six existing planned product-fork pairs; do not request extra work."""
    decisions = {}
    for cell, row in rows.items():
        costs = row["compiler_cost_pairs"]
        total_hits, target_hits = [], Counter()
        structural, blockers = [], []
        for pair, sides in sorted(costs.items()):
            b, c = sides["baseline"], sides["candidate"]
            bt, ct = b["summary"]["task_wall_total_ms"], c["summary"]["task_wall_total_ms"]
            total_hits.append(ct > bt * 1.2 and ct - bt > 50)
            by_side = {}
            for side, report in (("baseline", b), ("candidate", c)):
                if report["instrumentation"]["ideal_graphs"] or report["instrumentation"]["assembly_printing"]:
                    blockers.append(f"pair{pair} {side}: diagnostic instrumentation in timing capture")
                if report["summary"]["failed"] or report["summary"]["missing_completions"]:
                    blockers.append(f"pair{pair} {side}: failed/incomplete C2 task")
                if report["incomplete_compilation_sections"] or report["installations_without_task"]:
                    blockers.append(f"pair{pair} {side}: incomplete compiler log")
                by_side[side] = {}
                target_ids = set()
                for task in report["tasks"]:
                    if task["method"].startswith(("qualification.", "dev.jzstd.internal.WindowBuffer executeSequencesDirect ")):
                        by_side[side].setdefault(task["entry_key"], []).append(task)
                        target_ids.add(task["compile_id"])
                        boundary = report.get("measurement_start_seconds")
                        if (boundary is not None and task["entry_generation"] > 1
                                and (task["end_seconds"] is None or task["end_seconds"] >= boundary)):
                            blockers.append(f"pair{pair} {side}: repeated target compilation during measurement")
                boundary = report.get("measurement_start_seconds")
                if boundary is not None and any(x["compile_id"] in target_ids and float(x["stamp"]) >= boundary
                                                for x in report["c2_invalidations"] + report["c2_runtime_traps"]):
                    blockers.append(f"pair{pair} {side}: target invalidation/trap after measurement starts; inspect teardown separately")
            for key in by_side["baseline"].keys() | by_side["candidate"].keys():
                left, right = by_side["baseline"].get(key, []), by_side["candidate"].get(key, [])
                if not left or len(left) != len(right) or any(x["task_wall_ms"] is None for x in left + right):
                    structural.append({"pair": pair, "entry": key, "baseline_count": len(left), "candidate_count": len(right)})
                    continue
                before = sum(x["task_wall_ms"] for x in left)
                after = sum(x["task_wall_ms"] for x in right)
                target_hits[key] += after > before * 1.25 and after - before > 5
        decisions[cell] = {"total_cost_increase_pairs": sum(total_hits),
                           "target_cost_increase_pairs": dict(target_hits), "entry_count_changes": structural,
                           "blockers": blockers,
                           "explanation_required": sum(total_hits) >= 5 or any(v >= 5 for v in target_hits.values())
                                                   or bool(blockers) or bool(structural),
                           "interpretation": "instrumented task-wall screen, not compiler CPU or causal proof"}
    return decisions


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--receipts", type=Path, required=True)
    p.add_argument("--out", type=Path, required=True)
    a = p.parse_args()
    with a.out.open("x") as stream:
        json.dump(existing_report(a.receipts), stream, indent=2)
        stream.write("\n")
    print(a.out)


if __name__ == "__main__":
    main()
