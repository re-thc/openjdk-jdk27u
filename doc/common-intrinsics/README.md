# Interpreter and C1 common intrinsics

`UseCommonIntrinsics` enables shared intrinsics on x86-64 and AArch64.
Use `-XX:-UseCommonIntrinsics` to retain the existing interpreter and C1 paths.
C2 keeps its existing implementations.

The [applicability audit](applicability.csv) covers all 391 C2 dispatch IDs:
41 guarded leaf adapters, 40 direct integer operations, 101 existing C1
entries, 82 existing Java-body integrations, and the remaining exclusions or
operations that require separate lowering. Base64/Unicode, decimal conversion,
String search/equality, regex and ZIP/Adler32 remain within PRs #2–#6.
Object headers and field offsets follow the layouts provided by the base branch.

## Integration

The catalogues in `runtime/commonIntrinsics.hpp` define intrinsic IDs,
Java parameter slots and result types for both tiers.

- Scalar bit operations, min/max/abs, unsigned arithmetic, high multiplication
  and checked arithmetic share platform assembler. C1 allocates the required
  scratch registers and preserves inputs until their last use.
- Bulk BigInteger, AES/GCM/GHASH, digest, ChaCha20/Poly1305, P-256, Keccak,
  ML-KEM and ML-DSA operations reuse existing `StubRoutines` through C++ leaves.
- Array and String hashing use a portable polynomial kernel with Java overflow
  and element signedness. A force-inlined C1 helper keeps inputs below 32
  elements in Java and preserves loop safepoints above 65,536 elements.
- C1 BigInteger shift helpers keep loops below 32 iterations in Java. Larger
  inputs call the existing worker without recursively substituting the helper.

The interpreter calls a leaf with the original expression-stack arguments.
C1 constructs the same argument vector, including two-slot longs, and makes
one C ABI call. Generated-stub arguments are extended to machine width with
the appropriate signedness.

Leaves validate array types, ranges, receiver layouts, capacities and overlap
before obtaining raw addresses or writing. Receiver fields are resolved against
their declaring bootstrap class using allocation-free metadata decoding and
cached with acquire/release publication.
Array bases and field offsets use VM layout helpers.

Leaves allocate no objects or handles, raise no exceptions and never safepoint.
Work is bounded to 1,048,576 elements, 65,536 hash elements, 2,048 quadratic
arithmetic limbs or 512 Montgomery limbs. In-place shifts use only the safe
primitive-worker shapes: destination index 0 for left shift and 1 for right
shift. Other aliases retain Java traversal semantics. Parallel Keccak calls
with repeated state arrays also retain the sequential Java implementation.

## Fallback and availability

Guard failure returns a sentinel distinct from successful int/object/void
results. The interpreter resumes the original Java entry. C1 preserves the
invocation state and deoptimizes with forced reexecution. It materializes that
state before loading fixed registers or writing outgoing arguments. Guarded
method-handle targets are parsed as Java methods to retain a valid reexecution
point. A failed guard records the bytecode site in its actual Java scope,
including inlined methods and level-1 compilations. Subsequent C1 compilations
retain Java at that site while other guarded operations remain accelerated.

Existing intrinsic flags, CPU checks, JVMTI interpreter-only mode and safepoint
polling remain in force. Methods containing breakpoints use the ordinary
interpreter even when only JVMTI Breakpoint events are enabled.
Compiler stubs are generated during VM initialization when enabled interpreter
entries require them, including `-Xint`. Unused Base64 stubs and the x86 SIMD
sort library are skipped when compilation is disabled.
Interpreter entries check generator CPU predicates before stubs exist; C1
checks the generated stub slots. Unsupported backends retain Java directly.
AArch64 omits AES-ECB, P-256 multiplication/assignment and four-way Keccak
entries. Abstract multi-block digest lowering requires all five digest
backends. Pure-C1 builds can use scalar operations without C2 stubs.

## Validation

The jtreg suite covers independent arithmetic and shift oracles, unsigned
limbs, streaming digest offsets, evaluation order, method-handle reexecution,
recompilation feedback, CPU opt-outs, JVMTI events and intrinsic controls.
The [benchmark report](BENCHMARKS.md) records measurement scope and reproduction.

```sh
python3 make/scripts/check-common-intrinsics.py
make CONF=your-build test TEST='test/hotspot/jtreg/compiler/intrinsics/common'
```
