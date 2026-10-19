# Reduce JVM allocation and retention overhead

This integration repairs allocation sizes, resource lifetimes and temporary
buffer ownership, reclaims dead code earlier, and shares privately owned locale
symbol arrays. It does not change heap defaults, the fork's object-header mode,
collector selection or public APIs.

## Components

| Component | Mechanism and evidence boundary |
| --- | --- |
| Code-cache reclamation | Finish Serial/G1 marking before unloading so freshly not-entrant methods can be reclaimed one GC earlier. The current fixed dead/live-method diagnostic observes earlier reuse and 49,152 bytes of paired code-heap used-capacity difference. Commit/reservation do not fall. Parallel source is imported but excluded by this fork's normal profile; ZGC is an unchanged control. |
| ParkEvent | Preserve immortal recycling and `mtInternal` while removing the obsolete 256-byte allocation padding/alignment. Current native layout is 160 bytes/alignment 8; NMT requests fall from 416 to 160 bytes per new event. The fixed 64-to-192 platform-thread high-water diagnostic observes 65,536 fewer requested bytes; same-high-water reuse adds no events. This is not a per-virtual-thread or OS-returned-memory claim. |
| NIO temporary buffers | Pin carrier-local cache accesses and free the buffer replaced for stricter alignment. Current complete-image diagnostics exercise all 32 misaligned replacements, reconcile 2,224,128 retained requested bytes on baseline and zero on candidate after worker exit, and validate disabled-cache/threshold controls. Scalar/scatter-gather platform and virtual-thread semantics are tested separately. |
| C2 interface scratch | Scope union/intersection result lists with ResourceMark. `TypeInterfaces::make` copies members to the independent type arena before hash-consing. Release/fastdebug WhiteBox cases require level-4 compilations and correct shared/disjoint/null/array-merge results. No measured helper peak-byte or C2 sanitizer claim is made. |
| C-heap metadata Array | Convert words to bytes once instead of multiplying by BytesPerWord twice. The common native regression records actual requests for twelve type/length cases: candidate requests one-eighth of baseline on this LP64 build, while preserving tag, zeroing and access. Its current production use is AOT training dependency snapshots, not generic heap arrays. |
| DateFormatSymbols | Share six arrays owned by private locale templates; retain defensive public copies and conservative subclass/deserialization handling. Trusted clones copy immutable private snapshots without the source monitor; serialization invalidates snapshots and detaches arrays before stream callbacks. Current probes include snapshot storage and the eight-byte ZGC instance increase; runtime/contention and serialization costs are measured separately. |

These mechanisms have different units and lifetimes. Their requested native
bytes, reachable Java-array bytes and code-heap used capacity must not be added
together as an RSS/PSS improvement. See the [current validation record](memory-overhead-validation.md)
for exact source/image identities, collector-dependent layouts, costs, controls
and limitations.

## Provenance

Logical donor commits and authorship/legal headers are preserved. The local
integration originally forked master at `89885a6288e7aaabd01678a704a586272c0f96e3`;
current testing uses a candidate containing the chosen newer baseline.

| Work | Imported source | Author |
| --- | --- | --- |
| JDK-8387742, earlier nmethod reclamation | `3e2366e7f5d29be03c8d5ddb4f62e5e1f7185550` | Albert Mingkun Yang |
| JDK-8388169, concurrent-mark test follow-up | `433cfb96238a2f554295e3630336c61f070d2244` | Albert Mingkun Yang |
| JDK-8393648, ParkEvent alignment | reviewed PR33344 source `99f94aaa8faad75bbf26f5cdab0b8b50974c639c` | Fredrik Bredberg |
| JDK-8392951, carrier cache access | `46d5c4cde130da57ace0f12aededc6f4b18bf06f` | Alan Bateman |
| JDK-8391643, interface-set ResourceMarks | `df031428ec274f6abcc0fc76e5b7e02c85b74163` | Quan Anh Mai |
| Metadata Array conversion and native regression | local `3bedfa3519ed67306892af89fa4b0017c416f174` and follow-ups | Harry Chan |
| DateFormatSymbols sharing/serialization | clean component `df0eeea79e4b568ed16051974d66485421ea5dd9`, imported separately as `34e34b7a31c233a19988228ddde5b89b4275a1b2` | Harry Chan |

The ParkEvent import adapted a reviewed, then-unintegrated upstream PR; it was
not an already-integrated ancestor at import time. Its size-only allocation
override intentionally retains this fork's `mtInternal` tag. Immortal deletion
and recycling are unchanged. Test adaptations omit unsupported Shenandoah and
StressVerifyMeetJoin coverage; supported WhiteBox semantics do not imply those
stress modes were exercised.

## Build, test and compare

Use the ordinary repository [build](building.md) and [test](testing.md)
instructions and normal installed/managed dependencies. No private image,
Library packet, host report or binary handoff is needed. The [comparison guide](memory-overhead-native-decision.md)
explains matched full images, native receipts, carrier/ownership checks,
attributable memory diagnostics and practical interleaved costs.

Run exact Array/ParkEvent `_vm` selections with NMT enabled and XML receipts.
The Array size-only negative control must be compiled against the baseline
inline allocator; swapping only libjvm does not reproduce it. Empty/skipped
selections are not passes. Record actual AOT record/create/replay actions with
training-data verification. Candidate-only early-reclamation and array-sharing
assertions must not be imposed on the unmodified baseline.

The normal fork profile supports Serial/G1/ZGC and excludes Parallel, Epsilon,
Shenandoah and desktop modules. Linux x64 performance results do not establish
performance on another architecture or OS. Earlier measurements retain their
original images and methodology; they are not relabeled as current evidence.

## Scope

This change does not include broader GC/runtime correctness fixes, Method/stub
optimization, generated-class/linkage changes, cache eviction/slab unmapping,
metadata-format or compressed-pointer redesign, global tuning, HTTP/2 work,
FromCardCache/mark-stat/Metachunk/IndexSet redesign or compiler presizing. Source
path separation alone does not prove compatibility; current combined-image
checks and normal CI remain necessary.
