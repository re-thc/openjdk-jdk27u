# ZIP intrinsics and zlib-ng

## Options

Linux x86-64 and AArch64 builds include zlib-ng alongside stock zlib.

- `UseZipIntrinsics` enables the Deflater/Inflater call paths independently of the
  compression backend and defaults to enabled on supported platforms.
- `-XX:+UseZlibNG` selects the optional zlib-ng backend. Stock zlib is the default.
- `-XX:+UnlockDiagnosticVMOptions -XX:-UseZipIntrinsics` selects the original JNI
  calls with either backend.
- `UseAdler32Intrinsics`, `UseCRC32Intrinsics` and `UseCRC32CIntrinsics` retain
  their existing meanings.

Unsupported platforms reject an explicitly enabled `UseZlibNG` option.

## Stream behavior and coverage

With `UseZlibNG`, a Deflater whose first input chunk is at most 1 KiB uses stock
zlib, including incremental ZIP/GZIP writes. Larger first chunks use zlib-ng;
a large stream starting with a small chunk conservatively keeps stock zlib.
Parameter-only setup and zero-capacity compression calls defer selection.
Dictionary setup selects zlib-ng. Each stream keeps its backend until reset,
which can select a different backend and reuses the allocation when possible.
Inflater and native libzip consumers use the selected backend throughout.

C1 and C2 share a GC-safe ZIP runtime call. The interpreter and intrinsic
fallback reuse the existing JNI entry points.
Heap arrays are pinned during native processing; exception handling follows
unpinning. Java synchronization, buffer positions, memory-session handling,
counters and streaming semantics are preserved. Direct-to-direct Inflater calls
retain JNI. Deflater uses JNI for input chunks at most 1 KiB and, on AArch64,
chunks of at least 64 KiB. On x86-64, mixed-buffer Inflater calls retain JNI.
These call-path gates leave backend selection and stream state unchanged.

Bulk Adler32 gains interpreter and C1 entries using the existing SIMD stubs.
Existing C2 Adler32, CRC32 and CRC32C intrinsics are retained. Scalar Adler32
continues to use JNI; zlib-ng does not implement CRC32C.

Native consumers include ZIP/JAR class loading, CDS checksums, jimage
decompression and compressed heap dumps. Java ZIP/GZIP, ZIP filesystem and jlink
compression use the Deflater/Inflater integration. The pre-VM launcher and
splashscreen retain stock zlib.

## Vendoring and updates

The bundled release is [zlib-ng 2.3.3](https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.3).

- Archive: `https://codeload.github.com/zlib-ng/zlib-ng/tar.gz/refs/tags/2.3.3`
- SHA-256: `f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1`
- Sources: `src/java.base/share/native/libzip/zlib-ng/`
- License notice: `src/java.base/share/legal/zlib-ng.md`

Verify the new upstream release and archive checksum, then run from the
repository root:

```
python3 make/scripts/update-zlib-ng.py --archive /path/to/zlib-ng-VERSION.tar.gz \
    --version VERSION --sha256 VERIFIED_SHA256
```

The importer preserves upstream source bytes and file modes, removes obsolete
files and updates the license notice. No source patches are carried. Update
this provenance record when changing the version.

The build uses compatibility mode and private `jdk_ng_` symbols in libzip,
with the target compiler, archiver, flags, sysroot and target triplet.
Source/configuration changes recreate the private native build directory.
The archive is built even when the runtime option is disabled. Stock zlib and
the system-zlib configure option remain available.

## Tests and benchmarks

Regression coverage is in `test/hotspot/jtreg/compiler/intrinsics/zip/` and
`test/jdk/java/util/zip/`, including buffer combinations, dictionaries, reset,
parameter changes, malformed input, GC, AOT and tiny ZIP/GZIP streams.

The JMH benchmarks `ZipBackend`, `ZipBufferCalls` and `ZipStreamCalls` in
`test/micro/org/openjdk/bench/java/util/zip/` measure reusable streams, checksums,
buffer call overhead and complete ZIP/GZIP writes. Compare backend and intrinsic
flags independently in interpreter, C1 and C2; record CPU, revision, forks,
warmup, measurement settings and compressed sizes with the results.
