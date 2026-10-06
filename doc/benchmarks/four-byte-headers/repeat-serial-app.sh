#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This file is available under the GNU General Public License version 2.
set -euo pipefail
: "${BASELINE_JDK:?Set BASELINE_JDK}"
: "${CANDIDATE_JDK:?Set CANDIDATE_JDK}"
: "${RENAISSANCE_JAR:?Set RENAISSANCE_JAR}"
: "${RESULTS_DIR:?Set RESULTS_DIR}"
for ((fork=${APP_FIRST_FORK:-1}; fork<=${APP_LAST_FORK:-12}; fork++)); do
  case $(((fork - 1) % 6 + 1)) in
    1) layouts=(baseline8 default8 four4) ;;
    2) layouts=(four4 default8 baseline8) ;;
    3) layouts=(default8 baseline8 four4) ;;
    4) layouts=(four4 baseline8 default8) ;;
    5) layouts=(baseline8 four4 default8) ;;
    6) layouts=(default8 four4 baseline8) ;;
  esac
  for layout in "${layouts[@]}"; do
    jdk=$CANDIDATE_JDK
    flags=(-XX:+UseSerialGC -Xms512m -Xmx512m -XX:ActiveProcessorCount=4)
    [[ $layout != baseline8 ]] || jdk=$BASELINE_JDK
    [[ $layout != four4 ]] || flags+=(-XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders)
    "$jdk/bin/java" "${flags[@]}" -jar "$RENAISSANCE_JAR" scrabble,scala-doku \
      -r 10 --no-jvm-check --scratch-base "$RESULTS_DIR/scratch" \
      --json "$RESULTS_DIR/app-$layout-Serial-$fork.json" \
      > "$RESULTS_DIR/app-$layout-Serial-$fork.log" 2>&1
  done
done
