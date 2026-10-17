# Default-enablement decision proposal

This is an unexecuted measurement scope, requiring new execution authorization.
PR 53 is unfinished experimental work. Completion means a justified default-on
integration with an opt-out, or a do-not-merge result. Retaining opt-in support is
not the completion criterion. No timing or allocation campaign has been run for
the source changes described here.

## Sources and controls

Freeze all source, worker/controller, tool, configuration and image hashes before
timing. Never select moving branches or use the historical qualification driver.

| Route | Source and behavior |
|---|---|
| B | Current base `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`, normal image |
| E | Candidate production source `a062f73bd705486673b63f2339875f78bb7132cb`, native build enabled, startup property true |
| D | The exact E image with startup `jdk.time.instantSpeedate=false` |
| J | B plus only an immutable cached InstantPrinterParser control; separate normal image and committed patch |
| M | The exact E image after a verified permanent missing-library failure, with the search path restored before warmup |

J caches the existing parser tree for variable fractional precision; it adds no
calendar arithmetic or new grammar. Freeze its exact patch and derived commit
before building. It must pass the formatter/Instant tests and differential oracle.
The old cached-control transformation can supply the patch, but old images,
patch-module measurements and old controller identities supply no new evidence.

Use the installed GCC 16/mold, boot JDK 27, jtreg 83 and Rust/Cargo 1.99 tools.
Fingerprint executables, Rust standard libraries/notices, selected flags and
effective configuration. Pass raw Cargo/rustc paths as configure command-line
assignments; exporting those variables alone is insufficient. Use the repository
development profile, release/server, disabled javac server, make jobs 4 and Cargo
jobs 2. Fetch only locked Cargo dependencies; install or downgrade no tools.

## Fixed staged scope

Build B and E first. A runtime-disabled failure stops the decision before building
J or measuring native gains. Stage 2 proceeds only after the stage-1 gates pass;
it has no fresh clock, expanded samples or retry allowance.

Each comparison uses two independent paired cohorts in opposite order: A/B then
B/A. Run both explicit CompactStrings modes. Warmed JVMs use G1, a fixed 256 MiB
heap, ActiveProcessorCount=2, normal tiered compilation and `-Xbatch`. Do not force
inlining, compile-only methods or alter compiler thresholds.

Each timing JVM warms 16,384 entries of a 64-public-call batch, then records four
blocks of 2,048 such entries: 1,048,576 warmup and 524,288 measured calls. Every
parse is a single public call with real JNI input copying and result construction;
each result/exception escapes to a volatile sink. Print only after the cohort.
Record checksums, Java allocation, compiler-time and GC counters around blocks.

Use the six fixed corpora named happy, mixed, fallback, syntax, calendar and custom
in QualificationProbe.java at `3fbca0cd2e6afa036b39aede3f22a4911a9f1bfb`. Copy only
those input definitions into the new worker, not its old timing/controller code.
Mixed has four native hits, two successful fallbacks and two calendar failures.
Keep syntax and calendar failures separate so one cannot hide the other's cost.

| Stage | Paired comparisons | Timing JVMs |
|---|---|---:|
| 1 | D/B canonical public calls; D/B unchanged direct-formatter calibration | 16 |
| 2 | E/B all six corpora; E/J canonical and mixed; D/B other five corpora; M/B canonical | 112 |
| 2 calibration | E/B unchanged direct-formatter canonical calls | 8 |
| Total | Two String modes and opposite-order pairs included | 136 |

The fixed total is 213,909,504 warmed-plus-measured timing calls. Keep separate
untimed compiler forks: B/D canonical in stage 1 (four JVMs); E canonical, mixed,
fallback and calendar plus J canonical/mixed in stage 2 (12 JVMs). Retain normal
entry C2/inlining/OSR/deoptimization records. Diagnostic forks do not prove the
identity of generated code in timing forks.

Cold work uses B/J/E/D, three known inputs (canonical, nine-digit fallback and
calendar failure), both String modes, and eight fresh JVMs per cell: 192 JVMs.
Rotate all four routes through every position twice. Capture the first public
parse and actual process-completion duration. Validate known primitive fields or
error details afterward; do not call Instant.toString or initialize an oracle
formatter on a successful native cold path.

## Acceptance and stopping

Retain every row, order, failure and artifact. There is no warm-until-pass,
selective deletion, additional fork, pooled rescue or clock reset.

- Require exact outcomes/checksums, zero JNI/safety failures, normal build/test
  success and a correctly classified corpus. Java allocation must not grow by
  more than 1 byte/op on protected routes.
- Require block max/min <=1.10, tail/head median movement <=5%, allocation spread
  <=1 byte/op, unchanged measured compiler time and GC time <=10%. Failure is
  inconclusive; do not retry.
- Unchanged-work calibration must place both ratios within 0.97..1.03 with spread
  <=0.03. This is an engineering screen, not statistical equivalence proof.
- Canonical E must beat B by >=1.5x and J by >=1.25x in both paired cohorts, with
  >=90% less Java allocation. Mixed E must also remain competitive with J.
- Retain the conservative protected-workload rule: two losses above 3% are NO-GO;
  two positive losses within or straddling 3% are HOLD; conflicting directions
  are inconclusive. Apply it to E/D/M versus B, and E versus J on mixed input.
- For cold medians, E and D first-parse and process durations must remain within
  B + max(5%, 2 ms). Report all eight observations, not only medians.

NO-GO, HOLD or an inconclusive prerequisite does not justify default enablement.
At the end of this fixed scope, insufficient evidence means do not merge this
integration, rather than declaring the opt-in draft finished. A target-only pass
is still not native qualification of other platforms.

## Boundary and final integration

One authorized contained Linux job has a hard three-hour total, including setup,
all builds, checks, measurements, analysis and teardown; maximum four CPU
equivalents and 16 GiB, on the existing <=80 GiB filesystem. Allocate at most
90 minutes to three normal images, 30 to correctness, five to compiler forks,
20 to timing, five to cold work and 30 to setup/analysis/cleanup. Subcommand
limits do not extend the total. Verify process-tree teardown before execution.

Freeze the new runnable worker/controller and dry-run its schedule and rejection
paths before launch. Any material source, tool, count, flag or decision change
requires a new scope instead of silently modifying this one. Keep raw host data
and binaries local. Create no CI workflow or manual dispatch.

Only a worthwhile result permits the source change to default-on with the saved
startup-property opt-out. Normal automatic PR CI and actual native correctness
must then qualify each claimed target, including dependency/bootstrap/build
compatibility. Default-off CI does not qualify native Linux AArch64, macOS arm64
or Windows x64. Do not merge or claim those qualifications without evidence.
