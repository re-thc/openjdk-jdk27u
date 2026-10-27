# Broader direct tier: requested on/off spot check

The broader compiler does not establish a net application win. Startup regresses
in both matched pairs. Whole warm-process CPU also increases in both pairs;
the 100-task warm medians improve in one pair and regress in the other. C2 is
active in every warm window, so these are not settled steady-state results.
All eight JVMs finish correctly. No result or adverse fork is discarded.

## Qualified source and matched settings

The source is `129efc47604b5bff2af0c6be93a8fb26def25185`, including long values,
allocation, handlers, FIFO selection, cached plain-call snapshots and ordinary
bytecode-intrinsic roots. All sixteen direct tests pass on release and fastdebug,
and final intrinsic-root fixture checks pass separately on both. Independent
source review finds no remaining blocker in these batches. Coverage instrumentation
is removed and production rebuilt; its libjvm hash exactly matches the qualified
release image used by both modes. Source and workloads remain local; no public
action or default change is made.

Eight serial JVMs use the unchanged CompilerWorkload: startup order off/on/on/off,
warm order on/off/off/on. Each adjacent opposite-mode pair is retained. Startup
compiles the same four Java sources once. Warm runs 1,600 tasks and prints the
existing last 100 timings after its existing compilation-time settling loop.
The loop does not guarantee subsequent quiescence. The same classpath, class
bytes, JDK content and libjvm serve both modes.

Both modes use CPUs 0–3, ActiveProcessorCount=4, G1, a fixed 128 MiB heap,
Xshare=off, CICompilerCount=3, UseCompiler, TieredCompilation,
TieredStopAtLevel=4, ProfileInterpreter and CompileThresholdScaling=1.0.
DirectBaselineThreshold=32 and DirectBaselineDedicatedWorker=true are identical
in both modes. Only UseDirectBaseline changes. The ordinary budget is one C1
and up to two C2 workers; enabling the tier adds its dedicated direct worker.
Dynamic worker creation remains normal policy, including a second C2 worker
appearing in the adverse final warm fork.

The hard-coded shared-worker 512-invocation C1 hold is inactive in both arms
because DedicatedWorker=true. There is no C1/C2 delay control, threshold tuning,
or shared/dedicated matrix in this check. TraceDirectBaseline, PrintCompilation,
LogCompilation and CITime are off. Exact settings and byte identities are in
[settings](direct-baseline-data/coverage-spot-settings.tsv) and
[identities](direct-baseline-data/coverage-spot-identity.tsv).

## Absolute costs and paired changes

| Startup pair | Off wall ms | On wall ms | Wall change | Off CPU ms | On CPU ms | CPU change |
|---|---:|---:|---:|---:|---:|---:|
| A | 535.654 | 562.637 | +26.983 (+5.04%) | 1053.302 | 1223.634 | +170.332 (+16.17%) |
| B | 510.006 | 572.839 | +62.832 (+12.32%) | 1059.698 | 1277.238 | +217.540 (+20.53%) |

These are complete process wall and wait4 CPU, including shutdown. Observed
first-result wall at JAVAC_OK is 530.086/557.171 ms off/on in pair A and
504.241/564.019 ms in pair B: +27.085/+59.777 ms. Process CPU sampled at that
marker is approximately 1030/1210 and 1050/1260 ms, with 10 ms tick resolution;
the complete wait4 CPU above is the more precise end-to-end measure.

| Warm pair | Off task median ms | On task median ms | Task change | Off process wall s | On process wall s | Off process CPU s | On process CPU s |
|---|---:|---:|---:|---:|---:|---:|---:|
| A | 6.478 | 5.541 | -14.47% | 16.807 | 16.896 | 29.732 | 31.082 |
| B | 7.187 | 7.273 | +1.19% | 18.045 | 19.929 | 31.332 | 35.777 |

Warm whole-process wall changes are +0.53%/+10.44%; CPU changes are
+1.350 s (+4.54%)/+4.445 s (+14.19%). CPU sampled from the first to last warm
result, covering approximately 99 task intervals, is 770/740 ms off/on in pair A
and 1050/1450 ms in pair B. The task improvement is not consistent, while the
whole-process CPU cost increases in both pairs. A median across the two fork
medians would hide that distinction. See [every outcome](direct-baseline-data/coverage-spot-samples.tsv)
and [absolute paired deltas](direct-baseline-data/coverage-spot-pairs.tsv).

## Compilation activity and measurement limits

External read-only observation samples existing PerfData and /proc approximately
every 100 ms and at output boundaries. It introduces no VM instrumentation,
attach JVM or diagnostic print in the workload. It is still an observer, with
sampling/CPU quantization limits. Every observed CompileBroker state is
run_compilation=1; ordinary compilation remains enabled. The existing harness
does not supply allocated-byte counts, so allocation is not newly instrumented.

Completed-compilation counts at exit are 1256/3886 off/on in startup pair A and
1270/3916 in pair B. Reported compile-body elapsed totals are 590.065/710.433 ms
and 541.752/723.158 ms. Warm exit counts are 6808/11734 and 6813/11869 off/on;
reported compile-body elapsed totals are 15.954/17.566 s and 16.394/19.051 s.
These production counters include direct and ordinary completed compilations.
Their elapsed times overlap across workers and exclude request/queue work,
worker pre-CI screening and CI/root construction. They are neither compiler CPU
nor complete direct-service cost and must not be subtracted from process CPU
as a causal ledger. In-flight work at exit is also not a completed task.

The first-to-last warm-result interval contains 35/110 completed compilations
off/on in pair A and 36/108 in pair B. Compile-body elapsed increments are
87.030/125.590 ms and 209.781/618.639 ms. Continuing C2 threads alone accumulate
80/110 ms and 150/520 ms CPU over those windows; the last on fork also has a
new C2 thread with 60 ms accumulated CPU when last observed. Normal compilation
activity is therefore material in every warm window. The additional thread's
creation/boundary timing and 10 ms tick quantization limit exact attribution.
The [activity ledger](direct-baseline-data/coverage-spot-activity.tsv) retains
these distinctions. No settled warmed-throughput win or neutrality is claimed.

## What this spot check answers

Meaningful coverage is substantially met: frozen methods are 82.85%/81.48%,
and post-initial entries 81.50%/86.62%, with total entries still 68.42%/81.32%.
Those census percentages use the preserved shared-worker/512-hold series; they
are not asserted for the dedicated-policy timing arms. Original denominators,
initial interpreted calls, refused bodies and queue exposure remain in the
[coverage report](direct-baseline-coverage80.md).

This is an on/off check of the complete current design, not an isolated timing
of the FIFO or signature patch and not a comparable cohort to older narrow
compiler timings. It answers the user's requested spot question: the feature
still costs startup wall/CPU and whole warm-process CPU, with mixed task-time
results. Coverage alone has not made it cheap enough.

The next causal task is the full direct-service/use budget under this unchanged
ordinary policy, especially work outside the existing compile timer and the
many installations' useful lifetime. It does not require further coverage merely
to compensate for initial interpreted calls. Any later C1 delay must be a
separate, explicitly decoupled control with a cost justification; no evidence
here justifies delaying C2. No further matrix or tuning is run in this spot.
