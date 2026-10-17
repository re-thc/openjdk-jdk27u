# Opt-in scalar alias versioning: source and profitability proposal

This is a local source-only follow-up to review commit
`c2aadeeda0cfe8b0e59ad6b2c9708cf2d23b9c02`. The independent review found no
identified source correctness blocker in that revision's identity guard,
memory closure, dominance requirements, alias fallback or constant-Phi routing.
That conclusion is not runtime, GC/deoptimization or release qualification.

The current revision makes the complete experiment opt-in. It does not claim a
register-retention improvement or smaller generated code. No new build, Java
compilation, regression execution, capture, benchmark or CI was performed.
The active-frame validation security stop remains exactly in force.

## Local source revision

`LoopScalarAliasVersioning` remains diagnostic, now defaults false and explicitly
describes its routing and guarded-load behavior as experimental. Opt-in requires
`-XX:+UnlockDiagnosticVMOptions -XX:+LoopScalarAliasVersioning`.

The same flag also gates the additional `can_split_if()` admission when legacy
`merge_point_safe()` rejects the merge. Thus leaving the flag at its default
retains the legacy safety policy as well as disabling alias versioning. Ordinary
safe split-if transformations retain their existing admission. This temporary
coupling keeps the entire proposed pipeline opt-in; it does not establish that
constant-condition routing must permanently share the alias flag.

With the flag enabled, the guard, full relevant memory-closure walk, original
null/range dominance requirements, pinned read, unchanged alias fallback,
predicate repairs and polls are unchanged. No allocator policy, exception
behavior, arithmetic/range proof, call summary or clone-size limit was relaxed.
`RetainSpillCopies` remains a separate default-off experiment.

The accepted alias CompileLog event now records the original `body_nodes` and
`clone_node_estimate`. The latter reuses the exact fanout-aware reservation
already required by admission; no additional graph scan or cost threshold is
introduced. Both are captured before cloning. These IR/resource counts support
future task-bound cost review and do not estimate emitted bytes or benefit.

Both new compiler tests retain their semantic oracles and alias/exception/partial
store cases. The sources now cover default, explicit on and explicit off:

* `TestScalarAliasVersioning` requires the same node-linked accepted IR and two
  polls when enabled, and rejects the parameter-array identity guard when off.
* `TestConstantPhiRouting` checks the actual flag value and origin, successful
  normal C2 target compilations and the oracle in every mode. The enabled case
  still requires positive activation and zero activation for mixed/local
  negatives. Default and explicit off require zero accepted routing and alias
  events throughout the compilation log.

These revised scenarios have not been compiled or run. Earlier passing tests
and the earlier normal C2 capture describe the previous source/image only.

## Actual remaining scalar operation

All identities in this section refer to the retained ordinary C2 compilation 765,
not its sibling OSR compilations. Ideal pinned LoadI9421 becomes machine loadI510.
It reads the repeat scalar before the continuing fast cycle. Allocation places
that short result in R9/LRG9153, then DefinitionSpillCopy9815 writes its stack
home 124/LRG4597.

The captured initial-split log creates DOWN definition9815 and subsequently
synthesizes an already-DOWN loop Phi9905. A separate UP interval later selects
R9. The original pre-initial-split mask, the first rejecting gate and pressure
state are not retained, so this audit cannot distinguish the original trigger
as a mask constraint, high pressure or another split condition. A free register
in the later cycle is not proof that the original broader interval could have
kept that register through its entry path and exits.

The continuing-cycle use is not a standalone reload instruction. Before
allocation, machine node 803 is `subI_rReg(position Phi714, scalar loadI510)`.
After spill conversion it is `subI_rReg_mem`, with dependency on 9815 and stack
offset 124. The emitted operation is `sub r8d,[rsp+124]`. Replacing this memory
operand with a register would leave one subtraction instruction in the body;
it would remove a stack read and its dependency, not an instruction by itself.

The same stack definition also feeds the first peeled iteration's subtraction,
a preheader repeat-positive check and exit Phis. It must not be recolored as a
single broad interval merely because its one continuing-cycle use is invariant.
The intervening entry path has live values and register definitions absent from
the continuing cycle.

An independent offline physical liveness walk covers all 967 final CFG blocks,
debug inputs, exact predecessor-edge Phi inputs and both halves of each GP
family. It converges in three rounds with no unresolved Phi edges. Omitting
fat-projection kills overapproximates liveness; the selected cycle contains no
fat projection or returning call. In this retained allocation, RAX, RBP, R13 and
R14 have neither a definition nor live-in/live-out/operand requirement throughout
the complete 27-block continuing cycle, including its cold successors.

Here "operand requirement" means a required old value, not the absence of every
physical read. The TLS poll uses arbitrary EAX bits as TEST data and does not
clobber RAX; its AD description kills flags. The scalar is absent from that
poll's debug inputs. These are instruction/liveness facts about the retained
code, not a recovery qualification. The stack-definition walk also finds no
write overlapping home bytes[124,128) in the selected entry/cycle corridors.

That result does **not** certify retaining the original R9 result from its load:
none of those four families is available across the entire B153--B174 entry
corridor. Recorded entry-path uses include the RAX value needed by Store609 in
B157, the RBP value used by reload9830 in B161, and R13/R14 values used in B157,
B165 and B156. A candidate must begin after those uses, for example at the late
B174 entry to header B175. Physical availability is a necessary witness, not an
instruction-mask, allocation-update or recovery proof.

## Bounded retention proposal

The concrete next hypothesis is a **new late-entry integer copy**, not extending
an old reload through its busy entry corridor and not recoloring stack home 124.
For the recorded cycle, a copy from the stable stack definition into an available
GP at B174 could feed the original register form of subtraction 803 across the
backedge. RAX is a candidate to investigate; no register is hard-coded by this
proposal, and the availability result must be recomputed for each compilation.

There is an existing implementation window before CISC spill conversion.
`PhaseChaitin::Register_Allocate()` performs copy cleanup and multi-definition
merging before `fixup_spills()`. The latter converts an instruction only when
its CISC input's allocated location is stack. A new GP-valued use before that
conversion can retain `subI_rReg`; it need not reverse an already materialized
`subI_rReg_mem`. Source inspection therefore identifies a narrower design than
adding a general inverse-CISC instruction generator.

This is not implemented in this revision. A prototype needs all of these
fail-closed obligations before mutation:

1. An exact source value and stack-home identity, available at the proposed
   entry and unchanged on every cycle path and backedge, including overlapping
   stack writes. A numeric slot equality alone is insufficient.
2. A complete bounded cycle and all-successor physical-liveness proof, both GP
   halves, reserved/callee-save policy, implicit clobbers, original consumer
   masks and two-address/output constraints. A write-set-only test is invalid.
3. Correct new-node/LRG/IFG bookkeeping at a point where the allocator can still
   verify the update. Keep the original stack definition, slow path, stores,
   poll, debug inputs and exit-state obligations. Do not recolor other values
   or silently extend whole-method cleanup into a recovery-contract change.
4. Invalidate and recompute affected liveness after mutation. Require targeted
   postconditions linking the new entry definition to subtraction 803 and the
   complete backedge; a smaller static load count is not an activation proof.

The current spill-retention experiment cannot provide this by being switched on:
its existing seed/provenance and acyclic, no-poll corridor contract excludes this
new cyclic lifetime, and the final body use is a folded CISC operand. Its safety
rules must not be weakened to obtain activation. This is also distinct from the
unmerged upstream loop-entry spilling proposal PR21472/JDK-8341697, which selects
UP/DOWN states for newly synthesized loop Phis during splitting.

For a continuing cycle executed m times after its peeled first iteration, the
new late-entry copy would add one stack read and potentially remove m folded
reads. For m=1 the stack-read count is unchanged. Total instruction count can
increase by the entry copy. A result can still improve or regress because load
latency, overlapping work, register placement, branch layout and front-end cost
matter. No cycles or speedup are assigned to these counts. The supplied average
search length does not give the distribution of searches reaching this cycle.

## Clone scope and cost

The retained before/after alias phases contain 5,110 and 5,572 nodes respectively:
485 added and 23 removed, net 462. The contiguous body-clone IDs7722--7903 identify
182 copied body nodes: 50 control nodes and 132 data/memory nodes, including two
StoreIs, nine LoadIs, twelve Phis and one poll. None has match-prefix/suffix,
literal-staging or sequence-encoding JVM-state ancestry. Those handlers had
already been routed outside the continuing cycle.

The additional repair is substantial: 18 exit joins, 36 exit projections,
198 exit SSA Phis, seven comparison/Bool repairs, 38 predicate-related nodes,
five selector nodes and the promoted load. Of the 198 Phis, 173 are int, 21 memory,
two long and two array; 151 retain their stable graph identities through later
optimization/matching/final code. A surviving Phi is not an emitted instruction.

There is no evidence here for an accidentally cloned whole-method suffix that
can simply be removed. Sharing an exit's machine block does not eliminate its
distinct memory, value and JVM-state inputs. The current generic clone and
repair preserve those inputs and the alias fallback. Removing such repairs
without proving their equivalence would discard the reviewed safety argument.

Sharing the loop's main arithmetic body between fast and alias modes is a
different design. The value must still be selected each iteration between the
cached scalar and a fresh alias-path load; that introduces mode-dependent
control/memory SSA and potentially another per-iteration branch. Ordinary loop
unswitching may reconstruct the two bodies. Such a design needs its own legality
and cost evidence, and is not a smaller implementation of the current reviewed
two-version contract. It is not proposed as the next source change.

Existing `est_loop_clone_sz()` already includes `est_loop_flow_merge_sz()` and
the current admission uses it for the global node budget. Exit fanout is not
wholly ignored. That resource reservation is not a local profitability model.
The next policy study should separately account for unique exits, distinct
escaping value/memory/JVM-state definitions, predicate copies and repaired-SSA
fanout, then conservatively leave the original loop when its justified local
budget is exceeded. Counting raw debug operand edges as distinct machine work
would substantially exaggerate cost. No arbitrary new threshold is installed
in this source revision or presented as a tuned policy.

The selector's `PROB_LIKELY_MAG(3)` is a supplied compiler hint, not an observed
non-alias rate. The existing trip-count helper can operate on ordinary LoopNodes,
but the current iteration-splitting caller computes it only after the non-counted
path has returned. Its failed-profile path marks failure and keeps a large
fallback value. A future policy must distinguish unknown/failed profile data
from a measured long-running loop, and must not use the selector hint as a
measured alias-success probability. Neither quantity currently establishes a
break-even point for this transform.

The 30,528 versus 28,072 main-code bytes are an observed aggregate difference of
2,456 bytes (8.75%) between the earlier combined prototype and baseline captures.
Those compilations have different profiling histories and include routing plus
aliasing effects. No part of that byte delta can be uniquely assigned to the
alias clone, exit Phis, predicates or scalar spilling from these artifacts alone.

## Profitability decision and hard boundary

Keep the complete pipeline opt-in. Investigate a late-entry scalar copy before
changing the cloned loop's semantics. Treat complex exit/liveout repair as a
separate admission cost, using the existing fanout estimate as a resource guard
and leaving the loop unchanged when a local profitability case is unsupported.
There is no basis to enable the flag by default from heap-read removal alone.

Without new JVM execution, source and retained artifacts can establish the
default-off gates, unchanged enabled proof, exact scalar/value provenance,
physical availability in that recorded allocation, clone/repair structure and
the acceptance conditions a future prototype must satisfy. They cannot establish
the new revision's compilation or test outcomes, a new retained-register code
shape, current runtime guard frequencies, net throughput, compile cost or
architecture-wide behavior. No previous test result is transferred to this
revision.

The exact hard boundary for adoption is the security-stopped **active-frame
GC/deoptimization recovery validation** for affected compiled frames and their
poll/debug/root contracts. It remains prohibited: no execution, recreation,
transfer or substitute procedure is included here. A retained scalar is an int,
but that alone does not prove that allocator or exit-state changes leave all
other locations and recovery contracts unaffected. Source review, static
liveness, ordinary tests and potential performance evidence cannot clear that
independent gate. Default enablement or release readiness is therefore blocked
even if a future allowed code capture removes the remaining stack read.
