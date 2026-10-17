# Raw byte128 mask packing

Product commit `9fd8620e40573264ec1f601db67e7f93e05b4939`, directly on PR43,
adds `vstoremask_tolongB16_neon` and two regression-test files. Its parent is
`456afea88231bc9ebf17dfa48811db90a8bae8b8`. No library code, generic shuffle
folding, workflow trigger or benchmark was changed. PR43 remains draft.

The motivating parser path is the four-chunk byte128 implementation in
[StructuralIndexer.java](https://github.com/simdjson/simdjson-java/blob/afee2c32e1b8070a20214e8728079d6759663c8f/src/main/java/org/simdjson/StructuralIndexer.java#L57-L139).
Its five comparison groups contain 20 `toLong()` calls per 64-byte block.
The packing algorithm follows the weighted-mask reduction in
[simdjson's ARM64 implementation](https://github.com/simdjson/simdjson/blob/edb7016c62efbe6155226896cdba5736307190e3/include/simdjson/arm64/simd.h#L123-L140).
This identifies a useful source shape; actual parser activation and performance
have not been measured. No controlled JDK-version regression is established.

## Match and instruction sequence

The rule accepts only `UseSVE == 0`, 16 byte lanes, and
`VectorMaskToLong(VectorStoreMask(rawMask, 1))`. NEON compare/logical masks
contain 0/-1 bytes. Lane i is ANDed with `1 << (i & 7)`. Three byte-wise ADDP
reductions produce the bitmap for lanes 0..7 in byte 0 and lanes 8..15 in byte 1.
The selected bits are disjoint, so no byte sum overflows. UMOV of the low
halfword puts lane 0 in bit 0 and clears every result bit above 15.

The result GPR first materializes `0x8040201008040201`, then supplies DUP. One
vector temporary holds weights and intermediate reductions. No additional
general-register scratch is reserved by the rule. All four constant MOVs and
DUP are inside each fused Mach node, so C2 cannot hoist or share the weights
independently. Four fused nodes in `block64` each materialize their own weights.

| Raw comparison mask path | Instructions before allocation-related moves/spills |
| --- | --- |
| Existing byte128 | NEG + 2 UMOV + 2 × (3 ORR + AND) + combining ORR = 12 |
| New byte128 | MOVZ + 3 MOVK + DUP + AND + 3 ADDP + UMOV = 10 |
| Existing byte64, deliberately retained | NEG + FMOV + 3 ORR + AND = 6 |

These are source-level sequence counts, including constant materialization;
they are not measured performance or installed-code results. Native review must
check actual moves, live ranges, spills and selection alongside other rules.
The existing normalized-boolean path, shared normalization, non-byte masks and
SVE rules retain their implementations. Direct boolean-array masks eliminate
the load/store normalization round trip and do not enter this raw-mask rule.

The upstream file at
[`8610e806260f4eec6d98a5b418e4a1bc11a9a3cb`](https://github.com/openjdk/jdk/blob/8610e806260f4eec6d98a5b418e4a1bc11a9a3cb/src/hotspot/cpu/aarch64/c2_MacroAssembler_aarch64.cpp#L1453-L1483)
still has the three-ORR/AND compression helper and two-half packing sequence.
That source comparison alone does not establish a runtime-version regression.

## Completed local validation

- Repeated vector m4 generation exactly matches the generated AD file. SHA256:
  `c75a25e75a1256e8179704d49c4d98fe6ef920ae557171e4cba62fef31ef1305`.
- Full AArch64 ADLC generation, including scalar, vector, atomic and selected GC
  descriptions, passed for release and fastdebug definitions. The small host
  ADLC tool was built with the existing GCC 16 and AARCH64 target definitions;
  no JDK image or dependency installation was performed.
- An exhaustive model of weighted AND and the three ADDP reductions matched
  all 65,536 byte128 masks.
- The real jtreg `TestByteMaskToLong` passed using the existing Linux x86_64
  OpenJDK 27+35-2325 and jtreg 8.3-dev+1. All 16 C2 assertions and semantic
  oracles executed. The SVE launcher compiled and skipped on unsupported
  hardware. These checks provide no native ARM IR credit.
- `git diff --check` passed. The product increment changes four files, with
  the generated/source AD additions identical and no existing rule edited.

Local evidence is under `/tmp/pr43-maskpack-adlc` (exact commands, logs and
generated output) and `/tmp/pr43-maskpack-jtreg` (JTR and summary). These are
local validation records, not the missing paired Mac captures.

The final product pin is `3afce4988dc00fba614929d5f6f10c873afde87e`. Its
test-only follow-up checks all 16 C2 targets before **and after** exhaustive
inputs, block edges and floating-point edges, and sets `UseSVE=0` plus
`MaxVectorSize=16` through framework flags. Passing MaxVectorSize as a jtreg
Java option instead would disable IR under the framework's whitelist rules.
The corrected test passed with the same existing x86 JDK/harness, with JTR and
summary under `/tmp/pr43-maskpack-final-jtreg`. Its source SHA256 is
`0732c4deb5a5d830c80dd80711b22057523818296f323677282bbd546900a1f8`.
Compiler and generated AD files are identical to the prototype commit above.
The [focused Mac source recipe](MASK_TO_LONG_MAC.md) uses this corrected pin.

## Native gates still pending

`TestByteMaskToLong` has 16 C2 probes, **32 NEON IR assertions** across Before
Matching and Matching, and **two SVE exclusion assertions**. Seven methods
require fusion: signed/unsigned comparisons, AND/OR/XOR/NOT combinations, and
four independent loaded masks assembled into one 64-bit block. Nine controls
retain byte64, shared stores, normalized booleans and non-byte paths. Semantic
oracles cover all 65,536 byte128 patterns, all 256 byte64 patterns, explicit
full-block zero/all/alternating/single-bit masks and floating-point edges.
Positive cases do not use a `fromLong()` round trip.

Ordinary PR CI is the authorized native execution path for this increment.
Run `39077120882` belongs to the initial prototype head, before the post-input
assertion correction, and was automatically cancelled. Ordinary run
[`39079268554`](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39079268554)
belongs to the final corrected pin. Subsequent test commits trigger ordinary CI automatically.
No manual workflow, diagnostics,
JMH, provisioning or native campaign was launched. A green run alone does not
prove every applicable IR rule ran or resolve installed-code/pressure checks.
The SVE launcher requires actual SVE hardware; a Mac NEON pass cannot cover it.

For isolating this new rule, compare `9fd8620e40573264ec1f601db67e7f93e05b4939`
with its parent `456afea88231bc9ebf17dfa48811db90a8bae8b8`, holding all original
ARM fixes and C1 constant. The original consolidated comparison still uses
`9711df62d0d019e6670f83832b09bd5dcf797dcb` as its C1-only baseline. The manifest
continues to pin that historical five-test matrix; it does not silently add
another build or claim that historical 78-rule evidence qualifies this rule.

Existing Mac shifted/rotated logical-selection and byte64 pressure captures
remain unavailable here. Their reported custodian is
`Sentinel_eac712c3944c8191b3618e75bef79647`; actual paths, receipts and hashes
have not been supplied. No new capture was substituted or claimed inspected.
