# Direct baseline: independent audit and causal diagnosis

Most of the large startup loss came from missing nmethod entry-barrier
registration. The direct emitter built a real compiled frame and emitted its
barrier, but the barrier runtime did not recognize the new compiler identity.
A matched experiment recovers most of the loss with a one-line predicate fix.
The prototype remains opt-in and off by default. The results below do not yet
establish application benefit or warmed neutrality.

**Final outcome:** the corrected prototype still fails the performance gate.
The final same-image comparison has javac startup 470.886 ms off versus
506.334 ms on (+7.5%), and the measured warmed window 5.597 versus
5.958 ms/task (+6.5%). No delayed-C1 experiment or adoption claim follows.

The independent review was read-only. Its findings were checked against the
current HotSpot implementations and reproduced before correction. The direct
bytecode emitter remains separate from C1 parsing, HIR, LIR and register
allocation. Ordinary C1/C2 implementations and thresholds are preserved.

The follow-up [remaining-cost attribution](direct-baseline-attribution.md)
retains these adverse results and reports bounded native sampling, accounting
inside the original warm workload, and a separate stale-install metadata fix.

## Concrete defects and corrections

1. **Entry barriers and invalidation.** `C1_MacroAssembler::build_frame` emits
   an x86 nmethod guard initially equal to zero; the initial disarmed phase is
   one. `BarrierSetNMethod::supports_entry_barrier` omitted the direct type, so
   reads falsely reported a disarmed guard and writes did nothing. Every
   direct entry consequently spilled registers, called the runtime, and ran
   `cross_modify_fence` (SERIALIZE/CPUID). The same omission prevented the
   not-entrant guard from closing an old entry. A compiled static caller
   continued calling the old direct entry after C2 replacement. Recognizing
   the compiler type fixes both contracts; the emitted layout is already the
   C1 layout expected by the x86 barrier implementation.

2. **Queue priority.** Returning the first direct task immediately bypassed
   ordinary blocking/rate selection. The queue now remembers a direct candidate
   while preserving ordinary selection, using direct work when no ordinary
   candidate remains. Identity, stale-install rejection and the separate
   pending state remain explicit.

3. **Avoidable work.** Per-bytecode arrays and labels were allocated before
   rejecting method shape/size. They now follow that rejection. Compilation
   clocks and a generated MC load used only by tracing are conditional on
   tracing. Permanent runtime exclusions and refusals because ordinary work
   already won are remembered, avoiding periodic requests on the masked early
   trigger. Serial/G1 are the admitted collectors.

4. **Profiling provenance.** Advancing MDO invocation counts without collecting
   profiles can falsely mature a queued C1 task. A blocked-worker reproducer
   admitted C1 at total 256, then downgraded its queued level-3 task to level 2
   after direct execution reached total 8,256 (MC 512 + MDO 7,744). An attempted
   profile-start subtraction was rejected during review: separate racy
   increments drift, carry bypasses subtraction, and C2 scaling still uses
   raw MDO counts. Its patch and terminated build logs are retained.

   The bounded correction retires direct code when MDO profiling becomes
   available. An entry uses the ordinary counter and mask, then deoptimizes
   before bytecode 0; the current activation continues interpreted and records
   real profiles. No executed Java body is replayed. Existing-MDO methods
   fall back at request/selection/installation. This avoids special profile
   fields, maturity rules or C2 scaling changes. It can shorten direct tenure
   and create an interpreted interval before ordinary C1. The exact point
   depends on real MDO creation, including inlined profiling; it is not a
   universal 128-call boundary. Counter-overflow scope state also uses
   SynchronizationEntryBCI rather than bytecode 0.

## Isolated entry-barrier experiment

Same Java/modules/native image, replacing only libjvm; six serial interleaved
forks per configuration; no tracing or profiler during timing. The before
image is local commit `9b88ceeb4ff`, already containing the integer ABI fix.
The barrier image adds only the barrier predicate correction. Ordinary
thresholds, masks and compiler counts are unchanged.

| javac startup median | Off | Before barrier fix | Barrier fix only |
|---|---:|---:|---:|
| Wall, ms | 490.071 | 668.484 | 510.796 |
| Process CPU, ms | 1,048.586 | 1,283.298 | 1,097.972 |

The fix recovers 157.688 ms of the 178.413 ms added wall time in this series,
about 88%. CPU falls 185.325 ms. This measures the combined effect of fast
entry and correct handoff; it does not assign every saved cycle solely to the
serialization instruction. The earlier 134 ms gap belongs to a different
series and must not be subtracted from these measurements.

Native-only CPU sampling found `nmethod_stub_entry_barrier` in 24/315 and
28/340 samples with the broken feature, zero with it off, and zero after the
predicate correction. These profiles used async-profiler 4.6 through
LD_PRELOAD without JVMTI. The initial ordinary-agent profiles were confounded:
JVMTI exclusions prevented every direct installation. Removing the profiler's
requested tagging capability did not repair that confound; those attempts are
retained and excluded from attribution. Native preload smoke produced 111
installations. CPU samples have limited resolution and are not per-entry
counts or an exact millisecond accounting.

Read-only snapshots of our held child JVM located MethodCounters through
exported VMStructs and verified the trace-counter offset against generated
instructions. All 111 known old direct nmethods were resident, with 30,865
entries. Unambiguous identities accounted for **8,931 entries after handoff**:
StringLatin1.getBytes contributed 4,192, StringUTF16.compress 2,184 and
Unsafe.toUnsignedInt 1,430. The retirement build before the final refusal-cache
lock cleanup had 104 resident direct nmethods, 18,980 entries, and one entry
after an unambiguous handoff, consistent with an in-flight call.

This host reports no SERIALIZE support. The exact CPUID(0) sequence used by
cross_modify_fence measured 4.130–4.248 microseconds/call in three standalone
100,000-call samples. Multiplying by the broken build's entry count gives
roughly 130 ms of fence work. This estimate from separate diagnostics is not
a subtraction across timing cohorts, but explains how cheap compilations
coexisted with a much larger startup loss. Both slow entry and stale calls
contribute. process_vm_readv was unavailable (ENOSYS); the same owned-child
reads succeeded through read-only /proc/PID/mem. No approval review denied an
action.

## Queue/allocation cleanup stage, before profiling retirement

A separate six-fork startup comparison gave off 484.481 ms, barrier-only
509.189 ms and cleanup 511.963 ms. Thus these small cleanups have no measured
startup win here. The cleanup image still costs 27.482 ms wall and 48.355 ms
process CPU relative to its same-image off control.

Three warmed javac forks, using the existing 1,500-task warmup and 100-task
measurement, gave these fork medians:

| Fork | Off, ms/task | Cleanup, ms/task |
|---|---:|---:|
| 0 | 5.633 | 5.828 |
| 1 | 7.948 | 5.864 |
| 2 | 5.542 | 6.266 |

The medians across forks are 5.633 and 5.864 ms (+4.1%). This is noisy,
compilation-active evidence, not proof of peak neutrality or a repeatable
precise loss. Separate diagnostic windows contained 50 off / 90 on compilation
state lines between their first and last samples. Whole-process CPU medians
were 29.666 and 30.072 seconds. Runtime XML deoptimization events were 38/40
and runtime uncommon traps 54/48; these counts do not show a deoptimization
storm explaining the original startup gap. Never pool this stage with the
final profiling-retirement build.

## Coverage and accounting at the cleanup stage

Two traced javac startup runs installed 105/110 direct nmethods, including
11 javac-owned methods each. There were 574/586 tasks, costing 16.955/16.142 ms
CPU in total, including failed attempts and CI/install work. The first run's
469 failures comprised 361 unsupported-bytecode, 76 shape, 21 constant-type,
eight loop and three other rejections. Fully qualified compilation identities
do not repeat. Successful compilation alone cannot explain the original gap.

For names/signatures uniquely identifying a direct install, 44/49 subsequent
ordinary admissions had 14,244/16,159 direct entries before admission, and
16,838/18,926 by handoff. Median entry counts before admission were 243/224.
The logged install-to-admission median was 88.5/90 ms elapsed, and to handoff
91.5/91 ms. These are trace-perturbed tenure windows, not CPU saved or speedup;
class loading and intervening work occupy much of them. Sixty-one direct
methods in each run had no ordinary nmethod by application exit, and their
remaining entry counts are not captured by handoff logs. Counts are therefore
partial, rather than a claim of complete execution coverage.

The XML records 1,158/1,159 unique ordinarily compiled methods, far more than
the direct subset. Among methods with nonzero counters and MDO dumps,
327/307 had no standalone nmethod; 72/76 were javac-owned. These methods may
execute inlined, so this is not an interpreter-time count. Colder methods
without MDOs are absent from this denominator. The prototype's static,
forward-only subset leaves substantial application work uncovered.

CITime reported total compiler elapsed time 0.657 s off and 0.657/0.694 s on;
C1 components were 0.291 versus 0.303/0.317 s. These diagnostic totals vary and
are not interchangeable with process CPU. Remaining overhead is not fully
attributed between unsuccessful work, execution quality and changed ordinary
compilation history. The old retained/code-cache measurements remain in the
historical results and must not be relabeled as measurements of the final build.

## Final image and validation

The final cleanup puts permanent-refusal cache writes under
MethodCompileQueue_lock, matching C++ readers. It adds no field or policy
abstraction. Release and fastdebug build successfully. DirectBaselineTest,
DirectBaselinePolicyTest and DirectBaselineProfileTest pass in both images.
Retirement also passed with uncompressed oops before this locking-only cleanup.
The profile test waits for asynchronous early installation and disables load
feedback only inside the test to isolate its 255/256 boundary. Timed VMs retain
ordinary load feedback and all thresholds. Earlier failures from fixed-wait
and handoff-trace assumptions remain in the raw logs.

The guard test fails before correction with guard zero. A separate linked-call
reproducer fails because its machine call still targets the direct entry after
C2 replacement. Both assertions pass unchanged in the final image. The
retirement test verifies interpretation begins while ordinary compilation is
held, and exactly 8,256 calls execute 8,256 bodies. Retirement can miss one
normal parameter-type entry sample; body profiling resumes at bytecode 0.

The final comparison has six startup and three warmed forks per mode and
workload, all 36 processes successful. The only effective-flag difference is
UseDirectBaseline. SHA-256 confirms non-libjvm regular-file contents match the
stock image. Image hashes are in diagnosis-image-manifest.tsv.

| Median metric | Final image off | Final image on |
|---|---:|---:|
| javac startup, ms | 470.886 | 506.334 |
| Parser startup, ms | 77.810 | 81.913 |
| Measured warm javac task, ms | 5.597 | 5.958 |
| Measured warm parser batch, ms | 23.053 | 23.633 |

javac warm fork medians were off 4.836/5.597/6.195 and on
6.369/5.390/5.958 ms. Startup process CPU was 1,012.679 versus 1,092.443 ms;
warmed whole-process CPU was 26.790 versus 27.434 seconds. The preceding
pre-lock retirement series also lost at its medians: javac startup
445.072→464.266 ms and warmed task 5.693→5.941 ms. Keep the series separate.
Variation prevents an exact peak-loss estimate, but provides no basis to
accept the implementation's warmed performance.

A bounded six-pass parser check reused the unchanged original workload,
waited 500 ms before the last pass, and measured that pass. Fork medians were
off 21.402/20.571/20.654 and on 21.165/21.759/21.534 ms. The across-fork
medians still differ by +4.3%. This is an extended warm check, not proof of
complete compilation quiescence. No thresholds changed.

The pre-lock retirement snapshot's complete direct-task CPU was 15.096 ms for
558 attempts and 104 successes; successful full-task median was 49.179 us,
including CI/install work. Its resident blobs were 71,192 bytes plus 26,792
bytes auxiliary data (95.7 KiB, excluding allocator overhead). The final lock
cleanup changes refusal handling, not generated bodies, but these remain
explicitly pre-lock accounting measurements. MethodCounters remains 72 bytes
versus stock 64, including when the option is off.

The remaining final startup CPU increase is about 80 ms, not fully attributed
by the 15 ms direct-task diagnostic. Baseline execution quality, eligibility/CI
overhead and changed ordinary compilation history remain performance blockers.
The direct compiler has useful source and representative runtime coverage,
but no demonstrated application win. Correctness and recovery of the original
barrier mistake do not satisfy the missing requirement.

## Reproduction and evidence

Raw commands, profiles, images, logs and failed experiments are local under
`/workspace/direct-baseline-evidence/diagnosis/`. Small timing/profile tables
are checked in beside the earlier retained data:

- `direct-baseline-data/diagnosis-barrier-startup.tsv`
- `direct-baseline-data/diagnosis-quality-samples.tsv`
- `direct-baseline-data/diagnosis-native-samples.tsv`

The common timing flags remain Xshare off, G1, 128 MiB initial/max heap,
ActiveProcessorCount 4 and CICompilerCount 3, pinned to CPUs 0–3. No builds or
correctness tests ran concurrently with these timed samples. No delayed-C1
retuning follows the failed earlier experiment. PR95 was rechecked through
GitHub: still open, draft, unmerged at
`5ccc4bfff24830c1b88f093a2cd438304e51983f`. No public mutation, CI dispatch,
merge or Library transfer occurred.
