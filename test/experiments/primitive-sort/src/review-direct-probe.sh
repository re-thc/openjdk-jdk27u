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
r=$(cd "$(dirname "$0")/.." && pwd)
image="$r/images/release-fd19ce8f589"
mkdir -p "$r/build/review-probe-src/java/util" "$r/build/review-probe-patch"
cat > "$r/build/review-probe-src/java/util/PrimitiveSortReview.java" <<'JAVA'
package java.util;
public class PrimitiveSortReview {
 public static void direct(long[] a,int lo,int hi){DualPivotQuicksort.sort(a,0,lo,hi);}
 public static void guarded(long[] a,int lo,int hi){if(!PrimitiveSort.preferJava(a,lo,hi-lo))throw new AssertionError();DualPivotQuicksort.sort(a,0,lo,hi);}
}
JAVA
"$image/bin/javac" --patch-module "java.base=$r/build/review-probe-src" -d "$r/build/review-probe-patch" "$r/build/review-probe-src/java/util/PrimitiveSortReview.java"
"$image/bin/javac" --patch-module "java.base=$r/build/review-probe-patch" -cp "$r/build" -d "$r/build" "$r/src/ReviewDirectProbe.java"
for pair in 0 1 2 3; do
 "$image/bin/java" --patch-module "java.base=$r/build/review-probe-patch" --enable-native-access=ALL-UNNAMED -Xms512m -Xmx1g -XX:CICompilerCount=2 -cp "$r/build" "-Dpair=$pair" ReviewDirectProbe > "$r/evidence/review-direct-$pair.csv" 2> "$r/evidence/review-direct-$pair.err"
done
