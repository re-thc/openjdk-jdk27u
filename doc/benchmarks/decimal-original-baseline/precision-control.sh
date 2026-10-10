#!/usr/bin/env bash
set -euo pipefail
root=/workspace/review2
mkdir -p "$root/precision"
for round in 1 2 3; do
    order='original final java'
    if [[ "$round" == 2 ]]; then order='final java original'; fi
    if [[ "$round" == 3 ]]; then order='java original final'; fi
    for variant in $order; do
        jdk_dir="$root/final-jdk"; flags=''
        if [[ "$variant" == original ]]; then jdk_dir=/workspace/baseline-jdk; fi
        if [[ "$variant" == java ]]; then flags='-XX:-UseZmijIntrinsics'; fi
        taskset -c 4 "$jdk_dir/bin/java" -cp "$root/bench-classes:/workspace/jmh/*" org.openjdk.jmh.Main \
            'org.openjdk.bench.java.lang.ZmijFormatting.(bigDecimalValueOf|doubleRandom|floatRandom|floatAppend|floatConcat)$' \
            -jvm "$jdk_dir/bin/java" \
            -jvmArgsAppend "--add-modules=jdk.incubator.vector --add-exports=java.base/jdk.internal.math=ALL-UNNAMED -Xshare:off -Xms256m -Xmx256m -Xbatch -XX:-TieredCompilation $flags" \
            -f 1 -wi 5 -i 5 -w 1s -r 1s -prof gc -foe true -rf json \
            -rff "$root/precision/c2-$round-$variant.json" > "$root/precision/c2-$round-$variant.log" 2>&1
        echo "Completed precision-c2-$round-$variant"
    done
done
