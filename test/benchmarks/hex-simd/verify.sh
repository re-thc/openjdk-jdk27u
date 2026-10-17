#!/usr/bin/env bash
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
repo=$(cd "$here/../../.." && pwd)
: "${JAVA_HOME:?Set JAVA_HOME to the normally built production JDK}"
out=${HEX_SIMD_OUT:-"$repo/build/hex-simd-production"}
mkdir -p "$out"
extra_vm=${HEX_SIMD_VERIFY_VM_OPTIONS:-}
for gc in G1 Serial Z; do
    for compact in + -; do
        decode_native=false
        if [[ $compact == + ]]; then decode_native=true; fi
        JAVA_OPTS="$extra_vm -Xms256m -Xmx512m -XX:ActiveProcessorCount=2 -XX:+Use${gc}GC -XX:${compact}CompactStrings -Xcheck:jni -Dhexsimd.expectNative=true -Dhexsimd.expectDecodeNative=$decode_native" \
            bash "$here/run.sh" Correctness > "$out/correctness-${gc}-${compact}.txt" 2>&1
        cat "$out/correctness-${gc}-${compact}.txt"
        JAVA_OPTS="$extra_vm -Xms256m -Xmx512m -XX:ActiveProcessorCount=2 -XX:+Use${gc}GC -XX:${compact}CompactStrings -Xcheck:jni -Dhexsimd.expectNative=true" \
            bash "$here/run.sh" BulkHexFormatTest > "$out/bulk-${gc}-${compact}.txt" 2>&1
        cat "$out/bulk-${gc}-${compact}.txt"
    done
done
JAVA_OPTS="$extra_vm -Xms256m -Xmx512m -XX:ActiveProcessorCount=2 -XX:+UseG1GC -XX:+CompactStrings -Xcheck:jni -Djdk.hexFormat.useNative=false -Dhexsimd.expectNative=false -Dhexsimd.expectDecodeNative=false" \
    bash "$here/run.sh" Correctness > "$out/correctness-disabled.txt" 2>&1
cat "$out/correctness-disabled.txt"
if [[ -n ${HEX_SIMD_NO_LIBRARY_JDK:-} ]]; then
    JAVA_HOME="$HEX_SIMD_NO_LIBRARY_JDK" \
        JAVA_OPTS="$extra_vm -Xms256m -Xmx512m -XX:ActiveProcessorCount=2 -XX:+UseG1GC -XX:+CompactStrings -Xcheck:jni -Dhexsimd.expectNative=false -Dhexsimd.expectDecodeNative=false" \
        bash "$here/run.sh" Correctness > "$out/correctness-no-library.txt" 2>&1
    cat "$out/correctness-no-library.txt"
fi
