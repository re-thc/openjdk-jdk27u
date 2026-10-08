import importlib.util, json, math, statistics, sys
from pathlib import Path
import re
source = Path("make/scripts/bench-common-intrinsics.py")
spec = importlib.util.spec_from_file_location("bench", source)
bench = importlib.util.module_from_spec(spec)
spec.loader.exec_module(bench)
java, classpath, cpu = sys.argv[1:]
root = Path("qualification/bench")
processes = root / "confirm-processes"
processes.mkdir()
results = []
for tier in ["c1", "c2"]:
    off = json.loads(root.joinpath(tier + "-off.json").read_text())
    on = json.loads(root.joinpath(tier + "-on.json").read_text())
    for index, (a, b) in enumerate(zip(off, on)):
        ma, mb = a["primaryMetric"], b["primaryMetric"]
        overlap = max(ma["scoreConfidence"][0], mb["scoreConfidence"][0]) <= min(ma["scoreConfidence"][1], mb["scoreConfidence"][1])
        if overlap or (tier == "c1" and mb["score"] <= ma["score"]):
            continue
        print("Confirm " + tier + " " + a["benchmark"] + " " + str(a.get("params", {})), flush=True)
        runs = {"off": [], "on": []}
        for pair in range(3):
            for state in (["off", "on"] if pair % 2 == 0 else ["on", "off"]):
                record = a if state == "off" else b
                stem = tier + "-" + str(index) + "-" + str(pair) + "-" + state
                output = processes / (stem + ".json")
                command = ["taskset", "-c", cpu, java] + record["jvmArgs"] + ["-cp", classpath, "org.openjdk.jmh.Main", "^" + re.escape(record["benchmark"]) + "$", "-wi", "3", "-i", "5", "-w", "1s", "-r", "1s", "-f", "0", "-t", "1", "-foe", "true", "-rf", "json", "-rff", str(output)]
                for name, value in record.get("params", {}).items():
                    command += ["-p", name + "=" + value]
                bench.run_logged(command, processes / (stem + ".log"))
                data = json.loads(output.read_text())
                assert len(data) == 1
                runs[state].append(data[0])
        differences = [b["primaryMetric"]["score"] - a["primaryMetric"]["score"] for a, b in zip(runs["off"], runs["on"])]
        delta = statistics.mean(differences)
        error = 4.302652729911275 * statistics.stdev(differences) / math.sqrt(3)
        results.append(dict(tier=tier, benchmark=a["benchmark"], params=a.get("params", {}), off=bench.aggregate(runs["off"]), on=bench.aggregate(runs["on"]), paired_delta_ns=delta, paired_95_interval_ns=[delta - error, delta + error], fresh_pairs=3))
        bench.write_json(root / "control-confirmation.json", results)
bench.write_json(root / "control-confirmation.json", results)
print("Completed " + str(len(results)) + " longer paired control confirmations", flush=True)
