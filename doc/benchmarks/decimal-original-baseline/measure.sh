#!/usr/bin/env bash
set -euo pipefail
root=/workspace/review2
classpath="$root/bench-classes:/workspace/jmh/*"
mkdir -p "$root/matrix" "$root/jni" "$root/constructor"
run_case() {
    local jdk_dir=$1 result=$2 group=$3 workloads=$4 tier=$5 flags=$6 duration=$7 profiler=$8
    local tier_flags='-Xint'
    case "$tier" in
        c1) tier_flags='-Xbatch -XX:TieredStopAtLevel=1' ;;
        c2) tier_flags='-Xbatch -XX:-TieredCompilation' ;;
    esac
    local profile_flags=()
    if [[ "$profiler" == gc ]]; then profile_flags=(-prof gc); fi
    taskset -c 4 "$jdk_dir/bin/java" -cp "$classpath" org.openjdk.jmh.Main \
        "org.openjdk.bench.java.lang.$group.($workloads)$" \
        -jvm "$jdk_dir/bin/java" \
        -jvmArgsAppend "--add-modules=jdk.incubator.vector --add-exports=java.base/jdk.internal.math=ALL-UNNAMED -Xshare:off -Xms256m -Xmx256m $tier_flags $flags" \
        -f 1 -wi 3 -i 3 -w "$duration" -r "$duration" -foe true \
        -rf json -rff "$result.json" "${profile_flags[@]}" > "$result.log" 2>&1
    echo "Completed $(basename "$result")"
}
for group in ZmijFormatting FastFloatParsing; do
    case "$group" in
        ZmijFormatting) workloads='doubleRandom|floatRandom|floatConcat|doubleAppend|floatAppend|doublePutLatin1|bigDecimalShortInteger|bigDecimalValueOf|decimalFormatDecimal|formatterGeneral|doubleTinySubnormal|floatTinySubnormal'; kind=format ;;
        FastFloatParsing) workloads='parseDoubleShortInput|parseFloatShortInput|parseDoubleDecimal|parseFloatDecimal|parseDoubleDoubleRoundTrip|parseFloatFloatRoundTrip|parseDoubleLongInput|parseFloatLongInput|decimalFormatDigits|decimalFormatDigitsLong|bigDecimalDoubleCached|bigDecimalFloatCached'; kind=parse ;;
    esac
    for tier in c2 c1 interpreter; do
        for round in 1 2 3; do
            order='original final'
            if [[ "$round" == 2 ]]; then order='final original'; fi
            for variant in $order; do
                jdk_dir=/workspace/baseline-jdk
                if [[ "$variant" == final ]]; then jdk_dir="$root/final-jdk"; fi
                run_case "$jdk_dir" "$root/matrix/$kind-$tier-$round-$variant" "$group" "$workloads" "$tier" '' 500ms gc
            done
        done
    done
done
for tier in c2 c1 interpreter; do
    for round in 1 2 3; do
        run_case "$root/final-jdk" "$root/jni/$tier-$round" FastFloatParsing \
            'parseDoubleShortInput|parseFloatShortInput|parseDoubleDecimal|parseFloatDecimal' "$tier" \
            '-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=_parseFastFloat,_parseFastFloatDigits' 500ms gc
    done
done
for round in 1 2 3; do
    case "$round" in
        1) order='before final original_constructor' ;;
        2) order='original_constructor before final' ;;
        3) order='final original_constructor before' ;;
    esac
    for variant in $order; do
        jdk_dir="$root/final-jdk"; flags=''
        case "$variant" in
            before) jdk_dir="$root/before-jdk" ;;
            original_constructor) flags="--patch-module=java.base=$root/constructor-patch" ;;
        esac
        run_case "$jdk_dir" "$root/constructor/c2-$round-$variant" ZmijFormatting \
            'doubleRandom|floatRandom|floatConcat|floatAppend' c2 "$flags" 1s gc
    done
done
