#!/usr/bin/env bash
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
#
set -euo pipefail

: "${BASELINE_JDK:?Set BASELINE_JDK to the unmodified JDK built with the same toolchain}"
: "${CANDIDATE_JDK:?Set CANDIDATE_JDK to the candidate release JDK}"
: "${RESULTS_DIR:?Set RESULTS_DIR outside the source tree}"
mode=${1:?Usage: run.sh footprint|memory|jmh|renaissance|startup}
here=$(cd -- "$(dirname -- "$0")" && pwd)
repo=$(cd -- "$here/../../.." && pwd)
results=$RESULTS_DIR
mkdir -p "$results" "$results/classes" "$results/scratch"

select_vm() {
  jdk=$CANDIDATE_JDK
  flags=("-XX:+Use${gc}GC" -Xms512m -Xmx512m "-XX:ActiveProcessorCount=${BENCH_PROCESSORS:-4}")
  case $layout in
    baseline8) jdk=$BASELINE_JDK ;;
    default8) flags+=(-XX:-UseFourByteObjectHeaders) ;;
    legacy12) flags+=(-XX:-UseCompactObjectHeaders) ;;
    four4) flags+=(-XX:+UseFourByteObjectHeaders) ;;
  esac
}

case $mode in
  footprint)
    "$BASELINE_JDK/bin/javac" -d "$results/classes" "$here/FootprintAgent.java" "$here/FootprintProbe.java"
    printf 'Premain-Class: FootprintAgent\n' > "$results/agent-manifest.txt"
    "$BASELINE_JDK/bin/jar" cfm "$results/footprint-agent.jar" "$results/agent-manifest.txt" -C "$results/classes" FootprintAgent.class
    for gc in Serial G1 Z; do
      for layout in baseline8 default8 legacy12 four4; do
        select_vm
        "$jdk/bin/java" "${flags[@]}" -javaagent:"$results/footprint-agent.jar" -cp "$results/classes" FootprintProbe > "$results/footprint-$layout-$gc.json"
      done
    done
    ;;
  memory)
    : "${RENAISSANCE_JAR:?Set RENAISSANCE_JAR to renaissance-gpl-0.16.1.jar}"
    "$BASELINE_JDK/bin/javac" -cp "$RENAISSANCE_JAR" -d "$results/classes" "$here/RetainedHeap.java"
    "$BASELINE_JDK/bin/jar" cf "$results/retained-heap.jar" -C "$results/classes" RetainedHeap.class
    for gc in Serial G1 Z; do
      for layout in baseline8 default8 legacy12 four4; do
        select_vm
        "$jdk/bin/java" "${flags[@]}" -jar "$RENAISSANCE_JAR" scrabble,scala-doku -r 3 --no-jvm-check --scratch-base "$results/scratch" --plugin "$results/retained-heap.jar!RetainedHeap" --json "$results/memory-$layout-$gc.json" > "$results/memory-$layout-$gc.log" 2>&1
      done
    done
    ;;
  jmh)
    : "${JMH_CP:?Set JMH_CP to the JMH 1.37 runtime dependency classpath}"
    : "${JMH_PROCESSOR_CP:?Set JMH_PROCESSOR_CP to the annotation processor and JMH core jars}"
    "$BASELINE_JDK/bin/javac" -cp "$JMH_CP" -processorpath "$JMH_PROCESSOR_CP" -processor org.openjdk.jmh.generators.BenchmarkProcessor -d "$results/classes" "$repo/test/micro/org/openjdk/bench/vm/gc/FourByteHeaders.java"
    # Alternate the configuration order by collector to reduce order effects.
    for gc in Serial G1 Z; do
      layouts=(baseline8 four4 default8 legacy12)
      [[ $gc != G1 ]] || layouts=(four4 baseline8 legacy12 default8)
      for layout in "${layouts[@]}"; do
        select_vm
        "$BASELINE_JDK/bin/java" -cp "$results/classes:$JMH_CP" org.openjdk.jmh.Main 'org.openjdk.bench.vm.gc.FourByteHeaders.*' -jvm "$jdk/bin/java" -jvmArgs "${flags[*]}" -f 3 -wi 5 -i 5 -w 1s -r 1s -t 1 -prof gc -rf json -rff "$results/jmh-$layout-$gc.json" > "$results/jmh-$layout-$gc.log" 2>&1
      done
    done
    ;;
  renaissance)
    : "${RENAISSANCE_JAR:?Set RENAISSANCE_JAR to renaissance-gpl-0.16.1.jar}"
    # Each repetition is an independent JVM; compare the last five operations.
    for fork in 1 2 3; do
      for gc in Serial G1 Z; do
        layouts=(baseline8 four4 default8 legacy12)
        [[ $fork != 2 ]] || layouts=(legacy12 default8 four4 baseline8)
        for layout in "${layouts[@]}"; do
          select_vm
          "$jdk/bin/java" "${flags[@]}" -jar "$RENAISSANCE_JAR" scrabble,scala-doku -r 10 --no-jvm-check --scratch-base "$results/scratch" --json "$results/perf-$layout-$gc-$fork.json" > "$results/perf-$layout-$gc-$fork.log" 2>&1
        done
      done
    done
    ;;
  startup)
    python3 "$here/startup.py" "$BASELINE_JDK" "$CANDIDATE_JDK" "$results/startup.csv"
    ;;
  *) printf 'Unknown mode: %s\n' "$mode" >&2; exit 2 ;;
esac
