# One bounded HexFormat integration decision

Status on 2026-10-17: source review milestone complete; integration qualification
incomplete. This document and the new workload/first-use sources have not been
built or run. They describe one future available-host execution batch, with one
useful decision at its end, followed by separately authorized integration
stages. No execution is authorized by merely adding this document.

## Exact source and evidence reconciliation

The remote `review/hexformat-simd` head inspected for this reconciliation was
`5eda47373a10c6bf9b05bcd06d2cadb99bf0c4ea`. Its baseline is
`89885a6288e7aaabd01678a704a586272c0f96e3`; its production integration parent is
`f9abae8f4d671ec25bc00f2d8f54c69d0f3fe5fd`. The dependency remains
`Nugine/simd` `dff9585c080896a9ebdb8d6dcabce17bd69a0874`, hex-simd/vsimd
0.9.0-dev and outref 0.5.1. The lockfile SHA-256 is
`c9e0c1f477d6afb94459ac1fde0afd70bac57c3dfebbf6554b85948d47a60e37`.

Historical local runtime evidence belongs to source commit
`1a5dfb6788077f0e26ca172677bf83edb82f5d44`, before the curated review history.
Its production Java/C code is unchanged at the inspected remote head; Rust
changes are comments, while compiler-path plumbing and tests were repaired.
That supports retaining the earlier runtime evidence, not claiming a full
rebuilt runtime at `5eda47373a1`. Historical artifact identities are retained in
README.md; future builds must record their own identities.

| Area | Existing evidence | Limit of the evidence |
| --- | --- | --- |
| Correctness | 96,808 differential checks per configuration on the prior runtime: Serial/G1/ZGC, compact strings on/off, startup disabling and genuine library absence; public bulk/small-stack checks also passed | The repaired source had a fresh Linux configure and isolated Rust archive build, not a full exact-head JDK build |
| Public API | Earlier normal jtreg run: 2 tests, 154 TestNG cases | No native target other than Linux x64 was executed |
| Startup/lifetime | Source reviews of bootstrap guard, lazy holder, loader-lock release before RegisterNatives, JNI region copies, bounded scratch and exception checks; disabled and absent-library runs | No recorded cold loading latency, concurrent first-use execution or process lifetime amortization |
| Allocation | Equal Java B/call in the recorded plain-call pairs; native ABI has no allocation in its conversion path | ThreadMXBean measures Java allocation, not process RSS or native allocations; the old harness did not reject unavailable allocation accounting |
| Performance | Final-threshold `jni-selected.csv`: 64 KiB encode 26,513/18,753 ns (1.41x), decode 101,559/16,750 ns (6.06x), reference/selected; Java allocation 131,112/131,112 B and 65,552/65,552 B | G1 Linux x64 screen, 180 ms warmup and five short samples, noisy smaller cases; no application or portable performance conclusion |
| Controls | Separate same-binary startup-disabled screen exists | Its header has encodeMin=512, not the published 1,024, and broad ranges; it cannot prove a precise current fallback-overhead percentage |
| Other targets/MSRV | Target mappings and source/path review; simulated multiword fixpath fixtures | Linux AArch64, macOS ARM64, Windows x64 and actual Rust/Cargo 1.85 execution remain unqualified |

The file named `jni-final.csv` also has encodeMin=512. It is superseded for
threshold claims by `jni-selected.csv` (encodeMin=1024/decodeMin=128). Historical
Git blob IDs for selected/final/control CSVs are, respectively,
`8d7022b4b4d687fb79394a7c43f845364d839d75`,
`86daf4cdddf50998e23da4402e1b3662621d5427`, and
`9849192693136c7c561a8833bf330265ab2e7677`, under the historical local commit's
`test/benchmarks/hex-simd/evidence/`. Those raw local records are not prerequisites
for running this plan and are not included in the curated review branch.

The much faster FFM prototype, its tiny crossovers and UUID experiment are
separate historical experiments. They cannot justify JNI thresholds. UUID
canonical single-call parsing/formatting lost there and remains dropped. No
UUID generation, RNG change, new intrinsic stub, assembly or SIMD kernel is in
this integration. The present direction is an optional JNI/library integration.

No additional runtime defect was identified by this source reconciliation.
The follow-up source changes make allocation accounting fail explicitly when
unavailable, allow the same measurement harness to run on the baseline JDK,
provide bounded timing settings and prepare protected/first-use workload models.
They do not constitute new correctness or performance evidence. The global
1,024/128 cutoffs remain provisional Linux choices.

## Scope, hosts and ownership

Stage 1 uses the suitable available Linux x64 host, its installed compatible
tools, and normal local worktrees/builds. It settles exact-head correctness and
whether the benefit justifies proceeding. It does not require four native
performance hosts. The supported-platform table below defines later scope, not
four prerequisites for Stage 1.

Do not transfer an older JDK binary, patch production classes into a borrowed VM,
install unmanaged tools, create CI, dispatch workflows, create a PR or merge.
Cargo may populate its normal cache from the existing exact manifest/lockfile;
all builds/tests then use the frozen cache. No HTTP client/server work is
included; qualification JVMs use only Serial/G1/ZGC.

| Host | Repository development profile | Required Rust host |
| --- | --- | --- |
| Linux x64 | x86-64-v3 / AVX2, generic tuning | x86_64-unknown-linux-gnu |
| Linux AArch64 | ARMv8.2-A, generic tuning | aarch64-unknown-linux-gnu |
| macOS ARM64 | Apple M1 | aarch64-apple-darwin |
| Windows x64 | AVX2, normal MSYS/MSVC build environment | x86_64-pc-windows-msvc |

Only a Linux x64 environment is currently selected. The mandatory Stage 1
hardware is one x86-64-v3/AVX2 host with the resource budget below and timing good
enough to pass the bounded controls. No additional native hardware is required
to get that result. Installed Boot JDK, jtreg, native compiler, compatible Rust
and its runtime redistribution notices are normal build prerequisites; the
selected workspace already has the compatible toolchain used previously.
Current local historical Rust/Cargo was 1.99.0. An actual 1.85 toolchain is needed
only to substantiate the declared minimum-version claim, not to decide Stage 1
with the compatible installed compiler. Carry untested MSRV forward explicitly;
do not install tools or silently raise the minimum here.
Linux's optional mold choice must match between baseline/candidate;
use the supported CONFIGURE_DEV_NO_MOLD=1 switch for both if mold is unavailable.
JMH is not installed in the selected workspace; this batch uses the existing
bounded standalone harness and does not add a JMH installation dependency.

The implementation owner owns preparing/running the batch once authorized,
source fixes, tool/path diagnosis, identity manifests, interpretation, and one
final recommendation. Ordinary Cargo cache preparation, baseline checkout,
measurement scripts and log handling are owned work, not user dependencies.
The Stage 1 quiet measurement slot is the only possible hardware/resource
dependency beyond the selected suitable host; an unstable control yields an
honest inconclusive result, not a demand for three more native hosts. Later
supported-platform correctness belongs to separately approved normal CI after
PR integration. Preparing its installed tooling/Cargo cache and enabled-option
test commands is owned integration work, not a request for user hardware.
Native performance on another architecture would require a representative host
only when making that specific additional performance claim. The maintainer's
acceptance of an explicitly maintained 0.9.0-dev pin and authorization for the
later PR/CI stage are separate decisions. No pin update or default enablement
is implied.

## Execute one complete Stage 1 batch

The published preparation commit before this runner repair was
`ad9acad576a1ca92110dd55e6eb0ebad21499ed6`. It added unrun workload sources,
not new evidence. The executable [qualify.py](qualify.py) now owns the whole
batch: supervision, worktrees/builds, checks, all measurements, adjudication,
disabled reconfiguration, process cleanup and the final result. It is Linux
x64 only. Its source has been inspected; the runner and new workload sources
remain unexecuted. No campaign outcome is claimed in this preparation commit.

After execution is authorized, use the full source commit from the review
handoff, not a moving branch name. Use installed compatible tools; the selected
workspace's existing activation script is shown below, not an installation.
The output directory must be fresh and preferably outside the source worktree.
Paths must contain only ASCII letters/digits and `_./@:+-`, matching the shell
launchers' space-free path contract.

```sh
source /workspace/toolchains/activate.sh
: "${REVIEWED_Q:?Set the full reviewed source commit from the handoff}"
python3 test/benchmarks/hex-simd/qualify.py --execute \
  --revision "$REVIEWED_Q" \
  --output "/workspace/hex-qualification-${REVIEWED_Q:0:12}" \
  --boot-jdk /workspace/toolchains/jdk27 \
  --jtreg /workspace/toolchains/jtreg83 \
  --cargo "$(command -v cargo)" --rustc "$(command -v rustc)" \
  --platform-option=--with-toolchain-path=/workspace/toolchains/gcc16/bin \
  --platform-option=--with-extra-ldflags=-B/workspace/toolchains/mold/bin
```

Replace those installed-tool paths with the host's normal paths if different.
Platform options cannot override the frozen profile, collector feature set,
heap/build-job settings, source version, Boot JDK or jtreg selection. The runner
uses the repository's normal bin/configure-dev for both detached worktrees,
release builds, JOBS=2 and identical platform settings. If mold is absent, it
sets the existing CONFIGURE_DEV_NO_MOLD switch for both. No compiler, toolchain,
CI action, PR, push or merge is installed/created/dispatched by this runner.
Normal `cargo fetch --locked` populates its owned Cargo cache; compilation and
Rust tests use the frozen graph. Production classes come from full matched
native JDK builds. Only the unchanged reference class is patched into steady
comparison VMs; cold calls use neither that patch nor a helper pre-warm lookup.

## Actual resource and ownership enforcement

The source implements these controls, rather than requiring an unspecified
operator or external watchdog:

* The monotonic total is six hours including setup, result writing and cleanup.
  Work stops ten seconds before that deadline. A watchdog sends TERM, then KILL
  after two seconds, and forces runner exit after five seconds or at the total
  deadline. It writes a best-effort emergency result without letting a stuck
  result filesystem disable the deadline.
* The runner restricts its CPU affinity to two available CPU IDs before spawning
  children. This mask is inherited by compilers/JVMs; make and Cargo each use two
  jobs, jtreg concurrency is one, and timing has one JVM at a time. The first-use
  race has four threads, within that same affinity.
* Aggregate RSS of the runner and owned descendants is sampled every 250 ms;
  exceeding 8 GiB terminates the batch. Shared pages can be counted more than
  once, making this conservative. This is sampled enforcement, not a claim of
  an unprivileged kernel memory quota or zero transient overshoot.
* The fresh output tree and its own Git worktree metadata are limited to 40 GiB
  of accounted bytes: max(logical size, allocated blocks), deduplicating hardlinks.
  Cargo/ccache/temp outputs are redirected into that tree. Full scans run during
  builds/tests and at closed measurement-phase boundaries. During the no-file-I/O
  Java measurements, only logs, temporary files and root JSON records can grow;
  those are checked without scanning two JDK source/build trees inside a timed
  JVM. Perfdata is disabled and JVM error files go to the monitored log directory.
  Disk checks run every five seconds and at command boundaries. Polling may
  permit brief overshoot; peak observations and any breach are recorded.
* Every subprocess starts in a new session. Linux child-subreaper mode adopts
  daemonized grandchildren, including compiler servers. PID plus kernel start
  time and pidfds identify owned processes; signals never use a process-name
  match or a shared process group. Cleanup runs between commands and on failure,
  interruption and normal completion. A surviving process is reported as cleanup
  uncertain, never silently declared gone. Other tasks' processes are untouched.

The Linux/Python pidfd and subreaper facilities are checked before building.
They are normal facilities on the selected host, not additional performance
hardware. If unavailable, the runner records an environment prerequisite and
stops before the campaign. No resume/retry or extra timing repetition is automatic.

Builds share the time before the final 105-minute reserve: approximately 4 h
15 min combined, including preparation. There is no individual 90-minute build
failure rule. A build/deadline/resource failure produces INCOMPLETE, not a
measured product rejection. The throughput window is 75 minutes, bounded also
by the global deadline and a 15-minute cleanup reserve. Its declared loops alone
cost 2,754 seconds (45.9 minutes), before 72 timing JVM startups, calibration,
GC and supervision overhead. Cold measurements use another 225 fresh JVMs;
correctness/profile/race processes are separate and inside the same six hours.
Before starting the throughput grid, the runner requires at least the declared
loop floor plus ten minutes overhead and fifteen minutes cleanup to remain.
Insufficient time is reported as a resource limit, not evidence against HexFormat.

## Work owned by the executable

1. Verify the full reviewed checkout is clean, the baseline/pin/lock identities
   match, and the host exposes x86-64-v3 flags. Record installed tool/OS/CPU
   versions and actual affinity. Create fresh detached baseline/candidate
   worktrees and normal release images. Preserve immutable spec snapshots and
   SHA-256 of the runner, lockfile, release, launcher, java.base.jmod, modules,
   libjvm and optional JNI library. Recheck frozen source heads/status afterward.
2. Validate exactly Serial/G1/ZGC in the configured profile; run its source
   smoke under those collectors. Inspect native exports/dependencies and verify
   every copied Rust runtime notice against that actual compiler's source
   notices, plus the pinned dependency MIT notice. No excluded collector or
   HTTP client/server workload is started.
3. Run baseline and candidate public HexFormat jtreg suites. Both the Boot-JDK
   jtreg launcher and compilation/test child JVMs receive explicit Xms128m,
   Xmx512m, ActiveProcessorCount=2, UseG1GC and JNI checking. Child settings are
   passed via individual `-vmoption:` arguments and checked in the JTR records.
   The original testOOME is unchanged. Its expected low-heap TestNG SkipException
   is accepted only for that method with its exception or OOME memory diagnostic;
   passed plus skipped must cover all 154 TestNG cases with zero failures. Counts
   are recorded separately. Exactly one recognized summary must occur in the
   HexFormatTest JTR for each baseline/candidate run. Missing, duplicate, malformed
   or misplaced summaries are INCOMPLETE even if a generic JTR says Passed.
   Such skips are not promoted to full large-array
   coverage, and the runner does not raise the heap to suppress them.
4. Run Rust boundary tests, normal jlink images with/without the native library,
   and verify.sh. The six GC/compact configurations use explicit heap/processor/
   collector settings; disabled and absent cases explicitly use G1 with compact
   strings on. Availability and successful native decode are distinct assertions.
   UTF16, malformed diagnostics, private chunk writes, ranges, fallback and the
   public bulk/GC/small-stack request remain covered. The 192 KiB Thread stack
   argument is a platform hint, not a measured physical stack size.
5. Run concurrent first-use checks for baseline/disabled/enabled/absent library
   states under all three collectors. Run the complete cold and throughput grids
   below. Logging-only cold checks require empty/tiny calls not to load hexsimd
   and eligible calls to load it; logging is excluded from timing observations.
6. Adjudicate complete evidence, then preserve the enabled image locally and
   reconfigure the same output directory disabled with missing Cargo/Rust paths.
   Rebuild normal images once. Verify native/debug files and owned notices are
   removed, all unrelated legal files retain their hashes, and G1 correctness
   falls back without the disabling property. Cleanup and final source identity
   checks are mandatory even if the completed measurements show a loss.

Any command failure, JNI warning, mismatch, unavailable accounting or malformed
CSV stops with the exact command/logs and an incomplete/invalid result. Do not
reinterpret that as a measured performance result. No general grep treats an
expected testOOME skip as a process failure.

## Fixed measurements and explicit acceptance

Throughput has three independent forks per cell, in baseline/disabled/enabled
order, then reversed, then the initial order. Each public operation receives
1,000 ms warmup and five samples of at least 100 ms. Samples within one process
are not independent forks. G1 measures 17 declared sizes including both cutoff
neighbors and 1 MiB; Serial/Z measure six representative sizes. G1 additionally
measures compact-string-disabled cases. All three states execute the protected
models: digest-plus-hex, fingerprints, uppercase/ranges, substring input,
CharSequence, Appendable, late invalid Latin1/UTF16, and the fixed 101-call mix.
Every returned result escapes. Input conversion/allocation and native transition
costs remain in the measured public/workload call. See the fixed arrays in
qualify.py; there is no adaptive size/fork/warmup expansion.

Cold has five alternating rounds per collector/state/mode: empty, tiny, first
eligible encode, first eligible decode, and bulk-session. The supervisor records
wall time immediately around Popen/wait, excluding its own log/disk setup, plus
FirstUse's public-call interval and result length. It is fresh-process timing
with normal OS caches, not an evicted filesystem/page-cache experiment.
**Bulk-session is exactly 128 encode/decode pairs: 8 MiB each direction.** It
includes first loading/dispatch and all 256 call allocations. It is one observed
session size. No measured amortization crossover, minimum profitable session
length, or modeled break-even estimate is claimed. No sweep is hidden here.

`adjudicate()` in qualify.py, not summarize.py, writes acceptance.json. It first
requires all 72 throughput process cells, exactly five finite nonnegative timing/
allocation observations per operation, and all 225 distinct cold records.
Baseline/reference/selected operation sets and native availability/settings must
match the declaration. It then applies these gates explicitly:

* Compare same selected public calls across baseline, disabled candidate and
  enabled candidate separately in **every one of the three forks**. Report both
  disabled/enabled and baseline/enabled speed ratios. Also compare the unchanged
  reference across images, and carry its within-VM paired observations.
* Mark INCONCLUSIVE_NOISE if disabled/baseline or unchanged-reference drift
  exceeds max(10%, 5 ns/call) on valid steady cases; also if any decisive bulk
  state spans over 2x within at least two forks. A reversed within-VM reference
  benefit at a decisive size is another consistency failure. Cold disabled/
  baseline wall drift beyond max(10%, 10 ms) is also inconclusive. Noise cannot
  produce a GO even when another ratio looks favorable.
* For encode 1,024 and decode 128, require at least 1.10x against **both** disabled
  candidate and baseline in all three forks. At 4 KiB/64 KiB require encode at
  least 1.20x and decode at least 2x under each collector. This is a retained-
  cutoff gate on this host, not a portable crossover claim.
* All valid plain/protected calls must not regress against either comparison
  by more than max(5%, 5 ns/call); the 101-call model has a 5% limit. This includes
  compact-string-disabled paths. Invalid diagnostic calls have the separate
  max(25%, 1 microsecond) replay allowance and remain separately reported.
* Java allocation medians in each fork must agree within 16 B/call across the
  three states and versus that process's reference for valid calls. Every raw
  sample must have available, finite, nonnegative accounting. Native memory is
  not inferred from ThreadMXBean. Peak aggregate RSS is a resource observation,
  not native bytes per operation.
* Cold comparisons use the five-round median for each collector. Enabled empty/
  tiny process wall must stay within max(5%, 10 ms) of both controls. First
  eligible public-call overhead must be no more than +20 ms versus both. The
  **fixed 128-pair session** process-wall median must beat both controls by at
  least 10%. Raw cold observations and both intervals are retained; these gates
  do not infer an amortization point from the one session size.

A clean gate failure is NO_GO_MEASURED; report route-specific losses rather than
hiding them in a mixed average. Noise takes precedence and yields INCONCLUSIVE.
A missing/invalid/incomplete campaign never gets a GO. Operational failures,
resource exhaustion and expected low-heap skips have distinct handling.

## Deliverables and staged decision

The fresh output directory contains commands.json (actual argv/cwd/deadline and
return codes), manifest.json (spec/artifact/tool/test/skip identities), complete
stdout/stderr/JTR logs, cold.json, measurements.json, acceptance.json and final
result.json. Enabled artifacts are retained at enabled-image after the disabled
reconfiguration, with the original measured path and retained path both recorded.
Exit statuses: 0 LOCAL_GO, 2 NO_GO_MEASURED, 3 INCONCLUSIVE_NOISE, 4 incomplete,
64 invocation error, 124 watchdog force-exit. result.json is authoritative;
missing emergency output is an uncertain interrupted outcome, never success.

The pure parser has offline fixtures, runnable without a JVM or campaign:

```sh
python3 -B test/benchmarks/hex-simd/TestTestNGEvidence.py
```

All 10 fixture tests passed in this preparation repair; they cover summary
cardinality/format, counts and permitted versus inconsistent skips. This is
parser evidence only; the supervised build/correctness/timing batch remains
unexecuted. No design, budget or product qualification claim changes.

Stage 1 LOCAL_GO means exact-head Linux development-profile correctness and
benefit support proposing opt-in integration. Other native performance hosts
and an unavailable Rust 1.85 are not prerequisites for that useful result. The
actual installed Rust version and untested MSRV remain explicit. The development
pin's maintenance responsibility remains a review decision; default enablement
and unrelated APIs/UUID are out of scope.

Stage 2 is separately approved PR integration and normal existing CI for Linux
x64/AArch64, macOS ARM64 and Windows x64 **correctness/build** support. It must
prepare the normal managed tool/cache setup, build the enabled option, assert
native routing, and cover collectors/fallback/startup/packaging. Ordinary CI
with hex-simd disabled is insufficient. Its preparation is owned integration
work; this continuation creates no workflow, CI dispatch or PR. Settle minimum-
version coverage before claiming it was tested. Platform correctness CI does
not establish portable performance.

Stage 3 is optional, claim-specific performance on another native architecture/
OS. Only those additional claims require suitable additional performance hosts.
A lack of them does not erase a positive Stage 1 result or block proposing Stage
2. A published source branch alone is not completed integration. Any source or
threshold change after the frozen Q invalidates the relevant artifact's result;
report that fact and a complete replacement batch, without automatic reruns or
a chain of tiny approvals. All execution described here remains unrun.
