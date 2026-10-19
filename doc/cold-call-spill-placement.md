# C2 cold-call spill placement

`UseColdCallSpillDeferral` defaults to enabled on Linux x64 and disabled on
other platforms. `-XX:-UseColdCallSpillDeferral` restores ordinary placement
without requiring diagnostic options. Ordinary splitting, hard constraints,
coloring and allocator retry remain the fallback.

## Pressure-deferral contract

Pressure deferral applies only on the first Split attempt. It records individual
definitions, rather than marking an entire coalesced live range: every reaching
definition needs its own proof, and the whole range must retain scalar, mask and
conflict eligibility. Pointer/oop/derived, floating, vector and predicate
definitions remain excluded.

A definition needs a call-debug use and frequency greater than ten times the
accumulated hard-constraint frequency. Reverse liveness removes the call result
before inspecting values live after the call, then processes arguments and
debug inputs. A call input is not automatically a value surviving the call.

A Phi needs known predecessors, at least one UP input, and deferral provenance
for every UP input. Already-UP Phis need the same proof. Copy costs use the full
predecessor-block frequencies because placement precedes the terminator, not
necessarily a dedicated edge. The additional guard is:

```
UP frequency > 10 * (2 * DOWN frequency + 3 * whole-range constraint frequency)
```

The 2/1 load/store weights and store-plus-reload reserve are placement costs,
not physical traffic estimates. Unknown backedges, unmarked definitions,
invalid frequencies and overflow retain ordinary placement.

PASS1 decides before entry-state tracking, debug definitions and use rewriting.
A pressure-boundary exemption needs a proven reaching definition and the
original hot-block guard. Hard spills and fresh reloads acquire no provenance.
PASS2 retains all state-reconciliation copies. Masks, CFG edges, physical
interference, OopMaps and base/derived obligations remain enforced.

## Cold debug-home contract

For a currently spilling input, an eligible `DebugUse` copy can forward its
single call-debug edge to the allocator's cached same-value DOWN machine
definition. The copy's live range must have one definition; the call must
follow it in the same cold block, with exact value type and register class.

Only integer, long and zero-offset base-oop/narrow-oop Java-state values qualify.
Arguments, constant-base inputs, monitor objects/boxes, derived/oop-map edges,
bound call operands and locally bound homes retain ordinary handling. The home
output, call input and every existing home use must retain an unbounded stack
domain. No mask is widened and no coloring priority is changed.

The copy is removed before masks, liveness and interference are rebuilt.
Extending the home at that point protects it against simultaneous call-debug
values. This is an existing same-value definition, not a slot inferred from
coloring. Phi reconciliation, two-address constraints and retries remain
ordinary allocator work. Forwarded base-oop homes remain live for GC and
Java-state reconstruction. Debug-home reuse can apply on later Split attempts.

## Regression coverage

- `TestColdCallSpillPolicy` and its native helper check production costs, masks,
  reverse liveness, invalid profiles and the two-join model.
- `TestColdCallSpillPlacement` checks default/off/on behavior, Java state and
  negative cases. Its structural oracle requires three packed roots, two proven
  joins per root, pressure-forced DOWN decisions and boundary activation.
- `TestColdCallDerivedPointers` checks actual moving oop/base/derived pairs.
  It and the placement test require Serial GC, which their children select.
- `TestColdCallDebugHome` requires G1 and checks default/off/on, GC,
  deoptimization, compressed/uncompressed oops and frame pointers. Its fastdebug
  oracle requires base-oop forwarding in compilation 2 at the unique machine
  trap for the exercised BCI/reason, plus a WhiteBox trap-count increment.
  Nonactivation or an ambiguous site fails.
