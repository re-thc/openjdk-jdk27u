# Experimental C2 cold-call spill deferral

`UseColdCallSpillDeferral` is a diagnostic, disabled-by-default prototype for
deferring eager pressure spills across rare returning calls. Pressure deferral
changes the first Split allocation attempt only. The separate cold debug-home
reuse described below can apply during later Split attempts. Ordinary splitting
and allocator retry remain the fallback. Actual decoder spill/transport reduction and performance
qualification are incomplete. There is no speedup or release-readiness claim.

## Placement contract

The policy records individual definitions whose pressure spills were deferred.
It does not mark an entire coalesced live range: two-address updates can give a
range several definitions, and every reaching definition needs its own proof.
The whole range must retain the existing scalar, mask and conflict eligibility.

Deferral requires a call-debug use and a definition frequency greater than ten
times the accumulated hard-constraint frequency. Reverse liveness removes the
call result before visiting values live after the call, then processes call
arguments and debug inputs. An argument/result is not treated as surviving a
call merely because it occurs on that call node.

At a Phi, every predecessor must be known, an UP input must exist, and every UP
input must have deferral provenance. Costs use full predecessor frequencies:
the existing Phi copy is placed before the predecessor terminator and need not
execute on a dedicated edge. The additional guard is:

```
UP frequency > 10 * (2 * DOWN frequency + 3 * whole-range constraint frequency)
```

The 2/1 load/store convention and store-plus-reload constraint reserve are
conservative placement weights, not estimates of physical traffic. Unknown
backedges, unmarked definitions, invalid profiles and overflow retain ordinary
placement. Already-UP Phis need the same proof to carry provenance.

PASS1 makes the decision before entry-state tracking, debug definitions and use
rewriting. A pressure-boundary exemption requires a proven reaching node and
the original hot-block guard. Hard spills and ordinary reloads do not inherit
provenance. PASS2 remains responsible for all state-reconciliation copies; no
CFG edge is split and no copy is moved by this policy.

## Preserved safety constraints

Whole-range pressure-deferral inspection excludes pointer, oop, floating, vector and predicate
definitions, including derived pointers represented with pointer register
classes. Bound/misaligned definitions, operand constraints, call clobbers,
debug-state materialization, OopMaps and base/derived pairs keep their ordinary
handling. Physical interference and coloring remain enforced. There is no
codec-name special case, global force-UP rule or exemption for a fresh reload.

The small shared policy header contains cost and reverse-liveness mechanics;
mask scratch remains caller-owned and persistent register masks are unchanged.
The separate scoped nonnull diagnostic in `javaThread.inline.hpp` is the common
GCC16 build prerequisite; it preserves the unsafe-access handler and assertion
without a global warning suppression.

## Cold debug-home reuse

When a spilled input already has a cached DOWN definition, an eligible cold
`DebugUse` copy can forward its single call-debug edge to that definition before
liveness, masks and interference are rebuilt. Extending the home's lifetime at
this point lets interference protect it against other values live at the call.
Deleting a stack copy after coloring would not provide that protection.

This reuse requires exact value type and register class, one definition of the
copy's live range, and a unique Java-state use in the same cold block after the
copy. Only integer, long, base-oop and zero-offset narrow-oop values qualify.
Arguments, monitor objects and boxes, derived/oop-map edges, bound call operands
and locally bound homes retain ordinary handling. The home output, call input
and every existing home use must retain an unbounded stack domain. No input or
output mask is widened or narrowed, and no coloring priority is changed.

The cached definition is the allocator's existing same-value debug home, not a
slot inferred from a previous coloring. Later Phi and two-address constraints
still use the ordinary allocation, materialization and retry paths; local mask
eligibility alone does not prove that the final allocation removes transport.
Base-oop homes remain normal live debug inputs for GC and deoptimization.

## Normal regression coverage

- `TestColdCallSpillPolicy` and its native helper cover production policy costs,
  masks, reverse liveness, invalid frequencies and the two-join model.
- `TestColdCallSpillPlacement` checks Java state, activation and negative cases.
  Its isolated trace fixture requires exactly three packed loads, two proven
  joins per root, pressure-forced DOWN decisions and corresponding boundary
  activation; incidental Phis or counts alone cannot satisfy the oracle.
- `TestColdCallDerivedPointers` exercises oop/base/derived constraints and
  returning-call correctness with GC and deoptimization.
- `TestColdCallDebugHome` checks default/off/on behavior, Java scalar and oop
  state through GC and deoptimization, compressed/uncompressed oops and frame
  pointers. In fastdebug its positive case requires a base-oop forwarding trace
  in the second C2 compilation at the unique inventoried `unstable_if` call for
  the exercised BCI, with a corresponding WhiteBox trap-count increment. A
  nonactivating or ambiguous fixture fails.

Trace activation alone does not establish removal of physical stores, reloads,
register transport or implicit frame work. That requires a matched final-code
comparison and remains separate from ordinary builds and regression tests.

## Standalone experiment

The one-off decoder workloads, campaign controllers, evidence analyzers and
their protocols are retained at immutable Git commit
[`26a75f6755204efee764452ad02a0fe3d273dffa`](https://github.com/re-thc/openjdk-jdk27u/tree/26a75f6755204efee764452ad02a0fe3d273dffa/doc/cold-call-qualification).
They are deliberately outside the product change. Use that source snapshot for
reproduction; no binary or patch handoff is required.

The previous cloud attempts are closed and cannot be relaunched. The reported
native decoder evidence motivates the debug-home change, but does not validate
this new source or establish the original activation and no-replacement-traffic
gates. A new sealed attempt requires a healthy admitted executor and a new
explicit approval under the archived protocol. Ordinary development checks do
not change the historical performance NO-GO.
