# Direct tier: the 80% coverage gate

At least 80% coverage is a gate before another application-level adoption
comparison. Earlier low-coverage timings remain diagnostic observations about
the partial prototype. They are not a verdict on the complete proposed tier.
No new application timing comparison has been run after this requirement.

The qualified local implementation through `4f770550606` supports direct
int/long/reference bytecode emission, ordinary calls/constructors, allocation,
verified joins, backward branches and Java exception handlers. All fifteen focused
tests are qualified in release and fastdebug; the earlier G1 AOT code-cache smoke
also passes. The latest frozen method coverage is 82.89% startup / 81.34% warm.
Actual early-entry coverage is 68.51% / 81.13%. **The startup execution-entry gate
remains unmet and application timing is held.**
The method denominators remain 3,056/5,697; 2,445/4,558 are target counts, not
replacement denominators. No default or public change is made.

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

The latest handler batch (`4f770550606`) reports:

| Metric | Startup | Warm |
|---|---:|---:|
| Own eligible population | 3053 | 5700 |
| Eligible methods installed / used | 2628 / 2324 | 4882 / 4776 |
| Own-population method coverage | 86.08% | 85.65% |
| Early Java entries / actual direct entries | 830224 / 568804 | 3326119 / 2698402 |
| Execution-entry coverage | 68.51% | 81.13% |
| Frozen reference methods credited | 2533 / 3056 | 4634 / 5697 |
| Frozen method coverage | 82.89% | 81.34% |

All 2,956/5,438 matchable named reference identities match; 100/259 hidden or
ambiguous identities remain uncredited in the original complete denominators.
The frozen targets of 2,445/4,558 are exceeded by 88/76 methods. This does not
satisfy the separate startup execution-entry gate. Counter identities balance
and no ordinary admission is missing. The private census patch was removed and
production release rebuilt. The following tables retain earlier batches rather
than replacing adverse or incomplete outcomes.

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

The lazy allocation-resolution and long batches report:

| Metric | Lazy startup | Long startup | Lazy warm | Long warm |
|---|---:|---:|---:|---:|
| Own eligible population | 3052 | 3054 | 5701 | 5698 |
| Eligible methods installed / used | 2416 / 2160 | 2563 / 2309 | 4402 / 4287 | 4714 / 4621 |
| Own-population method coverage | 79.16% | 83.92% | 77.21% | 82.73% |
| Early Java entries | 804315 | 819849 | 3067326 | 3120612 |
| Actual direct entries | 509249 | 559960 | 2232803 | 2444622 |
| Execution-entry coverage | 63.31% | 68.30% | 72.79% | 78.34% |
| Frozen reference methods credited | 2319 / 3056 | 2467 / 3056 | 4155 / 5697 | 4467 / 5697 |
| Frozen method coverage | 75.88% | 80.73% | 72.93% | 78.41% |

Sources are `7c2dd4b026f` (lazy resolution) and `5d1c9676077` (long values).
The long capture matches all 2,956/5,438 named reference identities; 100/259
hidden or ambiguous identities remain uncredited in the complete frozen divisor.
Startup exceeds its 2,445-method target by 22, while warm remains 91 methods
short of 4,558. Own-population percentages above 80% do not satisfy the frozen
warm target or the separate actual early-entry requirement. All counter
identities balance with zero missing admissions. Both census patches have been
removed and production release rebuilt.

## What still executes in the interpreter

The handler capture adds no-print phase counters to distinguish accepted-method
queue exposure from unsupported code. The following disjoint ledger uses all
830,224/3,326,119 early Java entries, including short-lived methods:

| Entry share | Startup | Warm |
|---|---:|---:|
| Actual direct entries | 68.512% | 81.128% |
| Initial 32 interpreted entries | 15.890% | 5.901% |
| Accepted method before enqueue or after a bypassed notification | 0.245% | 0.065% |
| Accepted method waiting in queue | 4.745% | 1.440% |
| Accepted method compiling/installing | 0.208% | 0.059% |
| Interpreter body entered after installation | 0.020% | 0.008% |
| Refused unsupported/unresolved/restricted body after 32 | 8.620% | 10.060% |
| Not queued: runtime policy or unknown bypass | 1.043% | 0.998% |
| Queued/selected/discarded without a final install outcome | 0.716% | 0.341% |

"Accepted" means eventually installed by the snapshot. Phase counters observe
the interpreter body-entry point; they measure invocation exposure, not elapsed
time or CPU. In particular, the tiny post-install bucket can contain activations
already entering the interpreter and cannot all be called deoptimization.
Likewise zero body entries during a request callback does not mean zero request
CPU: the callback runs before that body entry. The undecided/outcome and bypass
buckets remain separate rather than being relabeled as unsupported code.
The [exact loss ledger](direct-baseline-data/coverage80-handler-phase-loss.tsv)
and [phase counts](direct-baseline-data/coverage80-handler-phase-counters.tsv)
retain the counts and full denominators.

Startup needs another 11.488 percentage points of actual direct entries. Even
eliminating all accepted-method queue and compile/install exposure would add
only 4.953 points in this recorded window. The initial-32 policy leaves a
capture-specific ideal ceiling of 84.110%, so reaching 80% also requires covering
most remaining useful execution and reducing service lag. Thresholds and the
inherited ordinary-tier hold are unchanged. Counter overhead and changed
ordinary-admission windows prevent treating these differences as exclusive
interpreter work saved or a performance result.

The remaining startup after-32 body refusals include 24,422 entries at
unresolved/unsupported calls (2.942% of all entries), 16,811 intrinsic-root
entries (2.025%), 8,552 unsupported-opcode entries (1.030%), 5,279 field entries
(0.636%) and 4,911 cast entries (0.592%). Size, method shape, interface-special,
synchronization, MDO/admission and unresolved outcomes remain visible in the
[remaining-category ledger](direct-baseline-data/coverage80-handler-remaining.tsv).
These are first-failure categories, not guaranteed gains from removing one test.
Intrinsic bodies need semantic review, including finalizer/reachability duties.
The next structural questions are FIFO selection cost and avoiding rich CI
wrappers for already resolved plain calls. Neither justifies widening unresolved
appendix/signature-polymorphic forms or changing admission policy blindly.

The following long-only ledger is historical, before handler support:

The retained long census provides this disjoint entry ledger. Percentages use
each capture's full early Java-entry denominator, including below-threshold
methods. It measures entry locations, not CPU, completed invocations or exclusive
interpreter work saved.

| Entry share | Startup | Warm |
|---|---:|---:|
| Actual direct entries | 68.30% | 78.34% |
| First 32 entries, including short-lived methods | 16.10% | 6.29% |
| Interpreted after 32 in methods eventually installed | 4.23% | 1.25% |
| Handler-bearing methods after 32 | 3.36% | 5.10% |
| Unresolved/unsupported calls after 32 | 2.08% | 1.85% |
| Intrinsic-marked roots after 32 | 1.97% | 1.15% |
| Remaining refusals/restrictions/admission after 32 | 3.96% | 6.03% |

No direct entry occurs within the first 32. The installed-method interpreter
bucket combines possible service/install lag, deoptimization/reentry and late
installation relative to ordinary admission; these aggregate counters cannot
assign one cause to all of it. Handler entries are the next largest missing
semantic group in warm execution. Covering them is a useful next batch, not a
promise that every such method becomes compilable or that its entries save CPU.
Startup also needs attention to unresolved calls and installation/use timing;
method-count tuning alone cannot close its 11.70-point actual-entry shortfall.
The [complete ledger](direct-baseline-data/coverage80-entry-loss-long.tsv)
retains smaller categories and exact entry counts. Thresholds and the inherited
ordinary-tier hold remain unchanged.

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

## Qualified lazy resolution and category-2 values

`7c2dd4b026f` resolves cold new/anewarray operands through the original Method
and bytecode BCI in one focused AMD64 Runtime1 helper. It holds Method/CP/class
metadata across GC, calls the real CP resolver (including saved failures and
loader/access checks), checks instance validity before initialization, and never
initializes array components. Already resolved/initialized sites retain existing
Klass-based stubs. Return maps and immediate oop spilling are unchanged. A
reviewed AMD64 stub declaration and AOT external-address registration preserve
stub enumeration and archive relocation. This removes eager refusal at cold
allocation sites; it does not widen unrelated constructor/call restrictions.

All thirteen direct tests pass in release and fastdebug. Coverage includes cold
successful/failing initialization exactly once, unresolved reference arrays,
cached class-resolution and access errors, GC aliases, and allocation-return
deoptimization. Fastdebug now forces the distinct instance-new return shape,
checks constructor/init effects and exact thread allocation bytes, and retains
the reference-array return stress. This closes the earlier instance-return test
gap. A fixture initially shadowed a local variable; that Java compilation failure
is retained separately and corrected. The existing AOTCodeTest#g1 passed with
the new Runtime1 stub/helper, including serialization and loading of C1 blobs.

`5d1c9676077` represents a long as [T_LONG,T_VOID] Java slots, with its64-bit
payload in the first canonical8-byte cell. The companion is never read as a
value or mapped as an oop. Signatures, arguments, stack depths and local indices
count Java slots; the ordinary x86 Java convention assigns each long one64-bit
ABI location and skips synthetic VOID moves/pops. Scope data encodes constant0
then Location::lng, preserving interpreter reconstruction. Verified frame
append/full/chop operations count logical entries and expand/remove complete
long pairs. Stores invalidate overlapping long heads/tails as the verifier does.

Emission includes long loads/stores/constants, fields/arrays, arithmetic,
conversions, comparisons, shifts, division/remainder and returns. Long access
helpers use their implicit rax/noreg contract. Zero divisors preserve canonical
operands before fallback; the existing corrected x86 sequence handles MIN/-1.
A bounded stack-operation helper checks whole-value boundaries and emits all
JVMS category-1/category-2 shuffle forms directly. No C1 IR, inlining framework
or register allocator is added.

Independent source review checked these exact contracts and the implementation.
It caught the implicit long-access register requirement before application and
improved the fixture: arithmetic no longer cancels its bitwise terms; shuffle
folds distinguish operand order; arithmetic/comparison oracles remain interpreted;
caller deoptimization requires a live direct method and positive invalidation;
long OSR is observed in an active loop. The revised raw bytecode fixture also
passed the stock JDK interpreter independently of this compiler. All fourteen
focused tests pass on both builds, including mixed long/reference/int arguments
beyond the register limit, C1/C2 callees and replacement, GC and long return TOS,
a retained long below call arguments, local overlap, exceptions, and long OSR.

## Qualified Java exception handlers

`4f770550606` retains original exception-table order and covered bytecode ranges,
uses verified single-oop handler stack frames and checks live locals at each
throwing BCI. Each handler has a distinct landing pad: extract and clear the TLS
exception, spill it into canonical stack slot zero, then enter the normal handler
label. This also permits a normal control-flow edge into a shared handler body.
Throwing-PC metadata covers Java/allocation calls, polls and explicit athrow;
explicit throw scopes reexecute the bytecode when deoptimization requires it.

Catch-type resolution and recursive lookup errors remain with the original
Method and existing Runtime1/SharedRuntime lookup. Unknown recursive destinations
use missing-handler deoptimization rather than entering with invalid locals.
The compiler adds no eager catch-class CI resolution. Methods without usable
handler verifier frames, more than 64 handler rows, or more than 4,096 emitted
handler metadata entries fall back explicitly and remain in the denominator.
Normal unwind, GC roots, deoptimization and ordered finally effects are retained.

Independent read-only review checked the concrete implementation and final
fixtures. All fifteen tests are qualified on release and fastdebug. Handler tests
exercise ordered catches, finally/rethrow once, long locals through GC, mixed-tier
callee throws, null/bounds/division fallback, escaped constructors, multi-catch,
normal and exceptional entry into a shared body, and a real inaccessible catch
type causing recursive lookup failure and deoptimization. Explicit post-warmup
identity/count assertions exercise the installed handler body. Existing long
tests separately force long-state reconstruction; a forced deoptimization with
long state inside a catch remains an untested combination.

The initial full release run passed fourteen tests and failed the obsolete
InstanceTest assertion that handler methods must refuse compilation. That
expectation was corrected and the test passed; the full fastdebug run passed
fifteen. Focused final handler fixtures passed both builds. A private census
probe initially failed a formatting warning under Werror, then was corrected;
both failures and all captures remain private. Production instrumentation is
restored. No master CPU-baseline integration is mixed into this series; the
reported `3eec12422fcf2fff86206a0f7411fbfdf81d0638` integration requires a separate
base update and qualification.

## Queue selection cost

An independently reviewed FIFO fast path avoids the full linked-list scan and
clock query when the locked compile queue contains only direct tasks. It removes
unloaded/stale prefixes and selects the first live request. Mixed queues retain
their complete scan, blocking priority, rate/stale updates and bounded direct
burst; queue counters, worker notifications, thresholds and the ordinary-tier
hold are unchanged. Deferred stale tails remain reachable in FIFO order and
ordinary arrivals restore the full sweep. All fifteen focused tests pass in
release and fastdebug. This is a structural cost correction; there is no new
entry-coverage or application-speed claim for it.

## Shortest coherent path toward the gate

Already resolved plain calls now have a scalar snapshot path inside the direct
emitter. One VM/no-safepoint read checks publication for the actual invocation
bytecode, the original descriptor, static initialization and existing restricted
forms. It copies only the dispatch decision, avoiding unused callee CI wrappers
and the per-bytecode callee pointer array. Unavailable snapshots retain the
existing CI lookup, so loaded-but-uncached support is preserved. Normal original-CP
call linking, Java conventions, maps and install-time JVMTI/redefinition checks
are unchanged. This does not widen the unresolved-call population.

Independent source review found no blocker. All fifteen tests pass on release
and fastdebug. The extended instance fixture confirms a single Methodref/cache
entry shared by invokespecial and invokevirtual, then checks virtual override
dispatch after direct installation. Reading the cache's first method pointer
without decoding the actual bytecode would be wrong for that case. No new CPU,
entry-coverage or application-speed claim is made for the snapshot change.

The next bounded semantic frontier is ordinary Java bytecode-intrinsic roots,
using the VM's explicit category rather than a workload method allowlist.
Object.<init>'s hidden finalizer hook, signature-polymorphic methods, compiled
lambda forms and existing native/scoped/monitor restrictions still require
exclusion. Separately, interface-caller invokespecial needs a receiver-constraint
check before every call; the initial runtime resolution alone cannot prove later
receivers valid. Those restrictions cannot simply be removed to raise coverage.

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
