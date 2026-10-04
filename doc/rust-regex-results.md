# Rust regex validation and measured results

Measurements were collected on 2026-10-04 from the packaged Linux x86_64
release image built from this change. CPU: Intel Xeon Platinum 8573C; container
CPU quota: four cores. The tested JDK reports `27.0.2-internal`, built with
GCC 14.2.0 and Rust 1.99.0. The Rust target is baseline x86_64, with upstream
SIMD runtime dispatch; no `target-cpu=native` is used.

JMH 1.37 ran one thread, three independent forks, three 500 ms warmups and
five 500 ms measurement iterations per fork. Entries are mean **ns/op ± the
JMH 99.9% confidence half-width**. Ratios are point estimates. This is a cloud
machine, so the raw variation and confidence intervals matter.

## Long unsuccessful searches

The expression is `error[0-9]+`; the input is `"x "` repeated to the specified
length. The same Pattern, Matcher and String are reused. Setup performs 16
unsuccessful searches to amortize compilation outside the timed region. All
variants use the same patched JDK: the Java column disables `UseRustRegex`;
JNI enables it and disables `UseRustRegexIntrinsics`; the intrinsic column
enables both. These measure the complete `Matcher.reset().find()` operation.

| Tier | Input bytes | Java ns/op | JNI ns/op | Intrinsic ns/op | Java / intrinsic |
| --- | ---: | ---: | ---: | ---: | ---: |
| interpreter | 4,096 | 200,970.3 ± 63,984.9 | 1,053.9 ± 58.3 | 1,182.5 ± 227.7 | 170.0× |
| interpreter | 32,768 | 1,147,162.3 ± 96,944.4 | 2,405.3 ± 87.2 | 2,698.0 ± 420.8 | 425.2× |
| C1 | 4,096 | 7,507.7 ± 285.6 | 194.4 ± 10.1 | 175.8 ± 3.3 | 42.7× |
| C1 | 32,768 | 61,826.6 ± 9,853.8 | 1,222.9 ± 61.6 | 1,392.6 ± 309.8 | 44.4× |
| C2 | 4,096 | 7,129.6 ± 113.6 | 199.0 ± 15.8 | 183.4 ± 22.9 | 38.9× |
| C2 | 32,768 | 58,161.8 ± 7,362.0 | 1,133.4 ± 66.4 | 1,106.3 ± 62.9 | 52.6× |

The engine improves this workload in every tier. JNI and intrinsic confidence
intervals overlap in several cases; these measurements do not establish that
the direct leaf path is faster than JNI at every size or tier.

## Controls and adaptive gating

The short input is below the native threshold. Successful searches place
`error123` at the beginning. The history control first compiles the DFA through
misses, then switches to successful searches; the gate pauses probing after
the first success and retains the DFA for later reuse. Warmup excludes that
first successful probe. Unsupported syntax is `(?=error)error[0-9]+`, and the
plain literal is `error123`; both remain Java searches.

| C2 control | Bytes | Java ns/op | Rust enabled ns/op |
| --- | ---: | ---: | ---: |
| Short miss, primary | 64 | 61.7 ± 7.1 | 94.3 ± 42.4 |
| Hit without earlier misses | 64 | 29.1 ± 6.7 | 25.9 ± 1.3 |
| Hit without earlier misses | 4,096 | 26.4 ± 1.7 | 26.8 ± 1.1 |
| Hit without earlier misses | 32,768 | 29.9 ± 6.2 | 27.8 ± 1.5 |
| Hit after earlier misses | 4,096 | 45.6 ± 21.8 | 33.5 ± 5.5 |
| Hit after earlier misses | 32,768 | 41.5 ± 11.8 | 33.1 ± 1.9 |
| Unsupported lookahead | 4,096 | 36,543.5 ± 7,525.7 | 25,298.0 ± 373.4 |
| Plain literal | 4,096 | 4,483.7 ± 80.2 | 4,155.7 ± 803.5 |
| Short miss, longer confirmation | 64 | 68.5 ± 12.7 | 61.7 ± 1.5 |

The primary short-miss result had a slower point estimate with a wide interval;
a longer confirmation used five 1-second warmups and five 1-second measurements
in three forks. Both original and confirmation results are retained. The
confirmation and positive-history controls show overlapping intervals. The
unsupported/literal point estimates do not measure native acceleration because
those cases do not enter Rust search. These controls support the measured gates,
not a universal performance non-regression claim.

## Validation

- Packaged Linux x86_64 JDK built successfully with Rust enabled; the legal image
  includes all five vendored MIT notices and the matching compiler's complete
  Rust standard-library dependency notices.
- The complete GNU Linux AArch64 HotSpot build cross-compiled and linked with the
  AArch64 Rust static library. Interpreter, C1, C2 and bridge code are included.
  AArch64 execution/performance and macOS builds were not tested.
- Default configuration succeeded with Cargo absent from PATH and excludes the
  Rust legal components. The bridge also compiled with `INCLUDE_RUST_REGEX=0`.
- Rust unit tests: **2 passed**; frozen offline resolution, rustfmt and Clippy
  with warnings denied passed. Live latest-release check returned **1.13.1**.
- Final jtreg: **104 passed, 2 platform skips** across `java/util/regex`,
  `java/util/Scanner`, `java/lang/String` and `java/nio/file/PathMatcher`, plus
  **2 passed** HotSpot intrinsic availability/disable tests. Framework suites
  executed 5,980 TestNG/JUnit cases.
- `RustRegexTest` passed seven execution modes, each comparing 5,248 bound/state
  cases: flag disabled, normal tiering, JNI, interpreter, C1, C2 and UTF-16
  storage. It also checks captures, regions, replacement/splitting, concurrent
  Pattern reuse and GC, serialization, reset/usePattern and adaptive DFA reuse.
- C1 compilation logging reports intrinsic inlining of `mayMatch0`; C2
  `PrintIntrinsics` reports `RustRegex::mayMatch0 (intrinsic)`.

[Build/test transcripts and intrinsic log excerpts](rust-regex-validation.txt)
record the successful checks.

No semantic regressions were observed in this focused coverage. The full JDK
suite was not run. Acceleration covers eligible unsuccessful searches; native
positive matching, `matches`/`lookingAt`, UTF-16 input and the independent Xerces
engine are outside this change.

## Reproduction

Build as described in [rust-regex.md](rust-regex.md). The benchmark lives in the
standard JDK microbenchmark tree and can run through `make test TEST=micro:...`
after configuring `--with-jmh`. The measurements here compiled only this class
with JMH's annotation processor, using JMH 1.37 core/generator jars,
`jopt-simple` 5.0.4 and `commons-math3` 3.6.1:

```sh
BENCH_CLASSES=/tmp/regex-jmh-classes
JMH_JARS=/workspace/toolchains/jmh
TEST_JDK=build/cloud/images/jdk
mkdir -p "$BENCH_CLASSES"
"$TEST_JDK/bin/javac" -cp "$JMH_JARS/*" \
  -processorpath "$JMH_JARS/jmh-core-1.37.jar:$JMH_JARS/jmh-generator-annprocess-1.37.jar" \
  -d "$BENCH_CLASSES" test/micro/org/openjdk/bench/java/util/regex/RustRegexFilter.java
"$TEST_JDK/bin/java" -cp "$BENCH_CLASSES:$JMH_JARS/*" org.openjdk.jmh.Main \
  org.openjdk.bench.java.util.regex.RustRegexFilter.find \
  -wi 3 -i 5 -w 500ms -r 500ms -f 3 -t 1 -foe true \
  -p length=4096,32768 -p scenario=miss \
  -jvmArgsAppend '-XX:-TieredCompilation -XX:+UseRustRegex' -rf json -rff results.json
```

Use `-Xint`, `-XX:TieredStopAtLevel=1`, or `-XX:-TieredCompilation` to select
the tier. Toggle `UseRustRegex` and `UseRustRegexIntrinsics` for the three modes.
The [complete 21-command transcript](rust-regex-benchmark-commands.txt) records
the actual paths and arguments, and [raw JMH JSON](rust-regex-benchmark-results.json)
contains all 36 results with per-fork samples and confidence intervals.

The final focused test commands were:

```sh
jtreg -jdk:build/cloud/images/jdk \
  -nativepath:build/cloud/images/test/jdk/jtreg/native \
  -w:/tmp/regex-jtreg-final/work -r:/tmp/regex-jtreg-final/report \
  -agentvm -concurrency:2 -javaoptions:-XX:+UseRustRegex \
  test/jdk/java/util/regex test/jdk/java/util/Scanner \
  test/jdk/java/lang/String test/jdk/java/nio/file/PathMatcher
jtreg -jdk:build/cloud/images/jdk \
  -nativepath:build/cloud/images/test/hotspot/jtreg/native \
  -w:/tmp/regex-jtreg-vm-final/work -r:/tmp/regex-jtreg-vm-final/report \
  -agentvm -concurrency:2 -javaoptions:-XX:+UseRustRegex \
  test/hotspot/jtreg/compiler/intrinsics/IntrinsicAvailableTest.java \
  test/hotspot/jtreg/compiler/intrinsics/IntrinsicDisabledTest.java
```
