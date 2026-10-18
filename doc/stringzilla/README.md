# StringZilla integration

StringZilla 5.3.0 provides bounded native kernels for eligible string searches and
interpreter/C1 equality. It is enabled by default. Use
`-XX:-UseStringZillaIntrinsics` to select the existing JDK implementations.
Public APIs, compact-string representation, range checks and Unicode semantics
are unchanged.

## Execution

The package-private `java.lang.StringZilla` bridges use kernels in `libjava`.
HotSpot supplies the interpreter entries and compiler calling conventions; no
additional shared library is required.

| Layer | Integration |
| --- | --- |
| Interpreter | x86-64/AArch64 entries poll before deriving heap addresses and call bounded native kernels |
| C1 | Native leaf calls, checked equality and separate Java bridges for reverse substring search |
| C2 | Reverse-search leaf calls; existing JDK forward-search, forward BMP-character and equality intrinsics |
| JNI fallback | The same kernels and bounds through JVM entry points |

C1 reverse bridges carry the caller's tier explicitly, preserving C1 policy when
the bridge compiles in C2. Scalar windows and eligible mixed-coder continuations
avoid the bridge. Small public reverse-search wrappers are forced inline so C2
can reach these paths after the wrappers have compiled.
An immutable kernel table is published with release/acquire ordering during
`System.registerNatives`; equality has a scalar bootstrap fallback.

GCC/Clang x86 selects AVX2 or AVX-512 using HotSpot capabilities and `UseAVX`.
Both require AVX2/BMI1/BMI2/LZCNT; AVX-512 also requires VL/BW capabilities.
AArch64 uses NEON; MSVC x64, Zero and other ports use serial kernels.
GCC/Clang use portable scalar loads for unaligned byte-array offsets.

## Search dispatch

Sizes refer to the logical search range after public API normalization. UTF-16
helpers check the physical array ends before unchecked code-unit access.
The shared reverse dispatcher sends prefixes below 32 source bytes directly to
the original Java helpers, without initializing `StringZilla`.

Compiled substring search requires 256 source bytes before native dispatch;
interpreted reverse search requires 32. Interpreted whole-string forward intrinsics
handle all sizes, resuming Java for malformed UTF-16 ranges, unavailable bootstrap,
mixed needles over 64 code units or excessive work. Interpreted mixed reverse
search with one candidate can use the bounded kernel below the size gate.

### Same-coder reverse search

Let `N` be the needle length, `L = fromIndex + N` the searched prefix,
`S = L - N` the span and `W = (S + 1) * N`. Lengths use code units and work
arithmetic uses 64 bits. After the compiled source-size gate, native eligibility is:

| Backend/tier | Latin-1 | UTF-16 |
| --- | --- | --- |
| Serial or NEON C1 | `N <= 256` or `W >= 1024` | `N <= 128` or `W >= 1024` |
| AVX2 C1 | `N <= 256`, `A`, or `W >= 1024` | `N <= 128` or `W >= 1024` |
| Serial C2 | `32 <= N <= 256 && L >= 1024`, or `N > 256 && W >= 4096` | `N <= 128 && L >= 512`, or `N > 128 && W >= 2048` |
| AVX2 C2 | `N <= 128`; `129 <= N <= 256 && W >= 1024`; or `N > 256 && (A || (S >= 32 && W >= 4096))` | `N <= 128 && L >= 512`, or `N > 128 && S >= 16 && W >= 2048` |
| NEON C2 | `N <= 256`, or `N > 256 && S >= 16 && W >= 4096` | `N <= 8 && L >= 1024`; `9 <= N <= 128 && L >= 512`; or `N > 128 && S >= 8 && W >= 2048` |
| AVX-512 C1/C2 | Source-size gate | Source-size gate |

`A` is the bounded AVX2 long-Latin-1 route:
`N > 256 && S < 64 && L * N <= 4194304`.

MSVC serial C1 also accepts UTF-16 needles over 128 with at most two candidates
when `L * N <= 1048576`. MSVC serial C2 keeps UTF-16 widths through 128 in Java.
The interpreter has no additional backend threshold after its size gate.
Independent native bounds apply to every call.

Same-coder widths through eight probe the rightmost candidate before bulk
dispatch; interpreted UTF-16 uses bounded native equality. Long Latin-1 needles
with at most two candidates reject impossible two-byte tails first. Serial C2
Latin-1 also probes widths 9 through 128, checking the last four bytes backward
and the remaining prefix with `ArraysSupport.mismatch` (at most 124 bytes).

Serial C2 and MSVC C1 UTF-16 probe immediate matches through 128 code units.
Non-MSVC serial C2 verifies widths 32 through 128 with four backward code-unit
checks and `ArraysSupport.mismatch`. Already native-eligible widths 129 through
256 use the same bounded verification, with at most 504 prefix bytes.
A failed complete verification with no earlier candidate returns immediately.
Non-serial C2 single-candidate prefixes below 128 code units use the existing
backward Java verifier directly.

NEON C2 UTF-16 widths 9 through 128 with `512 <= L < 1024` use the JDK
character miss filter when the rightmost ending character differs. Widths through
32 probe the rightmost candidate, or its predecessor after proving the rightmost
ending character impossible. The native window remains unchanged.
MSVC C1 uses bounded native ending-character filtering inside its bridge and
shortens the prefix after a successful filter.

Native-eligible serial C2 UTF-16 widths over 128 skip ending-character-free
blocks of at most 256 code units with the existing JDK character-search intrinsic.
Only proven-empty blocks are removed; a possible ending character retains the
native search.

Below the compiled gate, C1 calls the original Java loop directly after any
failed immediate probe; C2 uses the JDK character miss filter. Ineligible
serial/AVX2/NEON C2 UTF-16 widths through 128 use that filter, followed by Java
verification. Serial C2 Latin-1 skips empty 256-byte blocks. Compiled long-needle
fallbacks filter first-character mismatches before comparing interiors.

Compiled UTF-16 needles over 128 with fewer than eight candidate starts first
reject impossible ending characters. Ineligible windows with at most two
candidates use the original Java loop; MSVC and NEON C2 use that loop directly in
these narrow windows. Ineligible C1 long-needle windows with at most two candidates call their Java
fallback directly. Ineligible C2 Latin-1 windows over 256 with at most two
candidates use the original Java loop when the rightmost first character matches;
otherwise they retain the first-character filter.

### Mixed UTF-16/Latin-1 reverse search

Native widening is limited to 64 code units. The source-size gate applies except
for a single candidate. Needles through eight have an immediate Java probe.
For widths 9 through 64, additional rightmost-candidate verification is:

| Backend/tier | Immediate verification |
| --- | --- |
| GCC/Clang serial C1 | Backward Java through 31; bounded native verification from 32 |
| MSVC serial C1 | Backward Java through 63; bounded native verification at 64 |
| Serial C2 | Backward Java |
| AVX2/AVX-512/NEON C1 | Backward Java through 24 |
| AVX2/AVX-512 C2 | Backward Java through 47; existing mixed forward intrinsic over one candidate from 48 through 64 |
| NEON C2 | Backward Java through 30; bounded native verification from 31 through 64 |

C1 runs its eligible probe before entering a bridge. Widths through 64 then
call the existing native continuation directly; widths over 128 with a matching
rightmost ending character call the existing Java continuation.
Rejected probes resume bulk search. MSVC C2 widths through 64 use the JDK
character filter and Java verification; other eligible cases use native search.

For longer needles, a mismatching ending character uses bounded native character
filtering in the interpreter/C1; C2 skips empty 128-code-unit blocks with the JDK
intrinsic. A matching ending character allows a backward Java suffix check plus
bounded native verification of the first 64 code units. The interpreter uses this
for all lengths, C1 through 128 and NEON C2 for all longer immediate candidates.
Other C2 widths 65 through 128 use the existing mixed forward intrinsic over one
candidate. Failed verification resumes at the preceding start. Other compiled
needles over 128 retain Java search.

### Forward and character search

C1 serial UTF-16 forward substring searches use Java, retaining mixed native
eligibility at width 64. Short same-coder immediate matches precede this policy.
SIMD backends retain native eligibility; C2 retains its forward intrinsics.

Reverse character wrappers probe eight positions before feature/backend selection.
Eligibility uses the original prefix; native search skips the checked positions.
Native setup and chunk fallback are separate helpers. BMP forward search probes
one position first.

Ordinary character-native thresholds are 256 remaining Latin-1 bytes or 128
remaining UTF-16 code units. A full-range forward miss therefore enters native
code at length 257 or 129 respectively. Reverse eligibility uses a prefix of at
least 256 source bytes. MSVC C1 UTF-16 character searches use Java in both
directions. Serial C2 reverse UTF-16 character searches use Java. AVX2 C2 uses
Java below 256 code units; NEON C2 uses Java below 768. AVX-512 retains the
ordinary 128-code-unit threshold.

## Native bounds and safepoints

Native bridges accept validated ranges and return relative byte offsets.
Java converts UTF-16 offsets to code-unit indices; builders retain logical length,
spare capacity and synchronization.

| Limit per native call | Bound |
| --- | --- |
| Source bytes | 64 KiB |
| Source bytes × needle bytes | 4,194,304 |
| Mixed needle widened on the stack | 64 code units |

Guards precede reads. Excess work returns `-2` for Java fallback; `-1` means
no match. Bounds limit leaf work, not elapsed time. Large searches overlap windows
by the needle length minus one code unit; needles over half the allowed window
retain Java search. Equality uses bounded range calls. Java backedges poll
between calls, which derive fresh addresses from rooted arrays. Long mixed suffix
verification also polls in Java.

Single native candidates use upstream equality. Long reverse adapters combine
upstream search and equality with bounded probes before resuming bulk search.
A rejected AVX-512 Latin-1 candidate selects actual mismatching bytes with at
most three presence queries before bulk fallback. Serial UTF-16 widths 33 through
128 use the same bounded strategy when the rightmost first, last and penultimate
characters pass the aligned filter; sparse rejections retain the original batches.
The short fallback uses upstream two-byte search for presence queries and the
original aligned search for full needles, without recursive probing.
UTF-16 pivots retain both bytes of a code unit; shortened windows preserve
overlapping starts. AVX-512 UTF-16 windows with two starts use two equality checks.

Odd-byte UTF-16 occurrences are rejected. A portable C filter verifies aligned
candidates from the search-direction end. Long needles also filter the adjacent
code unit. MSVC reverse searches apply this check from width three; short ARM
reverse batches apply it only after the first/last filter finds candidates.
GCC/Clang compile an AVX2 version under the VM capability gate. The adapters contain
no handwritten SIMD instructions.

## API coverage

| API family | Handling |
| --- | --- |
| `String.indexOf` / `lastIndexOf` substring overloads, including begin/end ranges | Shared Latin-1, UTF-16 and mixed helpers |
| Code-point search | Latin-1, BMP, surrogate code units and supplementary pairs; invalid points retain Java handling |
| `AbstractStringBuilder`, `StringBuilder`, `StringBuffer` searches | Existing delegation, logical length and synchronization |
| `contains`, sequence replacement, single-character `split` | Existing calls to shared substring/character searches |
| Class loading, reflection, modules, file attributes, pattern quoting | Inherit eligible `String` searches |
| `String.equals` | Both coders use bounded interpreter/C1 equality; C2 retains its JDK intrinsic |
| `contentEquals` | String arguments inherit equality; builders and other sequences retain mismatch/code-unit implementations |
| Prefix/suffix/region checks, sequence comparison, regex | Existing range-mismatch, sequence-access and specialized implementations |
| Ordering, hashing, case conversion, encoding | Existing comparison, Unicode and charset semantics |
| Copy/mismatch, inflate/compress, builder mutations | Existing intrinsics, allocation and write barriers |
| Lines, trim/strip, blank and indent helpers | Existing CR/LF and Unicode scanners |

## Vendoring

The 28 upstream files are pinned to Apache-2.0 StringZilla 5.3.0,
commit `86d73f1021e6cce022c3cceb1f7837eb50338774`.
[UPSTREAM.json](../../src/java.base/share/native/libjava/stringzilla/UPSTREAM.json)
records upstream, patch and patched-file SHA-256 hashes.
[The shipped notice](../../src/java.base/share/legal/stringzilla.md) contains the
license. Independent adapters follow `ADDITIONAL_LICENSE_INFO`.

The [5.3.0 release](https://github.com/ashvardanian/StringZilla/releases/tag/v5.3.0)
adds SWAR backward search for two-to-four-byte needles and alignment-sanitizer
helpers. Two tracked patches remain necessary; the other 26 files are unmodified:

- [Reverse overlaps](../../src/java.base/share/native/libjava/stringzilla/patches/0001-preserve-reverse-search-overlaps.patch)
  preserves overlapping suffix candidates after a rejected long-needle prefix.
- [MSVC baseline bit operations](../../src/java.base/share/native/libjava/stringzilla/patches/0002-msvc-baseline-bit-operations.patch)
  preserves bit-count and zero-input semantics with baseline instructions.

```sh
python3 make/scripts/update-stringzilla.py --verify
python3 make/scripts/update-stringzilla.py --version NEW_VERSION --commit FULL_UPSTREAM_COMMIT_SHA
```

The updater stages the pinned dependency closure and patches, refreshes hashes and
license text, and removes obsolete headers. It rejects fuzz/reversed patches and
leaves the checkout untouched on failure. Review patches against the new pin;
remove upstreamed fixes. Rebuild x86-64/AArch64 and rerun correctness and
tier-specific performance checks.

## Validation

[BENCHMARKS.md](BENCHMARKS.md) records matched complete-image measurements,
source/toolchain identities and measured losses.
[The measurement index](measurements/README.md) links raw evidence and preceding
results. Qualification applies to the exact source and image hashes in those
receipts; proposed source changes require a new matched run.

Tests cover tiers, JNI, opt-out, thresholds/windows, repeated needles, overlaps,
coders, surrogates, builder capacity, concurrent GC and caller state.
Native tests cover executable kernels, exact allocations, alignment and work
limits. Sanitizer receipts identify kernel source/backend; they do not imply
whole-JDK sanitization.

```sh
make test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/jdk/java/lang/StringBuilder jtreg:test/jdk/java/lang/StringBuffer jtreg:test/hotspot/jtreg/compiler/intrinsics/string jtreg:test/jdk/java/lang/System/LoggerFinder' \
  'JTREG=TIMEOUT_FACTOR=4'
```

To exercise JNI fallback, disable bridge intrinsics with
`-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=...`.
Search bridges use `_stringzilla*` names. Equality uses `_equalsL`,
`_equalsLChecked` and `_stringzillaEqualsRange`; disabling `_equalsL` also disables
its checked alias. Disable the applicable existing `_indexOf*` intrinsics when
testing compiled forward-search JNI fallback.
