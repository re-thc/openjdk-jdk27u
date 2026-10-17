# Spill-copy retention research prototype

`RetainSpillCopies` is a **develop-only, default-false AMD64 experiment**.
It assigns a spare GP register to one short invariant-stack reload at a time,
then delegates sharing to existing postallocation copy removal. It does not
change the source stack home's allocation, oop classification, original operand
masks, call masks or the eligibility exclusions for derived/raw pointers,
mutable Phis, unsupported masks, calls, polls and constrained consumers.

This follow-up is source-reviewed only. Its C++ changes and new tests have not
been built or executed. The prior `4ef044f2088` captures are evidence for that
older compiler, not execution results for this revision. No throughput or
compile-time improvement is claimed.

## Cost controls

The constants are named together in
`src/hotspot/share/opto/spillCopyRetention.hpp`. They are conservative research
limits, not a tuned cost model or public command-line tuning interface.

| Limit | Value | What it limits |
| --- | ---: | --- |
| `MaxAnalysisWork` | 1,000,000 | Logical array-initialization elements, graph/node/input visits, dominance steps and candidate-analysis visits across the invocation |
| `MaxChanges` | 4 | Recolors and whole-method cleanup invocations within retention |
| `MaxTrials` | 128 | Eligible seeds assessed per analysis iteration |
| `MaxLivenessRounds` | 64 | Fixed-point rounds per iteration |
| `MaxIntervalBlocks` | 64 | Distinct blocks in an individual seed-to-use corridor |
| `MaxEntries` | 128 | Remembered exact invariant-entry provenance records |
| `MaxBlocks` | 2,048 | CFG blocks admitted before allocating analysis arrays |
| `MaxNodes` | 32,768 | Scheduled nodes admitted by the preflight scan |
| `MaxNodeIndex` | 131,072 | Node-index array length, including dead/unscheduled index space |
| `MaxLRGs` | 65,536 | LRG-membership array length |
| `MaxRegisters` | 2,048 | Register/stack-slot map span (`_max_reg`) |
| `MaxEdges` | 262,144 | Required inputs in the scheduled graph, including debug inputs |
| `MaxCleanupMapWork` | 8,388,608 | Separate cumulative register-map admission estimate, reserved before each recolor |

The one-million counter **is not a total compile-cost or elapsed-time bound**.
It counts logical operations, not instructions. Fixed-width register-mask
operations, arena/vector allocation, bounded helper work, diagnostic graph
serialization and whole-method copy removal are not completely charged by it.
The size caps also bound scratch-array lengths. Their admission scan is charged
and stops as soon as a cap is exceeded. Array initialization is charged before
allocation. Node positions are indexed once per iteration instead of repeatedly
calling `find_node`; leading Phi counts are cached in the same visit instead
of rescanning them per predecessor/round. Each step of a dominator walk is charged.

Copy removal is never interrupted halfway through to satisfy a heuristic
budget. Before changing a color, retention reserves
`2 * blocks + (3 * blocks + predecessor_edges) * _max_reg` units from its separate
map allowance, using 64-bit arithmetic. This is an admission estimate for map
initialization/copies/merges, **not** a proof bounding recursive copy chasing,
recursive dead-node deletion, all allocations, or all work in cleanup. The
independent graph-size and four-pass caps conservatively restrict that extra
work. No wall-clock upper bound is asserted.

If no recolor is accepted, the caller performs its original single cleanup.
After a recolor, the last retention cleanup also serves as the caller's final
cleanup, with no subsequent graph mutation before returning. Thus there are
at most four whole-method cleanup invocations in total, at most three more than
the disabled path. Previously eight retention cleanups plus an unconditional
final cleanup were possible. Removing that additional final pass can change
cold copies and debug locations: cleanup is not assumed to reach a fixed point.
The lower limits and wider accounting can also stop before choices made by the
older prototype. Generated code must be recaptured before transferring old
instruction counts to this revision.

## Timing visibility (not measured here)

The existing `Compile::TracePhase` infrastructure now exposes:

* `retainSpillCopies`: inclusive retention phase, including admission/setup,
  search, cleanup, tracing and its graph snapshots;
* `retainSpillAnalysis`: graph admission, initialization, liveness and search;
* `retainSpillCleanup`: only the nested calls to whole-method cleanup.

`CITime` prints their accumulated time; `CITimeVerbose` supplies the standard
per-compilation phase entries in `LogCompilation` and verbose phase output.
The existing `postAllocCopyRemoval` timer still includes all cleanup calls.
The regalloc “Other” calculation subtracts inclusive retention minus its nested
cleanup, avoiding double-counting cleanup. The three timing rows are inclusive
or nested as labeled; they must not simply be added together. Timing is opt-in;
no timing workload was run for this change.

## Copy-removal interactions

Physical liveness includes all CFG successors, debug/recovery `req()` inputs,
edge-specific Phi operands and both aliases of a GP definition. The interval
scan includes the consuming instruction's own clobbers and paired stack-home
overlap. Every accepted color is followed immediately by cleanup. Before another
choice, membership, node positions and complete liveness are rebuilt from the
changed graph; stale pre-cleanup facts cannot certify another register.

Cleanup may delete/bypass invariant Phis, elide sibling reloads, redirect typed
debug copies, and rewrite call/recovery inputs when their existing masks permit.
It can extend availability beyond the intervals selected by retention, including
through a preserving non-GC leaf. Retention's own call/poll exclusions have not
been relaxed. `use_prior_register` still checks the particular rewritten input
mask and callee-save restrictions; `skip_copies` stops at an oop-kind change.
These remain the authority for extensions performed by cleanup.

An entry retained after Phi folding must match the exact original Node, LRG,
type identity, oop bit and complete stack-home mask. A fresh value in the same
stack slot does not qualify. The shared helper does not recursively infer that
different nested Phis or equal-looking locations hold the same Java value.

Only the chosen seed LRG is recolored, but **debug-input locations are not
frozen**. Final `BuildOopMaps` and emitted `ScopeValue`s are generated after all
cleanup and must describe the final typed reaching definitions. Unchanged stack
homes, source review and allocator verification do not substitute for executing
those recovery contracts. No new active-frame validation is included here.

## Checked-in regression sources

`test/hotspot/gtest/opto/test_spillCopyRetention.cpp` uses the same policy and
transfer helpers as production, including actual `RegMask` operations. It covers
32-bit and fat GP-pair clobbers; fixed masks and two-address/safepoint/call/debug
consumer rejection; predecessor-specific Phi uses; nested invariant-Phi folding
classification and exact entry provenance; paired home overwrites and endpoint
barriers; saturating work budgets, graph/map-admission caps; and extended/rolled
mask bailouts. The nested-Phi case explicitly supplies a cleanup fold to test
the production eligibility helper; it does not execute an entire C2 cleanup.
The tests do not construct an entire machine CFG or verify OopMap emission.

`test/hotspot/jtreg/compiler/regalloc/TestRetainSpillCopies.java` supplies an
end-to-end numeric C2 workload and an array-based interpreted oracle. Sixteen
live long states, variable division/rotation, nested loops and joins, invariant
array references and an explicitly non-inlined returning call exercise allocator
pressure. The checked-in run directives cover retention enabled, disabled and
enabled with a preserved frame pointer, with allocator verification and an
assertion that the target reached normal C2 compilation. This is correctness
stress, not an assertion of a particular physical allocation, retention firing,
Phi survival after optimization, performance benefit or GC/deoptimization.

For a **separately authorized future validation**, on a configured AMD64
fastdebug build, the standard repository entry points are:

```
make test TEST=gtest:SpillCopyRetention
make test TEST=test/hotspot/jtreg/compiler/regalloc/TestRetainSpillCopies.java
```

These commands were not run. Build compatibility, the new regression outcomes,
isolated compile-cost measurements and recapture of generated-code effects are
open gates. The earlier security-stopped active-frame validation remains stopped;
it has neither been retried nor replaced by this change. Broader GC/recovery
qualification, unsupported architectures and runtime performance remain open.
