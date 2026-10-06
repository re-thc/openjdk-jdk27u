#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This file is available under the GNU General Public License version 2.
# Recheck first-hash costs with independently forked, balanced configuration order.
set -euo pipefail
: "${BASELINE_JDK:?Set BASELINE_JDK}"
: "${CANDIDATE_JDK:?Set CANDIDATE_JDK}"
: "${JMH_CP:?Set JMH_CP}"
: "${JMH_PROCESSOR_CP:?Set JMH_PROCESSOR_CP}"
: "${RESULTS_DIR:?Set RESULTS_DIR}"
here=$(cd -- "$(dirname -- "$0")" && pwd)
repo=$(cd -- "$here/../../.." && pwd)
mkdir -p "$RESULTS_DIR/classes"
"$BASELINE_JDK/bin/javac" -cp "$JMH_CP" -processorpath "$JMH_PROCESSOR_CP" \
  -processor org.openjdk.jmh.generators.BenchmarkProcessor \
  -d "$RESULTS_DIR/classes" "$repo/test/micro/org/openjdk/bench/vm/gc/FourByteHeaders.java"
for gc in Serial G1 Z; do
  for fork in 1 2 3 4 5 6; do
    case $fork in
      1) layouts=(baseline8 default8 four4) ;;
      2) layouts=(four4 default8 baseline8) ;;
      3) layouts=(default8 baseline8 four4) ;;
      4) layouts=(four4 baseline8 default8) ;;
      5) layouts=(baseline8 four4 default8) ;;
      6) layouts=(default8 four4 baseline8) ;;
    esac
    for layout in "${layouts[@]}"; do
      jdk=$CANDIDATE_JDK
      flags=("-XX:+Use${gc}GC" -Xms512m -Xmx512m -XX:ActiveProcessorCount=4)
      [[ $layout != baseline8 ]] || jdk=$BASELINE_JDK
      [[ $layout != four4 ]] || flags+=(-XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders)
      "$BASELINE_JDK/bin/java" -cp "$RESULTS_DIR/classes:$JMH_CP" org.openjdk.jmh.Main \
        'org.openjdk.bench.vm.gc.FourByteHeaders.firstHash' -jvm "$jdk/bin/java" \
        -jvmArgs "${flags[*]}" -f 1 -wi 5 -i 5 -w 1s -r 1s -t 1 -prof gc \
        -rf json -rff "$RESULTS_DIR/hash-$layout-$gc-$fork.json" \
        > "$RESULTS_DIR/hash-$layout-$gc-$fork.log" 2>&1
    done
  done
done
