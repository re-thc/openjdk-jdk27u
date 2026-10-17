# Proposed focused native heap qualification

**No launch is authorized or has occurred for this source.** The previous run
approval is spent. The manual workflow is prepared for this exact source and
fixed profile; publishing it starts no workflow. It requires attempt 1, the
review branch and `reviewed_commit == github.sha`. Independent review and an
explicit new approval are required before dispatch.

## Sources and images

- Author concurrency guard: `9fedf7ac9040bf1d46e383201524f1ca7a13a29e`.
- Actual master/base: `89885a6288e7aaabd01678a704a586272c0f96e3`.
- Repair: `7f0bf03bd947a95c551da4fa0352257738e5f281`.
- Measurement candidate: `c47db0c467240bb016416672f91f8a24c8006cb4`, tree
  `5027a19d5b9d868a00fa37dabd04d104f3cbae07`.
- Ordered parents: master, then repair. Verified merge input
  `e206bae32b2a6cc1fa9464ad34d75f2df4b347e9` is not the measurement baseline.

The driver independently checks author/master refs and exact repaired source
and test trees, reconstructs that merge, then makes normal detached checkouts.
Three fresh matched native images are required: base release, candidate
release and candidate fastdebug. No binary handoff or historical image reuse.
Use the existing native Linux AArch64 runner, common pinned BootJDK 26+35,
JTReg 8.2.1+1, GCC/G++ 16, GNU ld and existing configure profile for Serial/G1/ZGC.
Record actual CPU, image, packages, compiler executables, source trees,
configure files, every image-file hash and the shared JMH 1.37 harness hashes.
Prior Neoverse-N2 identity is historical; the new host must identify itself.

## Fixed budget and correctness admission

At most **67 additional runner-minutes**: JTReg job 3 plus native job 64.
This would exhaust the unspent balance of 225−158; it is a proposal rather
than authorization to spend it. A shared **61-minute native-work deadline**
clamps managed commands and stage deadlines, reserving 3 minutes for upload,
scope and teardown. Builds have 34 minutes, focused correctness 11 minutes and
all timing 10 minutes including JVM startup, warmup, code printing and analysis.
Step caps cannot all be exhausted: the shared deadline stops admission first.
The last matched builds took 29m29s, but this source and focused test duration
remain unmeasured. Timeout leaves qualification incomplete; no retry follows.

Correctness must pass before any timing:

- Candidate fastdebug: the new 16-case public call-boundary gate; existing
  twelve store-ordering graphs; native/heap bounds and polling Ideal checks;
  bounded C1 admission checks. **No range case has an exception to the gate.**
- Candidate release with each of G1, Serial and ZGC: the new array semantics
  test and existing raw mismatch test. New semantics run interpreter, C1,
  C2 and intrinsic-disabled modes, with independent offsets, bounds,
  NaNs/signed zero and store/compare cases.
- Ten actual passing jtreg records are required; missing/skipped IDs fail.
  Retain each group's complete raw results before starting the next.
- 108 fresh-VM collector/tier probes and the shared fixtures on both releases.

Run 39045104945 remains separate evidence for the unchanged native kernel,
mapped faults, reachability, JVMTI and broader collector checks. This focused
campaign does not relabel those results as executions of the new Java source.

## Exact measurement and gates

[The complete matrix](heap-campaign.json) contains **42 fixed rows and four
control placements: 184 forks**. It preserves all 35 previous C2 screening cases,
then adds equal 255/256/257-byte array rows at the new suffix crossover and
four fixed byte-array rows: equal and difference 1 at 128 elements
under C1 and the interpreter. There is no main stage or automatic expansion.

The two leading controls run first, then the native equal 4 KiB row. Its original
stability and paired **at least 5% benefit** gate must pass before any later row.
Each row uses base/candidate then candidate/base, two fresh forks per image,
one pinned CPU/thread, G1 and the same 256 MiB heap. Warmup is fixed at three
250 ms iterations; measurement is fixed at three 250 ms iterations.

All original gates remain: loss over both 5% and 1 ns/op in both orders is a
regression; within-fork spread over 15% or between-fork image median spread
over 10% is inconclusive. Controls must stay within 5% across images and 10%
across endpoints. Every admitted row/control must pass. Missing GC evidence,
wrong installed tier, unstable controls, failed correctness or exhausted budget
leave ARM unqualified. No sample deletion, timing retry or relaxed gate.

Retain full commands, raw JMH JSON/GC metrics, compilation XML, installed code
and iteration windows, plus exact private-helper/prefix descriptors. Review
ordinary inlining and worker/helper activation against raw byte dumps before
attribution. Missing runtime-stub bytes prevent isolated NEON-cost claims.
Upload raw/incomplete evidence for 90 days and verify its digest after completion;
review cleanup and rounded job usage at the terminal result.

Passing this proposal would qualify only its fixed observed scope. The 97
previously unrun main rows, including broader buffer/hashCode/CharBuffer and
tier performance, remain unqualified. It does not authorize PR promotion,
application claims, another campaign or use of a replacement runner.
