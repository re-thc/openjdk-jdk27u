# Direct baseline: whole-path budget and worker preparation

The direct emitter is surrounded by costs too large for its measured early
execution window. The main problem is not hidden C1 IR: it is rich per-task
CI/metadata setup, normal nmethod installation, admission notifications and
ordinary-tier interaction around a small memory-stack emitter.

A concrete structural correction is implemented locally in `db5da709664`:
the existing category/state walk runs on the compiler worker before CI
construction. It rejects roughly 1,107 of 2,255 startup tasks without CI,
without a second successful-path scan. Two unlogged service captures per
version fall from 44.081/49.226 ms to 35.291/39.531 ms (19.8% lower midpoint).
Refusal CPU falls about 52%; successful-task CPU does not consistently improve.
All six direct tests and three current-base smokes pass on release and
fastdebug. The application comparison is adverse in warm mode, so this remains
an isolated, opt-in structural candidate, not an adoption or warmed-neutrality
claim. No public action or default/promotion-policy change occurred.

## Denominators and the 364 ns figure

The unchanged 89a startup diagnostic installs 842 direct methods and records
212,679 direct entries. Of these, 163,435 occur before first ordinary admission
and the inherited shared-worker 512-total-call hold. The hold is part of this
prototype: these are not necessarily calls that would have remained interpreted
with the feature off. Only 28,495 of those early entries are in javac methods;
the denominator includes the JDK/helper methods too.

Separate no-print, in-memory measurements give this initial CPU ledger:

| Component | CPU, ms | Denominator / scope |
|---|---:|---|
| Complete direct worker service | 39.302361 | Median of 3 captures, 2,251–2,259 tasks |
| Java-thread request body | 18.721565 | Median of those 3 captures; about 3,064 calls |
| Incremental C1 queue selection estimate | 1.498208 | Enabled median 2.924237 less mean off 1.426030 |
| Estimated measured subtotal | 59.522134 | Sum of the preceding CPU components |

`59.5221335 ms * 1,000,000 ns/ms / 163,435 early entries = 364.1945 ns/entry`.
This is the average saving needed to cover that measured subtotal, not measured
execution time saved. It combines process medians with a separate logged entry
denominator. The selector subtraction uses two off captures and three enabled
captures, not matched per-method work. Request timers omit the interpreter's
assembly/JRT entry and exit; service begins after dequeue and includes task,
CI, JNI, resource and handle cleanup, but not task selection or the dequeue
metadata-handle upgrade. Two CPU clocks per service record and aggregate clocks
also perturb the measurement. There is no diagnostic printing in these timed
intervals. Fine nested probes have appreciably greater observer cost and are
not substituted for the outer service total.

The earlier unlogged application difference, +54.638 ms CPU and +28.227 ms wall
against off, is a separate three-fork result. `54.638 ms / 163,435` would be
334.31 ns/entry, but that is neither a compilation-cost measurement nor an
independent saving estimate. Ordinary compiler work, useful execution,
profiling and scheduling differ. CPU components overlap across threads; they
cannot be added as wall time or divided mechanically by the CPU count.
See [service observations](direct-baseline-data/budget-service.tsv) and the
[original application comparison](direct-baseline-recovery.md).

## Execution is cheaper, but the measured savings are small

A controlled probe copies seven bytecode shapes into small methods. An
out-of-line C2 batch caller invokes each target; a fixed leaf is C2 compiled.
The early target is either direct code installed naturally after 64 calls or
an interpreted method. Only this probe disables ProfileInterpreter after
installation, asserts no MDO, freezes compilation during each measurement and
checks stage identity. Five 200,000-call samples are retained per shape.
C1/C2 stages follow after restoring profiling. One initial off run rejected
an incorrect harness assumption that C1 always chooses level 3; the corrected
probe accepts the legitimate trivial level 1 and preserves the partial run.

| Shape | Interpreter, ns/call | Direct, ns/call | Difference, ns/call |
|---|---:|---:|---:|
| Integer field getter | 13.171 | 3.812 | 9.359 |
| Reference field getter | 13.284 | 4.013 | 9.271 |
| Array length through a field | 14.568 | 4.076 | 10.493 |
| Publish flag / return reference | 19.363 | 11.104 | 8.259 |
| Bound leaf call / integer result | 33.934 | 10.895 | 23.039 |
| Branch / field and array updates | 38.381 | 22.921 | 15.460 |
| Byte-array indexed load | 18.156 | 11.410 | 6.747 |

These are synthetic shapes, not actual workload-weighted early-entry costs.
Their hot batch, compiled caller, frozen MDO/promotion state and aged counters
also differ from a method's first few hundred application calls. They do not
measure real early i2c/c2i mix, cold code, exceptional entries or lost profiling.
Multiplying all 163,435 entries by these differences would yield 1.10–3.77 ms;
that is only an illustration. At those hypothetical savings, the 59.52 ms
subtotal would need a 93.7–98.1% reduction. It is not a measured bound on this
workload's benefit or proof that no early compiler can win.
See [all controlled samples](direct-baseline-data/budget-execution.tsv).

Disassembly explains the remaining direct-body gap to C1/C2. A getter performs
IC/entry guards, stack bangs and frame construction, spills Java arguments,
updates MethodCounters, moves local to expression slot through rax, reloads it
for a redundant original-receiver null check, loads the field, spills/reloads
the result and exits through a safepoint poll. Its direct body is effectively
a memory-stack interpreter without dispatch. The measured 3.8 ns getter and
disarmed guard exclude the old permanent-slow-entry-barrier failure. They do
not make all runtime/adaptor work free.

## Admission, queues and handoff are part of the cost

One separate fine capture observes 3,064 request calls costing 22.193 ms CPU /
26.796 ms wall. Inclusive request components include 2,272 enqueues/broadcasts
at 11.237 ms CPU, task construction at 1.109 ms, metadata preflight at 0.404 ms,
and queue-lock acquisition at 1.132 ms CPU / 5.450 ms wall. Do not sum these
nested components. The rich compilation itself is not the only expense.
The request gate is a once-per-method early entry check, not an unrestricted
callback on every interpreted invocation.

Direct FIFO selection still scans the shared linked list under
MethodCompileQueue_lock. The measured selector increment is material but
smaller than request/service work. Reconstruction of retained enqueue/task
start records estimates 91.8–92.0% of 89a startup direct enqueues occur while
the owning queue is nonempty, and 95.9–96.0% in warm mode. Sensitivity uses
0/2/10 microsecond dequeue leads; stale-removal timing is not exact.
[Request phases](direct-baseline-data/budget-request.tsv) and
[queue reconstruction](direct-baseline-data/budget-queue.tsv) preserve the
observations and denominators.

An isolated local wakeup candidate, `7bcad675a00`, broadcasts a direct enqueue
only on an empty-to-nonempty transition, under the same monitor used by the
worker's empty-queue wait loop. Ordinary enqueue and shutdown notifications
remain intact. A new test checks idle wake and burst drain in both worker
modes within 2 seconds, below the 5-second fallback wait; all six then-current
tests pass on both builds. Matched instrumentation observes request CPU
17.404 ms before and 8.283/10.136/9.450 ms after, while service/callback CPU
varies. Three unlogged startup pairs are adverse: control median wall/CPU
518.572/1,031.125 ms, candidate 534.172/1,055.738 ms. It is not merged into the
worker-preparation candidate and is not the solution or an adoption win.

Direct MethodCounters callbacks cost 4.088 ms across 1,632 calls in the fine
startup capture. That is observed helper CPU, not wholly incremental cost:
off also has ordinary frequency events. It excludes the complete stub/JRT
bridge. Direct code counts MC even after MDO allocation, avoiding false profile
aging but collecting no receiver/branch profiles. The shared-worker hold to
512 calls delays ordinary C1 admission; it is gated by
`!DirectBaselineDedicatedWorker`, so historical shared/dedicated comparisons
also changed promotion policy. A scheduling-only interpretation is invalid.

The same capture sees zero direct guard-deopt/unwind calls; a later capture
sees two exceptional unwinds. This does not prove exception cost is absent.
Null/bounds guards use Reason_unhandled/Action_none with reexecution, so
repeated failures can pay repeated deopt/unpack costs. Successful shape probes
do not quantify that workload mix.

The already-running extra barrier capture completed: 124 common slow-helper
calls, 0.119773 ms CPU, all 124 rejected as not-entrant. G1 uses the default
BarrierSetNMethod and explicitly disarms new code in
G1CollectedHeap::register_nmethod. Thus the earlier zero virtual-barrier count
and these rejected slow entries are consistent; there is no G1 override to
explain them. Registration's barrier/root work is included in service, and
normal fast guards in execution. The temporary probe was restored and the VM
rebuilt; neither result is a total barrier-cost measurement.

## The implemented worker pass

`db5da709664` moves the existing forward-CFG category/state pass into the
compiler worker, outside MethodCompileQueue_lock and before ciEnv creation.
It reads native Method/constant-pool descriptors in VM state, stores int/oop
categories and outgoing argument space, and performs no class lookup or
operand linking. The existing per-task strong metadata handle owns lifetime;
a worker ResourceMark owns the prepared data across the nested CI invocation.
Preparation is thread-local only for the duration of that task and is cleared
on success/refusal. Repeated compilations allocate fresh emission labels.

Structurally accepted bodies retain the existing CI emission visit. It resolves
fields/calls there and validates their basic calling categories against the
prepared snapshot. A field uses its layout category, avoiding unused reference
class lookup; ciBytecodeStream::get_field already performs will_link, so the
second will_link VM transition is removed. Canonical declaring-holder init,
access/linker checks, bound-call rules, Java ABI, precise maps/scopes, GC/write
and entry barriers, safepoint progress, exceptions, JVMTI/redefinition checks
and atomic stale-install exclusion remain. Root/callee ciMethod still eagerly
construct rich ciSignature objects for bodies that reach CI; this change does
not claim to remove that cost. No new bytecode coverage, IR, admission threshold
or ordinary-tier policy was introduced.

| No-print capture pair | 89a control | Worker preparation |
|---|---:|---:|
| All task service CPU, ms | 44.081 / 49.226 | 35.291 / 39.531 |
| CI environments | 2262 / 2255 | 1146 / 1151 |
| Refusal CPU, ms | 19.199 / 20.933 | 9.327 / 9.914 |
| Successful-task CPU, ms | 24.881 / 28.293 | 25.964 / 29.618 |

Across 1,372 common always-refused methods, mean summed CPU falls 52.0%; across
822 common always-successful methods it rises 4.45% in the two outer captures.
The fine pair differs again. This is a refusal-path improvement, not established
successful-path acceleration. [Outer captures](direct-baseline-data/front-service.tsv)
and [inclusive fine phases](direct-baseline-data/front-phases.tsv) retain all
six outcomes. Fine control's prepass includes operand resolution; fine new
emission includes it instead. New broker time also includes native preparation.
Registration contains nmethod creation; emission contains scopes. These columns
must not be summed as exclusive phase costs.

Task timestamps begin before native preparation. The older TraceDirectBaseline
compiler/task CPU print scopes and the ordinary compilation-time statistics
do not cover this new pre-CI work or its refusals. Logged task totals therefore
cannot be compared across the boundary as complete service CPU. The warm
harness uses CompilationMXBean stability, which already failed to establish
optimization quiescence; its accounting omits the new screening work too. The
outer no-print probe deliberately covers both paths through cleanup.

Fine new successful service is 29.002 ms / 845 installations: registration
8.902 ms, including 5.726 ms nmethod creation, and emission 9.476 ms, including
3.168 ms operands and 1.363 ms scopes. CI plus root wrappers still cost 3.729 ms.
Native preparation over all 2,256 tasks costs 3.269 ms, including 1.773 ms for
1,109 pre-CI refusals. About 302 structurally accepted tasks still fail linking,
binding or initialization after CI; they can now emit a prefix before refusal.
Their 7.988 ms service includes 0.569 ms recorder setup and 3.196 ms emission.
That tradeoff is measured, not hidden. State-mask replacement alone is bounded
by the small native-preparation bucket.

## Qualification and adverse application results

All six direct tests pass release/fastdebug, including the new preparation
fixture: a field/call preceding unsupported division rejects before CI, a
reference-returning method still installs, and ordinary C1 can compile both
refused methods. Existing tests cover identity/receiver/IC/null, stack arguments,
Serial/G1 roots and barriers, interpreted/native/C1/C2 mixed calls, exception
side effects, profiling/replacement and stale installs. All three original
base smokes also pass on each build. The first release attempt caught a
rewritten-field opcode translation bug and was retained; subsequent successful
runs use the Java bytecode form when indexing the CP cache. Two debug build
failures from the new assertion's macro/include choice were corrected and
retained. See [all successful checks](direct-baseline-data/front-tests.tsv).

Temporary cost instrumentation was removed, production sources compared to
their saved copies and the release VM rebuilt. Its .text/.rodata/.data hashes
match the pre-probe production image; neither production VM has probe symbols.
Complete ELF hashes differ in debug/link information. Images use the same
runtime content and the same separate synchronous build prerequisites recorded
in the recovery report. [Image identities](direct-baseline-data/front-images.tsv)
record both hashes. Across 822 common startup and 1,183 common fresh warm methods,
code-blob sizes and instruction/stub offsets match. External auxiliary-data
address offsets are allocator-dependent and are not size evidence or byte
identity. See [code shapes](direct-baseline-data/front-code-sizes.tsv).

The bounded application check runs two fresh startup and two fresh warm
processes per mode, 12 in total, in opposite serial orders. It uses unchanged
CompilerWorkload, common JDK content, original warmup/stability pause, stock
thresholds, shared direct worker, four CPUs, three compiler threads and no
tracing/CITime/PrintCompilation/XML/WhiteBox. All exit zero.

| Two-fork midpoint | Off | 89a enabled | Worker preparation |
|---|---:|---:|---:|
| Startup wall, ms | 544.626 | 532.191 | 538.712 |
| Startup CPU, ms | 1137.677 | 1148.461 | 1143.534 |
| Warm task median, ms | 5.320 | 4.492 | 4.627 |
| Whole warm wall, s | 14.276 | 13.994 | 14.560 |
| Whole warm CPU, s | 25.338 | 24.440 | 25.681 |

The first off startup is slow and remains retained. The preparation candidate
loses to enabled control in both warm processes: midpoint +3.0% task time,
+4.0% process wall and +5.1% CPU. No warmed win or neutrality is established.
The initial parser omitted warm_ns samples; they were recovered from the
existing 100 samples per process without rerunning any process, and the
original parser output remains private alongside the correction.
[Every process](direct-baseline-data/front-caller-times.tsv) is retained.

Three additional logged diagnostics, not performance samples, show 847 startup
installations / 165,022 early entries for preparation. Warm direct coverage is
1238 control / 1237 new, including 426 javac methods each. First javac C2
arrives at 343/393 ms in the fresh warm pair. The measured warm window still
starts 7 C1 / 23 C2 tasks in control and 6 C1 / 29 C2 in new, plus 23/24 direct
installations. The logged process thread snapshots have C2 CPU 6.45/7.54 s and
application CPU 12.28/13.17 s, while shared C1 CPU is 2.55/2.50 s. These show
changed optimization/application history despite cheaper refusals; they are
not a decomposition of the unlogged adverse processes. No method counters fail
to read. [Diagnostic denominators](direct-baseline-data/front-diagnostics.tsv)
record the counts. Fewer frontend cycles did not ensure better ordinary-tier
arrival or application behavior.

## Bounded architecture work that follows from this result

The accounting target is exclusive interpreter execution saved, less direct
body/adapters/traps, request/compile/install work, and induced ordinary-tier
work/delay. The 441 low-use original installations (22,702 entries) and their
24.216 ms logged successful budget remain evidence of poor amortization,
not a sufficient explanation or a threshold-tuning instruction. The new startup
capture still has 452 low-use installations. There is no evidence here that
merely admitting later, suppressing javac helpers or expanding coverage reaches
a cheap early-stage budget.

The next structural boundary is an accepted-method path with a bounded native
operand snapshot, not another optimizing-compiler frontend. Keep real linker
access/loader/initialization checks in one VM visit; store field offsets,
layout/volatile/barrier attributes, bound call targets and basic signatures
under normal metadata/GC handles. Reuse the already prepared native states for
emission. Retain the existing installation bridge initially so its correctness
checks remain observable. Root/callee rich signatures and copied handler/escape
wrappers are accidental requirements of the current CI path, not requirements
of machine emission. A lazy rich-signature strategy or a narrowly scoped native
snapshot must preserve CI's public type semantics; substituting a fake
ciSignature containing only Object types would be unsound. Measure this
accepted-only boundary separately before widening it.

Installation remains a separate floor to investigate: fine nmethod creation
alone is 6.8 microseconds per successful method and full registration is
10.5 microseconds. These are instrumented observations, not irreducible lower
bounds. Code-cache allocation/copies, maps/relocations, collector registration,
method dependency and JVMTI validation, stale-install locks and publication
are mandatory obligations. Rich CI object creation, unused signature-class
queries, handler wrapper construction and repeated general scope-value
allocation are avoidable representations. The HotCodeCollector hook already
returns immediately for direct methods; deleting its call is not a credible
large saving. The next install probe should distinguish allocation/copy,
GC-root registration and publication/lock costs inside the already measured
registration interval, not repeat whole-application timing to guess them.

For execution, a fixed top-of-stack cache or straight-line fusion can remove
local/expression bounces while retaining canonical slots. Flush/materialize
before guards, calls, joins and existing maps; preserve integer upper-bit ABI
requirements. Original-this null-guard removal needs receiver provenance,
because astore_0 can overwrite local zero. These are bounded emitter changes,
not a register-allocation framework. A by-value initialized/oop mask state is
also a simpler representation, but its measured ceiling is much smaller than
the whole gap. Execution changes need actual workload-weighted early caller
and exception mix, not extrapolation of the synthetic seven shapes.

Finally, separate worker ownership from the inherited 512-call promotion hold
before attributing handoff effects to scheduling. Real profile collection and
ordinary C1/C2 arrival must remain part of the evaluation. No small change in
this study credibly removes the full 364-ns-per-entry estimated burden. The
implemented refusal correction establishes a useful structural boundary and
an accepted-method cost target; it does not establish the requested application
win or justify accepting the warm regression.

All owned build, test and capture commands completed and were reaped. The
original 17 PID1 zombies remain unchanged; no process/disk/memory blocker or
approval is pending. Private evidence remains under
`/workspace/direct-baseline-break-even/` and `/workspace/direct-baseline-front/`.
No old executor, Library upload, public push/PR, default enablement, merge or
CI dispatch was used.
