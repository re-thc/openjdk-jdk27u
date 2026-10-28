# Preparation accounting and bounded truncation fixes

This local continuation preserves qualified `46f1faa9750`, runtime
`6a7ccbf6b50`, its images and favorable direct-return comparison. The changes
are isolated duplicate-flush removal `311c81d4d41` and cold-field/forward-return
runtime/test candidate `7e502eabce9`. No admission, residency, C1/C2 thresholds,
default, arena sizing or public state changes.

## Preparation cost before another variant

Two preparation-only JVMs used the existing observed action4 on the qualified
image, in Equals/Static/Interface and Interface/Equals/Static order. There were
six preparations and no execution-timing windows. The uninstrumented action5
results in the direct-return report remain the production-like request evidence.
Observed cuts below retain all clock overhead; they are not substituted for
silent producer CPU, and bytecode decoding and emission remain one measured cut.

| Case/order | External request | WB before result array | Observed producer | Decode+emit | Flush/publication |
|---|---:|---:|---:|---:|---:|
|Equals first|21.452|20.290|19.439|15.894|0.631|
|Static second|15.954|13.059|11.627|8.002|0.712|
|Interface third|6.700|5.488|4.968|2.384|0.551|
|Interface first|16.895|15.733|14.872|11.938|0.611|
|Equals second|17.746|15.182|13.781|10.376|0.581|
|Static third|8.212|7.040|6.169|3.375|0.551|

All values are requesting-thread CPU microseconds. Lock acquisition is
0.150-0.191us, shape/signature analysis0.270-0.451us, fixed CodeBuffer setup
0.130-0.551us, buffer cleanup0.150-0.300us, ResourceMark cleanup0.121-0.151us.
Unassigned producer residual is1.151-1.633us; it includes ordinary wrapper/control/cleanup work and clock gaps. Label construction and BytecodeStream setup are inside the scan/emission cut, not this residual. It is not an allocator attribution.

The WB-before-array minus producer difference is0.520-1.432us. The external
minus WB-before-array difference is1.162-2.895us. These bracket reflection/JNI
method conversion, handles, WB snapshot and return plumbing, result-array
allocation/copy, native-to-Java return and clock overhead. They are not a precise
allocation/transition microprofile. The warmed query-only request internally
costs0.241-0.250us and externally1.412-1.453us; first queries are retained at
10.435-15.924us external CPU. No query cost is subtracted from generation.

No measured preparation owns a BufferBlob, creates MethodCounters or increases
ResourceArea used bytes/chunk capacity. OopRecorder tables remain lazily unused
in the fixed external CodeBuffer. This is not an all-allocator census. The
one-time arena and enclosing interpreter-blob costs remain separate startup
costs, not per-method allocation.

## Source ledger and limits

The held-method producer has one root-signature walk, one BytecodeStream walk,
and one simple signature walk per encountered ordinary call. It has no CFG/type-
state prepass, C1 IR, optimizer, register allocator, CI environment or nmethod
installation. Field type comes from an already valid cache entry or one leading
field-descriptor character. Calls reuse interpreter resolved entries at execution.
Cached root fingerprints could avoid some signature decoding, but the entire
measured shape/signature cut is below0.46us here; it cannot explain first-use
scan/emission costs. No new cross-subsystem cache or framework was added.

Actual work that remains is shape/type validation, machine-code encoding,
transient labels and fixups, fixed CodeBuffer bookkeeping, one instruction-cache
flush, and release publication under the existing no-safepoint generation mutex.
The current stack arrays initialize321 BCI labels and64 return labels even for
short bodies. That is a source-identified opportunity, not a measured allocation
problem or justification for a new label-map abstraction. ResourceMark remains
necessary for generic assembler overflow/debug paths. The single producer mutex
serializes the existing bounded no-recycling arena; no contended cost is measured.
WhiteBox's second snapshot lock and long[33] result are outside the silent core.

First-use scan/emission variation is substantial even for the same short shape:
Interface11.938us first versus2.384us third. Cold native emitter/stack/cache work
is a plausible contributor, but these captures do not isolate those mechanisms.
They do establish that subtracting WhiteBox alone does not explain the observed
producer cost. No diagnostic-print-contaminated execution timing is used.

One redundancy is proven: `masm.flush()` calls ICache::invalidate_range on the
whole emitted section after every executable write/fixup, then the pilot called
that identical operation again. The second call is removed. On this source,
X86ICacheSync selects actual cache-line writeback/flush and fences automatically;
the x86 implementation is not simply assumed to be a no-op. Every mode still
gets the first required flush. Header writes afterward are diagnostic data beyond
executable bytes. The measured publication cut bounds the possible local saving;
this is not a solution for multi-microsecond emission/first-use work.

## Minimal semantic corrections

Independent design and implementation review found no blocker. Fields resolved
at preparation retain their already-qualified type/offset specialization. For a
cold field, the producer reads the CP fieldref's basic descriptor without
resolution and emits checks of the live actual get opcode and expected TOS.
ResolvedFieldEntry publishes holder/offset/type before release-storing get_code;
the x86 load/order matches the ordinary interpreter. Only after that check does
the body read holder and dynamic offset. Exact Reference-holder exclusion reads
through the VM's stable Reference_klass address, never an embedded Klass literal.
Static initialization and null-before-pop fallback remain; existing Serial/G1
loads preserve collector and x86 volatile semantics. The first unresolved access
falls back before effects and later invocations can use the same immutable body.

The producer records the furthest emitted in-budget forward branch target. If an
ordinary category-1 return precedes that known target, it emits an ordinary-
dispatch branch at unchanged return BCP/canonical stack, then continues linear
generation. The final return and first unsupported gap keep existing stopping
behavior. Return execution, narrowing, exit profiling and poll remain ordinary
interpreter behavior. This is neither a CFG nor a new return implementation.

The new15-slot correctness fixture covers first cold resolution then native
resumption without regeneration, signed narrow/boolean/volatile/oop/static reads,
lazy initialization, moving GC, Reference-subclass own fields, early-return and
later paths, exact branch counts, null receivers, opcode-mismatched resolved
entries, missing fields and private-field failures including null receivers.

The first cold/forward candidate passed all12 tests on both release and
fastdebug, plus3 maximum-profile/VerifyOops fixtures. Its two real-method checks
showed JrtPath.isAbsolute49bytes/endBCI1 ->857bytes/end28, with20 entries and38
native resumptions. CodeSourceKey.equals158bytes/end6 ->1316bytes/end23, with40
entries and zero native resumptions. Exact bytecode inspection corrects an earlier
checkpoint: end23 is BEFORE its first invokevirtual, not after it. Cast/typecheck
and field code consume those bytes; no call island has yet been emitted.

The second flush removal reduced all six observed publication cuts:
0.631->0.330,0.712->0.411,0.551->0.341,0.611->0.491,0.581->0.501 and
0.551->0.491us. Whole observed-producer results were mixed, including adverse
Interface14.872->20.370us and Equals13.781->16.304us. No total-request win is
claimed. The actual effective X86ICacheSync value is3 (CLWB); flags/captures are
preserved.

## Omit unreachable return-profile encoding

`a8e7400bb98` reuses a static fact already used by MethodData. The pilot supports
ordinary invoke sites; under jsr292-only return profiling, a non-compiledLambdaForm
caller has no return profile. The producer passes that fact to the reused typed-
epilogue emitter instead of encoding its unreachable profile helper. Ordinary
shared returns are unchanged. Profile-all and compiled LambdaForms retain the
helper; VerifyOops on canonical oop push and the remaining runtime guards stay.

Tests explicitly prove ordinary call count20 and absent return type under111,
call count20 and recorded Object return type under222, and actual native
continuation plus a MemberName return profile in a bootstrap compiled LambdaForm
under111. A preliminary positive-control harness selected an int-return overload
by name/parameters and failed its result assertion. It is preserved; selecting the
exact Object-return descriptor fixes the harness, and both reference and candidate
controls pass. This was not a candidate runtime failure.

This valid omission does not solve CodeSourceKey's first fit rejection: its first
call has not been emitted at end23. The checked final profile-only probe remains
1316bytes/end23 with zero resumptions. That adverse reach result is retained.

## Coarse silent-core boundary

`a80f28983bc` adds WhiteBox action8 only. It brackets the exact observation-free
`prepare(mh)` used by action5 after reflected Method/counter setup and before the
snapshot/result array. No clock/counter is added inside the producer; action5 is
unchanged. Tests assert that internal observation slots remain zero. Two fresh
JVMs, six requests, no execution windows give:

| Case/order | Silent core CPU/wall | WB before array CPU | External CPU/wall |
|---|---:|---:|---:|
|Equals first|16.365/16.375|17.315|18.367/17.817|
|Static second|7.881/7.902|9.044|12.378/11.007|
|Interface third|3.155/3.175|3.695|4.948/4.266|
|Interface first|13.330/13.360|13.971|15.122/14.522|
|Equals second|10.476/10.495|11.677|14.332/13.079|
|Static third|3.435/3.455|4.036|5.228/4.567|

Values are microseconds and retain boundary-clock overhead. There are no nested
producer clocks, logging or execution counters in these intervals. The first-use
variation is inside the producer itself, not just WhiteBox. These are not pure
clock-free compiler CPU or internally split decode/emission measurements. The
fine-cut and coarse captures have distinct images/instrumentation and are never
subtracted to claim an exact timer-free component cost.

## Fit the existing physical budget

The CodeSourceKey rejection is a conservative space precheck: its1316-byte prefix
leaves2516bytes, but every opcode previously demanded2048+512=2560. Independent
source review certified an explicit256-byte scalar allowance,512 for fields and
forward branches, and1024 for ordinary calls ONLY when no oop-return profile,
PopFrame epilogue or ForceEarlyReturn epilogue is emitted. That call path has fewer
than64 x86 instructions including ASSERT guards, VerifyOops setup, optional test
counter and BCP bookkeeping; even15bytes/instruction is below1024. Shared verifier
failure bodies are not copied there. Field bounds separately include compressed-
oop heap-base verification/possible ShowMessageBox code. Casts, ldc, other opcodes
and all larger call configurations retain2048. No helper on those paths inserts
alignment padding; fixups do not grow instructions.

`1d9220745c2` applies those selected bounds to both the precheck and emitted-size
guarantee. Total3832bytes, fallback512bytes,16slots and the single final-call
trampoline bound remain. No instruction check is weakened or bypassed, no extra
pass is added, and no new arena/residency/policy is introduced. Final qualification
includes CheckCompressedOops with the existing maximum-profile/debug controls.
Final source `1d9220745c2` passes all12 tests on release and fastdebug, plus
three maximum-profile/VerifyOops fixtures with CheckCompressedOops added. Default
111/full222 ordinary profiles and the actual compiled-LambdaForm positive control
all pass. Final review found no source blocker.

## Final results and remaining budget

The same frozen two-method diagnostic, explicit preparation before receiver
construction, gives the following. Counts are from controlled calls with test
counters enabled; no execution time is measured.

| Method | Qualified46 bytes/end BCI | Cold/forward7e bytes/end BCI | Final bytes/end BCI | Controlled entries/native resumptions |
|---|---:|---:|---:|---:|
|JrtPath.isAbsolute|49/1|857/28|857/28|20/38|
|CodeSourceKey.equals|158/6|1316/23|2356/59|40/40|

Both now cover the supported body before the ordinary final return. Key's40
resumptions are four calls on each of ten equal-but-distinct key paths; identity,
wrong-type and null paths also retain their correct results. The two missing path
resumptions are first-use interpreter call resolution. These are two real shapes,
not an application coverage percentage or CPU weighting.

A separate single counter-free action8 capture preserves the same semantic
oracles and measures the silent cores: JrtPath16.495us CPU/16.525us wall, and
CodeSourceKey28.602us CPU/28.673us wall. Normal emitted sizes are829/2300bytes;
the counted reach capture uses857/2356bytes. The counter-free cores exclude
reflected-method conversion, snapshot, result allocation and the measured
0.220/0.470us MethodCounters setup; boundary clocks remain. They include all
held-producer work and first-use effects. No internal clocks or recurring
production counters were added.

Final six small-case coarse intervals are retained as well:

| Case/order | Silent CPU/wall us | External CPU/wall us |
|---|---:|---:|
|Equals first|16.164/16.205|17.886/17.196|
|Static second|7.301/7.311|12.429/10.285|
|Interface third|3.425/3.455|5.228/4.487|
|Interface first|13.841/13.850|15.623/14.972|
|Equals second|10.265/10.286|15.063/13.290|
|Static third|3.385/3.415|5.258/4.577|

The request-minus-core CPU difference is1.722-5.128us here, including clock and
return plumbing; it is not assigned wholly to allocation. As before, CPU/wall
clocks bracket slightly different work. No repeats seek a cleaner distribution.
All earlier adverse outcomes and the first partial Key result remain.

These results establish that the remaining cost is substantial inside actual
production-path generation, even after excluding WhiteBox. There is no CI,
nmethod allocation/install or optimizer work left to remove in this pilot.
They do not isolate first stack-page faults, instruction/data-cache warmth,
label initialization and individual assembler encoders within the emission cut.
That uncertainty remains explicit rather than labeling the whole cut mandatory.

For a budget illustration only, retained startup entries are1396 for JrtPath and
895 for Key. Optimistically treating every one as a repayment opportunity would
require at least11.8ns and32.0ns CPU saved per entry just to repay the measured
silent preparation. Actual useful post-preparation entries may be fewer, and
one-time arena/setup costs remain additional. No such execution saving is measured
for these real bodies; no application payoff or steady-state verdict follows.

The next concrete structural candidate is avoiding the general subtype emitter
when an already resolved CP target is a final instance class. Key is a final
record, and two general type checks account for much of its pre-call code.
ConstantPool::tag_at/resolved_klass_at already provide acquire-published metadata,
and JVMTI rejects class-modifier changes. A guarded exact-klass comparison could
retain cache/null/profiling/failure behavior without a new pass or IR. Arrays and
interfaces must keep their full subtype semantics. This is a source proposal,
not an implemented or measured saving. Its likely value is generation/code size;
existing successful subtype fast paths already avoid executing most slow code.

All builds stayed incremental and sequential, using landed synchronous logging.
To preserve evidence with limited storage, new builds skip external debug-symbol
packaging and still strip normally; CXXFLAGS/runtime settings are unchanged.
Prior symbol files/images remain. Final free space is about1.30GB, with no OOMs
or new zombies (26 retained), and every owned command is reaped. New images omit
external debug symbols; this packaging limitation is recorded with their hashes.

Final private evidence is `/workspace/interpreter-frame-fit-budget/` (source,
images, result, coarse ledger and real results), with the fine-cut and intermediate
images/results in `/workspace/interpreter-frame-truncation/` and
`/workspace/interpreter-frame-preparation-boundary/`. No raw data/image was uploaded.
No automatic admission, residency, C1/C2 threshold, default, public or CI change
occurred. Qualified46 and its successful timed call comparison remain preserved.
The original early-tier application goal remains open.

These explicit cold preparations are not evidence that every naturally admitted
method would have cold fields: repeated interpreted invocations often resolve common
paths before preparation, while unvisited branches can remain cold. No application
CPU coverage, residency or payoff is inferred from possible-method/prefix counts.
