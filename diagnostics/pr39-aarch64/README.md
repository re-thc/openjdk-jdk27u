# PR39 native AArch64 qualification

**The original native correctness campaign passed and its fixed performance
screen failed. PR39 is not ready to merge.** This review branch now contains an
AArch64 source repair: short heap calls retain Java, guarded scalar prefixes
avoid early stub entry, C2 heap vector work is capped at 2 KiB before an
original-argument Java fallback, and C1 leaf admission is bounded. Native/mixed
C2 calls retain their existing full-range stub within the 128 B–64 KiB guard.
Ambiguous unsafe prefix loads use compiler ordering barriers around the
comparison so ordinary heap stores cannot cross them.
See [the repair and its limits](REPAIR.md).
The repaired source has not run on native ARM or been benchmarked.

[Run 39033175975](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39033175975)
completed the single approved preparation-repair continuation at source
`678938fb5e6dba44a4d7089b026effdfa266ec13`. All 34 required jtreg records and
108 fresh-VM probes passed. Its 34-row performance screen found 21 regressions,
8 inconclusive rows and 5 passes, with all four control placements passing.
The 98 main rows were not admitted. No timing retry or extra sample was run.

See [the native verdict and attribution limits](RESULTS.md),
[all observed samples and compilation/GC review](results-39033175975.json), and
[raw evidence artifact 12102159804](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39033175975/artifacts/12102159804).
The downloaded archive's SHA-256 is verified. Both jobs completed cleanup.

The prior [preparation attempt](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39030274620)
stopped at JMH annotation-processor discovery before targeted correctness or
timing. The continuation used an explicit pinned-JAR processor path and rebuilt
all three matched images. Charged usage is 33 + 62 = **95 runner-minutes**, with
**130 of the original 225 minutes remaining**. That balance does not authorize
another launch. No further CI or benchmark campaign has started.

## Sources and existing evidence

The author head, actual master ref and synthetic merge parents/tree were
verified before launch and remained unchanged through the completed campaign.
The measured package incorporated the author's `9fedf7ac9` segment-base/address
caching change. Historical results below describe that source, not the subsequent
repair. The author branch and PR description remain untouched.

[CI run 39027042938](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39027042938)
completed successfully on `9fedf7ac9`: **57/57 jobs**, including native Linux
AArch64 and macOS ARM64 release/fastdebug builds and tier1. This is correctness
evidence. The targeted qualification workflow did not repeat ordinary tier1.

The historical measurement baseline in the description resolves to
`e206bae32b2a6cc1fa9464ad34d75f2df4b347e9`. It is the common ancestor of the
PR head and the PR API's reported `.base.sha`,
`de359971a1972f74866e963fb4f750359aecc145`.
It predates master changes to the interpreter, class loading, ARM C2, and startup.
It can describe the author's historical x86 experiment, but does not isolate
the incremental merge result on current master. Those x86 results remain the
author's separate work.

Two direct reads identify current master as
`89885a6288e7aaabd01678a704a586272c0f96e3`: `git ls-remote origin refs/heads/master`
and `GET /repos/re-thc/openjdk-jdk27u/git/ref/heads/master`. The pull-request
endpoint separately reports `.base.ref=master` with `.base.sha=de359971a19`.
The campaign follows the actual Git ref and the synthetic merge's parents;
it does not treat the differing PR metadata value as the current branch tip.
`89885a6288e` has immediate parent `de359971a1972f74866e963fb4f750359aecc145`
and changes only `src/hotspot/cpu/x86/vm_version_x86.cpp` (AMD Zen3+ spilling).
Using `89885a6288e` in both the base and merge candidate keeps that update
matched and isolates PR39's incremental changes. It adds no ARM tuning scope.

The completed campaign used a matched pair with the master updates present in both:

| Role | Commit | Tree |
|---|---|---|
| Base | `89885a6288e7aaabd01678a704a586272c0f96e3` | `d77a085e51da37106c582c017af6151e01e95f42` |
| Candidate | `d234724f75df8ec94427ba168533a5fc89fae714` | `b4693729ab5276f398ab6068b2377472284df285` |

The candidate is the identified PR merge tree. Its exact ordered parents are:

1. `89885a6288e7aaabd01678a704a586272c0f96e3` (current master ref).
2. `9fedf7ac9040bf1d46e383201524f1ca7a13a29e` (current author head).

Its tree is `b4693729ab5276f398ab6068b2377472284df285`, verified with both Git
and GitHub's Git-commit API. It is deliberately distinguished from the branch head.
The workflow fetches these commits and makes normal detached source checkouts
for three matched native builds.

The pending repaired-source campaign is separately specified in
[CAMPAIGN.md](CAMPAIGN.md). It keeps the author-ref guard at `9fedf7ac9` and
master at `89885a6288e`, verifies the review branch's `src` and `test` trees
against repair `93926eadc57265249c5cfeef35a4975a551e827a`, and constructs the
identified repaired merge `a7ca575cbf71a0ad451b5986f3b50132489b8c0f`, tree
`9587ce8f3a1076fea952b85fd27590ea002213c6`. Its ordered parents are master
then the repair. Any author/master/source drift stops the campaign. The
historical merge above is used only to describe the completed experiment.

## Launch and budget

The repository's current [main.yml](../../.github/workflows/main.yml) selects
`ubuntu-26.04-arm` in both `build-linux-aarch64` and `test-linux-aarch64`.
The successful native ARM jobs in run 39013245609 provide executed CI evidence
for that configuration. This package uses the same runner with the repository's normal
BootJDK and JTReg actions and native `bin/configure-dev` profile. GCC/G++ 16 and
the system GNU linker build both releases and candidate fastdebug on the same
machine. `CONFIGURE_DEV_NO_MOLD=1` selects the profile's supported GNU-linker
option for all three builds. The source timestamp and version options are fixed
across the builds. Source, configure options, compiler/package versions,
image file hashes, CPU implementer/part information, OS, runner image version,
and process affinity are retained. Only Serial, G1, and ZGC are in the profile.

Publishing `codex/pr39-aarch64-qualification` starts no campaign. The new
workflow has only `workflow_dispatch`; there are no push, pull-request,
schedule or workflow-run triggers. The ordinary sanity workflow pushes only
on master, and no PR is opened for this review branch. The other workflows
are reusable `workflow_call` definitions. The author's PR head and description
are left untouched.

The completed continuation was explicitly authorized after independent source
review. The dispatch route for an independently reviewed exact commit is:

```sh
gh workflow run pr39-aarch64-qualification.yml \
  --repo re-thc/openjdk-jdk27u \
  --ref codex/pr39-aarch64-qualification \
  -f reviewed_commit=<exact-reviewed-commit-sha>
```

Publishing the branch does not dispatch this command. The completed run above
is the only continuation that was launched. Both jobs require the dispatch
event, the exact review branch, a `reviewed_commit` input matching `github.sha`, and attempt 1. A changed branch tip or a rerun
cannot execute the approved campaign. Source pins are checked again by the driver.
Dispatch access and GitHub's availability of this branch-only workflow are not
assumed. If GitHub does not expose this dispatch, report that launch blocker;
do not launch a generic sanity workflow, install this on master, add a push
trigger, or start an alternative campaign automatically.

The original reservation is **225 runner-minutes**; 95 have been charged and
130 remain. The pending plan caps JTReg preparation at **5 minutes** and the
native job at **125 minutes**, a total upper bound of **130 runner-minutes**.
These caps are a review proposal, not launch authorization. Native step caps
sum to **119 minutes**, leaving six for runner setup and post steps:

| Work | Step caps, minutes |
|---|---:|
| Paths, checkout, driver tests, BootJDK, JTReg, packages, source checks | 14 |
| Three matched builds | 35 |
| Common fixtures and JMH compilation | 3 |
| Correctness, including archiving | 30 |
| Fixed timing screen and admitted main rows | 30 |
| Evidence upload, including incomplete raw jtreg work | 6 |
| Final scope receipt | 1 |

The three builds share one **34-minute driver deadline**, correctness shares
one **28-minute deadline**, and timing shares one **29-minute deadline**,
including JVM startup, warmup and analysis. Step caps leave bounded cancellation
room. The previous fresh native builds took 30m38s; correctness took 21m54s;
fixtures took 2s; JTReg preparation took 40s; upload took 6s. Added repair tests,
code printing, an uncached JTReg build and the full fixed timing matrix are
unmeasured. These caps do not guarantee completion. Expiry stops admission and
leaves the source unqualified; there is no timing retry, replacement host or
sample expansion. The fixed 4 KiB equality benefit gate runs before all later
timing rows. See [the complete source and execution plan](CAMPAIGN.md).

Each managed command owns its session/process group. SIGTERM, SIGINT and SIGHUP cause
bounded cleanup: TERM with up to two seconds to exit, then KILL with up to two
seconds to reap the direct child. Descendants in the owned group are signaled
even if its leader already exited; a signal during Popen is deferred until child
ownership is recorded. Repeated cancellation does not interrupt cleanup. The
wrapper exits on cancellation without admitting another command. The CLI
stage handlers also interrupt receipt publication; the final workflow scope
requires successful step outcomes as well as both pass receipts. Python-only
regression tests exercise direct timeout, wrapper termination with a TERM-ignoring
child/grandchild, and the spawn-return race. No handler can execute after SIGKILL;
runner teardown remains responsible for that case.

### Disk admission and build retention

The observed native runner had four CPUs, about 15.57 GiB RAM and a 144.26 GiB
filesystem, with 105.062 GiB initially free. Future storage is still checked
from actual available bytes.
Source preflight records total/free bytes and requires space for two measured
source checkouts, a **5 GiB active build allowance**, **2 GiB retained-output
allowance**, a **512 MiB ccache cap**, and **2 GiB safety reserve** before making
the two worktrees. It checks actual free space again before each build and polls
the 2 GiB low-water mark during configure/make, terminating the owned group if
the reserve is breached. Capacity failure stops the campaign with a disk receipt;
it never counts as a timing result or triggers a different runner automatically.

All three native builds use `--with-native-debug-symbols=none`; fastdebug
assertions and IR facilities remain enabled. After identity/spec/config/image evidence is retained, the base
keeps its completed image only. Candidate release/fastdebug keep the completed
JDK/test images and test configuration, but discard `hotspot` object output and
`support/native`; `test-only` consumes the completed images without a C++ rebuild.
Pruning refuses an image symlink that resolves outside the completed images,
so retained executables cannot silently depend on deleted object output.
Before/after byte counts and available space are retained for every build. This
avoids retaining three full sets of object files at once. Admission allowances
are conservative planning gates, not a claim that this host certainly fits or fails.

## Correctness gates

The existing tests already provide broad semantic coverage; the campaign runs
the relevant native gaps rather than adding another implementation of mismatch.
It requires actual passing jtreg result records and required test ids. A skipped
long-range test or skipped graph test cannot count as a pass. Each collector
group gets a fresh work directory, and its complete jtreg results are archived
before the next group starts.

- Candidate fastdebug: native C2 bounds and polling IR/Ideal checks, Serial graph
  checks, short native path IR, interpreter values/entry/counting/profiling and
  `-XX:-InlineIntrinsics`, C1/C2 raw mismatch including empty input, and IGVN.
- Candidate release/G1: native/mixed and mapped comparisons, low threshold
  powers, closure handshakes, scoped operations, signed-int length boundaries,
  string terminator bounds, NIO boundaries and every typed view/byte order,
  direct-owner reachability, hashCode, CharBuffer string-copy exceptions, and
  JDI interpreter breakpoints/method events. The test headers select their
  interpreter/C1/C2/intrinsic-disabled runs.
- Candidate release/Serial and ZGC: native, mapped-fault, closure, long polling,
  NIO boundaries and direct-owner reachability tests. Default G1 and explicit
  Serial graph checks complement these runtime collector checks.
- 108 fresh-VM checks cover first public array, segment, buffer and int-view
  comparisons under all three collector and compilation-mode settings, at
  128 B, 64 KiB and above the chunk boundary. These are cold correctness checks;
  they do not make a startup timing claim.
- One compiled benchmark harness is used on both releases. Fixture checks
  exercise every primitive array kind, differing positions 0–7, subrange
  offsets 0/1/7, native/heap/mixed/mapped buffers, and CharBuffer threshold edges.
  Existing hashCode tests supply the semantic oracle for that benchmark.

Bounds, exception ordering, mapped-fault handling, owner reachability, JVMTI,
and safepoint polling are merge gates. No collector, signal handler, or production
kernel is changed by this qualification package.

## Fixed performance protocol

`campaign.py plan` emits the entire future matrix before measurements: **35 screening
rows and 97 main rows**, plus eight predeclared control placements. The existing
native equal 4 KiB row moves from main to the start of the screen; its stability
and paired 5% benefit gates must pass before any remaining screening or main row
is admitted. Historical results retain their original 34/98 split. There are
**560 JMH forks** in total. The main rows are fixed in advance and run only after
the screen and its controls pass; screening never adds rows or samples.

The screen measures byte-array differences at each of positions 1–7 for 8- and
128-element ranges, second-element differences for every other primitive kind,
and equal short/large byte ranges. Additional screen rows request 64 KiB or
128 KiB with differences at 1, 7, 10, 25, 82 and 1267 bytes, including native
and both mixed segment orders. It specifically tests the new ARM heap stub
call cost after the caller's first-element check. Arrays are not an unchanged
control on ARM. The completed screen supplies the measured losing paths that
motivate the subsequent repair; it does not measure recovery or application speed.

The large-request rows are motivated by supplied offline native-zstd sequence
evidence: 43,658 decoded sequences had median accepted match length 10 bytes,
p90 25, p99 82 and maximum 1267; median legal remaining range was 61,146.5
bytes and p90 115,664. Frame SHA256:
`6901a47a3100e2e1453a43a70017d5a6ad83fcc49a3f8b1be875d7ffe08dcab5`;
corpus SHA256:
`dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9`.
These supplied observations guide synthetic requested-length/prefix cases.
Native accepted sequences differ from Java's seed, backward extension and
rejected candidates, so this is not a Java extension-call trace or evidence of
Java overhead. The corpus and frame are not transferred or fetched by the campaign.

### Setup, code generation and GC assessment

The current ARM stub enters a frame and sets `doing_unsafe_access` before
comparing data. For a request of at least 64 bytes, its first data iteration
loads 64 bytes from each input and reduces the XOR vectors before locating the
first differing word. A mismatch after only a few bytes still pays that setup.
The unsafe-access flag and mapped-fault continuation are correctness requirements;
they cannot simply be removed to reduce overhead.

The [upstream zstd v1.5.7 count routine](https://github.com/facebook/zstd/blob/v1.5.7/lib/compress/zstd_compress_internal.h)
first compares one machine word and can return its first difference before
entering its word loop. This is a representative source comparison, not a
disassembly or identification of the supplied native binary. It explains why
a large requested range alone is insufficient to select a profitable kernel.
The actual common-prefix distribution and the caller's known seed bytes matter.

The measured PR checked the first byte and first word in segment mismatch and
had a native C2 first-word precheck. Its heap C2 calls lacked that precheck and
bypassed the size predicate. The [per-row audit](causal-audit-39033175975.json)
distinguishes heap caller inlining from out-of-line native helper compilation.
All measured mismatch forks recorded zero collections. The exact ARM instructions
were not retained, so call-path evidence does not prove an instruction bottleneck.

The leaf itself allocates no objects and makes no GC transition. Chunk loops,
session checks, reachability fences and surrounding caller allocation can still
affect compilation, polling and GC behavior. Source inspection therefore supports
a setup/code-generation hypothesis, but cannot distinguish it conclusively from
caller or GC costs. Every planned JMH fork retains GC allocation/count/time
metrics alongside compilation/intrinsic logs, using the same profiler on both
images and without adding samples. CharBuffer staging is expected to allocate;
unexpected allocation or GC activity in mismatch rows needs investigation when
interpreting their result. Raw GC evidence must accompany any causal claim.

The repair uses ordinary C2 nodes below range guards, retains array guards and
exception order, and calls the existing Java implementation with original
arguments after an equal bounded heap vector prefix. Native/mixed requests
retain their full guarded stub length and have no post-stub Java rescan.
Its new graph and semantic
tests are described in [REPAIR.md](REPAIR.md). Preserving a vector opportunity
does not prove its prior measured benefit survives the added dispatch.

Main rows include twelve C1 segment cases: HEAP, HEAP_NATIVE and NATIVE_HEAP at
64 and 128 bytes, both equal and differing in the first word. These cover the
caller/tier affected by `9fedf7ac9`. The fixed total is maintained by reducing
redundant C2 storage/difference and alignment combinations; no samples are added.
Main rows cover heap/native/mixed in both orders, ordinary direct and mapped
segments, ByteBuffer mismatch/equals/compareTo, char/int/long views, equal and
first/first-word/middle/last differences, misaligned inputs and 8, 63/64/65,
127/128/129, 65535/65536/65537 and 1 MiB boundaries. Representative C1 and
interpreter rows check their separate performance paths. HashCode rows cover
3/4/1024 elements. CharBuffer put/append rows cover both string coders,
native/swapped order, heap/direct views, both staging thresholds and 1025 chars.
All six append rows call `append(text, 0, text.length())` to exercise the changed
CharSequence helper; the put rows cover the String path.
These are microbenchmarks; they do not establish an application speedup.

Each row has two matched blocks in **A/B then B/A** order: one fresh JMH fork
per image per block, one thread pinned to the same allowed CPU, G1, 256 MiB heap,
three 250 ms warmups and three 250 ms measured iterations. The completed historical
run used two warmups; the third is a fixed future protocol change intended to
absorb the observed worker recompile, with no promise of stable activation.
C2 uses `-Xbatch`, no
tiering, and threshold 1000; C1 stops at level 1; interpreter rows use `-Xint`.
JMH 1.37 and its fixed dependencies are checksum verified; the shared source,
generated classes and dependencies are hashed. Compilation/intrinsic logs,
LogCompilation XML, raw JMH JSON and GC profiler metrics are retained for every
row. The pending plan requests exact benchmark, generated-worker and retained hot
callee code dumps with `CompileCommand=print`, including all eight array-range
overloads, the original-argument ArraysSupport fallback, segment dispatch and
both scoped large-byte helpers. Per-fork receipts record callee nmethods and
all observed compilation/invalidation lines with console iteration brackets;
XML installation stamps and raw bytes still require review. The exact targets
and their retained-log provenance are recorded in
[instruction-targets-39033175975.json](instruction-targets-39033175975.json).
Raw instruction bytes are required for instruction attribution when an
assembler listing is unavailable; absent helper/stub bytes limit conclusions
to end-to-end call-path recovery. Neither this capture nor the extra
warmup changes row counts, samples, loss/stability gates, or the 29-minute cap.
Each fork must have finite nonnegative `gc.alloc.rate` evidence and valid
`gc.count` samples. Missing/disabled or failed allocation profiling is reported
as unavailable, never as zero allocation. JMH legitimately omits `gc.time` when
no count/time delta occurs and `gc.alloc.rate.norm` when allocation is exactly
zero; those omissions are accepted. Positive allocation requires valid normalized
evidence. Optional metrics may have fewer observations when zero deltas omit them.

Requested flags alone do not establish the installed compilation tier. The
driver inspects retained nmethod records for the benchmark or its generated JMH
worker, requires C2 or level-1 C1 as requested, and rejects compiled benchmark
code for interpreter rows. It saves the actual compiler/level/stamp records.
Before attributing measured time to a tier, review installation stamps against
the measured iteration boundaries and inspect deoptimization in the retained
XML/console logs. An nmethod installed sometime during a fork is not proof that
all its measured iterations ran in that tier. The timing receipt explicitly
retains this review requirement.

These are deterministic screening gates for the observed matrix, not statistical
confidence bounds or proof of no regression. Gates are decided before sampling:

- A material loss is candidate time exceeding base by **both 5% and 1 ns/op**.
  A loss in both order blocks is a regression. A loss in only one block is
  inconclusive. The per-row criterion applies to every planned row; aggregate
  gains cannot hide a short early-exit loss.
- An iteration spread above 15% within a fork or a median spread above 10%
  between forks of the same image is inconclusive. The scalar control and
  benchmark-local opposite-byte-order get-loop control must be within 5% across images
  in each order block and within 10% for each image across a stage's endpoints.
  The latter loop calls only position/remaining/get; it does not call the changed
  IntBuffer.mismatch implementation or inherit its new ForceInline annotation.
- The first screening row, native equal 4 KiB, must show at least 5% lower
  candidate time in both blocks and pass the stability gates. Failure stops
  before subsequent rows; the row is not repeated in main.
- Missing or malformed results, unstable controls, failed correctness, budget
  exhaustion, and unmet benefit gates leave ARM unqualified. No samples are
  discarded and no timing is rerun. Stronger statistical or application claims
  would require a separately reviewed campaign.

All commands, sample arrays, per-row decisions, failures, source and image
identities, build logs and jtreg work/results are retained for 90 days in one
GitHub Actions artifact. `correctness-pass.json` and `performance-pass.json`
must both exist; a green subset is insufficient. A passing timing receipt records
only that this fixed observed matrix passed its deterministic screen. Tier/code
and raw evidence review is still needed for a native verdict. macOS performance and
other ARM microarchitectures remain outside this campaign.

## Local review checks

Run `python3 -m unittest discover -s diagnostics/pr39-aarch64 -p 'test_*.py'`
to check sampling, deadline admission/receipts, process cancellation, disk gates,
GC evidence, actual-tier parsing, regression/noise classification and jtreg ids.
These tests launch only owned Python subprocesses, no JVM or CI job. Local fixture validation is correctness-only;
native measurements require the explicit native runner checks.

`PR_DESCRIPTION.md` is a concise draft for a later description update. Its
required OpenJDK AI-policy declaration remains unchecked. The current PR
description and the author's measurement activity are preserved pending review.
