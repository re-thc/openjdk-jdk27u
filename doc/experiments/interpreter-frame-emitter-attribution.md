# Remaining interpreter-frame emission cost

Qualified runtime `df4852a57a9` and report `1a6112dfb32` remain preserved. No next
production variant was implemented. A temporary, preparation-only diagnostic was
built from one release translation unit, captured four times, and removed from
the source/build tree. Source, object/auxiliary files and qualified libjvm were
restored and hash-checked; the diagnostic patch, image and all outcomes remain
private evidence.

The remaining cost is repeated semantic-helper expansion through general x86
encoders, plus substantial first-use effects in those host paths. It is not a
15–21-us bytecode parser, signature resolver, optimizer or installer. Key's two
subtype checks are the largest repeatable measured individual helper expansion;
calls and profiling are significant in both bodies. Exact-final specialization
has a real bounded opportunity, but cannot by itself make the producer generally
cheap. A configured template-emission design addresses the common repeated work;
it needs explicit patch/lifetime review before implementation.

## Scope and measurement limits

The starting evidence is the [used-label comparison](interpreter-frame-used-labels.md):
silent JrtPath preparation 16.495/17.056 us and Key 21.652/22.353 us in candidate
samples, with mixed small-case results and a retained 96.644-us control outlier.
Separate existing cuts place about 14.7/20.6 us in scan/emission. These are the
production-path reference costs, not interchangeable with the diagnostic below.

The temporary probe existed only in observed preparation, with no generated
invocation instrumentation. It recorded emitted bytes and CLOCK_MONOTONIC elapsed
spans per attempted bytecode and selected nested helpers; original thread CPU and
wall timers bracketed the whole producer. No diagnostic printing occurred until
both preparations and all their timers had ended. The original real-method
harness gained only an order argument. Four fresh JVMs used path/key, key/path,
key/path, path/key order, with otherwise identical flags and semantic oracles.

Empty timestamp-pair calibration had median 20 ns in each capture; maxima were
30/100/30/100 ns. There are 32/70 timestamp pairs per JrtPath/Key, including nested
cuts and finalization. This changes host code, cache behavior and timing cost.
Nested spans must not be added to their parent spans. They rank and locate work;
they are not exact uninstrumented CPU shares and are not speedup measurements.
Whole-producer CPU and wall differed by at most 40 ns in these captures, providing
no evidence of a large off-CPU scheduling gap. Cache misses, page faults and
kernel work were not individually measured.

All four runs passed the existing real-body semantic oracles. Emitted sizes stayed
829/2300 bytes, end BCIs 28/59, and emitted logical operations 13/29. The probe also
records the final attempted ordinary return, producing 14/30 rows, with zero bytes
for that last unsupported operation. No additional performance repetitions ran.

## What the producer actually emits

| Work | JrtPath.isAbsolute | CodeSourceKey.equals |
|---|---:|---:|
| Emitted logical bytecodes | 13 | 29 |
| Field reads | 2 cold, 93 bytes each | 4 resolved, 26 bytes each |
| Calls, including their islands | 2 virtual, 153 bytes each | 3 virtual + 1 static, 153 bytes each |
| Typed return islands within calls | 2 × 133 = 266 bytes | 4 × 133 = 532 bytes |
| Conditional branches + goto | 2 + 1, 230 bytes | 4 + 1, 395 bytes |
| Branch-profile expansions within branches | 5, 130 bytes | 9, 234 bytes |
| Type-check bytecodes | none | instanceof 505 + checkcast 487 = 992 bytes |
| General subtype cores within type checks | none | 2 × 245 = 490 bytes |
| Null/type profiling within type checks | none | 286 bytes |
| Locals, constants, stack and early-return glue | 69 bytes | 159 bytes |
| Final fallback dispatch | 38 bytes | 38 bytes |
| Total, without double-counting nested rows | **829 bytes** | **2300 bytes** |

Type checks consume 43.1% of Key's output, calls 26.6%, branches 17.2%, and fields
only 4.5%. In JrtPath, calls consume 36.9%, branches 27.7%, and cold fields 22.4%.
This is mostly canonical interpreter state, profiling, lifecycle guards and general
semantic helpers, not a tiny arithmetic body plus a single return instruction.

**Correction to the earlier cost hypothesis:** Key's four field reads are already
resolved in these captures. The cold-field guard estimate in the earlier source
review does not apply to this body. Its ordinary-fallback label has 24 references:
four field null guards, sixteen return guards, two CP class guards, one cast-failure
branch and one early-return branch. JrtPath has sixteen. Both still exceeded the
old four-entry inline patch cache; the private-arena finding remains valid.

## Measured locations, including first-use outcomes

Times here are diagnostic microseconds. The two localized outliers are retained
in the table and ledger rather than averaged into a speedup claim.

| Capture/order | Body | Whole producer CPU | Scan/emission CPU | Sum of per-op elapsed spans | Finalization elapsed |
|---|---|---:|---:|---:|---:|
| 0 path/key | JrtPath | 42.784 | 38.708 | 35.994 | 1.131 |
| 0 path/key | Key | 28.051 | 24.637 | 22.063 | 0.891 |
| 1 key/path | Key | 34.111 | 30.315 | 26.508 | 1.522 |
| 1 key/path | JrtPath | 16.685 | 12.829 | 10.767 | 0.802 |
| 2 key/path | Key | 42.273 | 38.277 | 34.454 | 1.562 |
| 2 key/path | JrtPath | 17.606 | 13.580 | 11.438 | 1.052 |
| 3 path/key | JrtPath | 19.529 | 15.874 | 13.110 | 1.362 |
| 3 path/key | Key | 28.182 | 24.516 | 21.743 | 0.901 |

The capture-0 JrtPath spike is localized to its first getfield (23.936 us); its
metadata/heap-load subcuts account for only 0.530/0.621 us. The rest lies in that
field handler's instruction/guard expansion or unmeasured host effects. Capture-2
Key has a 7.602-us first return-island expansion. Their precise physical cause is
unresolved. Neither is attributed to signature resolution or silently discarded.

Other observed distinctions are consistent across method order:

- JrtPath's first 93-byte field expansion takes 2.364–3.144 us in the other three
  captures; its second identical-shaped field takes 0.511–0.701 us. Heap-load/push
  emission itself produces only four bytes, taking 0.550–0.731 us first versus
  0.071–0.120 us second. General guard/address encoders, first-use host execution
  and patch-list setup matter beyond the final load instruction.
- Key's first 245-byte subtype core takes 3.706–4.266 us, versus 0.851–0.951 us
  for the second. Both call the same helper with the same register assignment and
  VM configuration. That helper emits code; it does not resolve the Java class.
  The difference therefore cannot be explained as extra Java operand resolution.
- The first type-check profiling expansion takes 1.442–1.802 us; the second takes
  0.520–0.560 us, except a retained 1.402-us second-profile sample. Equal/similar
  output size is not equal first-use generation cost.
- Ordinary later return islands generally take 0.410–0.832 us for 133 bytes.
  First sites take 1.392–2.844 us, plus the 7.602-us outlier. Ordering alone does
  not remove this first-site effect. Forward-reference allocation can occur
  inside an opcode/helper as well as patching during finalization; those costs
  are not all host instruction-cache misses.

Per-body nested elapsed totals were:

| Selected work | JrtPath, four captures | Key, four captures |
|---|---:|---:|
| Field/call metadata inspection | 0.842–1.650 | 0.841–1.522 |
| All call signature walks | 0.160–0.180 | 0.391–0.440 |
| Heap-load/push helper emission | 0.621–0.811 | 0.562–0.712 |
| General subtype emission | — | 4.657–5.207 |
| Type/null profiling emission | — | 1.962–3.204 |
| Return-island emission | 1.993–3.044 | 2.894–4.316, plus 10.076 |
| Branch-profile emission | 1.051–1.601 | 1.940–2.473 |

The uncaptured scan/emission remainder, after per-op and finalization elapsed
spans, is roughly 1.1–2.3 us. It includes the BytecodeStream loop, setup, probe
bookkeeping and clock boundaries; it is not a decoder-only measurement. There is
one bytecode traversal, one root-signature walk and 2/4 small call-signature walks.
Reusing signature parsing cannot remove most of the remaining budget.

## Why a small body takes this much host work

The host emitter repeatedly invokes general encoders for addressing modes,
prefixes, register/TOS choices, VM flags, branches and labels. Large helpers emit
complete alternatives even when runtime fast paths avoid executing them.
Existing release objects contain about 2.3 KiB of host text in the return epilogue,
resume and wrapper alone, and about 3.6 KiB in selected subtype routines before
their generic encoder callees. These are static function sizes, not executed
instruction counts or CPU samples.

For example, Key's subtype helper always emits fast and secondary-super lookup
paths, bitmap/popcount/collision/search logic and register save/restore code. Its
type-check profiler emits separate null and non-null handling. Every ordinary
call re-emits a 28-instruction return island even though most of its bytes are
VM-configuration constants. Fields/branches likewise reproduce fixed canonical
state and profiling sequences. Removing maximum-capacity label initialization
did not remove those expansions or their first-use paths.

Mandatory GC/interpreter conventions and profiles explain much of the *guest
code*. They do not require reconstructing identical instruction bytes through
the full host assembler for every method. There is still no C1 IR, optimization
pass, register allocator, nmethod installation or compiled-frame metadata here.

## Design decision for review

**Exact-final predicates are justified, but insufficient as the general next
cheap-producer design.** They can replace Key's 490 bytes of generic subtype
cores with about eighteen bytes of equality predicates, while keeping null/cache
guards, profiling and failure behavior. The helper time measured above identifies
real removable work. It does not establish a transferable five-us CPU saving:
the diagnostic has different host code and timing overhead, and some first-use
work may still be paid by other methods. JrtPath has no such checks and gains none.

The class-file identity was checked without running another JVM: Key is final,
its this_class index is eight, and both casts use that canonical self index.
Resolved-final InstanceKlass targets are straightforward candidates; canonical
self may establish finality before resolution, provided the actual runtime CP-tag
gate/target load and Method/CP-version proof remain. Arrays, interfaces and
non-final targets retain full subtype semantics. No class-name-only assumption,
raw Klass embedding or weakened redefinition checks is appropriate.

The coherent general direction is **VM-configured template emission for the
existing semantic subset**, retaining exactly the current interpreter-frame code.
HotSpot already uses this pattern narrowly: x86 `Assembler::precompute_instructions`
assembles popa/pusha/vzeroupper once and `emit_copy` copies their fixed bytes later.
That implementation explicitly excludes oops, metadata and relocations. The pilot
cannot blindly copy interpreter machine code or reuse that exclusion as proof:
its site-dependent branches and operands require explicit patch descriptions.

A bounded design would:

1. Keep the current single BytecodeStream walk, category/operand inspection,
   resolved caches, labels, immutable destination slices and publication protocol.
   Generate VM-configured byte patterns once per used family under the existing
   serialization, then copy and patch them at each site. No per-method IR,
   optimizer, runtime dispatch/cache or nmethod infrastructure is needed.
2. Cover the common current families as one budgeted plan: ordinary call-return
   islands, field-read forms, branch/profiling forms and type-check/profile forms.
   One return-only fragment is not enough: its gross removable later-site work is
   only around one to a few us per body. Final-type specialization belongs in the
   type-check family's semantic selection, rather than being sold as the whole fix.
3. Start the patch/lifetime proof with the concrete return island. Retained Static
   and Interface islands are 133 bytes/28 instructions; in the same VM their only
   observed byte difference is the invocation step (three versus five). Their
   schema needs four fallback rel32 fields, one successor rel32 field and the step
   immediate. The VM-global capability address stays valid within the same VM.
   Record sites while assembling; do not discover or hand-code production offsets
   from these dumps. Keep every existing ownership/tooling/poll check in the bytes.
4. Describe other operands explicitly: resolved field offsets may require separate
   short/full displacement forms; branches need BCP deltas and native targets;
   subtype fragments need success exits. Internal relative branches can retain
   their distances only when the complete fragment is copied. Every external
   PC-relative transfer must be rebased or patched. Debug/VerifyOops calls and
   diagnostic counters need equally valid handling, not an untested copy path.
5. Preserve BCP/TOS at every existing boundary, precise interpreted roots,
   exception fallback, late tooling/redefinition rules and atomic publication.
   Template source bytes are not executable Java frames. Source byte/diagnostic
   string lifetime must outlive every destination copy. Do not invoke process-global
   TemplateTable generation concurrently or create a general relocation framework.

This is a design proposal, not authorization inferred for implementation. The
first-family generation/allocation cost must be charged to total first use, even
if initialized at startup. Lazy family initialization avoids assembling unused
variants but still pays that cost on the first request. Correctness tests must
prove the copy path actually runs; falling back to C++ whenever test counters are
enabled would otherwise qualify only the old path.

The budget test should precede an application verdict. A notional five-us complete
producer would require removing roughly 11–17 us from the current silent real-body
samples. Final checks alone cannot reach that target; neither can one return
fragment. The design must show that copy/operand patching replaces most repeated
encoder work, with bounded family count and first-use costs, before another broad
comparison. Five us is a design target here, not a measured attainable result.

## Preservation and remaining uncertainty

Private evidence: `/workspace/interpreter-frame-emitter-attribution/`, including
the diagnostic patch/source/image, single-unit build, four captures, raw per-op
and nested ledgers, helper sizes, class identity and restoration hashes. No
capture was repeated or discarded. All methods preserved their semantic outputs.
The release rebuild took 5.927 seconds; its 256-MiB disk guard did not trigger.
About 1.176 GB remains free, zombies remain 26, no OOM occurred, and no owned
build/JVM command remains running.

The qualified runtime and both images are unchanged. There is no new runtime
variant, admission, residency, threshold, default, public or CI change. The
remaining unmeasured physical first-use causes and fragment initialization/payback
costs are explicit. The report is ready for design review; implementation remains
held as instructed.
