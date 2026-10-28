# Interpreter-frame static/special call continuation

Runtime `fa41698ef79`, with qualified test source `f5d3e07d840`, extends the
[category-1 foundation](interpreter-frame-category1.md). This checkpoint is
static/non-constructor-special calls only. It changes no admission, C1/C2
policy or defaults; no application timing or coverage census was run.

Per-method invocation emission is one jump to a shared opcode-specific
InterpreterCodelet. Explicit assembler/opcode helpers extracted from the normal
interpreter retain actual-opcode cache publication and static initialization,
then normal prepare_invoke, call/argument profiles and jump_from_interpreted.
There is no TemplateTable global-state generation, copied template bytes,
compiler IR, CI environment, direct-call IC or nmethod installation. Unresolved
calls fall back before effects; the unchanged body can use them on a later
invocation once the interpreter resolves the entry. Constructor, MH/VH-owned,
appendix/local-signature and non-category-1 calls remain excluded.

Before a callee runs, the ordinary setup saves the invoke BCP and records
last_sp with canonical arguments. The suspended caller therefore remains a
real interpreter frame using Method/BCI root maps, including during GC, native
calls, blocking and compiled-callee deoptimization. Shared pilot return entries
reuse the ordinary typed epilogue: restore last_sp/BCP/locals, profile the result,
drop argument slots and handle PopFrame/early return. They then push the result,
save next BCP, check owner/enablement/poll/tooling and use a no-allocation,
no-transition JRT_LEAF lookup that also rejects old/obsolete methods.

Each immutable 4 KiB slot reserves a 264-byte scalar continuation map
(count/code bytes and at most64 BCI/u2-native-offset pairs). Code capacity is
3832 bytes; existing pre-emission bounds apply before writes. Maps and retained
debug strings precede release publication. Ordinary-return/unsupported targets
are omitted; new private stats32 counts actual generated continuations, separate
from invocation hits. It is an atomic diagnostic with recurring cost, not a
claim about a final production cost. Shared invoke/return code has a distinct
64 KiB startup headroom budget, checked including headers/alignment; the method
arena remains sixteen immutable slots without recycling. Ordinary interpreter
call and return tables retain their behavior.

Independent source review approved the frame, cache, profile, return and map
contracts before execution. Both coherent release/fastdebug images pass all nine
focused files: call/reference/pilot/guard fixtures and all five DirectBaseline
regressions. The call fixture's nine child modes check static/special/nested and
recursive calls, a sole suspended local oop across moving GC, below-argument
stack values, a genuinely waiting callee with stack walking/GC, oop/void/native
returns, exactly-once callee exceptions, enablement and late JFR fallback,
C1/C2 callees and their active deoptimization, active old-frame redefinition,
and an actual javac TypeTag predicate. JVMTI redefinition capability is acquired
inside the callee, with redefinition and JFR in separate terminal children;
startup acquisition would have disabled the native control through the
existing tooling exclusion. Redefinition tests this conservative fallback,
not debugger operation inside an active codelet.

The -Xint controls do not exercise MDO updates: HotSpot disables profiling in
that mode. Two additional normal-policy reference children per image disable
compilation and inlining only for selected roots, assert profiling/MDOs,
execute primary/secondary-super casts and inspect selected printed profiles.
Both images pass cast Token257/Object1, joined instanceof/cast Token256 twice,
Object256/null flag, branch512/256 and forward conditional512/256 with each
not-taken256. They also check immediate recovery and missing-target null/error/
null ordering. A single fastdebug call-fixture stress run passed with oop/frame/
secondary-super/data-pointer verification, TypeProfileLevel222, argument limit16,
width8 and software popcount. These are correctness diagnostics, not timing.

One release compile failed on brace-list includes and reused completed objects
after an explicit-array fix. The long debug driver lost its tool session after
the build completed exit0; saved source/build state was checked and tests resumed
without rebuilding or duplicating live commands. Raw logs/images remain private.
Synchronous PR104 logging and owned subreapers reaped build/logging children.
Three sandbox wrapper zombies were added by that failed long tool session;
subsequent checks use short commands. No evidence/images were deleted.

This is a semantic checkpoint, not a complete early-tier result. Preparation is
still explicit WhiteBox control;16 slots cannot establish workload coverage.
Cold field sites still end a prefix, and the first unsupported instruction
(including an early ordinary return) can end emission before later forward
paths. Forward targets outside the emitted body fall back correctly. Arrays,
backedges, new handler/constructor support, category-2/FP and automatic admission
remain absent. Shared guards, leaf lookup, interpreter oop-map misses and retained
profiling still have costs; no new speedup or steady-state claim is established.
