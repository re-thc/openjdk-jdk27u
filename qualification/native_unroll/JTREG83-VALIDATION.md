# PR14 jtreg83 compatibility and native validation

Check out `codex/vector-api-classifier-jtreg83-review` from
`https://github.com/re-thc/openjdk-jdk27u.git`. This committed branch contains the
implementation, tests, source-build commands and validation plan. No Library file,
chat patch, private packet or retained binary is required for source reproduction.
The focused PR14 product branch remains unchanged.

## Current admission decision

Installed 8.3-dev+1 has no demonstrated incompatibility with the suite minimum
8.2.1+1. Its seven JARs can be reused unchanged when their recorded identities
match. Rebuilding it is a delivery choice, not a compatibility requirement.

**The native workflow is intentionally disabled.** Its `harness-admission` job has
`if: false`; both candidate overlays require that job, and preflight requires both
admission and completed overlays. `jtreg83_harness.py admit` also fails closed.
No Boolean edit alone implements or authorizes a route. Do not enable native
compute until one authorized common harness route and the complete compatibility
smoke pass before either overlay. There is no executable archive-endpoint override,
source-harness build, binary upload or second unbound harness in this workflow.

The exact unresolved dependency access is
`https://git.openjdk.org/jtharness/archive/jt6.0-b24.zip`: the existing executor's
proxy returned Forbidden on both authorized attempts. Previously proposed GitHub
archive substitution has been removed from executable code. No new endpoint,
retry, substitute fetch or download is authorized by this source revision.
Resolution requires authorized access to the official recipe's dependency route
on the intended runner, or a separately authorized unchanged8.3 delivery route.
Neither route has been admitted. Native compute stays disabled meanwhile.

## Build from Git (commands only; builds/network need their applicable approval)

Use a matching-host Linux toolchain: Bash, GNU make, zip/unzip, wget or curl,
Python3 plus PyYAML for the offline tests, a suitable C/C++ toolchain and mold for
`bin/configure-dev`, and an installed JDK27 boot JDK. These are normal build-tool
inputs; this proposal does not install or change global tools. Set `BOOT_JDK` to
its path. Use fresh directories and retain all logs, source identities, downloaded
checksummed dependencies and supplied license/notice files.

The official jtreg route uses the default tagged recipe, without a substitute
endpoint. The known denied dependency must be authorized before executing this
route; these instructions are not permission to retry it in this executor.

```bash
repo="$PWD"
work="$(dirname "$repo")/pr14-source-validation"
mkdir -p "$work"
git clone --depth 1 --branch jtreg-8.3+1 https://github.com/openjdk/jtreg.git "$work/jtreg-source"
test "$(git -C "$work/jtreg-source" rev-parse HEAD)" = 551e17adac0579859012c4c46318b8fa3cf2ff37
(
  cd "$work/jtreg-source"
  timeout --signal=TERM --kill-after=30s 20m env \
    JTREG_BUILD_MILESTONE=dev JTREG_BUILD_NUMBER=1 MAKE_ARGS=-j2 \
    WGET_OPTIONS='--tries=1 --timeout=45 --max-redirect=10' \
    CURL_OPTIONS='--fail --location --retry 0 --connect-timeout 20 --max-time 60' \
    bash make/build.sh --jdk "$BOOT_JDK" > "$work/jtreg-build.log" 2>&1
)
JTREG="$work/jtreg-source/build/images/jtreg"
```

Use a clean environment without dependency/checksum overrides. The exact official
source commit and dependency versions/checksums are in `jtreg83-provenance.json`.
The build verifies its upstream checksums. Stop on access denial or mismatch.
Generated JAR hashes are recorded by the compatibility smoke; do not demand byte
identity with the installed dirty-marker distribution. Complete corresponding
source/license coverage for bundled vendor binaries must be assessed before any
future public harness binary delivery. This workflow makes no such delivery.

For a fresh source-built candidate/control pair, use the same toolchain and boot
JDK for both roles. The control is b3ce67e362c3b1678fcf3d18ee714182b2395c86; the
candidate is this review checkout's unchanged product tree, pinned to classifier
5e2a1a63d4451b54069a365ac1d69dfcd208ee9d. These four source builds are an alternative
reproduction route, **not approved additions to the old two-overlay CI budget**.

```bash
git worktree add --detach "$work/control" b3ce67e362c3b1678fcf3d18ee714182b2395c86
git worktree add --detach "$work/candidate" HEAD
for role in control candidate; do
  for level in release fastdebug; do
    (
      cd "$work/$role"
      export ROLE="$role" LEVEL="$level" BOOT_JDK JTREG
      timeout --signal=TERM --kill-after=30s 90m bash -euc '
        bash bin/configure-dev --with-conf-name="source-$ROLE-$LEVEL" \
          --with-debug-level="$LEVEL" --with-boot-jdk="$BOOT_JDK" \
          --with-jtreg="$JTREG" --with-jobs=2
        make CONF="source-$ROLE-$LEVEL" images test-image
      ' > "$work/$role-$level-build.log" 2>&1
    )
  done
 done
```

The subshell explicitly exports its role, level, boot JDK and harness paths.
Record the checkout commits, tool identities, spec.gmk, generated image hashes and
logs for each build. These fresh images form a new source-built experiment; never
pass them off as the pinned historical artifact bytes.

## Complete generic harness compatibility smoke

An exact classifier VM is not necessary. A complete matching-ISA fastdebug image
with C2 and its build spec is sufficient. The optional local accelerator is
`/workspace/pr14-pure-b3-jdk`; its VM matches
`/workspace/pr14-traced-b3/build/pr14-trace-x86/jdk/lib/server/libjvm.so`, and that
build's spec declares fastdebug/x86_64. The complete launcher, javac, modules,
release and VM are hashed in `jtreg83-provenance.json`. This is a generic harness
smoke, not evidence for the classifier. Runtime usability remains to be tested.

Fresh source reproduction instead selects
`DEBUG_JDK="$work/control/build/source-control-fastdebug/images/jdk"` and
`DEBUG_SPEC="$work/control/build/source-control-fastdebug/spec.gmk"`. Use the
source-built `JTREG` above or an identity-checked installed harness. Then:

```bash
python3 qualification/native_unroll/jtreg83_harness.py smoke \
  --image "$JTREG" --jdk "$BOOT_JDK" \
  --debug-jdk "$DEBUG_JDK" --debug-spec "$DEBUG_SPEC" --out "$work/harness-smoke"
# The above only prints the plan. After runtime approval, use a fresh output path:
timeout --signal=TERM --kill-after=30s 10m \
  python3 qualification/native_unroll/jtreg83_harness.py smoke \
  --image "$JTREG" --jdk "$BOOT_JDK" \
  --debug-jdk "$DEBUG_JDK" --debug-spec "$DEBUG_SPEC" --out "$work/harness-smoke" --execute
```

The smoke verifies ELF host ISA, complete image files, fastdebug spec and exact
VM correspondence before execution. It runs runtime version/minimum admission,
ClassFileInstaller driver, native WhiteBox API in othervm, and a generic fastdebug
C2 AddI IR assertion. Reports must show all three tests passed, explicit native
WhiteBox/IR-enabled markers and the post-assertion driver marker; disabled/skipped
IR fails. Missing/unsuitable debug images explicitly defer compatibility. A trivial
minimum test never produces complete-compatibility success. The source suite is
generated in the output directory with external library roots into this checkout;
no tracked product/test tree is edited. No checks have been executed yet.

## Native validation after admission

For source-built images, run the same selected harness against both roles, with
fresh work/report paths. On native AArch64 run both default SVE and UseSVE=0:

```bash
for role in control candidate; do
  for level in release fastdebug; do
    for sve in default 0; do
      flags=''
      if [ "$sve" = 0 ]; then flags='-XX:UseSVE=0'; fi
      tests='TestFloatRoundTripReduction TestFloatRoundTripReductionEdges TestZeroSeedFPReduction'
      if [ "$role" = control ]; then flags="$flags -DVerifyIR=false"; fi
      if [ "$role:$level" = candidate:fastdebug ]; then
        tests="$tests TestZeroSeedFPReductionIR TestZeroSeedFPReductionStrictIR TestFloatRoundTripCompileControls"
      fi
      args=()
      for test in $tests; do args+=("$repo/test/hotspot/jtreg/compiler/vectorapi/$test.java"); done
      timeout --signal=TERM --kill-after=30s 20m "$BOOT_JDK/bin/java" \
        -jar "$JTREG/lib/jtreg.jar" \
        "-jdk:$work/$role/build/source-$role-$level/images/jdk" \
        -othervm -concurrency:1 -timeoutFactor:2 -verbose:summary \
        "-javaoptions:$flags" "-w:$work/$role-$level-$sve-work" \
        "-r:$work/$role-$level-$sve-report" "${args[@]}"
    done
  done
 done
```

Control-only VerifyIR=false avoids claiming the new candidate pattern on the old
VM; candidate applicable positive/negative IR assertions remain mandatory. This
reproduction command does not replace the original compiler stress/OSR/chain
controls, installed-release assembly gate or predefined process-paired performance
acceptance criteria. Run the original release/fastdebug Vector API suites and
relevant compiler stress before qualification. No native performance campaign is
approved or claimed here. OSR/ABI/MAX/wide-fallback gaps remain separate.

The optional historical-acceleration workflow retains independently pinned native
controls/templates 11978661561 and 11981413932 (run38738016505, producing head
c3f36a85551d32ea18a4e468b9001dad9406097a; control product b3), and frozen payload
11881672203 (run38539204173, head e9d8e403e1978fe4bd805ab7d83d8db6533af86d).
Fresh metadata is committed in `jtreg83-artifact-status.json`; all three existed
and were unexpired at observation. They are optional acceleration, not source
reproduction prerequisites. Exact classifier overlays were not produced in the
previous failed run. If later admitted, the old acceleration budget stays two
90-minute serialized HotSpot overlays and one120-minute preflight, attempt1 only,
with original capture bounds. No artifact expiry is silently repinned.

## Offline validation

From a clean review commit:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/test_jtreg83_bundle.py --out /tmp/jtreg83-offline-review
```

This checks source preservation, exact installed bytes, admission failure/disabled
dependency ordering, complete smoke evidence versus skipped/missing IR, optional
image suitability, workflow bounds and shell syntax. No JVM, build or download.
