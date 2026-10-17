# Current PR14 native compiler check, without a timing campaign

Repository: https://github.com/re-thc/openjdk-jdk27u.git
Product branch: `codex/vector-reinterpret-8392004`
Candidate: **6b99b2d237904f78fa1b6933c56b2202d8323d83**
Integration base: **416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda** (already merged).
This task has no baseline comparison. Historical performance references remain
original87 (`87edd79d3104ff502f7befec034716b081436f49`) and b3
(`b3ce67e362c3b1678fcf3d18ee714182b2395c86`), for a separately scoped campaign.

## What is ready

One full current-candidate fastdebug image, one committed compilation-control
jtreg test, and two separate observed matching processes. This checks the revised
classifier's ordinary chains and actual OSR exclusion, including the integration
with current master. It does not repeat the accepted historical 307315e
11-test Mac matrix. No interpreter/C1/cold matrix, baseline build, paired timing,
allocation campaign, performance threshold or full suite is included.

Run natively on macOS arm64, or Linux aarch64 (including an ARM64 Linux container
executing on ARM64 hardware). A Linux container on Apple Silicon usually supplies
NEON without SVE: this task explicitly uses UseSVE=0 and makes no Linux/SVE claim.
Do not use x86 emulation. Supply installed native boot JDK27, jtreg8.3, Python3.11+
and the normal OpenJDK build dependencies. macOS needs Xcode/SDK and GNU make4+;
Linux uses GCC16/g++16 and mold for the repository profile. No tool installation
or endpoint substitution is part of the task. Use whitespace-free paths and a
fresh output directory and adequate space for a full native JDK build. Stop on any failure, absent prerequisite, source mismatch,
four-hour overall budget or non-quiescent process cleanup; do not retry or expand
scope. The local agent should supervise child process groups within that budget.

The old `native_source_qualify.py --scope complete` does contain a performance
runner, but its product pins and b3-module overlays predate this merged source.
It is **not** the ready recipe for this candidate. Do not repin it casually:
current master changed Java modules, so a historical b3 module image is not an
established compatible template for this VM. This task builds its own full image.
Release assembly and a current matched performance comparison still need separate
source/provenance integration and their applicable execution scope.

## Checkout and tool selection

Set `REPO`, `OUT`, `BOOT_JDK`, `JTREG` to native-host absolute paths. OUT must be
fresh and outside REPO. Check out the pin, not an unrecorded later branch head:

```bash
set -euo pipefail
export REPO=/absolute/path/openjdk-pr14-current
export OUT=/absolute/path/qual-out/pr14-current-codegen-v1
export BOOT_JDK=/absolute/path/native-jdk27-home
export JTREG=/absolute/path/installed-jtreg83
# Clone if needed; otherwise fetch the branch in the existing clean clone.
git clone --branch codex/vector-reinterpret-8392004 https://github.com/re-thc/openjdk-jdk27u.git "$REPO"
git -C "$REPO" checkout --detach 6b99b2d237904f78fa1b6933c56b2202d8323d83
test "$(git -C "$REPO" rev-parse HEAD)" = 6b99b2d237904f78fa1b6933c56b2202d8323d83
test -z "$(git -C "$REPO" status --porcelain)"
test ! -e "$OUT"
mkdir -p "$OUT"
cd "$REPO"
unset JAVA_TOOL_OPTIONS JDK_JAVA_OPTIONS _JAVA_OPTIONS CLASSPATH
case "$(uname -s):$(uname -m)" in
  Darwin:arm64)
    export CC="$(xcrun --find clang)"
    export CXX="$(xcrun --find clang++)"
    export SDKROOT="$(xcrun --show-sdk-path)"
    export MAKE="$(command -v gmake)"
    configure_os=(--with-toolchain-type=clang "--with-sysroot=$SDKROOT")
    ;;
  Linux:aarch64)
    export CC="$(command -v gcc-16)"
    export CXX="$(command -v g++-16)"
    export MAKE="$(command -v make)"
    command -v mold
    configure_os=()
    ;;
  *) echo 'Native Darwin arm64 or Linux aarch64 is required' >&2; exit 1 ;;
esac
# Preserve invocation names, particularly clang++; never realpath/resolve these.
printf 'CC=%s\nCXX=%s\nMAKE=%s\n' "$CC" "$CXX" "$MAKE" > "$OUT/tool-invocations.txt"
python3 - <<'PYCODE'
import hashlib,json,os
from pathlib import Path
rows={}
for name in ['CC','CXX','MAKE']:
    p=Path(os.environ[name])
    with p.open('rb') as f:digest=hashlib.file_digest(f,'sha256').hexdigest()
    rows[name]=dict(invocation=str(p),resolved=str(p.resolve()),sha256=digest)
(Path(os.environ['OUT'])/'tool-identities.json').write_text(json.dumps(rows,indent=2)+'\n')
PYCODE
"$MAKE" --version > "$OUT/make-version.txt"
"$BOOT_JDK/bin/java" -jar "$JTREG/lib/jtreg.jar" -version > "$OUT/jtreg-version.txt" 2>&1
```

Require GNU make4+, jtreg8.3 and native JDK27 before continuing. On macOS inspect
`file "$BOOT_JDK/bin/java" "$BOOT_JDK/bin/javac"` and the Xcode compiler/SDK
paths. Keep selected invocation paths and canonical executable provenance
separate. A compatible jtreg8.3+0 does not need replacement with build1.

## Full current fastdebug build and one committed control test

```bash
bash bin/configure-dev --with-conf-name=pr14-current-codegen \
  --with-debug-level=fastdebug --with-jobs=1 \
  "--with-boot-jdk=$BOOT_JDK" "--with-jtreg=$JTREG" \
  --with-native-debug-symbols=none "${configure_os[@]}" \
  > "$OUT/configure.log" 2>&1
"$MAKE" CONF=pr14-current-codegen JOBS=1 images > "$OUT/build.log" 2>&1
export IMAGE="$REPO/build/pr14-current-codegen/images/jdk"
"$IMAGE/bin/java" -XX:UseSVE=0 -XX:+PrintFlagsFinal -version > "$OUT/flags.log" 2>&1
"$BOOT_JDK/bin/java" -jar "$JTREG/lib/jtreg.jar" "-jdk:$IMAGE" \
  -othervm -concurrency:1 -timeoutFactor:2 -verbose:summary \
  -javaoptions:-XX:UseSVE=0 "-w:$OUT/work" "-r:$OUT/report" \
  test/hotspot/jtreg/compiler/vectorapi/TestFloatRoundTripCompileControls.java \
  > "$OUT/jtreg.log" 2>&1
```

Require one passed JTR, chain counts1/8/32/64 with actual=4,
`ROUNDTRIP_CHAIN_PASS`, and
`ROUNDTRIP_OSR_NEGATIVE_PASS ordinary=0 osr=4 bci=2`. Compile elapsed values printed
by this diagnostic are not runtime performance data. This WhiteBox test is not an
IR-framework test; it does not claim matching merely from its passing status.

## Explicit matcher positive and OSR negative

Compile the committed control and WhiteBox into fresh diagnostic classes; the
source path resolves the test's ForceInline annotation. Observe one eight-term
ordinary chain and one isolated OSR process. These are not timed workloads.

```bash
mkdir "$OUT/classes"
"$IMAGE/bin/javac" --add-modules=jdk.incubator.vector \
  -sourcepath "$REPO/test/lib:$REPO/test/hotspot/jtreg" -d "$OUT/classes" \
  test/lib/jdk/test/whitebox/WhiteBox.java \
  test/hotspot/jtreg/compiler/vectorapi/TestFloatRoundTripCompileControls.java \
  > "$OUT/javac.log" 2>&1
python3 - <<'PY'
import json,os
from pathlib import Path
out=Path(os.environ['OUT'])
for mode,method in [('chains','chain8'),('osr','osrNegative')]:
    (out/(mode+'-directives.json')).write_text(json.dumps([dict(
        match='compiler.vectorapi.TestFloatRoundTripCompileControls::'+method,
        PrintIdeal=True,PrintIdealPhase='MATCHING')])+'\n')
PY
for mode in chains osr; do
  "$IMAGE/bin/java" --add-modules=jdk.incubator.vector -XX:UseSVE=0 \
    -XX:+UnlockDiagnosticVMOptions -XX:+WhiteBoxAPI "-Xbootclasspath/a:$OUT/classes" \
    -XX:-TieredCompilation -DchainLength=8 -XX:+TraceOnStackReplacement \
    "-XX:CompilerDirectivesFile=$OUT/$mode-directives.json" \
    -XX:+LogCompilation "-XX:LogFile=$OUT/$mode.xml" \
    -cp "$OUT/classes" compiler.vectorapi.TestFloatRoundTripCompileControls "$mode" \
    > "$OUT/$mode.log" 2>&1
done
python3 - <<'PY'
import json,os,re,subprocess
from pathlib import Path
repo=Path(os.environ['REPO'])
assert subprocess.check_output(['git','-C',str(repo),'rev-parse','HEAD'],text=True).strip()=='6b99b2d237904f78fa1b6933c56b2202d8323d83'
assert not subprocess.check_output(['git','-C',str(repo),'status','--porcelain'],text=True).strip()
out=Path(os.environ['OUT'])
chain=(out/'chains.log').read_text();osr=(out/'osr.log').read_text()
assert 'ROUNDTRIP_CHAIN_PASS' in chain and 'actual=4' in chain
assert re.search(r'AFTER:\s*MATCHING\b',chain)
assert chain.count('convF2I2F_reduce_acc4F_neon')>=8
assert 'ROUNDTRIP_OSR_NEGATIVE_PASS ordinary=0 osr=4 bci=2' in osr
assert re.search(r'AFTER:\s*MATCHING\b',osr)
assert re.search(r'OSR entry @ pc:.*TestFloatRoundTripCompileControls::osrNegative',osr)
assert 'convF2I2F_reduce_acc4F_neon' not in osr
result=dict(passed=True,source='6b99b2d237904f78fa1b6933c56b2202d8323d83',
            scope='current-native-fastdebug-codegen',UseSVE=0,
            performance_qualified=False,timing_campaign=False,release_assembly=False)
(out/'codegen-result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
PY
```

Acceptance requires both the single passing jtreg test and `codegen-result.json`
passed=true, with all source/build/tool logs, directives, XML and observed matcher
logs preserved locally. Also retain spec.gmk and the built image identity. Stop
on failed matching, scalar checks, compiler installation or OSR isolation; do not
convert a skipped positive into a pass. Report a concise text result; no binary
handoff, rerun of the historical matrix, timing claim or automatic scope expansion.
