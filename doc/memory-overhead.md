# JVM memory overhead changes

These changes correct excess native allocation and temporary-buffer retention,
reclaim dead code earlier, and share privately owned locale symbol arrays.
Public APIs, heap defaults and the normal collector profile are unchanged.
Memory and CPU results below retain their measured sources and workload limits;
they do not establish universal non-regression. DateFormatSymbols is included
without a runtime selector; omitting it requires a separately reviewed split or revert.

## Components and provenance

Five changes derive from upstream work; the metadata Array correction and
DateFormatSymbols sharing are original fork work. Upstream authorship and
copyright notices remain intact.

| Component | Upstream source / author | Behavior and fork adaptation |
| --- | --- | --- |
| Earlier code-cache reclamation | [JDK-8387742](https://github.com/openjdk/jdk/commit/3e2366e7f5d29be03c8d5ddb4f62e5e1f7185550), [JDK-8388169](https://github.com/openjdk/jdk/commit/433cfb96238a2f554295e3630336c61f070d2244), Albert Mingkun Yang | Finish Serial/G1 marking before unloading; the second change repairs concurrent-mark test scheduling. Parallel source is imported but excluded by the normal fork profile. The follow-up's ProblemList-Xcomp deletion is unnecessary because the entry is absent here. |
| ParkEvent alignment | [JDK-8393648](https://github.com/openjdk/jdk/commit/3f4d498e737d53c72242646c0cd2b8558f7c0270), Fredrik Bredberg | Remove obsolete allocation padding/alignment. The size-only allocation override preserves this fork's `mtInternal` tag. Immortal recycling/deletion policy is unchanged. |
| NIO carrier-local caches | [JDK-8392951](https://github.com/openjdk/jdk/commit/46d5c4cde130da57ace0f12aededc6f4b18bf06f), Alan Bateman | Pin carrier-local cache access and replace aligned buffers without losing the old allocation. |
| C2 interface scratch | [JDK-8391643](https://github.com/openjdk/jdk/commit/df031428ec274f6abcc0fc76e5b7e02c85b74163), Quan Anh Mai | ResourceMarks bound temporary union/intersection lists; `TypeInterfaces::make` copies members to the independent type arena before hash-consing. |
| C-heap metadata Array | [Original correction](https://github.com/re-thc/openjdk-jdk27u/commit/3bedfa3519ed67306892af89fa4b0017c416f174), Harry Chan | Convert words to bytes once, preserving zeroing/tag/access. Production scope is AOT training dependency snapshots, not ordinary Java arrays. |
| DateFormatSymbols | [Original component](https://github.com/re-thc/openjdk-jdk27u/commit/34e34b7a31c233a19988228ddde5b89b4275a1b2), Harry Chan | Share six privately owned locale arrays, with defensive public access and conservative subclass/deserialization handling. The measured snapshot implementation is identified below. |

The fork also adds regression tests, JMH workloads and ownership/native probes,
and adapts unsupported collector/stress requirements. Serial/G1/ZGC are supported;
Parallel, Epsilon, Shenandoah and desktop modules are outside the normal profile.

DateFormatSymbols snapshots hold six final array references. Setters invalidate
the volatile snapshot before replacing a field. Serialization invalidates it
and detaches arrays under the source monitor before exposing them to stream
callbacks. A clone that captured the snapshot continues using its private
arrays; a clone without one uses the guarded fallback. Time-zone copies and
stream callbacks run outside that monitor. These are implemented safeguards.

## Measured source and scope

The retained 920 observations comprise 572 JMH forks and 348 fixed-process runs.
They compare complete Linux x64 images, not patched Java modules. Results from
different candidate revisions are kept separate:

| Identity | Exact production source / role |
| --- | --- |
| B | `e7753d9dffffbf3a9430c2cc2ab53c5332bf1bf4` |
| C0 | `dfbbd8f2b278729aa5efbb286f59664dcbe02042`; initial combined image |
| C1 | `474b4c1650ade24c4f4a76b23a506c55d1e79212`; immutable snapshots replace broad clone locking |
| C2 | `207f395074f651fb36d03160169940de80504013`; avoid a redundant volatile destination write |
| F | `0039375e7ce4cf3a300284a55fc329201fc53abb`; complete images containing the clone-copy repair `72e8eefc589cad059abffd8678df194671a0ec6b`; separately measured below |
| Common benchmark additions | First-write serialization at `e4eb05db67bf426f909f9116a49be139bbff16a5`; lazy-zone cloning at `9805280fafdc019d8fbbd57d8aa463276a06aa76` |
| Test-only follow-up | `ea4a3535592081cfce0de6cd543f60d9f582585a`; exclude an inherited shared-Builder race from concurrent cache checks |
| Archived record | `1cfa04fdfb95b92ae1a213535f8b0bb4ff1c4f23`; later changes to C2 are tests, documentation and copyright attribution |

C0/C1/C2 native libjvm bytes are identical: release SHA256
`5a04d5a0fe5db9537fefc78231be14d2cc31a736f8ac4688738ebe8544fa7ed9`,
fastdebug `58bf99da79cf365a3ffa74762e7714a530bafd3b4194e74175be579b5563e958`.
B production is unchanged; its two common test-only additions are the Array
measurement and the explicit PLAB flag include needed with PCH disabled.

Full image identities, individual cost tables, controls and reproduction records
remain in the immutable [validation record](https://github.com/re-thc/openjdk-jdk27u/blob/1cfa04fdfb95b92ae1a213535f8b0bb4ff1c4f23/doc/memory-overhead-validation.md),
[comparison instructions](https://github.com/re-thc/openjdk-jdk27u/blob/1cfa04fdfb95b92ae1a213535f8b0bb4ff1c4f23/doc/memory-overhead-native-decision.md),
[ownership/test instructions](https://github.com/re-thc/openjdk-jdk27u/blob/1cfa04fdfb95b92ae1a213535f8b0bb4ff1c4f23/doc/date-format-symbols-sharing.md)
and [original provenance record](https://github.com/re-thc/openjdk-jdk27u/blob/1cfa04fdfb95b92ae1a213535f8b0bb4ff1c4f23/doc/memory-overhead.md).
Those records describe earlier sources. Original images, raw observations and
diagnostic inputs remain retained privately; old measurements are not relabeled
as validation of changed production code.

## Attributable memory and correctness

The following memory figures were measured on the historical B/C0/C1/C2 images,
not remeasured on F. Their matched builds use the normal headless profile, GCC/G++ 16.2.0, mold, boot JDK
27+35-2325, jtreg 8.3-dev+1, GoogleTest 1.14 and JMH 1.37. The local host provides
four CPU equivalents and a 16 GiB memory limit. Actual compact headers are four
bytes, with eight-byte alignment; compressed oops are enabled for Serial/G1 and
disabled for ZGC. These observations do not establish other-platform performance.

| Measured unit | Baseline to candidate | Boundary |
| --- | --- | --- |
| Array requested bytes | One-eighth in all 12 type/length cases | LP64 native metadata allocations; baseline control has exactly 12 expected size failures, with tag/zeroing/access passing |
| ParkEvent requested bytes | 416 to 160 per event; 65,536 fewer bytes for 256 new events | Native sizeof/alignment remain 160/8. Fixed 64-to-192 platform-thread high-water; reuse adds no events. Immortal pool, not OS-returned or per-virtual-thread memory |
| NIO after worker exit | 2,224,128 bytes / 32 allocations to zero | All 32 misaligned replacements exercised; complete Other NMT detail/totals reconcile. Disabled-cache and thresholds 65536/69631/69632 are retained controls |
| 1000 ordinary Locale.US symbols instances or clones, Serial/G1 | 296,000 to 56,272 shallow bytes | Six-field arrays: 6000/240,000 bytes to 6/240 bytes; one 32-byte snapshot; each instance stays 56 bytes |
| Same, ZGC | 504,000 to 96,472 shallow bytes | Arrays 416,000 to 416 bytes; one 56-byte snapshot; each instance grows from 88 to 96 bytes |
| Lazy symbols allocation | 296 to 56 bytes/op, Serial/G1; 504 to 96, ZGC | Constructor/clone; excludes time zones and strings. G1 formatter clone 1056 to 816, ZGC 1504 to 1096 bytes/op |
| Serial/G1 code-heap used capacity | 49,152-byte paired change advantage | First GC reclaims/reuses 64 dead methods earlier, preserving 64 live controls. Blob payload is 25,088 bytes; committed 8 MiB and reserved 32 MiB are unchanged. ZGC is unchanged control |
| C2 scratch | Not quantified | Lifetime and level-4 compilation semantics checked; no helper-entry/peak-byte or C2 sanitizer measurement |

Java cohort figures exclude strings, time zones and other caches. Serializing
every instance detaches its shared arrays, losing the retention benefit while
the ZGC instance increase remains. Fresh streams are identically 52,355 bytes
(SHA256 `516264be01287ab302160ac33b50a63100955facea3a262296b3cfe9e8d3be16`).
Native requested bytes, Java shallow storage and code-heap used capacity are
different units/lifetimes; they cannot be summed into an RSS/PSS saving.

C0/C1 release and fastdebug each pass 21 focused IDs, exact Array/ParkEvent and
four G1 native cases; B passes nine applicable focused IDs. C2 passes nine
affected Formatter IDs per image. The common locale suites pass 123 IDs on B
and each candidate; the pre-existing `Locale/SoftKeys.java` `@ignore` did not run
and is not counted as a pass. Actual AOT record/create/replay uses training-data
verification. NIO scalar/scatter-gather platform/virtual checks verify bytes.
Array/ParkEvent ASan execution preserves live NMT header poisoning; it does not
establish C2 sanitizer coverage. No process-wide RSS/PSS claim is made.

Three deterministic JDI schedules cover partial serialization detachment,
a setter during detachment, and serialization/hook mutation after a clone
captures its snapshot. Cache/private arrays must stay isolated. The inherited
`CalendarDataUtility.OVERRIDE_BUILDER` race is independently reproduced on B:
wrong regions in three/four workers; a candidate failure occurred before clone.
Concurrent region-override construction remains unqualified. Ordinary cache
publication is checked concurrently; region-override ownership sequentially.

## Historical CPU costs

Each condition uses four balanced AB/BA pairs, one fork, three one-second
warmups and four one-second measurements, with unchanged common class bytes.
Timing uses fixed US/UTC, CPU affinity 0–3, 256 MiB heaps, four processors, two
compiler/parallel GC threads, one concurrent GC thread, and no NMT/agent/profiler.
The following C2 results are from the EPYC 9V45 phase, relative to B; positive
is slower. Initialized-zone setup checks equality; lazy setup checks months only.

| C2 clone condition | Paired median % [range] | Slower pairs |
| --- | --- | --- |
| Serial private, one worker | +10.71 [+3.89, +14.99] | 4/4 |
| Serial shared prototype, four workers | +11.02 [+6.57, +17.36] | 4/4 |
| G1 private, one worker | +2.88 [+0.73, +8.17] | 4/4 |
| G1 shared prototype, one worker | +5.72 [+2.31, +7.91] | 4/4 |
| G1 shared prototype, four workers | -0.58 [-5.25, +3.39] | 1/4 |
| ZGC private, one worker | -1.72 [-5.84, +3.95] | 2/4 |
| ZGC shared prototype, four workers | +2.52 [-6.14, +8.22] | 3/4 |

Interleaved B/B controls for the two Serial warm cases center at -1.05%
[-2.43, +0.32] and +1.80% [+0.17, +3.43]. Those controls do not explain away
the warm-zone regression. C0's broad monitor caused 434–530% warm shared-clone
losses and a 2281% G1 lazy shared-clone loss; C1/C2 repair that contention but
leave the costs above. Lazy C2 clones are 41–54% faster in selected conditions.
The measured G1 formatter clone is 11.39% faster with lazy zones; it is not
proof of recovery for a warmed-zone formatter chain.

Other slower/noisy results remain recorded. C0 javac medians are +1.91% G1,
+0.93% Serial and +3.47% ZGC; G1 thread start/join is +4.51%, Serial/ZGC allocation
+3.26/+2.82%, and small I/O effects vary around zero. C1 repeats G1 start/join
at -1.44% and Serial allocation at -0.78%, retaining the original observations.
C1 G1 formatter construction (+0.24%) and first-write serialization (+0.50%) are
mixed-direction results, not losses proven absent. Their source remains C1.

C1 precise fixed-process medians include Serial thread churn +18.13% and virtual
carrier +11.25%, G1 platform/virtual carriers +7.86/+6.70%, Serial startup +3.17%,
and other positive medians in the archived full tables. C2 follow-ups vary:
Serial churn -1.18% [-9.13, +25.28], virtual carrier +1.08% [-4.07, +7.52],
startup +9.66% [-19.14, +23.98]; G1 platform carrier -0.21% [-12.80, +4.67];
ZGC churn +2.80% [-15.31, +36.00]. B/B controls also vary substantially; there
is no universal startup/process non-regression bound. Coarse C0 timeout-wait
wall times are retained but unqualified for small differences and are never
averaged with C1/C2 pipe-completion timings.

Whole-fork GC p99 includes startup/warmup, excludes concurrent phases and is
descriptive, not application transaction p99. G1 C0 median 1.417 ms versus B
1.285 ms lies within substantial B/B variation (1.147–1.788 ms). Sparse process
tails, other architectures, Parallel and C2 peak-byte/sanitizer claims remain
unqualified. CI success establishes its selected tests, not performance.

## Clone-copy boundary and focused repair results

An initialized-zone clone calls `copyOtherMembers` then `getZoneStringsImpl(true)`.
Retained inlining traces show B leaving `copyMembers` (160 bytecodes) outside the
clone caller, while C2 inlines `copyOtherMembers` (46 bytecodes) and the getter
(80 bytecodes), including the allocation loop. The repair keeps the same eager row copies in
`copyZoneStrings`, marked `DontInline`; the getter shrinks to 35 bytecodes and
the traces confirm that the loop stays outside the inlined caller. Copies still
execute for every warmed-zone clone. Ownership, volatile publication and locking
are unchanged. This is a [limited HotSpot code-shape workaround](../src/java.base/share/classes/jdk/internal/vm/annotation/DontInline.java),
not a general inlining-policy fix or an instruction-level cause claim.

The boundary also serves public `getZoneStrings` and ordinary `SimpleDateFormat`
constructor, symbols getter/setter and clone calls through DateFormatSymbols.
No benchmark detection or alternate copy algorithm is introduced. Performance
of those other caller shapes, tiny/custom tables, subclasses, other locales,
warmed formatter chains, other JITs/hosts and untested collectors is not established.

Fresh complete release and fastdebug F images each pass profile checks and all
14 affected IDs (Serial 8, G1 3, ZGC 3), including the three serialization schedules
per collector. F release matches 93 primary baseline configuration variables
after source/output path normalization; external symbols remain enabled.
Omitting GTest affects test artifacts only:
all 55 shipped native ELF files match retained C2 byte-for-byte. F `lib/modules`
SHA256 is `d804b1bae7481ae9fae524aac9c953a3b4d67447fa66b84a8b79211306c56628`;
default `classes_fourbyte.jsa` is `0544370dc7355470dbcf17c9909f0c27db69587bbf214cd3a4a458132dcb28bc`.

A separate EPYC 9V74 phase uses unchanged benchmark bytes/settings and default
CDS on B, C2 and F: four interleaved three-image blocks and two B/B control pairs
per case, exactly 64 measured forks. Earlier module-patch diagnostics with CDS
disabled are separate exploratory evidence. Percent changes below are medians
[paired ranges]; F/B and F/C2 are faster in all four blocks of every case.

| Clone case | F/B % | F/C2 % | B/B control % |
| --- | --- | --- | --- |
| Serial private, one worker | -11.85 [-15.53, -6.86] | -22.16 [-23.89, -17.90] | -2.23 [-4.64, +0.17] |
| Serial shared, four workers | -10.58 [-11.32, -4.59] | -20.76 [-22.50, -14.73] | -2.43 [-3.42, -1.44] |
| G1 private, one worker | -22.63 [-29.68, -15.40] | -18.59 [-25.01, -17.50] | -1.99 [-2.50, -1.49] |
| G1 shared, one worker | -21.15 [-25.78, -15.40] | -20.85 [-26.16, -13.01] | +0.72 [+0.57, +0.87] |

Serial C2/B costs reproduce on 9V74: +12.50% [+8.11, +17.84] private and
+13.57% [+4.40, +21.06] shared, both 4/4 slower. F recovers those costs within
each clone workload, without unrelated offsets. G1 C2/B is mixed: private
-4.79% [-8.22, +4.33], 1/4 slower; shared +1.69% [-9.09, +3.33], 3/4 slower.
The earlier 9V45 G1 losses remain on record. These phases are not pooled.
B/B variation reaches 4.64%; four blocks/two controls do not certify a 1%
non-regression bound. F's process/code-memory footprint and remaining workloads
were not remeasured; historical memory benefits are not new F measurements.

## Reproduction

Use [building.md](building.md), [testing.md](testing.md), installed/managed
inputs, matching `bin/configure-dev` profiles and source dates, and ordinary
release/fastdebug images. Record source/common-input/image identities and any
baseline test-only changes. Run `.github/scripts/check-dev-profile.sh` on both
images. Select `Array.c_heap_allocation_size_vm` and
`ParkEvent.natural_alignment_and_recycled_events_vm` with NMT and XML receipts;
skipped or empty selections are not passes. The old-size Array
control must be compiled against the baseline allocator, not just swap libjvm.

Run `DateFormatSymbolsSharingTest`, `DateFormatSymbolsSerializationAliasesTest`
and `DateFormatSymbolsConcurrentSerializationTest` under Serial/G1/ZGC, the ordinary DateFormat/locale suites, focused code-cache/C2/NIO
cases and actual AOT replay. The committed
[ownership probe](../test/micro/org/openjdk/bench/java/text/DateFormatSymbolsFootprint.java)
contains standalone compile/agent commands; use its `allocation` mode separately
from timing. Reuse baseline-compiled diagnostic/JMH bytes on both images. The
[cost workloads](../test/micro/org/openjdk/bench/java/text/DateFormatSymbolsCost.java)
include private/shared initialized-zone clones, lazy shared clones, formatting,
parsing and fresh first-write serialization. Keep B/B controls and unfavorable
valid forks. The [NIO lifecycle fixture](../test/manual/jvm-memory/NioAlignedCacheLifecycleFixture.java)
and immutable comparison instructions retain cache/threshold and full NMT
reconciliation procedures. No historical execution controller is required.
