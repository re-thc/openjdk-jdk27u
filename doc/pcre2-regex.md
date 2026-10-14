# PCRE2 regex comparison

This experimental branch starts at Rust PR #5 commit
`cf8ff51954c23effb4e5e6a281ef8bf28111ca0c`. It replaces the native Rust
engine with bundled PCRE2 10.49 while retaining the existing public Pattern
and Matcher APIs, qualified preparation cache, compact Java plans and
interpreter/C1/C2 intrinsics with JNI fallback. It is a comparison branch,
not a claim of general Java compatibility or a universal performance win.

## Source and build

`src/hotspot/share/runtime/pcre2regex/UPSTREAM.json` binds the official release
archive and each imported runtime source to SHA-256. The bundled C libraries
and their SLJIT compiler build with the JDK native build rules. No Cargo,
network fetch or installed PCRE2 is needed to build. Both 8- and 16-bit code
unit libraries are linked into libjvm. Linux and macOS on x86_64/AArch64 are
configured targets; other targets retain Java. Actual tested platforms and
CPU/JIT configuration belong in the accompanying results packet.

PCRE2 is BSD-3-Clause with its PCRE2 exception. SLJIT is BSD-2-Clause. Original
source notices remain intact; both complete licenses are installed through
`java.base/legal/pcre2_regex.md`. SLJIT builds with
`SLJIT_WX_EXECUTABLE_ALLOCATOR=1`: independent mappings switch permissions,
without requesting writable and executable pages together. Allocation or
platform JIT failure retains the interpreter. The 10.49 security fix is
required for the reusable growable JIT stacks; older installed libraries
must not be substituted.

`--disable-pcre2-regex` omits the backend. `-XX:-UsePcre2Regex` selects Java;
`-XX:-UsePcre2RegexIntrinsics` tests registered JNI. Disabling
`UsePcre2RegexJIT` provides the same-binary interpreter control. The default
JIT threshold is 32 eligible positive native calls, changed for ablation with
`Pcre2RegexJITThreshold`. Existing Java fast plans retain their baseline
routing and preparation decisions.

## Compatibility boundary

The recursive subset recognizer qualifies ASCII syntax and preserves the
original source for Java replay. The PCRE2 translation uses validated grammar
nodes, never unchecked textual rewriting. The baseline subset adds capture-free
lookaheads, backward references to already declared single-digit/named groups,
capture-free atomic groups and capture-free possessive repetitions. Lookbehind,
Unicode properties/folding, embedded flags, canonical equivalence, class
intersection and capture histories under repeated nested groups remain Java.
Captures inside assertions/atomic groups/possessive repetitions remain Java:
Java can retain these captures when an enclosing alternative subsequently fails.

PCRE2-8 reads compact Latin-1 bytes without UTF-8 transcoding. The short leaf
copies at most 64 bytes to native stack scratch because PCRE2 match data retains
subject pointer values after a call; Java heap addresses must not enter those
reusable caches. PCRE2-16
uses non-UTF code units, a separate lazily compiled handle and stable native
copies of a Java char-array snapshot. Its route qualifies BMP strings without
surrogates or U+2028/U+2029. Supplementary pairs, unpaired surrogates and these
line terminators remain Java. Properties and indices are not assumed to be
Unicode-equivalent. This conservative width qualification costs a scan and
copies; the comparison must include those costs. Pattern syntax remains ASCII.

Original Matcher continuation and end state matter. General failed anchored
operations execute original Java traversal immediately. Other general end flags
and failed-search continuation use the retained replay machinery. No assertion
is discarded: `(?=error)error[0-9]+` must retain its distinct failed-matches then
find behavior on `error1error2`. A trailing assertion is not split away from a
backtracking consumer: `a+(?=a)` on `aa` must return endpoint 1.

## Lifetime, work and safepoints

Compiled code is immutable. Each handle owns at most sixteen separately acquired
match-data/context slots; the first slot is prepared at compilation and the
others are created only in native thread state under contention. A leaf uses
only the first slot and never waits. Java reachability fences keep handles alive
through calls, weak preparation caching bounds retained Java metadata, and the
Cleaner destroys code, contexts, match data and stacks after the wrapper dies.

An interpreter leaf admits at most 64 subject code units and 4 KiB of compiled
code, with per-attempt match/depth limits 32 and heap limit 16 KiB. Both the
number of unanchored starting positions and per-start backtracking are bounded;
PCRE2's match limit alone resets at each position and is insufficient. Large
work, leaf limit exhaustion or slot contention requests the stable-copy JNI
path. No raw heap address survives its native-state transition, so GC can
proceed while matching. The native interpreter uses match limit 100,000, depth
256 and heap 256 KiB per slot. These are work/resource limits, not a time bound.
Java regex has no interrupt-cancellation contract; interrupts are not turned
into false matches or false misses.

Every native error, exhausted match/depth/heap/JIT-stack limit or allocation
failure requests Java traversal; only PCRE2_ERROR_NOMATCH is a miss. JIT-stack
exhaustion or unsupported JIT options first retry the interpreter in native
state. ENDANCHORED uses the interpreter. Adversarial Java fallback can remain
expensive, as in the original API, but it runs with Java safepoints.

PCRE2 allocation callbacks enforce a global 64 MiB budget. JIT admission caps compiled patterns at 4 KiB and reserves 16 MiB during
preparation; a successful handle retains a 1 MiB executable-code reservation
and must report at most 512 KiB of code; each stack reserves 64 KiB and grows from 32 to 64 KiB. Pools and stacks
have bounded owned lifetimes. Independent atomic memory snapshots expose native
allocation count/bytes, freed bytes, conservative retained budget and actual
reported JIT code bytes. These are not RSS or total allocator/mapping overhead.

JIT preparation copies validated compiled PCRE2 code in native thread state,
then publishes it atomically. Concurrent interpreter calls keep using immutable
original code. Automatic admission requires repeated successful consumed spans
of at least 128 code units in regions of at least 256; frequent misses and tiny
matches do not justify preparation. Small calls remain interpreted. This is a
heuristic to evaluate, including its compilation amortization and memory cost.

## Validation and comparison

`Pcre2RegexCompatibility` compares complete API observations with the independent
original Java parser, including assertion continuation, captures, replacements,
regions/bounds, zero-length progress, flags and surrogate fallbacks. The ported
baseline tests cover initialization, memory pressure, concurrent sharing, GC,
safepoints and array layouts across interpreter/C1/C2/JNI configurations.

Timing results must use the frozen Rust head, original Java and PCRE2 controls
on the same host, exact fixtures, one benchmark implementation and balanced
process order. Native engine-only and adapter measurements do not include JVM
transitions, copies, Java profile decisions or replay and cannot establish a
whole-JDK win. Real production coverage requires a pinned source corpus and
usage context; a purposive starter manifest is not prevalence evidence.
