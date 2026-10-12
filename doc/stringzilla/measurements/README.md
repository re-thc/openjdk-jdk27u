# Recorded measurements

These files preserve measured inputs, JVM arguments, artifact/source hashes,
confidence intervals and raw samples. Each dataset describes its own tested
revision; its validation metadata is a snapshot, not the current CI status.

| Dataset | Comparison |
| --- | --- |
| [long-needle-results.json](long-needle-results.json) | Final GCC 16 kernels: enabled, disabled and original-Java controls across interpreter/C1/C2 with AVX2 and AVX-512; [rendered tables](../BENCHMARKS.md) |
| [bounded-results.json](bounded-results.json) | Historical 30-pair comparison of the bounded implementation with the preceding default-on revision; includes safepoint-response samples; [rendered tables](BOUNDED_BENCHMARKS.md) |
| [original-results.json](original-results.json) | 259 feature off/on pairs for the earlier implementation, plus original-Java and longer/layout controls; [rendered tables](ORIGINAL_BENCHMARKS.md) |

Machine-local paths in the records identify the measured artifacts. Reproduction
commands use `TEST_JDK`, `JMH_CLASSPATH` and the equivalent source revisions.
