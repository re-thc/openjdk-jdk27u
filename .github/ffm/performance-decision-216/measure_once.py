"""Prospective one-shot collector. Requires externally reviewed frozen receipts.

No data collection occurs on import. The supplied packet has no image bindings,
host admission or launch review and therefore cannot open a timed campaign.
"""

import json
import os
import platform
import signal
import time
from pathlib import Path

from child_collector import collect_child, witness_for_inputs
from budget import campaign_deadline, overall_budget_passed
from decision import (PLAN, assess, command, make_schedule, next_stage, require,
                      table, validate_row, validate_schedule)


def snapshot():
    start = time.monotonic_ns()
    files = {}
    for name in ["/proc/stat", "/proc/loadavg", "/proc/pressure/cpu", "/proc/self/cgroup"]:
        try:
            files[name] = Path(name).read_text()
        except OSError as error:
            files[name] = dict(error=type(error).__name__)
    return dict(monotonic_start_ns=start, monotonic_end_ns=time.monotonic_ns(),
                cpu_ticks_per_second=os.sysconf("SC_CLK_TCK"), files=files,
                performance_exclusion_gate=False)


def write_report(out, report):
    temporary = out / "status.tmp"
    temporary.write_text(json.dumps(report, indent=2) + "\n")
    temporary.replace(out / "status.json")


def write_pre_seal_report(out, report, attempt_budget, clock=time.monotonic_ns,
                          writer=write_report):
    """This process cannot observe its own final write/print/return completion."""
    checked = clock()
    report.pop("overall_budget_passed", None)
    report.update(pre_seal_budget_checked_monotonic_ns=checked,
                  pre_seal_budget_passed=overall_budget_passed(attempt_budget, checked),
                  budget_check_provisional=True, terminal_observation_required=True)
    if not report["pre_seal_budget_passed"]:
        report["status"] = "STOPPED_OVERALL_BUDGET"
    writer(out, report)


def collect_stages(out, bindings, schedule, deadline, collect=collect_child,
                   telemetry=snapshot, clock=time.monotonic_ns):
    """Stages are a frozen prefix; any invalid row stops without retry or assessment."""
    validate_schedule(schedule)
    require(schedule == make_schedule(), "schedule differs from exact frozen order")
    reports = []
    report = dict(status="COLLECTING", shipping_qualified=False, forks=0,
                  maximum_forks=216, maximum_campaign_seconds=3600,
                  automatic_retries=0, historical_holds_preserved=True, stages=reports)
    write_report(out, report)
    while (stage := next_stage(reports)) is not None:
        records = []
        slots = [s for s in schedule if s["stage"] == stage]
        with (out / (stage + ".jsonl")).open("x") as raw, \
             (out / (stage + ".host.jsonl")).open("x") as host:
            for slot in slots:
                require(clock() < deadline, "campaign deadline reached; no retry")
                if not records or records[-1]["block"] != slot["block"]:
                    host.write(json.dumps(dict(block=slot["block"], phase="before", snapshot=telemetry())) + "\n")
                    host.flush()
                prefix = out / f"fork-{slot['sequence']:03d}"
                prefix.with_suffix(".intent.json").write_text(json.dumps(
                    dict(slot, command=command(slot, bindings["paths"]))) + "\n")
                row = dict(slot)
                row.update(collect(command(slot, bindings["paths"]), bindings["cpu"], deadline,
                                   prefix.with_suffix(".stdout"), prefix.with_suffix(".stderr")))
                row["cds"] = "default"
                try:
                    validate_row(row, slot, bindings["paths"])
                except Exception as failure:
                    row.setdefault("error", type(failure).__name__ + ": " + str(failure))
                raw.write(json.dumps(row) + "\n")
                raw.flush()
                records.append(row)
                report["forks"] += 1
                write_report(out, report)
                if "error" in row:
                    report.update(status="STOPPED_INVALID_FORK", failed_stage=stage,
                                  collected_in_incomplete_stage=len(records),
                                  error=row["error"])
                    write_report(out, report)
                    return report
                if len(records) == len(slots) or slots[len(records)]["block"] != slot["block"]:
                    host.write(json.dumps(dict(block=slot["block"], phase="after", snapshot=telemetry())) + "\n")
                    host.flush()
        require(clock() < deadline, "campaign deadline reached before stage analysis; no retry")
        assessment = assess(records, stage, schedule, bindings["paths"])
        require(clock() < deadline, "campaign deadline reached during stage analysis; no retry")
        (out / (stage + "-analysis.json")).write_text(json.dumps(assessment, indent=2) + "\n")
        (out / (stage + "-table.md")).write_text(table(assessment))
        reports.append(assessment)
        write_report(out, report)
    if any(r["control_failures"] for r in reports):
        report["status"] = "STOPPED_CONTROL_FAILURE"
    elif any(r["consistent_slowdown_signals"] for r in reports):
        report["status"] = "HELD_CANDIDATE_SLOWDOWN"
    elif any(r["uncertainty_comparisons"] or not r["primary_resolved_favorably"] for r in reports):
        report["status"] = "INCONCLUSIVE_REVIEW_REQUIRED"
    else:
        report["status"] = "SELECTED_SCOPE_FAVORABLE_REVIEW_REQUIRED"
    write_report(out, report)
    return report


def main():
    from inputs import get_budget, validate_current_host, validate_inputs, recheck_inputs
    root = Path(__file__).resolve().parent
    # Validation/complete image hashes occur before opening the timed window.
    bindings, fingerprints = validate_inputs(root)
    require(platform.system() == "Linux" and platform.machine() == "aarch64",
            "collector must execute inside native Linux aarch64 VM")
    require(bindings["cpu"] in os.sched_getaffinity(0), "frozen CPU unavailable; no reselection")
    require(not any(os.environ.get(name) for name in
                    ["JAVA_TOOL_OPTIONS", "JDK_JAVA_OPTIONS", "_JAVA_OPTIONS", "LD_PRELOAD"]),
            "injected Java/native settings")
    host_state = validate_current_host(root, bindings)
    executable_stats = {}
    for label in ["base", "template"]:
        java = bindings["paths"][label]
        stat = Path(java).stat()
        executable_stats[java] = {key: getattr(stat, key)
                                  for key in ["st_dev", "st_ino", "st_size", "st_mtime_ns"]}
    checked_witness = witness_for_inputs(host_state, executable_stats)

    def bound_collector(argv, cpu, deadline_ns, stdout_path, stderr_path):
        return collect_child(argv, cpu, deadline_ns, stdout_path, stderr_path,
                             witness=checked_witness)
    schedule = json.loads((root / "SCHEDULE.json").read_text())
    validate_schedule(schedule)
    require(schedule == make_schedule(), "schedule differs from exact frozen order")
    attempt_budget = get_budget(root, bindings)
    start = time.monotonic_ns()
    deadline = campaign_deadline(attempt_budget, start)
    out = root / "run"
    out.mkdir()  # Exclusive attempt marker. Never replace, resume or pick a new path automatically.
    (out / "inputs-before.json").write_text(json.dumps(fingerprints, indent=2) + "\n")
    report = None

    # A deadline must not interrupt reaping or terminal-row persistence. Collection
    # polls the absolute deadline; this signal records expiry without raising.
    deadline_seen = False

    def expired(_signum, _frame):
        nonlocal deadline_seen
        deadline_seen = True

    previous = signal.signal(signal.SIGALRM, expired)
    signal.setitimer(signal.ITIMER_REAL, 3600)
    try:
        report = collect_stages(out, bindings, schedule, deadline, collect=bound_collector)
    except BaseException as failure:
        current = out / "status.json"
        report = json.loads(current.read_text()) if current.exists() else dict(shipping_qualified=False)
        report.update(status="STOPPED_EXECUTION_FAILURE", error=type(failure).__name__ + ": " + str(failure),
                      automatic_retries=0, historical_holds_preserved=True)
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)
        end = time.monotonic_ns()
        report = report or dict(status="STOPPED_EXECUTION_FAILURE", shipping_qualified=False)
        report.update(start_monotonic_ns=start, end_monotonic_ns=end,
                      timed_window_ns=end - start, persisted_rows=report.get("forks", 0),
                      launch_intents=len(list(out.glob("fork-*.intent.json"))),
                      witnessed_launches=len(list(out.glob("fork-*.launch.json"))),
                      terminal_receipts=len(list(out.glob("fork-*.receipt.json"))),
                      deadline_signal_seen=deadline_seen)
        if end > deadline:
            report["status"] = "STOPPED_CAMPAIGN_DEADLINE"
        try:
            # Read-only identity checks are outside the timed window.
            recheck_inputs(fingerprints)
            validate_current_host(root, bindings)
            report["frozen_inputs_unchanged"] = True
        except Exception as failure:
            report.update(status="HELD_INPUT_MUTATION", frozen_inputs_unchanged=False,
                          input_error=type(failure).__name__ + ": " + str(failure))
        write_pre_seal_report(out, report, attempt_budget)
    print(json.dumps({k: report[k] for k in ["status", "shipping_qualified", "persisted_rows",
                                           "launch_intents", "witnessed_launches", "terminal_receipts",
                                           "terminal_observation_required"]}))


if __name__ == "__main__":
    main()
