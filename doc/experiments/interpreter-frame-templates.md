# Configured helper-fragment emission prototype

Runtime `8455a6f2885` implements the bounded template-emission experiment proposed
in [the emitter attribution](interpreter-frame-emitter-attribution.md). Independent
design and exact-source review found no remaining blocker. Release and fastdebug
qualification passed. The preserved comparison is qualified runtime
`df4852a57a9`, with its original images and unfavorable/mixed results intact.

**The prototype reduces later preparation work, but loses on fully charged small
cohorts.** After five preparations have built the used fragments, preparing the
two real bodies costs 12.268–13.090 us of CPU, versus 17.766–18.477 us for the old
emitter, a paired reduction of 29.2–30.9%. Including those five preparations raises
the seven-method total from 50.755–51.366 to 88.521–90.493 us. Cold two-method totals
also regress in both orders. This is evidence for amortizing repeated assembler
work, not a net producer improvement or an application win.

## What changed and what remains shared

Nine fixed helper families are generated lazily under the existing generation
lock: taken/not-taken branch profiling, type/null profiling, complete instanceof
and checkcast predicates, cold reference getfield, and call-resume prefixes for
three- and five-byte invoke instructions. These cover common work in both retained
real bodies, rather than only Key's final-class checks. There is no final-class
specialization in this candidate.

The first use assembles each family's explicitly selected MacroAssembler logic
into a fixed, nonexecuted source buffer. Later sites copy its instruction bytes
and patch recorded external branch sites. Internal labels are closed within each
fragment. The target Method/BCP, constant-pool entries and field offsets are still
read from the existing interpreted state; no per-method oop or metadata address
is embedded in a reusable source fragment. Absolute stable VM addresses remain
valid within this VM. No interpreter machine-code bytes are blindly copied.

The existing bytecode walk, signature/category checks, canonical stack/BCP state,
resolved caches, labels, ordinary interpreter calls, direct per-site return
addresses and immutable publication remain. All runtime ownership, old/obsolete
method, tooling and poll guards execute as before. The source fragments introduce
no invocation-time lookup, branch, counter or dispatch. Their byte storage is not
an executable Java frame and does not alter frame walking or GC root discovery.
No C1 IR, optimization, register allocation, nmethod or compiled-frame metadata
is added.

The original C++ emitters remain the local comparison/fallback path, without a
new feature flag. Configuration mismatch and unsupported verification modes use
them. Copying a helper does not remove its guest instructions. Both real bodies
retain their original sizes, 829 and 2300 bytes; this pass measures preparation,
not invocation speed. Size equality and semantic tests do not constitute a
byte-for-byte equivalence proof for every VM configuration.

## Patch, storage and lifetime review

The review required real relocation recording in the nonexecuted source buffer.
The optional relocation-capacity argument added to the external `CodeBuffer`
constructor defaults to zero for existing callers and changes no object layout.
The source requests 128 relocation entries; a fragment is retained only with no
recorded relocations, oops, metadata, constants, stubs or debug strings. Explicit
external conditional/unconditional branch instruction starts are recorded while
assembling, then attached to destination labels through the existing target and
instruction-patching APIs. Offsets are not inferred from a disassembly.

All source labels, CodeBuffer storage and its nested ResourceMark finish before
any destination fixup is registered. Thus a destination Label's overflow array
belongs to the enclosing preparation mark, rather than a dead nested mark.
Source bytes and integer patch offsets have fixed VM lifetime. Generation and
configuration publication are serialized by the existing lock; source bytes
are never referenced by an installed body. Source const/stub checks were added
following the exact-patch review.

The configuration key covers the inspected profiling, collector, oop/header,
verification, secondary-super, popcount and CPU code-generation choices. Class
encoding geometry is fixed after VM initialization. Verification paths that can
emit extra calls/strings retain C++ fallback. The return prefix excludes the
existing VerifyOops epilogue and optional test counter, so qualification can prove
that copied guards execute while test continuation counts remain observable.

Reserved fragment/configuration/metric storage is **18,740 bytes**, including nine
2048-byte instruction buffers and their bounded patch arrays. The real comparison
uses eight families, retaining **834 bytes** within that reservation; the ninth is
the interface-resume variant, qualified by the tests. Fixed capacity is charged
even when unused. Additional host code exists too: the stripped release libjvm
file is 6,648 bytes larger than the control. File size is not a resident-memory
measurement. Temporary source CodeBuffer/relocation work uses the thread resource
area; it does not create a separate private scratch arena or executable blob.

Generation-only family masks and storage totals are written to the already
reserved header tail. They are never read by guest execution. Their configuration
comparisons, bit updates and publication bookkeeping are included in every
reported preparation cost; the prototype is not credited with removing them.

## Qualification and retained failures

The new regression proves positive use/construction of all nine families, rather
than passing solely through fallback. Serial and G1 children exercise copied
predicates/profiles, a genuinely cold reference field and direct three-/five-byte
call continuations across full GC, with live oop identity, null behavior, ordinary
exceptions and conditional branches. Existing call, reference, forced armed-poll,
late breakpoint, dispatch, coverage, direct-baseline and linkage checks remain.

- Release: 13/13 tests passed.
- Fastdebug: 13/13 tests passed.
- Additional fastdebug maximal-verification configuration: 3/3 passed, with
  CheckCompressedOops, VerifyOops, VerifyActivationFrameSize, VerifySecondarySupers,
  VerifyDataPointer, TypeProfileLevel=222, argument limit 16, width 8 and no popcount.

All assertions remained enabled. Positive-copy children select the safe copy
configuration; maximal verification separately checks the old-emitter fallback.
There was no profiling-capability bypass or relaxation of active-frame rules.

Failed intermediate work is preserved: the first release build referenced the
removed UseCompressedClassPointers flag; the first positive-copy test used -Xint,
which disables interpreter profiling; a subsequent release test exposed a real
product/debug eligibility error. CheckCompressedOops is constant true in PRODUCT,
but its extra emitted checks are ASSERT-only. Gating its copy exclusion under
ASSERT fixed the missing cold-reference family. All final qualification and
measurements use the corrected runtime `8455a6f2885`.

## Fixed matched preparation comparison

Exactly eight fresh JVMs ran. Cold order was control/path-first, new/path-first,
new/key-first, control/key-first. Primed order was new/path-first,
control/path-first, control/key-first, new/key-first. Every outcome is retained;
none was repeated for a cleaner value.

Both images used the same class files, CDS off, a fixed 64-MiB G1 heap, four active
CPUs pinned to CPUs 0–3, two ordinary compiler workers, direct baseline disabled,
interpreter-frame pilot enabled and test continuation counters disabled. Ordinary
C1/C2 settings were unchanged. The two target roots were held interpreted and
deoptimized before priming in both images. This isolates explicit producer work,
not the behavior of an automatically admitted tier.

WhiteBox action 8 brackets the complete unclocked held-method producer, including
locking, ResourceMark cleanup, lazy fragment construction, copying, fixups and
publication. Reflected-method conversion, MethodCounters creation, snapshot and
Java result-array allocation are outside that interval. Existing outer request
and startup costs are retained separately below. There are no per-op clocks,
generation prints within a measured interval, or timed invocation windows.

The primed cohort first prepares five other bodies: a non-tail static call,
conditional branch, cast, instanceof and cold reference read. Their costs are
charged, not hidden as free warm-up. They build all eight families needed by the
real bodies, whose subsequently recorded built masks are zero. All eight forks
completed successfully and passed the existing real-body semantic oracles.

Times below are microseconds; each row is a single matched pair, not a claimed
population estimate.

| Cohort/order | Old real CPU | New real CPU | Old real wall | New real wall | CPU change |
|---|---:|---:|---:|---:|---:|
| Cold, path first | 42.873 | 92.518 | 42.916 | 92.779 | +115.8% |
| Cold, key first | 40.089 | 51.496 | 40.140 | 51.568 | +28.5% |
| Primed, path first | 18.477 | 13.090 | 18.508 | 13.120 | -29.2% |
| Primed, key first | 17.766 | 12.268 | 17.816 | 12.319 | -30.9% |

| Primed order | Old five-primer CPU/wall | New five-primer CPU/wall | Old seven-method CPU/wall | New seven-method CPU/wall |
|---|---:|---:|---:|---:|
| Path first | 32.889 / 32.950 | 75.431 / 75.682 | 51.366 / 51.458 | 88.521 / 88.802 |
| Key first | 32.989 / 33.079 | 78.225 / 78.460 | 50.755 / 50.895 | 90.493 / 90.779 |

The later per-body CPU values are JrtPath 7.100 -> 5.548 and 5.117 -> 3.455 us;
Key 11.377 -> 7.542 and 12.649 -> 8.813 us. Both families benefit in both pairs.
Key still exceeds the earlier notional five-us complete-producer target. Cold
JrtPath is 18.076 -> 27.481 us first and 11.978 -> 10.075 us second; cold Key is
24.797 -> 65.037 us second and 28.111 -> 41.421 us first. The adverse large Key
sample is retained, without attributing its physical cause to a specific cache
miss, page fault or fragment.

### Startup and outer boundary costs are not free

The existing enabled pilot reserves its arena before preparation. This source is
unchanged, but its retained samples include outliers in both images. Blob-allocation
and arena-initialization spans are distinct existing timers; add each once per VM,
not once per prepared method. The blob timer describes allocation of the enabled
interpreter blob, not an enabled-minus-disabled startup delta.

| Capture/order | Old blob + arena CPU | New blob + arena CPU | Old producer cohort + both startup spans CPU/wall | New producer cohort + both startup spans CPU/wall |
|---|---:|---:|---:|---:|
| Cold, path first | 2.834 + 19.509 | 3.736 + 19.789 | 65.216 / 64.047 | 116.043 / 114.992 |
| Cold, key first | 2.614 + 89.212 | 5.578 + 17.996 | 131.915 / 130.686 | 75.070 / 73.411 |
| Primed, path first | 2.554 + 19.389 | 3.886 + 249.821 | 73.309 / 72.120 | 342.228 / 341.042 |
| Primed, key first | 2.654 + 19.679 | 3.595 + 18.687 | 73.088 / 71.987 | 112.775 / 111.621 |

The two outliers are not discarded or credited as template-specific effects.
This accounting makes the net small-cohort result worse in three pairs; the
remaining pair is dominated by the control arena outlier, not proof of a cold
template win. These sums are selected nonoverlapping measured spans, not total
JVM startup.

Summed outer WhiteBox request CPU/wall, including conversion/counter/snapshot but
still excluding result-array allocation and startup, is old/new: cold path
46.549/45.209 -> 95.892/95.053; cold key 43.315/42.223 -> 54.481/53.591;
primed path 58.207/57.086 -> 96.323/95.093; primed key 57.385/56.315 ->
99.299/98.079 us. These are diagnostic harness costs, not an interpreter admission
path or application CPU reduction.

## Causal conclusion and remaining budget

The used fragment sizes are branch profiles 26+26, resume3 67, cold reference 85,
instanceof predicate 259 and checkcast plus type/null profile 371 bytes. They
total 834 bytes. Counting repeated uses, the copied work is about 434 bytes in
JrtPath and 1253 in Key, 1687/3129 emitted bytes across the two bodies. Thus the
prototype actually addresses a substantial common part of the previous expansion,
and its positive copy masks rule out a fallback-only explanation of the result.

The first use still executes the original MacroAssembler helper logic, plus
source CodeBuffer/relocation setup, nested resource cleanup, retention validation
and copying/fixups. Zeroing/touching fixed storage, first host code use and other
cache effects can also contribute. There is no inner clock in these samples to
assign the incremental first-use cost among those operations. The five-primer
differential of 42.542/45.236 us is a complete observed incremental cost, not an
exact isolated fragment-initialization timer.

Later code avoids repeated encoder expansion but still performs the bytecode
walk, operand/signature checks, uncopied per-op emission, label allocation/fixups,
return epilogues, configuration construction/comparison per fragment, copies,
patches and publication. In these release bodies there are 9/19 fragment calls
and 16/17 explicit copied external branch patches. It is incorrect to describe
the remaining 3.455–8.813 us as parsing alone, or as nmethod installation.

At the observed 5.387/5.498-us saving per pair, amortizing the measured incremental
five-primer cost would require about 7.90/8.23 later pairs. Rounded up, that is
five primers plus sixteen/eighteen real-method preparations, beyond this pilot's
sixteen slots. This is a conditional arithmetic estimate, not a prediction:
different methods have different helper mixes, and repeated preparation of an
already-published method does not reproduce fresh-method cost. No residency or
admission change is inferred from this limit.

The prototype establishes a useful later-preparation mechanism, while rejecting
the claim that precomputing alone makes the present cold producer cheap. Moving
the work to startup would move, not remove, its budget. A further design decision
must justify a fixed VM setup cost against actual distinct methods before normal
optimization, or reduce first-use helper work itself. Final-class specialization
can remove Key-specific generic work but is not an answer for JrtPath. No further
runtime variant, timing repetition or policy adjustment follows this report.

## Preservation, provenance and resource boundary

Release libjvm SHA-256:
`7691f6a764d027ad8d44114598e589a3d66e3766cfa73f0382035af7cdb40299`.
Fastdebug:
`62d04cc9ccd7f2ce88175fb0c03c3fe759223e37b85f703c526072066229e979`.
Both preserved df control images were hash-checked unchanged. Runtime code is
committed at `8455a6f2885`; this report changes no runtime source.

Private evidence is `/workspace/interpreter-frame-templates/`: independent review,
source/image manifests, all builds and failures, qualification, the fixed eight
captures, harness/command hashes, raw and paired ledgers. Earlier images, source
checkpoints and evidence are intact. No raw artifact was uploaded.

Builds were sequential with three workers and the landed synchronous logging
pattern. Full fastdebug linking had a sampled 368 MB free, above the owned
supervisor's 256-MiB stop floor; it did not trigger. The retained existing GCC
handshake warning workaround was applied only to that translation unit. Final
free space is about 1.05 GB, zombies remain 26, and no OOM or unowned-process kill
occurred. All build/test/measurement commands are complete and reaped. No further
build is needed for the reported candidate.

The pilot remains opt-in, explicitly prepared, category-1/forward-only, sixteen
unrecycled slices. No automatic admission, residency redesign, C1/C2 threshold,
default, public push/PR or CI action occurred. Application benefit, time-weighted
coverage and settled throughput remain unestablished.
