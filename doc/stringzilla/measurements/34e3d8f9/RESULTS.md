# Complete-image qualification: runtime 34e3d8f9

These measurements compare complete original `416d7db3` images with enabled and disabled controls from the same complete `916ba895` fork image. Production code and microbenchmarks are identical at `c73d3586`; its only additional change is a native test range guard. No patched-class control is used. Later PR dispatch corrections require their own qualification and are not claimed as measurements of this source.

Accepted coverage is **933 of 1,886 planned backend/tier/input triplets** (2,799 control records; 27,990 raw measurement samples). The remaining work contributes no performance conclusion. MSVC has completed all three tiers: [all 378 comparisons](msvc.md). Native ARM64 NEON has accepted C1 results; its other tiers require separate receipts.

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

A higher mean is retained even when error intervals overlap. “Nonoverlap” means the enabled score minus its JMH-reported error exceeds at least one control's score plus its reported error. This is descriptive and does not apply a multiple-comparison correction or establish causation. [Every higher mean](LOSSES.md) and [all accepted comparisons](COMPARISONS.md) remain visible. The normalized JSON retains every score, error and raw sample, plus the saved original JMH filename and SHA-256.

Examples describe individual fixtures, not a general speedup claim. O/E compares original Java with enabled; disabled remains an independent control. The loss below remains an acceptance failure to resolve.

| Backend / tier | Case | Original ns/op | Enabled ns/op | Disabled ns/op | O/E | Nonoverlap loss |
|---|---|---:|---:|---:|---:|---|
| avx512 / c2 | overlap-min-latin | 106.544 ± 1.967 | 12.021 ± 0.221 | 111.228 ± 2.286 | 8.863× | no |
| neon / c1 | bulk-utf16 | 2528.659 ± 10.611 | 645.294 ± 2.215 | 2427.072 ± 2.589 | 3.919× | no |
| serial / c1 | utf16-end-64 | 57.808 ± 0.335 | 104.401 ± 0.301 | 60.632 ± 4.686 | 0.554× | yes |
| msvc / interpreter | equal-latin1-4096 | 61652.014 ± 10258.129 | 360.282 ± 14.660 | 76873.722 ± 3896.825 | 171.122× | no |
| msvc / interpreter | bulk-latin1 | 50655.974 ± 6324.716 | 2181.473 ± 71.706 | 52076.405 ± 9106.245 | 23.221× | no |

[Protocol and frozen projections](protocol/README.md) · [Source/image equivalence](pr-source-binding.json) · [Complete-image preflight](complete-image-preflight.json)

Two forks, three 500 ms warmups and five 500 ms measurements per fork run in rotated original/enabled/disabled order, on one selected CPU with Serial GC and disabled CDS. All three controls use the same host. “Serial” identifies the library backend; inherited compiler settings can generate SIMD. Compilation witnesses are diagnostic evidence and are excluded from timing comparisons. Full machine code and host dumps remain in authenticated workflow artifacts; published excerpts contain only compact Java inlining summaries.
