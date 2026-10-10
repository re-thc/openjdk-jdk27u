#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only.
set -euo pipefail
if [[ $# -lt 3 ]]; then
    echo "Usage: $0 JDK_HOME JMH_CLASSPATH RESULTS_DIRECTORY [JMH_OPTIONS...]" >&2
    exit 1
fi
jdk_dir=$(realpath "$1")
jmh_classpath=$2
result_dir=$(realpath -m "$3")
shift 3
repo_dir=$(cd "$(dirname "$0")/../.." && pwd)
mkdir -p "$result_dir/classes"
"$jdk_dir/bin/javac" --add-modules jdk.incubator.vector --add-exports java.base/jdk.internal.math=ALL-UNNAMED \
    -cp "$jmh_classpath" -processor org.openjdk.jmh.generators.BenchmarkProcessor \
    -d "$result_dir/classes" \
    "$repo_dir/test/micro/org/openjdk/bench/java/lang/ZmijFormatting.java"
read -r -a tiers <<< "${ZMIJ_TIERS:-interpreter c1 c2}"
read -r -a variants <<< "${ZMIJ_VARIANTS:-java zmij jni}"
for tier in "${tiers[@]}"; do
    case "$tier" in
        interpreter) tier_flags='-Xint' ;;
        c1) tier_flags='-Xbatch -XX:TieredStopAtLevel=1' ;;
        c2) tier_flags='-Xbatch -XX:-TieredCompilation' ;;
        *) echo "Unknown execution tier: $tier" >&2; exit 1 ;;
    esac
    for variant in "${variants[@]}"; do
        case "$variant" in
            java) variant_flags='-XX:-UseZmijIntrinsics' ;;
            zmij) variant_flags='-XX:+UseZmijIntrinsics' ;;
            jni) variant_flags='-XX:+UseZmijIntrinsics -XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_formatZmij,_decimalZmij' ;;
            *) echo "Unknown variant: $variant" >&2; exit 1 ;;
        esac
        "$jdk_dir/bin/java" -cp "$result_dir/classes:$jmh_classpath" org.openjdk.jmh.Main \
            "${ZMIJ_BENCHMARKS:-org.openjdk.bench.java.lang.ZmijFormatting.*}" \
            -jvm "$jdk_dir/bin/java" \
            -jvmArgsAppend "--add-modules=jdk.incubator.vector --add-exports=java.base/jdk.internal.math=ALL-UNNAMED -Xms256m -Xmx256m $tier_flags $variant_flags" \
            -foe true -rf json -rff "$result_dir/$tier-$variant.json" "$@" \
            > "$result_dir/$tier-$variant.log" 2>&1
    done
done
