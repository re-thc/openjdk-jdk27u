# Native kqueue release comparison

This single Mac job compares the exact qualified batching candidate with its
minimal cached-registration-reset baseline. Product commits, source-tree hashes,
three changed product files and the completed correctness evidence are pinned in
`source-pins.json`. The Java pending-update queue optimization is absent from both
arms. Correctness is not repeated: the prior fastdebug run passed21 jtreg
invocations and two native diagnostics. Its real kernel diagnostic observed zero
EINTR; forced interruption branches were covered by mocks.

## Images and prerequisites

Build one baseline release image, then incrementally build the candidate with the
same source directory, configuration, compiler and VM. Copy and hash each complete
image separately. Rehash baseline after candidate construction; require identical
`libjvm.dylib` and configuration, differing `libnio.dylib` and `lib/modules`, and
correct release-source identities. Record complete per-file image manifests.
This is one build pair on one host; build/host variation is not independently
sampled. No fastdebug image substitutes for a release arm.

Reuse the tested normal Mac setup: macos-26 arm64, Xcode26.6(17F113), SDK26.5,
Homebrew Autoconf2.73/make4.4.1/m41.4.21, and checksum-pinned official BootJDK26.
Fail if these exact supported prerequisites are unavailable. Install only official
Homebrew Autoconf/make as in the successful correctness run, with120-second cap,
normal trust policy and no upgrades/auto-update. BootJDK acquisition is bounded at
90seconds and its archive is checksum verified before data-filtered extraction;
validate contained executable java/javac and release identity. No security,
network, signing or SIP settings change. A new runner must obtain these build
inputs; the prior JDK images were intentionally not uploaded.

The standalone comparison does not use jtreg/JTHarness, so no Linux staging job,
harness download or transfer artifact is needed. Reuse their verified provenance
only as historical correctness evidence, not as an expired runtime dependency.

## Cases and syscall reach

| Case | Complete work and control |
| --- | --- |
| stable |64 loopback TCP connections,1KiB verified exchanges, READ interest fixed during each phase; zero registration calls expected. |
| single |1 TCP connection,1KiB exchange, one WRITE add then delete per completed exchange while READ remains enabled; two scalar-sized registration calls in either arm. |
| bulk |137 TCP connections,1KiB exchange each per complete round; READ to WRITE to READ once per round,548 filter transitions/round (four/frame). More than64 filter changes per leg exercises batch boundaries. |
| backpressure |64 TCP connections,128KiB exchanges, requested16KiB buffers, peers read16KiB with5ms pause. Require zero-byte writes, partial writes, WRITE transitions and all payload bytes verified. |
| construct |Complete Selector.open/selectNow/close lifecycles, including the wakeup READ registration that remains scalar in both arms. Captures added per-selector allocation. |

All TCP endpoints use TCP_NODELAY and requested64KiB buffers except pressure's
16KiB; record actual send/receive buffer ranges on both endpoints before/after
measurement and require equality within each process and matched pair. Payloads
include connection and sequence identity. Fixed semantic transitions per exchange
avoid measuring different registration work merely because an arm polls faster.
Peer failures, incomplete payloads, pressure not reached or unbalanced work fail.

Before timing, run10 separate fresh reach JVMs (one/arm/case),100ms warmup plus
200ms observation each,15-second command cap. A thread-local dyld interposer scopes
counts to the benchmark thread and its selector fd, with separate phase counters.
Count kqueue creation, poll/registration calls, submitted filters by operation,
receipt records/errors, EINTR and maximum changes/call. Preserve errno and return
values. Verify active poll interception, scalar baseline, receipt candidate,
actual multi-entry bulk calls and stable/single/constructor controls. Constructor
counts include its wakeup registration. Abort before timing if injection is
ignored, counts disagree, errors/interruptions occur or workload reach fails.
These probes are not performance samples or additional correctness qualification.
Use normal launcher entitlements; do not change signing if interposition fails.
Check required public SDK headers before building. The interposition contract is
[Apple's public dyld header](https://github.com/apple-oss-distributions/dyld/blob/main/include/mach-o/dyld-interposing.h);
Darwin RSS units follow [Apple's getrusage manual](https://github.com/apple-oss-distributions/xnu/blob/main/bsd/man/man2/getrusage.2).

DYLD insertion is set only on the final direct Java child exec; protected shell
or Python launches cannot silently strip it first. Timing processes contain no
injection variable, helper calls or trace counters. Record helper/class hashes;
the identical once-compiled workload class files are used by both arms.

## Pairing and observations

Exactly12 independently launched process pairs per case:60 pairs,120 timing JVMs.
Each process executes one case with2seconds warmup plus4seconds measurement.
Alternate AB/BA across12 rounds (six of each/case) and rotate case order each round.
No multiple-case shared process counts as independent pairs. Preserve every
completed, failed and unmatched observation; stop on failure, without reruns,
duration changes, optional dropping, adaptive selection or automatic outliers.

Fixed JVM flags:256MiB initial/max heap,512KiB thread stack,128MiB reserved code
cache, core dumps disabled. Capture phase wall/process CPU, verified bytes or
lifecycles, main-thread allocation, latency histogram, logical changes, write/read
calls, partial/zero writes and drain time. A process wait4 receipt separately
records full-process wall/CPU/peak RSS (Darwin bytes); stop if peak RSS exceeds
1.5GiB. Main-thread allocation excludes peer-thread allocation; process CPU includes
peers/GC/JIT. Latency histogram quantiles are bucket upper estimates. No claim of
steady state from a four-second window.

Report raw paired throughput/CPU/allocation/latency, case medians/geomeans and
AB/BA strata. All pairs share one host/build pair, and requests/phases within a
JVM are correlated. Interpret controls and adverse results alongside bulk gains;
no universal application-throughput or independent-build confidence claim.

## Bounds and artifacts

One macos-26 job:110minutes hard,100minutes work from before checkout, with phase
caps5 setup/35 baseline build/10 incremental candidate/5 reach/36 timing minutes.
Initialization/checkout and other bookkeeping fit the remaining9 work minutes.
The timing command caps sum2016seconds (96 TCP JVMs at18seconds,24 constructor
JVMs at12seconds);30-second settle and approximately24seconds of fixed group
teardown leave90seconds of the2160-second phase for receipts/aggregation. Actual
TCP phases each have a two-second drain bound; peer teardown has a global two-
second join. Phase/global limits always override individual command limits.

Additional direct Java commands:10 untimed reach JVMs, BootJDK and both image
version queries (three), and one javac compilation. Thus134 explicit Java/javac
launches plus build-internal Java tools, which are bounded by build phases rather
than claimed as a fixed process count. One clang helper compilation; Python,
git, build-tool probes and supervisors are also bounded and recorded. Three build
jobs maximum. No jtreg invocation, timing baseline fastdebug build or correctness
rerun. Stop actual failures; no automatic second dispatch or budget extension.

Require12GiB initial free space. Observe10GiB workspace-file and2GiB free-space
guards outside timing; these are fail-stop checks, not a filesystem quota. Two
separately retained local images and build products are ephemeral. Supervised
commands have bounded streams and128MiB aggregate log budget; collection is
bounded to128MiB. Always terminate owned process groups and collect on failure.
Allow2minutes cleanup and8minutes upload after work. Upload selected operational
source, source/tool/image/helper identity manifests, command receipts/bounded
stdout/stderr, phase/paired observations and results for five days. Exclude JDK
images, classes, dylibs, core dumps, journals and raw environment/provisioner dumps.

Publication and one workflow dispatch require separate explicit approval of the
exact validation commit and these bounds. No product PR, production ref update,
merge or native correctness rerun is part of this workflow.
