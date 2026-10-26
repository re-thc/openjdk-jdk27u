# Direct baseline prototype: result on 2026-10-26

**Historical result, before the independent implementation audit.** The build
below still omitted the direct compiler from nmethod entry-barrier support.
The audit reproduced both permanent slow entry and failed linked-call
invalidation, then fixed them. The matched diagnosis recovers most of this
startup loss. See [causal diagnosis and subsequent results](direct-baseline-diagnosis.md).
All earlier results and failures remain below; they do not qualify the fixed build.

The direct emitter is implemented and executes ordinary HotSpot nmethods, but
this prototype **fails the performance requirement and must remain off**.
The corrected build regresses javac startup and the measured warmed window;
delaying ordinary C1 makes the result worse. Successful correctness tests and
cheap individual compilations do not override this result.

## Corrected-build comparison

All timing results below use the final corrected integer-call ABI, tracing off,
serial interleaved fresh VMs and the same Java/module/native-library image
except libjvm. The stock image is PR95 head
`5ccc4bfff24830c1b88f093a2cd438304e51983f`; PR95 was rechecked and remained open
and unmerged. No PR105 changes are used. GCC 16 release configurations use the
same PR95 native CPU baseline. Baseline-off is also measured in the prototype
binary, providing the primary comparison for the feature.

| Median metric | Stock | Prototype off | Early baseline | Early + delayed C1 |
|---|---:|---:|---:|---:|
| Parser process startup, ms (8 forks) | 77.49 | 69.24 | 80.03 | 89.84 |
| javac process startup, ms (8 forks) | 466.74 | 477.24 | 610.54 | 738.07 |
| Warm parser batch, ms (3 forks) | 22.26 | 22.25 | 22.14 | 24.06 |
| Warm javac compilation, ms (3 forks) | 5.355 | 5.330 | 6.478 | 6.692 |

Relative to prototype-off, early javac startup is 27.9% slower and its warm-window
median is 21.5% slower. Delayed C1 gives 54.7% and 25.6% losses respectively.
The parser warm kernel is approximately neutral with early baseline. The
stock/off startup discrepancy on the parser is another reason to retain both
controls rather than attribute all cross-binary differences to the feature.

The warm javac fork medians were:

| Fork | Stock, ms | Prototype off, ms | Early, ms | Delayed, ms |
|---|---:|---:|---:|---:|
| 0 | 6.584 | 4.806 | 5.278 | 6.692 |
| 1 | 5.355 | 5.330 | 6.478 | 7.448 |
| 2 | 5.288 | 6.903 | 6.507 | 5.952 |

There is substantial variation and only three forks. These measurements do
not establish a precise peak-throughput loss or full compilation quiescence.
The driver warms javac for 1,500 tasks, waits two seconds and then waits for
CompilationMXBean time to stay stable before measuring 100 more tasks.
Separate PrintCompilation diagnostics still showed 37 off / 81 early
compilation-state lines between the first and last measured samples. The
remaining later compilation/profile cost is not fully attributed. There is
no evidence supporting a warmed-neutrality claim, and the startup loss is
clear; this configuration is rejected rather than promoted or tuned around
that uncertainty.

Common flags were `-Xshare:off -XX:+UseG1GC -Xms128m -Xmx128m
-XX:ActiveProcessorCount=4 -XX:CICompilerCount=3`, plus option-unlock flags.
The host was a shared AMD EPYC 9V74 environment with a four-CPU cgroup quota;
measurement processes were pinned to CPUs 0–3. Builds and correctness tests
were stopped during timing. All 88 final timed processes exited successfully.
Complete process wall/CPU/max-RSS data are in
[the raw samples](direct-baseline-data/samples.tsv) and
[the summary](direct-baseline-data/summary.tsv).

Early mode uses threshold 32 with unchanged ordinary admission flags and
notification masks. Delayed mode explicitly changes only the ordinary
normal-entry predicates to Tier3InvocationThreshold=600,
Tier3MinInvocationThreshold=300 and Tier3CompileThreshold=6000. OSR thresholds,
notification masks and C2 flags stay unchanged. This is a deliberately global
normal-entry policy comparison, including methods outside the initial emitter
subset; it is not proposed as a production policy or a tuned optimum.

## Coverage, CPU and retained cost

Three corrected, separately traced javac startup diagnostics produced:

| Run | Baseline tasks | Installed | javac-owned installed | All task CPU, ms | Successful task median, us |
|---|---:|---:|---:|---:|---:|
| 0 | 586 | 111 | 11 | 14.697 | 40.88 |
| 1 | 582 | 108 | 11 | 14.813 | 42.52 |
| 2 | 586 | 111 | 11 | 14.355 | 43.59 |

Whole-task CPU includes CI setup, type prepass, emission, installation and
failure handling; trace printing is also included. These diagnostics are not
application timing samples. Individual install CPU is not separately timed.
The process CPU comparison includes requester/queue work and all downstream
C1/C2 work, so compiler-only numbers are not treated as net savings.

Coverage here means methods crossing the independent early trigger and being
accepted by the bounded subset. It is not a percentage of all executed Java
calls or bytecodes. Real accepted javac methods included Assert.check,
Assert.checkNonNull, Context.uncheckedCast, BaseFileManager.nullCheck and
Code.width. In corrected run 0, Context.uncheckedCast served 217 baseline
entries before ordinary admission at total count 256; Code.width served 220;
Assert.checkNonNull served 349 before admission at total 384. Queuing and MDO
creation mean admission is not universally at 256. The trace records MC, MDO
and their total separately; none is reset by baseline installation.

The short parser was less favorable: three corrected diagnostic runs installed
zero, zero and three application helpers respectively. In the last, record
installed at count 256 and served 20 entries by C1 installation at total 276.
This does not establish a useful pre-admission window for that short startup.
Controlled correctness runs do show earlier installs and substantial baseline
execution, but they are not substituted for application performance.

A post-javac `jcmd Compiler.codelist` snapshot matched compile IDs to the
baseline installation trace. All 111 installed baseline nmethods were still
resident: 63 executable and 48 not entrant. Their code-cache blobs totalled
71,200 bytes, with 24,652 additional bytes of relocations/metadata/dependencies,
scopes and immutable oop maps. These are allocation sizes and exclude allocator
headers/rounding. This 93.6 KiB residency is additional work even for replaced
methods until normal reclamation occurs. Global CodeCache/NMT snapshots are
retained too; adaptive ordinary compilation prevents their difference from
being an exact baseline-only attribution.

MethodCounters grows from 64 to 72 bytes on this release x64 build, including
when the feature is off. The experimental compiler singleton and shared-queue
accounting add small process-wide state. The final stripped libjvm grows from
29,080,344 to 29,112,608 bytes (+32,264). Each emission reserves a transient
64 KiB code buffer plus 16 KiB relocation capacity, in addition to the bounded
prepass and CI resource allocations. Baseline calls use the method's ordinary
entry linkage, and no dispatch layer remains on warmed C1/C2 calls. The
observed later cost cannot therefore be dismissed as an explicit permanent
baseline dispatch; profiling history, generated-code placement and later
compilation effects need attribution before another performance claim.

## Correctness and integration evidence

Release and fastdebug HotSpot builds pass both new jtreg tests. They cover
Serial/G1, fields and reference/volatile barriers, array access and guard
deoptimization after side effects, callee exception unwinding and stack
traces, GC-moving fresh references across calls, stack-passed arguments,
subword returns from generated verified bytecode, virtual-thread yielding,
whole-method fallback, preserved C1 compilability and C2 bypass of installed
and pending baseline work. The C2 argument regression test also passes with
HeapBaseMinAddress=32g to poison stale high halves of canonical stack slots.
Corrected standalone tests additionally pass with uncompressed oops and with
eight-byte object headers. This is focused prototype validation, not full
HotSpot/JVMTI/continuation production qualification.

Queue ownership is separate from ordinary compilation. Baseline work cannot
clear the ordinary queued bit, count as completed C1, overwrite a pending or
installed ordinary result, or reinstall after an ordinary tier has existed.
Baseline backlog is excluded from ordinary threshold-load feedback. The
emitter increments the interpreter's current MC or MDO and uses its existing
notification mask; it does not manufacture a new counter origin. C1 and C2
implementations and numeric levels are preserved. Loops are rejected wholesale
so interpreter OSR remains available.

Fastdebug required a local build-only
`BUILD_LIBJVM_DISABLED_WARNINGS_gcc_handshake.cpp="stringop-overflow nonnull"`
override for an existing GCC 16 nonnull warning. No unrelated handshake source
change was made. Initial failures are preserved:

1. Restored build configuration rejected the changed desktop policy; a fresh
   matched PR95 configuration was built.
2. Initial syntax/API errors were corrected before executable validation.
3. Exception/deopt offsets were initially placed in the instruction section;
   nmethod expects these offsets in the stub section. The resulting deopt crash
   was fixed and is retained as hs_err_pid73419.
4. An assertion caught a missing ResourceMark in trace-only admission logging.
5. A later javac/NMT run crashed in an optimized unsignedHashCode callee.
   Integer Java arguments had been moved as full machine words, carrying stale
   upper bits into C2. Arguments, stack slots and returns now use type-correct
   32-bit integer moves; references remain full-width. The original crash
   hs_err_pid109242 is retained and a focused high-heap C2-callee test was added.

**All timing series before this ABI correction are invalid as acceptance
results.** They remain in `measure-1`, `measure-steady` and `measure-drained`,
with source snapshots and old libraries retained. Only `measure-final` supplies
the table above. The first javac window used 80 warmup tasks, the second 500,
and the last pre-fix window 1,500 plus a compilation drain. None is silently
replaced or pooled with the corrected result.

## Deliverables and limits

The implementation is [directBaseline_x86.cpp](../../src/hotspot/cpu/x86/directBaseline_x86.cpp),
with [architecture and admission details](direct-baseline.md). The emitter
remains static-method/category-1/forward-CFG only, with Serial/G1 and selected
JVMTI modes. Other methods fall back whole without global non-compilability;
there is no C1 HIR/LIR/global allocator and no mandatory tier ladder. Training
record/replay and compiler replay remain excluded. ProfileInterpreter must be
enabled. Unsupported operations and wider qualification are explicit limits.

The evaluation sources and serial interleaving script are under
`test/hotspot/jtreg/compiler/baseline/eval`. To reproduce the final shortened
run, use the saved `measure-final.py` (8 startup / 3 warm forks); the repository
script defaults to 10 / 6. Raw output, per-process commands, effective flags,
matched stock/prototype/debug images, build logs, failures, NMT/code-cache
snapshots and the retained-code ID join are in
`/workspace/direct-baseline-evidence/`. Library hashes are
[recorded here](direct-baseline-data/library-sha256.txt).

Remaining blocker: application performance and full attribution of the later
cost. No default-on use, new PR, push, merge, CI dispatch or Library transfer
was performed. The result is a useful local direct-emission prototype and a
negative acceptance decision, not a direct-emitter speedup claim.
