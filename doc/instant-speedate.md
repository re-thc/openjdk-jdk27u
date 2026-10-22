# Instant parsing

The Java instant formatter reuses its immutable variable-precision parser. Each
invocation still creates its own parse context and resolves its own fields.
This applies to `Instant.parse`, `ISO_INSTANT` and `appendInstant()` on every build.
Fixed fractional widths keep their existing parser construction.

A bounded speedate 0.18.0 backend additionally accelerates `Instant.parse(String)`.
Configure defaults to `--enable-instant-speedate=auto`: native Linux GNU
x64/AArch64, macOS arm64 and Windows x64 builds enable it when installed
Rust 1.88+, Cargo, the target standard library,
its `COPYRIGHT-library.html` notices and all locked Cargo dependencies are usable
locally. Otherwise configure selects Java parsing. Configure and make neither
fetch dependencies nor install Rust toolchains. `--disable-instant-speedate`
skips Rust probing and compiles out native routing; parser reuse still applies.

Explicit `--enable-instant-speedate` requires those prerequisites and a supported
native target. The available targets are Linux GNU x64/AArch64, macOS arm64 and
Windows x64. Cross compilation and other targets use Java. Complete-operation
performance has been measured on Linux x64; no speedup is asserted for the other
platforms. Platform checks must assert actual native hits, since successful
Java fallback alone does not validate a native integration.

Rust x64 code targets baseline `x86-64`, AArch64 Linux uses `generic`, and macOS
uses `apple-m1`. The feature adds no x64-v3 requirement; the repository's
`configure-dev` profile independently selects stronger CPU flags for the JDK.
Static-library recipes omit libinstant and its Rust archive. A static JDK uses
the Java fallback when no shared libinstant is available.

## Building and checking

Use installed toolchains and the repository's normal prerequisites. To make
locked dependencies available before configuring (network access is needed only
for this explicit dependency fetch):

```sh
cargo fetch --locked --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml
bash bin/configure-dev --with-conf-name=instant --with-jobs=4 \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --with-debug-level=release --disable-javac-server
make CONF=instant JOBS=4 images
make CONF=instant JOBS=4 run-test \
  TEST='test/jdk/java/time/test/java/time/TestInstantSpeedate.java test/jdk/java/time/test/java/time/format/TestInstantParserCache.java test/jdk/java/time/nonjunit/java/time/InstantSpeedateDisabled.java test/jdk/java/time/nonjunit/java/time/InstantSpeedateUnavailable.java test/jdk/java/time/test/java/time/TestInstant.java test/jdk/java/time/tck/java/time/TCKInstant.java test/jdk/java/time/tck/java/time/format/TCKInstantPrinterParser.java' \
  'TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m -Xcheck:jni' \
  'JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0'
python3 test/make/TestInstantSpeedateConfigure.py
python3 test/make/TestInstantSpeedatePaths.py
```

Repeat correctness checks with both CompactStrings settings, interpreter and C1,
and concurrent Serial/G1/ZGC workloads. The native grammar tests assert actual
backend execution when built and enabled; a compile-out test run does not qualify
native behavior. Path fixtures exercise command construction, not a foreign
platform's compiler, linker or runtime.

`org.openjdk.bench.java.time.InstantParsing` is a normal JMH benchmark of complete
public calls, including routing, JNI, validation, result creation and exceptions.
It rotates canonical, mixed, fallback, syntax-invalid, calendar-invalid and custom
CharSequence corpora. Run source-matched images in opposing A/B and B/A order,
with both CompactStrings settings and `-prof gc`. On Unix, compile this fixture
alone to avoid pulling unrelated desktop benchmarks into a headless build. Set
`$JMH` to the directory containing the repository's pinned JMH 1.37 dependency
jars, and use an absolute JDK image path:

```sh
INSTANT_JDK="$(pwd)/build/instant/images/jdk"
INSTANT_BENCH_OUT="$(mktemp -d)"
mkdir "$INSTANT_BENCH_OUT/classes" "$INSTANT_BENCH_OUT/generated"
"$INSTANT_JDK/bin/javac" -J-XX:ActiveProcessorCount=2 \
  -cp "$JMH/jmh-core-1.37.jar" \
  -processorpath "$JMH/jmh-core-1.37.jar:$JMH/jmh-generator-annprocess-1.37.jar" \
  -processor org.openjdk.jmh.generators.BenchmarkProcessor \
  -d "$INSTANT_BENCH_OUT/classes" -s "$INSTANT_BENCH_OUT/generated" \
  test/micro/org/openjdk/bench/java/time/InstantParsing.java
"$INSTANT_JDK/bin/jar" --create --file "$INSTANT_BENCH_OUT/benchmarks.jar" \
  -C "$INSTANT_BENCH_OUT/classes" .
JMH_CP="$INSTANT_BENCH_OUT/benchmarks.jar:$JMH/jmh-core-1.37.jar:$JMH/commons-math3-3.6.1.jar:$JMH/jopt-simple-5.0.4.jar"

# Set JAVA_A and JAVA_B to the two absolute image/bin/java paths.
"$JAVA_A" -cp "$JMH_CP" org.openjdk.jmh.Main '.*InstantParsing.parse' \
  -jvm "$JAVA_B" -p input=happy,mixed,fallback,syntax,calendar,custom \
  -f 1 -wi 2 -w 1s -i 3 -r 1s -t 1 -bm avgt -tu ns -prof gc \
  -jvmArgsAppend '-XX:ActiveProcessorCount=2 -XX:+UseG1GC -Xms256m -Xmx256m -XX:+CompactStrings'
```

Also measure startup `-Djdk.time.instantSpeedate=false`, a genuinely missing
image library, first-call latency, interpreter and C1. Preserve source identities,
raw measurements and adverse results. Native kernel timings do not establish an
`Instant.parse` improvement.

## Semantics and lifetime

The native path accepts only String inputs with exact ASCII
`YYYY-MM-DDTHH:mm:ssZ` or `YYYY-MM-DDTHH:mm:ss.f...Z`, with one through six
fractional digits, four-digit years and ordinary time ranges. speedate validates
the Gregorian date and supplies integer epoch seconds and microseconds, including
before 1970. No floating timestamp conversion or fraction truncation is used.

Other inputs use the Java formatter: seven through nine fractional digits, leap
seconds, 24:00, offsets, extended years, lowercase separators, custom
CharSequence inputs and invalid dates. Native misses and load/link failures use
the same formatter, preserving values, exceptions and error indices.

`-Djdk.time.instantSpeedate=false` disables native parsing at JVM startup. Later
property changes do not enable it. Preboot calls use Java; native loading occurs
after VM boot without a class-initialization lock. Calls concurrent with loading
fall back without waiting. A permanent load failure bypasses subsequent guards.
JNI copies bounded input into stack storage; native code retains no Java memory.
Rust unwinds are contained within Rust.

Calendar-invalid timestamps require both native and Java validation. Workloads
that frequently reject dates should compare the startup opt-out; it retains
parser reuse while avoiding that extra validation.

This changes no public API, other date/time conversion, formatter pattern grammar
or timezone database. Native calls can have a first-use loading cost; applications
with short lifetimes should include that cost in their measurements.
