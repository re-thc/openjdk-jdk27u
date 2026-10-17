# One integration-decision milestone (proposed, not executed)

This plan is source preparation, not execution authorization. No build, test,
benchmark, observer, installation or CI run occurred while preparing it. The
stopped NIO observer, prior consumed attempts, header stress and PR15 probes
remain stopped. This milestone uses normal source checkouts and newly built
matched images; it does not resume an old controller or use its remaining time.

## Frozen comparison and evidence reconciliation

Baseline B is fork master `89885a6288e7aaabd01678a704a586272c0f96e3`.
Candidate C is published source/test head
`f03c433e6846632173209a2d85ca471c6ae6aa22`. Subsequent documentation changes
may identify this plan but must not silently change C. Remote master and review
head matched these identities at the source-only reconciliation on 2026-10-17.
All fourteen candidate production files remain identical to built source
`770f5cd0ef89bceae11a5f66c014815bfa3b4b73`; the later native test fixes are
included in C. Donor identities are in `memory-overhead.md`.

| Question | Existing evidence at C | Remaining decision evidence |
| --- | --- | --- |
| Product correctness | Release build and 13 focused jtreg IDs at production-equivalent 770f5; two native tests at f03c; old-header control fails only 12 size assertions | Matched baseline and fastdebug/ASan runtime, native supported-platform coverage |
| Array requested allocation | Actual fixed NMT size/tag checks across 12 cases and independently compiled old-header control | Process-level AOT materiality remains unmeasured; AOT functional record/create/replay already passes |
| ParkEvent | Natural alignment/recycling test passes at C; historical 416 to 160 requested bytes/event on older images | Current matched high-water requested-allocation result; contention/thread-start costs |
| Nmethod reuse | Historical 18 balanced pairs, 49,152 used bytes/64 methods reusable one GC earlier for Serial/Parallel/G1 | Current matched confirmation; recompilation/throughput and pauses; ZGC unchanged control |
| NIO | Three current functional cases, including platform/virtual exact checksum | Historical 2,224,128-byte baseline retention is not a measurement of C; fresh replacement accounting and throughput |
| C2 scratch | Source lifetime review and regular C2 semantic compilation pass | No actual helper-entry/peak-byte result; no quantified C2 benefit may be claimed |
| Startup/performance | No startup improvement; earlier unchanged-code controls are noisy, with some slower estimates and worse G1 tails | Balanced protected workloads and controls with bounded uncertainty |
| Physical memory | No established RSS/PSS reduction | Keep any observed process RSS/PSS separate from NMT requested, heap/code used, committed and reserved |

No additional production defect was found in this source reconciliation.
The ASan-safe test repair is present: unpoison just the header, copy size/tag,
re-poison before assertions/access/free. Instrumented compilation passes, but
there is no ASan runtime pass. The PR44 snapshot is
`259d487b6512f4bdd663d52ad082065dbc6c8c80`, 41 files, no path overlap;
other PR inventory entries remain the dated audit snapshot, not a claim of a
new all-PR refresh. Refresh all open PR paths before any integration decision.

## Capacity, scope and one decision

Linux x64 is the decision host. Supported native targets in `.github/workflows/main.yml`
are linux-x64, linux-aarch64, macos-aarch64 and windows-x64. Serial, G1 and ZGC
are mandatory collector strata for the protected workloads; Parallel is a focused
correctness check for the included donor. Shenandoah and built-in HTTP/2 are
excluded. Absence of another native host cannot become a cross-platform pass.

One authorized milestone, if accepted, has a **10-hour hard Linux wall budget**:
up to 240 minutes for source/dependency validation and four builds, 60 minutes
for correctness/accounting, 240 minutes for ordered performance/startup work,
30 minutes for analysis, and 30 minutes of global cleanup/report reserve. All
stages share the same deadline; unused allocations cannot extend it. Build
caps are 50 minutes each for B/C release and 70 each for C fastdebug/C ASan.
One attempt per invocation, sequential builds/workloads, at most four build
jobs/CPU equivalents, 16 GiB total memory, 256 MiB workload heap, at most 192
platform workers/256 native JVM threads, and 4 GiB total logs. Require at least
**40 GiB free working storage** before starting; stop before launching anything
if this is unavailable. Current 32 GiB workspace has about 1.9 GiB free and
cannot accommodate this milestone without central storage capacity or an
explicitly agreed removal of reproducible old build outputs. Preserve raw
historical evidence and existing result archives. Do not delete them to fit.

If existing native hosts for the other three targets are supplied, each gets
one separate four-hour host window inside the same milestone: matched release
builds (up to 70 minutes each), focused candidate correctness (60 minutes), and
40 minutes for cleanup/report. At most four jobs, 16 GiB memory, 40 GiB free
storage per host. Use each platform's documented native toolchain and record
its exact version; do not cross-compile and label it native testing. No hosts
are provisioned, no hosted workflow is dispatched. Missing hosts leave those
rows unqualified. Linux results may support a Linux-limited trial decision;
repository-wide integration remains HOLD until mandatory native checks pass.

The final result is **integrate within the tested scope**, **reject this packet**,
or **HOLD with exact missing gates**. Do not silently trim slow changes and call
this same frozen packet a pass. A reduced packet would have a new identity.

## Installed inputs and owned preparation

Linux tools already installed: GCC/G++ 16.2.0, Make 4.4.1, autoconf 2.72, mold,
boot JDK 27+35-2325, jtreg 8.3-dev+1 with JUnit/TestNG, Python, Git and taskset.
GoogleTest/GoogleMock v1.14.0 sources resolve to
`f8d7d77c06936315286eb55f8de22cd23c188571`. JMH jars are installed at
`/workspace/jvm-memory-expansion/build/jmh/jars`: jmh-core and annotation
processor 1.37, jopt-simple 5.0.4, commons-math3 3.6.1. Use their existing
repository-supported paths. The installed ASan runtime is
`/workspace/toolchains/gcc16-root/usr/lib/x86_64-linux-gnu/libasan.so.8.0.0`.
No new unmanaged tool or binary handoff is needed.
No DaCapo/Renaissance/SPEC distribution is installed; this plan therefore makes
no application-suite or universal performance claim.

Owned work before the first launch: prepare fresh checkouts, freeze full
source/tree/input/class/jar hashes and expanded command order, check disk/quota,
record CPU/kernel/cgroup/compiler/configure details, and prepare a bounded
sequential launcher/parser. The launcher must own/reap each process tree, cap
all child JVMs and combined output, reserve cleanup inside each invocation,
retain all errors and refuse an existing results directory. Do not reuse an old
consumed NIO controller. These are implementation responsibilities, not reasons
for another small approval. Missing central storage/native hosts and initial
execution authorization are the genuine external dependencies. Stop before
launch if bounded ownership/cleanup or installed ASan link runtime is unavailable.

## Build commands (Linux; proposed only)

Set `ROOT` to the source checkout containing this document and `Q` to the new
adequately sized local workspace. `Q` must not contain an earlier attempt.

```sh
source /workspace/toolchains/activate.sh
unset JAVA_TOOL_OPTIONS _JAVA_OPTIONS JDK_JAVA_OPTIONS JDK_JAVAC_OPTIONS JTREG_JAVA_OPTIONS TEST_VM_FLAGLESS
B=89885a6288e7aaabd01678a704a586272c0f96e3
C=f03c433e6846632173209a2d85ca471c6ae6aa22
BOOT=/workspace/toolchains/jdk27
JTREG=/workspace/toolchains/jtreg83
GTEST_SOURCE="$ROOT/build/dependencies/googletest"
JMH=/workspace/jvm-memory-expansion/build/jmh/jars
SYS=/workspace/toolchains/sysroot/usr
mkdir -p "$Q"
git -C "$ROOT" worktree add --detach "$Q/B" "$B"
git -C "$ROOT" worktree add --detach "$Q/C" "$C"
```

Execute the following configurations in order (one configure/build at a time):

| Checkout | label | debug | suffix | asan_option | BUILD_SECONDS |
| --- | --- | --- | --- | --- | ---: |
| B | B | release | empty | empty | 3000 |
| C | C | release | empty | empty | 3000 |
| C | C | fastdebug | empty | empty | 4200 |
| C | C | release | -asan | --enable-asan | 4200 |

Run configure in the named checkout with those explicit values. All shared options
are identical; source revision, debug/ASan and configuration name are recorded
intentional differences. The ASan build is correctness-only.

```sh
bash configure --with-conf-name="$label-$debug$suffix" --with-jobs=4 \
  --with-debug-level="$debug" --with-jvm-variants=server \
  --with-source-date=2026-10-16T21:13:34Z --with-version-opt=memory-decision \
  --with-boot-jdk="$BOOT" --with-jtreg="$JTREG" --with-gtest="$GTEST_SOURCE" \
  --with-jmh="$JMH" --with-toolchain-path=/workspace/toolchains/gcc16/bin \
  --with-freetype=system --with-freetype-include="$SYS/include/freetype2" \
  --with-freetype-lib="$SYS/lib/x86_64-linux-gnu" \
  --x-includes="$SYS/include" --x-libraries="$SYS/lib/x86_64-linux-gnu" \
  --with-cups-include="$SYS/include" --with-fontconfig-include="$SYS/include" \
  --with-alsa-include="$SYS/include" --with-alsa-lib="$SYS/lib/x86_64-linux-gnu" \
  --with-extra-ldflags='-fuse-ld=mold -B/workspace/toolchains/mold/bin' $asan_option
# suffix='', asan_option='' normally; suffix='-asan', asan_option='--enable-asan' only for the fourth build.
timeout --kill-after=10s "$BUILD_SECONDS" make CONF="$label-$debug$suffix" JOBS=4 images test-image
```

On linux-aarch64 and macos-aarch64 use the same B/C checkout commands, then
native `bash configure --with-conf-name="$label-release" --with-debug-level=release
--with-jvm-variants=server --with-jobs=4 --with-boot-jdk="$NATIVE_BOOT"
--with-jtreg="$NATIVE_JTREG" --with-gtest="$NATIVE_GTEST"
--with-source-date=2026-10-16T21:13:34Z --with-version-opt=memory-decision`,
followed by `make CONF="$label-release" JOBS=4 images test-image`. Host paths
and exact GCC/Xcode versions must be inventoried and frozen first; do not use the
Linux x64 sysroot there. On windows-x64 execute the same native configure/build
under the repository-supported Cygwin environment, additionally
`--with-toolchain-version=2026 --with-msvc-toolset-version="$NATIVE_MSVC_TOOLSET"`
as in the current Windows workflow. No Visual Studio/Xcode installation is
included. The host's installed toolset identifier, SDK and boot JDK are mandatory
inputs; if absent, leave the platform blocked rather than inventing a toolset.
Bound each build externally to 4200 seconds including its process tree; Windows
uses the owned launcher rather than assuming a Unix timeout manages native
children. The same thirteen candidate test IDs and two native filters apply;
record exact supported-collector predicates, and do not count a skip as execution.

Hash every built image file, `spec.gmk`, build logs and source tree. Use candidate
`images/test/micro/benchmarks.jar` for both images; hash once. JMH coordinator
uses the installed boot JDK, explicit `-jvm` for the measured image and explicit
fork flags. Never compare release with fastdebug/ASan timings.

## Correctness and requested-allocation gates

The completed 13 jtreg/two native checks are not rerun on the unchanged saved
image. Fresh images and new native platforms require their own results.
Use candidate test sources for both B and C with the installed jtreg:

```sh
timeout --kill-after=10s 600 "$BOOT/bin/java" -Xmx256m \
  -jar "$JTREG/lib/jtreg.jar" -jdk:"$IMAGE" -conc:1 -timeoutFactor:1 \
  -javaoptions:-Xmx256m -w:"$RUN/work" -r:"$RUN/report" $EXACT_TEST_PATHS
# AOT group additionally: -javaoptions:'-Xmx256m -XX:+UnlockDiagnosticVMOptions -XX:+AOTVerifyTrainingData'
```

All expanded test paths/argument vectors are frozen before launch, not evaluated
from logs. Exact repository paths are listed in
`memory-overhead-validation.md`; add candidate `#parallel` only as already listed.
Each group is capped at 600 seconds including its children. Do not globally force
collector flags into flagless collector tests. Candidate release/fastdebug must
execute all 13 IDs with zero failures/errors/skips; baseline only expects the
new early-unload assertions to fail for Serial/Parallel/G1. ZGC and unrelated
baseline checks must pass. Anything else stops the correctness gate.

Use the exact native launch commands from `memory-overhead.md` on C release,
fastdebug and ASan, each at most 60 seconds. Require one executed unskipped test
for each filter. ASan poisoning enabled (`ASAN_OPTIONS=allow_user_poisoning=1:detect_leaks=0`)
for this focused test; record this excludes leak-sanitizer coverage. On the
ASan native invocations only, set
`LD_PRELOAD=/workspace/toolchains/gcc16-root/usr/lib/x86_64-linux-gnu/libasan.so.8.0.0`
to load the installed matching runtime before the gtest launcher dependencies.
Keep normal ASan poisoning/access checks enabled. Freeze this environment with
the invocation; a runtime-loader error stops this gate, without a retry or
additional sanitizer suppression flags.
The independent old-header oracle already established at C remains valid;
repeat it only if compilation flags, allocator header or test source change.

For fresh thread/code-cache accounting, use existing reviewed Java **sources**
`MemoryQualification.java` and `MemoryTargets.java` in the saved audit workspace,
SHA256 respectively `009849582b939390f422f252d3d07df7326760547617dc39fab4b69e9bef1941`
and `7182e73d6cb6f1675c45f2b9f598a01bf34c03692a411b3a72f4632a875a7244`.
Copy these source files into the milestone's source directory and compile once
with the installed boot javac plus candidate WhiteBox source; do not reuse old
classes or images. Preserve their hashes/legal provenance. The launcher must
handle the existing QSNAP acknowledgement and QCODE reporting protocol; stdout is not a timer.

```sh
"$BOOT/bin/javac" -J-Xmx256m -d "$Q/classes" \
  "$Q/C/test/lib/jdk/test/whitebox/WhiteBox.java" \
  "$Q/C/test/lib/jdk/test/whitebox/parser/DiagnosticCommand.java" \
  "$Q/sources/MemoryQualification.java" "$Q/sources/MemoryTargets.java"
# Three fresh pairs, order BC/CB/BC; threads on G1; code on Serial, G1, ZGC.
"$IMAGE/bin/java" -Xms32m -Xmx256m -Xss256k -XX:ActiveProcessorCount=4 \
  -XX:CICompilerCount=2 -XX:ParallelGCThreads=2 -XX:ConcGCThreads=1 \
  -XX:+UseG1GC -XX:NativeMemoryTracking=detail -Dmemory.nmtDetail=true \
  -cp "$Q/classes" MemoryQualification threads
"$IMAGE/bin/java" -Xms256m -Xmx256m -Xss512k -XX:ActiveProcessorCount=4 \
  -XX:CICompilerCount=2 -XX:ParallelGCThreads=2 -XX:ConcGCThreads=1 \
  "$GC_FLAG" -XX:NativeMemoryTracking=off -Xbatch \
  -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI -Xbootclasspath/a:"$Q/classes" \
  '-XX:CompileCommand=compileonly,MemoryTargets::*' \
  -XX:ReservedCodeCacheSize=32m -XX:InitialCodeCacheSize=8m \
  -cp "$Q/classes" MemoryQualification code
```

Every direct workload command in this plan is launched through the owned
60-second invocation boundary, pinned to available CPUs 0–3 on Linux x64;
coordinator handshake/diagnostics/cleanup time is inside that boundary.
Use at most 60 seconds per invocation, collecting complete NMT groups for the
64/192/reuse192 thread phases. Verify event count/size attribution and the same
retained high-water phase; predict 65,536 fewer requested bytes across the extra
128 workers, not an equal RSS reduction. Collect Linux smaps_rollup only at
acknowledged phases (no continuous observer), with KiB converted explicitly.
Code mode requires 64 dead/live methods, actual first-GC reclaim/reuse in C for
Serial/G1, retained live controls, and unchanged ZGC behavior. Report actual used,
committed and reserved values; equality of committed/reserved is not a failure.

Fresh NIO accounting uses the public `NioAlignedCacheLifecycleFixture.java`,
compiled once from C with `--add-exports java.base/sun.nio.ch=ALL-UNNAMED`.
Use the manual commands/protocol already documented in `memory-overhead.md`:
one BC default leak pair, CB cache-disabled pair, then BC control pairs at
65536/69631/69632, all under G1, 60 seconds per JVM including at most five
10-second jcmd calls. Require zero reconciled Other before work; exactly 32
misaligned replacements for the default oracle; complete content/termination;
zero post-exit C retention. Preserve all baseline threshold values. Anonymous
unexplained groups, allocator-path misses or incomplete cleanup are inconclusive;
never subtract them or retry for favorable addresses. This public lifecycle
fixture is distinct from the stopped old fixture/observer; no stopped probe is
recreated. No fresh C2 peak-byte claim is required or permitted without real
helper-entry evidence; leave that individual benefit unquantified.

## Protected throughput, pause and startup batch

Use these eight protected workloads, in this fixed order:

1. `org.openjdk.bench.vm.gc.Alloc.testSmallObject` (allocation/GC pressure).
2. `org.openjdk.bench.javax.tools.Javac.testCompile` (compiler/allocation/file work).
3. `org.openjdk.bench.java.lang.ThreadStartJoin.test` (platform thread lifecycle).
4. `org.openjdk.bench.java.io.FileChannelRead.test` (heap-buffer temporary cache).
5. `org.openjdk.bench.java.io.FileChannelWrite.test` (heap-buffer temporary cache).
6. Fixed-work `MemoryQualification threadwork` (192 platform workers, eight
   rounds, 1536 total), protecting the relevant high-water scale.
7. Candidate `TemporaryBufferCarrier platform`, exact 32 tasks/eight rounds,
   checksum 1627136 and content checks.
8. The same `TemporaryBufferCarrier virtual`, scheduler parallelism and
   maxPoolSize both four, same checksum/content checks.

The first five are JMH methods; the last three are fixed-work whole-process
latencies, including startup, reported separately from steady-state JMH scores.
Compile TemporaryBufferCarrier once with
`"$BOOT/bin/javac" -J-Xmx256m -d "$Q/classes"
"$Q/C/test/jdk/sun/nio/ch/TemporaryBufferCarrier.java"`. These fixed tests are deliberately not relabeled as steady-state virtual
throughput; such a claim remains outside this milestone.

For each of Serial, G1, ZGC, run eight primary fresh-process pairs in alternating
BC/CB order, plus eight B/B pairs interleaved one after each primary pair. Each
JMH invocation selects exactly one anchored method, one JMH worker/fork, five
one-second warmups and seven one-second measurements. B/B is a real unchanged
image control; label both copies but keep binary/class/flag identity. It is not
a second build with unknown differences. Treat fork aggregates as independent
samples, not the correlated JMH iterations. There are 480 JMH invocations
(5 methods × 3 collectors × 8 × 4) and 288 fixed-work invocations (three modes × three collectors × eight × four). Stop before
launching an invocation if its 60-second cap plus cleanup cannot fit the stage.

`GC_FLAG` takes exactly `-XX:+UseSerialGC`, `-XX:+UseG1GC`, then
`-XX:+UseZGC`. `IMAGE` resolves to the frozen B/C release `images/jdk` directory.
`METHOD` takes each of the five full names above; escape literal dots when
constructing its anchored regex. Define the fixed-work argument vector explicitly:

```sh
FROZEN_VM_ARGUMENTS="-Xms256m -Xmx256m -Xss512k -XX:ActiveProcessorCount=4 -XX:CICompilerCount=2 -XX:ParallelGCThreads=2 -XX:ConcGCThreads=1 $GC_FLAG -XX:NativeMemoryTracking=off -Xlog:gc,safepoint:file=$RESULT.gc.log:uptimemillis,level,tags"
taskset -c 0-3 "$BOOT/bin/java" --sun-misc-unsafe-memory-access=allow \
  -Xmx128m -XX:ActiveProcessorCount=1 -Djmh.blackhole.autoDetect=false \
  -Djmh.compilerhints.mode=FORCE_ON -jar "$BENCHMARKS_JAR" "^$METHOD$" \
  -f 1 -wf 0 -t 1 -wi 5 -i 7 -w 1s -r 1s -foe true -rf json -rff "$RESULT.json" \
  -jvm "$IMAGE/bin/java" -jvmArgs "-Xms256m -Xmx256m -Xss512k -XX:ActiveProcessorCount=4 -XX:CICompilerCount=2 -XX:ParallelGCThreads=2 -XX:ConcGCThreads=1 $GC_FLAG -XX:NativeMemoryTracking=off --sun-misc-unsafe-memory-access=allow -Djmh.blackhole.autoDetect=false -Djmh.compilerhints.mode=FORCE_ON -Xlog:gc,safepoint:file=$RESULT.gc.log:uptimemillis,level,tags"
# Fixed work: same GC/heap/CPU/NMT flags, same GC logging; measure complete child wall time.
"$IMAGE/bin/java" $FROZEN_VM_ARGUMENTS -cp "$Q/classes" MemoryQualification threadwork
"$IMAGE/bin/java" $FROZEN_VM_ARGUMENTS -cp "$Q/classes" TemporaryBufferCarrier platform
"$IMAGE/bin/java" $FROZEN_VM_ARGUMENTS \
  -Djdk.virtualThreadScheduler.parallelism=4 -Djdk.virtualThreadScheduler.maxPoolSize=4 \
  -cp "$Q/classes" TemporaryBufferCarrier virtual
```

For each fixed-work child require its normal exact completion/semantic receipts;
threadwork's elapsed QRESULT is a secondary interior metric. Its primary metric
is the declared full child wall time, matching the two carrier modes. JMH setup
uses the unchanged fileSize=1000000 parameter; retain that value in JSON.

No profilers, procfs polling observer, intrusive compilation logs or NMT in these
timing runs. Read cgroup CPU/throttle and global CPU/steal counters only at run
boundaries. Keep built-in before/after arithmetic controls in threadwork.
Heap-buffer virtual-thread semantics and fixed-work latency are protected by
TemporaryBufferCarrier; steady-state virtual-thread throughput remains unmeasured.

Startup is a separate fixed sequence after the main batch: eight paired BC/CB
fresh invocations per collector, followed by interleaved B/B, for both
`java -Xms32m -Xmx256m $GC_FLAG -version` and
`javac -J-Xms32m -J-Xmx256m -J$GC_FLAG -proc:none -d "$RUN/classes" "$RUN/Hello.java"`.
Hello source is frozen to `public class Hello { public static void main(String[] a) { System.out.println(42); } }`.
Create fresh output directories, identical CDS policy/defaults, warm filesystem
cache only from normal preceding runs; call this warm-filesystem process startup,
not cold-machine startup. Measure whole-process monotonic wall time with the
bounded launcher, preserve compiler exit/output/class hash, and run the resulting
class once per image outside the timed compiler interval to require output 42.
Do not infer time-to-first-request from `java -version`.

## Predeclared analysis and stop rules

Convert throughput scores to time/work before ratios. Within each collector and
workload, report all eight paired C/B log-ratios, geometric mean and uncertainty.
For B/B, require the simultaneous confidence interval to fit [0.97,1.03]. For C/B,
require the simultaneous upper time ratio <=1.03. This proposed 3% minor-trade
ceiling is accepted only with meaningful measured memory benefit: all current
requested-byte/control oracles pass and at least 64 KiB lower retained requested
allocation at the declared platform-thread high water, or >=64 KiB and >=5%
reduction in another declared measured subsystem. A formula or a single favorable
allocation is insufficient. If B/B fails, affected C/B comparisons are
inconclusive, regardless of their point estimates. Report adverse values.

For startup apply the same 3%/control rule. For the allocation-pressure JMH workload in each collector,
extract actual GC pause durations from GC-id event records (not safepoint totals
or concurrent-cycle duration), report count/p50/p95/p99/max, throughput and full
raw logs. A p99 comparison requires >=1000 pauses per image across forks;
otherwise p99 is unresolved. Estimate paired uncertainty by resampling whole
forks, not individual pauses; upper p99 ratio must be <=1.05 and upper absolute
increase <=1 ms. Freeze bootstrap seed 270017 and 100,000 resamples. The family contains
72 intervals: 24 workload-time plus 6 startup plus 6 pause endpoints (ratio and
absolute difference for each collector), for both C/B and B/B. Use Bonferroni
per-interval alpha=0.05/72 for a simultaneous nominal 95% family. Use Student-t
on eight paired log-ratios for time endpoints. Bootstrap intervals are estimates
from only eight forks; report that limitation, not a distribution-free guarantee.
Apply the same family correction to controls. For the allocation-pressure
B/B pause controls require the simultaneous p99 ratio interval within [0.95,1.05]
and simultaneous absolute-difference interval within [-1 ms,1 ms]. Missing allocation-pressure pauses do not pass its tail
gate; publish HOLD if the fixed duration cannot establish it. For the other
workloads, report every pause, counts and supported quantiles as secondary
observations, with no certified p99 bound when samples are insufficient. Do not extend the
run or replace a workload to manufacture sample count/significance.

Stop the affected gate immediately on wrong source/image/hash, missing inputs,
unknown/ignored flag, absent/skip/empty test, semantic/checksum error, sanitizer
report, crash, OOM, ownership/cleanup failure, quota violation, output cap or
deadline. Preserve failure and pending tail. No adaptive retries, warmup/input
changes, stopped probes or additional profiles. Linux alone may remain HOLD due
to host noise or insufficient pauses; do not claim universal no-regression.

Report per-platform actual compiler/CPU/flags, identities, commands and executed
counts, all controls, source-attributed requested allocations, peak versus
retained, startup versus steady state, used/committed/reserved, RSS/PSS separately,
and unresolved C2/virtual-thread/platform limits. No startup or physical-memory
benefit is presumed. Only after these gates can a separate integration decision
consider a draft PR; this milestone creates none and never merges.
