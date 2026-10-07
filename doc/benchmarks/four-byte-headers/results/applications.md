# Fork-default database and Spring measurements

This comparison measures the unmodified JDK 27u eight-byte default against
the fork's four-byte default. The candidate runs without an enabling flag.
Both use their ergonomic G1 collector, a fixed 512 MiB heap and four active
processors on the same Linux host with a four-CPU quota and 16 GiB memory.

The baseline is `33e539f2d4a847f283a3793df6eebd41b9d1dfac`.
The measured candidate native code is
`9b75f196c2a03528cd458957dcc4228c9be69ba3`; final test source is
`9bf17e9327f79d5d13fe2e3ff9952b826f4aedf7`. Production sources are identical
between those revisions. The first matrix measured
`078bcb6937faf0989f383ce78576747dea480738` and exposed the locking regression
described below. Test-only changes also adapt existing compact-class encoding
assertions to cover both layouts.
The immutable image fingerprints and pinned application jar accompany the
raw results. Compilation and local tests are paused during timings.

## Final application comparison

The final-code study contains twenty-four database timing JVMs and twelve
Spring timing JVMs. Six initial database memory JVMs are followed by eighteen
additional memory-only JVMs, for twelve forks per layout. No profiler, build
or local test runs during timings. All measured Spring responses are validated.

| Workload | Metric | Original 8 bytes | Fork default 4 bytes | Change (95% interval) |
| --- | --- | ---: | ---: | ---: |
| db-shootout | duration (ms) | 4434.45 | 4535.91 | +2.6% [-4.0, +9.6] |
| db-shootout | post-GC heap (MiB) | 71.74 | 65.48 | -7.7% [-33.6, +28.3] |
| db-shootout | post-GC RSS (MiB) | 1096.67 | 1099.18 | +0.2% [-0.6, +1.1] |
| Spring Petclinic | throughput (requests/s) | 161.84 | 159.29 | -1.6% [-5.6, +2.5] |
| Spring Petclinic | p50 latency (ms) | 8.58 | 8.67 | +1.1% [-2.9, +5.3] |
| Spring Petclinic | p95 latency (ms) | 178.41 | 179.84 | +0.8% [-2.8, +4.5] |
| Spring Petclinic | p99 latency (ms) | 216.89 | 219.16 | +1.0% [-2.6, +4.8] |
| Spring Petclinic | post-GC heap (MiB) | 40.19 | 35.70 | -11.2% [-11.3, -11.0] |
| Spring Petclinic | RSS after load (MiB) | 719.61 | 705.27 | -1.9% [-5.5, +1.8] |
| Spring Petclinic | post-GC RSS (MiB) | 723.37 | 708.49 | -2.0% [-5.6, +1.7] |
| Spring Petclinic | ready startup (seconds) | 6.14 | 6.17 | +0.5% [-7.9, +9.6] |
| Spring Petclinic | busy heap (MiB) | 204.59 | 195.83 | -4.4% [-16.9, +10.0] |

Validated measured HTTP responses: 115,741; errors: zero.
Maximum load-driver CPU use: 0.07 CPU cores.
Database benchmark uses its upstream dummy validator; normal termination does not establish result correctness.

Spring retained heap falls 11.2%, with a tight interval excluding zero.
Database heap changes -7.7% with a wide interval crossing zero, even after
expanding memory measurement to twelve forks per layout. This workload does
not establish a heap improvement. Its occupancy includes collection and cache
effects and is not an exact sum of header bytes. Neither workload establishes
a process-RSS reduction; Spring busy-heap measurements are also inconclusive.

Timing intervals include zero: database duration changes +2.6% and Spring
throughput -1.6%. The earlier 27.3% Spring throughput regression does not
persist after the monitor lookup fix. These runs do not establish a speedup
or prove absence of smaller costs: the intervals allow a 9.6% database slowdown
and a 5.6% Spring throughput reduction. The earlier layout report additionally
records first-hash and identity-map costs. A universal regression-free claim
is not supported.

The memory expansion was chosen after the initial three-fork database heap
interval proved very wide, including one stock-eight fork close to candidate
occupancy. Every original result remains included. The initial summary and
all twelve-fork raw samples are retained; the follow-up is exploratory and
changes no timing results. Neither the initial nor expanded final-code study
establishes a database heap improvement.

[Raw final JSON/CSV and image manifest](applications/) accompany this report.
The [evidence archive](evidence.zip) retains the pre-fix results, diagnostic
profiles, excluded attempts and final validation logs separately.

## Regression found by the application benchmark

The first complete matrix found lower Spring retained heap but a substantial
throughput regression. These are valid measurements before the monitor fix:

| Workload | Metric | Original 8 bytes | Initial default 4 bytes | Change (95% interval) |
| --- | --- | ---: | ---: | ---: |
| db-shootout | Duration (ms) | 4,618.31 | 4,677.27 | +1.2% [-6.5, +9.4] |
| Spring Petclinic | Throughput (requests/s) | 165.02 | 119.83 | -27.3% [-32.1, -22.2] |
| Spring Petclinic | p95 latency (ms) | 169.17 | 232.85 | +37.9% [+28.2, +48.3] |
| Spring Petclinic | Post-GC heap (MiB) | 40.20 | 35.78 | -11.0% [-11.3, -10.7] |

All 102,674 measured HTTP responses passed validation, with no errors. The
load driver used at most 0.08 CPU cores. Lower heap occupancy alone did not
establish improved application performance.

CPU profiles located the cost in C2 monitor entry. Four-byte mode explicitly
fell back to the runtime after missing its two-entry monitor cache, while
eight-byte mode could search the monitor table directly. The fix adds the
table lookup for both address-derived hashes before movement and stored
hashes in moved ordinary instances. Expanded special layouts retain their
runtime fallback. The x64 matcher reserves an extra RCX temporary only for
four-byte locking, preserving the old layouts' register requirements.

Separate async-profiler 4.1 diagnostics use the `itimer` event at five
milliseconds and include startup, warmup and load. Monitor entry fell from
30.46% to 1.76% of sampled CPU; the original eight-byte profile measured
1.33%. These single-fork profiles identify the mechanism and are excluded
from the primary timing tables. A larger monitor-cache experiment helped
less and was removed; the final cache retains its original two entries and
storage size. The regression test checks concurrent and recursive locking,
expanded and address-derived hashes, a valid zero hash, collisions, and
special layouts, and verifies compiled C2 execution under all three collectors.

## CDS determinism regression found by the default-on suite

The fresh default-on tier1/tier2 run exposed a real failure in
`runtime/cds/DeterministicDump.java`: two interpreter-only static dumps
produced different archives. The original eight-byte image passed; an
explicit eight-byte run of the candidate also passed. The default four-byte
failure reproduced in isolation. This was an archive reproducibility failure,
with no JVM crash, and was not excluded from validation.

Four-byte identity hashes normally mix an object's address. Heap address
randomization changed hash-based module/package iteration during static
dumping. Commit `9ac5200959d2eb8d9dad5e4d6f3b3cfb3d43c3d3` uses an offset
from the reserved heap base during interpreter-only classic static dumping.
Normal execution and compiled hash paths retain their address calculation.
Already-hashed archived objects preserve their hash in the expanded slot.

An additional explicit-ZGC check then exposed four differing hashes in
regenerated method-handle holder mirrors. Both the original and candidate
explicit-eight-byte ZGC controls passed. Commit `370ceb1b527` derives class
mirror hash inputs from class names during interpreter-only classic static
dumping; its cold helper also keeps metadata work out of normal hashing.
The new `FourByteHeaderArchiveDeterminism` test reproduces the ZGC failure
before the fix and passes afterward for Serial, G1 and ZGC. Together with
the unchanged original test, all four cases pass: 24 determinism dumps, repeated dumps,
both compressed-oop settings and forced archive relocation. Three additional
ergonomic-heap dumps exercise hash expansion during GC.

The unchanged test passes after this fix: all six dumps, both compressed-oop
modes and forced archive relocation. Its before/after JTR files and original
and explicit-eight-byte controls are retained in the evidence archive. The
release image's six shipped archive variants are rebuilt for the fix.

Fastdebug then found an assertion crash in primitive-mirror hashing during
GC. The first class-name helper called `java_lang_Class::primitive_type`,
which checks global mirror handles while those handles can still refer to
the objects being moved. Commit `89f0e19d2e5` reads the primitive mirror's
immutable array metadata instead. The assertions remain intact. All four
archive cases pass with fastdebug after this correction, including the
compressed-oop GC paths that reproduced the crashes. The earlier failed
JTR files and the passing debug rerun are retained separately.


The broader debug suite then exposed another assertion crash during an ergonomic
heap-size archive dump. G1 had replaced the source header with a forwarding
pointer before the dump-only helper tried to read its class. Copy-time hashing
now uses the collector's captured class and destination metadata, while ordinary
hashing retains the source address. The ergonomic-heap regression check
reproduces the failure on the previous image; unchanged class-space coverage
and collector-specific archive tests pass with the correction.

## Inherited header-option regression found by CI

The broader legacy-layout AArch64 CI run found an AOT child-layout mismatch.
One-step training created a legacy-layout configuration, then launched its
assembly JVM with inherited options in `JAVA_TOOL_OPTIONS`. The fork checked
only command-line flag origins when disabling the four-byte default. The child
therefore re-enabled compact headers and refused the legacy configuration.
The same failure reproduced locally, with the child log identifying the
`UseCompactObjectHeaders` mismatch.

Commit `de7be9cb995` honors a nondefault compact-header opt-out from environment
variables or flag files as well as launcher arguments. An explicit four-byte
request still takes precedence. `FourByteHeaderOptions` covers opt-outs and
the explicit override through `JAVA_TOOL_OPTIONS`, `_JAVA_OPTIONS` and
`JDK_JAVA_OPTIONS`. The original `SpecialCacheNames` test remains unchanged.

The same CI run also exposed four compressed-oops test parsing failures:
a legitimate class-space adjustment warning preceded the numeric WhiteBox
result on stdout. The helper now prints and parses one explicitly marked
result while retaining exit-value and all compressed-oops ergonomics checks.
Before-fix CI JTR sections and the local AOT child log accompany the evidence.

## JFR and generated-image regressions found by CI

The unchanged JDK tests passed all five affected cases on stock eight-byte
JDK 27 and reproduced five failures on the preceding default-four image:
both small-stack old-object JFR searches, maximum UTF-8 encoding, jlink CDS,
and the missing-default-archive setup.

The imported Lilliput restriction disabled `OldObjectSample` because older
implementations stored edge indices in mark words. JDK 27 already stores
leak-context edges in a separate table. Commit `9b75f196c2a` restores the
original sampler eligibility; the two failing JFR tests retain their event
and reference-chain assertions. The immediate final-image controls pass with
191 DFS chains and 256 combined BFS/DFS chains. Additional old-object checks cover Serial/G1,
object sizes, fields, arrays, circular references and deep/shallow paths.

The jlink CDS plugin generated only the new default and legacy variants,
leaving an eight-byte opt-out runtime without its matching default archive.
It now explicitly generates all six header/oop combinations. The plugin test
checks every file and force-loads each archive with `-Xshare:on`. The
eight-byte parent opt-out control passes all six forced-load combinations.

Four-byte headers permit a byte array one byte longer than the other layouts.
The UTF-8 test now derives its last encodable string from the actual array
header and retains both successful allocation and above-limit OOME checks.
The missing-archive test removes all six current default archive filenames
before testing its failure path. Before-fix CI sections and matched stock/fork
controls accompany the evidence.

## Final native validation

The final x64 release and fastdebug images use source `9b75f196c2a`.
Release passes 48 focused header/hash/compressed-oop/archive cases, with two cases
ineligible for that build flavor. Fastdebug passes all 50 cases. Instrumentation
passes four cases in each flavor. All 1,398 enabled fastdebug native tests pass
in each of default four-byte, explicit eight-byte and legacy twelve-byte modes:
4,194 passes, with 15 upstream disabled tests per layout. The eleven eligible
`tier1_common` cases pass, including native wrappers, large-page, metaspace,
memory tracking and source checks; one platform-ineligible case is unselected.
Final per-case statuses accompany the raw evidence.
All thirty option/AOT follow-up cases pass across both build flavors and all
three layouts. All thirty additional release/debug JDK/JFR cases pass, as do
the stock-eight boundary control and the three immediate JFR/jlink controls.
The maximum-string test passes all nine JUnit executions in each of release,
fastdebug and stock-eight modes. Its initial offset-type compile failure is
preserved; test-only commit `9bf17e9327f` adds the explicit conversion from
Unsafe's long offset to the small header-word count. Production sources and
image fingerprints remain unchanged from `9b75f196c2a`.

All 126 JCStress locking/hash configurations pass again with the final native
code: 42 per collector under Serial, G1 and ZGC, with no failed configurations,
soft errors or hard errors.

## Cross-platform CI remains pending

The publication snapshot is a draft, not a completed cross-platform test result.
[Run 37560701755](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37560701755)
targets test revision `9bf17e9327f`, with production sources identical to the
benchmarked `9b75f196c2a` images. All four x64/AArch64 release/debug builds and
the setup job passed. Its six fastdebug/native jobs and eighteen three-layout
HotSpot/JDK/langtools tier1/tier2 jobs remain queued at publication.
The [snapshot](applications/final-ci-snapshot.json) records actual statuses;
zero completed test jobs is not a zero-failure pass result. Historical green
runs do not replace final-source proof. The PR remains draft pending these jobs.

## Workloads and interpretation

Renaissance 0.16.1 `db-shootout` uses its default 500,000 entries per reader
and writer with MapDB, Chronicle Map and H2 MVStore. Twelve independent JVMs
per layout run the upstream default sixteen operations, discarding the first
eight for warmup. The dataset size is unchanged.
Its upstream validator is a dummy, so successful completion does not prove
database result correctness. Twelve separate JVMs per layout collect post-GC
heap and RSS measurements with the retained-heap plugin; those runs are
excluded from timing comparisons.

Spring Petclinic is pinned to
`67643c4137eb75bfeb177b427f8459c471bdcbd8`, with Spring Boot 3.5.0,
Hibernate, Thymeleaf, Tomcat and embedded H2. The same jar runs on both JDKs.
The fixture expands its database to 10,000 owners, adding one pet and visit
per added owner. Eight persistent closed-loop HTTP workers cycle through
owner search, owner details and veterinarians. Every response must have
status 200 and the expected owner or page text. Six independent JVMs per
layout use 30 seconds of warmup and 60 seconds of measured requests.

Each pair alternates layout order. Reported values are arithmetic means
across independent forks; percentage changes and exploratory 95% Welch
intervals use log ratios of fork means. Intervals are not adjusted for
multiple comparisons. Lower duration, latency and memory are better;
higher throughput is better. Post-GC occupancy and RSS include collector
slack, buffers and native/application overhead and are not exact sums of
live object sizes. A fixed committed heap can hide object-size savings in
RSS. The Spring run is a local read-heavy test; it does not model a remote
production database or establish a universal performance guarantee.

## Runtime refresh before the final study

A managed-runtime refresh stopped the final validation driver before any
final-image timing began. The completed 117 focused/common cases and 4,194
native passes were preserved, along with 27 of 30 option/AOT passes. Only the
three unfinished cases were resumed; all thirty follow-up JTRs then passed.
JCStress and the expanded JDK checks completed afterward. Image fingerprints,
CPU model, four-CPU quota and 16 GiB limit remained unchanged.

The final study started with 11.1 GiB free after removing superseded caches,
images and completed generated test scratch files. Reports, sources, failure
logs and per-case statuses were retained. This refresh does not invalidate
or mix the fresh timing dataset because it occurred before the first fork.

The first final-image timing attempt was later interrupted by the managed
runtime after fourteen completed database JVMs and part of the fifteenth.
No benchmark exception or JVM crash was recorded. The entire incomplete
matrix is retained as excluded evidence; its timing values are not combined
with the continuous restart, which began at 02:52 UTC with 11.1 GiB free.

## Excluded attempts and local resources

Functional pilot runs overlapped compilation/testing and are excluded.
The first timed database attempt was aborted when H2 MVStore exhausted
the workspace filesystem. Both its successful baseline fork and failed
candidate fork are retained as excluded evidence. This was an IOException
for insufficient disk space, with no JVM crash. Generated completed-build
artifacts were removed, leaving 7.2 GiB free before restarting the entire
comparison in a fresh result directory.

The longer final database study briefly filled the filesystem before its
normal scratch cleanup. All timing data from that attempt are excluded;
completed forks terminated normally, and the active fork was stopped deliberately.
No JVM crash or database IOException occurred in that attempt. Removing completed
source images, unused native-test objects, detached debug symbols and an obsolete
cache left 9.14 GiB free before the entire balanced comparison restarted.
Final runtime images and current native libraries remain unchanged.

The updated native fastdebug build and its six archives completed before
image copying exhausted workspace capacity. The incomplete image was discarded.
After verifying the compressed object cache, completed uncompressed objects
were removed before copying. The fresh copy was checked against the unchanged
built source image. This packaging failure occurred before validation or timing.

Build Java helpers and jtreg helper JVMs use smaller active-processor
counts to stay within this container's thread limits. Timed application
JVMs use four processors and inherit no Java option environment variables.
The temporary local IR-framework worker bound is restored before timings
and after testing; test assertions and the repository helper remain intact.

The final local gtest wrapper initially received the native library directory
rather than the expected test-image parent containing `server`. Eight wrapper
cases failed setup before running native tests. A corrected local test-image
path points to the same final native library; unchanged wrappers are rerun.
The setup failures are retained separately from final statuses.

The earlier pre-archive-fix tier1/tier2 pass at concurrency four encountered native-thread
creation and process-spawn exhaustion. Its completed reports are preserved.
All 57 selected compile-the-world retries pass serially with unchanged assertions;
eight earlier passing cases retain their results, and one module is ineligible.
The fresh `4d9f101` local broad run was superseded when CI exposed the inherited
option bug. It completed 988 passing cases and 13 resource-failed cases before
being stopped. Eleven unchanged cases passed serially. The remaining GC case
timed out because sandboxed `jcmd` could not attach, and a native wrapper still
hit a thread limit. A small attach control reproduced the failure on both stock
and fork JVMs; both passed outside the sandbox. The final two unchanged cases
then passed with the required process access, yielding 1,001 passing completed
cases. The 3,959-case local selection remains incomplete; its partial snapshot
is explicitly separated from the final cross-platform CI matrix.

Final local validation and measurements run with the process access required
by `jcmd`. The Spring harness requires its post-load `GC.run` command to succeed
before recording post-GC heap occupancy.
