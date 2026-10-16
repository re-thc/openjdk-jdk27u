AArch64 C2 misses direct lowering for truncated long operations and NEON byte-mask
`firstTrue()` queries. This change selects UBFX for retained masked extracts,
64-bit LSR for Java-normalized shifts 32–63, W-register AND/ORR/EOR for truncated
register logical operations, and direct byte64/byte128 firstTrue queries.
Byte128 uses SHRN #4; empty masks return the lane count. Constant, shared-value,
widening, non-byte and SVE boundaries are preserved.

The independent C1 switch-profiling fix (8385134, upstream
`abf881b0108610051fb36636a5f8ce44e8076ddb`) is the first of five logical commits,
preventing an existing profiling bug from obscuring vector qualification.
The following four commits preserve the complete changes and donor provenance
from #35, #36, #37 and #38, including #38's m4 repair and final test additions.
There are no integration-specific source adaptations. This supersedes those
four PRs and #41.

Validation:

- Full scalar/vector m4 regeneration matches the generated sources byte for
  byte; donor aggregate deltas and pinned regression source hashes match.
  The product delta contains 15 intended files and no workflow changes.
- Native qualification is reported on Apple M6 arm64/NEON with matching
  toolchain/configuration: release and fastdebug builds for candidate
  `bf4d2615bf435e8889ef95e48220938505905bbb` and C1-only baseline
  `9711df62d0d019e6670f83832b09bd5dcf797dcb`; all 20 class runs passed semantic
  checks. Candidate fastdebug passed all 28 UBFX, 13 shift, 13 bitwise,
  22 firstTrue and 2 C1 IR rules without exclusions. Baseline produced exactly
  the 18 expected missing-node failures, including all four UBFX probes with
  unchanged input shapes. The vector tests retain exhaustive masks, shared
  stores and non-byte controls.
- Reported assembler results are 42/42 passed, including SHRN in both candidate
  builds. Separate instruction captures show UBFX, LSR, W-register logical
  operations and the byte firstTrue sequences; assembly flags were absent
  from active-IR runs. Ordinary combined-source
  [CI](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38860660092)
  also passed all 57 jobs.

Final review should inspect the retained paired disassembly for shifted/rotated
logical selection, moves/spills and the byte64 temporary's register pressure.
The native outcomes above are the local qualification report; their retained
records have not been independently reviewed here. Performance/JMH and
nonzero-SVE execution remain untested (`UseSVE=0`); no speedup or codec claim
is made. The new NEON matcher is statically restricted to `UseSVE == 0`.

---------
- [ ] I confirm that I make this contribution in accordance with the [OpenJDK Interim AI Policy](https://openjdk.org/legal/ai).
