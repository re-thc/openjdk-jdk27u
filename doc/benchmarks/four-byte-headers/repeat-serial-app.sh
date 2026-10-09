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
    [[ $layout != default8 ]] || flags+=(-XX:-UseFourByteObjectHeaders)
    [[ $layout != four4 ]] || flags+=(-XX:+UseFourByteObjectHeaders)
    "$jdk/bin/java" "${flags[@]}" -jar "$RENAISSANCE_JAR" scrabble,scala-doku \
      -r 10 --no-jvm-check --scratch-base "$RESULTS_DIR/scratch" \
      --json "$RESULTS_DIR/app-$layout-Serial-$fork.json" \
      > "$RESULTS_DIR/app-$layout-Serial-$fork.log" 2>&1
  done
done
