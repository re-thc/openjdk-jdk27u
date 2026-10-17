# Focused Mac check for byte128 mask packing

Exact source: **`3afce4988dc00fba614929d5f6f10c873afde87e`**, PR43 draft branch
`codex/aarch64-consolidated-compiler-fixes`. These prepared commands have not
been executed here. Use the user's existing native arm64 Mac checkout, selected
SDK/compiler, Boot JDK, jtreg and working hsdis/LLVM tools. Set `PR43_DEPS` to
the existing PR43 `dependencies.json`. This builds one exact-source fastdebug
image and runs only the new test twice: active IR/correctness, then separately
allocated code. It does not repeat the old rule matrix or collect timings.

Run from the existing repository in a clean native arm64 shell without injected
JVM/test options. The new output directory must not exist. No dependency install,
binary transfer, baseline build, historical `run.py all` or SVE forcing is needed.

```bash
set -euo pipefail
PR43_DEPS=/absolute/path/to/existing/pr43-macos-deps/dependencies.json
PR43_PIN=3afce4988dc00fba614929d5f6f10c873afde87e
PR43_OUT="$PWD/../pr43-tolong-${PR43_PIN:0:12}"
test "$(uname -m)" = arm64
PR43_BOOT=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["boot_jdk"])' "$PR43_DEPS")
PR43_JTREG=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["jtreg"])' "$PR43_DEPS")
PR43_GTEST=$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["gtest"])' "$PR43_DEPS")
mkdir "$PR43_OUT"
git fetch --no-tags origin codex/aarch64-consolidated-compiler-fixes
git worktree add --detach "$PR43_OUT/source" "$PR43_PIN"
cd "$PR43_OUT/source"
test "$(git rev-parse HEAD)" = "$PR43_PIN"
test -z "$(git status --porcelain --untracked-files=no)"
bash bin/configure-dev --with-conf-name=pr43-tolong-fastdebug \
  --with-debug-level=fastdebug --with-boot-jdk="$PR43_BOOT" \
  --with-jtreg="$PR43_JTREG" --with-gtest="$PR43_GTEST" \
  --with-version-opt="pr43-$PR43_PIN" --with-native-debug-symbols-level=1 \
  >"$PR43_OUT/configure.log" 2>&1
gmake CONF=pr43-tolong-fastdebug JOBS=2 images >"$PR43_OUT/build.log" 2>&1
PR43_JDK="$PWD/build/pr43-tolong-fastdebug/images/jdk"
PR43_TEST="$PWD/test/hotspot/jtreg/compiler/c2/aarch64/TestByteMaskToLong.java"
file "$PR43_JDK/bin/java" "$PR43_JDK/lib/server/libjvm.dylib" >"$PR43_OUT/image-kind.txt"
"$PR43_JDK/bin/java" -XX:UseSVE=0 -XX:MaxVectorSize=16 \
  -XX:+UnlockDiagnosticVMOptions -XX:+PrintFlagsFinal -XshowSettings:properties \
  -version >"$PR43_OUT/image-properties.log" 2>&1
cp "$PR43_JDK/release" "$PR43_OUT/release.txt"
shasum -a 256 "$PR43_JDK/bin/java" "$PR43_JDK/lib/server/libjvm.dylib" \
  "$PR43_JTREG/lib/jtreg.jar" "$PR43_TEST" >"$PR43_OUT/hashes.txt"
"$PR43_JDK/bin/java" -jar "$PR43_JTREG/lib/jtreg.jar" -version >"$PR43_OUT/jtreg-version.txt" 2>&1

# Main sets UseSVE=0 and MaxVectorSize=16 as framework flags, preserving IR.
"$PR43_JDK/bin/java" -jar "$PR43_JTREG/lib/jtreg.jar" -jdk:"$PR43_JDK" \
  -conc:1 -retain:all -verbose:all -w:"$PR43_OUT/ir/work" -r:"$PR43_OUT/ir/report" \
  -javaoption:-DVerifyIR=true -javaoption:-DExcludeRandom=false \
  -javaoption:-DReportStdout=true -javaoption:-DVerbose=true \
  -javaoption:-DPrintApplicableIRRules=true -javaoption:-DPrintRuleMatchingTime=true \
  -javaoption:-XX:+UnlockDiagnosticVMOptions -javaoption:-XX:+LogCompilation \
  -javaoption:-XX:+TraceDeoptimization \
  "$PR43_TEST" >"$PR43_OUT/ir-launcher.log" 2>&1

# Separate actual installed-code pass; no IR credit from this invocation.
"$PR43_JDK/bin/java" -jar "$PR43_JTREG/lib/jtreg.jar" -jdk:"$PR43_JDK" \
  -conc:1 -retain:all -verbose:all -w:"$PR43_OUT/code/work" -r:"$PR43_OUT/code/report" \
  -javaoption:-DVerifyIR=false -javaoption:-DExcludeRandom=false \
  -javaoption:-DReportStdout=true -javaoption:-XX:+UnlockDiagnosticVMOptions \
  -javaoption:-XX:+LogCompilation -javaoption:-XX:+TraceDeoptimization \
  -javaoption:-XX:CompileCommand=print,compiler.c2.aarch64.TestByteMaskToLong::byte128 \
  -javaoption:-XX:CompileCommand=print,compiler.c2.aarch64.TestByteMaskToLong::block64 \
  "$PR43_TEST" >"$PR43_OUT/code-launcher.log" 2>&1
```

Retain the configure/build logs, source pin, release/image/toolchain receipts,
JTRs and every `hotspot_pid*.log`. The primary acceptance checks are:

- Native Mach-O arm64, `jdk.debug=fastdebug`, source stamp exactly the pin,
  effective `UseSVE=0`, `MaxVectorSize=16`; one actual jtreg identity.
- All **32 NEON annotations active**: two per each of the 16 methods. Require
  Before Matching and After Matching records; the two nonzero-SVE annotations
  are inapplicable here. Any disabled IR/rule, excluded test or missing C2
  record fails this gate even if jtreg reports green.
- All semantic oracles pass, including exhaustive masks, byte64 fallback,
  unconditional shared stores, normalized/non-byte controls and 64-byte edges.
  The source checks all 16 targets' C2 state before and after these inputs.
  Map their C2 compile IDs and retain runtime deoptimization/make-not-entrant
  records throughout; compiled trap *sites* alone are not runtime deoptimizations.
  Investigate invalidated/recompiled versions rather than accepting only an
  earlier C2 compilation as evidence for the final executing version.
- Inspect allocated `byte128` and `block64` nmethod bytes, not matcher-format
  strings: four constant MOVs, DUP, AND, three ADDP, UMOV per fused node,
  correct lane order/zero-extension, and surrounding moves, spills and live
  registers. `block64` has four independent materializations; C2 cannot share
  or hoist their weights independently. Missing decoding leaves this gate open.

No throughput, JMH or parser activation claim follows from these checks.
Mac NEON cannot validate nonzero-SVE execution. Keep the older paired Mac
logical-selection/byte64-pressure capture review separate.
