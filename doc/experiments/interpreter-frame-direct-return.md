# Immutable call-site returns

This local change implements the reviewed design in
[interpreter-frame-direct-return-design.md](interpreter-frame-direct-return-design.md).
It preserves design checkpoint `aa7515a358b`, qualified runtime `38b1b63a0ea`
and their images/evidence. It changes neither admission nor C1/C2 policy. The
pilot remains opt-in and explicitly prepared; this is not application qualification.

## Independent review and implementation

An independent read-only source review approved the standard single return-PC
word, with r8 live only until that PC is pushed. Interpreter frame recognition,
root walking, exception routing, deoptimization and continuation freeze/thaw
accept the immutable interpreter-arena PC. No new frame slot or persistent
register is needed. The review confirmed that OnLoad capability availability is
permanent in this source, while `can_walk_any_space` can change through a Live
capability update and must be read fresh. A correction to the design document
removes FRAME_POP from the literal INTERP_EVENT_BITS list; its exclusion follows
from the access-local/exception availability flags instead.

The producer emits a distinct typed return island at each call with a generated
successor. Existing typed-epilogue emission repairs last_sp/SP, restores BCP and
locals, profiles reference returns, removes arguments and handles ordinary
PopFrame/early return exactly once. The island then canonicalizes the result,
advances/saves BCP, reads enabled/old-obsolete/late-walk state, tests the existing
poll and branches directly to the native successor. ASSERT-only mutable debug
flags remain checked. Normal execution contains no continuation counter; the
existing startup test opt-in generates that instrumentation only when requested.

The independent review found no stack-watermark requirement for an additional
return-site poll: activation removal already owns that barrier, and ordinary
invoke-return dispatch defaults to no poll. This first replacement retains the
existing poll rather than combining a second progress-policy decision.

An immediate ordinary return uses the normal typed interpreter return entry.
For an unknown successor after prefix truncation, the deferred return label
resolves to an ordinary-return trampoline before any generated cleanup. This
preserves the caller frame and ordinary return bytecode; it is not Java tail-call
elimination. Unresolved calls still fall back before any effect or VM resolution.

Return labels are distinct from Java BCI labels. Full inline call/island emission
is included in the existing 2048-byte opcode bound; the original 3832-byte total
code budget, fallback reserve, 4KiB slices, 16-slot arena and no-recycling lifetime
remain. Deferred `bind_loc`/`patch_instructions` fixups complete before release
publication. The contiguous-prefix invariant bounds unresolved final-call
trampolines to one. The former runtime BCI/native map is removed; the reserved
tail contains only the diagnostic native-site count and code-size header.

## Qualification plan

Retain all eleven focused tests on release and fastdebug, plus maximal profile
width/type-profile/VerifyOops debug call controls. Existing call tests cover
multiple sites, recursion, reference/void results, GC roots, native/C1/C2 callees,
exceptions, disable-in-callee, redefinition and late JFR fallback. New controls
assert zero native continuations for both immediate-return and unsupported-next-
bytecode cases. Virtual-thread blocking/stack-walking/GC and deoptimization of a
compiled blocked callee test the ordinary return-word freeze/thaw path.

## Qualification results

Runtime `6a7ccbf6b50` and strengthened test revision `6cb2777d0db` passed:

- All eleven focused jtreg files on release and fastdebug.
- The strengthened release call fixture separately, after review required an
  explicit null virtual-thread carrier as well as WAITING before deoptimization.
- Both call fixtures on fastdebug with VerifyOops, activation-frame, secondary-
  super and data-pointer checks; TypeProfileLevel=222, args limit16, width8 and
  the non-popcount path.

The virtual control proves an unmounted caller, stack walking, moving GC,
C1/C2 blocked-callee deoptimization and exactly one native resumption with its
sole local oop intact. Immediate-return and unsupported-successor controls each
execute their callee once and record zero native resumptions. Recursion, two-site,
native/C1/C2, oop/void, exception, redefinition, disable and late-JFR controls
remain passing. The independent implementation review found no remaining blocker.

Both incremental builds compiled four files: release16.638s, fastdebug18.946s.
The landed synchronous logging pattern reaped three adopted children per build.
There were no OOMs or new zombies (26 retained); about1.59GB remains free. No
preserved image/evidence was deleted. Reference libjvm hashes remain unchanged.

## One bounded matched comparison

Four release JVMs ran old/new/new/old against qualified `38b1b63a0ea`. Only the
three existing call cases were measured: Objects.equals with distinct equal
objects, a static integer callee plus arithmetic, and an interface integer callee
plus arithmetic. Each case has four500000-call windows, ABBA then BAAB, with
preparation order134 then413. All48 windows and12 preparation requests remain;
there was no post-result repetition. No timing prints occur inside the windows.

Both images use the same harness/class bytes, G1/64MB heap, four active CPUs,
two compiler threads, CDS off, normal interpreter profiling, explicit preparation
action5 and continuation counters off. Callers/callees are fixed at C2; prepared
roots are excluded from compilation/inlining. C1/C2/admission policy is unchanged.
Every caller/callee level and checksum check passed. Compilation MXBean total
milliseconds stayed5->5,5->5,5->5,4->4 across the four sets of windows; this
coarse metric is not proof that no submillisecond compiler activity occurred.

CPU nanoseconds per invocation below average the two off and two on windows in
each fork; percentages are on relative to that fork's off control.

| Case | Pair | Old off -> on | Old change | New off -> on | New change |
|---|---:|---:|---:|---:|---:|
| Equals |0|35.705 ->38.389|+7.52%|38.958 ->35.689|-8.39%|
| Equals |1|37.251 ->37.871|+1.67%|35.825 ->34.549|-3.56%|
| Static |0|31.528 ->35.060|+11.20%|32.046 ->28.796|-10.14%|
| Static |1|29.709 ->33.428|+12.52%|30.790 ->27.464|-10.80%|
| Interface |0|30.914 ->30.325|-1.90%|31.215 ->27.412|-12.18%|
| Interface |1|29.246 ->30.629|+4.73%|29.713 ->27.354|-7.94%|

Wall-time changes have the same directions: new Equals-8.43/-3.56%, Static
-10.14/-10.82%, Interface-12.20/-7.94%. Off controls vary between forks/images,
especially Equals, so these are small-case observations, not confidence bounds
or settled application-throughput evidence. Unfavorable old results and all
individual windows remain in the evidence.

Preparation below is end-to-end WhiteBox request CPU/wall in microseconds. The
held-method producer is observation-free; these outer measurements still include
WhiteBox/reflection/transition plumbing and are not pure producer CPU.

| Pair | Case (position) | Old CPU/wall | New CPU/wall |
|---|---|---:|---:|
|0|Equals(0)|14.341/13.671|26.059/25.067|
|0|Static(1)|13.711/12.249|14.461/13.080|
|0|Interface(2)|3.996/3.315|4.887/4.187|
|1|Interface(0)|10.606/10.025|16.624/16.044|
|1|Equals(1)|11.517/10.126|14.752/12.899|
|1|Static(2)|4.347/3.565|5.167/4.436|

All six matched preparation costs increase. One-time arena-initialization CPU
was18.407/19.159us old and214.469/18.227us new; the adverse first new value is
retained and unexplained. It is separate from per-method requests. No preparation
component timing was added in the production-like producer to explain that sample.

## Generated-code evidence and budget

Actual body dumps in both new forks show13 common integer-epilogue instructions
plus15 continuation instructions, versus retained38b1's13+83 successful first-row
return path:96 ->28 total. This counts executed static instruction paths, not
measured retired instructions/cycles. New islands have no calls or atomic
instructions and branch directly to their known successor. One pre-invoke LEA
supplies r8; the shared invoke no longer loads a return PC from a type table.
No map, entry-pointer reacquisition or repeated OnLoad capability scan executes
on return. The retained fresh walk check and poll are visible in the dumps.

The per-body byte tradeoff is explicit:

| Case | Old bytes | New bytes | Native successor sites |
|---|---:|---:|---:|
|Equals|433|573|1|
|Static|100|240|1|
|Interface|112|252|1|

All three grow140bytes; the old shared return epilogues disappear. The physical
16x4KiB arena and3832-byte body limit do not grow. Larger multi-call methods may
therefore reach the fixed code budget sooner. The maximum-profile/debug controls
passed the emitted-size assertions, but this is not a new workload coverage
census or a guarantee of identical prefix lengths for all prior methods.

## Implication and remaining limits

The return-address design removes a demonstrated integration overhead, and the
three existing call cases now save1.276-3.803ns caller CPU per invocation against
their interpreter controls in both forks. It does not establish application
payoff. Dividing each new request CPU by its own fork's off-minus-on CPU saving
gives about1285-11559 invocations to repay the measured WhiteBox request. The
calculation uses CPU throughout, excludes one-time arena setup, and deliberately
retains first-use request effects. It is not a prediction of a future interpreter-
triggered producer's cost.

These roots are held interpreted with fixed compiled callers/callees. The same
methods might normally reach C1 before that many useful interpreter invocations.
This experiment measures neither that residency nor time-weighted application
coverage. No automatic admission or policy change was added. Cold-field snapshots,
early-return truncation and the sixteen-slot limitation remain separate concrete
coverage/residency constraints. They must be addressed or measured before using
these results to justify an early application tier. The narrower call-continuation
replacement is qualified locally; the original overall compiler goal remains open.

Private evidence is under `/workspace/interpreter-frame-direct-returns/`:
source/images/result/summary/assembly JSON, owned build and qualification logs,
and the frozen matched manifest/classes/dumps/captures. No raw evidence or image
was uploaded, and no public/default/CI action occurred.
