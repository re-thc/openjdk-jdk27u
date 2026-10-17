# Rust regex: reproducible build and qualification

This branch contains the complete default-on Rust regex integration, native-only
Matcher reset/reuse tests, the bounded checksum-verified benchmark dependency
resolver, and qualification tools. Unsupported expressions, flags, inputs and
native allocation failures retain the Java implementation. Intrinsic entry points
are preferred, with JNI fallback; no FFM is used. Public APIs remain unchanged.

The additional source and orchestration checks do not establish runtime or
performance qualification of this branch. In particular, do not reuse old green
CI runs or historical JDK images as evidence for this source. The commands below
are reproducible instructions, not a claim that they have been executed.

## Setup failure and current readiness

[Run 38877016730, job 116923096313](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38877016730/job/116923096313)
checked out merge `fb84d06d6fa6e115a5898600c89003fd7aab6335` (head
`cefdcf2ae47bfdcf79a2873512d252e8ad3a8a3d`, base
`758f41576fc79d35a62a3896dbe5ab97c448c436`). Bundles downloaded successfully;
the first Maven request returned HTTP404 and curl exit 22 before javac. The
coordinate was correct. The failed response did not preserve enough provenance
to identify an origin/CDN/proxy cause. This was a preparation failure, with no
regex correctness or performance observation from the failed job.

The reviewed repair in `1338b21a761ff605c161e335d0dacfce4de4d0c2` already added
checksum pins, bounded retry of HTTP404, HTTPS-only fallback and partial-file
promotion. Those coordinates, pins and curl limits are preserved in the shared
`make/scripts/prepare-rust-regex-benchmarks.py` entry point below. CI and local
qualification now compile the same full source catalog. A failed preparation
retains `preparation.json`; successful preparation binds source and classpath
hashes. Extra JARs, corrupt cached inputs, incomplete compiler output and reuse
of a prior preparation attempt fail before measurement. Local checked copies of
the four JARs can be reused after hash verification.

Run the source regression suite without network or Java processes:

```sh
python3 -B -m unittest discover -s make/scripts -p 'test_*rust_regex*.py' -v
```

Curl and javac are mocked in these tests; file hashing, fallback/error control
flow, source selection, result validation and summaries are exercised. Passing
these tests does not validate Java compilation, hosted dependency delivery or
runtime behavior. The entire qualification below and latest-head PR CI are still
required. CI's focused `review` matrix alone is not the complete campaign.

## Build inputs and images

Use the normal [OpenJDK build requirements](building.md), a suitable boot JDK,
JTReg, and Rust 1.85 or newer. The Rust dependencies and lockfile are in
`src/hotspot/share/runtime/rustregex`; no private handoff files are required.
The examples below target Linux x86-64 with four build jobs. Set
`REGEX_BOOT_JDK` and `REGEX_JTREG` to installed tool directories.

```sh
bash configure --with-conf-name=regex-review-release --with-jobs=4 \
  --with-debug-level=release --enable-rust-regex \
  --with-native-debug-symbols=internal \
  --with-boot-jdk="$REGEX_BOOT_JDK" --with-jtreg="$REGEX_JTREG" \
  --disable-desktop --enable-headless-only
make CONF=regex-review-release JOBS=4 images test-image

bash configure --with-conf-name=regex-review-fastdebug --with-jobs=4 \
  --with-debug-level=fastdebug --enable-rust-regex \
  --with-native-debug-symbols=internal \
  --with-boot-jdk="$REGEX_BOOT_JDK" --with-jtreg="$REGEX_JTREG" \
  --disable-desktop --enable-headless-only
make CONF=regex-review-fastdebug JOBS=4 images test-image
```

For a true original-Java control, create a separate worktree at upstream source
`89885a6288e7aaabd01678a704a586272c0f96e3` and build a release image using the same
toolchain and standard configure flags. Omit `--enable-rust-regex`, which is not
an option in that upstream source. This is distinct from disabling the integrated
engine at runtime. The disabled control uses the candidate image with
`-XX:-UseRustRegex`; the JNI control uses it with
`-XX:-UseRustRegexIntrinsics`. Never pass those Rust-specific VM flags to the
unmodified upstream image.

Freeze the commit/tree, compiler and Rust toolchain, build flags, all runtime
native libraries, modules, configuration, benchmark classes and dependency hashes
before timings. A matching regex class overlay can isolate Java dispatch on a
shared VM, but does not establish original-JDK startup, size or retained memory.
Current release and fastdebug images and the same-base upstream release image
are required for complete new-head qualification.

## Correctness before measurement

Run both candidate images against the complete current test inventory:

```sh
"$REGEX_JTREG/bin/jtreg" \
  -jdk:build/regex-review-release/images/jdk \
  -nativepath:build/regex-review-release/support/test/jdk/jtreg/native/lib \
  -conc:2 -timeoutFactor:4 \
  -w:build/regex-review-release/jtreg-work -r:build/regex-review-release/jtreg-report \
  test/jdk/java/util/regex test/jdk/java/util/Scanner test/jdk/java/lang/String
```

Repeat with `-jdk:build/regex-review-fastdebug/images/jdk` and separate work/report
directories. Retain every test result and framework assertion; historical test
counts are not a substitute for the current inventory. Existing annotations cover
the interpreter, C1, C2, forced JNI, disabled engine and compact-string settings.
The native-only reset/reuse sequences deliberately avoid end-flag replay; public
end flags are compared with fresh Patterns for find, lookingAt and matches.

`RustRegexTest` includes fixed-seed prefix/email cases. The repository-backed
`RustRegexStateSequences` adds regions, mutable inputs, captures, snapshots,
find/matches/lookingAt continuation and usePattern backend transitions against
the original Java parser. It also runs without the Rust-only fields/constructor
on the upstream image and emits a deterministic semantic SHA256. Compile this
repository source once and require the count and digest to agree across the
upstream image and every candidate mode; never pass Rust-specific VM options to
the upstream image. Keep Unicode, empty/partial input, syntax-error,
allocation-budget, sharing and in-flight GC/promotion coverage intact.

From the production Rust crate directory, run:

```sh
cargo fmt -- --check
cargo test --locked --offline --lib
cargo clippy --locked --offline --all-targets -- -D warnings
```

The ignored `costs::integration_costs` test is a separately invoked diagnostic,
not a correctness test silently skipped from a correctness gate.

## JMH dependencies and compilation

Use JMH 1.37, jopt-simple 5.0.4 and commons-math3 3.6.1. The exact four
coordinates and SHA256 pins are in `make/scripts/prepare-rust-regex-benchmarks.py`.
This is the same resolver and complete source catalog used by the workflow's
`Prepare focused benchmarks` step. It retains the reviewed two Maven Central
hosts, two retries of all transfer errors, one-second delay, 30-second retry
window, ten-second connect and twenty-second transfer caps. A checksum mismatch
is terminal and never falls back. Normal configured unauthenticated proxy routing
may be needed; do not put credentials or proxy values into logs.

Use a new output directory. Verified existing JARs may be copied to its `lib`
subdirectory first; they are hashed again before compilation. No arbitrary JAR
or classes directory can be mixed into the prepared inputs. This command invokes
javac and requires compilation authorization; it does not run the benchmarks:

```sh
python3 make/scripts/prepare-rust-regex-benchmarks.py \
  --java-home build/regex-review-release/images/jdk \
  --output build/regex-bench --time-budget 600
REGEX_JMH_LIB=build/regex-bench/lib
```

The six helpers, every `RustRegex*` JMH class and the Java fallback benchmarks
are compiled together with annotation processing where needed. The workflow
leaves sixty seconds within its ten-minute step for source checks and cleanup,
using a 540-second preparation deadline. Preparation errors, including compiler
failure or missing generated JMH metadata/classes, produce a terminal receipt.
The CI results artifact includes this receipt even if preparation fails.

The state/lifetime benchmarks use public regex APIs and support the upstream
control. `RustRegexCosts` is a candidate-only decomposition of the reported
17-character miss; its raw/adapter/MethodHandle paths do not implement all public
Matcher semantics and cannot establish a universal Rust/Java speed ratio.

## Paired warmed qualification

```sh
python3 make/scripts/benchmark-rust-regex.py \
  --java build/regex-review-release/images/jdk/bin/java \
  --reference-java "$REGEX_UPSTREAM_JDK/bin/java" --include-jni \
  --classpath "build/regex-bench/classes:$REGEX_JMH_LIB/*" \
  --suite qualification --pairs 2 --tiers interpreter C1 C2 \
  --cpus 0 1 2 3 \
  --process-timeout 900 --time-budget 36000 \
  --output build/regex-bench/qualification
```

This includes short/tiny routing, threshold boundaries, captured state, all three
matching operations, all protected fixed-count anchored cases, continuation,
candidate density, Java fallback grammars, digit forms and complete shared/cold
lifetimes at 1/8/9/10/16/32 calls with one/four workers. It uses the prior full
qualification windows: two 200 ms warmups and three 200 ms measurements. Cold
lifetimes retain ten warmup and twenty single-shot iterations. The existing CI
`review` suite retains its 300 ms windows.

Controls alternate forward/reverse order in fresh serial JVMs. Read the explicit
`control` field: original, disabled, native and jni. The legacy `enabled` boolean
is retained for native/disabled only; it is null for the other controls. Keep JVMs
as statistical units, report all rows and paired uncertainty, and do not pool
within-JVM iterations as independent samples. The shared CI/local summary
keeps benchmark methods, score units, controls and paired JVM observations
separate; its ratios use only matching pair identifiers. Two pairs can leave wide intervals;
do not add favorable-only repetitions or claim that every case wins.

Choose worker CPU indices available in the execution environment; the displayed
set is an example, not a universal topology. Affinity is bound into the session
and verified in each scored child. Keep the controller on a separate available
CPU. One-worker and four-worker lifetimes use separate cohorts and the intended
number of worker CPUs, rather than mixing both settings on a single pinned core.

These control names describe policies, not every operation's actual route.
Managed plans can complete a search without entering Rust, and end-flag replay
can permanently promote a Pattern to Java during setup. Keep those rows, classify
their observed routes in separate diagnostics, and do not present all
native-enabled rows as native-engine throughput. Fresh first-observation costs
remain separate from repeated warmed Matcher use.

The runner binds runtime/configuration/classpath contents and the execution
policy, verifies the full parameter/method Cartesian product, and preserves
terminal failures. Its JMH 1.37 result contract requires the requested mode,
thread/fork counts, warmup/measurement iterations, batch sizes and windows, plus
nonempty JVM/version metadata and the expected JVM arguments. Primary metrics
must contain a positive finite score, the declared `ns/op` unit (`us/op` for
lifetimes), and one finite nonnegative raw series with exactly three measured
iterations, or twenty for cold single-shot lifetimes. Missing fields, wrong
units, truncated/empty sample arrays, duplicate JSON keys and nonstandard numeric
constants fail before ingestion. The checked-in synthetic avgt/ss fixtures are
schema tests with fictional numbers, never timing evidence.

Resume and CI summaries use the same complete-process validation. The session
receipt seals the original metadata by SHA256; the metadata also binds the
execution policy. Every result record binds that metadata and its command
receipt by content hash. Resume requires both original receipts, checks all
completed raw files/records/commands before starting a child, and rehashes the
current JDK, native libraries, configuration, runner and classpath before skipping
measurements. Missing provenance is never regenerated; changed contents at the
same paths, malformed outputs and unrecorded attempts stop the session. Old
results without these receipts remain historical evidence and cannot be promoted
to qualified results by filling fields retrospectively. Frozen summaries can be
read after archival without launching or accessing the original JDK.

The total monotonic budget includes resume gaps. Summaries reject inconsistent
inputs and nonfinite derived ratios, and report completed/expected process counts
and campaign completeness. A valid partial report does not pass final acceptance.
JMH JVM metadata describes settings; actual execution tiers and native entry
routes still need the independent proofs below. A version probe is an accounted
child JVM. Backend and hit count validation occurs in untimed lifetime trial
setup, never inside the timed method or after per-iteration cold-cache clearing.
New lifetime timings must not be spliced into older in-method-check result sets.

## Separate route, component, cold and GC diagnostics

The preparation command above already compiles the repository route,
continuation, stateful, first-use and latency helpers into the scored classpath.
No private helper source or second ad hoc compilation is needed.

For untimed native-route counters, use an installed GDB and
`make/scripts/rust-regex-routes.gdb` with `RustRegexRouteProbe`. Use fresh JVMs
under the same interpreter/C1/C2 policies as scored cohorts, including forced
JNI. The helper performs 6,000 matching calls; verify the leaf/JNI counter total
and semantic checksum. Capture actual compiled methods using separate
LogCompilation/PrintCompilation/PrintInlining runs. A tier flag alone is not
evidence of the method's actual execution tier. Missing symbols, debugger access
or route evidence is a reported qualification blocker, not an excuse to infer a
route. Do not install tools or improvise replacement probes during collection.

Run `RustRegexCosts` separately with
`--add-opens=java.base/jdk.internal.util.regex=ALL-UNNAMED`, and separately invoke
the production Rust diagnostic:

```sh
cargo test --release --locked --offline --lib costs::integration_costs \
  -- --ignored --nocapture
```

This separates direct capture-aware engine work, native adaptation, JNI/intrinsic
dispatch, managed preparation/cache lookup, Matcher allocation/reset and public
API work. Keep their API boundaries explicit. Compilation/first use, weak-cache
collection, retained-engine ownership and end-flag replay also require distinct
observations. Existing Regex/Cache/Captures pooling must not be described as absent.

Fresh-process startup must use complete candidate/upstream images and all four
controls with the same input, captures, end flags, Unicode and policy. Include
empty/partial inputs, lengths 4/8/11/16/17/32/64/256/257/4096 where applicable,
early/late/full hits and misses; label impossible fixed-width combinations.
Measure process wall time, compile/matcher/first-use components and RSS/PSS/native
memory separately. Compare CDS off/on only after accounted archive creation and
verification. Fresh process or GC-cleared engine cache is not cold OS page cache;
do not drop system caches.

`RustRegexFirstUse <shape> <length> <miss|early|late|full>` reports the repository
fixture's preparation, Matcher allocation, first find and observation components
and exact captures/named groups plus checksum/end flags. Launch it in a new process for each observation,
record process wall time externally, and require semantic observations to agree
across controls. A fixed-width `full` fixture must fit its requested length; an
impossible case is rejected before timing rather than relabeled.

Run the committed `RustRegexLatency` helper for find, lookingAt and matches on the
current release image with G1, all route policies and disabled/original controls
using its explicit second argument `native` or `java`. Native remains the default
and still requires a retained native Pattern; Java mode requires the opposite
and permits an upstream Pattern without the integration field. The emitted
`patternBackend` is eligibility metadata, not proof of which call path executed.
Use matched JVM options (including stack size) across controls. Preserve result
semantics, worker/capture state, safepoint and
GC logs. Keep GC allocation profilers and heavy route/compiler instrumentation
separate from scored throughput. Do not claim a hard latency bound from observed
maxima, or relative Java latency without a matching Java control.

## Staged validation with reusable checkpoints

Proceed through normal repository builds and correctness before spending time on
performance. These stages are independently useful admission points; a monolithic
18-hour run or a 32-GiB free-space reservation is not a technical prerequisite for
an ordinary build. This source-only continuation authorizes none of these runtime
commands; a later execution scope can cover one or more stages.

1. Configure and build the candidate release image and native test libraries with
   the normal commands above. Record source/toolchain hashes, elapsed time, peak
   owned RSS and writable-space growth. Keep the build logs and image manifest.
   Use observed growth and actual free headroom to admit the next stage.
2. Run the release correctness inventory and Rust tests/lints, then build the
   fastdebug image and repeat the required correctness/mode matrix. Stop on a
   failure and repair it before performance collection. Identical, hash-verified
   build outputs can be reused across stages; a source or toolchain change
   invalidates affected qualification evidence.
3. After correctness passes, build the same-base original-Java control and run
   the shared qualification preparation command. Freeze all input identities.
   Collect the full paired performance and fresh-process/memory/GC campaign.
   If smaller batches aid supervision, `--suite qualification` can run once per
   interpreter/C1/C2 tier into separate output directories, with the same frozen
   controls, pairs and worker policy. C2 retains the lifetime cohorts. Account for
   all planned cases across those batches, including all 108 protected C1 anchors;
   stage boundaries do not permit omitted losses, sizes, controls or tiers.
4. Only complete evidence passes final acceptance: release and fastdebug
   correctness, all planned semantics and performance cases, actual-route proof,
   startup/memory and matched Java latency controls, and latest-head platform CI
   after the combined PR #5 update is separately authorized. The focused CI review
   subset and preliminary builds cannot substitute for that final gate.

Retain source/image/command manifests and failures at each boundary. Re-estimate
later-stage capacity from measurements, without deleting pinned evidence or
relaxing final acceptance. A declared deadline/resource breach ends that attempt;
checkpoint and obtain a revised execution scope rather than dropping cases.

## Proposed bounded execution and publication boundary

Source publication does not authorize the following runtime campaign. One future
approval can cover the complete fixed-source campaign, without approving each
ordinary command separately:

| Phase | Elapsed ceiling |
| --- | ---: |
| Three images, native test libraries, Rust/JMH/helpers/CDS preparation | 270 minutes; at most 90 per image |
| Release + fastdebug correctness, fixed-seed/stateful checks, Rust tests/lints | 90 minutes |
| Separate actual-route proof plus the complete paired warmed matrix | 600 minutes |
| Five paired fresh-process rounds, CDS and memory/first-use controls | 60 minutes |
| Separate engine/adapter/allocation and leaf/GC diagnostics | 30 minutes |
| Analysis, integrity checks and checkpoints | 30 minutes |

Conservative proposed whole-campaign ceiling: **18 hours**, including preparation,
validation, gaps and cleanup. This is an admission/bounding choice, not a measured
elapsed-time requirement. The phase allocations above are planning ceilings, not
benchmark observations or proven minimum durations. An independently approved unchanged historical reproduction study may
use its existing 115-minute/58-JVM ceiling; if explicitly included, the combined
ceiling is **20 hours**. Historical/private images are optional diagnostic context
and are not prerequisites for reproducing this branch or substitutes for its
three current images. Private compact/DontInline sources are not part of this
branch and cannot be promoted by a diagnostic result.

Use at most four build workers plus a controller CPU. Scored JVMs run serially on
one fixed CPU for single-worker cohorts or four fixed CPUs for the separately
declared four-worker cohorts, with matched heap/GC/options across controls. Proposed maximum
aggregate owned RSS is 8 GiB for builds/tests and 2 GiB for measurements; at most
128 owned processes/512 threads in builds, 16/128 in tests and 4/64 in scored runs.
A conservative proposed admission reservation is **32 GiB of additional writable
capacity**, including an output ceiling of 4 GiB. No measurement establishes
32 GiB as a minimum necessary capacity. A staged build can instead establish
actual peak growth and support a smaller, measured reservation, while retaining
the same source, evidence and final acceptance gates. Per-process address-space ceilings are 8 GiB for build/test tooling
and 4 GiB for scored JVMs; cap open files at 1,024, disable core files, and cap
individual build files at 4 GiB and individual diagnostic logs at 512 MiB.
Existing evidence and pinned images must be retained. CPU affinity and
per-process address/file limits can be kernel-enforced; aggregate RSS, process
and output limits need owned-tree watchdog monitoring and may transiently
overshoot between samples. These proposed limits are not claimed dynamically
tested by source-only checks.

Use subreaper supervision, phase/whole deadlines and an in-deadline cleanup
reserve; signal and reap only owned descendants. Count compiler, jlink/jimage,
CDS, version and diagnostic JVMs inside their phase. Stop on source/input drift,
security/access denial, semantic or route mismatch, missing/duplicate rows,
crash/assertion, timeout, output/resource limit or uncertain cleanup. Preserve
failed evidence; never replace a failed observation, reduce cohorts or disable
tiers to hide losses. Previously denied ad-hoc locking/header/ClassLoader stress
remains excluded. An unresolved loss remains unresolved; no numerical acceptance
threshold is invented by the runner and green CI alone does not prove universal
speed improvement.

All stages can run locally with adequate capacity and their explicit runtime
approval. Publishing this isolated source-only branch does not launch CI because
the repository's only push trigger selects `master`; it opens no PR. Updating
existing PR #5 later is a separate approved action and triggers its full default
workflow (currently 59 expanded jobs). The setup repair is technically separable,
but publishing it alone would spend a run on a head without the complete test and
harness fixes. Prefer one reviewed combined update and latest-head CI. Do not
dispatch/rerun CI, merge or force-push under source-publication authority.

The existing CI latency label formerly named `disabled` disabled only intrinsics;
it was a JNI policy, not a Java-only control. It is now named `jni`, with the same
VM flag. The new explicit Java latency mode is available for the separately
approved matched-control campaign; it does not silently relabel old observations.
