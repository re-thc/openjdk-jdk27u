# Reduce JVM memory overhead

This source integration combines small allocation/lifetime repairs. It does not
change heap defaults, metadata formats, cache eviction, collector selection or
public APIs. Performance qualification is a separate outstanding check; the
optional NIO scheduling observer lives on `review/nio-cache-lifetime` and is not
part of this integration.

## Changes and evidence

| Change | Benefit | Evidence and limits |
| --- | --- | --- |
| Earlier nmethod reclamation | Reusable code-cache used capacity becomes available one GC earlier for Serial, Parallel and G1 | Historical matched Linux x64 release diagnostics: all 18 pairs reclaim 64 dead methods/49,152 code-heap bytes at the first GC and reuse 64 addresses; live controls remain. Commit/reservation stay 8 MiB/32 MiB. No uncommit or RSS claim. |
| Remove obsolete ParkEvent 256-byte alignment |256 fewer requested bytes per newly materialized event,512 per additional high-water platform JavaThread | Historical NMT detail:416 → 160 bytes/event;64 → 192 workers saves 65,536 requested bytes. Immortal recycling and this fork's `mtInternal` allocation tag are retained. Not per virtual thread or OS-returned memory. |
| Repair NIO temporary-buffer replacement and carrier cache access | Do not lose the allocation replaced for stricter alignment; pin carrier-local accesses | Historical complete-three-class Java overlay, identical native image and fixture classes: 32 misaligned replacements retain 2,224,128 requested bytes on baseline and zero on candidate after worker exit. Cache-disabled and threshold controls plus platform/virtual scalar/scatter-gather checks passed. No throughput/RSS claim. |
| Scope C2 interface-set GrowableArray scratch | Release temporary result-list storage at the end of each union/intersection, rather than later in the compilation | Two upstream ResourceMarks. `TypeInterfaces::make` copies the members into the independent type arena before hash-consing. The integration builds and the WhiteBox C2 semantic regression passes. Helper-entry coverage, peak-byte and speed results remain unmeasured. This does not claim compiler ResourceAreas persist across compilations. |
| Fix metadata Array C-heap word/byte conversion | Allocate the required byte size once, instead of multiplying by BytesPerWord twice | Source proof: if required size is B bytes, old allocation requestsB×BytesPerWord; fixed requestsB. Thus87.5% fewer requested bytes for this particular allocation on LP64, 75% on 32-bit. Not a measured process saving. Current production caller is `TrainingData::DepList<T>::prepare`, so the effect is limited to AOT training dependency-list snapshots. |

Historical native baseline/candidate source identities are
`758f41576fc79d35a62a3896dbe5ab97c448c436` and
`8574ec20e1e16eb3cee240ac2ee764bb522d5049`. NIO overlays were isolated on the
latter native image. GCC/G++ 16.2.0, boot/fixture JDK 27+35-2325, resulting JDK
27.0.2-internal-memory-qualification, Make 4.4.1, Linux x64/Xeon Platinum 8573C,
four-CPU quota and fixed 0–3 affinity were used. Those image identities are not
rewritten to this new integration. The historical core candidate passed 18 selected
jtreg IDs; NIO passed a fresh default pair plus 16 cases, including four jtreg runs.
The integration at source 770f5cd0ef89bceae11a5f66c014815bfa3b4b73 now builds and passes 13 focused jtreg IDs on Linux x64 release; see `memory-overhead-validation.md`. The new gtests remain blocked by missing GoogleTest/GoogleMock source. Historical requested-byte measurements remain historical, rather than being relabeled as measurements of this image.

No RSS/PSS, startup, representative throughput or pause-tail improvement is
established. Original balanced timing controls were noisy; some slower point
estimates and worse G1 young-pause tails remain in the evidence. They are not a
pass and cannot be attributed conclusively to a change. Material open risks are
NIO carrier pin/unpin overhead and contention, ParkEvent cache-line placement,
earlier code coldness/unloading/recompilation behavior, C2 scratch lifetime and
rollback cost, and AOT snapshot correctness with the smaller native allocation.
The requested universal/no-more-than-minor speed-regression bound is unresolved.

## Provenance and integration review

Base: fork master `89885a6288e7aaabd01678a704a586272c0f96e3`.
Refreshed rolling upstream: `93376e455d8d321648994c9f91ea1c7cc55c513a`.
All five donors below are ancestors of that upstream snapshot.

| Work | Integrated donor | Author |
| --- | --- | --- |
| JDK-8387742 | `3e2366e7f5d29be03c8d5ddb4f62e5e1f7185550` | Albert Mingkun Yang |
| JDK-8388169 test follow-up | `433cfb96238a2f554295e3630336c61f070d2244` | Albert Mingkun Yang |
| JDK-8393648 | `3f4d498e737d53c72242646c0cd2b8558f7c0270` | Fredrik Bredberg |
| JDK-8392951 | `46d5c4cde130da57ace0f12aededc6f4b18bf06f` | Alan Bateman |
| JDK-8391643 | `df031428ec274f6abcc0fc76e5b7e02c85b74163` | Quan Anh Mai |

Donor authorship/legal headers and logical commits are preserved. ParkEvent's
size-only allocation override is the intentional fork-tag adaptation. The old
problem-list deletion is already satisfied by this fork. Test-only adaptations
omit the out-of-scope Shenandoah invocation and replace unsupported
StressVerifyMeetJoin/IgnoreUnrecognizedVMOptions coverage with a supported,
WhiteBox-confirmed C2 semantic regression; no stress coverage is implied.

All 15 open fork PRs were refreshed with exact heads and fully paginated file
inventories; none shares the selected changes' paths. The head/count inventory
is in `memory-overhead-pr-audit.json`. PR44's monitor/GC correctness consolidation
is separate and is not duplicated. PR9 Method/stubs, PR31 parser tables and
PR23 generated classes remain outside this work. Shared compiler/runtime effects
still need integrated tests; path independence alone does not prove compatibility.

## Regression coverage and reproduction

Use the repository's ordinary dependency/build instructions (`building.md`) and
normal managed jtreg/GoogleTest sources. GoogleTest must include both googletest
and googlemock, version 1.14 or newer. No private packet, image, observer, binary
or host report is a required build input. For a release/server example:

```sh
bash configure --with-conf-name=memory-review --with-debug-level=release \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --with-gtest="$GTEST_SOURCE"
make CONF=memory-review images test-image
make CONF=memory-review test TEST="test/hotspot/jtreg/gc/TestCodeCacheUnload.java#serial test/hotspot/jtreg/gc/TestCodeCacheUnload.java#parallel test/hotspot/jtreg/gc/TestCodeCacheUnload.java#g1 test/hotspot/jtreg/gc/TestCodeCacheUnload.java#z test/hotspot/jtreg/gc/g1/TestCodeCacheUnloadDuringConcurrentMark.java test/hotspot/jtreg/compiler/types/TestInterfaceSetScratch.java test/hotspot/jtreg/compiler/stringopts/TestLongStringConcat.java"
make CONF=memory-review test TEST="test/jdk/sun/nio/ch/TemporaryBufferCarrier.java test/jdk/sun/nio/ch/TempBuffer.java test/jdk/java/nio/channels/FileChannel/TempDirectBuffersReclamation.java"
```

`TestInterfaceSetScratch` requires regular level 4 C2 compilations and checks
shared/disjoint interface, null and array-merge results before/after compilation.
It does not certify natural entry into both native helpers or a memory delta.
`TemporaryBufferCarrier` retains the qualified 32-task/eight-round input and exact
byte/size checks, now with a checksum assertion and separate platform/virtual
jtreg invocations. ParkEvent's gtest checks natural alignment, unique concurrently
held events, unpark permits and safe immortal recycling, allowing legitimate
stale/spurious unparks. It never blocks or deletes an event.

Run the exact C-heap Array test with NMT enabled (TEST_VM adds `_vm`):

```sh
JDK="$PWD/build/memory-review/images/jdk"
GTEST="$PWD/build/memory-review/images/test/hotspot/gtest/server/gtestLauncher"
"$GTEST" -jdk "$JDK" --gtest_filter=Array.c_heap_allocation_size_vm \
  --gtest_output=xml:array.xml -XX:NativeMemoryTracking=summary -Xmx256m
"$GTEST" -jdk "$JDK" --gtest_filter=ParkEvent.natural_alignment_and_recycled_events_vm \
  --gtest_output=xml:park.xml -Xmx256m
```

Require exactly one executed, unskipped case in each XML, with no failures; empty
selection and NMT-disabled skips are not passes. Array checks actual NMT requested
size/tag plus zero initialization and access for three element types and lengths
0/1/7/1000. Its negative control requires a separately compiled old-header gtest
binary: the allocator is inline, so merely swapping libjvm does not reproduce the
old allocation. Expect only the 12 size assertions to fail. Also run
`runtime/cds/appcds/aotCode/AOTCodeTest.java#g1` using normal jtreg dependencies
and actual AOT training/compile/replay, with `AOTVerifyTrainingData` enabled;
unsupported or unexercised routes leave AOT qualification pending. That functional
route passed here; it does not replace the blocked exact-byte gtest.

For the manual aligned-buffer accounting fixture, compile
`test/manual/jvm-memory/NioAlignedCacheLifecycleFixture.java` once with
`--add-exports java.base/sun.nio.ch=ALL-UNNAMED`, reuse those class bytes for both
images, and run with NMTdetail, `-Xshare:off`, the same export and argument`leak`.
At READY take `jcmd PID VM.native_memory baseline` and a detailed `scale=1`
snapshot; send Enter once. At POST_EXIT take detail.diff/detail snapshots; send
Enter to exit. Reconcile the complete Othermalloc category/count rather than a
selected frame; baseline allocation must be zero before work. All32 misaligned
paths must execute. An allocator that does not supply them makes the diagnostic
inconclusive; do not search or rerun for favorable addresses. Use argument`control`
with maxCachedBufferSize 0 and separate 65536/69631/69632 threshold cases. These
manual instructions create no default test or benchmark workload.

A newly built matched baseline and this integration, with the same compiler,
flags, class files and supported platform, are needed to qualify this branch.
The corresponding build and13 focused jtreg IDs were executed after source
integration; exact current-image results and limits are in
`memory-overhead-validation.md`. No new performance run, observer compilation,
installation, CI dispatch or runner provisioning was performed. Shenandoah and built-in HTTP/2 remain outside scope.

## Disposition of the remaining 53-proposal packet

Included original proposals 1 (prompt reuse only) and 47 (padding only); 52's
26-file FromCardCache donor remains separate pending memory/refinement/CPU/pause
and yield/group-identity coverage. Proposal 53's mark-stat cap,35's two Metachunk
counters,24's IndexSet reduction and exact-bound compiler presizing remain
unmeasured and excluded. The C2 scratch and Arrayunit repairs are narrowly reviewed
additional findings, not generic ResourceArea retention or allocator redesign.

Conditional allocator/table projects remain deferred:2,8,10,14,15,21,28,29,
40,42,44,48,50,51. Their lifetime/concurrency or throughput evidence is
missing. Rejected, false-premise, already-present or fixed-contract proposals
remain excluded:3–7,9,11–13,16–20,22–23,26–27,30–34,36–39,41,43,45–46,49.
No compressed-pointer/layout redesign, hot Method/subtype contract, eviction,
slab unmapping, JFR constant-only laziness, global default tuning or HTTP/2/
Shenandoah work is introduced to enlarge the result.
