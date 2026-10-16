# Native ARM Vector qualification from Git

This is the active, repository-only qualification route. The exact8.2.1 binary,
Library archives, saved compiled classes and historical image artifacts are not
inputs. The earlier artifact-bound workflow is retired. PR14 remains unchanged;
the diagnostic branch carries the reviewed classifier product/test trees.

## Host and execution approval

Use a quiet, dedicated Linux aarch64 host with enabled SVE, adequate RAM/disk for
three full JDK builds plus two overlays, and a native JDK27 boot JDK. The current
executor is x86_64 and cannot execute this route. Supply an installed harness satisfying the suite minimum 8.2.1+1 (including
8.3+0). Generic admission does not require the historical distribution filenames
or bytes. Its actual JARs and full payload are bound once and rechecked throughout;
no comparison may silently switch harnesses. Local x86 compatibility already
passed minimum admission, native WhiteBox, driver/othervm and an actual AddI IR
assertion; native compatibility is checked again on the intended host.

Required tools: gcc-16/g++-16 and binutils, mold, make, standard OpenJDK build
prerequisites, taskset, Python 3.11+ with capstone for assembly/complete scopes. Use normally provisioned
build tools and JDK27; this runner does not install tools or download binaries.
If building jtreg is necessary, use official openjdk/jtreg commit
551e17adac0579859012c4c46318b8fa3cf2ff37 and its normal `bash make/build.sh --jdk
"$BOOT_JDK"` recipe with `JTREG_BUILD_MILESTONE=dev JTREG_BUILD_NUMBER=1` and
checksum checks enabled. Do this only where the default official dependency
routes are authorized. The previously denied git.openjdk.org JT Harness URI is
not retried or replaced by this runner. A host with a compatible installed
harness needs no transfer or harness-source fetch from this executor.

A new approval is required for **one native campaign capped at36hours**, with
three full reference JDK image builds, two HotSpot-only overlays, correctness,
IR/stress,36 separate assembly JVMs, at most720 timed JVMs and full suites/phases.
This approval has not been granted. The earlier local smoke approval is consumed;
no stage of this campaign has run. No hosted CI launch is needed or implied.

## Checkout, inspect plan, execute once after approval

Clone the public repository and check out the review commit/branch. All scripts,
probe sources and tests are committed. Set the paths below to host installations:

```bash
git clone --branch codex/vector-api-classifier-jtreg83-review https://github.com/re-thc/openjdk-jdk27u.git
cd openjdk-jdk27u
export BOOT_JDK=/path/to/native/jdk27
export JTREG=/path/to/installed/jtreg83
export QUAL_OUT=/path/outside/checkout/vector-native-source-v1
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py \
  --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" --out "$QUAL_OUT"
# Only after the single native campaign is approved; output must not already exist:
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/native_source_qualify.py \
  --boot-jdk "$BOOT_JDK" --jtreg "$JTREG" --out "$QUAL_OUT" --execute
```

Default mode prints the complete plan and starts no JVM, build, network request or
benchmark. Execution requires native aarch64 and enabled SVE; missing tools,
inherited JVM/classpath overrides, dirty reviewed source, changed harness/tools,
missing assembly or failed gates stop without retry. The runner enables a child
subreaper, bounds every process group, and applies a36hour hard timer. Worktrees,
logs, input/build identities and partial results stay in the fresh output folder.
There is no automatic resume or second attempt.

## Complete Linux sequence and retained gates

1. Verify the single installed harness and decoder/tool availability; require
   default SVE coverage. Build the pinned b3 fastdebug reference from Git, then
   require the complete WhiteBox/driver/othervm/IR compatibility smoke. Neither
   candidate overlay can run before this passes.
2. Build pinned b3 release from Git. Defer original87 release until correctness passes. The reference image
   builds use identical tools/profile/options within each debug level. Build two
   classifier HotSpot overlays over the corresponding b3 images, preserving all
   template entries except libjvm. This avoids rebuilding candidate Java modules.
3. Compile the committed kernels/controller/WhiteBox once. The source experiment
   manifest records source commit/files, javac image, every class/payload hash,
   image identities and matching build-tool receipts; the fifth original reference is
   added after correctness without recompiling classes. Every comparison uses
   these same newly compiled bytes. No historical byte hashes or private packet
   are needed. The legacy scripts keep their old defaults for old experiments;
   this route explicitly selects the new source-input manifest.
4. Run the existing actual interpreter/C1/C2/cold semantics, candidate positive and
   negative IR/matcher assertions,48 chain compilation diagnostics, separate
   matching/OSR controls and fixed-seed compiler stress. Historical-pattern IR is
   disabled only for control semantic checks; candidate IR gates remain intact.
5. Only after correctness passes, build original87 release with the same tools
   and extend the source-input manifest without recompiling any probe. Run36 separately attributed ordinary-entry release assembly processes. The
   existing decoder gate requires full machine bytes, correct conversion dataflow,
   scalar recurrence, no fallback calls and unchanged raw-control loops. No graph,
   assembly, compilation log or WhiteBox observation enters timed processes.
6. Run the four legacy recovery contrasts first: candidate versus source-built
   original87 and matched b3, each under default SVE and UseSVE=0. Each contrast
   uses12 balanced adjacent AB/BA process pairs, five fixed100000-call windows,
   no measured compilation, process-pair uncertainty and20000 paired bootstraps.
   Any upper95% ratio above1.02 or allocation above0.01B/call stops retention.
7. Run the remaining26 primary contrasts for four/eight-byte compact headers and
   raw/direct/arithmetic controls, separately by ISA/header/kernel. Retain the
   upper-ratio1.02 criterion, compact conversion gains versus original87 strictly
   below1, and maximum allocation over every measured window. No pooling away
   misses, reruns for precision, diagnostic unroll caps or tradeoff acceptance.
   Two archived-toolchain-drift comparisons are omitted because this experiment
   builds its b3 reference itself; all30 primary conditions remain.
8. Run all eight release/fastdebug compiler-vectorapi and JDK-vector suite
   configurations, actual phase controls and separate OSR/ABI/wide/MAX gap audits.
   This does not claim those independent allocation gaps are repaired.

Stage caps are committed in the printed plan:90min initial fastdebug reference,
10min smoke,250min b3 release/overlay builds,10min common compilation,
100min focused preflight,90min deferred original87 release build,120min assembly,60min recovery,240min retention and16hours
full suites/phases/gaps, all within36hours. A cap hit is a concrete incomplete
qualification result, not permission to extend/rerun it.

`qualification-result.json` is written only after all automated stages pass.
It deliberately leaves `qualified=false`: review actual assembly/IR, all paired
uncertainty, suite results and separate gap findings before claiming regression
qualification. The probe results cannot establish literal simultaneous zero
regressions. No merge, force-push or product-PR update is performed.

## Source-only regression checks

```bash
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/test_native_source.py --out /tmp/vector-source-offline
PYTHONDONTWRITEBYTECODE=1 python3 qualification/native_unroll/test_jtreg83_bundle.py --out /tmp/vector-harness-offline
```

These use inert fixtures and metadata reads, not compilers/JVMs/network/builds.
Optional installed image checks are skipped explicitly if unavailable, so fresh
checkout testing does not require a retained host binary.

For Apple Silicon, see [MAC-ARM-VALIDATION.md](MAC-ARM-VALIDATION.md). Its
`--platform mac --scope focused` is the smallest two-build fastdebug smoke,
semantics and actual IR/NEON gate. `--scope assembly` separately captures release
code without original87 or timings; `--scope correctness` runs the later full
correctness suites without a paired performance campaign;
`--platform mac --scope complete` is a separate NEON-only Mac experiment. Neither
can establish SVE behavior or historical Linux recovery.
