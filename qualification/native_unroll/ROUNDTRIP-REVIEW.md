# Cumulative conversion/reduction candidate: review packet

This is an unqualified experiment. PR14 remains draft at
`b3ce67e362c3b1678fcf3d18ee714182b2395c86`. No publication or hosted execution
is authorized by this packet. The earlier dea79 approval was already consumed.

Candidate versus matched b3 measures the cumulative earlier unqualified 6d
zero-seed lowering plus the new grouping idiom. It does not isolate the grouping
effect. A matched 6d mechanism arm is deliberately omitted; if isolated attribution
is needed, first review one small legacy comparison rather than expanding every
qualification cell.

## Changes following independent review

* The product predicate explicitly excludes SVE with MaxVectorSize greater than 16.
  UseSVE=0 with at least 16 bytes is the essential positive path. Default SVE has a
  positive assertion only at MaxVectorSize=16. This is eligibility, not a flag cap.
* Shared integer intermediates and shared reduction results have negative matcher
  controls; reversed expressions have positive controls. Runtime-masked input
  requires surviving mask-related Ideal IR. Constant all-true masks have no
  exclusion assertion because the mask can disappear.
* Mixed exceptional/large values share vectors. The bounded scalar oracle
  enumerates permitted lane-addition trees, optionally including the fallback
  identity, then propagates results through scalar additions in original block
  order. Mixed cases also run after forced matching and require all six targets
  to remain at ordinary C2 afterward. It never moves the incoming scalar into the lane tree. A deterministic
  cancellation case checks that outer-order acceptance is not overly broad.
* Explicit OSR compilation verifies ordinary 0/OSR 4, the actual target entry and
  absence of the compound matcher in the matching graph. This tests exclusion;
  it does not repair mixed incoming object/vector-box Phis.
* Carried chains of 1/8/32/64 terms force the helper inline. Compilation-cost
  repetitions use fresh JVMs, matched fastdebug images and no graph printing.
  Separate observed matching processes verify each chain. The recurrence walk
  can still be quadratic: bounded measurements are not a linear-complexity claim.
* Historical 2,333,080 aggregate assertions checked the actual level of carried128
  only. They were never a per-method/per-tier assertion tally. The new edge test
  checks all six target methods' levels before and after; its aggregate assertion
  count also includes scalar-oracle, store and tail checks.

## Executable staging

The new workflow is `vector-api-roundtrip-reduction.yml`, limited to a push to
`codex/vector-api-roundtrip-reduction`. Existing workflows do not trigger on that
branch. There are five job definitions and six hosted jobs including the two-entry
build matrix. Matrix builds are serialized and each build uses one make job.

1. Build four HotSpot overlays: b3 and candidate release, b3 and candidate
   fastdebug. Within each level, use the same native job, tools, configuration and
   hash-verified Java template. Java modules remain exact b3. Record tools before
   and after builds and verify consumer-local extracted images against build hashes.
2. Native preflight runs actual scalar/tier/cold checks, clean applicable IR
   assertions, separate compiler stress, 48 fresh compile-cost JVMs, 8 observed chain
   matching JVMs and 2 OSR-negative JVMs. A compiler task has a 30 second budget.
   UseSVE=0 positive carried128/reversed assertions must be active. Disabled
   verification, missing matches, failed compilation or unexpected fallback fails.
3. Capture 36 separately attributed ordinary release entries. Require every
   conversion in the main loop to belong to the intended five-instruction
   single-temporary sequence with the scalar recurrence connected cyclically.
   Select the main loop independently of whether it matches, so a matching
   pre-loop cannot hide a fallback main loop. Require unchanged raw-loop bytes.
   Syntax, ADLC success and separately observed code are not substitutes for
   actual native matching. These diagnostics precede every timing process.
4. Run only the four legacy recovery contrasts: two ISA settings, candidate versus
   original87 and versus matched b3. Twelve balanced adjacent pairs yield 96 JVMs.
   Any screen failure stops expansion.
5. Only after recovery passes, run 28 remaining contrasts, 672 JVMs: matched b3
   conversion/raw/direct/arithmetic retention, original compact conversion gains
   and separate legacy toolchain drift. Total maximum: 32 contrasts, 384 pairs,
   768 timed JVMs, 3,840 windows.
6. Only after all individual screens pass, run eight full Vector API suite
   invocations (release/fastdebug × default SVE/0 × compiler/JDK), 144 separately
   observed interpreter/C1/cold phase processes, and 14 distinct gap audits.

The runtime screen retains twelve process pairs, five fixed 100,000 call windows,
the same pair-common priming/history and 20,000 paired bootstraps. Shuffle seed is
8392077; the unchanged bootstrap utility uses8392004. One JVM contributes the
mean of its five windows as one observation. No graph/assembly/WhiteBox diagnostics
or inherited JVM options are allowed in timed processes. Require zero measured
compilation and allocation at most 0.01 B/call in every window.

The upper individual 95% paired ratio must be at most 1.02 for each primary screen;
compact conversion versus original must also have an upper ratio below 1.
Individual intervals across 30 primary contrasts do not establish simultaneous
zero regressions. Precision misses remain failures. No conditions are pooled,
no diagnostic unroll cap substitutes for default recovery, and no workflow
automatically declares the candidate qualified or modifies PR14.

## Evidence and open work

Always preserve complete artifacts and export sufficient readable paired rows,
ordinary bytes, matching graphs, compilation samples, failed JTRs, suite status
and phase/gap rows to job logs. Those exports permit analysis if bulk artifact
transfer remains unavailable. Record the exact event head, image/tool/class
hashes, CPU and actual flags. Qualify on the observed Neoverse-N2 host class.

Local validation uses an unchanged x86 b3 VM. The new edge test, actual OSR entry,
first compilation through 64 terms, generated AArch64 C++ syntax and protocol/checker
fixtures pass. This has not executed the product ARM matcher. The initial repeated
WB-deoptimization protocol stalled without a new compiler task; it is retained
and excluded. Fresh JVMs avoid that altered compilation state. A matching-phase
parser initially missed uppercase MATCHING; it was corrected against the same
successful saved VM output without rerunning that experiment.

The original native failures remain authoritative: the earlier 6d candidate was
3.576% slower than original with default SVE and 8.482% slower with UseSVE=0, despite
improving on matched b3. The new candidate has no native timing result. Mixed OSR
Phi allocations, surviving vector-argument ABI materialization, unsupported-wide
fallback allocations and MAX insertion remain separate open gaps. Bounded
compiler scaling and all future native outcomes need independent review before
qualification or any relevant source-only PR14 update.
