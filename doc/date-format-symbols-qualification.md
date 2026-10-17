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
those architectures. The Java fixture is portable; a later native-performance
run needs its own reviewed platform supervisor. This Linux controller launches
no platform matrix.

No emulation, Shenandoah, HTTP client/server workload, binary handoff or unmanaged
installation is included. A missing required collector in Stage A is an
unqualified cell, not permission to omit it. Standard JDK tools and Python suffice;
there is no JMH dependency. Earlier full-profile results are context, not a
substitute for the exact-head reduced-profile correctness in Stage A.

## One executable entry, after execution authorization

The plan, Java fixture, measurement driver and new executable Linux supervisor
are **unexecuted source**. Static review does not validate their runtime behavior.
Their first compilation/execution belongs to the proposed milestone; a harness
failure stops it and is owned here. No build, test, benchmark, CI, installation,
PR or product-source edit is authorized by this source-only revision.

Use the **full immutable qualification commit published with this plan** for
`QUALIFICATION_REF`. The original clean checkout must already be at that exact
commit. Do not fetch or resolve a moving branch during execution. `QUAL_ROOT`
is a new dedicated directory without whitespace, outside the original checkout, on a local
filesystem with at least 20 GiB available. Use the already installed compiler,
mold, compatible boot JDK, jtreg and Python 3.9+ with Linux pidfd support; no tool
installation is part of this command. Start in the existing trusted toolchain
environment. The supervisor rejects ambient JVM injection and profile overrides.

```sh
python3 test/micro/org/openjdk/bench/java/text/DateFormatSymbolsQualificationSupervisor.py \
    --repo "$PWD" --candidate-ref "$QUALIFICATION_REF" \
    --root "$QUAL_ROOT" --boot-jdk "$BOOT_JDK" --jtreg "$JTREG_HOME"
```

This is the entire entry, including preparation, both builds, correctness,
measurement, analysis and cleanup. There are no manually supervised build steps
outside its clock. The supervisor copies its own source to the owned root and
verifies it against `git show` at the approved commit before proceeding. Git
metadata reads have ten-second limits; local clone and each checkout have
90-second limits, all inside the five-minute preparation phase. It makes a
local shared-object clone and two detached worktrees **inside** the root. New
Git metadata stays there; original source objects are borrowed read-only. There
is no fetch, install, patched module, binary handoff or old image reuse.

Both sides run normal `bash bin/configure-dev` with the following fixed options,
then `make CONF=dfs-qual JOBS=4 images`:

```text
--with-conf-name=dfs-qual --with-debug-level=release
--with-native-debug-symbols=none --with-jvm-variants=server
--disable-javac-server --with-boot-jdk=<owned boot launcher facade>
--with-jtreg=<installed jtreg> --with-jtreg-jdk=<owned boot launcher facade>
--with-jobs=4 --with-memory-size=8192
```

Disabling the build-only javac server prevents a persistent build daemon from
overlapping later phases. The repository's desktop/audio-free, x64-v3, mold,
Serial/G1/ZGC profile otherwise remains intact. The driver checks clean exact
source/image identities, product hash, allowed diff, native architecture,
reduced modules, server collectors and effective CPU/linker flags. Tool versions,
configure/build logs, full specs and image releases are retained before cleanup.

Configure rejects `JAVA_TOOL_OPTIONS`. For just those two configure commands,
the supervisor removes that variable and uses an owned launcher facade around
the installed boot JDK. Its `java`, `javac`, `jar` and `javadoc` scripts execute
the original installed tools with explicit temporary/home/PerfData options;
other installed files are symlinked read-only. This also covers configure's bare
`java -version`, `jar --help` and jtreg-version probes, which do not all use
`--with-boot-jdk-jvmargs`. No installed tool or class is modified or copied.
The generated launcher sources and installed boot release are retained. Both
normal builds use the same facade; measured JDKs are the new normal images,
with their own native launchers.

## Owned resources, deadlines and cleanup

The single Linux run has a **4h30m elapsed ceiling**, starting before root
preparation and every Git call. Fixed phase ceilings are preparation five
minutes, both builds 115 minutes, correctness 30 minutes, measurement plus its
analysis 105 minutes, final ledger analysis ten minutes, and cleanup two minutes.
The whole-run check reserves cleanup time; no phase resets that deadline. No
retry, resume, favorable-cell selection or runtime gate/budget override exists.
Exhaustion, a monitoring failure, interruption or incomplete cleanup yields
**inconclusive**, never a pass or product rejection.

All children inherit the same four available CPUs, at most four make jobs,
two jtreg workers, one measurement JVM at a time, four measurement workers,
`ActiveProcessorCount=4` and 512 MiB fixed measurement heaps. Compiler and GC
helper threads still exist. The supervisor samples its own plus all owned
resident memory every 0.2 seconds and stops above **8 GiB total RSS**. Shared
pages are conservatively counted in each process. It uses Linux subreaping and
`/proc` parent/start-time identities to retain descendants across double-fork
and new-session boundaries. pidfds prevent cleanup signals from hitting reused
PIDs. Successful command completion with a surviving descendant also stops the
run; builds, tests and measurement must not overlap. Completed adopted zombies
are reaped. SIGINT, SIGTERM and SIGHUP enter cleanup.

Additional storage, including both source/build trees, local Git metadata,
retained evidence, logs and caches, is limited to **20 GiB**. A background scan
runs every 30 seconds, must finish within ten seconds, counts the greater of
logical and allocated size, deduplicates inode identities, and follows no
symlinks. Disappearing temporary files/directories are tolerated. A final scan
runs before removing builds. HOME, all XDG cache/config/data/state paths,
TMPDIR/TMP/TEMP, Git administrative writes and ccache paths are contained in the
root; ccache is disabled and its ambient overrides are removed. Core dumps are
disabled and individual files have a 2 GiB hard limit. No virtual-address-space
limit is used because ZGC reserves a large address range.

The only inherited `JAVA_TOOL_OPTIONS` is supervisor-generated:
`-Djava.io.tmpdir="<root>/tmp" -Duser.home="<root>/home" -XX:-UsePerfData`.
This contains Java temporary files and home caches, including child JVMs in
tests, and prevents external hsperfdata growth. Setting environment HOME alone
does not reliably redirect Java's `user.home`.
Both images use identical options. Consequently startup claims apply to this
**PerfData-disabled** profile; they are not stock PerfData-enabled startup
claims. The driver requires the recorded live supervisor in its ancestor chain
and rejects any other JVM injection.

The RSS and directory checks are executable sampled limits, **not instantaneous
kernel quotas**: a short spike or create/delete burst between samples may be
missed, and sampling/scan overhead belongs to both sides' experiment. No maximum
instantaneous RSS/storage claim is made. A local filesystem, a responsive
scheduler and an otherwise idle host are prerequisites. SIGKILL, host loss or
an uninterruptible kernel operation cannot be made recoverable by a Python
supervisor; missing terminal/cleanup evidence is inconclusive. Do not silently
replace this protocol with an unmonitored run if those requirements fail.

On normal or exceptional completion, the supervisor freezes/kills only its
owned descendants, repeatedly checks identities and reaps them. A separately
bounded cleanup child removes only its marked root's baseline/candidate/Git,
boot facade, cache, temporary and home directories using symlink-safe deletion. It retains
controller source, command logs, correctness reports **and jtreg work files**
(including the final partial failed/hung test invocation),
raw measurements, build identities, resource ledger and decision. Cleaner exit
and remaining process/path identities are checked. Any remaining PID/path,
accounting uncertainty or deadline overrun prevents success. The outer
`decision.json`, not a measurement-only summary, is the milestone result.
Raw artifacts stay local; publication is limited to redacted identities,
reproduction commands and aggregate results needed for review.

## Exact-head correctness once for the new profile

Earlier full-profile 126-pass/one-skip and nine focused passes remain separately
attributed prior evidence. The materially different reduced module/collector/ISA
profile has an open exact-head correctness gate. The supervisor runs this broad
suite once on the new clean candidate image, with two jtreg workers:

```text
jdk/java/text/Format/DateFormat
jdk/java/util/Locale
jdk/sun/util/locale/provider
jdk/java/util/PluggableLocale
```

It requires the frozen totals 50/50, 56/55/one keyword exclusion, 6/6 and 15/15,
with no failures/errors; Locale's existing `SoftKeys.java` @ignore is not runtime
coverage. Then it runs `DateFormatSymbolsSharingTest`,
`DateFormatSymbolsSerializationAliasesTest` and
`DateFormatSymbolsConcurrentSerializationTest` once per explicit Serial/G1/ZGC,
one jtreg worker, requiring three passes per collector. The long-name summary
format is handled explicitly. Each invocation's report and work directories are
preserved before another test command can replace them.
The supported jtreg `-e:<name>` options explicitly forward `JAVA_TOOL_OPTIONS`
and owned HOME/temp/cache variables to agent/othervm tests and their descendants;
the protocol does not assume jtreg preserves arbitrary ambient environment.

A failure, missing ownership test, changed/extra skip, hang or deadlock stops
without retry. No baseline rerun of sharing identity assertions is needed:
baseline intentionally does not share arrays. Same-instance clone versus
serialization interleavings and callback behavior are **correctness coverage
only; no mixed concurrent clone/serialization performance claim is made**.

## Small representative fixed measurement matrix

The supervisor invokes the candidate's own driver. It compiles the same
standard-JDK fixture and footprint agent once locally against the new image,
then uses those artifacts on both freshly built images. There is no JMH or
external benchmark dependency. Source/image/tool identities, exact argv, partial
outputs and progress counts survive a failure.

There are **12 cells**, eight paired blocks per collector and two JDKs:
**576 primary JVMs**. Each warms for three seconds and records five one-second
samples. Case/collector order rotates; baseline/candidate order alternates by
block. Results escape through a ring. Four-worker cells share one phase
start/deadline and include the latest worker end, so aggregate ns/op includes
start skew; they do not measure individual call latency. Every fork/sample
remains in the record.

| Cell | Workers | Reason retained |
| --- | ---: | --- |
| `symbolsClone` | 1 | Ordinary shared-array clone and new monitor without source contention |
| `symbolsClone` | 4 | Independent sources with the same lazy-zone state as the next cell |
| `symbolsCloneShared` | 4 | Same trusted source contention |
| `symbolsCloneSerialized` | 4 | Same original untrusted fallback source after serialization; six arrays copied on each clone |
| `symbolsCloneZones` | 4 | Full initialized-zone deep copying while holding the same source monitor |
| `formatterNewLocale` | 1 | Normal locale construction, including the historical roughly 2.4% loss concern |
| `formatterNewSymbols` | 1 | Explicit-symbol construction |
| `formatterClone` | 1 | Consumer clone and its allocation benefit |
| `serializeFresh` | 1 | Construct plus first detachment/serialization |
| `serializeRepeated` | 1 | Original detached source serialized again |
| `calendarControl` | 1 | Unchanged construction control |
| `numberCloneControl` | 1 | Unchanged clone control |

The fallback cell always retains the original untrusted source, not a trusted
descendant. Serialization uses a fresh stream and tiny custom zones per
operation, preventing back-references or large payloads from hiding monitor
cost. The full-zone clone cell deliberately retains the expensive copy path.
Shared/independent trusted clone fixtures both leave zones lazy.

This halves the prior 24-cell timing matrix **before any run**. Ordinary symbol
construction B/op/cohorts are covered by the allocation probe rather than a
second constructor timing cell. Deserialized/subclass sources exercise the
same non-sharing copy branch and remain separate correctness checks; no
individual throughput claim is made for them. Additional uncontended fallback/
zone cells and reused multilingual format/parse timings are omitted from this
focused monitor/ownership decision; broad format/parse correctness remains.
No unfavorable measurement was removed: the historical locale constructor,
shared contention, full-zone clone, first/repeat serialization and both
unchanged controls all remain. This is a narrow qualification, not a general
java.text throughput claim.

There are **six allocation-only JVMs**, one per JDK/collector, measuring B/op
and retaining the 1,000-instance constructor/clone cohorts. There are **96
startup JVMs**: eight paired launches per JDK/collector, required packaged-image
CDS on, with noop and locale formatter-plus-clone entry. These are fresh
processes with ordinary warm filesystem caches, not cold-OS-cache starts.
CDS on must work without silent fallback; startup runs before primary timings
so incompatibility stops early. The earlier 720-launch startup matrix reduced
to these two representative entries; there is no CDS-off or symbols-only
startup claim. **Six separate diagnostic JVMs** record clone compilation/
inlining and native-memory summaries under shared four-worker cloning; their
timings are excluded from primary pairs.

Total: **684 Java launches plus one javac and one jar**, versus 1,884 Java
launches previously. Build/jtreg JVMs are covered by their earlier phase ceilings,
not hidden in this measurement count. Eight paired blocks are retained for all
cells; reducing duplicated workload dimensions avoids multiplying an exploratory
campaign while preserving each distinct changed branch and essential controls.

## Frozen loss-HOLD rule and decision

Use raw candidate/baseline ratios of each fork's five-sample median. Eight fork
pairs are the units; within-fork samples are not independent replicates. Report
all pairs, the geometric mean, number of positive-loss pairs, allocations and
20,000 fixed-seed paired-bootstrap descriptive 95% bounds. Bounds are **per
cell, not simultaneous or familywise guarantees**. There is no pooling across
collectors/cases/history, control subtraction or weighted throughput score.

1. Identity, required correctness, ownership and resource/cleanup gates are
   mandatory. Retained cohorts must be six arrays/46 slots versus baseline
   6,000/46,000, equal instance sizes and at least 99% lower six-array storage.
2. Normal DFS construction/clone B/op must improve at least 70%; both SDF
   construction paths and clone at least 10%. Other protected allocations may
   increase at most 1%. Timed cells use paired geometric means; allocation-only
   constructor checks use their separately reported single-probe ratios, with
   no timing claim or invented confidence bounds. Native-monitor memory is not
   counted as heap-array savings.
3. A protected cell is **HOLD for consistent loss** if at least seven of eight
   pair ratios exceed 1.0, **or** its descriptive lower bound exceeds 1.0.
   This rule is independent of a 2% ceiling: eight consistent 1% losses HOLD.
   Any other positive central geometric-mean loss also **HOLDs**. Passing
   requires a central ratio at or below 1.0 **and** an upper bound at or below
   1.02. A central non-loss with a wider bound is **HOLD for uncertainty**.
   Thus 2% limits uncertainty; it does not approve a measured slowdown.
4. The same central-loss/consistent-loss rules protect the formatter startup
   cell, with uncertainty upper ceiling equal to the larger of 5% or five
   milliseconds of the baseline median. Noop startup control bounds must lie
   within the corresponding ceiling in both directions. Operation control
   bounds must lie wholly within 0.95..1.05 and their allocation ratios within
   0.99..1.01. Control instability makes the result **inconclusive**; every raw
   loss/HOLD remains visible and is never adjusted away.

One outcome follows the fixed budget: **worthwhile on Linux x64** only when
correctness, identity, resources, cleanup, allocation and every protected
collector/cell pass; **not-qualified** for a demonstrated retained-cohort
failure; **HOLD** for measured loss, uncertainty or a missed allocation benefit
with valid controls; **inconclusive** for invalid controls, harness failure,
incomplete correctness or exhausted resources. A correctness failure blocks
integration and is reported by exact test/command, even when the outer outcome
is inconclusive. There is no automatic rerun. Historical results stay separate.

A worthwhile result can support a recommendation for the separately approved
PR/normal supported-platform correctness CI stage. HOLD is a plan/product
qualification hold, not an automatic product rejection or permission to widen
tolerances. Other native performance hosts remain optional separately scoped
claims, not prerequisites for this Linux decision.
