# ZIP intrinsics and optional zlib-ng backend

Linux x86_64 and AArch64 builds include unmodified zlib-ng 2.3.3 sources alongside
stock zlib. Stock zlib retains the default compression format and ratio. ZIP
call intrinsics and the interpreter/C1 Adler32 entries are available independently
of the compression library on Linux x86_64 and AArch64. Enable the alternative with:

```
java -XX:+UseZlibNG ...
```

`-XX:+UnlockDiagnosticVMOptions -XX:-UseZipIntrinsics` selects the original
Deflater/Inflater JNI calls with either library. This separates library improvements from
call overhead improvements. `UseAdler32Intrinsics`, `UseCRC32Intrinsics`, and
`UseCRC32CIntrinsics` retain their existing meanings.

The option enables a hybrid compression policy. A fresh Deflater receiving
at most 1 KiB in its first input chunk selects stock zlib, including ordinary
DeflaterOutputStream, ZIP and GZIP writes before `finish()`. Larger first chunks
select zlib-ng. A large stream starting with a small chunk conservatively keeps
stock zlib; the implementation does not predict the total stream size. Dictionary setup selects zlib-ng. Selection occurs before
any data or dictionary is processed and stays fixed until reset. Reset may select
a different backend for the next stream; it reuses the allocation when selection
stays the same. Initialization is delayed until an operation with output capacity to avoid
allocating both libraries. Zero-capacity calls do not consume input or commit
selection; fresh-stream parameter changes are retained for later initialization. Inflater and native libzip consumers use zlib-ng
throughout. The same selected library initializes, processes, resets, supplies
dictionaries for, and ends a stream. zlib-ng uses its
zlib-compatible ABI and a private `jdk_ng_` symbol prefix. It is linked into
libzip, and its own CPU dispatch selects supported instructions at runtime.
Neither the stock zlib sources nor the system-zlib configure option are replaced.
Unsupported platforms reject an explicitly enabled `UseZlibNG` flag.

## Call paths and coverage

| Operation | Interpreter | C1 | C2 |
| --- | --- | --- | --- |
| Deflater / Inflater, except direct-to-direct inflation | JNI fallback enters a shared VM routine that pins both arrays in one VM entry | Runtime1 intrinsic calls the shared routine | GC-safe runtime intrinsic calls the shared routine |
| Inflater, direct-to-direct buffers | Existing JNI entry | Existing JNI entry | Existing JNI entry |
| Adler32 arrays and direct buffers | Existing SIMD stub gains an interpreter entry | Existing SIMD stub gains a C1 intrinsic | Existing SIMD intrinsic |
| CRC32 arrays, direct buffers, and single bytes | Existing machine-code intrinsic | Existing machine-code intrinsic | Existing machine-code intrinsic |
| CRC32C arrays and direct buffers | Existing machine-code intrinsic | Existing machine-code intrinsic | Existing machine-code intrinsic |

Compression uses a normal runtime call, with oop handles, collector pinning,
JVMTI deferred suspension, a walkable Java frame, and a transition to native
state. This permits safepoints during a long call and avoids the individual JNI
critical-array transitions. Exceptions are reported after both arrays are
unpinned, including Inflater's input/output accounting on malformed data.
Direct-to-direct Inflater calls retain JNI: there are no heap-array transitions
to remove, and measurements on x86_64 and AArch64 found less call overhead with
the existing JNI entry. Heap and mixed buffer calls retain the runtime intrinsic.
Call-path selection may change within a stream when buffer shapes change; the
native backend and stream state stay the same.

All existing Java range checks, synchronization, buffer positions, memory-session
acquisition/release, streaming semantics, and packed return values are retained.
C1 has its own Runtime1 stub; it does not require the C2 compiler to initialize.

The existing checksum stubs already handle short buffers without a JNI call.
Library selection does not replace CRC32 or CRC32C stubs with library calls.
CRC32C uses the Castagnoli polynomial, which neither candidate library supplies.
Checksum JNI fallbacks, including single-byte Adler32 updates, use zlib-ng
where applicable. Single-byte Adler32 retains JNI; this change accelerates the
bulk paths rather than introducing a scalar checksum stub.

The native libzip entry points also cover class-loader ZIP/JAR inflation,
CDS archive and class-file CRC32 verification, libjimage decompression through `ZIP_InflateFully`, and gzip heap-dump compression
through `ZIP_GZip_Fully`. Java consumers include ZIP/GZIP streams, ZIP files,
ZIP filesystem operations, JAR handling, and jlink compression through
Deflater/Inflater. The launcher's pre-VM ZIP parser and splashscreen PNG decoding
retain stock zlib: they run before this VM flag is available and do not have JNI
call overhead to remove.

## Upstream verification and updates

The latest stable release was verified using the live GitHub latest-release redirect on
2026-10-05: <https://github.com/zlib-ng/zlib-ng/releases/tag/2.3.3>.
The source archive is:

- URL: `https://codeload.github.com/zlib-ng/zlib-ng/tar.gz/refs/tags/2.3.3`
- SHA-256: `f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1`

For an update, first verify the new upstream release and archive checksum. Then
run the importer from the repository root:

```
python3 make/scripts/update-zlib-ng.py --archive /path/to/zlib-ng-VERSION.tar.gz \
    --version VERSION --sha256 VERIFIED_SHA256
```

The importer keeps the build/library sources byte-for-byte, preserves file modes,
removes obsolete imported files, and updates `src/java.base/share/legal/zlib-ng.md`.
No source patches are carried. Configuration and compiler feature checks run
out of tree with the OpenJDK target compiler, archiver, flags, sysroot compile/link
flags, and target triplet. The vendor archive is built even when UseZlibNG is off.
The build recreates its private native output directory after source or
configuration changes, so obsolete objects and CPU-feature settings do not
survive an update. Review upstream compatibility/version changes, update this provenance record,
and rerun the regression and performance matrix before changing the version.

## Library comparison and validation

libdeflate 1.26 was also verified live:
<https://github.com/ebiggers/libdeflate/releases/tag/v1.26>. Its source archive
SHA-256 is `bba03fffc5538576213675ce6968fcff6ce2e67d82e4d5febea2d05f9f13cf85`.
libdeflate is designed for whole-buffer compression and decompression. It cannot
replace Java's streaming API, dictionary handling, and flush/parameter changes.
The native comparison source, reproduction instructions, compressed sizes, and
measured results are in `test/micro/native/zip/`. The comparison accepts levels
1 through 9 and records both timed compression and compressed output size;
equal levels can produce different ratios. Actual Java source, HotSpot source,
and documentation corpora qualify the speed/size tradeoff separately. Native results and JVM results
are reported separately so a whole-buffer speedup is not represented as a
streaming JVM result.

Run the targeted tests with the backend enabled, disabled, in the interpreter,
and in each JIT tier. The new `compiler/intrinsics/zip/TestZlibNG.java` test also
covers buffer combinations, dictionaries, reset, counters, malformed input, and
concurrent GC. Existing ZIP and compiler checksum tests cover flush modes,
strategies, stream consumers, checksum correctness, and ABI register preservation.

The JMH benchmark `org.openjdk.bench.java.util.zip.ZipBackend` measures reusable
streams and checksum updates for short and long inputs with both text and random
data. It resets each stream for every operation and verifies completion. Record
CPU, JDK revision, flags, forks, warmup, measurement duration, allocation behavior,
and compressed sizes when reporting results. Decompression inputs are generated
by the selected backend in setup; the uncompressed input is identical across
runs, but compressed representations can differ.

The `ZipBufferCalls` JMH benchmark isolates Inflater call overhead across heap and
direct input/output combinations. Compare `UseZipIntrinsics` on and off with
`UseZlibNG` enabled under `-Xint`, `-XX:TieredStopAtLevel=1`, and
`-XX:-TieredCompilation`. It uses the same encoded input for these comparisons,
checks the decoded bytes during setup, and verifies completion on every call.
Direct-to-direct calls use JNI with either flag setting; heap and mixed buffer
combinations measure the intrinsic call path against JNI.
