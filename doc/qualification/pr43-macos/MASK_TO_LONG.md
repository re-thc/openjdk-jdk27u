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
they do not measure performance. The reported native captures below confirm
the sequence and allocation in two methods; parser selection and pressure
remain unmeasured.
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

Pre-disconnect local evidence was under `/tmp/pr43-maskpack-adlc` (exact commands, logs and
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

On 2026-10-18 the executor reconnected with the clean product checkout still
at that pin. No local Java, compiler or make process remained. The temporary
JTR, ADLC commands/generated files and isolated-index proof under `/tmp` were
no longer present. The successful pre-disconnect outcomes above were observed
and recorded before the disconnect; their raw temporary receipts are now lost.
Published source and these notes survived. No build, measurement or native
campaign was restarted to recreate the files. The existing ordinary AArch64
release/debug CI jobs were independently confirmed still building after the
reconnect; their eventual results remain separate from the earlier local checks.

## Reported native NEON qualification

`TestByteMaskToLong` has 16 C2 probes, **32 NEON IR assertions** across Before
Matching and Matching, and **two SVE exclusion assertions**. Seven methods
require fusion: signed/unsigned comparisons, AND/OR/XOR/NOT combinations, and
four independent loaded masks assembled into one 64-bit block. Nine controls
retain byte64, shared stores, normalized booleans and non-byte paths. Semantic
oracles cover all 65,536 byte128 patterns, all 256 byte64 patterns, explicit
full-block zero/all/alternating/single-bit masks and floating-point edges.
Positive cases do not use a `fromLong()` round trip.

The user's 2026-10-18 native Mac report records a pass at exactly
`3afce4988dc00fba614929d5f6f10c873afde87e`, using recipe commit
`10bb6e3b487f66c638b8b762e2da9b515b8e57da`. The recipe file's independently
checked SHA256 is
`19a04936c386690a8aeadb02ee83b3098cf018e0a98bba50710023b955d0838b`,
matching the prefix in the report. Both IR and code stages ran once and passed
1/1, with no retries. The worktree stayed clean and image hashes were unchanged
before/after. The completed check is not being repeated.

The reported image is native Mach-O arm64 fastdebug, stamped with source
`3afce4988dc0`, on Apple M6/macOS 27.0.1, Xcode 27.1/Apple Clang 21 with
`CXX=/usr/bin/clang++`. Effective Test VM flags were `UseSVE=0` and
`MaxVectorSize=16`. A dependency file was made from already installed JDK 27,
jtreg 8.3-dev+1 and GoogleTest 1.14.0. That harness identity is separate from
the older matrix's jtreg 8.2.1 identity.

| Gate | Reconciliation of the supplied report |
| --- | --- |
| Active IR and semantics | All 32 NEON rules match: Before Matching and Matching for all 16 targets, including byte64, shared stores, normalized booleans and non-byte controls. Only rule 3 of byte128/byte64 is inapplicable, because it requires nonzero SVE. |
| C2 retention | Every target has one standalone, don't-inline C2 nmethod and no target runtime trap or recompilation through the exhaustive inputs. Seven deoptimization records belong to C1 helpers before the target C2 installs; they do not indicate target C2 loss. |
| byte128 allocated code | 56 instructions for the whole nmethod. Its fused sequence materializes `0x8040201008040201` with MOV plus three MOVK, then DUP, AND, three ADDP and zero-extending UMOV. No spills or stack traffic beyond the frame were reported. |
| block64 allocated code | 102 instructions for the whole nmethod, with four independent weight materializations, four packing sequences and ORR shifts 16/32/48. Eight vector loads/four masks fit in v16-v23 without spills. Weights are neither shared nor hoisted. |
| Decoding and lane oracle | There was no hsdis. Capstone and llvm-mc agreed on the raw MachCode bytes. Decoded-instruction replay matched 65,536 byte128 masks and 125,604 block64 cases; deliberately corrupting a weight or shift made the oracle fail. These are replay sensitivity controls, not a rule-absent native baseline run. |

IR and capture used separate JVMs. Code-stage C2 ids 1263/1270 are not relabeled
as the IR-stage compilations. This is a reconciliation of the user's supplied
report; raw Mac JTRs, phase logs, nmethod bytes and full image/harness hashes
remain on the Mac and were not independently reprocessed in this checkout.
The native correctness, matcher and two-method code-generation gates are met
**as reported**. No remaining ordinary source/test correction is indicated.

## Remaining decision limits

Ordinary run
[`39079268554`](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39079268554)
belongs to this source head and tests synthetic merge
`40ed69081e6968ce4d0cbdd2b20a31c2e2191315` with master
`416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`. At the 2026-10-18 inspection,
all four Linux builds and all 12 AArch64 tier1 jobs passed. Ten x64 tier1 jobs
passed; langtools was running and JDK part 2 was queued. The overall run had
not completed. Green CI is supporting context, not a substitute for the native
IR/capture evidence above. No manual workflow or timing was started.

The existing AArch64 fastdebug
[compiler-part-1 job](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39079268554/job/117574251027)
was inspected read-only. Its log explicitly records both
`TestByteMaskToLong.java` and `TestByteMaskToLongSVE.java` as execution passes,
including a driver run for the SVE launcher. These were existing CI runs, not
newly dispatched tests.

Nonzero-SVE qualification remains open: the two SVE rules are inapplicable on
this Mac, not executed exclusion passes. The Linux launcher pass is supporting
coverage, but the inspected aggregate log does not expose its effective SVE
mode, applicable-rule inventory or phase records. Those existing records would
need review before crediting the SVE exclusion gate; the aggregate pass alone
is insufficient. No new SVE or wide-SVE campaign is requested.

Profitability and parser activation remain unmeasured. All four MOVs and DUP
are inside each fused Mach node; C2 cannot hoist/share the weights independently.
The 10-versus-12 sequence count and the whole-method 56/102 counts establish no
throughput, latency or simdjson speedup. No spills in these two probes does not
establish parser-wide register pressure. The current evidence cannot decide
performance go/no-go or a controlled JDK-version regression.

Any later, separately authorized profitability comparison must isolate this
rule: current source `3afce4988dc00fba614929d5f6f10c873afde87e` versus
`456afea88231bc9ebf17dfa48811db90a8bae8b8`, holding the original ARM fixes and
C1 constant, with matched native workload activation and unchanged controls.
No such timing is requested or run here. The original consolidated comparison still uses
`9711df62d0d019e6670f83832b09bd5dcf797dcb` as its C1-only baseline. The manifest
continues to pin that historical five-test matrix; it does not silently add
another build or claim that historical 78-rule evidence qualifies this rule.

Existing Mac shifted/rotated logical-selection and byte64 pressure captures
remain unavailable here. Their reported custodian is
`Sentinel_eac712c3944c8191b3618e75bef79647`; actual paths, receipts and hashes
have not been supplied. The new toLong captures do not resolve those older
shift/rotate selection and firstTrue byte64 pressure questions. No new capture
was substituted or claimed inspected. PR43 remains draft and unmerged.
