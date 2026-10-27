# Direct baseline: bounded initialized static-field coverage

Resolved `getstatic` reads now compile for category-1 fields whose canonical
declaring class is already initialized. Actual javac-owned coverage rises
from 11 to 19 methods and total direct body entries rise from about 35–36k
to 44–47k. The implementation and semantic tests work, but this configuration
does not pass performance acceptance: startup is slightly worse and all three
primary warm fork pairings lose against the preserved handoff control.
Keep the negative result; do not promote this configuration as a win.

## Exact source and image identities

The preceding [handoff report](direct-baseline-successor-handoff.md) used these
frozen binaries, not the earlier retire-at-MDO diagnostic:

| Preceding case | Source represented by timed VM | libjvm SHA-256 prefix |
|---|---|---|
| Off / unchanged C1 admission | Always-MC emitter later committed in `1492e761174`, with `c9a33d485af` ordinary-admission policy (no 512 guard) | d05c79000bf33637 |
| Delayed C1 | Functional VM changes committed in `1492e761174` | b7734cc7e256dd8a |

The delayed binary was built while that functional change was uncommitted.
Final VM-source changes after freezing it were comments; later additions were
tests, documentation and the manual probe. It is not described as a rebuild
of clean commit 1492. Its 446.385 ms startup table is distinct from the earlier
502.733 ms retire-at-MDO candidate preserved at `5f04dac31ad`.

This new comparison copies the exact b7734cc7 binary for both off and control.
Both enabled cases therefore have the same shared-priority service and bounded
512 admission. The candidate adds only initialized static reads and explicit
volatile-load decorators inside the direct emitter. No thresholds, MDO
accounting, eligibility cadence or ordinary compiler implementation change.
Its libjvm hash starts c4f97463f5463746. Full hashes, commands and flags are
retained; all 377 non-libjvm regular files have matching content.

## What the rejected attempts actually cost

The retained handoff forks have 479/480 rejected tasks and exactly 479/480
distinct owner/name/descriptor keys. There are no repeated attempts within
either process. The source's one-attempt MethodCounters bit is set under the
queue lock, so unsupported methods are not repeatedly rescanned. Different
fresh JVMs naturally reconsider the same method names.

| Rejection reason | Attempts, fork 2 / 3 | Inclusive task CPU, ms, fork 2 / 3 |
|---|---:|---:|
| Unsupported bytecode | 366 / 366 | 8.859 / 9.310 |
| Method shape | 78 / 78 | 1.848 / 1.582 |
| Constant type | 22 / 22 | 0.508 / 0.498 |
| Loop exclusion | 10 / 10 | 0.315 / 0.269 |
| Field resolution/type | 2 / 2 | 0.048 / 0.057 |
| Local type merge | 1 / 1 | 0.014 / 0.009 |
| Stale installation | 0 / 1 | 0 / 0.053 |
| Total | 479 / 480 | 11.593 / 11.778 |

Only 1.077/1.312 ms is inside the emitter; 10.516/10.466 ms is outside it,
including CI/broker preparation and tracing. This is not a measured cost
partition for an uninstrumented caller. It identifies expensive requests that
reach CI only to refuse, rather than a retry defect or a slow bytecode scan.

195/187 refusals complete more than 1 ms before the first ordinary request,
with median remaining windows of 75.541/69.138 ms among that group. 281/290
have no ordinary request by the diagnostic snapshot. The remaining three in
each fork are within XML timestamp precision. 949 direct requests in the
combined ledger are at total count 32 and ten at 160. The existing interpreter
hook observes the masked notification phase, so 32 is not a universal total
invocation promise. This change does not alter that hook. These time windows contain other methods and idle
gaps; they are not interpreter CPU saved or proof that those roots are hot
enough to amortize compilation.

The bytecodes of 474/479 methods in the first fork are decoded from the
matched image. Five generated hidden classes are unavailable through javap;
four are method-shape refusals and one is an unsupported-bytecode refusal.
The first missing opcodes among the 366 unsupported refusals are getstatic
131, invokevirtual 96, new 65 and invokeinterface 27; the remaining smaller
groups and the unknown hidden method are recorded separately. Javac-owned
first getstatic failures number 29.

54 methods, including eight javac methods, have no other unsupported opcode
when getstatic is added. This is an upper bound: field types, constants,
initialization, loop edges and type-state checks still apply. 52 of those
methods actually install in the new fork. SharedSecrets.getJavaNioAccess
still requires an unsupported Class constant; ArraysSupport.mismatch uses
long static fields and also contains a loop. Neither is made unsafe merely
to improve the count.

## Small source change and correctness contracts

The type-state prepass accepts only linked, correctly static, supported-type
fields whose **canonical** ciField holder is loaded and fully initialized.
ciField::will_link uses ClassInitMode::dont_init; the additional initialized
check is required. A cold, initializing, erroneous or unresolved holder keeps
whole-method fallback. Static stores, class initialization stubs, allocation
and virtual dispatch are not added.

The emitter loads the declaring class's mirror with relocated `movoop` and
uses its field offset through collector `access_load_at`. The result occupies
the next canonical operand-stack slot, with reference type state retained for
later GC/deopt maps. Mutable and final fields are read from memory; there is
no constant folding or new field-value dependency. Volatile loads pass
MO_SEQ_CST, matching C1's barrier interface. AMD64 TSO and bytecode-order
emission require no extra acquire instruction. The existing Serial/G1 and
JVMTI/training restrictions remain. No C1 HIR, LIR or allocation pipeline is
used to generate baseline code.

Independent review checked the actual implementation and found no runtime
blocker. It caught a test weakness: a publication reader initially used zero
for both not-ready and stale payload. The final test uses -1 for not-ready
and fails immediately if readiness is observed with stale zero. Compilation
is held and the reader is verified at direct level 1 before and after
publication. This strengthens the test rather than changing the emitter.

Release and fastdebug build; all four baseline jtreg tests pass in both.
The tests require actual installs for mutable/subword static reads, reference
reads across GC after another method clears the static root, inherited fields
through an uninitialized subclass, and the direct volatile reader. Cold and
throwing holder tests prove the compiler does not initialize classes early;
the first real Java access initializes once or throws the normal errors.
Existing side-effect/deopt, linked handoff, both collector variants and stale
install tests pass. Natural C2 progression still needs 5120/5136 real profile
calls in release/fastdebug after the held unprofiled window.

## Coverage and matched caller results

| Logged startup observation | Preserved handoff control | Added getstatic |
|---|---:|---:|
| Successful direct installations | 109 / 112 | 161 / 161 |
| Methods with body entries | 103 / 106 | 153 / 151 |
| Rejected attempts | 478 / 480 | 427 / 427 |
| Direct body entries | 35985 / 35069 | 44200 / 47023 |
| Before ordinary admission or held snapshot | 32477 / 30433 | 41856 / 42715 |
| Javac-owned direct methods | 11 / 11 | 19 / 19 |
| Javac-owned body entries | 3863 / 3685 | 5409 / 5845 |
| Direct roots reaching installed C2 | 4 / 3 | 9 / 9 |

The eight additional javac methods are List.nil, AnnotationTypeMetadata.
notAnAnnotationType, Iterators.emptyIterator, JavacParser.prec,
ClassFile.Version.MAX/MIN, BitsState.getState and Attr.isType. Their first
candidate fork has respectively 488, 922, 97, 12, 120, 120, 176 and 3 direct
body entries. The small counts in several roots illustrate why a larger
method count is not sufficient performance evidence. Snapshot counts include
the small marker/attach interval and do not estimate interpreter CPU saved.

The unchanged real javac caller uses four startup and three warm forks per
case, serial and interleaved, with no tests/builds alongside timing. Its
source inputs, implicit classpath, 1500 warmup tasks, original stability wait
and 100 measured tasks are unchanged. Flags remain -Xshare:off, G1, 128 MiB
heap, ActiveProcessorCount=4, CICompilerCount=3, shared service, CPUs 0–3.
Both enabled cases use the same 512 cutoff. Only UseDirectBaseline differs
in the effective flag sets; the emitter feature differs by image.

| Median caller metric | Off | Handoff control | Added getstatic |
|---|---:|---:|---:|
| Startup wall, ms | 453.532 | 461.254 | 463.454 |
| Startup process CPU, ms | 977.817 | 985.127 | 995.741 |
| Warm task, ms | 5.869 | 5.718 | 6.248 |
| Whole warm-process wall, s | 16.823 | 16.768 | 15.863 |
| Whole warm-process CPU, s | 28.718 | 29.076 | 26.624 |

Primary warm fork medians are off 5.690/6.361/5.869, control
5.718/5.386/6.431 and candidate 6.248/5.655/6.913 ms. Each corresponding
candidate/control fork pairing is slower; the median increases 9.3%.
Startup adds 2.200 ms wall and 10.614 ms CPU versus control. Whole warm-process
CPU improves substantially, but includes 1500 warmup tasks and compilation.
It cannot offset or relabel the adverse 100-task warm metric. These results
fail the requested no-warmed-loss acceptance criterion for this configuration.

One bounded diagnostic wrapper retains the same 100-task window. Off/control/
candidate have 65/159/120 ms CompilationMXBean increases, 12/30, 11/36 and
9/28 new resident C1/C2 installations, and 0/312/346 direct entry deltas.
Compilation remains active; the extra direct execution is small. The
instrumented warm medians go the other way, 5.541/6.745/5.209 ms, demonstrating
phase variation rather than explaining away the primary loss. The control
loses one sampled thread, so its per-thread CPU delta is incomplete. The
precise cause of the primary warm loss is not resolved by this diagnostic.
No added checks execute on ordinary warmed C1/C2 calls; differing profiling,
compilation, GC and execution histories remain possible causes, not findings.

## Cost, remaining gap and preserved evidence

In the separate XML startup cohort, direct tasks cost 22.737 ms control and
21.269 ms candidate on average. The candidate splits into 10.345 ms successful
and 10.924 ms rejected work. Main CPU means are 445.380/458.385 ms, inclusive
C1 291.867/290.223 and C2 308.646/312.420. Complete process CPU is
1058.993/1076.997 ms, with combined after-ready/unobserved remainders
11.257/14.251 ms; GC and other VM buckets complete the ledger. These traced
means do not partition the uninstrumented median difference.

Retained direct blobs plus auxiliary metadata rise from 89884/92168 to
128212/128028 bytes, excluding allocator overhead. MethodCounters remains
72 versus upstream 64 bytes, including off. No worker is added and no
ordinary C1/C2 policy or code-cache threshold is tuned.

The remaining unsupported-bytecode group has 300 methods. Its first missing
operations include 131 invokevirtual, 36 invokeinterface and 80 new; these
numbers are not independent capabilities that can simply be added together.
General instance dispatch needs receiver ABI/null checks, resolution and
inline-cache handling, exception/deopt scopes and invalidation contracts.
Allocation also needs TLAB/slow paths, zeroing, constructor/uninitialized
object state and GC metadata. Those are material runtime features and are
not undertaken here. Bytecode counts alone do not prove their payoff.

A separate concrete cost opportunity is avoiding unsupported requests before
CI preparation: roughly 10.5 ms of the old logged rejection budget lies
outside the emitter. An early conservative opcode/shape filter could address
some of it, but must avoid repeated scans, queue-lock inflation and divergent
support tables. It is not a retry fix, was not combined with this capability,
and has no measured win yet. The new capability remains a useful opt-in
source experiment, while `1492e761174` remains the preferred performance
control pending explanation or correction of the warmed loss.

Small tables are checked in as `direct-baseline-data/static-fields-*.tsv`.
Full per-method rejection/cost ledgers, bytecode listings, source patches,
commands, images and test reports remain under
`/workspace/direct-baseline-evidence/static-fields/` and the preserved
`successor-handoff/` directory. Earlier negative stages remain intact.
No public action, CI dispatch or Library transfer occurred.
