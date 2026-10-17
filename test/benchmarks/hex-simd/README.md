# Bulk HexFormat build and qualification

`--enable-hex-simd` enables library-backed plain HexFormat conversion. It is
disabled by default; ordinary builds require neither Rust nor Cargo. Calls
retain Java fallback when the library is unavailable or the input is ineligible.
Encoding requires empty delimiter/prefix/suffix. Decoding additionally requires
an original String argument with Latin1 storage. Binary-byte cutoffs are 1,024
for encode and 128 for decode. `-Djdk.hexFormat.useNative=false` disables loading.
These cutoffs are provisional Linux x64 choices. The published source review is
a milestone; full integration qualification remains incomplete. See
[QUALIFICATION.md](QUALIFICATION.md) for the exact evidence reconciliation and
one bounded build/correctness/startup/workload decision batch. The new harness
accounting guard, protected/first-use workload sources and executable supervisor/
adjudicator are unrun as of 2026-10-17; no new outcome is claimed for them.
Use [qualify.py](qualify.py) for the single future qualification batch, as shown
in that plan. The individual build/test/measurement commands below are useful
reproduction steps; they do not provide batch supervision or adjudication.
Only the offline TestNG evidence-parser fixtures have run for the latest repair;
the supervised campaign remains unexecuted.

Loading is guarded until VM bootstrap completes. JNI uses bounded region copies
into separate scratch buffers, without pinning arrays or retaining heap
addresses. Decode validation failure replays Java for exact diagnostics.
The pinned dependency graph contains hex-simd, vsimd and outref only. See
`doc/building.md` for the frozen-cache and redistribution-notice requirements.

## Build and tests

Use installed native JDK build tools and Rust/Cargo >=1.85. Check out this branch
or the exact supplied review commit, retaining parent history for the reference:

```sh
git clone --branch review/hexformat-simd --single-branch https://github.com/re-thc/openjdk-jdk27u.git
cd openjdk-jdk27u
git rev-parse HEAD
cargo fetch --locked --manifest-path src/java.base/share/native/libhexsimd/rust/Cargo.toml
bash bin/configure-dev --enable-hex-simd --with-conf-name=hexsimd \
  --with-boot-jdk="$BOOT_JDK" --with-jtreg="$JTREG_HOME"
make CONF=hexsimd JOBS=2 images
export JAVA_HOME="$PWD/build/hexsimd/images/jdk"

"$BOOT_JDK/bin/java" -jar "$JTREG_HOME/lib/jtreg.jar" \
  -jdk:"$JAVA_HOME" -w:build/hex-jtreg-work -r:build/hex-jtreg-report -conc:1 \
  -vmoption:-Dhexsimd.expectNative=true test/jdk/java/util/HexFormat

exp=test/benchmarks/hex-simd
bash "$exp/build.sh"
bash "$exp/verify.sh"
```

The make build uses frozen Cargo dependencies and two Cargo jobs. The Rust
archive is private to the JNI library. Disabled configurations remove owned
stale optional libraries/notices and invalidate the java.base jmod.
Cargo receives a separately exported compiler executable, with native path
conversion on Windows; configure retains its normalized command for probes.
`RUSTC` overrides must name one executable without arguments. Use a wrapper
executable when additional compiler options are required. The already
normalized Cargo command is invoked once, preserving Cargo override arguments.

Run the build-path regression fixtures without installing Rust or Cargo:

```sh
python3 test/make/hex-simd/TestRustPaths.py
```

These use the production configure macro, spec exports, path conversion macro
and Cargo recipe with fake tools. They cover bare Linux commands, both Windows
multiword fixpath forms, compiler-argument rejection and disabled builds. The
Windows converter is simulated; this does not qualify execution on Windows.

The harness compiles an unchanged reference from baseline commit
`89885a6288e7aaabd01678a704a586272c0f96e3`. Only that reference class is patched
into the JVM. Production HexFormat, its support class and native library come
from the normal build. Reference debug information matches java.base's helpful
NullPointerException metadata. The suite covers Serial/G1/ZGC, compact strings
on/off, JNI checking, offsets, malformed input, diagnostics, chunk boundaries,
large inputs, GC pressure and small platform-thread stacks.
The exhaustive code-unit sweep uses at least 256 characters to reach the
decode cutoff for eligible Latin1 Strings. Invalid ASCII/Latin1 is checked in
both nibble positions around vector widths and the JNI chunk boundary. The
harness asserts native availability separately from a successful direct native
decode; UTF16 and compact-string-disabled inputs must take Java fallback.
Failed later chunks may leave earlier successful chunks in the private
destination, which remains unpublished while Java replays its parser.

Test genuine library absence separately from the startup-disabled control:

```sh
"$JAVA_HOME/bin/jlink" --module-path "$JAVA_HOME/jmods" --add-modules java.base \
  --exclude-files '**/*hexsimd*' --output build/hex-no-library
export HEX_SIMD_NO_LIBRARY_JDK="$PWD/build/hex-no-library"
bash "$exp/verify.sh"
```

Compile the reference/harness once with the full JDK before using the
java.base-only image. `HEX_SIMD_OUT` selects another harness output directory;
its default is the ignored `build/hex-simd-production` directory.

## Complete-call measurements

Run sequentially without concurrent builds/tests. The harness asserts native
availability, escapes results, rotates inputs, alternates sample order and
records Java allocation. Calls include allocation, copies, transition, String
construction and range handling; first-use loading is outside steady state.
Allocation accounting must be supported and enabled; otherwise the harness
fails instead of reporting an unavailable measurement as zero. The same harness
can run on the baseline image, where the optional helper class is absent.

```sh
export JAVA_OPTS='-Xms512m -Xmx512m -XX:+UseG1GC -XX:ActiveProcessorCount=2 -Dhexsimd.expectNative=true'
bash "$exp/run.sh" Bench 8 128 512 1024 4096 65536 > build/hex-selected.csv
JAVA_OPTS='-Xms512m -Xmx512m -XX:+UseG1GC -XX:ActiveProcessorCount=2 -Djdk.hexFormat.useNative=false -Dhexsimd.expectNative=false' \
  bash "$exp/run.sh" Bench 8 1024 65536 > build/hex-control.csv
python3 "$exp/summarize.py" build/hex-selected.csv build/hex-control.csv
```

`*-native` labels denote the selected route, which uses Java below its cutoff
or for ineligible input. This bounded screen does not replace application
workloads or per-target qualification.

## Remaining platform gates

Prior local validation covered Linux x86_64, normal java.base build and
jmod/jlink packaging, the collector/compact-string matrix, disabling, genuine
library absence, native boundary tests and public HexFormat jtreg tests.

Linux AArch64, macOS ARM64 and Windows x64 require actual native build/run
correctness qualification through the separately approved normal CI stage.
They are not additional performance-host prerequisites for the available-host
benefit decision. Rust/Cargo 1.85 execution remains an untested minimum-version
claim, which does not block measuring the installed compatible toolchain.
The target mappings and platform source paths have been reviewed; runtime and
performance qualification on those targets remains outstanding.

The build-path repair was checked with a fresh Linux configure and isolated
Rust archive build. The strengthened correctness suite passed 96,808
differential checks per configuration against the previously qualified Linux
runtime, across the six collector/compact-string combinations, the disabled
control and genuine library absence. This did not rebuild or retime that
runtime. Its helper class SHA-256 remains
`d8eef0c7b909395d466bd0e3f6ada1a767db7fdcbbc07be382084aedd5f21c97`,
native library SHA-256 remains
`111c8fd4af8c278c62f78f12f133277e7271dffb932ae696b2dbafb3756478e2`,
and both packaged images' `lib/modules` SHA-256 remains
`bb11e5c12331a9a0cac22339f1bfcdcc8e25a777ea2ac05993de077c2e803dc3`.
The image without the library omits its native files. The repair's simulated
Windows path fixtures do not change the outstanding native platform gates.

For later supported-platform correctness, check out the exact review commit and
run the build/correctness commands with its normal installed CI toolchain.
Architecture-specific performance is a separate measurement and claim.
Expected Rust hosts are
`x86_64-unknown-linux-gnu`, `aarch64-unknown-linux-gnu`,
`aarch64-apple-darwin` and `x86_64-pc-windows-msvc`, respectively. Use the
repository's normal MSYS/MSVC environment on Windows. Cross builds and other
triples are rejected when the option is enabled.

Confirm native availability, all requested collectors, compact-string modes,
small stacks, library absence, exported symbols, dependencies and notices.
Retain raw selected/control results and reassess cutoffs on the actual target
before considering default enablement.
