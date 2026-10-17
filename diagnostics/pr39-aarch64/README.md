# PR39 native AArch64 qualification

Status: source package prepared for review; no native campaign has been launched.
Production code is unchanged from PR39 head `9fedf7ac9040bf1d46e383201524f1ca7a13a29e`.
There is no native ARM performance verdict yet.

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
PR head and its advertised base `de359971a1972f74866e963fb4f750359aecc145`.
It predates master changes to the interpreter, class loading, ARM C2, and startup.
It can describe the author's historical x86 experiment, but does not isolate
the incremental merge result on current master. Those x86 results remain the
author's separate work.

This campaign uses a matched pair with the master updates present in both:

| Role | Commit | Tree |
|---|---|---|
| Base | `89885a6288e7aaabd01678a704a586272c0f96e3` | `d77a085e51da37106c582c017af6151e01e95f42` |
| Candidate | `d234724f75df8ec94427ba168533a5fc89fae714` | `b4693729ab5276f398ab6068b2377472284df285` |

The candidate is the identified PR merge tree, with parents base `89885a6288e`
and PR head `9fedf7ac9`. It is deliberately distinguished from the branch head.
The workflow fetches these commits and makes normal detached source checkouts;
it does not import previously built binaries. Existing ARM artifacts were listed
and are unexpired, but no binary handoff is needed. A read of the ARM build log
was denied by its artifact host; that read was not retried.

Before building, the driver verifies both remote branch tips, the merge parents,
the candidate tree, and that the qualification branch has no production edits.
A changed tip stops the campaign for a fresh source review. There is no rebase,
force push, or modification of concurrent author work.

## Launch and budget

The existing native workflow `pr18-arm-validation.yml` establishes the supported
runner, `ubuntu-26.04-arm`. This package uses it with the repository's normal
BootJDK and JTReg actions and native `bin/configure-dev` profile. GCC/G++ 16 and
the system GNU linker build both releases and candidate fastdebug on the same
machine. `CONFIGURE_DEV_NO_MOLD=1` selects the profile's supported GNU-linker
option for all three builds. The source timestamp and version options are fixed
across the builds. Source, configure options, compiler/package versions,
image file hashes, CPU implementer/part information, OS, runner image version,
and process affinity are retained. Only Serial, G1, and ZGC are in the profile.

After independent review, publishing this branch **including the new workflow
file** normally starts the campaign: its only trigger is a push to
`codex/pr39-aarch64-qualification` changing that workflow. No dispatch permission
or main-branch workflow installation is assumed. This branch push does not match
the ordinary sanity workflow's master-only push trigger. Publishing and launching
are deferred; this package has not been pushed. The workflow refuses rerun attempts.

The complete reservation is at most **225 runner-minutes**: JTReg preparation
15 minutes plus one native job 210 minutes, including dependency preparation,
two release builds, candidate fastdebug, correctness, measurement and retention.
The matched builds have a 100 minute step cap. Correctness has a 60 minute driver
limit and 62 minute step cap. Measurement, including JVM startup and warmup, has
a **29 minute driver limit and 30 minute step cap**. An exhausted cap leaves the
campaign incomplete. There is one campaign and no automatic timing retry,
replacement host, or additional samples. No other CI is launched by this package.

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

Main rows cover heap/native/mixed in both orders, ordinary direct and mapped
segments, ByteBuffer mismatch/equals/compareTo, char/int/long views, equal and
first/first-word/middle/last differences, alignment and 8, 63/64/65,
127/128/129, 65535/65536/65537 and 1 MiB boundaries. Representative C1 and
interpreter rows check their separate performance paths. HashCode rows cover
3/4/1024 elements. CharBuffer put/append rows cover both string coders,
native/swapped order, heap/direct views, both staging thresholds and 1025 chars.
These are microbenchmarks; they do not establish an application speedup.

Each row has two matched blocks in **A/B then B/A** order: one fresh JMH fork
per image per block, one thread pinned to the same allowed CPU, G1, 256 MiB heap,
two 250 ms warmups and three 250 ms measured iterations. C2 uses `-Xbatch`, no
tiering, and threshold 1000; C1 stops at level 1; interpreter rows use `-Xint`.
JMH 1.37 and its fixed dependencies are checksum verified; the shared source,
generated classes and dependencies are hashed. Compilation/intrinsic logs and
raw JMH JSON are retained. CharBuffer rows also retain GC allocation metrics.

Gates are decided before sampling:

- A material loss is candidate time exceeding base by **both 5% and 1 ns/op**.
  A loss in both order blocks is a regression. A loss in only one block is
  inconclusive. The per-row criterion applies to every planned row; aggregate
  gains cannot hide a short early-exit loss.
- An iteration spread above 15% within a fork or a median spread above 10%
  between forks of the same image is inconclusive. The scalar control and
  opposite-byte-order element-loop control must be within 5% across images
  in each order block and within 10% for each image across a stage's endpoints.
- The native equal 4 KiB segment row must also show at least 5% lower candidate
  time in both blocks to demonstrate the intended native scan benefit.
- Missing or malformed results, unstable controls, failed correctness, budget
  exhaustion, and unmet benefit gates leave ARM unqualified. No samples are
  discarded and no timing is rerun. Stronger statistical or application claims
  would require a separately reviewed campaign.

All commands, sample arrays, per-row decisions, failures, source and image
identities, build logs and jtreg work/results are retained for 90 days in one
GitHub Actions artifact. `correctness-pass.json` and `performance-pass.json`
must both exist; a green subset is insufficient. A passing campaign qualifies
only the recorded Linux ARM CPU and fixed workload set. macOS performance and
other ARM microarchitectures remain outside this campaign.

## Local review checks

Run `python3 diagnostics/pr39-aarch64/test_campaign.py` to check sampling,
regression/noise classification, missing-result rejection and required jtreg ids.
It launches no JVM or CI job. Local fixture validation is correctness-only;
native measurements require the explicit native runner checks.

`PR_DESCRIPTION.md` is a concise draft for a later description update. Its
required OpenJDK AI-policy declaration remains unchecked. The current PR
description and the author's measurement activity are preserved pending review.
