# Staged memory qualification from source

This entire source bundle is committed for review. The full campaign and analysis remain **unexecuted**. Ten offline Python guard
regressions pass with fake children, clocks, disks and signals; they launch no
subprocesses or JVMs. Java EOF/repetition coverage is source-only and has not
been compiled or run under this continuation's no-build restriction.
No new build, correctness, memory, performance or ASan runtime pass follows from
this preparation. Existing executed results remain in
[the current validation record](../../../../doc/memory-overhead-validation.md).

One campaign on the available Linux x64 host makes the first useful decision:

1. Build B/C release using **`bin/configure-dev`**, the repository headless
   Serial/G1/ZGC profile. Freeze inputs, image hashes, compiler/configuration,
   CPU, flags and every command/exit/cleanup receipt. Run profile verification,
   exact candidate native cases, independent old-header control, nine common
   baseline jtreg IDs and twelve candidate IDs. Parallel is intentionally not
   built; its earlier all-feature test is historical supporting evidence only.
2. Compile fixtures and five selected JMH sources once. Use those
   same classes for B/C. Establish fresh current-image NIO retained requested
   allocation benefit with strict absolute NMT accounting, code-cache used/reuse
   behavior and thread high-water snapshots. Any failure/inconclusive oracle
   stops here. No observer, stopped controller, or address-search retry runs.
3. If benefit is real, compare protected workloads and startup with eight balanced
   B/C pairs and interleaved B/B pairs, separately for Serial/G1/ZGC. A failed or
   noisy B/B control is HOLD, not a pass. If the packet is not worthwhile, stop
   without spending time on new debug/sanitizer builds.
4. Only after performance gates pass, build C fastdebug and C ASan from source.
   Repeat focused correctness on the new debug image and two native cases on
   ASan, keeping header poisoning enabled. These new configurations need their
   own correctness results; the saved release checks do not substitute.
5. Produce `decision.json`. `LOCAL_GO_FOR_REVIEW` is a local integration
   recommendation, not an architecture-independent performance claim. Supported
   platform correctness is a later **normal CI gate after separately approved
   PR integration**. No extra native host is mandatory for this first decision;
   native architecture-specific performance remains a distinct future claim.

## Exact invocation (proposal only)

Use an empty new output directory on an adequately sized local workspace. No
private artifact or downloaded binary is an input. Install nothing in this task.
The saved activation script selects compatible tools already installed.

```sh
source /workspace/toolchains/activate.sh
python3 test/manual/jvm-memory/qualification/run.py \
  --execute --output /workspace/memory-decision-new \
  --outer-owner-reference APPROVED_JOB_OWNER_WITH_DESCENDANT_DEADLINE \
  --boot /workspace/toolchains/jdk27 \
  --jtreg /workspace/toolchains/jtreg83 \
  --gtest /workspace/jvm-memory-integration/build/dependencies/googletest \
  --jmh /workspace/jvm-memory-expansion/build/jmh/jars \
  --asan-runtime /workspace/toolchains/gcc16-root/usr/lib/x86_64-linux-gnu/libasan.so.8.0.0 \
  --configure-option=--with-toolchain-path=/workspace/toolchains/gcc16/bin \
  --configure-option='--with-extra-ldflags=-B/workspace/toolchains/mold/bin'
```

The headless profile does not need the earlier desktop/sysroot configure flags.
PCH is explicitly disabled in all configurations so the old-header control uses
the separately selected inline header, not a precompiled copy.
Installed OS headers/runtime dependencies remain required by ordinary configure;
missing ones stop the build rather than triggering installation. The four JMH
jars and GoogleTest/GoogleMock source tree are normal managed dependencies,
already present. JMH uses its repository-pinned 1.37 annotation processor.
Only five self-contained benchmark sources are compiled (two unchanged repository
benchmarks plus committed VerifiedJavac and VerifiedFileChannelRead/Write).
The adapters reject failed compilation or zero-byte I/O instead of timing invalid
work. FileChannelStateRegression is compiled alongside them and must pass before
any performance sampling, so a headless image
need not build unrelated desktop benchmarks. `bin/configure-dev` sets x86-64-v3
on this platform; the CPU must support that repository profile. Native profile
verification is executed before correctness workloads.

`--stop-after=benefit` and `--stop-after=performance` are optional **terminal
choices for this invocation**, not resumable attempts. Default `all` carries the
single authorization through the staged decision without small approval gates.
An intentionally early stop reports pending stages and is not a full pass.
A new output directory is mandatory; no overwrite/resume/favorable retry.

## Frozen sources and bounds

B=`89885a6288e7aaabd01678a704a586272c0f96e3`;
C=`f03c433e6846632173209a2d85ca471c6ae6aa22`.
Later review-branch changes to docs/harness do not silently change C's product
or regression-test identity. All fixtures are in Git: the reviewed Java source
bodies are preserved with full legal headers, and the existing public NIO and
carrier sources come from C. WhiteBox comes from C's normal test library. The
NMT parser and child-ownership library are committed here; no previous run's
classes, image, approval, freeze or deadline is reused. Reusing a generic cleanup
library does not launch its earlier observer. The parser is strict for this JDK's
NMT grammar and fails closed on unfamiliar output.

The hard campaign deadline is 10 hours including cleanup/report. Stage caps:
110 minutes for matched release source/build preparation, 90 for correctness and
benefit, 240 for performance/startup, 140 for conditional fastdebug/ASan, leaving
20 minutes global reserve. Release build cap 50 minutes each; debug/ASan build
cap 70 each, all inside stage/global caps. Each configure cap 180 seconds,
correctness test 600 seconds, fixture/fork 60 seconds, nested jcmd 10 seconds
inside its parent fixture's deadline. Cleanup reserves two seconds inside each
invocation; final cleanup/report also stays inside the global boundary. Stage
caps are ceilings, not promises that every maximum-duration invocation fits.

Four CPU equivalents, inherited CPU affinity 0–3, 16 GiB existing cgroup memory
ceiling, four build jobs, <=256 MiB workload heaps, fixed <=192 Java workers and
<=256 native JVM threads per direct fixture. JMH uses exactly one worker/fork
and bounded collector/compiler pools; root thread-count guard is enforced, but
this is not complete kernel thread-event tracing of short-lived fork threads.
Build/tool JVMs use their normal supported memory settings inside the cgroup.
Output <=48 MiB per invocation and <=4 GiB top-level campaign log files.
All writing commands, including builds and jtreg, have storage admission and
post-exit checks; untimed writers also poll every second, even after stdout
closes. Each measured command instead reserves 256 MiB above the 1 GiB floor
before its process clock, with no filesystem-capacity probes inside that
interval, then checks after exit. This policy relies on these fixed bounded
writers: one-million-byte I/O files, capped stdout/stderr, 32-MiB GC-log rotation,
small fixed compiler outputs, and an inherited zero core-dump limit. Any GC-log
rotation invalidates complete pause evidence. This is not a guarantee against
unrelated writers exhausting a shared filesystem. Receipts record the policy,
free bytes and poll count. The output, repository and default temporary
filesystems are checked. Nested build/jtreg outputs still consume storage and
remain subject to the untimed monitor and deadline. Require **12 GiB free storage at admission**; current workspace has only
about 1.9 GiB. Before conditional debug/ASan builds, require another 12 GiB free; insufficient
capacity records HOLD_DEBUG_STORAGE with the completed release results intact.
No automatic deletion/provisioning is performed. Stop before
running if capacity, profile CPU support, subreaping or installed tools are
unavailable. No additional performance host is a prerequisite.

## Results and interpretation

`freeze.json`, expanded `commands.json`, per-image manifests/specifications,
class hashes, explicit `coverage.json`, native XML, old-header preprocessing/object/link proof, JTRs,
absolute NMT snapshots, acknowledged-phase smaps, JMH JSON, raw GC logs,
`samples.json`, `statistics.json` and `decision.json` remain in the new output.
Commands/identity/deadline failures and partial results are preserved. No
unknown option, missing/empty/skipped test, sanitizer report, checksum failure,
nonzero READY Other allocation or unexplained NMT group becomes a pass.

The fixed default NIO oracle is B=2,224,128 requested bytes/32 retained
allocations and C=0 after 32 verified misaligned replacements, with explicit zero
before work in both. Cache-disabled and threshold controls retain their strict
accounting. This is material requested-allocation benefit for that lifecycle;
it is not RSS/PSS, startup or general heap savings. An allocator that does not
exercise the branch makes it inconclusive, with no search/retry. ParkEvent
snapshots are kept for independent callsite attribution; total `Internal` bytes
are never relabeled as event bytes. Its historical requested-size claim stays
historical. Code-cache used, committed, reserved and address reuse are separate.
C2 helper-entry/peak memory remains unmeasured, without a C2 memory claim.

Five steady-state JMH workloads protect allocation, verified javac, thread start/join,
and verified heap-buffer file reads/writes. Read clears the buffer before every
read and after EOF, rewinds the file, and requires exactly one transferred byte
with the expected contents. Write also restores full buffer capacity and rejects
zero/partial transfer. Its iteration starts with a truncated bounded file.
Both emit operation/byte/rewind counters in iteration teardown, outside timing.
The harness requires twelve positive operation==byte receipts per fork; a
nonzero JMH score or passing B/B control alone is not a work-validity oracle.
The functional regression uses file sizes one and three over two iterations,
forces EOF/wraps repeatedly, and verifies exact bytes, contents and reset counts.
These are qualification adapters; the unrelated upstream micro sources are not
silently presented as repaired or independently validated. Three fixed-work process-latency fixtures
protect 192-thread churn and platform/virtual scalar/scatter-gather I/O with
exact checksums. Process startup is separately measured by `java -version` and
compiling/running committed `Hello.java`, with a warm filesystem cache. Fixed
process latency is not virtual-thread steady-state throughput. No installed
application distribution is presumed; no DaCapo/Renaissance/SPEC claim follows.

For each workload/collector: eight B/C pairs, alternating BC/CB, with one B/B
pair after every primary pair. Fork aggregates are units, not correlated JMH
iterations. JMH: one fork/worker, five one-second warmups, seven one-second
measurements; baseline/candidate share the same classes and instrumentation.
There are 480 JMH, 288 fixed-work, and 192 startup invocations, plus separate
Hello semantic checks. All are sequential, budget-limited, with no adaptive
extension. JMH input fileSize stays 1,000,000. NMT/profilers/observer are off
for timing; process supervision and boundary context reads remain visible.

Proposed acceptance: simultaneous upper C/B time ratio <=1.03, only if meaningful
NIO benefit above is established. B/B interval must fit [0.97,1.03]. Each of the
three allocation-pressure strata also requires >=100 pauses per fork and >=1000
per image across its eight forks for a p99 gate. The certified metric is the
geometric mean per-fork p99 ratio and mean per-fork p99 signed delta in ms,
not a confidence interval for an arbitrary pooled process tail. Pause logs cover
the whole fork including startup/warmup, not precisely the JMH measurement
interval; their scope must not be relabeled as measurement-only pauses. The allocation-pressure logs include `gc*=info`, including ZGC
`gc,phases` pause records; concurrent-cycle and total safepoint times are not
counted as GC pauses. Paired Student-t
intervals (df=7) use Bonferroni alpha=0.05/72 across C/B and B/B's 24 workload,
6 startup and 6 pause metrics. C/B p99 upper ratio <=1.05 and upper delta <=1 ms;
B/B ratio interval within [0.95,1.05] and delta interval within [-1,1] ms.
The normal-paired-log assumption and eight-fork limitation are explicit. Raw
pooled pause quantiles/count/max are supporting observations; no certified p99
for undersampled workloads. Any failed/noisy control or insufficient gate is
HOLD, regardless of favorable point estimates. Report all slower cases.

## Ownership and next decision

Owned work: source review of this new harness, freeze/launch preparation, normal
checkouts/builds, analysis and honest report after campaign authorization. The
only immediate external dependencies are execution authorization and sufficient
working storage, plus an existing outer job owner with a hard descendant cleanup
deadline for uncatchable controller death; installed compatible tools already cover the required local
CPU architecture. Removing reproducible old build outputs requires an agreed
storage policy; preserving raw evidence is mandatory. No native hardware,
application-suite purchase, PMU tool or hosted runner is required for the local
staged decision. Other-platform correctness can use normal repository CI only
after separately approved PR integration. Other-architecture performance needs
native hardware only if that distinct claim is requested. No CI is launched,
no PR is created, and nothing is merged by this harness.

## Cancellation, source regressions and CI receipts

SIGTERM, SIGHUP and SIGINT only latch the first cancellation request; handlers do
not raise in the middle of Popen or cleanup. Safe points before/after launch and
in the supervision loop initiate bounded owned-descendant cleanup. Signals during
cleanup do not interrupt it. Cancellation is recorded and cannot become a GO.
Ownership uses subreaping and PID/start-time revalidation; reused PIDs are not
signalled. Signals and cleanup consume the same invocation/global budget.

The controller alone does **not** contain SIGKILL, interpreter death, or a native
launch that never returns. The recorded `--outer-owner-reference` is an owner
attestation, not runtime verification of that boundary. Run only under an
approved pre-existing job/cgroup owner that can kill all descendants, including
new sessions, at its hard deadline; ordinary `timeout` of just the controller
process group is insufficient. No owner, cgroup or runner is provisioned here.

`test_guards.py` contains ten fake-clock/disk/child/signal regressions, including
build/jtreg writers with closed stdout, timed probe exclusion, cancellation during
launch/cleanup, repeated signals and PID reuse. It launches no child processes
or JVMs. Source-repair validation used
`PYTHONDONTWRITEBYTECODE=1 python3 -m unittest -v test_guards` in this directory:
10 tests passed, including both build and jtreg closed-stdout cases. The future campaign runs these offline checks before any builds.
The Java state regression must execute after source compilation; a Java source
review is not claimed as a runtime positive-byte pass.

For later integration, tier1 does run GTestWrapper, but its default invocation
can skip Array without NMT, and NMTGtests selects `NMT*:os*`, not `Array.*`.
Require an explicit `Array.c_heap_allocation_size_vm` receipt with
`-XX:NativeMemoryTracking=summary`, one executed case and zero skips/failures;
also retain the explicit ParkEvent native-filter receipt. Compiler/stringopts
and the three NIO channel test selections need their own exact-ID JTRs and image
identities. `coverage.json` indexes these receipts from this Linux-only local
campaign. A generic green tier1 job cannot replace them. These requirements do
not add other platforms or enlarge the proposed campaign.
