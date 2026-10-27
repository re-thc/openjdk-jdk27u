# Shared interpreter-prefix guards and observation-free preparation

Local source `85d580ca1ad` completes steps 1 and 2 of the
[remaining-cost proposal](interpreter-frame-next-step.md). Common guard encoding
now occurs once at interpreter startup, while every prefix invocation still
executes those guards. A separate held-method producer excludes pilot timing
and statistics code at compile time. Both coherent release and fastdebug images
pass the pilot fixture and five existing direct-baseline tests.

This is a structural simplification and correctness result, not a measured
speedup or completed early tier. No performance run, admission hook, opcode
extension, ordinary C1/C2 policy change, default change or public action is
included. The old 227–249-call Long repayment calculation remains a historical
microcase estimate, not application qualification or a new candidate result.

## Actual entry and generation paths

The existing normal interpreter entry still establishes its real Java frame,
parameters/locals, invocation/profile counters, stack checks and method-entry
notifications. Its pilot selector checks interpreter-only mode, MethodCounters
ownership, enabled state and the published entry. It then executes
InterpreterFramePilot::emit_entry_guards inline before its existing indirect
jump. The guard helper is emitted during interpreter startup and has no arena,
mutex or producer-state dependency.

The helper preserves rax (body entry), rdx (owned counters), BCP, locals and
frame state. It retains the armed-poll test, interpreter-only test, nine JVMTI
flag checks, per-method breakpoint count and fastdebug bytecode instrumentation
checks. Hits increment only after all pass. Guard failure uses a dedicated
active-table dispatch with generate_poll=true. Earlier no-prefix selector
failures retain their preexisting ordinary dispatch behavior. This distinction
preserves the old guard polling contract without changing unrelated entries.

The generated body now contains its supported integer operations, canonical
vtos stack operations, saved BCP updates and one polling continuation dispatch.
It no longer encodes the common guard block, diagnostic hit increment or a
second guard-failure dispatch for each method. There is no extra indirect jump,
copied template machine code, global TemplateTable generation state or new IR.
The shared entry retains the checks' recurring execution cost; this change
removes their repeated generation, not the runtime obligations.

The new prepare(methodHandle) path is:

```
VM-state/lifetime assertion
  -> NoSafepointVerifier + ResourceMark + existing private mutex
  -> existing eligibility, counters owner/duplicate/capacity checks
  -> basic signature bitmap
  -> one fused BytecodeStream walk with integer checks and emission
  -> flush + instruction-cache invalidation + release publication
  -> CodeBuffer, lock and ResourceMark cleanup
```

The existing prepare(methodHandle, stats) instrumentation is preserved. Both
use the same generate_locked implementation, specialized on a single Observe
boolean. In the false specialization, if-constexpr removes the phase clock
constructors/destructors, explicit CPU/wall clocks and statistics stores. The
outer held-method overload also omits thread-ID queries, resource accounting
and the measured wrapper. Release disassembly of this overload and its false
specialization has no direct calls to the pilot CPU/wall/thread-ID or timing
helper routines. This is a check of these generated functions, not a claim that
all underlying HotSpot helpers can never do diagnostic work in other modes.

WhiteBox action 5 exercises that core for correctness. WhiteBox actions 0/4
retain their detailed observed controls, and actions 1/2/3 retain their
enable/disable/snapshot behavior. Action 5 deliberately returns no producer
phase/shape statistics. Its WhiteBox wrapper still performs reflected-method
conversion, external request timing, a snapshot and result-array packaging.
Those external costs have not disappeared from the test request. There is no
ordinary interpreter trigger or automatic method admission in this source.

## Preserved runtime contracts and remaining recurring work

The finite 64-operation scope, supported opcodes, 64-local/32-stack bounds,
integer type checks, saved BCP/canonical state, and ordinary fallback before
calls/control/throwing operations are unchanged. The arena remains sixteen
immutable 4 KiB slices in a committed 64 KiB InterpreterCodelet. There is no
code recycling or embedded Method/klass/oop pointer. Existing interpreted-frame
recognition/root walking, runtime tooling exclusions and later ordinary
compilation/deoptimization remain intact.

The observation-free producer still performs the required method checks,
signature scan, logical bytecode decoding/state checks, instruction emission,
BCP-update encoding, CodeBuffer bookkeeping/destruction, instruction flush and
release publication. It still locks the same mutex while in a no-safepoint
region; contention can delay a safepoint. No longer or additional no-safepoint
scope was introduced, but this phase does not establish a production contention
bound. Fixed arena allocation remains prepaid and each method consumes a full
slice. No new CPU cost is assigned to these categories without measurement.

Each execution still pays normal interpreter-frame entry/counter/event work,
the shared guard checks and diagnostic hit store, canonical expression-stack
traffic and per-bytecode BCP stores, then ordinary dispatch at the unsupported
boundary. Sharing encoding does not remove those per-call costs. The prior
weak Short margin is therefore not resolved by source simplification alone.

## Review, qualification and provenance

Independent read-only review accepted the concrete source before execution. It
checked entry register/frame preservation, guard/hit ordering and polling,
metadata lifetime and ownership, the two compile-time variants' shared
semantics, cleanup and instruction publication. No assertion or existing
tooling exclusion was bypassed.

The pilot fixture retains the observed VM-thread and requesting-thread routes,
and adds the same checks for action 5: Serial/G1 semantics and oop identity,
ordinary call/array/null/bounds/branch/exception fallback, dynamic JFR fallback,
C1 handoff/deoptimization, fixed arena exhaustion and class unloading. It checks
that the plain producer leaves its measurement fields zero. The 64-operation
statistic check remains on the observed variants; all variants share that
bounded loop and test the long-prefix execution result. The two-producer
publication/duplicate/GC/stack-walk case runs for actions 4 and 5.

Both modes pass the pilot fixture and DirectBaselineTest, Instance, Long,
Handler and StaleInstall: twelve jtreg driver results in the
[test ledger](direct-baseline-data/interpreter-simplify-tests.tsv).
The fixture does not explicitly force an armed-poll guard failure or a late
breakpoint. Concurrent GC/walker progress does not prove observation inside
the critical section. Late JFR covers one dynamic tooling guard, not arbitrary
JVMTI, continuation or collector qualification. These remain explicit limits.

Images and raw build/test/disassembly evidence remain private under
`/workspace/interpreter-frame-simplify`; only
[source/libjvm identities](direct-baseline-data/interpreter-simplify-images.tsv)
and the small test ledger are committed. Previous publication images were
hash-checked unchanged. The older `d42a8db4f2c` pilot, `a082e2d668d` direct
candidate and their retained reports/images remain preserved. Local checkpoint
branches also retain `8e9b7c551b8` and `5e805ae324e`.

Before building, the operative MakeBase.gmk, RunTests.gmk and logging regression
files were verified byte-identical to landed PR104
`92934849603fd86357c740ea50c345d335832932`. They are already present through
separate local build-only prerequisites `31e40beba2f` and `fca5d6f7f25`; there
was no runtime base migration or workflow/CI action. Incremental builds ran
sequentially with JOBS=3 and retained owned-command/subreaper orchestration.
All commands completed/reaped. The PID1 zombie set is unchanged at twenty;
already adopted zombies were not repaired. Free workspace space is 3.4 GiB.

The remaining early-stage question is whether an eventual safe normal trigger
and these prefixes repay their actual cost in calls that would otherwise still
interpret before ordinary optimization. The current source does not answer
that question, and this correctness-only phase runs no timing campaign.

The follow-up [forced-poll and late-breakpoint qualification](interpreter-frame-guard-qualification.md)
tests the two concrete gaps stated above on release and fastdebug, retaining
the startup-capability and disarm-poll scope limits. This report's original
images and timing exclusions remain unchanged.
