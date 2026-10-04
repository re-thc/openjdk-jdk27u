# Optional Rust regex search filter

This integration uses Rust regex 1.13.1 (verified against the live crates.io
index on 2026-10-04) to reject unsuccessful, reused, long Latin-1 searches in
`java.util.regex.Matcher`. It preserves Java matching behavior. It does not
replace Java's matcher with an incompatible regex engine, and it makes no claim
that 99% of patterns are accelerated.

## Build and flags

The ordinary JDK build remains independent of Rust. Opt in at configure time:

```sh
bash configure --enable-rust-regex # plus your usual configure options
make jdk
build/<conf>/jdk/bin/java -XX:+UseRustRegex MyProgram
```

Rust/Cargo 1.85 or newer and the Rust target standard library must be installed.
Native and cross targets are GNU Linux x86_64/aarch64 and macOS x86_64/aarch64.
Cross builders install the corresponding `rustup target add` target. Cargo
builds with `--frozen` from checked-in sources; JDK builds require no crates.io
access. Matching Rust standard library copyright/dependency notices are copied
from the toolchain into the legal image; install the `rust-docs` component or
supply `--with-rust-regex-license=<matching COPYRIGHT-library.html>` when using
a minimal toolchain installation. The target uses baseline CPU features, with the upstream `memchr`
runtime dispatch selecting supported SIMD. There is no `target-cpu=native`.

`UseRustRegex` defaults to false. `UseRustRegexIntrinsics` defaults to true and
controls all direct HotSpot leaf paths. Disable just the latter to exercise the
registered JNI fallback. A JDK built without Rust warns and disables a requested
`UseRustRegex`; standard Java matching remains available.

## Dispatch and lifetime

Java always compiles the Pattern first, so Java syntax validation, named groups,
serialization, and precompiled Pattern reuse keep their existing behavior. A
Pattern accumulates eight unsuccessful eligible searches before lazily compiling
a Rust filter, once under a Pattern lock. The immutable filter can be shared
across Matchers and threads. A Cleaner releases it when unreachable; the caller
uses `Reference.reachabilityFence` to protect each native search. Native handles
are transient and excluded from Pattern serialization data.

The eligibility gate accepts `String` inputs with 2,048–65,536 remaining
characters and a Java `Start` or `BnM` root. UTF-16 strings and mutable
CharSequences use Java. Rust operates directly on the compact String backing
array through an internal shared secret; it never changes it. Oversized input
uses Java rather than retaining heap pointers across an unbounded native call.
The eight-miss counter is an approximate volatile heuristic; races can defer
compilation but cannot change matches.

The shared C ABI adapter builds a dense DFA, bounded to 2 MiB of output and
4 MiB of determinization workspace. Prefix extraction supplies the upstream
SIMD-capable literal prefilter. Pattern length is bounded to 4,096 bytes.
Compilation occurs in native thread state with copied pattern bytes, so GC can
proceed. Searches allocate nothing, acquire no locks, and fail open on native
search errors. The interpreter has frameless x86_64 and AArch64 entries; C1
uses the platform C calling convention; C2 emits a leaf runtime call. All three
call the same bounded, immutable search routine without JNI transitions or
input copying. Normal JNI remains the fallback when intrinsification is
unavailable, disabled, or the interpreter needs a safepoint slow path.

Only `false` bypasses Java. It clears groups/locals through the existing search
prologue and sets `hitEnd` as exhausted Start/BnM searches do. Possible matches
execute the original Java root, preserving captures, zero-width progression,
`hitEnd`, `requireEnd`, previous-match state, regions, replacement, and splitting.
The Rust dot is widened to all bytes, making it a conservative superset of the
Java dot. Unsupported flags, lookaround, backreferences, anchors, embedded flags,
Unicode properties, named groups, class set operations/nesting and quoting
use Java. If Rust accepts a possessive suffix as nested repetition, it broadens
the filter language: the additional `+` includes one repetition of the original
quantifier. Java still enforces possessive semantics on every candidate. Supported ASCII expressions include ordinary
captures, noncapturing groups, alternation, ranges, negated classes, the default
ASCII `d/D/w/W/s/S` classes and ordinary greedy/reluctant quantifiers. Plain
literals stay on Java's existing Boyer-Moore path.

A successful native probe followed by a Java match resets the miss gate. The
compiled DFA is retained, but probing resumes only after eight more misses.
This adapts to a formerly negative workload becoming positive and amortizes
compilation without a permanent positive-search penalty. A first positive
probe still has a cost; the flag is opt-in and no universal speedup is asserted.
`matches` and `lookingAt` retain Java because rejecting them alone does not
supply the exact Java end-state flags. Extending native positive-match handling
requires an explicit equivalence proof for those flags and capture histories.

## Applicability audit

A repository-wide import/qualified-reference search found 164 Java files using
`java.util.regex`, including internal and otherwise hidden helpers. The shared
Matcher search entry covers eligible search operations without maintaining
multiple regex engines at individual call sites.

| Entry/caller family | Route and applicability |
| --- | --- |
| `Matcher.find`, `find(int)`, `results` | Shared `Matcher.search`; eligible failed searches accelerate. |
| `Matcher.replaceAll`, `replaceFirst`, `appendReplacement` | Finding uses the shared search; replacements and captures remain Java. |
| `Pattern.split`, `splitWithDelimiters`, `splitAsStream` | Shared Matcher search. |
| `Pattern.asPredicate` | Predicate calls `find`, so the filter is inherited. |
| `Pattern.asMatchPredicate`, `Pattern.matches`, `Matcher.matches`, `lookingAt` | Anchored match entry remains Java to preserve exact end-state flags. |
| `String.replaceAll`, `replaceFirst`, regex `split`/`splitWithDelimiters` | Inherited when they use Pattern; existing literal splitting/replace shortcuts remain faster for their own cases. |
| `String.matches` | Anchored Java match entry. |
| `Scanner.findWithinHorizon`, `findInLine`, `findAll`, delimiters | Matcher searches inherit filtering when input is a qualifying String; Scanner normally uses mutable CharBuffer storage and therefore falls back. |
| `sun.nio.fs`/`jdk.zipfs` glob matchers | Convert glob syntax to Pattern, then anchored `matches`; retain Java. |
| `javax.swing.RowFilter.RegexFilter`, `jdk.internal.joptsimple.util.RegexMatcher` | Their Matcher `find` or `matches` operations follow the same rules. |
| Compiler, javadoc, jdeps, jpackage, jshell, jlink, JFR, networking, security and management helpers | Pattern users inherit the centralized rule; most short inputs remain Java. |
| `jdk.internal.util.regex.Grapheme` | Unicode grapheme algorithm used by `\\X`; unsupported syntax falls back. It is not an independent regex search engine. |
| Xerces `RegularExpression`, `RegexParser`, `ParserForXMLSchema`, `BMPattern` in `java.xml` | Independent XML Schema/XPath engine with different dialect, Unicode tables and match state. Not routed through Pattern and not accelerated by this change. |
| Native regex in platform/tooling code | Independent APIs; no blanket replacement of OS or debugger regex semantics. |

Audit command:

```sh
rg -l 'import java.util.regex|java.util.regex.Pattern|java.util.regex.Matcher' src --glob '*.java'
rg -n 'class.*(Regex|Regexp)|package .*regex' src --glob '*.java'
```

One-shot String helpers generally create a new Pattern, so their single search
does not reach the reuse gate. Reused Pattern/Matcher and predicate APIs can
amortize the DFA.

The complete 164-file inventory is in [rust-regex-callers.txt](rust-regex-callers.txt).

## Updating the vendor snapshot

```sh
python3 make/scripts/update-rust-regex.py --check
python3 make/scripts/update-rust-regex.py
# Or select an explicit non-yanked release:
python3 make/scripts/update-rust-regex.py --version <version>
```

The updater resolves crates outside the offline checkout before changing files,
regenerates Cargo.lock and the pristine `cargo vendor` directory including
checksums and original licenses, regenerates JDK MIT notices, and records the
live index version, publication date and checksum in `UPSTREAM.json`. The adapter
is GPLv2; bundled crates and the Rust standard library use their MIT option.
Review changed dependency/toolchain requirements and licenses with each update.

## Validation and benchmarks

```sh
cd src/hotspot/share/runtime/rustregex
cargo test --frozen
cargo clippy --frozen -- -D warnings
cargo fmt --check
cd ../../../../..
make test TEST="jtreg:test/jdk/java/util/regex" JTREG="JAVA_OPTIONS=-XX:+UseRustRegex"
make test TEST="jtreg:test/jdk/java/util/Scanner jtreg:test/jdk/java/lang/String"
```

`RustRegexTest` compares bound/state and capture outcomes against the same Java
engine with native handles disabled. Its jtreg actions exercise interpreter,
C1, C2, JNI, the disabled flag, normal tiering and uncompressed Strings, plus concurrent Pattern
reuse/GC and serialization. `test/micro/.../regex/RustRegexFilter.java` is the
JMH benchmark for long misses, positive searches, short inputs, unsupported
syntax and literal searches. Compare `-XX:-UseRustRegex`, `-XX:+UseRustRegex`,
and `-XX:+UseRustRegex -XX:-UseRustRegexIntrinsics` with each execution tier.

Measured results and exact commands are recorded in
[rust-regex-results.md](rust-regex-results.md). AArch64 runtime performance must
be measured on real AArch64 hardware; cross compilation is not a performance
measurement. The complete JDK test suite is not represented by focused jtreg
coverage, so these results establish only the tested regression scope.
