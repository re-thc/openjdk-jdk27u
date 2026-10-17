# Adjacent integer threshold qualification

The reviewed compiler and regression source is fixed at
`57f567fcb9ad7dddbd7fb2b2d9b443309681fc0f`. Baseline is
`2c3ecf578a57f2eb4d5ed30d395e537764e0fa99`, including the same GCC prerequisite.
Later commits in this branch supply evidence and the workflow below; they do
not change the compiler. Publication does **not** authorize executing the
qualification campaign. No fresh JDK build, Java workload, benchmark or CI job
was run while preparing this workflow.

The fix recognizes equivalent `x <= c` / `x < c+1` tests inside the existing
bounded `IfNode::search_identical` search. Domains and input values must match,
and the constant must not wrap. `same_condition`, CastII, RangeCheck equivalence,
loop exits and opaque shapes keep their existing behavior.

## Existing evidence

[EVIDENCE.md](EVIDENCE.md), [evidence-original.json](evidence-original.json) and
[evidence-strengthening.json](evidence-strengthening.json) preserve exact source
identities, compile IDs, graph scopes, original guard instructions and test
results. On the original candidate VM, the minimal direct method fell from
160 to 112 main-code bytes, eliminating the second guard/trap. The strengthened
Java class passed 30 methods / 28 IR rules against that saved VM; the baseline
failed all 23 positive IR cases and passed the five negative cases. Semantics
passed on both.

The four native predicate test bodies / 26 assertions ran through a standalone
shim, and four endpoint mutants were rejected. This is not a standard GTest
result. The final extraction source has not yet been rebuilt. The complete
workflow now supplies the normal GTest dependency and integration needed to
close that gap; these existing results are not substituted for that run.

## One normal-checkout command

Use Linux x86-64, Python 3.12+, curl, Git, GNU make, a supported GCC toolchain,
and the normal JDK OS development prerequisites described in
[building.md](../building.md). Supply only a supported boot JDK 26/27 and host
build tools; prebuilt candidate/baseline images, JMH, GTest, codec classes and
corpora are not required. A checkout of this review branch contains both fixed
source commits. A shallow checkout must first obtain those commits normally.

```sh
# Print every command and bound. Runs no command and creates no work directory.
python3 -B doc/c2-constant-threshold/qualify.py \
  --boot-jdk "$JAVA_HOME" --output /scratch/threshold-qualification \
  > /scratch/threshold-plan.json

# Only after the complete plan receives execution approval:
python3 -B doc/c2-constant-threshold/qualify.py \
  --boot-jdk "$JAVA_HOME" --output /scratch/threshold-qualification --execute
```

The output directory must be new and outside the checkout. Run both commands
with the same arguments/environment. If the host requires a compiler/sysroot
configuration, pass each normal configure argument with `--configure-arg=...`;
the runner applies it identically to all builds. Supply each non-system
compiler, linker, autoconf or sysroot root with `--input-root /absolute/root` so
its complete content is hashed. Do not include mutable caches in those roots.
For example, `--configure-arg=--with-toolchain-path=/tools/gcc/bin` together with
`--input-root /tools/gcc`. Host OS development packages remain ordinary JDK
build prerequisites; the runner does not install or upgrade them.
`JAVA_TOOL_OPTIONS`, `JDK_JAVA_OPTIONS` and `_JAVA_OPTIONS` must be unset.

[dependencies.json](dependencies.json) pins eight HTTPS downloads by length and
SHA256. They include GoogleTest 1.14.0 at its exact upstream commit, JMH 1.37 and
its three runtime/processor dependencies, the jtreg archive, Jupiter 5.11.4's
standalone platform and reference zstd 1.5.7 source. GTest/JMH versions follow
`make/conf/jib-profiles.js` / `make/devkit/createJMHBundle.sh`; JUnit follows the
pinned codec build. GoogleTest is fetched and unpacked privately as a normal
build dependency, with no shared installation. The jtreg mirror archive is
named 8.2.1+1, but its actual jar manifest says **8.2.1-dev+0, 2026-10-05**; the
exact archive hash is pinned and its 8.2.1 version meets this tree's configured
minimum. It is not represented as Oracle's official 8.2.1+1 binary.

The pinned codec checkout is
[`re-thc/jzstd@6abf77e2f63b68cc9269d5823e206235ab254c04`](https://github.com/re-thc/jzstd/tree/6abf77e2f63b68cc9269d5823e206235ab254c04).
The runner compiles unchanged production/test sources and existing Java drivers
once with the baseline release javac, then uses identical class files on both
VMs. No codec source overlay, Gradle/plugin installation or new benchmark class
is involved. The reference zstd executable is built privately from its pinned
source for existing interoperability checks.

## Preparation, validation and measurement

The plan emits 113 commands plus final input verification, sequentially. It
stops at the first failure; it never retries or raises a limit automatically.

| Stage | Actual work | Bounds and required evidence |
|---|---|---|
| Preparation | Host preflight; eight pinned downloads; local extraction; pinned codec clone | Hash/length checks before unpacking; supported boot JDK and source commit availability |
| Builds | Baseline/candidate **release** pair and baseline/candidate **fastdebug** pair, ordinary `configure` + `make images` | One active build; four jobs; 75 min cap per image build; same toolchain/boot JDK/configuration within each pair; exact source pin/configure/spec/release records |
| Standard compiler tests | Candidate `make test-image-hotspot-gtest`, then `make test-only TEST='gtest:opto.constant_threshold_*'`; Java IR class, StressIGVN/VerifyIterativeGVN, same nearby regressions listed in EVIDENCE.md | All four registered native tests must pass; IR/stress/nearby exit zero; normal GTest library/linking/harness, no shim |
| Artifact preparation | Normal baseline `make build-microbenchmark`; verify selected six benchmark names; compile unchanged jzstd; prepare existing corpora/reference frames | Shared benchmark jar and codec classes, generated once; source/file provenance saved |
| Codec correctness | Both release VMs run existing functional JUnit tests, 54-frame guarded-destination driver, and source-corpus encoder check-only at levels 1/3/9 | 918 destination checks per VM; allocating/direct output and guard bytes; zero skipped/failed functional tests; byte-identical encoded frames between VMs; reference zstd decodes to the exact source corpus |
| Codec applicability/code size | Existing rolling decode driver on both release and fastdebug pairs; targeted PrintIdeal/PrintOptoAssembly/LogCompilation/CITime | Exact descriptor, regular C2 compile IDs and inlined bytecode scope; original guard retained, matching redundant mask guard/trap present in baseline and absent in candidate; main-code and total nmethod sizes separately |
| Measurement | Four existing non-codec throughput controls and two compiler controls; three alternating fresh pairs each | 36 JMH launcher commands, one fork each; **30 min separate measurement ceiling**; per-command 35 s throughput / 45 s compiler caps |
| Postprocessing/finalization | Paired ratios, matching C2 code sizes/compiler timers, then complete input drift verification | Included in the overall budget, with 10 min reserved at the end; any incomplete verification prevents completion |

The unchanged functional suite excludes `GoalGateTest` and `ReferenceParityTest`,
which contain existing size/throughput goals beyond this compiler screen. The
remaining tests include malformed frames, dictionaries, streaming, boundaries,
sequence/bit handling and CLI interoperability. This is an explicitly selected
functional suite, not a claim that every codec gate ran. Any skipped test is an
incomplete result. The full correctness commands and JUnit reports are retained.

Corpus construction reuses the existing `scripts/jdk27/run.py` source corpus:
sorted 37 production Java files plus one newline each, 764896 bytes, SHA256
`dddfad1293504a9bd47b89e491c29e74833e16fc39a4fe752f88091dbc5678b9`.
The 54-case generator is the existing `check_overlays.py` matrix: random,
periodic and source data at sizes 0, 7, 257, 131071, 131073, 300000, levels 1/3/9.
The runner calls the unchanged `DecodeOverlayCheck` directly and supplies its
entire tab manifest. It does not execute that script's source-overlay stage.
Each row has exact source/frame hashes, and918 expected checks establish that
the driver consumed all 54 rows. All generated inputs/classpaths are frozen.

The guard check uses javap to identify the `sliceWidth<=63` branch at source
line 245 and the specific `Bits.mask64(sliceWidth)` call at 249. It verifies the
nested `BlockDecoder$EntropyState` descriptor, actual inline scopes, shared
comparison value, final CmpI/If nodes and unstable-if trap, using exact regular
C2 compilation IDs. Unrelated `mask64(available)` and four component-width calls
are excluded by their bytecode locations. Missing scope/graph/compilation means
**not applicable or incomplete**, not successful guard removal. Fastdebug
provides decisive graph evidence; release provides matching production code-size
evidence. Driver diagnostic rates are discarded and are not codec throughput
measurements. A missing codec compiler timer also stops validation.

The throughput controls remain:

1. `org.openjdk.bench.vm.compiler.UnsignedComparison.intConDirect`
2. `org.openjdk.bench.vm.compiler.UnsignedComparison.longConDirect`
3. `org.openjdk.bench.vm.compiler.IfMinMax.testReductionInt`
4. `org.openjdk.bench.java.util.HashMapBench.put`, size=16384 / mapType=HASH_MAP

Each fresh fork uses three 1 s warmup iterations and five 1 s measurements.
Compiler controls remain
`SimpleRepeatCompilation.mixHashCode_baseline` and `mixHashCode_repeat_c2`,
with zero warmup and one single-shot invocation. The repeat control must accept
RepeatCompilation=500 and compile the actual `mixHashCode` target with C2.
Paired order is A/B, B/A, A/B. C2 nmethod comparisons exclude C1/OSR and retain
compile IDs. Missing/changed target sets and missing/zero compiler timers are
incomplete evidence. Total nmethod bytes include metadata and must not be
confused with main-instruction bytes.

Investigate median throughput loss over 3%, compiler cost increase over 5%, or
code size increase over 3%; inspect every pair and changed compilation set.
These thresholds are a small investigation screen, not significance tests.
Flags prevent an unexplained GO. Completion never produces an automatic GO.

## One overall resource budget

**Seven hours wall time from execution start through preparation, preflight,
builds, measurements, postprocessing and final verification.** Expected elapsed
time on a suitable four-core host is roughly 4–6 hours, dominated by four full
builds; the 75 min per-build caps and overall deadline are limits, not guarantees
that an unusually slow host completes. There is no hidden preparation campaign.
The 30-minute measurement allowance is inside those seven hours. Ten minutes
are reserved for final input verification; no new main-stage command may use
that reserve. Every subprocess is also capped individually.

Storage now uses a **20 GiB initial free-space requirement**, an **18 GiB
campaign allocation stop threshold**, and a **2 GiB free-space floor**, fitting
this VM's roughly 25 GiB available without deleting existing data. One active
build coexists with retained source checkouts and complete images. JMH/GTest
make-based consumers finish before that build's campaign-created intermediates
are pruned and the next build begins. All source/image/configuration paths and
original manifests remain unchanged. Read [STORAGE.md](STORAGE.md) for the
measured-vs-bounded calculation, exact last consumers/removal targets, ownership
gates, interruption handling and retained evidence. The component sum is
17.125 GiB; bounds are polled stop thresholds, not guaranteed future peak results.

Plan about 12 GiB available RAM for four-job builds / the existing functional
suite. The functional test JVM uses at most 4 GiB heap; JMH measured forks use
512 MiB, launcher 256 MiB, code cache 128 MiB and active processor count four.
Typical measurement RSS remains about 1.5–2 GiB, a planning estimate rather than
an OS-enforced RSS ceiling. Upper planning CPU budget remains 28 core-hours,
subject to build-tool threading. Outer logs/results retain their polled 1 GiB
stop threshold. No resource limit is automatically raised.

SIGINT, SIGTERM, timeouts and errors clean up only the command's own process
group, including make descendants and JMH forks: SIGTERM, up to 3 s, then SIGKILL
and reap, up to 2 s. Final drift verification runs on success and failure, with a
120 s cap following cancellation/error and the remaining reserved budget on
success. A second interrupt cannot bypass that cleanup. These steps stay within
the seven-hour overall deadline, with a final 5 s cleanup reserve; abrupt SIGKILL
of the runner cannot be handled. Incomplete final verification is recorded as a
failure. Logs, retained source/images, prune journals and remaining products
stay private; only the authorized new campaign intermediates are pruned.

Input manifests cover every file/mode/symlink and resolved symlink file content
in all four JDK images, the boot JDK, downloaded archives, unpacked test/JMH
inputs, codec classes and corpora, native reference executable and benchmark
jar. Git source pins and every tracked source file are recorded separately.
Builds disable the optional javac server to avoid asynchronous daemon shutdown
conflicting with strict descendant cleanup. Actual configure commands, spec
files, source revisions, tool executable hashes,
selected build environment and extra toolchain/sysroot roots are saved. Images/configuration are frozen immediately after their builds; runtime
freezing cannot replace an earlier manifest. Extracted zstd source files are
frozen before the reference build, with generated build products allowed as
additional files. Directory symlinks include target content; cycles fail closed.
Inputs are checked before measurements and again after all postprocessing. No output
is uploaded, pushed or hosted by the runner.

## Runner validation and interpretation

```sh
# Temporary Python data and harmless child processes only; no VM/benchmark run.
python3 -B -m unittest discover -s doc/c2-constant-threshold \
  -p 'test_qualify.py' -v
```

Twenty harness tests currently pass, covering the complete plan/pins, full-image
support-file drift, safe extraction, exact bytecode/graph scope discrimination,
timeouts and repeated-SIGTERM descendant cleanup with final drift verification.
Lifecycle cases cover staged last consumers, required-artifact retention,
missing-consumer/ownership refusals, image drift, symlink boundaries, unrelated
data preservation and interrupted pruning before another build. All
eight actual dependency downloads were fetched normally and their declared
lengths/SHA256 verified; archive layouts were inspected. Standard GTest and all
future build/codec/measurement stages remain unexecuted pending plan approval.

A completed and reviewed screen would establish bounded correctness, exact
codec guard applicability and these non-codec controls. It would **not explain
the entire encoder/decoder native gap or establish codec throughput improvement**.
The four component-width guards remain a separate propagation lead.
