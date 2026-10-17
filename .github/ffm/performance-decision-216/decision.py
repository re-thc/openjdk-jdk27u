"""Prospective, selected-scope FFM decision. Importing launches no processes."""

import copy
import hashlib
import itertools
import json
import math
import random
import statistics
from collections import Counter
from pathlib import Path


BASE = "02324e6bd026411407983df06284cd79460c33f6"
CANDIDATE = "b67cf2421d5dca1df4d9759003e1983a1b810f86"
LABELS = ["base", "control", "template"]
CELLS = [
    dict(id="startup-empty", stage="startup", tier="tiered", shape="empty"),
    dict(id="startup-framework", stage="startup", tier="tiered", shape="framework"),
    dict(id="startup-i", stage="startup", tier="tiered", shape="i"),
    dict(id="c2-unbound", stage="held-call-form", tier="c2", shape="unbound"),
    dict(id="c2-bound", stage="selected-counterparts", tier="c2", shape="bound"),
    dict(id="c1-unbound", stage="selected-counterparts", tier="c1", shape="unbound"),
]
PLAN = dict(
    schema=1, status="DRAFT_NOT_AUTHORIZED_NOT_EXECUTED",
    platform="native Linux aarch64", baseline=BASE, candidate=CANDIDATE,
    comparison="isolated patch relative to original source base; not current-master performance",
    labels=LABELS, control_image="base", cells=CELLS, blocks=12,
    stage_order=["startup", "held-call-form", "selected-counterparts"],
    stage_fork_limits={"startup": 108, "held-call-form": 36, "selected-counterparts": 72},
    maximum_timing_forks=216, maximum_campaign_seconds=3600, maximum_fork_seconds=180,
    maximum_untimed_diagnostic_forks=8,
    common_flags=["-Xms128m", "-Xmx128m", "--enable-native-access=ALL-UNNAMED"],
    tiers={"tiered": [], "c1": ["-XX:TieredStopAtLevel=1"],
           "c2": ["-XX:-TieredCompilation", "-Xbatch"]},
    cds="default", calls_per_batch={"c1": 100000, "c2": 1000000},
    warm_batches=30, timed_batches=10, schedule_seed=20261014,
    bootstrap=dict(seed=20261016, resamples=10000, unit="paired fork medians",
                   reset_each_comparison=True, interval="unadjusted percentile 95%"),
    control_point_bounds=[0.95, 1.05], control_whole_95CI_bounds=[0.90, 1.10],
    slowdown="HOLD on either comparator CI wholly below 1 OR slower than both labels in >=9/12 blocks; no acceptable-loss margin",
    retry_policy="No retry, settings changes, exclusions, pooling, extensions or automatic replacement run",
    accounting="individual direct-child wait4 rusage; collector and Java inside the same native Linux VM",
    host_cpu="Bind once from verified actual affinity/cpuset before freezing execution inputs; no automatic reselection",
    prior_results="All spent campaigns, failed controls and historical old-A C2 hold remain immutable",
    shipping_qualified=False,
)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def make_schedule():
    rng = random.Random(PLAN["schedule_seed"])
    permutations = list(itertools.permutations(LABELS))
    label_orders = {}
    for cell in CELLS:
        orders = permutations * 2
        rng.shuffle(orders)
        label_orders[cell["id"]] = orders
    rows = []
    for stage in PLAN["stage_order"]:
        cells = [c for c in CELLS if c["stage"] == stage]
        condition_orders = list(itertools.permutations(cells))
        condition_orders *= 12 // len(condition_orders)
        rng.shuffle(condition_orders)
        for block, ordered in enumerate(condition_orders):
            for cell in ordered:
                for label in label_orders[cell["id"]][block]:
                    rows.append(dict(sequence=len(rows) + 1, stage=stage,
                                     cell=cell["id"], block=block, label=label))
    validate_schedule(rows)
    return rows


def validate_schedule(rows):
    require(type(rows) is list and len(rows) == 216, "expected frozen 216-slot ceiling")
    require(all(type(r) is dict and set(r) == {"sequence", "stage", "cell", "block", "label"}
                and type(r["sequence"]) is int and type(r["block"]) is int
                and r["block"] in range(12) for r in rows), "invalid schedule schema")
    require([r["sequence"] for r in rows] == list(range(1, 217)), "sequence differs")
    require([r["stage"] for r in rows] ==
            [s for s in PLAN["stage_order"] for _ in range(PLAN["stage_fork_limits"][s])],
            "stage order differs")
    permutations = Counter({p: 2 for p in itertools.permutations(LABELS)})
    for cell in CELLS:
        orders = []
        for block in range(12):
            group = [r for r in rows if r["cell"] == cell["id"] and r["block"] == block]
            require(len(group) == 3 and all(r["stage"] == cell["stage"] for r in group),
                    "missing, duplicate or wrong-stage paired cell")
            require(group[-1]["sequence"] - group[0]["sequence"] == 2,
                    "paired labels must stay adjacent")
            orders.append(tuple(r["label"] for r in group))
        require(Counter(orders) == permutations, "label permutations are not balanced")
    for stage in PLAN["stage_order"]:
        cells = [c["id"] for c in CELLS if c["stage"] == stage]
        orders = []
        for block in range(12):
            group = [r for r in rows if r["stage"] == stage and r["block"] == block]
            require(len(group) == 3 * len(cells), "unknown cell or block")
            orders.append(tuple(r["cell"] for r in group[::3]))
        expected = Counter({p: 12 // math.factorial(len(cells))
                            for p in itertools.permutations(cells)})
        require(Counter(orders) == expected, "condition order is not balanced")


def command(slot, paths):
    cell = next(c for c in CELLS if c["id"] == slot["cell"])
    image = "base" if slot["label"] == "control" else slot["label"]
    argv = [paths[image], *PLAN["common_flags"], *PLAN["tiers"][cell["tier"]]]
    if cell["stage"] == "startup":
        return argv + ["-cp", paths["classes"], "Probe", cell["shape"], paths["native"]]
    return argv + ["-Dsteady.mode=" + cell["shape"],
                   "-Dsteady.count=" + str(PLAN["calls_per_batch"][cell["tier"]]),
                   "-Dsteady.warm=30", "-Dsteady.samples=10",
                   "-Dsteady.library=" + paths["native"], "-cp", paths["classes"], "Steady"]


def positive_integer(value):
    return type(value) is int and value > 0


def validate_row(row, slot, paths):
    require(type(row) is dict and all(row.get(k) == v for k, v in slot.items()),
            "row differs from frozen slot")
    require(type(row["sequence"]) is int and type(row["block"]) is int, "invalid row slot types")
    require(type(row.get("returncode")) is int and row["returncode"] == 0
            and "error" not in row, "invalid fork")
    require(row.get("diagnostic_output") is not True, "untimed diagnostic is not a timing row")
    require(row.get("command") == command(slot, paths), "command differs from frozen input")
    require(row.get("cds") == "default", "CDS differs")
    require(row.get("cpu_source") == "wait4-direct-child", "CPU accounting not individual wait4")
    for key in ["pid", "waited_pid", "start_monotonic_ns", "end_monotonic_ns",
                "wall_ns", "process_cpu_ns"]:
        require(positive_integer(row.get(key)), "invalid " + key)
    require(row["pid"] == row["waited_pid"], "wait4 returned a different child")
    require(row["end_monotonic_ns"] - row["start_monotonic_ns"] == row["wall_ns"],
            "monotonic envelope differs")
    require(row.get("host_witness_verified") is True, "actual child provenance unverified")
    require(row["process_cpu_ns"] <= row["wall_ns"] + 10000000,
            "single-CPU child usage exceeds wall envelope")
    metrics = row.get("metrics")
    require(type(metrics) is dict and type(row.get("stdout")) is str
            and json.loads(row["stdout"].strip()) == metrics, "metrics differ from raw stdout")
    cell = next(c for c in CELLS if c["id"] == slot["cell"])
    if cell["stage"] == "startup":
        keys = dict(empty=["main_ns"],
                    framework=["linker_ns", "lookup_ns", "descriptor_symbol_ns", "main_ns"],
                    i=["linker_ns", "lookup_ns", "descriptor_symbol_ns", "link_ns",
                       "first_ns", "early_ns", "main_ns"])[cell["shape"]]
        extra = ["warm_ns", "warm_count", "sink"] if cell["shape"] == "i" else []
        require(set(metrics) == set(keys + extra), "startup schema differs")
        require(all(positive_integer(metrics.get(k)) for k in keys), "invalid startup metrics")
        if cell["shape"] == "i":
            require(metrics.get("warm_ns") == 0 and metrics.get("warm_count") == 2000000
                    and metrics.get("sink") == 499500, "startup warm execution or checksum mismatch")
    else:
        require(set(metrics) == {"mode", "count", "warm", "sink", "wall_ns", "cpu_ns"},
                "retained schema differs")
        n = PLAN["calls_per_batch"][cell["tier"]]
        require(metrics.get("mode") == cell["shape"] and metrics.get("count") == n
                and metrics.get("warm") == 30 and metrics.get("sink") == n * (n - 1) // 2,
                "retained mode/count/checksum mismatch")
        for key in ["wall_ns", "cpu_ns"]:
            require(type(metrics.get(key)) is list and len(metrics[key]) == 10
                    and all(positive_integer(v) for v in metrics[key]), "invalid retained samples")


def ratio(left, right):
    require(len(left) == len(right) == 12 and all(v > 0 for v in left + right),
            "requires 12 positive paired fork values")
    logs = [math.log(x / y) for x, y in zip(left, right)]
    rng = random.Random(20261016)
    boot = sorted(math.exp(math.fsum(rng.choices(logs, k=12)) / 12) for _ in range(10000))
    return dict(ratio=math.exp(math.fsum(logs) / 12), lo=boot[250], hi=boot[9750],
                comparator_median=statistics.median(left), candidate_median=statistics.median(right))


def metric_values(row, cell):
    if cell["stage"] == "startup":
        return dict(wall_ns=row["wall_ns"], process_cpu_ns=row["process_cpu_ns"],
                    **{k: v for k, v in row["metrics"].items()
                       if k.endswith("_ns") and k != "warm_ns"})
    n = row["metrics"]["count"]
    return {"steady_wall_ns": statistics.median(row["metrics"]["wall_ns"]) / n,
            "steady_cpu_ns": statistics.median(row["metrics"]["cpu_ns"]) / n}


def assess(rows, stage, schedule, paths):
    validate_schedule(schedule)
    require(stage in PLAN["stage_order"], "unknown stage")
    expected = [s for s in schedule if s["stage"] == stage]
    require(type(rows) is list and len(rows) == len(expected), "incomplete/oversized stage")
    for row, slot in zip(rows, expected):
        validate_row(row, slot, paths)
    controls, comparisons, holds = [], [], []
    for cell in [c for c in CELLS if c["stage"] == stage]:
        data = {label: [metric_values(next(r for r in rows if r["cell"] == cell["id"]
                                       and r["label"] == label and r["block"] == b), cell)
                        for b in range(12)] for label in LABELS}
        control_metrics = (["wall_ns", "process_cpu_ns"] +
                           (["first_ns"] if cell["shape"] == "i" else [])) \
            if stage == "startup" else ["steady_wall_ns", "steady_cpu_ns"]
        for metric in data["base"][0]:
            values = {label: [d[metric] for d in data[label]] for label in LABELS}
            if metric in control_metrics:
                gate = dict(cell=cell["id"], metric=metric,
                            **ratio(values["base"], values["control"]))
                gate["pass_gate"] = (0.95 <= gate["ratio"] <= 1.05
                                     and 0.90 <= gate["lo"] <= gate["hi"] <= 1.10)
                controls.append(gate)
            pair = [dict(cell=cell["id"], metric=metric, comparator=label,
                         **ratio(values[label], values["template"])) for label in LABELS[:2]]
            comparisons.extend(pair)
            slower = [b for b in range(12) if values["template"][b] > values["base"][b]
                      and values["template"][b] > values["control"][b]]
            below = [p["comparator"] for p in pair if p["hi"] < 1]
            if below or len(slower) >= 9:
                holds.append(dict(cell=cell["id"], metric=metric,
                                  intervals_entirely_below_one=below, jointly_slower_blocks=slower))
    failures = [g for g in controls if not g["pass_gate"]]
    uncertain = [p for p in comparisons if p["ratio"] < 1 or p["lo"] <= 1 <= p["hi"]]
    if failures:
        status = "STOPPED_CONTROL_FAILURE"
    elif holds:
        status = "HELD_CANDIDATE_SLOWDOWN"
    elif uncertain:
        status = "INCONCLUSIVE_REVIEW_REQUIRED"
    else:
        status = "CONTROLS_PASSED_REVIEW_REQUIRED"
    primary = [p for p in comparisons if stage != "startup"
               or (p["cell"] == "startup-i"
                   and p["metric"] in ["wall_ns", "process_cpu_ns", "first_ns"])]
    favorable = not failures and not holds and all(p["ratio"] >= 1 and p["lo"] > 1 for p in primary)
    return dict(stage=stage, status=status, forks=len(rows), controls=controls,
                control_failures=failures, candidate_comparisons=comparisons,
                consistent_slowdown_signals=holds, uncertainty_comparisons=uncertain,
                primary_resolved_favorably=favorable, shipping_qualified=False)


def next_stage(reports):
    require(len(reports) <= 3 and [r["stage"] for r in reports] ==
            PLAN["stage_order"][:len(reports)], "reports are not an ordered prefix")
    if any(r["control_failures"] or r["consistent_slowdown_signals"] for r in reports):
        return None
    if len(reports) == 0:
        return "startup"
    if len(reports) == 1:
        # Independent historical call-form question remains useful even if startup is inconclusive.
        return "held-call-form"
    if len(reports) == 2 and all(r["primary_resolved_favorably"] for r in reports):
        return "selected-counterparts"
    return None


def table(report):
    lines = ["Ratio = comparator / candidate; above 1 is faster. Unadjusted paired-bootstrap 95% CI.",
             "", "| Cell | Metric | Comparator | Comparator median | Candidate median | Ratio [95% CI] |",
             "|---|---|---|---:|---:|---:|"]
    for p in report["candidate_comparisons"]:
        scale = 1 if p["metric"].startswith("steady_") else 1e6
        lines.append(f"| {p['cell']} | {p['metric']} | {p['comparator']} | "
                     f"{p['comparator_median']/scale:.3f} | {p['candidate_median']/scale:.3f} | "
                     f"{p['ratio']:.5f} [{p['lo']:.5f}, {p['hi']:.5f}] |")
    return "\n".join(lines + ["", "Startup units: ms. Retained units: gross harness ns/call.",
                              "Status: " + report["status"], "Performance shipping qualification: false.", ""])


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["freeze", "analyze"])
    parser.add_argument("--directory", type=Path, default=Path(__file__).resolve().parent)
    parser.add_argument("--stage", choices=PLAN["stage_order"])
    args = parser.parse_args()
    if args.action == "freeze":
        for name, obj in [("PROPOSAL.json", PLAN), ("SCHEDULE.json", make_schedule())]:
            with (args.directory / name).open("x") as f:
                json.dump(copy.deepcopy(obj), f, indent=2)
                f.write("\n")
    else:
        require(args.stage is not None, "stage is required")
        paths = json.loads((args.directory / "EXECUTION_BINDINGS.json").read_text())["paths"]
        rows = [json.loads(line) for line in (args.directory / (args.stage + ".jsonl")).read_text().splitlines()]
        report = assess(rows, args.stage, json.loads((args.directory / "SCHEDULE.json").read_text()), paths)
        with (args.directory / (args.stage + "-analysis.json")).open("x") as f:
            json.dump(report, f, indent=2)
            f.write("\n")
        with (args.directory / (args.stage + "-table.md")).open("x") as f:
            f.write(table(report))
