# Recorded measurements

These files preserve measured inputs, JVM arguments, artifact/source hashes,
confidence intervals and raw samples. Each dataset describes its own tested
revision; its validation metadata is a snapshot, not the current CI status.

## Complete-image qualification

The [current report](../BENCHMARKS.md) uses production revision `90e763c6758`
and complete source-built original/enabled/disabled JDK images. Enabled and
disabled use byte-identical distributions. Every dataset records image and
harness hashes, compiler settings, JVM arguments and raw JMH samples.

| Dataset | Coverage |
| --- | --- |
| [complete-image-results.json](complete-image-results.json) | 99 workloads, 1,818 measurements and 606 matched triplets; [all comparisons](COMPLETE_IMAGE_BENCHMARKS.md) |
| [mixed-fallback-results.json](mixed-fallback-results.json) | Five tiny/threshold/long mixed-coder inputs, 135 measurements and 45 triplets; [all comparisons](MIXED_FALLBACK_BENCHMARKS.md) |
| [mixed-prefix-results.json](mixed-prefix-results.json) | Five mixed immediate-match inputs at needle lengths 64/66/127/128/129, 135 measurements and 45 triplets; [all comparisons](MIXED_PREFIX_BENCHMARKS.md); the fallback dataset covers length 65 |
| [native-batch-results.json](native-batch-results.json) | Three AVX2 aligned-filter boundaries, 27 measurements and nine triplets; [all comparisons](NATIVE_BATCH_BENCHMARKS.md) |
| [complete-image-ci.json](complete-image-ci.json) | All 57 CI jobs passed on the measured production source, including release/debug builds and tier1 tests on all four platforms; native ARM/MSVC performance remains unmeasured |
| [complete-image-validation.json](complete-image-validation.json) | Final-source jtreg, fixture, forced-JNI and native sanitizer validation, with explicit qualification gaps |
| [Qualification candidates](complete-image-candidates/README.md) | Superseded complete-image snapshots, preserving every collected candidate loss |

## Historical measurements

These datasets retain their original controls and source revisions. In particular,
`final-results.json` and `dispatch-results.json` use patched-class original controls;
they are separate from the complete-image campaign above.

| Dataset | Comparison |
| --- | --- |
| [final-diagnostics.json](final-diagnostics.json) | Nine three-fork immediate-hit repeats, six final C2 equality traces with generated code, and nine rejected-probe candidate measurements; [method and results](FINAL_DIAGNOSTICS.md); primary losses retained |
| [c2-filter-results.json](c2-filter-results.json) | 36 C2 controls after filtering long UTF-16 Java fallback candidates; source/runtime hashes and slower means retained |
| [latin-window-results.json](latin-window-results.json) | 12 C1 controls for the final Latin-1 source-window probe and inline scalar fallback |
| [latin-peeled-results.json](latin-peeled-results.json) | 12 C1 controls for unconditional first-candidate peeling, including its short-input higher mean |
| [latin-inline-probe-results.json](latin-inline-probe-results.json) | 12 C1 controls for an inline probe after enable checking, including the immediate-match loss versus disabled |
| [latin-inline-results.json](latin-inline-results.json) | 36 controls with the original scalar fallback forced inline, including the immediate-match loss versus disabled |
| [latin-isolated-results.json](latin-isolated-results.json) | 36 controls with an outlined original scalar fallback, including the remaining tiny C1 loss |
| [latin-one-results.json](latin-one-results.json) | 36 controls for the rejected single-candidate fast path, which increased the tiny C1 cost |
| [latin-scalar-results.json](latin-scalar-results.json) | 36 controls with the probe after native eligibility, including the remaining tiny C1 loss |
| [c2-final-fallback-results.json](c2-final-fallback-results.json) | 90 C2 controls across AVX2 and serial after repairing long Latin-1 and 128-code-unit UTF-16 Java fallback candidates; all higher means retained |
| [vector-span-results.json](vector-span-results.json) | 114 focused AVX2/serial C2 controls after deriving long-needle span guards from the library’s 32-byte vector width; all higher means retained |
| [pre-vector-span-results.json](pre-vector-span-results.json) | Partial matrix at `13469e5`: all 851 complete measurements, including the AVX2 C2 serial-tail loss and the existing C2 equality loss |
| [pre-final-c2-results.json](pre-final-c2-results.json) | Partial matrix at `e4763a7`: all 846 completed measurements, including the remaining C2 Latin-1 long-overlap and UTF-16 128-code-unit overlap losses |
| [pre-c2-filter-results.json](pre-c2-filter-results.json) | Partial full matrix at `afa8c56`: 861 completed measurements, retaining C2 long-needle fallback, character-search and equality losses; character/equality traces use the existing JDK intrinsics |
| [inlining-controls-results.json](inlining-controls-results.json) | 63 C1/C2 controls at `afa8c56`, including serial/AVX2 thresholds and long-needle quick rejection; source/runtime hashes and all slower means retained |
| [c1-quick-reject-results.json](c1-quick-reject-results.json) | Twelve C1 quick-reject controls at `acf6885`, retaining the cost before the bounded trailing-character scan |
| [c1-tail-results.json](c1-tail-results.json) | Twelve controls after the bounded C1 trailing-character scan |
| [c1-tail-coverage-results.json](c1-tail-coverage-results.json) | 51 C1/C2 controls before the inlining repair, retaining the C2 threshold losses caused by the method-size limit |
| [c1-flow-results.json](c1-flow-results.json) | 18 focused measurements of the first control-flow candidate; forward-search overhead removed, reverse fallback losses retained |
| [c1-isolated-results.json](c1-isolated-results.json) | 21 measurements of the isolated C1 loop; remaining reverse-search losses retained |
| [c1-validated-results.json](c1-validated-results.json) | 21 measurements with the original argument layout and checks; remaining losses retained |
| [c1-filtered-results.json](c1-filtered-results.json) | 21 measurements of the C1 first-character filter candidate and forward control flow, with original/enabled/disabled controls |
| [pre-flow-results.json](pre-flow-results.json) | Partial matrix at `0915193`: all 577 complete measurements retained, including the C1 Java-fallback and short UTF-16 forward losses that motivated the final control-flow adjustment |
| [final-results.json](final-results.json) | Historical `a7607aa9`, patched-class original control: 99 workloads, 1,818 measurements across 606 matched triplets; AVX2 96, serial 63, AVX-512 43; [complete tables](FINAL_BENCHMARKS.md) |
| [final-preflight.json](final-preflight.json) | Pre-merge candidate `ff05d12`: 117 focused measurements across three tiers and three controls, including fixed immediate-match and tiny-input paths |
| [probe-c88-results.json](probe-c88-results.json) | Interrupted candidate `c88cf20`: all 92 completed measurements retained, including the tiny UTF-16 reverse-search loss from the ungated immediate-match probe |
| [probe-ungated-results.json](probe-ungated-results.json) | Intermediate uncommitted candidate based on `c88cf20`: all 59 completed measurements retained; the probe was still ungated. Source/runtime hashes were not captured for this partial run |
| [equality-audit.json](equality-audit.json) | 15 diagnostics on `ae6ea74`, with controlled array alignment and generated-code comparison; [method and results](EQUALITY_AUDIT.md) |
| [dispatch-results.json](dispatch-results.json) | Earlier code `ae6ea74`: 93 workloads and 1,692 measurements across 564 matched triplets; AVX2 90, serial 57, AVX-512 41; [complete tables](DISPATCH_BENCHMARKS.md) |
| [dispatch-repeat-results.json](dispatch-repeat-results.json) | Nine supplemental measurements of three residual-loss cases on the same earlier code; primary results retained unchanged |
| [dispatch-36359f3-results.json](dispatch-36359f3-results.json) | Intermediate dispatch at `36359f3`: 87 workloads and 1,557 matched measurements, including the minimal-overlap losses used to refine routing; [complete tables](DISPATCH_36359F3_BENCHMARKS.md) |
| [coverage-results.json](coverage-results.json) | Pre-dispatch coverage at `6f3f4d0`: 53 distinct workloads with enabled, disabled and original-Java controls across interpreter/C1/C2; AVX2 covers all 53, serial and AVX-512 each cover 16; [complete tables](COVERAGE_BENCHMARKS.md) |
| [long-needle-results.json](long-needle-results.json) | Earlier focused run: three UTF-16 reverse-search fixtures with AVX2 and AVX-512 across interpreter/C1/C2 and three controls |
| [bounded-results.json](bounded-results.json) | Historical 30-pair comparison of the bounded implementation with the preceding default-on revision; includes safepoint-response samples; [rendered tables](BOUNDED_BENCHMARKS.md) |
| [original-results.json](original-results.json) | 259 feature off/on pairs for the earlier implementation, plus original-Java and longer/layout controls; [rendered tables](ORIGINAL_BENCHMARKS.md) |

Machine-local paths in the records identify the measured artifacts. Reproduction
commands in the current report use `ORIGINAL_JDK`, `FORK_JDK` and `JMH_CLASSPATH`.
Historical methods describe their own artifacts and source revisions.
