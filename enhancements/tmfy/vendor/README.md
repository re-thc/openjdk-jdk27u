# Managed simdutf dependency

`vendor-lock.json` pins the official simdutf 9.2.1 release archive, peeled commit,
archive SHA-256, selected features, and generated-file SHA-256 values. The MIT
license is selected. The JDK notice is `src/java.base/share/legal/simdutf.md`.
No upstream implementation is checked into this repository.

Prepare the dependency before building:

```sh
python3 enhancements/tmfy/vendor/materialize-simdutf.py --fetch
```

Only `--fetch` enables network access. The verified archive is cached in
`build/tmfy-deps/downloads/`. Only `simdutf.cpp`, `simdutf.h`, `LICENSE-APACHE`,
`LICENSE-MIT`, and `dependency-receipt.json` are published in
`build/tmfy-deps/simdutf/`. Both locations are ignored build outputs. The full
upstream tree is extracted temporarily and removed after generation.

For an offline build, supply the official archive once:

```sh
python3 enhancements/tmfy/vendor/materialize-simdutf.py --archive /path/to/simdutf-v9.2.1.tar.gz
```

A positional archive path is equivalent. A no-argument invocation then uses the
verified archive cache without network access. `--output` and `--cache-dir`
select alternative build-cache locations; paths inside the checkout must stay
under ignored `build/`. An existing corrupt cache is never silently replaced.

`--check` regenerates and compares every output and the receipt without changing
the output or archive cache, even when combined with `--fetch`. Missing, extra,
or changed output files fail verification. Archive and generated hashes are
verified before publication. Each changed file is published atomically; unchanged
files retain their timestamps. Upstream `AMALGAMATE_` environment overrides are
removed so they cannot change the locked source, include paths, or output.

Only UTF8, UTF16, and LATIN1 features are enabled. The adapter and generated
implementation require C++17 and are compiled independently of the HotSpot
precompiled header and whole-program LTO. The generated upstream first-line
timestamp is replaced with the stable provenance comment in the materializer.
Generated CRLF line endings are normalized to LF before checksum verification.
The lock's generated hashes identify this newly implemented materialization;
they do not claim byte-identical recovery of an earlier lost working tree.

The native adapter selects one immutable implementation during ordinary runtime
initialization. VM callers supply their effective CPU/OS-admitted ISA mask;
conversion calls only load the published pointer and invoke that implementation.
The pinned `implementation::name()` returns a `std::string_view` over a static
NUL-terminated constructor literal, so the diagnostic name does not allocate.

To update the dependency, verify an official release, update its source URL,
peeled commit and archive checksum, regenerate in a temporary build directory,
and review API, feature and license changes before updating generated hashes.
Run deterministic `--check`, native differential tests, affected JDK regression
tests, and performance gates anew; earlier results are not upgrade evidence.

## Native replacement differential checks

The native test corpus comes from the public `String` APIs of an unmodified JDK.
Use an unmodified build of the exact target revision for target-equivalence
claims; a boot JDK provides only preliminary control evidence. Generated vectors,
binaries, and logs stay in the ignored build tree.

```sh
mkdir -p build/tmfy-deps/tests
TMFY_ORACLE_JDK=/path/to/unmodified-target-jdk
"$TMFY_ORACLE_JDK/bin/javac" -d build/tmfy-deps/tests \
    test/hotspot/jtreg/compiler/intrinsics/tmfy/native/UnicodeReplacementOracle.java
"$TMFY_ORACLE_JDK/bin/java" -Xmx512m -cp build/tmfy-deps/tests \
    UnicodeReplacementOracle build/tmfy-deps/tests/unicode.bin
c++ -std=c++17 -O2 -fno-exceptions -fno-rtti -pthread \
    -Isrc/hotspot/share/tmfy -Ibuild/tmfy-deps/simdutf \
    test/hotspot/jtreg/compiler/intrinsics/tmfy/native/unicodeReplacementKernel.cpp \
    src/hotspot/share/tmfy/kernels.cpp build/tmfy-deps/simdutf/simdutf.cpp \
    -o build/tmfy-deps/tests/unicodeReplacementKernel
build/tmfy-deps/tests/unicodeReplacementKernel build/tmfy-deps/tests/unicode.bin host
build/tmfy-deps/tests/unicodeReplacementKernel build/tmfy-deps/tests/unicode.bin fallback
build/tmfy-deps/tests/unicodeReplacementKernel build/tmfy-deps/tests/unicode.bin race
```

The last argument can also name a compiled, host-supported backend, such as
`westmere`, `haswell`, or `icelake`, to check each immutable selection in a new
process. Tests cover malformed consumption, UTF16 surrogate replacement, native
byte order, aligned and unaligned spans, capacity/overlap/range checks, output
canaries, real inaccessible guard pages on Unix, and concurrent initialization.
They do not replace the public JDK route tests or the separate performance gates.
