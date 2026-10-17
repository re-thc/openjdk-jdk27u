# PR39 native AArch64 qualification

The Java array caller split at `7f0bf03bd947` remains blocked by the public
range call boundary. [The exact review](INLINE-REVIEW.md) records 1008–1400-byte
public methods rejected by the unchanged 1000-byte cutoff. A compact experiment
still fails three ranges and is not applied. The strengthened Store gate also
fails all eight local cases; C2 installation alone did not prove inline loads.
The [67-minute matrix](HEAP-CAMPAIGN.md) remains a blocked proposal. No new
workflow, JDK/HotSpot build, native run or timing has launched. The executed
results below belong to `93926` and remain unchanged.

**The repaired source passes targeted native correctness and fails the fixed
performance screen. PR39 remains draft and is not ready to merge.**

[Native run 39045104945](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39045104945)
measured repair `93926e` merged against actual master `89885a6`, at reviewed
qualification commit `b394c38`. All **38 jtreg records** and **108 fresh-VM
probes** passed across the selected Serial, G1, ZGC and interpreter/C1/C2 paths.
The first 4 KiB native equality gate passed at **54–55% lower time**, but the
full screen found **25 regressions, 10 passes and no inconclusive rows**, with
all four controls passing. The 97 main rows were not admitted. No timing retry,
extra sample or relaxed gate was used.

The remaining blocker is stable C2 heap overhead: short array callers now
outline public `Arrays.mismatch` where the baseline inlines Java, even when
the repaired callee returns from its short Java fallback or scalar prefix.
Larger heap prefixes 25/82 also regress, with both images calling helpers at
different levels. Native/mixed prefix losses and equal 64 KiB heap now pass.
Actual timed C2 bytes and compilation/GC evidence constrain these conclusions;
the runtime NEON body was not printed, so isolated stub costs are unqualified.

- [Current verdict, exact sources, complete screen and limits](RESULTS-39045104945.md).
- [Every raw sample, gates, correctness records and worker activation](results-39045104945.json).
- [Per-fork code paths, instruction witnesses and causal limits](causal-audit-39045104945.json).
- [Retained evidence file hashes](evidence-sha256-39045104945.json).
- [Raw artifact 12106254479](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39045104945/artifacts/12106254479), verified SHA-256 and retained through 2027-01-15.
- [Repair policy, regression tests and wrong-result provenance](REPAIR.md).
- [The exact bounded protocol used](CAMPAIGN.md).
- [Proposed PR description](PR_DESCRIPTION.md); the author's PR body is untouched.

## Source and baseline identity

The author concurrency guard is `9fedf7ac9040bf1d46e383201524f1ca7a13a29e`;
actual master/base is `89885a6288e7aaabd01678a704a586272c0f96e3`.
The repaired measurement candidate is
`a7ca575cbf71a0ad451b5986f3b50132489b8c0f`, tree
`9587ce8f3a1076fea952b85fd27590ea002213c6`, with ordered parents master then
repair `93926eadc57265249c5cfeef35a4975a551e827a`. The workflow verified source
and test trees independently of the author/master guards. Normal detached
checkouts supplied three fresh matched native builds on Neoverse-N2.

Historical baseline `e206bae32b2a6cc1fa9464ad34d75f2df4b347e9` is the common
ancestor used to reconstruct the merge. It predates relevant master changes,
so it can describe the author's historical x86 experiment but cannot isolate
the incremental current-master ARM result. The PR API's `.base.sha=de359971a19`
is older than the actual master ref. Master `89885a6` immediately follows it
and changes only Zen3+ spilling; that source was present in both images.
No x86 speed claim follows from this qualification.

[Author CI 39027042938](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39027042938)
passed 57/57 jobs at `9fedf7a`, including native Linux/macOS ARM64 builds and
tier1. It predates our repair. This targeted campaign did not repeat tier1.

## Completed scope and retained history

The approved campaign launched once at `b394c38`, attempt 1. Upload, all post
steps and runner orphan-process cleanup completed. The author branch, master
and PR draft state remain unchanged. Only the review branch gains this report;
no production or test source changed after measurement.

Rounded usage is **33 + 62 + 63 = 158 of 225 runner-minutes**. The repaired
campaign stayed below its additional 130-minute cap and used 7m25s of actual
timing. The **67-minute balance does not authorize another launch**. Further
heap implementation work and separately reviewed native qualification are
required before merge.

The original [run 39033175975](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39033175975)
measured the author-based merge, before our repair. Its unchanged [verdict](RESULTS.md),
[raw observations](results-39033175975.json) and [causal audit](causal-audit-39033175975.json)
retain 34 jtreg passes, 108 cold probes and the original 21 regression /
8 inconclusive / 5 pass screen. The older 2-warmup worker activation limitation
is preserved; the repaired campaign fixed three warmups without adding measured
samples. The prior preparation run 39030274620 stopped before correctness or
timing at annotation-processor discovery. Neither historical result is relabelled.
