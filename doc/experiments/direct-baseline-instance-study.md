# Direct baseline: tier causality and the next useful coverage boundary

The current static subset has not demonstrated an acceptable application win.
The observed `JavaCompiler.attribute(Env)` tier difference is consistent with
ordinary queue-sensitive profiling policy; there is no demonstrated counter or
admission correctness defect to patch in that method. The next meaningful
compiler work is instance entry and instance calls, rather than more small
static getters. This study preserves `46cf40d0b28`, all earlier images and all
adverse measurements. It changes neither runtime code nor thresholds, and runs
no new caller campaign.

## What the retained attribute histories actually establish

`JavaCompiler.attribute(Env)` is an instance method with a try/finally handler.
The interpreter hook tests `JVM_ACC_STATIC` before requesting direct work;
`DirectBaseline::request`, preflight and the emitter reject this method as well.
It has no direct activation. The local 512-call hold requires a live direct
nmethod and cannot apply to it. Ordinary queue ownership, counter increments
and notification masks for this method remain the stock paths.

The retained `scanner-window` captures compare the exact functional
`1492e761174` image (`b7734cc7...`) with `ac8799d67c9` (`c4f97463...`). They do
not contain the subsequent preflight change. These are diagnostic captures,
not a relabeling of the original performance forks.

| Image | Attribute request | Total calls at request | Request time, s | Install time, s | Pending C2 jobs at request |
|---|---|---:|---:|---:|---:|
| 1492 control | counting C1, level 2 | 384 | 2.359679 | 2.361 | 12 |
| 1492 control | profiling C1, level 3 | 2048 | 6.186246 | 6.196 | 0 |
| Getstatic | profiling C1, level 3 | 512 | 2.384758 | 2.398 | 7 |

`CICompilerCount=3` gives one C1 and two C2 workers. In
`CompilationPolicy::transition_from_none`, a C2 queue greater than
`Tier3DelayOn * compiler_count(4)`, here `5 * 2 = 10`, selects counting C1.
Thus the observed queues explain the different first tiers: 12 selects level
2; seven selects level 3. The level-2 entry counter is MC, with a normal
2^11 notification interval. Its next observed promotion is at total 2048,
with the C2 queue empty and below the level-2-to-3 cutoff of `2 * 2 = 4`.
This is ordinary policy hysteresis, not direct code resetting the counter.

The pending-job reconstruction uses each C2 task's exact `queued_ns` and
`started_ns`. All pending tasks subsequently receive service; there are no
unresolved earlier C2 tasks in these three snapshots. `started_ns` is recorded
after selection/CI setup, so an in-service job not yet at that timestamp could
briefly be included. These are reconstructed snapshots rather than queue-lock
samples. The control's twelve jobs all start at least 5.25 ms later; the
getstatic snapshot is below the cutoff even if this reconstruction overcounts.
The small tables include the identities and timestamps of all nineteen jobs.

Both C1 levels ensure MDO allocation. Only level 3 emits the full branch/type
and parameter feedback and counts entries in MDO; level 2 counts entries in
MC. `Method::invocation_count()` sums the two counters, whereas C2 admission
uses MDO deltas from the profile start. A total-count log therefore cannot
recover the profile origin. Genuine inlined profiling and later reprofile
events can also affect those deltas.

No attribute C2 request occurs in either of these complete logged captures.
The earlier preinitialized window had control C2 versus getstatic C1; the
later WhiteBox diagnostic instead found both fresh processes still at C1.
That difference is not persistent across the retained cohorts. It does not
establish worse final C2 code or a method-specific direct-tier bug.

The mechanism for sensitivity is concrete. Level-3 entry notifications occur
every 1024 profiled calls, not on every invocation. The normal loop-free C2
invocation threshold is 5000 profile calls, scaled by
`1 + C2_queue_size / (Tier4LoadFeedback * C2_workers)`. Here even one queued
job raises it to about 5833. A method can miss admission at an MDO notification
near 5120, then need the next notification at 6144 after the queue clears.
This is an illustration of the actual predicate and cadence, not a claim that
the logs contain attribute's MDO value at those events. They do not. The
original warm forks lack their separate MC/MDO/start snapshots and call-site
CPU samples, so the exact share of the 9.3% getstatic loss remains unproved.

Direct tasks are excluded from ordinary C1 queue-size feedback and worker
creation. They still consume shared worker service, CPU and installation
locks. Changed execution speeds and later profiling of actual direct methods
can indirectly change ordinary C1/C2 queues and admission. This is a real
integration/performance consequence to measure, not evidence that thresholds
are unchanged in effective wall-clock behavior. There is no supported reason
to force attribute to C2, suppress stock feedback, or delay C2 globally.

## HeapCharBuffer loading is a valid dependency invalidation

Both retained images first load `HeapCharBuffer` around the first measured
output, at 15.540 and 14.828 seconds. Both ordinary scanner compilations had
recorded a `leaf_type` dependency on `CharBuffer`; the new concrete subclass
invalidates it and inlined parser code. This dependency is an ordinary C1/C2
optimization: `GraphBuilder::direct_compare` may assume a loaded non-final
class has no subclasses and records the required dependency.

The reporting path itself reaches `StreamEncoder.implWrite(char[],off,len)`,
which calls `CharBuffer.wrap`. The wrapper prints each measured task only after
the task timer stops, and does not print the preceding warmup tasks. This
explains why reporting can first load the subclass at the window boundary.
Source plus dependency/timestamp evidence identifies this path; no exact
class-loading call stack was retained. Preinitializing the class removes the
selected invalidation but leaves an 11.3% diagnostic gap, so it is not a
sufficient explanation of the warm loss.

The current direct admission hook does no class loading. CI signature lookup
uses `SystemDictionary::find_*`, representing absent classes as unloaded;
it can materialize arrays of an already-loaded component. Field validation
uses `ClassInitMode::dont_init`, and static fields/calls require initialized
holders. The emitter neither names `HeapCharBuffer` nor introduces this
`leaf_type` dependency. There is no identified accidental direct-compiler load
to remove. Loading future subclasses speculatively would add startup work and
require guessing future application behavior. Changing ordinary C1/C2 CHA or
prewarming a class list is not a justified baseline correction.

Future instance dispatch should use existing non-speculative IC/vtable
mechanisms initially, without new CHA dependencies. That avoids introducing
this particular speculative dependency in direct code; it cannot prevent a
valid later invalidation of ordinary optimized code.

## Coverage inventory and its limits

The independent classfile inventory uses the unchanged preflight image and one
retained startup log. It finds 288 unique javac normal-entry compile roots;
283 have classfiles in the matched jmods, while five runtime-generated classes
are unavailable. It models the current category-1, no-allocation, no-loop,
bounded-frame/code restrictions and conservative type-state merges. Its static
case reproduces all nineteen actual javac installations with no extra method
or miss. That calibration supports using it for a structural inventory, not
for predicting successful compilation or performance.

Loaded/initialized/access/link checks, intrinsics known only to the VM,
redefinition races and runtime-specific resolution can reject projected methods.
Root count and bytecode bytes do not measure application CPU, calls served
before ordinary admission, interpreter work avoided, or code-cache profitability.
The denominator excludes methods that never request compilation and OSR-only
roots. Nested callee work is not credited to an eligible caller.

| Prospective support | Javac roots | First ordinary request at level 2/3/4 | Full classfile bytecode bytes |
|---|---:|---:|---:|
| Current static subset | 19 | 7 | 202 |
| Normal instance entry | 67 | 29 | 560 |
| Entry + bound nonconstructor calls | 79 | 39 | 767 |
| Above + general invokevirtual | 129 | 83 | 1950 |
| Above + invokeinterface | 138 | 89 | 2072 |
| Bound calls + exception handoff | 80 | 40 | 819 |
| General calls + exception handoff | 143 | 94 | 2304 |

The last two rows overlap earlier rows. The second numeric column distinguishes
methods already receiving ordinary trivial level-1 code; it is not a new
eligibility rule. Full classfile bytes include exception-only code that the
proposed handler handoff would leave interpreted.

Entry alone adds 48 roots but only 358 bytecode bytes. Twenty-six already
receive ordinary level 1 at count 128, leaving a short early opportunity;
22 receive level 3. Useful examples include `UnicodeReader.nextCodeUnit`
(48 bytes), `ListBuffer.clear` (23) and `Kinds.KindSelector.contains` (18).
The twelve bound-call additions include `UnicodeReader.next`,
`JavaTokenizer.put(char)`, `PoolReader.ImmutablePoolHelper.offset`,
`Flow.BaseAnalyzer.scan` and `Types.erasure`. Ten receive ordinary level 3;
two have no ordinary request in this startup. The larger next increment is
general invokevirtual: fifty roots, including `Names.fromString/fromUtf`,
`UnicodeReader.nextCodePoint` and `ByteBuffer.getByte/getChar/getInt`.
`Symbol.complete` fails the existing conservative local-type merge and must
not be counted just because its opcodes otherwise fit.

## Smallest coherent instance and call implementation

Keep the canonical slots and existing forward type-state prepass. Add normal
instance roots but explicitly exclude constructors, synchronized/native/scoped,
reserved-stack and special intrinsic methods, plus the current unsupported
types, monitors, loops and initialization cases. Change the interpreter,
request and CI gates together. Receiver handling is an ABI requirement:

* Before the frame, emit the normal unverified entry with
  `MacroAssembler::ic_check(CodeEntryAlignment)`; record a separate verified
  entry immediately after it, as `LIR_Assembler::check_icache/lir_std_entry`
  does. Reuse the current compressed-class/compact-header and IC-miss contract.
* Prepend the receiver as `T_OBJECT` to the Java calling-convention arrays.
  Local 0 holds it, descriptor arguments follow. Preserve it in canonical
  slots and every applicable GC map and deoptimization scope, including entry
  counter overflow. Static entry behavior stays unchanged.
* Resolve calls with `ciBytecodeStream::get_method` and its declared signature,
  using the existing CI/LinkResolver access, loader and special-call selection
  rules. Accept invokevirtual only when `ciMethod::can_be_statically_bound()`
  is true. Accept nonconstructor invokespecial only for class calls initially;
  interface-private/default-super cases need extra receiver constraints and
  remain whole-method fallbacks.
* Null-check the receiver at the invoke BCI before argument marshalling, even
  if the target does not dereference `this`. Use patchable
  `opt_virtual_call_type`, `get_resolve_opt_virtual_call_stub`, the existing
  to-interpreter stub and post-call continuation. Do not jump to a raw current
  callee entry or infer binding from one observed receiver.

The per-BCI resolved operand cache needs a call kind, not an IR or adapter
framework. Keep original argument slots marked as oops across a safepoint;
describe only the surviving expression stack after a completed Java call.
Store reference results with the existing return-oop convention. Callees may
remain interpreted or independently reach C1/C2 and OSR; compiling their caller
does not credit all nested callee work as interpreter work avoided.

General virtual/interface calls should follow as a distinct extension using
normal compiled IC relocation/resolution, rather than speculative direct
targets. This adds fifty/nine structural roots, respectively. Interface
resolution, AME/ICCE, default/Object methods, unloading, redefinition and
mono/poly/megamorphic changes require semantic qualification even if assembler
reuse makes the production diff short.

## Exception support without compiling catch paths

The minimal useful handler design compiles normal reachable paths and resumes
the interpreter for exceptional control flow. It does not compile exception
handler blocks unless they are also normally reachable. Skip state-less
handler-only blocks in both prepass and emission; keep all monitor and
unsupported normal-path exclusions. Normal branches into shared handler code
must still receive valid type states. Allocation in skipped catch code can
remain interpreted without supporting allocation on the compiled normal path.

Simply accepting Java exception tables is currently incorrect:
`SharedRuntime::compute_compiled_exc_handler` treats the direct nmethod like
C1 and, with an empty native catch table, returns its unwind handler even if
a Java handler was found. This is a requirement for the proposed extension,
not a bug in today's handler-excluding supported subset.

Reuse `Runtime1::exception_handler_for_pc_helper`, whose established callee
stub already sets exception oop/PC TLS, the issuing PC and stack-watermark
state. After existing JVMTI handling and before the exception cache, a direct
method with Java handlers, usable reguarded stack and a nonnegative bytecode
scope can call `Deoptimization::deoptimize_for_missing_exception_handler(nm,
false)`. That helper deoptimizes the current caller and returns
`unpack_with_exception_in_tls`. `vframeArray` reconstructs the original BCI
and enters `Interpreter::rethrow_exception_entry`. An already-thrown callee
is therefore not repeated. Keep the invoke scope's `reexecute=false`, consumed
argument accounting, surviving locals/stack and all live argument oop roots.

The real-BCI check matters: the current overflow scope is
`SynchronizationEntryBCI = -1`, whereas `Unpack_exception` requires a
nonnegative BCI. Entry/stack-overflow cases must retain the existing unwind
handling. Null/bounds guards already deoptimize at their own pre-bytecode
state, after earlier side effects; explicit athrow can use the same approach
with its exception operand preserved. Existing JVMTI and final
`caller_is_deopted` logic must remain. Frame-only deoptimization permits future
normal entries but repeated hot catches would repeatedly pay this cost; this
is suitable for cold exceptional paths, not a throughput claim for hot catches.

With bound calls, handlers add only `Symbol.ClassSymbol.complete()` in this
sample. With general calls they add five roots in total: that method,
`ClassReader.nextChar`, `nextInt`, `readName`, and wrapped-file-manager
`inferBinaryName`. Handler support is a correctness/coverage milestone; it
does not by itself address the dominant dispatch gap. `JavaCompiler.attribute`
still has other unsupported operations and is not silently forced into the
candidate subset.

## Cost, qualification and recommendation

The independent review estimates 45–80 production lines for instance entry
and receiver ABI, another 35–70 for bound calls, and 40–75 for handler handoff,
dead blocks and athrow. That is roughly 120–225 production lines across
emitter, interpreter admission and Runtime1, plus 200–350 focused Java test
lines. General dispatch might add 25–60 production lines using existing IC
helpers, but another 150–250 test lines. These are source-scoped estimates,
not measured diffs, production-readiness estimates or assurances that runtime
qualification will uncover no further work. No C1 frontend, LIR, allocator,
new worker scheme or general adapter framework is required.

The retained preflight logged forks give a useful cost constraint:

| Diagnostic budget | Fork 2 | Fork 3 |
|---|---:|---:|
| Successful direct tasks | 160 | 162 |
| Inclusive successful-task CPU, ms | 11.153 | 12.274 |
| Mean successful-task CPU, microseconds | 69.706 | 75.768 |
| Rejected-task CPU, ms | 9.233 | 9.313 |
| All direct-task CPU, ms | 20.386 | 21.587 |
| Actual direct body entries | 46163 | 47180 |

These include broker/CI setup and must not be replaced by emitter-only times.
At those entry counts, merely amortizing direct task CPU requires average net
execution savings of about 442–458 ns per body entry, before charging other
integration costs or crediting ordinary compilation changes. This arithmetic
is a necessary local budget comparison, not attribution of the process gap or
a prediction for new instance methods. The previous small StageProbe's roughly
17 ns per-call interpreter/direct difference cannot support that budget for
this application. Increasing the number of tiny getters is not a credible win
claim; more useful bodies, cheaper complete compilation, or substantially more
useful entries would have to change the measured budget.

Recommend the bounded instance-entry plus bound-call implementation as the next
coherent qualification step, with the interpreter exception continuation as a
separate small correctness milestone. It raises the structural bound to 79
roots and the observed nontrivial subset from seven to 39. General virtual
calls have the larger subsequent coverage return and are probably needed for
representative application coverage. Allocation/constructors and loops/OSR
remain separate, materially larger contracts. This inventory does not establish
that allocation is essential before any gain is possible.

Qualification must cover interpreted and compiled callers, receiver/stack-spill
and subword ABI, inherited final/private/super calls and null receivers; GC of
receiver/local/argument references across overflow, allocating callees and
deoptimization; caught/escaping exceptions from interpreter/C1/C2/native code,
side effects exactly once, catch ordering/finally, explicit/null athrow and
handler-resolution failures; JVMTI before/after installation, stack guards,
unloading/redefinition, stale installation and normal C1/C2 replacement.
Deoptimization/profile counters must preserve their ordinary meaning and not
consume a future C2 failure budget for an unqualified baseline fallback.

After semantic qualification, one matched existing-caller comparison should
measure actual new installations, failed attempts, useful entries before
ordinary admission, exclusive/interpreter/callee work, inclusive compile CPU,
profile readiness/C1/C2 arrival and the original warmed task metric. Do not add
a threshold sweep. If broader instance execution still cannot amortize the
complete compiler/setup cost, or the warmed loss repeats with comparable
ordinary code/profile state, this architecture has not met the user's goal.
The direct-emission frame/runtime approach remains technically credible;
an application startup and steady-state win remains unproved. No further
threshold or C2 delay is justified by this study.

## Evidence and validation

The new analysis reads existing files only. The executable images remain the
previously tested ones: all four baseline jtreg tests passed on release and
fastdebug at `46cf40d0b28`; no new semantic qualification is claimed for the
prospective capabilities. Derived tables are in `direct-baseline-data` with
the `instance-study-` prefix. Scripts, complete inventories, input SHA-256s and
retained raw paths are under
`/workspace/direct-baseline-evidence/architecture-study/`. Original warm data,
full XML, code lists, class logs and diagnostic sources remain under
`/workspace/direct-baseline-evidence/preflight/`.
