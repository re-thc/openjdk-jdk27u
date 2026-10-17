# One bounded HexFormat integration decision

Status on 2026-10-17: source review milestone complete; integration qualification
incomplete. This document and the new workload/first-use sources have not been
built or run. They describe one future available-host execution batch, with one
useful decision at its end, followed by separately authorized integration
stages. No execution is authorized by merely adding this document.

## Exact source and evidence reconciliation

The remote `review/hexformat-simd` head inspected for this reconciliation was
`5eda47373a10c6bf9b05bcd06d2cadb99bf0c4ea`. Its baseline is
`89885a6288e7aaabd01678a704a586272c0f96e3`; its production integration parent is
`f9abae8f4d671ec25bc00f2d8f54c69d0f3fe5fd`. The dependency remains
`Nugine/simd` `dff9585c080896a9ebdb8d6dcabce17bd69a0874`, hex-simd/vsimd
0.9.0-dev and outref 0.5.1. The lockfile SHA-256 is
`c9e0c1f477d6afb94459ac1fde0afd70bac57c3dfebbf6554b85948d47a60e37`.

Historical local runtime evidence belongs to source commit
`1a5dfb6788077f0e26ca172677bf83edb82f5d44`, before the curated review history.
Its production Java/C code is unchanged at the inspected remote head; Rust
changes are comments, while compiler-path plumbing and tests were repaired.
That supports retaining the earlier runtime evidence, not claiming a full
rebuilt runtime at `5eda47373a1`. Historical artifact identities are retained in
README.md; future builds must record their own identities.

| Area | Existing evidence | Limit of the evidence |
| --- | --- | --- |
| Correctness | 96,808 differential checks per configuration on the prior runtime: Serial/G1/ZGC, compact strings on/off, startup disabling and genuine library absence; public bulk/small-stack checks also passed | The repaired source had a fresh Linux configure and isolated Rust archive build, not a full exact-head JDK build |
| Public API | Earlier normal jtreg run: 2 tests, 154 TestNG cases | No native target other than Linux x64 was executed |
| Startup/lifetime | Source reviews of bootstrap guard, lazy holder, loader-lock release before RegisterNatives, JNI region copies, bounded scratch and exception checks; disabled and absent-library runs | No recorded cold loading latency, concurrent first-use execution or process lifetime amortization |
| Allocation | Equal Java B/call in the recorded plain-call pairs; native ABI has no allocation in its conversion path | ThreadMXBean measures Java allocation, not process RSS or native allocations; the old harness did not reject unavailable allocation accounting |
| Performance | Final-threshold `jni-selected.csv`: 64 KiB encode 26,513/18,753 ns (1.41x), decode 101,559/16,750 ns (6.06x), reference/selected; Java allocation 131,112/131,112 B and 65,552/65,552 B | G1 Linux x64 screen, 180 ms warmup and five short samples, noisy smaller cases; no application or portable performance conclusion |
| Controls | Separate same-binary startup-disabled screen exists | Its header has encodeMin=512, not the published 1,024, and broad ranges; it cannot prove a precise current fallback-overhead percentage |
| Other targets/MSRV | Target mappings and source/path review; simulated multiword fixpath fixtures | Linux AArch64, macOS ARM64, Windows x64 and actual Rust/Cargo 1.85 execution remain unqualified |

The file named `jni-final.csv` also has encodeMin=512. It is superseded for
threshold claims by `jni-selected.csv` (encodeMin=1024/decodeMin=128). Historical
Git blob IDs for selected/final/control CSVs are, respectively,
`8d7022b4b4d687fb79394a7c43f845364d839d75`,
`86daf4cdddf50998e23da4402e1b3662621d5427`, and
`9849192693136c7c561a8833bf330265ab2e7677`, under the historical local commit's
`test/benchmarks/hex-simd/evidence/`. Those raw local records are not prerequisites
for running this plan and are not included in the curated review branch.

The much faster FFM prototype, its tiny crossovers and UUID experiment are
separate historical experiments. They cannot justify JNI thresholds. UUID
canonical single-call parsing/formatting lost there and remains dropped. No
UUID generation, RNG change, new intrinsic stub, assembly or SIMD kernel is in
this integration. The present direction is an optional JNI/library integration.

No additional runtime defect was identified by this source reconciliation.
The follow-up source changes make allocation accounting fail explicitly when
unavailable, allow the same measurement harness to run on the baseline JDK,
provide bounded timing settings and prepare protected/first-use workload models.
They do not constitute new correctness or performance evidence. The global
1,024/128 cutoffs remain provisional Linux choices.

## Scope, hosts and ownership

Stage 1 uses the suitable available Linux x64 host, its installed compatible
tools, and normal local worktrees/builds. It settles exact-head correctness and
whether the benefit justifies proceeding. It does not require four native
performance hosts. The supported-platform table below defines later scope, not
four prerequisites for Stage 1.

Do not transfer an older JDK binary, patch production classes into a borrowed VM,
install unmanaged tools, create CI, dispatch workflows, create a PR or merge.
Cargo may populate its normal cache from the existing exact manifest/lockfile;
all builds/tests then use the frozen cache. No HTTP client/server work is
included; qualification JVMs use only Serial/G1/ZGC.

| Host | Repository development profile | Required Rust host |
| --- | --- | --- |
| Linux x64 | x86-64-v3 / AVX2, generic tuning | x86_64-unknown-linux-gnu |
| Linux AArch64 | ARMv8.2-A, generic tuning | aarch64-unknown-linux-gnu |
| macOS ARM64 | Apple M1 | aarch64-apple-darwin |
| Windows x64 | AVX2, normal MSYS/MSVC build environment | x86_64-pc-windows-msvc |

Only a Linux x64 environment is currently selected. The mandatory Stage 1
hardware is one x86-64-v3/AVX2 host with the resource budget below and timing good
enough to pass the bounded controls. No additional native hardware is required
to get that result. Installed Boot JDK, jtreg, native compiler, compatible Rust
and its runtime redistribution notices are normal build prerequisites; the
selected workspace already has the compatible toolchain used previously.
Current local historical Rust/Cargo was 1.99.0. An actual 1.85 toolchain is needed
only to substantiate the declared minimum-version claim, not to decide Stage 1
with the compatible installed compiler. Carry untested MSRV forward explicitly;
do not install tools or silently raise the minimum here.
Linux's optional mold choice must match between baseline/candidate;
use the supported CONFIGURE_DEV_NO_MOLD=1 switch for both if mold is unavailable.
JMH is not installed in the selected workspace; this batch uses the existing
bounded standalone harness and does not add a JMH installation dependency.

The implementation owner owns preparing/running the batch once authorized,
source fixes, tool/path diagnosis, identity manifests, interpretation, and one
final recommendation. Ordinary Cargo cache preparation, baseline checkout,
measurement scripts and log handling are owned work, not user dependencies.
The Stage 1 quiet measurement slot is the only possible hardware/resource
dependency beyond the selected suitable host; an unstable control yields an
honest inconclusive result, not a demand for three more native hosts. Later
supported-platform correctness belongs to separately approved normal CI after
PR integration. Preparing its installed tooling/Cargo cache and enabled-option
test commands is owned integration work, not a request for user hardware.
Native performance on another architecture would require a representative host
only when making that specific additional performance claim. The maintainer's
acceptance of an explicitly maintained 0.9.0-dev pin and authorization for the
later PR/CI stage are separate decisions. No pin update or default enablement
is implied.

## Resource ceiling and stop rules

One host at a time. At most two build jobs, two Cargo jobs, one measurement JVM,
512 MiB measurement/test heaps, jtreg concurrency one, and a four-thread first-use
race. Use an 8 GiB process-tree RAM ceiling and 40 GiB new-disk ceiling. Prefer
the existing job/container supervisor for those ceilings and two CPU equivalents;
otherwise the owner supplies monitoring and terminates the process tree at the
ceilings using installed OS tools. This supervision is owned execution work,
not a request for another host. Make/JVM flags alone are not a native-memory cap.

Stage 1 hard wall ceiling: six hours on the available host. Sub-budgets:
90 minutes per clean JDK build (two), 45 minutes correctness/packaging, 50 minutes
measurements, five minutes fresh-process checks, 25 minutes disabled-reconfigure
cleanup, and remaining time for preparation and one final report. Terminate the
entire process tree at each budget, including child compiler/JVM processes.
If enforcement cannot be established, report the precise resource issue.
There is no automatic retry, extra fork, extended warmup or retuning campaign.

Stop the batch immediately on an identity mismatch, compile/link failure,
wrong native availability/route, crash, hang, JNI warning, exception/output
mismatch, lost source canary, missing notice/export/dependency, resource-limit
breach or unexpected collector/profile. Keep the first error and command.
Do not call infrastructure failure a performance rejection. Diagnose within the
remaining budget, make a concrete source-only repair if appropriate and report
qualification as incomplete for the changed artifact; do not recycle results
from another binary. If the available-host decisive performance gate fails,
recommend rejection or explicit deferral before proposing PR/CI integration.

## Freeze source and build matched images

The following commands are the future batch, not commands run in this
continuation. Run Stage 1 in the repository's normal Linux shell, with installed
BOOT_JDK and JTREG_HOME paths set. On the current Linux setup the existing
`/workspace/toolchains/activate.sh` supplies compatible tool paths; it is not a
portable prerequisite. Supply its usual platform configure options in
`platform_options`, identically for both images. Do not add new optimizations.

```sh
set -euo pipefail
# Start from the reviewed branch containing this plan; freeze the full ID.
: "${REVIEWED_Q:?Set the full reviewed source commit from the handoff}"
Q=$REVIEWED_Q
test "$(git rev-parse HEAD)" = "$Q"
B=89885a6288e7aaabd01678a704a586272c0f96e3
QUAL_ROOT="$PWD/../hex-qualification-${Q:0:12}"
mkdir -p "$QUAL_ROOT/logs"
git status --porcelain > "$QUAL_ROOT/logs/source-status.txt"
test ! -s "$QUAL_ROOT/logs/source-status.txt"
git worktree add --detach "$QUAL_ROOT/candidate" "$Q"
git worktree add --detach "$QUAL_ROOT/baseline" "$B"
printf '%s\n' "$Q" "$B" > "$QUAL_ROOT/logs/source-commits.txt"

# Define this as a Bash array of the host's existing platform options.
platform_options=()
common=(--with-debug-level=release --with-jobs=2 --with-memory-size=8192
  --with-version-opt=hex-qual --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME")
# Set these to installed executable paths; prefer installed 1.85 for the
# primary full build when settling MSRV on this host. Never add rustc arguments.
QUAL_CARGO=${QUAL_CARGO:-$(command -v cargo)}
QUAL_RUSTC=${QUAL_RUSTC:-$(command -v rustc)}

cd "$QUAL_ROOT/candidate"
"$QUAL_CARGO" fetch --locked --manifest-path src/java.base/share/native/libhexsimd/rust/Cargo.toml
bash bin/configure-dev "${common[@]}" "${platform_options[@]}" \
  --with-conf-name=hex-qual --enable-hex-simd CARGO="$QUAL_CARGO" RUSTC="$QUAL_RUSTC" \
  > "$QUAL_ROOT/logs/configure-candidate.txt" 2>&1
make CONF=hex-qual JOBS=2 images > "$QUAL_ROOT/logs/build-candidate.txt" 2>&1

cd "$QUAL_ROOT/baseline"
bash bin/configure-dev "${common[@]}" "${platform_options[@]}" \
  --with-conf-name=hex-base > "$QUAL_ROOT/logs/configure-baseline.txt" 2>&1
make CONF=hex-base JOBS=2 images > "$QUAL_ROOT/logs/build-baseline.txt" 2>&1

BASE_JDK="$QUAL_ROOT/baseline/build/hex-base/images/jdk"
CANDIDATE_JDK="$QUAL_ROOT/candidate/build/hex-qual/images/jdk"
cd "$QUAL_ROOT/candidate"
exp="$PWD/test/benchmarks/hex-simd"
export JAVA_HOME="$CANDIDATE_JDK" HEX_SIMD_OUT="$QUAL_ROOT/harness"
bash "$exp/build.sh" > "$QUAL_ROOT/logs/harness-build.txt" 2>&1
```

Record Q, B, dirty status, complete configure command/spec, compiler/linker/SDK
versions, `rustc -vV`, `cargo --version`, lockfile, CPU/ISA, OS, resource limits,
JDK `release`, VM version/flags and SHA-256 of java.base.jmod, lib/modules,
libjvm and libhexsimd. Use Python hashlib on every platform if native hash tools
differ. Preserve manifests/logs with the result; filenames alone are not identity.
Record and remove unreviewed JAVA_TOOL_OPTIONS, JDK_JAVA_OPTIONS, _JAVA_OPTIONS,
_JAVAC_OPTIONS, RUSTFLAGS and CARGO_ENCODED_RUSTFLAGS before the batch. Use the
explicit chosen compiler paths for the version record too. Record any required
normal runtime loader paths; do not change them between comparison images.
Check the configured collector feature list is exactly g1gc/serialgc/zgc and run
DevProfileSmoke.java directly with each of those flags. Do not use the broader
check-dev-profile.sh here because its negative checks start excluded collectors.
Inspect expected-only JNI exports and loader dependencies with `nm -D`/`ldd`
(Linux), `nm -gU`/`otool -L` (macOS), or `dumpbin /exports` and `/dependents`
(Windows). Check notices in the built jmod and image. Reject hardcoded system
library assumptions if the actual target reports otherwise.

## Correctness, first-use and packaging gates

```sh
# Separate full baseline/candidate builds on this host, without binary handoffs.
for checkout in candidate baseline; do
  if [[ $checkout == candidate ]]; then jdk=$CANDIDATE_JDK; expect=true
  else jdk=$BASE_JDK; expect=false; fi
  (cd "$QUAL_ROOT/$checkout" && "$BOOT_JDK/bin/java" -jar "$JTREG_HOME/lib/jtreg.jar" \
    -jdk:"$jdk" -conc:1 -w:"$QUAL_ROOT/jtreg-$checkout-work" \
    -r:"$QUAL_ROOT/jtreg-$checkout-report" -vmoption:-Dhexsimd.expectNative=$expect \
    test/jdk/java/util/HexFormat) > "$QUAL_ROOT/logs/jtreg-$checkout.txt" 2>&1
  for gc in Serial G1 Z; do
    "$jdk/bin/java" -Xms128m -Xmx512m -XX:ActiveProcessorCount=2 "-XX:+Use${gc}GC" \
      "$QUAL_ROOT/candidate/.github/scripts/DevProfileSmoke.java" \
      > "$QUAL_ROOT/logs/profile-$checkout-$gc.txt" 2>&1
  done
 done

cd "$QUAL_ROOT/candidate"
RUSTC="$QUAL_RUSTC" "$QUAL_CARGO" test --frozen --release --jobs 2 \
  --manifest-path src/java.base/share/native/libhexsimd/rust/Cargo.toml \
  --target-dir "$QUAL_ROOT/rust-test" > "$QUAL_ROOT/logs/rust-test.txt" 2>&1
"$CANDIDATE_JDK/bin/jlink" --module-path "$CANDIDATE_JDK/jmods" --add-modules java.base \
  --output "$QUAL_ROOT/base-image"
"$CANDIDATE_JDK/bin/jlink" --module-path "$CANDIDATE_JDK/jmods" --add-modules java.base \
  --exclude-files '**/*hexsimd*' --output "$QUAL_ROOT/no-library-image"
export HEX_SIMD_NO_LIBRARY_JDK="$QUAL_ROOT/no-library-image"
bash "$exp/verify.sh" > "$QUAL_ROOT/logs/verify-matrix.txt" 2>&1

for gc in Serial G1 Z; do
  for state in baseline disabled enabled absent; do
    opts="-Xms128m -Xmx512m -XX:ActiveProcessorCount=2 -XX:+Use${gc}GC -Xcheck:jni"
    case $state in
      baseline) jdk=$BASE_JDK; opts+=" -Dhexsimd.expectNative=false" ;;
      disabled) jdk=$CANDIDATE_JDK; opts+=" -Djdk.hexFormat.useNative=false -Dhexsimd.expectNative=false" ;;
      enabled) jdk=$CANDIDATE_JDK; opts+=" -Dhexsimd.expectNative=true" ;;
      absent) jdk=$HEX_SIMD_NO_LIBRARY_JDK; opts+=" -Dhexsimd.expectNative=false" ;;
    esac
    JAVA_HOME="$jdk" JAVA_OPTS="$opts" bash "$exp/run.sh" FirstUse race \
      > "$QUAL_ROOT/logs/first-race-$state-$gc.txt" 2>&1
  done
 done
```

The full matrix must distinguish library availability, actual successful native
decode for Latin1, compact-string-disabled/UTF16 fallback, late failed native
chunks remaining private and exact Java diagnostic replay. Existing longer
malformed-input coverage remains part of the suite. Check both java.base-only
images' lib/modules hashes match while the native file is absent only from the
excluded image. The public bulk test requests a 192 KiB stack; that is a platform
hint, not proof that every VM allocates exactly that size. Retain actual VM
minimum/rounding information when making a stack-size claim. Do not compare the
java.base-only module hashes with the full JDK's module image.
The standalone fixture already proved normalized path handling on the earlier
Linux run; native Windows building is the outstanding stronger test, not another
simulated-fixture repetition.

For an actual minimum-version result, choose installed 1.85 paths as QUAL_CARGO
and QUAL_RUSTC before the normal full candidate build above. This exercises the
real C link, image, native loading and correctness as well as Rust compilation.
An isolated Rust unit/archive probe alone cannot establish minimum-toolchain
JDK integration. If only the newer compatible compiler is installed, complete
Stage 1 with it and report that exact version; the untested minimum remains a
later support-claim check, not a blocker for the available-host benefit result.
Do not build an extra compiler/JDK matrix or install tools within this batch to
disguise that distinction.

## One steady-state measurement batch

No concurrent build/test work. Heap 512 MiB, ActiveProcessorCount=2, default tiered
compilation; no JNI checking or logging in throughput measurements. Bench warms
availability before measurement; `*-native` continues to mean the selected
public call, including Java fallback, not a claim about the actual route.
Three independently started processes per cell; no extra repetitions on noise.
Alternate the three states by round: baseline/disabled/enabled, then reverse,
then baseline/disabled/enabled. Compare both reference/selected within each VM
and the selected public calls across the matched baseline and candidate images.

```sh
cd "$QUAL_ROOT/candidate"
for round in 1 2 3; do
  states='baseline disabled enabled'
  if [[ $round == 2 ]]; then states='enabled disabled baseline'; fi
  for gc in G1 Serial Z; do
    for state in $states; do
      if [[ $state == baseline ]]; then jdk=$BASE_JDK; native=false; disable=''
      elif [[ $state == disabled ]]; then jdk=$CANDIDATE_JDK; native=false; disable='-Djdk.hexFormat.useNative=false'
      else jdk=$CANDIDATE_JDK; native=true; disable=''; fi
      opts="-Xms512m -Xmx512m -XX:ActiveProcessorCount=2 -XX:+Use${gc}GC $disable -Dhexsimd.expectNative=$native -Dhexsimd.warmupMs=1000 -Dhexsimd.sampleMs=100 -Dhexsimd.samples=5"
      sizes='0 32 128 1024 4096 65536'
      if [[ $gc == G1 ]]; then sizes='0 1 8 16 32 64 127 128 129 511 512 1023 1024 1025 4096 65536 1048576'; fi
      JAVA_HOME="$jdk" JAVA_OPTS="$opts" bash "$exp/run.sh" Bench $sizes \
        > "$QUAL_ROOT/logs/plain-$state-$gc-$round.csv"
      JAVA_HOME="$jdk" JAVA_OPTS="$opts" bash "$exp/run.sh" Bench protected \
        > "$QUAL_ROOT/logs/protected-$state-$gc-$round.csv"
      if [[ $gc == G1 ]]; then
        JAVA_HOME="$jdk" JAVA_OPTS="$opts -XX:-CompactStrings" bash "$exp/run.sh" Bench 32 128 1024 65536 \
          > "$QUAL_ROOT/logs/plain-utf16-$state-$round.csv"
        JAVA_HOME="$jdk" JAVA_OPTS="$opts -XX:-CompactStrings" bash "$exp/run.sh" Bench protected \
          > "$QUAL_ROOT/logs/protected-utf16-$state-$round.csv"
      fi
    done
  done
 done
python3 "$exp/summarize.py" "$QUAL_ROOT"/logs/plain-*.csv "$QUAL_ROOT"/logs/protected-*.csv \
  > "$QUAL_ROOT/logs/within-process-summary.txt"
```

`Protected` models SHA-256 plus 32-byte hex, colon-separated fingerprints,
uppercase encode with an offset, decode with a substring copy, arbitrary
CharSequence input creation/parsing, Appendable output, late invalid Latin1 and
UTF16 diagnostics, and 100 tiny encodes plus one 64 KiB encode. Each timed call
includes its conversion/allocation; mixed results all escape. The last model
reports one 101-operation workload, not a single conversion or a UUID batch.
Plain sizes and errors remain individually visible, so a mixed average cannot
hide a regression. These are fixed workload models, not a claim to have measured
the user's real application or I/O.

## Fresh-process cost, finite lifetime and cleanup

Use FirstUse directly, without run.sh/reference patch, for empty/tiny/encode/
decode/bulk-session. For each collector, perform five rounds in the same
alternating baseline/disabled/enabled order. Each cell is one fresh JVM.

Run the following collector under the five-minute phase supervisor:

```sh
python3 - "$QUAL_ROOT" "$BASE_JDK" "$CANDIDATE_JDK" "$HEX_SIMD_OUT/classes" <<'PY'
import csv, subprocess, sys, time
from pathlib import Path
root, baseline, candidate, classes = sys.argv[1:]
with (Path(root) / 'logs/cold.csv').open('w', newline='') as output:
    rows = csv.writer(output)
    rows.writerow(['gc', 'state', 'round', 'mode', 'process_wall_ns', 'public_call_ns', 'result_length'])
    for gc in ['G1', 'Serial', 'Z']:
        for round in range(1, 6):
            states = ['baseline', 'disabled', 'enabled']
            if round % 2 == 0: states.reverse()
            for state in states:
                java = Path(baseline if state == 'baseline' else candidate) / 'bin/java'
                if not java.is_file(): java = java.with_suffix('.exe')
                opts = ['-Xms128m', '-Xmx128m', '-XX:ActiveProcessorCount=2', '-XX:+Use' + gc + 'GC']
                if state == 'disabled': opts.append('-Djdk.hexFormat.useNative=false')
                for mode in ['empty', 'tiny', 'encode', 'decode', 'bulk-session']:
                    argv = [str(java), *opts, '-cp', classes, 'FirstUse', mode]
                    start = time.perf_counter_ns()
                    result = subprocess.run(argv, capture_output=True, text=True, timeout=10, check=True)
                    wall = time.perf_counter_ns() - start
                    (Path(root) / f'logs/cold-{state}-{gc}-{round}-{mode}.stderr').write_text(result.stderr)
                    reported_mode, call_ns, length = result.stdout.strip().split(',')
                    if reported_mode != mode: raise AssertionError(result.stdout)
                    rows.writerow([gc, state, round, mode, wall, int(call_ns), int(length)])
                    output.flush()
PY

for mode in empty tiny encode decode; do
  "$CANDIDATE_JDK/bin/java" -Xms128m -Xmx128m -XX:ActiveProcessorCount=2 \
    -XX:+UseG1GC -Xlog:library=debug -cp "$HEX_SIMD_OUT/classes" FirstUse "$mode" \
    > "$QUAL_ROOT/logs/cold-library-$mode.txt" 2>&1
done
```

Use Python `time.perf_counter_ns()` around
`subprocess.run(argv, capture_output=True, text=True, timeout=10, check=True)`;
record platform, Q, image identity, GC, state, round, mode, process wall ns and
FirstUse's reported public-call ns/result length to a CSV. Select java.exe on
Windows. The JVM does no helper lookup in these modes. All preparation before
the first call remains in process wall time. This is fresh-process cost with
normal OS caches, not a claim about an evicted filesystem/page cache.
Bulk-session includes first loading/dispatch and 128 calls in each direction
(8 MiB each); its result escapes. Separately run one enabled empty/tiny/encode/
decode with `-Xlog:library=debug` per host and retain the log: empty/tiny must not
load hexsimd, eligible calls must load it. These four logging runs are correctness
checks and are excluded from the timing CSV.

After measurements, retain the enabled image locally after recording hashes,
then reconfigure the SAME candidate output directory:

```sh
mv "$CANDIDATE_JDK" "$QUAL_ROOT/enabled-image"
cd "$QUAL_ROOT/candidate"
bash bin/configure-dev "${common[@]}" "${platform_options[@]}" \
  --with-conf-name=hex-qual --disable-hex-simd CARGO=/missing/cargo RUSTC=/missing/rustc \
  > "$QUAL_ROOT/logs/configure-disabled.txt" 2>&1
make CONF=hex-qual JOBS=2 images > "$QUAL_ROOT/logs/build-disabled.txt" 2>&1
JAVA_HOME="$CANDIDATE_JDK" \
  JAVA_OPTS='-Xms256m -Xmx512m -XX:ActiveProcessorCount=2 -XX:+UseG1GC -Xcheck:jni -Dhexsimd.expectNative=false -Dhexsimd.expectDecodeNative=false' \
  bash "$exp/run.sh" Correctness > "$QUAL_ROOT/logs/correctness-reconfigured.txt" 2>&1
"$CANDIDATE_JDK/bin/jmod" list "$CANDIDATE_JDK/jmods/java.base.jmod" \
  > "$QUAL_ROOT/logs/jmod-reconfigured.txt"
```

Confirm the new image/jmod omits
hexsimd and its owned notices/debug files, unrelated legal files remain, and
one G1 Correctness run has `-Dhexsimd.expectNative=false
-Dhexsimd.expectDecodeNative=false` without the startup disabling property.
This verifies enabled-to-disabled cleanup on a new artifact; it is not a repeat
of the disabled-property control.

## One result and decision

Require all correctness/build/startup/packaging gates first. Report the three
independent process medians and all five within-process observations, range and
Java B/call for each cell; do not treat five correlated samples as independent
forks or invent confidence intervals. Cross-image comparisons use the same
public selected operation. Carry the within-VM reference pairs as a consistency
check. Use these predeclared criteria, without adding measurements to rescue a
failure:

* Reject as inconclusive if disabled candidate versus baseline control drift
  exceeds max(10%, 5 ns/call) for valid plain/protected cases, or observations
  span over 2x within two of three forks at a decisive bulk size. Do not claim
  a speedup when the baseline/control cannot be trusted.
* At each retained native threshold (encode 1,024; decode 128), require at least
  1.10x speedup (disabled ns / enabled ns) in all three process medians. For
  steady 4 KiB and 64 KiB, require encode at least 1.20x and decode at least 2x
  for each Stage 1 collector. Sampled threshold results do not define a universal
  crossover.
* Valid tiny/fallback/fingerprint/digest/Appendable/CharSequence workloads must
  not regress against disabled candidate or baseline by more than max(5%, 5 ns)
  per reported call. The 101-call mix must not regress by over 5%. Compact-string-
  disabled paths are protected too. Treat borderline/noisy differences as
  unresolved, not an exact overhead guarantee.
* Invalid-input diagnostic work may regress by at most max(25%, 1 microsecond)
  per call, preserving the exact exception. This separately budgeted error cost
  acknowledges native validation followed by Java replay; do not hide it in a
  success average. Java allocation for ordinary valid calls must match baseline
  within 16 B/call measurement tolerance; explain every difference rather than
  calling ThreadMXBean native-memory accounting. Record process peak RSS as a
  footprint limit/observation, without labeling it allocation per call.
* Empty/tiny process-wall medians may grow by at most max(5%, 10 ms), and must
  not load the library. First eligible call median overhead must be at most
  20 ms. The complete cold bulk-session process wall time must beat disabled
  candidate AND baseline by at least 10% in the five-round median for each
  collector. Report the first-use cost and measured amortization point as well
  as steady throughput.
  Never average cold use away to claim a lifetime win.

Stage 1 ends with one of: reject this candidate, inconclusive with the named
build/timing/resource issue, or "exact-head Linux profile correctness and benefit
demonstrated; proceed to proposed PR integration." Report encode/decode outcomes
separately. If one route loses, recommend dropping it; a win elsewhere cannot
hide that loss. Keep default enablement and unrelated APIs/UUID out of scope.
The useful available-host result does not wait for three more performance hosts
or for a different installed Rust version.

Stage 2, only after separate PR integration/CI authorization, uses the existing
normal repository CI for supported-platform correctness: Linux x64/AArch64,
macOS ARM64 and Windows x64. It must build the actual enabled option with the
exact pin/frozen cache and notices, exercise Serial/G1/ZGC and compact-string
modes, assert actual native decode separately from availability, check malformed
input/fallback/startup races and enabled-to-disabled packaging. The commands in
the correctness section and verify.sh are reusable; baseline/performance loops
are not required on four CI hosts. Existing ordinary CI with hex-simd disabled
alone cannot qualify the optional enabled integration. Prepare any missing
normal managed tooling/cache setup in that separately approved integration;
do not add a workflow or dispatch anything in this continuation. Record actual
toolchain versions and settle untested MSRV before asserting its coverage.
These CI results establish correctness/build support, not portable speedups.

Stage 3 is optional, claim-specific native performance qualification. Only
promise another architecture/OS crossover or speedup after measuring its real
complete call path. A normal CI correctness pass is insufficient evidence for
that claim; lack of a performance host does not erase a positive Stage 1 result
or prevent proposing Stage 2. Maintain a clear per-target measured/unmeasured
table. Completion of integration and its support claims requires Stage 2; a
published review branch alone is not completion.

A source repair or threshold change after frozen Q invalidates the relevant
artifact's result. Report that artifact and a complete replacement batch, not a
chain of tiny rerun approvals. All proposed execution remains unrun here.
