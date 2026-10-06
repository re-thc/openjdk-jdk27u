# Recorded measurements

These files preserve measured inputs, JVM arguments, artifact/source hashes,
confidence intervals and raw samples. Each dataset describes its own tested
revision; its validation metadata is a snapshot, not the current CI status.

| Dataset | Comparison |
| --- | --- |
| [bounded-results.json](bounded-results.json) | 30 pairs comparing the current runtime implementation with the preceding default-on revision; also contains safepoint-response samples and superseded experimental measurements |
| [original-results.json](original-results.json) | 259 feature off/on pairs for the earlier implementation, plus original-Java and longer/layout controls; [rendered tables](ORIGINAL_BENCHMARKS.md) |
| [mixed-needle-results.json](mixed-needle-results.json) | 12 pairs isolating the native mixed-coder stack-bound check |
| [rejected-word-prefix-results.json](rejected-word-prefix-results.json) | 40 measurements of an unmerged C1 word-prefix experiment; the recorded patch is not part of the implementation |

Machine-local paths in the records identify the measured artifacts. Reproduction
commands use `TEST_JDK`, `JMH_CLASSPATH` and the equivalent source revisions.
