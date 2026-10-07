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
#/


"""Run each JMH case in three externally launched, fresh JVMs.

Using one JVM per process avoids a separate JMH driver VM while retaining
process isolation between cases. Each JVM measures exactly one parameter set
with JMH's compiler hints and full Java blackholes supplied explicitly.
"""

import argparse
import itertools
import json
import math
from pathlib import Path
import re
import statistics
import subprocess


BENCHMARKS = r"org.openjdk.bench.vm.compiler.Common(Scalar|BigIntegerShift)?Intrinsics.*"
FRESH_PROCESSES = 3
MEASUREMENTS = 5
# Student-t quantile for a two-sided 99.9% interval with 15 samples (df=14).
T_999_DF14 = 4.14045411273826


def write_json(path, value):
    temporary = path.with_suffix(".tmp")
    temporary.write_text(json.dumps(value, indent=2, allow_nan=False) + "\n")
    temporary.replace(path)


def run_logged(command, log):
    with log.open("w") as output:
        subprocess.run(command, stdout=output, stderr=subprocess.STDOUT, check=True)
    text = log.read_text(errors="replace")
    if any(marker in text for marker in (
            "Failed to start thread", "pthread_create failed", "OutOfMemoryError",
            "<forked VM failed", "<failure>", "CompilerOracle: An error has occurred",
            "must be enabled via -XX:+UnlockExperimentalVMOptions")):
        raise RuntimeError(f"Incomplete benchmark run; see {log}")
    return text


def discover_cases(text):
    catalog = []
    for line in text.splitlines():
        if re.fullmatch(BENCHMARKS, line):
            catalog.append((line, {}))
        elif match := re.fullmatch(r'\s+param "([^"]+)" = \{([^}]+)\}', line):
            if not catalog:
                raise ValueError("Parameter without a benchmark in JMH catalogue")
            catalog[-1][1][match[1]] = [value.strip() for value in match[2].split(",")]
    if not catalog:
        raise ValueError("No common-intrinsic benchmarks found on the classpath")
    cases = []
    for benchmark, parameters in catalog:
        for values in itertools.product(*parameters.values()):
            cases.append((benchmark, dict(zip(parameters, values))))
    return cases


def aggregate(runs):
    first = runs[0]
    for result in runs:
        for key in ("benchmark", "params", "mode", "threads", "jvmArgs",
                    "warmupIterations", "measurementIterations"):
            if result.get(key) != first.get(key):
                raise ValueError(f"Mismatched process metadata: {key}")
    metrics = [result["primaryMetric"] for result in runs]
    samples = []
    for metric in metrics:
        data = metric["rawData"]
        if len(data) != 1 or len(data[0]) != MEASUREMENTS:
            raise ValueError("Expected five measurements from one fresh JVM")
        if metric["scoreUnit"] != metrics[0]["scoreUnit"]:
            raise ValueError("Mismatched score units")
        samples.append(data[0])
    values = list(itertools.chain.from_iterable(samples))
    if len(runs) != FRESH_PROCESSES or not all(map(math.isfinite, values)):
        raise ValueError("Missing or non-finite process measurements")
    mean = statistics.mean(values)
    error = T_999_DF14 * statistics.stdev(values) / math.sqrt(len(values))
    result = dict(first)
    # Preserve forks=0: JMH did not fork. Isolation is supplied by this launcher.
    result["externalFreshProcesses"] = len(runs)
    result["processMetrics"] = [
        {key: metric[key] for key in ("score", "scoreError", "scoreConfidence", "scoreUnit")}
        for metric in metrics
    ]
    result["primaryMetric"] = {
        "score": mean,
        "scoreError": error,
        "scoreConfidence": [mean - error, mean + error],
        "scoreUnit": metrics[0]["scoreUnit"],
        "rawData": samples,
    }
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("java")
    parser.add_argument("classpath")
    parser.add_argument("output", type=Path)
    parser.add_argument("cpu", nargs="?")
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    if any(args.output.iterdir()):
        parser.error("Output directory must be empty; use a fresh measurement directory")
    process_dir = args.output / "processes"
    process_dir.mkdir(exist_ok=True)
    prefix = [] if args.cpu is None else ["taskset", "-c", args.cpu]
    vm = ["-Xms128m", "-Xmx128m", "-XX:ActiveProcessorCount=1",
          "-XX:+UseSerialGC", "-XX:-UsePerfData", "-XX:+DisableAttachMechanism",
          "-Xrs", "--add-opens=java.base/java.math=ALL-UNNAMED"]
    jmh = ["-cp", args.classpath, "org.openjdk.jmh.Main"]
    # Ask the installed JMH version to combine its defaults and generated hints.
    # Source-file launch needs the full JDK already used for these benchmarks.
    source = args.output / "JmhCompilerHints.java"
    source.write_text("""import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import org.openjdk.jmh.runner.CompilerHints;
class JmhCompilerHints {
    public static void main(String[] args) throws Exception {
        Files.copy(Path.of(CompilerHints.hintsFile()), Path.of(args[0]),
                   StandardCopyOption.REPLACE_EXISTING);
    }
}
""")
    hints = (args.output / "compiler-hints").resolve()
    run_logged(prefix + [args.java, "-Xint", "-Djmh.blackhole.mode=FULL"] + vm
               + ["-cp", args.classpath, str(source), str(hints)],
               args.output / "compiler-hints.log")
    if "inline,org/openjdk/jmh/infra/Blackhole.consume" not in hints.read_text():
        raise ValueError("JMH Java-blackhole directives are missing")
    vm += ["-Djmh.blackhole.mode=FULL",
           "-XX:CompileCommandFile=" + str(hints)]
    text = run_logged(prefix + [args.java, "-Xint"] + vm + jmh + [BENCHMARKS, "-lp"],
                      args.output / "catalogue.log")
    cases = discover_cases(text)
    for tier, mode in (("c1", "-XX:TieredStopAtLevel=1"), ("int", "-Xint"),
                       ("c2", "-XX:-TieredCompilation")):
        warmup_time = "1s" if tier == "c2" else "300ms"
        for state, flag in (("off", "-XX:-UseCommonIntrinsics"),
                            ("on", "-XX:+UseCommonIntrinsics")):
            results = []
            for index, (benchmark, params) in enumerate(cases):
                runs = []
                for process in range(FRESH_PROCESSES):
                    stem = f"{tier}-{state}-{index:02d}-{process}"
                    output = process_dir / f"{stem}.json"
                    command = prefix + [args.java, mode, flag] + vm + jmh
                    command += ["^" + re.escape(benchmark) + "$", "-wi", "3", "-i", "5",
                                "-w", warmup_time, "-r", "300ms", "-f", "0", "-t", "1",
                                "-foe", "true", "-rf", "json", "-rff", str(output)]
                    for name, value in params.items():
                        command += ["-p", f"{name}={value}"]
                    run_logged(command, process_dir / f"{stem}.log")
                    data = json.loads(output.read_text())
                    if len(data) != 1 or data[0]["benchmark"] != benchmark or data[0].get("params", {}) != params:
                        raise ValueError(f"Wrong benchmark result in {output}")
                    runs.append(data[0])
                results.append(aggregate(runs))
                write_json(args.output / f"{tier}-{state}.json", results)
                print(f"{tier}-{state}: {index + 1}/{len(cases)} {benchmark.split('.')[-1]} {params}", flush=True)


if __name__ == "__main__":
    main()
