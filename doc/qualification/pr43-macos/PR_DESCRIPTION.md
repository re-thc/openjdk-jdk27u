AArch64 C2 misses direct lowering for truncated long operations and NEON byte-mask
`firstTrue()` queries. This change selects UBFX for retained masked extracts,
64-bit LSR for Java-normalized shifts 32–63, W-register AND/ORR/EOR for truncated
register logical operations, and direct byte64/byte128 firstTrue queries.
Byte128 uses SHRN #4; empty masks return the lane count. Constant, shared-value,
widening, non-byte and SVE boundaries are preserved.

The independent C1 switch-profiling fix (8385134) prevents a profiling bug from
obscuring vector qualification. Logical commits retain complete donor provenance
from #35, #36, #37, #38 and #41, including the m4 repair and final regression coverage.
The UBFX regression also uses the framework's C2 assertion API so intentional
compilation exclusions work while unexpected missing compilation still fails.

Validation:

- Full scalar/vector m4 regeneration matches generated sources byte for byte.
  The test-only assertion repair preserves all 28 UBFX IR annotations, test
  method bodies and semantic oracles. No workflow changes are included.
- Native results are reported on Apple M6 arm64/NEON with matching configuration:
  release and fastdebug builds for pre-repair candidate
  `bf4d2615bf435e8889ef95e48220938505905bbb` and C1-only baseline
  `9711df62d0d019e6670f83832b09bd5dcf797dcb`; all 20 class runs passed semantic
  checks. Candidate fastdebug passed all 28 UBFX, 13 shift, 13 bitwise,
  22 firstTrue and 2 C1 IR rules without exclusions. Baseline produced exactly
  the 18 expected missing-node failures, including all four UBFX probes with
  unchanged input shapes, plus exhaustive vector masks and shared/non-byte
  controls. Those native results retain their original source identity.
- Four portable fixtures using the actual framework reproduce the original
  exclusion failure, pass after repair with and without intentional exclusions,
  and reject unexpected missing C2 compilation. They provide no ARM IR credit.
  The primary qualification audit still rejects missing rules/compilations.
- Reported assembler results are 42/42 passed, including SHRN in both candidate
  builds. Separate instruction captures show UBFX, LSR, W-register logical
  operations and the byte firstTrue sequences; assembly flags were absent
  from active-IR runs. Ordinary combined-source
  [CI](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38860660092)
  also passed all 57 jobs.

Remaining review needs the existing paired Mac text captures for shifted/rotated
selection, extra moves/spills and byte64 register pressure; those records are
not accessible here. Performance/JMH and nonzero-SVE execution remain untested
(`UseSVE=0`). No speedup or codec claim is made. The new NEON matcher is statically
restricted to `UseSVE == 0`.

---------
- [ ] I confirm that I make this contribution in accordance with the [OpenJDK Interim AI Policy](https://openjdk.org/legal/ai).
