# Direct tier: the 80% coverage gate

At least 80% coverage is a gate before another application-level adoption
comparison. Earlier low-coverage timings remain diagnostic observations about
the partial prototype. They are not a verdict on the complete proposed tier.
No new application timing comparison has been run after this requirement.

The current local implementation, `0c9ae524ff5`, adds real checkcast/instanceof
semantics and ordinary virtual/interface calls through HotSpot's normal inline
cache path. All seven focused tests pass on release and fastdebug. Coverage
increased substantially, but remains below 80%.

## Fixed scope and denominators

The census uses the same pinned CompilerWorkload startup and warm callers,
common runtime, threshold 32, shared worker and ordinary-tier policy as before.
It records Java bytecode entries through the normal interpreter and direct
entry paths until the first ordinary compile request, including OSR. Native
bodies and pre-existing VM intrinsic entry stubs are outside Java bytecode
interpretation; the census does not claim to measure their calls. It also does
not measure executed bytecode counts, inlined bodies or CPU-weighted coverage.

An eligible method is a distinct Java bytecode Method that reaches 32 counted
entries before ordinary admission. Constructors, handlers, synchronized
methods, size/type bounds, missing operations, and other current exclusions
remain in this denominator. Eligibility does not mean "already supported by
the emitter." Methods below 32 entries are retained in the census and in the
execution-entry denominator, not silently discarded.

Method coverage reports successful direct installations over eligible methods.
Useful-method coverage separately counts methods with actual direct entries.
Execution-entry coverage reports actual direct entries divided by all counted
interpreter plus direct entries before ordinary admission, including the first
32 entries and short-lived methods. Starting in direct code is not proof that
an entire invocation completed there; guard deoptimizations/exceptions must
remain separately accounted for as coverage grows. The census's supplemental
after-32 counts do not replace the broader execution denominator.

The original eligibility populations are frozen for comparison: 3,056 startup
and 5,697 warm methods at `5ab2a6de65d`. New variant populations are also reported,
so earlier ordinary admission cannot improve the apparent percentage by
shrinking a divisor. For cross-process matching, unique named methods must also
match code size/access flags in the identical common runtime. Ambiguous or
hidden identities remain in the frozen denominator and are conservatively
uncredited until resolved. This is not an exclusion that makes the goal easier.
The eventual 80% method gate requires at least 2,445/4,558 covered reference
methods. Execution-entry coverage remains a separate reported requirement;
its threshold must not be conflated with method or opcode coverage.

## Observed coverage

| Coverage-only capture | Reference startup | Extended startup | Reference warm | Extended warm |
|---|---:|---:|---:|---:|
| Eligible methods in that capture | 3056 | 3047 | 5697 | 5693 |
| Eligible methods installed | 846 | 1397 | 1246 | 2287 |
| Eligible methods actually used | 810 | 1280 | 1230 | 2254 |
| Capture's method coverage | 27.68% | 45.85% | 21.87% | 40.17% |
| All early Java entries | 708008 | 713552 | 2543069 | 2697938 |
| Actual direct entries | 174156 | 264366 | 431989 | 1022856 |
| Execution-entry coverage | 24.60% | 37.05% | 16.99% | 37.91% |

Using the complete frozen reference divisor and crediting only matched named
methods, the extension reaches 44.08% startup / 38.00% warm. It credits
1,347/2,165 reference methods; 100/259 hidden or ambiguous reference identities
remain uncredited rather than being removed. Both presentations remain below
the gate. See [all counts](direct-baseline-data/coverage80-census.tsv) and the
[frozen comparison](direct-baseline-data/coverage80-frozen-reference.tsv).

The first 32 entries and short-lived methods constrain execution coverage.
Perfect service after entry 32 could cover at most 81.37% of the reference
startup entries and 92.29% of its warm entries. These are ceilings for those
recorded windows, not universal limits: the inherited 512-call hold can extend
ordinary admission when more methods execute directly. Do not count that
extension as exclusive interpreter work saved. The narrower after-32 share may
help diagnose latency but cannot be substituted to claim 80% broader coverage.

The following disjoint first-reason categories show why a cast-only patch
cannot reach the target. Constructor precedence keeps a constructor with a
handler in the constructor category; these categories are not overlapping
opcode counts.

| Reference eligibility category | Startup | Warm |
|---|---:|---:|
| Installed | 846 | 1246 |
| Constructor | 412 | 1021 |
| Handler-bearing method | 130 | 306 |
| Synchronized | 8 | 19 |
| Size/local/stack bounds | 25 | 57 |
| Intrinsic-marked root | 63 | 93 |
| Other semantics, state or admission | 1572 | 2955 |

See the [retained exclusion ledger](direct-baseline-data/coverage80-exclusions.tsv).
Not all intrinsic-marked Java bodies are ordinary bytecode semantics: for
example Object.<init> has finalizer registration obligations. Those cannot be
made eligible by simply removing the intrinsic check.

## What is implemented and qualified

`5ab2a6de65d` defers rich signatures for loaded direct CI methods and requests
plain-call lookup without unnecessary parameter-class queries. Full CI queries
still build real accessing-loader-aware signatures; ordinary C1/C2 and unloaded
methods remain eager. Six direct tests plus two unloaded/polymorphic-signature
checks pass on release and fastdebug. Debug first caught a nested VM transition,
then a lazy signature query under tty_lock; both were fixed and failed runs
retained. The final trace path uses the already prepared descriptor symbol.

Four interleaved no-print service captures give 30.548/36.286 ms for the
worker-front control and 33.446/32.454 ms for lean signatures. Successful-task
CPU is 22.948/27.864 versus 25.110/25.109 ms. These overlap and do not establish
a material successful-path speedup. The fine lean capture shows root setup
0.750 ms, operands 2.740 ms and registration 7.653 ms for 844 successes.
Those are instrumented, inclusive observations, not additive lower bounds or
an application verdict. [All outcomes](direct-baseline-data/accepted-lean-service.tsv)
are preserved; cost instrumentation is removed and source rebuilt.

`0c9ae524ff5` implements checkcast/instanceof directly. The state pass retains
object categories; emission looks up only the cast class and requires loaded,
accessible metadata. It does not require or trigger class initialization. Null
casts succeed unchanged and null instanceof returns zero. Normal primary and
secondary subtype helpers handle classes, interfaces and arrays. A failed cast
deoptimizes/reexecutes at the cast BCI, preserving canonical roots and prior
side effects. This is runtime semantic fallback, not suppression of the method.
Unloaded/inaccessible target classes still cause safe whole-method refusal.

Virtual/interface calls retain Java argument conventions, null checks and
precise call maps. Non-statically-bound calls use the existing virtual-call
relocation, IC and resolve stub. Abstract declarations are valid dynamic targets;
actual method selection and errors remain with the normal runtime. Static
initialization checks apply to static calls; instance/interface invocation does
not initialize a declaring interface. Interface special calls, constructors,
appendix/signature-polymorphic forms and scoped/Continuation restrictions remain
explicit fallbacks. No C1 IR, inlining or register-allocation framework is used.

The new fixture exercises C1/C2 polymorphic targets, interface initialization
rules, nulls, class/array casts, different loaders defining the same class name,
repeated failures with once-only side effects, precise GC roots across dynamic
calls, callee replacement and both secondary-super implementations under
Serial/G1. Debug caught the subtype helper's reserved rcx constraint; emission
now uses r8 for the target klass and all seven tests pass on both builds.
See [qualified checks](direct-baseline-data/coverage80-tests.tsv).

The diagnostic census uses fixed BSS rows and atomic counters, indexed through
the existing diagnostic MC slot. It does not add a production MethodCounters
field. It counts at the interpreter's body-dispatch point, reloading Method
from the frame because synchronized locking clobbers rbx, and at direct body
entry. It stops before ordinary admission and separately records installations,
actual use, metadata flags and failures. A sanity program verifies exactly
64 entries each for ordinary, synchronized, constructor and handler methods
with direct off/on. All counter identities and totals balance; there are no
missing admission records. It pins Symbol strings for offline identity, not
classes. Instrumented elapsed times are not performance results. The census
patch/header is private and removed after each capture, with production rebuilt.

## Shortest coherent path toward the gate

1. **Completed first batch:** casts/instanceof and real virtual/interface ICs.
   This captures common erased-generic casts and polymorphic collection/compiler
   calls, rather than accumulating rare integer opcodes. Reference method
   coverage is now 44.08%/38.00%, still well below the target.
2. **Constructors and allocation:** implement ordinary constructor entry/calls,
   object and primitive/reference array creation using existing Runtime1/GC
   contracts, and resolved object constants. Retain normal access, initialization,
   allocation exceptions, barriers and final-field publication. Constructors
   account for 1,021 warm reference methods, so keeping all of them excluded
   cannot be the route to 80%. Object.<init> finalizer semantics remain special.
3. **Complete common stack/value operations:** category-2 long fields, arguments,
   calls, arithmetic and conversions; correct byte/char/short/reference array
   stores, stack permutations, integer division/remainder and forward switches.
   Array stores require covariance checks and collector barriers, not raw writes.
   Update the census after coherent semantic batches, not after each opcode.
4. **State/control coverage:** use verified stack-map information for dead/reused
   locals at joins; add backward branches with precise maps, progress polls,
   counters and ordinary OSR handoff. Keep a direct canonical frame and a small
   typed state, not C1 IR or a generic optimizer. Handler/monitor/large-method
   support remains visible in the denominator; implement it if the remaining
   excluded population prevents the gate rather than reclassifying it away.

The next allocation/constructor boundary warrants independent contract review:
new-instance stub state before/after allocation, oop return/deoptimization
reconstruction, uninitialized-reference aliases, constructor exception order,
final-field release and Object.<init> finalizer registration. Normal subtype/IC
helpers are already reused without taking their IR frontend; allocation needs
the same level of precision. This is a technical review question, not an
approval request or a reason to stop independent coverage work.

Making the subset cheap and covering useful execution are separate requirements.
The measured request/service/install gap remains large. More semantic coverage
will compile more bodies and cannot itself prove a cheap tier. Conversely,
partial-prototype timings cannot decide adoption of the proposed wider tier.
The 80% gate is not met, thresholds/hold/defaults are unchanged, and no new
application timing campaign or public action is authorized or performed.
