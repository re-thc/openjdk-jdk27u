# Preserved evidence

The original raw evidence is frozen locally as `evidence-6bb477a/manifest.json`:
39 files with byte counts and SHA-256 digests, including exact configure/build
logs, jtreg summaries and named `.jtr` cases, both C2 compilation logs, both
minimal-case assembly logs, and the original probe source/class. The original
working logs remain intact. Raw logs, class files, VM binaries and host data
are not published. The public JSON extracts contain node IDs / method scopes
and instruction offsets, with no process addresses or host configuration dump.

## Build identities

| Item | Identity |
|---|---|
| Fork base | `89885a6288e7aaabd01678a704a586272c0f96e3` |
| Common GCC16 prerequisite / baseline source | `2c3ecf578a57f2eb4d5ed30d395e537764e0fa99` |
| Original candidate source-equivalent commit | `6bb477a6d0e0b18ee59c2c956f54ca0b27ffad5e` |
| Configuration | `threshold-fastdebug`, server, GCC16.2.0, installed jtreg8.3-dev+1 |
| Exploded image SOURCE string | `2c3ecf578a57+` |
| Baseline libjvm SHA-256 | `447db6af4e733bbb041655a7d4efb1df6d71f4505913ede6b5c78c5c997969a3` |
| Candidate libjvm SHA-256 | `684d589783b0c312e8d3df7b72eef97ac42a3fa34a0c0bd95ca6b8471205e385` |
| Candidate ifnode.cpp SHA-256 | `dcd9b4e36238ed96d6051043d6c9a438bf2a8eaa0af41d999fb4c5f30ae94558` |

The SOURCE string alone does not identify the candidate: it was built from the
common prerequisite with an uncommitted C2 delta, then committed as `6bb477a...`.
The saved ifnode.cpp bytes match that commit; the two binary hashes distinguish
VMs. The baseline contains no threshold helper. The candidate binary remains
byte-identical during the strengthening work. No claim is made that the scalar
extraction in the follow-up source has been linked into that VM.

The common prerequisite is the exact four-line JDK-8391051 diagnostic scope from
upstream `51bb52c5c0a5a764dd080dc23bed0829fd0ae638`, supplied in fork commit
`01903ba375f94c0ab7f9193d3e36bd30fe663d7e`. A clean fastdebug GCC16 build first
failed with `-Werror=nonnull` in UnsafeAccessErrorHandshakeClosure. The same
prerequisite was then used for baseline and candidate. It is not part of the
C2 optimization claim. The earlier release probe used SOURCE `33e539f2d4a8`;
that stale-binary observation is excluded from the current-source proof.

## Exact original commands

Paths below use `REPO` and `TOOLS` for the original repository and installed
toolchain root. The archived configure log records the expanded paths. No
new configure/build command was run for the follow-up.

```sh
. "$TOOLS/activate.sh"
cd "$REPO"
bash configure --with-conf-name=threshold-fastdebug --with-jobs=4 \
  --with-debug-level=fastdebug --with-boot-jdk="$TOOLS/jdk27" \
  --with-jtreg="$TOOLS/jtreg83" --with-freetype=bundled \
  --with-toolchain-path="$TOOLS/gcc16/bin" \
  --with-extra-ldflags="-fuse-ld=mold -B$TOOLS/mold/bin" \
  --x-includes="$TOOLS/sysroot/usr/include" \
  --x-libraries="$TOOLS/sysroot/usr/lib/x86_64-linux-gnu" \
  --with-cups-include="$TOOLS/sysroot/usr/include" \
  --with-fontconfig-include="$TOOLS/sysroot/usr/include" \
  --with-alsa-include="$TOOLS/sysroot/usr/include" \
  --with-alsa-lib="$TOOLS/sysroot/usr/lib/x86_64-linux-gnu"

# Baseline after applying the common prerequisite; threshold source absent.
make CONF=threshold-fastdebug hotspot jdk
# Candidate after applying the final private-search helper.
make CONF=threshold-fastdebug hotspot
```

The original [ThresholdProbe.java](ThresholdProbe.java.txt) is preserved unchanged.
Its source SHA-256 is `d547b24bf44d45ec507cab79b0d9fc1f3a47e122c77c379d32b0ccd1cba1c5b9`;
its archived class SHA-256 is
`dd429c901703a3fd8c818e39df6f2194d8ef08eee8e167a2f1aeb69d8f7530b5`.
For each VM the exact launch options were:

```sh
"$JAVA" -Xbatch -XX:-TieredCompilation \
  '-XX:CompileCommand=compileonly,ThresholdProbe::direct' \
  '-XX:CompileCommand=compileonly,ThresholdProbe::normalized' \
  '-XX:CompileCommand=inline,ThresholdProbe::mask64' \
  '-XX:CompileCommand=print,ThresholdProbe::*' \
  -cp "$PROBE_CLASSES" ThresholdProbe
```

Copy the preserved text to `ThresholdProbe.java` when compiling the probe.
The 100,000-call loop trains compilation. It is the original diagnostic probe,
not a throughput measurement. `hsdis` was unavailable; the emitted machine bytes
were disassembled locally with installed `objdump`, and C2 OptoAssembly supplies
an independent symbolic view. Published extracts select exact C2 method/descriptor
and compile ID, not an arbitrary `cmp64` occurrence.

| Method / phase | Baseline | Candidate |
|---|---|---|
| `ThresholdProbe::direct(IJ)J`, C2 | compile26: cmp63/jg, cmp64/jge, unstable-if trap, 160 main-code bytes | compile23: cmp63/jg, no cmp64 or unstable-if trap, 112 main-code bytes |
| `ThresholdProbe::normalized(IJ)J`, C2 | compile27, 112 bytes | compile24, 112 bytes |
| `TestIfConstantThreshold::testMask(IJ)J`, PrintIdeal | compile1035, two CmpI / two If | compile1035, one CmpI / one If |

Compare [evidence-original.json](evidence-original.json). Its extractor verifies
these counts and the direct-case trap removal before writing its result:

```sh
python3 doc/c2-constant-threshold/extract_evidence.py \
  --baseline-ir "$BASELINE_COMPILATION_LOG" --candidate-ir "$CANDIDATE_COMPILATION_LOG" \
  --baseline-asm "$BASELINE_PROBE_LOG" --candidate-asm "$CANDIDATE_PROBE_LOG"
```

## Original regression commands/results

```sh
"$TOOLS/jtreg83/bin/jtreg" -jdk:"$CANDIDATE_JDK" \
  -w:"$OUT/candidate-work" -r:"$OUT/candidate-report" -timeoutFactor:4 \
  test/hotspot/jtreg/compiler/c2/irTests/TestIfConstantThreshold.java

# Same class under the saved baseline: expected IRViolationException, 22
# positive methods fail; semantic checks and four negative IR cases pass.
# The baseline's trap rule still expected exactly one If; the candidate rule
# allows <=1 because elimination permits an existing CMove optimization.

"$TOOLS/jtreg83/bin/jtreg" -jdk:"$CANDIDATE_JDK" \
  -w:"$OUT/stress-work" -r:"$OUT/stress-report" -timeoutFactor:4 \
  -javaoption:-XX:+UnlockDiagnosticVMOptions -javaoption:-XX:+StressIGVN \
  -javaoption:-XX:StressSeed=8275202 -javaoption:-XX:VerifyIterativeGVN=1110 \
  test/hotspot/jtreg/compiler/c2/irTests/TestIfConstantThreshold.java
```

Original candidate: 28 semantic methods, 26 IR rules passed. Stress: semantic
checks passed; the framework explicitly disables IR matching under StressIGVN.
The saved `.jtr` files and compiler logs identify both facts. No stress-IR pass
is claimed.

The nearby run used `-conc:4 -timeoutFactor:4` and these 19 Java source files,
producing the following **20 passed jtreg cases** (two descriptions in the
rangechecks file). These are the named cases, not an unspecified compiler suite:

- `compiler/c2/TestDeadLoopSplitIfLoop`
- `compiler/c2/TestFoldCompares`
- `compiler/c2/TestFoldCompares2`
- `compiler/c2/TestFoldIfRemovesTopNode`
- `compiler/c2/TestIfWithDeadRegion`
- `compiler/c2/irTests/CmpUWithZero`
- `compiler/c2/irTests/TestBackToBackIfs`
- `compiler/c2/irTests/TestUnsignedComparison`
- `compiler/igvn/TestFoldComparesCleanup`
- `compiler/integerArithmetic/TestIntegerComparison`
- `compiler/loopopts/PeelingZeroTripCount`
- `compiler/loopopts/TestCountedLoopCastIV`
- `compiler/loopopts/TestCountedLoopZeroIter`
- `compiler/loopopts/TestLostDependencyOnZeroTripGuard`
- `compiler/loopopts/TestNotifyOpaqueZeroTripGuardToCmpI`
- `compiler/loopopts/TestOpaqueZeroTripGuardPostLoopRemoval`
- `compiler/loopopts/TestZeroTripGuardShared`
- `compiler/rangechecks/TestFoldCompares_Xcomp`
- `compiler/rangechecks/TestFoldCompares_vanilla`
- `compiler/uncommontrap/FoldedIfNonDomMidIf`

The original first candidate broadened `same_condition` and hit a loop-merging
caller assertion in the merged-diamond test. That candidate was discarded.
The qualifying implementation confines the match to `search_identical` and
leaves `same_condition` unchanged. The archive identifies the final build/logs,
not that failed intermediate candidate. Independent source review accepted the
final algebra, domain exclusions, dominating projection and control rewiring.

## Strengthening delta, without a new VM build

The saved baseline VM was placed in a local JDK view sharing the same Java
modules/native support libraries. Its libjvm hash was preserved. The added
canonical IfFalse case has two CmpI/two If in baseline and one CmpI/a CMoveL
in the existing candidate. The long signed/unsigned mismatch retains one CmpL,
one CmpUL and both Ifs. Full compile IDs/scopes are in
[evidence-strengthening.json](evidence-strengthening.json).

The full strengthened class passes on the saved candidate: 30 semantic methods,
28 IR rules. The saved baseline fails 23 positive IR methods, including IfFalse;
the five negative cases pass. A `-DTest` filter was supplied to the baseline
launch, but these grouped @Run methods still compiled the full class, as the
23-failure `.jtr` report records. No narrower execution is claimed.

The scalar extraction and C2 call site passed a syntax-only compile with the
saved actual ifnode command flags. The actual native `.cpp` test bodies ran
through a temporary standalone shim, 4 bodies / 26 production-predicate checks.
Each of four mutants removed only one signed/unsigned endpoint exclusion for
one width; each produced exactly one assertion failure. No copied arithmetic
predicate was substituted. Normal GoogleTest registration/linkage and a VM
rebuilt with the extraction remain pending, as stated in README.

This is source/test and diagnostic codegen evidence. It is not codec throughput,
a compiler-speed measurement, or evidence that the full Java/native gap is fixed.
