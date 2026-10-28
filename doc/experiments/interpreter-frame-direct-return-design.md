# Direct return-site continuation: design review

This is a source-only proposal against qualified runtime `38b1b63a0ea` and
evidence checkpoint `6a8f779db1e`. No runtime/test source, image, tier policy,
admission, residency or default is changed. No JVM, build or timing is run in
this review. The earlier measurements and adverse outcomes remain intact.

The recommendation is to preserve call-site identity in the existing Java
return-address word. Emit a small immutable return island per native successor,
with the ordinary typed interpreter epilogue and a direct relative branch.
When there is no generated successor, select an ordinary interpreter return
entry. The BCI/native-offset search is then unnecessary. This is a proposed
replacement for an integration choice, not a threshold adjustment.

## Why the map exists

The current per-method invoke jumps to one of four shared invoke codelets.
`emit_prepare_invoke` chooses a shared return PC from opcode/type tables and
pushes it before `jump_from_interpreted`. Consequently many call sites return
to the same PC. The return codelet must recover a native successor from the
saved caller Method and BCI. The map solves identity that the shared return
table discarded; it is not a JVM requirement for interpreter-frame GC.

The normal interpreter also shares return entries, but only needs to advance
BCP and dispatch the next bytecode. It has no native per-method target to find.
A site-specific return PC already identifies the call site. It need not point
after a machine CALL: ordinary interpreter invokes push a return PC and jump.
The inspected x86 frame and exception paths require an interpreter PC and a
valid interpreter frame, not membership of the normal return table.

Returning directly to the existing body label is nevertheless incorrect. The
callee/adapters may leave a different SP; last_sp repair, locals/BCP restoration,
argument removal and return-type profiling must happen first. A site must land
at its typed return epilogue, then reach the body successor.

## Exact call/return representation

Keep the current canonical vtos boundary and normal Java call ABI. For an
ordinary supported invoke, the producer already parses the declaration without
resolving classes. Its category-1 int/reference/void result determines the typed
landing island; narrow integer states use the existing itos aliases. MH/VH,
appendix/local-signature, indy, constructor and category-2/FP calls remain out.
Existing actual-opcode cache publication, initialization, null, dispatch and
access checks remain authoritative. Do not add a second speculative type cache.

The bounded representation is:

```text
generated call site:
    load r8 with this site's immutable return-island PC
    jump to the existing opcode-specific invoke machinery

invoke machinery:
    perform the existing pre-effect cache/gate checks
    save caller invoke BCP; load receiver
    push r8 as the ONE normal interpreter return-address word
    perform existing call/argument profiling and callee dispatch

site return island:
    execute the existing typed return epilogue exactly once
    materialize result and next BCP as required by this emitter
    apply the remaining fresh continuation conditions
    branch directly to this site's generated successor
```

Do not put a last-continuation pointer in MethodCounters or JavaThread: recursion
and concurrent callers would race. Do not borrow sender-SP/BCP or heap-base
registers, or rely on a callee-save register across deoptimization. The existing
return-address word already supplies per-activation storage.

R8 is a proposed explicit scratch contract only until prepare_invoke pushes it.
It is not expected to survive the callee. The inspected pre-push path uses
rax/rbx/rcx/rdx and rscratch1/2; cache resolution/initialization slow paths fall
back before a VM call when the pilot's unresolved label is supplied.
VerifyOops' subroutine preserves registers it uses, including r8 where it is
an ABI argument register. The implementation review must keep r8 explicitly
live through that bounded prefix, with register-disjoint assertions. After
the push, dispatch/profiling/adapters may freely clobber it. A Java caller,
native callee, deoptimization or continuation mount need not preserve r8.

Use the existing `lea(Register, Label&)`/label-fixup machinery for the island
address and emit at its final address. There is no copied template machine code,
concurrent TemplateTable global state, new call IC, runtime continuation token
or stack-slot protocol. Ordinary interpreter wrappers keep their return-table
behavior; only the pilot path supplies the explicit return PC.

Initially emit the typed epilogue at each site using the existing C++ emission
logic, rather than introducing another shared runtime epilogue that needs a
second identity carrier. Sharing that emitter is source reuse. Sharing machine
code and carrying an extra target through its clobbers would be a different
design and is not proposed here.

## Frame, GC, exception and patched-PC constraints

1. Replace the value in the standard return-address word; never push an extra
   token. Before callee entry it is at SP. After a normal callee prologue it is
   at callee FP+wordSize. Caller FP+wordSize belongs to the caller's own caller
   and must not be repurposed. The existing argument-address corrections and
   interface error cleanup expect exactly one pushed return PC.
2. Keep save_bcp and last_sp setup in their current order. During the callee,
   the caller BCP describes the invoke, arguments are canonical and last_sp
   excludes the return word. The i2c adapter preserves/repositions that word
   while aligning arguments; it relies on interpreter return code repairing SP.
3. Return first repairs SP from last_sp and clears it, restores BCP/locals,
   profiles an oop result, removes cached parameter slots and performs the
   ordinary PopFrame/ForceEarlyReturn handling. Never push the result before
   SP repair. Keep invoke BCP until return profiling is complete. Only afterward
   push the result, advance/save BCP once and possibly resume generated code.
4. Islands stay inside the existing recognized InterpreterCodelet arena.
   `frame::is_interpreted_frame` uses Interpreter::contains; interpreter GC uses
   frame Method/BCI and the existing oop-map cache, with the holder mirror as a
   root. No per-native-PC compiled oopmap/scope or new frame is required. Code,
   labels and any diagnostic data precede the existing release publication.
5. Callee exceptions bypass the normal island. SharedRuntime recognizes an
   interpreter return address and selects the ordinary rethrow entry, which
   restores invoke BCP and uses the original handler/unwind machinery. Failed
   interface dispatch still pops exactly one artificial return word. Do not
   profile a successful return, replay the invoke or advance BCP on these paths.
6. Return PCs are owned by HotSpot, not immutable stack tokens. Deoptimization
   may choose a normal interpreter return/reexecute entry; allow that standard
   fallback and never force reattachment by a new lookup. Existing active-callee
   deoptimization controls must still prove native continuation where the outer
   interpreted return PC is retained. Register state is not a substitute for
   that PC: the deopt blob explicitly destroys callee-save state after capture.
7. Continuation freeze/thaw can replace a bottom PC with a return barrier and
   restore it later. Use the ordinary word and recognized interpreter frame so
   the existing machinery can copy/relativize frames. Do not patch around its
   barrier. Mount/unmount, blocking, moving GC, and deoptimization while frozen
   need focused qualification; the current tests are not proof of all virtual-
   thread combinations.
8. Existing no-recycling lifetime is retained. A live frame keeps Method/holder
   metadata alive; its return island cannot be reclaimed. C1/C2 installation
   changes future entries, not this active interpreted frame or its immutable
   code. Do not add a per-return compiled-code-arrival test or a new policy gate.

## Which return checks are actually required

Preserve the full existing method-entry eligibility checks in this proposal.
The direct return PC then proves which published method body is active. This
removes many checks that were needed to interpret an untyped map/entry pointer.

| Current work | Direct-site disposition | Reason |
|---|---|---|
| Normal typed epilogue, argument removal and result profiling | Keep exactly once | Required interpreter calling/GC/profile contract |
| Per-method enabled bit | Read fresh after callee | Existing disable-in-callee behavior must remain |
| Old/obsolete Method bits | Read fresh; fall back | Retains the pilot's current redefinition policy; ordinary HotSpot may legally finish old interpreted activations |
| can_walk_any_space | Read fresh; fall back | Its availability can change through late capability updates, including the existing JFR/JVMTI exclusion |
| Seven OnLoad-derived capability flags | Entry-only | Capability/phase proof below; do not repeat their address loads at every return |
| should_post_single_step and method breakpoint count | No independent per-return check under that proof | A valid native entry excluded the capabilities required to activate them |
| interp_only_mode | Entry/normal-dispatch handling suffices under the same restricted invariant | Its event-controller causes require those capabilities; mount restores that state, not a new capability |
| MC null/owner comparison | Construction/entry assertions | Published body selected through that MC; current live Method retains its counters |
| Entry acquire load, arena/alignment/code-size/count checks and BCI search | Remove from return | No runtime-selected entry/map exists; immutable PC and relative successor were validated before publication |
| Native-offset and next-BCI bounds | Generation assertions | Both are known label/verified-bytecode facts, not untrusted per-return data |
| Test counters | Explicit generation-time test opt-in only | No normal-path diagnostic load, branch or update |
| Develop tracing/bytecode-debug flags | Keep ASSERT-only behavior when runtime-mutable | They are not covered by the JVMTI capability proof |

The MC lifetime assertion comes from replace-if-null publication and the
inspected clear sites: construction, deallocation and archive unlinking. Those
are not replacement of a live executing Method's counters. An island is reached
by the PC pushed from its own published body; arbitrary memory corruption or a
native agent overwriting return PCs is not a reason for a generic dispatcher.
Reload the current frame's Method/MC to read enablement, but do not embed a raw
Method/MC pointer or invent an ownership epoch.

The capability proof is specific to this source, not an assumption that tooling
never changes. can_access_local_variables, owned-monitor inspection, interpreter
events, exception/exit/frame-pop events, PopFrame, ForceEarlyReturn and breakpoint
availability derive from OnLoad capabilities. add_capabilities migrates acquired
OnLoad bits into permanent always/always-solo sets; update exports those sets.
Relinquishing a capability does not remove that permanent availability. If such
a capability became available OnLoad, the existing entry guard was already true
and this native activation could not exist. If it was not acquired OnLoad, a
Live acquisition cannot first make it available. Agent OnLoad finishes before
Java class initialization, so this needs no new runtime phase guard.

Single-step changes its dynamic bit in a VM operation, but enabling it requires
the already-excluded capability. INTERP_EVENT_BITS likewise contains single-step,
method entry/exit and field-access/modification events; the inspected
interp_only_mode setters and virtual-thread restores do not create a new
permission. If a future scope permits native entry with those capabilities,
this proof expires: actual event handling and thread-mode checks must then be
reviewed, not silently omitted.

can_walk_any_space is different. update derives it from always-available
can_tag_objects, and a late capability update can turn it on even when tagging
is not the caller's immediate activity. It cannot be cached as an entry-only
decision. Preserve that exclusion; this proposal does not claim new profiler
or arbitrary debugger compatibility, or add a replacement aggregate flag.

The poll is a separate progress decision. Ordinary return entries do not poll
on every callee return; normal return bytecodes do. The current forward-only
bounded body, entry polls and normal callee/return/VM paths provide a possible
proof that another return-site poll is unnecessary. It is not permission for
unbounded no-safepoint execution. For the first direct-site proposal, retain
the existing two-instruction poll-to-ordinary-fallback behavior; review may
explicitly approve relying on the existing poll points instead. This small
choice does not justify the current 83 instructions. There is no proposed new
poll, handshake, invalidation registry or copied capability cache.

With the retained poll, the illustrative integer-return budget is roughly 15
instructions beyond the common epilogue: result/BCP canonicalization, current
Method/MC loads, enablement, old/obsolete and late-walk tests, poll and direct
branch. This is a source-level target for review, not generated-code evidence
or a speedup prediction. No variant is built to obtain it in this pass.

## No-native-successor sites

This is not Java tail-call elimination. Keep the caller frame and its eventual
ordinary return bytecode, including narrowing, exit events and safepoint work.

For an obvious invoke-followed-by-return, put the existing ordinary typed
return-entry address in the single pushed PC. There is no pilot epilogue,
capability scan or continuation lookup after the callee. The ordinary return
entry performs all cleanup/profiling and dispatches at next BCI in its normal
TOS state. No native resumption means no pilot-only checks are needed there.

For a site whose successor is absent only after final size/unsupported-prefix
decisions, bind its return-island label to one unconditional jump to that
ordinary typed entry. The island must not first pop arguments, profile the
result or advance BCP, since the ordinary entry will do those operations.
This needs only existing label finalization, not a runtime table or another
bytecode pass. It also covers a call ending at an unsupported opcode, not only
a source-level terminal return. BasicImageReader.getLocation is a concrete
current zero-successor example.

Keep return-island labels distinct from Java-BCI labels. The current bind_exits
routine binds unfinished BCI labels to ordinary fallback; it must not consume
an unresolved typed return label. Finalize islands after successor classification
and before flush/publication, with an unconditional dispatch/branch preventing
body fallthrough into them.

## Separate coverage and capacity issues

The direct return PC does not solve cold fields or early-return truncation:

- JrtPath.isAbsolute currently publishes only aload_0 when the actual getfield
  entry is unusable. Later interpretation resolves path, but the immutable
  prefix cannot grow. A separate change would emit the existing opcode-specific
  cache/type/holder/offset checks and collector-aware load, falling back before
  consuming operands until ordinary resolution makes that site usable.
- CodeSourceKey.equals currently stops at the BCI6 identity-path return. The
  nonidentity path remains interpreted. A separate change would emit ordinary
  dispatch at that return while continuing generation/binding later forward
  labels. It must neither fall through the return nor advance its BCP first.

Retain the current four-KiB slice and code-capacity limit. Per-site epilogues
trade runtime lookup for code bytes; oop profiling and debug verification can
make them substantial. Before emitting a call, reserve its audited worst-case
island budget alongside remaining body/fallback space; all sites must be
resolved before publication. Decline/report overflow without publishing partial
addresses. No arena growth, packing or recycling is bundled. If useful callers
do not fit, that is a real design result, not a reason to credit the old
2,842-method syntactic ceiling as implemented coverage or add generic sharing.

## Review and later qualification boundary

Review the fixed-PC register handoff and one-word stack ABI, the per-site
epilogue/BCP order, the OnLoad capability implication, direct code/metadata
lifetime and the per-site byte budget before implementation. The poll choice
above is explicit. No new timing follows until that design is accepted.

If implemented later, reuse existing counted flow, GC/root, interpreted/C1/C2/
native callee, active-deopt, exception, enable/disable, redefinition, breakpoint,
profiling and release/fastdebug controls. Add direct-PC cases with two sites
calling the same callee, recursion, no-native-successor returns, and virtual-
thread freeze/thaw where applicable. Verify no extra stack token and no
Method/klass/oop literal. Default code must have no map search or test counters.
Only then use the already bounded matched cases, keeping every outcome. This
design checkpoint keeps the early cheap-tier goal open; it is not a readiness
or application-payoff claim.

Primary source seams inspected:
[invoke preparation/dispatch](../../src/hotspot/cpu/x86/templateTable_x86.cpp),
[last_sp and normal callee entry](../../src/hotspot/cpu/x86/interp_masm_x86.cpp),
[typed epilogue](../../src/hotspot/cpu/x86/templateInterpreterGenerator_x86.cpp),
[current lookup](../../src/hotspot/cpu/x86/interpreterFramePilot_x86.cpp),
[frame ABI](../../src/hotspot/cpu/x86/frame_x86.hpp),
[interpreter frame recognition](../../src/hotspot/cpu/x86/frame_x86.inline.hpp),
[GC roots and return-PC validity](../../src/hotspot/share/runtime/frame.cpp),
[exception return routing](../../src/hotspot/share/runtime/sharedRuntime.cpp),
[adapter stack repair](../../src/hotspot/cpu/x86/sharedRuntime_x86_64.cpp),
[capability availability](../../src/hotspot/share/prims/jvmtiManageCapabilities.cpp),
[event/thread modes](../../src/hotspot/share/prims/jvmtiEventController.cpp),
[OnLoad ordering](../../src/hotspot/share/prims/jvmtiAgentList.cpp),
[Method/MC lifetime](../../src/hotspot/share/oops/method.cpp),
[old Method policy](../../src/hotspot/share/prims/jvmtiRedefineClasses.cpp)
and [continuation frame copying](../../src/hotspot/share/runtime/continuationFreezeThaw.cpp).
