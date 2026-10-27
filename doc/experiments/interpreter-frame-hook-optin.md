# Explicit generation opt-in for forced-poll regression hooks

Local runtime source `452b85eef42` removes forced-poll test machinery from the
normal generated pilot entry, including when WhiteBox is enabled. It retains
the existing polling, interpreter-only, JVMTI and breakpoint guards. This is
test-instrumentation cleanup; no new timing establishes a fix for the Long
regression in the [retained comparison](interpreter-frame-match.md).

The new non-manageable diagnostic flag InterpreterFramePilotTestPoll defaults
to false. The C++ emitters generate request/arm/record hooks only when it,
WhiteBoxAPI and UseInterpreterFramePilot are all enabled at startup. With the
test opt-in absent, entry generation emits the original real poll test and
branch-on-armed fallback. There is no generated flag test or replacement
per-invocation instrumentation branch. The safepoint return marker is omitted
by the same generation condition. WhiteBox action 6 refuses requests without
the opt-in; the stats/action interface and MethodCounters layout are unchanged.
Runtime WhiteBox mutation of generation flags is outside this startup-only
contract, as it is for the existing pilot enablement/generation flags.

The guard fixture explicitly opts in only its forced-poll children. The new
plain children verify request refusal, two native prefix executions, hit
increments and an unchanged immutable entry without hooks. The late-breakpoint
children retain their debugger semantics checks without poll instrumentation.
All three paths exercise preparation actions 0, 4 and 5. The forced poll still
uses the official local poll and ordinary interpreter safepoint runtime;
assertions and real guards are preserved. Its established scope remains
disarm-poll processing, with no queued handshake. Breakpoint/local-access
capabilities are reserved at OnLoad before the later SetBreakpoint; their
conservative fallback is not weakened.

Independent read-only source review accepted the generation-time gating,
leaf/entry/fallback contracts and the three fixture paths before execution.
Both coherent release and fastdebug images pass the guard driver, the existing
pilot fixture and all five direct-baseline tests: fourteen jtreg file results
in the [test ledger](direct-baseline-data/interpreter-hook-optin-tests.tsv).
The guard driver covers nine children per image, eighteen total, with every
child exit zero and its success marker retained in the raw process logs. The
[case ledger](direct-baseline-data/interpreter-hook-optin-cases.tsv) records
the normal controls, opted-in forced polls and late breakpoints for all three
preparation routes. The existing pilot fixture retains Serial/G1 semantics,
oop identity, fallback, dynamic JFR tooling, C1/deoptimization handoff,
concurrent publication/GC/walking, unloading and arena-exhaustion checks.

Four diagnostic `PrintInterpreter -version` JVMs capture the actual generated
normal-entry and safepoint codelets, with WhiteBox enabled in every case.
Their printed bytes are reconstructed and disassembled with objdump; this
does not require hsdis or a new VM inspection interface. These are code
verification runs, with no performance measurements or benchmark harness.

| Image / test opt-in | Entry forced-poll state accesses | Safepoint return state accesses | Normal entry / safepoint codelet bytes |
|---|---:|---:|---:|
| Release / absent | 0 | 0 | 680 / 1,200 |
| Release / enabled | 3 | 1 | 752 / 1,280 |
| Fastdebug / absent | 0 | 0 | 1,048 / 2,112 |
| Fastdebug / enabled | 3 | 1 | 1,144 / 2,224 |

The normal entry contains no test-state compare/branch, arm leaf-call block or
guard recorder, and its safepoint return contains no test marker. The direct
branch-on-armed immediately after the real poll is verified in both normal
images; the opted-in images retain the test's clear-poll branch shape. Both
variants retain nine JVMTI boolean flag guards and the per-method breakpoint
guard. Fastdebug also retains its four debug boolean guards and StopInterpreterAt
guard. The [generated-code ledger](direct-baseline-data/interpreter-hook-optin-code.tsv)
records these checks; sizes cover entire codelets, including alignment, rather
than claiming a per-invocation CPU improvement. Source and libjvm identities
are in the [image ledger](direct-baseline-data/interpreter-hook-optin-images.tsv).

Private commands, logs, images and code dumps are retained under
`/workspace/interpreter-frame-hook-optin`, including separate image-release and
image-fastdebug directories. Both prior guard images and both matched
comparison images were hash-verified unchanged. Builds used JOBS=3
sequentially, with logging files verified byte-identical to landed PR104
92934849603fd86357c740ea50c345d335832932. The preexisting fastdebug GCC16
per-file handshake.cpp warning override was retained; no assertion was disabled.
All owned commands completed and were reaped. PID1's zombie set remains twenty,
and 3.2 GiB is free. No admission, opcode coverage, C1/C2 policy, existing feature
default or public action changes are included. The earlier adverse invocation
results remain valid for their preserved image; this cleanup makes no measured
claim about Long's regression or application benefit.

The subsequent [normal-admission design](interpreter-frame-admission-plan.md)
uses current source and retained application data to specify the next bounded
runtime path and its coverage/cost gates. It performs no implementation or
new timing.
