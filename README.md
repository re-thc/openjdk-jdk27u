# Latin-1 StringZilla scan evidence, 2026-10-20

This branch retains host evidence separately from the focused product PR. There
are no JDK images, test libraries, JMH jars or other compiled binaries here.

Start with the [full C2 table](qualify/c2-avx2/SUMMARY.md), the selected
[C1](tier/c1-avx2/SUMMARY.md) and [interpreter](tier/int-avx2/SUMMARY.md) tables,
and [fresh-process latency](COLD-SUMMARY.md). Each hot table includes every
measured loss, with raw iteration data and launch logs alongside it.
[Final tests](final-test-summary.txt), [jtreg reports](final-jtr),
[independent reviews](kernel-final-review.txt) and the
[excluded exploratory screen](screen/c2-avx2/SUMMARY.md) are retained separately.
TEXT-MANIFEST.json records SHA-256 for the copied text payloads.

Final selected values and all-tier counts are in REPORT-TABLES.md. The refined
candidate recovers repeated empty/unchanged trailing-strip costs against its
preserved predecessor, with large bulk gains and explicit remaining short and
probe-edge losses. Independent final review supports a focused draft for long
Latin1 workloads. It does not establish an application-wide or startup win.
The complete initial fixed study, loss classification, direct-old comparisons
and every measured loss remain available.

The unchanged baseline is PR4 integration commit
7048d6f2c74e25737850789812da063900ec18c0. The final candidate runtime source is
c881f89fb5cde1a5ec20fcf22adb0faa849303f6. Exact src tree, image hashes,
benchmark source identity, JMH jar hashes,
configuration and host details are in the identity/qualification-start files.
The vendor remains StringZilla 5.3.0 at 86d73f1021e6cce022c3cceb1f7837eb50338774.
final-candidate.patch contains the exact source/test delta; benchmark/ contains
the unchanged measured JMH source. qualification-finish.json proves frozen
images, source, benchmark, hints and dependencies remained unchanged.

The C2 full matrix has 154 rows (24 whitespace workloads x5 APIs and 17 line
workloads x2 terminals). C1 and interpreter use a declared 77-row subset. Each
has five alternating base/candidate/off rounds. C2 also includes the preserved
pre-refinement candidate image as a fourth control, with order
base/candidate/old/off and its reverse. Direct old/candidate paired ratios and
every direct-old loss are retained as well. Each row uses its median of
three 100 ms JMH samples following two 100 ms warmups. Summaries report the median
of same-round base/candidate ratios, the paired min/max range, every row and
every measured loss. These ranges are not confidence intervals. No geometric
aggregate is used. All cases are synthetic public operations on this one host.

Each outer JVM is fresh and runs a fixed-order, profile-conditioned sweep.
JMH 1.37 runs with -f0 and exact standard compiler hints and blackhole flags
obtained through public CompilerHints.addCompilerHints. PrepareJmhHints.java
copies its generated file before helper exit; base/candidate contents are
byte-identical. The retained file hash is
fad54f45959d8e6e31caa57e8ca258a41bdac9ec5b0adf6fa2cfad3f2fb8a3a7.
Compilation traces verify native scan and compiler-blackhole activation during
warmup. Do not reinterpret these sweeps as isolated per-case fork measurements.
The test JVM is pinned to CPU 1, uses 256 MiB heap, SerialGC and UseAVX=2.
C2 runs all 154 cases per outer process; C1/interpreter run the 55 whitespace
and 22 line cases as separate outer processes.
C2 is selected with -Xbatch -XX:-TieredCompilation; C1 with -Xbatch
-XX:TieredStopAtLevel=1; interpreter with -Xint. The off control uses the same
candidate image with -XX:-UseStringZillaIntrinsics. Missing/duplicate cases,
wrong samples, nonfinite values, missing rounds/triples and hint parsing errors
fail the runner/summary rather than silently omitting results.

ColdScans times only the public API call after operation dispatch and input
construction, with result boxing/consumption after the timer. Nine interleaved
fresh-process repeats retain operation and complete process elapsed times.
These measure first-call latency with ordinary OS cache state, not isolated
StringZilla initialization or cold disk startup.

The exploratory screen in screen/c2-avx2 used the initial eight-byte probe,
under source8 identities. Native test preparation continued on other CPUs;
that screen is excluded from qualification. Its 77 rows and every loss remain
retained. They motivated a 32-byte probe and immediate-return Java polish.
The product benchmark retains 8/9-byte controls alongside 32/33-byte boundaries.
source8 contains the corresponding original scripts, benchmark source, image
identity and successful test evidence. Workload names probeAt/probeAfter denote
the then-current 8/9 boundary there and 32/33 in final qualification.

source32 preserves the entire first fixed study at runtime a5576dd33ea and
assertions at 4aa7d23, including all tier/cold results and 127 jtreg reports. It
exposed 44 C2 rows below 0.95x: 13 native probe-edge paths and 31 paths without native
setup. Its loss classification and SOURCE32-ASSESSMENT.md explain the planned
refinement. A selected-case diagnostic showed hot inlining; missed inlining
was not established as the cause. The final source shares short/probe loops
and outlines only continuations after 32 successful probes, retaining the same
native admission boundary. The preserved old image provides a direct C2
comparison instead of comparing separate studies.

source32-image-identity.json records that the preserved old image matches all
four pre-study runtime hashes. make test refreshed only its release metadata
after the earlier identity capture; the actual post-test release text/hash is
retained explicitly. Final candidate identities were captured after tests.

Both normal test groups passed on each implementation stage: 98 String and 29
applicable string-intrinsic descriptions, with 2 platform skips. tests-final.log
retains the first 32-byte-probe results; tests-outline.log and final-jtr retain the
exact final results. Native ASan/UBSan tests cover
all executable tables, every Latin1 value, alignment, exact allocation ends and
pre-read bounds. The native adapter sources and libjava/libjvm image hashes did
not change during Java-only polishing. Independent source and method reviews
are retained; reviewers did not run the build or benchmark jobs. An initial CLI
review could not open its read-only application state; the independent agent
review completed through the available read-only workflow.

One candidate build attempt was interrupted to change job count. Its orphaned
child make continued, producing an overlapping relink error while loopnode.o
was being written. The exact old process group was verified and stopped;
active output objects and the known raced object were removed, all remaining
ELF section bounds were validated, and a single successful build completed.
The later polished image was rebuilt and the normal tests rerun successfully.
The final build and image hashes identify the images actually qualified.
All build attempts, including this recovery, are retained.

A 04:48 UTC connection notice did not interrupt the final study. The original
session and runner ancestry were confirmed alive, with advancing interpreter
results; no sweep was restarted. See connection-continuity.txt.

Repository ordinary hosted CI filters PR bases to master. The focused follow-on
is stacked on PR4, so platform CI awaits retargeting after that dependency.
No manual hosted performance campaign was dispatched, no infrastructure or
security settings changed, and neither a merge nor force push was performed.
No AArch64, Windows or default AVX-512 performance qualification is claimed.

Reproduction uses the repository-managed JMH 1.37 dependencies, the retained
source/commands, two same-base complete images and the retained hint generator.
Paths in scripts and launch events are exact host paths; adjust the checkout
roots deliberately on another machine. Keep binaries outside the product PR.

Both images were configured after sourcing the existing toolchain activation
script, with this command in their respective checkout roots:

```sh
bash bin/configure-dev --with-conf-name=scans --with-jobs=4 \
  --with-debug-level=release --with-boot-jdk=/workspace/toolchains/jdk27 \
  --with-jtreg=/workspace/toolchains/jtreg83 \
  --with-toolchain-path=/workspace/toolchains/gcc16/bin \
  --with-extra-ldflags='-B/workspace/toolchains/mold/bin'
make CONF=scans JOBS=4 images
```

The final normal test command in the candidate checkout was:

```sh
make CONF=scans JOBS=4 test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/hotspot/jtreg/compiler/intrinsics/string' \
  'JTREG=JOBS=2;TIMEOUT_FACTOR=4'
```

JMH dependencies use the versions recorded by the repository's normal build
configuration and benchmark-identity.json. Compile the retained hint helper and
the product benchmark with JMH's annotation processor; generate base/candidate
hint files before launching the scripts. qualify-all.sh records the hot and
cold run sequence; summarize-cold.py validates the completed cold matrix.
