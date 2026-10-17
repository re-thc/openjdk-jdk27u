# Staged memory qualification from source

This entire source bundle is committed for review. The full qualification and analysis remain **unexecuted**. The first released preparation attempt
completed baseline make but stopped at the asynchronous-child ownership gate;
its original HOLD and complete cleanup receipts are preserved locally.
The complete restricted [preparation continuation](CONTINUATION.md) preserves
the original fixed UTC cutoff without repeating measurements. Historical
compiler/boot-module hashes are missing, so retained-baseline reuse is rejected;
only an explicitly released matched rebuild of both images is supported.
Complete [configuration sealing and scoped object staging](STAGING.md) is now
implemented locally for review. It defaults to dry run; actual cleanup requires
explicit policy approval and a released campaign. All images/symbols/evidence
stay retained, and C objects survive through the old-header link control.
One hundred ten offline Python guard/owner/continuation/deadline/staging
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

Use new owner and campaign output directories on an adequately sized local
workspace. No previous product image or private artifact is an input. Install
nothing in this source-only task. The saved activation script selects compatible
installed tools; standard pinned test dependencies are managed fetch inputs to
acquire through normal repository/test handling when execution scope permits.

```sh
source /workspace/toolchains/activate.sh
python3 test/manual/jvm-memory/qualification/supervise.py \
  --execute --owner-output /workspace/memory-owner-new -- \
  --output /workspace/memory-decision-new \
  --harness-commit REVIEWED_COMMIT \
  --toolchain-input-root /workspace/toolchains/gcc16 \
  --toolchain-input-root /workspace/toolchains/gcc16-root \
  --toolchain-input-root /workspace/toolchains/mold \
  --boot /workspace/toolchains/jdk27 \
  --jtreg /workspace/toolchains/jtreg83 \
  --gtest /workspace/jvm-memory-integration/build/dependencies/googletest \
  --jmh /workspace/jvm-memory-expansion/build/jmh/jars \
  --asan-runtime /workspace/toolchains/gcc16-root/usr/lib/x86_64-linux-gnu/libasan.so.8.0.0 \
  --configure-option=--with-toolchain-path=/workspace/toolchains/gcc16/bin \
  --configure-option='--with-extra-ldflags=-B/workspace/toolchains/mold/bin'
```

The supervisor supplies the inner `--execute` and `--outer-owner-reference`;
do not pass those after `--`. It launches the committed `run.py` once, not an
arbitrary command. The owner directory must also be new. Keep `owner.json` and
`controller.stdout`/`controller.stderr` with the campaign results. Direct
`run.py` invocation is for an independently approved equivalent owner, not a
controller-only `timeout` or an invented reference string.

The example defaults to storage dry run. A separately approved complete staging
release adds `--storage-cleanup=compile-objects-after-consumers-v1` after `--`.
The separate `--cleanup-only` owner mode is solely for an approved, pinned old-B
object plan; it does not run the campaign or reset a continuation deadline.

The headless profile does not need the earlier desktop/sysroot configure flags.
PCH is explicitly disabled in all configurations so the old-header control uses
the separately selected inline header, not a precompiled copy.
Installed OS headers/runtime dependencies remain required by ordinary configure;
missing ones stop the build rather than triggering installation. The four JMH
jars and GoogleTest/GoogleMock source tree are normal managed dependencies;
their example paths need not exist in a fresh saved environment. The execution
owner fetches them and records identities; the user need not preinstall or
transfer repository dependencies. GoogleTest is pinned to clean Git checkout
`f8d7d77c06936315286eb55f8de22cd23c188571` (1.14.0). JMH uses its
repository-pinned 1.37 annotation processor, with jopt-simple 5.0.4 and
commons-math3 3.6.1.
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
A new output directory is mandatory; no overwrite or favorable timing retry.
The restricted continuation verifies original receipts under owned cleanup,
requires explicit matched rebuild and uses the fixed original UTC cutoff; it never reopens the
terminal output or resumes consumed measurements. See [CONTINUATION.md](CONTINUATION.md).

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

The outer hard deadline is 10 hours from before controller launch, including
cleanup/report. It stops waiting for the controller 35 seconds before that
deadline, reserving 30 seconds for layered cleanup and five for the owner
receipt. Inner stage/global ceilings remain subordinate to that one outer
deadline; cancellation and cleanup never reset it. Stage caps:
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
remain subject to the untimed monitor and deadline. Require **12 GiB free storage
at admission**, checked on the actual execution workspace. Before conditional
debug/ASan builds, require another 12 GiB free; insufficient
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
immediate prerequisites are reviewed source, execution authorization, sufficient
working storage, normal managed test inputs and pidfd/subreaper admission.
The committed unprivileged supervisor supplies the separate owner/deadline for
inner-controller death while the supervisor survives; no privileged container
or new cgroup is required for that failure model. Removing reproducible old build outputs requires an agreed
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
Ownership uses subreaping, held pidfds and kernel direct-child verification
with `waitid(P_PIDFD, WNOWAIT)`, not a start-time check followed by numeric kill.
Only a confirmed direct child is signalled through that held descriptor;
grandchildren are eligible only after their parent exits and the subreaper
adopts them. Reaping also uses a pidfd. No numeric PID or process-group signal
fallback exists, even when a task exits between validation and signalling.
The admission check verifies required pidfd syscalls on self before any child
launch. Unsupported/denied APIs stop admission; nothing weakens the ownership
check. Start values remain an additional filter, not the signalling identity. Signals and cleanup consume the same invocation/global budget.

The controller alone does **not** contain its own SIGKILL, interpreter death, or
a native launch that never returns. `supervise.py` is a separate single-threaded
subreaper, outside the controller's session. It uses fork/exec without a blocking
parent-side exec handshake, so inner launch progress/stdout and signal handlers
do not drive its deadline. Catchable outer signals only latch the first request,
then enter owned cleanup; cancellation during launch cannot interrupt root
assignment. A partial launch with no returned root object still belongs to the
pre-launch child scope. The supervisor monitors/reaps its root through a held
pidfd and reuses the repaired cleanup primitives for all descendants.

Only kernel-confirmed direct children are eligible for signalling. Killing the
controller reparents its children to the outer subreaper; deeper layers become
eligible as their own parents exit. Repeated scans/adoption and a final kernel
child audit must complete within the fixed 30-second outer allowance. Inner
command cleanup keeps its two-second default. Successful explicit untimed build
commands alone have Scanner's six-second natural drain for asynchronous javac
shutdown before strict cleanup, retaining guards and custody. Persistent/late
drain failure remains HOLD. No measurement receives grace. Child command/exec
diagnostics are retained before signalling. There is no numeric PID/group
fallback or repeated fresh cleanup budget. A live leftover, hidden child,
ownership/read error or expired allowance remains HOLD/incomplete. Even
controller exit zero requires cleanup and the final child audit.

The owner receipt records the fixed deadline, source hashes, controller exit,
cancellation, cleanup identities/errors and final audit. `COMPLETED` plus outer
exit zero is required alongside inner `LOCAL_GO_FOR_REVIEW`; an inner failure,
cancel, timeout or missing/incomplete owner receipt cannot become a local GO.
The `--outer-owner-reference` names this receipt; the reference alone is not
runtime proof of containment under another launcher.

**If the independent supervisor itself is uncatchably killed, fails fatally or
cannot run, this user-space mechanism cannot guarantee descendant cleanup.**
Pidfds/subreaping do not cascade a kill when the owner dies. Protection against
that additional failure needs an independent system/job boundary if required;
it is not a privileged-isolation prerequisite for covering the inner controller.
The supervisor cannot promise real-time exit of an uninterruptible kernel task.
Successful cleanup is asserted only after the audit proves it; otherwise
remaining identities/errors are retained. No cgroup/security changes occur.

`test_guards.py` contains eighteen fake-clock/disk/child/signal regressions, including
build/jtreg writers with closed stdout, timed probe exclusion, cancellation during
launch/cleanup, repeated signals and PID reuse. It launches no child processes
or JVMs.

`test_supervisor.py` adds sixteen deterministic offline tests for multi-layer
adoption, inner failure, cancellation during launch/receipt closure, partial
launch, fixed/exhausted deadlines, hidden children/final audit, unrelated tasks,
fork/exec failure and the held-pidfd root boundary. Native fork/exec and signal
operations are mocked; no native child/JVM is launched. Validation used
`PYTHONDONTWRITEBYTECODE=1 python3 -m unittest -v test_guards test_supervisor test_continuation test_deadline test_staging`
in this directory: **110 tests passed**. The future campaign runs all five suites
before any builds. This does not certify native supervisor execution or kernel
containment; the full campaign remains unexecuted.
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

The combined stdout/stderr size is checked after process exit and again after
owned cleanup, before any success receipt. Late final stderr cannot bypass the
48-MiB limit even if each stream individually stays below it. Offline coverage
includes a sparse late-tail case and identity changes before pidfd validation,
after ownership confirmation, same-start-tick unrelated reuse, original-task
exit, and descriptor-based reaping. These are mocked regressions, not a claim
of runtime campaign or outer-job containment qualification.
