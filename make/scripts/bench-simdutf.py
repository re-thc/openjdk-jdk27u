#!/usr/bin/env python3
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.

"""Compare a pristine baseline JDK with a simdutf-enabled JDK, sequentially."""
import argparse
import glob
import hashlib
import json
import math
import os
from pathlib import Path
import re
import shlex
import statistics
import subprocess
import zipfile

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--baseline", required=True, type=Path)
parser.add_argument("--enabled", required=True, type=Path)
parser.add_argument("--classpath", required=True)
parser.add_argument("--output", required=True, type=Path)
parser.add_argument("--tiers", default="c2,c1,interpreter")
parser.add_argument("--sizes", default="32,4096,65536")
parser.add_argument("--filter", default="org.openjdk.bench.java.lang.SimdUTF.*")
parser.add_argument("--forks", default="2")
parser.add_argument("--warmup", default="2")
parser.add_argument("--measurements", default="3")
parser.add_argument("--time", default="300ms")
parser.add_argument("--jvm-args", default="-XX:+UseSerialGC -XX:ActiveProcessorCount=1 -XX:CICompilerCount=2",
                    help="additional VM arguments, applied equally to both JDKs and the JMH driver")
parser.add_argument("--baseline-jvm-args", default="",
                    help="VM arguments for the baseline only")
parser.add_argument("--enabled-jvm-args", default="",
                    help="VM arguments for the enabled build only (simdutf is enabled by default)")
parser.add_argument("--external-forks", action="store_true",
                    help="launch each case in two fresh VMs from Python, without a simultaneous JMH driver VM")
parser.add_argument("--batch-sizes", action="store_true",
                    help="exploratory external runs: measure all sizes of a benchmark in each fresh VM")
parser.add_argument("--resume", action="store_true", help="reuse completed results for unchanged JDKs and parameters")
args = parser.parse_args()
if args.external_forks and int(args.forks) != 2:
    parser.error("external forks currently require --forks=2 (six measured samples per case)")
if args.external_forks and int(args.measurements) != 3:
    parser.error("external forks currently require --measurements=3")
if args.batch_sizes and not args.external_forks:
    parser.error("--batch-sizes requires --external-forks")
args.output.mkdir(parents=True, exist_ok=True)
tiers = {"interpreter": "-Xint", "c1": "-XX:TieredStopAtLevel=1",
         "c2": "-XX:-TieredCompilation"}

def fingerprint(paths):
    digest = hashlib.sha256()
    for path in sorted(set(paths)):
        if path.is_file():
            digest.update(str(path.resolve()).encode())
            with path.open('rb') as file:
                while chunk := file.read(1024 * 1024):
                    digest.update(chunk)
    return digest.hexdigest()

def jdk_fingerprint(jdk):
    paths = list((jdk / 'lib').glob('**/libjvm.*'))
    paths += list((jdk / 'lib').glob('**/libjava.*'))
    paths += [jdk / 'bin/server/jvm.dll', jdk / 'bin/client/jvm.dll', jdk / 'bin/java.dll']
    if (jdk / 'lib/modules').is_file():
        paths.append(jdk / 'lib/modules')
    else:
        paths += list((jdk / 'modules/java.base').rglob('*.class'))
    return fingerprint(paths)

classpath_files = []
for entry in args.classpath.split(os.pathsep):
    for name in glob.glob(entry):
        path = Path(name)
        if path.is_dir():
            classpath_files += list(path.rglob('*.class'))
            classpath_files += [path / 'META-INF/CompilerHints', path / 'META-INF/BenchmarkList']
        else:
            classpath_files.append(path)
classpath_id = fingerprint(classpath_files)
jdk_ids = {str(jdk): jdk_fingerprint(jdk) for jdk in (args.baseline, args.enabled)}

external_options = ""
if args.external_forks:
    # Non-forked JMH does not install its compiler directives. Reproduce the
    # normal full-blackhole directives explicitly, including generated hints
    # from every classpath entry. Forcing that supported mode avoids JMH's
    # blackhole autodetection, which would start another VM.
    hints = set()
    for entry in args.classpath.split(os.pathsep):
        for name in glob.glob(entry):
            path = Path(name)
            if path.is_dir():
                resource = path / "META-INF/CompilerHints"
                if resource.is_file():
                    hints.update(resource.read_text().splitlines())
            elif zipfile.is_zipfile(path):
                with zipfile.ZipFile(path) as jar:
                    if "META-INF/CompilerHints" in jar.namelist():
                        hints.update(jar.read("META-INF/CompilerHints").decode().splitlines())
    if not hints:
        parser.error("external forks require generated META-INF/CompilerHints on the classpath")
    directives = args.output / "compiler-hints.txt"
    directives.write_text("quiet\ninline,org/openjdk/jmh/infra/Blackhole.consume\n"
                          "dontinline,org/openjdk/jmh/infra/Blackhole.consumeCPU\n"
                          "dontinline,org/openjdk/jmh/infra/Blackhole.consumeFull\n"
                          + "\n".join(sorted(hints)) + "\n")
    external_options = (" -Djmh.blackhole.mode=FULL_DONTINLINE -XX:CompileCommandFile="
                        + shlex.quote(str(directives.resolve())))

def list_benchmarks(jdk, flags):
    launch = [str(jdk.resolve() / "bin/java"), *shlex.split(flags), "-cp", args.classpath,
              "org.openjdk.jmh.Main"]
    listing = subprocess.check_output([*launch, args.filter, "-l"], text=True)
    benchmarks = sorted({line for line in listing.splitlines() if line.startswith("org.openjdk.")})
    if not benchmarks:
        raise RuntimeError("no benchmarks matched")
    return benchmarks

def reusable(results, flags, forks, benchmarks, sizes=None, combined=True):
    # A matching filter and the union of sizes cannot establish completeness:
    # reject missing, extra or duplicate benchmark/size pairs as well.
    expected = {(benchmark, size) for benchmark in benchmarks
                for size in (args.sizes.split(",") if sizes is None else sizes)}
    try:
        pairs = [(r["benchmark"], r["params"]["size"]) for r in results]
        return (bool(results) and len(pairs) == len(expected) and set(pairs) == expected
                and all(r["forks"] == forks and r["jvmArgs"] == shlex.split(flags)
                        and r["warmupIterations"] == int(args.warmup)
                        and r["measurementIterations"] == int(args.measurements)
                        and (not args.external_forks or not combined or r.get("externalForks") == 2)
                        for r in results))
    except (KeyError, TypeError):
        return False

def external_forks(jdk, flags, target, resume, benchmarks):
    # Each benchmark/size/repetition gets a fresh VM. Only metadata extraction
    # and the fork control process differ from ordinary JMH forks; the generated
    # JMH harness still runs the warmup and measured iterations in that VM.
    launch = [str(jdk.resolve() / "bin/java"), *shlex.split(flags), "-cp", args.classpath,
              "org.openjdk.jmh.Main"]
    raw = args.output / "external" / target.name
    raw.mkdir(parents=True, exist_ok=True)
    results = []
    with target.with_suffix(".log").open("a" if resume else "w") as log:
        for benchmark in benchmarks:
            batches = {}
            if args.batch_sizes:
                for fork in range(2):
                    result = raw / f"{benchmark.rsplit('.', 1)[-1]}-batch-{fork}.json"
                    print(f"  {target.name} {benchmark.rsplit('.', 1)[-1]} all sizes fork {fork + 1}", flush=True)
                    rows = None
                    if resume and result.is_file():
                        try:
                            previous = json.loads(result.read_text())
                            if reusable(previous, flags, 0, [benchmark], combined=False):
                                rows = previous
                        except (ValueError, KeyError):
                            pass
                    if rows is None:
                        command = [*launch, "^" + re.escape(benchmark) + "$", "-p", "size=" + args.sizes,
                                   "-f", "0", "-wi", args.warmup, "-i", args.measurements,
                                   "-w", args.time, "-r", args.time, "-foe", "true",
                                   "-rf", "json", "-rff", str(result)]
                        subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
                        rows = json.loads(result.read_text())
                    if {r["params"]["size"] for r in rows} != set(args.sizes.split(",")):
                        raise RuntimeError(f"unexpected parameter batch in {result}")
                    batches[fork] = {r["params"]["size"]: r for r in rows}
            for size in args.sizes.split(","):
                parts = []
                for fork in range(2):
                    if args.batch_sizes:
                        parts.append(batches[fork][size])
                        continue
                    result = raw / f"{benchmark.rsplit('.', 1)[-1]}-{size}-{fork}.json"
                    print(f"  {target.name} {benchmark.rsplit('.', 1)[-1]} {size} fork {fork + 1}", flush=True)
                    command = [*launch, "^" + re.escape(benchmark) + "$", "-p", "size=" + size,
                               "-f", "0", "-wi", args.warmup, "-i", args.measurements,
                               "-w", args.time, "-r", args.time, "-foe", "true",
                               "-rf", "json", "-rff", str(result)]
                    previous = None
                    if resume and result.is_file():
                        try:
                            rows = json.loads(result.read_text())
                            if (reusable(rows, flags, 0, [benchmark], [size], combined=False)
                                    and len(rows[0]["primaryMetric"]["rawData"][0]) == 3):
                                previous = rows
                        except (ValueError, KeyError, IndexError):
                            pass
                    if previous is None:
                        subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
                    with result.open() as file:
                        rows = json.load(file)
                    if len(rows) != 1 or rows[0]["params"]["size"] != size:
                        raise RuntimeError(f"unexpected results in {result}")
                    parts.append(rows[0])
                combined = parts[0]
                metric = combined["primaryMetric"]
                samples = [p["primaryMetric"]["rawData"][0] for p in parts]
                flat = [value for sample in samples for value in sample]
                if len(flat) != 6:
                    raise RuntimeError("expected six measured samples")
                score = statistics.mean(flat)
                # Student t, two-sided 99.9% CI, five degrees of freedom.
                error = 6.868826625881279 * statistics.stdev(flat) / math.sqrt(6)
                metric.update(score=score, scoreError=error, scoreConfidence=[score - error, score + error],
                              rawData=samples)
                ordered = sorted(flat)
                def percentile(p):
                    position = p * (len(ordered) + 1) / 100
                    if position <= 1:
                        return ordered[0]
                    if position >= len(ordered):
                        return ordered[-1]
                    lower = math.floor(position)
                    return ordered[lower - 1] + (position - lower) * (ordered[lower] - ordered[lower - 1])
                metric["scorePercentiles"] = {p: percentile(float(p)) for p in metric["scorePercentiles"]}
                combined["externalForks"] = 2
                if args.batch_sizes:
                    combined["parameterBatching"] = True
                results.append(combined)
    with target.with_suffix(".json").open("w") as file:
        json.dump(results, file, indent=2)

for tier in args.tiers.split(","):
    for label, jdk in (("baseline", args.baseline), ("enabled", args.enabled)):
        flags = tiers[tier] + " -Xms512m -Xmx512m " + args.jvm_args + external_options
        extra = args.enabled_jvm_args if label == "enabled" else args.baseline_jvm_args
        if extra:
            flags += " " + extra
        benchmarks = list_benchmarks(jdk, flags)
        target = args.output / f"{tier}-{label}"
        manifest = dict(jdk=jdk_ids[str(jdk)], classpath=classpath_id, flags=flags,
                        filter=args.filter, benchmarks=benchmarks, sizes=args.sizes, forks=args.forks,
                        warmup=args.warmup, measurements=args.measurements,
                        time=args.time, external=args.external_forks, batch_sizes=args.batch_sizes)
        metadata = target.with_suffix('.run.json')
        if (args.resume and target.with_suffix(".json").is_file()
                and metadata.is_file() and json.loads(metadata.read_text()) == manifest):
            with target.with_suffix(".json").open() as previous:
                results = json.load(previous)
            if reusable(results, flags, 0 if args.external_forks else int(args.forks), benchmarks):
                print(f"Reusing {tier} {label}", flush=True)
                continue
        print(f"Running {tier} {label}: {jdk}", flush=True)
        if args.external_forks:
            resume = (args.resume and metadata.is_file()
                      and json.loads(metadata.read_text()) == manifest)
            metadata.write_text(json.dumps(manifest, indent=2) + '\n')
            external_forks(jdk, flags, target, resume, benchmarks)
            print(f"Finished {tier} {label}", flush=True)
            continue
        command = [str(args.enabled.resolve() / "bin/java"), "-Xint", *shlex.split(args.jvm_args),
                   "-cp", args.classpath,
                   "org.openjdk.jmh.Main", args.filter, "-jvm", str(jdk.resolve() / "bin/java"),
                   "-jvmArgs", flags, "-p", "size=" + args.sizes, "-f", args.forks,
                   "-wi", args.warmup, "-i", args.measurements,
                   "-w", args.time, "-r", args.time,
                   "-foe", "true", "-rf", "json", "-rff", str(target.with_suffix(".json"))]
        with target.with_suffix(".log").open("w") as log:
            subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
        metadata.write_text(json.dumps(manifest, indent=2) + '\n')
        print(f"Finished {tier} {label}", flush=True)
