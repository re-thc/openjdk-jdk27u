# Guarded counted-loop entry range prototype

This source-only candidate carries a direct dominating guard's integer interval
into a counted loop's entry value. It is based on fork commit
`89885a6288e7aaabd01678a704a586272c0f96e3` and contains no unknown-call-frequency
inlining policy change. No JDK build, Java compilation, JVM run, capture or timing
has been performed for this implementation. Regression IR expectations remain
unverified until the reserved execution slot becomes available.

## Mechanism and scope

At jzstd commit `7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6`,
`BlockDecoder.repeatOffset` validates `idx` in `[0,2]`, reads `rep[idx]`, then
shifts `rep[k] = rep[k-1]` for descending `k = idx; k > 0; k--`. There are at
most two shifts on this path. The other repeat-code branches and their ordered
array operations remain relevant to invalid-input behavior.

The existing C2 `filtered_type` query is used for subword truncation overflow
checks. Ordinary `T_INT` counted-loop conversion does not query it. Moreover,
the signed pair `idx >= 0 && idx <= 2` can fold to `CmpU`, which the shared
`IfNode::filtered_int_type` intentionally does not interpret. The loop's existing
Phi-bound capture can consequently miss the validated entry interval.

The new, private `filtered_loop_entry_type` path:

- Walks only the original preheader's immediate dominators, bounded by 64 CFG
  nodes and ten If projections; stops before Start/root and rejects dead controls.
- Requires the identical SSA value on the comparison lhs and an actual
  nonnegative `ConI` rhs. It normalizes the taken projection's polarity.
- Interprets ordered signed comparisons and only unsigned `<`/`<=` intervals
  that remain contiguous in signed integer space. It does not invert arithmetic,
  follow Phi inputs, or interpret negative unsigned bounds and disjoint ranges.
- Requires the guards themselves to establish a nonnegative interval with an
  upper bound below `MAX_INT`, followed by a nonempty strict type refinement.
  A one-sided zero-trip test alone does not add a cast.
- Adds a `NonFloatingNonNarrowing` CastII pinned at the original preheader,
  replacing only the induction Phi's entry input, before the outer strip-mining
  wrapper can obscure that input.

All existing overflow decisions precede the cast. Existing Phi::Value capture
derives the induction range; existing strip-mining policy decides whether a
short loop needs its outer poll. There is no new run-time mask/min, comparison,
unrolling rule, safepoint-removal rule, or global value-type mutation. Later
cast distribution/widening is permitted by the existing cast machinery; an
exact late cast shape is not a correctness requirement.

The production codec is unchanged. In particular this does not infer array
non-aliasing, change overlap/history/window checks or reorder repeat-state
stores. Null and short arrays must preserve exceptions and partial state.

## Upstream overlap checked

Rolling upstream was checked at
[`cd37d2bb07b7a050b4925ed3312c2a8dd7a801b1`](https://github.com/openjdk/jdk/commit/cd37d2bb07b7a050b4925ed3312c2a8dd7a801b1).
Its `CountedLoopConverter::convert()` matches the fork base byte for byte.
Bounded mechanism searches did not identify a duplicate entry-proof change.

[`e0122421bd36d6ad599465064b46ec9a64aba47a`](https://github.com/openjdk/jdk/commit/e0122421bd36d6ad599465064b46ec9a64aba47a)
([#32866](https://github.com/openjdk/jdk/pull/32866)) stops the older dominator
helper at Start. The new helper independently stops before querying Start's idom.
[`2f37461c25d7bdbca35af7c2dee32e866b921e7a`](https://github.com/openjdk/jdk/commit/2f37461c25d7bdbca35af7c2dee32e866b921e7a)
([#31556](https://github.com/openjdk/jdk/pull/31556)) fixes unconstrained Phi-input
merging; this candidate never uses that recursive analysis. Both fixes are
absent from the fork base and are not claimed as novel work here. The global
signed-only filtering restriction from
[#31395](https://github.com/openjdk/jdk/pull/31395) stays intact. Existing-cast
recognition ([#25539](https://github.com/openjdk/jdk/pull/25539)) and checkIndex
cast optimizations ([#1342](https://github.com/openjdk/jdk/pull/1342)) are already
in the fork and do not create this entry proof.

The new regression contains 19 test methods, each linked to one framework run.
Static source checks confirmed that both repeat bodies match the pinned codec
after the documented exception-class and default-enabled no-op substitutions.
Array-free signed/unsigned positives avoid relying on preexisting array range
casts. Positive IR assertions require a retained counted loop and zero polls;
CastII presence alone is explicitly insufficient to identify this mechanism.
The interpreted oracles independently compare results, explicit corruption
messages, exception classes and complete array state. These are prepared tests,
not executed results.

Uncapped array-free descending negative-bound and rejected-projection controls
require a retained counted loop with its poll. Their inputs are bounded by the
driver rather than by a second loop IV. Step-capped unsigned/variable-stride
cases are additional semantic controls; they alone do not establish which IV
C2 selects. The actual compared SSA values, guard shape and IV selection still
require early-graph qualification on both JVMs.

## Qualification commands, after slot assignment

These are ordinary checkout-based commands, not commands executed for this
source phase. Use the managed host's existing dependencies and a suitable boot
JDK; record both checkout SHAs and configure arguments. Build the unchanged base
and this candidate with matching configurations, sequentially. The commands
below show the candidate side from its checkout:

```sh
git switch review/decoder-repeat-entry-bounds
git status --short
bash configure --with-conf-name=guard-entry-fastdebug \
  --with-debug-level=fastdebug --with-jvm-variants=server \
  --with-boot-jdk="$BOOT_JDK"
make CONF=guard-entry-fastdebug images test-image
make CONF=guard-entry-fastdebug test \
  TEST=test/hotspot/jtreg/compiler/loopopts/TestGuardedLoopEntry.java
make CONF=guard-entry-fastdebug test \
  TEST='test/hotspot/jtreg/compiler/loopopts test/hotspot/jtreg/compiler/loopstripmining' \
  JTREG='JAVA_OPTIONS=-XX:+UnlockDiagnosticVMOptions -XX:VerifyConstraintCasts=2'
```

Also run the focused test without its IR checks on the baseline by applying only
the test-file diff there, and confirm its positive IR checks fail for the intended
retained-poll reason. A baseline control failing semantically invalidates the
experiment. The test retains counted loops with unrolling disabled while keeping
counted-loop safepoints enabled and explicit strip-mining/short-loop thresholds;
this isolates the entry-proof effect. Those test controls must not be used as
workload performance flags. In particular, the pinned codec runner selects
Serial GC. A proof under the regression's strip-mining settings is insufficient
to establish benefit with the workload's original settings. If that compilation
already lacks the target poll, identify another actual eliminated cost or reject
the performance premise; do not change GC settings to manufacture a benefit.

```sh
# In the baseline checkout, with only the new Java test copied there:
make CONF=guard-base-fastdebug test \
  TEST=test/hotspot/jtreg/compiler/loopopts/TestGuardedLoopEntry.java \
  JTREG='JAVA_OPTIONS=-DVerifyIR=false'
```

The decisive execution request is one serial campaign containing:

1. Matched fastdebug baseline/candidate builds, focused regression and loopopts
   coverage, including constraint-cast verification. Resolve any source/test
   failures before drawing conclusions from IR.
2. Separate ordinary-profile diagnostic runs of the unchanged pinned codec,
   with no forced-inline, compile-only, min/mask overlay or unroll override.
   Identify the actual executor/BlockDecoder nmethods and inlining decisions.
   Retain before/after-counted-loop and after-loop-opts IR, final assembly and
   compilation XML. Establish the direct SSA guard match, cast control, narrowed
   Phi, existing-policy poll removal, and absence of replacement hot work.
   A small standalone kernel alone does not establish workload activation.
3. Interpreter-reference result, exception and array-state comparisons, then
   normal codec round-trip/malformed-input tests. Verify zero-trip, overflow,
   guard-merging and GC/safepoint behavior. Use a valid control on each side.
4. Matched release images and sequential paired end-to-end decode runs on the
   same pinned corpus and identical native-generated frames. Reuse
   `scripts/jdk27/CodecProbe.java` with caller-owned output; alternate ABBA/BAAB
   order and retain every process result. Do not substitute a kernel rate or
   diagnostic run for end-to-end performance. Record input/frame hashes and
   match/repeat-path distributions so changed logical work cannot masquerade as
   compiler benefit. Native decoding remains a same-frame work comparison.
5. Separate compiler-cost runs recording target compilation time, node/arena
   counts, code size and deoptimizations, with repeatability and a fixed broader
   compiler workload. Include array-address/cursor transport and poll costs in
   the final accounting; elimination of a single poll is not the whole executor.

The existing jzstd runner compiles Java/native probes and runs encode as well as
decode. Its `--prepare-only` still compiles and is not authorized in the source
phase. Use it only within the assigned campaign; use saved frames/classes for
the paired decoder-only cells. Generated data, binaries and raw host captures
stay outside the source-review publication.

A valid candidate with no paired end-to-end benefit is rejected for this lead.
A broken baseline/control is an invalid experiment. Current source review alone
does not establish target activation, complete transformation safety, compiler
cost or performance. The installed generic JDK's release metadata does not prove
that it is the previously measured fork image. Missing historical raw graphs and
nmethod captures cannot be reconstructed from retained summary counts.
