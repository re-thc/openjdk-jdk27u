# Reported Mac focused v3 result and IR applicability audit

The supplied 8,621-byte text report describes one native Mac execution at
307315e89def00ae96e7e9c86b105a855d774d3b against b3 reference
b3ce67e362c3b1678fcf3d18ee714182b2395c86, on 2026-10-17 from 18:01:27 to
18:15:06 UTC. It reports clean sources, successful reference and overlay builds,
all 11 selected tests passed, preserved clang++/gmake invocation names, and an
image delta confined to libjvm.dylib. It reports actual interpreter/C1/C2/cold
semantics, all generic harness markers, and enabled candidate IR verification.
The report was read; the original JSON/JTR/build outputs on the user's Mac were
not independently read or hash-verified here. Abbreviated hashes in that report
are not complete image identity pins.

The reported qualification result is passed=true, qualified=false,
timing_executed=false, release_assembly=false and full_suites=false. This is a
native NEON focused correctness result. No performance recovery, SVE lowering,
full-suite completion or allocation-gap repair follows from it. No rerun is
needed merely because successful IR matching prints no explicit success line.

## What the checked-in IR framework actually does

- `TestFramework.runTestVM` invokes `IRMatcher.match()` when IR verification is
  enabled. A failed match throws IRViolationException; the successful matcher
  does not print a per-rule success message.
- `ApplicableIRRulesPrinter` selects annotations by platform, CPU features and
  flags. `TestClassParser` returns NonIRTestClass if no applicable methods exist;
  that class succeeds without matching. Thus an enabled flag alone is not a
  per-rule applicability certificate.
- Under aarch64, UseSVE=0 and MaxVectorSize>=16, the non-strict test's float64,
  float128 and double128 rules 1/2 apply: ideal non-strict reduction plus the
  corresponding NEON matcher. Its carried and independent 128-bit rules apply
  with asimd. Its strictFloat/strictDouble negative ideal rules are unconditional.
- In the profitability-override strict test, strictFloat/strictDouble rules 5/6
  apply on NEON: scalar ADD_F/ADD_D, no vector reduction/no non-strict identity,
  plus no non-strict NEON matcher. The override does not demonstrate profitable
  strict vector lowering on NEON; the expected strict path remains scalar.
- SVE-only annotations in both tests are intentionally inapplicable on this Mac.
  Their disable notices are normally sent to the driver's stdout via
  TestVmSocket -> StdoutMessages. The optional Applicable IR Rules table is
  printed only with PrintApplicableIRRules or Verbose. Its absence is normal.

The report's passing tests, enabled IR flag and stated no disabled verification
are consistent with successful matching. Its statement that neither zero-seed
report contains any disabled/skipped text is not enough to independently audit
individual applicability: several SVE-only rules should be disabled. This may
reflect which output sections were searched. The original runner explicitly
checked the carried128/reversed positive rules, but did not explicitly reject
skipped essential zero-seed rules. The new gate adds those checks and rejects unsupported-node `Skip Rule` IDs
that overlap required NEON rules (these notices omit the method name), missing
UseSVE=0 commands and contradictory IR-disable flags; it does not
retroactively claim that the v3 raw output passed the strengthened gate.

## Smallest existing-output excerpts for independent confirmation

No new build, JVM or test run is requested. From the existing v3 directory,
provide only:

1. `qualification-result.json` (small complete file) and `focused/gate.json`'s
   platform, source_head, passed and configurations role/sve/report-name fields.
2. From `focused-candidate-sve0-flags.log`, the UseSVE and MaxVectorSize lines.
3. From each of these two existing JTR files under
   `focused/focused-candidate-sve0-work/compiler/vectorapi/`, extract the
   execStatus/test-result line, Test VM command line containing
   ShouldDoIRVerification/UseSVE, and **all** lines containing
   `Disabling IR matching`, `Skip Rule`, `IR verification disabled`, `Applicable IR Rules`
   or `Test VM Messages`:
   `TestZeroSeedFPReductionIR.jtr` and
   `TestZeroSeedFPReductionStrictIR.jtr`.

If the JTR commands show enabled verification, no global disable and no disable
of the required NEON rules, the passing framework reports suffice; no explicit
success line or rerun is needed. If excerpts are still ambiguous, inspect the
existing retained test-VM logs/applicability messages before proposing any new
execution. Do not transfer JDK images or bulk binaries.

## Offline fixture repair

The invocation helper correctly preserves the selected path and separately
canonicalizes provenance. Tests incorrectly expected those strings to coincide
when the temporary directory has a symlinked ancestor (macOS /var -> /private/var).
Expected provenance paths now use resolve(); expected invocation paths remain
lexical. `test_fixture_tmpdir.py` runs both offline suites under an artificial
symlinked TMPDIR so this failure is tested on Linux too. No TMPDIR override is
required of the user and no production path semantics were relaxed.

## Remaining substantive compiler qualification

The focused Mac pass validates the reported NEON correctness scope for the
classifier, not causal recovery of the original Linux AArch64 regression.
Remaining work is separately attributed ordinary-entry release assembly,
fixed pair-common paired legacy/compact/raw/direct/arithmetic comparisons,
Linux default-SVE and UseSVE=0 coverage, and release/fastdebug full suites and
compiler stress. The original unroll-admission/cost-accounting hypothesis is not
proven by this Mac result; the candidate classifier must retain the accumulator
and preserve strict ordering without arbitrary unroll caps. OSR mixed Phis,
surviving vector-argument ABI calls, wide fallback and dynamic insert remain
independent allocation issues. No new measured campaign is authorized here.
