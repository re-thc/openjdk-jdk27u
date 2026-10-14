# StringZilla integration

This fork uses StringZilla 5.3.0 for eligible string searches and interpreter/C1
equality. It is enabled by default. Disable it with
`-XX:-UseStringZillaIntrinsics`. Java string representation, range handling,
Unicode semantics and public APIs remain unchanged.

## Execution and dispatch

The package-private `java.lang.StringZilla` bridges call kernels in the existing
`libjava`. HotSpot owns the entry points and calling conventions; vendored
headers remain outside HotSpot. No additional shared library is required.

| Layer | Implementation |
| --- | --- |
| Interpreter | x86-64/AArch64 entries poll for safepoints and call native leaves; equality checks lengths and a prefix |
| C1 | Shared LIR calls native leaves; checked Java equality handles short arrays and calls the chunk helper for large arrays |
| C2 | Reverse-search bridges call native leaves; existing forward-search and equality intrinsics remain in use |
| JNI fallback | The same kernels and work limits, reached through JVM entry points |

x86 GCC/Clang builds select upstream AVX2 or AVX-512 kernels according to
HotSpot's CPU capabilities and `UseAVX`. AArch64 uses NEON. MSVC x64, Zero and
other ports use serial kernels. GCC/Clang use upstream portable scalar loads
for byte arrays at arbitrary offsets. The immutable callback table is published
with release/acquire ordering by `System.registerNatives`; Java class
initialization reads the selected configuration idempotently. Bootstrap equality has a
VM-owned scalar fallback.

Search dispatch starts at 256 source bytes. Short ranges and immediate matches
retain inexpensive Java/platform paths, except the interpreter's whole-string
Latin-1 forward intrinsic, which calls the bounded kernel at every input size.
That entry resumes Java before native bootstrap and for ranges exceeding either
native work limit. C1/C2 forward search retain their existing routing.
Equality has separate length and prefix checks. C1 compiles the mixed-coder
Java search loop separately from the
acceleration branch, including the fallback for needles over 64 code units.
Short UTF-16 substring reverse matches are checked before backend/tier dispatch,
including ranges that use the Java loop.

Same-coder substring reverse searches also use the selected kernel and compiling
tier. The tier query folds to a constant in C1/C2; its Java body returns zero for
interpreted callers. Initialization records the actual callback table's backend,
including serial-only builds. The following rules apply after the common
256-source-byte gate and before native argument setup. Length is the searched
prefix (`fromIndex + needleCount`), in code units, after API range normalization.

| Backend and tier | Additional native eligibility |
| --- | --- |
| Serial or AVX2 C1, Latin-1 | Needle up to 256 code units, or comparison work at least 1024 |
| Serial C2, Latin-1 | Needle 32–256 code units with prefix at least 1024, or longer needle with comparison work at least 4096 |
| AVX2 C2, Latin-1 | Needle up to 128 code units; needle 129–256 with comparison work at least 1024; longer needle with comparison work at least 4096 |
| Serial or AVX2 C1, UTF-16 | Needle up to 128 code units, or comparison work at least 1024 |
| Serial or AVX2 C2, UTF-16 | Needle up to 128 code units with prefix at least 512, or longer needle with comparison work at least 2048 |
| Interpreter, other backend/tier combinations, mixed-coder searches | Existing eligibility |

Comparison work is `(prefix - needleCount + 1) * needleCount`, in code units,
computed with 64-bit arithmetic. It selects native verification only when a long
needle has enough candidate positions to amortize setup. This dispatch estimate
is independent of the native maximum-work safety guard. The interpreter retains
its existing eligibility, including minimal overlapping matches.

Ineligible UTF-16, C1 Latin-1 and AVX2 C2 Latin-1 ranges use the existing Java
reverse loop. AVX2 C2 uses a Java helper with explicit range checks, so scalar
verification can retain array bounds optimizations. Serial C2 Latin-1
uses the existing character-search intrinsic to skip 256-byte blocks without
the needle's last character, then resumes the original reverse loop. Forward
search, character search and equality retain their dispatch rules. Serial UTF-16 bulk reverse
searches with needles up to 128 code units reuse the existing aligned batch filter
directly, avoiding ineffective byte-search shifts. Longer needles keep upstream
byte search and its overlap-preserving prefix filter.

Individual intrinsics can be disabled with
`-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=...`: search bridges use
`_stringzilla*` names; equality uses `_equalsL`, the checked alias
`_equalsLChecked`, and `_stringzillaEqualsRange`. Disabling `_equalsL` also
disables its checked alias. Disable the existing `_indexOf*` intrinsics as well
to exercise compiled JNI fallback for every search.

## Native contract and safepoints

Search bridges accept validated byte-array ranges and return relative byte offsets.
Java helpers convert these offsets to character indices. Builder searches use
the logical length, including when the backing array has spare capacity.
VM array offsets follow the selected header layout. Overlap regressions cover
four-byte headers and the compact/legacy opt-outs in each execution tier.

| Limit | Bound |
| --- | --- |
| Source bytes per native call | 64 KiB |
| Substring work proxy | Source byte length multiplied by needle byte length: at most 4,194,304 |
| Mixed UTF-16/Latin-1 needle | At most 64 code units widened into a fixed stack buffer |

Native byte/work guards run before reading array contents. Excessive work returns
`-2` to resume Java; `-1` denotes a miss. Mixed-coder kernels independently reject
invalid or oversized needle counts before widening. Java routes longer mixed
needles through its existing algorithm.

Large searches use overlapping windows in search order; each overlap is the
needle length minus one code unit. Needles occupying more than half the allowed
window retain Java search. Large interpreter/C1 equality uses bounded range
calls. Java helper backedges provide safepoint polls between calls, which derive
fresh heap addresses from rooted arrays. These limits bound StringZilla leaf
work, not elapsed time or every existing JDK intrinsic.

UTF-16 byte matches at odd addresses are rejected. A portable C batch filter
checks aligned candidates in the remaining prefix/suffix. Verification starts
at the search-direction end and checks both ends inward; filtered boundary
characters are not compared twice. For long needles, the batch filter also
checks the adjacent character in the search direction to reject repeated
candidates before verification. GCC/Clang compile an AVX2 copy of this C loop
under the VM capability gate. The adapter contains no handwritten AVX2/NEON
operations. Isolated surrogates and supplementary pairs retain Java semantics.

C1 equality preserves full pre-call state for guarded deoptimization.
Method-handle calls parse the Java equality body, and checked equality uses Java
control flow for its slow call. This preserves arguments and live caller values
without hiding Java/leaf alternatives inside a single LIR block.

## API coverage

| Location/API family | Handling |
| --- | --- |
| `String.indexOf` substring overloads, including begin/end ranges | Shared Latin-1, UTF-16, and mixed-coder helpers |
| `String.lastIndexOf` substring overloads | Shared reverse helpers; normalized start positions |
| `String.indexOf` / `lastIndexOf` code point overloads | Latin-1, BMP, surrogate code units, supplementary pairs; invalid points retain Java handling |
| `AbstractStringBuilder`, `StringBuilder`, `StringBuffer` index/lastIndex | Existing delegation through `String` and shared helpers; logical length and synchronization preserved |
| `String.contains(CharSequence)` | Existing conversion to string and shared substring search |
| `String.replace(CharSequence, CharSequence)` | Existing repeated calls to shared substring helpers |
| Single-character `String.split` fast path | Existing calls to character search |
| Class loading, reflection, module names, file attributes, pattern quoting | Existing `String` search calls inherit the acceleration |
| Arbitrary `CharSequence` / `CharBuffer`, `CharSequence.compare` | No contiguous byte-array contract; retain `charAt`/existing specialized comparison |
| Regex matcher/search nodes | Arbitrary sequence plus regex semantics; retain existing pattern engines (literal `String` callers above are covered) |
| `String.equals` (both coders) | Interpreter uses `_equalsL`; C1 parses the checked Java helper and uses short/prefix checks plus bounded equality leaves; C2 retains its equality intrinsic |
| `String.contentEquals(CharSequence)` | String arguments delegate to equality; same-coder builders retain the existing `ArraysSupport.mismatch` intrinsic and synchronization; mixed-coder builders and arbitrary sequences retain code-unit access |
| Array equality / mismatch | Retain existing array intrinsics |
| `startsWith` / `endsWith`, exact `regionMatches` | Retain existing range-mismatch intrinsics for equal coders and code-unit comparisons for mixed coders |
| Lexical `compareTo` and ignore-case comparisons | Java code-unit order and case semantics; byte-order compare is not a UTF-16 replacement |
| `String` / builder hashing | Java's specified polynomial hash; StringZilla hash is not interchangeable |
| Copy, inflate/compress, append, insert, reverse | Existing arraycopy/conversion intrinsics and allocation/write-barrier semantics |
| `StringLatin1` / `StringUTF16.LinesSpliterator`, `trim`, `strip`, `isBlank`, indent/stripIndent helpers | Retain their CR/LF and Unicode classification scanners; a character-set bridge and separate workload measurements would be required |
| Unicode case conversion and encoding | Java case/code-point/charset rules differ from upstream byte/UTF-8 operations |

## Vendoring and updates

The 28 upstream files come from StringZilla 5.3.0 at commit
`86d73f1021e6cce022c3cceb1f7837eb50338774`, licensed under Apache-2.0.
One [tracked patch](../../src/java.base/share/native/libjava/stringzilla/patches/0001-preserve-reverse-search-overlaps.patch)
preserves overlapping suffix candidates after a rejected long-needle prefix in
reverse search and skips impossible prefixes using the upstream byte-search
primitive. The other 27 files are unmodified.
[UPSTREAM.json](../../src/java.base/share/native/libjava/stringzilla/UPSTREAM.json)
records upstream, patch and patched-file SHA-256 hashes;
[the shipped notice](../../src/java.base/share/legal/stringzilla.md)
contains the license. Independent Classpath-excepted adapters follow
`ADDITIONAL_LICENSE_INFO`.

```sh
python3 make/scripts/update-stringzilla.py --verify
python3 make/scripts/update-stringzilla.py --version NEW_VERSION --commit FULL_UPSTREAM_COMMIT_SHA
```

Resolve the release to an immutable upstream commit. The updater downloads its
dependency closure, applies tracked patches in a temporary directory, refreshes
hashes/license text and removes obsolete headers. Patch application rejects
fuzz and reversed patches; a failure leaves the checkout untouched. Review each
patch against the new revision and remove its manifest entry only when upstream
contains the fix.
Review the dependency and license changes, build x86-64/AArch64, and rerun the
functional and tier-specific performance checks before changing dispatch gates.

## Validation and benchmarks

Local release jtreg validation passed **189 tests, zero failures/errors**:
String (96), StringBuilder (16), StringBuffer (25), HotSpot string intrinsics (25),
and LoggerFinder (27). Two other HotSpot tests retain platform exclusions. Clean
GCC 14 release/CDS
and fastdebug builds use the fork development profile. Eleven targeted fastdebug
tests passed. Nine search/kernel tests passed with final GCC 16 kernels and AVX2;
dispatch and availability tests also passed with serial, AVX2 and AVX-512
dispatch. AArch64 cross checks cover HotSpot and java.base native libraries.

The tests cover all three execution tiers, JNI fallback, explicit opt-out,
threshold/window edges, long needles, coder combinations, surrogate pairs,
builder capacity/mutations and concurrent GC. WhiteBox forces 30 public callers
through C1/C2 and checks equality/helper caller state and method handles.
Native tests check every capability mask, executable backend, invalid input,
work limit, unaligned long-needle search and repeated-suffix overlaps
independently of Java gates.
AArch64/QEMU covers executable serial/NEON backends and repeated-suffix
overlaps in the interpreter, C1, C2, JNI fallback and opt-out paths.
The full bounded-search suite also passed under AArch64 C1 after outlining the
mixed-coder scalar loop. Compiler-folded dispatch and intrinsic availability
checks passed on AArch64, with boundary matches tested in both C1 and C2.
Native ASan/UBSan passed with alignment checks enabled. GCC 16 kernels also
passed the string-search, literal-replacement and logger tests.

```sh
make CONF=cloud test \
  'TEST=jtreg:test/jdk/java/lang/String jtreg:test/jdk/java/lang/StringBuilder jtreg:test/jdk/java/lang/StringBuffer jtreg:test/hotspot/jtreg/compiler/intrinsics/string' \
  'JTREG=JOBS=2;TIMEOUT_FACTOR=4'
```

See [BENCHMARKS.md](BENCHMARKS.md) for measured performance, complete controls,
confidence intervals and reproduction. CI results are reported by the PR checks;
local validation does not replace them. ARM hardware timing, a local MSVC build,
full local tier1/tier2 and whole-JDK sanitizers have not been run.
