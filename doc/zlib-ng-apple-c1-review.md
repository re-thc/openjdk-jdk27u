# Apple C1 direct-buffer Adler selection and qualification

Apple AArch64 C1 declines intrinsification of `Adler32.updateByteBuffer` at all
lengths. This selects the **default native invocation path**, not necessarily
JNI. The backend, native signature, public API and dependency pins are unchanged.
No Apple PMULL default, CRC selector/cutoff or already-merged portability change
is imported. Public empty-buffer updates can still return before a native call.

## Three different call paths

Keep these arms separate in code analysis and any future performance design:

1. Baseline C1 intrinsifies Adler and emits its leaf call inside the compilation.
2. With the candidate and Adler intrinsics enabled, the observed default path
   is c2i adapter -> interpreter `Adler32.updateByteBuffer` entry -> leaf
   `ZIP_Adler32` -> zlib-ng. It is **not true JNI**.
3. `-XX:-UseAdler32Intrinsics` selects the actual JNI function. Disabling ZIP
   intrinsics alone is not an Adler route selection.

Harry's native Apple M6 arm64 report for baseline `3f71d03f329` and candidate
`5944fe1cb7f` confirms paths1/2 in complete release and fastdebug builds with the
same Xcode27.1 SDK, Boot JDK and configure-dev settings. It reports20baseline
C1 intrinsifications and20candidate declines (`native method`) in each build.
LLDB recorded zero hits in the JNI function for the default candidate path;
only the Adler-intrinsics-disabled arm used actual JNI. A compiler decline or
`native method` log line alone cannot identify the eventual interpreter entry
or JNI function. No new handwritten ABI wrapper or clobber mask is introduced.

## Correctness already reported, and its exact limit

Harry reports candidate test sources on all four full images passing the
3runlines of `TestC1DirectAdler32` and6runlines of `TestZlibNGAdler32` under
G1,Serial and ZGC, plus18additional candidate runs. The ZIP suite reports11passes
and3x86-AVX skips. No capture flags contaminated that correctness matrix and no
performance run was performed. These are owner-reported results from
`/Users/rethcmm/gh/adler-c1-qual-v1/REPORT.md` and `capture/`; the integrating agent
has not accessed that Mac path or independently inspected its files. There is
no request to rerun the passed matrix or upload binaries.

The same report identifies a real test limit: all20handle-based sites retain
`MethodHandle.linkToStatic`. Their level1 compilation assertions do not prove
a direct native invocation in the compilation holding the FP values. The
reported12live doubles spill/reload in both builds and the semantic assertions
pass, but that does not turn those handle sites into a direct-call regression.
They remain useful small/boundary,seed,offset,incremental and FP semantic tests.
Default-policy public ByteBuffer/GC/read-only/position/limit tests are preserved.

## Direct-call regression added separately

`TestC1DirectAdler32CallShape` invokes the public `Adler32.update(ByteBuffer)`
from `checksumWithFp`, which loads12FP values before the checksum and consumes
them afterward. It uses no method handles. Its Apple-only call-shape configuration
explicitly sets C1MaxInlineSize300,C1InlineStackLimit100 and forces the public
wrapper inline, as distinct from the unchanged default-policy controls. These
are correctness/call-shape settings, not a new product default or performance arm.
Both Adler-enabled and true-JNI-disabled controls use checked JNI.

The driver reads LogCompilation and requires successful C1 level1 code for
that FP root, an inlined public-wrapper parse inside that compilation, and its
**direct invokestatic** `updateByteBuffer` declined as `native method`. Missing
compilation, failed compilation, an intrinsified target, an outlined wrapper
or a method-handle adapter path fails. Parser fixtures exercise valid and invalid
records separately on all platforms. The enabled Apple case is intended to fail
on the baseline C1 intrinsic and protect the candidate selection, rather than
accepting both simply because checksums match.

This establishes the compiler's parsed direct-call shape; it does not by itself
prove a machine-level address, interpreter-entry/JNI route, particular FP
register, or spill/reload sequence. Actual code/relocation/call captures remain
necessary for those properties. The owner observed a direct invokestatic with
live FP only in a capture-only public-wrapper driver using the stated enlarged
inlining limits. That result is not silently relabelled as default-policy test
coverage or as execution of this newly added regression test.

## Local validation of the new test

The available Linux JDK27 compiled all three test classes. The positive/negative
parser fixtures and both Adler-enabled/disabled checked-JNI public-call-shape
children passed locally, including analysis of their actual compilation logs.
These were correctness/log-parser checks, not timing or product-image builds.
They validate test plumbing on that existing JDK, not the Apple CPU guard,
Mac call routes or a baseline/candidate performance comparison. The Apple-only
regression and ordinary product CI outcomes remain distinct.

## Historical timing remains unqualified

Saved M1 source `890e4444722ac38d65602b2a83a16806938d898b`, run
[38482704292](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38482704292),
release job115601260230, measured C1 direct-Adler4096byte selected/JNI-control
means143.016/104.820ns and114.836/90.083ns in reversed orders: approximately36%
and27% higher selected means. No new timing is reported here.

That M1 source already declined the C1 intrinsic on its dynamic >=4096arm.
Calling that source arm “JNI” did not establish its actual downstream call path,
nor that it equalled either the present candidate's interpreter-entry path or
true JNI. It cannot be used as a two-arm premise for this candidate. The saved
control also disabled ZIP/CRC intrinsics. The historical graph-overhead hypothesis
is unproved without captures from that measured source and does not explain the
whole25–38ns gap by assertion. Neither the old measurements nor the new correctness
matrix proves this selection faster or equivalent at any size. Small constant
benefits and ordinary/long costs still need an explicit performance decision.

## Remaining qualification and decision

- Run the **new** direct-call regression in ordinary CI/native Apple testing;
  retain existing passed correctness as evidence instead of requesting its
  matrix again. Locally applicable parser/compilation checks are recorded by
  the integrating commit's validation report, not claimed as native Mac results.
- For any missing machine-level proof, first read the existing Mac report,
  capture-only driver/source, exact commands and relevant capture excerpts.
  Do not ask for binaries, timing or a passed-matrix rerun. LLVM hsdis was
  cross-checked with relocations in the supplied report; that limitation remains.
- Unrun items remain x86/non-Apple AArch64 runtime controls,-Xcomp,GC variation
  in captures and buffer-free race coverage. Existing default-policy controls
  are not replaced by the enlarged-inlining call-shape configuration.
- PERF-PLAN.md exists on the Mac but has not been read by the integrating agent.
  No timing approval is inferred. A prospective performance review must distinguish
  inline leaf,interpreter entry and true JNI, with exact source/image/flags,
  small/boundary/ordinary/long inputs, fixed orders/gates and no retry-until-pass.
- Final integration accepts the demonstrated correctness scope and route evidence
  honestly, waits for new-test/ordinary-CI outcomes, and withholds performance
  claims until the separate plan is reviewed and authorized. PMULL/CRC policy
  remains separate. No whole-PR or cross-platform qualification follows merely
  from the owner-reported Mac matrix.

## Read-existing-files-only follow-up for the Mac agent

Read `/Users/rethcmm/gh/adler-c1-qual-v1/REPORT.md` and `PERF-PLAN.md`, then list
and read only the existing capture driver/source, exact command records and
relevant excerpts under `capture/`. Return the source/commands using
C1MaxInlineSize300/C1InlineStackLimit100, the direct-invokestatic/FP-root capture
and its method/compile identifiers, the evidence distinguishing inline leaf,
c2i/interpreter entry and true JNI (including the LLDB hit counts), and the
existing performance plan's exact arms, budgets and approval assumptions.
Identify what is absent rather than generating it. Do not execute a JVM, build,
benchmark, probe or new capture, rerun correctness, alter files, or upload binaries.
This request is analysis of retained files, not timing approval.
