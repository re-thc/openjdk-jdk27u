# Normal interpreter admission: next-stage design and opportunity limit

Sequencing update: [the semantic expansion proposal](interpreter-frame-semantic-plan.md)
supersedes automatic admission as the next implementation. Admission for the
current narrow subset is deferred; this earlier design is retained as context,
not authorization to implement or measure it.

This plan starts from qualified runtime source `452b85eef42` and evidence
checkpoint `5618c527475`. It changes no runtime source, opcode support, tier
policy or existing default, and runs no JVM, benchmark, build or profiler.
Only existing source, saved entry records, class files and decoded samples
were read. The original cheap early-tier goal remains open.

The proposed implementation unit is one counter-triggered runtime helper,
one cached syntactic eligibility bit and one per-method admission state. It
uses the observation-free held-method producer and the existing interpreter
frame/arena; it introduces no compiler task, worker, CI, nmethod, IR or new
dispatch framework. However, the current supported subset does not have
credible application opportunity: the audited startup population contains no
Long-like candidate. A normal-entry integration can test a necessary cost and
handoff condition; it cannot yet be sold as an application adoption experiment.

## What retained application evidence actually supports

The saved no-direct startup entry capture has 8,905 Java methods with 690,406
interpreted entries before ordinary admission. Its launch uses the existing
javac task, four CPUs, three ordinary compiler threads, default tier policy,
ProfileInterpreter and CompileThresholdScaling=1.0. UseDirectBaseline is off.
The entry census is diagnostic instrumentation, not a clean timing cohort.

An offline audit joins method names/descriptors to existing built module class
files and reproduces the pilot's static integer-prefix grammar and local/stack
checks. For 8,377 methods, code length, locals and runtime maximum stack agree
with the capture. Method::max_stack includes the one jsr292 extra entry beyond
the class-file maximum. One jlink-generated SystemModulesMap method differs
and is excluded explicitly; 527 methods have no matching class-file method.
The retained application and current qualified image share the same lib/modules
file. Class correspondence checks are not a claim to have saved/reconstructed
every rewritten runtime bytecode. Runtime-only intrinsic, scoped/reserved-stack,
version and method-kind exclusions can reduce the following syntactic bound.

| Category | Methods | Pre-admission interpreted entries |
|---|---:|---:|
| Root flags outside the static non-native/non-synchronized scope | 6,140 | 526,141 |
| No supported first integer prefix | 1,782 | 99,252 |
| Some syntactically supported integer prefix | 455 | 46,583 |
| Class-file method unavailable | 527 | 18,429 |
| Class-image mismatch | 1 | 1 |
| Original total | 8,905 | 690,406 |

Of the 455 potential prefixes, only 160 reach 32 interpreted entries. The
aggregate after-32 ceiling is 40,322 entries, about 5.84% of the original entry
denominator, before real exclusions or generation cost. This is an entry
ceiling, not a CPU fraction. The longest known prefix has twelve operations;
there are zero known prefixes with 32 or more operations. The bounds do not
rule out a longer prefix in the unavailable population.

The longest examples are StringLatin1.lastIndexOf (12 operations, stopping at
aload_2), Math.addExact (11, stopping at ifge; only six captured entries),
ArraysSupport.hashCode (10, stopping at if_icmpge), Integer.formatUnsignedInt
(10, stopping at aload_2; one captured entry), and javac Convert.chars2utf
(10, stopping at if_icmpge; 95 after-32 entries before admission at 128).
Loading a method or entering it is not evidence that its prefix dominates its
execution time. See [scope](direct-baseline-data/interpreter-admission-scope.tsv)
and [longest prefixes](direct-baseline-data/interpreter-admission-longest.tsv).

The saved warm-process JFR gives only hotspot leads. JFR enables the tooling
capability that excludes subsequent direct compilations, and the recording
also contains earlier direct installations. It is not a representative
enabled-tier profile or an untouched off-arm counterfactual. Across the whole
recording, not just a settled warm window, 9,777 main-thread ExecutionSample
events have 908 interpreted leaf frames. Of these, 805 fail the current static
root scope; twelve have a syntactic prefix of only one to four operations.
ClassWriter.writeClassFile, JavaCompiler.compile, Symtab construction and
JavacProcessingEnvironment construction are concrete missing shapes, but each
leading method has only eight or nine leaf samples. Inclusive ancestor frames,
native samples and sampled event counts are not additive CPU buckets.
The [lead table](direct-baseline-data/interpreter-admission-profile-leads.tsv)
does not label these counts as accepted/rejected CPU coverage.

The old expanded compiler's 82% method coverage cannot be imported into this
different emitter. Its 1,429/2,629 installations below 128 useful entries and
the replacement median of 333 invocations are warnings about opportunity, not
predictions for these codelets. The shared-worker 512-call hold is especially
inapplicable. Valid time-weighted opportunity for the new subset remains
unmeasured; no profiling exclusion is weakened to manufacture it.

## Exact invocation path proposed

Add one experimental, default-off automatic-admission opt-in, distinct from
the existing explicit WhiteBox preparation control. At interpreter generation
time it selects whether the admission hook exists; it adds no dynamic enable
flag test to each invocation. UseInterpreterFramePilot continues to control
the bounded arena and execution selector. Both existing flags and all ordinary
C1/C2 defaults retain their values. The first experiment keeps
UseDirectBaseline=false, so its old shared-worker 512 hold cannot apply.

Generate admission only for the counter-enabled, non-synchronized normal
entry, with UseCompiler and normal tiering active; -Xint/replay and other
unsupported policy contexts decline rather than activating a hidden tier.
In generate_normal_entry, retain frame/locals initialization, parameter
profiling, generate_counter_incr, ordinary overflow handling, stack checks and
notify_method_entry in their existing order. Add the candidate check immediately
after entry notification and before the existing prefix selector. Reload Method
and its owned MethodCounters there. Do not use the old rcx value:
increment_mask_and_jump has already ANDed it with the notification mask, and
entry notification can clobber it. Read the actual MC invocation counter, with
InvocationCounter's state/carry handling; do not reset a counter or alter a mask.
Only an unattempted, marked candidate with count at least 32 enters the helper.
Using >= handles concurrent increments; equality after later entry work can
miss the only request. Existing counters are approximate under contention and
are not a promise of an exactly thirty-second invocation.

The new InterpreterRuntime JRT helper obtains LastFrameAccessor and a
thread-owned methodHandle from that real frame at BCI zero. It never constructs
a reflected Executable, jmethodID or result array, and never calls a WhiteBox
entry or the observed prepare overload. It claims the MC admission state,
performs the remaining checks and calls a nonblocking held-method preparation
entry inside InterpreterFramePilot. On return, generated code reloads Method,
MC, owner and entry and runs the existing real poll/tooling/breakpoint guards.
JRT exit can safepoint or process tooling/redefinition; pre-call raw pointers
or the fact that admission previously passed cannot replace these checks.

Use the existing counter result, rather than its notification frequency, as
the trigger. Merely adding preparation to frequency_counter_overflow_inner
usually waits until a nominal 128-call event and consumes much of the window.
The helper does not call CompilationPolicy::event a second time or request
compilation itself. It publishes only the existing side pointer, never
Method::code, Method's compiled/interpreted entry tables or a fake CompLevel.

## Admission and refusal without another expensive front end

The first candidate lane is deliberately fixed: a static, non-synchronized,
non-intrinsic ordinary method whose whole body is 32–64 already-supported
integer operations followed by ireturn, with no branch/call/throwing operation,
handler or unsupported instruction. The return remains ordinary interpreter
fallback. Existing frame/signature/type checks and special-method restrictions
still apply. This admits the retained Long test shape and excludes the Short
shape with a negative saving and the Medium shape needing hundreds of calls.
It is a conservative hypothesis for a necessary-condition experiment, not a
proven profitability model for arbitrary 32-operation bodies. There are no
method-name filters or adjustable threshold matrix.
This is not the application's final admission rule and does not satisfy the
earlier coverage requirement. It avoids pretending that a call count or an
opcode count can establish future use or a universal per-call saving.

Avoid a JRT transition just to reject every hot method. Only when both the
automatic opt-in and UseInterpreterFramePilot are enabled, use the existing
forward Rewriter::scan_method traversal and its already decoded opcode and
length to accumulate this narrow grammar only while it remains possible.
Store one candidate bit in MethodFlags on successful completion; no bytecode
copy, type graph, operand cache or extra traversal is retained. Reset/recompute
it for reverse/retry and changed method versions. The producer still checks
current types, ownership and validity during its existing single emission walk;
the bit authorizes an attempt, not execution. Count classification's class-load
CPU and the per-entry bit check as feature costs. Reusing decoding is not free
classification. The initial matched experiment uses its existing Xshare=off;
archived/unclassified methods must fail closed and remain visible in coverage
until a separate archive/restore contract is implemented, rather than adding
an eager cross-subsystem cache in this step.

At the runtime claim, also require no existing prefix, live ordinary nmethod,
queued ordinary compilation, MDO, prior compiled/deoptimization history or OSR
version. Decline on current tooling/interpreter-only restrictions. The initial
experiment is limited to its fixed normal-tier settings and no training or
per-method threshold override; other policy contexts are counted as declined,
not assigned a guessed C1 window. There is no invocation-rate sampler, second
admission notification, class-name whitelist or forecast of queue delay.

## Ownership, safepoints and publication

Use one atomic MC byte with unattempted -> claimed -> ready/refused/busy/full/
stale terminal outcomes. Only the CAS winner produces. Busy/full/refused are
consumed for that method version, with no retry on every call. Initialize/reset
the byte in constructors and CDS unshareable-state handling; clones/new versions
must not inherit a ready claim or an old prefix. Keep the MC owner check.
Explicit WhiteBox preparation can coexist as a control: recheck the published
entry under the same producer lock and never overwrite a winner.

The existing prepare(methodHandle) blocks on its private mutex in a
NoSafepointVerifier region. Do not call it unchanged from an application thread,
and do not try_lock then call it recursively. Add a small try-prepare entry
inside InterpreterFramePilot that takes the ranked Mutex::try_lock once,
declines if busy, and invokes generate_locked<false> under correctly scoped
unlock/CodeBuffer/ResourceMark cleanup. Do not use try_lock_without_rank_check.
Retain the old observed and explicit preparation controls separately.

The finite no-call/no-safepoint prefix, canonical stack and saved BCP contract
remain intact. Generation's no-safepoint region still includes fixed-buffer
construction, bounded emission, flush, instruction-cache invalidation, release
publication and cleanup. Try-lock removes mutex waiting; it does not establish
a hard wall-time bound on allocation/OS work or zero safepoint delay. No Java
heap allocation, operand resolution or class initialization belongs inside it.
Retain the fixed 64 KiB recognized InterpreterCodelet and sixteen immutable
4 KiB slices, with no recycling or embedded Method/klass/oop pointers.

Recheck method/version/owner, ordinary code/queue and capacity immediately
before publication. C1 can still install concurrently after that check. A side
pointer can then be unused, safely wasting one slice; do not take Compile_lock
or alter normal installation merely to promise zero wasted publications. An
active interpreted frame may finish its prefix; future compiled and inlined
calls follow ordinary routing. Class unloading leaves dead immutable bytes;
current frame/handle lifetime, existing root walking and real guard fallback
remain mandatory. This design needs independent source review before execution.

## Cost gate and ordinary-tier handoff

Retained new-route full WhiteBox requests cost 5.668/5.819 us CPU for later Long
preparations and 18.948 us on its first use; its same-JVM interpreter-relative
savings are 30.004/31.452/31.637 ns per call. The producer is observation-free,
but those request costs still contain WhiteBox/JNI/result machinery. Neither
subtracting a guessed bridge cost nor treating zero phase fields as zero CPU
provides the new runtime helper's cost. The cleanup image has no new timings.

At an illustrative admission count 32, an ordinary call predicate becoming
eligible at 200 leaves 168 counts, about 5.04 us at 30 ns saving. If the actual
next notification admits at 256, 224 counts give 6.72 us. Waiting until 128
reduces those figures to 2.16/3.84 us. These are conditional continued-call
budgets, not guaranteed future calls, arrival thresholds or queue delays.
Caller inlining can eliminate calls without a target nmethod, and a method
can simply stop executing. Use actual off-arm enqueue and installation events
in the diagnostic; never give the candidate credit for interpreter time made
available by delaying C1.

The necessary condition is that complete runtime request CPU plus its share of
classification, selector, arena setup and induced ordinary work is below its
actual exclusive interpreter savings. An approximately 5 us recurring request
already consumes essentially the nominal Long budget. Sixteen ideal methods
would save only about 81–108 us before enqueue in that illustration, while
arena initialization alone was 20–35 us in the earlier measured image. These
are scale calculations, not a new image's measured total. Checks on all other
interpreted entries, cold generation and low-use failures must be charged too.
With zero known Long-like application candidates, the current application's
profit gate is closed.

Keep parameter/MDO profiling and every ordinary compilation notification. New
MDO creation after publication need not disable an all-integer body: the prefix
skips no call/branch type profiling, and normal entry counters continue. C1/C2
replace or inline it through their ordinary paths. The new admission state has
no successor scheduling role. If later data justify a C1-delay comparison, it
must be a separately enabled, ready-method-only policy experiment with stock
MDO behavior and its complete duplicate/avoided compilation ledger; it must
not reuse the worker-coupled 512 hold. No delay is selected here. C2 stays
normal; an eventual explicit C1-only comparison can use the existing
TieredStopAtLevel=3 in both arms, separately from the default level-4 result.

## Smallest useful end-to-end experiment proposed

First qualify the counter-to-producer boundary with one focused Java fixture
using the existing Short/Medium/Long bodies under normal C1/C2. Use no compile
exclusion, forced C2 caller, -Xint, WhiteBox preparation, reflection or startup
agent. Short/Medium must be declined once; Long may be prepared once and then
compiled/inlined normally. Verify values, refusal/claim races, forced poll and
late tooling fallback, GC/unloading and ordinary C1/deoptimization handoff on
release/fastdebug before performance execution. Existing WhiteBox controls can
remain correctness diagnostics, but the automatic route must also run with
WhiteBoxAPI=false and InterpreterFramePilotTestPoll=false.

One separate diagnostic variant can record the bounded candidate identities,
attempt/request cost, counts, rejection reasons, prefix entries and first
ordinary enqueue/install while doing no per-bytecode/per-entry printing.
Keep this instrumentation outside generate_locked<false> and separate from
production timings; copy identity data safely rather than retaining unrooted
metadata. It must account for first use, busy/full declines, class-load/selector
work and all sixteen slices. This necessary-condition trial answers whether
the natural path can repay before unchanged C1 at all. It cannot establish
javac benefit from synthetic Long cases or from forced interpretation.

A meaningful application trial additionally needs a supported operation family
that covers material pre-C1 interpreter CPU. The current evidence points to
instance/reference access and control flow, not more static integer prefixes.
The next concrete coverage contract to investigate is instance entry plus
reference loads, already-resolved field reads and forward integer/null
branches, preserving ordinary fallback before unresolved/throwing/barrier slow
paths and at calls. It is not adopted by this plan: the saved JFR is insufficient
to select its exact CPU opportunity or claim it reaches the user's coverage
goal. Native PC samples also do not identify rejected Method/BCI time, and
AsyncGetCallTrace's capability/method-ID prerequisites are not bypassed. A
valid, bounded baseline attribution must establish that opportunity before
this larger semantics batch or an adoption comparison is selected. Arrays,
loops, allocation, handlers and general call continuation are not silently
folded into the current one-prefix architecture.

Once that opportunity and the runtime cost gate are met, the smallest matched
application comparison is one off/on/on/off block for the unchanged startup
task and one block for its unchanged warm task: eight production JVMs, with
no repeats to improve significance. Use the same image/classpath/classes,
CPUs 0–3, G1/128 MiB, CICompilerCount=3, default profiling/thresholds and
TieredStopAtLevel=4. Keep the automatic opt-in fixed true and change only
UseInterpreterFramePilot; keep UseDirectBaseline, WhiteBox and poll hooks off.
Count the arena/selector/trigger work in the on arm. Retain every first-result,
whole-process CPU/wall and warm-window outcome and ordinary compiler activity.
Use the separate diagnostic for the causal ledger. Continuing C2 activity
precludes labeling the old warm-window median settled throughput. A broad
matrix, hidden tier delay or new low-coverage application timing loop is not
part of this planning pass.

Failure of the stock-policy trial rules out its additive configuration at the
observed budget; it does not by itself rule out the user's intended early
stage replacing C1 work with separately justified later C1. That question
still needs meaningful supported execution and a total avoided/added-work
comparison, rather than obtaining extra interpreter calls by an undisclosed hold.

The recommendation is therefore the bounded natural-entry cost/handoff unit,
with a fail-closed selective lane and an explicit coverage prerequisite for
application evaluation. No implementation or execution of this proposal is
included. Raw analysis remains private in /workspace/interpreter-frame-admission-plan;
the three small normalized tables contain no raw stacks, addresses or images.
