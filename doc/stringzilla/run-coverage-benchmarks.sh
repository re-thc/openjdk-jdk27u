#!/bin/bash
# Copyright (c) 2026, re-thc. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
# Usage: run-coverage-benchmarks.sh TEST_JDK JMH_CLASSPATH ORIGINAL_JAVA_CLASSES OUTPUT_DIR [CPU]
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
benchmark_cases=$(cd "$(dirname "$0")" && pwd)/coverage-cases.tsv
mkdir -p "$benchmark_output"
benchmark_pin=()
if [ "$#" -eq 5 ]; then benchmark_pin=(taskset -c "$5"); fi
unset JAVA_TOOL_OPTIONS _JAVA_OPTIONS JDK_JAVA_OPTIONS

controls=(enabled disabled original)
rotation=0
for backend in avx2 serial avx512; do
    case "$backend" in
        serial) avx=0 ;;
        avx2) avx=2 ;;
        avx512) avx=3 ;;
    esac
    for tier in interpreter c1 c2; do
        while IFS=$'\t' read -r id benchmark length coder position needle shape backends; do
            if [ "$id" = id ]; then continue; fi
            case ",$backends," in *",$backend,"*) ;; *) continue ;; esac
            params=(-p "length=$length" -p "needleLength=$needle")
            if [ "$shape" != - ]; then
                params+=(-p "shape=$shape")
            else
                params+=(-p "coder=$coder" -p "position=$position")
            fi
            # Rotate and interleave controls to reduce systematic run-order drift.
            for step in 0 1 2; do
                control=${controls[$(( (rotation + step) % 3 ))]}
                options=(-XX:ActiveProcessorCount=1 -XX:+UseSerialGC -Xshare:off "-XX:UseAVX=$avx")
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
                name=$backend-$tier-$id-$control
                "${benchmark_pin[@]}" "$benchmark_jdk/bin/java" "${options[@]}" \
                    -cp "$benchmark_classpath" org.openjdk.jmh.Main "$benchmark\$" \
                    "${params[@]}" -f 2 -wi 3 -w 500ms -i 5 -r 500ms -foe true \
                    -jvm "$benchmark_jdk/bin/java" -jvmArgs "${options[*]}" \
                    -rf json -rff "$benchmark_output/$name.json" \
                    > "$benchmark_output/$name.log" 2>&1
                printf '%s complete\n' "$name"
            done
            rotation=$((rotation + 1))
        done < "$benchmark_cases"
    done
done
