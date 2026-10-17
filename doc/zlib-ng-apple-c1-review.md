# Apple C1 direct-buffer Adler candidate

This is a narrow source candidate, not a measured or qualified performance fix.
It applies directly to PR6 head `3f71d03f3297f94e8c2cc34160262a880be337fc`, verified
against the open PR when preparing this change. Only Apple AArch64 C1 calls to
`Adler32.updateByteBuffer` decline intrinsic inlining, at every length. They
follow the existing ordinary native invocation path and the same zlib-ng backend.
Public empty-buffer updates may return before that native entry, as before.

No M1 CRC selector/cutoff, global Apple PMULL default, interpreter/C2 selection,
x86 cutoff, native ABI signature, library, compression level or dependency pin
is changed. The earlier M1 qualification branch's production bundle is not
imported. The portability changes already present in this PR6 head are not
reapplied. The seven-line `c1_GraphBuilder.cpp` insertion is the complete
production-code delta; the remaining changes are two tests and documentation.

## Evidence motivating a conservative selection

Saved M1 qualification used HotSpot source
`890e4444722ac38d65602b2a83a16806938d898b`, run
[38482704292](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38482704292),
release job115601260230. C1 direct-Adler at4096bytes measured143.016ns selected
versus104.820ns same-image JNI in one order and114.836ns versus90.083ns in the
reversed order: approximately36% and27% higher selected means. These are saved
observations, not new timing or a calibrated causal attribution. The JNI control
also disabled ZIP/CRC intrinsics; an eventual Adler-only control should isolate
that difference. Both routes used the same runtime/backend, not stock vs ng.

Crucially, that M1 source **already selected JNI at4096**. A compiler-known large
constant simply declined intrinsification. A dynamic length built a small-leaf/
large-JNI split and merged state; the large arm was an ordinary native Invoke.
The source of the public benchmark suggests a dynamic length, but saved logs
contain no compilation graph, inlining capture, LIR, assembly or wrapper-address
proof. State invalidation/reloads, register allocation, code layout and the
split are plausible costs, not an established explanation of all25–38ns.

Current PR6 lacks that Apple4096split and those results do not measure its
selected path against JNI. This standalone candidate withdraws Apple C1 direct
intrinsification rather than importing that unqualified split or guessing a new
byte cutoff. It may lose small constant-length benefits. Neither the historical
means nor the source decision demonstrates parity or a speedup for this candidate.
The prior qualification swapped a rebuilt VM into a cached runtime and was not
a full JDK build at the measured source. It does not validate this changed head.

## Source correctness and ABI review

The rejection comes after `is_intrinsic_available` and before arguments are
popped or any intrinsic graph is appended. Returning false preserves the stack,
`ignore_return` behavior and the normal native-call fallback used when Adler
intrinsics are disabled. It does not call JNI recursively or execute the checksum
twice. `try_inline` cannot parse the private native method as Java; normal
invocation/native-wrapper generation follows. Constant and dynamic lengths have
the same decision, with no boundary arithmetic or per-call length branch added.

The native target is still `(int adler, long address, int offset, int length)`.
The ordinary wrapper handles JNI arguments, thread transitions, safepoints and
normal ABI register preservation; no hand-written call stub or clobber mask is
introduced. Public ByteBuffer session acquire/release, checksum storage and
position/limit updates remain in the Java method's existing try/finally path.
The direct allocation remains owned by Java. This source reasoning does not
substitute for release/fastdebug ABI tests or emitted-code verification.

## Regression source included

`TestC1DirectAdler32` supplies distinct literal native-length call sites at
0,1,15,16,31,32,63,64,65,255,256,257,1023,1024,1025,4095,4096,4097 and a shared
volatile-length site visiting mixed sizes. A final method handle invokes the
exact private intrinsic target; setting a public ByteBuffer limit to a literal
would not by itself ensure a constant native length. WhiteBox requests and
checks level1 compilation of the literal/variable/FP-live helpers with ordinary
background compilation disabled by `-Xbatch`. It tests intrinsics explicitly
enabled, enabled with checked JNI, and disabled with checked JNI, on x64/AArch64
so unrelated selection paths also retain semantic coverage. The enabled
checked-JNI case reaches the new Apple selection guard; a disabled-only case
returns at the earlier availability check and cannot cover that guard.

An independent per-byte modulo65521 reference validates offsets0/1/7/31,
nonzero/signed-jint seeds and incremental continuation. Static ownership and a
reachability fence keep the raw direct allocation alive. The FP-live helper
invokes the handle directly in its own body, rather than calling the deliberately
non-inlined `variable()` helper. This permits the checksum target to be inlined
in the same C1 compilation that holds the FP values. Their use after the handle
call is a semantic regression check, not proof of target inlining, a JNI/leaf
route, or use of any particular FP register. A level1 compilation assertion
establishes none of those properties. Code captures must confirm the inlining
chain to the checksum target, its emitted native call inside the FP helper, and
the live/spilled/rematerialized FP values. An outlined adapter or separate Java
checksum call is a remaining coverage gap, not a passed same-compilation ABI test.

`TestZlibNGAdler32` adds4095/4096/4097 and0/1/63/64/65 to the existing public
heap/direct,seeded,offset,GC and incremental matrix, adds read-only direct views,
checks both position and limit, and adds C1 checked-JNI coverage with Adler
intrinsics explicitly enabled and disabled.
The inherited interpreter/C2 cases and65535/65536/65537 large neighbors remain.
No runtime, test compilation, JDK build, benchmark or CI job was executed while
preparing this source-only change. The new tests are not reported as passed.

## Remaining validation, on the exact chosen source

1. Normal full release and fastdebug source builds of baseline PR6 and this
   candidate. Do not depend on a prebuilt-library handoff or swap just libjvm
   into a differently sourced cached image. Preserve compiler/SDK/flags and
   image/library identities. Keep the upstream/stock pins unchanged.
2. Run both added/extended tests and the ZIP intrinsic/ABI suite on native Apple
   AArch64; include the public checks under Serial/G1/Z with checked JNI. Retain
   interpreter/C2 results and x86/non-Apple AArch64 controls. No such execution
   is authorized merely by this source commit.
3. Capture C1 inlining/LIR/disassembly for the literal and volatile sites,
   `withFpPressure`, and public ByteBuffer callers. Establish the handle-to-target
   inlining chain and the checksum call inside the FP helper's own compilation;
   record any remaining adapter/Java call instead of assuming same-compilation
   coverage. Verify ordinary JNI targets, buffer lifetime, return width and FP
   liveness/preservation, including enabled checked-JNI configuration; distinguish
   constant public requests from proven constant native arguments. Do not claim
   the historical split caused the saved gap without captures from the measured
   source as well.
4. Separately review and authorize one fixed performance comparison of exact
   baseline/candidate and same-image Adler-only-disabled control. Include small
   constants/dynamic sites,4095/4096/4097,ordinary/long buffers,actual public
   ByteBuffer work and reversed orders. Keep all rows and declared gates;
   no retry-until-pass, gate relaxation or causal inference from means alone.
   The old27–36% observations and functional passes are not that qualification.

Any later integration must validate the actual final composition. Global Apple
PMULL policy and the other M1 production changes remain separately reviewed;
this commit must not be presented as bringing their qualification into PR6.
