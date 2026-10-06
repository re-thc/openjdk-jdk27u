#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This file is available under the GNU General Public License version 2.
set -euo pipefail
: "${BASELINE_JDK:?Set BASELINE_JDK}"
: "${CANDIDATE_JDK:?Set CANDIDATE_JDK}"
: "${RENAISSANCE_JAR:?Set RENAISSANCE_JAR}"
: "${RESULTS_DIR:?Set RESULTS_DIR}"
for fork in 1 2 3; do
  case $fork in
    1) layouts=(baseline8 default8 four4) ;;
    2) layouts=(four4 baseline8 default8) ;;
    3) layouts=(default8 four4 baseline8) ;;
  esac
  for layout in "${layouts[@]}"; do
    jdk=$CANDIDATE_JDK
    flags=(-XX:+UseSerialGC -Xms512m -Xmx512m -XX:ActiveProcessorCount=4)
    [[ ${MEMORY_NO_TLAB:-false} != true ]] || flags+=(-XX:-UseTLAB)
    [[ $layout != baseline8 ]] || jdk=$BASELINE_JDK
    [[ $layout != four4 ]] || flags+=(-XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders)
    "$jdk/bin/java" "${flags[@]}" -jar "$RENAISSANCE_JAR" scrabble,scala-doku \
      -r 3 --no-jvm-check --scratch-base "$RESULTS_DIR/scratch" \
      --plugin "$RESULTS_DIR/retained-heap.jar!RetainedHeap" \
      --json "$RESULTS_DIR/${MEMORY_RESULT_PREFIX:-memcheck}-$layout-Serial-$fork.json" \
      > "$RESULTS_DIR/${MEMORY_RESULT_PREFIX:-memcheck}-$layout-Serial-$fork.log" 2>&1
  done
done
