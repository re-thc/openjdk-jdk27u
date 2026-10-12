import argparse, json, math, os, statistics, subprocess, time
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument("java")
parser.add_argument("output")
parser.add_argument("--pairs", type=int, default=100)
args = parser.parse_args()
cpus = sorted(os.sched_getaffinity(0))
worker = cpus[0]
os.sched_setaffinity(0, {cpus[min(1, len(cpus)-1)]})
flags = ["-XX:ActiveProcessorCount=1", "-XX:CICompilerCount=2", "-XX:+UseSerialGC",
         "-Xms32m", "-Xmx256m", "-XX:-UsePerfData", "-XX:+DisableAttachMechanism", "-Xrs"]
results = {}
for tier, mode in (("int", ["-Xint"]), ("c1", ["-XX:TieredStopAtLevel=1"]),
                   ("c2", ["-XX:-TieredCompilation"])):
    samples = {"off": [], "on": []}
    for i in range(args.pairs + 10):
        order = ("off", "on") if i % 2 == 0 else ("on", "off")
        for setting in order:
            command = ["taskset", "-c", str(worker), args.java, *flags, *mode,
                       "-XX:" + ("+" if setting == "on" else "-") + "UseCommonIntrinsics", "-version"]
            start = time.perf_counter_ns()
            subprocess.run(command, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
            elapsed = (time.perf_counter_ns() - start) / 1_000_000
            if i >= 10:
                samples[setting].append(elapsed)
    differences = [on - off for off, on in zip(samples["off"], samples["on"])]
    mean = statistics.mean(differences)
    half = 1.984 * statistics.stdev(differences) / math.sqrt(args.pairs)
    results[tier] = {"off_ms": statistics.mean(samples["off"]), "on_ms": statistics.mean(samples["on"]),
                     "difference_ms": mean, "paired_95_ci_ms": [mean-half, mean+half], "samples": samples}
    print(json.dumps({tier: {k: v for k, v in results[tier].items() if k != "samples"}}), flush=True)
Path(args.output).write_text(json.dumps({"java": args.java, "worker_cpu": worker,
                                      "pairs": args.pairs, "vm_flags": flags, "results": results}, indent=2) + "\n")
