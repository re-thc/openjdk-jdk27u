# Native AArch64 verdict for PR39

**The measured pre-repair candidate passed correctness and failed the performance
screen.** The [source repair](REPAIR.md) is separate and has not been qualified
on native ARM.

[Run 39033175975](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39033175975)
was the single approved preparation-repair continuation at qualification commit
`678938fb5e6dba44a4d7089b026effdfa266ec13`, attempt 1. It completed on
2026-10-17 at 13:37:44 UTC. The author head remained
`9fedf7ac9040bf1d46e383201524f1ca7a13a29e`; its
[ordinary CI run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39027042938)
also passed 57/57 jobs. Ordinary tier1 was not repeated by this campaign.

## Source and machine identity

The matched baseline was actual master `89885a6288e7aaabd01678a704a586272c0f96e3`.
The candidate was synthetic merge `d234724f75df8ec94427ba168533a5fc89fae714`,
with ordered parents baseline then author head, and tree
`b4693729ab5276f398ab6068b2377472284df285`. The historical `e206bae32` x86
measurement baseline was not used for this incremental ARM comparison.

All three images were built together on four native Neoverse-N2 r0p0 CPUs,
Ubuntu 26.04.1 LTS, image `ubuntu26-arm64` version `20261012.150.1`, using
GCC `16.0.1 20260322` (Ubuntu `16-20260322-1ubuntu1`, experimental trunk
`r16-8246-g569ace1fa50`) and GNU ld 2.46. Measurements inherited affinity to
CPU 0 and used G1 with a fixed 256 MiB heap. This is evidence for this native
machine and image, without an emulation or universal ARM performance claim.
Exact image-file hashes and configuration logs are retained.

## Correctness

All required jtreg records passed: fastdebug compiler/interpreter 10, release
G1 12, Serial 6 and ZGC 6. Required IR/Ideal, interpreter and mapped-fault test
ids actually executed. The gates include bounds and exception ordering, low
thresholds, large scans and polling, scope closure, direct-owner reachability,
JVMTI events, buffer hashCode and CharBuffer string-copy behavior. All 108
fresh-VM first-public-call probes passed across the three collectors and
interpreter/C1/C2 settings. These probes make no cold-start timing claim.

Common JMH annotation processing and fixtures passed on both release images.
Correctness and its result archiving took 1,313.90 seconds. No production fix
was needed to complete these correctness gates.

## Fixed screen

The screen completed all 34 planned rows and its four control placements,
using 152 forks in 395 seconds. The predefined gates classified **21 rows as
regressions, 8 as inconclusive and 5 as passing**. All four controls passed:
cross-image median differences were at most 1.115%, and the largest control
endpoint median range was 1.173%.

The following percentages are candidate/base paired medians, with both
base/candidate and candidate/base execution orders retained. They describe the
fixed deterministic screen, without a statistical confidence claim.

| Comparison | Candidate time change | Fixed result |
|---|---:|---|
| Heap byte array, 8 B, mismatch at positions 1–7 | +21.1% to +23.4% | Regression in all 7 rows |
| Heap byte array, 128 B, mismatch at positions 1–7 | +43.6% to +46.9% | Regression in all 7 rows |
| Heap byte array, 64 KiB, mismatch at positions 1/7/10 | +32.9% to +45.9% | Regression in all 3 rows |
| Heap byte array, equal 128 B | −27.6% / −27.3% | Pass |
| Heap byte array, equal 64 KiB | +7.90% / +7.50% | Regression |
| Native segment, 64 KiB request, matching prefix 10 B | +37.0% / +38.2% | Regression |
| Native segment, 128 KiB request, matching prefix 25 B | +28.6% / +30.3% | Regression |
| Heap/native segment, 128 KiB request, matching prefix 82 B | +18.7% / +17.8% | Regression |
| Native/heap segment, 128 KiB request, matching prefix 1,267 B | −19.1% / −16.5% | Pass |

The seven other primitive array rows and equal 8 B row remain inconclusive
under the original variability gates. No sample was discarded, no gate was
changed, and no timing retry or sample expansion occurred. The failed screen
prevented admission of all 98 main rows. C1/interpreter timing, ByteBuffer and
typed-view timing, hashCode/CharBuffer timing, and the required native equal
4 KiB benefit gate therefore remain unmeasured by this run.

## Compilation, GC and attribution limits

All 152 fork logs contain installed C2 code for the benchmark method. Every
JMH measurement worker recompiled during measurement iteration 1 after earlier
warmup `unstable_if` traps. Its final C2 version was installed before iteration
2, with no later target invalidation or deoptimization recorded. All three
original samples remain in the gate calculation. The first-iteration transition
is a warmup limitation; this was not a fully steady-code three-iteration trial.
The retained iterations 2 and 3 also show the listed early-exit and equal
64 KiB losses. That diagnostic observation does not replace the original gate
or reclassify the inconclusive rows.

All measured forks report zero collections and valid allocation-rate evidence.
For heap early exits, the baseline measurement worker inlined the Java
word-load loop and the candidate inlined the vectorized mismatch intrinsic.
For equal 128 B/64 KiB and the three longer-prefix heap rows, the baseline
worker instead called a separately compiled `Arrays.mismatch` containing the
Java word loop; the candidate still inlined through the intrinsic. Caller
inlining and code layout therefore also confound those comparisons. Together
with source inspection, this supports investigating ARM stub-entry and scan costs;
it does not isolate one instruction or prove application impact. The native
measurement worker called the already compiled segment mismatch helper, so
caller/inlining effects remain part of those observed losses. A first-word heap
prefilter alone cannot account for the native prefixes or equal 64 KiB result.

## Retention and remaining blocker

The [raw evidence artifact](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39033175975/artifacts/12102159804)
contains source identities and production diff, complete build/configuration
logs and image hashes, raw jtreg archives, fresh-VM logs, JMH JSON and logs,
GC metrics and compilation XML. It is 36,208,278 bytes, SHA-256
`18709e984f467d67042fe4e76faf506c1ac4002f93fcd75048177a11f4ec1f05`,
verified after download, and retained until 2027-01-15.
[Machine-readable results](results-39033175975.json) retain every observed
primary sample, the unchanged gate results, GC data and compilation review.

The prior preparation attempt consumed 33 rounded runner-minutes and no
correctness or timing work. This continuation consumed 62 rounded
runner-minutes: JTReg 1 and native 61. Aggregate charged usage is **95 of the
225 reserved minutes**, leaving **130**. Both jobs finished cleanup and evidence
upload. No further run has been launched.

The remaining blocker is the native performance regression screen, together
with the main matrix it prevented. The subsequent [repair proposal](REPAIR.md) uses this path evidence for
short-range Java selection, scalar prefix exits and bounded vector work before
a Java bulk fallback. The measured results above describe the original source,
not that repair. Native execution, actual ARM machine-code captures and recovery
timings remain required after independent source review and separate campaign
authorization. The author branch and PR description remain unchanged.
