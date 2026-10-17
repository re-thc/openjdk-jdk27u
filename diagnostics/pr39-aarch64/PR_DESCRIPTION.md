Use bounded mismatch stubs for native segments and buffers on x86-64 and AArch64

Native, direct and mapped `MemorySegment` and NIO comparisons can use the
vectorized mismatch stub from C2 and the interpreter. AArch64 gains an Advanced
SIMD stub, enabled through interpreter, C1 and C2, including heap arrays that
previously used the Java loop.

Native C2 leaves are selected for 128 B through 64 KiB. On AArch64, heap calls
below 128 B retain Java. Guarded C2 loads check two heap words or sixteen
native/mixed words before stub entry. Heap vector work is capped at 2 KiB;
an equal prefix on a larger request calls the existing Java implementation
with all original arguments. Native/mixed calls retain their full guarded
stub range. C1 admits constant valid ranges of at most 64 KiB. Compiler ordering
barriers preserve plain heap access order around ambiguous unsafe prefix loads.

Scoped comparisons retain bounded chunks and Java safepoint polls. The
interpreter bounds leaf work, counts once, and defers profiling, safepoints
and JVMTI events to the ordinary entry. Mapped faults deliver `InternalError`;
NIO comparisons retain direct-buffer owners. Related changes fix empty x86
stub ranges, low-threshold segment reads and string terminator bounds.
CharBuffer views stage long string writes through a bounded array, and buffer
hashCode combines four elements with the specified result. There are no public
API changes or new production libraries. Legal notices and recovery ancestry
are retained.

**Native ARM performance qualification failed; this PR remains draft and is
not ready to merge.** [Run 39045104945](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39045104945)
built matched master/repaired-merge releases and candidate fastdebug on native
Neoverse-N2. All **38 targeted jtreg records** and **108 fresh-VM probes** passed
across selected Serial, G1, ZGC and interpreter/C1/C2 paths, including bounds,
mapped faults, polling, alias ordering, reachability, NIO/typed views, hashCode,
CharBuffer and interpreter events.

The stable 4 KiB native equality gate passed at 54–55% lower time in both
orders. Prior native/mixed prefix regressions and equal 64 KiB heap now pass.
The full fixed screen still found **25 regressions, 10 passes and no
inconclusive rows**, with all four controls passing. Short heap callers outline
public `Arrays.mismatch` where the baseline inlines Java, including cases that
return from the short Java fallback or scalar prefix before NEON. Larger heap
prefixes 25/82 also regress; both images already call different helper levels.
The **97 main performance rows did not run**, leaving their buffer, hashCode,
CharBuffer and C1/interpreter timing coverage incomplete. No samples or gates
were changed and no timing retry ran.

Actual timed C2 bytes, raw samples, compilation/GC caveats, exact source/machine
identities and the remaining code-generation blocker are retained in
`diagnostics/pr39-aarch64/RESULTS-39045104945.md` and its linked data. The NEON
body was not printed; no isolated stub cost or application/x86 speedup is
claimed. The baseline is actual master `89885a6`, versus repaired merge
`a7ca575` (tree `9587ce8f`), with repair parent `93926e`. Historical x86 results
against `e206bae32` remain separate.

A same-method store/compare test reproduced an alias-ordering wrong result in
our first repair `a5fbfd`, on native x86 including a VM with ARM compiler policy.
That was not an execution of original author `9fedf7a`. Corrected repair
`93926e` passes the local and native ARM store-ordering checks; exact source-hash
provenance is retained in `diagnostics/pr39-aarch64/REPAIR.md`.
[Author CI 39027042938](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39027042938)
passed 57/57 jobs at `9fedf7a`, including Linux/macOS ARM64 builds and tier1;
it predates this repair. Further heap work and reviewed native qualification
are required before merge.

---------
- [ ] I confirm that I make this contribution in accordance with the [OpenJDK Interim AI Policy](https://openjdk.org/legal/ai).
