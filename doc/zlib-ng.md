# ZIP intrinsics and zlib-ng

Linux, macOS and Windows x86-64 and AArch64 builds use bundled zlib-ng
for ZIP compression, decompression and native Adler32/CRC32 calls. The pre-VM
launcher and bundled splash-screen PNG decoder use that same private backend.

Compression level 1 maps to zlib-ng level 2, retaining a compression ratio
comparable to stock zlib's fastest level. The mapping applies to initialization
and parameter changes. Other levels, including the default, keep their values.

The `--with-zlib` option has been removed. Explicit uses, including `system`
and `bundled`, are rejected. Backend selection is determined by the target:
this integration uses bundled stock zlib on other OS/CPU combinations, with
unchanged compression levels. Configure reports that fallback explicitly.
Independent external dependencies, such as system libpng or FreeType, may
retain their own transitive compression dependencies.

`-XX:+UseZipIntrinsics` is the default. C1 and C2 use a shared GC-safe runtime
call for supported Deflater/Inflater buffer shapes. `-XX:-UseZipIntrinsics`
selects the original JNI calls. Both paths use the configured backend.

Heap arrays are pinned during native processing and released before exception
handling. Buffer positions, counters, dictionaries, flush operations, parameter
changes and reset preserve the Java ZIP API semantics. Interpreter compression
uses JNI. Direct-to-direct Inflater calls and x86-64 mixed-buffer Inflater calls
use JNI. Deflater uses JNI for chunks at most 1 KiB and, on AArch64, chunks of at
least 64 KiB. All these call paths use the configured backend.

Adler32 calls the selected backend from the interpreter and C1 for scalar and heap
array updates. C1 direct-buffer updates on AArch64, including Apple CPUs, use
the runtime leaf call with C1's normal caller-save register clobbers. Disabling
Adler intrinsics selects true JNI. On x86-64, C1
declines bulk intrinsification at 64 KiB and above; that compiler decision alone
does not identify JNI versus an interpreter entry. C2 calls the backend for scalar
updates and bulk updates of at least 1 KiB; shorter bulk updates use the HotSpot SIMD kernel.
On x86-64 without AVX2, C2 uses the backend for all bulk sizes.

CRC32 bulk updates of at least 64 bytes use the backend on x86-64 when the
HotSpot AVX-512 kernel is unavailable. The interpreter, C1 and C2 use the same
selection. Short inputs, scalar updates, AVX-512 hosts and AArch64 retain the
HotSpot kernels. CRC32C is unchanged; zlib-ng does not implement its polynomial.

Native consumers include ZIP/JAR class loading, CDS checksums, jimage
decompression and compressed heap dumps. Java ZIP/GZIP, ZIP filesystem and jlink
compression use the Deflater/Inflater integration. Other architectures retain bundled stock zlib until covered by the ng integration.

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
Bundled zlib-ng builds on Windows require CMake and the configured MSVC
toolchain's NMake.

## Small streams

Bulk throughput does not establish a benefit for tiny complete streams or for
freshly allocated Deflaters. Compare fresh initialization/finish/end separately
from reset/finish on reused streams, and record compressed sizes as well as time.
The backend can change compressed bytes and increase output size. Measured bulk
speedups coexist with tiny and fresh-stream slowdowns at the default level.
A short `NO_FLUSH` write remains part of its enclosing stream; it does not select
a different compression level or discard stream history. Default and explicit
level 6 retain their requested level. The bundled backend keeps full native
initialization and reset behavior; no tiny-stream specialization is carried.

## Validation

Regression tests are in `test/hotspot/jtreg/compiler/intrinsics/zip/` and
`test/jdk/java/util/zip/`. JMH benchmarks `ZipBackend`, `ZipBufferCalls`,
`ZipStreamCalls` and `ChecksumPaths` cover reusable streams, checksums, buffer
combinations and complete ZIP/GZIP writes. Record the CPU, revision, execution
tier, forks, warmup, measurement settings and compressed sizes when comparing results.

[Adler32 call selection and regression tests](zlib-ng-adler32.md) describes the
C1 leaf, interpreter-entry and JNI paths and provides test commands.
