# Native combined memory benefit/cost decision

This is a proposed, single native execution scope for draft PR #48. It has not
run and does not renew the spent cloud campaign. The deliverable is an
**adopt / fix / reject** recommendation with component-level evidence, rather
than a build result. Ordinary CI remains separate; do not rerun successful CI
jobs or dispatch another workflow for this exercise.

## Frozen sources and native target

Prefer an already available **native Linux ARM64 container** on an ARM64 host.
Use native macOS arm64 only if Linux is unavailable **before execution starts**.
Select one platform, one source pair and one attempt. Do not combine platforms'
samples, use QEMU/Rosetta, transfer cloud-built JDKs, or migrate/retry a spent
attempt on the other platform.

The verified production comparison is:

| Input | Immutable Git revision |
| --- | --- |
| B, baseline master | `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda` |
| Original reviewed topic payload H | `c80dae1340e055b85aa908552e59de97cab672bd` |
| C, GitHub's test merge of H onto B | `6a9c13714d8a65db3e2892bf3cd8e839941f5006` |
| C tree | `d9fb354c89f1fb72e6d876f7a97cff261be53323` |
| Existing portable Java diagnostic/verified-I/O inputs F | `fcda62c58ce42701c690e4eee504ff3c64da1efb` |

C's parents are exactly B and H; its difference from B is the 31-file product
packet. Fetch these objects through normal Git. This test merge does not merge
the draft. **Do not compare B with the unmerged topic branch**: that would also
compare unrelated GC/runtime and linkage changes present in B.

The new `DateFormatSymbolsCost.java` and this protocol are common test inputs.
Pin their exact published commit P in the execution record. Documentation and
benchmark-only additions after H do not silently change the product comparison.
If a production change, base change, missing pinned object or new source defect
makes this comparison obsolete, stop and refreeze the pair before measurement.

On Linux require native `aarch64` and support for the repository's
`-march=armv8.2-a -mtune=generic` profile. On macOS require native `arm64`, no
translated process, and the repository's `-mcpu=apple-m1` profile. Record the
physical host/container relationship, OS/kernel, CPU, page size, compiler/SDK,
power/thermal state and available CPUs. A native ARM Linux VM/container on an
ARM Mac is acceptable; a foreign-architecture emulated container is not.

## Supported collectors and explicit uncovered path

Use `bin/configure-dev` for every configuration: **Serial, G1 and ZGC**, headless,
with Epsilon, Parallel and Shenandoah excluded. Check actual `spec.gmk`, module
contents and `.github/scripts/check-dev-profile.sh` for both release images.

`src/hotspot/share/gc/parallel/psParallelCompact.cpp` is changed by the imported
reclamation donor, but Parallel is excluded by this fork's profile.
`TestCodeCacheUnload.java#parallel` therefore remains **not built/tested here**;
do not enable Parallel or count its exclusion as a pass. An adopt recommendation
is limited to the supported three-collector profile. If review requires every
changed collector path validated, remove/fix that excluded path or obtain a
separate supported scope; this request does not expand collector support.

## Resource and dependency request

Reserve one native session for **14 hours maximum**, including closure:

| Stage | Cap |
| --- | ---: |
| Admission, two normal matched release builds and provenance | 150 minutes |
| Focused correctness and attributable memory/layout benefit | 90 minutes |
| Fixed protected cost matrix and analysis inputs | 360 minutes |
| Conditional C fastdebug and ASan builds/checks | 180 minutes |
| Analysis, decision and worker closure | 30 minutes |
| Unallocated reserve inside the same cap | 30 minutes |

Use four build jobs, four CPU equivalents where the existing container supports
that limit, a 16-GiB memory ceiling on Linux, and **64 GiB initially free working
storage**. These are reservations, not measured ARM64 build peaks. Keep the
existing **12-GiB** initial/conditional-debug admission checks and **1-GiB** live
storage floor. Preserve all four configuration trees/images/symbols and evidence;
no intermediate deletion or infrastructure repair is requested. Limit raw
campaign logs/results to 4 GiB and each timed fork's possible writes to 256 MiB.
Check capacity between timed forks, never inside their timing interval.

The Mac fallback needs at least 16 GiB physical RAM, adequate free memory, an
otherwise quiet machine on AC power and the same free-storage reservation.
`ActiveProcessorCount=4` does not provide Mac CPU affinity, a hard CPU quota or a
memory cgroup. Record that limitation; unchanged-code controls must establish
stability on that host. Do not invent Linux `/proc`, PSS, affinity or cgroup
evidence on macOS. Capture native page size, which can differ from Linux.

Use the native host's **existing** job/container execution boundary for the
deadline, cancellation and descendant teardown, with persistent output storage.
Do not port the old Linux-x64 Python controller, build another supervisor,
provision a runner, weaken security settings or dispatch CI. If the provided
native environment cannot supply that ordinary lifecycle boundary, report that
capability gap before launch. Once a phase fails or its cap expires, preserve
the result and stop; no fresh stage budget, sample extension or favorable retry.

Normal dependencies must already be available except for normal managed test
fetches: native boot JDK 26 or 27 (27 preferred), compatible C/C++ toolchain,
Autoconf/m4, GNU make, Git and normal archive/binutils tools; on macOS, installed
Xcode/SDK tools. The tree accepts GCC 10+ / Clang 13+ and GNU make 3.81+ on these
Unix targets; choose one supported installed version and keep it fixed. Do not
install a newer compiler merely to imitate the old cloud machine. Linux can
set the documented `CONFIGURE_DEV_NO_MOLD=1` for **both** builds if mold is absent.

Use one fixed jtreg installation (the repository's 8.2.1+1 pin is suitable),
GoogleTest/GoogleMock 1.14.0 at
`f8d7d77c06936315286eb55f8de22cd23c188571`, and JMH 1.37 with its annotation
processor, jopt-simple 5.0.4 and commons-math3 3.6.1. Fetch managed dependencies
from their normal source/package locations, verify hashes/archive integrity and
record identities. No private binary/image handoff is an input. Confirm a matching
ASan runtime is already available; missing native SDK/runtime support is a
platform limitation, not permission to install or weaken ASan.

## Normal full-image builds and custody

Create new B/C checkouts and one persistent output directory. Record the new
release, deadline and the exact Git/host/tool inputs before any build. Capture
the complete boot JDK, selected CC/CXX drivers and compiler backends, linker,
runtime and SDK identities. Recheck them before/after each build. Bind actual
selected `CC`, `CXX` and `BOOT_JDK` from each spec to those inputs; B/C paths,
versions and collector/profile fields must match. Stable irrelevant roots do
not prove that the selected compiler was captured.

For each checkout, use normal upstream configure via the fork's wrapper:

```sh
bash bin/configure-dev --with-conf-name=memory-native-release \
  --with-debug-level=release --with-jobs=4 --disable-precompiled-headers \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --with-gtest="$GTEST_SOURCE" \
  --with-source-date=2026-10-16T21:13:34Z \
  --with-version-opt=memory-native-decision
make CONF=memory-native-release JOBS=4 images test-image-hotspot-gtest
```

Use identical configuration options in B and C. Keep the normal javac-server
configuration symmetric. A successful make is not permission to leave workers
running: allow normal supported shutdown, require the existing owner to prove
worker closure and retain build logs/specs. Hash/catalog complete normal JDK
images, packaged/canonical native test runtimes, modes and links. No patched
module, partial Java overlay, old cloud image or different baseline toolchain
substitutes for these release images.

Compile common Java/JMH/WhiteBox inputs **once** with B's built javac, record
class hashes, and use those identical bytes for both images. From F use only
`MemoryQualification.java`, `MemoryTargets.java`, `Hello.java`, `VerifiedJavac.java`,
`VerifiedFileChannelRead.java`, `VerifiedFileChannelWrite.java` and
`FileChannelStateRegression.java`; obtain WhiteBox/parser from C's normal test
library. Do not run F's controller/supervisor or its x64/30-group/72-interval
analysis entry point. Add P's Formatter cost probe, the standalone footprint
probe, and C's NIO/Formatter test sources. Production `java.base` classes stay
inside their full images; do not compile C's production classes as a patch onto
B. This is reuse of committed test source, not a new infrastructure project.

## Correctness and attributable benefit gates

Use exact XML/JTR/action receipts, not a generic green tier1 as a substitute.
Reuse existing ordinary CI evidence for its exact source; do not duplicate full
CI tiers locally. The following native focused checks remain necessary:

* C's explicit `Array.c_heap_allocation_size_vm` with NMT enabled and
  `ParkEvent.natural_alignment_and_recycled_events_vm`: one executed case each,
  zero skips/failures. Repeat on the conditional debug/ASan images.
* Supported code-cache test IDs: Serial/G1/Z and G1 concurrent-mark unloading;
  C2 interface scratch and long-string concatenation; NIO carrier/temporary
  buffer/reclamation cases; sleep/join and G1 AOT record/create/replay with
  training-data verification. Baseline runs common semantic checks, not donor
  assertions that deliberately demand the candidate's earlier reclamation.
* C's three Formatter ownership/serialization IDs under Serial/G1/Z: nine exact
  JTRs, including controlled clone/serialization interleavings. Run the common
  locale/formatter tests for B and C, explicitly excluding new candidate-only
  sharing/detachment assertions from B. Report actual exclusions and reasons;
  do not borrow the historical 126/one-exclusion count as a native result.
* The positive-byte file-I/O EOF/iteration regression must pass before timing.

The exact C HotSpot/NIO/thread/AOT jtreg selection is:

```text
test/hotspot/jtreg/gc/TestCodeCacheUnload.java#serial
test/hotspot/jtreg/gc/TestCodeCacheUnload.java#g1
test/hotspot/jtreg/gc/TestCodeCacheUnload.java#z
test/hotspot/jtreg/gc/g1/TestCodeCacheUnloadDuringConcurrentMark.java
test/hotspot/jtreg/compiler/types/TestInterfaceSetScratch.java
test/hotspot/jtreg/compiler/stringopts/TestLongStringConcat.java
test/jdk/sun/nio/ch/TemporaryBufferCarrier.java
test/jdk/sun/nio/ch/TempBuffer.java
test/jdk/java/nio/channels/FileChannel/TempDirectBuffersReclamation.java
test/jdk/java/lang/Thread/SleepWithDuration.java
test/jdk/java/lang/Thread/JoinWithDuration.java
test/hotspot/jtreg/runtime/cds/appcds/aotCode/AOTCodeTest.java#g1
```

B runs that common selection except the Serial/G1 one-GC unloading assertions
and concurrent-mark unloading donor test. Preserve flagless collector-test
requirements rather than forcing one collector on the whole selection. The
three Formatter IDs are `DateFormatSymbolsSharingTest.java`,
`DateFormatSymbolsSerializationAliasesTest.java` and
`DateFormatSymbolsConcurrentSerializationTest.java`, all below
`test/jdk/java/text/Format/DateFormat/`. Run each with explicit Serial/G1/Z.
For common locale/formatter semantics, run `test/jdk/java/text/Format/DateFormat`,
`test/jdk/java/util/Locale`, `test/jdk/sun/util/locale/provider` and
`test/jdk/java/util/PluggableLocale` once per image with G1. Exclude those three
IDs from this common selection: their C coverage is the nine focused runs;
B must not execute candidate-only ownership assertions.
Use one jtreg worker and a 256-MiB test heap; retain exact selected-ID manifests,
per-action options and any platform exclusion. A required skipped case is a
coverage gap, not an executed pass.

Record a benefit ledger with these distinct estimands:

| Component | Required native evidence and concrete interpretation |
| --- | --- |
| C-heap metadata Array | Verify LP64/8-byte words and all 12 requested-size/tag/initialization/access cases. If required allocation is R bytes, baseline requests 8R and C requests R: exactly 7R fewer requested bytes, 87.5% for this allocation only. Current production use is AOT training dependency snapshots; do not turn that factor into a process-wide AOT saving. |
| ParkEvent | Obtain native `sizeof`/`alignof` with the normal compiler and generated headers from each build. The type's layout is unchanged; old allocation requests S+256, new S. Delta is exactly 256 requested bytes per newly materialized event, not a guessed ARM object size or malloc/RSS saving. Thread/JavaThread allocate two events: increasing high-water platform workers 64 to 192 predicts 65,536 fewer requested bytes if 256 additional events are demonstrated. |
| NIO lifecycle | Use the existing fixed 32-round, 65,536-byte, 4,096-alignment fixture; see the exposure and ledger rules below. This distinguishes eliminated retention from a fortunate allocator that never takes the path. |
| Formatter | Run `DateFormatSymbolsFootprint allocation`, with its normal javaagent, on both full images under all three collectors. Require coherent six-field ownership/serialization tests. For a 1,000-instance or clone cohort, expected distinct arrays are 6,000 versus six and reference slots 46,000 versus 46. Measure actual shallow array and instance bytes on this VM; header size, compressed references and alignment are not copied from x64. |
| Code cache | With the common WhiteBox code fixture, retain 64 dead and 64 live target identities, source semantics, actual native blob bytes, and used/committed/reserved separately. Serial/G1 C must make the dead code reusable at the first GC while live controls survive; baseline can retain it until the next GC. ZGC is an unchanged-collector control. Address reuse is supporting evidence; do not search/retry for chosen addresses or infer uncommit/RSS from disappearance in codelist. |
| C2 scratch | Require semantic/debug/sanitizer correctness and protect compiler/JIT costs. No per-helper entry/peak-byte measurement is available; make no quantified C2 memory claim from Java allocation counters or aggregate NMT. |

For native layout, a small compiler-only probe containing `sizeof(ParkEvent)`,
`alignof(ParkEvent)` and `BytesPerWord`, compiled to assembly with each build's
recorded gtest flags, is sufficient. Retain its source and flags. It neither
modifies a VM nor needs a debugger/privileged profiler. Do not reuse x64 S=160
as an ARM64/macOS measurement. For ParkEvent attribution retain the full NMT
Internal category and all detail groups at warmed, 64-worker, 192-worker and
192-worker-reuse phases; unexplained category movement is not event savings.

### NIO exposure, alignment and complete accounting

Compile `NioAlignedCacheLifecycleFixture.java` once. With matching jcmd/NMT detail
and `scale=1`, acknowledge READY, take the baseline and complete snapshot, release
the worker, take POST_EXIT detail/diff, then let the fixture exit normally.
Require all 32 content/limit/alignment checks, the completion line and zero
unexpected stderr. READY Other/malloc must be zero. Reconcile **every** live
Other detail group with the category's malloc bytes/count; do not select a stack
or use a zero delta that hides a nonzero baseline.

Predeclare default `leak`, cache-disabled `control` and thresholds 65,536,
69,631 and 69,632, once per image in each of three independent diagnostic
replicates. The default primary pair requires 32 observed misalignments on both
images. On LP64 the baseline ledger is
`round8(65536) + 31 * round8(65536 + 4096 - 1) = 2,224,128 bytes / 32 mallocs`;
C must retain zero after worker exit. The rounding is Unsafe's heap-word
allocation rounding, not the native allocator's physical bucket size. Disabled
cache must retain zero in both. For baseline threshold controls, let K be the
reported misalignment count. At threshold 65,536 expect K*65,536 retained bytes;
at 69,631/69,632 expect zero for K=0, otherwise `65,536+(K-1)*69,632`. The malloc
count is K. C must retain zero. Source path/capacity differences must explain
every category/detail byte and count.

Page alignment is an exposure variable. In particular, a Mac allocator may
return 4-KiB-aligned 64-KiB allocations (including on a 16-KiB-page machine).
An unexercised path is **FIX / inconclusive NIO coverage**, never a pass or zero
benefit estimate. Do not try additional sizes/addresses until something leaks,
relax the 32-exposure gate, or rerun for favorable placement. Stop before the
cost campaign if this required benefit cannot be established; the report can
recommend narrowing/fixing the NIO claim or component in the same draft.

For the other diagnostic cases use three fixed independent B/C runs per
collector, not adaptive repetition. Keep the Formatter instrumented/allocation
forks, NMT snapshots and optional OS resident-memory observations outside timing.
For Formatter include any measured instance-size change in the counted cohort
ledger, alongside unique array bytes; distinguish reachable shallow storage from
incremental whole-process retention and exclude strings/time zones explicitly.
On macOS no Linux smaps/PSS claim is available. Never add shallow Java-array
bytes, requested native allocations and code-heap used capacity into an RSS total.

## Protected cost matrix and unchanged-code controls

Use full release images, identical common classes, fixed inputs, NMT/agents/
profilers off, and Serial/G1/Z separately. Runtime bounds are `-Xms256m -Xmx256m
-Xss512k -XX:ActiveProcessorCount=4 -XX:CICompilerCount=2
-XX:ParallelGCThreads=2 -XX:ConcGCThreads=1`; startup uses the existing 32-MiB
initial-heap variant. Fix `-Duser.timezone=UTC -Duser.language=en -Duser.country=US`
for both members, and select exactly one `-XX:+UseSerialGC`, `-XX:+UseG1GC` or
`-XX:+UseZGC` per stratum. Pin four allowed comparable CPUs on Linux where supported;
record Mac's lack of equivalent affinity. Do not change flags per image or
collector to rescue results.

The **13 JMH conditions** are these five existing methods, plus all seven
`DateFormatSymbolsCost` methods at one worker and `symbolsCloneShared` at four
workers:

```text
org.openjdk.bench.vm.gc.Alloc.testSmallObject
org.openjdk.bench.memory.VerifiedJavac.testCompile
org.openjdk.bench.java.lang.ThreadStartJoin.test
org.openjdk.bench.memory.VerifiedFileChannelRead.test
org.openjdk.bench.memory.VerifiedFileChannelWrite.test
```

Thus the shared immutable symbols prototype is compared with private
cloning; no mutable SimpleDateFormat instance is shared between workers.
Construction, clone, formatting and parsing use fixed Locale.US/UTC/epoch input;
the format/parse pattern exercises weekday, month-name and AM/PM symbol arrays.
The old SimpleDateFormatterBench has shared mutable state and is not a valid
four-worker contention substitute. Footprint's fixed-loop medians are not cost
acceptance data.

For each condition/collector use **eight preassigned B/C pairs**, alternating
BC/CB, each followed by one B/B pair. No C/C timing substitute. Each JMH command
has one fork, no warmup fork, five one-second warmups, seven one-second
measurements, `-bm avgt -tu ns`, explicit
one/four workers and fail-on-error; the fork aggregate is the unit, not its
correlated iterations. B's normal launcher can run the fixed JMH harness with
`-jvm` selecting B or C. Both verified I/O methods use fileSize=1,000,000 and
must emit twelve positive, operation==byte iteration receipts. Execute no
additional methods or expanded sampling after seeing results.

For example, use the normal JMH entry point for one preassigned shared-clone
fork (substitute the frozen image/member, worker count, output and full common
JVM flag string; the outer fixed schedule supplies the other forks):

```sh
"$B_IMAGE/bin/java" -Xmx128m -XX:ActiveProcessorCount=1 \
  --sun-misc-unsafe-memory-access=allow \
  -Djmh.blackhole.autoDetect=false -Djmh.compilerhints.mode=FORCE_ON \
  -cp "$COMMON_JMH_CP" org.openjdk.jmh.Main \
  '^org.openjdk.bench.java.text.DateFormatSymbolsCost.symbolsCloneShared$' \
  -jvm "$MEMBER_IMAGE/bin/java" -jvmArgs "$COMMON_JVM_FLAGS" \
  -f 1 -wf 0 -t "$WORKERS" -wi 5 -i 7 -w 1s -r 1s -bm avgt -tu ns \
  -foe true -rf json -rff "$FORK_RESULT"
```

Supply bounded, non-rotating whole-fork GC logs in `COMMON_JVM_FLAGS`. A rotated
or incomplete pause log invalidates that fork's pause evidence; keep the raw
files and stop rather than rerunning the fork.

Also protect four fixed-work process scenarios per collector: the existing
192-thread churn, platform carrier I/O, virtual carrier I/O, and the bounded
64-dead/64-live compile/deoptimize/GC/recompile code fixture. Require exact work,
checksum, live-code and completion receipts. Record whole-scenario latency,
code bytes and recompile work: this is a generated-code churn cost scenario,
not isolated GC-helper timing or arbitrary application throughput. Separately
measure the existing `java -version` and compile/run-Hello startup cases. Use the
same eight alternating primary pairs and interleaved B/B pairs for each; the
existing host runner supplies process timing and ownership, not a new supervisor.

There are **57 time-per-work/latency groups**: `(13 + 4 + 2) * 3`. Only the
allocation-heavy `Alloc.testSmallObject` case supplies the three primary
collector pause-tail strata. Record GC pause logs for all forks; concurrent
cycle time is not a pause. Require at least 100 pauses per fork and 1,000 per
image across its eight forks in each primary stratum; otherwise tail evidence is
insufficient. Report per-fork p99 and the whole-fork startup/warmup/measurement
scope, not a fictitious measurement-only or pooled-population p99.

Pre-register **126 simultaneous intervals**, replacing the old 72-interval
x64-only family: `(57 latency + 3 p99 ratios + 3 p99 differences) * 2` for C/B
and B/B. Use paired log-ratio Student-t intervals, df=7, Bonferroni
`alpha=0.05/126`; use paired arithmetic differences for pause milliseconds.
For every time group require C/B upper bound <=1.03 and B/B interval wholly
inside [0.97,1.03]. Pause C/B upper bounds must be <=1.05 and <=1 ms; B/B
intervals must fit [0.95,1.05] and [-1,1] ms. The eight-fork/normal-log assumptions
and workload/platform limits remain explicit. Do not run the old hard-coded
30-group analyzer unchanged, widen thresholds, pool collectors/architectures,
extend samples or retry a noisy unchanged-code control.

## Conditional debug/ASan and the final decision

Only after correctness, attributable benefit and protected cost gates pass,
check >=12 GiB actually free, then normally build C fastdebug and C release+ASan
with the same native toolchain/profile/source. Keep both complete images and
symbols. Run the focused native and jtreg cases on fastdebug, and Array/ParkEvent
on ASan with the required live-header poison/unpoison behavior intact. On either
OS use the matching installed sanitizer runtime and normal configure mechanism;
do not disable poisoning, change code signing/security policy or claim an
instrumented-object compile as an ASan execution pass. Unsupported runtime
capability is reported as FIX/coverage pending, not silently waived.

The final report must contain a component ledger, all slower cases, fixed
cost/control intervals, actual coverage/exclusions, native byte/layout values,
source/image/tool identities and worker closure. Retain XML/JTR, full NMT
snapshots, JMH JSON/GC logs, work-validity counters, class hashes, build/spec/image
manifests and failure/inconclusive evidence. No raw host evidence belongs in the
product PR. Conclusions are:

* **ADOPT for this supported native profile** only with executed correctness,
  useful attributable benefit, all valid cost/control/tail gates, conditional
  debug/ASan coverage and complete owner closure. Parallel, other native OSes,
  generic RSS/PSS and universal no-regression claims remain outside that result.
* **FIX** for a source defect, unexplained accounting, missing alignment exposure,
  unsupported required instrumentation, insufficient/noisy controls or a cost
  interval that cannot establish the bound. State the exact component/claim to
  repair, narrow or remove; a successful build is not a substitute.
* **REJECT the offending component or packet** when valid unchanged controls
  support a material cost beyond the bound (for example a lower interval above
  1.03), semantics are unacceptable, or applicable benefit does not justify its
  measured cost. Distinguish a demonstrated loss from uncertainty.

**One execution request:** authorize this one 14-hour, conditional, native
Linux ARM64 attempt (native macOS arm64 fallback selected before launch only),
with the frozen B/C/common-source pins, four-job/resource reservations, normal
managed test fetches, full-image builds, specified diagnostics and fixed cost
matrix, conditional debug/ASan and complete analysis/closure. No old budget,
new measurement retry, cloud workaround, infrastructure project, build/evidence
deletion, additional collector, manual workflow dispatch or second-platform
campaign is included. Host access/capacity and its existing lifecycle owner
must be confirmed before release; no step of that execution is authorized by
publishing this plan.
