# Bulk HexFormat build and qualification

`--enable-hex-simd` enables library-backed plain HexFormat conversion. It is
disabled by default; ordinary builds require neither Rust nor Cargo. Calls
retain Java fallback when the library is unavailable or the input is ineligible.
Encoding requires empty delimiter/prefix/suffix. Decoding additionally requires
an original String argument with Latin1 storage. Binary-byte cutoffs are 1,024
for encode and 128 for decode. `-Djdk.hexFormat.useNative=false` disables loading.

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

The harness compiles an unchanged reference from baseline commit
`89885a6288e7aaabd01678a704a586272c0f96e3`. Only that reference class is patched
into the JVM. Production HexFormat, its support class and native library come
from the normal build. Reference debug information matches java.base's helpful
NullPointerException metadata. The suite covers Serial/G1/ZGC, compact strings
on/off, JNI checking, offsets, malformed input, diagnostics, chunk boundaries,
large inputs, GC pressure and small platform-thread stacks.

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
qualification. Rust/Cargo 1.85 minimum-version execution also remains a gate.
The target mappings and platform source paths have been reviewed; runtime and
performance qualification on those targets remains outstanding.

On each target, check out the exact review commit and run the commands above
with its installed native toolchain. Expected Rust hosts are
`x86_64-unknown-linux-gnu`, `aarch64-unknown-linux-gnu`,
`aarch64-apple-darwin` and `x86_64-pc-windows-msvc`, respectively. Use the
repository's normal MSYS/MSVC environment on Windows. Cross builds and other
triples are rejected when the option is enabled.

Confirm native availability, all requested collectors, compact-string modes,
small stacks, library absence, exported symbols, dependencies and notices.
Retain raw selected/control results and reassess cutoffs on the actual target
before considering default enablement.
