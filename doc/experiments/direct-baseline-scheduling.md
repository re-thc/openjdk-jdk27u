# Direct baseline: shared priority and dedicated service

Independent service removes the C1 scheduling bottleneck. It does not produce
an application win in this experiment. Median javac startup is 486.418 ms off,
494.301 ms with shared direct priority and 524.251 ms with a dedicated worker.
Warm measurements remain variable and do not establish neutrality. The direct
emitter stays opt-in; ordinary C1/C2 code generation and promotion thresholds
are unchanged in this comparison. The subsequent single bounded
[delayed-C1 comparison](direct-baseline-delayed-c1.md) uses shared priority;
these dedicated-worker results remain preserved.

## Implementation and controls

The preserved reference is local commit `661cf0e8e06`. Four cases are compared:

| Case | Service |
|---|---|
| Off | Baseline disabled, ordinary policy |
| Ordinary first | Existing shared C1 worker; direct tasks use spare capacity |
| Shared priority | FIFO direct work before nonblocking ordinary C1 work |
| Dedicated | One additional CompilerThread and its own direct queue |

Shared priority preserves blocking/WhiteBox priority, stale cleanup and
ordinary rate selection/level adjustment. A fixed limit of eight consecutive
direct selections while ordinary work waits bounds interference with profiling
and OSR. This is a task-count bound, not a time bound. It cannot preempt an
ordinary C1 compile already executing. There is no adaptive scheduler or
promotion-threshold change.

`DirectBaselineDedicatedWorker` selects the service mode in the final image.
It defaults true, but creates a worker only when the explicitly opt-in
`UseDirectBaseline` is enabled and C1/platform support exists. False selects
shared priority. The independent worker adds capacity: configured ordinary
C1/C2 counts remain unchanged. It never runs ordinary compilation jobs.

The worker uses the normal compiler-thread loop, task identity and installation
contracts. Startup waits on the existing compiler-state monitor for Runtime1
initialization by C1. It neither allocates a C1 buffer nor runs C1 setup/IR.
Third-compiler logging, queue diagnostics, class-unloading marking, shutdown
deletion and total thread accounting are explicit. Dynamic removal excludes
the third identity. Initial creation follows the existing fatal-on-failure
compiler-thread contract, with the count published after successful creation.
Review caught and corrected premature count publication before testing.

The ordinary method-wide queued bit still belongs exclusively to ordinary
requests and stays set during their service. Direct tasks retain their
separate identity/one-request state. Ordinary requests and installations can
win; selection and installation reject stale direct work. No mandatory ladder
or warmed C1/C2 call-dispatch hook is introduced.

Threshold feedback already uses `ordinary_size()`. Dynamic C1 worker creation
incorrectly used raw shared-queue size; both queue/4 calculations now also use
`ordinary_size()`. This defect cannot explain the preceding measurements:
CICompilerCount=3 permits only one C1 worker there. It matters when more C1
workers are permitted. The dedicated queue is outside both calculations.

## Scheduling and actual early work

The original retained logs show later ordinary C1 tasks overtaking 216/587 and
168/587 direct requests. Their millisecond timestamps cannot resolve short
overlaps reliably. The corrected diagnostic records existing task-created,
enqueued, ciEnv-start and completion timestamps at nanosecond resolution.
ciEnv records its start after the task header is written, so that field must
be read in the completion record. The initial zero-valued header records and
the failed analysis are retained; negative derived latencies are invalid.

| Corrected logged fork | Shared priority 1 | Shared priority 2 | Dedicated 1 | Dedicated 2 |
|---|---:|---:|---:|---:|
| Entered ciEnv | 590 | 592 | 591 | 591 |
| Queue to ciEnv median, us | 210.589 | 241.505 | 76.285 | 75.424 |
| Queue to ciEnv p90, us | 916.050 | 1138.315 | 277.985 | 354.014 |
| Queue to ciEnv maximum, us | 14216.015 | 15288.696 | 3653.620 | 3559.638 |
| Successful service median, us elapsed | 83.817 | 73.336 | 79.250 | 81.642 |

Three shared-priority tasks in the first fork became stale before entering
ciEnv and have zero service timestamps; they are counted separately, not
converted to negative waits. Created-to-enqueued medians are 0.05–0.07 us;
this excludes work before task creation. Service includes CI/install work
and diagnostic overhead. It is not emitter-only CPU.

In the shared-priority forks, 299/590 and 344/592 serviced direct requests
arrived during an ordinary C1 compile. Remaining C1 service had medians
223.583/186.973 us, p90 1346.950/1233.759 us and maxima
14186.360/15229.737 us. It accounts for about 68% of summed request-wait
exposure in those forks. Summed exposure double-counts overlapping waits;
it is not CPU. Independent service removes this head-of-line dependency,
while CPU contention, safepoints and install locks remain.

Trace counters now increment only when execution reaches the Java body,
excluding entry-time profiling retirement. Admission records include class
identity and retained counts after retirement. Final snapshots cover every
successful installation in these startup runs. For methods never ordinarily
admitted by exit, all their body entries precede such admission.

| Body entries before first ordinary admission or application exit | Ordinary first | Shared priority | Dedicated |
|---|---:|---:|---:|
| Initial logged pair | 16936 / 18078 | 21828 / 21998 | 22626 / 22090 |
| Corrected timestamp pair | 19569 / 18624 | 21948 / 22018 | 21436 / 21287 |

Shared priority provides most of the execution gain. Dedicated versus shared
changes these counts by about +2% in the first pair and -3% in the second.
In the first pair, dedicated installs 110/111 methods and uses 105/106;
shared priority installs 109/110 and uses 102/104. Only 11 installed methods
are javac-owned, with about 2400 body entries each run; most coverage remains
small JDK helpers. This is observed coverage, not an estimate of interpreter
CPU saved. Entry snapshots include the small marker/attach interval; they are
process-level counters, not isolated javac task counts. First-entry time is
bounded by installation and admission/exit observations, not directly timestamped.

## CPU accounting and its limits

The earlier `d414c1cec9a` startup process-CPU difference is **79.764 ms**.
Its complete per-thread partition was not retained. The separate pre-lock
diagnostic records 15.096 ms of direct-task CPU, including rejections. Charging
that entire amount against the historical gap still leaves **64.668 ms
unallocated**, but this is a cross-cohort budget check, not an attribution.
Neither sparse samples nor the following new forks close that historical gap.

A held caller restores javac's original implicit input classpath through
`env.class.path`, runs the unchanged startup body, and captures thread CPU
before snapshot/attach diagnostics. Complete process CPU comes from wait4.
Main/launcher CPU includes interpreter/baseline execution, synchronous runtime
transitions and deoptimization; those are not separately timed. Worker CPU
includes broker/lifecycle work as well as compilation.

The following means use two forks per case with tracing but **without XML
logging**. Off and ordinary-first use the same control image. Dedicated uses
the new image. Keep these diagnostic means separate from uninstrumented caller
medians and from the XML-logged cohort.

| CPU, ms | Off | Ordinary first | Dedicated |
|---|---:|---:|---:|
| Main/launcher | 407.093 | 417.234 | 459.917 |
| C1 worker, inclusive | 198.161 | 217.926 | 224.418 |
| C2 workers | 265.406 | 267.476 | 306.868 |
| Direct worker | 0 | 0 | 23.341 |
| GC threads | 0.451 | 0.463 | 0.543 |
| Other VM threads | 2.328 | 1.161 | 1.242 |
| Observed diagnostic phase after caller | 4.162 | 7.446 | 4.983 |
| Unallocated after final thread snapshot | 2.464 | 1.211 | 3.145 |
| Complete process | 880.065 | 912.918 | 1024.457 |

The ordinary-first difference is 32.853 ms. Of its C1-worker increase,
12.354 ms is measured inside direct tasks: 4.389 ms successes and 7.965 ms
rejections. The remaining C1/compiler/broker difference is 7.411 ms. Main adds
10.141 ms and C2 2.070 ms; VM/GC and diagnostic/remainder differences finish
the ledger. These buckets do not distinguish extra ordinary compilation from
queue/wrapper work outside the direct timer.

Dedicated worker CPU splits into 5.702 ms successful direct tasks, 8.991 ms
rejections and 8.648 ms outside the invocation timer. With XML logging the
corresponding outside-timer amount is about 14.250 ms; it includes queue,
initialization and completion/logging work. Do not attribute all of it to
thread startup or extrapolate it to unlogged callers. Relative to off, most
of this dedicated cohort's additional CPU is in main (+52.824 ms), ordinary
C1 (+26.257 ms) and C2 (+41.462 ms), beyond the 23.341 ms direct worker.
Resident ordinary compilation counts differ little (C1 about 1170–1186,
C2 122–127). Counts alone do not determine compilation complexity or cost.
The study does not isolate profile/code-shape effects from cache/frequency
and contention effects. Hardware-cycle counter access was unavailable
(`perf_event_open` returned ENOENT); no approval review rejected it.

## Caller and retained costs

The uninstrumented comparison uses four startup forks and two warm forks per
case. The original 1500 warmup and 100 measured javac tasks, stability wait,
source inputs, classpath, heap/collector, affinity 0–3, ActiveProcessorCount=4
and CICompilerCount=3 are unchanged. No builds or correctness tests ran during
timing. The fastdebug build was paused, then resumed for analysis.

| Median metric | Off | Ordinary first | Shared priority | Dedicated |
|---|---:|---:|---:|---:|
| Startup wall, ms | 486.418 | 489.969 | 494.301 | 524.251 |
| Startup process CPU, ms | 1011.266 | 1023.161 | 1027.225 | 1097.409 |
| Warm task, ms | 5.319 | 5.886 | 5.377 | 5.541 |

Warm fork medians are off 4.608/6.031, ordinary-first 5.731/6.040,
priority 5.599/5.155 and dedicated 5.531/5.550 ms. This variability does not
establish a repeatable warm win or neutrality. Whole warm-process CPU medians
are respectively 27.978/26.799/27.816/28.266 seconds, including warmup and
compilation; they are not CPU for the 100-task window.

A parked-worker diagnostic with matched NMT flags finds 1.611 ms accumulated
direct-worker CPU by its idle snapshot, including possible bootstrap work,
and another 0.092 ms over 5.2 seconds idle. Whole-process CPU is 80.584 ms
shared versus 76.622 ms dedicated in this single noisy pair, not a startup-win
claim. The added worker reserves about 1026 KiB of thread memory, commits
18 KiB more, and adds about 2 KiB in the compiler NMT category. It does not
retain a second C1 buffer. MethodCounters remains 72 bytes versus stock 64,
including when baseline is off. The coverage table separately records code-cache
blob sizes, auxiliary metadata and the smaller nmethod section-size statistic;
allocator overhead is excluded. The initial dedicated snapshots retain
101.6/102.6 KiB of blobs plus auxiliary data, versus 101.0/101.9 KiB for shared
priority and 92.4/98.0 KiB for ordinary-first service.

All 377 non-libjvm regular files share identical inodes across the release
images. Shared priority and dedicated timing use the same libjvm. Effective
flag comparisons differ only in UseDirectBaseline and, for shared priority,
DirectBaselineDedicatedWorker. The final timestamp-only correction has its
own image hash and does not replace the timed image or its adverse results.

## Validation, outcome and evidence

Release and fastdebug build; all four baseline jtreg tests pass. The stale
test exercises both service modes. Absent-C1/high-only startup and debug
injected compiler-creation checks pass. Independent review checked scheduling
and dedicated lifecycle. It found the count-publication defect before testing;
no remaining lifecycle blocker was identified.

The intermediate priority fastdebug build was deliberately terminated after
the release tests passed; its log remains. A later environment transport
outage interrupted inspection, not the completed experiments. Source/data
survived; the original build resumed and completed without a duplicate build.
Initial invalid timestamp files and both contradictory diagnostic cohorts
remain under `/workspace/direct-baseline-evidence/scheduling/`.

Small tables and image hashes are checked in as
`direct-baseline-data/scheduling-*.tsv`. Commands, effective flags, XML,
codelists, counter snapshots, source patches, scripts, images and test reports
remain local in that evidence directory. No public action or Library transfer
occurred. `661cf0e8e06` and its images remain preserved.

This architecture would be worthwhile if cheap compilation and broker costs
are amortized by useful interpreter work avoided, while ordinary optimization
remains timely and warmed caller performance is neutral. Here, removing C1
head-of-line blocking measurably improves service latency, but adds little
coverage beyond shared priority and no demonstrated caller benefit. Rejected
attempts and broker work are substantial relative to successful emission;
the static, loop-free subset reaches little javac-owned work. A narrower
pre-CI rejection path or materially broader useful coverage would require its
own measured justification. Neither threshold tuning nor a larger scheduler
is supported as a fix for the current result.
