#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

set -euo pipefail
root=$(cd "$(dirname "$0")/.." && pwd)
image=${1:?complete image}; source_tree=${2:?matching JDK source tree}
label=${3:?unique evidence label}; jtreg=${JTREG_HOME:?}/bin/jtreg
classes="$root/build/qualification-$label"
mkdir -p "$classes" "$root/evidence"
"$image/bin/javac" -d "$classes" "$source_tree/test/jdk/java/util/Arrays/NativePrimitiveSort.java"
for mode in int c1 avx0 avx2 nointrinsic optout headers stack c2; do
  opts=()
  case "$mode" in
    int) opts=(-Xint);; c1) opts=(-XX:TieredStopAtLevel=1);;
    avx0) opts=(-XX:UseAVX=0);; avx2) opts=(-XX:UseAVX=2);;
    nointrinsic) opts=(-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_arraySort,_arrayPartition);;
    optout) opts=(-Djdk.util.Arrays.disableNativeSort=true);;
    headers) opts=(-XX:-UseCompactObjectHeaders);; stack) opts=(-Xss256k);;
    c2) opts=(-XX:-TieredCompilation -Xbatch);;
  esac
  "$image/bin/java" -Xmx1g "${opts[@]}" -cp "$classes:$root/build" NativePrimitiveSort quick > "$root/evidence/$label-mode-$mode.log" 2>&1
done
for gc in G1 Serial Z; do
  "$image/bin/java" --enable-native-access=ALL-UNNAMED -Xms512m -Xmx1g "-XX:+Use${gc}GC" -cp "$classes:$root/build" PublicConcurrent > "$root/evidence/$label-concurrent-$gc.log" 2>&1
done
"$jtreg" -jdk:"$image" -w:"$root/evidence/$label-jdk-work" -r:"$root/evidence/$label-jdk-report" -conc:1 -timeoutFactor:4 -verbose:summary "$source_tree/test/jdk/java/util/Arrays/Sorting.java" "$source_tree/test/jdk/java/util/Arrays/SortingNearlySortedPrimitive.java" "$source_tree/test/jdk/java/util/Arrays/NativePrimitiveSort.java" "$source_tree/test/jdk/java/util/Arrays/NativePrimitiveSortDeoptimization.java" > "$root/evidence/$label-jdk.log" 2>&1
"$jtreg" -jdk:"$image" -w:"$root/evidence/$label-hotspot-work" -r:"$root/evidence/$label-hotspot-report" -conc:1 -timeoutFactor:4 -verbose:summary "$source_tree/test/hotspot/jtreg/compiler/intrinsics/SortingDeoptimizationTest.java" "$source_tree/test/hotspot/jtreg/compiler/vectorization/TestOffsetSorting.java" > "$root/evidence/$label-hotspot.log" 2>&1
