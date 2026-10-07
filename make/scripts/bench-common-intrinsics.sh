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
#/

# Usage: bench-common-intrinsics.sh JAVA JMH_CLASSPATH OUTPUT_DIR [CPU]
set -euo pipefail
java_bin=${1:?Provide the built JDK java executable}
benchmark_classpath=${2:?Provide JMH and generated benchmark jars}
result_dir=${3:?Provide an output directory}
runner=()
if [[ $# -ge 4 ]]; then runner=(taskset -c "$4"); fi
mkdir -p "$result_dir"
for tier in int c1 c2; do
    case "$tier" in
        int) tier_flag=-Xint ;;
        c1) tier_flag=-XX:TieredStopAtLevel=1 ;;
        c2) tier_flag=-XX:-TieredCompilation ;;
    esac
    for state in off on; do
        if [[ $state == on ]]; then
            intrinsic_flag=-XX:+UseCommonIntrinsics
        else
            intrinsic_flag=-XX:-UseCommonIntrinsics
        fi
        "${runner[@]}" "$java_bin" -cp "$benchmark_classpath" org.openjdk.jmh.Main \
            'org.openjdk.bench.vm.compiler.Common(Scalar)?Intrinsics.*' \
            -wi 3 -i 5 -w 300ms -r 300ms -f 3 -t 1 \
            -jvmArgsAppend "$tier_flag $intrinsic_flag -Xms128m -Xmx128m -XX:ActiveProcessorCount=1" \
            -rf json -rff "$result_dir/$tier-$state.json" \
            > "$result_dir/$tier-$state.log" 2>&1
    done
done
