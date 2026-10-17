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
ACTIVE_PGID=
MONITOR_PID=
stop_group() {
    if [[ -n $ACTIVE_PGID ]]; then
        kill -TERM -- "-$ACTIVE_PGID" 2>/dev/null || true
        for attempt in {1..10}; do
            if ! kill -0 -- "-$ACTIVE_PGID" 2>/dev/null; then break; fi
            sleep 1
        done
        kill -KILL -- "-$ACTIVE_PGID" 2>/dev/null || true
        for attempt in {1..20}; do
            if ! kill -0 -- "-$ACTIVE_PGID" 2>/dev/null; then return 0; fi
            sleep 0.1
        done
        echo "termination uncertain for process group $ACTIVE_PGID; aborting" >&2
        return 1
    fi
    return 0
}
cleanup() {
    local status=$? monitor_was_dead=0 monitor_forced=0
    trap - EXIT TERM INT
    trap '' USR1
    if ! stop_group; then status=125; fi
    if [[ -n $MONITOR_PID ]]; then
        if ! kill -0 "$MONITOR_PID" 2>/dev/null || ! kill -USR2 "$MONITOR_PID" 2>/dev/null; then
            monitor_was_dead=1
            status=125
        fi
    fi
    if (( monitor_was_dead )); then echo 'RSS observer was already gone before planned cleanup; observation is incomplete' >&2; fi
    if [[ -n $MONITOR_PID ]]; then
        for attempt in {1..20}; do
            if ! kill -0 "$MONITOR_PID" 2>/dev/null; then break; fi
            sleep 0.1
        done
        if kill -0 "$MONITOR_PID" 2>/dev/null; then
            monitor_forced=1
            status=125
            kill -KILL "$MONITOR_PID" 2>/dev/null || true
            sleep 0.1
        fi
        if kill -0 "$MONITOR_PID" 2>/dev/null; then
            echo "termination uncertain for RSS observer pid $MONITOR_PID; aborting" >&2
            status=125
        else
            if wait "$MONITOR_PID" 2>/dev/null; then :; else status=125; fi
        fi
        if (( monitor_forced )); then echo 'RSS observer required SIGKILL; observation is incomplete' >&2; fi
    fi
    exit "$status"
}
trap cleanup EXIT
trap 'exit 124' TERM
trap 'exit 130' INT
trap 'exit 125' USR1
bounded() {
    local duration=$1 result finished
    shift
    if ! kill -0 "$MONITOR_PID" 2>/dev/null; then
        echo 'RSS observer is not running; aborting' >&2
        return 125
    fi
    setsid timeout --signal=TERM --kill-after=15s "$duration" "$@" &
    ACTIVE_PGID=$!
    printf '%s\n' "$ACTIVE_PGID" > "$OUT/active-pgid.tmp"
    mv "$OUT/active-pgid.tmp" "$OUT/active-pgid"
    if wait -n -p finished "$ACTIVE_PGID" "$MONITOR_PID"; then result=0; else result=$?; fi
    if [[ ${finished:-} != "$ACTIVE_PGID" ]] || ! kill -0 "$MONITOR_PID" 2>/dev/null; then
        # Stop work before any diagnostic I/O, which may itself be failing.
        stop_group || return 125
        echo 'RSS observation ended unexpectedly; aborting' >&2
        return 125
    fi
    stop_group || return 125
    ACTIVE_PGID=
    printf '0\n' > "$OUT/active-pgid.tmp"
    mv "$OUT/active-pgid.tmp" "$OUT/active-pgid"
    return "$result"
}
[[ $(uname -m) == x86_64 && $(uname -s) == Linux ]]
[[ $(git -C "$REPO" rev-parse "$CANDIDATE:src") == 4ac402957e32a6c54e566bdbee2d85f6e471b336 ]]
[[ $(git -C "$REPO" rev-parse "$CANDIDATE:test") == 46360397de0a70009ef238781d3ea9e77c0565a9 ]]
git -C "$REPO" merge-base --is-ancestor c5f0e0b4918007062a500594a9640c4ecffa8e9c "$CANDIDATE"
git -C "$REPO" diff --exit-code "$CANDIDATE" -- doc/scanner-qualification
PERF_CPU=${PERF_CPU:-$(awk '/Cpus_allowed_list:/ {split($2, cpu, /[-,]/); print cpu[1]}' /proc/self/status)}
[[ $PERF_CPU =~ ^[0-9]+$ ]]
export PERF_CPU
printf '0\n' > "$OUT/active-pgid"
python3 "$REPO/doc/scanner-qualification/watch-memory.py" "$$" "$OUT" > "$OUT/memory-monitor.stdout" 2> "$OUT/memory-monitor.stderr" &
MONITOR_PID=$!
for attempt in {1..50}; do
    if [[ -e $OUT/memory-ready ]]; then break; fi
    kill -0 "$MONITOR_PID" 2>/dev/null || { echo 'RSS observer failed to start' >&2; exit 125; }
    sleep 0.1
done
[[ -e $OUT/memory-ready ]] || { echo 'RSS observer readiness deadline' >&2; exit 125; }
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
        bounded 90m make CONF=scanner JOBS=4 jdk images
        popd > /dev/null
    image="$OUT/$checkout/build/scanner/images/jdk"
    cp "$image/release" "$OUT/$checkout-release.txt"
    cp "$OUT/$checkout/build/scanner/configure.log" "$OUT/$checkout-configure.log"
    sha256sum "$image/lib/modules" "$image/lib/server/libjvm.so" >> "$OUT/identity.txt"
    for gc in G1 Serial Z; do
        bounded 1m "$image/bin/java" -Xms32m -Xmx128m "-XX:+Use${gc}GC" -Xlog:cds=info -version > "$OUT/$checkout-$gc-cds.txt" 2>&1
        grep -Eq 'Mapped static +region #0' "$OUT/$checkout-$gc-cds.txt" # Default CDS must actually map.
    done
    [[ $(du -sm "$OUT" | cut -f1) -le 25600 ]]
done
export BASE_JDK="$OUT/base/build/scanner/images/jdk" CANDIDATE_JDK="$OUT/candidate/build/scanner/images/jdk"
export Q="$OUT/candidate/doc/scanner-qualification"
mkdir "$OUT/classes" "$OUT/modules"
bounded 5m "$BOOT_JDK/bin/javac" -d "$OUT/modules" --module-source-path "$OUT/candidate/test/jdk/java/util/Scanner/locale" -m provider
bounded 5m "$BOOT_JDK/bin/javac" --module-path "$OUT/modules" --add-modules provider \
    --add-exports java.base/sun.util.locale.provider=ALL-UNNAMED -d "$OUT/classes" "$Q"/*.java
sha256sum "$Q"/*.java "$Q/run-linux.sh" "$Q/watch-memory.py" > "$OUT/harness-sha256.txt"
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
    bounded 1m "$OUT/$checkout/build/scanner/images/jdk/bin/java" \
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
