# Integration qualification: prepared, not executed

The source review is complete; integration qualification is not. No build,
test, benchmark, CI run, tool install or PR was launched while preparing this
packet. The new helpers are unexecuted source and must not be called validated
tools. One authorized execution includes preparation, all checks below and one
decision, without intermediate approval requests or retries seeking a pass.

## Exact source and existing evidence

Remote review head read back on 2026-10-17:
`3be438c8f0f2a54e4ab64ac7d3138af7622410e0`, tree
`f6cf6cea14a8ccc16952580c8bbb95a2dc352151`, parent
`63127e698a4843ddede8ea6c5e2cc3e4cb6b0be3`. The source-only packet commit that
contains this document is a descendant; freeze its full SHA before executing.
The command below uses that exact checkout HEAD, never a subsequently moving ref.

Baseline is `89885a6288e7aaabd01678a704a586272c0f96e3` (tree
`d77a085e51da37106c582c017af6151e01e95f42`). The historical baseline worktree
at fdb9621ae74 contained the same production source plus prototype files; use a
fresh checkout of the actual baseline now, not an old binary or /tmp worktree.

Read-only comparison with historical integration `2a62302b1e4` found identical
Java parser, C, Rust, Cargo lockfile, legal notices, normal test and
ProductionProbe. The only product/build differences are the four build-path
files in the Windows repair; its fifth file is the path fixture. No new parsing
or JNI lifetime defect was found by the independent semantics/boundary reviews.
No speculative runtime tuning was applied under the no-execution restriction.

Historical evidence is retained locally in the original integration commit's
`test/experiments/instant-speedate-production/evidence/`; those raw captures are
not part of this source-only review branch. It supports these narrower claims:

| Evidence | Supported conclusion | What remains open |
|---|---|---|
| 14 × 100308 differential outcomes; digest a0c9818f610a52c4a5429fe59d286443efec207525cd6f1a64876f2bdd45ed8a; 49680 direct native hits per enabled mode | Historical exact values/errors, grammar/year/epoch boundaries and failure fallback | Fresh images of this exact source packet; other native hosts |
| Six 90000-case Serial/G1/ZGC × CompactStrings runs with completed collections, fresh Strings, pressure and -Xcheck:jni | Historical JNI lifetime and concurrent-GC evidence | Exact-head collector/storage validation |
| Preboot, cold-init, forced per-library-lock JNI_OnLoad regression | Historical lazy load and callback fallback | Exact-head startup/link/CDS behavior |
| 72 JVMs, 360 rows, G1 only; canonical 3.54–4.68× baseline, 3.52–3.91× Java control; mixed 17–19% improvement | Historical integrated single-call benefit and allocation reduction on one Linux host | Explicit stability screens and separate successful fallback/custom/syntax/calendar protection |
| First public call medians 0.661ms enabled vs9.100ms baseline; whole-process ranges overlap | Historical cold native path; no JVM-startup speedup claim | Current-image first call and process wall budget |
| Configure-disabled gensrc+javac bytecode comparison | Hook can compile away | A complete normal configure-disabled packaged image |
| Windows path/argv/environment fixtures, old recipe/adapter negative controls | Build-adapter repair evidence | Actual Windows Cargo/MSVC/SDK/link/runtime behavior |

Runtime-off canonical historically costs 411.132 vs368.849ns (+11.5%) with
CompactStrings, and438.566 vs412.2125ns (+6.4%) without; mixed off-mode costs
784.567 vs739.6405ns (+6.1%). This is a real protected-workload concern, not
zero-cost disabling. The new 3% gate below is deliberately not relaxed to make
those results pass. Java allocation counters measure allocated bytes/op, not
native allocations or retained heap. Crashes/aborts/pending VM exceptions are
not recoverable parse misses.

LocalDate and LocalDateTime experiments contribute no qualification or product
changes to this packet. In particular, no LocalDate timing result is transferred
to Instant. The revised warmup protocol is a new, prospective protocol, not a
retroactive exclusion of any earlier sample.

## Staged decision and resource ceiling

**Stage1 is one complete bounded milestone on the suitable, already available
Linux x64-v3 host.** It settles exact-head correctness and representative benefit
with an opt-in **GO**, **NO-GO** or **INCONCLUSIVE** decision. No additional
hardware is mandatory for that decision. Do not wait for four native performance
hosts before producing a useful result, and do not substitute a binary handoff
for a normal checkout/build.

If Stage1 is worthwhile, Stage2 is supported-platform correctness through the
repository's normal CI, only after separately approved PR integration. Use the
existing native Linux/AArch64/macOS/Windows jobs, default-off builds plus explicit
opt-in build/check coverage with compatible installed Rust/Cargo and locked
dependencies. A default-off job alone does not exercise the new ABI. A CI host
without the matching toolchain/target is an explicit platform-correctness gap,
not permission to install unmanaged tools. No CI changes, dispatch, PR creation
or integration are performed by this source-planning task.

Stage3, architecture-specific performance, is a distinct claim if later wanted.
It requires suitable native hardware for that architecture; those hosts are not
prerequisites for Stage1 or for discovering whether the change is worth a PR.
A Linux benefit result does not become a macOS/Windows/AArch64 performance
claim. The portable source/commands below help subsequent correctness work but
do not request an automatic four-host performance campaign.

| Host | Normal C/C++ profile | Installed Rust target / CPU | Current status |
|---|---|---|---|
| GNU/Linux x64-v3 | x86-64-v3 / generic tune | x86_64-unknown-linux-gnu / x86-64-v3 | Existing compatible tools and historical captures; fresh run pending |
| GNU/Linux AArch64 | Armv8.2-A / generic tune | aarch64-unknown-linux-gnu / generic | Later native CI correctness; no current performance claim |
| macOS arm64 | apple-m1 | aarch64-apple-darwin / apple-m1 | Later native CI correctness; no current performance claim |
| Windows x64-v3 | MSVC AVX2 profile | x86_64-pc-windows-msvc / x86-64-v3 | Later native CI correctness; no current performance claim |

Stage1 has **three hours total**, starting before checkouts/builds, including
all four images and validation. There is no automatic extension or launch on
another host. Builds use at most four make
jobs and two Cargo jobs; tests/JVMs are serial, ActiveProcessorCount=2, timed
heaps256MiB and stress heaps64MiB. Use an execution environment capped at four
CPU equivalents, 16GiB RAM and80GiB scratch disk; stop on exhaustion or an
unexpected process. Current Linux environment exposes a four-CPU quota and16GiB
memory ceiling. Run in a managed native job with a whole-job lifetime ceiling
and teardown, including any detached descendants; the per-command helper is
not a sandbox. Javac's persistent server is disabled for these builds. Cleanup
uncertainty stops the whole job and is explicitly reported as INCONCLUSIVE.
No privileged setup or unmanaged installation is part of this packet.

Per-command ceilings are30min for normal images/Rust/JUnit stages,5min for
configure/preflight and2min for a fixture JVM/compiler. The runtime comparison
also has a45min phase limit and cold-use phase a5min limit, both subordinate to
the original three-hour deadline. These are ceilings, not promises of completion.
Keep every log on timeout/failure and stop; do not replace a fork or expand work.

The owner owns creating all clean checkouts, local source control, manifests,
builds, checks, timing analysis, repairs discovered before the frozen performance
phase, and the final decision. The genuinely mandatory Stage1 hardware is a
Linux x64-v3 host with the stated resources; it is already available here.
Remaining execution prerequisites are the installed compatible tools/target
standard library, managed-job lifetime control, Cargo cache or approved registry
access, and authorization to execute this whole packet. No other architecture's
performance host is mandatory. The present
continuation explicitly prohibits execution; this is not an automatic-review
denial. Missing dependencies yield HOLD/INCONCLUSIVE, not a request that the user
perform the engineering manually. No requirement for new CI, PRs or deployment.

## Exact preparation and normal build commands

Do not run these during source-only preparation. Start in a clean, committed
source-review checkout containing this document. Use absolute paths with no
preexisting qualification scratch directory. `QUAL_STARTED` is a host monotonic
clock reading captured once and reused in every command; never reset it after
a failure. The deadline helper reserves ten seconds for bounded cleanup inside
each command/packet ceiling, and records command receipts plus exit wall time.

On this Linux host use the existing `/workspace/toolchains/activate.sh`, boot
JDK `/workspace/toolchains/jdk27`, jtreg `/workspace/toolchains/jtreg83`, GCC16,
mold and installed Rust/Cargo1.99. On another native host substitute its already
installed compatible tool paths and record compiler/boot/SDK versions. Do not
downgrade or run rustup/installer commands. `cargo fetch --locked` is normal
Cargo dependency management; configure/make then use the locked/frozen graph.
If the cache is already complete, prefer `cargo fetch --locked --offline`.

```bash
set -euo pipefail
source /workspace/toolchains/activate.sh  # Linux workspace only
export QUAL_REVIEW="$PWD"
export QUAL_SHA="$(git rev-parse HEAD)"
export QUAL_BASE=89885a6288e7aaabd01678a704a586272c0f96e3
export QUAL_ROOT=/workspace/instant-qualification
export QUAL_BOOT=/workspace/toolchains/jdk27
export QUAL_JTREG=/workspace/toolchains/jtreg83
export QUAL_STARTED="$(python3 -c 'import time; print(time.monotonic())')"
export QUAL_TOOLS="$QUAL_REVIEW/test/experiments/instant-speedate-production"
test -z "$(git status --porcelain)"
git diff --exit-code 3be438c8f0f2a54e4ab64ac7d3138af7622410e0 "$QUAL_SHA" -- src/java.base make test/jdk test/make
mkdir "$QUAL_ROOT"
mkdir "$QUAL_ROOT/logs"
for variant in baseline cached enabled configured-off; do
  revision="$QUAL_BASE"
  if test "$variant" = enabled || test "$variant" = configured-off; then revision="$QUAL_SHA"; fi
  git worktree add --detach "$QUAL_ROOT/$variant" "$revision"
done
python3 "$QUAL_TOOLS/prepare_java_control.py" "$QUAL_ROOT/cached"
git -C "$QUAL_ROOT/cached" diff --binary > "$QUAL_ROOT/logs/cached-source.diff"
git -C "$QUAL_ROOT/cached" diff --name-only > "$QUAL_ROOT/logs/cached-paths.txt"
# The only cached-control change must be DateTimeFormatterBuilder.java.
test "$(cat "$QUAL_ROOT/logs/cached-paths.txt")" = src/java.base/share/classes/java/time/format/DateTimeFormatterBuilder.java
python3 "$QUAL_TOOLS/deadline.py" --started "$QUAL_STARTED" --max-seconds 300 \
  --log "$QUAL_ROOT/logs/cargo-cache.log" --cwd "$QUAL_ROOT/enabled" -- \
  cargo fetch --locked --offline --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml
for variant in baseline cached enabled configured-off; do
  extra=()
  if test "$variant" = enabled; then extra+=(--enable-instant-speedate); fi
  if test "$variant" = configured-off; then extra+=(--disable-instant-speedate); fi
  python3 "$QUAL_TOOLS/deadline.py" --started "$QUAL_STARTED" --max-seconds 300 \
    --log "$QUAL_ROOT/logs/configure-$variant.log" --cwd "$QUAL_ROOT/$variant" -- \
    bash bin/configure-dev --with-conf-name=qualification --with-jobs=4 \
    --with-debug-level=release --disable-javac-server \
    --with-boot-jdk="$QUAL_BOOT" --with-jtreg="$QUAL_JTREG" "${extra[@]}"
  python3 "$QUAL_TOOLS/deadline.py" --started "$QUAL_STARTED" --max-seconds 1800 \
    --log "$QUAL_ROOT/logs/images-$variant.log" --cwd "$QUAL_ROOT/$variant" -- \
    make CONF=qualification JOBS=4 images
done
for variant in enabled configured-off; do
  python3 "$QUAL_TOOLS/deadline.py" --started "$QUAL_STARTED" --max-seconds 1800 \
    --log "$QUAL_ROOT/logs/junit-$variant.log" --cwd "$QUAL_ROOT/$variant" -- \
    make CONF=qualification JOBS=1 run-test \
    TEST='test/jdk/java/time/test/java/time/TestInstantSpeedate.java test/jdk/java/time/test/java/time/TestInstant.java test/jdk/java/time/tck/java/time/TCKInstant.java test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java'
done
python3 "$QUAL_TOOLS/deadline.py" --started "$QUAL_STARTED" --max-seconds 1800 \
  --log "$QUAL_ROOT/logs/junit-cached.log" --cwd "$QUAL_ROOT/cached" -- \
  make CONF=qualification JOBS=1 run-test \
  TEST='test/jdk/java/time/test/java/time/TestInstant.java test/jdk/java/time/tck/java/time/TCKInstant.java test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java'
```

The baseline and cached control are normal complete images, not module-patched
timing routes. The cached control only caches the existing immutable formatter
parser for its variable-precision case; it contains no handwritten date parser.
It must pass the same full oracle before comparison. The enabled/runtime-off
routes use the same enabled image; configure-off is a separately built image.

Before the runtime command, run the Rust unit tests with the configure-selected
target/CPU and installed tools, record source/tool/configuration/SDK/CPU/runtime
metadata, complete compile/link logs, `release`, `lib/modules` and native-library
SHA256s, dependency/compiler notices and cached-source diff SHA256. Use native
inspection tools to verify the one JNI export and runtime dependencies. Record
these as concrete commands and logs, not a claim based on a target name:

```bash
# Set these to the selected row above; Linux x64-v3 values shown.
export QUAL_RUST_TARGET=x86_64-unknown-linux-gnu
export QUAL_RUST_CPU=x86-64-v3
python3 "$QUAL_TOOLS/deadline.py" --started "$QUAL_STARTED" --max-seconds 1800 \
  --log "$QUAL_ROOT/logs/rust-tests.log" --cwd "$QUAL_ROOT/enabled" -- \
  env CARGO_BUILD_JOBS=2 "RUSTFLAGS=-C target-cpu=$QUAL_RUST_CPU -C panic=unwind" \
  cargo test --frozen --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml \
  --target "$QUAL_RUST_TARGET" --target-dir "$QUAL_ROOT/rust-tests"
rustc --version
cargo --version
python3 --version
"$QUAL_BOOT/bin/java" -version
nm -D --defined-only "$QUAL_ROOT/enabled/build/qualification/images/jdk/lib/libinstant.so"
readelf -W -l "$QUAL_ROOT/enabled/build/qualification/images/jdk/lib/libinstant.so"
ldd "$QUAL_ROOT/enabled/build/qualification/images/jdk/lib/libinstant.so"
```

Also extract `Instant.parse` using each image's `javap -p -c java.time.Instant`
and compare the baseline/configure-off resolved instruction sequence after
removing constant-pool indexes; it must be the unchanged formatter call. Retain
the complete outputs plus selected methods. The configure-off image must lack
the native library and speedate/compiler notices; the enabled image must contain
them. The runner checks these packaging conditions and hashes full modules/
native/release files. Record OS/ISA and active collector features before testing.
Do not run an image built for x64-v3 on less capable hardware.

On macOS use `nm -gU` and `otool -L`, image path `lib/libinstant.dylib`, and
record SDK/deployment-target settings for both C/C++ and Rust. On Windows build
in the checkout's existing Bash/MSVC/SDK environment, inspect with
`dumpbin /exports` and `/dependents` at `bin/instant.dll`, and run the Python
runner from an existing x64 Developer PowerShell with **native Windows paths**.
Java classpaths/JNI library properties must not be unconverted Cygwin paths.
Translate build-shell paths once with `cygpath -m`; use the same installed
native Python for capturing and consuming the monotonic start clock. Native
Python, cl.exe and SDK visibility are prerequisites,
not installations to perform silently. Existing Unix stand-in path fixtures
are not repeated as a substitute for actual native linking.

## One runtime command and frozen acceptance

After the normal build/check commands succeed, execute once (native absolute
paths on Windows, replacing `python3` with the installed native Python command):

```bash
python3 "$QUAL_TOOLS/qualification_matrix.py" \
  --repo "$QUAL_ROOT/enabled" --candidate-sha "$QUAL_SHA" --started "$QUAL_STARTED" \
  --baseline "$QUAL_ROOT/baseline/build/qualification/images/jdk" \
  --cached "$QUAL_ROOT/cached/build/qualification/images/jdk" \
  --enabled "$QUAL_ROOT/enabled/build/qualification/images/jdk" \
  --configured-off "$QUAL_ROOT/configured-off/build/qualification/images/jdk" \
  --out "$QUAL_ROOT/runtime"
```

The runner requires fresh successful normal image/JUnit/Rust receipts, checks
all four prescribed checkout revisions and image locations, and compares its
helper/protocol hashes with the frozen candidate. Complete checkout status must
be clean, except for the one unstaged cached-control source change whose content
must equal the frozen transformation of the baseline file. Staged or untracked
changes are rejected. It does not accept an arbitrary
binary handoff. It owns fixture compilation; full100308-case oracle in five normal
routes and both String modes; three scratch-only fault-library variants in
both modes; native-hit and payload classification proofs; six real
Serial/G1/ZGC × storage pressure runs; preboot, cold-init, JNI_OnLoad contention
and CDS checks. It records every command and image identity. Native attempt/hit
counts come from separate eligibility/reflected-helper checks and source
reachability, not instrumented native counters inside timing. Keep these
distinct from actual public-call timing.

Three representative corpora in each of the five routes/both String modes
receive separate compiler/allocation diagnostics:30 JVMs. They must contain a
C2 loop nmethod, exact oracle checksums, allocated-byte variation<=1B/op, and
no measured compiler-time increase across all six blocks. Diagnostic logging
is not part of throughput measurement and does not prove timing-fork code
identity.

The fixed throughput matrix is188 serial JVMs: G1 × seven corpora (canonical,
87.5%-hit mostly,50%-hit mixed, successful all-miss, syntax-invalid,
calendar-invalid, custom CharSequence) × five routes × both String modes × two
forks =140; Serial and ZGC additionally cover canonical/mixed/successful fallback
with baseline/enabled, both String modes/two forks =48. This bounds performance
coverage; it is not every workload under every collector. The safety matrix
covers all three collectors in both storage modes.

Every process warms exactly64 calls of125000 parses (eight million total),
including repeated normal method entries and loop exits. Then retain six blocks
of500000 complete public calls, all counted. No block is discarded and no
printing occurs between blocks. Results escape through a volatile sink; checksums
are independently derived from the Java oracle. Fork0 uses baseline, Java
control, enabled, runtime-off, configure-off order; fork1 reverses it. Fixed
payloads and order live in QualificationProbe.java and are not edited after
observing timing.

Each diagnostic/timing process is checked before starting the next. Timing must
have max/min<=1.10, last-three/first-three median ratio in[0.95,1.05], allocation
spread<=1B/op, no measured compiler-time growth across any block or interblock
gap, and each block's GC milliseconds<=10% of elapsed milliseconds. Counters
are sampled outside elapsed intervals. Compiler milliseconds are coarse and do
not prove absence of deoptimization or identical escape analysis. A failure
means INCONCLUSIVE and immediately stops timing—no retry, block deletion,
replacement fork, larger warmup or sample expansion.

Only after controls pass are medians compared, with every block/fork/range
retained. Both fork medians must be on the same side of each gate; conflicting
fork outcomes are INCONCLUSIVE. The source does not rescue a failed fork with
a pooled median. Gates in both String modes:

* Canonical enabled >=1.5× baseline under G1/Serial/Z; >=1.25× cached Java under
  G1; Java allocated bytes<=10% of baseline. This requires a substantial reduction
  without assuming the same object-header size under every collector.
* Enabled mostly/mixed/successful fallback/syntax/calendar/custom median<=1.03×
  baseline under G1; Serial/Z mixed/fallback also<=1.03× baseline.
* Runtime-off and configure-off median<=1.03× baseline on every G1 corpus.
* Enabled/disabled allocated bytes<=baseline+1B/op for every covered route/corpus.
  This is Java allocation volume, not a native-memory measurement.
* Ten fresh processes per route/storage/cold corpus (canonical, successful
  fallback, calendar invalid), rotated route order: public first-parse and
  full-process medians<=baseline+max(5% of baseline,2ms), for enabled and both
  disabled routes. Report all startup observations; no startup-speedup claim
  from overlapping ranges. The Java-only control is reported, not a production
  startup requirement.

Cold canonical and nanosecond fallback inputs are independently checked after
timing as epochSecond=-1 with nanos1000/123456789; cold calendar input must
remain a parse exception with its input/error index. These checks do not
initialize an oracle formatter on the native hit. Child process wall time is
timestamped by a blocking waiter, without timed-wait polling backoff or parent
log-reading/printing overhead.

A correctness mismatch, JNI safety error or loader deadlock is NO-GO. A missing
tool/host, failed image provenance/packaging, timeout, unstable control or
protocol/helper failure is INCONCLUSIVE; stop dependent work. Stable timing
that misses any engineering gate is NO-GO for this candidate. A gate pass with
fork-dependent ambiguity is INCONCLUSIVE, not a pooled-median rescue. GO means
opt-in on the tested native target only, with all criteria and coverage stated;
it does not enable the feature by default or qualify unavailable targets.

The owner consolidates normal build/test logs and successful command receipts,
all raw rows, per-fork medians/
ranges, source/build identities, startup distributions, package/dependency
inspection into one Stage1 decision. This does not wait for other performance
hosts. The runtime
runner is only one part of that milestone: it cannot turn missing normal-build
or provenance checks into GO. Its exit statuses are0 for runtime gates passed,
1 for NO-GO and2 for INCONCLUSIVE; the owner still consolidates the full packet.
No PR, merge or publication is implicit in running
this packet. Its source preparation has not supplied new runtime evidence.
