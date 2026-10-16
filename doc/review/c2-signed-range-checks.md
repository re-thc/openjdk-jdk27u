# C2 signed-guard range-check prototype

This review branch proposes removing an unsigned array bounds check when
nearby signed guards on the exact same index already prove it. For example:

```java
if (index < 64) {
    return index <= 0 ? 0 : table[index] & 0xff;
}
return index;
```

For a constant 64-element array, the access path implies `1 <= index < 64`.
The signed exits have different observable results. The proposal combines
their local facts rather than merging the exits or changing the index's
global type.

**Status: source-only review prototype.** The compiler change and new Java
sources have not been compiled or executed. Source review and patch
application checks are the available validation. The IR rules, dependency
preservation, generated code, portability and performance remain unqualified.
There is no measured application benefit from this candidate.

## Scope and source

The parent commit is `758f41576fc79d35a62a3896dbe5ab97c448c436`.
The change is confined to `RangeCheckNode::Ideal` in
`src/hotspot/share/opto/ifnode.cpp` and generic test sources. It accepts a
`Bool[lt](CmpU(index, positive ConI))`, follows at most eight direct control
edges, and intersects the existing integer type with signed constant-guard
facts from `IfNode::filtered_int_type`. The guard must use the exact same
index node. The walk stops at merges, loops, calls, predicates and unknown
control. It does not equate arithmetic expressions or separate loads.

After a successful proof, the helper calls `pin_dependent_nodes` and changes
the current check's condition to true while retaining its incoming control.
Pinning and later control transformations require runtime graph review;
source plausibility is insufficient. No parser casts, public APIs, mismatch
stubs, native-memory paths or architecture matchers are changed.

The bounded upstream audit included
[rolling JDK `93376e455d8d`](https://github.com/openjdk/jdk/tree/93376e455d8d321648994c9f91ea1c7cc55c513a)
and [fork master `89885a6288e7`](https://github.com/re-thc/openjdk-jdk27u/tree/89885a6288e7aaabd01678a704a586272c0f96e3).
Relevant existing signed-filtering fixes
[JDK-8385855](https://github.com/openjdk/jdk/pull/31395) and
[JDK-8346420](https://github.com/openjdk/jdk/pull/28819) are already included
in the audited source. This is a narrower unsigned-check proof, rather than
a backport of those changes. The audit found no exact applicable duplicate;
it is not an exhaustive historical search.

## Reproduce from repository sources

These are reviewer recipes, not executed results or authorization to start
a benchmark campaign. Use existing OpenJDK build prerequisites documented in
[the build guide](../building.md), a JDK 27 boot JDK, and jtreg 8.3.
There are no required private repositories, corpora, class files, images or
handoff packets. Linux examples follow; choose allowed CPU IDs locally.

From a full checkout of this review branch, set absolute paths:

```sh
set -eu
REVIEW=$(pwd)
REVIEW_COMMIT=$(git rev-parse HEAD)
BOOT_JDK=/absolute/path/to/jdk-27
JTREG_HOME=/absolute/path/to/jtreg-8.3
OUT=/absolute/path/to/new-empty-signed-range-output
CPU=0
BUILD_CPUS=0,1
mkdir -p "$OUT"
git worktree add --detach "$OUT/baseline-src" 758f41576fc79d35a62a3896dbe5ab97c448c436
git worktree add --detach "$OUT/candidate-src" "$REVIEW_COMMIT"
```

Build ordinary fastdebug images with identical configure options and tools.
Do not reuse a debug VM containing diagnostic compiler patches. Stop after
any failure; retain the command, output and partial artifacts.

```sh
for variant in baseline candidate; do
    (
        cd "$OUT/$variant-src" || exit
        taskset -c "$BUILD_CPUS" bash configure \
            --with-conf-name=signed-range-debug \
            --with-debug-level=fastdebug \
            --with-boot-jdk="$BOOT_JDK" \
            --with-jtreg="$JTREG_HOME" || exit
        taskset -c "$BUILD_CPUS" make CONF=signed-range-debug JOBS=2 images || exit
    ) || exit
done
BASE_IMG="$OUT/baseline-src/build/signed-range-debug/jdk"
CAND_IMG="$OUT/candidate-src/build/signed-range-debug/jdk"
SRC="$OUT/candidate-src"
```

Use two build jobs, at most two allowed CPUs and a 6 GiB aggregate build RSS
stop threshold. A 1 GiB build per-file limit permits debug symbol artifacts;
512 MiB is insufficient. Configure has a 4 GiB aggregate RSS stop threshold.
For this bounded review, require at least 13 GiB free initially, stop below
4 GiB free, above 9 GiB apparent output size, above 64 MiB per command log,
or after 7,200 seconds overall including review gaps. These are ceilings,
not a promise that both full-image builds fit. Do not extend or retry after
a stop. Apply these limits with the executor's resource supervisor; the
commands alone do not enforce aggregate RSS, disk or log thresholds.

Compile common diagnostic classes **once**, using only source in this
checkout and the installed jtreg dependency. WhiteBox gets its own bootstrap
jar; keep the target classes on the application class path.

```sh
mkdir -p "$OUT/wb-classes" "$OUT/classes"
"$BOOT_JDK/bin/javac" -J-Xmx512m -proc:none \
    -sourcepath "$SRC/test/lib" -d "$OUT/wb-classes" \
    "$SRC/test/lib/jdk/test/whitebox/WhiteBox.java"
"$BOOT_JDK/bin/jar" --create --file "$OUT/wb.jar" -C "$OUT/wb-classes" .
"$BOOT_JDK/bin/javac" -J-Xmx512m -proc:none \
    -cp "$OUT/wb.jar:$JTREG_HOME/lib/jtreg.jar:$JTREG_HOME/lib/javatest.jar" \
    -sourcepath "$SRC/test/lib:$SRC/test/hotspot/jtreg" -d "$OUT/classes" \
    "$SRC/test/hotspot/jtreg/compiler/rangechecks/TestDominatingSignedRangeChecks.java" \
    "$SRC/test/hotspot/jtreg/compiler/rangechecks/TestDominatingSignedRangeDependencies.java" \
    "$SRC/test/hotspot/jtreg/compiler/rangechecks/Lookup64CaptureDriver.java" \
    "$SRC/test/hotspot/jtreg/compiler/rangechecks/RemainingRangeCaptureDriver.java"
```

Record `git rev-parse HEAD`, the full diff, tool versions, configure output,
commands and SHA256 of each image's `bin/java`, `lib/modules` and
`lib/server/libjvm.so`, plus all common class files and `wb.jar`. Reuse those
same classes and images for paired checks. This source compilation recipe
has not yet been validated by executing javac.

## First structural capture and mandatory review

Capture **only the baseline/candidate `testLookup64` pair first**. The shared
IR-framework `@Run` names fourteen tests; selecting one method with a
framework property does not provide this diagnostic isolation. The separate
`Lookup64CaptureDriver` calls only the unchanged primary method: 20 fixed
inputs for 2,000 sweeps, one blocking normal-entry C2 enqueue, then 20
compiled checks. Its guards reject early, queued, OSR or non-C2 compilation.

Define a finite capture command. Use a 120-second ceiling, one allowed CPU,
2 GiB aggregate RSS stop threshold, 512 MiB per-file limit, 256 MiB per XML
file and 64 MiB per command log. Preserve stopped/failed output.

```sh
capture() {
    image=$1
    label=$2
    holder=$3
    method=$4
    driver=$5
    shift 5
    directory="$OUT/capture/$label"
    mkdir -p "$directory" || return
    timeout 120s taskset -c "$CPU" "$image/bin/java" \
        -Xshare:off -XX:+UseSerialGC -Xms512m -Xmx512m \
        -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI \
        "-Xbootclasspath/a:$OUT/wb.jar" \
        -XX:-TieredCompilation -XX:-BackgroundCompilation \
        -XX:CompileThresholdScaling=10000 -XX:ProfileMaturityPercentage=0 \
        "-XX:CompileCommand=compileonly,compiler/rangechecks/$holder::$method" \
        -XX:PrintIdealGraphLevel=0 \
        "-XX:PrintIdealGraphFile=$directory/ideal.xml" \
        "-XX:CompileCommand=IGVPrintLevel,compiler/rangechecks/$holder::$method,5" \
        -XX:+LogCompilation "-XX:LogFile=$directory/compilation.xml" \
        "-XX:ErrorFile=$directory/hs_err_pid%p.log" \
        -cp "$OUT/classes" "compiler.rangechecks.$driver" "$@" \
        >"$directory/stdout.log" 2>"$directory/stderr.log"
}
capture "$BASE_IMG" baseline-lookup64 TestDominatingSignedRangeChecks testLookup64 Lookup64CaptureDriver || exit
capture "$CAND_IMG" candidate-lookup64 TestDominatingSignedRangeChecks testLookup64 Lookup64CaptureDriver || exit
```

Stop and review this pair before continuing. Require both functional
checksums and exactly one level-4 normal compilation. In the IGVN graph
sequence, identify the same target `RangeCheck` node, its exact index and
positive constant bound, the two supporting signed facts, and unchanged
incoming control. Require the condition to change from the relevant
`Bool(CmpU)` to `ConI 1` in a step labeled with that processed target. Review
the whole graph difference and source paths to exclude another fold.

Level-5 snapshots occur after progressing `transform_old`/worklist steps;
they are **not** literal helper-entry/exit tracing. Missing or ambiguous
evidence does not qualify. Neither a missing final `CmpU` nor a smaller
nmethod locates the transformation.

For previously floating dependent loads/casts, track the replacement and
its control, memory slice, address/value and metadata. `clone_pinned` uses
`UnknownControl` on this source, not literal `Pinned`. Already nonfloating
users may require no clone. Review how both proving facts survive later
guard removal, splitting or loop transformations; a source-shaped test or
one earlier fold does not establish that chronology.

Only after the first pair qualifies, use `RemainingRangeCaptureDriver` for
these seven fixed targets, baseline then candidate for each, with the same
`capture` function and controls:

| Holder | Method |
| --- | --- |
| `TestDominatingSignedRangeChecks` | `testLookup131` |
| `TestDominatingSignedRangeDependencies` | `testAliasedReadBeforeWrite` |
| `TestDominatingSignedRangeDependencies` | `testDuplicateUpperGuard` |
| `TestDominatingSignedRangeDependencies` | `testDuplicateLowerGuard` |
| `TestDominatingSignedRangeDependencies` | `testDiamondIndex` |
| `TestDominatingSignedRangeDependencies` | `testInvariantLoop` |
| `TestDominatingSignedRangeDependencies` | `testGuardBeforeLoop` |

For example, the first command is:

```sh
capture "$BASE_IMG" baseline-lookup131 TestDominatingSignedRangeChecks testLookup131 RemainingRangeCaptureDriver testLookup131
```

This driver invokes the original complete functional sweep, including other
methods interpreted, while `CompileOnly` selects one C2 target. It performs
2,000 training sweeps, one enqueue and one compiled sweep. Review this
dependency evidence independently before subsequent test stages. A duplicate
guard removed before the new fold does not witness later removal.

## Functional and IR test recipes

Run these after the structural review gates, separately from graph capture.
Use unique work/report directories, one jtreg test at a time, a fixed seed,
1 GiB Test/Flag heaps and a 4 GiB aggregate jtreg RSS stop threshold.
Do not add `UseSerialGC` to normal jtreg IR runs: it is outside this
framework's whitelist and disables matching. Diagnostic Serial GC controls
above are separate.

```sh
TEST1="$SRC/test/hotspot/jtreg/compiler/rangechecks/TestDominatingSignedRangeChecks.java"
TEST2="$SRC/test/hotspot/jtreg/compiler/rangechecks/TestDominatingSignedRangeDependencies.java"
"$JTREG_HOME/bin/jtreg" -retain:all -conc:1 -verbose:summary -timeoutFactor:1 \
    "-jdk:$BASE_IMG" \
    '-javaoptions:-Xms1g -Xmx1g -Djdk.test.lib.random.seed=1597463007 -DVerifyIR=false' \
    "-w:$OUT/jtreg/baseline-functional/work" "-r:$OUT/jtreg/baseline-functional/report" \
    "$TEST1" "$TEST2"
"$JTREG_HOME/bin/jtreg" -retain:all -conc:1 -verbose:summary -timeoutFactor:1 \
    "-jdk:$CAND_IMG" \
    '-javaoptions:-Xms1g -Xmx1g -Djdk.test.lib.random.seed=1597463007' \
    "-w:$OUT/jtreg/candidate-ir/work" "-r:$OUT/jtreg/candidate-ir/report" \
    "$TEST1" "$TEST2"
```

Installed jtreg 8.3 preserves `-D` options for driver actions. Thus
`VerifyIR=false` reaches the baseline driver; `-J-D` alone is not a
substitute. Require actual candidate IR matching, rather than skipped or
unavailable matching. `TestDominatingSignedRangeDependencies` has functional
checks but deliberately no blanket no-`CmpU` assertion.

Existing targeted regressions are the following `.java` files under
`test/hotspot/jtreg/compiler/rangechecks/`, plus
`test/hotspot/jtreg/compiler/types/TestTypePropagationToCmpU.java`:

```text
TestRangeCheckSmearing
TestRangeCheckSmearingLoopOpts
TestRangeCheckCastIISplitThruPhi
TestRangeCheckCmpUUnderflow
TestRangeCheckCmpUOverflow
TestRangeCheckCmpUOverflowVsSub
TestArrayAccessAboveRCAfterSmearingOrPredication
TestArrayAccessAboveRCAfterSplitIf
TestArrayAccessAboveRCAfterUnswitching
TestArrayAccessCastIIAboveRC
TestFoldedIfsWrongReexec
TestFoldCompares
TestFoldComparesFuzzer
```

Invoke these exact paths with the same normal jtreg options, separate
baseline/candidate work directories and the fixed seed. A separately
selected functional stress pair may append
`-XX:+UnlockDiagnosticVMOptions -XX:+StressIGVN -XX:StressSeed=1597463007
-XX:VerifyIterativeGVN=111111 -XX:+VerifyLoopOptimizations -DVerifyIR=false`
to both images' `-javaoptions`. These non-whitelisted stress flags do not
provide IR qualification. Do not search seeds or retry a stopped cell.

Finally run `TEST1` on baseline fastdebug with IR enabled in a separate
directory. Only the specific redundant-check IR mismatch is an expected
negative control. An arbitrary nonzero exit is not an accepted result.
Repeat functional checks on matched ordinary release builds before any
performance work; release/skipped IR cannot replace fastdebug IR evidence.
Missing CPU/port coverage stays unqualified rather than triggering runner
provisioning or hosted workflows.

These commands have not been run for this branch. Functional passes, code
size changes and fewer instructions would still not establish throughput.
Performance and compilation-cost measurements require a separate bounded
plan after correctness and dependency review, with fixed alternating
controls, all distributions and losses retained, and profiles outside
timings.
