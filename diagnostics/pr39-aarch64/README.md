# PR39 native AArch64 qualification

Status: one approved native campaign ran at `9fc46a1776b82bbe74193bba629ab4ec8c13a739`
and stopped during harness compilation, before correctness or measurement.
The processor-path repair is prepared for review; no repeat dispatch has occurred.
Production code is unchanged from PR39 head `9fedf7ac9040bf1d46e383201524f1ca7a13a29e`.
There is no native ARM performance verdict yet.

## Native campaign result

[Run 39030274620](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39030274620),
attempt 1, was explicitly dispatched at 2026-10-17 11:51:19 UTC after source
review. Base release, candidate release and candidate fastdebug all built and
passed the development-profile smoke checks for Serial, G1 and ZGC. The run
then failed in `compile-fixtures.log` with
`Annotation processor 'org.openjdk.jmh.generators.BenchmarkProcessor' not found`.
The pinned JMH JAR hashes were correct, but javac did not expand the wildcard
used as its processor path. The repaired source supplies each pinned JAR explicitly
to both the compiler classpath and processor path. Real local JMH 1.37 annotation
processing now generates all 14 benchmark entries and the fixtures pass using
dependencies with exactly the native run's hashes. This is source/fixture
validation, not a local timing run or an ARM qualification result.

The targeted correctness campaign and every performance row were skipped.
No nmethod/tier, GC comparison, control stability or performance attribution can
be inferred from this attempt. The native builds and profile smoke checks alone
do not qualify the mismatch implementation. No production code was changed.

| Collected identity | Observed value |
|---|---|
| CPU | 4 native AArch64 Neoverse-N2 r0p0 CPUs; ASIMD and SVE/SVE2 reported |
| Runner image | `ubuntu-26.04-arm`, `20261012.150.1` |
| Compiler | GCC `16.0.1 20260322`, Ubuntu `16-20260322-1ubuntu1`, experimental trunk `r16-8246-g569ace1fa50` |
| Linker | GNU ld 2.46 |
| Disk admission | 105.061 GiB free; 10.789 GiB required; observed filesystem 144.26 GiB |
| Build outputs before/after pruning | Base 1,191,165,503 / 452,288,583 B; candidate release 1,551,665,127 / 1,265,060,852 B; fastdebug 2,849,543,225 / 2,466,429,755 B |

Source, exact image-file hashes, compiler/configuration logs, CPU information,
disk receipts and the harness error are retained in
[artifact 12101125600](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39030274620/artifacts/12101125600)
(141,392 bytes; SHA256
`882a880592b69f2dacd39867a5b956b361819e24f16ed30194222f5de8f0c372`).
The downloaded artifact matches that digest. Both jobs completed cleanup.
The two jobs consumed about 32.45 runner-minutes, conservatively charged as 33;
actual measurement time was zero. The one approved attempt has ended. The
repaired workflow proposes at most 190 additional runner-minutes, giving an
aggregate maximum of 223 within the original 225-minute reservation. Further
execution needs independent review of this source and continuation proposal;
this fix does not authorize another dispatch or an automatic timing retry.

## Sources and existing evidence

The PR head and conversation were checked before editing and again before
committing. During preparation the author advanced the head from `d4757b0fc`
to `9fedf7ac9040bf1d46e383201524f1ca7a13a29e`, caching segment bases and
addresses before prechecks to reduce C1 virtual calls. The qualification source
incorporates that commit. The conversation had no comments, and the description
still reported author measurements in progress. The author branch and description
have not been modified.

[CI run 39013245609](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39013245609)
completed successfully on `d4757b0fc`: 57/57 jobs, including native Linux AArch64 and macOS ARM64
release/fastdebug builds and tier1. This is correctness evidence, not performance
qualification. The author's newer [run 39027042938](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39027042938)
is associated with `9fedf7ac9`; its result must be checked before merge. Ordinary
tier1 will not be repeated by this workflow.

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

This campaign uses a matched pair with the master updates present in both:

| Role | Commit | Tree |
|---|---|---|
| Base | `89885a6288e7aaabd01678a704a586272c0f96e3` | `d77a085e51da37106c582c017af6151e01e95f42` |
| Candidate | `d234724f75df8ec94427ba168533a5fc89fae714` | `b4693729ab5276f398ab6068b2377472284df285` |

The candidate is the identified PR merge tree. Its exact ordered parents are:

1. `89885a6288e7aaabd01678a704a586272c0f96e3` (current master ref).
2. `9fedf7ac9040bf1d46e383201524f1ca7a13a29e` (current author head).

Its tree is `b4693729ab5276f398ab6068b2377472284df285`, verified with both Git
and GitHub's Git-commit API. It is deliberately distinguished from the branch head.
The workflow fetches these commits and makes normal detached source checkouts;
it does not import previously built binaries. Existing ARM artifacts were listed
and are unexpired, but no binary handoff is needed. A read of the ARM build log
was denied by its artifact host; that read was not retried.

Before building, the driver verifies both remote branch tips, the merge parents,
the candidate tree, and that the qualification branch has no production edits.
A changed tip stops the campaign for a fresh source review. There is no rebase,
force push, or modification of concurrent author work.

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

After independent source review and explicit launch authorization, the launch
action is a single dispatch of the exact reviewed commit:

```sh
gh workflow run pr39-aarch64-qualification.yml \
  --repo re-thc/openjdk-jdk27u \
  --ref codex/pr39-aarch64-qualification \
  -f reviewed_commit=<exact-reviewed-commit-sha>
```

This command is documentation, not an action taken during publication. Both
jobs require the dispatch event, the exact review branch, a `reviewed_commit`
input matching `github.sha`, and attempt 1. A changed branch tip or a rerun
cannot execute the approved campaign. Source pins are checked again by the driver.
Dispatch access and GitHub's availability of this branch-only workflow are not
assumed. If GitHub does not expose this dispatch, report that launch blocker;
do not launch a generic sanity workflow, install this on master, add a push
trigger, or start an alternative campaign automatically.

The original reservation is **225 runner-minutes**. The completed attempt is
charged 33; the unlaunched continuation proposal reserves at most **190**:
JTReg preparation 10 minutes plus one native job 180 minutes, including
dependency preparation, matched builds, correctness, measurement and retention.
The aggregate maximum is 223, leaving two minutes within the original reservation.
This budget proposal requires independent review; no continuation has been started.
The proposed native step caps sum to **174 minutes**, leaving six minutes
for runner setup and post steps within the 180-minute job cap:

| Work | Step caps, minutes |
|---|---:|
| Paths, checkout, driver tests, BootJDK, JTReg, packages, source checks | 22 |
| Three matched builds | 55 |
| Common fixtures and JMH compilation | 6 |
| Correctness, including archiving | 52 |
| Fixed timing screen | 30 |
| Evidence upload, including incomplete raw jtreg work | 8 |
| Final scope receipt | 1 |

Correctness has a **50 minute driver limit**, leaving two minutes for bounded
cancellation handling within its 52-minute step cap. Commands are not admitted
after expiry, and an expired result verification, archive, final probe or pass
receipt serialization cannot publish a passing marker. Measurement, including JVM startup and warmup, has
a **29 minute driver limit and 30 minute step cap**. An exhausted cap leaves the
campaign incomplete. There is one campaign and no automatic timing retry,
replacement host, or additional samples. No other CI is launched by this package.

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

The planning specification was 4 CPUs, 16 GiB RAM and a nominal 14 GB SSD.
The observed run had the larger filesystem recorded above; future available
storage is still checked rather than inferred from a nominal specification.
Source preflight records total/free bytes and requires space for two measured
source checkouts, a **5 GiB active build allowance**, **2 GiB retained-output
allowance**, a **512 MiB ccache cap**, and **2 GiB safety reserve** before making
the two worktrees. It checks actual free space again before each build and polls
the 2 GiB low-water mark during configure/make, terminating the owned group if
the reserve is breached. Capacity failure stops the campaign with a disk receipt;
it never counts as a timing result or triggers a different runner automatically.

Two preexisting local x86 build directories occupied 3832 MiB and 6328 MiB,
including large native object directories. These are sizing observations, not
native ARM footprint measurements or a guarantee of fit. All three native builds
use `--with-native-debug-symbols=none`; fastdebug assertions and IR facilities
remain enabled. After identity/spec/config/image evidence is retained, the base
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

`campaign.py plan` emits the entire matrix before measurements: **34 screening
rows and 98 main rows**, plus eight predeclared control placements. There are
**560 JMH forks** in total. The main rows are fixed in advance and run only after
the screen and its controls pass; screening never adds rows or samples.

The screen measures byte-array differences at each of positions 1–7 for 8- and
128-element ranges, second-element differences for every other primitive kind,
and equal short/large byte ranges. Additional screen rows request 64 KiB or
128 KiB with differences at 1, 7, 10, 25, 82 and 1267 bytes, including native
and both mixed segment orders. It specifically tests the new ARM heap stub
call cost after the caller's first-element check. Arrays are not an unchanged
control on ARM. No first-word C2 prefilter has been added without current native
evidence or an end-to-end workload supporting it.

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

The PR already checks the first byte and first word in segment mismatch. Its
native C2 intrinsic also has a guarded first-word precheck. Those paths already
avoid the stub on a first-word difference. Heap `ArraysSupport` C2 calls on ARM
still call the stub after the public caller's first-element check, without the
native path's first-word C2 precheck. The scope for avoiding setup is therefore
specific to the caller and tier. Accepted native matches with median length 10
do not by themselves prove that an additional first-8-byte check helps Java;
rejected candidates and seed-relative extension positions remain unmeasured.

The leaf itself allocates no objects and makes no GC transition. Chunk loops,
session checks, reachability fences and surrounding caller allocation can still
affect compilation, polling and GC behavior. Source inspection therefore supports
a setup/code-generation hypothesis, but cannot distinguish it conclusively from
caller or GC costs. Every planned JMH fork retains GC allocation/count/time
metrics alongside compilation/intrinsic logs, using the same profiler on both
images and without adding samples. CharBuffer staging is expected to allocate;
unexpected allocation or GC activity in mismatch rows needs investigation when
interpreting their result. Raw GC evidence must accompany any causal claim.

A possible heap C2 precheck would need ordinary nodes, a valid element scale
and at least one readable word, with loads below the existing array/range/null
guards and unchanged exception order. Empty/negative ranges and raw intrinsic
callers must remain valid. There is no new assembly or implementation change in
this package: current native and end-to-end evidence is insufficient to choose
that fix. The fixed large-request early-exit screen is the next decision gate.

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
two 250 ms warmups and three 250 ms measured iterations. C2 uses `-Xbatch`, no
tiering, and threshold 1000; C1 stops at level 1; interpreter rows use `-Xint`.
JMH 1.37 and its fixed dependencies are checksum verified; the shared source,
generated classes and dependencies are hashed. Compilation/intrinsic logs,
LogCompilation XML, raw JMH JSON and GC profiler metrics are retained for every
row. Each fork must have finite nonnegative `gc.alloc.rate` evidence and valid
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
- The native equal 4 KiB segment row must also show at least 5% lower candidate
  time in both blocks to demonstrate the intended native scan benefit.
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
