#!/bin/bash
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
# Usage: run-long-needle-benchmarks.sh TEST_JDK JMH_CLASSPATH ORIGINAL_JAVA_CLASSES OUTPUT_DIR [CPU]
set -euo pipefail

usage() {
    printf 'Usage: %s TEST_JDK JMH_CLASSPATH ORIGINAL_JAVA_CLASSES OUTPUT_DIR [CPU]\n' "${0##*/}"
}

if [ "$#" -eq 1 ] && { [ "$1" = --help ] || [ "$1" = -h ]; }; then
    usage
    exit 0
fi
if [ "$#" -lt 4 ] || [ "$#" -gt 5 ]; then
    usage >&2
    exit 2
fi

benchmark_jdk=$(cd "$1" && pwd)
benchmark_classpath=$2
benchmark_original=$(cd "$3" && pwd)
benchmark_output=$4
mkdir -p "$benchmark_output"
benchmark_pin=()
if [ "$#" -eq 5 ]; then
    benchmark_pin=(taskset -c "$5")
fi

for tier in interpreter c1 c2; do
    for control in enabled disabled original; do
        options=(-XX:ActiveProcessorCount=1 -XX:+UseSerialGC -Xshare:off
                 "-XX:UseAVX=${STRINGZILLA_USE_AVX:-2}")
        case "$tier" in
            interpreter) options+=(-Xint) ;;
            c1) options+=(-XX:TieredStopAtLevel=1) ;;
            c2) options+=(-XX:-TieredCompilation) ;;
        esac
        case "$control" in
            enabled) options+=(-XX:+UseStringZillaIntrinsics) ;;
            disabled) options+=(-XX:-UseStringZillaIntrinsics) ;;
            original) options+=(-XX:-UseStringZillaIntrinsics "--patch-module=java.base=$benchmark_original") ;;
        esac
        for shape in NEAR_END OVERLAP CROSSED; do
            length=4096
            needle=256
            if [ "$shape" = OVERLAP ]; then length=512; needle=129; fi
            if [ "$shape" = CROSSED ]; then needle=4; fi
            name=$control-$tier-$shape
            "${benchmark_pin[@]}" "$benchmark_jdk/bin/java" "${options[@]}" \
                -cp "$benchmark_classpath" org.openjdk.jmh.Main 'StringZillaLongNeedle.lastIndexOf$' \
                -p length="$length" -p needleLength="$needle" -p shape="$shape" \
                -f 2 -wi 3 -w 500ms -i 5 -r 500ms \
                -jvm "$benchmark_jdk/bin/java" -jvmArgs "${options[*]}" \
                -rf json -rff "$benchmark_output/$name.json" \
                > "$benchmark_output/$name.log" 2>&1
            printf '%s complete\n' "$name"
        done
    done
done
