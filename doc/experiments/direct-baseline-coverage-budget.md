# Why the queued methods still reject

The 1,107 pre-CI refusals are distinct methods in each retained capture, not
1,107 repeated attempts at a few methods. The first capture has 3,063 runtime
request calls and 2,253 serviced worker tasks, each with a distinct qualified
name/signature; the second has 3,064 calls and 2,258 distinct serviced methods.
Runtime request identity was not recorded, so its unique-method count is
unknown. Methods rejected before enqueue and stale tasks removed from the queue
are not part of the serviced-task denominator.

| Native worker's first rejection | Capture 1 | Capture 2 |
|---|---:|---:|
| Unsupported bytecode | 867 | 868 |
| Backward branch / loop excluded | 58 | 58 |
| Conservative local-type merge | 33 | 32 |
| Non-int constant | 77 | 77 |
| Unsupported root parameter types | 22 | 22 |
| Unsupported field descriptor type | 26 | 26 |
| Unsupported call descriptor type | 24 | 24 |
| Total | 1107 | 1107 |

The exact histogram decodes the retained in-memory failure-reason hashes using
the tested source's literal reasons. See
[rejection denominators](direct-baseline-data/coverage-native-rejections.tsv).
The two source labels "unresolved/unsupported field/call" are misleading at
this point: the native pass has not tried to resolve them. It has encountered
long/float/double categories outside the int/reference subset.

Constructors, handler-bearing methods, synchronized/monitor/scoped methods,
intrinsics, and the 512-byte/64-local/32-stack bounds contribute zero to these
1,107. Existing request-side metadata checks reject those roots earlier. The
22 residual "method shape" failures are unsupported parameter signatures;
unsupported return categories already fail request preflight. Constructor calls
inside otherwise eligible methods can reject later in CI, independently of
constructor roots. There are also roughly 300 post-CI failures, including
unbound/interface targets, initialization/access/link checks, which this table
does not conflate with the 1,107 syntactic/type refusals.

The queue admits these methods because application-thread preflight deliberately
checks cached method flags, bounds, result type and a leading allocation opcode.
It does not walk the body or parameter signatures while holding the global
queue lock. A later allocation, interface call, cast or wide value therefore
reaches the worker. This is a limitation of the implementation, not a JVM rule
that those methods cannot compile.

## Which operations are missing

Parsing the already extracted exact-image class files maps 836/837 of the
867/868 unsupported-opcode refusals. The remaining 31 per capture are generated
or hidden classes whose bytecode files were not retained; their opcode is not
guessed. This adds no workload execution or timing campaign.

| First missing opcode, mapped methods | Capture 1 | Capture 2 |
|---|---:|---:|
| invokeinterface | 239 | 240 |
| new | 220 | 220 |
| checkcast | 173 | 174 |
| instanceof | 44 | 44 |
| invokedynamic | 29 | 29 |
| tableswitch / lookupswitch | 34 | 33 |
| dup_x1 | 18 | 18 |
| anewarray / newarray | 28 | 28 |
| bastore / aastore | 20 | 20 |
| athrow | 10 | 10 |
| Other missing operations | 21 | 21 |
| Unavailable class bytes | 31 | 31 |

This is first-failure attribution, not a count of every unsupported operation
in a body. The [opcode table](direct-baseline-data/coverage-native-opcodes.tsv)
also counts bodies whose only missing *syntactic opcode* is that operation;
these are upper bounds, because signatures, merges, target binding and other
runtime checks can still reject. In particular, 64 bodies with only `new` as
a missing opcode still need constructor/uninitialized-object support: their
invokespecial instruction is syntactically recognized but constructor targets
remain unsupported.

`checkcast` is the strongest bounded next coverage candidate: 120/121 bodies
have it as their sole missing syntactic opcode, including 73 javac methods in
the first capture. Nineteen of the 120 have an ordinary nmethod visible in the
separate startup diagnostic, with first-install invocation counts 257–1,125.
Examples include PoolReader.getName/getPackage and Types.supertype/asSuper.
This indicates possible early-call opportunity, not measured direct entries or
CPU savings. Other calls in these methods may remain dynamically unbound.
A loaded-class cast check can reuse the existing category/reference state and
deopt/reexecute fallback, while preserving null behavior, access/loading rules,
subtype semantics and precise roots. It needs no general IR. It is not being
added while the successful-path budget remains unresolved.

Interface dispatch is numerically larger (138 bodies with no other missing
syntactic opcode), but needs proper interface lookup/IC, miss, GC, patching and
replacement contracts. Allocation's 220 first failures need object allocation,
initialization/uninitialized-reference states, barriers and exception handling.
Invokedynamic additionally needs appendix/signature-polymorphic handling.
Those are substantial runtime support, not one-byte emitter additions.
Long arithmetic/flags, array stores and switches have bounded implementations,
but their useful complete-method coverage and early execution must be counted
before implementation. The 33 local merge refusals are an overly conservative
representation choice; relaxing them needs verifier/liveness-aware precise
maps, not treating a possibly live reference as dead. The 58 backward branches
need progress polls, counter/OSR policy and loop state support; the existing
forward-only pass intentionally leaves interpreter OSR intact.

## Accepted-path structural work continues separately

The worker-front candidate and its adverse warm results remain preserved.
A subsequent isolated candidate defers rich ciSignature construction only for
loaded methods in direct CI environments. Any public CI signature/type query
still constructs the real signature with the real accessing class/loader;
ordinary C1/C2 and unloaded CI methods retain eager setup. Plain-call emission
requests the existing access/loader-checked CI lookup without unused concrete
signature types, rejects appendix/local-signature forms, and compares the
immutable descriptor symbol. This changes setup, not coverage or thresholds.
The shared CI accessor change requires rebuilding affected objects coherently;
release and fastdebug qualification are in progress, not yet claimed passed.

A separate in-memory installation probe, with no diagnostic printing, has
completed and its source has been restored. Two captures cover 843/844 installs:

| Inclusive installation component | CPU ms, capture 1 / 2 |
|---|---:|
| Immutable-data allocation | 2.697 / 0.515 |
| Code-cache allocation | 0.455 / 0.993 |
| Allocation plus nmethod constructor | 6.478 / 8.015 |
| Collector registration, inside constructor | 0.727 / 0.841 |
| Code-cache commit, inside constructor | 0.213 / 0.185 |
| Publication / old-code transition | 0.279 / 0.261 |
| Queue-lock acquisition | 0.365 / 1.211 |
| Validation | 0.560 / 0.644 |
| Post-compile events/accounting | 0.742 / 0.940 |

Allocation plus constructor includes code-cache allocation, collector
registration and commit; these cannot be summed. Small components include the
probe's 120–125 ns clock cost. Queue-lock wall time is 1.632/2.891 ms, larger
than its CPU time. Allocation varies substantially, so no single-capture malloc
fix or irreducible cost floor is claimed. See
[all component observations](direct-baseline-data/accepted-install-probe.tsv).
The result points toward metadata construction/copy/representation as well as
allocation, rather than collector registration or publication as the dominant
successful-path expense. Correctness checks remain mandatory.

The [whole-path budget](direct-baseline-budget.md) still requires roughly
364 ns saving per recorded early entry in the initial estimate. Even deleting
all measured signature/operand work cannot close that gap. At the synthetic
7–23 ns/call savings, a hypothetical 165,000-entry window affords only about
1.1–3.8 ms total, or at most 1.3–4.5 microseconds per successful install if
requests and refusals were free. The measured request path alone costs about
19 ms. These are illustrative targets, not workload-weighted savings or an
attainability claim. A credible cheap-stage design must reduce request/handoff
and successful install/metadata costs together; expanding unsupported coverage
alone would multiply the current expensive path.
