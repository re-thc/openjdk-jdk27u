# Direct baseline: cheap refusals and the warm compilation frontier

A constant-time preflight now refuses 109 unsupported methods per startup
before creating compiler tasks. It uses cached metadata and one entry opcode,
not another bytecode scan. The 19-method javac coverage remains. This removes
real avoidable work, but the complete caller result still fails the warmed
criterion: median warm tasks are 5.587 ms versus 5.043 ms for the preserved
getstatic control. No promotion or default-on change follows.

The warmed investigation confirms late class loading invalidates ordinary
parser/scanner code, and identifies persistent C1-versus-C2 differences in
important compiler methods. A one-method C2 counterfactual makes a diagnostic
gap much smaller. It does not establish a complete attribution of the original
three-fork loss or a stable machine-code throughput regression. All prior
results, `ac8799d67c9` and the exact `1492e761174` control images remain intact.

## Refusing before CI without a second scan

The old refusal timer starts in CompileBroker before JNI handles,
ThreadToNativeFromVM, ciEnv, CI target construction and compiler invocation.
The emitter timer starts much later. In the preceding study, about 10.5 ms
of refusal CPU lies outside the emitter, with no repeated Method attempts.
It is incorrect to call all that time bytecode scanning or a retry defect.

After the existing attempted bit is set under MethodCompileQueue_lock,
the broker now asks the direct compiler for conclusive cheap refusal facts:

* Cached exception/monitor/scoped/reserved/intrinsic flags and frame/code bounds.
* The already-recorded return type, allowing void, integer/subword and reference
  results. Unsupported parameter types still receive normal CI validation.
* `new` at bytecode zero, which the emitter does not support.

There is no signature walk, opcode allowlist, loop scan or new per-call check.
The successful path still performs its necessary type-state prepass once and
then emits bytecode directly. Frame/code limits are shared constants so their
values do not diverge. CI checks remain for complete validation and races.
Refusal logging and ResourceMark allocation occur after releasing the queue
lock. No ordinary queued bit or noncompilable flag is changed. The interpreter
hook, counters, notification masks, bounded 512 hold and C1/C2 paths are unchanged.

This placement avoids task/directive/weak-handle work as well as CI setup.
A worker-only test before ciEnv would save less. A complete opcode preflight
would duplicate work for supported methods unless the frontend were reworked;
that larger change is deliberately not made here.

| Diagnostic observation | Getstatic control | Preflight |
|---|---:|---:|
| Early refusals before task creation | 0 / 0 | 109 / 109 |
| CI/compiler refusals | 428 / 427 | 319 / 317 |
| Successful installations | 164 / 160 | 160 / 162 |
| Javac-owned installations | 19 / 19 | 19 / 19 |
| Actual direct body entries | 49896 / 46642 | 46163 / 47180 |

Each candidate has 62 shape, 40 entry-allocation and seven result-type early
refusals, with 109 unique keys and no repeated refusal. 105 match refused
tasks in each corresponding control fork. Those old tasks consumed
2.547/2.385 ms inclusive CPU, of which 2.397/2.010 ms was outside the emitter.
These are matched historical task budgets, not measurements of free preflight
execution or a causal partition of process CPU. Early checks run on the
application thread; complete process and thread budgets include their cost.
The other four keys have no matching control task and receive no invented
CPU saving.

The same constant-time facts cannot remove the whole 10.5 ms. Hundreds of
remaining refusals occur at later unsupported bytecodes or resolution/type
checks. Removing that cost without a duplicated full scan would require
moving meaningful validation ahead of CI, not adding more flags or counters.

## Matched caller result, with the original metric preserved

The fresh serial/interleaved set uses four startup and three warm forks per
case, unchanged original javac inputs/classpath, 1500 warmup tasks, existing
stability pause and 100 measured tasks. No builds, tests or diagnostics run
beside timing. All exits are zero. G1, 128 MiB heap, CPUs 0–3,
ActiveProcessorCount=4, CICompilerCount=3, shared service and the 512 cutoff
are unchanged. Off/control use the exact preserved `ac8799d67c9` binary;
the new image adds only preflight. Effective flags differ only in
UseDirectBaseline; all 377 non-libjvm regular image files match.

| Median metric | Off | Getstatic control | Preflight |
|---|---:|---:|---:|
| Startup wall, ms | 413.541 | 464.134 | 417.706 |
| Startup process CPU, ms | 923.886 | 969.780 | 912.433 |
| Original warm task, ms | 5.028 | 5.043 | 5.587 |
| Whole warm-process wall, s | 14.736 | 15.335 | 15.144 |
| Whole warm-process CPU, s | 24.727 | 26.209 | 26.135 |

Startup is substantially better than this control cohort, and candidate CPU
is lower than off, while wall remains higher than off. It would be wrong to
attribute the whole 57 ms control CPU difference to the approximately 2.5 ms
refused-task budget. The separate logged cohort goes the other way: complete
mean CPU is 1069.189 ms control versus 1136.341 ms candidate. Its inclusive
C1 means are 286.275/317.612 ms and C2 314.290/329.998 ms; no causal partition
of primary timing is inferred from that disagreement.

Primary warm fork medians are control 4.741/5.266/5.043 and candidate
5.628/5.371/5.587 ms. Every paired candidate fork is higher, with a 10.8%
median increase. The original warm metric is retained and fails acceptance.
No alternate diagnostic below replaces it or proves a useful application win.

## What explains warm-state changes, and what remains missing

The preceding getstatic/control snapshots had only 346/312 direct entries
over 100 tasks, no javac-owned direct entries, and identical common getChars
and encodeAsciiArray counts. The candidate-only System.lineSeparator calls
have a known reporting path: the task's nanoTime interval ends before println,
which reaches BufferedWriter.newLine and StreamEncoder. They must not be
charged directly as 71 slow getter calls inside javac tasks. Their class
loading and compilation can still perturb subsequent tasks.

Retained snapshots identify a differential caller:
ScannerFactory.newScanner(CharSequence, boolean). One prior control window
has C1 level 3 then level 2; getstatic has a previously invalidated C2 method
then a replacement C2 during the window. This motivates inspecting that
caller instead of assuming less total C2 or intrinsically slower getter code.

The bounded caller capture confirms a specific late-initialization event:

| Event, ms from VM start | Control | Getstatic |
|---|---:|---:|
| HeapCharBuffer first loads | 15540 | 14828 |
| ScannerFactory C1 marked not entrant | 15541 | 14830 |
| ParserFactory.newParser C2 marked not entrant | 15540 | 14829 |
| ScannerFactory replacement C1 level 2 installs | 16014 | 15280 |

The first scanner compilation in both captures is at count 640 and records
a `leaf_type` dependency on abstract CharBuffer. Loading HeapCharBuffer breaks
that dependency. ParserFactory's inlined scanner code has the same relevant
dependency; control also invalidates C2 JavaCompiler.parse then. Scanner's
replacement requests occur at total count 5760, initially level 3 and adjusted
to level 2 by ordinary queue/profile policy. The diagnostic lacks separate
MC/MDO start-field snapshots, so it does not invent exact profile origins from
total counts alone.

Source inspection identifies first reporting output as a path that loads
HeapCharBuffer through character encoding. Class-loading timestamps plus
the recorded dependencies establish this invalidation mechanism. They do not
by themselves assign the original warm gap to it. A requested method-specific
CompileCommand did not restrict the resulting detailed compilation logs in
this fork (about 63 MiB each); those broader raw files remain local. Analysis
uses the identified callers, and their instrumented timings are not adoption
evidence. Subsequent counterfactuals omit LogCompilation entirely.

A one-line diagnostic preinitializes HeapCharBuffer before warmup. It loads
at 61/55 ms and ScannerFactory stays entrant at C1 level 3 before/after both
windows, eliminating the selected invalidation. The getstatic window is
still slower: 6.577 versus 5.911 ms. Therefore that class-loading event is
not a sufficient explanation of the performance gap.

The same snapshots expose a stronger persistent tier difference:

| Entrant code throughout this preinit window | Control | Getstatic |
|---|---:|---:|
| JavaCompiler.attribute(Env) | C2, 20624-byte range | C1 level 3, 9880-byte range |
| Gen.nonVirtualForPrivateAccess(Symbol) | C2, 216 bytes | C1 level 3, 1096 bytes |
| ClassWriter.endAttrs(int,int) | C2, 288 bytes | C1 level 3, 424 bytes |

The source bodies have no loops, supporting normal-entry identity despite
codelist's omission of OSR BCI. Some other methods are C2 in both but have
different code sizes, including writeClassFile and Gen.visitApply. Code size
does not establish which runs faster. Per-file methods near the normal C2
profiling threshold at this warmup length are sensitive to C1/profile and
queue history, even with unchanged numerical thresholds.

The final targeted counterfactual preinitializes the same class and uses
WhiteBox to request only normal-entry C2 for attribute(Env) outside the task
timers. Both fresh processes start that checkpoint at C1 level 3 and stay at
C2 throughout measurement. Medians are 5.455/5.536 ms control/getstatic, a 1.5%
gap rather than the preceding pair's 11.3%; observed application-thread CPU
differs by 8.559 rather than 71.378 ms. This supports tier timing as a
contributor. It is not a quantitative attribution: these are fresh cohorts,
WhiteBox/common initialization changes histories, and the preceding control
already had C2 naturally. No unforced/forced comparison of the same frozen
execution state or CPU call-site samples was retained for the original forks.

The supported conclusion is specific: ordinary invalidation, tier arrival and
code histories differ during the user's warm tasks. Persistent slower final
C2 code is not established, nor is noise established as the sole cause.
The original 9.3% getstatic gap remains incompletely attributed and unaccepted.

## Architecture implication and validation

The preflight is a justified small cost correction, but not enough coverage
to establish a useful application compiler. The remaining refusal ledger is
dominated by instance dispatch (131 invokevirtual and 36 invokeinterface first
failures) and allocation (80 new first failures), with overlapping needs.
The current stage also excludes instance roots, loops, category-2 values and
handlers. The concrete hot callers above are instance methods and are outside
its coverage. Adding more small static getters cannot address that gap.

Before further tiny opcode additions, meaningful coverage work should qualify
normal instance entry and a bounded instance-call path, with precise receiver
ABI, resolution/IC, GC, exception/deopt and invalidation contracts. Allocation
is separable and should follow measured need; supporting new also requires
constructor and initialization handling. Loops need a correct optimization/OSR
escape. None of these is undertaken or claimed cheap here. The fixed-slot
direct architecture remains plausible, but this static loop-free subset has
not shown sufficient useful interpreter work avoided to amortize its costs.

Release/fastdebug build and all four baseline jtreg tests pass. New checks
require early shape/result/allocation refusals, exactly one allocation refusal
across the next early notification, preserved exception behavior and ordinary
compilability. Existing profiling, collector, static-field, pending/stale,
linked-call and C2 bypass tests remain. No C1 IR, new policy framework,
threshold tuning, default-on change or public action is introduced.

Small tables are `direct-baseline-data/preflight-*.tsv`. Full command files,
images, original and diagnostic caller logs, rejected-method keys, dependency
records, counterfactual sources and test reports remain under
`/workspace/direct-baseline-evidence/preflight/`. Source and evidence stay local;
earlier negative images/results are preserved.
