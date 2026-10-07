#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This file is available under the GNU General Public License version 2.
# Compare Renaissance's ordinary database workload in independent JVMs.
set -euo pipefail
: "${BASELINE_JDK:?Set BASELINE_JDK}"
: "${CANDIDATE_JDK:?Set CANDIDATE_JDK to the default-four-byte image}"
: "${RENAISSANCE_JAR:?Set RENAISSANCE_JAR}"
: "${RESULTS_DIR:?Set RESULTS_DIR}"
mode=${1:-timing}
here=$(cd -- "$(dirname -- "$0")" && pwd)
mkdir -p "$RESULTS_DIR" "$RESULTS_DIR/scratch" "$RESULTS_DIR/classes"
gc=${DATABASE_GC:-default}
if [[ $mode == memory ]]; then
  "$BASELINE_JDK/bin/javac" -J-XX:ActiveProcessorCount=2 -cp "$RENAISSANCE_JAR" \
    -d "$RESULTS_DIR/classes" "$here/RetainedHeap.java"
  "$BASELINE_JDK/bin/jar" -J-XX:ActiveProcessorCount=2 cf "$RESULTS_DIR/retained-heap.jar" \
    -C "$RESULTS_DIR/classes" RetainedHeap.class
  forks=${DATABASE_FORKS:-3}
  repeats=3
elif [[ $mode == timing ]]; then
  forks=${DATABASE_FORKS:-12}
  repeats=${DATABASE_REPEATS:-16}
else
  printf 'Usage: database.sh timing|memory\n' >&2
  exit 2
fi
first_fork=${DATABASE_FIRST_FORK:-1}
[[ $first_fork =~ ^[1-9][0-9]*$ && $forks =~ ^[1-9][0-9]*$ && $first_fork -le $forks ]]
for ((fork=first_fork; fork<=forks; fork++)); do
  layouts=(baseline8 default4)
  ((fork % 2)) || layouts=(default4 baseline8)
  for layout in "${layouts[@]}"; do
    jdk=$CANDIDATE_JDK
    [[ $layout != baseline8 ]] || jdk=$BASELINE_JDK
    flags=(-Xms512m -Xmx512m -XX:ActiveProcessorCount=4 -XX:+PrintFlagsFinal
      --enable-native-access=ALL-UNNAMED --add-opens=java.base/java.nio=ALL-UNNAMED
      --add-exports=java.base/sun.nio.ch=ALL-UNNAMED)
    [[ $gc == default ]] || flags+=("-XX:+Use${gc}GC")
    extra=()
    [[ $mode != memory ]] || extra=(--plugin "$RESULTS_DIR/retained-heap.jar!RetainedHeap")
    name="db-$mode-$layout-$gc-$fork"
    printf '%s\n' "$name"
    "$jdk/bin/java" "${flags[@]}" -jar "$RENAISSANCE_JAR" db-shootout \
      -r "$repeats" --no-jvm-check --scratch-base "$RESULTS_DIR/scratch" \
      "${extra[@]}" --json "$RESULTS_DIR/$name.json" > "$RESULTS_DIR/$name.log" 2>&1
    # Check the actual candidate default; no enabling flag is passed.
    if [[ $layout == default4 ]]; then
      rg -q 'UseFourByteObjectHeaders[[:space:]]+= true' "$RESULTS_DIR/$name.log"
    fi
  done
done
