# simdutf integration

HotSpot uses simdutf for bulk Unicode and Base64 operations on supported x86-64
and AArch64 CPUs. The interpreter, C1, C2 and JNI fallback share checked native
leaves. CPU and OS feature checks select a supported backend at startup.

`-XX:-UseSIMDUTFIntrinsics` disables the integration, including JNI fallback.
`-XX:SIMDUTFMinLength=N` overrides automatic size thresholds. Existing Java and
HotSpot implementations remain available when admission or validation declines.
Short inputs, near-start searches and some compiled operations retain those
paths to avoid native-call overhead. Buffers without accessible arrays can incur
bounded staging allocations; misaligned inputs may use scalar fallback.

Native calls are limited to 1,048,576 elements so larger operations can return
to Java between chunks. The integration preserves malformed-input handling,
replacement, BOMs, padding, buffer positions and scoped-access exceptions.
Java's surrogate-valued UTF-32 inputs fall back to its existing decoder.

## Build and test

The library is built into `libjvm` by the ordinary JDK build; no separately
installed simdutf library is required. After configuring a JDK build, run:

```
make images
make test TEST="hotspot/jtreg/compiler/intrinsics/simdutf hotspot/jtreg/compiler/escapeAnalysis/TestSimdUTFLeaf.java jdk/java/lang/String/SimdUTFWideTest.java jdk/java/nio/charset/CharsetDecoder/ReplacementCopy.java jdk/java/util/Base64"
```

Tests exercise interpreter and compiled execution, JNI fallback, opt-out,
buffer and chunk boundaries, mutable input and Java-specific Unicode semantics.
Performance depends on architecture, execution tier, operation and input size;
correctness results do not establish performance on another configuration.

## Update the vendor sources

Use a clean checkout of an official stable release from
<https://github.com/simdutf/simdutf>:

```
python3 make/scripts/update-simdutf.py /path/to/clean/release/checkout
```

The updater checks the release tag and source version, regenerates the selected
amalgamation and copies the MIT and BSD notices. `src/utils/simdutf/UPSTREAM`
records the exact commit, enabled features and generated-file SHA-256 digests.
Review the upstream changes and reproduce the generated files before committing.
Keep upstream source unmodified and retain its generated notices and licenses.
A vendor or integration source change requires new validation; earlier results
remain evidence for their original source and build identities only.
