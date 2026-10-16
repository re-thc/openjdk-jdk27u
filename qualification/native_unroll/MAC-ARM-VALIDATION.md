# Apple Silicon Vector validation

An Apple M6 Mac removes the native-arm64 correctness runner blocker. It can run
WhiteBox, C2 IR/matcher assertions, NEON conversion/reduction tests, compiler stress,
release/fastdebug Vector suites and a separate paired Mac performance experiment.
Its lack of SVE means it cannot validate SVE lowering or establish recovery of the
historical Linux ARM regression. PR43's successful builds/IR/gtest/hsdis establish
useful host infrastructure, not the identity of these classifier/reference VMs.

## Repository and normal build tools

Check out `codex/vector-api-classifier-jtreg83-review` in public
`re-thc/openjdk-jdk27u`; pin the reported review commit for the local agent. The
candidate product tree remains classifier5e2a1a63d4451b54069a365ac1d69dfcd208ee9d;
b3 control is b3ce67e362c3b1678fcf3d18ee714182b2395c86. No Library packet or retained
binary is needed. Use installed native JDK27, Xcode command-line tools/SDK, GNU make4or newer (`gmake`),
Python3 and installed compatible jtreg8.3 build1or later. Capstone is additionally
required for the optional complete performance/assembly scope. No source fetch,
managed installation or execution is authorized by these instructions.

## Recommended command: correctness only, no benchmarks

```bash
git clone --branch codex/vector-api-classifier-jtreg83-review https://github.com/re-thc/openjdk-jdk27u.git
cd openjdk-jdk27u
export BOOT_JDK=/path/to/native/arm64/jdk27
export JTREG=/path/to/installed/jtreg83
export QUAL_OUT=/path/outside/checkout/vector-mac-correctness-v1
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py \
  --platform mac --scope correctness --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" --out "$QUAL_OUT"
# After the local agent receives execution approval; use a fresh output directory:
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py \
  --platform mac --scope correctness --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" --out "$QUAL_OUT" --execute
```

Plan mode executes no JVM/build/download. Correctness mode creates two full b3
images and two classifier HotSpot overlays, runs the generic native Mach-O arm64
fastdebug compatibility smoke before overlays, then all focused gates and four
full release/fastdebug Vector suite configurations. It does not build original87,
run timing processes or claim a performance result. Hard cap24hours; no retry.
The Linux source route instead requires SVE, keeps both ISA configurations and
has its separate36hour cap. No hosted CI or binary transfer is necessary.

## Transparent ordinary source-build equivalents

The runner automates normal worktree/configure/make operations. If the local
agent wants independently built images for direct test commands instead, these
are equivalent full-image source builds (do not also run the automatic builds):

```bash
repo="$PWD"
work="$(dirname "$repo")/vector-mac-manual"
mkdir -p "$work"
git worktree add --detach "$work/control" b3ce67e362c3b1678fcf3d18ee714182b2395c86
git worktree add --detach "$work/candidate" HEAD
for role in control candidate; do
  for level in release fastdebug; do
    (
      cd "$work/$role"
      bash bin/configure-dev --with-conf-name="mac-$level" \
        --with-debug-level="$level" --with-boot-jdk="$BOOT_JDK" \
        --with-jtreg="$JTREG" --with-native-debug-symbols=none --with-jobs=2
      gmake CONF="mac-$level" images
    )
  done
 done
```

Keep the same Xcode/SDK, boot JDK and build options for each matched level; record
source commits, specs, tool versions and image identities. Existing PR43 images
may accelerate only generic harness smoke unless these exact source identities
and configurations match. The automated performance route uses verified overlays
with byte-identical b3 templates/modules rather than assuming independent full
images have identical Java-module payloads.

## Exact focused tests and expected evidence

For direct manual testing, from the review checkout:

```bash
for role in control candidate; do
  for level in release fastdebug; do
    tests='TestFloatRoundTripReduction TestFloatRoundTripReductionEdges TestZeroSeedFPReduction'
    flags='-XX:UseSVE=0'
    if [ "$role" = control ]; then flags="$flags -DVerifyIR=false"; fi
    if [ "$role:$level" = candidate:fastdebug ]; then
      tests="$tests TestZeroSeedFPReductionIR TestZeroSeedFPReductionStrictIR TestFloatRoundTripCompileControls"
    fi
    args=()
    for test in $tests; do args+=("$repo/test/hotspot/jtreg/compiler/vectorapi/$test.java"); done
    "$BOOT_JDK/bin/java" -jar "$JTREG/lib/jtreg.jar" \
      "-jdk:$work/$role/build/mac-$level/images/jdk" \
      -othervm -concurrency:1 -timeoutFactor:2 -verbose:summary \
      "-javaoptions:$flags" "-w:$work/$role-$level-work" \
      "-r:$work/$role-$level-report" "${args[@]}"
  done
 done
```

The automated route additionally requires its existing clean candidate IR checks,
actual ordinary interpreter0/C1=1/C2=4 and cold0 markers, NEON positive matcher,
strict-order negatives, separate chain/OSR controls and fixed-seed stress. Expect
`test result: Passed.` for every selected report; candidate fastdebug must show
`-DShouldDoIRVerification=true`, actual matcher/IR assertions and no disabled
positive rule. `ROUNDTRIP_REDUCTION_PASS`, `ROUNDTRIP_EDGES_PASS`, actual tier
markers and `ROUNDTRIP_CHAIN_PASS` must be present where required. A passing test
that skipped matching is not sufficient. Mac uses the explicit NEON UseSVE=0
configuration once; it does not relabel this as independent SVE coverage.

Successful automated output includes `harness-smoke/result.json` with all three
smoke tests passed, `preflight/jtreg83-gate.json`, `full/full-result.json` with
four suites/72 phase processes/seven separate gap processes, and
`qualification-result.json` with platform=mac, scope=correctness,
timing_executed=false and qualified=false. Failures retain their command/log and
stop; no automatic rerun. hsdis may help review, but raw-code decoder gates in the
complete route require actual machine bytes and cannot accept a missing listing.

## Separate optional paired Mac performance run

Only with a separate new execution approval and fresh output directory:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py \
  --platform mac --scope complete --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" \
  --out /path/outside/checkout/vector-mac-paired-v1
# Add --execute only after approval of this complete Mac campaign.
```

This also builds original87 release from pinned Git commit
87edd79d3104ff502f7befec034716b081436f49. It keeps18 separate release assembly JVMs
and15 NEON-only primary contrasts with12 adjacent AB/BA process pairs each:
up to360 timed JVMs, unchanged five100000-call windows, process-pair bootstrap
uncertainty,1.02 upper non-regression bound, strict compact gains versus original87,
0.01B/call maximum allocation and no pooling/diagnostic printing in timings.
Mac has no Linux taskset pinning; keep the host quiet and treat scheduling effects
through the process-level uncertainty. A missed bound remains a miss, not a rerun
invitation. All Mac output carries historical_linux_recovery_claim=false.
It can establish only this Mac experiment's behavior, never the hosted Linux
regression's recovery or any SVE result. The native Linux/SVE route and its30
primary contrasts remain distinct and outstanding.
