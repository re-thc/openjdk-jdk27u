# Ordinary-call pilot: bounded preparation, execution and coverage check

The qualified `71a7ec33d54` image makes the tested field/branch and nonnull
reference paths faster, but all three call-bearing cases regress in every
matched JVM. Preparation is much smaller machinery than an nmethod compiler,
yet these full requests still cost 3.845–22.113 microseconds of requesting-thread
CPU. The real helpers with positive execution savings do not have enough
retained early entries to repay those requests. This is evidence against
admitting the present small caller shapes automatically; it is not a verdict
on an eventual broader tier or a new application-payoff measurement.

## Fixed comparison and limits

Exactly three timed release JVMs use the preserved qualified image, identical
class bytes and explicit observation-free action 5 preparation. There is no
HotSpot source edit or rebuild. Five fixed cases adapt the existing integer
pilot harness: actual javac TypeTag.isStrictSubRangeOf, java.util.Objects.equals,
javac Assert.checkNonNull(Object, Supplier), and the qualified static/interface
caller shapes with integer work after their call. The latter two are small
controls, not application coverage. The Assert timed path is nonnull and does
not call its Supplier; correctness of its error/call path remains in the prior
qualification.

Each case has two disabled and two enabled windows, 500,000 calls per window.
Disabled means the same published body is disabled in the same feature-enabled
VM, not a flag-off process. Orders are:

| JVM | Preparation/execution case order | Windows |
|---|---|---|
| p0 | Tag, Equals, Assert, Static, Interface | disabled, on, on, disabled |
| p1 | Assert, Static, Interface, Tag, Equals | on, disabled, disabled, on |
| p2 | Interface, Tag, Equals, Assert, Static | disabled, on, on, disabled |

All 15 preparations and 60 windows are retained. CPU/wall timers enclose the
complete WhiteBox request, including result packaging, not just the silent
held-method producer. Two query probes precede generation; all diagnostic
printing and immutable code/map reads follow every timed window. Shapes and
request order were fixed before examining execution results; no extra timing
forks were added after seeing regressions.

G1, fixed 64 MiB heap, CPUs 0–3, four active processors, two compiler threads,
CDS off and normal interpreter profiling are identical throughout. The direct
nmethod tier is off. Fixed callers and the three simple callees are C2 before
measurement; five selected roots stay interpreted and cannot inline. State
checks before/after windows enforce those levels, checksums and exact entry
counts. Objects.equals, Static and Interface each record exactly one native
caller continuation per enabled invocation and zero when disabled. Compilation
time counters remain 4/4, 7/7 and 4/4 milliseconds across the windows. This
coarse counter is not proof of zero compiler CPU, and fixed-tier execution is
not an experiment in ordinary C1/C2 handoff or settled application throughput.

The first launch failed before preparation because placing the whole fixture
on the boot append path hid jdk.compiler classes from its loader. Its failed
log is retained; only WhiteBox now uses that path. A Python manifest comparison
also stopped before p1 launched (tuple/list serialization); that was corrected
without repeating a successful capture. Neither failure contributed a timed
window. No profiler, logging instrumentation or concurrent build ran in these
performance JVMs.

## Complete preparation and startup costs

| Case | Full request CPU us, p0 / p1 / p2 | Full request wall us, p0 / p1 / p2 | Body bytes / continuation rows |
|---|---|---|---|
| Tag | 15.924 / 7.391 / 11.617 | 15.203 / 6.750 / 10.246 | 402 / 0 |
| Equals | 17.316 / 6.510 / 8.363 | 15.673 / 5.878 / 7.632 | 433 / 1 |
| Assert | 16.604 / 22.113 / 12.589 | 15.734 / 21.482 / 11.988 | 679 / 2 |
| Static | 5.298 / 9.925 / 18.037 | 4.407 / 8.452 / 17.416 | 100 / 1 |
| Interface | 6.199 / 3.845 / 11.898 | 5.578 / 3.115 / 11.337 | 112 / 1 |

First-position CPU is 15.924/22.113/11.898 us. Later requests still range from
3.845 to 18.037 us, including the adverse late Static result; three positions
do not identify a stable first-use subtraction. Query 0 CPU is 17.586–19.509 us;
query 1 is 81.090/6.430/1.352 us. The 81.090 us CPU probe has 8.512 us wall, an
unexplained short-interval discrepancy. Both clocks and all outcomes remain
reported, without using a single query as a universal bridge-cost deduction.
Linux thread CPU uses CLOCK_THREAD_CPUTIME_ID and wall uses CLOCK_MONOTONIC;
this check does not resolve the discrepancy or establish precise pure-producer
CPU from those small differences.

One-time arena initialization CPU is 19.589/19.439/18.157 us, with wall
19.129/18.718/17.606 us. The enclosing interpreter BufferBlob allocation CPU is
2.364/2.794/2.434 us, requesting 404,416 bytes each time. That allocation includes
the interpreter, arena and shared-call headroom; it is not incremental feature
startup cost. Shared guard/invoke/return emission is outside these cuts. No
startup component is charged again per request or added to a nested timer.

One of two separate diagnostic JVMs uses the instrumented producer on the same
five initialized methods, with no throughput timing. Analysis cuts are
0.360–0.630 us, buffer setup 0.141–0.231 us, emission 1.372–11.647 us,
publication 0.591–0.811 us and cleanup/lock cuts about 0.12–0.29 us. These clocks
perturb their own path; they are not substituted for the action 5 costs above
or a reliable subtraction-based partition of them. The larger reference/
branch emitter work remains visible; there is no evidence here for a hidden
C1 optimization pass or a large per-method code-cache installer.

The five bodies total 1,726 bytes plus five 264-byte map reservations, but own
five 4 KiB slices (20,480 bytes). The code-size reduction architecture does not
by itself solve the fixed-slice residency limitation.

## Matched execution and repayment

Each cell is requesting-thread CPU ns per root invocation, disabled -> on,
averaged over its two windows. Every disabled/on result is preserved.

| Case | p0 | p1 | p2 | On-path change in each JVM |
|---|---:|---:|---:|---|
| Tag | 23.719 ->17.213 | 27.041 ->17.552 | 21.454 ->16.217 | improves all three |
| Equals | 39.197 ->57.991 | 39.145 ->41.550 | 37.760 ->43.253 | regresses all three |
| Assert | 15.068 ->14.062 | 17.823 ->16.038 | 15.108 ->14.234 | improves all three |
| Static | 30.310 ->54.723 | 29.386 ->60.271 | 29.920 ->34.448 | regresses all three |
| Interface | 30.890 ->33.158 | 30.378 ->36.281 | 31.770 ->42.858 | regresses all three |

Wall outcomes have the same improvement/regression direction in every pair.
The wide Static/Equals magnitudes prevent assigning one universal nanosecond
tax. The positive signs of all call-bearing regressions are nevertheless
consistent in this bounded check; no adverse pair is excluded.

The fixed root paths execute 12/12/4/5/6 logical Java bytecodes respectively,
including their ordinary interpreted return and excluding callees. On-path
root-bytecode equivalents per CPU second are 684–740 million for Tag,
207–289 million for Equals, 249–284 million for Assert, 83–145 million for
Static and 140–181 million for Interface. These are end-to-end loop/call
observations divided by declared root bytecodes, not retired native
instructions, pure dispatch throughput or a weighting of the real workload.
Original Java bytecode identities are counted even when the interpreter has
quickened/fused their dispatch. Exact path BCIs are retained.

Dividing each full request CPU by its same-JVM invocation saving gives Tag
repayment of 2,447/779/2,218 calls and Assert 16,508/12,388/14,391 calls.
These are CPU/CPU quotients, exclude one-time setup and do not delay ordinary
compilation. The other three cases cannot repay at any invocation count under
their measured negative savings.

The frozen stock-policy startup diagnostic has 12 pre-admission interpreted
entries for Tag (no ordinary admission in that capture),895 for Assert and
255 for Equals. Assert's first ordinary admission was at 896 and installation
counter at 1,011; even granting all those entries its measured savings is much
less than a full request. These different-run counts are opportunity evidence,
not a controlled replay of what this tier would change. They also do not
measure every interpreted invocation during queue/install delay. They show
why an interpreter-only million-call test is insufficient to justify an early
threshold. No benchmark-name filters or admission thresholds were introduced.

## Real startup acceptance: prefixes are not whole bodies

Two diagnostic JVMs explicitly probe 24 retained real startup methods: the 22
highest-entry class-available rows, plus a constructor and handler-wrapper
example. This selected sample is not a population estimator. Each row matches
the retained class-file code length and frame dimensions. No application
execution is credited to these requests. Assert is already initialized by the
diagnostic setup; other sites have whatever resolution normal linking/loading
has produced, rather than a claimed universal cold/warm state.

Nineteen publish a prefix, but only seven emit every nonreturn bytecode.
Twelve stop early; five refuse completely. The two JVMs use 14 and 9 distinct
slices respectively, so none of those refusals comes from exhausting 16 slots.

| Result | Count | Examples or stopping reason |
|---|---:|---|
| All nonreturn instructions emitted | 7 | Byte.toUnsignedInt, PathFileObject.toBinaryName(String,String), removeExtension, ModuleReader.release, annotation-metadata getter, Assert helper, BasicImageReader.getLocation |
| Partial: unusable actual-get field snapshot | 6 | JrtPath.isAbsolute, ScopeImpl.enter, Symtab.doEnterClass, HeapIntBuffer.get/ix, Pattern.Slice.match |
| Partial: first ordinary return ends emission | 2 | CodeSourceKey.equals, CodeSource.matchCerts |
| Partial: later allocation | 3 | String.ascii, ImageLocation.readFrom, SharedImageReader.getResourceName |
| Partial: category-2 call | 1 | ImageLocation.getExtensionOffset |
| Refused: allocation at first opcode | 3 | ScopeListenerList.walkReferences, Symtab.defineClass and its allocation lambda |
| Refused: constructor / handler reference root | 2 | RelativeFile constructor, wrapped file-manager inferBinaryName |

Five of the six field-stopped bodies contain just one emitted aload; the
remaining ix prefix has two operations. Resolution later cannot enlarge an
already immutable prefix. Seven all-nonreturn emissions still do not prove
native execution through an unresolved call, cast or other runtime fallback,
and they say nothing about their callees' coverage.

The full frozen divisors remain 8,905 entered methods/690,406 pre-admission
interpreted entries for stock startup, and 9,036/3,210,575 entries for the
different-policy warm source. The planning ceiling remains 2,842/2,900 ordinary
caller methods with 293,820/1,063,864 attached entries. Re-reading those same
class files finds 1,661/1,689 ceiling methods with field reads, 248/250 with
returns before the method's end, and 2,001/2,016 with calls; these overlapping
sets cannot be added. They expose meaningful gaps in translating that ceiling
to this emitter. No installed/executed CPU coverage or new 80% figure is
inferred. Prior frozen eligible divisors 3,056/5,697 remain unchanged too.

## Architectural consequence and next bounded step

Preparation now avoids CI wrappers, linking, nmethods and compiled oopmaps.
The next execution boundary is visible in source: after each callee the normal
return epilogue is followed by owner/enablement checks, a real poll, interpreter
mode and nine JVMTI capability checks, breakpoint checks, a leaf transition,
more ownership/version/map validation, a linear scalar-map search and an atomic
continuation diagnostic increment. Canonical result push/BCP saves and the
remaining polling interpreter return also execute. Removing interpreter
dispatch around a small call does not remove those costs. The disabled
interpreter already has efficient call/return/TOS machinery. This source path
is a credible explanation for extra recurring work, not a measured
function-level allocation of all observed regression or layout sensitivity.

The next proposal should first isolate a bounded cheaper continuation: inline
the existing scalar lookup and make the atomic continuation counter an explicit
generation-time test option. Preserve owner/version, enablement, GC/frame,
poll and tooling checks and exactly-once return profiling. The source review
must decide which duplicated validations can be safely combined; none should
be removed on the assumption that a callee cannot change tooling or redefine
the class. This is a specific candidate, not evidence that these two changes
alone can recover the observed 4.5–30.9 ns Static loss.

The corresponding semantic/residency boundary is to stop freezing one-aload
prefixes: use runtime actual-opcode get-cache checks so normal interpretation
can resolve a field for a later generated invocation, and let an ordinary
return exit to interpreter dispatch while generation continues at later forward
labels. Keep bounded emission and fallback state. These address observed gaps
before expanding into allocation, arrays or loops. They require a separate
reviewed implementation; none is included in this measurement checkpoint.

Only after accepted call paths save execution should residency grow: a bounded
append-only arena can reserve enough remaining capacity before generation,
publish immutable code plus scalar size/map headers, and advance by actual
aligned used bytes instead of 4 KiB. Code is emitted at its final address, not
copied as unrelocatable bytes. Arena recognition, metadata-free lifetime,
header/offset validation and stale-method rejection need independent review;
no recycling or generic allocator is needed for that first experiment.

Automatic counter-path admission remains deferred. A next representative test
needs explicit residency for entry-ranked real callers, valid time-weighted
pre-C1 opportunity and positive complete cost budgets. More slots alone or a
new arbitrary threshold would not repair negative call savings. The current
tooling exclusion also means the retained capability-disturbed profiles cannot
supply that missing enabled-tier CPU attribution. No safety check was bypassed.

## Evidence and preservation

Runtime qualification, images and prior checkpoints are unchanged. The libjvm
SHA-256 remains
`2f80b2e16c709fa384d3438c04d16e803d0a3d499f89a3842ab176c17e3c44be`.
Frozen startup input SHA-256 remains
`61e881c9ff58d4b87db3e879a2dd958289a2519a4755d7fc9ef6dc509a56504f`.
The fixed [cost fixture](support/interpreter-frame-pilot/InterpreterFrameSemanticCost.java)
and [diagnostic probe](support/interpreter-frame-pilot/InterpreterFrameCoverageProbe.java)
are retained with normalized
[requests](direct-baseline-data/interpreter-semantic-cost-requests.tsv),
[all windows](direct-baseline-data/interpreter-semantic-cost-samples.tsv),
[execution/repayment](direct-baseline-data/interpreter-semantic-cost-execution.tsv),
[root paths](direct-baseline-data/interpreter-semantic-cost-paths.tsv),
[queries](direct-baseline-data/interpreter-semantic-cost-queries.tsv),
[startup cuts](direct-baseline-data/interpreter-semantic-cost-startup.tsv),
[instrumented cuts](direct-baseline-data/interpreter-semantic-cost-diagnostic.tsv),
[real-method probes](direct-baseline-data/interpreter-semantic-cost-probes.tsv),
[overlapping scope risks](direct-baseline-data/interpreter-semantic-cost-scope-risks.tsv)
and [identities/settings](direct-baseline-data/interpreter-semantic-cost-settings.tsv).

Raw logs, addresses, images and scripts remain private under
`/workspace/interpreter-frame-semantic-cost`. All commands were owned/reaped;
no new zombies or OOM events occurred, and roughly 3 GiB disk remains. No public,
default, admission or C1/C2-policy change occurred.
