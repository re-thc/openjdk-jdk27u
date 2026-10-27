# Interpreter-frame preparation without a synchronous VM operation

The bounded pilot can safely prepare and publish its immutable interpreter
prefixes on the requesting JavaThread in VM state. It needs no explicit
synchronous safepoint, per-method nmethod allocation, compiled frame metadata
or collector registration. In this four-JVM comparison, the long prefix's
observed request CPU falls from 29.6–36.1 µs to 8.9–9.1 µs, and request wall
latency from 88–113 µs to 8.3–8.5 µs. This removes a substantial artificial
interface cost. It establishes neither an application win nor a production
early-tier admission mechanism.

Source is local commit `8e9b7c551b8` on `wip/interpreter-frame-publication`.
The preserved pilot `d42a8db4f2c`, its qualified images/results, and direct
candidate `a082e2d668d` remain intact. The preceding
[pilot report](interpreter-frame-pilot.md) describes the execution architecture
and its earlier failures. There is no opcode expansion, ordinary tier-policy
change, default enablement or public action in this phase.

## Preparation and publication contract

WhiteBox action 0 retains the synchronous VM-operation control. Action 4 calls
the same generator on its requesting JavaThread, already in VM state, holding
a methodHandle. This still enters through WhiteBox/JNI/reflection and returns
a result array; it is not a production invocation-counter hook.

One dedicated no-safepoint mutex serializes generation, duplicate checking,
fixed-slice allocation, enable/disable and snapshots. A NoSafepointVerifier
covers lock acquisition, emission and CodeBuffer/ResourceMark cleanup. Under
the lock, preparation rechecks linked/rewritten method state, old/obsolete
status, counters ownership, supported shape, duplicates and arena capacity.
The generator flushes and invalidates instructions before release-publishing
the entry and enabled state; readers acquire the entry. Result-array allocation
occurs after unlocking. The VM-operation control retains the VM-thread-owned
handle correction from `d42a8db4f2c`.

The code arena remains a fixed 64 KiB committed InterpreterCodelet within the
existing interpreter StubQueue, divided into sixteen immutable 4 KiB slices.
No slice is recycled or overwritten. No body embeds Method/klass/oop pointers;
unloading can leave dead bytes without retaining the owner. Existing
Interpreter::contains recognition and interpreted-frame root walking apply.
The private CodeBuffer owns no CodeBlob. Holding a Method handle and forbidding
safepoints prevents metadata lifetime/redefinition changes during preparation;
release publication makes a completed body visible to other threads.

Native execution is unchanged: a finite, at most 64-operation integer prefix,
canonical interpreter expression state and saved BCP at bytecode boundaries,
no VM call inside the prefix, and ordinary active-table dispatch before every
unsupported operation. Entry checks polling/tooling state. Calls, branches,
exceptions, returns, GC and later C1/C2 replacement continue through the normal
interpreter. No tooling exclusion or assertion was weakened.

Independent source review accepted this bounded lifetime/publication and
frame-walking contract before execution. Removing the explicit VM operation
does **not** remove all safepoint impact: a producer holding or waiting for the
mutex in a no-safepoint region can delay a safepoint. The bounded generator and
fixed capacity limit the work, but contention/tail-latency qualification is
still required before production use.

## Qualification and resource recovery

Both coherent release and fastdebug images pass the pilot fixture and all five
existing direct-baseline tests: basic, instance, long, handler and stale-install.
The [test ledger](direct-baseline-data/interpreter-publication-tests.tsv) and
[libjvm hashes](direct-baseline-data/interpreter-publication-images.tsv)
identify the completed runs. Each image uses the existing matched runtime
image with the newly built matching libjvm, preserving prior images.

The fixture retains Serial/G1 semantic, GC/oop identity, fallback, exception,
JFR/tool activation, stack walking, C1 handoff/deoptimization, unloading and
arena exhaustion checks for both preparation routes. It adds sixteen fresh
methods prepared by two concurrent requesters, including repeated duplicate
requests, while a collector performs GC and Thread.getStackTrace. It checks
one winner per method, unique correctly spaced slices, later native hits and
results, and actual collector/walker progress. This demonstrates overlapping
activity, not proof that an observation landed inside the critical section.
It is not arbitrary collector, continuation, JVMTI or production qualification.

Two build failures were corrected and retained privately: an AMD64_ONLY macro
with comma-separated declarations, then a fastdebug missing inline definition
for JavaThread::thread_state. No assertion was disabled. The final builds and
all tests pass after these corrections.

The three new PID1 zombies belong to an old completed tool-command wrapper
chain (bwrap/codex/python3), rather than unreaped build children. Its owned
subreaper recorded successful exit and three adopted children reaped; the old
tool session subsequently reported an unknown process ID. Loss of the wrapper
reaper is the supported explanation; the underlying session-loss cause is not
proven. PID1 does not reap. No attempt was made to kill PID1 or remove evidence.

Before another build, a controlled double-fork probe verified the retained
execution route: keep the orchestration cell alive while polling every owned
command to completion, and retain the existing synchronous build logging and
owned subreaper. The same route then completed builds, tests and measurements.
The PID1 zombie set remains the same twenty PIDs before the probe and after
qualification/measurement; no additional zombies accumulated. There is 3.5 GiB
free at completion and no remaining build/test/measurement command. The old
three zombies cannot be reaped by this non-parent process; they are a retained
environment limitation, not a blocker for this completed bounded phase.

## Matched measurement and timer boundaries

Four release JVMs use control/native/native/control order on CPUs 0–3, G1,
64 MiB fixed heap, ActiveProcessorCount=4, CICompilerCount=2, CDS off and the
old direct compiler off. All enable UseInterpreterFramePilot. Only run* callers
are C2-compiled before timing; target* methods remain excluded from ordinary
compilation and inlining. Within each JVM, execution windows are
disabled/on/on/disabled, 500,000 calls per window, for the same three shapes.
Every window checks checksum, exact native-hit delta, caller level 4 and target
level 0. All 48 windows are retained in
[samples](direct-baseline-data/interpreter-publication-samples.tsv).
No diagnostic printing, build or profiler runs inside a timed window.

This is a same-image comparison of the old control protocol and new native
producer with common phase instrumentation and serialization. It is not a
comparison against a byte-identical `d42a8db4f2c` image. The earlier pilot
cohort remains separate; results are not pooled into a cross-image speedup.
Generation always visits Short/Medium/Long in that order, so Short includes
first-use effects. There are two JVMs per route, not a statistical campaign.

Producer CPU covers lock acquisition, shape/signature analysis, fixed-buffer
setup, emission, flush/publication and temporary cleanup. External Java-wrapper
CPU includes the native request and result interface. For action 4, producer
CPU is nested in wrapper CPU and **must not be added**. For action 0, the
producer is a distinct VM thread: the observed CPU subtotal adds wrapper and
producer CPU. That subtotal still excludes unmeasured VM-thread safepoint
entry/exit and outer operation cleanup, and is not whole-process CPU. Neither
route adds nested wall timers. CPU and wall clocks bracket slightly different
code and have measurement overhead, visible at these small durations.

| Prefix (operations / published bytes) | Control producer CPU A / B µs | Native producer CPU A / B µs | Control observed request CPU A / B µs | Native observed request CPU A / B µs |
|---|---:|---:|---:|---:|
| Short (5 / 380) | 13.460 / 15.263 | 13.319 / 12.709 | 63.615 / 45.939 | 27.371 / 27.321 |
| Medium (21 / 667) | 12.669 / 12.098 | 10.335 / 9.644 | 38.157 / 37.185 | 12.890 / 12.017 |
| Long (39 / 976) | 12.108 / 12.339 | 7.301 / 7.441 | 36.083 / 29.574 | 8.923 / 9.073 |

| Prefix | Control external request wall A / B µs | Native external request wall A / B µs |
|---|---:|---:|
| Short | 138.022 / 116.946 | 25.438 / 25.969 |
| Medium | 100.952 / 93.631 | 12.149 / 11.117 |
| Long | 88.233 / 112.629 | 8.323 / 8.462 |

Across native preparations, shape/signature analysis costs 0.24–0.96 µs,
fixed-buffer setup 0.14–0.45 µs, scan/emission 4.80–8.23 µs,
flush/invalidate/publication 0.45–0.53 µs, buffer cleanup 0.20–0.42 µs,
lock acquisition 0.15–0.33 µs CPU, and ResourceMark cleanup 0.12–0.15 µs.
Residual producer CPU is 1.13–2.77 µs; the complete cuts are in
[generation data](direct-baseline-data/interpreter-publication-generation.tsv).
These include clock-reading overhead; no timer overhead is subtracted, so
submicrosecond differences should not be treated as precise isolated costs.

No measured warm preparation allocates an executable CodeBlob or MethodCounters.
ResourceArea used-byte delta and chunk-capacity growth are both zero. This
does not prove zero total CHeap/debug bookkeeping allocations: the counters
do not census every allocator. Fixed-buffer setup is bookkeeping, not fresh
executable memory allocation. Each method still consumes a prepaid 4 KiB slice.

One-time arena initialization costs 17.55–20.25 µs CPU and 16.83–19.75 µs wall,
including its mutex, committed codelet initialization and clearing 64 KiB.
The enclosing interpreter BufferBlob allocation costs 2.49–2.84 µs CPU;
338,880 requested bytes include the ordinary interpreter as well as the extra
arena/alignment. This is not the incremental allocation cost of 64 KiB and is
not per-method cost. Startup clocks are gated off when the feature is off;
this experiment has no clean flag-off differential for total startup CPU or
memory. Three slices consume 12 KiB despite only 2,023 published bytes.
[Startup data](direct-baseline-data/interpreter-publication-startup.tsv)
retains every one-time outcome separately.

## Execution savings and repayment

| Prefix | Control CPU saving A / B ns/call | Native CPU saving A / B ns/call | Native producer-only repayment A / B calls | Native observed-request repayment A / B calls |
|---|---:|---:|---:|---:|
| Short | 0.489 / 3.035 | 2.468 / 3.592 | 5,398 / 3,539 | 11,092 / 7,607 |
| Medium | 15.660 / 15.019 | 19.163 / 16.164 | 540 / 597 | 673 / 744 |
| Long | 34.326 / 42.612 | 35.925 / 40.111 | 204 / 186 | 249 / 227 |

Savings use within-JVM means of the two disabled and two on windows. Execution
is 15–21% faster for Short, 46–50% for Medium and 56–60% for Long in the native
route, but the identical generated shape also runs faster in controls, with a
particularly weak 3.3% Short outcome retained. Preparation route does not
change the generated body; the execution differences between JVMs are not a
claimed extra code-quality improvement. This sample does not establish a
stable short-method margin or workload-weighted benefit.

For each JVM and shape the arithmetic is:

```
saved_CPU_ns_per_call = disabled_CPU_ns_per_call - on_CPU_ns_per_call
repayment_calls = ceil(preparation_CPU_ns / saved_CPU_ns_per_call)
```

For Long A, `ceil(8923 / (64.434049 - 28.509007)) = 249` calls.
Long B gives 227; control observed-subtotal estimates are 1,052 and 695.
Native Medium needs 673–744 calls, Short 7,607–11,092. These calculations use
CPU on both sides; request wall latency is not divided by CPU savings.
The [paired data](direct-baseline-data/interpreter-publication-pairs.tsv)
retains all absolute execution values and repayment estimates, including the
control Short estimate of 130,144 calls. Small differences in Short's saving
make its quotient unstable.

Repayment excludes prepaid startup/arena memory, unmeasured control VM work,
entry-selection effects against a flag-off VM, production admission and
competition with C1/C2. It does not prove that useful early calls occur before
replacement; the targets are deliberately held at level 0. These figures are
neither proposed thresholds nor an application adoption verdict.

## Architectural conclusion and next bounded question

The interpreter-frame design removes an entire per-method compiled-frame
installation path. This follow-up shows that an explicit synchronous safepoint
was an artifact of the test interface rather than a runtime requirement of
these immutable prefixes. Publication itself is roughly half a microsecond;
the remaining measured core is predominantly scan/emission and interface
overhead, with first-use effects on Short. The long shape is now in a single
digit microsecond observed-request CPU budget. The small Short saving remains
too weak to justify assuming that every tiny body repays generation.

A next bounded question, before broadening coverage, is whether an ordinary
invocation-counter preparation hook can approach the measured 7.3–7.4 µs Long
core without JNI/reflection/result-array overhead and without adding entry
selection or safepoint-tail costs to all interpreted calls. That requires an
explicit admission/ownership and contention design; it is not implemented here.
The present sample cannot select its threshold or establish an application
win. Preserve the current controls and images rather than converting this
cost-isolation result into broad native-tier or policy changes.
