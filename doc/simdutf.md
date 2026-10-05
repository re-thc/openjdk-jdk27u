# simdutf bulk intrinsics

This fork vendors simdutf v9.2.1 and enables its bulk operations in HotSpot and
`java.base` by default on supported x86-64 and AArch64 systems. Opt out with:

```sh
java -XX:-UseSIMDUTFIntrinsics ...
```

`UseSIMDUTFIntrinsics` is a product flag, enabled by default. The product flag
`SIMDUTFMinLength` has a portable default of 256 input elements. Enabled x86-64
VMs select 32 through the usual CPU flag ergonomics unless the user sets it
explicitly. Elements mean bytes or UTF-16 code units, depending on the operation.
VMs with compilation enabled share operation-specific Java floors: 256 input
bytes for UTF-8 decode; 128 for UTF-8 encoding, compact UTF-8 decode, Base64
decode and code-point counting; and 64 for ASCII/Latin-1 validation, UTF-8
encoded lengths and UTF-32 decode. All floors are input elements: UTF-8 encode
and code-point counts use UTF-16 units, while the decoders use encoded bytes.
This keeps interpreted/C1 profiles consistent with C2 fallback and lets C2
compile the original short loops. Pure interpreter VMs (`-Xint`) use the base
threshold. Existing C2 copy/narrow/inflate/Base64 stubs remain in use.
An explicit `-XX:SIMDUTFMinLength=N` overrides these automatic floors in every
tier, allowing a uniform threshold experiment. Existing C2 intrinsics remain
in use regardless of that override. AArch64 keeps 256 pending runtime tuning.
Inputs below their effective threshold use the existing Java implementation.
The maximum leaf input is 1,048,576 elements; larger inputs also
use Java, bounding time without a safepoint. The threshold accepts values from
1 through `max_jint`.

## Execution layers and safety

`jdk.internal.util.SimdUTF.process0` is a private native intrinsic candidate.
The interpreter has x86-64 and AArch64 entries, C1 emits a C ABI leaf call, and
C2 emits a leaf call with a full memory effect. They all call the same checked
HotSpot implementation through a raw `oopDesc*` ABI; checked C++ `oop` wrappers
are constructed inside the leaf, preserving the calling convention in
fastdebug builds. C1 registers the leaf in `Runtime1::name_for_address` for
runtime-call verification and diagnostics on both architectures. C2 escape
analysis treats the leaf array arguments as `ArgEscape`: their allocations
remain materialized, and the leaf never retains or stores object references.
If the intrinsic is disabled or unavailable, registered
JNI calls the same implementation. JNI does not copy or pin arrays.

The leaf checks array types, offsets, lengths, destination capacity and aliasing
before obtaining element addresses. Latin-1 to UTF-8 reserves two output bytes
per input byte before conversion, so success never reports a truncated prefix.
Latin-1 and UTF-16 UTF-8 encoding use direct converters when the output has
worst-case capacity. Tight UTF-16 output uses a bounded converter and checks
both its error and consumed-input count, including when the input changes.
Raw array addresses remain live only in a
non-safepointing region. UTF-16/UTF-32 writers reserve their worst-case output
space or use simdutf's capacity-bounded interfaces, including for mutable array
inputs. Java retains exception, replacement, buffer-position and BOM handling.
Validation precedes writes on conversions that request Java fallback. ASCII
counting and ASCII/Latin-1 narrowing return the precise representable prefix.
Compact UTF-8 decoding can shrink a stable input copy in place to Latin-1.
Tightly sized UTF-32 outputs use bounded stack staging and capacity checks;
mutable inputs cannot enlarge an unchecked write beyond the output array.

ISA selection runs once during `System.initPhase1`; earlier bootstrap calls
skip acceleration. On x86-64 it selects simdutf's icelake, haswell or westmere
implementation, respecting `UseAVX`, `UseSSE`, CPU features and OS support. On
AArch64 it selects the arm64 implementation. Unsupported ports or disabled ISA
support retain Java behavior.

Existing C2 ASCII, inflate, narrow and Base64 stubs avoid the C ABI overhead.
They remain intrinsic candidates, and C2 declines the corresponding simdutf
operations. Interpreter and C1 can still accelerate those same operations.
UTF-8 charset array loops handle their ASCII prefix before attempting simdutf
on the remaining Unicode input. This also preserves the existing ASCII codec
intrinsics and avoids validation/conversion passes over an all-ASCII buffer.
Consequently enabling simdutf does not require replacing every execution tier.

## Applicability audit

| Operation or entry point | Integration |
| --- | --- |
| `String` UTF-8 constructors and internal throwing decode helpers | Valid UTF-8 to compact Latin-1 or native UTF-16 bulk conversion; malformed input uses the original loop |
| `String.getBytes(UTF_8)` and internal throwing encode helpers | Latin-1/native UTF-16 to UTF-8; existing ASCII clone/copy paths retained |
| `String.encodedLength(UTF_8)` | Latin-1 and validated UTF-16 length calculation |
| `StringCoding.countPositives`, ASCII encode and ISO encode helpers | Shared ASCII validation/prefix and narrowing operations |
| `StringLatin1.inflate` / `StringUTF16.compress` | Latin-1 expansion and exact-prefix narrowing; C2 retains its existing intrinsics |
| `StringUTF16.toBytes` / `getChars`, including char-array constructors and `toCharArray` | Checked raw UTF-16 copying accelerates interpreter/C1 and preserves isolated surrogates; C2 keeps its copy intrinsics |
| `UTF_8` array charset encoder/decoder | Bulk UTF-16/UTF-8 conversion with Java overflow/error fallback |
| `US_ASCII` / `ISO_8859_1` array codecs | Their shared String/JavaLangAccess helpers reach counting, expansion and narrowing |
| UTF-16, UTF-16BE, UTF-16LE and BOM variants | Array encoder/decoder bulk validation, copying and endian conversion after BOM handling |
| UTF-32, UTF-32BE, UTF-32LE and BOM variants | Array encoder/decoder bulk conversion, including exactly sized decoder output; UTF-32 surrogate code points retain Java's permissive decoder path |
| `CharsetEncoder.canEncode(CharSequence)` for Unicode, ASCII and Latin-1 | Strings use their internal coder/value without a temporary array; array-backed CharBuffers use their remaining range |
| `String`, builder and `Character` code-point counts | Validated UTF-16 uses bulk counting; split pairs and isolated surrogates use Java's original counting semantics; `Character` delegates String sequences without copying |
| `CharSequence` implementations without accessible array storage | Existing scalar validation; no speculative copying or public API changes |
| Basic/URL Base64 arrays, strings and heap ByteBuffers | Existing block helpers use bulk encode/decode; padding and incomplete atoms remain Java |
| Base64 output streams | Batch writes reuse the encoder block helper; leftovers, padding, MIME line lengths and newlines remain Java |
| MIME Base64 decoding | Existing permissive helper retained, avoiding repeated bulk attempts across separators |
| Base64 input streams | Existing incremental decoder retained; reading ahead would alter stream consumption behavior |
| `InputStreamReader` / `OutputStreamWriter`, channel readers/writers and stream codecs | Their array-backed `StreamDecoder` / `StreamEncoder` buffers reach the charset paths above; partial atoms and buffer overflow remain Java |
| `URLEncoder` / `URLDecoder` and foreign-memory string helpers | Heap-buffer charset calls and materialized `String` byte conversions inherit the existing integration; percent escaping and memory access stay in their original helpers |
| Direct/read-only buffers and insufficient output capacity | Existing buffer loops; no raw native addresses or temporary bulk copies |
| Modified UTF-8 in JNI, class files, serialization and `DataInput`/`DataOutput`; CESU-8 | Existing dialect-specific code retained: NUL/surrogate encodings differ from strict UTF-8 |
| Legacy charset mapping tables, string comparisons, hashing and iteration | Existing implementations; these are not compatible bulk Unicode transcoding operations |
| Identity ASCII/Latin-1 byte copies | Existing clone/arraycopy paths retained |

Remaining performance gaps include inputs above the 1,048,576-element leaf
limit, exactly sized UTF-8 decoder outputs smaller than the input byte count,
array-inaccessible buffers and short C1 inputs held back by shared Java floors.
The UTF-8 decoder currently reserves its worst-case output size to remain safe
with mutable input. Tighter output needs bounded staging, not just a length
preflight followed by an unchecked writer. ARM64 crossover measurements and
exact-head public API benchmarks also remain outstanding.

Additional candidates need separate evidence: MIME Base64 can use simdutf's
garbage-accepting mode, but Java must still track consumed input separately
from produced output and preserve its padding/error rules. Large inputs could
be chunked at complete code-point/atom boundaries with Java safepoints between
leaves. Code-point iteration and offset queries also need their own range and
unpaired-surrogate semantics; validating a whole sequence for a short query
can cost more than the existing loop. These are follow-up candidates, rather
than silently omitted paths or assumptions of compatible semantics.

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
git diff -- src/utils/simdutf src/java.base/share/legal/simdutf.md
```

Only the upstream translation unit bypasses HotSpot's precompiled header.
Upstream feature-filtering warnings are suppressed for that file; undefined
optional feature macros are also suppressed for the bridge that includes its
header. Global warning policy stays unchanged.

After an update, rebuild x86-64 and AArch64 HotSpot, run the contracts in all
tiers and through JNI, run the existing charset/String/Base64 suites, and
repeat the performance comparison before changing the default threshold.

The unmodified amalgamation lives under `src/utils/simdutf`, alongside other
externally supplied utilities. It is compiled explicitly into HotSpot. This
keeps upstream include ordering out of HotSpot's source-style tests without
editing the vendor or weakening those tests. Zero and other unsupported VMs
retain their portable fallback without referencing architecture-only features.

## Validation and measurements

The new jtreg contract runs the interpreter, C1, C2, intrinsic-disabled JNI
and flag-disabled paths. It exercises independent UTF byte oracles, offsets,
canaries, narrowing prefixes, malformed input, overflow, BOMs, byte orders,
Base64 dialects/in-place calls/streams, inaccessible buffer storage, and native
type/range/alias checks. Prior manual runs also covered disabled ISA support, compact
strings disabled, ZGC and Shenandoah.

On a fresh configured build, run the contracts and the existing public API
tests with the feature enabled:

```sh
make test CONF=your-build \
    TEST='test/jdk/jdk/internal/util/SimdUTF/SimdUTFTest.java test/jdk/java/lang/String test/jdk/sun/nio/cs test/jdk/java/util/Base64'
```

Configure with `--with-jtreg=/path/to/jtreg` if jtreg was not found. To bypass
the make driver when a built JDK is already available:

```sh
"$BOOT_JDK/bin/java" -jar "$JT_HOME/lib/jtreg.jar" \
    -jdk:/path/to/proposed-jdk -othervm \
    -w:/tmp/simdutf-jtreg-work -r:/tmp/simdutf-jtreg-report \
    test/jdk/jdk/internal/util/SimdUTF/SimdUTFTest.java \
    test/jdk/java/lang/String test/jdk/sun/nio/cs test/jdk/java/util/Base64
```

GitHub Actions includes a `jdk/simdutf` test matrix entry using the existing
build bundles and jtreg setup. Both it and ordinary tier-one execution use the
fork's default enabled behavior on every configured runtime platform,
including x86-64 and AArch64. The contract asserts the default flag value and
separately checks `-XX:-UseSIMDUTFIntrinsics` disables acceleration.
Test reports and `.jtr` logs use the existing
artifact upload path. The dedicated suite selects fastdebug bundles when
available; the static configuration uses its release image. Eight ordinary
`@run` modes separately cover tiers,
JNI fallback and disabled behavior, including explicit 48 MB code caches in
interpreter and tiered VMs. These catch branches to native functions that cannot
rely on the code cache's internal branch range.
Four additional fastdebug runs enable `CheckUnhandledOops` across interpreter,
C1, C2 and JNI execution to check the native object-pointer boundary.

Alpine/musl is excluded by the repository's existing default platform list in
`.github/workflows/main.yml`. Its build can be selected explicitly with the
manual workflow's `platforms` input set to `alpine-linux-x64`; a skipped default
job does not qualify musl. Performance qualification uses the reproducible JMH
runner below and remains separate from correctness CI.

jtreg requires a harness JVM and additional test JVMs. `pthread_create(EAGAIN)`
during their startup is a host resource failure, before test execution. Lowering
test concurrency cannot recover an exhausted process namespace; use a fresh
runner and preserve the failing `.jtr` startup log rather than treating it as
a charset assertion failure.

The JMH benchmark is `org.openjdk.bench.java.lang.SimdUTF`. Its 33 cases measure public
String/charset/Base64 operations, validation and encoded lengths; it does not
time the native bridge in isolation. See [benchmark results](simdutf/results.md)
for baseline-versus-enabled per-tier measurements and reproduction details.
