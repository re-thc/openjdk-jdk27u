#!/bin/bash
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
# Usage: run-benchmarks.sh TEST_JDK JMH_CLASSPATH OUTPUT_DIR [CPU]
# JMH_FORKS=0 permits sequential in-process measurements on constrained hosts.
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
if [ "$#" -ge 4 ]; then benchmark_pin=(taskset -c "$4"); fi
benchmark_forks=${JMH_FORKS:-1}

run_group() {
    local group=$1 pattern=$2 sizes=$3 coders=$4 positions=$5
    local options=(-XX:ActiveProcessorCount=1 -XX:+UseSerialGC -Xshare:off "$tier_option" "$feature_option")
    local fork_options=()
    if [ "$benchmark_forks" != 0 ]; then
        fork_options=(-jvm "$benchmark_jdk/bin/java" -jvmArgs "${options[*]}")
    fi
    "${benchmark_pin[@]}" "$benchmark_jdk/bin/java" "${options[@]}" \
        -cp "$benchmark_classpath" org.openjdk.jmh.Main "$pattern" \
        -p length="$sizes" -p coder="$coders" -p position="$positions" -p needleLength=4 \
        -f "$benchmark_forks" -wi 3 -w 500ms -i 5 -r 500ms "${fork_options[@]}" \
        -rf json -rff "$benchmark_output/$tier-$feature-$group.json" \
        > "$benchmark_output/$tier-$feature-$group.log" 2>&1
    printf '%s %s %s complete\n' "$tier" "$feature" "$group"
}

for tier in c2 c1 interpreter; do
    case "$tier" in
        c2) tier_option=-XX:-TieredCompilation ;;
        c1) tier_option=-XX:TieredStopAtLevel=1 ;;
        interpreter) tier_option=-Xint ;;
    esac
    for feature in off on; do
        feature_option=-XX:-UseStringZillaIntrinsics
        if [ "$feature" = on ]; then feature_option=-XX:+UseStringZillaIntrinsics; fi
        run_group miss 'StringZillaSearch.(indexOf|lastIndexOf|indexOfChar|lastIndexOfChar)$' 32,256,4096 LATIN1,UTF16 MISS
        run_group boundary 'StringZillaSearch.(indexOf|lastIndexOf|indexOfChar|lastIndexOfChar)$' 4096 LATIN1,UTF16 START
        run_group equality 'StringZillaSearch.equals$' 32,4096 LATIN1,UTF16 EQUAL,START,END
        run_group callers 'StringZillaSearch.(builderIndexOf|bufferIndexOf|contains|replace)$' 4096 LATIN1,UTF16 MISS
        run_group mixed 'StringZillaSearch.(indexOf|lastIndexOf)$' 32,256,4096 MIXED MISS,END,REPEATED
        run_group mixed-boundary 'StringZillaSearch.indexOf$' 4096 MIXED START
        run_group mixed-character 'StringZillaSearch.(indexOfChar|lastIndexOfChar)$' 32,256 MIXED MISS
        if [ "$tier" != c2 ]; then
            run_group equality-prefix 'StringZillaSearch.equals$' 32,4096 LATIN1,UTF16 SECOND,PREFIX,MIDDLE,HIGH_BYTE
        fi
        if [ "$tier" = c2 ]; then
            run_group crossed 'StringZillaSearch.(indexOf|lastIndexOf)$' 4096 UTF16 CROSSED
        fi
    done
done
