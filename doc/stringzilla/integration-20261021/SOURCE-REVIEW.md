# Source and integration review

Reviewed product: `b19af25c4ccac240e017ca15bfbfc955d4798aa4`.
PR63's original eight-commit history is retained. GitHub records PR63 as merged;
PR4 remains draft during combined-source qualification.

| Area | Checked invariant and evidence |
| --- | --- |
| Physical bounds | Deferred Latin-1 checks precede every unchecked word/native access. Earlier exits use checked byte loads. The short UTF-16 C1 helper performs its own complete physical-end checks; other tiers retain checks before unchecked access. Forced-tier stale-array tests pass. |
| Checked-word scan | The complete `[from,to)` interval is validated first, with at least eight bytes. Loads use long address arithmetic. Each masked-byte sum stays below 256, so predicates have no inter-byte carries. Endianness and search direction determine the first hit; reverse results remain exclusive. Tests exercise all 256 values in all eight lanes and five modes, with hit/miss warmup before forced compilation. |
| Predicate semantics | Trim accepts exactly bytes above 0x20. Latin-1 non-whitespace excludes 9–13 and 28–32; NEL and NBSP are non-whitespace. CR/LF detection is separate. Public all-byte and native sanitizer tests preserve these distinctions. |
| Native bounds and GC | Each native call remains at most 64 KiB. A word-probe miss leaves the original native interval unchanged. Larger scans use the existing Java window loop, including its safepoint opportunities. Bounds, exact window edges, CRLF crossing and concurrent-GC tests pass. |
| Cached scan target | System/native initialization publishes an immutable static kernel table. Release compare-and-exchange accepts repeated registration of the same table and rejects replacement. C1/C2 select the ready scan function at compilation; an early compilation retains the bootstrap wrapper. Repeated initialization after forced compilation is tested. |
| Serial and opt-out | A size check precedes the runtime feature read, preserving short-input initialization behavior. Unavailable scan backends use the full Java loop and avoid the 32-byte native continuation. The independent original remains a separate performance control. |
| Mixed-coder search | Haswell now uses the existing bounded JDK mixed-range intrinsic at 16–64 code units, matching its existing Skylake admission. Public tests cover all Latin-1 symbols, wide UTF-16 units, multiple alignments, true/near matches, compact headers, and forced AVX settings. The rejected custom widening verifier is absent. |
| Vendor/build | StringZilla remains pinned to 5.3.0 with the two existing overlap/MSVC bit-operation patches. All 28 upstream files and two patched files verify. The existing MSVC per-file HIGHEST setting remains; native receipts verify actual compiler commands. |

The local exact-head build passes 125 of 130 test descriptions, with five
platform requirement skips and no failure/error. This is a source review and
local validation record; platform CI and performance conclusions are reported
separately in RESULTS.md.

Exploratory raw studies A–E retain all 1,314 accepted JMH files and 3,942 samples.
Rejected changes include moving the scalar boundary from 32 to 64 bytes,
custom mixed-coder word widening, the larger whitespace frontend rewrite, and
new small UTF-16 comparators. They either moved the admission cost or created
measured losses. None is relabelled as final-product qualification.
