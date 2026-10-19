# Memory savings: current Linux x64 validation

Attributable memory savings are verified on the normal Linux x64 Serial/G1/ZGC
profile. Adoption is recommended as a measured memory/CPU tradeoff: warm-zone
DateFormatSymbols clones cost about 11% more under Serial, while the selected
lazy-zone clones are 41–54% faster.

This record describes complete native Linux x64 JDK images. The baseline B is
`e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4`. Initial candidate C0 is
`dfbbd8f2b278729aa5efbb286f59664dcbe02042`; its first-write serialization
benchmark was added at `e4eb05db67bf426f909f9116a49be139bbff16a5`.

The initial comparison exposed large shared-clone contention. Repaired candidate
C1 is `474b4c1650ade24c4f4a76b23a506c55d1e79212`, with common lazy-zone benchmark
inputs at `9805280fafdc019d8fbbd57d8aa463276a06aa76`. Its only production-source
change from C0 is DateFormatSymbols. Both release and fastdebug native libjvm
bytes are identical to C0; their native-component evidence remains identified
as C0. C1 has fresh focused correctness, footprint and affected cost checks.
Final production C2 is `207f395074f651fb36d03160169940de80504013`;
`ea4a3535592081cfce0de6cd543f60d9f582585a` additionally scopes the sharing
fixture around an inherited region-override race. C2 avoids a redundant volatile
snapshot write when Object.clone already copied the same reference. C0, C1 and
C2 effects are reported separately; different candidates are never pooled.

The [comparison guide](memory-overhead-native-decision.md) explains reproduction
and the distinct byte, retention, capacity and runtime estimands. Historical
results retain their original images. Raw observations, complete retained
images, manifests and command receipts remain outside the product PR.

## Build and identity

Native Linux x86-64 with x86-64-v3 support, four available CPU equivalents and
16 GiB cgroup memory. Both timed images use the ordinary headless Serial/G1/ZGC
`bin/configure-dev` profile, GCC/G++ 16.2.0, mold, boot JDK 27+35-2325,
Make 4.4.1, Autoconf 2.72, installed jtreg 8.3-dev+1, GoogleTest 1.14.0
(`f8d7d77c06936315286eb55f8de22cd23c188571`) and JMH 1.37. No system package
or unmanaged tool was installed. Release images use matching native-symbol
options, disabled PCH, four build jobs and source date
`2026-10-18T16:00:00Z`. Both pass the development-profile check.

The baseline contains two common test-only additions: the Array measurement
case and an explicit `gc/shared/tlab_globals.hpp` include for the inherited
G1 evacuation gtest. The include fixes an undeclared `OldPLABSize` when PCH is
disabled; four native G1 cases pass on both images. Baseline production is
unchanged. Its release SOURCE suffix is `e7753d9dffff+`; the candidate records
`dfbbd8f2b278`. C1 records `474b4c1650ad+`; that final dirty suffix
denotes only the documentation edits present during its build. C2 records
`207f395074f6+` for the same reason.

| Release artifact SHA256 | Baseline B | C0 | Final C2 |
| --- | --- | --- | --- |
| `bin/java` | `47231602fddd88273e809c403634e7b0c05ec5e01132955e13f6bae178fa74f1` | same | same |
| `lib/server/libjvm.so` | `3f4a6a0cc06a2fe902d7fe88385e962a8c5c2787ccb54a38066063b717fd38b7` | `5a04d5a0fe5db9537fefc78231be14d2cc31a736f8ac4688738ebe8544fa7ed9` | same as C0 |
| `lib/modules` | `4650ccc506b965a92d29a08746cfb86eb419e3e497ef085f79b4f51c636bd14f` | `c0c9d1698a75f84e69e50b962f697e86852efdf2983a38593c827474d6a85433` | `c0f90998f168749d5d1daf0a4d7f4ccf0df1a9893a9a7486ad5f2cad891a6c3b` |

Common Java diagnostic and benchmark classes are compiled once with the built
baseline javac and reused byte-for-byte within each comparison. Sources include
[the Java fixtures at fcda62c](https://github.com/re-thc/openjdk-jdk27u/tree/fcda62c58ce42701c690e4eee504ff3c64da1efb/test/manual/jvm-memory/qualification),
the committed footprint/benchmark/regression sources and WhiteBox inputs.
The old controllers are unused. C0's original common-byte manifest SHA256 is
`71b0982597dbaeb6ab63e73693ae5bed24548c7d4ef571ef6cde05a593f9cc0e`.
The lazy-zone additions and snapshot-aware footprint probe have separate retained
source/class manifests; original classes and images were preserved unchanged.
Allocation-agent diagnostics remain separate from timed forks. Intermediate C1
module SHA256 is `997fdb9d40eb74dd41a81bc4b5f51b004b2bd69bb932c7e3c3c0f896e4a68612`.
C1 and C2 full images are retained, alongside the original C0 pair.

## Executed correctness

| Coverage | Result |
| --- | --- |
| C0 and C1 release/fastdebug focused jtreg | 21 IDs passed on each image: 12 HotSpot/NIO/thread/AOT cases plus three Formatter cases under each supported collector. C1 adds a third controlled snapshot schedule to the concurrency test. |
| Final C2 affected jtreg | Nine Formatter IDs pass in release and fastdebug, including all three controlled schedules under Serial/G1/ZGC. Unchanged native/HotSpot/NIO paths retain the C1 checks and identical native libraries. |
| Common baseline focused jtreg | Nine passed; candidate-only early-reclamation/array-sharing assertions are excluded |
| Common locale/formatter suites | 123 passed on B, C0, C1 and C2 across four directories; three new IDs run separately. Existing `Locale/SoftKeys.java` has source `@ignore` and did not execute. The baseline's initial harness reports this ignored case as Error/exit 3; its result is retained and classified, not silently counted as a pass. C0/C1/C2 honor `-ignore:quiet`. |
| Exact native Array/ParkEvent | C0 and C1 release/fastdebug: two executed, zero skipped, zero failures on each |
| Common native G1 evacuation statistics | Four cases passed on baseline and each C0/C1 release/fastdebug image |
| Old-size Array control | Same measurement test on baseline: exactly 12 expected requested-size assertion failures, exit 2, with tag/zeroing/access checks passing |
| File-I/O probe validity | Positive-byte work, EOF rewind and repeated iteration checks pass on both images |
| Supported ASan | Full normal ASan image built; exact Array/ParkEvent cases each execute once, skip zero and pass with NMT header poisoning enabled |

The focused set includes Serial/G1/Z code-cache unloading, G1 concurrent marking,
C2 level-4 shared/disjoint/null/array merges and long concat, scalar/scatter-gather
platform/virtual carrier I/O, sleep/join, and actual G1 AOT record/create/replay
with `AOTVerifyTrainingData`. Formatter tests cover defensive ownership,
subclasses, providers, serialized aliases, stream hooks and both controlled JDI
clone/serialization schedules. C1 additionally pauses a clone after snapshot
capture, lets serialization expose and mutate the source array, then resumes
the clone and verifies isolation. Guarded partial-detachment/setter schedules
still execute.

Fastdebug assertions are enabled. Non-timed fastdebug and ASan configurations
use the supported `--with-native-debug-symbols=none` option to fit storage while
retaining all images/evidence. ASan uses matching GCC runtime SHA256
`9fc095207e580d024433b60c9c1235ddbfc9fd2cd4d10e604de9df55fb57fb48`,
`allow_user_poisoning=1:detect_leaks=0` for immortal-event policy, and live-header
unpoison/read/repoison. This is actual sanitizer execution, not an object-only
compile; it does not establish C2 sanitizer coverage. No OOM occurred.

## Attributable memory observations

Three fixed independent repetitions agree, unless a range is stated. Native
component observations below use C0; the unchanged native libraries and source
remain in C1. DateFormatSymbols observations use Locale.US and a fresh matched B/C1 probe that
includes the new snapshot overhead. C2 confirms the same counts, instance sizes
and allocation figures under each collector with the identical probe bytes.
Timing forks use neither agents nor NMT.

| Component / unit | Baseline to candidate | Interpretation |
| --- | --- | --- |
| Array NMT request, all 12 cases | One-eighth as many requested bytes; 87.5% saving | u1 lengths 0/1/7/1000: 64/64/128/8064 to 8/8/16/1008. u4: 64/64/256/32064 to 8/8/32/4008. Pointer: 128/128/512/64064 to 16/16/64/8008. BytesPerWord=8. Scope is C-heap metadata/AOT training snapshots. |
| ParkEvent NMT request | 416 to 160 bytes/event | Native sizeof=160, alignment=8 on both builds. The 64-to-192 worker high-water adds 256 events: 106496 to 40960 bytes, saving 65536 under each collector. Reusing high-water 192 adds none. |
| NIO after worker exit | 2224128 bytes/32 allocations to zero | All 32 misaligned replacements observed; absolute Other detail and totals reconcile. Disabled cache is zero on both. Threshold 65536 baseline retains 2097152/32; thresholds 69631/69632 retain 2224128/32; candidate is zero in each. |
| 1000 DateFormatSymbols instances or clones, Serial/G1 | Six-field arrays: 6000/46000 slots/240000 bytes to 6/46/240 | One 32-byte snapshot; instances remain 56 bytes. Including instances, arrays and snapshot: 296000 to 56272 shallow bytes. |
| Same, ZGC | 416000 to 416 array bytes | One 56-byte snapshot; instance grows 88 to 96 bytes. Including these costs: 504000 to 96472 shallow bytes. |
| Symbols construction or clone thread allocation | 296 to 56 bytes/op (Serial/G1); 504 to 96 (ZGC) | 240/408 fewer bytes/op. Formatter clone: 1056 to 816; ZGC 1504 to 1096. Formatter construction retains JIT variation: Serial/G1 1304..1320 to 1064..1080; ZGC 1776..1800 to 1368. |
| Serial/G1 code heap used capacity | 49152-byte paired change advantage | First GC leaves 64 dead methods on baseline and zero on candidate; all 64 live controls remain. Candidate reuses 64 old addresses, baseline zero. ZGC reclaims/reuses on both and paired change is zero. |
| C2 scratch | Unquantified | Lifetime/copy and compilation semantics checked; no helper-entry/peak-byte measurement. |

Park NMT `CALLER_PC` records Thread/JavaThread constructor callers, rather than
requiring a `ParkEvent::` frame. Complete Internal groups, actual per-event sizes
and count deltas support attribution; no address search or rerun selected a
favorable cohort. These immortal requests are not OS-returned memory or a
per-virtual-thread saving.

Code-cache diagnostics themselves generate stubs. The Serial before/after used
release is -9984 bytes on baseline and 39168 on candidate; G1 is -15488 versus
33664. The matched difference is 49152 in every repetition. WhiteBox reports
25088 bytes of blob payload separately. Commit stays 8 MiB, reservation 32 MiB;
this establishes earlier reclamation/reuse, not uncommit or RSS reduction.

Actual defaults are four-byte/compact object headers and eight-byte object
alignment. Compressed oops are enabled for Serial/G1 and disabled for ZGC.
The cohort totals are a measured subset, excluding strings, zones and other
cache storage. Serialization detaches shared arrays on first write; serializing
every instance therefore gives up the six-array retention benefit while the
added ZGC instance storage remains. A fresh-instance round-trip
smoke check produces identical 52355-byte streams on both images (SHA256
`516264be01287ab302160ac33b50a63100955facea3a262296b3cfe9e8d3be16`).

## Runtime comparison

All 920 observations are retained: C0 initial 404 (260 JMH, 144 process),
C0 lazy-zone extension 20 JMH, C1 324 (180 JMH, 144 process), and final C2
172 (112 JMH, 60 process). Every selected command exits zero, every JMH fork
has the intended three one-second warmups/four one-second measurements and
positive results, and the image/common-class hashes remain unchanged afterward.
All 48 generated Hello class files have the same SHA256 and execute to 42.

Each condition has four balanced interleaved AB/BA pairs. Tables show separate
B/candidate medians, the median of the four candidate/baseline ratios minus one,
nearest-rank ratio quartiles/range, and slower-pair counts. A positive change is
slower. These are small, practical engineering comparisons, not familywise
precision certificates. Unchanged B/B controls are interleaved after pairs one
and three in the declared conditions. No unfavorable valid fork was removed.

Timed JVMs use 256 MiB heaps, four processors, two compiler/parallel GC threads,
one concurrent GC thread, fixed US locale/UTC, CPU affinity 0–3, and no NMT,
agent or profiler. Startup uses a 32 MiB initial heap. The final resumed host is
AMD EPYC 9V45 with four CPU equivalents and a 16 GiB cgroup; native x86-64-v3
support and ordinary spawn/reap behavior were checked. Each candidate is
compared against B in its own phase; effects are not pooled across phases/hosts.

The I/O adapters transfer and verify one byte per operation on a bounded
1,000,000-byte file, rewind at EOF, and produce seven positive operation/byte
receipts per fork. They measure small I/O-call overhead, not bulk bandwidth.
Alloc400 creates 400 objects per invocation. Fixed process cases perform 1,536
worker starts/joins, platform/virtual carrier work with checksum 1,627,136, or
bounded dead/live code compilation, GC and recompilation. Startup javac includes
an untimed result check. These measurements use fixed work and units.

### Native/common core, C0

These are the original complete-image observations. C2 retains the exact C0
native library bytes and unchanged NIO/core workload source. Later checks
repeat the initially noisy G1 start/join and Serial allocation conditions;
their C1 paired medians are -1.44% and -0.78%, respectively, with all observations
retained. The original small positive medians are not silently discarded.

| GC / condition | B median | C0 median | Paired % median [IQR] | Paired % range | Slower |
| --- | ---: | ---: | ---: | ---: | ---: |
| G1 / start/join4 | 241.84 us | 251.20 us | +4.51 [-1.04, +6.04] | [-1.04, +12.15] | 3/4 |
| G1 / fileRead | 174.58 ns | 176.33 ns | +0.55 [-1.72, +1.10] | [-1.72, +2.14] | 3/4 |
| G1 / fileWrite | 192.02 ns | 190.73 ns | -0.78 [-1.54, -0.10] | [-1.54, +0.73] | 1/4 |
| G1 / javac | 2.46 ms | 2.49 ms | +1.91 [-2.23, +2.30] | [-2.23, +2.49] | 3/4 |
| G1 / Alloc400 | 932.85 ns | 868.91 ns | -7.35 [-7.78, -7.21] | [-7.78, -5.94] | 0/4 |
| Serial / start/join4 | 262.74 us | 255.72 us | -0.37 [-22.90, +1.22] | [-22.90, +8.62] | 2/4 |
| Serial / fileRead | 178.05 ns | 175.45 ns | -0.94 [-2.23, -0.78] | [-2.23, +0.16] | 1/4 |
| Serial / fileWrite | 189.21 ns | 190.78 ns | +0.83 [-2.02, +0.84] | [-2.02, +3.57] | 3/4 |
| Serial / javac | 2.39 ms | 2.40 ms | +0.93 [-0.32, +1.00] | [-0.32, +2.19] | 3/4 |
| Serial / Alloc400 | 806.94 ns | 829.08 ns | +3.26 [-4.51, +5.66] | [-4.51, +9.49] | 3/4 |
| Z / start/join4 | 244.38 us | 246.98 us | +0.55 [-9.11, +3.14] | [-9.11, +5.06] | 2/4 |
| Z / fileRead | 178.88 ns | 178.72 ns | +0.00 [-0.63, +0.16] | [-0.63, +0.69] | 2/4 |
| Z / fileWrite | 192.83 ns | 191.93 ns | -0.58 [-2.35, -0.22] | [-2.35, +0.67] | 1/4 |
| Z / javac | 2.98 ms | 3.16 ms | +3.47 [-1.17, +7.57] | [-1.17, +15.53] | 2/4 |
| Z / Alloc400 | 956.26 ns | 983.16 ns | +2.82 [-3.57, +3.83] | [-3.57, +10.74] | 3/4 |

### DateFormatSymbols repair and final clone costs

C0 shared-prototype warm-zone cloning at four workers was slower in all four
pairs under every collector: paired medians +459.86% G1, +530.45% Serial and
+434.46% ZGC. The added G1 lazy-zone case was +2281.24%, also four/four slower.
This justified replacing the broad clone monitor with a private immutable
snapshot. C1 fixed the large contention loss; C2 avoids a redundant volatile
write on the private result when the shallow clone already captured that
snapshot. The following results are fresh B/C2 measurements.

`symbolsClone` and `symbolsCloneShared` have initialized time-zone tables because
their setup validates equals. `symbolsCloneSharedLazyZone` validates months
without initializing zones. The shared prototypes are never mutated; formatter
state is private to each worker. Modified/deserialized/subclass fallbacks remain
conservative and are not a claim of fast cloning for every object state.

| GC / condition | B median | C2 median | Paired % median [IQR] | Paired % range | Slower |
| --- | ---: | ---: | ---: | ---: | ---: |
| G1 / formatterClone | 58.01 ns | 51.57 ns | -11.39 [-19.41, -9.66] | [-19.41, -9.07] | 0/4 |
| G1 / symbolsClone | 3.60 us | 3.70 us | +2.88 [+0.73, +3.54] | [+0.73, +8.17] | 4/4 |
| G1 / symbolsCloneShared | 3.49 us | 3.69 us | +5.72 [+2.31, +5.96] | [+2.31, +7.91] | 4/4 |
| G1 / symbolsCloneShared t4 | 4.53 us | 4.44 us | -0.58 [-5.25, -0.52] | [-5.25, +3.39] | 1/4 |
| G1 / symbolsCloneSharedLazyZone | 24.21 ns | 14.16 ns | -41.47 [-43.47, -41.21] | [-43.47, -40.33] | 0/4 |
| G1 / symbolsCloneSharedLazyZone t4 | 31.77 ns | 15.59 ns | -50.83 [-51.37, -50.64] | [-51.37, -50.10] | 0/4 |
| Serial / symbolsClone | 3.09 us | 3.39 us | +10.71 [+3.89, +12.21] | [+3.89, +14.99] | 4/4 |
| Serial / symbolsCloneShared t4 | 3.51 us | 3.85 us | +11.02 [+6.57, +12.73] | [+6.57, +17.36] | 4/4 |
| Serial / symbolsCloneSharedLazyZone t4 | 26.30 ns | 12.89 ns | -50.36 [-51.94, -50.21] | [-51.94, -50.03] | 0/4 |
| Z / symbolsClone | 4.13 us | 4.18 us | -1.72 [-5.84, +0.88] | [-5.84, +3.95] | 2/4 |
| Z / symbolsCloneShared t4 | 6.12 us | 6.12 us | +2.52 [-6.14, +3.90] | [-6.14, +8.22] | 3/4 |
| Z / symbolsCloneSharedLazyZone t4 | 57.32 ns | 26.21 ns | -54.49 [-55.52, -53.75] | [-55.52, -52.89] | 0/4 |

Warm-zone costs remain: Serial private/shared-four-worker clones are +10.71%
and +11.02% at paired medians, slower in four/four pairs; their B/B controls
center at -1.05% and +1.80%. G1 warm single-worker cases are +2.88% and +5.72%,
also four/four slower. These are retained tradeoffs, not qualified away by the
faster lazy cases. Lazy-zone cloning improves 41–54% in the selected conditions;
formatter cloning improves 11.39% in G1.

C2 changes only the clone fast path. The following C1 measurements cover the
unchanged constructor, formatting, parsing and first-write serialization paths;
they retain their C1 source identity, rather than being relabeled as C2 forks.

| GC / condition | B median | C1 median | Paired % median [IQR] | Paired % range | Slower |
| --- | ---: | ---: | ---: | ---: | ---: |
| G1 / formatterFormat | 244.61 ns | 223.22 ns | -9.22 [-10.34, -9.10] | [-10.34, -4.73] | 0/4 |
| G1 / formatterNew | 320.94 ns | 320.21 ns | +0.24 [-11.59, +4.07] | [-11.59, +4.47] | 2/4 |
| G1 / formatterParse | 1.35 us | 1.33 us | -1.88 [-4.39, -0.49] | [-4.39, +0.65] | 1/4 |
| G1 / symbolsNew | 21.22 ns | 15.93 ns | -24.23 [-30.07, -21.31] | [-30.07, -21.13] | 0/4 |
| G1 / symbolsSerialize | 131.67 us | 132.99 us | +0.50 [-0.26, +1.15] | [-0.26, +3.02] | 2/4 |
| Serial / symbolsNew | 18.18 ns | 14.92 ns | -18.20 [-18.63, -17.87] | [-18.63, -15.70] | 0/4 |
| Z / symbolsNew | 33.18 ns | 17.97 ns | -46.26 [-46.64, -46.24] | [-46.64, -43.22] | 0/4 |

### Whole-process costs and variability

The original C0 process wall receipts use a timeout wait with coarse polling
increments. They remain retained, but are unqualified for small startup/process
differences. C1 and C2 instead use standard pipe-based subprocess completion,
with output persisted after elapsed time is captured. No old and new estimators
are averaged. C1's complete precise-process observations follow.

| GC / condition | B median | C1 median | Paired % median [IQR] | Paired % range | Slower |
| --- | ---: | ---: | ---: | ---: | ---: |
| G1 / carrier-platform | 60.70 ms | 63.54 ms | +7.86 [-1.28, +8.82] | [-1.28, +14.87] | 3/4 |
| G1 / carrier-virtual | 49.57 ms | 50.94 ms | +6.70 [-1.08, +7.20] | [-1.08, +9.52] | 3/4 |
| G1 / code | 175.92 ms | 169.10 ms | -3.73 [-9.59, -1.32] | [-9.59, +0.90] | 1/4 |
| G1 / startup-java | 22.24 ms | 22.67 ms | +1.44 [-0.68, +2.49] | [-0.68, +13.65] | 3/4 |
| G1 / startup-javac | 214.89 ms | 221.46 ms | +3.80 [-0.57, +7.44] | [-0.57, +8.14] | 3/4 |
| G1 / threadwork | 630.22 ms | 645.27 ms | +4.10 [-14.59, +9.92] | [-14.59, +16.30] | 2/4 |
| Serial / carrier-platform | 58.29 ms | 60.80 ms | +1.72 [-3.40, +3.30] | [-3.40, +5.30] | 3/4 |
| Serial / carrier-virtual | 52.98 ms | 59.69 ms | +11.25 [-4.70, +13.43] | [-4.70, +13.77] | 3/4 |
| Serial / code | 169.93 ms | 165.99 ms | -2.96 [-7.77, -1.79] | [-7.77, +3.46] | 1/4 |
| Serial / startup-java | 20.89 ms | 21.84 ms | +3.17 [+2.50, +3.50] | [+2.50, +6.21] | 4/4 |
| Serial / startup-javac | 227.33 ms | 230.47 ms | +1.93 [-1.27, +2.20] | [-1.27, +3.31] | 3/4 |
| Serial / threadwork | 543.22 ms | 603.58 ms | +18.13 [+4.01, +23.00] | [+4.01, +24.56] | 4/4 |
| Z / carrier-platform | 82.96 ms | 91.56 ms | +3.66 [-1.05, +3.71] | [-1.05, +18.28] | 3/4 |
| Z / carrier-virtual | 77.50 ms | 80.69 ms | +3.37 [-4.88, +11.01] | [-4.88, +11.12] | 2/4 |
| Z / code | 201.52 ms | 195.86 ms | -2.74 [-7.61, -0.46] | [-7.61, +0.28] | 1/4 |
| Z / startup-java | 23.33 ms | 24.52 ms | +5.11 [-1.74, +6.54] | [-1.74, +9.25] | 3/4 |
| Z / startup-javac | 237.32 ms | 239.94 ms | -0.23 [-11.22, +3.68] | [-11.22, +4.65] | 2/4 |
| Z / threadwork | 610.67 ms | 627.21 ms | +2.35 [-12.34, +2.67] | [-12.34, +27.24] | 3/4 |

C2 follows up the selected slower/noisy cases with interleaved B/B controls.
Serial thread churn's earlier +18.13% median does not persist: C2 is -1.18%,
two/four slower, with a wide range. G1 carrier and Serial virtual-carrier effects
likewise vary between phases. Startup and short-process variability remains
large; neither consistent improvement nor universal non-regression is claimed.

| GC / condition | B median | C2 median | Paired % median [IQR] | Paired % range | Slower |
| --- | ---: | ---: | ---: | ---: | ---: |
| G1 / carrier-platform | 57.70 ms | 56.06 ms | -0.21 [-12.80, +1.62] | [-12.80, +4.67] | 2/4 |
| Serial / carrier-virtual | 52.95 ms | 52.11 ms | +1.08 [-4.07, +4.53] | [-4.07, +7.52] | 2/4 |
| Serial / startup-java | 22.15 ms | 23.37 ms | +9.66 [-19.14, +10.79] | [-19.14, +23.98] | 3/4 |
| Serial / threadwork | 578.65 ms | 572.31 ms | -1.18 [-9.13, +1.45] | [-9.13, +25.28] | 2/4 |
| Z / threadwork | 566.80 ms | 615.98 ms | +2.80 [-15.31, +3.30] | [-15.31, +36.00] | 3/4 |

### Unchanged controls

| Phase / condition | Second/first median % | Range % |
| --- | ---: | ---: |
| C0 / G1 symbolsCloneShared t4 | +3.74 | [+0.27, +7.20] |
| C0 / G1 javac | -1.18 | [-5.51, +3.16] |
| C0 / G1 Alloc400 | +0.90 | [+0.78, +1.02] |
| C0 / Serial Alloc400 | -0.51 | [-3.78, +2.75] |
| C0 / Z Alloc400 | -7.99 | [-8.49, -7.49] |
| C1 / G1 symbolsCloneShared t4 | +9.92 | [+1.98, +17.86] |
| C1 / G1 symbolsCloneSharedLazyZone t4 | +1.91 | [-5.36, +9.19] |
| C1 / Serial Alloc400 | -0.25 | [-1.84, +1.34] |
| C2 / G1 carrier-platform | -6.37 | [-8.22, -4.53] |
| C2 / G1 symbolsCloneShared t4 | +4.02 | [+2.94, +5.10] |
| C2 / G1 symbolsCloneSharedLazyZone t4 | -2.23 | [-5.14, +0.69] |
| C2 / Serial carrier-virtual | +8.21 | [-6.30, +22.71] |
| C2 / Serial symbolsClone | -1.05 | [-2.43, +0.32] |
| C2 / Serial symbolsCloneShared t4 | +1.80 | [+0.17, +3.43] |
| C2 / Serial startup-java | -0.57 | [-13.25, +12.11] |
| C2 / Serial threadwork | -2.78 | [-13.31, +7.75] |
| C2 / Z threadwork | +5.01 | [-1.31, +11.33] |

### Completed GC-pause tails

Logs are complete and nonrotating. Counts and nearest-rank p99 values below
cover whole allocation forks, including startup/warmup/measurement. Every
listed fork has at least 100 completed pauses. Concurrent phases are excluded;
percentiles are calculated per fork, never pooled. These descriptive tails do
not establish application transaction p99 or a general pause regression bound.

| Phase / GC / image | Events per fork | p99 ms median [range] |
| --- | --- | --- |
| C0 / G1 / B | 718, 680, 714, 704 | 1.285 [0.951, 1.409] |
| C0 / G1 / C | 748, 735, 744, 731 | 1.417 [1.104, 1.643] |
| C0 / Serial / B | 1789, 1737, 1775, 1825 | 0.290 [0.206, 0.740] |
| C0 / Serial / C | 1683, 1776, 1767, 1768 | 0.229 [0.211, 0.242] |
| C0 / Z / B | 1707, 1789, 1869, 1621 | 0.009 [0.006, 0.013] |
| C0 / Z / C | 1625, 1688, 1666, 1620 | 0.008 [0.008, 0.009] |
| C1 / Serial / B | 1822, 1811, 1817, 1769 | 0.190 [0.181, 0.274] |
| C1 / Serial / C | 1817, 1834, 1790, 1810 | 0.197 [0.178, 0.438] |

The initial G1 B/B controls themselves have per-fork p99 values
1.289/1.788/1.147/1.149 ms. The candidate G1 median of 1.417 ms therefore does
not support a clean tail improvement or a tight non-regression claim. Sparse
pauses in other fixed-process probes are unqualified; they were not extended
until a favorable percentile appeared.

## Decision and limits

**Adopt with workload limits for this memory-oriented Linux x64 profile.** The
native allocation/lifetime fixes have direct requested-byte/capacity evidence
and relevant correctness coverage. DateFormatSymbols delivers about 81% less
storage in the measured instance/array/snapshot subset and faster ordinary
lazy-zone construction/cloning, with a retained warm-zone clone cost of about
11% under Serial and smaller G1 costs. Keep that component separate/reversible:
a deployment dominated by warm-zone cloning should select the native/NIO
components without assuming the same DateFormatSymbols tradeoff is worthwhile.
This is a measured memory/CPU choice, not an all-workloads-faster verdict.

An initial C2 sharing test exposed the inherited shared
[region-override Locale.Builder](https://github.com/re-thc/openjdk-jdk27u/blob/e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4/src/java.base/share/classes/sun/util/locale/provider/CalendarDataUtility.java#L44)
race before the clone path: ConcurrentModificationException on candidate, and
wrong regions in three/four workers in a bounded baseline control. The failure
and control are retained. The fixture now checks ordinary locale-cache
publication concurrently and region-override sharing/isolation sequentially.
Parallel region overrides remain unqualified; this PR does not change that
unrelated production code or claim to repair it.

Parallel source is imported but excluded/unqualified by the normal profile.
Other architectures/OSes, complete test tiers, Shenandoah, HTTP/2, process-wide
RSS/PSS totals, per-helper C2 peak bytes and C2 sanitizer execution are not
established. Native requested bytes, Java shallow storage and code-heap used
capacity must not be added into an RSS total. Ordinary CI is tracked separately
from these local source/image-specific measurements; CI success alone is not
memory/performance qualification.
