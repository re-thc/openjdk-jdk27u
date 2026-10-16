# Run PR43 qualification on your local Apple Silicon Mac

Check out this review branch and run the committed commands below. All source,
tests, audits and build instructions are in Git. Local builds are the default.
No CI artifact, Library file, private workspace, chat patch or Linux binary is
required. This is documentation/test tooling only; it does not change PR43's
product source or merge it.

## Standard prerequisites, checked before builds

- A **native macOS arm64** shell/agent, not Intel or Rosetta. The runner records
  `uname`/Python architecture, CPU model, macOS version, NEON and translation
  status, selected SDK and compiler before compiling anything.
- Selected Xcode/Command Line Tools with a usable macOS SDK and Apple Clang;
  run `xcode-select --install` if absent, then select the installed developer
  directory normally. Configuration reports unsupported toolchain/SDK versions.
- Git, Python 3.9+, Bash, curl, tar, zip/unzip, `shasum`, **autoconf and GNU make**.
  With an existing Homebrew installation: `brew install autoconf make`.
- A native macOS arm64 **JDK 26 or 27** to bootstrap JDK 27, JTReg 8.2.1+1,
  and GoogleTest 1.14.0 sources. `setup.sh` obtains these standard dependencies
  from public upstream sources, with the Boot JDK SHA256 and Git commits pinned.
  JTReg's upstream build obtains its normal checksum-verified dependencies.
  Existing equivalent installations may instead be supplied in `dependencies.json`.
- Sufficient free disk/memory for four JDK builds; allow roughly 40 GB free and
  start with two build jobs. Actual free disk is reported. No system packages
  or security settings are changed by the runner.

`python3 doc/qualification/pr43-macos/run.py probe` reports actual missing tools.
A failed dependency request is a concrete blocker: stop that request, retain the
error, and do not bypass proxies, TLS, Gatekeeper, quarantine or other controls.
The script does not install Homebrew/Xcode or silently substitute another ISA.

## One complete local run

From the repository root, using a native arm64 terminal:

```sh
bash doc/qualification/pr43-macos/setup.sh ../pr43-macos-deps
python3 doc/qualification/pr43-macos/run.py all \
  --deps ../pr43-macos-deps/dependencies.json \
  --work ../pr43-macos-work --jobs 2
```

The dependency setup is resumable. The runner reuses its exact completed local
builds when source/dependency/compiler/SDK fingerprints still match; otherwise it
configures and builds the pinned sources. A phase can be resumed using `build`,
`test` or `instructions` instead of `all`. All directories belong to this scoped
run; an existing checkout at another revision is rejected rather than reset.
Use yielding process execution in an agent and report progress from build logs.

For already installed standard dependencies, replace setup with a JSON file:

```json
{"boot_jdk":"/your/native/jdk-26/Contents/Home","jtreg":"/your/jtreg","gtest":"/your/googletest"}
```

These are ordinary local tool paths, not handoff packets. The default requires
no prebuilt candidate/baseline images. Existing exact Mac CI images are optional
acceleration only: the candidate run has release `12053481227` and fastdebug
`12052458015`; no exact baseline Mac bundle was found. They are not required or
automatically downloaded. Never reuse a Linux image on the Mac. Do not reuse a
binary solely from its filename: verify source, architecture, debug level,
compiler/SDK and image hashes, and declare any difference. Local paired builds
avoid that ambiguity.

## Exact identities and build scope

| Role | Immutable source commit |
| --- | --- |
| Candidate | `bf4d2615bf435e8889ef95e48220938505905bbb` |
| Baseline: original base plus C1 prerequisite only | `9711df62d0d019e6670f83832b09bd5dcf797dcb` |
| Original plain base, recorded but not an extra default build | `758f41576fc79d35a62a3896dbe5ab97c448c436` |
| C1 upstream donor | `abf881b0108610051fb36636a5f8ce44e8076ddb` |

The runner creates detached worktrees for candidate and baseline, then builds
**fastdebug and release for both**, matching the already supplied Mac-agent
prompt. Each uses `bash bin/configure-dev`, the same selected compiler/SDK,
Boot JDK/JTReg/GTest, `--with-debug-level=fastdebug` or `release`, a source-stamped
version, and `gmake images test-image-hotspot-gtest`. The profile is the fork's
headless Apple-M1 CPU baseline with Serial/G1/ZGC. No third plain-master JDK,
benchmark JAR, stress campaign or CI workflow is built. Build and dependency
logs are retained; Java and libjvm must be native Mach-O arm64. Both image debug
levels, actual JVM properties, source stamps and binary hashes are recorded.

The handoff commit itself is not the candidate JDK identity: product builds are
explicitly from the two commits above. Advancing `master` does not change this
controlled comparison. A later current-master integration is a new identity and
needs its own review/evidence. Do not silently rebase or pool old timings.

## Tests, annotations and negative controls

Identical **candidate test sources** at the pinned candidate commit are used
against all four images. `manifest.json` pins their SHA256 values and per-method
IR applicability. No regression annotation, expected node, warmup, C2 assertion,
shared store or semantic oracle is weakened. The only added Java source is the
committed instruction-only driver, copied to a separate candidate test worktree;
it disables IR for its own separate captures, never for the primary IR gate.

- [TestLongBitfieldExtract](../../../test/hotspot/jtreg/compiler/c2/aarch64/TestLongBitfieldExtract.java):
  14 C2 targets, **28 IR rules**. All four baseline-positive probes must fail for
  **missing ubfxLConvL2I**: extract32, extract40, extractNegative and extractWide.
  Preserve the ten matching exclusions/idealization controls and all 14 input
  assertions. Do not treat a random baseline failure as successful sensitivity.
- [TestTruncatedLongShift](../../../test/hotspot/jtreg/compiler/c2/aarch64/TestTruncatedLongShift.java):
  15 C2 assertions, **13 IR rules**. Eight missing-node positives on baseline:
  shift32, shift48, shift63, shiftNegative, shiftWrapped, shiftNegative32,
  shiftWrapped63, shiftRedundantMask. Exclusions: shift31, shiftWrapped31,
  shiftVariable. Retain the two BEFORE_MATCHING assertions and shared/widening
  controls. A disappearing mask can expose LSR while remaining an UBFX negative.
- [TestTruncatedLongBitwise](../../../test/hotspot/jtreg/compiler/c2/aarch64/TestTruncatedLongBitwise.java):
  **34 C2 assertions, 13 IR rules**. and/mask each require andLConvL2I, or requires
  orLConvL2I, xor requires xorLConvL2I; baseline must fail for each missing node.
  Six exclusions: constantAnd/Or/Xor and immediateAnd/Or/Xor. Preserve the other
  24 shifted/rotated/shared/widened/loaded/call-pressure controls.
- [TestFirstTrueMaskNormalization](../../../test/hotspot/jtreg/compiler/vectorapi/TestFirstTrueMaskNormalization.java):
  11 C2 assertions, **22 IR rules**; byte64/byte128 are fused positives and
  intended baseline failures. Eight non-byte controls plus shared retain the
  unfused normalization/query path. Keep all 65,536 masks across all eleven
  queries, unconditional shared stores and floating-point edges. Its existing
  driver explicitly forces **UseSVE=0**.
- [TestEmptySwitchProfile](../../../test/hotspot/jtreg/compiler/profiling/TestEmptySwitchProfile.java):
  both C1/C2 compilers required; the two upstream IR checks and semantics must
  pass on both source trees. C1 is held constant between arms. Historical
  plain-master-versus-prerequisite evidence remains separate; no third default
  build is necessary to reproduce a known independent prerequisite bug.

All five annotations allow macOS: the first three require C2 and condition IR
on AArch64; firstTrue requires AArch64+C2, not Linux; C1 requires C1+C2.

The primary matrix is **20 test-class runs**. Candidate fastdebug must pass all
**76 ARM rules plus two C1 rules** with active verification and no exclusions.
Baseline fastdebug C1 must pass; the four matcher classes must fail only for the
**18 intended missing-node probes** while all 30 input annotations and 28
matching negative controls remain correct. The auditor rejects unrelated failed
methods, compilation/semantic failures, absent applicability or absent phases.
Release runs must pass semantics and C2 checks; their skipped IR is expected and
is never counted as IR verification or as a required baseline IR failure.

`-retain:all`, ReportStdout, Verbose, PrintApplicableIRRules,
PrintRuleMatchingTime and LogCompilation retain applicability, method/compile
identity and **Before Matching / After Matching** logs, including successful
runs. Ordinary CI did not retain all these normal phase logs; green CI is not a
replacement. Raw logs and conservative audit results live under the chosen work
directory. The auditor's own tests can run on any host without a JDK build:

```sh
python3 -m unittest discover -s doc/qualification/pr43-macos -p 'test_*.py'
```

## Assembler and installed instructions

The runner executes the complete AssemblerAArch64 group from matching test images
on all four builds. validate must be present; candidate fastdebug/release must
also include and pass the new SHRN test. Its absence on baseline is expected.

Separate release instruction captures run all four matcher classes via the
committed driver. Their semantic/C2 assertions still execute, but IR is explicitly
not credited in this diagnostic pass. Inspect actual nmethod bytes/decoded
instructions, **not merely the matcher's format strings**:

- UBFX width/shift immediates and 64-bit LSR counts 32–63, including normalized
  Java aliases; signed/unsigned widening and shared full-width users.
- ANDW/ORRW/EORW and shifted/rotated alternatives, loads and calls; moves, spills
  and register liveness. The nominal new 2.0 shift/rotate+narrow-logic cost versus
  old 2.9 shifted-logic+conversion is a review point, not a speed claim.
- byte128 SHRN #4 then FMOV/RBIT/CLZ/LSR #2; byte64 without SHRN and LSR #3;
  empty masks and the unused byte64 temporary's register-pressure effect.

If hsdis is unavailable, retain complete raw code for offline decoding rather
than blocking the semantic/IR runs or calling instruction review passed. An
ordinary optional LLVM installation (`brew install llvm`) provides llvm-mc.
`decode.py --hex '20 84 0c 0f'` is a known SHRN encoder sanity example; pass actual
installed bytes in address order for real probes. The local agent must review
captures and record conclusions; the runner deliberately does not declare an
instruction pass from finding an opcode name in a string.

## Exact coverage limits and final report

This Mac run can qualify the portable AArch64 scalar/C1/NEON compiler changes,
including active IR, rule-absent sensitivity and Mac native emitted code. It does
not qualify Linux ABI/runtime-specific diagnostics, and none are prerequisites
to execute these portable tests.

This source's BSD/macOS AArch64 port sets no SVE CPU feature and its SVE-length
operations are ShouldNotCallThis. Do not force UseSVE=1/2 and mistake fallback to
zero for a test. **Nonzero-SVE exclusion remains uncovered here**. Any separate
followup needs only an actual SVE-capable platform at one nonzero mode, not
unavailable wide SVE. Keep accepted upstream/BiSheng provenance for unchanged
prior wide-SVE work; do not relaunch PR12/18 or equate it to new PR43 execution.

No stress or performance claim is part of `all`. If a correctness failure needs
stress, first give its exact reproducer and bounded native plan. After correctness,
performance is separate: matched release images on this same Mac, uninstrumented
runs, fixed flags/affinity, forks/warmups/raw results/uncertainty and unchanged
controls. CompareFirstTrue supplies byte64/128 early/late/empty/uniform plus
int/long controls; a benchmark harness must be built explicitly if requested.
Never time regression-test loops or reuse old pooled timing, and make no codec
or default Arrays.mismatch claim from these tests.

Finish the complete assigned run. Report exact source/image/compiler/SDK hashes,
all per-test/IR/control outcomes, decoded-code findings, and the precise SVE/
stress/performance/current-master limits. If blocked, report the exact missing
standard prerequisite or failed command/log and continue independent checks.
Do not stop after another checklist or wait for CI binaries. Keep PR43 draft;
no merge, push, CI dispatch, upload or security bypass is performed by this tool.
