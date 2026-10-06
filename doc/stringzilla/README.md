# StringZilla string-search integration

StringZilla is enabled by default in this fork. Disable it with
`-XX:-UseStringZillaIntrinsics`. The product flag defaults to true.
The integration changes searching and interpreter/C1 equality checks, without changing
string representation or Java API semantics. `-XX:+UnlockDiagnosticVMOptions -XX:DisableIntrinsic=...` can disable individual
bridge intrinsics and select JNI fallback. C2 retains its existing forward substring and character intrinsics. Disable the
existing `_indexOf*` intrinsics as well to exercise compiled JNI fallback for
every search. Equality reuses `_equalsL`; disabling it also disables the checked
wrapper's alias `_equalsLChecked` in both compilers. The bounded equality bridge is
`_stringzillaEqualsRange`; disable it as well to exercise JNI for large equality.

The [bounded-work review](BOUNDED_REVIEW.md) records the latest portable filter,
C1 equality changes, validation, benchmark table and reproduction commands.
The [GCC 10 CI follow-up](CI_FOLLOWUP.md) records the native-test CPU-check fix
and distinguishes local verification from GitHub Actions results.

## Vendoring and updates

The bundled search/compare dependency closure is StringZilla **5.2.0**, commit
`82e15261d0a723e7bb97a03abd61641953fd45c0`, under Apache-2.0. The 28 upstream
files are unmodified. `src/java.base/share/native/libjava/stringzilla/UPSTREAM.json`
records SHA-256 hashes. The independent kernels compile into the existing
Classpath-excepted `libjava`, following `ADDITIONAL_LICENSE_INFO`. HotSpot
contains only the callback ABI and leaf adapters, without third-party headers.
Users need no extra shared library or network access.
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
  derive heap addresses, call a native leaf adapter, and restore the caller's stack.
  A pending poll takes the regular native entry for searches and the regular
  Java entry for equality. Equality checks array lengths and the first byte
  before entering the native kernel.
* C1: shared LIR uses each platform's address generation and C calling
  convention, then a runtime leaf call. Equality checks lengths and an unrolled
  eight-byte prefix, returning directly for short arrays or prefix mismatches.
  No JNI handles or array pinning/copying.
* C2: bridge expansion validates ranges and issues a runtime leaf call with
  memory dependencies. Forward substring, forward BMP character, and equality
  operations retain their existing platform intrinsics; measurements favored
  those implementations. Reverse searches use the new bridges. AVX state uses
  the existing machinery.
* JNI fallback: libjava delegates to JVM entry points; resolved arrays are
  searched without allocation or safepoints after deriving heap addresses.
  It uses the same independent work bounds as intrinsic calls.

The x86 dispatcher enables the upstream Haswell functions only when HotSpot
permits AVX2 and detects BMI1, BMI2, and LZCNT. It selects Skylake AVX-512
functions when `UseAVX >= 3` and AVX-512F/BW/VL are available. Otherwise it uses
Haswell AVX2 or directly calls the serial functions. AArch64 uses mandatory NEON, with serial fallback on other
builds. The x86 ISA-specific tables require GCC/Clang function-target support;
MSVC x64 builds publish the serial table even if the VM reports AVX capabilities.
Other architectures retain generic JNI interpreter entries and serial kernels;
shared C2 bridge expansion can still issue a serial leaf call. These other
ports and MSVC have not been built or tested here.
ISA selection happens during native bootstrap and is repeated idempotently at
`StringZilla` class initialization. The early call supports bootstrap equality;
the class-initialization call keeps the JNI initialization entry self-contained.
Both calls select the same immutable table, without allocation. An immutable
callback table is published with release/acquire ordering; stable VM entry
addresses work before the library initializes. Equality uses a small VM-owned
scalar fallback until libjava publishes the table. Function-level ISA pragmas leave
both libraries at their normal CPU baseline. `SZ_AVOID_LIBC=1` disables upstream
allocators, and `SZ_DEBUG=0` disables upstream debug termination.

UTF-16 searches reject odd-byte matches. After the first such match, one portable
C batch filter selects aligned candidates and verifies them from both ends,
beginning at the search-direction end. Only the remaining prefix/suffix is
checked. There are no handwritten AVX2 or NEON operations in the adapter.
GCC/Clang compile an AVX2 copy of the same C loop under the existing VM capability
gate; the baseline and ARM copies use their normal CPU target. StringZilla's
search/equality kernels still come from unmodified upstream headers. The native
request is bounded before either search or verification.
Searches preserve
isolated surrogates and match supplementary code points as surrogate pairs.
Mixed UTF-16/Latin-1 substring searches widen up to 64 needle code units into a
fixed native stack buffer. The kernel independently rejects counts outside
0..64 before reading the needle or writing the buffer. Java routes longer mixed
needles through the existing scalar path, preserving their search semantics.
Length gates precede the Java flag read on short inputs. Forward substring
searches probe the first candidate for short needles before dispatch; UTF-16
probes only eligible long windows and preserves the original scalar-loop entry.
C1 force-inlines the same-coder UTF-16 forward and Latin-1 reverse dispatchers.
Mixed-coder forward searches retain C1's normal inlining choice for short scalar
loops; separate Java forward wrappers and the reverse scalar loop isolate
native-call register setup. Small ranges retain existing
Java/platform intrinsics. See `BENCHMARKS.md` for
measured thresholds, tier choices, and limitations.

Native calls accept at most 64 KiB and, for substring search, a source-byte-length
times needle-byte-length product of at most 4 MiB. Exceeding either returns the
internal `-2` fallback sentinel, distinct from a miss (`-1`). Java splits large
requests into windows with needle-minus-one-code-unit overlap. Needles occupying
more than half the allowable window retain the original Java search; this
avoids rescanning almost the entire window for every candidate. Large
interpreter/C1 equality uses a range bridge with the existing five-argument
search calling shape. Java helper backedges allow safepoints between bounded
calls. C2's existing forward-search and equality implementations remain in use.
The limits bound native work, not elapsed time or all existing JDK intrinsics.

C1 parses a Java implementation of the checked equality intrinsic. Tiny arrays
use existing word-load intrinsics; first-byte misses return before dispatch.
Ordinary comparisons retain the existing equality leaf, while large arrays use
the chunk helper. Java control flow preserves caller state across the slow call.

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
| `String.equals` (both coders) | Interpreter uses `_equalsL`; C1 parses the checked Java helper and uses short/prefix checks plus bounded equality leaves; C2 retains its equality intrinsic |
| `String.contentEquals(CharSequence)` | String arguments delegate to equality; same-coder builders retain the existing `ArraysSupport.mismatch` intrinsic and synchronization; mixed-coder builders and arbitrary sequences retain code-unit access |
| Array equality / mismatch | Retain existing array intrinsics |
| `startsWith` / `endsWith`, exact `regionMatches` | Retain existing range-mismatch intrinsics for equal coders and code-unit comparisons for mixed coders |
| Lexical `compareTo` and ignore-case comparisons | Java code-unit order and case semantics; byte-order compare is not a UTF-16 replacement |
| `String` / builder hashing | Java's specified polynomial hash; StringZilla hash is not interchangeable |
| Copy, inflate/compress, append, insert, reverse | Existing arraycopy/conversion intrinsics and allocation/write-barrier semantics |
| `StringLatin1` / `StringUTF16.LinesSpliterator`, `trim`, `strip`, `isBlank`, indent/stripIndent helpers | Retain their CR/LF and Unicode classification scanners; a character-set bridge and separate workload measurements would be required |
| Unicode case conversion and encoding | Java case/code-point/charset rules differ from upstream byte/UTF-8 operations |

This change introduces search intrinsics and adds interpreter/C1 implementations
for the existing equality intrinsic. The audit does not claim to accelerate
every string operation, nor to replace arbitrary `CharSequence` storage with
byte arrays.

## Validation and reproduction

`test/jdk/java/lang/String/StringZillaSearch.java` checks independent scalar
oracles in interpreter, C1, C2, compact-strings-off, feature-off, forced-C2 startup compilation, and all-search-
intrinsics-disabled modes (both interpreter JNI fallback and compiled JNI
fallback). It covers threshold boundaries, empty and oversized
needles, offsets/extreme `fromIndex`, builder capacity, mixed encodings, isolated
surrogates, supplementary characters, odd-byte UTF-16 matches, and concurrent GC.
`TestStringZillaAvailability` verifies registration/availability in both compilers
with no flag, explicit on, and explicit off. `TestStringZillaCompilation` asserts that 26 public-API
callers actually compile at levels 1 and 4, preventing silent compiler bailout
from being hidden by interpreter fallback. Existing String, builder, and HotSpot string tests are
also run; exact results are recorded in `BENCHMARKS.md` and
[default-on validation](DEFAULT_VALIDATION.md).
`StringZillaKernelsTest` compiles the production kernels with isolated VM
callbacks, checks all eight capability masks and repeated initialization, and
executes supported tables directly. It checks 0/1/63/64-character needles and
rejects negative/oversized counts with null pointers, independently of Java
gates and VM assertions. [Review follow-up](REVIEW_RESPONSE.md) records the
native hardening, sanitizer scope, and retained benchmark limitations.
`TestStringZillaEquality` adds forced C1/C2 equality checks at every short-length
and mismatch boundary with live caller values, compact strings/object headers
off, and explicit opt-out. The [final review](FINAL_REVIEW.md) records its
validation and a measured C1 optimization rejected for a short-input regression.
`StringZillaBounded` checks window edges, long needles, equality, surrogate pairs
and JNI/opt-out paths in eight execution modes. `TestStringZillaWork` forces the
three Java chunk helpers through C1/C2 and checks a private equality call through
a method handle. Native tests reject excessive work using null pointers before
any array read, and check that Java/native work-limit constants agree.
`StringZillaLongNeedle` adds long repeated-prefix, near-end/near-start mismatch
and crossed-byte controls with two JMH forks per case.

The JMH benchmark is
`test/micro/org/openjdk/bench/java/lang/StringZillaSearch.java`. It parameterizes
size, coder, and miss/start/end/repeated input shapes; operations include forward
and reverse substring/character searches, equality, builders, contains, and replace.
Compare the same built JVM with the feature off and on, separately under `-Xint`,
`-XX:TieredStopAtLevel=1`, and `-XX:-TieredCompilation`. Do not infer hardware ARM
performance from cross-compilation or emulation.
