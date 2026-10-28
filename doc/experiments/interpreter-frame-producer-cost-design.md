# Interpreter-frame producer: fixed setup and emitted-work review

This is a source and retained-object review of qualified checkpoint
`aedf724d3d0973eb469dbc8fc924dbbd3b1a5299`, runtime `1d9220745c2`.
No runtime source, image, admission, residency or tier policy changed for this
review. No JVM, build or additional timing capture was run. Earlier qualification
and unfavorable outcomes remain intact: twelve focused tests passed on both
release and fastdebug, with three additional maximal-profile/VerifyOops checks
recorded in the preceding report. None was rerun for this documentation change.
Implementation of the proposal below is held for review.

## Finding and proposed boundary

The producer no longer has CI, C1 IR, optimization passes, compiled oop maps or
nmethod installation. It still pays for maximum-capacity temporary state and for
general interpreter assembler helpers. A short preparation initializes 386
`Label` objects and examines 321 BCI slots at exit. Larger bodies also overflow
the label patch cache, creating a private C-heap arena, and emit complete subtype
searches even when a final target would permit equality. The measured
scan/emission cut includes those costs; it is not a bytecode-decoder measurement.

The first coherent change should make **temporary producer work proportional to
the referenced targets**, using the existing assembler and labels: construct
only requested BCI/call-return labels, visit only that used set at exit, and give
patch overflow an explicitly scoped scratch lifetime rather than an independently
allocated arena per preparation. This changes no Java execution code. A separate
small semantic specialization can omit generic subtype machinery when metadata
proves an exact comparison sufficient. Neither requires another bytecode pass,
IR, register allocator or persistent per-method cache.

This is a substantial source-level opportunity, not a measured microsecond
prediction. In particular, reducing label setup cannot explain away all first-use
cost or all code-size-dependent work.

## Retained cost boundaries

All times below are CPU microseconds. Wall time was recorded separately in the
[previous report](interpreter-frame-preparation-and-truncation.md). Clocks,
instrumentation and different source checkpoints prevent subtracting these rows
from one another as a controlled speedup claim.

| Evidence | Total held producer | Scan/emission | What it establishes |
|---|---:|---:|---|
| Qualified46 observed six small preparations | 4.968–19.439 | 2.384–15.894 | The broad emission cut dominates these observed intervals; first-use order matters. |
| Qualified46 other cuts, same six | analysis 0.270–0.451; buffer 0.130–0.551; publication 0.551–0.712 | — | Metadata eligibility and buffer construction are small here; these are clocked cuts. |
| After removal of duplicate flush, six observed publications | 0.330–0.501 | — | All six publication cuts fell, while whole-producer outcomes remained mixed. |
| Current silent Static/Interface, prepared third | 3.385 / 3.425 | no inner clocks | A warmed small producer still costs about 3.4 µs. |
| Current silent Equals/Interface, prepared first | 16.164 / 13.841 | no inner clocks | The larger first-use cost survives removal of measurement plumbing from the producer. |
| Current silent real JrtPath / CodeSourceKey | 16.495 / 28.602 | no inner clocks | Production-path generation remains expensive for the 829 / 2300-byte bodies. |
| Separate current observed real JrtPath / CodeSourceKey | 18.567 / 32.628 | 14.922 / 27.641 | The same broad cut remains the main location, with test counting and clocks present. |

The six current silent small-case cores span 3.385–16.164 µs. Their external
request-minus-core CPU is 1.722–5.128 µs, including return/measurement plumbing;
it is not all allocator cost. Real-body MethodCounters creation, 0.220/0.470 µs,
is outside the silent interval. The held producer still includes ResourceMark,
generation-lock acquisition, decoding, emission, patching, flush, publication and
cleanup. The startup arena reservation and enclosing interpreter blob allocation
are separate one-time costs. Normal silent generation contains no inner clock or
recurring test counter.

No retained cut separates label setup, instruction encoding, private patch arena,
stack-page faults or cache misses. The first-position penalty therefore remains
unassigned. Fixed constructor/scan work below is proven in existing object code;
its CPU share is not measured.

## Maximum-capacity label work is present in the silent binary

In `interpreterFramePilot_x86.cpp`, `generate_locked` declares 321 BCI labels,
64 call-return labels and one ordinary-fallback label. `bind_exits` scans every
BCI label even for a four- or five-operation body. Every decoded BCI is currently
bound, including BCIs that no branch or call continuation references.

Existing release/debug object DWARF and disassembly establish:

| Property | Release | Fastdebug |
|---|---:|---:|
| `sizeof(Label)` | 40 bytes | 152 bytes |
| All 386 label objects | 15,440 bytes | 58,672 bytes |
| Silent producer local stack reservation, excluding pushes/alignment | 17,664 bytes (`0x4500`) | 61,408 bytes (`0xefe0`) |

The release constructor loops execute 321 × 7 and 64 × 10 host x86
instructions, approximately 2,887 instructions before the ordinary label and
other setup. Finalization then executes roughly seven to nine host instructions
per BCI slot, plus binding/fixups for actual users. Thus roughly five to six
thousand host instructions are fixed label setup/exit work, even when almost
none of the labels is useful. These are instruction counts, not cycle or CPU
estimates. The release constructor initializes label control fields, not all
patch-cache payload bytes.

Fastdebug additionally uses `-ftrivial-auto-var-init=pattern`; its existing object
contains pattern fills for the 48,792-byte BCI-label array and 9,728-byte
return-label array, then constructor loops. This matters for debug qualification
cost and stack footprint. It must not be used to explain release timings.

First touch of this stack footprint can cause page/cache work. The retained data
does not identify those faults, so the 10-plus-µs first-use difference cannot be
assigned wholly to these arrays.

## A private allocation was outside the ResourceArea accounting

`Label::add_patch_at` keeps four unresolved references inline in release, eight
in debug. The next reference invokes `CodeBuffer::create_patch_overflow`, which
creates `new (mtCode) Arena(mtCode)` and an arena-backed `GrowableArray<int>`.
`CodeBuffer::~CodeBuffer` deletes that arena at preparation exit.

This is a C-heap Arena object and a pooled chunk lifecycle, even if the pool has
a reusable chunk. The default first chunk is 984 payload bytes on this LP64
build, not 32 KiB; later ordinary growth uses approximately 32 KiB. Chunk-pool
take/return use the global `PlatformMutex`. Empty-pool acquisition can allocate
a chunk from the native heap. NMT bookkeeping also applies when enabled.

The current ordinary-fallback label necessarily exceeds four references on the
real bodies. With the retained cold-field path, JrtPath has at least eight field
guard references plus eight return-island guard references. Key has at least
sixteen field and sixteen return-island guard references, before type checks and
other fallbacks. The one-int-call Static/Interface/Equals cases can fit their
four return-island guards inline. Other helper-local labels may overflow too.

Consequently the six short-case zero ResourceArea deltas did not establish
allocation-free generation. Their counters observe the thread ResourceArea, not
this private CodeBuffer arena. The allocation path on these larger bodies is
source-proven; its time, pool-hit rate and contention are unmeasured. It would be
incorrect to declare native allocation the dominant cost from this finding alone.

## Traversals and instruction emission

There is one root signature walk and one `BytecodeStream` traversal of the
prefix. Each encountered ordinary call separately walks its CP signature to
validate category-1 types and derive the result state. Repeated calls to the
same signature repeat that small metadata walk. Forward-target cleanup scans
321 slots and call-return cleanup visits actual calls. This is not several
whole-method bytecode analyses or a retained optimizing-compiler prepass.

Each bytecode invokes normal assembler encoders, constructs addresses and
relocation descriptors, writes machine code, binds/patches branches and updates
canonical interpreter BCP/stack state. Type-check profiling and collector load
helpers contribute code. A supported call also emits its typed return epilogue
and lifecycle guards. The direct-return design removed runtime lookup, but four
Key return islands still account for about 560 extra bytes relative to the old
shared generation (about 140 per int-return site). That is a code-generation and
code-size cost, not a reason to reinstate the slower lookup path.

`MacroAssembler::check_klass_subtype` unconditionally emits its general fast and
slow paths: exact equality, superclass/cache tests, secondary-super bitmap/hash
work, collision/search loops, register saves/restores and branches. Successful
execution normally skips much of this code. Generation pays for emitting it
regardless. Retained ordinary interpreter template bytes use the same unchanged
helper: the generic predicate occupies about 241–245 bytes on this machine.
Key contains both `instanceof` and `checkcast` of the final Key class.

An exact register comparison plus near success branch is about nine bytes.
Where valid, replacing both generic predicates would remove approximately
460–480 bytes, about one fifth of the current 2300-byte normal Key body, plus
helper construction and fixups. This is an encoding estimate from retained
templates, not a newly generated pilot variant or a 20% CPU prediction. Profiles,
null handling, CP guards, field guards, stack/BCP traffic and call islands remain.
The existing equality fast path already starts with the same comparison/branch;
the principal expected gain is preparation/code size, not common-success
execution speed.

## Relocations, flush and publication are bounded separately

The external-address CodeBuffer writes directly into the reserved immutable
slice. It has no relocation storage: the allowed runtime/internal/external/barrier
relocation requests pass through the encoder checks, then return without building
a relocation table. There is no later table scan, code copy/rebase, BufferBlob
allocation, nmethod registration or compiled metadata install. Forward branch
patching is real work proportional to references, including overflow above.

One final assembler flush follows all fixups. With retained `X86ICacheSync=3`,
the flush writes back approximately 4 cache lines for 240/252-byte small bodies,
9 for 573 bytes, 13 for JrtPath's 829 and 36 for Key's 2300, plus the sync fences
(exact coverage depends on alignment). Code-size reduction reduces this work,
but retained post-correction publication cuts of roughly 0.33–0.58 µs are far
smaller than the 16–29 µs silent real-body preparations. Release publication of
the MethodCounters entry and fixed-slice bookkeeping remain mandatory.

## Concrete producer simplification for review

1. **Only requested labels.** Keep a bounded 321-byte BCI-to-slot index and a
   used-label list, construct labels when first requested by a forward branch or
   call successor, and construct return labels only for actual calls. Bind a
   decoded BCI only if it has a requested label. All supported targets are forward,
   so there is no need to retain labels for unreferenced earlier BCIs. At exit,
   bind pending used targets to ordinary fallback and preserve existing truncated
   last-call selection. Reject paths must still bind every live label and satisfy
   all existing assertions.

   There can be at most 64 distinct branch/call-successor targets and 64 call
   return labels, plus ordinary fallback: at most 129 rather than 386. The retained
   Key bytecodes require seven BCI targets/successors and four return labels,
   twelve total including fallback. One-call Static requires three. Their live
   Label objects would occupy 480/120 release bytes instead of 15,440, and
   1824/456 debug bytes instead of 58,672. A small index initialization replaces
   thousands of fixed constructor/exit instructions. This removes over 90% of
   label-related fixed work for these examples, not 90% of total preparation.

   Storage must actually avoid eager construction and maximum-array pattern
   initialization; merely hiding the same `Label[321]` in a wrapper accomplishes
   neither. Explicitly initialized bounded resource storage is a candidate, with
   its allocation/capacity behavior recorded. This is a transient index, not an IR
   or cross-method cache. No added runtime branch, codelet, code relocation or
   generated-code growth is required.

2. **Explicit patch scratch ownership.** Avoid an independent C-heap Arena per
   CodeBuffer by allowing this producer to supply scratch storage whose lifetime
   encloses all generation and fixups. Existing CodeBuffer ownership must remain
   the default for other compilers. The outer ResourceMark is a candidate, not an
   automatically safe substitution: a nested ResourceMark must never roll back
   an overflow list before its label is patched. The reviewed x86 nested marks in
   VerifyOops only format diagnostic strings before branch emission; collector
   and other helper paths still need the same lifetime proof before wiring this.
   The supplied arena must not be deleted by CodeBuffer destruction. Thread
   ResourceArea growth can still acquire chunks; no zero-allocation claim follows
   without adequate retained capacity. Reusing a private Arena across preparations
   would add reset/lifetime policy and is not the recommended first design.

   Steps 1–2 form one scoped producer-scratch correction. They preserve emitted
   execution code and all GC, safepoint, frame/tooling, BCP and publication
   contracts. They address fixed work and the newly found allocation directly,
   without shifting preparation cost into every invocation.

3. **Exact final-instance predicates, independently qualified.** Where the
   acquire-published resolved CP target is a final InstanceKlass, emit equality
   instead of the general subtype helper. Preserve the runtime CP-tag gate and
   target load, null behavior, once-only profiling, and failed-checkcast fallback
   before profile/stack changes. Arrays require covariance and must retain the
   general path; interfaces and non-final classes do too. No raw Klass literal or
   dependency registry is needed. JVMTI rejects class-modifier changes, and old
   methods retain the existing return/entry fallback rules.

   Normal self-class CP entries are not guaranteed eagerly resolved: the parser's
   explicit eager self-resolution is for hidden classes. Thus final Key being
   known at source level alone does not establish a resolved-target opportunity
   at cold preparation. A separate proof may use the canonical
   `cp_index == method_holder()->this_class_index()` and final holder, while
   retaining the runtime resolution gate and target load. This must be reviewed
   against the actual Method/CP version; class-name matching is insufficient.
   Otherwise unresolved cases retain the general helper. The retained capture
   does not establish how often the resolved-only opportunity is available.

The first implementation boundary should be steps 1–2, with label lifetime,
debug initialization and borrowed-arena ownership reviewed before building.
Step 3 is a small separately reviewable code-size improvement. Existing semantic
and tooling tests remain the qualification controls. No admission/residency or
policy change is needed to assess this producer structure. Implementation and
any later bounded measurement require the present report's review first.

## Budget and limits

The attainable savings are bounded by the work removed, not by the name
"direct compiler." Fixed label construction/scan is avoidable; the private
allocation is avoidable with valid scratch ownership; generic final-class subtype
emission is avoidable when proven. Decode, exact runtime semantics, collector
helpers, interpreter profiling, call-return epilogues, branch patching and atomic
publication still cost something. Their remaining CPU is not separately known.

For perspective, the optimistic retained startup entry ceilings are 1396 JrtPath
and 895 Key invocations. Silent preparation alone requires 11.8/32.0 ns saved per
entry if every entry can repay it. Halving preparation would lower those to
5.9/16.0 ns; this is arithmetic, not an achievable speedup estimate. Useful
post-preparation entries can be fewer, initial arena/setup remains additional,
and real-body execution savings have not been measured. Source counts and
microcase gains cannot establish application payoff or steady-state neutrality.

## Source and private evidence

Source anchors in the preserved tree:

- `cpu/x86/interpreterFramePilot_x86.cpp`: `prepare`, `generate_locked`,
  `bind_exits`, type predicates, call-return finalization and publication.
- `share/asm/assembler.hpp`: Label layout/cache; `assembler.cpp`:
  `Label::add_patch_at` and `patch_instructions`.
- `share/asm/codeBuffer.cpp`: destructor, `create_patch_overflow` and
  `CodeSection::relocate`.
- `share/memory/arena.hpp/.cpp`: initial chunk sizes, Arena construction/destruction
  and globally locked ChunkPool operations.
- `cpu/x86/macroAssembler_x86.cpp`: `check_klass_subtype` and secondary-super
  lookup helpers; `icache_x86.cpp`: CLWB/fence flush.
- `share/oops/constantPool.inline.hpp`, `share/classfile/classFileParser.cpp`,
  `share/prims/jvmtiRedefineClasses.cpp`: resolved metadata, canonical self index
  and class-modifier restrictions.

Private retained timings remain under
`/workspace/interpreter-frame-{truncation,preparation-boundary,fit-budget}/`.
Read-only object/DWARF and retained-template disassemblies for this review are in
`/workspace/interpreter-frame-producer-review/`. No raw evidence or image was
uploaded or removed. Source review is complete; runtime implementation is
intentionally pending review, not blocked by a failed action. Approximately
1.30 GB remains free; no build was attempted with that capacity.
