# Fork-default database and Spring measurements

The rebuilt review-fix image reduces Spring Petclinic retained heap by **11.0%**
versus stock JDK 27's eight-byte default. Database duration and Spring throughput
are essentially unchanged within the observed uncertainty. Database retained
heap and both workloads' process RSS remain inconclusive.

This compares unmodified JDK 27u at `33e539f2d4a847f283a3793df6eebd41b9d1dfac`
with the fork's **normal four-byte default, without an enabling flag**.
The release image is built at `6f028e4f146790a16cc9e679710db526b094ec3f`:
runtime fixes are at `d222c871c122`, followed by include/whitespace changes at
`d07555c47f45`; later changes strengthen test coverage and refresh evidence.
Release, fastdebug and baseline image hashes are in [the manifest](applications/manifest.json).

Both application images use ergonomic G1, a fixed 512 MiB heap and four active
processors on the same AMD EPYC 9V74 Linux host with a four-CPU quota and
16 GiB memory. Compilation, local tests and profiling are paused during timings.
Image fingerprints match before and after the study, which ran
2026-10-07T17:39:43Z–18:41:41Z. All twelve database timing forks, twelve database
memory forks and six Spring forks per layout are complete.

## Application results

| Workload | Metric | Original 8 bytes | Fork default 4 bytes | Change (95% interval) |
| --- | --- | ---: | ---: | ---: |
| db-shootout | duration (ms) | 4572.26 | 4541.24 | -0.5% [-5.8, +5.0] |
| db-shootout | post-GC heap (MiB) | 89.98 | 82.88 | -7.9% [-28.7, +18.8] |
| db-shootout | post-GC RSS (MiB) | 1094.81 | 1102.48 | +0.7% [-0.0, +1.4] |
| Spring Petclinic | throughput (requests/s) | 164.57 | 164.63 | +0.1% [-5.0, +5.5] |
| Spring Petclinic | p50 latency (ms) | 8.91 | 8.75 | -1.8% [-8.4, +5.4] |
| Spring Petclinic | p95 latency (ms) | 173.08 | 173.69 | +0.4% [-4.6, +5.7] |
| Spring Petclinic | p99 latency (ms) | 216.00 | 215.59 | -0.1% [-5.6, +5.8] |
| Spring Petclinic | post-GC heap (MiB) | 40.18 | 35.76 | -11.0% [-11.2, -10.8] |
| Spring Petclinic | RSS after load (MiB) | 706.03 | 714.48 | +1.1% [-2.6, +5.0] |
| Spring Petclinic | post-GC RSS (MiB) | 709.81 | 717.75 | +1.1% [-2.7, +5.0] |
| Spring Petclinic | ready startup (seconds) | 6.64 | 6.82 | +2.6% [-4.4, +10.2] |
| Spring Petclinic | busy heap (MiB) | 181.45 | 197.38 | +8.5% [-8.5, +28.7] |

Validated measured HTTP responses: 118,654; errors: zero.
Maximum load-driver CPU use: 0.07 CPU cores.
Database benchmark uses its upstream dummy validator; normal termination does not establish result correctness.

Spring post-GC heap falls from 40.18 to 35.76 MiB. Its 95% interval excludes
zero. Database heap changes −7.9%, but its interval spans −28.7% to +18.8%;
this does not establish a database memory improvement. Busy heap and RSS do
not establish improvements either. Occupancy includes collector slack and
cache behavior; a fixed committed heap can hide object-size savings in RSS.
The required class hash-offset field also has a metadata/padding cost.

Database duration changes −0.5% and Spring throughput +0.1%; neither establishes
a speedup. The timing intervals allow a 5.0% database slowdown or a 5.0%
Spring throughput reduction. The earlier large Spring locking regression does
not persist after direct C2 monitor-table lookup. These measurements support
similar typical-use performance, rather than a universal regression-free claim.
Historical first-hash and identity-map costs are retained in the
[layout/hash report](validation.md); they were measured on earlier images.

## Exact object footprint

The same rebuilt release image also runs the one-million-object probe under
Serial, G1 and ZGC with no four-byte enabling option. It sums
`Instrumentation.getObjectSize` for one-int objects and their retaining
reference array, checking hash and payload preservation after movement.

| Collector | State | Stock default 8 bytes | Fork default 4 bytes | Reduction |
| --- | --- | ---: | ---: | ---: |
| Serial | Unhashed graph (bytes) | 20,000,016 | 12,000,008 | 40.0% |
| G1 | Unhashed graph (bytes) | 20,000,016 | 12,000,008 | 40.0% |
| ZGC | Unhashed graph (bytes) | 24,000,016 | 16,000,008 | 33.3% |
| Serial/G1 | Hashed after GC (bytes) | 20,000,016 | 20,000,008 | ≈0% |
| ZGC | Hashed after GC (bytes) | 24,000,016 | 24,000,008 | ≈0% |

Hashing and movement erase nearly all the initial saving for this graph.
These are exact shallow graph sizes, excluding the auxiliary hash verification
array and dead pressure allocations. They are not application heap or RSS.
All six probe JSON files accompany the application samples.

## Workloads and interpretation

Renaissance 0.16.1 `db-shootout` uses its default 500,000 entries per reader
and writer with MapDB, Chronicle Map and H2 MVStore. Twelve independent JVMs
per layout run sixteen operations; the first eight are discarded as warmup.
Twelve separate JVMs per layout use three operations with the retained-heap
plugin. Memory runs are excluded from timing comparisons. The complete fork
counts were specified before this review-fix study. The upstream dummy
validator means successful completion does not prove database result correctness.

Spring Petclinic is pinned to `67643c4137eb75bfeb177b427f8459c471bdcbd8`,
with Spring Boot 3.5.0, Hibernate, Thymeleaf, Tomcat and embedded H2. Both JDKs
run the same jar (SHA-256 in the manifest). The fixture contains 10,000 owners,
adding one pet and visit per added owner. Eight persistent closed-loop workers
cycle through owner search, owner details and veterinarians. Every measured
response requires status 200 and expected owner/page text. Six JVMs per layout
use 30 seconds of warmup and 60 seconds of measured requests. This local
read-heavy workload does not model a remote production database.

Layout order alternates within pairs. Values are arithmetic means across
independent forks. Changes and exploratory 95% Welch intervals use log ratios
of fork means, without adjustment for multiple comparisons. Lower duration,
latency and memory are better; higher throughput is better. The percentage
change is therefore not always the ratio of displayed arithmetic means.

The first attempted pair encountered H2 temporary-file ENOSPC. Both initial
pair results were excluded, disposable build caches were removed, and the
entire matrix restarted without image changes. The excluded attempt is retained
locally and recorded in the manifest. No successful fork in the completed
matrix is omitted. Pilots, profiles and prior-image measurements are excluded.

[All sixty application fork JSON files, six footprint files, fixture SQL,
summary CSV and manifest](applications/) accompany this report.
[Reproduction commands](../README.md) use the same workload pins.
[Prior-image evidence](https://github.com/re-thc/openjdk-jdk27u/tree/6f028e4f146790a16cc9e679710db526b094ec3f/doc/benchmarks/four-byte-headers/results/applications)
remains accessible in Git history.

## Review validation

Both rebuilt images pass **102 local jtreg executions** in total, including
Serial/G1/ZGC, Parallel and both Shenandoah modes, C2 IR verification,
instrumentation and all six jlink archive variants. All **4,206 enabled native
executions** pass across four-byte, eight-byte and legacy layouts. All **126
JCStress configurations** pass, 42 each under Serial/G1/ZGC, with no failed
configurations, soft errors or hard errors. The native flags test compiles
without precompiled headers. [Per-case local statuses](applications/review-test-results.csv)
and [finding resolutions](applications/review-resolution.md) record the scope
and the resource-limited attempts that required bounded reruns.

The new G1 boundary test reproduces the prior image's allocator assertion at
sixteen-byte alignment and passes on both rebuilt images at both alignments.
The strengthened generational Shenandoah case is additional coverage and also
passes the prior image. Assertions and IR checks remain enabled.

The [review-fix three-layout CI](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37656205271)
and [standard sanity CI](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37656180956)
run on `6f028e4f146`; [the snapshot](applications/review-ci-snapshot.json) records
completed and pending jobs separately. Later test/evidence commits have their
own PR checks. The [prior full CI audit](applications/final-ci-snapshot.json)
records 92,839 jtreg and 8,421 native passes on its earlier revision and is not
current runtime validation.

New fork contributions use **Teamoffy Pte. Ltd.**, preserving existing notices.
