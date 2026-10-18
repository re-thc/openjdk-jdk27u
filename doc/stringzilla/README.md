# StringZilla integration

StringZilla 5.3.0 accelerates eligible string searches and interpreter/C1 equality.
It is enabled by default; opt out with `-XX:-UseStringZillaIntrinsics`.
Public APIs, string representation, range handling and Unicode semantics are preserved.

## Execution

Package-private `java.lang.StringZilla` bridges call kernels in the existing
`libjava`. HotSpot owns the calling conventions; vendored headers remain outside
HotSpot. No additional shared library is required.

| Layer | Implementation |
| --- | --- |
| Interpreter | x86-64/AArch64 entries poll before forming heap addresses and call bounded native leaves |
| C1 | Shared LIR calls native leaves; checked equality preserves caller state and handles large arrays in Java |
| C2 | Reverse-search bridges call native leaves; existing forward, BMP forward-character and equality intrinsics remain in use |
| JNI fallback | The same kernels and work limits through JVM entry points |

GCC/Clang x86 selects AVX2 or AVX-512 using HotSpot capabilities and `UseAVX`.
The AVX-512 selection also requires the AVX2/BMI/LZCNT prerequisites.
AArch64 uses NEON; MSVC x64, Zero and other ports use serial kernels.
GCC/Clang use portable scalar loads because byte-array offsets need not be
word-aligned. An immutable callback table is published with release/acquire
ordering during `System.registerNatives`; bootstrap equality has a VM scalar
fallback. Registration is idempotent.

## Search dispatch

All sizes below describe the logical search range after public API normalization.
UTF-16 helpers check both physical array ends before unchecked code-unit access.
The shared reverse dispatcher sends prefixes below 32 source bytes directly to
the scalar helpers, without initializing `StringZilla`.

| Entry | Initial source-size gate |
| --- | --- |
| Compiled substring search | 256 source bytes |
| Interpreted substring reverse search | 32 source bytes |
| Interpreted whole-string forward intrinsics | Every input size |
| Interpreted mixed reverse search with one candidate and needle at most 64 code units | Every input size |

Interpreter forward entries resume Java before native bootstrap, for malformed
UTF-16 arrays, for mixed needles over 64 code units, or beyond the native work
limits. Short compiled forward searches remain inline.

### Same-coder reverse search

Let `N` be the needle length, `L = fromIndex + N` the searched prefix,
`S = L - N` the span, and `W = (S + 1) * N` the comparison-work estimate.
Lengths use code units; work arithmetic uses 64 bits. C1/C2 fold the tier query
to a constant. After the compiled source-size gate, native eligibility is:

| Backend/tier | Latin-1 | UTF-16 |
| --- | --- | --- |
| Serial or NEON C1 | `N <= 256` or `W >= 1024` | `N <= 128` or `W >= 1024` |
| AVX2 C1 | `N <= 256`, `A`, or `W >= 1024` | `N <= 128` or `W >= 1024` |
| Serial C2 | `32 <= N <= 256 && L >= 1024`, or `N > 256 && W >= 4096` | `N <= 128 && L >= 512`, or `N > 128 && W >= 2048` |
| AVX2 C2 | `N <= 128`; `129 <= N <= 256 && W >= 1024`; or `N > 256 && (A || (S >= 32 && W >= 4096))` | `N <= 128 && L >= 512`, or `N > 128 && S >= 16 && W >= 2048` |
| NEON C2 | `N <= 256`, or `N > 256 && S >= 16 && W >= 4096` | `N <= 8 && L >= 1024`; `9 <= N <= 128 && L >= 512`; or `N > 128 && S >= 8 && W >= 2048` |
| AVX-512 C1/C2 | Source-size gate | Source-size gate |

`A` is the AVX2 bounded long-Latin-1 route:
`N > 256 && S < 64 && L * N <= 4194304`.
It combines upstream byte search, sampled character checks and equality for at
most 64 candidate starts. AVX-512 uses the same filter for these narrow windows.
Wide AVX2 Latin-1 and UTF-16 searches, NEON UTF-16 searches, and long serial
searches inspect at most three aligned candidates before resuming bulk search
once. After a rejection, a bounded needle scan probes up to three distinct
mismatching byte values with upstream byte search. An absent value rejects the
remaining window; otherwise the selected hit shortens the next search. AVX-512 wide search retains its single sampled probe;
NEON Latin-1 retains its bulk route. Shortened prefixes preserve every earlier
overlapping candidate.
Long Latin-1 needles with one or two candidates first reject impossible two-byte
tails before entering native code.

MSVC serial C1 also accepts UTF-16 needles longer than 128 with at most two
candidates when `L * N <= 1048576`; ineligible compiled windows with at most two
candidates retain Java verification.

MSVC serial C2 needles through 128 UTF-16 code units use the JDK character miss
filter, then an isolated original Java verification loop. Serial C2 and MSVC C1 probe
immediate matches through 128 code units before filtering. MSVC C1 retains native eligibility and uses a
bounded native trailing-character search when the rightmost ending character
mismatches. A successful character search shortens the remaining prefix; a miss
ends the search. The winning dense native path remains available.

The interpreter has no additional backend activation threshold after its
32-byte gate. Every native call still observes the independent safety bounds.
Same-coder needles through eight code units probe immediate matches before
backend and size selection; the interpreter's UTF-16 probe uses bounded native equality. Compiled UTF-16 needles
longer than 128 with at most eight candidates first reject impossible ending
characters.

Below the compiled size gate, C1 uses the original Java loop, outlined for serial
backends to isolate native setup; C2 uses the JDK character intrinsic to reject misses. Ineligible serial/AVX2/NEON C2 UTF-16 needles
through 128 use that same miss filter. NEON C2 needles from 9 through 128 in
prefixes of 512 through 1023 code units also use the character miss filter when
the rightmost ending character mismatches; matching tails retain native search. Serial C2 Latin-1 skips empty 256-byte
blocks. Other compiled long-needle fallbacks reject first-character mismatches
before comparing interiors.

Serial native UTF-16 needles through 128 code units use a portable aligned filter.
AVX2 needles longer than 128 use it for at most 32 candidate positions; larger
windows use upstream byte search and bounded mismatch probing. A single native
candidate uses upstream equality after the same work guards. AVX-512 UTF-16
windows with exactly two candidate starts use two upstream equality checks.

### Mixed UTF-16/Latin-1 reverse search

The tier's source-size gate applies except for a single candidate. Needles through
eight code units have an immediate Java probe. For `9 <= N <= 64`, additional
rightmost-candidate probes are:

| Backend/tier | Immediate verification |
| --- | --- |
| GCC/Clang serial C1 | Java through 31; bounded native verification from 32 |
| MSVC serial C1 | Java through 63; bounded native verification at 64 |
| Serial C2 | Backward Java verification |
| AVX2/AVX-512/NEON C1 | Backward Java verification through 24 |
| AVX2/AVX-512 C2 | Backward Java verification through 48; existing mixed forward intrinsic for a single candidate from 49 through 64 |
| NEON C2 | Java through 32; bounded single-candidate native verification from 33 through 64 |

A rejected probe resumes bulk search. MSVC C2 needles through 64 use the JDK
character filter and Java verification; other eligible cases use native bulk
search. Native fallback resumes Java. Interpreter routing is independent of those
compiled choices. With exactly one candidate, the interpreter uses the bounded
mixed kernel through 64; other cases verify backward in Java.

For longer mixed needles, a mismatching rightmost ending character invokes bounded
native UTF-16 character filtering in the interpreter/C1. C2 uses the JDK character
intrinsic to skip empty 128-code-unit blocks.

When the ending character matches, the interpreter verifies the suffix backward
in Java and the first 64 code units with a bounded mixed kernel. C1 and NEON C2
use this route through 128 code units. Other C2 immediate candidates from 65
through 128 use the existing mixed forward intrinsic over exactly one candidate.
A rejection resumes at the preceding start. Compiled immediate candidates longer
than 128 retain Java verification; native widening remains capped at 64.

### Forward and character search

C1 UTF-16 forward substring searches use Java on serial backends; mixed forward
search retains native eligibility for 64-code-unit needles. Bounded short
immediate matches are checked before the native policy. C2 reverse UTF-16
character searches use Java on serial backends. Other backend/tier choices retain their existing native eligibility. Reverse character
searches check the rightmost code unit before native setup.

MSVC C1 UTF-16 character search requires 256 remaining code units. C2 reverse
UTF-16 character search uses Java below 256 units on AVX2 and NEON; AVX-512
retains its lower native threshold. Other character thresholds are unchanged. Forward BMP search probes one code unit first, so a
full-range miss enters native code at source length 257; reverse search enters at
length 256. The qualification manifest includes both boundaries and their
neighbors. Forward Latin-1 and UTF-16 BMP wrappers remain inline; native address setup and
chunk fallback use separate bridges. Both coders probe one unit first, so their
ordinary forward native entry is at 257 bytes or 129 UTF-16 code units;
the MSVC C1 UTF-16 override enters at 257 code units.

## Native contract and safepoints

Search bridges accept validated array ranges and return relative byte offsets.
Java converts UTF-16 offsets to code-unit indices. Builder searches retain logical
length, spare-capacity handling and synchronization. VM offsets follow the
selected object-header layout.

| Limit per native call | Bound |
| --- | --- |
| Source bytes | 64 KiB |
| Source bytes × needle bytes | 4,194,304 |
| Mixed needle widened into a stack buffer | 64 code units |

Guards precede array reads. Excess work returns `-2` for Java fallback;
`-1` means no match. The limits bound leaf work, not elapsed time.

Large searches overlap windows by the needle length minus one code unit.
Needles over half the allowed window retain Java search. Interpreter/C1 equality
uses bounded range calls. Java backedges poll between calls, which derive fresh
addresses from rooted arrays. Long mixed suffix verification also polls in Java.

Odd-byte UTF-16 occurrences are rejected. A portable C filter verifies aligned
candidates from the search-direction end; long needles also filter the adjacent
character. MSVC reverse searches apply that check from three code units.
GCC/Clang compile an AVX2 version under the VM capability gate.
Search code contains no handwritten SIMD operations. Surrogates retain Java
code-unit semantics. Checked C1 equality and method handles preserve caller state
and deoptimization.

## API coverage

| API family | Handling |
| --- | --- |
| `String.indexOf` / `lastIndexOf` substring overloads, including begin/end ranges | Shared Latin-1, UTF-16 and mixed helpers |
| Code-point search overloads | Latin-1, BMP, surrogate code units and supplementary pairs; invalid points retain Java handling |
| `AbstractStringBuilder`, `StringBuilder`, `StringBuffer` searches | Existing delegation, logical length and synchronization |
| `contains(CharSequence)`, `replace(CharSequence, CharSequence)`, single-character `split` | Existing shared substring/character search calls |
| Class loading, reflection, modules, file attributes and pattern quoting | Existing `String` search callers |
| `String.equals`, both coders | Interpreter/C1 bounded equality; C2's existing JDK intrinsic |
| `String.contentEquals` | String arguments inherit equality; builders and arbitrary sequences retain mismatch/code-unit implementations |
| `startsWith`, `endsWith`, exact `regionMatches` | Existing range-mismatch intrinsics and mixed-coder comparisons |
| Arbitrary `CharSequence`, `CharBuffer`, sequence comparison, regex engines | Existing sequence access and specialized implementations |
| Lexical/case-insensitive comparison, hashing, case conversion, encoding | Existing ordering, hash, Unicode and charset semantics |
| Array mismatch/copy, inflate/compress, builder mutations | Existing intrinsics, allocation and write barriers |
| Lines, trim/strip, blank checks, indent helpers | Existing CR/LF and Unicode-classification scanners |

## Vendoring

The 28 upstream files are pinned to Apache-2.0 StringZilla 5.3.0,
commit `86d73f1021e6cce022c3cceb1f7837eb50338774`.
[UPSTREAM.json](../../src/java.base/share/native/libjava/stringzilla/UPSTREAM.json)
records upstream, patch and patched-file SHA-256 hashes.
[The shipped notice](../../src/java.base/share/legal/stringzilla.md) contains the
license; independent Classpath-excepted adapters follow `ADDITIONAL_LICENSE_INFO`.

The [5.3.0 release](https://github.com/ashvardanian/StringZilla/releases/tag/v5.3.0)
includes SWAR backward search for two-to-four-byte needles, used by serial character
searches, and alignment-sanitizer helpers. The long-needle overlap correction is
still required. Two tracked patches apply; the other 26 files are unmodified:

* [Reverse overlaps](../../src/java.base/share/native/libjava/stringzilla/patches/0001-preserve-reverse-search-overlaps.patch)
  preserves overlapping suffix candidates after a rejected long-needle prefix and
  skips impossible prefixes with upstream byte search.
* [MSVC baseline bit operations](../../src/java.base/share/native/libjava/stringzilla/patches/0002-msvc-baseline-bit-operations.patch)
  preserves bit-count and zero-input semantics with baseline instructions.

```sh
python3 make/scripts/update-stringzilla.py --verify
python3 make/scripts/update-stringzilla.py --version NEW_VERSION --commit FULL_UPSTREAM_COMMIT_SHA
```

The updater downloads the pinned dependency closure, applies patches in a temporary
directory, refreshes hashes and license text, and removes obsolete headers.
It rejects fuzz/reversed patches and leaves the checkout untouched on failure.
Review patches against the new immutable pin and remove them when upstream includes
the fixes. Rebuild x86-64/AArch64 and rerun functional and tier-specific performance
checks.

## Validation

[BENCHMARKS.md](BENCHMARKS.md) describes matched complete-image qualification and
its source/toolchain identities. [The measurement index](measurements/README.md)
preserves preceding results, including every measured loss.

Tests cover C1/C2 compilation, JNI, opt-out, threshold/window boundaries, long
repeated needles and overlaps, coders, surrogates, builder mutation/capacity,
concurrent GC and caller state. Native tests exercise executable kernels, exact
allocations, alignment and work limits. Sanitizer receipts identify the tested
kernel source; they do not claim whole-JDK sanitization.

```sh
make test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/jdk/java/lang/StringBuilder jtreg:test/jdk/java/lang/StringBuffer jtreg:test/hotspot/jtreg/compiler/intrinsics/string jtreg:test/jdk/java/lang/System/LoggerFinder' \
  'JTREG=TIMEOUT_FACTOR=4'
```

Disable individual bridges with
`-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=...`.
Search bridges use `_stringzilla*` names. Equality uses `_equalsL`,
`_equalsLChecked` and `_stringzillaEqualsRange`; disabling `_equalsL` also disables
its checked alias. Disable existing `_indexOf*` intrinsics as well to exercise
compiled JNI fallback for every search.
