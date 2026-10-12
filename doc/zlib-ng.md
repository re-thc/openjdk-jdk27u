# ZIP intrinsics and zlib-ng

Linux x86-64 and AArch64 builds use zlib-ng for ZIP compression, decompression
and native Adler32/CRC32 calls.

`-XX:+UseZipIntrinsics` is the default. C1 and C2 use a shared GC-safe runtime
call for supported Deflater/Inflater buffer shapes. `-XX:-UseZipIntrinsics`
selects the original JNI calls. Both paths use zlib-ng.

Heap arrays are pinned during native processing and released before exception
handling. Buffer positions, counters, dictionaries, flush operations, parameter
changes and reset preserve the Java ZIP API semantics. Interpreter compression
uses JNI. Direct-to-direct Inflater calls and x86-64 mixed-buffer Inflater calls
use JNI. Deflater uses JNI for chunks at most 1 KiB and, on AArch64, chunks of at
least 64 KiB. All these call paths use zlib-ng.

C2 bulk Adler32 calls of at least 1 KiB call zlib-ng directly on x86-64 and
AArch64. Short inputs keep the existing HotSpot SIMD kernel. Interpreter and C1 Adler32 use zlib-ng through JNI. Existing CRC32 and
CRC32C intrinsics are unchanged.

Native consumers include ZIP/JAR class loading, CDS checksums, jimage
decompression and compressed heap dumps. Java ZIP/GZIP, ZIP filesystem and jlink
compression use the Deflater/Inflater integration. Other platforms and the
pre-VM launcher retain their existing zlib integration.

## Updating the dependency

- Upstream commit: [f18efb822a2fc24a1209a836d51bb217476fc08e](https://github.com/zlib-ng/zlib-ng/commit/f18efb822a2fc24a1209a836d51bb217476fc08e)
- Archive: `https://codeload.github.com/zlib-ng/zlib-ng/tar.gz/f18efb822a2fc24a1209a836d51bb217476fc08e`
- SHA-256: `acf89dcbbb22b263a29728d8f24fe3e57a7fb7d3058398ec904bf7dcbcf54895`
- Sources: `src/java.base/share/native/libzip/zlib-ng/`
- License: `src/java.base/share/legal/zlib-ng.md`

Verify the next upstream commit and archive checksum, then run:

```
python3 make/scripts/update-zlib-ng.py --archive /path/to/zlib-ng-COMMIT.tar.gz \
    --revision COMMIT --sha256 VERIFIED_SHA256
```

The importer preserves upstream source bytes and file modes, removes obsolete
files and updates the license notice. Update this provenance record with it.
No source patches are carried. The native build uses compatibility mode,
private `jdk_ng_` symbols and the configured target toolchain and sysroot.

## Validation

Regression tests are in `test/hotspot/jtreg/compiler/intrinsics/zip/` and
`test/jdk/java/util/zip/`. JMH benchmarks `ZipBackend`, `ZipBufferCalls` and
`ZipStreamCalls` cover reusable streams, checksums, buffer combinations and
complete ZIP/GZIP writes. Record the CPU, revision, execution tier, forks,
warmup, measurement settings and compressed sizes when comparing results.
