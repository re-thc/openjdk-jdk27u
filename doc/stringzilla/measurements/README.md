# Measurement evidence

The current [benchmark report](../BENCHMARKS.md) identifies qualification sources,
complete original/enabled/disabled images, toolchains and coverage.

Recorded evidence preserves its source and measurement scope:

| Evidence | Scope |
| --- | --- |
| [ARM NEON/SVE component comparison](sve-4592230b/RESULTS.md) | Source `4592230b`: 74 native-only cases / 2,220 raw samples on SVE128; all higher means retained. This excludes JVM/Java dispatch and original-Java controls. |
| [Five-backend complete-image cohort](https://github.com/re-thc/openjdk-jdk27u/blob/31522deb18bcdc0edf9a1f9e34c8606580615709/doc/stringzilla/measurements/2550a210/README.md) | Runtime `2550a210`: 205 distinct inputs, 1,540 triplets / 4,620 records on serial, AVX2, AVX-512, native ARM64 and MSVC; full table, complete-image receipts and raw samples for all three controls |
| [Component qualification](https://github.com/re-thc/openjdk-jdk27u/blob/3953372a1d6556c2ea3617a9433feee4f1139bd2/doc/stringzilla/measurements/adbea61/README.md) | 769 triplets / 2,307 records on serial, AVX2, AVX-512, native ARM64 and MSVC; all original/enabled/disabled means, errors and raw samples |
| [Initial native qualification](https://github.com/re-thc/openjdk-jdk27u/blob/23801203d0374b27415af992cbd31382dae2ac2a/doc/stringzilla/measurements/native-image-candidates/DA3AE24_BENCHMARKS.md) | 405 matched triplets on four native backends, with [raw records](https://github.com/re-thc/openjdk-jdk27u/blob/23801203d0374b27415af992cbd31382dae2ac2a/doc/stringzilla/measurements/native-image-candidates/da3ae24-results.json) |
| [Previous complete-image report](https://github.com/re-thc/openjdk-jdk27u/blob/da3ae24b030d8c9c0694bbb5b33412f76c27780c/doc/stringzilla/BENCHMARKS.md) | The 99-workload x64 campaign and mixed fallback/prefix supplements, with build and test receipts |
| [Earlier campaign index](https://github.com/re-thc/openjdk-jdk27u/blob/da3ae24b030d8c9c0694bbb5b33412f76c27780c/doc/stringzilla/measurements/README.md) | Earlier candidate and patched-class experiments; their methods and limitations remain attached to those results |
| [Serial equality investigation](https://github.com/re-thc/openjdk-jdk27u/blob/404e6d0033b72513a8ebd0fad8e6be7de1ee71d6/doc/stringzilla/measurements/serial-equality-investigation/README.md) | GCC/Clang x64/ARM64 raw samples and assembly; the optional word-loop change was rejected because its gains did not hold across toolchains |

Historical results qualify their recorded revisions and image configurations.
The current report uses its own matched controls; speedups between two enabled
candidate revisions are not presented as gains over original Java.
