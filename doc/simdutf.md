# simdutf bulk intrinsics

This integration vendors simdutf v9.2.1 and adds optional bulk operations to
HotSpot and `java.base`. Enable it with:

```sh
java -XX:+UseSIMDUTFIntrinsics ...
```

`UseSIMDUTFIntrinsics` is a product flag, disabled by default. The product flag
`SIMDUTFMinLength` defaults to 256 input elements (bytes or UTF-16 code units,
depending on the operation). Inputs below that threshold use the existing Java
implementation. The maximum leaf input is 1,048,576 elements; larger inputs also
use Java, bounding time without a safepoint. The threshold accepts values from
1 through `max_jint`.

## Execution layers and safety

`jdk.internal.util.SimdUTF.process0` is a private native intrinsic candidate.
The interpreter has x86-64 and AArch64 entries, C1 emits a C ABI leaf call, and
C2 emits a leaf call with a full memory effect. They all call the same checked
HotSpot implementation. If the intrinsic is disabled or unavailable, registered
JNI calls the same implementation. JNI does not copy or pin arrays.

The leaf checks array types, offsets, lengths, destination capacity and aliasing
before obtaining element addresses. Raw array addresses remain live only in a
non-safepointing region. UTF-16/UTF-32 writers reserve their worst-case output
space or use simdutf's capacity-bounded interfaces, including for mutable array
inputs. Java retains exception, replacement, buffer-position and BOM handling.
Validation precedes writes on conversions that request Java fallback. ASCII
counting and Latin-1 narrowing return the precise representable prefix.

ISA selection runs once during `System.initPhase1`; earlier bootstrap calls
skip acceleration. On x86-64 it selects simdutf's icelake, haswell or westmere
implementation, respecting `UseAVX`, `UseSSE`, CPU features and OS support. On
AArch64 it selects the arm64 implementation. Unsupported ports or disabled ISA
support retain Java behavior.

Existing C2 ASCII, inflate, narrow and Base64 stubs avoid the C ABI overhead.
They remain intrinsic candidates, and C2 declines the corresponding simdutf
operations. Interpreter and C1 can still accelerate those same operations.
Consequently enabling simdutf does not require replacing every execution tier.

## Applicability audit

| Operation or entry point | Integration |
| --- | --- |
| `String` UTF-8 constructors and internal throwing decode helpers | Valid UTF-8 to native UTF-16 bulk conversion; malformed input uses the original loop |
| `String.getBytes(UTF_8)` and internal throwing encode helpers | Latin-1/native UTF-16 to UTF-8; existing ASCII clone/copy paths retained |
| `String.encodedLength(UTF_8)` | Latin-1 and validated UTF-16 length calculation |
| `StringCoding.countPositives`, ASCII encode and ISO encode helpers | Shared ASCII validation/prefix and narrowing operations |
| `StringLatin1.inflate` / `StringUTF16.compress` | Latin-1 expansion and exact-prefix narrowing; C2 retains its existing intrinsics |
| `UTF_8` array charset encoder/decoder | Bulk UTF-16/UTF-8 conversion with Java overflow/error fallback |
| `US_ASCII` / `ISO_8859_1` array codecs | Their shared String/JavaLangAccess helpers reach counting, expansion and narrowing |
| UTF-16, UTF-16BE, UTF-16LE and BOM variants | Array encoder/decoder bulk validation, copying and endian conversion after BOM handling |
| UTF-32, UTF-32BE, UTF-32LE and BOM variants | Array encoder/decoder bulk conversion; UTF-32 surrogate code points retain Java's permissive decoder path |
| `CharsetEncoder.canEncode(CharSequence)` for Unicode, ASCII and Latin-1 | Strings use their internal coder/value without a temporary array; array-backed CharBuffers use their remaining range |
| `CharSequence` implementations without accessible array storage | Existing scalar validation; no speculative copying or public API changes |
| Basic/URL Base64 arrays, strings and heap ByteBuffers | Existing block helpers use bulk encode/decode; padding and incomplete atoms remain Java |
| Base64 output streams | Batch writes reuse the encoder block helper; leftovers, padding, MIME line lengths and newlines remain Java |
| MIME Base64 decoding | Existing permissive helper retained, avoiding repeated bulk attempts across separators |
| Base64 input streams | Existing incremental decoder retained; reading ahead would alter stream consumption behavior |
| Direct/read-only buffers and insufficient output capacity | Existing buffer loops; no raw native addresses or temporary bulk copies |
| Modified UTF-8 in JNI, class files, serialization and `DataInput`/`DataOutput`; CESU-8 | Existing dialect-specific code retained: NUL/surrogate encodings differ from strict UTF-8 |
| Legacy charset mapping tables, string comparisons, hashing and iteration | Existing implementations; these are not compatible bulk Unicode transcoding operations |
| Identity ASCII/Latin-1 byte copies | Existing clone/arraycopy paths retained |

## Updating the vendor

The amalgamated sources are unmodified upstream output, generated with UTF-8,
UTF-16, UTF-32, Latin-1, ASCII and Base64 enabled. `UPSTREAM` records the release,
commit and feature selection. The updater checks a clean tracked checkout,
an exact stable release tag at least v9.2.1, and its version header. It regenerates
both source files and the MIT/ISA-detector BSD notices.

```sh
git clone https://github.com/simdutf/simdutf /tmp/simdutf-upstream
git -C /tmp/simdutf-upstream checkout v9.2.1 # select the desired stable release
python3 make/scripts/update-simdutf.py /tmp/simdutf-upstream
git diff -- src/hotspot/share/thirdparty/simdutf src/java.base/share/legal/simdutf.md
```

Only the upstream translation unit bypasses HotSpot's precompiled header.
Upstream feature-filtering warnings are suppressed for that file; undefined
optional feature macros are also suppressed for the bridge that includes its
header. Global warning policy stays unchanged.

After an update, rebuild x86-64 and AArch64 HotSpot, run the contracts in all
tiers and through JNI, run the existing charset/String/Base64 suites, and
repeat the performance comparison before changing the default threshold.

## Validation and measurements

The new jtreg contract runs the interpreter, C1, C2, intrinsic-disabled JNI
and flag-disabled paths. It exercises independent UTF byte oracles, offsets,
canaries, narrowing prefixes, malformed input, overflow, BOMs, byte orders,
Base64 dialects/in-place calls/streams, inaccessible buffer storage, and native
type/range/alias checks. Additional runs cover disabled ISA support, compact
strings disabled, ZGC and Shenandoah.

The JMH benchmark is `org.openjdk.bench.java.lang.SimdUTF`. It measures public
String/charset/Base64 operations, validation and encoded lengths; it does not
time the native bridge in isolation. See [benchmark results](simdutf/results.md)
for baseline-versus-enabled per-tier measurements and reproduction details.
