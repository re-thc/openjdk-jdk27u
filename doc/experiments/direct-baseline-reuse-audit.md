# Direct tier: existing work, measured cost and interpreter-frame alternative

The current compiler runs no optimizing compiler pipeline. It nevertheless pays
for a compiled Java frame, rich debug/GC metadata and normal nmethod installation
for every accepted method. Reusing more retained interpreter/runtime information
is a concrete improvement within this design. Retaining interpreter frames is a
separate, larger way to remove some of those costs; neither requires C1 IR.
No production policy or compiler source changes accompany this audit.

## What actually runs

[Prepared](../../src/hotspot/cpu/x86/directBaseline_x86.cpp) parses a basic root
signature, raw retained StackMapTable frames and the original exception table.
It walks rewritten bytecodes, validates the supported operations, simulates
int/long/oop local/stack categories and checks merges against verified frames.
Each instruction mutates a fresh State and its local/stack arrays. This is
type-state preparation for emission and reconstruction, not optimization.

Emitter then walks the method again with ciBytecodeStream. It emits instructions
directly into a CodeBuffer. Values have canonical memory slots; scratch registers
are selected explicitly. There is no C1 GraphBuilder/HIR, LIR, inlining, CSE,
range-check elimination, register allocator or instruction-scheduling pass.
Choosing normal direct versus virtual call linkage is a binding decision, not
an optimizing IR pass. The current memory-stack code also reloads/spills more
than the interpreter's existing top-of-stack cache in some simple sequences.

The reused C1 component is C1_MacroAssembler: frame construction/removal and
low-level instruction helpers. It does not invoke C1's LIR_Assembler or compiler.
Runtime1 allocation, counter, deoptimization, exception and unwind stubs are
reused. They are initialized once by the ordinary C1 worker; direct compilation
waits for initialization rather than generating them per method. Normal Java
call conventions, IC/resolve stubs and collector load/store barriers are shared.

The substantial shared machinery is ciEnv/root metadata, operand linking,
OopRecorder, DebugInformationRecorder, OopMapSet, Dependencies, code relocations,
ExceptionHandlerTable, ciEnv::register_method and nmethod::new_nmethod. Every
guard/call/poll scope walks canonical locals/expressions and builds reconstruction
values and roots. These are meaningful costs even with no optimizer.

For B bytecodes, L locals and S stack slots, preparation is roughly
O(B*(L+S)) because of state copying/checks, rather than merely opcode decoding.
Emission is another O(B) traversal plus operands and map construction. Handler
metadata additionally checks applicable handler ranges and live locals at each
recorded throwing PC; bounds of 64 handlers and 4,096 metadata entries remain.
There is no iterative optimizer/fixpoint over a new IR.

## Expanded-candidate cost evidence

The eight unmodified spot runs retain their adverse results. Reconstructing
maximum observed CPU per thread ID across all retained samples gives this
approximate paired on-minus-off CPU partition (10 ms ticks, incomplete tails):

| Component | Startup A / B ms | Whole warm A / B ms |
|---|---:|---:|
| Direct worker | +150 / +140 | +330 / +350 |
| Ordinary C1 | +20 / +20 | +20 / +240 |
| Ordinary C2 | -10 / -10 | +1040 / +2060 |
| Main/launcher | +20 / +30 | -10 / +1780 |
| GC/other | 0 / 0 | -30 / -20 |
| Unallocated residual change | -9.668 / +37.540 | -0.191 / +35.262 |
| Complete wait4 CPU change | +170.332 / +217.540 | +1349.809 / +4445.262 |

Thus startup's large additive worker cost is real; extra C2 work dominates much
of the later warm-up difference. This is a sampled partition, not instruction
attribution or proof that all C2 differences were caused by one profiling rule.
Direct code counts in MethodCounters without collecting receiver/branch MDO
profiles; the interpreter normally collects those profiles after MDO creation.
That is a concrete handoff difference requiring study. C1/C2 remain active and
the warm windows are not settled. Direct, C1, C2 and main overlap, and the
additional worker competes with them on four CPUs; no scheduler wait/cache-miss
counter was retained, so contention cannot be assigned a precise wall cost.

Separate no-print startup diagnostics use the same source and dedicated-worker
policy. They are not additional application performance comparisons. Full-worker
service is 139.313 ms over 2,849 tasks: 132.223 ms successful and 7.090 ms refused.
The Java-thread request helper adds 29.729 ms over 3,067 calls; dedicated selection
adds 1.214 ms. The request timer excludes assembly/JRT entry/exit. Service starts
after dequeue and includes task/resource/CI cleanup, but not worker startup or
dequeue/handle-upgrade work. A separate entry-count capture measures 145.488 ms
service, 27.168 ms requests and 1.196 ms dedicated selection.

The detailed capture has more timer overhead and totals 187.487 ms. Do not scale
or subtract its components from the 139 ms capture as an exact causal partition.
Its mutually exclusive high-level CPU ledger is:

| Detailed-capture phase | CPU ms |
|---|---:|
| Native category/state preparation | 10.103 |
| Broker work before CI, excluding preparation | 8.514 |
| CI environment construction | 9.710 |
| Root wrapper/JVMTI/DTrace setup | 3.321 |
| Recorders and handler tables | 7.298 |
| Scratch CodeBuffer setup | 0.946 |
| Emission, including operands and scopes | 75.898 |
| Registration/install | 62.595 |
| Residual, including cleanup/uninstrumented work | 9.102 |

Inside emission, call/field operand work accounts for 18.999 ms and scope/map
construction 16.139 ms; these are included, not extra costs. The remaining
40.760 ms also contains allocation/cast helper generation and their lookup work,
so it is not a pure x86 instruction-encoding timer. Registration includes
37.542 ms in new_nmethod. Nested installation probes show allocation/constructor
31.322 ms, including collector registration 3.069 ms and code commit 0.583 ms;
publication is 0.908 ms. Immutable allocation is 1.859 ms. These overlap and must
not be summed. Mandatory collector registration/publication is not the dominant
part of installation: metadata construction, copying and the normal installer
also matter. Queue-lock acquisition is 1.874 ms CPU / 17.320 ms wall.

See [service](direct-baseline-data/causal-expanded-service.tsv),
[installation](direct-baseline-data/causal-expanded-install.tsv) and the
[sampled CPU ledger](direct-baseline-data/causal-expanded-cpu-ledger.tsv).

The matched source's entry-count capture installs 2,629 methods and records
443,792 direct entries before ordinary enqueue, 502,301 before replacement or
snapshot. Of 981 ordinary replacements, 820 first install at level 3, 160 at
level 1 and one at level 4; median invocation count at replacement is 333.
There are 308 zero-use installations costing 16.571 ms service. Another 1,121
serve fewer than 128 entries. Together these 1,429 installations cost 73.869 ms
and serve 58,861 entries, about 11.7% of all direct entries. This explains a
large amortization burden but is not a method-selection prescription.
The [use bins](direct-baseline-data/causal-expanded-use.tsv) retain all outcomes.

The 145.488+27.168+1.196 ms subtotal divided by 502,301 observed entries is about
346 ns required saving per entry. This is a same-capture budget, not measured
execution savings. The older narrow prototype's 39.302 ms service / 842 installs
and roughly 364 ns illustrative budget are context, not controlled comparisons:
coverage, method shapes, service mode and windows differ. Broader coverage pays
the normal compiled-method path thousands more times and emits larger bodies
and more maps. It has not made this cost disappear.

## Retained information that can be reused now

There is no retained interpreter AST. Several useful lower-level artifacts do
exist; architecture does not need to change to consume them better.

| Existing artifact | Current use and concrete remaining reuse |
|---|---|
| Verified class/method flags, max locals/stack, parameter slots and result type | Already used for request bounds and shape checks. These remove repeated structural queries, not the emitter's per-BCI state needs. |
| Raw StackMapTable in ConstMethod | Already decoded by Prepared, including category-2/dead locals and handlers. The verifier's decoded frames/instruction-boundary arrays are ResourceMark temporaries and are not retained. Missing/old/archived formats still need fallback. |
| Rewritten bytecodes and cache indices | BytecodeStream/ciBytecodeStream already consume these. Each traversal still decodes lengths/operands; sharing a decoder is not sharing its results. Quickening supplies fast field/call/paired opcodes, not a whole-method typed representation. |
| ResolvedMethodEntry | The new cached_call snapshot consumes actual-opcode publication, target/vtable metadata and appendix flags. It avoids callee CI wrappers while preserving CI fallback. Its parameter-slot/return summary is insufficient for full long/oop argument placement. |
| ResolvedFieldEntry | Still rebuilt through ciField lookup. A resolved-only native snapshot can reuse acquire-published opcode-specific get/put validity, offset, BasicType, volatile/final flags and holder. Preserve static initialization, Reference-field restrictions, access/final-write checks and compiler metadata lifetime. Do not use a get resolution as proof of a put resolution. |
| ConstMethod signature fingerprint | BasicSignature still parses descriptor text. Fingerprinter returns immediately for a cached fingerprint; the cached primitive/reference categories can replace that parse when valid. Overflow/unavailable and unresolved call descriptors need the existing raw-signature fallback. |
| Prepared call ABI layout | The preparatory pass calls java_calling_convention to size outgoing arguments; emission calls it again for the same descriptor/receiver shape. Retaining those types/VMRegPairs in Prepared removes a literal duplicate and its arrays without a new IR. |
| MethodData | Retained branch/receiver/type profiles and counters are useful for handoff, not full local/operand-stack type state. It is often absent at 32 calls. Manufacturing/aging profiles to replace verification would be incorrect. |
| Interpreter oop-map cache | A lazy 32-entry cache per InstanceKlass holds reference/dead-slot masks and stack depth, not primitive/long typing. Misses run GenerateOopMap simulation. Calling mask_for for every BCI can add work rather than reuse it. |

Source seams include [verifier](../../src/hotspot/share/classfile/verifier.cpp),
[Rewriter](../../src/hotspot/share/interpreter/rewriter.cpp),
[ConstMethod](../../src/hotspot/share/oops/constMethod.hpp),
[fingerprints](../../src/hotspot/share/runtime/signature.cpp),
[resolved entries](../../src/hotspot/share/oops/resolvedMethodEntry.hpp), and
[oop-map cache](../../src/hotspot/share/interpreter/oopMapCache.hpp).

The smallest current-design correction is to retain the already computed call
ABI layouts, then use existing signature/field caches where already valid.
Measure their share in preparation/operands before calling them an overall fix.
Fusing successful-path state simulation with emission could remove State copies
and a traversal, but a cheap unsupported-opcode screen still avoids CI for doomed
methods. The measured entire preparation is 10 ms in the detailed capture:
neither decoder fusion nor fingerprints alone explain away 140–150 ms.
Persisting another class-load analysis cache would move cost/memory earlier and
needs justification; it is not free reuse of verifier data that no longer exist.

## Interpreter-frame codelets are a different cost boundary

The interpreter already executes native templates per bytecode. Runtime work is
opcode/operand fetch and dispatch; it does not rebuild a compiler parse on every
invocation. Hot per-method native code could concatenate selected template
semantics and remove dispatch between them, while keeping interpreter frames.

| Design | Installation/metadata cost | Execution tradeoff |
|---|---|---|
| Current direct compiler | Normal nmethod, CI, scopes/maps and collector installation | Compiled Java ABI; canonical memory slots; normal C1/C2 replacement |
| Predecoded/threaded side stream | Small method-owned decoded stream; no per-method native body required | Can avoid repeated operand decoding, but retains an indirect dispatch per operation; quickening already removes some work |
| Interpreter-frame native blocks/body | Method-owned executable arena and BCI/continuation information; interpreter root machinery | Can remove per-opcode dispatch and retain TOS caching; calls, branches and exceptional/resume paths require explicit integration |

Template::generate is not a reentrant per-method compiler API: it sets global
TemplateTable::_desc/_masm, and Template::bytecode derives identity by subtraction
from the global template arrays. Raw concurrent calls or copied Template objects
are unsafe. Copying generated machine bytes is also unsafe: PC-relative branches,
calls, constant addresses, fixups and dispatch assumptions are not relocatable
merely because a template already exists. Re-emission with an assembler and
serialized/context-safe generation is required.

The viable entry seam is after generate_normal_entry has built the normal
interpreter frame and performed required counters/entry handling, before its
dispatch_next. Keep Method::code null for codelets and retain normal i2i/c2i
conventions. A side pointer selects valid hot code only when ordinary compiled
code has not won and tooling permits it. Method::set_code already switches
future interpreted calls to the i2c adapter when C1/C2 publishes a normal nmethod.
Active codelet frames may finish, resume ordinary interpretation or use normal
interpreter OSR at a correct branch BCI; no optimized frame needs unpacking.

The important saving is real but conditional: frame::oops_interpreted_do obtains
roots from Method+bci and mask_for, including the class mirror and monitors.
Keeping this exact frame/state can avoid per-native-PC compiled OopMapSet,
ScopeDesc reconstruction, ExceptionHandlerTable and normal nmethod/collector
installation. It still needs type-state work, lazily generated interpreter maps,
correct TOS spilling, Java barriers, initialization/linkage, exceptions and
safepoint progress. No embedded oop/klass constants should bypass Method/CP roots.
The fine capture puts about 99 ms in CI/root, scope, recorder and registration
buckets that this design could remove or replace. That is an opportunity set,
not 99 ms promised saving: executable allocation, dispatch/resume maps and moved
root-analysis work still cost time, and the detailed clocks perturb the total.

There are concrete integration boundaries:

- x86 frame::is_interpreted_frame calls Interpreter::contains(pc), currently the
  one startup StubQueue range. A separate executable arena must be recognized
  consistently by frame walking, GC, exceptions, stack chunks/continuations,
  profiling and serviceability. The existing startup codelet buffer is not an
  unlimited method-owned code cache.
- rbcp and the saved frame BCP must identify the original Java instruction at
  every VM call, poll, throw, resume and observable stack-walk boundary. Keep the
  expression stack and cached TOS in the exact state expected by interpreter
  root scanning. Removing dispatch also removes its polling opportunity unless
  replacement polls are emitted.
- invoke templates prepare interpreter arguments and use normal interpreted
  entry points. Their common return entries resume ordinary dispatch, not a
  generated per-method successor. A full design needs a BCI-to-codelet resume
  selection; a pilot can deliberately fall back at calls.
- branch templates contain counters, profiles, safepoints and OSR migration.
  Replacing their terminal dispatch requires native target/fixup handling while
  retaining those semantics. Exception lookup uses the original ordered Method
  table and handler BCP; common throw/handler entries likewise resume dispatch.
- Quickening, breakpoint/redefinition, interpreter-only mode and class unloading
  must invalidate/select the right codelet generation. Old code cannot be freed
  while interpreter frames or return PCs still reference it. Interpreter-frame
  recognition preserves the owner mirror root, but retirement/lifetime logic
  and atomic executable publication are still necessary.

Existing _fast_iload2/_fast_icaload show lighter dispatch amortization, not a
whole native tier. A bounded cost-isolation pilot can re-emit fixed-type
straight-line integer/local blocks in real interpreter frames, normalize/spill
TOS and restore BCP at fallback, and stop at calls/branches/exceptions initially.
Validate GC, polls, ordinary C1/C2 replacement and invalidation first. This pilot
would measure generation/arena cost and dispatch savings; it must not be sold
as full workload coverage or as proof that full template composition is solved.
No such rewrite or policy experiment is implemented in this audit.

## Time weighting and the remaining diagnostic limit

Entry/method percentages cannot decide the cost of rejected bodies or adapters.
The first async-profiler agent capture explicitly records zero successful
direct tasks and the "direct baseline excluded" reason. The heap-tag-reduced
profiler and built-in JFR followups also fail the check requiring broad direct
installation. Their record sets were not written before that assertion, so the
exact reduced/absent installation counts in those followups are uncertain.
Removing the profiler's heap-tag request alone did not establish compatibility.
The subsequent [reuse fixes and short reproducer](direct-baseline-reuse-fixes.md)
recover exact counts in a new run: the global can_walk_any_space flag activates
the existing compiler exclusion before emission. This diagnoses the tooling
interference without recovering the missing original followup records.
All failures/raw captures remain private and are not treated as enabled-tier
samples; runtime correctness gates were not weakened to obtain a profile. The JFR file identifies ordinary interpreted/native
work, but cannot quantify accepted-direct execution or rejected-versus-accepted
impact in the real on configuration. Mixed interpreted/JIT stacks also do not
measure adapter CPU.

For example its interpreted leaf samples include large ClassWriter.writeClassFile,
JavaCompiler.compile, Lower.visitIterableForeachLoop and Attr.visitApply bodies,
which exceed current size bounds, alongside bodies that the qualified census
did install. This supports keeping expensive rejected shapes visible, not a
numerical coverage prescription: the tooling changed admission, native samples
include blocking, and no time-saved estimate follows. A valid next time-weighted
probe must preserve direct installation and distinguish native PCs/BCIs without
enabling these capabilities. That remains unresolved; it is not grounds to
claim that either 80% coverage or installer cost alone settles the design.

If a later policy comparison is chosen, use one explicit inherited 512-call C1
hold independently of worker mode, keeping threshold 32, workers, MDO creation,
OSR/backedge paths and C2 unchanged. Compare it with the current direct policy
in one startup ABBA block and count actual avoided C1 work and useful lifetime;
do not start another warm matrix or select a threshold from noisy timings.
This is a future replacement-work hypothesis, not a proposed default and not a
substitute for the reuse/codelet audit requested by the user.
