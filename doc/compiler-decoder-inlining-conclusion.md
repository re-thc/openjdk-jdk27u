# Decoder inlining conclusion and bounded-repeat source hypothesis

The broad unknown-call-frequency policy remains rejected as a codec speedup
candidate. Its policy-correctness observation is separate from profitability.
The source and repaired tests remain available for possible policy discussion;
this document does not reopen a performance PR.

This is the source-only publication of the conclusion. It includes no raw
graphs, runtime logs, machine-code captures, host metadata or measurement tables.
No bounded-repeat implementation or new runtime result is included.

## Preserved source

The policy/test review head before this documentation addition is
519f28820ff9c05cf6ce547120f00b2a660fc308, based on
89885a6288e7aaabd01678a704a586272c0f96e3.
The policy source still applies the frequency objection only to nonnegative
counts and retains the other inlining limits and caller-profile maturity gate.
No compiler or test source changes accompany this document.

The regression controls cover absent nested MDOs, a known-low count and an
ordinary size limit. The repaired zero-count check requires the frequency
rejection reason, rather than merely a surviving call that reachability could
also explain. The receiver case asserts MDO absence and explicitly leaves
populated-but-immature receiver data uncovered. That repair was source-reviewed,
not executed; prior test results are not results for the repaired version.

## Exact codec premise

Repository: re-thc/jzstd.
Commit: 7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6.
Path: src/main/java/dev/jzstd/internal/BlockDecoder.java.
Method: repeatOffset(int[] rep, int offsetValue, int literalLength).

At [lines 497-505](https://github.com/re-thc/jzstd/blob/7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6/src/main/java/dev/jzstd/internal/BlockDecoder.java#L497),
the method rejects idx < 0 or idx > 2, then reads rep[idx] and shifts with:

    for (int k = idx; k > 0; k--) {
        rep[k] = rep[k - 1];
    }

Every loop entry therefore has idx in [0,2]. On the body path, k initially lies
in [1,2], decrements by one, and performs at most two shifts. This is a source
bound, including the zero-iteration case; it is not a measured C2 trip count.
It does not bound the enclosing sequence loop or any other copy work.
Exceptional input behavior and the order of repeat-state stores remain part
of the semantics that any later change would need to preserve.

## Precise C2 locations and conditions

The following locations are at fork base
89885a6288e7aaabd01678a704a586272c0f96e3, not an inferred nmethod:

| Location | Relevant source condition |
| --- | --- |
| [parse2.cpp:1882](../src/hotspot/share/opto/parse2.cpp#L1882) | Parse::sharpen_type_after_if handles equality/null facts; the ordered-integer default at line 1913 does not add a CastII range. |
| [ifnode.cpp:663](../src/hotspot/share/opto/ifnode.cpp#L663) | IfNode::filtered_int_type requires CmpI and the queried value on its left side. It deliberately excludes CmpU. |
| ifnode.cpp:1029 | IfNode::fold_compares_helper can combine signed lower/upper checks into an unsigned range test. This is a possible guard form, not an observed form in the missing executor graph. |
| [loopnode.cpp:2483](../src/hotspot/share/opto/loopnode.cpp#L2483) | has_truncation_wrap calls filtered_type in the narrower-than-int truncation case; it does not generally preserve entry facts for an ordinary int countdown. |
| loopnode.cpp:3875 | filtered_type_from_dominators examines up to ten dominating If projections and intersects direct signed constraints. |
| loopnode.cpp:2698 | convert retains the original init_control before strip mining can rewrite entry_control to a synthetic outer header. |
| loopnode.cpp:2772 | convert captures Phi::Value before later loop splitting, but does not explicitly materialize a dominating entry proof here. This does not prove that every actual incoming type is wide. |
| [cfgnode.cpp:1221](../src/hotspot/share/opto/cfgnode.cpp#L1221) | PhiNode::Value derives counted-IV bounds from the typed init, limit and stride when the loop condition permits it. |
| loopnode.cpp:3629 | Strip-mining expansion clones inner Phis into the outer loop; an entry proof must dominate the resulting outer-Phi incoming edge. |
| loopnode.cpp:3561 | A tighter IV range can change the existing short-loop safepoint decision. Unchanged explicit polling policy is not proof of identical generated polling coverage. |

The separate hypothesis is that preserving a valid entry bound could avoid an
unnecessarily broad countdown range. It has not established an actual decoder
IR trigger or a performance gain. A conjunction of guards would require
dependence on the original preheader; a proof pinned inside the synthetic outer
loop would not dominate its entry edge. General signed filtering must not be
reused for unsigned comparisons without an independent unsigned proof.

## Upstream safety context

[e0122421bd36d6ad599465064b46ec9a64aba47a](https://github.com/openjdk/jdk/commit/e0122421bd36d6ad599465064b46ec9a64aba47a)
is JDK-8391777, "C2 hits Bad immediate dominator info in
CountedLoopConverter::filtered_type_from_dominators".
It was integrated upstream on 2026-09-16 by Frederic Parain, reviewed by qamai
and thartmann, through [PR #32866](https://github.com/openjdk/jdk/pull/32866).
The commit adds a stop at C->start() after advancing the dominator walk and adds
test/hotspot/jtreg/compiler/loopopts/TestStartDominator.java.

Integration is verified by commit ancestry: it is an ancestor of inspected
upstream cd37d2bb07b7a050b4925ed3312c2a8dd7a801b1.
The PR is closed; GitHub's merged=false field is not evidence of nonintegration
for this Skara workflow. The fork base's source lacks the Start stop. This fix
is safety context for any broader use of the helper, not an implementation of
entry-bound preservation or a complete proof that a new call site is safe.

The recursive Phi-input union has a separate safety issue, fixed upstream by
[JDK-8386830 / #31556](https://github.com/openjdk/jdk/pull/31556),
2f37461c25d7bdbca35af7c2dee32e866b921e7a. Direct dominating facts on one SSA
value are different from filtering and unioning individual Phi inputs.
The targeted source audit found no exact entry-materialization duplicate;
it does not establish global absence of related work.

## What evidence is available

Available here are the pinned codec/JDK source, published policy/test commits,
source-review notes and primary upstream commit/PR evidence. Earlier narrative
records discuss a broad repeat-loop Phi and retained polling, but narrative is
not an inspectable Ideal graph.

The earlier reported Ideal dumps, compilation XML, emitted-node/input maps,
nmethod images, saved representative paths and raw aggregate per-PC counts are
absent from this restarted workspace. They have not been reconstructed. A
complete ordered block stream was not originally recorded; that is a separate
limitation from missing files. Consequently, there is no surviving graph artifact
here proving the actual idx guard form, its domination at conversion, the
resulting IV type, or a bounded-repeat code change. The withdrawn source draft
is not IR evidence.

This hypothesis remains with the parent for qualification before implementation.
No build, Java compilation, JVM/test execution, benchmark, CI dispatch or
blocked encoder validation was performed for this source-only publication.
