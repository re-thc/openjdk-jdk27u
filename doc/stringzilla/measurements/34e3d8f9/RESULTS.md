# Complete-image qualification: runtime 34e3d8f9

These measurements compare complete original `416d7db3` images with enabled and disabled controls from the same complete `916ba895` fork image. The production code and microbenchmarks are identical at PR head `c73d3586`; its only additional change is a native test range guard. No patched-class control is used.

Accepted coverage is **326 of 1,886 planned backend/tier/input triplets** (978 control records; 9,780 raw measurement samples). The remaining work is not included in any performance conclusion. The accepted cohorts include native ARM64 NEON and x86 serial controls; final MSVC and other tier results require their own accepted receipts.

| Backend / tier | Triplets | Higher enabled mean vs either control | Nonoverlap loss vs either control | Job |
|---|---:|---:|---:|---|
| avx512 / c2 | 124 | 35 | 9 | [117820226854](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39174300598/job/117820226854) |
| neon / c1 | 110 | 29 | 25 | [117847837167](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837167) |
| serial / c1 | 92 | 28 | 15 | [117847837127](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39182567318/job/117847837127) |

A higher mean is retained even when error intervals overlap. “Nonoverlap” means the enabled score minus its JMH-reported error exceeds at least one control's score plus its reported error. It is a descriptive check without multiple-comparison correction, not proof of causation or a campaign-wide significance test. [Every higher mean](LOSSES.md) and [all accepted comparisons](COMPARISONS.md) remain visible; the normalized JSON retains every score, error and raw sample, with the saved original JMH filename and SHA-256.

Examples below describe individual fixtures, not a general speedup claim. O/E compares original Java with enabled; disabled remains an independent control.

| Backend / tier | Case | Original ns/op | Enabled ns/op | Disabled ns/op | O/E | Nonoverlap loss |
|---|---|---:|---:|---:|---:|---|
| avx512 / c2 | overlap-min-latin | 106.544 ± 1.967 | 12.021 ± 0.221 | 111.228 ± 2.286 | 8.863× | no |
| avx512 / c2 | overlap-min-utf16 | 61.126 ± 2.602 | 9.041 ± 0.522 | 46.976 ± 1.883 | 6.761× | no |

The observed losses remain acceptance failures to investigate. In particular, UTF-16 reverse search with a 64-code-unit immediate match in serial C1 measured 104.401 ns/op versus 57.808 original and 60.632 disabled. These timings do not establish a library defect; source tracing reaches the native path through C1 bridges before an immediate-match probe on this backend. Candidate dispatch changes need new complete-image qualification.

[Protocol and frozen workload projections](protocol/README.md) · [Source/image equivalence](pr-source-binding.json) · [Complete-image preflight](complete-image-preflight.json)

The protocol uses two forks, three 500 ms warmups and five 500 ms measurements per fork, rotated original/enabled/disabled order, one selected CPU, Serial GC and disabled CDS. Original/enabled/disabled run on the same host. “Serial” identifies the library backend; inherited compiler settings can generate SIMD. Compilation witnesses are diagnostic evidence and are excluded from timing comparisons. Full machine code and host dumps remain in their authenticated workflow artifacts; only compact Java inlining summaries are published here.
