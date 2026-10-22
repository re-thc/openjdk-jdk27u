# StringZilla performance

[Complete-image results and raw measurements](https://github.com/re-thc/openjdk-jdk27u/blob/codex/stringzilla-final-artifacts/doc/stringzilla/dispatch-20261022/RESULTS.md)
record the measured source, SDK inventories, compiler and bootstrap identities,
actual native backends, JVM flags and retained losses. Earlier results keep their
original source identities.

Measurements use complete, unmodified SDK images: independent original OpenJDK
`416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`, current master, the preceding
candidate, the candidate enabled, and the same candidate disabled with
`-XX:-UseStringZillaIntrinsics`. The disabled candidate complements the
independent baselines.

All controls use the same benchmark classes, compiled once by the original JDK.
Reused SDKs require immutable artifact digests, complete file inventories, source
receipts and matched release settings, compiler and bootstrap identities.
Candidate SDKs are built normally with `make images`; no patched module,
class overlay or partial runtime is used.

The focused JMH protocol uses five balanced rotating rounds. Each control
occupies every position once. Each round uses one JVM fork per control,
three 300 ms warmup iterations and five 300 ms measurement iterations.
Processes run sequentially on one pinned CPU with Serial GC and CDS disabled.
Interpreter, C1 and C2 cases force their execution tier; backend probes check
the actual selected native implementation. Hardware exclusions are recorded.

Reports retain every round and sample, control medians and means, median paired
ratios and their full range. All measured losses remain visible; no noise
threshold discards a result. Native-only timings establish no Java speedup.

Separate whole-process comparisons use ordinary JVM defaults, including tiering,
CDS and G1, for startup, compilation of fixed source files and one fixed
source-indexing task. An untimed round precedes eight balanced measured rounds.
These workloads establish their own scope rather than general application gains.

Correctness checks cover Java semantics, physical bounds, overlaps, alignment,
builder capacity, forced JNI, opt-out and concurrent GC. Native sanitizer
results identify the tested backend and kernel source. They establish neither
whole-JDK sanitization nor performance.
