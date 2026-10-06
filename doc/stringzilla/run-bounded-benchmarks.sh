#!/bin/bash
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
# Usage: run-bounded-benchmarks.sh TEST_JDK JMH_CLASSPATH OUTPUT_DIR [CPU]
# Run before and after sequentially, after all builds and tests finish.
set -euo pipefail

usage() {
    printf 'Usage: %s TEST_JDK JMH_CLASSPATH OUTPUT_DIR [CPU]\n' "${0##*/}"
}

if [ "$#" -eq 1 ] && { [ "$1" = --help ] || [ "$1" = -h ]; }; then
    usage
    exit 0
fi
if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
    usage >&2
    exit 2
fi

benchmark_jdk=$(cd "$1" && pwd)
benchmark_classpath=$2
benchmark_output=$3
mkdir -p "$benchmark_output"
benchmark_pin=()
if [ "$#" -eq 4 ]; then
    benchmark_pin=(taskset -c "$4")
fi

run() {
    local name=$1 tier=$2
    shift 2
    local options=(-XX:ActiveProcessorCount=1 -XX:+UseSerialGC -Xshare:off -XX:+UseStringZillaIntrinsics)
    case "$tier" in
        interpreter) options+=(-Xint) ;;
        c1) options+=(-XX:TieredStopAtLevel=1) ;;
        c2) options+=(-XX:-TieredCompilation) ;;
    esac
    "${benchmark_pin[@]}" "$benchmark_jdk/bin/java" "${options[@]}" \
        -cp "$benchmark_classpath" org.openjdk.jmh.Main "$@" \
        -f 2 -wi 3 -w 500ms -i 5 -r 500ms \
        -jvm "$benchmark_jdk/bin/java" -jvmArgs "${options[*]}" \
        -rf json -rff "$benchmark_output/$name-$tier.json" \
        > "$benchmark_output/$name-$tier.log" 2>&1
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
