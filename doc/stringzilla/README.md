# StringZilla integration

StringZilla 5.3.0 accelerates eligible string searches and interpreter/C1 equality.
It is enabled by default; opt out with `-XX:-UseStringZillaIntrinsics`.
String representation, public APIs, range handling and Unicode semantics are preserved.

## Execution and dispatch

Package-private `java.lang.StringZilla` bridges call kernels in the existing
`libjava`. HotSpot owns the calling conventions; vendored headers stay outside
HotSpot. No additional library is required.

| Layer | Implementation |
| --- | --- |
| Interpreter | x86-64/AArch64 entries poll for safepoints and call bounded native leaves |
| C1 | Shared LIR calls native leaves; checked Java equality handles short inputs and large-array chunking |
| C2 | Reverse-search bridges call native leaves; existing forward, BMP character-search and equality intrinsics remain in use |
| JNI fallback | The same kernels and work limits through JVM entry points |

GCC/Clang x86 selects AVX2/AVX-512 using HotSpot capabilities and `UseAVX`.
AArch64 uses NEON; MSVC x64, Zero and other ports use serial kernels.
GCC/Clang use portable scalar loads for arbitrary byte-array offsets.
`System.registerNatives` publishes the immutable callback table with release/acquire
ordering; Java initialization reads its backend and the enable flag. Registration
is idempotent. Bootstrap equality has a VM-owned scalar fallback.

### Search dispatch

Search ranges use the logical string/builder length after public API normalization.
The shared reverse dispatcher sends prefixes below 32 source bytes directly to
the scalar helpers, without initializing `StringZilla`. UTF-16 helpers check both
physical array bounds before unchecked code-unit access.

| Entry | Source-size gate |
| --- | --- |
| Compiled substring search | 256 source bytes, followed by the rules below |
| Interpreted substring reverse search | 32 source bytes |
| Interpreted whole-string forward intrinsics | Every input size |
| Interpreted mixed reverse search with one candidate and needle at most 64 code units | Every input size |

Interpreter forward entries resume Java before native bootstrap, for malformed
UTF-16 arrays, for mixed needles over 64 code units, or beyond native work limits.
Short compiled forward searches remain inline.

For same-coder reverse search, `N` is the needle length, `L = fromIndex + N` the
searched prefix, `S = L - N` the span, and `W = (S + 1) * N` the comparison-work
estimate. These values use code units and 64-bit work arithmetic. C1/C2 fold the
tier query to a constant. After the compiled 256-byte gate, native eligibility is:

| Backend/tier | Latin-1 | UTF-16 |
| --- | --- | --- |
| Serial or NEON C1 | `N <= 256` or `W >= 1024` | `N <= 128` or `W >= 1024` |
| AVX2 C1 | `N <= 256`, `A`, or `W >= 1024` | `N <= 128` or `W >= 1024` |
| Serial C2 | `32 <= N <= 256 && L >= 1024`, or `N > 256 && W >= 4096` | `N <= 128 && L >= 512`, or `N > 128 && W >= 2048` |
| AVX2 C2 | `N <= 128`; `129 <= N <= 256 && W >= 1024`; or `N > 256 && (A || (S >= 32 && W >= 4096))` | `N <= 128 && L >= 512`, or `N > 128 && W >= 2048 && S >= 16` |
| NEON C2 | `N <= 256`, or `N > 256 && S >= 16 && W >= 4096` | `N <= 128 && L >= 512`, or `N > 128 && S >= 8 && W >= 2048` |
| AVX-512 C1/C2 | Source-size gate | Source-size gate |

`A` is the bounded AVX2 long-Latin-1 route: `N > 256 && S < 64 && L * N <= 4194304`.
It uses upstream byte search, sampled interior/end checks and equality for at most
64 candidate positions, avoiding long-needle preprocessing while preserving overlaps.
Larger windows use upstream substring search.

MSVC serial builds override the UTF-16 table: C1 needles of at most eight code
units and C2 needles of at most 128 code units retain Java search. C1 longer
needles retain the table's native eligibility. The compiler marker is separate
from the selected kernel backend.

The interpreter has no additional backend/work activation threshold after its
32-byte gate. Every route still observes the independent native safety guards.
Short same-coder immediate matches are checked before native setup; the interpreter's
UTF-16 probe uses bounded range equality. Compiled UTF-16 needles longer than 128
code units with at most eight candidates first reject impossible trailing characters.

Compiled fallback helpers keep scalar loop profiles separate from native interpreter
returns. Below the compiled size gate, C1 uses Java and C2 uses the existing JDK
character-search intrinsic to reject misses before the scalar loop. Serial C2
Latin-1 also skips empty 256-byte blocks. Ineligible NEON C2 UTF-16 needles below
128 code units and MSVC C2 needles through 128 use the JDK character filter.
C1 UTF-16 fallbacks and C2 long-needle fallbacks reject first-character mismatches
before comparing interiors.

Serial native UTF-16 needles of at most 128 code units use the portable aligned
filter. AVX2 needles longer than 128 code units use it for at most 32 candidates;
larger windows use upstream byte search. A single native candidate uses upstream
equality after the same work guards.

### Mixed UTF-16/Latin-1 reverse search

These routes apply after the tier's source-size gate, except the single-candidate
case. An immediate match returns before bulk dispatch.

| Input/backend | Rightmost-candidate verification |
| --- | --- |
| One possible start (`fromIndex == 0`) | Interpreter uses the bounded mixed kernel for `N <= 64`; otherwise backward Java verification |
| `N <= 8` | Shared Java immediate-match probe |
| `9 <= N <= 64`, serial C1 | Bounded single-candidate native call for `N >= 32`; backward Java probe for `N <= 31` |
| `9 <= N <= 64`, serial C2 | Backward Java probe |
| AVX2/NEON C1 | Backward Java probe for `9 <= N <= 16` |
| AVX2/NEON C2 | Backward Java probe for `9 <= N <= 32` |

After a rejected probe, MSVC serial C2 needles through 64 use the Java helper
with the JDK character-search intrinsic. Other eligible cases use native bulk
search; native fallback resumes Java. Interpreter bulk routing and C1 native
routes remain independent of that MSVC C2 choice.

For `N > 64`, a mismatching rightmost trailing character invokes bounded native
UTF-16 character filtering in the interpreter/C1. C2 uses a separate Java helper
with the JDK character intrinsic to skip empty 128-code-unit blocks.

For a matching trailing character, the interpreter compares the remaining suffix
backward in Java and verifies the first 64 code units with the bounded mixed kernel.
C1 uses this route through `N == 128`; NEON C2 also uses it for `N == 65`.
Other C2 immediate candidates with `65 <= N <= 128` use the existing mixed forward
intrinsic over exactly one candidate. A rejection resumes search at the preceding
start. Compiled immediate candidates longer than 128 retain Java verification.
The native widening cap remains 64 code units.

## Native contract and safepoints

Search bridges accept validated byte-array ranges and return relative byte offsets;
Java converts them to character indices. Builder searches use logical length,
including spare-capacity arrays. VM offsets follow the selected object-header layout.

| Native limit | Bound |
| --- | --- |
| Source length per call | 64 KiB |
| Substring work proxy: source bytes × needle bytes | 4,194,304 |
| Mixed needle widened into a fixed stack buffer | 64 code units |

Guards precede array reads. Excessive work returns `-2` for Java fallback;
`-1` denotes a miss. Mixed kernels reject invalid/oversized counts before widening.
These bounds limit leaf work, not elapsed time.

Large searches overlap windows by the needle length minus one code unit; needles
over half the allowed window retain Java search. Large interpreter/C1 equality uses
bounded range calls. Java backedges poll between calls, which derive fresh addresses
from rooted arrays. Long mixed suffix verification also polls in Java.

Odd-address UTF-16 byte matches are rejected. A portable C filter verifies aligned
candidates from the search-direction end; long needles also filter the adjacent
character. GCC/Clang compile an AVX2 version under the VM capability gate.
There are no handwritten SIMD search operations. Surrogates retain Java semantics.

Checked C1 equality and method handles preserve Java caller state and deoptimization.

## API coverage

| API family | Handling |
| --- | --- |
| `String.indexOf` / `lastIndexOf` substring overloads, including begin/end ranges | Shared Latin-1, UTF-16 and mixed helpers |
| `String.indexOf` / `lastIndexOf` code point overloads | Latin-1, BMP, surrogate code units and supplementary pairs; invalid points retain Java handling |
| `AbstractStringBuilder`, `StringBuilder`, `StringBuffer` searches | Existing delegation; logical length and synchronization preserved |
| `contains(CharSequence)`, `replace(CharSequence, CharSequence)`, single-character `split` | Existing calls inherit shared substring/character search |
| Class loading, reflection, modules, file attributes and pattern quoting | Existing `String` search callers inherit the same paths |
| `String.equals`, both coders | Interpreter/C1 bounded equality; C2 retains its JDK intrinsic |
| `String.contentEquals` | String arguments delegate to equality; same-coder builders retain `ArraysSupport.mismatch`; mixed builders and arbitrary sequences retain code-unit access |
| `startsWith`, `endsWith`, exact `regionMatches` | Existing range-mismatch intrinsics and mixed-coder comparisons |
| Arbitrary `CharSequence`, `CharBuffer`, `CharSequence.compare`, regex engines | Existing sequence access and specialized implementations; no contiguous byte-array contract |
| Lexical/case-insensitive comparison, hashing, case conversion and encoding | Existing Java ordering, hash, Unicode and charset semantics |
| Array equality/mismatch, copy, inflate/compress and builder mutations | Existing intrinsics, allocation and write barriers |
| Lines, `trim`, `strip`, `isBlank`, indent/stripIndent helpers | Existing CR/LF and Unicode-classification scanners |

## Vendoring and updates

The 28 upstream files are pinned to StringZilla 5.3.0,
commit `86d73f1021e6cce022c3cceb1f7837eb50338774`, under Apache-2.0.
[UPSTREAM.json](../../src/java.base/share/native/libjava/stringzilla/UPSTREAM.json)
records upstream, patch and patched-file SHA-256 hashes.
[The shipped notice](../../src/java.base/share/legal/stringzilla.md) contains the
license; independent Classpath-excepted adapters follow `ADDITIONAL_LICENSE_INFO`.

The [5.3.0 release notes](https://github.com/ashvardanian/StringZilla/releases/tag/v5.3.0)
describe reverse-search improvements already present in the previous upstream pin.
The vendored upstream search/compare headers are unchanged; upstream `types.h` adds
alignment-sanitizer annotations. The version upgrade alone does not improve these paths.

Two tracked patches apply to the pin; the other 26 files are unmodified:

* [Reverse overlaps](../../src/java.base/share/native/libjava/stringzilla/patches/0001-preserve-reverse-search-overlaps.patch)
  preserves overlapping suffix candidates after a rejected long-needle prefix and
  skips impossible prefixes with upstream byte search.
* [MSVC baseline bit operations](../../src/java.base/share/native/libjava/stringzilla/patches/0002-msvc-baseline-bit-operations.patch)
  uses baseline bit scans and portable population counts, preserving zero-input
  results without requiring BMI1, LZCNT or POPCNT.

```sh
python3 make/scripts/update-stringzilla.py --verify
python3 make/scripts/update-stringzilla.py --version NEW_VERSION --commit FULL_UPSTREAM_COMMIT_SHA
```

The updater downloads the pinned dependency closure, applies patches in a temporary
directory, refreshes hashes/license text and removes obsolete headers. It rejects
fuzz/reversed patches and leaves the checkout untouched on failure. Review each patch
against the new immutable pin; remove it only when upstream includes its fix.
Rebuild x86-64/AArch64 and rerun functional/tier-specific performance checks.

## Validation and benchmarks

Complete-image qualification of the revised dispatch at `adbea61e47c` is in
progress on native x64 GCC 16 serial/AVX2, ARM64 NEON and Windows MSVC serial.
Each host builds matched untouched-base and fork images; enabled/disabled controls
share the same complete fork image. The [native image report](measurements/NATIVE_IMAGE_BENCHMARKS.md)
and [raw records](measurements/native-image-results.json) retain source/image hashes,
raw timings and every higher enabled mean. Qualification of the revised routes
on ARM/MSVC remains pending until those runs complete.

The [native receipt](measurements/native-sanitizer-validation.json) separately pins
earlier kernel checks: GCC 16 ASan/UBSan with alignment checks passed on x64
serial/AVX2/AVX-512 and native ARM64 serial/NEON. AVX-512 ran in a separate
successful job; another x64 host skipped it. MSVC 14.44 bit-operation runtime
and baseline-assembly checks passed. These checks cover the recorded kernel
sources and bit operations, without claiming whole-JDK sanitization or validating
later Java dispatch changes.

The previous `90e763c6758` snapshot passed
[190 local jtreg tests](measurements/complete-image-validation.json), with zero
failures/errors and two platform exclusions, and
[57 CI jobs](measurements/complete-image-ci.json): release/debug builds and tier1
tests on Linux x64/AArch64, macOS AArch64 and Windows x64. Those receipts qualify
that snapshot, not later changes.

Tests cover forced C1/C2 callers, JNI, opt-out, thresholds/windows, long repeated
needles/overlaps, coders, surrogates, builder mutations/capacity, concurrent GC and
caller state. Native tests exercise executable backends and work limits.

```sh
make CONF=cloud JOBS=2 test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/jdk/java/lang/StringBuilder jtreg:test/jdk/java/lang/StringBuffer jtreg:test/hotspot/jtreg/compiler/intrinsics/string jtreg:test/jdk/java/lang/System/LoggerFinder' \
  'JTREG=JOBS=1;TIMEOUT_FACTOR=4'
```

Disable individual intrinsics with
`-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=...`.
Search bridges use `_stringzilla*` names. Equality uses `_equalsL`,
`_equalsLChecked` and `_stringzillaEqualsRange`; disabling `_equalsL` also disables
its checked alias. Disable existing `_indexOf*` intrinsics as well to exercise
compiled JNI fallback for every search.

[BENCHMARKS.md](BENCHMARKS.md) describes the measurement method and preserves previous
complete-image and historical patched-class campaigns separately.
