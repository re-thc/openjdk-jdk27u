# Scanner: one bounded qualification decision

Status: **not qualified**. The `cdaddc8592c` attempt stopped before its first
build because zombie-only cleanup was classified as uncertain. The corrected
`e72c9c791f9` attempt built the baseline image successfully, then stopped125
because an adopted child remained live at make exit, consistent with the build's
asynchronous javac shutdown. Neither reached comparison tests or measurements.
The authorized `fcb8f9a60e0` continuation then stopped125 during candidate
compilation on an owned process's X/0/0/-1/-1 exit observation. Its candidate
image is absent; make status and final custody are unproven. It produced zero
runtime observations. All failed results remain separate and unchanged.
See [EXIT-RACE-REPAIR.md](EXIT-RACE-REPAIR.md) for this failure and the offline
repair, [RUNNER-REPAIR.md](RUNNER-REPAIR.md) for the
original lifecycle repair and [POST-BUILD-DRAIN.md](POST-BUILD-DRAIN.md) for the
bounded build-only drain fix and retained-baseline verification. This source
repair does not itself authorize another campaign or resume timing.
The explicit [retained-baseline continuation](CONTINUATION.md) prepares the
candidate-only build and unchanged full matrix. The original claim is spent;
the explicit successor proposal needs separate execution approval.

## Frozen inputs and existing evidence

Baseline: `89885a6288e7aaabd01678a704a586272c0f96e3`.
Production implementation: `b2adcf68944f1251cf1b7b09e9cc5c1d58e37153`.
Test hardening: `c5f0e0b4918007062a500594a9640c4ecffa8e9c`.
The candidate is the exact approved `review/scanner-lazy-numeric-locale` head
containing this packet, resolved once before the campaign. The script records
its full SHA, requires c5f0e0b ancestry, and rejects changes to these trees:

| Candidate tree | Git object |
| --- | --- |
| `src` | `4ac402957e32a6c54e566bdbee2d85f6e471b336` |
| `test` | `46360397de0a70009ef238781d3ea9e77c0565a9` |

Existing evidence is Linux x64 only: eight compatibility tests on the baseline
with the default collector; eight on the candidate with Serial/G1/ZGC; full ten
with G1 and the two added tests separately with Serial/ZGC. The older measured
images have byte-identical production source to c5f0e0b, not fresh exact-head
build provenance. The candidate's class-initialization guard deliberately fails
on the baseline and uses CDS-off for transparency. It is not a timing result.

On one host with default CDS, first line medians were 22.065/12.994 ms, before/
after, and instrumented first-line thread allocation was 564896/288624 bytes.
Readiness before Scanner showed no demonstrated gain. Long int/double loops
were within 1%, but short double construction was about **8.5% slower** and
short reused integer scanning about **4% slower**. Those signals remain open.
The historical `ScannerProbe.java` and `ScannerSteady.java` are retained here
unchanged, so the new larger workload switch cannot conceal a compilation-shape
regression by replacing its reproducer. No private binaries or host data are
needed to reproduce the experiment.

## Staged decision and real dependencies

**Stage A is the next complete milestone:** exact-head correctness, default-CDS
first use, allocation and protected transient/steady performance on the suitable
available Linux x64 host, using the repository's GCC16 release/server profile
and Serial/G1/ZGC. It ends with one worthwhile/not-worthwhile/incomplete report.
It needs the already installed GCC16, mold, JDK27 boot JDK, jtreg8.3, native
dependency sysroot, GNU build utilities, installed Python3, Bash5.1 or newer,
readable Linux procfs, Python pidfd support, kernel pidfds/subreaping and a quiet resource window. It needs
neither additional native machines nor JMH nor new infrastructure.

If Stage A is worthwhile, **Stage B** is supported-platform correctness through
normal repository PR CI, only after separately approved PR integration. The
repository lists Linux x64/AArch64 (GCC16), macOS arm64 (Xcode26.6), and Windows
x64 (MSVC14.44). No PR, merge, CI dispatch or platform provisioning is part of
Stage A. Before any such approval, prepare the concrete PR/CI proposal using
Stage A's result. Use Scanner compatibility/provider tests and the candidate
route test with Serial/G1/ZGC; exclude Shenandoah and every built-in HTTP client/
server. A later CI result must identify exactly which collectors/tests ran.
The existing `test.yml` has a fixed tier1 matrix, including `jdk_util`, rather
than an explicit Scanner/three-collector selector. A stock green run therefore
must not be presented as three-collector Scanner qualification. Preparing the
exact permitted CI scope/coverage proposal is owner work at Stage B; this packet
does not add a workflow or assume that unsupported job filters exist.
Unavailable normal CI workers/SDKs are dependencies of Stage B, not a reason
to prevent a useful Stage A decision.

**Stage C**, if requested, qualifies architecture-specific performance on native
Linux AArch64, macOS arm64 or Windows x64. Only a performance claim for one of
those hosts requires its native hardware, installed toolchain and quiet window.
Stage A and portable source reasoning confer no such performance claim.
Changing live OS locale settings is unnecessary and outside this packet.

Preparing/running the packet, fixing preflight-only harness errors, analyzing
all samples and writing the decision are owner work. They are not dependencies
to hand back to the user. Missing authorization to execute this source-only
continuation is distinct from missing hardware.

## Stage A commands

Do not run during the source-planning continuation. At a separately authorized execution milestone,
use a clean checkout of the approved review head. Set `TOOLCHAINS` to the existing
installation root containing `activate.sh`, `gcc16`, `mold`, `sysroot`, `jdk27`,
and `jtreg83`; these are inputs, not installation instructions. Choose paths
without spaces for this Linux/sysroot configure recipe. The checked-in script
contains the complete configure, image, jtreg, compilation and paired-run
commands; it invokes no CI or external service:

```sh
CANDIDATE_REV=$(git rev-parse HEAD)
TOOLCHAINS=/path/to/existing/toolchains \
  bash doc/scanner-qualification/run-linux.sh \
  "$PWD" "$CANDIDATE_REV" /path/to/new/scanner-qualification-output
```

Use a new output directory; its parent must exist. Source worktrees are detached
at the two pinned revisions. Both normal `images/jdk` release images are built
with matching flags and four jobs, including `--with-jvm-features=-shenandoahgc`.
No exploded image is substituted. One map of the current output's base/candidate
image paths feeds hashing, CDS, jtreg, HOST, smoke and measurement commands.
Required `release`, `lib/modules`, `lib/server/libjvm.so` and executable `bin/java`
are checked before dependent commands. Each image's release file, configure log,
module/VM hashes, CDS mapping logs and source identity are retained. Default CDS
must map for each collector at the measured heap settings. The existing logs
need no repeated class-count census, CDS-off performance campaign or inlining
diagnostic campaign; a timing failure does not authorize JIT flag tuning.

The script compiles the four provider-fixture sources from the candidate tests
as module `provider`, then all packet Java sources with the boot javac. The
provider module is present at compilation and in phase-workload child VMs.
`ScannerHost` gets its internal-package export at compilation and execution.
The baseline runs nine equivalence tests from the candidate test tree. The
candidate runs all ten, including `LazyLocaleInitialization`. Both use two
jtreg workers and each of Serial/G1/ZGC. Then a one-operation workload smoke
check and untimed HOST output comparison must pass before measurements begin.

This is a new exact-head/image-provenance and phase-protection check, not a
request to rerun every previous exploratory diagnostic. A preflight harness
error may be repaired within the milestone before timed sampling, with its
source committed and identities refrozen; no product/test changes or partial
timed-result reuse are permitted. A product failure ends this candidate's pass.

## Fixed measurements and interpretation

One measurement child runs at a time; base/candidate order alternates by pair.
The performance controller and children inherit one allowed CPU, selected once
and recorded (`PERF_CPU` may explicitly select another allowed CPU before the
campaign). This is a one-CPU host experiment, not a multicore throughput claim.
Ordinary tiered compilation, normal default CDS, 32/128 MiB child heaps and
explicit CLDR/en-US defaults are fixed. HOST controls use HOST,CLDR and current
OS defaults; the stateful SPI control uses SPI,CLDR. Injected Java option
environment variables are cleared. There are no compile directives or Xbatch.

| Pass | Samples per image/collector/workload | Purpose |
| --- | --- | --- |
| `cold` | 2 excluded warmup pairs, then 20 retained pairs | Empty, line, next, tokens, boolean, int, double and HOST-line; READY, first operation and process total separately |
| `allocation` | 5 fresh paired VMs | Empty, line, int after management-bean setup; allocation only, separate from latency |
| `legacy` | 8 paired VMs per short/long workload | Unchanged int/double construction and reused-integer historical reproducer |
| `phases` | 8 paired VMs | Mixed/localized/invalid/provider/text protection and fixed progress windows |

Raw CSV preserves every retained image result, pair/order, counts, elapsed
nanoseconds, current-thread allocated bytes and protocol checksum. Every child,
including excluded warmup and interrupted/invalid children, also retains its
command, stderr and line-flushed stdout transcript. Already captured partial
windows remain available when a later window or resource check aborts that child;
output still in flight at termination may be missing and is marked incomplete.
No sample or losing pair is deleted, replaced or selectively retried.
Each summary gives paired median ratios, one-sided 95% percentile bootstrap
lower/upper bounds (10,000 resamples, seed89885), exact directional sign-test
counts/p-value, protection status and a no-regression screen, plus median saved
ns/op. The bounds are two one-sided diagnostics, not a simultaneous confidence
guarantee across the matrix. These are fixed engineering decisions on a small
host sample, not population guarantees. Do not pool cells across
collectors, phases or workloads. Retain raw values, medians and IQRs in the
decision report; inspect pair drift and overlapping/unstable distributions.
The cold child waits for a controller acknowledgement after READY, so the
readiness timestamp precedes Scanner work. Process total includes that common
handshake; the child measures the operation after it, separately.

| Phase workload | Window IDs and protected windows |
| --- | --- |
| int/double | 0: first1k; 1: next9k; **2: next20k transient**; 3: next170k bridge; **4: next100k steady** |
| reused `scan-int` | 0:100 Scanners; **1:200 transient**; 2:700 bridge; **3:2000 steady**; 2000 tokens/Scanner |
| remaining ordinary modes | 0:first1k; 1:next9k; **2:next20k transient**; no steady claim |
| `large-line` (64KiB) | 0:10; 1:90; **2:200 measured Scanners**; no steady claim |

The phases run sequentially in the same workload JVM. Early/bridge windows are
diagnostic and stay visible; they cannot replace a failing protected window.
The separate unchanged legacy short path uses 10k warmup/20k measurement for
int/double and 100/200 Scanners for reused integer tokens. Its long path uses
200k/100k construction or 1000/2000 reused Scanners. Short and long are separate
fresh VMs as in the prior experiment, and both are protected independently.
Legacy checksum `-1` denotes its historical unchecked volatile sink, not a new
correctness assertion; the equivalence suite and checked phase workloads provide
correctness protection. New probes validate each operation and the controller
rejects unexpected row/window/count/checksum/counter omissions.

Protected mixed cases include text then first numeric use, boolean, lookahead
and cached next values, rejected/range-overflow integer tokens with explicit
recovery, BigInteger/BigDecimal, radix changes, German grouping/decimals, Arabic
numbering extensions, equal/different locale calls, reset, cached decimal-pattern
normalization, and forced `toString` initialization. Text/token and 64KiB line
cases protect the motivating use. SPI fixture callback names/order are checked,
with traces cleared per operation; its instrumentation is a regression control,
not a provider-population performance estimate.

`ScannerHost` prints the selected adapters and compares baseline/candidate
constructor/useLocale/reset representations under current settings. Both
adapters HOST means both native services were reached; one means partial native
coverage; neither means fallback only. Because printing uses `toString`, this
is output parity, not proof of eager snapshot timing. The source guard and
provider/class-init regressions protect that timing. No mutable native-setting
or native HOST performance claim follows from Linux fallback.

## Frozen gates, ceilings and final decision

Ratios are candidate/baseline. A positive percentage regression has no accepted
budget: the former transient+5%/upper+8%, steady+3%/upper+5% and allocation
allowances are removed. Text gains cannot compensate for a protected numeric,
readiness, total-process or allocation loss. Apply the following rules
independently to each protected metric/collector/workload/window, preserving
historical short and long workloads as separate cells. No extra forks, adaptive
warmup, selected reruns, favorable-window substitution or tuning are allowed.

1. **HOLD takes precedence.** A consistent-loss signal is either bootstrap
   lower95>1 or a one-sided exact sign-test p<=0.05 for losses. The sign test
   compares each paired ratio with exactly1: >1 is loss, <1 improvement; exact
   ties are omitted from its denominator, never counted as improvements. With
   L losses among N non-tied pairs, p=sum(combination(N,k)/2^N, k=L..N); N=0
   gives p=1. HOLD has no minimum effect size and does not require the full
   sample median to exceed1. Seven losses out of eight non-tied pairs give
   p=0.03515625; eight identical+1.9% or repeated+4% legacy losses HOLD.
   Fifteen ties plus five losses out of20 also HOLD (p=0.03125), even if ties
   keep the median and its interval at1. HOLD prevents an integration
   recommendation; it is a conservative screen, not a universal causal claim.
2. **Uncertainty remains INCONCLUSIVE.** If HOLD is absent, median>1 or
   upper95>1 cannot establish no regression and cannot pass using a percentage
   tolerance. Sparse non-tied losses with no improvements also remain
   inconclusive when the sign test lacks power, even if ties pin the interval
   at1. Allocation additionally requires every paired ratio<=1; an isolated
   increase without a consistent-loss signal remains inconclusive. Missing
   samples, order/drift confounding, wide/unstable results, observer/resource
   faults or incomplete correctness likewise prevent qualification.
3. **Bounded no-measured-regression evidence** requires median<=1 and
   upper95<=1, no HOLD signal and no unresolved directional/measurement issue.
   This strict zero-bound criterion can make noisy, genuinely neutral latency
   inconclusive. It is not proof of exact equivalence or universal zero cost.
   A non-significant loss test alone is insufficient. The summary's
   NO_MEASURED_REGRESSION screen checks this rule, not the benefit requirements
   or full campaign completeness.

| Gate | Required result |
| --- | --- |
| Correctness/protocol/route parity | Zero unexpected failures; expected baseline feature-test failure is excluded by test selection |
| G1 first line, default CDS | First-op ratio upper95 <=0.90 and median paired savings >=1ms |
| All nonempty cold workloads, every GC | No-regression rules above for first-op and process-total latency, including text, boolean, int/double and eager HOST-line |
| Empty READY, every GC | Same no-regression rules; no JVM-readiness speedup claim |
| Protected transient latency | Same no-regression rules for every legacy short case and the explicitly protected phase windows |
| Protected steady latency | Same no-regression rules for every legacy long case and the explicitly protected phase windows |
| All protected allocation | Same no-regression rules and every paired ratio<=1, separately for transient and steady cells |
| First-line instrumented allocation, every GC | Every paired ratio<=0.80; first-int allocation requires every ratio<=1 |

`large-line` uses the transient latency/allocation gates. Text phase allocations
are also protected by the transient no-regression gate. Allocation counts only
Java bytes in the executing thread; it does not establish RSS, native-memory,
metaspace or total-process allocation savings. Allocation-pass times and the
larger checked phase workloads do not replace the historical latency path.
Legacy loops retain management-bean setup and counter queries outside their
timed window; only the cold latency pass avoids management-bean setup entirely.
Warmup/bridge excursions must be disclosed; an unexplained repeatable large
excursion prevents a blanket neutrality claim even if protected gates pass.

Ceilings: one active Stage A host, one build at a time, four compiler jobs, two
jtreg workers, one benchmark child plus a 256MiB controller and the RSS observer.
The operational RSS stop threshold is12GiB (12582912KiB); new disk budget is
25GiB. The checked-in `watch-memory.py` starts before builds or JVM work. It
uses installed Python3/procfs without subprocesses or installations. Its first
successful sample must publish a birth/UID-bound healthy heartbeat within5s
before any stage starts. It rejects a sample>=12GiB before publishing readiness.
Every nominal1s it records summed resident pages for the controller descendants,
their retained birth ledger and the outer timeout. `memory-members.csv` retains
PID, birth, UID, PPID, PGID, SID, kernel state, classification and RSS, including
observed zero-RSS zombies and owned X exit rows with positive kernel proof.
`memory-exits.jsonl` retains the corresponding identity and exit witness.
`memory.csv` records timestamp, sum, observed peak,
count and active stage. All three streams flush each sample; readiness/heartbeat is
published only after successful flushes. Positive sampled RSS is retained even
when a subsequent pidfd poll proves exit. Shared resident pages can be counted
more than once. This is sampled summed RSS, not unique physical memory,
not a hard allocation/cgroup cap and not a guarantee of unobserved peak usage.

At any sample>=12GiB, the observer retains that sample, attempts to append the
reason to `resource-stop.txt` within5s, then signals the controller through a
previously validated pidfd, even if report persistence fails. A sampling deadline
signals before exception cleanup, which might retry stalled I/O. Missing fault
output is incomplete. Procfs/read/write failures, sample/intersample gaps>5s,
stale observation and unexpected observer termination also prevent a pass.
The observer stays active through stage cleanup. A stale/malformed heartbeat
makes the result incomplete while an independently verified live observer is
still stopped. Planned observer shutdown uses SIGUSR2, bounded wait and guarded
SIGKILL if necessary; required SIGKILL or abnormal exit is incomplete.

Every long-lived build/test/JVM command, including javac, CDS and HOST checks,
uses a registered isolated stage supervisor. It becomes a Linux **per-process**
subreaper before launching work, retaining orphan/escaped descendants in its
custody. No OS-wide configuration changes. PID/birth/UID establish identity;
PPID lineage establishes ownership and the ledger preserves it through adoption
and session/group changes. All explicit cleanup signals use validated pidfds;
there is no numeric-PID/group kill fallback. R/S/D/T/t/I/W/P are live even at
zero RSS. Owned X0/Z0 requires positive process-pidfd exit evidence; a zombie
leader may retain live threads. Unsupported state, negative RSS, failed poll,
nonready terminal-looking observations and PID reuse remain uncertain.
Unrelated raw exit rows are never selected by their state alone. Fresh parent
exit checks prevent stale parent rows from admitting unrelated new identities.

The supervisor peeks actual kernel children without reaping (`waitid` WNOWAIT),
records their Z0 identity, then reaps them. It publishes a clean custody record
only after there are no live owned descendants **and** the kernel reports no
children. Successful make image-build stages alone allow a six-second observed
natural drain for javac's asynchronous stop-file shutdown. They must prove empty
custody within that deadline; expiry latches an incomplete result even if later
cleanup succeeds. Other stages stay strict. Abort, fault or nonzero command exit
bypasses the grace; guarded TERM10s/KILL2s cleanup keeps a separate deadline and
cannot restart its budget. See [POST-BUILD-DRAIN.md](POST-BUILD-DRAIN.md).
Normal image builds launch make directly under the subreaper. One monotonic
90-minute command deadline replaces their nested GNU timeout; reaching it
latches124 even if make later returns0. The actual wait status stays recorded.
Nonbuild stage commands and their GNU timeout wrappers are unchanged.
Each stage retains `identity.json`, `payload.json`,
`processes.jsonl` and, only on verified drain, `complete.json`. Supervisor death
without that record remains uncertain even if its known ledger is empty. Guarded
cleanup of other known births continues when one target is uncertain; an
incomplete ledger can never prove absence of an unrecorded escaped descendant.

Bash interruptibly waits both stage and observer, and interruptibly waits its
short control helpers. I/O alarms bound helper/supervisor observation as well
as polling deadlines. On abort the stage gets TERM10s/KILL2s cleanup, followed
by observer shutdown; the outer six-hour timeout has a final15s kill margin.
A hard timeout, uninterruptible kernel I/O or unverified termination is incomplete,
never successful cleanup. Bash waits its own verified-terminal supervisor and
observer children; a separate helper cannot reap them. The supervisor reaps
only its own/adopted children. No further stage starts after a fault.

The observer pins itself to the lowest other allowed CPU when one exists,
otherwise shares the single allowed CPU. `memory-placement.txt` records both
choices. Affinity failure stops before payloads. The controller/supervisor and
observer add common work to both images; preserve and disclose those logs.

The script enforces six hours overall, 10min/configure, 90min/build command,
45min/correctness, 10min/workload smoke and90min/all performance. Disk is checked
between builds and at completion. Preserve all CSVs, transcripts, resource
reasons and incomplete output on every exit. Each measurement child has a120s
deadline plus bounded Java reader/child cleanup. Before launching a measurement
child and after its lifetime, Java asks the stage supervisor to verify that only
the waiting campaign's ancestor chain remains live. These checks are outside
the measured child lifetime and catch a survivor even after its direct parent
has exited. A failed/stale checkpoint stops the campaign before another child.
Other-platform/manual invocations lack this Linux custody mechanism and require
their own runner qualification. Timeouts mean incomplete, never pass.

Stop dependent work immediately on a correctness, preflight, CDS, protocol or
resource fault. After the fixed performance campaign, apply all gates once.
Any consistent protected loss yields **HOLD / not qualified for integration**
with the exact cell and signal, including small losses below the former budgets.
Do not retune or accept a trade-off in this pass. Absent HOLD, any unresolved
no-regression or benefit gate yields **incomplete/inconclusive**. Only complete
correctness, no-measured-regression evidence for every protected cell and the
stated first-line benefit allow **worthwhile on this Linux x64 profile**, with
Stage B supported-platform correctness still pending. A favorable long run
never clears a short-run HOLD. No trade-off has been approved by the user.
Do not convert untested platforms into failures or imply native performance.

The single final report must contain pinned source/image/harness identities,
test counts and exclusions, raw/summary paths, protected transient and steady
results, readiness versus first-use versus process total, allocation units,
all failed/inconclusive cells and explicit platform/HOST limits. It then gives
one integration recommendation and the concrete separately approved next stage.
The packet never creates a PR, merges, dispatches CI, installs tools or sends
messages. No second campaign is implied by a source-review milestone.
