# Optional speedate support for Instant parsing

`--enable-instant-speedate` builds an image-owned native library for
`Instant.parse`. The feature is disabled by default. It requires an installed
Rust compiler version 1.88 or newer, Cargo, the target standard library, and
the compiler's `COPYRIGHT-library.html` notices. The locked Cargo dependencies
must be available before the JDK build; make invokes Cargo with `--frozen`.

The supported native build configurations are:

| Host | Rust target | Required CPU profile |
|---|---|---|
| Linux x64 | `x86_64-unknown-linux-gnu` | x86-64-v3 |
| Linux AArch64 | `aarch64-unknown-linux-gnu` | generic |
| macOS arm64 | `aarch64-apple-darwin` | Apple M1 |
| Windows x64 | `x86_64-pc-windows-msvc` | x86-64-v3 |

Cross builds and static-library JDK builds are not supported. The x64 library
requires x86-64-v3 hardware; it does not perform runtime ISA dispatch. Use the
repository's normal native build prerequisites and development profile:

```bash
cargo fetch --locked --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml
bash bin/configure-dev --with-conf-name=instant-speedate --with-jobs=4 \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME" \
  --with-debug-level=release --disable-javac-server --enable-instant-speedate
make CONF=instant-speedate JOBS=4 images
make CONF=instant-speedate JOBS=1 run-test \
  TEST='test/jdk/java/time/test/java/time/TestInstantSpeedate.java test/jdk/java/time/nonjunit/java/time/InstantSpeedateDisabled.java' \
  'TEST_OPTS=JOBS=1;VM_OPTIONS=-XX:ActiveProcessorCount=2 -Xms64m -Xmx512m' \
  'JTREG=JOBS=1;MAX_MEM=512m;RETRY_COUNT=0'
```

The fast path accepts only `String` inputs with exact ASCII
`YYYY-MM-DDTHH:mm:ssZ` or `YYYY-MM-DDTHH:mm:ss.f...Z` syntax and one through six
fractional digits. Years have four digits, separators and T/Z are uppercase,
and time fields use ordinary ranges. speedate validates the Gregorian date and
provides integer epoch seconds and microseconds, including before the epoch.

All other input uses the existing Java formatter. This includes seven through
nine fractional digits, leap seconds, 24:00, offsets, extended years, lowercase
separators, custom `CharSequence` inputs and invalid dates. Fractions are never
truncated. Ordinary native parse misses and load/link failures also use the
original formatter, preserving its values and parse-error details.

An enabled image can disable native parsing at JVM startup with
`-Djdk.time.instantSpeedate=false`. Later system-property changes do not enable
it. Preboot calls use Java; native loading takes place after VM boot without
holding a class-initialization lock. Calls concurrent with loading fall back
without waiting for the library. JNI copies a bounded input into stack storage;
native code does not retain Java memory. Rust unwinds are contained within Rust.

This changes no public API, formatter pattern support, other date/time type or
timezone database. Native performance, runtime-disabled overhead and platform
qualification require their own evidence; enabling the feature is not a speedup
guarantee.
