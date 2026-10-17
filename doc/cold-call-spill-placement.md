# Cold-call spill placement repair

This is a source repair of the opt-in `UseColdCallSpillDeferral` policy. The
previous measured qualification remains **NO-GO**. This change has not been built
or executed, and makes no claim about register coloring, physical store removal,
or speed. It does not change the flag's default, qualification thresholds,
measurement caps, or the preserved qualification inputs and results.

## Failed placement mechanism

The retained decoder traces show three packed long loads: `llEntry` at bytecode
index 360, `ofEntry` at 373, and `mlEntry` at 386. Deferring their immediate stores
kept the definitions UP, but PASS1 selected DOWN for subsequent high-pressure
Phis. PASS2 then correctly reconciled those choices by inserting stores on hot
predecessors. The hot-cycle assembly still contained 19 stores. These three
values explain selected recreated stores; they do not account for every store
in the cycle.

The retained source-profile trace provides two successive forward joins for
each value:

| Join | Predecessor | Frequency | Reaching state before reconciliation |
| --- | --- | ---: | --- |
| B120 | B124 | 2140.33 | UP packed definition |
| B120 | B121 | 1.82001 | UP packed definition |
| B120 | B119 | 1.81997 | DOWN after the returning call |
| B80 | B120 | 2143.97 | DOWN under the previous policy |
| B80 | B125 | 4536.68 | UP packed definition |
| B80 | B79 | 0.13977 | UP packed definition |

These are compiler profile weights, including loop frequency, rather than
hardware traffic counts. Fixing only B80 would leave the expensive DOWN input
from B120. An UP Phi can also encounter the ordinary pressure-boundary handler
later in PASS1, so Phi selection alone is insufficient.

## Placement policy

The implementation records the identity of each actual definition whose eager
pressure spill was deferred. It does not mark an entire live range: the three
packed ranges are multi-definition ranges because of coalesced two-address
shifts. Each new definition must independently earn its own provenance.

For each Phi, the existing predecessor walk collects the full execution
frequency of UP and DOWN inputs. `split_USE` places a Phi copy before the
predecessor terminator; multiplying by successor probability would undercharge
copies in a predecessor with multiple successors. No CFG edges are split or
copies moved by this policy.

A Phi can preserve deferral only when all reaching inputs are known, at least
one is UP, and every UP input has deferral provenance. The cost guard is:

```
UP predecessor frequency > 10 * (2 * DOWN predecessor frequency
                                + 3 * whole-range constraint frequency)
```

The load/store weights follow LRG's existing 2/1 convention. The constraint
reserve charges a possible store plus reload at every accumulated hard site.
The existing hot-block guard must also pass. Unknown backedges, all-DOWN inputs,
unmarked coalesced definitions, invalid profiles and overflow retain ordinary
placement. An already-UP Phi must pass the same proof to carry provenance.

The choice is made in PASS1 before `UP_entry`, `debug_defs` and use rewriting.
PASS2 remains unchanged and inserts all copies required by that state. At a
pressure boundary, a proven reaching node may stay UP only if the current block
still passes the original hot-block guard. A cold constraint block cannot pass
that guard because its frequency contributes to the accumulated constraints.
Hard spills and ordinary reloads do not inherit provenance.

Only the first allocation attempt can use the policy. Previously spilled ranges
are excluded. If the longer register lifetimes do not color, later attempts
use ordinary splitting. Eager pressure splitting is selectively deferred;
physical interference, coloring and ordinary retry fallback remain enforced.
The policy does not establish that the longer register lifetimes will fit.

## Safety and scope

Existing scalar, mask and conflict eligibility remains required. Whole-range
definition inspection excludes pointer, oop, floating, vector and predicate
definitions, including derived pointers represented with pointer register
classes. Bound or misaligned definitions still spill normally. Ordinary operand
splitting, call clobbers, debug-state materialization, OopMaps and base/derived
pair handling are unchanged. No call or safepoint survival rule is relaxed.

The feature remains disabled by default. Phi changes require an actual deferred
definition and the local predecessor proof. Boundary changes require a marked
reaching definition and the hot-block guard. There is no codec-name special
case, global force-UP rule, iterative backedge solver or fresh reload exemption.
The new provenance set is allocated
only for the first enabled Split attempt; cost collection reuses the existing
predecessor walk.

Two independent source reviews considered PASS2-only promotion, eligibility-only
rejection, single-definition gating and unconditional pressure exemptions.
PASS2-only promotion contradicts already rewritten uses; eligibility-only
rejection avoids rather than repairs the failed mechanism; single-definition
gating excludes the actual packed cases; unconditional exemptions extend across
cold constraints. The implementation instead coordinates the local PASS1
decisions with per-definition provenance.

## Regression coverage and remaining validation

The shared native policy tests model all three packed values through B120 and
B80. They reject the incomplete second-join-only repair and cover weighted
costs, equality, aggregate constraints, unknown backedges, unmarked inputs,
multi-successor predecessor charging and invalid or overflowed frequencies.

The original Java fixture called at frequencies 1/64 and 1/128. Its first join
would compare UP frequency 126/128 against a threshold of 130/128, so it could
not demonstrate the intended placement. A requirement for any selected Phi
also permitted an unrelated Phi to satisfy activation. That fixture and oracle
have been replaced without changing the production costs.

The standalone Java fixture has exactly three mutable packed loads and calls
at 1/256 and 1/512 over 1,024 loop iterations. Those fixture frequencies give
the first intended join a comparison of 510/512 against 130/512, and the second
511/512 against 110/512. Separate pressure bursts are designed to make the load
definitions hot and create pressure transitions
after each join. The latter bursts depend on the corresponding helper-return
token, preventing them from being hoisted above the join. Their temporaries
are consumed before the next call; raw packed values remain live through both
joins and the final pressure burst.

The trace identifies actual long loads and records every accepted Phi input's
node, state, provenance and predecessor frequency. The oracle checks complete
input counts, costs and exact-node provenance. For each of the three distinct
packed definitions it requires a direct UP path through two selected Phis in
the same two join blocks, both overriding an otherwise pressure-forced DOWN
choice, and an actual `CCHRP keep=1` event for both Phi nodes in their own join
blocks. Constraint totals must match each range's original definition records.
Missing joins, missing boundary activation and incidental Phi selections cannot
satisfy the assertion. Synthetic positive and negative cases are included for
the oracle itself.
The strict activation check uses an isolated fixture process with loop peeling
disabled; existing general correctness configurations retain their settings.
Existing GC, deoptimization, throwing-call, fixed-mask, oop and derived-pointer
correctness checks remain required.

Only source inspection and static repository checks were performed for this
change. The native and Java tests have not been compiled or run. No new JDK
build, native workload, benchmark or CI run was launched.

A future separately authorized qualification must follow the three packed
definitions through both joins, pressure boundaries and final allocation. It
must establish that their hot Phi stores are not recreated elsewhere, account
for the entire 19-store cycle and any additional reloads, and pass correctness,
code-quality, resource and matched-control gates. A new `CCDEFER`, `CCPHI` or
`CCHRP` trace alone is insufficient evidence of final code quality. The previous
NO-GO and its acceptance gates remain authoritative until a complete permitted
qualification establishes a new result.
