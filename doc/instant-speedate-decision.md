# Native Instant.parse decision

The integration is unfinished and disabled by default. Its completion criterion
is a worthwhile default-on implementation with a startup opt-out, or rejection.
This document defines the fixed, prospective native qualification; it reports no
performance result for the current guard revision. Historical x64 measurements
cannot qualify this revision or an ARM target.

## Sources and native prerequisites

Fetch the existing `review/instant-speedate-fast-path` branch from
<https://github.com/re-thc/openjdk-jdk27u>, then check out the full immutable commit
provided with the handoff. Record that commit as `REV`; never measure a moving
branch. The reusable fixture is
[`InstantParse.java`](../test/micro/org/openjdk/bench/java/time/InstantParse.java).

| Route | Source and behavior |
|---|---|
| B | `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`, normal image |
| E | Exact `REV`, normal native-enabled image |
| D | Exact E image with startup `-Djdk.time.instantSpeedate=false` |
| J | B plus only [`InstantParseCache.patch`](../test/micro/org/openjdk/bench/java/time/InstantParseCache.patch), separate normal image |
| M | Exact E image after the fixture verifies permanent loader failure and restores the search path before warmup |

J caches the existing variable-fraction parser tree, preserving its grammar and
calendar conversion. It is a control, not part of the proposed product change.
Production source at REV retains the guard revision from
`a062f73bd705486673b63f2339875f78bb7132cb`.

Run on actual macOS arm64, or native Linux AArch64 with glibc, including a native
ARM Linux VM/container on Apple Silicon. Rosetta, QEMU and amd64 containers do not
qualify ARM. The development profile uses Apple M1 C/C++ and Rust tuning on macOS;
Linux uses `armv8.2-a`/generic C/C++ tuning and the generic AArch64 Rust target.
Only the actual OS, architecture and configuration tested can receive a PASS.
Linux x64-v3 and Windows x64 remain separate supported-target obligations.

Use installed native C/C++ tools, GNU make, Autoconf, a native boot JDK 27 and
Rust/Cargo >=1.88 with the native target standard library and compiler notices.
Do not install or downgrade toolchains. Freeze the actual tools, linker, flags
and boot JDK across B/E/J; this does not require cloud-specific tool paths or
versions. On Linux, either use the profile's installed mold or consistently set
`CONFIGURE_DEV_NO_MOLD=1` for the default linker.

Official dependencies may be downloaded normally. For example, from E's checkout:

```bash
# BOOT is an installed native boot JDK; choose absolute paths for all variables.
git clone --branch jtreg-8.2.1+1 --depth 1 https://github.com/openjdk/jtreg.git "$JTREG_SRC"
(cd "$JTREG_SRC" && bash make/build.sh --jdk "$BOOT")
JTREG="$JTREG_SRC/build/images/jtreg"
bash make/devkit/createJMHBundle.sh
JMH="$PWD/build/jmh/jars"
"$CARGO_RAW" fetch --locked --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml
```

The jtreg version is the repository's `make/conf/github-actions.conf` pin; an
already installed compatible jtreg can be used and recorded instead. The JMH
script fetches the repository's pinned JMH 1.37 and runtime dependencies from
Maven. Cargo uses the checked-in lockfile (speedate 0.18.0); make uses `--frozen`.
`CARGO_RAW` and `RUSTC_RAW` must name real installed executables, not wrappers with
arguments. Pass them as configure command-line assignments.

## Ordinary builds and correctness

Create detached worktrees E and B at REV and B's commit, respectively. Build B/E
first; create/build J only after stage 1 passes. In each worktree configure the
same release/server profile, then run normal make:

```bash
# B; run from B's worktree. Add identical CC/CXX assignments if needed.
bash bin/configure-dev --with-conf-name=instant --with-jobs=4 \
  --with-debug-level=release --disable-javac-server \
  --with-boot-jdk="$BOOT" --with-jtreg="$JTREG"
make CONF=instant JOBS=4 images

# E; run from E's worktree after fetching its locked Cargo dependencies.
bash bin/configure-dev --with-conf-name=instant --with-jobs=4 \
  --with-debug-level=release --disable-javac-server \
  --with-boot-jdk="$BOOT" --with-jtreg="$JTREG" --with-jmh="$JMH" \
  --enable-instant-speedate "CARGO=$CARGO_RAW" "RUSTC=$RUSTC_RAW"
make CONF=instant JOBS=4 images
make CONF=instant JOBS=4 build-microbenchmark
```

Use `build/instant/images/jdk` for each image. Build the benchmark jar once in E:
`build/instant/images/test/micro/benchmarks.jar`. Use that identical jar with B,
E/D/M and J's JVMs; its benchmark source need not be added to B/J. Before building
J, apply the exact cache patch to a detached B worktree, commit it as Harry Chan
`<38070640+re-thc@users.noreply.github.com>`, record its derived SHA, and use B's
configure/make commands. Make no other source changes.

Run the focused suite in E with JNI checking:

```bash
make CONF=instant JOBS=1 run-test \
  TEST='test/jdk/java/time/test/java/time/TestInstantSpeedate.java test/jdk/java/time/nonjunit/java/time/InstantSpeedateDisabled.java test/jdk/java/time/nonjunit/java/time/InstantSpeedateUnavailable.java test/jdk/java/time/test/java/time/TestInstant.java test/jdk/java/time/tck/java/time/TCKInstant.java test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java' \
  'TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m -Xcheck:jni' \
  'JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0'
```

B and J run the same command with only the final three original Instant/formatter
tests. Record sources, tool versions, configure arguments, image/jar/library hashes
and test outcomes before measured use. D/M must reuse E's actual image. Preserve
clean source state and verify the recorded identities remain unchanged.

The jar also provides an untimed differential audit:

```bash
"$IMAGE/bin/java" -XX:ActiveProcessorCount=2 -Xms64m -Xmx512m -Xcheck:jni \
  -XX:+CompactStrings --add-opens java.base/java.time=ALL-UNNAMED \
  -cp "$JAR" org.openjdk.bench.java.time.InstantParse audit native
```

Use `audit native` for E and `audit` for B/J/D; D includes its startup opt-out.
Run each in both `+CompactStrings` and `-CompactStrings`: eight JVMs total.
Compare all seven `oracle,...` lines with B's independent outcomes. Each audit
covers 44 fixed records plus 4,096 deterministic generated inputs, including full
parse-error details and negative-epoch fractions. E verifies native hit/miss
distribution. J compared only with its own formatter is insufficient.

Retain the existing bounded functional/GC/load tests available through normal Git
at the immutable ancestor below. Extract source into local scratch, not the product
tree; do not use its historical timing modes:

```bash
FIXTURE=3fbca0cd2e6afa036b39aede3f22a4911a9f1bfb
git show "$FIXTURE:test/experiments/instant-speedate-production/ProductionProbe.java" > "$SCRATCH/ProductionProbe.java"
git show "$FIXTURE:test/experiments/instant-speedate-production/OnLoad.c" > "$SCRATCH/OnLoad.c"
"$E/bin/javac" --add-exports java.base/jdk.internal.misc=ALL-UNNAMED \
  -d "$SCRATCH/classes" "$SCRATCH/ProductionProbe.java"
```

For these JVMs use `-XX:ActiveProcessorCount=2 -Xms32m -Xmx128m -Xcheck:jni`,
opens for `java.base/java.time` and `java.base/jdk.internal.loader`, the above
`jdk.internal.misc` export, and `-cp "$SCRATCH/classes" ProductionProbe MODE`.
The fixed functional matrix is:

| MODE | Runs and required evidence |
|---|---|
| `test` | E/D x both String modes, 4 JVMs; 100,308 outcomes each, matching digests; E adds `-Dprobe.native=true` and requires 49,680 systematic native hits |
| `race` | E x both String modes, 2 JVMs, 8,000 calls each |
| `stress` | E with `-Dprobe.native=true` x Serial/G1/ZGC x both String modes, 6 JVMs; default 90,000 parses each (540,000 total), real allocation/GC pressure and native coverage required |
| `bootstrap` | E x both String modes, 2 JVMs; `'-Djava.system.class.loader=ProductionProbe$EarlyLoader'` proves preboot fallback and postboot native |
| `onload` | E x both String modes, 2 JVMs; real JNI_OnLoad callback, fallback under the parser library lock and subsequent native success |

For `onload`, compile OnLoad.c with the installed C compiler and E's JNI headers:
Linux `-fPIC -shared -I"$E/include" -I"$E/include/linux"` to a `.so`; macOS
`-dynamiclib -I"$E/include" -I"$E/include/darwin"` to a `.dylib`. Add
`--enable-native-access=ALL-UNNAMED`,
`-Dprobe.onload.library=ABSOLUTE_CALLBACK_LIBRARY` and
`-Dprobe.parser.library=REALPATH_OF_E_LIBINSTANT` (`lib/libinstant.so`, or macOS
`lib/libinstant.dylib`). Resolve the parser file with Python
`pathlib.Path(path).resolve(strict=True)` first: an absolute path containing
symlinks can acquire a different lock key from the actual library loader.
Select exactly one collector in each stress JVM. Do not replace image libraries.

## Fixed measurement manifest

Use normal JMH, one fork per invocation and one explicit corpus. Substitute the
chosen IMAGE, ROUTE, corpus, String mode and output paths in this command:

```bash
"$E/bin/java" -XX:ActiveProcessorCount=2 -Xms64m -Xmx256m -jar "$JAR" \
  '^org.openjdk.bench.java.time.InstantParse.parse64$' \
  -jvm "$IMAGE/bin/java" -p input=happy -bm ss -tu ns \
  -f 1 -wf 0 -t 1 -wi 1 -wbs 16384 -i 4 -bs 2048 -foe true \
  -jvmArgsAppend "-XX:ActiveProcessorCount=2 -XX:+UseG1GC -Xms256m -Xmx256m -Xbatch -XX:+CompactStrings -Dinstant.route=$ROUTE -Djdk.time.instantSpeedate=true --add-opens=java.base/java.time=ALL-UNNAMED --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED" \
  -rf json -rff "$RESULT.json" > "$RESULT.log" 2>&1
```

For D replace the startup property with false. For calibration append
`-Dinstant.formatter=true` and keep `input=happy`. B/J ignore the feature property.
M's trial setup performs a genuine failed loader attempt in its isolated JVM,
verifies the permanent failure latch and restores the search path before warmup.
Use normal tiered compilation and `-Xbatch`; do not force inlining or change
compiler thresholds. Do not add profilers or use JMH's allocation normalization.

Each fork performs 1,048,576 warmup calls, then four blocks of 131,072 measured
public calls: 524,288 measured calls. Each invocation of `parse64` makes 64 single
public calls; each returned object/error escapes to a volatile sink. JNI copying,
transition, validation and result construction are inside the call. Route and
checksum/oracle checks run after all four blocks, before counter output.

For every comparison, use two opposite-order pairs A/B then B/A in
`+CompactStrings`, followed by the same in `-CompactStrings` (8 JVMs). Do not use
`-f 2` in place of that order. Complete and evaluate one mode's pairs before the
next. Corpora order is happy, mixed, fallback, syntax, calendar, custom. Mixed has
four native hits, two successful fallbacks and two calendar failures per cycle.

| Stage | Paired comparisons | Timing JVMs |
|---|---|---:|
| 1 | D/B happy; D/B direct-formatter happy calibration |16|
| 2 | E/B six corpora; E/J happy+mixed; D/B other five; M/B happy |112|
| 2 calibration | E/B direct-formatter happy |8|
| Total | Both String modes and opposite-order pairs included |136|

Within each stage run diagnostics first, then calibration, then the public
comparisons in table order. Stage 1 must PASS before J is built or stage 2 starts.
The timing matrix has 213,909,504 calls including warmup. Separate compiler
diagnostic forks use the same JMH command/work but add normal
`-XX:+UnlockDiagnosticVMOptions -XX:+LogCompilation -XX:+PrintInlining` flags and
unique log paths: stage 1 B/D happy x both String modes (4); stage 2 E
happy/mixed/fallback/calendar and J happy/mixed x both String modes (12). Discard
their timing rows. Require normal-entry C2 compilation of the batch/JMH stub and
retain inlining, OSR and deoptimization evidence. Diagnostic forks cannot prove
code identity in the timing forks.

Cold measurements use the jar's plain Java main in fresh JVMs, not JMH warmup:

```bash
python3 - "$IMAGE/bin/java" -XX:ActiveProcessorCount=2 -XX:+UseG1GC \
  -Xms256m -Xmx256m -Xbatch -XX:+CompactStrings "-Dinstant.route=$ROUTE" \
  -Djdk.time.instantSpeedate=true --add-opens java.base/java.time=ALL-UNNAMED \
  -cp "$JAR" org.openjdk.bench.java.time.InstantParse cold happy <<'PY'
import subprocess, sys, time
start = time.perf_counter_ns()
result = subprocess.run(sys.argv[1:])
print("process_ns=" + str(time.perf_counter_ns() - start))
sys.exit(result.returncode)
PY
```

Use startup false for D. For each String mode, then input happy/fallback/calendar,
run 8 rounds rotating routes B,J,E,D by one position each round: B,J,E,D;
J,E,D,B; E,D,B,J; D,B,J,E; repeat. This is 192 fresh JVMs. Retain all positions.
The `cold,<ns>` line measures the first public parse; process_ns includes startup,
post-timer validation and output, using a blocking process waiter. The known
negative-epoch result/error is checked after the timer without initializing an
oracle or calling Instant.toString before a native cold hit. M has no cold lane;
its warmed result cannot establish missing-library startup cost.

## Metrics and stop rules

Retain every raw JSON score, counter row, command, order and failed attempt.
No extra samples, retry, selective deletion, warm-until-pass or pooled rescue.
This JMH adapter has a different framework boundary from historical hand-timed
probes; never relabel their results as evidence from this fixture.

With JMH 1.37 SingleShotTime, batchSize 2,048 and no OperationsPerInvocation,
each `primaryMetric.rawData[0][i]` score in ns/op is the **whole block elapsed
time**, t_i, not time per parse. Divide by N=131,072. See the
[JMH SingleShotTime generator](https://github.com/openjdk/jmh/blob/1.37/jmh-core/src/main/java/org/openjdk/jmh/generators/core/BenchmarkGenerator.java#L888-L957).
Match its four scores in order to the four `instant-counters` rows. b_i is the
current-thread byte delta, c_before/c_after cumulative compiler milliseconds and
g_i summed fixed-collector millisecond deltas. Counters bracket some JMH framework
work outside its timer: allocation is iteration-wide, not parser-only; GC is a
conservative MXBean-time proxy, not an exact pause fraction.

| Per-fork gate | Definition and limit |
|---|---|
| Time spread | x_i=t_i/N ns/call; max(x_i)/min(x_i)<=1.10 |
| Tail/head | abs(median(x_2,x_3)/median(x_0,x_1)-1)<=0.05 |
| Allocation spread | a_i=b_i/N bytes/call; max(a_i)-min(a_i)<=1 byte/call |
| Compiler | All 8 cumulative snapshots equal, including between blocks; report sum(c_after-c_before)=0 ms |
| GC | Each g_i*1,000,000/t_i<=0.10; report sum(g_i) and sum(g_i)*1,000,000/sum(t_i), not an average of percentages |
| Fork aggregates | X=median(x_0..x_3) ns/call; A=sum(b_i)/(4*N) bytes/call; never pool forks or String modes |

Missing/unsupported counters, rollback, incomplete rows, nonpositive time or a
failed spread/compiler/GC gate are INCONCLUSIVE. Zero bytes, zero GC and flat zero
compiler snapshots are valid observations. Counter granularity does not prove
absence of compilation. Wrong calls/checksums/outcomes/routes or JNI/safety
failures are NO-GO; other failed required build/test/launch prerequisites are
INCONCLUSIVE. Stop at the first failed prerequisite or block/fork gate.

For each mode and pair independently, R=X_candidate/X_control, L=R-1 and
deltaA=A_candidate-A_control. Preserve full precision when evaluating boundaries.

- Calibration: both R in [0.97,1.03], with max(R)-min(R)<=0.03; otherwise
  INCONCLUSIVE. Two opposite-order pairs are an engineering screen, not general
  equivalence or universal no-regression proof.
- Native happy: both pairs require X_B/X_E>=1.5 and X_J/X_E>=1.25; against each
  control require A_E/A_control<=0.10. Zero control allocation makes the percentage
  undefined and INCONCLUSIVE. Missing a defined speed/allocation threshold is NO-GO.
- Protected work: any deltaA>1 byte/call is NO-GO. Two L strictly >0.03 are NO-GO;
  any other two strictly positive losses are HOLD, including exactly 3% or
  straddling 3%. Two L<=0 pass; all other combinations are INCONCLUSIVE. Apply to
  E/B noncanonical corpora, D/B all six, M/B happy and E/J mixed.
- Cold: in each input/mode cell, both E and D separately require the 8-observation
  median of first_ns and process_ns to be <= median_B + max(0.05*median_B,2ms).
  Missing/nonpositive durations are INCONCLUSIVE; exceeding the bound is NO-GO.
  J supplies context only. Evaluate each gate as soon as its 8 candidate and
  8 baseline observations exist, before later context can hide the verdict.

Any non-PASS stops the job; do not let a later failure obscure an established
NO-GO/HOLD. A fixed-scope incomplete or inconclusive result means do not merge,
not an indefinitely unfinished opt-in feature. A required supported-target failure
rejects the integration unless its owner explicitly narrows the supported scope.

Use the native job's ordinary resource limits and timeout: at most 3 hours total,
4 CPU equivalents, 16 GiB and 80 GiB scratch. Phase caps are 90 min builds,
30 correctness, 5 diagnostics, 20 timing, 5 cold and 30 setup/analysis/cleanup;
none extends the total. Reserve the final 10 seconds for teardown. Stop and report
an unmet native prerequisite or budget limit. No cloud launcher, UID-map repair,
artifact upload or new campaign-supervision project is required. Keep raw captures
and binaries local. Add no CI or manual dispatch; publish or merge nothing as part
of qualification, and change no default before the evidence is reviewed.
