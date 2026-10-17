# UBFX compilation-assertion repair

Test-only review commit: `d46869ad8a53cd815ba18eedc06900e1be9451be`, now applied
directly to PR43 as `456afea88231bc9ebf17dfa48811db90a8bae8b8`. No qualification
documentation or tooling was added to the product PR.
Compiler/runtime sources remain identical to candidate
`bf4d2615bf435e8889ef95e48220938505905bbb`.

`RunInfo.isTestC2Compiled(String)` delegates to `TestVM.isC2Compiled`, which
returns true only for `TriState.Yes`. Under supported `ExcludeRandom`, an
intentionally uncompileable method yields `TriState.Maybe`. The old raw boolean
assertion therefore fails even though the framework intentionally skipped it.
`TestFramework.assertCompiledByC2` delegates to the assertion API, which rejects
`TriState.No` and accepts intentional `Maybe`. The four UBFX probes now use this
same API as the neighboring shift/logical tests. In normal mode an unexpectedly
uncompiled method still produces `No` and fails.

All 28 IR annotations, 14 test method bodies, four positive probes, negative
controls, warmup and semantic oracles remain unchanged. The repaired file SHA256
is `37b36c86db5f0a22f63343594ffd5f7ea6227e57c28a33f65894ab094d741396`;
the original was
`bf595ff5e0fb3eb166f112858af9de87c3194f191b76a6244d8307aada8e89c7`.

## Focused fixture

The committed fixture uses the real repository framework and an existing JDK
and jtreg. It overlays the original/repaired test in separate source roots,
retains complete commands/JTRs, and checks these exact outcomes:

| Case | Expected and observed result |
| --- | --- |
| Original; ExcludeRandom and explicit extract32 exclusion | Fails at `extract32 must be C2 compiled` |
| Repaired; identical exclusions | Passes |
| Repaired; normal compilation | Passes |
| Repaired; extract32 unexpectedly excluded in normal mode | Fails at `should have been C2 compiled` |

The four cases were run with existing OpenJDK 27+35-2325, jtreg 8.3-dev+1,
Linux x86_64. Seed 43 also intentionally excludes extractWide from compilation.
These are portable assertion-contract results. The fixture explicitly disables
IR and provides **no native AArch64 IR or performance credit**. It does not build
a JDK, install dependencies or start CI.

```sh
python3 doc/qualification/pr43-macos/check_ubfx_assertions.py \
  --jdk /your/existing/jdk-27 --jtreg /your/existing/jtreg \
  --work /your/fresh/fixture-output
```

The normal ARM qualification runner keeps `VerifyIR=true`, exact applicability
for all 28 UBFX rules (78 total), compiled-C2 inventories and retained phase
checks. Its audit now also rejects the framework assertion's failure message.
Removing any one of the 28 applicable UBFX rules is covered by a rejecting
offline fixture. Intentional exclusions cannot be credited as qualification.

Native correctness results remain the user's report for the original pinned
pair, not a new execution of this repair. The remaining code-generation gate
needs the **existing paired Mac text evidence** for shifted/rotated selection,
moves/spills and byte64 register pressure. The report custodian is identified
as `Sentinel_eac712c3944c8191b3618e75bef79647`; actual capture paths/hashes have
not been supplied here. Performance/JMH and nonzero-SVE execution remain
untested. No new campaign is requested by this repair.
