# Interpreter-frame ordinary-call semantic checkpoint

Runtime `2cba257c845`, with qualified test source `f1353df6b5c`, completes the
approved category-1 ordinary-call batch from
[the semantic plan](interpreter-frame-semantic-plan.md). It extends the
[reference/field/forward-branch foundation](interpreter-frame-category1.md)
and [static/special caller continuation](interpreter-frame-direct-calls.md)
with ordinary virtual and interface dispatch. Preparation remains explicit
WhiteBox control. No admission, C1/C2 policy, default or public state changed;
no application census or performance measurement was run.

A later [bounded cost and real-method check](interpreter-frame-semantic-cost.md)
uses this preserved image. It finds call-bearing execution regressions and
substantial prefix truncation; the semantic qualification does not establish
application payoff.

## Runtime contract

Virtual/interface sites use the same resolved interpreter entries and dispatch
logic as ordinary templates, factored into explicit assembler/opcode helpers.
Ordinary wrappers select their original return tables; pilot invokes select
separate shared return codelets. Generation neither enters TemplateTable's
global descriptor/assembler state nor copies existing machine bytes. There is
no C1 IR, CI environment, compiler register allocator, direct-call IC or nmethod
installation. The suspended caller and its return PC remain interpreter frames
inside the recognized InterpreterCodelet arena.

An acquire-published actual-opcode cache entry must be present before the pilot
consumes it: bytecode2 for virtual and bytecode1 for interface. The pilot gate
checks supported result type, receiver null and unsupported appendix/local
signature/reference flags before operand or profile effects. Interface checks
precede loading REFC into rax, which the gate uses as scratch. Virtual dispatch
may contain table index zero rather than a Method pointer. A null-Method test
there would incorrectly reject a valid site.

The original virtual-final, vtable, forced-virtual Object, private/default
interface, itable, access and abstract-method paths remain authoritative.
After prepare_invoke has committed the call/profile state, dispatch failures
use the existing exception cleanup, including the artificial return PC and
saved invoke BCP. They do not fall back and replay the call. An unresolved or
unsupported site instead dispatches the untouched instruction before those
effects; an ordinary resolution can make a later invocation usable.

Pilot return entries now cover both three-byte and five-byte invokes, with
int/narrow-int, oop and void results. The existing epilogue restores last_sp,
BCP and locals, records return types, removes arguments and handles tooling
return requests. Only then does it canonicalize the result, advance/save BCP,
recheck owner/enablement/poll/tooling and look up a continuation. The immutable
BCI/native-offset map, bounded leaf lookup, old/obsolete checks and release
publication are unchanged from the static/special checkpoint. All callee
entry barriers and compiled/interpreted/native adapters remain normal HotSpot
paths. No metadata pointer is embedded in a method slice.

The method arena is still sixteen immutable 4 KiB slices with no recycling;
each slice includes its existing 264-byte scalar map reservation. Shared
invoke/return code has a separate checked 64 KiB startup headroom budget.
Independent source review approved the dynamic-call source and fixture before
execution, including the zero-index virtual case, interface register lifetime,
post-profile error cleanup and five-byte return advance.

## Qualification

Incremental release and fastdebug builds passed. Current runtime sources are
identical to `2cba257c845`; subsequent commits only strengthen tests. The final
release image passes all eleven focused files, and the final fastdebug image
passes the same eleven:

| Group | Files | Release | Fastdebug |
|---|---:|---|---|
| New virtual/interface dispatch fixture | 1 | pass | pass |
| Existing InterfaceObjectMethodTest | 1 | pass | pass |
| Pilot/reference/static-special/guard fixtures | 4 | pass | pass |
| Existing DirectBaseline test, instance, long, handler and stale-install regressions | 5 | pass | pass |

The new dispatch fixture has six interpreted-control children (three explicit
producer modes with Serial and G1) and one mixed C1/C2 child. Fourteen of sixteen
slices are used. Checks include:

- Virtual overrides, virtual-final calls, default/private interface methods,
  ordinary itable dispatch and forced-virtual Object methods.
- Real work after each call, with the separate native-continuation counter
  proving a return into generated caller code rather than a tail call.
- A sole suspended caller-local oop across moving GC, plus a distinct oop
  return, void return and narrow boolean return through five-byte invokes.
- Interpreted, C1 and C2 targets, compiled callee exceptions, deoptimization
  back to interpreted targets and exactly-once target side effects.
- Unresolved fallback, null receivers, cached wrong-REFC ICCE, ordinary itable
  ICCE/AME and forced-virtual IllegalAccessError/AbstractMethodError, followed
  by successful cached recovery.
- The retained javac `Assert.checkNonNull(Object, Supplier)` helper: common
  nonnull result and two error paths, including a cached Supplier call that
  returns into generated cast/error code. Its 895 startup entries in the old
  census motivate the case; this is not a new execution-coverage measurement.

The normal-policy child asserts that interpreter profiling is enabled and
selected roots have MDOs; roots cannot compile or inline. The exact receiver
profile oracle passes on both images: A24 and B24. This includes normal calls,
callee throws, compiled targets and post-deoptimization execution, and would
detect replayed/doubled receiver updates. The maximal-width verification run
also records the missing-method receiver once. The -Xint controls are not used
as evidence of MDO correctness because -Xint disables interpreter profiling.

One additional fastdebug dispatch-fixture run passed with VerifyOops,
VerifyActivationFrameSize, VerifySecondarySupers, VerifyDataPointer,
TypeProfileLevel222, TypeProfileArgsLimit16, TypeProfileWidth8 and software
popcount. This checks the enlarged shared-stub budget and optional helper paths;
it is not a timing result. The previously qualified static/special maximal
verification run remains preserved rather than repeated without cause.

The unchanged guard, reference, call and pilot fixtures also pass on these
images. They retain late-breakpoint and forced-poll fallback, active caller
GC/frame walking, recursion/blocking, native callees, active deoptimization,
old-frame redefinition, unloading, concurrent publication and C1 handoff
controls. JVMTI capability acquisition and JFR still force conservative
fallback. These checks do not claim debugger operation inside active generated
codelets under unsupported capabilities, and no exclusion was bypassed.

## Provenance and limits

Release libjvm SHA-256 is
`2f80b2e16c709fa384d3438c04d16e803d0a3d499f89a3842ab176c17e3c44be`;
fastdebug is
`385e5bb019a9f737e0e5b7910894a733fa5d4d3e467dfeeee4f7ce5c6f11db82`.
Private commands, exit results, resource samples, jtreg reports and images are
retained under `/workspace/interpreter-frame-stage-b2`. Prior category-1,
static/special, integer-pilot and nmethod-compiler checkpoints/images are
preserved. Landed PR104 synchronous logging remains a separate build
prerequisite, with owned subreapers reaping build/logging children.

A multi-test tool session expired after the guard group, before the final
baseline group started. Saved results and live process state were checked;
only the unstarted group was resumed. Three adopted sandbox wrapper zombies
were added by that session. Subsequent individually bounded test commands
completed without further zombies. There is no live build/test operation or
pending approval; about 3 GiB disk remains free. No preserved evidence was
deleted.

This completes the approved semantic batch, not the original application-payoff
goal. Sixteen explicit slots do not establish residency or workload coverage.
The plan's 841 startup caller ceiling for fields/references/forward branches
and 2,842 with ordinary calls remain conditional syntactic counts from retained
inputs, not newly installed methods, CPU weights or an 80% claim. Cold field
sites still end a prefix; early ordinary returns and unsupported instructions
can end emission before later forward paths. Ordinary returns themselves use
polling interpreter dispatch. Arrays, backward loops, field writes, allocation,
constructors, new handler support, category-2/FP and automatic admission remain
outside this batch. Existing conservative collector/tooling restrictions and
all runtime guards remain.

Generated continuation lookup, repeated guards, canonical stack traffic,
profiling and interpreter oop-map misses still cost time. Native-continuation
counting is a retained atomic diagnostic, not a proposed final production cost.
No new speedup, settled-throughput, cheap-tier cost or application-coverage
claim follows from these correctness results. A later representative residency,
admission and pre-C1 time-attribution design remains necessary before an
application-level verdict.
