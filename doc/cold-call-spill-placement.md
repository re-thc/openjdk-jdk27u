# C2 cold-call spill deferral

`UseColdCallSpillDeferral` defaults to enabled on Linux x64 and disabled on other
platforms. `-XX:-UseColdCallSpillDeferral` restores ordinary placement without
requiring diagnostic options. It defers eager pressure spills across rare
returning calls. Pressure deferral
changes the first Split allocation attempt only. The separate cold debug-home
reuse described below can apply during later Split attempts. Ordinary splitting
and allocator retry remain the fallback. The Linux x64 adoption evidence and
its limits are recorded below; other platforms have not been performance-qualified.

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
register transport or implicit frame work. The ordinary engineering comparison
below accounts for these costs separately from the safety assertions.

## Linux x64 engineering assessment, 2026-10-18

The adoption decision is limited to Linux x64. Ordinary PR CI images from
[`dc24f1ae917aaa6f62d325d65450ec3bb7e2f466`](https://github.com/re-thc/openjdk-jdk27u/commit/dc24f1ae917aaa6f62d325d65450ec3bb7e2f466)
contain the same C2 and x86 implementation as the subsequent regression-only
commits. Release and fastdebug images came from integration commit
`dcc4a8257028d6107ccf34cef0e9a3fb112e9c24`, built with GCC
`16.0.1 20260322 (experimental) [trunk r16-8246-g569ace1fa50]`.
The codec was pinned to `re-thc/jzstd@7a6b345d0df3d8571a30f4a9c974dfaa3a10d9b6`.
These reused images differ from the old sealed campaign's source/tool identities.

Correctness passed for 57 fixed native-zstd-1.5.7 frames from 19 corpora at
levels 1, 3 and 9, over 32 rounds, in release default/off/on and fastdebug/on
with allocator, oop and GC verification. All four focused cold-call jtreg
tests passed, including actual exercised-trap oop forwarding in compressed and
uncompressed configurations. Nine existing allocator/spilling tests also passed
with the option enabled. The updated default-mode focused tests passed on both
retained release and fastdebug images with default-on emulated; actual
no-argument startup on a binary containing the changed default is a separate
automatic-CI check.

The throughput plan was frozen before measurement: four independently started
forks per option per case, alternating paired order, six seconds of warmup and
five 700 ms windows per fork. Each fork contributes one median; all 72 forks
are retained. The following are medians of the four paired percentage changes:

| Workload | Enabled versus disabled |
|---|---:|
| Source, native level 1, normal tiered compilation | +3.6% |
| Source, native level 3, normal tiered compilation | +3.0% |
| JSON, native level 3, normal tiered compilation | +2.1% |
| DNA, native level 3, normal tiered compilation | +11.9% |
| Incompressible/raw control | +0.5% |
| Zeros/RLE control | +1.0% |
| Source, generic bit-reader control | +4.6% |
| Ordinary source level-1 encoder control | +6.3% |
| Source, native level 1, C2-only compilation | +2.4% |

Every pair favored the enabled option, but four pairs on one cloud VM do not
establish cross-machine confidence or general Java workload performance. Small
control changes can include host variation. Accumulated MXBean compilation
time during warmup was mixed: for source level 1, 572/562 ms disabled/enabled;
JSON, 498/542 ms; DNA, 468/507 ms. DNA's normal decoder allocation needed two retry attempts
instead of one and its compilation elapsed median rose from 12.5 to 14 ms.
The normal decoder C2 code was installed before 0.72 seconds in all applicable
forks and was not invalidated during the measured windows. Normal C2 decoder
code-size medians fell from 7,652 to 6,896 bytes for tiered source level 1 and
7,840 to 6,592 bytes for DNA. This is a throughput/code-size tradeoff with a
small observed compilation cost, not a zero-cost transformation.

Final-code comparisons used separate captures, excluded from the timing
ensemble. For the source-trained normal tiered decoder, the union of call-free
loop blocks containing the three packed loads had 56 stack reads and 30 writes
disabled, versus 46 reads and 19 writes enabled. Main code fell from 7,584 to
6,824 bytes and frame reservation from 272 to 256 bytes; register moves in that
region increased from 19 to 24. Under mixed-corpus C2 training, release main
code fell from 8,040 to 6,536 bytes, the corresponding stack accesses from
56/29 to 44/20, and frame reservation from 256 to 240 bytes. The enabled
captures had no exact-value hot stores of the three packed load roots; the
disabled captures had one such store for each root. Cold Java-state
materialization and stack-to-stack moves remain. There is no claim that every
spill or compensating move disappeared.

Neither the repaired images nor the earlier PR CI fastdebug image
(`a4b06e65a0b2fde31e96e803ab718b7bf0a9ab71`, source `26a75f6`) emitted the six
previously reported memory push/pop pairs under the matched mixed-corpus
training. Their absence therefore cannot be attributed to the repair. The
decision rests on exercised safety, lower net hot transport, smaller code and
the bounded throughput comparison; it does not assert the historical exact
six-copy or trace-chain oracle passed. Raw logs, commands, frame hashes,
disassembly and all observations are retained outside product Git in
`/workspace/pr51-real-decoder-engineering-20261018` on the validation executor.

## Standalone experiment

The one-off decoder workloads, campaign controllers, evidence analyzers and
their protocols are retained at immutable Git commit
[`26a75f6755204efee764452ad02a0fe3d273dffa`](https://github.com/re-thc/openjdk-jdk27u/tree/26a75f6755204efee764452ad02a0fe3d273dffa/doc/cold-call-qualification).
They are deliberately outside the product change. Use that source snapshot for
reproduction; no binary or patch handoff is required.

The previous sealed cloud attempts are closed and cannot be relaunched. The
historical mechanism result remains INCONCLUSIVE and the historical performance
NO-GO remains unchanged. The separate ordinary engineering assessment above
supports the narrower Linux x64 default; it does not retroactively pass the
archived activation, exact-copy or no-replacement-traffic gates.
