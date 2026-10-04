# StringZilla string-search integration

Enable with `-XX:+UseStringZillaIntrinsics`. The product flag defaults to false.
The opt-in changes searching and long interpreter/C1 equality checks, without changing string representation or Java API
semantics. `-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=...` can disable individual
bridge intrinsics and select JNI fallback. C2 retains its existing forward
search intrinsic when the corresponding StringZilla bridge intrinsic is disabled;
disable the existing `_indexOf*` intrinsics as well to exercise compiled JNI
fallback for every search.

## Vendoring and updates

The bundled search/compare dependency closure is StringZilla **5.2.0**, commit
`82e15261d0a723e7bb97a03abd61641953fd45c0`, under Apache-2.0. The 28 upstream
files are unmodified. `src/hotspot/share/utilities/stringzilla/UPSTREAM.json`
records SHA-256 hashes. The runtime compiles the headers into libjvm; users need
no third-party shared library, native-library load, or network access.
`src/java.base/share/legal/stringzilla.md` contains the shipped license notice.

```sh
python3 make/scripts/update-stringzilla.py --verify
python3 make/scripts/update-stringzilla.py --version NEW_VERSION --commit FULL_UPSTREAM_COMMIT_SHA
```

Find the release and its immutable commit in the upstream repository first. The
update script downloads the dependency closure before writing files, refreshes
the hashes/license, and removes obsolete headers. Review dependency/license
changes, build both architectures, rerun the tests and benchmark matrix, and
retune the dispatch thresholds before committing an update. A version update
alone is not evidence of a performance improvement.

## Dispatch and safety

`java.lang.StringZilla` is package-private. Its native methods accept validated
byte-array ranges. Native search functions return relative **byte offsets**;
the Java helpers restore the caller's character index. Empty needles, invalid
code points, bounds exceptions, and public `fromIndex` normalization retain the
existing Java behavior. Builder searches use logical count, never spare capacity.

* Interpreter: x86-64 and AArch64 frameless entries perform a safepoint poll,
  derive heap addresses, call the C++ leaf kernel, and restore the caller's stack.
  A pending poll takes the regular native entry.
* C1: shared LIR uses each platform's address generation and C calling
  convention, then a runtime leaf call. No JNI handles or array pinning/copying.
* C2: bridge expansion validates ranges and issues a runtime leaf call with
  memory dependencies. Existing forward substring intrinsics use a hybrid: keep
  small ranges, one-character needles, and needles longer than 64 code units
  on the platform node; otherwise probe the first 32 starting positions with
  that node before calling StringZilla for the remainder. Forward BMP character
  searches retain C2's existing intrinsic. AVX state uses the existing machinery.
* JNI fallback: libjava delegates to JVM entry points; resolved arrays are
  searched without allocation or safepoints after deriving heap addresses.

The x86 dispatcher enables the upstream Haswell functions only when HotSpot
permits AVX2 and detects BMI1, BMI2, and LZCNT. It selects Skylake AVX-512
functions when `UseAVX >= 3` and AVX-512F/BW/VL are available. Otherwise it uses
Haswell AVX2 or directly calls the serial functions. AArch64 uses mandatory NEON, with serial fallback on other
builds. The ISA target pragmas belong to individual functions; libjvm itself
retains its normal CPU baseline. `SZ_AVOID_LIBC=1` disables upstream allocators,
and upstream debug termination is disabled inside the VM.

UTF-16 searches reject odd-byte matches. After the first such match, a bounded
AVX2/NEON code-unit-aligned filter checks first/last characters and uses
StringZilla equality to verify candidates, with a scalar tail. This avoids
restarting a byte search at every position on periodic crossed-byte inputs.
They preserve
isolated surrogates and match supplementary code points as surrogate pairs.
Mixed UTF-16/Latin-1 substring searches widen up to 64 needle code units into a
fixed native stack buffer. Longer mixed needles retain the existing path.
Small ranges retain existing Java/platform intrinsics. See `BENCHMARKS.md` for
measured thresholds, tier choices, and limitations.

## Applicability audit

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
| `String.equals` (both coders) | Long interpreter/C1 comparisons reuse the equal-length search bridge after a first-byte check; C2 retains its equality intrinsic |
| `String.contentEquals`, builder equality, array equality | Retain existing comparison paths; no change to mutable-sequence access/synchronization or array intrinsics |
| Lexical `compareTo`, region/ignore-case comparisons | Java code-unit order and case semantics; byte-order compare is not a UTF-16 replacement |
| `String` / builder hashing | Java's specified polynomial hash; StringZilla hash is not interchangeable |
| Copy, inflate/compress, append, insert, reverse | Existing arraycopy/conversion intrinsics and allocation/write-barrier semantics |
| `trim`, `strip`, lines, Unicode case conversion, encoding | Java whitespace/line/code-point rules differ from upstream byte/UTF-8 operations |

This change introduces search intrinsics and reuses them for equality. The audit does not claim to accelerate
every string operation, nor to replace arbitrary `CharSequence` storage with
byte arrays.

## Validation and reproduction

`test/jdk/java/lang/String/StringZillaSearch.java` checks independent scalar
oracles in interpreter, C1, C2, compact-strings-off, feature-off, and all-search-
intrinsics-disabled modes (both interpreter JNI fallback and compiled JNI
fallback). It covers threshold boundaries, empty and oversized
needles, offsets/extreme `fromIndex`, builder capacity, mixed encodings, isolated
surrogates, supplementary characters, odd-byte UTF-16 matches, and concurrent GC.
`TestStringZillaAvailability` verifies registration/availability in both compilers
with the flag on and off. `TestStringZillaCompilation` asserts that 22 public-API
callers actually compile at levels 1 and 4, preventing silent compiler bailout
from being hidden by interpreter fallback. Existing String, builder, and HotSpot string tests are
also run; exact results are recorded in `BENCHMARKS.md`.

The JMH benchmark is
`test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java`. It parameterizes
size, coder, and miss/start/end/repeated input shapes; operations include forward
and reverse substring/character searches, equality, builders, contains, and replace.
Compare the same built JVM with the feature off and on, separately under `-Xint`,
`-XX:TieredStopAtLevel=1`, and `-XX:-TieredCompilation`. Do not infer hardware ARM
performance from cross-compilation or emulation.
