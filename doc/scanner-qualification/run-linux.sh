#!/usr/bin/env bash
# Source-prepared Stage A only. Read README.md before execution.
set -euo pipefail
set +m # Background stages inherit this group until setsid isolates them.
if [[ ${1:-} != --bounded ]]; then
    exec timeout --signal=TERM --kill-after=15s 6h bash "$0" --bounded "$@"
fi
shift
[[ $# == 3 ]] || { echo 'usage: TOOLCHAINS=<installed root> bash run-linux.sh <repo> <candidate SHA> <new output directory>' >&2; exit 2; }
(( BASH_VERSINFO[0] > 5 || (BASH_VERSINFO[0] == 5 && BASH_VERSINFO[1] >= 1) )) || {
    echo 'Bash5.1 or newer is required for interruptible stage/observer waits' >&2; exit 2;
}
: "${TOOLCHAINS:?use the existing GCC16/JDK27/jtreg8.3 toolchain root}"
REPO=$(cd "$1" && pwd)
CANDIDATE=$(git -C "$REPO" rev-parse "$2^{commit}")
BASE=89885a6288e7aaabd01678a704a586272c0f96e3
mkdir "$3"
OUT=$(cd "$3" && pwd)
exec > >(tee "$OUT/campaign.log") 2>&1
unset JAVA_TOOL_OPTIONS JDK_JAVA_OPTIONS _JAVA_OPTIONS
source "$TOOLCHAINS/activate.sh"
export BOOT_JDK="$TOOLCHAINS/jdk27" JTREG="$TOOLCHAINS/jtreg83"
export JAVA_HOME="$BOOT_JDK" JTREG_JAVA="$BOOT_JDK/bin/java" JTREG_HOME="$JTREG"
export OUT BOOT_JDK JTREG
CONTROL="$REPO/doc/scanner-qualification/stage-control.py"
ACTIVE_PID=
ACTIVE_STAGE=
MONITOR_PID=
STAGE_NUMBER=0
CONTROL_PIDS=()
control() {
    # Bash's wait is interruptible by TERM/USR1; foreground Python I/O is not.
    python3 "$CONTROL" "$@" &
    local helper=$!
    CONTROL_PIDS+=("$helper")
    wait "$helper"
}
stop_stage() {
    if [[ -n $ACTIVE_PID ]]; then
        local status=0
        control stop-stage "$ACTIVE_STAGE" "$ACTIVE_PID" || status=125
        if control terminal-stage "$ACTIVE_STAGE" "$ACTIVE_PID"; then
            # wait-n may have returned the observer instead of this owned child.
            wait "$ACTIVE_PID" 2>/dev/null || true
        else
            status=125
        fi
        return "$status"
    fi
}
cleanup() {
    local status=$?
    trap - EXIT
    trap '' TERM INT USR1
    if ! stop_stage; then status=125; fi
    if [[ -n $MONITOR_PID ]]; then
        if ! control stop-observer "$OUT" "$MONITOR_PID"; then status=125; fi
        # Only Bash can reap this direct child. Never wait on an unverified live
        # observer: the outer timeout remains the final bound on uncertainty.
        if control terminal-observer "$OUT" "$MONITOR_PID"; then
            if wait "$MONITOR_PID" 2>/dev/null; then :; else status=125; fi
        else
            status=125
        fi
    fi
    for helper in "${CONTROL_PIDS[@]}"; do wait "$helper" 2>/dev/null || true; done
    exit "$status"
}
trap cleanup EXIT
trap 'exit 124' TERM
trap 'exit 130' INT
trap 'exit 125' USR1
bounded_stage() {
    local kind=$1 duration=$2 result finished
    shift 2
    control health "$OUT" "$MONITOR_PID" || return 125
    STAGE_NUMBER=$((STAGE_NUMBER + 1))
    ACTIVE_STAGE="$OUT/stages/$STAGE_NUMBER"
    mkdir "$ACTIVE_STAGE"
    setsid python3 "$CONTROL" "$kind" "$ACTIVE_STAGE" "$OUT/owner.json" "$duration" "$@" &
    ACTIVE_PID=$!
    printf '%s\n' "$ACTIVE_STAGE" > "$OUT/active-stage.tmp"
    mv "$OUT/active-stage.tmp" "$OUT/active-stage"
    control ready-stage "$ACTIVE_STAGE" "$ACTIVE_PID" || return 125
    control health "$OUT" "$MONITOR_PID" || return 125
    touch "$ACTIVE_STAGE/go"
    if wait -n -p finished "$ACTIVE_PID" "$MONITOR_PID"; then result=0; else result=$?; fi
    if [[ ${finished:-} != "$ACTIVE_PID" ]] || ! control health "$OUT" "$MONITOR_PID"; then
        stop_stage || return 125
        echo 'RSS observation ended unexpectedly; aborting' >&2
        return 125
    fi
    stop_stage || return 125
    ACTIVE_PID=
    ACTIVE_STAGE=
    printf '\n' > "$OUT/active-stage.tmp"
    mv "$OUT/active-stage.tmp" "$OUT/active-stage"
    return "$result"
}
bounded() { bounded_stage stage "$@"; }
bounded_build() { bounded_stage build-stage "$@"; }
[[ $(uname -m) == x86_64 && $(uname -s) == Linux ]]
[[ $(git -C "$REPO" rev-parse "$CANDIDATE:src") == 4ac402957e32a6c54e566bdbee2d85f6e471b336 ]]
[[ $(git -C "$REPO" rev-parse "$CANDIDATE:test") == 46360397de0a70009ef238781d3ea9e77c0565a9 ]]
git -C "$REPO" merge-base --is-ancestor c5f0e0b4918007062a500594a9640c4ecffa8e9c "$CANDIDATE"
git -C "$REPO" diff --exit-code "$CANDIDATE" -- doc/scanner-qualification
PERF_CPU=${PERF_CPU:-$(awk '/Cpus_allowed_list:/ {split($2, cpu, /[-,]/); print cpu[1]}' /proc/self/status)}
[[ $PERF_CPU =~ ^[0-9]+$ ]]
export PERF_CPU
mkdir "$OUT/stages"
printf '\n' > "$OUT/active-stage"
control owner "$$" "$OUT/owner.json"
python3 "$REPO/doc/scanner-qualification/watch-memory.py" "$OUT/owner.json" "$OUT" > "$OUT/memory-monitor.stdout" 2> "$OUT/memory-monitor.stderr" &
MONITOR_PID=$!
control ready-observer "$OUT" "$MONITOR_PID"
control images "$OUT" > "$OUT/image-paths.txt"
mapfile -t JDK_IMAGES < "$OUT/image-paths.txt"
[[ ${#JDK_IMAGES[@]} == 2 ]]
export BASE_JDK="${JDK_IMAGES[0]}" CANDIDATE_JDK="${JDK_IMAGES[1]}"
printf 'baseline=%s\ncandidate=%s\n' "$BASE" "$CANDIDATE" > "$OUT/identity.txt"
uname -a >> "$OUT/identity.txt"
cat /etc/os-release >> "$OUT/identity.txt"
lscpu >> "$OUT/identity.txt"
printf 'performance_cpu=%s\n' "$PERF_CPU" >> "$OUT/identity.txt"
bounded 5m git -C "$REPO" worktree add --detach "$OUT/base" "$BASE"
bounded 5m git -C "$REPO" worktree add --detach "$OUT/candidate" "$CANDIDATE"
for checkout in base candidate; do
        pushd "$OUT/$checkout" > /dev/null
        bounded 10m bash configure \
            --with-conf-name=scanner --with-debug-level=release --with-jobs=4 \
            --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG" --with-jvm-features=-shenandoahgc \
            --with-toolchain-path="$TOOLCHAINS/gcc16/bin" \
            --with-extra-ldflags="-fuse-ld=mold -B$TOOLCHAINS/mold/bin" \
            --with-freetype=system --with-freetype-include="$TOOLCHAINS/sysroot/usr/include/freetype2" \
            --with-freetype-lib="$TOOLCHAINS/sysroot/usr/lib/x86_64-linux-gnu" \
            --x-includes="$TOOLCHAINS/sysroot/usr/include" --x-libraries="$TOOLCHAINS/sysroot/usr/lib/x86_64-linux-gnu" \
            --with-cups-include="$TOOLCHAINS/sysroot/usr/include" --with-fontconfig-include="$TOOLCHAINS/sysroot/usr/include" \
            --with-alsa-include="$TOOLCHAINS/sysroot/usr/include" --with-alsa-lib="$TOOLCHAINS/sysroot/usr/lib/x86_64-linux-gnu"
        bounded_build 90m make CONF=scanner JOBS=4 jdk images
        popd > /dev/null
    if [[ $checkout == base ]]; then image=$BASE_JDK; else image=$CANDIDATE_JDK; fi
    control check-image "$image"
    cp "$image/release" "$OUT/$checkout-release.txt"
    cp "$OUT/$checkout/build/scanner/configure.log" "$OUT/$checkout-configure.log"
    sha256sum "$image/lib/modules" "$image/lib/server/libjvm.so" >> "$OUT/identity.txt"
    for gc in G1 Serial Z; do
        bounded 1m "$image/bin/java" -Xms32m -Xmx128m "-XX:+Use${gc}GC" -Xlog:cds=info -version > "$OUT/$checkout-$gc-cds.txt" 2>&1
        grep -Eq 'Mapped static +region #0' "$OUT/$checkout-$gc-cds.txt" # Default CDS must actually map.
    done
    [[ $(du -sm "$OUT" | cut -f1) -le 25600 ]]
done
export Q="$OUT/candidate/doc/scanner-qualification"
mkdir "$OUT/classes" "$OUT/modules"
bounded 5m "$BOOT_JDK/bin/javac" -d "$OUT/modules" --module-source-path "$OUT/candidate/test/jdk/java/util/Scanner/locale" -m provider
bounded 5m "$BOOT_JDK/bin/javac" --module-path "$OUT/modules" --add-modules provider \
    --add-exports java.base/sun.util.locale.provider=ALL-UNNAMED -d "$OUT/classes" "$Q"/*.java
sha256sum "$Q"/*.java "$Q"/*.sh "$Q"/*.py > "$OUT/harness-sha256.txt"
bounded 45m bash -c '
    set -euo pipefail
    cd "$OUT/candidate/test/jdk/java/util/Scanner"
    compatibility=(ScanTest.java EncodingTest.java FailingConstructors.java ScannerStreamTest.java
        spi/UseLocaleWithProvider.java LazyLocale.java locale/EagerLocaleProviders.java
        locale/LocaleProviderPreference.java locale/NonDecimalFormatLocale.java)
    for gc in G1 Serial Z; do
        "$JTREG/bin/jtreg" -jdk:"$BASE_JDK" -conc:2 "-javaoptions:-XX:+Use${gc}GC" \
            -w:"$OUT/base-$gc-work" -r:"$OUT/base-$gc-report" "${compatibility[@]}"
        "$JTREG/bin/jtreg" -jdk:"$CANDIDATE_JDK" -conc:2 "-javaoptions:-XX:+Use${gc}GC" \
            -w:"$OUT/candidate-$gc-work" -r:"$OUT/candidate-$gc-report" .
    done
'
# Untimed current-settings HOST route/output parity, not mutable-setting timing.
for checkout in base candidate; do
    if [[ $checkout == base ]]; then image=$BASE_JDK; else image=$CANDIDATE_JDK; fi
    bounded 1m "$image/bin/java" \
        --add-exports java.base/sun.util.locale.provider=ALL-UNNAMED -Djava.locale.providers=HOST,CLDR \
        -cp "$OUT/classes" ScannerHost > "$OUT/$checkout-host.txt"
done
diff -u "$OUT/base-host.txt" "$OUT/candidate-host.txt"
bounded 10m bash -c '
    set -euo pipefail
    for image in "$BASE_JDK" "$CANDIDATE_JDK"; do
        for mode in integer double scan-int mixed invalid radix big-int big-decimal german arabic locale debug spi-text host-text line tokens large-line; do
            providers=CLDR
            locale=(-Duser.language=en -Duser.country=US)
            if [[ $mode == spi-text ]]; then providers=SPI,CLDR; fi
            if [[ $mode == host-text ]]; then providers=HOST,CLDR; locale=(); fi
            "$image/bin/java" -Xms32m -Xmx128m -XX:+UseG1GC "-Djava.locale.providers=$providers" "${locale[@]}" \
                --module-path "$OUT/modules" --add-modules provider -cp "$OUT/classes" ScannerPhases "$mode" check
        done
    done
'
bounded 90m taskset -c "$PERF_CPU" bash -c '
    set -euo pipefail
    for gc in G1 Serial Z; do
        for stage in cold allocation legacy phases; do
            "$BOOT_JDK/bin/java" -Xmx256m -Dscanner.modules="$OUT/modules" -cp "$OUT/classes" ScannerCampaign \
                "$stage" "$BASE_JDK" "$CANDIDATE_JDK" "$OUT/$gc-$stage" "$gc" linux-x64
        done
    done
'
[[ $(du -sm "$OUT" | cut -f1) -le 25600 ]]
echo 'Measurements complete. Apply the frozen README gates to every protected cell; this is not an automatic qualification pass.'
