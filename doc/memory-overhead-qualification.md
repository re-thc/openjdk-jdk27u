# Staged integration-decision milestone (proposed, not executed)

The complete reproducible harness, fixture sources, NMT parser, bounded process
ownership and statistical analysis are committed in
[`test/manual/jvm-memory/qualification`](../test/manual/jvm-memory/qualification/README.md).
That README contains the exact invocation, identities, staged order, supported
repository profile, installed inputs, resource ceilings, acceptance and stop
conditions. Review and reproduction use Git; no private local-file handoff,
saved binary, consumed approval or stopped observer is required. The full campaign
remains unexecuted; source-regression validation is reported in the
harness README without being relabeled as JVM qualification.

## Exact-head reconciliation

Baseline B is fork master `89885a6288e7aaabd01678a704a586272c0f96e3`.
Candidate C is published source/test head
`f03c433e6846632173209a2d85ca471c6ae6aa22`. Later documentation/harness commits
do not change the frozen candidate's production/test identity. All fourteen
production files match built source `770f5cd0ef89bceae11a5f66c014815bfa3b4b73`.

| Area | Existing evidence | Remaining limit |
| --- | --- | --- |
| Correctness | Release build, 13 focused jtreg IDs at production-equivalent 770f5; two native tests and independently compiled old-header negative at f03c | Existing build enabled more collectors than repository profile; no current fastdebug/ASan runtime result |
| Array | Actual requested size/tag, initialization/access in 12 cases; old-header control fails only 12 size assertions | No quantified process AOT memory saving; functional AOT route passes |
| ParkEvent | Current natural alignment/recycling test; historical 416-to-160 requested bytes/event | Fresh current-profile requested-byte attribution and contention/start costs |
| Code-cache | Historical 18 pairs show earlier reuse for Serial/Parallel/G1 | Fresh profile Serial/G1 behavior and ZGC unchanged control; actual memory/cost trade |
| NIO | Three current functional cases, platform/virtual checksums; historical 2,224,128 retained baseline requested bytes versus zero | Current matched native/profile lifecycle accounting and protected performance |
| C2 scratch | Reviewed independent arena lifetime and regular C2 semantic regression | Helper-entry/peak-byte effect unquantified; no C2 memory claim |
| Startup/performance | No startup gain; historical noisy controls and some slower estimates/worse G1 tails | Fresh balanced protected comparisons; no universal speed guarantee |
| Physical memory | No established RSS/PSS reduction | Requested, used, committed, reserved, peak and retained remain distinct |

No additional production defect was identified. The ASan header-read repair is
present; instrumented compilation is not an ASan runtime pass. PR44 audit is
`259d487b6512f4bdd663d52ad082065dbc6c8c80`, 41 files, no overlap. Other entries
remain the dated audit, not an assertion that every current PR was refreshed.

## One staged decision, suitable available host first

1. On installed Linux x64, build matched normal source checkouts with
   `bin/configure-dev`: headless, Serial/G1/ZGC, x86-64-v3. No Parallel/Shenandoah
   performance stratum or silently skipped Parallel correctness claim.
2. Settle exact-head profile correctness and meaningful retained requested-byte
   benefit. Stop on failed/inconclusive gates; do not spend the remaining budget
   on timing a packet without an established useful benefit.
3. If worthwhile, run protected allocation, compiler, platform/virtual I/O,
   thread-count and startup comparisons with unchanged controls. Only after
   those gates pass spend time on conditional local fastdebug/ASan builds.
4. Report LOCAL_GO_FOR_REVIEW or HOLD with the exact evidence. A local GO supports
   an integration review in its tested scope. Supported-platform correctness
   then proceeds through normal repository CI **after separately approved PR
   integration**; it is not a requirement to provision four native performance
   hosts before obtaining a useful local result. Architecture-specific
   performance elsewhere remains a separate claim, requiring native hardware
   only if requested.

Default execution is one authorization through all conditional local stages,
not a chain of tiny approvals. Intentional early-stop options end an invocation;
they never resume consumed time. Global cap ten hours, four CPU equivalents,
16 GiB existing memory ceiling and 12 GiB initial free working storage (another 12 GiB free is checked only
before the conditional debug/ASan stage). Check actual capacity at admission;
reviewed source, execution authorization and managed test inputs remain
prerequisites. No extra native host or unmanaged installation
is mandatory for this first decision. Preparing/reviewing the owned launcher,
normal builds, measurement and analysis remain owned work.

This source-planning continuation launched no builds, tests, benchmarks, observer,
CI, installation or PR. No new performance or broader-platform pass is claimed.

The source repair adds all-writer storage guards, verified positive-byte file
I/O with EOF/repetition regression coverage, and cooperative catchable signal
cancellation. Timed commands reserve bounded write space before timing rather
than adding filesystem probes inside measured intervals. Uncatchable controller
death is handled by the separate committed unprivileged `supervise.py` owner,
using the repaired kernel-confirmed child pidfds and one monotonic deadline.
It reserves 30 seconds for progressive adoption/cleanup and five for reporting
inside ten hours; inner cleanup retains its two-second default. It does not
guarantee descendant cleanup if the independent supervisor itself is uncatchably
killed or cannot run. No privileged isolation is required for the live-owner
failure model. Tier1's GTestWrapper is not an explicit
NMT-enabled Array receipt; compiler/stringopts and NIO selections also retain
exact-ID receipts. The first qualification claim remains Linux-limited.

The first released attempt completed baseline make, then stopped at its strict
live-descendant-after-launcher control, with complete owned cleanup. That HOLD
is preserved. Scanner db266200's reviewed six-second natural successful-build
drain now accommodates bounded asynchronous javac shutdown while retaining
strict measurement cleanup and command diagnostics before signalling. The
complete restricted continuation verifies a full retained baseline witness,
preserves both production identities and the original ten-hour absolute cap,
and runs every unstarted gate without rebuilding B or repeating measurements.
It requires independent review before execution; see the harness
[continuation contract](../test/manual/jvm-memory/qualification/CONTINUATION.md).

Validation of the source repairs, supervisor and continuation: fifty-three offline mocked
Python regressions pass, including layered adoption, inner failure, cancellation
during launch, fixed deadline exhaustion and final child audit. The supervisor
and repaired continuation remain unexecuted. The Java
positive-byte EOF/repetition regression is committed but remains
uncompiled/unexecuted. No build, JVM workload, benchmark, CI or workspace cleanup
was performed for this repair.

The combined stdout/stderr size is checked after process exit and again after
owned cleanup, before any success receipt. Late final stderr cannot bypass the
48-MiB limit even if each stream individually stays below it. Offline coverage
includes a sparse late-tail case and identity changes before pidfd validation,
after ownership confirmation, same-start-tick unrelated reuse, original-task
exit, and descriptor-based reaping. These are mocked regressions, not a claim
of runtime campaign or outer-job containment qualification.
