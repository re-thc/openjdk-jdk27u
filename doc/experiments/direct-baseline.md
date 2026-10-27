# Direct bytecode baseline compiler prototype

The independent audit found and fixed entry-barrier, queue-priority and
profile-accounting defects. See [causal diagnosis](direct-baseline-diagnosis.md)
and [earlier results and retained evidence](direct-baseline-results.md).
The [scheduling study](direct-baseline-scheduling.md) and
[single delayed-C1 comparison](direct-baseline-delayed-c1.md) preserve the
later architecture comparisons and their performance limitations.
The current [successor handoff](direct-baseline-successor-handoff.md) keeps
direct code executing until ordinary replacement without aging an empty MDO.
The subsequent [initialized static-field experiment](direct-baseline-static-fields.md)
increases coverage but records an adverse warmed comparison.
The [preflight and warm-history study](direct-baseline-preflight.md) removes
some avoidable refused tasks and identifies ordinary-tier warm-state changes;
it still does not establish an acceptable application win.
The prototype remains off; application benefit and warmed neutrality are
required before any adoption claim.

This is a local, opt-in x86-64 experiment based on PR95 head
`5ccc4bfff24830c1b88f093a2cd438304e51983f`. PR95 was an open, unmerged draft
when checked on 2026-10-26. It remains the merge-first prerequisite. This
prototype is independent of PR105 and the separate C1-reuse study.

`-XX:+UnlockExperimentalVMOptions -XX:+UseDirectBaseline` enables a new
compiler identified as `direct`. It emits x86 instructions from bytecode
without C1 parsing, HIR, LIR, optimization passes, inlining or register
allocation. `C1_MacroAssembler` supplies only assembler/frame helpers;
Runtime1 supplies existing runtime stub contracts. The default is off.

## Admission and handoff

The effective stock release-image flags are tier 3 invocation threshold 200,
minimum 100, combined invocation/backedge threshold 2000, interpreter invocation
notification frequency 2^7, and C1 profiling notification frequency 2^10.
Tier 4 uses 5000/600/15000. These are predicates and notification cadences,
not promises to compile after a fixed number of calls. Queue feedback,
trivial methods, profile creation, OSR, and method-specific scaling matter.

The separate early interpreter hook defaults to 32 (`DirectBaselineThreshold`).
It does not modify the ordinary masks or counters. An attempted bit prevents
repeated requests for the same Method. The new compile reason and compiler
identity use either shared-priority C1 service or a dedicated direct queue;
baseline tasks do not own or clear the
ordinary queued-for-compilation bit. An ordinary request may bypass a pending
baseline. Queue selection drops stale baseline work, and installation checks
again under MethodCompileQueue_lock and Compile_lock. An ordinary installed
method or outstanding ordinary request wins. Ordinary tasks retain their
blocking/rate selection contracts. Shared service gives direct work priority
with a bound of eight consecutive selections while ordinary work waits;
dedicated service adds one worker and never runs ordinary tasks there.

For code-cache storage the nmethod has level 1, with compiler type
`compiler_direct_baseline`. Policy treats it as level 0 and it does not update
highest ordinary compilation level or satisfy a C1 completion query. C1/C2
levels and their own compiler implementations are preserved. There is no new
call dispatch after replacement by an ordinary compiler.

Baseline entry increments the real MC counter with its existing mask, following
the counting-only C1 convention even after an MDO appears. It does not age an
MDO without collecting profiles or reset either origin. Runtime1 overflow
reports policy level 0, allowing ordinary MDO creation and admission.
Branch/type profiles are not collected in direct code. Existing MDOs still
disqualify new direct installation; an MDO created after installation does not
force an interpreted bridge. Direct execution continues until ordinary code
replaces it, while genuine interpreter/C1 inline profiling retains MDO credit.
The local shared-service candidate can hold a live direct activation's level
2/3 admission below 512 calls, after stock MDO policy has run. OSR history,
pending ordinary work and simple/C2 decisions bypass the hold. C1's own
profiling opportunity starts later; C2 can still bypass it when real profiles
are ready. MC/MDO origins, notification masks, profile maturity and
C2 profile scaling retain their ordinary meanings. Explicit C2 bypasses remain
valid. Loops are
excluded, retaining interpreter OSR rather than stranding a loop in baseline
code. Training recording/replay and compiler replay are excluded. ProfileInterpreter
must be enabled; other profiling modes fall back to the ordinary policy.

## Initial executable subset

Whole-method fallback applies to instance, native, synchronized, scoped,
reserved-stack, intrinsic, handler-containing, uninitialized-holder and
unsupported-signature methods. The implementation bounds bytecode size to
512, locals to 64 and operand stack to 32. Only category-1 integer/reference
values are admitted. A forward type-state prepass checks every supported
instruction and branch merge; it emits no intermediate instruction IR.

Supported operations include local loads/stores, integer constants and
arithmetic, casts, forward integer/reference/null branches, resolved instance
field reads/writes (including volatile and reference fields), initialized
category-1 static-field reads using the declaring class's mirror, array length,
byte/char/short/int/reference array reads, integer array stores, and resolved
static Java calls including stack arguments. Reference.referent access and
direct calls into Continuation internals are excluded. Unsupported operations
reject the whole method and do not mark it globally non-compilable.

Every Java value resides in a fixed full-word slot. Calls and traps have exact
oop maps and scope values, a reserved original-PC slot and deopt entry. The
assembler supplies stack banging and the nmethod entry barrier. Collector
BarrierSetAssembler load/store hooks supply compressed-reference handling and
heap barriers; this first prototype admits Serial/G1 only.
Acquire loads retain bytecode ordering; volatile stores emit StoreLoad.

Null/bounds failures deoptimize at the current BCI with reexecution, before the
failing operation. Completed side effects are preserved. Unhandled callee
exceptions use Runtime1's exception/unwind contract, extended explicitly to
the new compiler type. No interpreter frame-layout impersonation or migration
of an already-executed activation back to BCI 0 is involved. Return safepoint
polls and post-call continuation nops use existing compiled-code contracts.
JVMTI modes needing unqualified event/monitor/walk support are excluded; other
state changes participate in ciEnv dependency validation. These statements
describe implementation mechanisms, not a claim of complete production
qualification.

The direct compiler is explicitly registered for nmethod entry barriers.
Successful entry disarms the actual machine guard, and invalidation sets its
not-entrant bit so previously linked static callers resolve to the successor.
Counter-overflow scope state uses SynchronizationEntryBCI, before bytecode 0.

## Validation and measurement

`test/hotspot/jtreg/compiler/baseline/DirectBaselineTest.java` checks fixed-slot
branches, fields, volatile/reference stores, arrays, static calls and stack
arguments, exception-side-effect preservation, reference liveness across full
GC, virtual-thread yielding, unsupported-method fallback and ordinary handoff.
It requires actual `direct install`/`direct handoff` evidence, in addition to
program output, and runs Serial and G1.

The `eval` directory contains two small standalone workloads: record parsing
through static field/array/call helpers and real in-memory `javax.tools`
compilation. Performance results must use fresh matched JVMs, explicit flags,
serial interleaved samples, trace-disabled timing, and separately traced
coverage. Compiler-only savings or successful correctness checks are not
application speedup evidence. Repeated warmed-throughput regression disqualifies
the configuration even if startup improves.

Raw builds, configure failures, syntax failures, effective flags and benchmark
logs are retained under `/workspace/direct-baseline-evidence/`. The old restored
build configuration was rejected for incompatible desktop policy. A fresh
`direct-release` configuration was built instead; its stock library and full
image were retained before modification. Initial syntax failures (macro,
bracing and stack allocation of CodeBuffer) are retained and corrected.

Corrected measurements, failures and remaining qualification limits are in
[the results report](direct-baseline-results.md).
