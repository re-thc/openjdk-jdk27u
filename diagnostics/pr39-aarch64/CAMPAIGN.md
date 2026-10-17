# Executed native protocol for repair 93926e

This is the historical executed protocol. The current manual workflow now
prepares the separately unapproved [focused heap plan](HEAP-CAMPAIGN.md).

This exact bounded plan was independently reviewed and explicitly approved,
then launched **once** at `b394c38d0065ed5e2703cc26e6c217477699bb97` in
[run 39045104945](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39045104945).
Targeted correctness passed; the fixed screen failed with 25 regressions,
10 passes and zero inconclusive rows. Four controls passed; 97 main rows were
not admitted. [The final verdict](RESULTS-39045104945.md) records actual identities,
raw evidence and limits. The text below preserves the approved protocol,
including its fixed admission gates. It does not authorize a new launch.

Actual usage was **63 additional runner-minutes**, aggregate **158 of 225**;
**67 remain without launch authorization**. Builds took 29m29s, correctness
22m55s and actual timing 7m25s. Upload and cleanup completed. The actual host
matched the historical hardware/image/toolchain identified below; its run and
image receipts are retained independently. No retries or extra samples ran.

## Exact sources

| Role | Commit | Tree |
|---|---|---|
| Actual master / measurement base | `89885a6288e7aaabd01678a704a586272c0f96e3` | `d77a085e51da37106c582c017af6151e01e95f42` |
| Author concurrency guard | `9fedf7ac9040bf1d46e383201524f1ca7a13a29e` | `51bc65259f926214c1c71e2a8ee84634c052681b` |
| Repaired source | `93926eadc57265249c5cfeef35a4975a551e827a` | `f86086428d104b6ad7542c347cdda512530f8d0c` |
| Repaired measurement candidate | `a7ca575cbf71a0ad451b5986f3b50132489b8c0f` | `9587ce8f3a1076fea952b85fd27590ea002213c6` |

The candidate's ordered parents are **master `89885a6`, then repair `93926e`**.
Its three-way merge uses their verified common ancestor
`e206bae32b2a6cc1fa9464ad34d75f2df4b347e9`. This ancestor is a merge input,
not the measurement baseline. The source driver fetches the four pinned source
snapshots and uses `git merge-tree --write-tree --merge-base=<ancestor>`.
It rejects a conflict or any tree other than `9587ce8f…`, then reconstructs the
identified commit with the fixed message/date and approved noreply identity in
`campaign.py` / `prepare.repaired_merge`. This local reconstruction makes no
new remote ref necessary and works with shallow snapshots. It creates normal
detached worktrees for the base and repaired candidate; no binaries are reused.

Before either worktree, the driver checks **both remote author and master
branch tips**, independently of the repair pin. Review-branch `src` and `test`
trees must equal `93926e`. The qualification commit/tree, all source commits,
source trees, candidate parents, changed-file list and production patch are
retained. Drift stops the campaign for a new source review; there is no automatic
rebase or replacement pin. The author's branch and PR description remain intact.

## Native images and build identity

Use the repository's existing native Linux `ubuntu-26.04-arm` runner and normal
BootJDK/JTReg actions. Build **base release, repaired candidate release and
repaired candidate fastdebug** on that one machine with GCC/G++ 16, system GNU
ld and `bin/configure-dev`, `CONFIGURE_DEV_NO_MOLD=1`, the same system zlib,
`--with-source-date=2026-10-17T00:00:00Z`, version build 1 and `pr39-qual`.
Only Serial, G1 and ZGC are supported by this profile.

The source-pinned common BootJDK is OpenJDK **26+35 Linux AArch64**, archive
SHA-256 `403ccf451e88d0be9e1dec129fcb9318de9752121e0eb92dfa9a8cf06f249007`.
JTReg is **8.2.1+1**. The normal actions verify/cache those configured inputs.
Preflight retains compiler/linker versions, all package versions, CPU identity
and `/proc/cpuinfo`, OS release, GitHub ImageOS/ImageVersion and runner/run IDs.
Build receipts additionally hash the actual GCC/G++/ld executables, BootJDK
java/release/libjvm and JTReg JAR. Each completed output image gets **every file
hashed**, its exact configure/spec/profile check, and Java version retained.
Both measured releases use one identically compiled, hashed JMH harness.

The prior host was four Neoverse-N2 r0p0 cores, Ubuntu 26.04.1 image
`ubuntu26-arm64/20261012.150.1`, GCC 16.0.1 Ubuntu package
`16-20260322-1ubuntu1` (trunk r16-8246-g569ace1fa50), GNU ld 2.46.
These were historical planning identities; the completed run independently
recorded the same CPU, image and toolchain. Its actual runner was
`GitHub Actions 1000017639`. Each measurement fork
is pinned to the same allowed CPU on that host. Native ARM correctness and
performance cannot be inferred from the local x86 policy checks.

## Hard budget and feasibility

| Limit | Minutes |
|---|---:|
| JTReg preparation job, including setup/post | 5 |
| Native job, including setup/post | 125 |
| **Maximum runner usage** | **130** |

The native steps sum to **119**, leaving **6 minutes reserve**:

| Native work | Step cap | Driver cap |
|---|---:|---:|
| Paths / checkout / driver checks / BootJDK / JTReg / packages / source checks | 14 total (`1+2+1+3+1+4+2`) | Individual command caps |
| All three matched builds, configure, hashing and pruning | 35 | 34 shared |
| Common fixture and JMH compilation/checks | 3 | Individual command caps |
| All correctness groups, cold probes and archiving | 30 | 28 shared |
| All admitted timing, startup, warmup, captures and analysis | 30 | 29 shared |
| Raw evidence upload, even after failure | 6 | Action/step cap |
| Final scope receipt | 1 | Step cap |

Historical actual stages were JTReg 40s, native preparation 1m15s, all three
fresh builds 30m38s, fixture checks 2s, correctness 21m54s, 152 screening forks
6m35s and upload 6s. At review, the approved build step had 4m22s margin; its
shared driver had 3m22s. Correctness's driver had 6m06s before the added repair
tests. The JTReg cache-miss build, new ARM test durations and additional code
printing were unmeasured at approval; actual completion is reported above.
The full 560-fork matrix remains unmeasured. Scaling the old screen and
adding the fixed third warmup suggests roughly 26m35s timing, leaving about
2m25s inside the driver cap; that estimate is **not evidence of completion**.

Any timeout, preparation failure, disk admission failure or failed gate stops
new work and leaves qualification incomplete. There is no retry, replacement
host, sample expansion or weaker fallback protocol. Process groups receive
bounded TERM/KILL cleanup. Archiving and pass-receipt publication share the
same deadlines; late work cannot publish a pass. Upload retains failed or
incomplete test work. Job caps bound usage even when an individual stage or
cleanup cannot finish; an exhausted job can prevent a complete upload, which
must itself be reported as incomplete evidence.

## Correctness before any timing

Compile the common harness once with JMH 1.37 and checksum-pinned dependencies,
then run the same fixture classes on both release images. Candidate fastdebug
must pass the existing native/heap chunk bounds, interpreter entries and
profiling, C2/Serial IR/Ideal, short-native, empty-range and IGVN tests, plus
all three `AArch64VectorizedMismatchDispatchTest` IDs (`ir`, `ideal`,
`store-ordering`) and the 17-case C1 bounded-admission test. New graph checks
cover all four element scales, both mixed orders, raw-prefix ordering against
same-method preceding/following stores, full native 4 KiB leaves, heap-only
2 KiB fallback arguments and a polling Java callee. Named raw Ideal captures
are retained before verdict verification.

Release/G1 runs native/mixed/mapped-fault, threshold, scope/closure, signed-int
length and large polling, NIO/typed-view boundaries, direct-owner reachability,
hashCode, CharBuffer and JDI event tests. Serial and ZGC repeat the existing
six native/mapped/polling/buffer/reachability safety tests. Expected actual jtreg
records are 14 fastdebug, 12 G1, 6 Serial and 6 ZGC; required test IDs and passed
records, rather than file existence or a skipped result, determine admission.
The fixed 108 fresh-VM probes cover public arrays/segments/buffers/int views,
three collectors, interpreter/C1/C2 and 128 B / 64 KiB / above-chunk lengths.
Cold probes establish correctness, not startup performance. A correctness pass
receipt is mandatory before measurement starts.

## Fixed timing and gates

The unchanged matrix contains **132 unique cases: 35 screen + 97 main**.
There are **eight control placements and 560 total forks**. The existing native
equal **4096-byte** row is screen row zero and is removed from main, never
repeated. Two leading controls consume eight forks, then its paired comparison
consumes four. If its original stability rules or **at least 5% candidate
benefit in both balanced orders** fail, stop after these **12 forks**. No other
screening or main row is admitted.

Remaining screen rows cover every byte position 1–7 for short heap arrays,
all primitive second-element differences, equal short/large inputs and observed
heap/native/mixed prefix losses at 10/25/82/1267 bytes. Main covers heap,
native, both mixed orders, direct/mapped storage, ByteBuffer
mismatch/equals/compare, typed views and byte order, early/mid/late/equal
positions, alignment, boundaries, 1 MiB polling, hashCode, CharBuffer and fixed
interpreter/C1 rows. It runs only if the full screen and its controls pass.
`campaign.py plan` emits the complete ordered matrix before measurement.

Each case has **A/B then B/A**, two fresh forks per image, one thread, G1,
256 MiB heap, three fixed 250ms warmups and three fixed 250ms measured iterations.
C2 uses `-Xbatch -XX:-TieredCompilation -XX:CompileThreshold=1000`; C1 stops at
level 1; interpreter uses `-Xint`. No timing retry or sample removal is allowed.

- Candidate loss **over both 5% and 1 ns/op in both orders** is regression;
  a loss in one order is inconclusive.
- Within-fork iteration spread **over 15%**, or between-fork image median
  spread **over 10%**, is inconclusive.
- Both unchanged controls must stay within **5% across images** in each order,
  and each image within **10% across stage endpoints**.
- Missing/malformed samples, missing GC evidence, wrong installed tier,
  unstable controls, unmet benefit or budget exhaustion leave ARM unqualified.
  Screen/main gates require every admitted row/control to pass.

## Instruction evidence and verdict limits

Every fork retains the full command, raw JMH JSON, GC metrics, compilation XML,
console and code print output. Existing final benchmark/worker print targets
are augmented with **exact descriptors found in retained native C2 records**:
all eight `Arrays.mismatch` range overloads and their ArraysSupport overloads,
`ArraysSupport.vectorizedMismatch`, `AbstractMemorySegmentImpl.mismatch`,
`SegmentBulkOperations.mismatch` and both scoped large-byte helpers. See
[instruction-targets-39033175975.json](instruction-targets-39033175975.json) for
source logs and hashes; only targets relevant to each array kind or memory
benchmark are requested. No compile/inline policy is forced by printing.

Per-fork receipts list relevant callee nmethods and all observed compilation
and invalidation lines, including unrelated compilations, against console
warmup/measurement brackets. They preserve events occurring in measured
windows; printing is not a remedy for activation during measurement. Review
those brackets with XML installation stamps, worker/helper invalidations and
raw instruction bytes before assigning a tier or instruction cost. The
historical run retained **no timed ARM machine-code bytes**; new requests do
not retroactively supply them. There is no stub-isolation experiment in this
budget. Missing helper/stub bytes or changed inlining constrain conclusions to
**end-to-end call-path recovery**, without isolated stub attribution.

A passing receipt means this fixed observed matrix met its deterministic gates,
not statistical confidence, an optimal threshold, an application speedup, an
x86 speedup or qualification of other ARM machines/macOS. Raw evidence review
is required for the final native verdict. Failures remain reviewable and block
merge; they do not authorize another run.

## Launch boundary

The approved launch used only `.github/workflows/pr39-aarch64-qualification.yml`
at exact commit `b394c38d0065ed5e2703cc26e6c217477699bb97`. No further launch is
authorized by this protocol or the unused balance. The workflow is manual-only,
first-attempt-only, exact review branch and `reviewed_commit == github.sha`; source guards run again.
The workflow requires no default-branch edits to publish the source. If GitHub
does not expose branch-only dispatch or permission is absent, report that
specific blocker. Do not add automatic triggers, move it to master, launch
ordinary tier1, rerun a job or substitute another campaign. The executed
qualification commit changes only tooling and documentation beyond repaired
source `93926e`. The final report also leaves its production
and test trees unchanged.
