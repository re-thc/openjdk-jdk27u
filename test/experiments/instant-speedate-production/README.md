# Opt-in speedate Instant parser

The production path applies only to String input matching ASCII
`YYYY-MM-DDTHH:mm:ssZ` or `YYYY-MM-DDTHH:mm:ss.f…Z` with 1–6 fractional digits,
uppercase T/Z, four-digit years and ordinary time fields. speedate validates the
calendar and supplies integer epoch seconds and microseconds. Other inputs,
invalid dates and ordinary native/load/link failures use the original JDK
formatter. Nanosecond input is never truncated. Custom formatter overloads,
other date/time APIs and timezone databases are unchanged.

Configure defaults to disabled. Enabled images can disable the route at startup
with `-Djdk.time.instantSpeedate=false`. Loading is bootstrap-owned, occurs after
VM boot and outside class initialization, and lets concurrent calls fall back
while loading. JNI copies input into bounded stack buffers without pinning or
retaining Java storage. Rust unwinds are contained; crashes and VM-fatal errors
are not recoverable parse misses.

## Build

Use the repository's existing native build prerequisites, installed Rust >=1.88,
the matching Rust target standard library, Cargo and its compiler-provided
`COPYRIGHT-library.html`. No compiler is installed automatically. Export
`BOOT_JDK` and `JTREG_HOME` for your installed tools. Set `JDK_HOME` below to the
absolute path of the resulting image; use fresh configurations when changing
the feature or replacing trial source variants.

```bash
cargo fetch --locked --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml
bin/configure-dev --with-conf-name=instant-speedate --with-jobs=4 \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --with-debug-level=release --enable-instant-speedate
make CONF=instant-speedate JOBS=4 images
make CONF=instant-speedate JOBS=1 run-test \
  TEST=test/jdk/java/time/test/java/time/TestInstantSpeedate.java
```

Use the existing profile's documented toolchain/linker overrides when needed.
The normal make rule uses the checked-in Cargo lockfile and `--frozen`, caps
Cargo at two jobs and packages dependency/compiler notices. The image needs no
Rust toolchain at runtime. Cross builds and static-library builds are rejected.

| Native host | Rust target | Rust CPU |
|---|---|---|
| Linux x64 | x86_64-unknown-linux-gnu | x86-64-v3 |
| Linux AArch64 | aarch64-unknown-linux-gnu | generic |
| macOS arm64 | aarch64-apple-darwin | apple-m1 |
| Windows x64 | x86_64-pc-windows-msvc | x86-64-v3 |

Only Linux x64-v3 has completed native build, correctness, GC and performance
qualification. The other targets remain unbuilt and untested; target selection
and source review do not qualify them. The feature remains opt-in.

## Standalone regression and reproduction probe

`ProductionProbe.java` and `OnLoad.c` are the source fixtures used for integrated
qualification. Export `PROBE_OUT` as an empty scratch directory outside the
source tree. Commands below use Bash, including the JDK build shell on Windows.

```bash
mkdir -p "$PROBE_OUT/classes"
"$JDK_HOME/bin/javac" --add-exports java.base/jdk.internal.misc=ALL-UNNAMED \
  -d "$PROBE_OUT/classes" \
  test/experiments/instant-speedate-production/ProductionProbe.java
"$JDK_HOME/bin/java" -Xcheck:jni --add-opens java.base/java.time=ALL-UNNAMED \
  -Dprobe.native=true -cp "$PROBE_OUT/classes" ProductionProbe test
```

The test compares values and complete parse-error outcomes with the unchanged
formatter and separately proves native hits/misses and negative epoch fractions.
Run it again with `-XX:-CompactStrings`, and on an unchanged baseline image and
the runtime-disabled image without `-Dprobe.native=true`; compare the digests.
Missing-library, `INSTANT_SPEEDATE_FORCE_FAILURE` and
`INSTANT_SPEEDATE_NO_SYMBOL` tests use only scratch image copies and test DLLs
built from `src/java.base/share/native/libinstant/InstantParser.c` with the
appropriate macro. Never modify the retained image for fault injection.

```bash
for gc in Serial G1 Z; do
  for compact in + -; do
    "$JDK_HOME/bin/java" -Xms64m -Xmx64m -XX:ActiveProcessorCount=2 \
      "-XX:+Use${gc}GC" "-XX:${compact}CompactStrings" -Xcheck:jni -Xlog:gc=info \
      --add-opens java.base/java.time=ALL-UNNAMED -Dprobe.native=true \
      -cp "$PROBE_OUT/classes" ProductionProbe stress
  done
done
"$JDK_HOME/bin/java" --add-opens java.base/java.time=ALL-UNNAMED \
  --add-exports java.base/jdk.internal.misc=ALL-UNNAMED -Xcheck:jni \
  -Xlog:library=info '-Djava.system.class.loader=ProductionProbe$EarlyLoader' \
  -cp "$PROBE_OUT/classes" ProductionProbe bootstrap
"$JDK_HOME/bin/java" --add-opens java.base/java.time=ALL-UNNAMED -Xcheck:jni \
  -Xlog:library=info -cp "$PROBE_OUT/classes" ProductionProbe race
"$JDK_HOME/bin/java" -Xshare:on -version
```

For the defensive loader-contention regression, build `OnLoad.c` as a JNI test
library with the image's include directory and platform subdirectory: Linux
uses `cc -shared -fPIC`, macOS `cc -dynamiclib -fPIC`, and Windows an existing
x64 MSVC shell with `cl /LD`. Set `ONLOAD_LIB` to that absolute library path and
`PARSER_LIB` to the canonical image path of `lib/libinstant.so`,
`lib/libinstant.dylib` or `bin/instant.dll`, respectively. Then run:

```bash
"$JDK_HOME/bin/java" -Xcheck:jni --enable-native-access=ALL-UNNAMED \
  --add-opens java.base/java.time=ALL-UNNAMED \
  --add-opens java.base/jdk.internal.loader=ALL-UNNAMED \
  "-Dprobe.onload.library=$ONLOAD_LIB" "-Dprobe.parser.library=$PARSER_LIB" \
  -cp "$PROBE_OUT/classes" ProductionProbe onload
```

For warmed measurements, use separate baseline/enabled/disabled images, serial
JVM forks and identical options. The probe includes public-call transition,
copying, validation, result construction and escaping allocation. Run `bench`
with `happy`, `mixed` or `invalid`, both String modes, and the same fixed options
`-Xms256m -Xmx256m -XX:ActiveProcessorCount=2 -XX:+UseG1GC -Xbatch
-Dprobe.warmup=400000 -Dprobe.iterations=200000 -Dprobe.rounds=5`. Retain every
round/fork, exclude only the first round, compare checksums and report misses.
`first` measures a cold public parse separately. Do not infer results for other
hosts or replace integrated measurements with native-kernel timing.
