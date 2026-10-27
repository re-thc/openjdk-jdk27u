# Direct baseline: one bounded later C1 admission

The 512-invocation candidate gives direct code more time before ordinary C1
admission, but does not demonstrate an application win. Median javac startup
is 480.069 ms off, 485.315 ms with shared priority and unchanged promotion,
and 502.733 ms with the delay. Delaying promotion adds 17.419 ms wall and
7.861 ms process CPU versus unchanged promotion. Warm fork results vary;
neither a repeatable warm win nor neutrality is established. Keep this an
opt-in local experiment.

This completes the originally requested off / early direct / early direct
with later C1 comparison. It uses shared priority from `c9a33d485af` and
preserves the earlier dedicated-worker negative result in
[the scheduling study](direct-baseline-scheduling.md). No threshold sweep,
new scheduler, C1 IR reuse or public action is involved.

## Choice of the single admission point

The actual flags are Tier3InvocationThreshold=200,
Tier3MinInvocationThreshold=100, Tier3CompileThreshold=2000,
Tier0ProfilingStartPercentage=200 and Tier0InvokeNotifyFreqLog=7.
With no backedges, feedback or earlier MDO creation, interpreter profiling
becomes eligible at 400 invocations, observed at the next 128-invocation
notification, 512. Ordinary C1 is often requested at 256 or 384 instead.
The user's relative call-count example is not used as a literal threshold.

The preceding entry ledger had 24/25 potentially deferrable roots below 512,
with an upper bound of 4736/4992 extra calls to that cutoff. Those were only
potential candidates: a zero MDO counter does not prove MDO absence. The
implementation explicitly requires the MDO pointer to be null. One cutoff
at 512 tests a modest additional window without passing the normal
interpreter profiling opportunity.

In `CompilationPolicy::method_invocation_event`, stock `should_create_mdo`,
`create_mdo` and `call_event` execute first. Only an actual live direct
activation, still installed in its Method, may postpone an ordinary level
2/3 request below 512. This experiment selects shared service explicitly
with `-XX:-DirectBaselineDedicatedWorker`. Existing MDOs, ordinary pending
requests, OSR history, simple-compilation and C2 decisions bypass the hold.
Interpreter-only and unsupported methods do not acquire this delay.
Counters, origins, notification masks and queue-load feedback are unchanged.
The cutoff is local prototype code, not a new policy framework or a new
global Tier3 threshold.

512 bounds this additional hold; it is not a universal admission or retirement
count. Existing feedback may request ordinary compilation later. An MDO
created earlier, including through another compilation, ends eligibility for
the hold. Direct entry then retires before executing Java bytecode and the
activation continues in the interpreter, collecting actual profiles. If the
next notification is not due yet, interpretation continues until ordinary
policy requests compilation. No executed body is restarted from BCI 0.

Ordinary C1 would itself create an MDO when compiling earlier. This candidate
therefore deliberately postpones that profiling opportunity, sometimes by
128–256 calls; it does not claim to preserve the time at which profiling
starts. It preserves the independent interpreter MDO policy and refuses to
continue unprofiled direct execution once an MDO exists. C1 level 2/3 and then
C2 retain their normal profiling/optimization paths. Extending direct tenure
past this boundary would require compatible profiling in direct code or a
separately justified profiling design. Merely raising the admission cutoff
would often leave execution in the interpreter after retirement.

## Does moving C1 require moving C2?

No. In this checkout, `transition_from_none` first asks
`transition_from_full_profile` whether C2 is appropriate. That function uses
MDO invocation/backedge **deltas**, or permits C2 when the MDO says the method
would not benefit from profiling. Ordinary C1 need not have run: the
interpreter can collect profiles for a direct 0-to-4 transition. Total
`Method::invocation_count()` is MC+MDO (subject to carry saturation), while
C2's profile predicate uses MDO counts minus its start counters. Treating
all pre-MDO direct invocations as C2 profile samples would be incorrect.
The prototype increments the actual MC until an MDO exists and does not
reset or copy that count into the MDO. Entry retirement does not call policy
reprofiling or reset the MDO start counters. Other ordinary reprofile paths
remain available. Raw admission logs record MC/MDO separately; they do not
record the MDO start fields, so they establish actual requests rather than
the exact instant a C2 predicate first became true.

Concrete traces from the first unchanged and delayed logged forks follow.
Times are milliseconds from VM start, with the XML's 1 ms precision:

* `StringLatin1.canEncode(int)`, delayed: eligible/requested for direct at
  count 32, installed at count 55 (33 ms). C1 eligibility at 384 is deferred
  with no MDO. At total 447 (64 ms), an MDO is observed and direct retires,
  after 391 body entries. Profiling then runs in the interpreter. There is
  **no ordinary C1 request or installation** for this method in the process.
  C2 is requested at MC 446 + MDO 5248 = total 5694 (321 ms), and installed
  at total 5707 (322 ms). In the unchanged fork, C1 is instead requested at
  MC 384/MDO 0 and installed at total 387 (61 ms); no standalone C2 version
  is installed by the snapshot. That does not rule out C2 inlining it into
  another compiled method.
* `AbstractPoolEntry.hashString(int)`, unchanged: direct request/install
  counts 32/38 (71 ms), C1 request 256 and install 259 (95 ms); an MDO is
  observed at retirement count 259. C2 request is MC 258 + MDO 2048 = 2306
  (163 ms), installation 2347 (164 ms). Delayed: direct request/install
  32/38 (75 ms), C1's request at 256 is deferred, MDO retirement and C1
  request occur at 512 (111 ms), C1 installs at 523 (111 ms), and C2 requests
  at MC 512 + MDO 1024 = 1536 and installs at 1558 (143 ms). Later C1 does
  not imply later C2 for every method. The logs do not record would_profile
  or queue-scale snapshots, so these different C2 request counts are not
  attributed to a changed C2 threshold.
* `Assert.checkNonNull`, unchanged/delayed: direct requests at 32 and installs
  at 35 (210/200 ms); both retire with an MDO at total 512 (276/273 ms),
  after exactly 476 direct body entries. C1 request/install are 640/706
  (328/328 ms) versus 512/563 (273/274 ms). C2 request is **the same**
  MC 512 + MDO 6144 = 6656 (407/437 ms), with installations 6740/6697
  (408/437 ms). This root's baseline tenure does not change at all. Wall
  arrival still differs because the workload and compiler schedule differ.

MDO allocation's exact timestamp and the first interpreted profile write are
not logged. The retirement line proves MDO presence, and retirement precedes
the Java body that resumes in the interpreter. Counts and timestamps above
must not be described as exact MDO allocation events. Complete request,
installation, retirement and counter records for these examples are retained
in `delayed-c1-handoff-examples.tsv`.

The candidate does **not** move should_create_mdo's Tier3-predicate times
Tier0ProfilingStartPercentage boundary. Its old-method, training-data and
C2-load exceptions execute unchanged before the hold. C2 backlog can postpone
that MDO opportunity, and ordinary queue scaling can move both compiler
admissions. Direct tasks are excluded from C1 backlog feedback; their service
still competes for CPU and the shared worker. Training recording/replay and
compiler replay remain excluded from direct compilation and are disabled in
this comparison. There is no evidence of training causing these arrivals.

Delaying C1 can indirectly postpone C2 by postponing C1's earlier profile
collection. It can also simply replace profiling C1 with profiling interpreter
time once the MDO has forced direct retirement. For a method already retired,
delaying C2 cannot extend baseline residency; it only postpones its next useful
optimization. The observed profiling/counter paths and negative startup result
provide no justification for an additional explicit C2 delay, so none is added.

## Actual execution and optimizer arrival

Two separately logged startup forks per case retain XML, body-entry counters,
admission and retirement records. Both images have the same retirement
diagnostic; it requires Reason_unhandled **and** Action_make_not_entrant so
ordinary null/bounds reexecution traps are not mislabeled as retirement.
Trace counters count actual body entries, excluding entry retirement.

| Logged startup observation | Unchanged promotion | Delay to cutoff 512 |
|---|---:|---:|
| Installed direct methods | 109 / 110 | 109 / 108 |
| Methods with body entries | 102 / 103 | 103 / 104 |
| Total direct body entries | 22695 / 22922 | 25366 / 25498 |
| Entries before first ordinary admission or held snapshot | 21975 / 22431 | 25361 / 25490 |
| Installed javac-owned methods | 11 / 11 | 11 / 11 |
| Javac-owned body entries | 2402 / 2385 | 2568 / 2411 |
| Methods whose admission was actually deferred | 0 / 0 | 26 / 25 |
| Direct roots ordinarily admitted | 44 / 47 | 36 / 40 |
| Median first admission count of admitted roots | 384 / 384 | 512 / 512 |
| Direct roots reaching installed ordinary C1 | 44 / 47 | 35 / 40 |
| Direct roots reaching installed C2 | 4 / 4 | 5 / 4 |

The mean early-entry gain is 14.5%, but total body entries rise only 11.5%:
some unchanged-policy execution already overlaps a queued C1 compilation.
For example, StringLatin1.equals in the first unchanged fork is admitted at
256 with 208 direct entries, yet retires at 512 with 464. In the first delayed
fork it is admitted and retires at 512, also with 464 entries. The larger
pre-admission count alone is not extra interpreter work avoided.

There are 34 deferral events in each candidate fork, affecting 26/25 methods.
Ten deferred methods in each fork retire below 512 because an MDO appears;
9/7 deferred roots have no ordinary admission by the held snapshot. All
48/48 observed candidate entry retirements have an actual MDO. These checks
make the profiling dependency visible instead of inferring it from a zero
counter. Methods with no ordinary admission contribute their final body
count to the early-entry total. Snapshots include the small marker/attach
interval and do not measure interpreter CPU saved or exact first-entry time.

| Javac-owned normal/OSR installations in logged processes | Off | Unchanged | Delay 512 |
|---|---:|---:|---:|
| C1 installations | 229 / 244 | 217 / 224 | 236 / 234 |
| First C1 installation, ms from VM start | 220 / 231 | 237 / 247 | 225 / 253 |
| C2 installations | 20 / 19 | 18 / 19 | 20 / 19 |
| First C2 installation, ms from VM start | 305 / 339 | 339 / 350 | 340 / 359 |

C2 progresses in the real caller, although arrival changes with profiling and
the compilation schedule. These logged forks do not isolate the effect of
the hold from run-to-run startup variation. Per-root normal-entry request and
installation records are retained separately. They must not be interpreted
as a fixed mandatory ladder or evidence that optimizer timing is unchanged.

## Matched caller results

Four startup forks and three warm forks per case run serially in interleaved
order. The original caller, four generated sources, implicit input classpath,
1500 warmup tasks, existing stability wait and 100 timed warm tasks are
unchanged. All processes exit successfully. Flags remain G1, 128 MiB initial
and maximum heap, ActiveProcessorCount=4, CICompilerCount=3, -Xshare:off,
affinity CPUs 0–3. No builds/tests run alongside timing. Caller measurements
have tracing and XML disabled.

| Median metric | Off | Shared, unchanged promotion | Shared, delay 512 |
|---|---:|---:|---:|
| Startup wall, ms | 480.069 | 485.315 | 502.733 |
| Startup process CPU, ms | 1007.176 | 1038.284 | 1046.145 |
| Warm task, ms | 5.831 | 5.216 | 5.279 |
| Whole warm-process wall, s | 16.290 | 15.776 | 15.641 |
| Whole warm-process CPU, s | 28.457 | 26.676 | 26.991 |

Warm fork task medians are off 5.831/4.965/6.471, unchanged
5.216/5.124/6.648 and delayed 5.279/6.083/4.934 ms. The delayed candidate is
1.2% slower than unchanged promotion at their medians, with substantial
overlap. Both enabled cases use less whole warm-process CPU than off in
every fork of this cohort. That positive observation is retained; it includes
warmup and compilation and is not CPU for the timed 100-task window.
Earlier adverse warmed results also remain. The variability does not satisfy
the requirement for a repeatable application win without warmed loss.

A bounded follow-up uses the existing before/after wrapper around the same
100-task body, once per case, with trace counters. It does not replace the
uninstrumented results:

| Warm-window observation | Off | Unchanged | Delay 512 |
|---|---:|---:|---:|
| Warm task median, ms | 5.703 | 6.389 | 4.651 |
| CompilationMXBean increase, ms | 235 | 265 | 89 |
| New resident C1 / C2 installations | 13 / 30 | 13 / 21 | 11 / 34 |
| Direct body-entry increase between snapshots | 0 | 248 | 248 |

The original warm window still includes ordinary compilation. Both enabled
forks install two small direct methods in this interval. The 248 entries are
mostly StringLatin1.getChars (174) and StringCoding.encodeAsciiArray (71),
plus three other helper entries. There are three entry retirements per
enabled fork and no deferrals. Snapshot boundaries include marker/attach
work. Codelist differences count resident installations, not every completed
compile. One sampled thread disappears in each process, so the retained
per-thread delta is incomplete; CompilationMXBean is the independent compiler
time observation. This single diagnostic set characterizes ongoing work and
variation, not a warmed performance verdict.

## CPU budget and retained cost

The separately traced/XML startup cohort has the following per-case means;
do not substitute it for caller CPU above:

| CPU, ms | Off | Unchanged | Delay 512 |
|---|---:|---:|---:|
| Main/launcher | 482.378 | 494.376 | 520.261 |
| C1 worker, inclusive | 293.337 | 318.212 | 343.610 |
| C2 workers | 302.918 | 317.294 | 314.917 |
| GC | 0.622 | 0.603 | 0.721 |
| Other VM | 1.582 | 1.364 | 1.557 |
| After-ready work and unobserved CPU | 10.559 | 11.099 | 14.922 |
| Complete process | 1091.396 | 1142.948 | 1195.987 |

Direct task CPU, included in C1 above, is 8.985 ms successful plus 14.194 ms
rejected with unchanged promotion, and 8.445 plus 13.653 ms with the delay.
There are 480/480 rejected attempts versus 479/477. Successful compilation
and rejected attempts therefore do not explain the candidate's extra CPU.
Most of this cohort's increase is in main (+25.885 ms) and inclusive C1
(+25.398 ms). Outside the direct timer, C1 combines ordinary compilation,
broker and logging costs; main combines generated execution, interpretation,
runtime transitions and deoptimization. Those components are not separately
timed, and this cohort's 53.040 ms difference is not a causal partition of
the uninstrumented 7.861 ms median difference or the historical 79.764 ms gap.

The first raw budget incorrectly subtracted sums of live-thread snapshots
before/after attachment. A worker disappearing between snapshots gives a
negative apparent diagnostic phase and inflated remainder in two rows. The
corrected table subtracts only the first snapshot from complete wait4 CPU and
keeps the resulting remainder combined; it does not invent negative CPU or
claim complete phase attribution. Raw rows remain preserved locally.

The emitter and frame/metadata layout are unchanged. Direct nmethod section
sizes sum to 74936/75608 bytes unchanged versus 74936/74224 delayed; this
statistic excludes auxiliary metadata and allocator overhead. Earlier measured
retained code/auxiliary cost near 101–103 KiB and the 72-byte MethodCounters
layout remain relevant. No dedicated worker is added in any of these cases.

## Validation and reproducibility

Release and fastdebug HotSpot builds complete. All four baseline jtreg tests
pass in both images. The profile test retains the default service control and
adds the shared 512 case: no ordinary queued request at 256/384, MDO absent
while direct executes there, MDO present and direct retired at 512, exactly
8256 side-effecting calls without replay, then ordinary C1. After unblocking
compilation it reaches C2 naturally, without a forced C2 request, after
1536/1552 further test calls in release/fastdebug. Independent source review
found no remaining blocker in the bounded hold, bypasses or profiling path.

The control image contains `c9a33d485af` policy plus the same retirement log;
the candidate adds only the bounded policy guard. All 377 non-libjvm regular
image files have matching content. The off case is the fork with ordinary
policy, not an unmodified upstream image; its existing off-state
MethodCounters footprint is disclosed above. Effective flags differ only in
UseDirectBaseline; shared service is explicitly selected for all three.

Small tables and hashes are checked in as `direct-baseline-data/delayed-c1-*.tsv`.
Full commands, caller logs, effective flags, XML, complete per-method ledgers,
counter snapshots, test reports, images and scripts remain under
`/workspace/direct-baseline-evidence/delayed-c1/`. Earlier images, commits,
failed tests/analyses and negative dedicated-worker results are retained.
No source/evidence Library transfer or public action occurred.

The supported conclusion is to retain unchanged promotion as the better of
these two shared configurations. This one later-admission point adds little
javac coverage and worsens startup; its extra tenure has not paid for itself.
There is no demonstrated general direct-emitter application win yet. A longer
useful window would require a profiling design that preserves timely C2, and
broader useful coverage or lower rejection/broker cost would need concrete
measurement. Further threshold tuning is not justified by this result.
