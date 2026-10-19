# Complete-image qualification: runtime 34e3d8f9

These measurements compare complete original `416d7db3` images with enabled and disabled controls from the same complete `916ba895` fork image. Production code and microbenchmarks are identical at `c73d3586`; its only additional change is a native test range guard. No patched-class control is used. Later dispatch changes require new measurements and are not qualified by these results.

Accepted coverage is **1,624 of 1,886 planned backend/tier/input triplets**: 4,872 control records and 48,720 raw samples. All three tiers completed on GCC serial, AVX2, native ARM64 NEON and native Windows MSVC. AVX-512 C2 completed; its interpreter and C1 groups account for the remaining 262 triplets.

Complete backend tables: [serial](serial.md), [AVX2](avx2.md), [NEON](neon.md), [MSVC](msvc.md).

| Backend / tier | Triplets | Higher enabled mean vs either control | Nonoverlap loss vs either control | Job |
|---|---:|---:|---:|---|
| avx512 / c2 | 124 | 35 | 9 | [117820226854](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39174300598/job/117820226854) |
| neon / c1 | 110 | 29 | 25 | [117847837167](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837167) |
| serial / c1 | 92 | 28 | 15 | [117847837127](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837127) |
| avx2 / c1 | 126 | 22 | 11 | [117847837039](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837039) |
| msvc / interpreter | 103 | 11 | 3 | [117847837243](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837243) |
| msvc / c2 | 149 | 70 | 42 | [117847837218](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837218) |
| msvc / c1 | 126 | 45 | 5 | [117847837223](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837223) |
| serial / interpreter | 103 | 19 | 4 | [117847837154](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837154) |
| neon / interpreter | 118 | 19 | 5 | [117847837281](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837281) |
| serial / c2 | 170 | 74 | 49 | [117847837156](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837156) |
| neon / c2 | 143 | 52 | 36 | [117847837245](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837245) |
| avx2 / c2 | 124 | 32 | 11 | [117847837116](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837116) |
| avx2 / interpreter | 136 | 17 | 5 | [117847837124](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837124) |

All **453 higher enabled means** remain in [LOSSES.md](LOSSES.md); [COMPARISONS.md](COMPARISONS.md) contains all accepted rows. Of these, 220 have nonoverlapping reported error intervals against at least one control. This is descriptive: it applies no multiple-comparison correction and does not establish causation. Overlapping intervals also remain visible.

The normalized JSON preserves all scores, reported errors, raw samples, JVM flags, complete-image hashes and original JSON filename/SHA-256 bindings. [The original JMH file collection](exact-jmh/README.md) preserves all 4,872 unchanged JSON files for these 1,624 accepted comparisons. Every file hash and archive path matches the normalized controls; scores, errors and all 48,720 samples agree exactly. Its index distinguishes accepted coverage from the remaining planned scope. Four export containers omit 36 ancillary hosted-path context lines; the original JMH bytes are untouched, and both container hashes are recorded. Saved-file export collects no new timings.

The required AVX2 C2 boundaries—Latin-1 count 257 at source lengths 288/289/290 and UTF-16 count 129 at 144/145/146—are included, alongside 64-code-unit, immediate, mixed, equality, serial and repeated-overlap fixtures. The dispatch fixes prompted by these results must pass matched controls on their own final source. Native ARM/MSVC measurements qualify the exact compiler/backend profiles in the receipts, rather than every supported CPU or compiler configuration.
