# Direct baseline: remaining-cost attribution

The direct emitter still has no demonstrated application win. The adverse
`d414c1cec9a` results remain: javac startup 470.886 versus 506.334 ms and warm
task medians 5.597 versus 5.958 ms. The following bounded diagnostics do not
erase those results. They establish that ordinary compilation continues in
the original warm window, and that queue latency is much larger than direct
compilation latency. They do **not** completely attribute the approximately
80 ms startup process-CPU difference.

The subsequent [scheduling comparison](direct-baseline-scheduling.md) implements
shared direct priority and independent baseline service, measures their early
execution and CPU costs, and retains the negative caller results.

All performance diagnostics here use `d414c1cec9a`, before the metadata fix
described below. No admission threshold, profiling rule or generated method
body changed during this attribution. There is no delayed-C1 experiment.

## Native startup sampling

Four serial forks, off/on/on/off, used the existing startup command with
async-profiler 4.6 through native `LD_PRELOAD`, `ctimer`, frame-pointer stacks
and sampled PC addresses. There was no JVMTI agent. XML nmethod address ranges
and the exit perf map identify generated code. Explicit
`-XX:+UseCodeCacheFlushing` counteracts the default change caused by
`DumpPerfMapAtExit`. These diagnostic runs also enabled compilation logging
and CITime; do not pool their timings with the original uninstrumented series.

| Samples | Off 0 | On 1 | On 2 | Off 3 |
|---|---:|---:|---:|---:|
| All threads | 281 | 296 | 286 | 280 |
| C1 compiler thread | 74 | 80 | 69 | 75 |
| C2 compiler threads | 79 | 79 | 91 | 81 |
| Interpreter PCs | 36 | 38 | 32 | 31 |
| Direct generated PCs | 0 | 0 | 2 | 0 |
| Process CPU, ms | 1136.572 | 1163.001 | 1135.093 | 1130.100 |

There is no repeated entry-barrier hotspot. Only one sample includes the
direct compiler and one includes queue selection. Two direct-body samples
are too few to estimate execution quality. The effective sampling quantum
is about 4 ms, despite requesting 500 us. Inclusive stack counts are not
additional CPU buckets. The small cohorts neither reproduce a stable 80 ms
gap nor identify a new dominant runtime cost.

Both on runs queued and started 587 direct tasks. Queue-to-start latency,
from millisecond-resolution XML timestamps, had median 1 ms, p90 5 ms and
maxima 15/16 ms. The earlier complete successful-task median was 49.179 us
CPU, including CI and installation; all 558 attempts cost 15.096 ms in that
separate retained diagnostic. Waiting for the shared C1 worker can consume
an early execution window even when emission itself is cheap. These are
different elapsed/CPU quantities, not a speedup calculation.

Source review confirms that `CompileBroker::compiler_thread_loop` initializes
the compiler runtime once before fetching tasks. Direct tasks do not run C1
HIR, LIR or allocation, nor initialize C1 for each method. The configured
three compiler threads allow one C1 worker. Sharing its queue is a concrete
latency limitation; it does not, by itself, explain the startup CPU increase.

## Startup thread accounting limit

Eight additional forks observed the original unmodified startup command at
`JAVAC_OK`, without a wrapper, altered classpath or added VM options. Median
whole-process CPU was 967.547 ms off versus 1034.549 ms on; median time to
`JAVAC_OK` was 455.662 versus 479.181 ms. This reproduces an adverse magnitude.
Several exiting processes lost compiler or main-thread `/proc` entries before
the observer read them. Their partial thread snapshots cannot partition that
67 ms CPU difference reliably.

A separate CITime-only pair reversed sign: 1129.017 ms off versus 1014.709 ms
on. C1 compiler elapsed time was 243/218 ms and C2 292/296 ms. Keep this
contradictory pair. Compiler elapsed time is not compiler CPU. No stable
dominant remaining startup mechanism follows from these observations.

## Original warm task, with window accounting

The diagnostic `CompilerWorkload` keeps the original 1500 warmup tasks,
existing compilation-stability wait and 100 measured task bodies. It adds
holds outside task timers before and after that window. The parent reads
thread CPU and direct entry counters from its own held child. It discovers
MethodCounters through VMStructs and checks the counter offset against
generated instructions. Counters for retired code remain tracked by their
MethodCounters address; new resident direct installations are also included.
The launcher main has no compiled nmethod in either codelist.

Changing the launch classpath also changes javac's implicit input classpath:
`Locations.computePath` uses `env.class.path`, then `java.class.path`. The first
diagnostic copy therefore differed from the original input. Its paired
off/on comparison showed app CPU 505.063/509.946 ms and C2 CPU
51.043/122.233 ms. The extra C2 CPU dominates that pair's extra process CPU,
but that is **not** a partition of the original startup gap.

The corrected control sets the existing javac property
`-Denv.class.path=/workspace/direct-baseline-evidence/measure-final`, restoring
the original javac search directory while loading the diagnostic launcher
from its separate directory. The unchanged 100 task bodies then gave:

| Window metric | Off | On |
|---|---:|---:|
| Elapsed window, ms | 539.784 | 521.875 |
| App/launcher CPU, ms | 527.665 | 506.004 |
| C1 worker CPU, ms | 7.861 | 10.276 |
| C2 worker CPU, ms | 105.650 | 118.932 |
| Other VM/GC CPU, ms | 22.479 | 23.879 |
| New resident ordinary C1/C2 nmethods | 10 / 34 | 12 / 25 |
| CompilationMXBean delta, ms | 110 | 138 |
| Observed direct entry delta | 0 | 251 |
| Median measured task, ms | 5.014 | 4.762 |

These are one paired diagnostic, with tracing and external holds. The caller
gap reverses, so it cannot establish a repeatable benefit. It does establish
that ordinary compilation remains active inside the user's original warm
workload, even after its existing wait. The observed loss cannot honestly be
described as a proven permanent dispatch cost on warmed C1/C2 entries.

Of the 251 direct entries, 174 are `StringLatin1.getChars` and 71
`StringCoding.encodeAsciiArray`; five other helpers account for six entries.
Printing 100 sample lines occurs inside the observed window but outside task
timers. The counters do not establish that all helper entries belong to
printing. A direct nmethod both installed and reclaimed between snapshots
would be absent from this counter set. These observations are not evidence
of substantial ongoing baseline execution
in javac's task body. Codelists and compiler CPU show ordinary compilation
phase differences, but do not identify which earlier event caused each one.

## Independent review and concrete correction

Review checked interpreter admission, cached refusal, allocation, compiler
initialization, static-call resolution, generated stack traffic and ordinary
profile/inline decisions against the current HotSpot code. C2's inline-size
heuristic uses level-4 code, so direct level-1 storage does not poison that
heuristic. Static calls use the normal patched compiled-call/c2i machinery.
No repeated eligibility scan or extra C1 initialization explains the gap.
Conservative stack banging and stack-slot traffic remain code-quality costs,
without evidence making them the dominant remaining mechanism.

A separate reproducible metadata defect was found in `ciEnv::register_method`.
If profiling becomes available while a direct task is selected, stale-install
rejection records a compilation failure. The shared failure tail increments
the new MDO's decompile history, even though no code was installed. Holding
compilation, selecting a fresh direct target, creating its MDO and releasing
the worker reproduced history **0 to 1** on `d414c1cec9a`.
The new jtreg test also fails with that same 0-to-1 assertion on a rebuilt
image whose SHA-256 exactly matches the retained `d414c1cec9a` hash
`23dec1a58f3043166357c160103587fadfae34dee796936bd751b67a945b4df4`.

The correction clears `_inc_decompile_count_on_failure` for this stale-direct
rejection, following the existing ciEnv failure convention. It changes neither
ordinary C1/C2 rejection nor admission. `DirectBaselineStaleInstallTest` checks
the queue-selected race, the explicit stale outcome, unchanged history and
continued ordinary C1 eligibility. No measured application log contained this
failure outcome; this is a correctness fix, with no claimed performance win.
An independent read-only review confirmed the scope and handshake, and caught
a Windows CRLF assumption in the test's queue parser; output is normalized.

Release and fastdebug build. All four baseline jtreg tests pass in each image:
execution/runtime operations, policy/handoff, profile retirement and stale
installation. The stale test passes again in both after line-ending
normalization, with history remaining zero. The raw first jtreg attempt selected no tests because an added
VM option conflicted with `vm.flagless`; the next exposed a test flag-type
mistake. A check against the earlier quality image installed successfully
because that image predates the MDO-install exclusion, so it is not a negative
control for this fix. All attempts are retained.

## Evidence and remaining blocker

Raw commands, native samples/maps/XML, window sources, counter snapshots,
build logs and jtreg reports are under
`/workspace/direct-baseline-evidence/remainder/`. Normalized small tables are
checked in as `direct-baseline-data/attribution-*.tsv`; raw files are unchanged.
The earlier diagnosis, adverse timing series and failed experiments remain.

The remaining blocker is performance evidence: no repeatable application win,
no established warmed neutrality, and no complete causal partition of the
remaining startup CPU. Queue latency and limited subset coverage constrain
useful early work, while ordinary compilation timing complicates the warm
comparison. This evidence does not justify a threshold campaign, delayed C1,
or a larger runtime abstraction. The prototype remains opt-in, unpublished,
and separate from C1's compilation pipeline.
