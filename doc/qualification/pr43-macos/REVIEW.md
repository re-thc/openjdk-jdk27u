# PR43 source and qualification review

The product source remains `bf4d2615bf435e8889ef95e48220938505905bbb` on
`codex/aarch64-consolidated-compiler-fixes`. The paired prerequisite-only baseline
is `9711df62d0d019e6670f83832b09bd5dcf797dcb`, with the same C1 fix in both arms.
PR43 is open and draft. This review and its tooling fixes belong to the separate
`codex/pr43-macos-qualification` branch. The proposed replacement PR body is in
[PR_DESCRIPTION.md](PR_DESCRIPTION.md); it has not been published to PR43.

## Evidence and recommendation

The user-supplied report `Sentinel_eac712c3944c8191b3618e75bef79647` identifies
the exact candidate and baseline above. It reports Apple M6 arm64/NEON,
macOS 27.0.1, SDK 27.0, Apple Clang 21.0.0, Boot JDK 27, GNU make 4.4.1,
Autoconf 2.73, jtreg 8.2.1-dev+0, GoogleTest 1.14.0 and LLVM hsdis 23.1.3,
using matching build configuration and toolchain in both arms.

These are user-reported native outcomes. The Mac build receipts, JTR files,
phase logs, image/harness hashes and disassembly were not supplied to this
checkout and have not been independently inspected here. They are distinct from
the source/static checks performed here and the previously inspected ordinary
CI evidence for run 38860660092, whose 57 jobs passed.

| Gate | Reconciliation of the reported result |
| --- | --- |
| Native source/debug-level profiles | All four release/fastdebug builds and profile checks passed for the exact paired commits. |
| Original candidate test semantics | All 20 class runs passed their semantic checks. Baseline matcher failures are intentional, not semantic failures. |
| Active fastdebug IR | UBFX 28, shift 13, bitwise 13, firstTrue 22 and C1 2: all **78** rules passed on candidate, with none excluded. These match the pinned source inventory exactly. |
| Rule-absent baseline | Exactly **18** intended missing-node failures: UBFX 4, shift 8, bitwise 4, firstTrue 2. The four UBFX probes had zero fused nodes on baseline versus one on candidate, with identical input shapes. The complete passing candidate rule set includes the 28 matching exclusion controls. |
| Vector oracles | The unchanged original firstTrue test exhausts all 65,536 masks, checks shared boolean stores, non-byte queries and floating-point edges. Its reported complete semantic/IR pass covers those oracles under UseSVE=0. |
| Assembler | **42/42** cases across the four builds is consistent with 11 candidate and 10 baseline cases per debug level; SHRN is new on candidate and passed on both candidate builds. |
| Installed instructions | Separate captures reportedly show UBFX, LSR, W-register AND/ORR/EOR, FMOV/RBIT/CLZ/LSR and byte128 SHRN. Assembly flags were absent from the active-IR runs. This establishes the reported opcode checks, not a measured speedup. |

No correctness or matcher blocker is apparent in that report or in the source
review. The smallest remaining material qualification step is **read-only review
of the existing paired capture records**, not another native campaign. Bind the
records to the two commits, native images and one actual harness identity, then
compare shifted/rotated logical alternatives, shared/loaded/call-pressure cases
and byte64/byte128 for instruction count, moves, spills and live registers.
In particular, the new shift/rotate plus narrow logical path has nominal cost
2.0 versus the old shifted logical plus conversion at 2.9, and the byte64 rule
reserves a vector temporary it does not emit. The supplied opcode summary does
not explicitly resolve these selection/pressure questions. If that existing-code
review finds no adverse selection, recommend PR43 for final review/merge with
the correctness scope stated above and no performance claim. An adverse finding
needs a focused source decision; a source change creates a new qualification
identity.

Performance/JMH and nonzero-SVE execution/IR/performance remain untested. No
benchmark or build is requested by this review. The new NEON rule is statically
guarded by `UseSVE == 0`; its SVE runtime exclusion is not claimed as executed.
Keep the accepted upstream/BiSheng provenance for unchanged wide-SVE work as
provenance, without restarting PR12/18 or requiring unavailable wide hardware
for this scalar/NEON review.

## Harness minimum

`make/autoconf/lib-tests.m4` checks release **8.2.1**. Hotspot, JDK and langtools
`TEST.ROOT` files declare **8.2.1+1**. Upstream jtreg
[`Version.compareTo`](https://github.com/openjdk/jtreg/blob/5afa26a21f06e3f231982f0d0abc50c33d68167c/src/share/classes/com/sun/javatest/regtest/tool/Version.java#L179)
compares numeric release components first and ignores the milestone. For equal
releases it returns equality when either build is zero, treating that build as
unspecified. [`Tool`](https://github.com/openjdk/jtreg/blob/5afa26a21f06e3f231982f0d0abc50c33d68167c/src/share/classes/com/sun/javatest/regtest/tool/Tool.java#L1140)
uses that comparator to enforce `requiredVersion`. The 8.3+1 source has the same
comparison behavior.

Consequently `8.2.1-dev+0` satisfies this declared minimum under upstream
semantics; the label is not evidence of skipped IR or an incompatible harness.
The reported full active-IR counts and sensitive baseline failures provide
substantive execution evidence. No harness defect is indicated. Actual harness
source/bytes still require its retained identity receipt; the version alone
does not establish them. The selector's former strict tuple comparison was too
restrictive and is corrected with offline regression coverage. No native rerun
is warranted solely because of the `-dev+0` label.

## Source review

All four ARM aggregate deltas still have identical stable patch IDs and exact
added/removed lines to their donor PRs. The prerequisite tree exactly matches
PR41. Five logical commits retain authorship and complete donor provenance;
PR38 includes both its m4 repair and strengthened final tests. No product source
polish is necessary, and none is included in this review branch update.

- UBFX accepts the existing contiguous 1–30-bit mask operand and checks width
  plus Java-normalized shift at both matcher and encoder boundaries. PR35's
  mask-elided exclusions and PR36's mask-elided shift positive remain distinct.
- LSR folding requires normalized counts 32–63. Register logical folding
  excludes constants and preserves explicit widening/shared-value tests.
- Byte-mask firstTrue is NEON-only, with byte64/byte128 and empty-mask handling.
  Existing non-byte and SVE source paths are unchanged. SHRN encoder coverage
  includes endpoint shifts, arrangements and register aliases.
- Full scalar and vector m4 generation was repeated with the existing GNU m4
  1.4.19 and matches checked-in output byte for byte. Scalar output SHA256 is
  `20470f375e9258f4d873293de5fab30182673a7b6d8f932104d4071042337b50`;
  vector output is
  `13128e4361cb140c62afb11522b94e1fc7207b16f3f7062c9f9d2621fbef65dd`.
  All five regression source hashes match the pinned manifest. The product
  delta remains exactly 15 intended paths, with no workflow changes.

Live master was rechecked as `89885a6288e7aaabd01678a704a586272c0f96e3`.
Its 84 changed paths since the original base do not overlap the product delta,
and that exact delta passes `git apply --cached --check` against master using
an isolated index. This proves mechanical compatibility. The Mac result and
old CI retain their actual pinned identities; a later rebased or merge-result
tree must be reconciled separately rather than relabeled as the tested head.
