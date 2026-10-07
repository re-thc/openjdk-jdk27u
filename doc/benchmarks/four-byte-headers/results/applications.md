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

## Prior validated application comparison

The prior-image study contains twenty-four database timing JVMs and twelve
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

[All sixty final fork JSON files, CSVs, fixture SQL and image manifest](applications/)
accompany this report. [Reproduction commands](../README.md) use the same
workload pins. Pilots, profiles, pre-fix images, storage-limited attempts
and an interrupted earlier matrix are excluded. The continuous timing study
ran 2026-10-07T02:52:19Z–03:46:31Z.

## Prior validation and review

[Run 37577272055](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37577272055)
at `bf5ee5ef5062fb2148b9e9b20b792d6733aa8a47` passed all 29 jobs:
four x64/AArch64 release/fastdebug builds, six native/focused lanes and eighteen
HotSpot/JDK/langtools tier1/tier2 lanes across the three layouts. Actual logs
record **92,839 jtreg executions and 8,421 native tests**, with zero reported
failures or errors. These are repeated executions, not unique test names.
The [snapshot](applications/final-ci-snapshot.json) retains all jobs and
24 audited test summaries; full logs and JTRs are in that run's artifacts.

The separate [standard sanity run](https://github.com/re-thc/openjdk-jdk27u/actions/runs/37577266729)
failed two compiler IR tests on Linux, macOS and Windows: arraycopy selection
and vector alignment assumed compact headers always imply a twelve-byte
array base. Four-byte headers use an eight-byte array base. Review changes
retain eight-byte assertions, check aligned copying for four-byte headers,
and add positive and negative vector IR expectations. The header flag is
whitelisted for IR matching, and both cases join fastdebug CI in every layout.
The test-only review at `bd500907d778` passed all six x64/AArch64 fastdebug
layout lanes before its run was superseded. On the subsequent runtime fix
`d222c871c122`, all six local arraycopy/vector cases pass with IR verification
enabled. A temporary local worker-pool bound accommodated the container's
process limit and was restored before committing; IR assertions were retained.
The separate standard workflow still requires a current completed result.
[Original failure audit](applications/sanity-ci-review.json).

The attached review then identified runtime forwarding, compaction, accounting
and header-access fixes, implemented at `d222c871c122`. The table above remains
pinned to the earlier `9b75f196c2a` image and does not validate these new changes.
[Review resolutions and current validation](applications/review-resolution.md).
Copyright uses Teamoffy Pte. Ltd. for new fork contributions, preserving existing
notices. Stale commented statements and the completed CI migration step were
removed in the preceding test-only review.
The minimal JVMTI module-filter correction passes on stock-eight and
fork-default-four after unrelated proxy-test expansion is removed; the original
test failed on both images because dynamic named modules outside layers are
also returned by JVMTI.

The application study exposed a 27.3% Spring throughput regression before
direct C2 monitor-table lookup was added. The two-entry cache remains intact;
ordinary address-derived and stored hashes can search the table after a miss.
Coverage includes recursive/concurrent locking, zero hashes, collisions and
special layouts under Serial, G1 and ZGC. The final table no longer shows that
large cost. Default-on tests also found static archive nondeterminism, debug
GC assertion crashes, inherited AOT child opt-out mismatches and missing jlink
archive variants. Deterministic dump-only hashes, captured copy metadata,
inherited option handling and all six CDS variants address those failures.
Assertions remain enabled and the original JDK 27 JFR sampler behavior is preserved.

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

All 126 JCStress locking/hash configurations pass again with the prior `9b75f196c2a` native
code: 42 per collector under Serial, G1 and ZGC, with no failed configurations,
soft errors or hard errors.


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

