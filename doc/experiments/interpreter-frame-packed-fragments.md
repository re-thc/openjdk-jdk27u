# Fragment first-write cost and packed source storage

Runtime `8455a6f2885` and [its report](interpreter-frame-templates.md), all earlier
controls, failed outcomes and images remain preserved. The next source change is
`94dba35a453`: compact fragment metadata and an append-only source-byte pool.
It follows independent design and exact-patch review, with no additional semantic
coverage, automatic admission, residency, tier policy or invocation machinery.

Final release/fastdebug qualification passes. With all fragment initialization
charged, the packed candidate uses 3.4–21.5% less held-producer CPU than the C++
emitter in the four fixed startup-cohort pairs. Samples vary substantially, and
including separate startup spans leaves one CPU pair adverse. This is a bounded
producer improvement, not an application or steady-state result.

The key finding is that the original cache was already demand-driven by family.
Its large cold cost was not eager generation of unused helpers or optimizing
compiler metadata. First writes to state/source data scattered across the nine
2-KiB buffers incurred expensive minor faults in this constrained environment.
Packing the actually used bytes addresses that physical layout cost without
adding another cache or moving initialization outside the measured budget.

## Family demand, capacity and actual work

The original `state==0` path constructs a family only on use. State 1 permits
reuse and state 2 suppresses retries of rejected configurations. The two-real-body
study built eight families/834 bytes; the retained startup chunks below build
nine/901 and four/204. No unused family construction was found.

The 18,740-byte old reservation contains nine 2048-byte byte arrays, patch/state
metadata and configuration/metric storage. It is static BSS capacity, not an
18-KiB heap allocation or memset per request. Nevertheless, metadata at the tails
of those arrays, and their instruction prefixes, are spread over multiple pages.
Publication also scanned every family's state to sum retained bytes, including
families that had never been used.

Each actual first build uses a borrowed ResourceArea CodeBuffer with 256 bytes
of relocation scratch. Default OopRecorder construction initializes empty state;
it does not allocate oop/metadata tables. Release cleanup owns no BufferBlob,
private scratch arena or trampoline collection. The original general helper
logic, real relocation/constant/string validation, source destruction and
destination copy/patch still run. A second lazy-family rule would not remove them.

## Separate causal diagnostics

Two preparation-only diagnostic versions were captured separately from all silent
performance records. The first split configuration, source-buffer setup, helper
generation, validation, cleanup and copy/patch. Nine first builds in chunk A
accounted for 11.378 us of helper elapsed time, 0.971 us setup, 0.431 us validation,
0.362 us cleanup and 0.541 us copying/patching. Chunk B's four builds had 5.478 us
of helper time and 0.501 us setup. Those cuts did not explain most of the whole
first-fragment intervals: the missing work lay before buffer setup.

A targeted second version bracketed the state-zero to state-two write and sampled
the producing thread's minor-fault count. Results were:

| Chunk | Faulting first-state writes | Their combined elapsed time | Nonfaulting state writes |
|---|---:|---:|---:|
| A | 2 | 48.273 us | 20–30 ns |
| B | 2 | 91.146 us | 20 ns |

The faulting spans were 35.404/12.699 us in A and 28.332/62.774 us in B. Some first
source-helper spans also rose to 16–17 us in this version; writes to the source
byte arrays can touch another page. Those helper faults were not separately
counted, so their physical attribution remains an inference. The source layout
and measured state-write faults are sufficient to establish real scattered
first-write overhead; the exact count/location can change with host image layout.

The second diagnostic sampled resource use after the helper as well as setup:
256 bytes per family in both places, with no chunk growth. This rules out a hidden
resource expansion in those observed builders, not all possible configurations.
Configuration comparisons and cached copies remained much smaller aggregate work
than the faulting first writes. They are not removed or credited as free.

These are CLOCK_MONOTONIC elapsed cuts, not uninstrumented CPU shares. Empty clock
pairs measured 20–30 ns medians. Additional getrusage calls, diagnostic code/data
layout and row writes perturb the process. The row initialization precedes its
individual timer but remains inside whole diagnostic producer time. Accordingly,
neither diagnostic's whole time is used as a performance result. All output and
clock calibration occur after all twelve requests; there is no inter-request
printing or invocation instrumentation. No rows overflowed. Both diagnostic
sources, objects/auxiliaries and build libraries were restored to exact 8455
hashes after capture. Their private images, patches and outcomes are preserved.

## The minimal source correction

`PilotFragmentStorage` holds the nine compact metadata records, a used-byte count,
and one fixed 18,432-byte source pool. A first builder starts at `bytes+used` with
the original 2048-byte capacity. CodeBuffer initialization sets section pointers;
it does not clear that whole window. On a clean build, the compiler records the
offset/size, advances used by actual instruction size, and sets ready state last.
Rejected state-two families commit no bytes; their closed, unreferenced tail can
be overwritten by the next builder. Copies use the stored offset.

At most eight earlier families can be ready before the last first build. Each is
smaller than 2048 bytes, so the next 2048-byte window fits the fixed nine-family
pool. Offsets/sizes fit u2. Source labels and their nested ResourceMark still die
before any destination fixup attaches. Earlier ready ranges lie strictly before
used, and installed bodies never reference source storage. Internal relative
distances and explicit external patch offsets remain valid at the new source base.
No new allocation, copy, lock, guest guard or invocation instruction is added.

The used-byte count replaces the publication-time scan of scattered states.
Reservation becomes 18,764 bytes, 24 bytes larger because of offsets/counter and
alignment; this is not advertised as a virtual-memory reduction. The improvement
targets pages touched: compact metadata and 901 actual bytes occupy a small
contiguous region rather than instruction/state writes spread over nine buffers.
The fixed worst-case capacity remains charged, and first touch is still real work.

## Retained startup-method cohort and original result

The cohort is the existing selected 24 startup roots from the ordinary-call
semantic study: the 22 leading class-available entry rows plus constructor and
handler controls. No workload or synthetic priming methods were added. Every
class-file length, max locals and max stack was rechecked against the retained
selection. The full startup divisor remains 8,905 entered methods/690,406
pre-admission interpreted entries; these 24 roots are not a replacement divisor.

The fixed list is split into two twelve-request chunks, each in a fresh VM.
Neither can exhaust sixteen slots. Resolve/link/hold occurs in canonical order,
then only preparation order reverses. The eight runs balance image order and
forward/reverse preparation order. All output follows the measured requests.
The same coherent df/8455 images, class files, action 8, 64-MiB G1 heap, four pinned
active CPUs, two normal compiler workers, CDS off and disabled test counters are
used. No root invocation or application execution is timed. All refused and
truncated preparation costs, and every first-family build, are charged.

The unchanged-image comparison before the layout correction was uniformly
adverse. Values are complete held-producer CPU/wall microseconds:

| Chunk/order | df C++ emitter | 8455 scattered fragments | CPU change |
|---|---:|---:|---:|
| A forward | 68.143 / 68.280 | 141.058 / 141.803 | +107.0% |
| A reverse | 67.518 / 67.742 | 105.687 / 105.880 | +56.5% |
| B forward | 39.811 / 39.910 | 83.984 / 84.216 | +111.0% |
| B reverse | 68.023 / 68.415 | 75.821 / 76.035 | +11.5% |

Generated sizes and accepted identities match in every pair. Chunks must remain
separate: summing them does not simulate a single 24-method VM with one shared
initialization. The different method mixes also cannot be treated as repetitions
of one distribution. All adverse values and startup spans remain in the ledger.

## Qualified packed-layout result

Runtime `94dba35a453` passes all 13 focused release and all 13 fastdebug tests,
including positive copied use of all nine families. The three additional
maximal-verification fastdebug controls pass too. Assertions, forced polls,
breakpoints installed after preparation, GC/live references, calls, exceptions
and C++ fallback remain qualified. No diagnostic cuts exist in this runtime.

The exact same fixed eight-fork cohort then ran against the preserved C++ emitter,
using the original class files and selection with no additional warm-up, target
or repetition. All eight forks succeeded. Code sizes, accepted identities and
family-use masks match the earlier captures. Chunk A retains 901 bytes/nine
families and B 204 bytes/four families, with 18,764 bytes reserved in each.

| Chunk/order | df C++ CPU/wall us | Packed CPU/wall us | CPU change |
|---|---:|---:|---:|
| A forward | 74.339 / 74.422 | 64.046 / 64.204 | -13.8% |
| A reverse | 122.763 / 123.495 | 118.627 / 119.682 | -3.4% |
| B forward | 51.416 / 51.977 | 40.338 / 40.462 | -21.5% |
| B reverse | 39.391 / 39.519 | 37.286 / 37.367 | -5.3% |

Every first-family build and every refused/truncated request is included in these
totals. The high A-reverse samples in both images are retained. These four paired
reductions do not establish their magnitude as a population estimate. The earlier
8455 captures are a different series: comparing 141.058 to 64.046 us directly
would not be a controlled layout-only speedup claim. Source/fault attribution
identifies the removed work; the new matched series tests the complete packed
mechanism against the original C++ emitter.

One-time blob allocation and arena initialization are recorded separately, then
charged once per VM. The following sums are selected measured startup plus
producer spans, not complete process startup:

| Chunk/order | df producer + startup CPU/wall us | Packed producer + startup CPU/wall us |
|---|---:|---:|
| A forward | 94.439 / 93.180 | 85.637 / 84.494 |
| A reverse | 144.546 / 143.855 | 143.975 / 143.927 |
| B forward | 226.276 / 225.418 | 61.750 / 60.412 |
| B reverse | 61.593 / 60.309 | 69.865 / 65.179 |

B-forward's control startup span is 174.860 us and dominates that apparent total
gain; it is not credited to packing. B-reverse's packed startup is 32.579 us
versus 22.202 us, overcoming the 2.105-us held-producer saving. A-reverse's total
wall difference is only 0.072 us adverse. No outlier is removed and no repetition
seeks significance. Outer WhiteBox request CPU also declines in all four pairs,
but remains harness work rather than an implemented automatic admission path.

The correction removes a real accidental first-touch penalty. The general helper
emission still runs once per used family, and fixed reservation, relocation
validation, copies/patches and eventual first touch remain charged. It does not
make first preparation free or prove the earlier notional five-us budget for
every shape. The earlier eight/nine-pair repayment estimate applied to the
scattered 8455 layout; it must not be reused as a packed-layout estimate. In this
selected twelve-request study the combined mechanism repays its held-producer
initialization in all four pairs, while total startup is still mixed.

The coherent direction is to retain direct interpreter-frame emission with
compact used-byte fragments, rather than add more caches or hide initialization
at VM startup. The remaining architecture decision is whether that producer
serves enough useful distinct caller execution before ordinary optimization.
The explicit sixteen-slot, partially supported pilot cannot answer that question.
Coverage/residency and time-weighted execution opportunity require a separately
agreed next stage, not threshold tuning inferred from these preparation results.
No further implementation or timing follows this bounded study.

## Prefix classification and opportunity limits

Separate observed action-4 captures transfer end-BCI labels only after checking
equal acceptance, code sizes and emitted-operation counts in both images. Of all
24 requests, **10 emit all nonreturn bytecodes, nine truncate, and five refuse**.
Nineteen published prefixes are not nineteen native-covered methods.

| Classification | Count | Specific remaining gap |
|---|---:|---|
| All nonreturn bytecodes emitted | 10 | Ordinary terminal return still interpreted; unresolved calls/casts may fall back |
| Truncated at array length/load | 4 | CodeSource.matchCerts, ScopeImpl.enter, HeapIntBuffer.get, Pattern.Slice.match |
| Truncated at later allocation | 3 | String.ascii, ImageLocation.readFrom, SharedImageReader.getResourceName |
| Truncated at invokedynamic | 1 | Symtab.doEnterClass |
| Truncated at category-2 call | 1 | ImageLocation.getExtensionOffset |
| Refused at initial allocation | 3 | ScopeListenerList.walkReferences, Symtab.defineClass, allocation lambda |
| Refused constructor/reference-handler roots | 2 | RelativeFile constructor, wrapped file-manager inferBinaryName |

These classifications are unchanged by storage layout. There is no executed
native coverage or CPU-time weighting in this preparation-only cohort. Entry
counts are retained opportunity data, not conversion to CPU savings. The fixed
sixteen-slice architecture cannot establish workload-wide amortization here.

## Build boundary and preservation

Independent review approved the design, exact source bounds/lifetime and the
configuration fallback. Initial validation hit a real disk boundary: the one-file
release link materialized a 644,386,256-byte intermediate despite stripped final
images. The 256-MiB supervisor floor stopped it at about 231 MB free; the queued
debug command stopped before building. This peak was underestimated. The partial
library is not used as a runtime or a successful build result.

The aborted file remains at its original path and logical size. Converting only
zero ranges to sparse holes reclaimed 605,924,816 allocated bytes; its complete
SHA-256 is unchanged:
`135bf1f436d199c9817854f4c70b67bed17fd59b942c1ffe6489c94109ac70f7`.
No evidence or image was deleted. A reviewed build-only route preserves the exact
existing EXTRA_LDFLAGS and appends `-Wl,--strip-debug`, the same mode already used
by the post-link strip step. CXX/security/version-script flags are retained. This
avoids materializing debug sections, and is recorded separately from compiler
production changes. Subsequent release/debug links complete above the disk floor.

One extra PID1 shell zombie appeared during the initial manifest attempt, which
used an unclosed os.popen. Manifest collection now uses waited subprocess calls.
No attempt was made to kill PID1 or unrelated processes. Build/test wrappers use
the landed synchronous logging pattern and the owned subreaper supervisor.

Private evidence is `/workspace/interpreter-frame-template-cohort/` for all frozen
8455 captures and diagnostics, and `/workspace/interpreter-frame-packed/` for the
reviewed correction, builds, preservation proof and qualification. Earlier images
and all adverse results remain intact. No public/default/CI change occurred.

Qualified packed release libjvm SHA-256:
`ca66bb24a712d35c5423595cdd5f19c01170713e7c3e4615dd7b7d59487002ae`.
Fastdebug:
`c0c7d2ff60a71fe6378bffd50300d1feaabdeca2fe36f3828ceea4cdab893d31`.
Both earlier df and 8455 release/debug images were checked unchanged after the
work. The final source differs only by the reviewed packing change and this
report. All build/test/capture commands are complete and reaped; about 750 MB
remains free. The one earlier manifest shell remains among 27 PID1 zombies as
described above, and no OOM occurred.
