<!--
Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
-->

# Instant parser dependency

This directory contains the JNI boundary and Rust adapter for speedate 0.18.0.
Dependency sources are managed by Cargo rather than copied into the JDK tree.
`rust/Cargo.toml` pins speedate exactly; `rust/Cargo.lock` pins transitive packages
and their registry checksums. The upstream source is
<https://github.com/pydantic/speedate>, revision
`6a323c655ac8ec055b895b19c3c509ea022d4ea8` for 0.18.0.

## Build integration

Configure selects the optional library automatically on native Linux GNU
x64/AArch64, macOS arm64 and Windows x64 when the installed Rust 1.88+ toolchain,
target standard library, its `COPYRIGHT-library.html`, and locked dependencies
are available locally. Configure and make do not acquire dependencies or install
toolchains. Explicit `--enable-instant-speedate` requires usable prerequisites;
`--disable-instant-speedate` skips Rust probing and compiles out native routing.
The Java formatter's immutable parser reuse applies in either configuration.

`make/modules/java.base/lib/CoreLibraries.gmk` builds the archive and JNI library
with frozen Cargo dependencies. Static-library recipes omit both. Rust targets
baseline `x86-64` on x64, `generic` on Linux AArch64 and `apple-m1` on macOS arm64;
the surrounding JDK's CPU flags are configured separately. Startup
`-Djdk.time.instantSpeedate=false` selects Java parsing. Missing native libraries
also fall back to Java.

## Updating

1. Review the upstream release, source revision, minimum Rust version and parser
   changes. Update the exact speedate requirement in `rust/Cargo.toml`.
2. With an installed toolchain, explicitly update the lockfile outside configure
   or make:

   ```sh
   cargo update --manifest-path src/java.base/share/native/libinstant/rust/Cargo.toml \
     -p speedate --precise VERSION
   ```

   Inspect every changed package, source and checksum in `Cargo.lock`. Update the
   version/revision above. Keep `Cargo.toml`'s `rust-version`, the configure
   minimum and its regression fixtures aligned when the Rust minimum changes.
3. Review and update `src/java.base/share/legal/speedate.md` for every locked
   dependency. Keep upstream copyright and license texts intact. The selected
   compiler's standard-library notices are packaged separately by the build.
4. Preserve the bounded grammar: four-digit ASCII UTC String timestamps with
   uppercase T/Z, ordinary time fields and no fraction or 1–6 fractional digits.
   Keep precision overflow set to `Error`, require `tz_offset == Some(0)`, and use
   integer epoch seconds/microseconds. Other inputs and native failures must
   retain Java values and parse-error details. Keep JNI ASCII narrowing, bounded
   stack copies and Rust panic containment. Recheck the library's ASCII digit,
   field-range, fraction and full-input-consumption behavior before removing any
   adapter guards.
5. Run the adapter's frozen Cargo tests, the configure/path fixtures and focused
   java.time tests after building with the normal JDK recipes. Check both String
   representations, malformed positions, date boundaries, pre-epoch fractions,
   JNI loading/concurrency and Serial/G1/ZGC, with interpreter, C1, C2 and normal
   tiered execution as applicable. Native-enabled platform checks must prove
   actual native hits; Java fallback alone is insufficient.

The regression entry points are `TestInstantSpeedate`, `TestInstantParserCache`,
`InstantSpeedateDisabled`, `InstantSpeedateUnavailable`,
`TestInstantSpeedateConfigure.py` and `TestInstantSpeedatePaths.py`. The standard
JMH fixture `org.openjdk.bench.java.time.InstantParsing` measures complete public
calls, including native transitions, allocation, fallback and rejection paths.
