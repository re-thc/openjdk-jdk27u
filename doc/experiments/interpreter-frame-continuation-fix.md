# Interpreter-frame continuation correction

Runtime `38b1b63a0ea` removes the C ABI lookup call and normal-path pilot test
counters identified in the [earlier cost check](interpreter-frame-semantic-cost.md).
The correction passes the same release/fastdebug semantic qualification and
reduces some call overhead, but does not establish a consistent execution win.
The new interface case remains slightly slower than its own interpreter
control in all three JVMs. Static, Equals and Assert outcomes are mixed.
A 294.708 us preparation CPU result is retained. No application adoption,
admission, tier-policy, residency or default-enablement change follows.

## Causal code audit before building

The preserved release image was disassembled in a separate diagnostic JVM,
outside performance captures. For the selected successful integer-return,
first-map-row path:

| Executed work | Ordinary interpreter | Old pilot | Corrected normal pilot |
|---|---:|---:|---:|
| Common return epilogue instructions | 13 | 13 | 13 |
| Additional return/dispatch instructions | 4 | 52 plus 50 in C++ | 83 |
| C ABI lookup calls / returns | 0 | 1 / 1 | 0 |
| Pilot continuation atomic updates | 0 | 1 | 0 |
| Pilot entry-hit updates | 0 | 1 | 0 |

These are executed static-instruction counts for a declared path, not hardware
retired instructions or cycles. The old encoded return has two stack-alignment
call alternatives, only one of which executes. The C++ helper contains an
unconditional `lock xadd` for a test diagnostic and repeats ownership and
enablement checks already performed by the generated stub.

The leaf was a C ABI call with stack alignment, not a Java frame allocation or
VM-state transition. Interpreted/compiled/native callee adapters, entry barriers,
saved invoke BCP, last_sp, argument removal and result profiling are the same
normal interpreter machinery before and after the correction. The old timed
call shapes recorded one native continuation per invocation, so fallback does
not explain their original regressions. Memory-stack result materialization,
BCP stores and the final interpreted return still contribute execution work.

The existing scalar lookup is now emitted directly in the shared return
codelet. It keeps old/obsolete rejection, owned counters, enablement, real poll,
interpreter-only and JVMTI/breakpoint checks, acquire entry publication,
arena/alignment checks, actual method BCI bounds, count/size bounds, bounded
map search and native-offset validation. No VM/callee boundary separates the
remaining ownership check from the lookup, so the duplicate reload/check is
unnecessary. The live interpreter frame retains metadata lifetime. No new
cache, metadata format, dispatch framework or allocation is introduced.

`InterpreterFramePilotTestContinuations` is an explicit startup diagnostic
option, default false. With WhiteBox enabled it generates continuation counters
and their entry-hit controls. Normal generated code has no counter address,
update, option load or option-selection branch. Correctness fixtures opt in;
ordinary invocation/profile counters remain unchanged. The separate counted
configuration has one atomic update; it is not the new timing configuration.

Inlining increases the first integer-return encoding from 411 to 566 bytes;
all shared return code grows from 2,776 to 3,704 bytes (3,816 with counters).
The existing startup headroom and sixteen immutable slices are unchanged.
All five per-method bodies still total 1,726 bytes. This trades shared code
bytes for removal of a call boundary and redundant work, not a code-size win.

## Qualification and process state

Both coherent images pass all eleven existing focused files: pilot, reference,
static/special, virtual/interface and guard fixtures, the five DirectBaseline
regressions, and InterfaceObjectMethodTest. An extra fastdebug invocation of
both call fixtures passes VerifyOops, VerifyActivationFrameSize,
VerifySecondarySupers, VerifyDataPointer, TypeProfileLevel=222,
TypeProfileArgsLimit=16, TypeProfileWidth=8 and software popcount.

Thus suspended caller roots, moving GC, typed/native/compiled callees,
deoptimization, exceptions, disablement, old-frame redefinition, breakpoint/
poll/tooling fallback and profiling controls remain qualified. The interface
MDO oracle is A24/B24 on release, fastdebug and maximal verification. An
additional untimed twin of the measurement shapes checks 10,000 native entries
each and 10,000 native continuations for each call-bearing case. Counters are
explicitly enabled only for that control; the normal timing paths are verified
counter-free in actual generated code.

The first release compile failed on two protected assembler APIs. Public
decrement/increment helpers corrected that, and the retry reused completed
objects. Shared-header dependents were rebuilt coherently; release retry and
fastdebug completed in 329 and 869 seconds respectively. Landed PR104 logging
and owned subreapers reaped build children. There were no new persistent
zombies, OOM events or duplicate builds/captures. A parent task-service capacity
failure was recovered by reading source, process state and completed results;
no operation remained running or uncertain.

## One bounded matched rerun

Six release JVMs form three adjacent old/new pairs, alternating image order.
They use identical fixture bytes and the same five cases, inputs, fixed-tier
controls, 500,000-call windows and rotated case/window orders as the earlier
check. All 30 requests and 120 windows remain. No extra fork followed an
unfavorable result. All builds and qualification activity had stopped.

The old image necessarily retains its always-on pilot counters. The new image
uses normal uncounted code; the combined correction is measured, not separate
CPU shares for inlining and counters. All callers/callees retain their checked
C2 levels, selected roots remain interpreted and cannot inline, and compilation
time counters do not advance during any capture. That coarse counter is not
proof of zero compiler CPU. These are fixed-tier bytecode controls, not an
application benchmark or a settled-throughput qualification.

New-image requesting-thread CPU ns/invocation, disabled -> on:

| Case | p0 | p1 | p2 |
|---|---:|---:|---:|
| Real TypeTag predicate | 23.719 ->16.270 | 21.753 ->16.844 | 23.983 ->16.909 |
| Real Objects.equals | 39.859 ->36.921 | 37.252 ->38.421 | 41.510 ->40.633 |
| Real nonnull Assert helper | 13.875 ->13.845 | 14.944 ->13.763 | 16.616 ->17.134 |
| Static call with post-call arithmetic | 31.181 ->30.899 | 30.511 ->33.103 | 30.542 ->33.564 |
| Interface call with post-call arithmetic | 29.009 ->29.134 | 29.662 ->30.299 | 30.186 ->30.846 |

Wall directions agree for every new-image comparison. Interface on CPU is
1.211–6.258 ns lower than its paired old on result; its within-image saving
improves by 0.362–5.517 ns. Nevertheless it still loses 0.125–0.660 ns against
its new interpreter control. Other paired on results include regressions:
p2 Equals +2.616 ns, Assert +3.083 ns, Static +0.162 ns, and Tag +0.280/+0.797 ns
in p1/p2. Baseline/image variation is visible and cannot be assigned entirely
to the source correction. The old rerun also has a tiny positive Equals saving
in one fork; the original adverse `315fa3b2411` evidence is preserved separately.

Complete new preparation requests, requesting-thread CPU us in p0/p1/p2:

| Case | CPU us |
|---|---|
| Tag | 14.471 / 6.710 / 294.708 |
| Equals | 11.547 / 4.877 / 7.020 |
| Assert | 13.240 / 20.550 / 11.688 |
| Static | 4.186 / 10.216 / 3.876 |
| Interface | 3.035 / 3.535 / 10.355 |

Full new wall range is 2.484–291.668 us. The late Tag outlier is also inside
the narrower WhiteBox boundary: 288.969 us CPU /289.255 us wall, with no
MethodCounters allocation reported. Its precise cause is not identified by
these observation-free records. It is not discarded or attributed to the new
lookup, which executes later during calls. No new instrumentation/timing
campaign was launched to explain it.

New arena setup CPU is 19.889/17.747/18.357 us, versus paired old
18.368/18.538/17.957 us. The enclosing interpreter blob still requests 404,416
bytes; these nested cuts exclude shared-code generation and do not establish
incremental feature startup cost. Request costs include the WhiteBox interface,
not just a normal interpreter-triggered producer that does not yet exist.

Tag's same-JVM CPU repayment is 1,943/1,367/41,664 calls, compared with twelve
retained startup pre-admission entries. Positive Equals cases need 3,930/8,003
calls versus 255 such entries; one Equals case has no repayment. Assert's
positive quotients are 431,608/17,401 versus 895 entries, with one negative case.
The only positive Static result needs 14,834 calls; Interface has no positive
repayment. These are CPU/CPU illustrations on targets deliberately held
interpreted, not admission thresholds or application projections.

## Remaining structural boundary

The real-method acceptance check is unchanged: nineteen of 24 requests publish
prefixes, seven emit all nonreturn instructions, twelve truncate, five refuse.
`JrtPath.isAbsolute` stops after aload_0 before its unusable path getfield;
normal interpretation can resolve that field later, but the immutable prefix
cannot grow. `CodeSourceKey.equals` stops at BCI 6, the identity-path return;
its nonidentity branch reaches interpreted code despite supported calls later.
Those are accidental coverage boundaries, not missing C1 optimization passes.

A further integration cost is absent-successor return handling. For example,
BasicImageReader.getLocation calls readFrom and immediately returns: its map
has no native post-call target. It still selects a pilot return, performs the
extra checks/lookup and falls back to ordinary return dispatch. The measured
call shapes have real post-call work, so this does not explain their numbers;
it matters when translating the old possible-method ceiling into useful work.

The present map protocol still needs 83 additional instructions where ordinary
dispatch needs four. Thirty-three instructions are the retained poll/mode/
capability/breakpoint guard sequence. Scalar lookup and validation, canonical
stack traffic and BCP bookkeeping are integration costs of this design; some
may be avoided by a call-site return that already knows its continuation.
GC roots, normal return profiling, frame/unwind semantics and fresh safety
decisions remain obligations, not optimization toggles.

The next bounded design should eliminate pilot-return lookup when no native
successor exists, then determine whether a call-site-specific continuation can
avoid lookup for real successors without adding stack words, weakening guards,
embedding metadata or duplicating large return code. Cold-field late checks
and continuation past early ordinary returns remain the corresponding semantic
coverage proposal. None is silently implemented here. Residency/admission
changes remain deferred; the frozen possible-method counts and CPU-coverage
limitations have not changed, and neither this correction nor a new threshold
establishes overall payoff.

## Retained evidence

`71a7ec33d54` and `315fa3b2411` remain preserved. Qualified release libjvm is
`6580c63b5e4a6fb9a7374398da0309d26348a2ed8c3b9ab6ac08a3dac84176b3`;
fastdebug is
`999036afac8047ab614c91d2c7b649163468bbdf6b8e43d0937fa221b6738acf`.
See normalized [code audit](direct-baseline-data/interpreter-continuation-fix-code.tsv),
[qualification](direct-baseline-data/interpreter-continuation-fix-checks.tsv),
[all windows](direct-baseline-data/interpreter-continuation-fix-samples.tsv),
[execution](direct-baseline-data/interpreter-continuation-fix-execution.tsv),
[pairs](direct-baseline-data/interpreter-continuation-fix-pairs.tsv),
[requests](direct-baseline-data/interpreter-continuation-fix-requests.tsv),
[queries](direct-baseline-data/interpreter-continuation-fix-queries.tsv),
[startup](direct-baseline-data/interpreter-continuation-fix-startup.tsv)
and [identities/settings](direct-baseline-data/interpreter-continuation-fix-settings.tsv).
The [untimed flow control](support/interpreter-frame-pilot/InterpreterFrameSemanticFlowCheck.java)
is retained beside the updated fixed-case harness. Raw logs, code bytes,
addresses, images and scripts remain private under
`/workspace/interpreter-frame-continuation-fix`.
