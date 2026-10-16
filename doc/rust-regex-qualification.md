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
make CONF=regex-review-fastdebug JOBS=4 images
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

Use JMH 1.37, jopt-simple 5.0.4 and commons-math3 3.6.1. The exact four coordinates,
SHA256 values and bounded HTTPS retry/fallback resolver are in
`.github/workflows/main.yml`, step `Prepare focused benchmarks`. Reuse verified
local copies or run that download block in a fresh temporary directory with its
ten-minute outer limit. Do not execute unverified JARs or fall back after a
checksum mismatch. Normal configured unauthenticated proxy routing may be needed;
do not put credentials or proxy values into logs.

Let `REGEX_JMH_LIB` identify those four verified JARs. Compile repository benchmark
sources once with the candidate JDK:

```sh
mkdir -p build/regex-bench/classes build/regex-bench/generated
build/regex-review-release/images/jdk/bin/javac \
  -cp "$REGEX_JMH_LIB/*" \
  -processorpath "$REGEX_JMH_LIB/jmh-generator-annprocess-1.37.jar:$REGEX_JMH_LIB/jmh-core-1.37.jar" \
  -processor org.openjdk.jmh.generators.BenchmarkProcessor \
  -d build/regex-bench/classes -s build/regex-bench/generated \
  test/micro/org/openjdk/bench/java/util/regex/RustRegex*.java \
  test/micro/org/openjdk/bench/java/util/regex/JavaFallbackCosts.java \
  test/micro/org/openjdk/bench/java/util/regex/JavaDigitFallbackCosts.java \
  test/micro/org/openjdk/bench/java/util/regex/JavaFallbackCandidates.java
```

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
within-JVM iterations as independent samples. Two pairs can leave wide intervals;
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

The runner binds runtime/configuration/classpath inputs, verifies the full
parameter/method Cartesian product, and preserves terminal failures. Its total
monotonic budget includes resume gaps; failed sessions cannot be resumed. A
version probe is an accounted child JVM, not a free measurement. Backend and hit
count validation occurs in untimed lifetime trial setup, never inside the timed
method or after per-iteration cold-cache clearing. New lifetime timings therefore
must not be silently spliced into older in-method-check result sets.

## Separate route, component, cold and GC diagnostics

Build the repository helpers with the candidate JDK:

```sh
build/regex-review-release/images/jdk/bin/javac -d build/regex-bench/classes \
  make/scripts/RustRegexRouteProbe.java make/scripts/RustRegexProbe.java \
  make/scripts/RustRegexLatency.java make/scripts/RustRegexFirstUse.java
```

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

Mandatory total ceiling: **18 hours**, including preparation, validation, gaps and
cleanup. An independently approved unchanged historical reproduction study may
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
Reserve 32 GiB of additional writable capacity, including at most 4 GiB of result
artifacts. Per-process address-space ceilings are 8 GiB for build/test tooling
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
