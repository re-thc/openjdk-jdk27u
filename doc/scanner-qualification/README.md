# Scanner: one bounded qualification decision

Status: source-prepared and independently source-reviewed; **not executed**.
Neither compilation nor runtime behavior of this packet has been verified in
the source-planning continuation. Publication of source is not qualification.

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
dependency sysroot, GNU build utilities and a quiet resource window. It needs
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

Do not run during the source-planning continuation. At the execution milestone,
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
No exploded image is substituted. Each image's release file, configure log,
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
nanoseconds, current-thread allocated bytes and protocol checksum. Warmup
processes still retain command/stderr files. Each summary gives paired median
ratios and a one-sided 95% percentile bootstrap upper bound (10,000 resamples,
seed 89885), plus median saved ns/op. These are fixed engineering gates on a
small host sample, not population guarantees. Do not pool cells across
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

Ratios are candidate/baseline. Apply each applicable gate to every protected
cell; the known +8.5% short-double signal fails if reproduced. No extra forks,
adaptive warmup, selected reruns, favorable-window substitution or tuning are
allowed in this pass.

| Gate | Required result |
| --- | --- |
| Correctness/protocol/route parity | Zero unexpected failures; expected baseline feature-test failure is excluded by test selection |
| G1 first line, default CDS | First-op ratio upper95 <=0.90 and median paired savings >=1ms |
| Other text first use, every GC | Median <=1.00, upper95 <=1.05; first-line savings reported for each GC |
| Empty READY, every GC | Median <=1.03, upper95 <=1.05; no JVM-readiness speedup claim |
| Cold int/double and eager HOST-line, every GC | First-op and total median <=1.05, upper95 <=1.10 |
| Protected transient latency (including every legacy short case) | Median <=1.05 and upper95 <=1.08 |
| Protected steady latency (including every legacy long case) | Median <=1.03 and upper95 <=1.05 |
| Protected transient / steady allocation | Every paired ratio <=1.02 / <=1.01, respectively |
| First-line instrumented allocation, every GC | Every paired ratio <=0.80; first-int allocation <=1.01 |

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
jtreg workers, one benchmark child plus a 256MiB controller. Reserve at most
12GiB resident memory and 25GiB new disk space; stop on resource pressure rather
than enlarging the reservation. The script enforces six hours overall,
10min/configure, 90min/build command, 45min/correctness, 10min/workload smoke and
90min/all performance; disk is checked between builds and at completion.
The script tracks each isolated stage process group and uses an interruptible
wait plus termination/kill cleanup, so a global timeout also stops an active
inner stage; allow the outer 15s kill margin. Monitor the reservation while
running; no cgroup/OS reconfiguration is needed.
Each measurement child has a 120s deadline plus bounded termination/reader
cleanup (at most 20s); failed cleanup aborts rather than launching another child.
Timeouts preserve partial artifacts and mean incomplete, never pass.

Stop dependent work immediately on a correctness, preflight, CDS, protocol or
resource fault. After the fixed performance campaign, apply all gates once.
If a point estimate exceeds a limit, report **not worthwhile for integration**
and the exact cell; do not retune this candidate in the same pass. If point
estimates pass but bounds/variance cannot establish a gate, report
**incomplete/inconclusive**. If all gates pass, report **worthwhile on this
Linux x64 profile**, with Stage B supported-platform correctness still pending.
Do not convert untested platforms into failures or imply native performance.

The single final report must contain pinned source/image/harness identities,
test counts and exclusions, raw/summary paths, protected transient and steady
results, readiness versus first-use versus process total, allocation units,
all failed/inconclusive cells and explicit platform/HOST limits. It then gives
one integration recommendation and the concrete separately approved next stage.
The packet never creates a PR, merges, dispatches CI, installs tools or sends
messages. No second campaign is implied by a source-review milestone.
