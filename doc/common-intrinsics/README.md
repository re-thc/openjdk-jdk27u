# Common interpreter and C1 intrinsics

`UseCommonIntrinsics` is a product flag, enabled by default on x86-64 and
AArch64. Disable it with `-XX:-UseCommonIntrinsics`. Other architectures retain
their existing paths. C2 retains its original intrinsic implementations.

This change shares **41 guarded bulk kernels and 40 direct integer operations**
between the template interpreter and C1. It does not port every C2 operation:
the complete [applicability audit](applicability.csv) records the remaining
63 cases needing dedicated lowering, 27 Vector API/compiler IR cases and 14 VM
protocol cases. They retain their original implementations. Native ARM64
performance and full tier1/tier2 qualification remain outstanding.

## Open PR and existing-intrinsic exclusions

The feature boundaries of open PRs #2–#8 determine the exclusions:

| PR | Functionality retained in that PR |
| --- | --- |
| [#2](https://github.com/re-thc/openjdk-jdk27u/pull/2) | Base64, ASCII/Latin-1/Unicode validation/conversion, UTF-16 copying and code-point counting |
| [#3](https://github.com/re-thc/openjdk-jdk27u/pull/3) | Decimal parsing/formatting and their String/number/formatting consumers |
| [#4](https://github.com/re-thc/openjdk-jdk27u/pull/4) | String search and equality, including builder/buffer consumers |
| [#5](https://github.com/re-thc/openjdk-jdk27u/pull/5) | Regex matching |
| [#6](https://github.com/re-thc/openjdk-jdk27u/pull/6) | ZIP native calls and bulk Adler32 |
| [#7](https://github.com/re-thc/openjdk-jdk27u/pull/7) | Build/CI profile changes |
| [#8](https://github.com/re-thc/openjdk-jdk27u/pull/8) | Object-header and GC layout changes |

No Base64 or Adler32 entry is added here. Existing interpreter/C1 intrinsics
are retained. Same-coder String comparison and byte/char array equality already
use `ArraysSupport.mismatch`; Unsafe ordering/masked-CAS wrappers and small
bit-conversion wrappers already reach existing C1 intrinsics. The audit records
101 existing C1 entries and 82 existing Java-body integrations rather than
adding duplicate replacements. Presence in C1's catalogue remains subject to
its existing architecture and flag checks.

The inventory comes from every dispatch case in `LibraryCallKit::try_to_inline`
(391 IDs at the base revision), checked against the implementation catalogue.
Recheck coverage and exclusions after changing the catalogue:

```sh
python3 make/scripts/check-common-intrinsics.py
```

## Implementation

The three catalogues in `runtime/commonIntrinsics.hpp` define parameter slots,
return types and the interpreter/C1 operation set together.

* Integer leading/trailing zero count, population count, bit/byte reversal,
  abs/min/max, unsigned comparison/division/remainder, high multiplication and
  checked arithmetic use shared platform assembler. C1 allocates only the
  temporaries required by each operation. These paths do not call C++.
* BigInteger multiply/square/multiply-add/Montgomery/shift workers, AES modes,
  GCM/GHASH, digest compression, ChaCha20/Poly1305, P-256 integer polynomials,
  Keccak, ML-KEM and ML-DSA workers reuse existing C2 `StubRoutines` through
  checked C++ leaves. No new vendor dependency or ISA backend is introduced.
* Primitive-array/String hashing uses a portable four-lane polynomial kernel
  with Java's modulo-2^32 arithmetic and signed/unsigned element semantics.
  C1 force-inlines a Java helper so arrays shorter than 32 elements avoid a
  native call, and arrays larger than 65,536 retain Java loop safepoints.
  The leaf alias inherits `DisableIntrinsic`/`ControlIntrinsic` settings for
  the original hash intrinsic. C2 continues to use the original entry.

Bulk arguments use the interpreter expression-stack order, including two-slot
longs. C1 constructs the same small stack argument vector and makes one C ABI
leaf call. The interpreter avoids a Java frame on successful calls; ARM saves
its link register without constructing a fake interpreter frame. Both entries
check the JVMTI interpreter-only mode and poll for safepoints before execution.

Every bulk leaf checks primitive array types, bounds, layout, receiver state,
output capacity and relevant overlap constraints before obtaining raw element
addresses or writing. Receiver fields are resolved against their declaring
bootstrap class and cached with acquire/release publication; subclasses cannot
redirect access by shadowing fields. Array bases and field offsets use VM
layout helpers, so the integration does not assume PR #8's header layout.

Leaves allocate no handles or objects, raise no exceptions and never safepoint.
Variable bulk inputs are capped at 1,048,576 elements, including GCM's 1 MiB
chunks. Hashing is capped at 65,536 elements, multiply/square at 2,048 limbs
and Montgomery operations at 512 limbs to bound time without a safepoint.
Larger or rejected inputs use Java. In-place BigInteger shifts use the stub
for the Java primitive workers' safe shapes: left shift at destination index 0
and right shift at index 1. Other aliases retain Java traversal semantics;
multiply-add still requires distinct input and output arrays.
Successful bulk results are int/object/void, allowing a distinct `min_jlong`
fallback sentinel. Scalar long results can use every bit pattern and do not
use this sentinel.

The interpreter branches to the original Java entry on guard failure. C1
preserves full invocation state and deoptimizes with forced reexecution;
exceptions and locks are then handled by Java. After the first predicate
failure, the root method's trap history makes subsequent C1 compilations
retain Java implementations for its guarded common operations, including
inlined callees. This conservative policy prevents repeated input-dependent
deoptimization at C1 levels 1 and 3. Direct operations without a fallback
remain eligible. Exact arithmetic and unsigned division use this mechanism
for overflow and zero divisors. Guarded method-handle
targets are parsed as Java methods so a fallback cannot resume a `linkTo*`
adapter after its MemberName argument was removed.

Existing per-operation flags and CPU availability remain in force. Compiler
stubs are generated during VM initialization when the bulk interpreter path
needs them, including `-Xint`. This overrides delayed compiler-stub generation
for the enabled feature; disabling it restores the existing startup path.
C1 declines bulk intrinsics when their backend stub is absent and asserts
that contract during lowering. AArch64 omits interpreter entries for AES-ECB,
P-256 integer polynomial multiplication/assignment and four-way Keccak, whose
stub generators are absent. Its Java ECB loop still uses the accelerated AES
block entry. The abstract multi-block digest entry requires all five digest
algorithms to be enabled; C1 also requires all five backend stubs. A partially
covered digest family uses Java dispatch and eligible per-algorithm entries.
Optional parallel Keccak availability depends on the platform backend.
Pure C1 builds can use the direct scalar operations without requiring C2 stubs;
that build configuration has not been qualified here.

## Validation and performance

[Measured results and reproduction](BENCHMARKS.md) contain the full table,
raw JMH samples and validation commands. The new jtreg directory covers public
API differential results, independent scalar/arithmetic and in-place shift
oracles, C1 caller-state restoration, guarded method handles, recompilation
feedback, CPU instruction opt-outs, JVMTI method-entry events and intrinsic
availability controls. The catalogue checker also verifies that every shared
entry is non-native.

This is a bounded qualification, not a universal no-regression guarantee.
Allocating, native VM-service, floating-point and compiler-IR entries listed
in the audit still need separate work; the shared leaf ABI does not substitute
for their GC, exception or compiler semantics.
