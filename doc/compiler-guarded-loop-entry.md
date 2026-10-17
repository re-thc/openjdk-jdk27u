# Guarded counted-loop entry range prototype

This source-only candidate carries a direct dominating guard's integer interval
into a counted loop's entry value. It is based on fork commit
`89885a6288e7aaabd01678a704a586272c0f96e3` and contains no unknown-call-frequency
inlining policy change. No JDK build, Java compilation, JVM run, capture or timing
has been performed for this implementation. The applicability review below
rejects it as a remedy for the original Serial GC gap on current evidence and
retains a separately scoped G1 compiler research candidate. The previous broad
execution request is withdrawn; regression expectations remain unverified.

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

The implementation affects every qualifying ordinary T_INT conversion,
regardless of GC or the small repeat-loop motivation. A pinned cast can impose
scheduling constraints and compiler-graph cost. No compiler-cost or scheduling
benefit has been demonstrated; the correctness coverage must include positive
strides, do-while and nested loops, and larger bounded entry intervals.

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

The new regression contains 23 test methods, each linked to one framework run.
Static source checks confirmed that both repeat bodies match the pinned codec
after the documented exception-class and default-enabled no-op substitutions.
Array-free signed/unsigned positives avoid relying on preexisting array range
casts. Positive IR assertions require a retained counted loop and zero polls;
CastII presence alone is explicitly insufficient to identify this mechanism.
The interpreted oracles independently compare results, explicit corruption
messages, exception classes and complete array state. These are prepared tests,
not executed results.

Additional semantic targets cover constant positive stride, guarded do-while
entry (including negative/zero starts that still execute once), nested guards
and loops, and a larger `[0,4095]` entry interval. The nested case includes zero
outer iterations with an invalid inner value, so hoisting its exception across
the outer entry would change the observed result. No exact IR counts are
assumed for these more general shapes.

Uncapped array-free descending negative-bound and rejected-projection controls
require a retained counted loop with its poll. Their inputs are bounded by the
driver rather than by a second loop IV. Step-capped unsigned/variable-stride
cases are additional semantic controls; they alone do not establish which IV
C2 selects. The actual compared SSA values, guard shape and IV selection still
require early-graph qualification on both JVMs.

## Applicability to the measured Serial GC decoder

The pinned runner fixes the Java option vector to:

```text
--add-modules jdk.incubator.vector -XX:+UseSerialGC -Xms1g -Xmx1g
```

See [run.py:59-60](https://github.com/re-thc/jzstd/blob/7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6/scripts/jdk27/run.py#L59)
and [experiments.py:30](https://github.com/re-thc/jzstd/blob/7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6/scripts/jdk27/experiments.py#L30).
The former can append explicitly supplied `--java-option` values. Its checked-in
measurement matrix records an empty extra-option list, but that is a different
measurement set from the original historical gap. A surviving
[decoder command record](https://github.com/re-thc/jzstd/blob/7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6/scripts/jdk27/measurements-2026-10-16.json#L855)
also contains exactly this fixed option vector; it belongs to that other set.
The original gap's complete argv, effective-flag output and full-decoder
nmethod/graph captures are absent from this restarted workspace. The original
exact argv and per-PC attribution cannot be reconstructed from the runner or
retained summaries.

At the fork base, the Serial GC source leaves
`UseCountedLoopSafepoints=false`, `LoopStripMiningIter=0` and the derived
`LoopStripMiningIterShortLoop=0` in effect without overrides:

- [c2_globals.hpp:251](https://github.com/re-thc/openjdk-jdk27u/blob/89885a6288e7aaabd01678a704a586272c0f96e3/src/hotspot/share/opto/c2_globals.hpp#L251)
  and line 866 define these defaults. SerialArguments::initialize does not enable
  counted-loop polling. G1Arguments::initialize, by contrast, enables it and sets
  a default strip length of 1000; compiler ergonomics derives the short threshold.
- [loopnode.cpp:2730](https://github.com/re-thc/openjdk-jdk27u/blob/89885a6288e7aaabd01678a704a586272c0f96e3/src/hotspot/share/opto/loopnode.cpp#L2730)
  already removes a deletable counted-int-loop safepoint with strip mining off.
  [counted_loop:4751](https://github.com/re-thc/openjdk-jdk27u/blob/89885a6288e7aaabd01678a704a586272c0f96e3/src/hotspot/share/opto/loopnode.cpp#L4751)
  likewise marks this case as not needing a poll and prunes deletable safepoints.
  Neither decision needs the new bounded-entry type.
- A poll required by an enclosing loop is protected by
  [is_deleteable_safept:4532](https://github.com/re-thc/openjdk-jdk27u/blob/89885a6288e7aaabd01678a704a586272c0f96e3/src/hotspot/share/opto/loopnode.cpp#L4532).
  The new entry proof does not override that protection. A non-counted loop's
  required poll is also not removed by merely refining a counted child's entry.

The full executor's main sequence IV starts at constant zero, which this patch
skips. Short literal and match copies advance `to` against a relative `end`;
the small-length guard tests `ll` or `ml`, not that IV's initial cursor. Those
need a correlated-span proof excluded by this patch. The repeat rotation is the
known direct-guard source target. Other possible effects on its range checks,
address computations, unrolling or register transport remain unverified; there
is no surviving original nmethod artifact establishing such a removable cost.
Retained aggregate child-poll counts do not identify the repeat loop's PCs or
show which polling policy produced them.

**Decision:** reject this as a remedy for the measured Serial GC codec gap on
the present evidence. Retain only a separately scoped G1-style short-loop
polling research candidate; even its implementation's G1 IR expectations are
unexecuted. The earlier full codec timing campaign request is withdrawn: no
Serial build/timing campaign is justified by the current poll proof. Reopen
that claim only with the original effective flags and a concrete Serial-generated
cost that the entry proof changes. Changing the workload's GC would establish a
different result.

## Test phase correction and deferred qualification

The entry CastII assertions remain at `AFTER_CLOOPS`. Retained CountedLoop,
positive zero-poll and negative one-poll assertions now use `BEFORE_MATCHING`.
`adjust_strip_mined_loop` runs during macro refinement, after `AFTER_LOOP_OPTS`:
[macro.cpp:2495](https://github.com/re-thc/openjdk-jdk27u/blob/89885a6288e7aaabd01678a704a586272c0f96e3/src/hotspot/share/opto/macro.cpp#L2495),
[macro.cpp:2621](https://github.com/re-thc/openjdk-jdk27u/blob/89885a6288e7aaabd01678a704a586272c0f96e3/src/hotspot/share/opto/macro.cpp#L2621).
Compile invokes that refinement during macro expansion, before the matcher
prints `BEFORE_MATCHING`.
The original later-stage assertions were placed too early. Both IR node tokens
support the corrected phase. This source correction is not a runtime test pass.

The following checkout-based commands remain reference instructions for a
separately assigned G1-focused compiler qualification. They are not an active
execution request and have not been run. Use managed dependencies and a suitable
boot JDK; match baseline and candidate configurations and run sequentially.

```sh
git switch review/decoder-repeat-entry-bounds
bash configure --with-conf-name=guard-entry-fastdebug \
  --with-debug-level=fastdebug --with-jvm-variants=server \
  --with-boot-jdk="$BOOT_JDK"
make CONF=guard-entry-fastdebug images test-image
make CONF=guard-entry-fastdebug test \
  TEST=test/hotspot/jtreg/compiler/loopopts/TestGuardedLoopEntry.java
make CONF=guard-entry-fastdebug test \
  TEST='test/hotspot/jtreg/compiler/loopopts test/hotspot/jtreg/compiler/loopstripmining' \
  JTREG='JAVA_OPTIONS=-XX:+UnlockDiagnosticVMOptions -XX:VerifyConstraintCasts=2'
# Baseline checkout with only the new Java test copied there:
make CONF=guard-base-fastdebug test \
  TEST=test/hotspot/jtreg/compiler/loopopts/TestGuardedLoopEntry.java \
  JTREG='JAVA_OPTIONS=-DVerifyIR=false'
```

Any future qualification must first confirm valid baseline semantics, intended
baseline IR failures, direct guard/SSA matching, the captured Phi range and
post-macro poll changes with no replacement hot work. Normal hot inlining must
be checked separately from forced test compilation. Compiler-cost and broader
safety checks remain necessary. A G1 workload benefit would require its own
normal-profile nmethod and paired end-to-end evidence and must be reported as
G1-specific. No supported end-to-end improvement is claimed here for either GC.
Generated captures and binaries remain outside source-review publication.
