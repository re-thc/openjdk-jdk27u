# One qualification milestone for DateFormatSymbols sharing

Status: prepared, not executed. No build, test, benchmark, CI job or installation
was launched while preparing this milestone. Source review found no further
ownership defect requiring a product change. Approval to publish the source
review did not qualify its performance or authorize this execution.

## Identity and evidence carried forward

The reviewed public product revision is
`df0eeea79e4b568ed16051974d66485421ea5dd9`, on
`review/date-format-symbols-sharing` in `re-thc/openjdk-jdk27u`. Its parent and
comparison baseline is `89885a6288e7aaabd01678a704a586272c0f96e3`.
The product file `src/java.base/share/classes/java/text/DateFormatSymbols.java`
has SHA-256 `792c0be285752dfa60844a71b9447e48bac42c8dea245d875a2f024544651e47`.
The published product and three regression tests are byte-identical to the
repaired local revision `bbb4a355aa404f19c07563e63eaa73d2c1d6f600`.
Only qualification source and documentation are added after the public product
revision; the product hash is frozen by the driver. Execution qualifies the new
exact approved qualification commit, which must descend from that public product
revision, rather than pretending the new harness existed in `df0eeea`.

| Evidence | What it establishes | What it does not establish |
| --- | --- | --- |
| Normal full upstream-profile build of the repaired development tree; 126 locale/formatter passes and one skip | Source-equivalent Linux x64 correctness, including providers and zones | A clean build of the eventual qualification commit or another platform |
| Three focused tests under each of Serial/G1/ZGC, nine passes | Getter/setter, clone, subclass, serialization-alias and controlled concurrent-clone coverage | Performance of the new monitor |
| Baseline pass, original-sharing failure, repaired pass with escaped-array identities | The new alias was real and the monitor repair closes that interleaving | A general atomic-snapshot guarantee for concurrent setters |
| Repaired allocation-only runs under all three collectors | Six arrays/46 slots per 1,000 ordinary constructors or clones, versus 6,000/46,000; unchanged instance sizes; 56 B/op Serial/G1 and 88 B/op ZGC for normal DFS construction/clone in those configurations | Whole-process memory, native monitor memory, startup or throughput |
| Earlier grouped performance runs and the bounded 64-fork follow-up, on pre-monitor sharing revision `91d93360253fab9b37ea3102652b6a9757560745` | The original roughly 2.4% Serial formatter-construction loss remains evidence; the follow-up was inconclusive after unchanged controls | Qualification of the repaired clone path or a throughput improvement |
| Nine grouped fresh-process runs per collector, on that same earlier revision | Historical exploded-image startup observations only | Repaired startup, packaged-image CDS startup, or another platform |

The saved runtime release identifies a development-tree build (`ef41a71a5a8c+`),
so these results are carried by exact source/test identity, not mislabeled as a
clean published-head build. Old timings are retained locally and are never
pooled with the new experiment. Historical startup medians in milliseconds were
119.509 to 120.667 (Serial), 123.557 to 120.986 (G1), and 156.421 to 156.595 (ZGC);
they were grouped executions with warm filesystem caches, not interleaved pairs.

## Staged decision and dependencies

**Stage A is the one proposed execution milestone:** settle exact-head
correctness and benefit on the suitable available Linux x64 host, using this
fork's `bin/configure-dev` profile. It is a release, desktop/audio-free build,
Serial/G1/ZGC only, with `-march=x86-64-v3 -mtune=generic` and mold. The available
host advertises the required v3 feature flags and already has GCC 16, mold,
boot JDK 27, jtreg 8.3 and Python. A quiet resource window on this existing host
and execution authorization are the only mandatory dependencies for Stage A;
no additional architecture-specific hardware or tool installation is required.

One Stage A authorization covers normal paired builds, exact-head profile
correctness, the entire fixed measurement budget, analysis and one recommendation.
It does not create a PR, merge, dispatch CI, install tools, change a tolerance,
or authorize rerunning an unfavorable result. A source defect or an inconclusive
result ends the milestone with an explicit decision, not another experiment.
I own the driver/fixture, build orchestration, evidence mapping, interpretation
and any defect in this prepared qualification source; these are not dependencies
for the user to solve.

**Stage B is conditional and separate:** if Stage A is worthwhile, proceed to
normal supported-platform correctness CI through a separately approved PR.
The supported matrix remains Linux x64/AArch64, macOS arm64 and Windows x64,
with Serial/G1/ZGC. That later CI correctness gate can inform integration without
requiring four native performance hosts first. No PR or CI action is authorized
by this source-planning continuation or by the proposed Stage A execution.

Native AArch64, macOS arm64 or Windows x64 performance is a distinct optional
claim requiring separately available matching hosts and installed compatible
tools. Their absence does not block a useful Stage A Linux result and is not
listed as a mandatory hardware dependency. Do not generalize a Linux gain to
those architectures. The portable runner can serve such a later explicitly
scoped run; it does not automatically launch a platform matrix.

No emulation, Shenandoah, HTTP client/server workload, binary handoff or unmanaged
installation is included. A missing required collector in Stage A is an
unqualified cell, not permission to omit it. Standard JDK tools and Python suffice;
there is no JMH dependency. Earlier full-profile results are context, not a
substitute for the exact-head reduced-profile correctness in Stage A.

## Resource and execution ceiling

Stage A: at most four make jobs, two jtreg workers, one measurement
JVM at a time, four measurement workers, `ActiveProcessorCount=4`, 512 MiB fixed
measurement heaps, 8 GiB total resident-memory budget and 20 GiB additional
source/build/output storage. Compiler and GC helper threads exist in addition
to the four measurement workers. `ActiveProcessorCount` and configure's memory
setting are ergonomics inputs, not OS resource limits. The execution owner must
monitor total RSS/storage and stop on an overrun. Use an otherwise idle host;
builds, tests and measurements never overlap there. This milestone uses one
native host; there is no automatic multi-platform campaign.

The total Stage A ceiling is six host-hours, starting before checkout/configure:
two hours for both normal builds, 30 minutes for exact-head profile correctness,
3h15m for the driver, and 15 minutes for analysis. There are no retries/resumes.
A ceiling exhausted before a complete valid result is an environment/resource
limit and an inconclusive Stage A outcome, not a pass. Raw artifacts stay local;
publish only redacted identities, commands and aggregate results needed for review.

## Exact preparation and build commands, after execution authorization

Use the **full immutable qualification commit reported with this plan** as
`QUALIFICATION_REF`; do not resolve a moving branch at execution time. The driver
records it and rejects a changed product, unrelated product variants, dirty
source trees or images whose release does not identify the pinned checkout.
`QUAL_ROOT` must name a new dedicated directory with the resource budget above.
Use the existing installed toolchain environment, with GCC 16 and mold on
`PATH`, and set installed `BOOT_JDK` and `JTREG_HOME`. Do not invoke dependency
installation scripts. The same environment is used for both builds.

```sh
: "${QUALIFICATION_REF:?set the approved full qualification commit}"
: "${QUAL_ROOT:?set a new dedicated qualification directory}"
: "${BOOT_JDK:?set the installed compatible boot JDK home}"
: "${JTREG_HOME:?set the installed compatible jtreg home}"
unset JAVA_TOOL_OPTIONS JDK_JAVA_OPTIONS _JAVA_OPTIONS LD_PRELOAD DYLD_INSERT_LIBRARIES
unset CONFIGURE_DEV_NO_MOLD
BASELINE_REF=89885a6288e7aaabd01678a704a586272c0f96e3
git worktree add --detach "$QUAL_ROOT/baseline" "$BASELINE_REF"
git worktree add --detach "$QUAL_ROOT/candidate" "$QUALIFICATION_REF"
for tree in baseline candidate; do
    (
        cd "$QUAL_ROOT/$tree" || exit 1
        bash bin/configure-dev --with-conf-name=dfs-qual --with-debug-level=release \
            --with-native-debug-symbols=none --with-jvm-variants=server \
            --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
            --with-jobs=4 --with-memory-size=8192 || exit 1
        make CONF=dfs-qual JOBS=4 images
    ) || exit 1
done
```

Use the same installed compiler/linker, boot JDK, configure options and ordinary
repository build on both sides. Record their identities and effective options.
Do not copy classes, patch modules, reuse the old exploded image, tune inlining,
override the repository's v3 ISA profile, alter CDS archives, or apply other
date-parser prototypes. The driver checks the selected profile and image OS/
architecture, rejects ambient JVM-option injection, and records exact argv.
The owner enforces the phase/whole-platform time ceilings during these commands.

## Exact-head correctness, once for the new profile

The existing 126-pass/one-skip and nine focused passes carry as prior source
correctness evidence. Do not repeat the old upstream/full-profile configuration.
Stage A uses a materially different reduced native module/collector/ISA profile,
so run the broad suite once and the three focused tests once per explicit
collector against its new clean candidate build. This closes an open exact-head
profile gate, rather than rerunning already completed checks for activity. Keep
all prior results separately attributed.

From the candidate checkout, after its normal profile build:

```sh
make CONF=dfs-qual JOBS=4 test \
    TEST='jdk/java/text/Format/DateFormat jdk/java/util/Locale jdk/sun/util/locale/provider jdk/java/util/PluggableLocale' \
    JTREG='JOBS=2;TIMEOUT_FACTOR=4;JAVA_OPTIONS=-XX:ActiveProcessorCount=4 -Xmx512m' || exit 1
for gc in Serial G1 Z; do
    make CONF=dfs-qual JOBS=4 test \
        TEST='jdk/java/text/Format/DateFormat/DateFormatSymbolsSharingTest.java jdk/java/text/Format/DateFormat/DateFormatSymbolsSerializationAliasesTest.java jdk/java/text/Format/DateFormat/DateFormatSymbolsConcurrentSerializationTest.java' \
        JTREG="JOBS=1;TIMEOUT_FACTOR=4;JAVA_OPTIONS=-XX:ActiveProcessorCount=2 -Xmx512m -XX:+Use${gc}GC" || exit 1
done
```

A failure, missing ownership test, unexpected skip, hang or deadlock stops the
platform and is not retried. A known pre-existing skip stays recorded; a new
skip cannot be counted as coverage. No baseline rerun of the candidate's sharing
identity assertions is needed: baseline intentionally does not share arrays.

## One frozen measurement command

For Stage A, use `linux-x64`. The other runner platform identifiers are only
for a later separately scoped native-performance claim, not required here.
From the candidate checkout:

```sh
python3 test/micro/org/openjdk/bench/java/text/DateFormatSymbolsQualification.py \
    --baseline-source "$QUAL_ROOT/baseline" \
    --candidate-source "$QUAL_ROOT/candidate" --candidate-ref "$QUALIFICATION_REF" \
    --platform linux-x64 --out "$QUAL_ROOT/results"
```

The source-only fixture/driver have not been compiled or executed. Their first
compilation and fixture assertions are part of the authorized milestone; a
harness failure belongs to the owner and stops measurement. Output must not
already exist. The driver compiles the same standard-JDK harness locally once
and runs that artifact against both locally built images.

There are 24 `(case, worker-count)` cells, eight paired blocks per collector,
and two JDKs: **1,152 primary fresh JVMs**. Each warms for three seconds, then
records five one-second samples. Case/collector order rotates and baseline/
candidate order alternates by block. Each fork holds its outputs in an escaping
ring; four-worker results use one common phase start/deadline and the latest
worker end, so worker start skew is included. They are aggregate throughput
expressed as ns/op, not individual call latency. Every sample/fork remains in the record.

The protected cells include normal DFS construction; lazy-zone clones with one
worker, four independent sources and four workers sharing one source; original
post-serialization, deserialized and subclass clone sources with one/four
workers; initialized full-zone clones with one/four workers; locale and explicit
symbols SDF construction; SDF cloning; reused text formatting/valid parsing in
US/Japanese locales and invalid parsing; new-plus-first serialization and repeat
serialization. Fallback clones always use the original fixture, not a trusted
descendant. Serialization uses a fresh stream each operation and a tiny custom
zone table, so back-references or large zone payloads cannot hide monitor cost.
Formatting/parsing use thread-private UTC formatters. Calendar construction and
NumberFormat cloning are unchanged controls.

There are **six allocation-only JVMs**, one per JDK/collector, retaining the
1,000-instance constructor/clone cohorts. There are **720 startup JVMs**: 20
paired launches for each JDK/collector, CDS off/on, and noop/symbols/formatter-
clone entry. These are fresh processes with ordinary warm filesystem caches;
no privileged cache dropping or startup-sample exclusion occurs. CDS on is
required to work with the normal packaged images; there is no silent fallback.
The startup block runs before the primary timing block so an archive mismatch
stops early without adding a preflight or consuming the main fork budget.
Finally, **six separately labeled diagnostic JVMs**, one per JDK/collector,
record clone compilation/inlining and native-memory summaries under four-worker
shared cloning. Their timings never enter the primary pairs. Total: **1,884
explicit Java invocations plus one javac and one jar invocation** in the
measurement driver. Ordinary build and jtreg JVMs belong to their separately
bounded earlier phases, not this measurement count.

## Frozen gates and the one decision

These are proposed conservative integration budgets, accepted or changed
**before** execution. Use raw candidate/baseline ratios of fork medians;
20,000 fixed-seed paired bootstrap resamples give descriptive 95% bounds.
Within-fork samples are not independent replications. Report all individual
pairs, allocation results and intervals; there is no pooling across platforms,
collectors, cases or historical experiments and no throughput weighting that
can hide a protected regression.

1. Identity, required correctness, ownership isolation and resource ceilings
   must pass. Retained cohorts must remain six arrays/46 slots versus baseline
   6,000/46,000, equal instance sizes and at least 99% lower six-array storage.
2. Normal DFS construction/clone allocation must improve at least 70%; SDF
   construction (both paths) and clone at least 10%. Other protected operation
   allocation must not increase more than 1%, using paired geometric mean ratios.
   Native-memory diagnostics remain separate: do not claim whole-process or
   native-monitor memory savings from these heap-array numbers.
3. Every protected operation/collector must have its raw time-ratio upper bound
   at or below **1.02**. A stable 2.4% loss would fail this budget. Shared and
   independent clone results both count; comparison diagnoses contention but
   does not excuse it. A lower bound above 1.02 is a demonstrated regression;
   an interval straddling 1.02 is inconclusive, not a cleared cost.
4. The unchanged time-control intervals must lie wholly within 0.95 to 1.05,
   and their paired allocation ratio must stay within 0.99 to 1.01. Control
   drift makes measurement eligibility inconclusive, with raw exceeded-budget
   cells still reported; never subtract it to erase a raw regression.
   Startup upper bounds must stay within the larger of 5% or five milliseconds
   of the baseline median. The noop control must satisfy the corresponding
   bound in both directions; unstable controls mean inconclusive.

After the fixed budget, give Stage A one outcome: **worthwhile on Linux x64**
if exact-head profile correctness, resources and all three collectors' measurement
gates pass; **not worthwhile** for a correctness/ownership/retained-cohort failure
or a protected regression with valid controls; **inconclusive** when intervals,
invalid controls or resources prevent a conclusion. Hard ownership/cohort
failures remain failures even with noisy controls. Keep every raw ratio; invalid
controls do not excuse a regression as a pass. The runner deliberately leaves
final qualification pending correctness/profile/resource ledger review.

If worthwhile, recommend the separately approved PR/normal CI correctness stage,
with performance claims explicitly limited to this Linux profile and workloads.
If not worthwhile or inconclusive, retain the review branch and give a concrete
reject/hold decision with failed or unresolved cells. Neither the absence of
other native performance hosts nor a wish for another favorable sample creates
an automatic rerun requirement. Broader native performance can be a separate
future claim; it is not a prerequisite to this useful staged decision.
