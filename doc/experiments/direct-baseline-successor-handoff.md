# Direct baseline: stay compiled until the successor installs

The direct tier now continues executing while profiling C1 compiles. MDO
allocation no longer sends it back to the interpreter. This is a small
handoff/accounting correction using HotSpot's counting-only C1 convention,
not a profiling framework or reuse of C1 IR. In the held-compiler test,
8226 direct body entries hand off with MC=8258 and MDO=0; C2 then requires
5120/5136 genuine profiling calls. Unprofiled entries no longer age the MDO,
and a real null-guard deoptimization preserves the count and bytecode state.

This meets the requested execution mechanism, but does not yet demonstrate
an application win over ordinary policy. In a fresh matched cohort, median
javac startup is 439.729 ms off, 466.929 ms with unchanged C1 admission and
446.385 ms with the single later-admission point. Delaying C1 helps relative
to unchanged admission here, but still costs 6.655 ms wall and 10.141 ms CPU
versus off. Warm task medians favor the delayed case, with substantial fork
variation. No default-on or adoption claim follows.

The preceding retire-to-interpreter experiment is preserved at local commit
`5f04dac31ad` and in [its report](direct-baseline-delayed-c1.md). Its 512
comparison was a diagnostic, not success at reducing interpreter residency.
The dedicated-worker negative result and all earlier failures also remain.

## The smallest compatible handoff

`c1_LIRGenerator.cpp::increment_event_counter_impl` already uses
MethodCounters for counting-only C1 (level 2), even when an MDO exists.
The direct emitter now does the same. It always increments the real MC
invocation counter using its existing mask, and reports level 0 through the
existing Runtime1 overflow stub. Method total hotness remains MC+MDO.
Genuine interpreter/C1 profiling, including inlinees, advances MDO counters;
direct execution does not. MDO maturity, C2 transition deltas, reprofile
start fields and CI scaling retain their ordinary inputs. No counters are
copied, reset or backfilled at a guard deoptimization.

Stock MDO creation still runs. A live direct activation now keeps executing
after metadata allocation instead of retiring before its Java body. Ordinary
installation replaces the direct nmethod using the existing entry barrier,
invalidation and static-call resolution contracts. No interpreted profiling
bridge is needed. This removes the MDO test, MDO increment, retirement branch
and retirement runtime call from generated entry code. There is no new hot
C1/C2 dispatch hook and no per-method custom profile-age state.

The shared 512 experiment retains its live-code/task/OSR checks and level
2/3 scope; it no longer requires MDO absence. C2 and simple-compilation
decisions bypass it. The original should_create_mdo policy, including its
old-method, training and C2-load exceptions, executes first. Training/replay
remain excluded from direct compilation. Request/selection/installation still
conservatively reject new direct work when an MDO already exists. Broadening
those eligibility checks is not part of this change.

MC notifications keep their original frequency and phase. With concurrent
genuine MDO profiling, a notification is not necessarily at an exact multiple
of aggregate MC+MDO; these remain ordinary approximate counters under
contention. This is the existing unprofiled-C1 convention, not an accidental
counter reset or MDO-origin switch. The no-load-feedback regression still
observes ordinary admission at 256, or the deliberately delayed 512, while
the real caller retains queue feedback and all notification flags.

The tradeoff is explicit: C1's own profile collection starts later. An empty
allocated MDO does not become mature while direct executes. Once C1 installs,
its real profiles can mature toward C2. Genuine profiles from other compiled
inlinees remain credited in the meantime, so C2 can bypass a standalone C1
version. No explicit C2 delay is added.

For example, in the first delayed logged fork, StringLatin1.canEncode(int)
requests/installs direct at counts 32/55 (34 ms). Its C1 opportunities at
256 and 384 are deferred. It remains direct while genuine MDO credit appears
elsewhere, requests C2 at MC 512 + MDO 5197 = 5709 (301 ms), and hands off
directly to C2 at MC 524 + MDO 5197 = 5721 (301 ms), after 469 direct entries.
There is no standalone C1 request/install for that root. The logs do not
identify the contributing profiling callers; direct code cannot have supplied
the MDO increments. Delaying C2 would only postpone this valid optimization.

## Execution, residency and application coverage

Two XML/trace startup forks per case use matched inputs and service. Both
enabled cases use the new always-MC emitter; only the bounded C1 guard
differs. The ordinary-admission control image omits that guard. There are
no builds or tests alongside these diagnostics or primary caller timing.

| Logged startup observation | Unchanged C1 admission | Delay 512 |
|---|---:|---:|
| Installed direct methods | 110 / 110 | 109 / 109 |
| Methods with body entries | 105 / 104 | 102 / 103 |
| Total direct body entries | 29276 / 31019 | 31968 / 33965 |
| Entries before admission or held snapshot | 25752 / 27685 | 29146 / 30035 |
| Javac-owned direct methods | 11 / 11 | 11 / 11 |
| Javac-owned body entries | 3594 / 4030 | 3765 / 3747 |
| Actually deferred roots / events | 0 / 0 | 27 / 36; 29 / 40 |
| Median first ordinary admission count | 384 / 384 | 512 / 512 |
| Direct roots with installed ordinary C1 | 46 / 43 | 38 / 36 |
| Direct roots with installed C2 | 4 / 5 | 4 / 4 |

The delayed case has 9.4% more total direct entries than unchanged admission
in this cohort. The preceding retire-at-MDO candidate had 25366/25498 entries
and only 2568/2411 javac-owned entries in its separate cohort. Do not interpret
cross-cohort count or timing differences as a causal performance partition.
The controlled held-compiler test isolates the removed interpreter bridge.
Application coverage still consists mostly of small JDK helpers; no new
bytecode subset or eligibility expansion is hidden in this result.

Observed direct-install to ordinary-install intervals have medians 66 ms
unchanged and 123 ms delayed, over roots that hand off. These are residency
opportunities spanning idle gaps and execution of other methods, **not CPU
spent executing baseline code**. Body counters are actual entries. The final
snapshots include small marker/attach work and methods with no ordinary
admission contribute their final count to the early-entry total. The handoff
log precedes invalidation; 5/14 versus 11/33 additional entries occur between
that log and the final snapshot, including concurrent/in-flight entries.
The linked-call regression verifies that replacement redirects an existing
compiled caller without recompiling it.

| Javac-owned normal/OSR installations, logged process | Off | Unchanged | Delay 512 |
|---|---:|---:|---:|
| C1 installations | 228 / 239 | 234 / 220 | 240 / 220 |
| First C1 install, ms from VM start | 220 / 210 | 246 / 197 | 227 / 209 |
| C2 installations | 19 / 19 | 18 / 18 | 21 / 19 |
| First C2 install, ms from VM start | 306 / 311 | 344 / 276 | 314 / 297 |

These actual arrivals demonstrate progress, not identical optimizer timing
or a mandatory ladder. Per-root requests, installs and handoff counter origins
are retained. No automatic C2 threshold change is justified by them.

## CPU for known execution stages

A small separate probe times a loop-free branch/field/int-array method called
from the same already-compiled C2 batch loop. Compilation is held during each
interpreter/direct/C1 measurement, method levels are checked before and after
every sample, and the target later reaches C2 after real C1 profiling. This
is one process per mode with five 200000-call samples, not an application
benchmark or an admission experiment. ThreadMXBean measures actual caller
thread CPU around the batch. Source, commands and every sample are retained.
The manual source is `compiler/baseline/eval/StageProbe.java`; compile with
the test WhiteBox classes on javac's classpath and place those classes on
`-Xbootclasspath/a` at runtime with WhiteBoxAPI enabled. The retained command
files contain the exact flags, including dontinline for the probe methods.

| Target stage | Median CPU, ns/call |
|---|---:|
| Interpreter, off process | 39.136 |
| Direct, enabled process | 22.390 |
| Ordinary C1 level 2, off process | 2.696 |
| Profiling C1 level 3, enabled process | 3.281 |
| C2, off / enabled processes | 2.469 / 2.096 |

For this body, direct execution saves about 17 ns/call against interpretation
and is much slower than ordinary C1. C1's two profiling modes differ in these
processes and must not be presented as identical C1 controls. At that saving,
a few hundred calls buy only several microseconds; they do not amortize a
successful compile/install costing tens of microseconds. This is an example
of the amortization constraint, not a threshold recommendation or an estimate
of CPU saved by all javac methods.

A bounded native sampling triplet uses the existing async-profiler software
ctimer, leaf PCs and exported interpreter/code ranges. Total CPU weights
include timer overruns. Estimated interpreter-code weights are 134.0/121.5/
150.5 ms off/unchanged/delayed; no leaf sample hits direct code. Native runtime,
other libraries and unmatched generated code account for much of main CPU.
The sparse samples do not establish less total interpreter CPU in javac and
cannot measure its small direct-code CPU bucket. They remain separate from
exact stage-probe CPU and primary uninstrumented results. An initial pilot
overlapped correctness tests and incorrectly scaled raw sample counts by
0.5 ms; it is retained and excluded. The corrected isolated triplet uses
overrun-adjusted total weights. It is not extended into an open-ended profile.

## Matched caller and full CPU budget

The unchanged original javac caller runs four startup and three warm forks
per case in serial interleaved order. Source inputs, implicit classpath,
1500 warmup tasks, the existing stability wait and 100 measured tasks are
unchanged. All exits are zero. Flags remain -Xshare:off, G1, 128 MiB heap,
ActiveProcessorCount=4, CICompilerCount=3, shared direct service, affinity
0–3, with tracing/XML disabled for timing.

| Median metric | Off | Unchanged | Delay 512 |
|---|---:|---:|---:|
| Startup wall, ms | 439.729 | 466.929 | 446.385 |
| Startup process CPU, ms | 963.824 | 1008.315 | 973.965 |
| Warm task, ms | 5.955 | 5.293 | 5.104 |
| Whole warm-process wall, s | 16.179 | 15.911 | 16.165 |
| Whole warm-process CPU, s | 27.234 | 27.812 | 27.281 |

Warm fork task medians are off 6.192/5.955/5.520, unchanged
5.003/6.632/5.293 and delayed 5.104/5.851/4.933 ms. The favorable delayed
warm median is retained, together with this variance and earlier adverse
cohorts. Startup remains worse than off. Neither adoption nor repeatable
warmed neutrality is established by these small cohorts.

One diagnostic wrapper per case retains the original 100-task window. It
finds CompilationMXBean increases of 108/183/96 ms, new resident C1/C2
installations of 11/33, 10/33 and 12/28, and direct entry deltas of 0/258/313
for off/unchanged/delayed. This warm workload continues to include compilation
and a little direct execution. It is not relabeled as steady state. One
sampled thread disappears per process, so per-thread window CPU is incomplete;
the compiler bean is independent. Diagnostic warm medians 6.556/7.450/5.195 ms
do not replace the primary timing.

The XML startup cohort gives these per-case mean CPU budgets:

| CPU, ms | Off | Unchanged | Delay 512 |
|---|---:|---:|---:|
| Main/launcher | 454.380 | 437.628 | 449.038 |
| C1 worker, inclusive | 280.442 | 292.536 | 286.730 |
| C2 workers | 305.055 | 296.471 | 295.436 |
| GC | 0.574 | 0.551 | 0.611 |
| Other VM | 1.313 | 2.243 | 1.288 |
| After-ready and unobserved CPU | 11.441 | 18.750 | 13.639 |
| Complete process | 1053.204 | 1048.179 | 1046.742 |

Within C1, direct tasks consume 19.705 ms unchanged and 18.924 ms delayed.
The delayed amount is 7.238 ms successful plus 11.686 ms rejected, with
479/480 rejections versus 478/479 unchanged. Rejections and CI/broker costs
remain substantial for only 109 successful installations. This traced cohort
has a negative enabled/off CPU difference, whereas primary median CPU has a
positive one. Do not force them into a causal partition, or claim they close
the historical 79.764 ms gap whose original per-thread ledger was absent.
Main combines compiled/interpreted execution and synchronous runtime work;
C1 includes ordinary compilation and broker costs beyond the direct timer.

Direct blobs plus auxiliary metadata total 90664/90664 bytes unchanged and
89748/89884 delayed, excluding allocator overhead. MethodCounters remains
72 rather than upstream 64 bytes, including off. No dedicated worker is
added. All 377 non-libjvm image files match; effective flags differ only in
UseDirectBaseline. The off case is this fork with ordinary policy.

## Validation and retained evidence

Release and fastdebug build. All four baseline jtreg tests pass in both.
The profile test checks ordinary 256 and delayed 512 admission, keeps direct
code live through 8256 side-effecting calls while compilation is held, then
tests a real null-guard deoptimization and another direct call. Side effects
are exact; handoff MC=8258/MDO=0 proves no double invocation count or false
profile aging. Natural C2 needs 5120/5136 additional real calls. Both collector
variants, calls/arrays/fields/references, stale install and linked C2 bypass
tests pass. Independent source review found no remaining blocker and noted
MC notification phase, real inline profiles and unchanged MDO allocation cost.

The first test launch used an incomplete build staging image missing jvm.cfg.
Its error and image are retained; complete images were then made from the
matched retained JDK files with each freshly built libjvm. No build was
duplicated to recover that packaging mistake.

Small tables, hashes and exact samples are checked in as
`direct-baseline-data/successor-handoff-*.tsv`. Full method ledgers, commands,
images, XML, CPU profiles, probe source and test reports remain under
`/workspace/direct-baseline-evidence/successor-handoff/`. Earlier diagnostic
commit/images/results remain intact. No public action or Library transfer
occurred.

The next performance blocker is application amortization, not a need to
delay C2 automatically. The profiling handoff now keeps useful direct code
running until replacement and preserves real C2 readiness. This subset still
reaches only 11 javac-owned methods and pays for roughly 480 rejected attempts.
It has not shown a reliable whole-application win. Broader useful coverage or
lower admission/compile cost would need evidence of sufficient interpreter
work avoided; another threshold sweep is not supported by these results.
