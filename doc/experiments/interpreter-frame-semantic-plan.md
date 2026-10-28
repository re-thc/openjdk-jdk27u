# Next semantic scope: category-1 callers with interpreter-native calls

Implementation checkpoint: the approved Stage A and ordinary-call Stage B are
now qualified locally; see [dynamic-call results and remaining limits](interpreter-frame-dynamic-calls.md).
The proposal and retained reach estimates below preserve their original
denominators. Stage C and automatic admission remain deferred.

Automatic admission for the current integer-prefix subset is not the next
implementation. The recommendation is one staged semantic batch: instance and
reference values, cached field reads and forward control flow, completed by
ordinary Java calls that return into the generated caller. Calls are the
important boundary: merely ending the prefix at an invoke still interprets
most of these callers. Backward loops follow this batch rather than replacing
it as the first coverage target.

This is a proposal from runtime source `452b85eef42`, retained method/entry
censuses and saved samples. No runtime source, JVM, benchmark, build, sampler,
admission, tier policy or public state changes in this pass. The prior
[admission design](interpreter-frame-admission-plan.md) is retained for context;
its automatic lane is deferred, and its synthetic opcode threshold is not
used to rank this semantic work.

## Evidence, expected reach and ranking

The earlier direct compiler's real pre-CI refusal census contains 239/240
first failures at invokeinterface, 173/174 at checkcast, 44 at instanceof and
58 loop exclusions. Those cohorts already support other fields and calls;
they are not coverage predictions for this emitter. The later broad compiler
still has 91/162 unresolved-or-unsupported call failures and 21/35 field
failures in startup/warm eligible populations. Implementing an opcode does
not eliminate linking/visibility/runtime restrictions.

The new offline audit instead joins saved entered methods to their class-file
bytecodes, constant-pool member descriptors and branch targets. It classifies
complete caller bodies, rather than crediting one short prefix before a call
or loop. All rows keep category-1 int/oop/void signatures and values, existing
64-local/32-stack bounds, and at most 64 logical bytecodes including the
ordinary return. Native/synchronized methods, constructors/class initializers,
handlers, category-2/FP operations, allocation, switches, monitors, indy,
signature-polymorphic/appendix calls, all MethodHandle/VarHandle-owned invokes
in this conservative first scope, and other missing instructions are not
credited. Cached reference constants and resolved cast/instanceof are included
in the reference foundation. CP descriptors are read without class resolution.

These are conditional syntactic ceilings, not newly measured installations.
They do not prove verified native emission, live cache resolution, actual
4 KiB fit, permitted intrinsic/method kind, or profitable execution. A complete
caller body here also says nothing about whether its callees run natively.
The previous 455-prefix figure is a different metric and is not a denominator
for the whole-caller figures below.

The startup source is the no-direct, normal-policy entry diagnostic: 8,905
entered Java methods and 690,406 pre-admission interpreted entries. The warm
source is the older broad-direct shared-worker/512-hold census: 9,036 entered
methods and 3,210,575 combined interpreted/direct entries before ordinary
admission. Its weights cannot predict stock-policy benefit. Unavailable and
mismatched methods remain in these full divisors. The earlier frozen eligible
divisors 3,056/5,697 also remain intact in their original reports; they are not
replaced by these all-entered populations.

| Cumulative semantic scope | Startup possible callers / attached entries | Warm possible callers / attached entries | Matching interpreted leaf samples |
|---|---:|---:|---:|
| Instance/reference values, constants and resolved casts | 167 / 15,987 | 187 / 50,235 | 3 |
| Add int/oop instance and static field reads | 641 / 51,839 | 683 / 132,786 | 8 |
| Add forward integer/null/reference branches | 841 / 82,332 | 884 / 218,258 | 8 |
| Add ordinary static/special calls | 1,146 / 120,369 | 1,196 / 323,087 | 20 |
| Add ordinary virtual/interface calls | 2,842 / 293,820 | 2,900 / 1,063,864 | 118 |
| Later: add array access, without backward branches | 2,960 / 313,011 | 3,018 / 1,116,132 | 120 |
| Later: add backward branches | 3,166 / 330,458 | 3,224 / 1,208,497 | 147 |
| Later: add field writes | 3,473 / 360,091 | 3,534 / 1,364,103 | 174 |

The sample column is one separate, capability-disturbed warm-process JFR,
with 908 interpreted main-thread leaf samples. It is not a count per census,
not confined to a settled warm window, and not enabled-tier CPU coverage.
JFR prevents later direct installations and leaves earlier ones in that
recording. Samples only supply relative hotspot leads; native or inclusive
ancestor counts are not added to them. No reliable CPU-time weights exist for
this new emitter. Entry counts cannot settle whether a few loops dominate CPU.

Within those limits, ordinary virtual/interface calls add 1,696/1,704 possible
callers and 173,451/740,777 attached entries beyond static/special calls, and
98 additional leaf matches. Backedges after calls/array access add 206 methods
in each phase and 17,447/92,365 entries, with 27 leaf matches. This makes calls
the first target supported by both method/entry reach and the available weak
sample evidence. Loops remain important but have neither a larger observed
method gain nor trustworthy CPU weights justifying moving them ahead of the
call boundary. Fields, references, casts and branches are prerequisites, not
independent savings that can be summed. In particular, casts alone unlock
few complete callers but enable many cast-and-call visitor paths later.

The ordinary-call ceiling has 1,314/2,083 methods reaching 32 entries and an
after-32 ceiling of 240,232/992,441 entries in these different-policy captures.
These are not promised useful native entries or a new coverage gate. Removing
the 64-instruction cap adds only 29 syntactically possible ordinary-call
methods per phase, so that cap is not the reason calls rank ahead of loops.
The current sixteen immutable slices also cannot install thousands of methods:
semantic representability, residency, executed coverage and CPU savings must
remain four different measurements.

Actual javac candidates include PoolWriter.putSignature, Code.emitInvokestatic,
ClassWriter.writeNestHostIfNeeded and Types visitor methods, each with 1,791
entries in the warm census. The source contains Gen.visitVarDef and Attr.checkId
among sample-matching callers. These names are test/opportunity evidence,
not method-name admission filters. The leading large constructors and
ClassWriter.writeClassFile remain outside this bounded batch, so this proposal
does not claim to reach all expensive work or the earlier 80% milestone.
See [cumulative reach](direct-baseline-data/interpreter-semantic-reach.tsv),
[real method examples](direct-baseline-data/interpreter-semantic-examples.tsv),
[sample leads](direct-baseline-data/interpreter-semantic-profile-leads.tsv) and
[input hashes](direct-baseline-data/interpreter-semantic-inputs.tsv).

## Stage A: category-1 data and forward paths

Broaden the body generator to int/oop locals and canonical stack values,
including instance entry, null, reference load/store, category-1 stack moves,
ordinary returns, cached int/oop constants and resolved cast/instanceof.
The existing integer operations and small integer normalizations remain the
primitive arithmetic scope. Use BytecodeStream's Java-code iteration and its
raw-opcode-aware index accessors: it already exposes logical bytecodes in
quickened pairs and rewritten cache indices. Do not copy class-file operands
onto rewritten runtime bytecodes or invent another persisted decode tree.

Allow ordinary-entry aliases such as getters and bytecode-intrinsic roots that
really use the normal interpreter entry; retain exclusions for VM intrinsic
entry stubs and other special frame contracts. An intrinsic marker alone is
not a replacement for checking the actual entry kind. Empty/tiny callers may
be representable yet not worth publishing; these ceilings do not assert their
profitability or future admission.

Emit directly from verified, linked/rewritten bytecodes. Keep every boundary
canonical vtos with the original BCP stored. A temporary bounded label per BCI
is control-flow bookkeeping, not a C1 graph. Original verification and the
interpreter's Method/BCI oop-map machinery supply type/root interpretation;
there is no new per-native-PC compiled scope or oop-map installation. Trusting
those contracts requires category-2/unsupported forms to fail closed and exact
branch target/stack-shape qualification. Do not assume the current int-local
bitmap alone proves reference joins safe, or reconstruct a generic optimizer's
type-state framework to replace the verifier.

The initial whole-caller scope rejects unsupported bytecodes anywhere in the
bounded body rather than counting a new tiny prefix as complete coverage.
Mandatory dynamic fallback still exists at supported operations. Each opcode
needs an explicit commit point: fallback must either precede operand/profile/
counter mutation or resume after the already-completed operation. Replaying an
original cast, invoke or branch after its MDO update would double-profile it
and perturb later compilation. Preserve exactly-once side effects and profiles.

For getfield, consume only an acquire-published ResolvedFieldEntry authorized
for the actual get opcode; a resolved put or another opcode is insufficient.
Use its narrow BasicType, scalar offset and volatility with the existing
collector-aware loads. Do not construct ciField/holder wrappers or embed
Method/klass/oop pointers. Check null before consuming the receiver so fallback
can reexecute the original opcode once. Preserve special Reference access and
all required collector/volatile behavior; unsupported slow paths fall back,
not become raw moves. Static reads additionally need the existing class-init
barrier and mirror-handle rooting; resolved is not initialized. No field writes
or constructor final-field protocol enters Stage A.

Resolved constants/cast targets come from the existing rooted resolved-reference
or klass cache, without compiler-thread resolution. Retain the interpreter's
null ordering, subtype checks and type/null profiling. An unresolved target or
failed cast resumes the original instruction with its original operands, so
ordinary Java exceptions and handler order remain authoritative. Preserve
typed load widths and profiling at forward branch edges as well. Field-access
watch capabilities are already included in can_post_interpreter_events in
JvmtiManageCapabilities::update; retain that conservative guard rather than
silently omitting field events.
They are OnLoad-solo capabilities in this source, so reservation already forces
fallback before a later watch installation. Qualify that declared scope rather
than claiming an active codelet supports arbitrary late capability acquisition.

Already-resolved field sites can use their scalar-layout snapshot. For an
unresolved site, a generated opcode-specific cache check can fall back while
unresolved and use the normal checked-cache load on a later invocation after
ordinary resolution. Neither form performs producer-side linking. Prefer this
bounded existing-cache behavior to declaring all class-file field sites linked
or creating a new persistent operand cache to rescue cold paths.

This stage is useful foundation and reaches actual predicates/accessors,
but its 841/884 caller ceiling and eight leaf matches are not the end of the
recommended batch and not a reason for an adoption timing loop.

## Stage B: ordinary calls with native caller continuation

Factor explicit opcode/cache/return-table arguments out of the existing x86
TemplateTable call-generation helpers, following the already-qualified emit_iop2
pattern. Their ordinary-interpreter wrappers keep their behavior. Concurrent
production must never invoke TemplateTable::generate, its global _desc/_masm,
or copied template machine bytes. The emitter uses declared BasicTypes and
existing resolved-entry parameter/return information; it resolves no klasses,
builds no CI environment and allocates no nmethod/relocation/scope framework.

Start with invokestatic and non-constructor invokespecial, then add ordinary
invokevirtual/invokeinterface in the same continuation design. Require actual-
opcode ResolvedMethodEntry publication and preserve static initialization,
receiver null checks, forced-virtual/final/itable cases and access/loader checks.
Use the normal interpreted Java calling convention and jump_from_interpreted,
so compiled/interpreted/native callees keep their existing adapters and entry
barriers. Do not embed a resolved Method pointer or invent a direct-call IC.
Unresolved, appendix/local-signature, signature-polymorphic, indy, constructor
or unsupported result cases fall back before argument consumption or execution.
The first scope also excludes all MethodHandle/VarHandle-owned invokes, matching
the conservative offline classification rather than claiming those APIs linked.
Cache checks can allow a later invocation to use a site resolved by ordinary
interpretation without rebuilding a CI/native installer around the codelet.

Stopping at calls is insufficient, but modifying every ordinary return with a
pilot lookup would tax unrelated execution. Generate separate shared pilot
return entries at interpreter startup, only for the experimental mode. Pilot
invokes select this table; ordinary invokes keep the existing return table.
Reuse the normal typed return epilogue: last_sp restoration/reset, BCP/locals,
argument removal, return-type profiling and PopFrame/ForceEarlyReturn handling.
After that epilogue, materialize the category-1 result on the Java stack,
advance/store the original next BCP, and revalidate Method/version/MC ownership,
enabled state and real polling/tooling guards.

Each body publishes a compact immutable table of post-call BCI and native
offset pairs with its instructions. Lookup the current frame's next BCI and
jump to its label, or use normal polling dispatch at that next BCI. The map
contains only scalar offsets in the recognized interpreter arena, no metadata
or oop pointers. It is necessary continuation metadata, not GC/deopt scopes or
a general block dispatcher. Include its storage/emission/lookup and startup
return stubs in the cost budget. Do not execute a callee twice, remove arguments
twice, advance BCP before profiling the call's return, or skip an unfinished
ordinary return epilogue on fallback.

The key new correctness obligation exists while the callee runs: it can
safepoint, collect, block or enable tooling while the caller remains suspended.
A guard after return cannot protect a malformed suspended caller. The saved
call-site BCP, canonical argument roots, last_sp and interpreted sender frame
must be valid for GC, heap/local walking and deoptimization throughout that
interval. New return PCs must be recognized as interpreter PCs. On a later
return, class redefinition/old versions, enablement changes and tooling require
fresh checks; stale pre-call raw pointers cannot select a continuation. Keep
exceptions on the ordinary interpreter exception/unwind path using the saved
invoke BCI; no native exception table or nmethod deopt scopes are introduced.

Resume lookup plus repeated guards may cost more than dispatch saved in a tiny
delegator. The larger method/entry reach is not proof of positive execution
savings. This is the principal payoff risk to evaluate after semantic scope
and correctness are agreed, not a reason to drop profiling or safety checks.

## Stage C: loops after the call boundary is qualified

Add primitive/category-1 array access and backward branches separately, reusing
normal null/bounds/collector operations. The first loop contract must have real
polling and the existing tooling guards at bounded backedges. Guard failure
before branch side effects resumes the original branch with canonical operands.
Do not increment the entry-hit count per loop iteration.

Profile taken/not-taken edges and update the original MC/MDO backedge counters
exactly once. Factor the existing branch fast path and overflow/OSR path into
explicit safe emission helpers: notification still calls the original
frequency_counter_overflow, with its entry-barrier, OSR migration, JFR critical
section and ordinary policy behavior. After a VM slow path, returning to the
ordinary interpreter is acceptable. Reexecuting a branch after already updating
its counter/profile is not equivalent. Skipping backedge events would silently
delay C1/C2 and is outside scope.

Neither native iteration counts nor entered methods are CPU weights. Poll,
resolution or exception fallback may end native execution for the activation;
report it rather than crediting the full loop. No loop-entry admission/OSR-lite
hook is authorized here. Allocation, constructors/finalizer/final-field release,
native handlers, category-2/FP values, general stores and monitor semantics are
later contracts, not hidden additions to this batch.

## Qualification, capacity and decision boundaries

Before execution, independently review canonical state at every VM/callee
boundary, caller visibility during callee GC/tooling, return epilogue ordering,
versioned cache publication, label/resume-map publication and class lifetime.
Keep methodHandle ownership during generation, existing locking and bounded
no-safepoint emission/cleanup; no resolution, class initialization or Java call
belongs inside producer generation. Calls happen during generated execution
under the normal interpreter frame protocol, not inside the producer's
NoSafepointVerifier. Code plus resume data must fit before publication; 64
bytecodes alone does not guarantee 4 KiB, and overflow must decline safely.

Proposed correctness checks cover reference aliases/results across Serial/G1
GC, field widths/volatile reads, unresolved versus resolved get/put authorization,
null/cast/branch exceptions and side effects, mixed interpreted/C1/C2/native
callees, recursion and blocked callees, redefinition/tooling during a callee,
late breakpoints, class unloading and stale/duplicate publication. Validate
actual javac helper results/classfile semantics as well as hand-written edge
cases. Other collectors remain unqualified until their barrier paths are
checked. Existing assertions and tooling exclusions remain; do not enable a
profiler by bypassing the can_walk_any_space guard.

Automatic admission remains absent. The sixteen 4 KiB slices can qualify a
selected set of real helpers through existing explicit preparation controls;
they cannot demonstrate thousands of installations or the user's complete
coverage goal. No packing, unbounded arena, recycling, global return-lookup
hook or tier delay is bundled to manufacture such a result. A later residency/
lifetime budget and valid pre-C1 time attribution are explicit prerequisites
for a representative application comparison. The current profiles do not
justify an application win prediction, a steady-state label or another small
timing loop. Approval of semantic scope must precede implementation and JVM
execution; none is performed by this proposal.

Source seams used in this design are
[logical bytecode iteration](../../src/hotspot/share/interpreter/bytecodeStream.hpp),
[field/call/branch templates](../../src/hotspot/cpu/x86/templateTable_x86.cpp),
[typed return entry generation](../../src/hotspot/cpu/x86/templateInterpreterGenerator_x86.cpp),
[interpreter frame and profile helpers](../../src/hotspot/cpu/x86/interp_masm_x86.cpp),
[field publication](../../src/hotspot/share/oops/resolvedFieldEntry.hpp),
[method-entry publication](../../src/hotspot/share/oops/resolvedMethodEntry.hpp)
and [tooling capabilities](../../src/hotspot/share/prims/jvmtiManageCapabilities.cpp).

Raw/derived analysis stays private under /workspace/interpreter-frame-admission-plan.
Only the plan and small normalized tables are committed locally. Retained
inputs and all qualified images are unchanged.
