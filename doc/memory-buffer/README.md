# Memory and buffer mismatch

C2's `ArraysSupport.vectorizedMismatch` previously accepted only proven array
bases. Memory segments and NIO direct/mapped buffers use a null base with a native
address, so those calls retained the Java word loop. C1 already called the x86
stub for native inputs, but a truncated mapping could crash inside that stub.

This change reuses the existing x86 mismatch kernel for bounded C2 native and
mixed inputs and registers its mapped-memory fault continuation. It adds no
library, JNI adapter, FFM production call or new scan kernel.

## Selection and ownership

- C2 accepts proven arrays or null native bases. Newly selected native calls
  cover **1 byte through 64 KiB** with a constant element scale from 0 to 3.
  Empty and larger native ranges retain the Java implementation at this
  primitive boundary.
- `ScopedMemoryAccess` splits larger native/mixed public operations into 64 KiB
  chunks. The Java backedge permits safepoints between calls. Heap-only calls
  retain their existing dispatch. Offsets/results stay in element units.
- Inlining the segment bulk helper retains the base type information needed by
  the existing intrinsic, including heap segments. This helper also uses
  64 KiB chunks so newly accelerated heap segments retain polling between calls.
- Large NIO comparisons retain ordinary direct-buffer owners through fences;
  these buffers have no segment session. Segment session checks, scoped stack
  metadata and session fences remain in the existing wrapper.
- The x86 stub registers a protected PC interval and an error continuation,
  including when loaded from an AOT code cache. A fault returns a valid index
  while the VM delivers its asynchronous `InternalError`. Java-state signal
  handling recognizes registered unsafe PCs directly. VM/native-state unsafe
  handling keeps its existing flag checks. Normal kernel instructions do not
  acquire extra thread-flag stores.
- Existing VM capability controls determine ISA selection. AArch64 and other
  ports without this mismatch intrinsic retain their Java implementation.

The existing opt-out also selects the Java path:

```sh
java -XX:+UnlockDiagnosticVMOptions -XX:-UseVectorizedMismatchIntrinsic ...
```

Short-input, first-element, array partial-inlining, typed byte-order and floating
point checks remain at their existing API boundaries. No universal zero-overhead
claim is made; measurements include dispatch, checks and ownership costs.

## Shared paths and distinct contracts

| Operations | Implementation | Contract boundary |
| --- | --- | --- |
| `MemorySegment.mismatch`, static range mismatch | [SegmentBulkOperations](../../src/java.base/share/classes/jdk/internal/foreign/SegmentBulkOperations.java) | Byte offsets, proper prefixes, segment bounds and sessions |
| NIO `mismatch`, `equals`, `compareTo` | [X-Buffer template](../../src/java.base/share/classes/java/nio/X-Buffer.java.template) -> [BufferMismatch](../../src/java.base/share/classes/java/nio/BufferMismatch.java) | Remaining regions and positions/limits; comparison uses Java element order |
| Char/short/int/long/float/double views | `BufferMismatch` | Opposite orders use logical loads; NaNs and signed zero use NIO semantics; `StringCharBuffer` is not addressable |
| Common mismatch primitive | [ScopedMemoryAccess template](../../src/java.base/share/classes/jdk/internal/misc/X-ScopedMemoryAccess.java.template) -> [ArraysSupport](../../src/java.base/share/classes/jdk/internal/util/ArraysSupport.java) | State checks and fences precede raw access; primitive returns an index or complemented tail |
| x86 C1/C2 | [C1 generator](../../src/hotspot/cpu/x86/c1_LIRGenerator_x86.cpp), [C2 library calls](../../src/hotspot/share/opto/library_call.cpp), [stub generator](../../src/hotspot/cpu/x86/stubGenerator_x86_64.cpp) | Existing ISA dispatch and array intrinsics; bounded native selection |
| AArch64 mismatch | [VM capabilities](../../src/hotspot/cpu/aarch64/vm_version_aarch64.cpp) | Intrinsic is unavailable; Java fallback remains supported |
| Segment copy/copyFrom/toArray, NIO bulk get/put and direct compact | `ScopedMemoryAccess.copyMemory` -> [Unsafe](../../src/java.base/share/classes/jdk/internal/misc/Unsafe.java) -> [native copy](../../src/hotspot/share/prims/unsafe.cpp) | Existing atomic conjoint/memmove kernels; checks, positions and ownership are preserved |
| Heap compact and heap-array bulk transfer | Generated heap buffer classes -> `System.arraycopy` | Existing overlap and GC semantics |
| Segment fill | `SegmentBulkOperations` -> `ScopedMemoryAccess.setMemory` -> Unsafe | Short Java stores and existing native atomic fill |
| Typed byte-swapped transfer | `ScopedMemoryAccess.copySwapMemory` -> Unsafe -> `Copy::conjoint_swap` | Element layout/order/alignment and overlap remain distinct from byte copying |
| NUL strings | [StringSupport](../../src/java.base/share/classes/jdk/internal/foreign/StringSupport.java) -> copy/decode | Byte/short/int terminators; full API includes allocation, decoding and no-match exceptions |
| Explicit-length strings and string writes | `StringSupport.readBytes`, `copyBytes`, `copyToSegmentRaw` | Exact lengths, compatible String storage, charset conversion and terminating writes |
| Charset conversion on buffers | [UTF_8](../../src/java.base/share/classes/sun/nio/cs/UTF_8.java) and related charsets | Array/direct loops have separate malformed, overflow and position rules |
| `CharBuffer.toString` | Generated heap/direct/byte-view templates | Heap String construction or char-array materialization through bulk get |
| Buffer hashing | `X-Buffer` reverse element loop | Specified signed-element polynomial; segment region identity and unrelated native hashes cannot replace it |

Copy/fill already reach maintained native kernels in early tiers. Interpreter
mismatch and direct charset conversion still have measured deficits. The latter
would require a compatible direct-input integration at the simdutf boundary;
this PR does not duplicate the implementation owned by PR #2. StringZilla PR #4
and zlib-ng PR #6 retain their source ownership as well.

## Measurements and tests

[Measurements and reproduction](BENCHMARKS.md) distinguish the executed broad
survey, independent forked qualification, library comparators, allocation,
first-use/setup/cleanup, footprint and startup. Individual losses remain in the
raw evidence. ARM throughput is not inferred from cross builds or emulation.

The regression tests cover native/heap/mixed/mapped inputs, size and alignment
boundaries, aliases, read-only views, data outside logical bounds, element order,
NaNs/signed zero, positions/limits, scope closure/confinement, GC while chunking,
and mapped-file truncation. Compiler tests check the native leaf bound and
Java fallback. Existing foreign, NIO, unsafe and intrinsic tests provide broader
copy/fill/overlap and fault coverage.
