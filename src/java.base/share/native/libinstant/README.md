<!--
Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
-->

# Instant parser dependency

This directory contains the native boundary and Rust adapter for speedate 0.18.0.
Dependency sources are managed by Cargo rather than copied into the JDK tree.
`rust/Cargo.toml` pins speedate exactly; `rust/Cargo.lock` pins transitive packages
and their registry checksums. The upstream source is
<https://github.com/pydantic/speedate>, revision
`6a323c655ac8ec055b895b19c3c509ea022d4ea8` for 0.18.0.

## Build integration

Configure selects the optional library automatically on native Linux GNU
x64/AArch64, macOS arm64 and Windows x64 when the installed Rust 1.88+ toolchain,
target standard library and its `COPYRIGHT-library.html` are available locally.
Configure checks the installed tools without resolving crates or installing a
toolchain. Explicit `--enable-instant-speedate` requires usable prerequisites;
`--disable-instant-speedate` skips Rust probing and compiles out native routing.
The Java formatter's immutable parser reuse applies in either configuration.

`make/modules/java.base/lib/CoreLibraries.gmk` builds the archive and JNI library
with locked Cargo dependencies. Cargo downloads missing locked crates during
the normal build and honors caller registry, proxy and offline settings. Static-library recipes omit both. Rust follows
the fork's native baseline: `x86-64-v3` on Linux x64, `x86-64` with AVX2/FMA on
Windows x64, `generic` with CRC/LSE/RDM/DPB on Linux AArch64, and `apple-m1` on
macOS arm64. The Linux AArch64 features cover the userspace Armv8.2-A additions
without optional crypto, FP16, dot-product or SVE extensions. Startup
`-Djdk.time.instantSpeedate=false` selects Java parsing. Missing native libraries
also fall back to Java.

## Native boundary

Java routes String inputs of 20–27 characters ending in `Z` or `z` to speedate.
The library parses the date and time, validates their fields, and consumes the
complete input. The adapter does not parse the fields or repeat its delimiter
checks. Library-supported spellings such as a space or underscore between date
and time, and a comma before fractional seconds, are deliberately accepted when
the native backend is available. Other routes retain the Java formatter.

HotSpot intrinsifies `InstantParser.parse0` in C2, C1 and the x64/AArch64
interpreter. Each route calls the same bounded VM leaf without a JNI transition.
The compact String path passes its backing bytes directly; UTF-16 is narrowed
once into at most 27 ASCII bytes, rejecting wider characters to Java. No safepoint,
allocation, lock, Java callback or retained pointer is allowed while the leaf
borrows heap storage. `JNI_OnLoad` registers the Rust entry before Java publishes
the bootstrap-owned library as available; that library remains loaded until VM
shutdown. The leaf does no loading or symbol lookup.

JNI is the fallback when intrinsification is disabled or unsupported. It borrows
compact storage with `GetPrimitiveArrayCritical` and uses one bounded VM UTF-8
conversion for UTF-16. `-XX:+UnlockDiagnosticVMOptions -XX:-UseInstantParseIntrinsic` or `-XX:DisableIntrinsic=_parseInstant` selects this
fallback. The startup property above selects Java without entering either native
route. Speedate validates the bytes on both routes.
Results use integer epoch seconds and microseconds packed into one native return
value. Precision overflow is `Error`, so 7–9 fractional digits fall back to Java
with their nanoseconds intact. Speedate's definite invalid-month and invalid-day
results throw `DateTimeParseException` directly, without reparsing the input.
Their error wording and indices may differ from the Java formatter. Other native
misses use the Java formatter.

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
4. Keep the bounded UTC routing, precision overflow set to `Error`, integer epoch
   seconds/microseconds and Rust panic containment. Delegate date/time grammar,
   field ranges and full-input consumption to speedate. Review upstream changes
   to those semantics and to accepted spellings; do not add a second field parser
   to reproduce them. Preserve the borrowed-storage lifetime and bounded UTF-16
   conversion at both the VM leaf and JNI boundary.
5. Run the adapter's locked Cargo tests, the configure/path fixtures and focused
   java.time tests after building with the normal JDK recipes. Check both String
   representations, library spellings, date boundaries, pre-epoch fractions,
   JNI loading/concurrency and Serial/G1/ZGC, with interpreter, C1, C2 and normal
   tiered execution as applicable. Native-enabled platform checks must prove
   actual native hits; Java fallback alone is insufficient. The permanent
   `TestInstantParseIntrinsic` initializes the real backend, then loads a small
   jtreg native fixture that makes only the JNI parser entry decline. Enabled
   interpreter, C1 and C2 runs must still return a value from the direct helper;
   intrinsic-off controls must miss. Ordinary supported CI builds require native
   selection, and `test.instant.requireNative=true` makes a missing backend fail
   the route test rather than skip. User builds without Rust retain Java parsing.

The regression entry points are `TestInstantParseIntrinsic`, `TestInstantSpeedate`, `TestInstantParserCache`,
`InstantSpeedateDisabled`, `InstantSpeedateUnavailable`,
`TestInstantSpeedateConfigure.py` and `TestInstantSpeedatePaths.py`. The standard
JMH fixture `org.openjdk.bench.java.time.InstantParsing` measures complete public
calls, including native transitions, allocation, fallback and rejection paths.
