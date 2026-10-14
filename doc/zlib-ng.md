# ZIP intrinsics and zlib-ng

Linux, macOS and Windows x86-64 and AArch64 builds use zlib-ng for ZIP compression, decompression
and native Adler32/CRC32 calls.

Compression level 1 maps to zlib-ng level 2, retaining a compression ratio
comparable to stock zlib's fastest level. The mapping applies to initialization
and parameter changes. Other levels, including the default, keep their values.

`-XX:+UseZipIntrinsics` is the default. C1 and C2 use a shared GC-safe runtime
call for supported Deflater/Inflater buffer shapes. `-XX:-UseZipIntrinsics`
selects the original JNI calls. Both paths use zlib-ng.

Heap arrays are pinned during native processing and released before exception
handling. Buffer positions, counters, dictionaries, flush operations, parameter
changes and reset preserve the Java ZIP API semantics. Interpreter compression
uses JNI. Direct-to-direct Inflater calls and mixed-buffer Inflater calls on
x86-64 and Apple AArch64 use JNI. Deflater uses JNI for chunks at most 1 KiB and, on AArch64, chunks of at
least 64 KiB. All these call paths use zlib-ng.

Adler32 calls zlib-ng directly from the interpreter and C1 for scalar, heap
array and direct-buffer updates. On x86-64, C1 uses JNI for bulk updates of at
least 64 KiB. On Apple AArch64, C1 uses JNI for direct buffers unless the compiler proves
a constant length below 4 KiB. C2 calls zlib-ng for scalar updates and bulk
updates of at least 1 KiB; shorter bulk updates use the HotSpot SIMD kernel.
On x86-64 without AVX2, C2 uses zlib-ng for all bulk sizes.

CRC32 bulk updates of at least 64 bytes use zlib-ng on x86-64 when the
HotSpot AVX-512 kernel is unavailable. The interpreter, C1 and C2 use the same
selection. Apple AArch64 uses zlib-ng for bulk updates of at least 64 KiB;
C1 heap updates at that size use JNI. Shorter Apple updates use the PMULL
kernel when supported. Scalar updates, AVX-512 hosts and other AArch64 CPUs
retain the HotSpot kernels. CRC32C is unchanged; zlib-ng does not implement
its polynomial.

Native consumers include ZIP/JAR class loading, CDS checksums, jimage
decompression and compressed heap dumps. Java ZIP/GZIP, ZIP filesystem and jlink
compression use the Deflater/Inflater integration. Other architectures and the pre-VM launcher retain their existing zlib integration.

## Updating the dependency

- Upstream commit: [88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0](https://github.com/zlib-ng/zlib-ng/commit/88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0)
- Archive: `https://codeload.github.com/zlib-ng/zlib-ng/tar.gz/88601f0bdd192e9f87d4bd0a50d5d2e2dc9b8cd0`
- SHA-256: `ba09b6d7d45f0aaf6f58976fe943b3de2fd3b6e4ee9d7ebad93876ef12fbcc63`
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
Windows builds require CMake and the configured MSVC toolchain's NMake.

## Validation

Regression tests are in `test/hotspot/jtreg/compiler/intrinsics/zip/` and
`test/jdk/java/util/zip/`. JMH benchmarks `ZipBackend`, `ZipBufferCalls`,
`ZipStreamCalls` and `ChecksumPaths` cover reusable streams, checksums, buffer
combinations and complete ZIP/GZIP writes. Record the CPU, revision, execution
tier, forks, warmup, measurement settings and compressed sizes when comparing results.
