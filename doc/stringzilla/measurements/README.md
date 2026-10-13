# Recorded measurements

These files preserve measured inputs, JVM arguments, artifact/source hashes,
confidence intervals and raw samples. Each dataset describes its own tested
revision; its validation metadata is a snapshot, not the current CI status.

| Dataset | Comparison |
| --- | --- |
| [coverage-results.json](coverage-results.json) | Final GCC 16 kernels: 53 distinct workloads with enabled, disabled and original-Java controls across interpreter/C1/C2; AVX2 covers all 53, serial and AVX-512 each cover 16; [complete tables](COVERAGE_BENCHMARKS.md) |
| [long-needle-results.json](long-needle-results.json) | Earlier focused final-code run: three UTF-16 reverse-search fixtures with AVX2 and AVX-512 across interpreter/C1/C2 and three controls |
| [bounded-results.json](bounded-results.json) | Historical 30-pair comparison of the bounded implementation with the preceding default-on revision; includes safepoint-response samples; [rendered tables](BOUNDED_BENCHMARKS.md) |
| [original-results.json](original-results.json) | 259 feature off/on pairs for the earlier implementation, plus original-Java and longer/layout controls; [rendered tables](ORIGINAL_BENCHMARKS.md) |

Machine-local paths in the records identify the measured artifacts. Reproduction
commands use `TEST_JDK`, `JMH_CLASSPATH` and the equivalent source revisions.
