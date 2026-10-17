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

## Completed local-agent applicability audit

A subsequent 5,811-byte local-agent analysis report was read here. That agent
reviewed the existing full JTRs, commands, checked-out annotations and available
strict-test graphs on the Mac, without changing sources, building or rerunning.
It confirms a focused correctness and active-IR pass at the exact 307315e source.
This is attributed to that local-agent analysis; this executor still has not
directly read the raw Mac files.

The predicted inapplicable set exactly equals the logged disabled set. All the
required rules listed above were active, with no `Skip Rule` notice or global
IR-disable message. Excluded annotations are exclusively SVE-only/x64-only.
Both Flag VM and Test VM commands use UseSVE=0 and enabled IR verification. There
is no unintended Test, Exclude, Scenarios or AllowNotCompilable override; the
strict test deliberately excludes only its scalar oracle methods.

MaxVectorSize=16 is printed by the separate same-image flags process, rather
than directly printed by each Test VM. The Test VMs independently evaluate their
own flag constraints through WhiteBox; the observed applicability agrees with
that value. This is sufficient applicability evidence, with its indirect flag
observation stated explicitly.

The retained strict graphs show C2 compilation and the MATCHING phase, with
18 AddF and 18 AddD occurrences in final-compile ideal output, no AddReductionV
nodes, and no reduce_* nodes in matching output. These support the strict
scalar-order ideal and matcher negatives. The earlier non-strict test's raw
scratch graphs were overwritten by jtreg; its full passing JTR, command,
annotation/disable-set cross-check and framework matching behavior establish
active coverage without inventing retained graphs or a per-rule success line.

The earlier statement that neither report contained disabled text was incomplete:
the detailed audit finds precisely the expected foreign-platform exclusions.
The original runner lacked explicit zero-seed exclusion guards; the later gate
adds them. The local-agent audit closes the actual v3 applicability question
using existing output, rather than retroactively claiming this executor ran that
gate against raw files. No further upload or rerun is needed.

The result remains limited to the exact 307315e focused Mac run. It does not
qualify the later classifier prefilter, release assembly, full suites, SVE
lowering or historical Linux performance recovery.

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
