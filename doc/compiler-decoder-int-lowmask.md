# Decoder int low-mask matcher candidate

This local source candidate is based directly on fork
`89885a6288e7aaabd01678a704a586272c0f96e3`. It is independent of the rejected
unknown-frequency inlining policy and the separately scoped G1 polling work.
No JDK/ADLC build, Java compilation, JVM execution, benchmark, publication or CI
launch was performed. This is a reviewable implementation, not a validated
performance result or an upstream-approved patch.

## Retained target evidence and upstream work

At codec pin `7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6`, the original hot
sequence-reader trees for
[BlockDecoder.java:291 and :293](https://github.com/re-thc/jzstd/blob/7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6/src/main/java/dev/jzstd/internal/BlockDecoder.java#L291)
contain `AndI(AddI(LShiftI(1,count),-1),value)` (nodes 2374 and 2407).
The parent-qualified x86 capture records `salI -> decI -> andI` sequences at
048a-04a0 and 04bd-04d3, with count Phis in `[0,255]` and 87,304 occurrences per
pinned 43,658-sequence frame. These are retained observations supplied by the
parent, not fresh captures here. They do not establish a cycle share or explain
the large Java/native gap. The bound does not justify dropping count masking.

The optimization is April Ivy's
[JDK-8389111 / PR #32048](https://github.com/openjdk/jdk/pull/32048), still open
at `dcd66a97f0e0960eace39c1451909fb706a657f4`. It is absent from the inspected
fork base and rolling upstream `cd37d2bb07b7a050b4925ed3312c2a8dd7a801b1`.
This candidate adapts that existing proposal; it is not a claim of novelty.
Review still requests an independent count operand and JMH source; an October
10 comment proposes an architecture-dependent Ideal node after macro expansion.
The author reported a long-mask regression and excluded that extension. The
four long payload masks are outside this change.

## Exact matcher and lifetime proof

Only the generic int form is added, with explicit `src`, `shift` and `dst`:

```text
match(Set dst (AndI src (AddI (LShiftI one shift) minus_one)))
effect(TEMP_DEF dst, KILL cr)

MOVL dst, shift
ANDL dst, 31
BZHIL dst, src, dst
```

Java int shifts use the low five count bits
([JLS 15.19](https://docs.oracle.com/javase/specs/jls/se26/html/jls-15.html#jls-15.19)).
Thus every int count maps to `k = count & 31`, and BZHIL selects exactly the
low `k` bits. At counts 0/32/64 the result is zero; at 31/-1 only the low 31 bits
survive. This is a 32-bit operation, not BZHIQ or a 64-bit mask conversion.

The upstream generic rule ties the result to the count and modifies it before
reading `src`. Source review found an allowed alias when source/count share an
LRG: value=count=63 would become 31 if the prefix AND also clobbered the source.
This is an allocator-contract diagnosis, not a reproduced generated failure.
Merely separating the count operand without early-clobber protection is also
insufficient if an ordinary DEF reuses a dead source register.

`TEMP_DEF` creates a fresh synthetic MachTemp input tied to the output
(`formssel.hpp:947`, `output_c.cpp:1725`, `formssel.cpp:458`). Chaitin's
two-address interference (`ifg.cpp:398-413`) keeps that output distinct from all
real inputs, including a single shared source/count LRG. The result register
therefore safely holds the normalized count, while both original inputs remain
available. No separate count scratch is allocated. Physical allocation and
emission still require qualification.

The three-instruction rule uses selection cost 300, compared with the ordinary
default instruction cost 100. These are matcher heuristics, not measured cycles;
shared constants and covering can change selection. The existing BMI
`ialu_reg_reg` pipeline approximation is retained. The generic x86 pipeline is
not a modern BMI latency model, and nondefault scheduling remains unqualified.
No fixed three-cycle latency or performance gain is inferred from three opcodes.

No bounded-count rule or type-query helper is included. Besides not being
needed for the observed `[0,255]` Phis, the upstream helper searches both AND
operands for shifts without binding the fact to the exact mask count. An
unrelated bounded sibling shift can therefore supply the wrong proof. That
source-derived concern is avoided here and covered by a semantic control.
Exact `immI_1`/`immI_M1` leaves exclude different shift bases and additions.
Normal matcher sharing boundaries remain intact; a shared mask/shift can keep
the existing covering rather than force duplicate work.

The rule requires enabled, supported BMI2, uses ordinary assembler BZHIL
encoding, and declares only a flags kill. BZHI must not inherit AND's complete
flag-property annotations. No memory form, long rule, global Ideal rewrite,
codec algorithm or source-level mask specialization is added. In particular
`Bits.mask` saturation (`bits >= 32 ? -1 : ...`), zero-width paths and the four
long masks remain unchanged. Earlier rejected Java tradeoffs in NOTES:395-416
and :2473-2479 are not revived.

## Prepared regressions and benchmark source

`TestBzhiIntMask` has 14 compiled targets and independent interpreted references.
It covers all count residues and byte counts, negative and MIN/MAX counts,
31/32/33 and 63/64 boundaries, identical source/count, source/count still live,
shared masks, register pressure, int-to-long result width, long-mask exclusions,
different bases/additions, unrelated sibling shifts and codec saturation.
Enabled/disabled BMI2 scenarios have matching checks at `MATCHING`. Stable
positive targets require the new rule; negative patterns and disabled cases
forbid it. Physical aliases are not forced by Java syntax, so the same-SSA test
is necessary but is not evidence of a particular physical allocation.

`VariableIntLowMask` supplies the requested JMH source. `independent` processes
four lanes of wrapping byte-sized counts; `dependentNonzero` uses widths 1..31
to retain an architectural dependency through the batch. Both report 256 mask
operations per invocation. SuperWord is disabled only for this scalar diagnostic
micro. Loads, additions and loop overhead remain, so neither rate is the latency
of a single BZHI. Compare each mode on matched baseline/candidate images; do not
substitute BMI2-off timing for the original BMI2-enabled baseline or claim that
micro results establish codec benefit. The benchmark has not been compiled/run.

## One compact validation, deferred until an execution slot is assigned

No execution is requested in this source turn. First build matching x86 images
from the unchanged base and this local commit using the same managed toolchain
and configure options. Qualify ADLC generation and fastdebug semantics before
timing. From the respective checkout, focused commands are:

```sh
make CONF="$JDK_CONF" hotspot
make CONF="$JDK_CONF" test \
  TEST=test/hotspot/jtreg/compiler/intrinsics/bmi/TestBzhiIntMask.java
make CONF="$JDK_CONF" test TEST=test/hotspot/jtreg/compiler/intrinsics/bmi
# Baseline, with only the new test copied there: semantic reference control.
make CONF="$BASE_CONF" test \
  TEST=test/hotspot/jtreg/compiler/intrinsics/bmi/TestBzhiIntMask.java \
  JTREG='JAVA_OPTIONS=-DVerifyIR=false'
```

The decisive compact codec cell is source L1 decode on the same retained native
frame and same classes/output reuse, with the original option vector:

```text
--add-modules jdk.incubator.vector -XX:+UseSerialGC -Xms1g -Xmx1g
-cp <pinned-classes> CodecProbe decode <corpus> 1 <identical-native-frame>
```

1. Verify source/image/frame hashes, CPU features and effective default BMI2.
   Preserve current default inlining, GC and allocation behavior. If BMI2 is
   unavailable or disabled under the original configuration, this matcher has
   no applicability there. Reuse the frame; no encoder recovery probe is needed.
2. Use one separate diagnostic process per image with normal profiling/inlining,
   targeted `decodeSequencesRolling` Ideal/Mach output, final assembly and
   compilation XML. Confirm both original tree coverages become this matcher,
   count normalization remains, dst differs from both real inputs, flags and
   saturation paths stay correct, and account for inserted copies/spills, code
   size and compile cost. Do not infer savings from an instruction mnemonic or
   a small isolated kernel alone. A covering failure is a localization result.
3. Once correctness and actual target activation pass, use sequential ABBA then
   BAAB fresh-process decode runs with identical flags/warmup on the same frame.
   Keep diagnostic runs separate. Preserve every sample and pair direction.
   Report the paired end-to-end result even if the code shape improves. A valid
   no-benefit result rejects this as a codec performance lead.

GC/allocation can be measured alternatives if variance remains; they are not
assumed causes. Any JFR/GC/allocation diagnostics must remain separate from the
timing cells and retain their actual observations. Do not switch to G1, force
helper inlining or rewrite zero-width/saturation behavior to manufacture a win.
The existing runner also compiles probes and times encode cells, so do not use
its whole matrix as this decoder-only validation. JMH runs, if later assigned,
use existing managed dependencies and remain supporting evidence. No speedup,
machine-code safety or final compiler-cost result is claimed by source review.
