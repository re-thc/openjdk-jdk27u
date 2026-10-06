#!/bin/bash
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
# Usage: run-bounded-benchmarks.sh TEST_JDK JMH_CLASSPATH OUTPUT_DIR [CPU]
# Run before and after sequentially, after all builds and tests finish.
set -euo pipefail
jdk=$(cd "$1" && pwd)
cp=$2
out=$3
mkdir -p "$out"
benchmark_pin=()
if [ "$#" -ge 4 ]; then benchmark_pin=(taskset -c "$4"); fi
run() {
 name=$1; tier=$2; shift 2
 options=(-XX:ActiveProcessorCount=1 -XX:+UseSerialGC -Xshare:off -XX:+UseStringZillaIntrinsics)
 if [ "$tier" = interpreter ]; then options+=(-Xint); fi
 if [ "$tier" = c1 ]; then options+=(-XX:TieredStopAtLevel=1); fi
 if [ "$tier" = c2 ]; then options+=(-XX:-TieredCompilation); fi
 "${benchmark_pin[@]}" "$jdk/bin/java" "${options[@]}" -cp "$cp" org.openjdk.jmh.Main "$@" -f 2 -wi 3 -w 500ms -i 5 -r 500ms -jvm "$jdk/bin/java" -jvmArgs "${options[*]}" -rf json -rff "$out/$name-$tier.json" > "$out/$name-$tier.log" 2>&1
 printf '%s %s complete\n' "$name" "$tier"
}
run equality-small c1 'StringZillaSearch.equals$' -p length=4,32 -p coder=LATIN1,UTF16 -p position=EQUAL,START -p needleLength=4
for tier in interpreter c1 c2; do
 run crossed "$tier" 'StringZillaLongNeedle.lastIndexOf$' -p length=4096 -p needleLength=4 -p shape=CROSSED
 run near-end "$tier" 'StringZillaLongNeedle.lastIndexOf$' -p length=512,4096 -p needleLength=64,256 -p shape=NEAR_END
 run near-start "$tier" 'StringZillaLongNeedle.lastIndexOf$' -p length=512 -p needleLength=64 -p shape=NEAR_START
done
for tier in c1 c2; do
 run equality-large "$tier" 'StringZillaSearch.equals$' -p length=131072 -p coder=LATIN1,UTF16 -p position=EQUAL -p needleLength=4
done
