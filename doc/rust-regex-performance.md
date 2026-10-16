# Rust regex performance

Rust regex integrates a bounded native engine with `Pattern` and `Matcher`.
HotSpot supplies intrinsic entry points with JNI fallback. Unsupported syntax,
flags, input or exhausted native allocation selects Java. Public captures,
Unicode behavior, regions, resets, replacements, continuation and end flags
remain part of the compatibility contract.

Validated common grammars provide capture numbering and prepared traversal
without a second source parse. Reused preparations share the existing native
Regex, Cache and Captures pools. Managed literal/digit and bounded alternation
plans avoid native preparation when they can establish the complete result.
End flags either come from an exact plan or replay Java. The reset/reuse tests
exercise native-only sequences without querying replay-triggering flags;
separate fresh Patterns check end flags against the original Java constructor.

The compact fixed-count anchored path restores Java digit-atom progress and
capture publication. Failed searches defer immutable-input continuation work
until a subsequent operation needs it. Mutable inputs recover that state
immediately. This preserves state across `usePattern()` and `reset()`.

## Qualified source and controls

The completed broad qualification measures source `6f4a3e6f2f15`, compared with
original Java source `8d8d71a`, the disabled integration and preceding source
`0a185f7`. It contains 25,752 JMH records covering 3,266 cases, plus 18,708
fresh-process records. These counts do not qualify subsequent source changes.

Controls use the same executor, pinned CPU, VM and native library. Source
controls use the JDK build's compiler flags; the 75 selected class files were
verified byte-for-byte against the actual `java.base.jmod`. Warm measurements
use two alternating JVM pairs, two 200 ms warmups and three 200 ms measurements.
The complete evidence retains every case and control, individual JVM scores,
failed candidates and source/image hashes. Ratios of sample medians describe
these runs; they are not confidence bounds.

Interpreter, C1 level 1, C2 and intrinsic-disabled JNI configurations have
separate compilation/entry proofs. Normal tiered settings do not identify a
call's actual execution tier. Entry proofs establish that the routes work;
managed plans and Java replay mean every enabled operation need not call Rust.
Instrumentation is separate from timings. Benchmarks consume matching captures
and requested end flags, including Unicode and stateful Matcher operations.

All 108 fixed-count anchored C1 cases improve against `0a185f7`: median ratio
0.589 and worst ratio 0.850. They also beat original Java in these runs (worst
ratio 0.961). Interpreter, C2 and JNI-setting fixed-count anchors retain losses
in some cases. The complete all-case CSV is the source for aggregate results.

## Remaining integration costs

The broad qualification retains these losses against original Java:

| Workload | Actual configuration | Java | Integration |
| --- | --- | ---: | ---: |
| Uncaptured prefix, 17-character miss | Interpreter | 778 ns | 1,530 ns |
| Uncaptured prefix, 17-character miss | C1 level 1 | 33.4 ns | 60.4 ns |
| Fresh Pattern and one miss, 16 characters | C2 facade, cold lifetime | 52.1 us | 91.9 us |
| Unsupported lookahead, 4,096-character full hit | C2 | 7.43 us | 18.39 us |

The original slow JNI-setting digit-miss JVM remains in the evidence. A bounded
five-pair follow-up did not reproduce it; that does not establish its cause or
remove the original 2.209 ratio. Startup remains mixed across workloads and CDS
settings. No universal speed, total-memory or startup advantage is established.
Allocation measurements exclude retained native memory. Native AArch64
throughput remains unmeasured locally.

Release and fastdebug each passed 109 relevant regex/Scanner/String tests and
5,989 framework checks for `6f4a3e6f2f15`. Enabled RustRegexTest configurations
compare 395,451 results and public states; disabled compares 395,449.
Continuation configurations compare 307,812 states each. All 72 selected-image
GC/leaf latency workloads completed. Observed maxima were 26.643 ms reaching a
safepoint, 30.633 ms explicit GC wall time and 59.609 ms steady match call.
These are observations without paired Java GC controls, not bounds or relative
GC-latency improvements.

[CI run 38754442179](https://github.com/re-thc/openjdk-jdk27u/actions/runs/38754442179)
passed all 59 jobs for `6f4a3e6f2f15`. It tested merge
`f533820b7ee25ef17a0b0e91ab8c70c6791c1162` against base
`e206bae32b2a6cc1fa9464ad34d75f2df4b347e9`. The live base subsequently advanced;
that run does not qualify the advanced base or later source changes. The macOS
ClassLoaderValueTest passed in this run. The cause of the earlier intermittent
crash remains unresolved, and its failed evidence is retained.
