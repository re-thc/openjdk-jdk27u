#!/usr/bin/env bash
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
repo=$(cd "$here/../../.." && pwd)
: "${JAVA_HOME:?Set JAVA_HOME to the normally built production JDK}"
out=${HEX_SIMD_OUT:-"$repo/build/hex-simd-production"}
mkdir -p "$out"
for gc in G1 Serial Z; do
    for compact in + -; do
        JAVA_OPTS="-Xms256m -Xmx512m -XX:+Use${gc}GC -XX:${compact}CompactStrings -Xcheck:jni -Dhexsimd.expectNative=true" \
            bash "$here/run.sh" Correctness > "$out/correctness-${gc}-${compact}.txt" 2>&1
        cat "$out/correctness-${gc}-${compact}.txt"
        JAVA_OPTS="-Xms256m -Xmx512m -XX:+Use${gc}GC -XX:${compact}CompactStrings -Xcheck:jni -Dhexsimd.expectNative=true" \
            bash "$here/run.sh" BulkHexFormatTest > "$out/bulk-${gc}-${compact}.txt" 2>&1
        cat "$out/bulk-${gc}-${compact}.txt"
    done
done
JAVA_OPTS='-Xms256m -Xmx512m -Xcheck:jni -Djdk.hexFormat.useNative=false -Dhexsimd.expectNative=false' \
    bash "$here/run.sh" Correctness > "$out/correctness-disabled.txt" 2>&1
cat "$out/correctness-disabled.txt"
if [[ -n ${HEX_SIMD_NO_LIBRARY_JDK:-} ]]; then
    JAVA_HOME="$HEX_SIMD_NO_LIBRARY_JDK" \
        JAVA_OPTS='-Xms256m -Xmx512m -Xcheck:jni -Dhexsimd.expectNative=false' \
        bash "$here/run.sh" Correctness > "$out/correctness-no-library.txt" 2>&1
    cat "$out/correctness-no-library.txt"
fi
