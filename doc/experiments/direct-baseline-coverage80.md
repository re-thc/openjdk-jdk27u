# Direct tier: the 80% coverage gate

At least 80% coverage is a gate before another application-level adoption
comparison. Earlier low-coverage timings remain diagnostic observations about
the partial prototype. They are not a verdict on the complete proposed tier.
No new application timing comparison has been run after this requirement.

The qualified local implementation through `f04c489ef3a` includes casts,
ordinary dynamic calls, constructors, allocation, reference constants, explicit
throws, common array/stack/value operations, switches, verified block states,
backward branches, safepoint polls and ordinary OSR handoff. All thirteen focused
tests pass in release and fastdebug. The last census reaches 73.22% startup /
72.41% warm on its own eligible populations, and 70.09% / 68.12% on the complete
frozen reference populations. The 80% gate remains unmet; application timing
remains held. Test qualification is not a performance claim.

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

The constructor/allocation batch (`7f639b1af47`) reports these additional
coverage-only outcomes, with unchanged thresholds and policy:

| Metric | Startup | Warm |
|---|---:|---:|
| Own eligible population | 3048 | 5693 |
| Eligible methods installed / used | 1873 / 1696 | 3447 / 3384 |
| Own-population method coverage | 61.45% | 60.55% |
| Early Java entries / actual direct entries | 724496 / 351929 | 2769327 / 1605453 |
| Execution-entry coverage | 48.58% | 57.97% |
| Frozen reference methods credited | 1780 / 3056 | 3206 / 5697 |
| Frozen method coverage | 58.25% | 56.28% |

All 2,956/5,438 matchable named reference identities match in the new capture;
100/259 hidden or ambiguous identities remain uncredited in the complete frozen
divisor. The 80% method gate still requires another 665/1,352 credited reference
methods. All counter identities balance and no ordinary admission is missing.
These are entry counts, not workload CPU savings or a throughput verdict.
Temporary census source was restored and the production release library rebuilt.

The next batch is grounded in remaining first failures. Among 2,246 uninstalled
warm eligible methods, 339 stop at reference constants, 520 at an unsupported
opcode, 248 at backward branches and 177 at conservative local merges. Of the
518 unsupported-opcode methods whose original class bytes are available, the
first missing operation is athrow for 154, invokedynamic for 112, aastore for 49,
forward switches for 82, dup_x1 for 38 and bastore for 22. Two unavailable class
identities remain explicitly unclassified. These are first-reason method counts,
not disjoint promises of successful installations: a method may contain more
than one missing operation or encounter later linking restrictions. See the
[opcode ledger](direct-baseline-data/coverage80-after-allocation-opcodes.tsv).

The common-operations batch (`c3451896985`) reports:

| Metric | Startup | Warm |
|---|---:|---:|
| Own eligible population | 3047 | 5696 |
| Eligible methods installed / used | 2012 / 1820 | 3683 / 3605 |
| Own-population method coverage | 66.03% | 64.66% |
| Early Java entries / actual direct entries | 732659 / 386306 | 2893729 / 1793494 |
| Execution-entry coverage | 52.73% | 61.98% |
| Frozen reference methods credited | 1918 / 3056 | 3438 / 5697 |
| Frozen method coverage | 62.76% | 60.35% |

All matchable named reference identities match; the complete frozen divisor
still retains 100/259 uncredited hidden or ambiguous identities. Counter totals
balance and ordinary admission records are complete. Source instrumentation is
removed and production release rebuilt. The 80% method gate still needs another
527/1,120 credited reference methods; new populations do not replace that target.

The verified-join/backward-branch batch (`f04c489ef3a`) reports:

| Metric | Startup | Warm |
|---|---:|---:|
| Own eligible population | 3054 | 5694 |
| Eligible methods installed / used | 2236 / 1972 | 4123 / 4039 |
| Own-population method coverage | 73.22% | 72.41% |
| Early Java entries / actual direct entries | 839527 / 488552 | 3029527 / 2098140 |
| Execution-entry coverage | 58.19% | 69.26% |
| Frozen reference methods credited | 2142 / 3056 | 3881 / 5697 |
| Frozen method coverage | 70.09% | 68.12% |

All named reference identities match; 100/259 hidden or ambiguous identities
remain uncredited in the complete frozen divisor. The fixed 80% method targets
remain 2445/4558, another 303/677 credited methods away. All counter identities
balance, no ordinary admission is missing, and census instrumentation has been
removed with production release rebuilt. Larger own-population entry windows
include changes in ordinary admission timing and are not exclusive interpreter
execution saved. No timed application comparison has been made.

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
not initialize a declaring interface. Interface special calls and
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

## Constructor/allocation batch and independent review

`423448c6ac4` adds ordinary constructor entry and invokespecial chaining. The
normal linked Java call path retains receiver identity, GC roots, exceptions
and subsequent C1/C2 replacement. Constructor returns retain the normal release
ordering for final fields. Object.<init> remains outside direct compilation:
its existing intrinsic/interpreter implementation performs finalizer registration.
The constructor fixture passed on Serial/G1 in release and fastdebug, including
GC in a mixed-tier callee and exceptions after visible constructor side effects.

`7f639b1af47` adds new/newarray/anewarray using the existing Runtime1 allocation
stubs. It has no allocation IR or custom TLAB framework. Allocation metadata
requires resolved/access-checked classes; instance new also requires an
initialized class. Unresolved sites and cold instance initialization retain
whole-method fallback. Reference-array creation does not initialize its
component. Primitive/reference array allocation errors use existing exception
forwarding and the allocation BCI.

At the allocation return PC, expressions describe old_sp for new and old_sp-1
for arrays, with reexecute=false and return_oop=true. Maps retain every existing
canonical oop (including uninitialized aliases), omit the unwritten result, and
rax is spilled immediately after the call. The existing deoptimization machinery
therefore continues after allocation and preserves the returned oop through GC.
The independent read-only source review found no blocking issue in this state,
the stub ABI, constructor ordering, finalizer registration or exception paths.
It checked the actual patch and test fixtures against Runtime1/deoptimization.

All ten focused tests pass on release and fastdebug. The new allocation fixture
covers all primitive array factories, reference/array components without class
initialization, mixed-tier constructor replacement, GC across aliases, throwing
constructors, negative lengths, VM array-limit OOME and cold-instance fallback.
Fastdebug forces reference-array return deoptimization with a live oop beneath
the allocation operands, checks saved-oop trace evidence and bounds allocated
bytes to detect duplicate allocation. Artificial return deoptimization of the
distinct instance-new shape and primitive arrays remains a test limitation.

Review also identified a saved class-resolution-error corner: CI may find a
subsequently defined class by name even when the original CP entry retains an
error. The direct cast path now rejects only the cached-error tag, preserving
normal unresolved-but-loaded cast behavior. A custom-loader regression fixture
first records NoClassDefFoundError, then defines the target class in that loader,
and verifies repeated cast/instanceof still throw and never install directly.

The initial release allocation run failed one test assertion, not VM semantics:
WhiteBox exposes develop flags in product builds, and deoptimizing a live frame
does not make its installed nmethod disappear. The corrected fixture uses the
debug-build property and allocation-return trace evidence instead of compilation
level. That failed run is preserved; the corrected ten-test suites pass on both
builds. The census remains separate and its instrumented time is not performance.

## Common semantics and verified block state

`c3451896985` embeds loaded CI reference constants with the existing oop recorder;
unresolved constants remain refusals. Class constants do not initialize their
class. Explicit athrow uses the normal Runtime1 exception stub, throwing-PC
scope and register/canonical oop maps. Reference stores perform null/bounds
checks before covariance checking, reload operands after the subtype helper,
and use the collector's array-store barrier. Byte/boolean stores retain the
runtime element-type mask; character/short stores preserve truncation. Integer
division uses the standard corrected x86 sequence, including MIN_VALUE/-1;
zero divisors reexecute at the exact bytecode after earlier side effects.
Forward table/lookup switches emit signed key comparisons and real destinations.
Only supported category-1 stack-permutation forms are admitted.

The focused common fixture covers reference identity and roots across GC,
throw/null behavior, once-only side effects, covariance and exception precedence,
old-array/young-reference stores, raw boolean stores, stack permutations,
division/remainder extrema and dense/sparse switch destinations. All eleven
focused tests passed on release and fastdebug. The new test initially referenced
an internal ASM package absent from this JDK; it was corrected to the standard
Class-File API. The failed fixture compilation is retained separately.

`fcaf43e141d` reads already verified StackMapTable block entries with raw
int/object categories, without resolving classes or constructing an IR. At a
join, live locals/stack must match, while verifier TOP locals are dropped from
scope/root state. Null/uninitialized references retain oop categories and their
physical aliases. Old class files without maps retain exact conservative merges.
Unsupported category-2/FP frame types still refuse. The fixture exercises reused
int/object local slots, live roots through a caller deoptimization and GC, and
uninitialized allocation aliases across a conditional constructor argument.
All twelve focused tests pass on release and fastdebug. Its initial driver
initialized WhiteBox before child flags were active; moving initialization to
the child fixed that fixture failure without production changes.

Backward-branch work uses these same typed block states, precise in-method
fault-PC polls and MethodCounters backedge notifications through the existing
Runtime1 helper. The helper already treats direct code as level none and
deoptimizes when ordinary OSR code is available, allowing normal interpreter
migration. No promotion threshold/hold changes are part of this work. The
qualification trace shows direct-to-C1 OSR then C2 OSR; C2 subsequently retired
on an exit uncommon trap. The original post-return OSR-presence assertion was
therefore replaced by observing an active loop. All thirteen focused tests now
pass on release and fastdebug. A separate fixture pins an already installed
direct method during concurrent full GC, exercising backedge-poll root updates
and progress. C1 shares its OSR and normal refusal flag, so the test applies that
pin after direct installation rather than inadvertently suppressing admission.
These fixtures do not change production promotion thresholds or the inherited
hold. Backward switches remain excluded because the existing notification helper
only decodes ordinary branch destinations.

After common operations, 252 warm own-population candidates first refuse at
unresolved allocation classes and 334 at loops. A separate independent review
found a focused lazy allocation resolver viable: an AMD64 Runtime1 stub passes
the original Method/BCI, resolves its actual constant-pool entry (preserving saved
errors and access/loader checks), and performs normal instance initialization or
reference-array creation. Existing allocation-return maps remain unchanged.
It also requires registering the new helper for AOT relocation and guarding the
stub ID on AMD64. This is a concrete next allocation boundary, not permission to
substitute unconditional deopts for missing semantics. Truly unloaded constructor
calls may still fail separately; no coverage gain is assumed before qualification
and a frozen-population census.

## Shortest coherent path toward the gate

1. **Completed first batch:** casts/instanceof and real virtual/interface ICs.
   This captures common erased-generic casts and polymorphic collection/compiler
   calls, rather than accumulating rare integer opcodes. Reference method
   coverage is now 44.08%/38.00%, still well below the target.
2. **Constructors and allocation:** ordinary constructor entry/calls and
   object and primitive/reference array creation are implemented and qualified
   using existing Runtime1/GC contracts. Resolved object constants remain next. Retain normal access, initialization,
   allocation exceptions, barriers and final-field publication. Constructors
   account for 1,021 warm reference methods, so keeping all of them excluded
   cannot be the route to 80%. Object.<init> finalizer semantics remain special.
3. **Complete common stack/value operations:** category-2 long fields, arguments,
   calls, arithmetic and conversions; correct byte/char/short/reference array
   stores, stack permutations, integer division/remainder and forward switches.
   Array stores require covariance checks and collector barriers, not raw writes.
   Update the census after coherent semantic batches, not after each opcode.
4. **State/control coverage:** verified stack-map information for dead/reused
   locals and backward branches with precise maps, polls, counters and ordinary
   OSR handoff are implemented and qualified. Keep a direct canonical frame and a small
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
