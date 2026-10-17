# Decoder int low-mask matcher candidate

This local source candidate is based directly on fork
`89885a6288e7aaabd01678a704a586272c0f96e3`. It is independent of the rejected
unknown-frequency inlining policy and the separately scoped G1 polling work.
Source is published on `review/decoder-int-lowmask`; the implementation and
benchmark revision is `340ecf10da523566c71b0dad2f4b162a3adeada0`. No JDK/ADLC
build, Java compilation, JVM execution, benchmark or CI launch was performed.
This is a reviewable implementation, not a validated performance result or an
upstream-approved patch. Later preparation commits do not change the matcher,
14 semantic targets or three benchmark cases.

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
to retain a data dependency through the batch. Its counts are independent array
loads, so the old shift/subtract mask generation can run ahead; this case does
not establish count-dependent mask latency.

The separate `countFeedbackNonzero` case derives each raw byte-sized count from
the preceding extraction's mixed result. `(value >>> 24) | 1` yields odd counts
in `[1,255]`, whose Java-normalized widths are always odd and nonzero in `[1,31]`.
After masking, multiplication, rotation and an input salt spread the extraction
into the next count. Thus the shift/subtract mask generation cannot be prepared
from an independent count array. Setup compares the measured recurrence with an
unsigned-long mask reference, requires at least eight distinct normalized widths
and varying extracted values in each of four successive fixed-input batches,
checks that perturbing an extraction can change the next normalized width, and
restores the original seed. Those checks are prepared source and have not been
executed; they are not a proof of diversity in every warmed state. The mixing,
loads and loop remain part of this diagnostic; it is not a single-instruction
latency measurement or a guarantee of codec speedup.

All three cases report 256 mask operations per invocation. SuperWord is disabled
only for this scalar diagnostic micro. Compare each mode on matched images; do not
substitute BMI2-off timing for the original BMI2-enabled baseline or claim that
micro results establish codec benefit. The benchmark has not been compiled/run.

## Deferred decoder-only validation

The execution packet below replaces the earlier generic commands. No execution
is requested in this source turn. Qualify ADLC generation and semantics before
timing; preserve default inlining, GC and allocation behavior.

The decisive compact codec cell is source L1 decode on the same retained native
frame and same classes/output reuse, with the original option vector:

```text
--add-modules jdk.incubator.vector -XX:+UseSerialGC -Xms1g -Xmx1g
-cp <pinned-classes> CodecProbe decode <corpus> 1 <identical-native-frame>
```

Any later GC/allocation diagnostics require their own assignment and must remain
separate from timing. Do not switch to G1, force helper inlining or rewrite
zero-width/saturation behavior to manufacture a win.
The existing runner also compiles probes and times encode cells, so do not use
its whole matrix as this decoder-only validation. JMH runs, if later assigned,
use existing managed dependencies and remain supporting evidence. No speedup,
machine-code safety or final compiler-cost result is claimed by source review.

## Execution packet from the source-only sweep

Preparation is complete at the branch head carrying this packet. The product,
semantic test and micro source are identical to `340ecf10da5`; the companion
[driver](compiler-decoder-int-lowmask-validate.py) checks their full SHA256s.
Use `git rev-parse HEAD` in the candidate checkout to freeze the preparation
commit as well. The separate baseline checkout is
`/workspace/executor-lowmask-base`, detached at
`89885a6288e7aaabd01678a704a586272c0f96e3`. The candidate checkout is
`/workspace/executor-bzhi-jdk`; the unmodified codec checkout is
`/workspace/executor-jzstd` at `7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6`.

The sweep found no local JDK build, JVM, benchmark or CI process. That observation
retires the old *local* serial-slot wait; it does not establish availability in
another campaign's environment or grant execution authority. The parent owns
the cold-call campaign and resource scheduling. No process was stopped, and
the shared checkout and its old build directories were not modified. GitHub
reported zero Actions runs for this review branch. This lead is not waiting
for CI or Mac hardware.

The remaining non-CI blockers are explicit execution authority and the pinned
input artifact. This workspace has no probe classes, corpus or native L1 frame
from the retained target capture. The parent/evidence owner must supply the
corpus and identical native frame with independently retained expected SHA256s,
or explicitly authorize a replacement cell whose results will be labelled as
new evidence. The different macOS measurement JSON is not a substitute for
the missing target artifacts. The driver never generates a frame or runs an
encoder. Probe classes are compiled once from the pinned sources only after
execution is assigned. Existing managed GCC16, boot JDK27 and jtreg83 paths are
present; no installation, dependency download or reuse of an unproven old image
is part of this packet.

Reserve one Linux x64 BMI2 host exclusively for this lead after the parent
releases the cold-call slot: four CPU equivalents, a 16 GiB memory limit and
24 GiB of free build/output disk, with a hard 120-minute overall ceiling.
The inspected environment has a four-CPU cgroup quota, 16 GiB memory limit and
approximately 27 GiB free disk after creating the baseline checkout. These
are reservation limits, not predicted completion times. Build all four images
sequentially, with four make jobs: matching baseline/candidate release images
for final code and timing, and matching fastdebug images for ADLC/assertions
and graph evidence. Build ceiling is 70 minutes; subsequent subprocess budgets
are qualification 30, probe preparation two, diagnostics five and timing three.
The remaining ten minutes cover manual review and read-only provenance checks.
The parent must assign/enforce the overall 120-minute reservation. Stop
inconclusive when a ceiling or prerequisite fails; do not add more cells.

After that assignment, ordinary checkout-based build commands are:

```sh
timeout --kill-after=10s 70m bash -s > /workspace/executor-lowmask-build.log 2>&1 <<'BUILD'
set -euo pipefail
source /workspace/toolchains/activate.sh
common=(
  --with-jobs=4
  --with-boot-jdk=/workspace/toolchains/jdk27
  --with-jtreg=/workspace/toolchains/jtreg83
  --with-freetype=system
  --with-freetype-include=/workspace/toolchains/sysroot/usr/include/freetype2
  --with-freetype-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu
  --with-toolchain-path=/workspace/toolchains/gcc16/bin
  '--with-extra-ldflags=-fuse-ld=mold -B/workspace/toolchains/mold/bin'
  --x-includes=/workspace/toolchains/sysroot/usr/include
  --x-libraries=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu
  --with-cups-include=/workspace/toolchains/sysroot/usr/include
  --with-fontconfig-include=/workspace/toolchains/sysroot/usr/include
  --with-alsa-include=/workspace/toolchains/sysroot/usr/include
  --with-alsa-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu
)
for root in /workspace/executor-lowmask-base /workspace/executor-bzhi-jdk; do
  cd "$root"
  test -z "$(git status --porcelain --untracked-files=no)"
  for mode in release fastdebug; do
    bash configure --with-conf-name="lowmask-$mode" --with-debug-level="$mode" "${common[@]}"
    make CONF="lowmask-$mode" JOBS=4 images
    git rev-parse HEAD > "build/lowmask-$mode/lowmask-source-head.txt"
    sha256sum "build/lowmask-$mode/spec.gmk" \
      "build/lowmask-$mode/jdk/bin/java" \
      "build/lowmask-$mode/jdk/lib/server/libjvm.so" \
      "build/lowmask-$mode/jdk/lib/modules" \
      "build/lowmask-$mode/jdk/release" > "build/lowmask-$mode/lowmask-build-sha256.txt"
  done
done
BUILD
```

The driver prints all later commands without creating output directories or
starting subprocesses by default:

```sh
cd /workspace/executor-bzhi-jdk
python3 doc/compiler-decoder-int-lowmask-validate.py
```

Once the parent supplies the corpus/frame at the driver's documented paths and
their expected hashes, run one stage at a time. Set `CORPUS_SHA256` and
`FRAME_SHA256` to those supplied values, not hashes first calculated from an
unidentified replacement. Both variables are required by the following shell
before any execution. Preserve the same output directory across stages:

```sh
set -euo pipefail
: "${CORPUS_SHA256:?Expected corpus SHA256 from the evidence owner}"
: "${FRAME_SHA256:?Expected frame SHA256 from the evidence owner}"
driver=doc/compiler-decoder-int-lowmask-validate.py
inputs=(--corpus-sha256 "$CORPUS_SHA256" --frame-sha256 "$FRAME_SHA256")
python3 "$driver" --stage qualify --execute
python3 "$driver" --stage prepare --execute
python3 "$driver" --stage diagnose --execute "${inputs[@]}"
```

Review the activation and allocation criteria below before invoking timing:

```sh
python3 "$driver" --stage time --execute "${inputs[@]}"
```

Qualification runs the focused test on candidate fastdebug/release, the BMI
suite on candidate fastdebug, and the focused semantic control on baseline
fastdebug with IR verification disabled. This uses the candidate test tree
directly with the selected image; no baseline source edit is needed. The driver
rejects a focused run that does not report one passing test. It records exact
commands, source heads, image and input hashes, logs and all five sample windows
per timing process. Image provenance must name the checkout head and records
the configure spec, JVM, launcher and module image. It rejects ambient Java
options, tracked source changes,
input mismatches, extra candidate source changes, existing stage output and
nonzero exits. Produced class hashes and the exact class set must match a
completed preparation from the same source
heads; later stages also require completed prerequisites and unchanged recorded
images/inputs. Subprocesses share each stage's fixed wall-time budget and their
process group is killed on timeout. No test result is inferred from merely
printing this plan.

The diagnostic stage has four flag queries and four separate decode processes.
Both release images capture actual final code and compilation XML; fastdebug
adds `BEFORE_MATCHING`, `MATCHING`, `REGISTER_ALLOCATION` and `FINAL_CODE` output.
An effective BMI2-off flag query stops the stage as inapplicable.
Fastdebug graph/code is supporting evidence and cannot stand in for release
allocation or timing. Before timing, this lead's owner must establish default
BMI2 applicability, both original target coverages, safe destination allocation,
retained wrapping/saturation semantics, copies/spills, code size and compilation
cost from those captures. If readable release disassembly is unavailable, retain
bytes and mark physical-code claims unverified; do not download a disassembler
or claim activation from mnemonics alone. Failure to activate is a localization
result, and failure of correctness stops qualification.

Timing is exactly ABBA then BAAB, with the original SerialGC/vector/1 GiB option
vector, two-second warmup and five 700 ms windows in each of eight fresh JVMs.
No diagnostics enter those commands. The manifest retains all four adjacent
pair ratios and their direction; it does not infer statistical significance.
End-to-end no benefit rejects the codec performance lead even if the matcher
selects better code. The three JMH cases and their four-batch setup checks remain
uncompiled/unexecuted: no managed JMH bundle was identified in the checked
toolchain/cache paths. If that supporting micro qualification is later assigned
with a managed bundle, use
`--with-jmh=<bundle>` and
`make CONF=lowmask-release test TEST=micro:org.openjdk.bench.vm.compiler.VariableIntLowMask MICRO='FORK=1;WARMUP_ITER=1;WARMUP_TIME=1;ITER=1;TIME=1'`
on matched images. It is outside this fixed decoder campaign and cannot replace
codec activation or end-to-end evidence.
