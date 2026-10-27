# Bounded interpreter-frame prefix experiment

The interpreter-frame mechanism works in the declared subset and avoids normal
per-method nmethod installation. The 21- and 39-operation arithmetic prefixes
execute substantially faster than the ordinary interpreter in these small
cases. Registration is still too expensive to call this a successful early
tier: the WhiteBox safepoint request costs much more than native generation,
and the five-operation case has little execution saving.

This supports another bounded architectural step, not a coverage expansion or
application adoption claim. Keep `a082e2d668d` and its qualified images intact.
The local prototype branch is `wip/interpreter-frame-pilot`; source commits are
`bcda30bbe19` and ownership correction `d42a8db4f2c`. No public/default/policy
change accompanies this experiment.

## What was implemented

`UseInterpreterFramePilot` is off by default. WhiteBox explicitly prepares a
verified, linked, rewritten static method. It does not implement production
after-X admission, a new compiler queue or delayed C1/C2 policy.

The generator consumes logical Java instructions through BytecodeStream,
including the constituents of quickened pairs. Supported prefix operations are
integer constants, local loads/stores, add/subtract/multiply, bitwise operations,
shifts and nop. A bitmap proves integer local loads. Untouched oop arguments
remain ordinary interpreter roots. The maximum is 64 operations; all calls,
branches, returns, throwing operations and unsupported instructions resume
ordinary interpretation before executing that operation.

The integer emitters are factored from the existing x86 templates into helpers
taking an explicit InterpreterMacroAssembler. The pilot shares those helpers;
it never invokes global TemplateTable generation state or copies machine bytes.
It uses no C1 IR/emitter, optimizing pass, ciEnv, compiled ScopeDesc/OopMapSet,
per-method nmethod or collector registration.

The interpreter reserves one committed codelet before trimming its startup
buffer. Consequently existing Interpreter::contains/frame recognition covers
the generated PCs. Each body occupies a previously unused 4 KiB slice of the
64 KiB arena. Slices are never overwritten, recycled or freed during the VM's
lifetime; exhaustion falls back. Bodies embed no Method/klass/oop pointers.
Class unloading can reclaim the owner normally, leaving harmless dead bytes.

Selection occurs after the normal frame, counters, stack checks and method-entry
notifications. It reloads Method and checks MethodCounters ownership, because
method cloning can shallow-copy counters. Each operation leaves canonical
vtos expression state and advances/saves BCP. The finite prefix contains no
VM call or safepoint. Entry checks an already armed poll; exit dispatch uses
the active interpreter table and its poll. Existing calls, exceptions, returns,
GC maps, MDP/profiling and C1/C2 replacement then apply to the real frame.

Preparation is serialized by a WhiteBox VM operation with a held method. Code
is flushed before release publication. Runtime guards check interpreter-only
mode, breakpoints, relevant JVMTI capabilities/events, and debug bytecode
instrumentation. Tool activation therefore takes the ordinary dispatch path;
this does not qualify the pilot for arbitrary JVMTI heap/local inspection.

## Correctness and retained failures

Independent design/source review accepted the bounded AMD64 Serial/G1 scope.
The final source passes the pilot fixture and five existing direct tests on
both release and fastdebug. The fixture checks actual generated execution,
integer/shift overflow semantics, oop identity across GC, StackWalker through
an unsupported call, ordered exception/handler fallback, arrays/nulls/bounds,
once-only calls, branches, dynamic JFR fallback, C1 replacement/deoptimization,
the 64-operation cutoff, 16-slot exhaustion and class-loader unloading.

Two failures remain recorded in the [test ledger](direct-baseline-data/interpreter-frame-pilot-tests.tsv):

- The initial driver initialized WhiteBox outside its flagged child VM, causing
  UnsatisfiedLinkError before reaching a pilot body. Initialization now occurs
  only in the child.
- Fastdebug caught a real cross-thread methodHandle copy at handles.cpp:96,
  through BaseBytecodeStream construction on the VM thread. The operation now
  carries a raw Method protected by the caller's live handle and creates a
  fresh VM-thread-owned handle in doit. Independent review accepted the fix;
  the assertion remains enabled. Both builds were requalified afterward.

The [source](../../src/hotspot/cpu/x86/interpreterFramePilot_x86.cpp),
[fixture](../../test/hotspot/jtreg/compiler/interpreter/InterpreterFramePilotTest.java),
[harness](support/interpreter-frame-pilot/InterpreterFramePilotBench.java) and
[image hashes](direct-baseline-data/interpreter-frame-pilot-images.tsv) identify
the reviewed implementation. Raw logs, failed crash evidence and images stay
private. These are focused checks, not complete production/tool/continuation
qualification.

## Bounded measurement

Four release JVMs run flag-off/on/on/off on CPUs 0–3, G1, a 64 MiB heap,
ActiveProcessorCount=4 and CICompilerCount=2. The old direct compiler is off.
Targets are excluded from ordinary compilation and inlining. Only the fixed
callers are C2-compiled, before timing. In each enabled JVM the four windows are
disabled/on/on/disabled. Every sample checks caller level 4, target level 0,
an ordinary-interpreter checksum and exactly 500,000 target calls/hit deltas.
No build, profiler or diagnostic printing runs during a timed body.

Per case there are 2 million on calls, 2 million enabled-but-disabled calls and
4 million flag-off calls. All 48 windows are retained in
[samples](direct-baseline-data/interpreter-frame-pilot-samples.tsv).
The controls answer different questions: on versus disabled includes the
runtime guard/counter costs of executing the codelet; flag-off versus disabled
also changes interpreter entry selection and code layout.

| Prefix | Operations / published bytes | Flag-off median CPU ns/call | Enabled, disabled median | On median | Within-JVM CPU change A / B |
|---|---:|---:|---:|---:|---:|
| Short | 5 / 380 | 15.225 | 16.969 | 13.555 | -11.77% / -24.51% |
| Medium | 21 / 667 | 35.743 | 38.242 | 19.575 | -49.46% / -46.78% |
| Long | 39 / 976 | 71.334 | 69.805 | 28.605 | -59.02% / -61.81% |

Within-JVM paired mean savings are only 1.97/4.33 ns per short call,
18.89/17.89 ns for medium and 41.20/46.21 ns for long. Short overlaps the
flag-off sample range and is a weak margin. The flag-off and disabled controls
also overlap; their medians show a short/medium entry-selection/layout penalty
that must not be ignored. Wall medians are close to CPU medians; complete
[summaries](direct-baseline-data/interpreter-frame-pilot-summary.tsv) and
[pairs](direct-baseline-data/interpreter-frame-pilot-pairs.tsv) retain both.
This is a comparison of these three shapes, not workload-weighted early entries
or settled application throughput.

| Prefix | VM generation/publication CPU, A / B µs | External request wall, A / B µs | Observed CPU subtotal, A / B µs |
|---|---:|---:|---:|
| Short | 56.254 / 10.415 | 234.673 / 137.307 | 94.861 / 58.306 |
| Medium | 14.853 / 11.057 | 199.359 / 106.330 | 49.686 / 46.259 |
| Long | 6.359 / 5.449 | 54.652 / 43.645 | 27.680 / 24.297 |

Short is generated first in each JVM; retain its 56.3 µs outcome. The generator
timer includes checks, signature bitmap, emission, cache invalidation,
publication and prepare cleanup. It excludes VM-operation scheduling/safepoint
entry/exit and the final operation-scope handle/resource cleanup. The external
Java wall time includes the synchronous WhiteBox request and result array.
The CPU subtotal adds external requesting-thread CPU to the distinct VM-thread
generator CPU. It excludes other VM/safepoint work and is not complete process
CPU. Nested wall times must not be added. All timing cuts, including flag-off
control requests, are in [generation data](direct-baseline-data/interpreter-frame-pilot-generation.tsv).

The 64 KiB arena plus its codelet header/alignment is prepaid at VM startup and
excluded from those per-method timers. Three 4 KiB slices are assigned here,
despite only 2,023 published bytes. MethodCounters also grows from 72 to 88
bytes in this experimental image, including flag-off controls. This is not a
byte-identical binary of the preserved direct candidate. The experiment does
not establish total startup or code-cache memory savings.

## Budget and architectural decision

Dividing measured generation CPU by the same-JVM per-call CPU saving gives
generator-only break-even counts of 2,404–28,589 short calls, 619–787 medium
calls and 118–155 long calls. Including the observed CPU subtotal raises those
to 13,458–48,209, 2,586–2,631 and 526–672 respectively. These are arithmetic
amortization estimates for the three measured shapes. They omit prepaid arena
and unmeasured VM work; they do not demonstrate repayment before an ordinary
optimizer arrives and must not become admission thresholds.

The result justifies retaining this architectural direction for another
bounded step. Real interpreter frames remove compiled-frame installation and
reconstruction machinery, and dispatch removal saves meaningful execution
time on the longer shapes. It does not justify broad coverage work yet. The
next bottleneck to establish is generation/publication without the artificial
synchronous WhiteBox safepoint/reflection/array interface, while keeping held
metadata, tool-state checks, atomic publication and stale-version ownership.
The small short-method margin and global entry-selection cost also need a
budget before a production admission mechanism. Do not delay C1/C2 or filter
benchmarks to manufacture repayment. No broader implementation is included in
this completed experiment.

## Profiling exclusion: actual contract and production consequence

JVMTI heap/reference walking uses StackRefCollector::do_frame in jvmtiTagMap.cpp
to reconstruct Java locals and expressions with method/BCI/slot attribution,
and follows compiled-code roots. EscapeBarrier also handles optimized objects
and monitors. That is a stronger tooling contract than ordinary GC root maps.
The direct emitter already records locals/expressions and performs no scalar
replacement or monitor optimization. Source inspection identifies unqualified
JVMTI support, not a demonstrated missing oop map or specific installer bug.
Active-frame and late-capability qualification remain necessary before relaxing
the direct compiler's conservative exclusion.

This affects ordinary production JFR when the optional direct tier is enabled:
JfrOptionSet::allow_retransforms returns true in JVMTI builds; recorder creation
starts its internal JVMTI agent. AddCapabilities recomputes global flags from
always-available capabilities, including can_tag_objects, setting
can_walk_any_space. New direct compilations then refuse before emission;
previously installed code may exist. This is a real compatibility/coverage
limitation, not harmless profiler noise or a failure of JFR itself. The pilot
also retains runtime fallback when that flag changes, as the fixture verifies.

External OS PC sampling can observe code ranges without changing these
capabilities or weakening checks. An earlier native-only preload capture also
preserved direct installation, but is an in-process sampler and did not resolve
Java Method/BCI attribution. PC-only samples can distinguish direct/ordinary
compiled/interpreter ranges; they cannot identify expensive rejected Java
bodies inside the interpreter or measure adapter CPU from mixed stacks. A
qualified non-JVMTI Method/BCI attribution mechanism remains open. No new profiler
campaign or safety-check bypass was used here.
