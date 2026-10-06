# Four-byte object headers: validation and benchmarks

This change ports optional Lilliput 2 object headers to OpenJDK JDK 27u.
`-XX:+UnlockExperimentalVMOptions -XX:+UseFourByteObjectHeaders` enables the
layout. The default remains eight-byte compact headers; the twelve-byte
layout remains available with `-XX:-UseCompactObjectHeaders`.

Serial, G1 and ZGC are supported on x64 and AArch64. Parallel and Shenandoah
are also adapted and covered by the focused hash tests. ZGC relocation
preserves identity hashes when objects grow, including in-place relocation.
Old layouts use their original full-GC forwarding representation. Header stores
and generated locking/hash operations preserve adjacent fields and array lengths.
Runtime hashing uses a full-word compare-and-swap that preserves the captured
adjacent field; young forwarding also retains full-word snapshots where needed.

The port includes collector growth and hash preservation, interpreter/C1/C2
layout changes, field and array layout, CDS/AOT compatibility, and Serviceability
Agent decoding. Six matching default CDS archives are packaged for the three
layouts with and without compressed oops. Custom caches must be recreated
because the archive format changes from 20 to 21.

Compressed class space is limited to 512 MiB in four-byte mode, with no fallback
encoding. The boundary test loads more than 500,000 classes, allocates an object
with a high class identifier, verifies its class and identity hash after full
GC, and reaches controlled `OutOfMemoryError: Compressed class space` exhaustion.

Identity hashes may occupy an existing gap or grow the object after movement.
For one-int objects, four-byte mode changes the initial size from 16 to 8 bytes,
then back to 16 after a hashed object moves. `Instrumentation.getObjectSize`
uses its native implementation in four-byte mode to report those hidden slots
correctly; C1/C2 sizing intrinsics remain enabled for the old layouts. Profilers
that call this API frequently may pay additional native-call cost.

## Measurement method

The unmodified base is commit 33e539f2d4a847f283a3793df6eebd41b9d1dfac.
Baseline and candidate use the same GCC 16.2.0 toolchain and release configuration.
The local machine is Linux 6.18.44 on AMD EPYC 9V74, with a four-CPU quota and
16 GiB memory. Timings run after local compilation and correctness testing,
using immutable JDK images. SHA-256 image fingerprints accompany the results.
CI uses GCC 14 for x64 and AArch64 release and fastdebug builds.

The primary benchmark compares the original JDK 27u eight-byte default with
the candidate's four-byte mode. All reported improvements use that eight-byte
baseline. Candidate eight-byte results check that the default has no regression;
twelve-byte measurements are additional compatibility controls retained in the
raw data. The reproducible harness is in `doc/benchmarks/four-byte-headers/`.
It runs all configurations under Serial, G1 and ZGC. Timed JVMs use a fixed 512 MiB heap and four
active processors. Startup uses a 32 MiB heap and matching CDS archives.

The footprint probe sums exact shallow sizes of one million one-int objects
and their retaining reference array. It excludes its verification array and
dead allocation pressure, and checks hash and payload preservation after GC.
Renaissance 0.16.1 scrabble and scala-doku validate their output. Memory runs
perform full collections separately from timing runs, recording heap occupancy,
non-heap usage and RSS. Collector page granularity, heap slack and TLABs affect
occupancy; this is not an exact sum of live object sizes.
An additional Serial check uses three fresh JVMs per layout and a separate
three-fork no-TLAB diagnostic to distinguish object size from occupancy overhead.

JMH 1.37 uses three forks, five one-second warmup iterations and five one-second
measurement iterations, with the GC allocation profiler. It measures allocation,
first and stored identity hashes, map lookup and map churn that retains hashed
objects across collections. Renaissance timings use three independent JVMs per
configuration, ten validated operations each, discarding the first five within
each fork. Performance comparisons use independent fork means and 95% Welch
intervals on log ratios; JMH's own 99.9% score interval is retained in the CSV.
Startup interleaves 50 fresh JVMs per configuration after five untimed rounds.
It measures `java -version` startup rather than application readiness.

The first-hash confirmation uses six independent forks per collector/layout,
with each of the six possible baseline/default/four-byte execution orders used
once. This balances order effects. Its intervals also use independent fork means.
Two additional six-fork confirmations use the same balanced orders for Serial
identity-map lookup and ZGC stored hashes, following up signals in the main matrix.
The Serial application confirmation repeats both Renaissance workloads in the
original sequence with twelve independent forks and balanced layout order, following
up a default-mode Scala Doku slowdown signal in the first timing matrix.

Earlier pilot memory runs overlapped compilation and tests. Their timing
values are excluded. The final dataset uses a new result directory and the
analyzer rejects incomplete configuration, benchmark and fork matrices.

## Correctness evidence

- Final x64 release and fastdebug native code builds pass.
- All 1,398 enabled fastdebug native tests pass in each of the three layouts:
  4,194 passes, with 15 disabled upstream tests per layout.
- The release native gtest wrapper passes 1,288 enabled tests; its two
  large-page and three native-memory-tracking configurations also pass.
- Focused release and fastdebug header/hash suites pass all 35 cases each.
- After the hash-path performance fix, both builds pass all 35 focused cases
  again, all three native-test layouts pass again, the new instrumentation
  regression passes in each build, and all 126 JCStress configurations pass again.
- The instrumentation suite passes four cases per build flavor, and the
  original three size-intrinsic cases additionally pass in each layout.
- The layout matrix covers three layouts, three required collectors, 8/16-byte
  alignment, interpreter/C1 modes and uncompressed references: 26 cases pass.
- All six default archive variants and the class-space boundary pass. The
  strengthened boundary test reaches controlled exhaustion after 523,248 classes
  and checks an allocated object near the boundary before and after movement.
- Live SA heap-dump and inspection checks at 16-byte alignment pass.
- The captured-class Shenandoah regression cases pass with their original seed;
  the C2 expanded-but-unhashed regression fails before the fix and passes after it.

The final selected local old-layout unions are clean: default eight-byte headers
pass 3,945 cases with ten runtime skips; legacy twelve-byte headers pass 3,626
cases with nine runtime skips. Every selected case has a recorded final status.

The final four-byte selected union passes 3,626 cases with nine runtime skips.
All three selected local unions have no failed, error or missing results. The
only four-byte tier-2 first-pass failure was thread exhaustion; it passed in a
fresh JVM with unchanged assertions.

Six additional large-array cases pass: C1 and C2 under Serial, G1 and ZGC. Each
allocates an int array larger than 2 GiB, verifies sampled payloads and length,
checks compiled hash lookups after movement, and checks long object sizes.
The reproduction source and command accompany the evidence archive.

The final JCStress HashAndLock run passes 42 generated VM/compilation/fork
configurations per collector, 126 total, with no forbidden outcomes or harness
errors. These are configurations of one two-actor test, rather than 126 distinct
tests.

The corrected native x64/AArch64 validation run at 5ea80e0595c6 completes all
29 jobs successfully: four release/fastdebug builds, six fastdebug test lanes,
and eighteen tier-1/tier-2 lanes across HotSpot, JDK and langtools. Actual logs
record 92,865 jtreg passes and 8,421 native passes across the repeated
architecture/layout configurations, with zero failed or error results. These
are test executions, not unique test names. The jtreg breakdown is 22,568
HotSpot, 41,683 JDK, 28,386 langtools and 228 focused fastdebug executions.
See https://github.com/re-thc/openjdk-jdk27u/actions/runs/37437330323.

## Remaining acceptance limits

The PR remains a draft. The requested universal absence of performance
regressions is not established: balanced rechecks confirm slower first hashes
in four-byte mode under all three required collectors, plus slower Serial
identity-map lookup and ZGC stored-hash reads. These costs are reported below
beside the memory gains. Default eight-byte timing controls show no clear
slowdown after the hash-path correction in the final balanced rechecks.

At 2026-10-06 13:21 UTC, the optimized native run at eac09d4f179 has ten
successful jobs: all four builds and five of six fastdebug lanes, with no
failed jobs. Five tier-1/tier-2 lanes are running and fourteen jobs remain
queued. Its completed fastdebug logs have been audited; the remaining full
matrix is not claimed as passed. See
https://github.com/re-thc/openjdk-jdk27u/actions/runs/37444286162.

The final include-order-only source correction at 05a345fd20a6 passes a local
release native rebuild and all eleven applicable common jtreg cases. Its
native and standard multi-platform GitHub runs are still queued at publication:
https://github.com/re-thc/openjdk-jdk27u/actions/runs/37463420093 and
https://github.com/re-thc/openjdk-jdk27u/actions/runs/37463414382.
The completed full matrix above precedes the optimized hash-path separation;
the final local native, header/hash, instrumentation and JCStress checks cover
that separation. The recorded final CI snapshot distinguishes completed
results from pending jobs. The benchmark and documentation publication adds
no runtime or test-source changes.

The native AArch64 run exposed two existing intrinsic-test failures involving
empty byte-array equality. With four-byte array elements starting at offset
eight, the optimized short comparison read beyond an empty array and its zero
shift left unrelated bytes unmasked. A four-byte-only early return fixes that
case while preserving generated code for the old layouts. The original JDK
AArch64 lane also reported three charset-test failures and a crashed test agent.
Its crash report identifies a zero-length char array at address e64ffff8; the
faulting instruction reads at e6500000, eight bytes beyond it, into an inaccessible
heap page. This confirms the same optimized-comparison defect for char arrays.
The corrected full JDK lane verifies the charset cases again. Both existing base64
and string intrinsic tests are also included in fastdebug CI.

The first CI workflow mistakenly trusted make test-prebuilt's zero exit code;
the target writes an exit-with-error marker instead. The workflow now checks
that marker after each invocation. Actual test logs, not job badges, determine
the results. The default-layout core-limit test also revealed that the runners
needed ulimit -c unlimited; the workflow now sets that limit.

Local testing excludes nine cases whose failures also reproduce on the original
JDK: seven core-file cases requiring `/proc/sys/kernel/core_pattern`, and two
platform-thread stress cases exhausting this container's process capacity.
Those exclusions are local only; CI keeps the cases enabled. Rechecking all
seven core-file cases with an unlimited core limit in each layout still reports
the missing kernel file. The separate core-limit test passes with that limit. The container's PID 1
is not a reaper, and initial build logging left orphaned `tee`/linker processes.
Later builds and tests use a child subreaper and a non-forking, four-thread mold
wrapper. A pre-existing module-test assumption was corrected to distinguish
modules associated with layers from dynamic proxy modules; both baseline and
candidate pass the strengthened test, which also verifies JVMTI reports proxies.

Local compiler tests use a temporary bound on the IR framework's compilation
helper pool: at most the active processor count, rather than one platform thread
per test method. This preserves every method and assertion while avoiding thread
exhaustion in large vector tests. The original JDK passes all three vector-reduction
variants with the same adjustment. The source change is restored before committing;
the patch accompanies the local evidence, and CI uses the original test helper.

The legacy-layout SA registry test passed in an isolated rerun with one active
processor and Serial GC, reducing the thread count across its target and debugger
JVMs. Every assertion remains enabled. Its original CI configuration also passes
in the full x64 legacy HotSpot lane. Thread-capacity failures elsewhere clear in
fresh JVMs; one timed-out SA test left two debug servers and two targets, which
were terminated before retries.

The upstream `vm.flagless` requirement excludes 320 cases when explicit header
flags are present. The selected local tier-1/tier-2 unions are therefore 3,955 cases
for the default layout and 3,635 each for the legacy and four-byte layouts. Platform,
manual and upstream ProblemList filtering also apply; selected-result CSVs make
the executed cases and skips explicit.

GCC 16 emits a baseline false-positive nonnull warning in unchanged handshake
code during fastdebug compilation. A local compiler wrapper limits suppression
to that file. CI's GCC 14 builds do not need this adjustment.

The standard AArch64 tier-1 common job caught unsorted includes in the two
forwarding headers. The JDK's SortIncludes formatter corrects the include order
and separator; a release native rebuild passes, followed by all eleven applicable
common jtreg cases, including the source checks and debug metaspace verification.
The first local common rerun paired the debug JVM with the release native test
library; the corrected run uses the matching debug library. This source-format
correction changes no algorithms. The benchmark images remain pinned to eac09d4f179,
before that correction, and their fingerprints are preserved.

## Exact retained graph sizes

| Collector | Baseline unhashed MiB | Four-byte unhashed MiB | Reduction | Baseline hashed MiB | Four-byte hashed MiB |
| --- | --- | --- | --- | --- | --- |
| Serial | 19.07 | 11.44 | 40.0% | 19.07 | 19.07 |
| G1 | 19.07 | 11.44 | 40.0% | 19.07 | 19.07 |
| Z | 22.89 | 15.26 | 33.3% | 22.89 | 22.89 |

## Renaissance post-GC memory

| Collector | Workload | Original eight-byte MiB | Candidate eight-byte MiB | Four-byte MiB | Heap reduction | RSS change |
| --- | --- | --- | --- | --- | --- | --- |
| Serial | scrabble | 95.14 | 95.11 | 75.56 | 20.6% | -4.4% |
| Serial | scala-doku | 6.65 | 10.93 | 5.73 | 13.9% | -4.5% |
| G1 | scrabble | 94.06 | 94.04 | 75.48 | 19.7% | -3.8% |
| G1 | scala-doku | 4.40 | 4.41 | 4.00 | 9.2% | -5.0% |
| Z | scrabble | 128.00 | 128.00 | 118.00 | 7.8% | +1.2% |
| Z | scala-doku | 8.00 | 8.00 | 8.00 | -0.0% | +0.5% |

## Serial memory confirmation

Three independent JVMs per layout, three plugin operations per workload; median of per-fork medians. Ranges show the per-fork heap medians.

| Workload | Original eight-byte MiB | Candidate eight-byte MiB | Four-byte MiB | Reduction | Original range MiB | Default range MiB | Four-byte range MiB |
| --- | --- | --- | --- | --- | --- | --- | --- |
| scrabble | 94.94 | 95.10 | 75.47 | 20.5% | 94.76–95.14 | 94.50–95.26 | 74.99–75.52 |
| scala-doku | 6.32 | 9.76 | 5.82 | 7.9% | 6.31–6.54 | 6.66–10.85 | 5.75–6.01 |

## Serial memory diagnostic without TLABs

Three independent JVMs per layout with `-XX:-UseTLAB`; this diagnoses occupancy overhead and is excluded from performance timings.

| Workload | Original eight-byte MiB | Candidate eight-byte MiB | Four-byte MiB | Reduction | Original range MiB | Default range MiB | Four-byte range MiB |
| --- | --- | --- | --- | --- | --- | --- | --- |
| scrabble | 94.65 | 94.64 | 74.96 | 20.8% | 94.64–94.65 | 94.63–94.65 | 74.85–74.96 |
| scala-doku | 4.39 | 4.39 | 4.00 | 8.9% | 4.39–7.92 | 4.39–7.97 | 4.00–4.00 |

## Renaissance execution time

Lower is faster. Brackets contain the 95% interval for percentage change from the original baseline.

| Collector | Workload | Baseline ms | Four-byte ms | Four-byte change [95% CI] | Default change [95% CI] |
| --- | --- | --- | --- | --- | --- |
| Serial | scrabble | 448.89 | 434.82 | -3.2% [-13.9, +8.8] | -4.5% [-12.4, +4.0] |
| Serial | scala-doku | 1251.73 | 1333.77 | +6.5% [-2.3, +16.1] | +13.6% [+3.5, +24.7] |
| G1 | scrabble | 240.55 | 228.32 | -5.2% [-23.5, +17.6] | +7.7% [-13.3, +33.7] |
| G1 | scala-doku | 1423.68 | 1370.44 | -3.4% [-23.4, +21.7] | -4.8% [-23.2, +17.9] |
| Z | scrabble | 759.83 | 767.73 | +0.5% [-24.9, +34.7] | -1.1% [-7.7, +5.9] |
| Z | scala-doku | 1496.66 | 1463.33 | -2.3% [-12.0, +8.5] | +0.0% [-8.2, +8.9] |

## Balanced Serial application confirmation

Twelve independent forks repeat both workloads in their original sequence; each layout order occurs twice.

| Workload | Baseline ms | Default ms | Four-byte ms | Default change [95% CI] | Four-byte change [95% CI] |
| --- | --- | --- | --- | --- | --- |
| scrabble | 449.55 | 453.48 | 439.19 | +0.8% [-3.6, +5.5] | -2.3% [-5.9, +1.4] |
| scala-doku | 1370.50 | 1384.53 | 1316.29 | +1.0% [-2.5, +4.7] | -3.9% [-7.2, -0.5] |

## JMH execution time and allocation

| Collector | Benchmark | Baseline ns/op | Four-byte ns/op | Four-byte change [95% CI] | Default change [95% CI] | Baseline B/op | Four-byte B/op |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Serial | allocate | 1.21 | 1.08 | -10.8% [-17.5, -3.6] | -7.6% [-16.2, +1.8] | 16.00 | 8.00 |
| Serial | firstHash | 13.72 | 15.97 | +16.4% [+15.4, +17.4] | -5.1% [-9.3, -0.7] | 16.00 | 8.00 |
| Serial | storedHash | 1.55 | 1.51 | -2.6% [-9.7, +5.1] | -3.8% [-8.2, +0.9] | 0.00 | 0.00 |
| Serial | identityMapLookup | 2.48 | 2.73 | +9.8% [+1.5, +18.8] | +0.1% [-5.6, +6.2] | 0.00 | 0.00 |
| Serial | identityMapChurn | 17080.79 | 17486.89 | +2.4% [-4.8, +10.1] | -0.2% [-9.3, +9.8] | 16432.09 | 12328.08 |
| G1 | allocate | 1.17 | 1.06 | -9.2% [-13.2, -5.1] | +2.3% [-3.2, +8.2] | 16.00 | 8.00 |
| G1 | firstHash | 14.09 | 15.76 | +11.9% [+4.2, +20.3] | -1.5% [-9.5, +7.2] | 16.00 | 8.00 |
| G1 | storedHash | 1.54 | 1.53 | -0.7% [-7.3, +6.3] | +0.1% [-6.8, +7.5] | 0.00 | 0.00 |
| G1 | identityMapLookup | 2.57 | 2.71 | +5.4% [-4.9, +16.8] | -0.5% [-3.7, +2.9] | 0.00 | 0.00 |
| G1 | identityMapChurn | 12100.03 | 12646.88 | +4.6% [-4.7, +14.7] | +2.1% [-6.8, +11.8] | 16432.08 | 12328.07 |
| Z | allocate | 1.27 | 1.05 | -17.0% [-25.4, -7.7] | -1.0% [-12.2, +11.7] | 16.00 | 8.00 |
| Z | firstHash | 13.85 | 17.12 | +23.2% [-3.8, +57.8] | -2.1% [-7.8, +4.0] | 16.00 | 8.00 |
| Z | storedHash | 1.56 | 1.67 | +7.3% [+0.1, +15.0] | +1.3% [-2.3, +4.9] | 0.00 | 0.00 |
| Z | identityMapLookup | 3.71 | 3.74 | +0.9% [-10.2, +13.5] | -1.3% [-10.8, +9.1] | 0.00 | 0.00 |
| Z | identityMapChurn | 12453.26 | 12615.13 | +1.4% [-9.6, +13.7] | -0.7% [-11.9, +12.0] | 24640.12 | 20536.11 |

## Balanced first-hash confirmation

Six independent forks per configuration; each of the six layout orders occurs once. Lower is faster.

| Collector | Baseline ns/op | Default ns/op | Four-byte ns/op | Default change [95% CI] | Four-byte change [95% CI] |
| --- | --- | --- | --- | --- | --- |
| Serial | 13.444 | 13.233 | 15.944 | -1.6% [-3.7, +0.5] | +18.6% [+16.0, +21.2] |
| G1 | 13.586 | 13.325 | 15.783 | -1.9% [-6.3, +2.7] | +16.2% [+11.3, +21.4] |
| Z | 14.126 | 13.697 | 16.544 | -3.0% [-7.4, +1.6] | +17.1% [+11.4, +23.2] |

## Default first-hash path before and after the fix

| Collector | Before default ns/op | After default ns/op | Before change [95% CI] | After change [95% CI] |
| --- | --- | --- | --- | --- |
| Serial | 15.088 | 13.233 | +12.0% [+7.4, +16.7] | -1.6% [-3.7, +0.5] |
| G1 | 15.057 | 13.325 | +10.6% [+7.6, +13.6] | -1.9% [-6.3, +2.7] |
| Z | 15.267 | 13.697 | +7.9% [-1.1, +17.8] | -3.0% [-7.4, +1.6] |

## Balanced hash-read confirmation

Six independent forks per configuration; selected cases follow up slowdown signals in the main matrix.

| Collector | Benchmark | Baseline ns/op | Default ns/op | Four-byte ns/op | Default change [95% CI] | Four-byte change [95% CI] |
| --- | --- | --- | --- | --- | --- | --- |
| Serial | identityMapLookup | 2.575 | 2.513 | 2.747 | -2.4% [-6.0, +1.4] | +6.7% [+2.9, +10.7] |
| Z | storedHash | 1.607 | 1.607 | 1.707 | +0.0% [-4.8, +5.1] | +6.3% [+2.0, +10.7] |

## CDS startup

50 fresh JVMs per layout/collector, interleaved after five untimed rounds.

| Collector | Original eight-byte median ms | Candidate eight-byte median ms | Four-byte median ms | Four-byte change | Baseline p95 ms | Four-byte p95 ms |
| --- | --- | --- | --- | --- | --- | --- |
| Serial | 27.16 | 26.14 | 26.51 | -2.4% | 31.33 | 30.72 |
| G1 | 29.41 | 27.84 | 27.86 | -5.3% | 31.64 | 32.08 |
| Z | 32.59 | 32.29 | 32.00 | -1.8% | 35.97 | 36.68 |


## Observed performance limits

All changes compare four-byte mode with the original JDK 27u eight-byte default. Negative timing changes mean faster execution. These experiments cover two validated applications and five microbenchmarks on one x64 host; they cannot establish universal absence of performance regressions. Confidence intervals are exploratory comparisons and are not adjusted for multiple benchmarks.

Candidate eight-byte mode has no JMH comparison whose entire 95% interval indicates a slowdown.

Four-byte mode has measured slower cases in the main JMH matrix: Serial firstHash +16.4% [+15.4, +17.4]; Serial identityMapLookup +9.8% [+1.5, +18.8]; G1 firstHash +11.9% [+4.2, +20.3]; Z storedHash +7.3% [+0.1, +15.0].

The balanced first-hash table gives the separate six-fork confirmation. Hidden hash slots erase nearly all of the exact graph saving when every object is hashed and moved. Post-GC heap reductions vary by workload; ZGC RSS can rise despite lower heap occupancy.

The initial three-fork Serial Scala Doku matrix showed a default-mode slowdown of +13.6% [95% interval +3.5, +24.7]. A balanced six-fork recheck reduced that to +4.4% [-0.5, +9.6]. The full twelve-fork confirmation estimates +1.0% [-2.5, +4.7], with no clear default slowdown. Four-byte mode is 3.9% faster in that confirmation [-7.2, -0.5]. The source remained unchanged across these application measurements; earlier results are retained.

Serial Scala Doku occupancy is sensitive to runtime overhead on this small heap: the initial candidate eight-byte sample was 10.93 MiB, versus 6.65 MiB on the base. Three fresh JVMs per layout reproduce variable candidate occupancy. In the separate no-TLAB diagnostic, original and candidate eight-byte medians both become 4.39 MiB, with a higher fork around 7.9 MiB in each; four-byte mode is consistently about 4.00 MiB. TLAB slack explains part of the variation, while residual runtime variation remains. These occupancy readings do not establish an eight-byte object-size regression; the exact graph-size control is unchanged. All readings and ranges are retained, and no-TLAB diagnostic timings are excluded.


## Hash-path performance correction

The first complete measurements found a regression in the candidate's default
eight-byte mode. A balanced six-fork confirmation measured first identity hashes
12.0% slower under Serial (95% interval +7.4 to +16.7), 10.6% under G1
(+7.6 to +13.6), and 7.9% under ZGC (-1.1 to +17.8). Native assembly showed that
the shared compact/legacy helper prevented the original private RNG from being
inlined and added register spills to the default path.

Commit eac09d4f179 restores the original legacy RNG and hash loop, with a separate
four-byte helper selected at entry. The public interface and legacy algorithms
remain unchanged. The rebuilt default path again inlines its RNG and avoids the
spill-heavy prologue. All final timing tables above are fresh measurements of
this corrected image; the earlier measurements are preserved separately in the
evidence archive.
