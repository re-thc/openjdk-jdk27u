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

The independent scoped nonnull-diagnostic backport in `javaThread.inline.hpp`
preserves its handler and assertion without suppressing warnings globally.

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

## Bounded Linux x64 results

Measurements used pinned `jzstd@7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6` on
one AMD Linux x64 VM. Four independent balanced off/on pairs per case used six
seconds of warmup and five 700 ms windows per fork; each fork contributes one
median. All 72 forks across nine cases were retained. Normal tiered decoding
had these median paired changes:

| Native-zstd frame | Enabled versus disabled |
|---|---:|
| Source, level 1 | +3.6% |
| Source, level 3 | +3.0% |
| JSON, level 3 | +2.1% |
| DNA, level 3 | +11.9% |

C2-only source decoding gained 2.4%; raw/RLE, generic-reader and ordinary encoder
controls had no observed regression. Four pairs on one host do not establish
general Java performance or cross-machine confidence.

Separate source-trained tiered captures reduced main code from 7,584 to 6,824
bytes, frame reservation from 272 to 256 bytes, and static stack reads/writes
in the call-free packed-load loop region from 56/30 to 46/19. Register moves
increased from 19 to 24, and cold materialization remains. DNA's normal-decoder
compilation elapsed median rose from 12.5 to 14 ms with an extra allocator
retry. The result supports a net transport/code/throughput improvement with a
compilation tradeoff, rather than removal of every spill or compensating move.

Correctness passed for 57 fixed native-zstd-1.5.7 frames over 32 rounds, the four
focused tests and nine existing allocator/spilling tests. A newly built
current-source fastdebug VM also passed actual-default startup with DEFAULT
origin/product metadata, opt-out without diagnostic unlock, and the focused
GC/deoptimization controls. Full ordinary CI remains a separate check.
The [pinned workload and probe sources](https://github.com/re-thc/openjdk-jdk27u/tree/26a75f6755204efee764452ad02a0fe3d273dffa/doc/cold-call-qualification)
are retained outside the product change.
