# Rust regex search filter

This integration uses Rust regex 1.13.1 (verified against the live crates.io
index on 2026-10-05) to reject unsuccessful, reused, long Latin-1 searches in
`java.util.regex.Matcher`. It preserves Java matching behavior. It does not
replace Java's matcher with an incompatible regex engine, and it makes no claim
that 99% of patterns are accelerated.

## Build and flags

The fork builds and enables the filter by default on supported targets:

```sh
bash configure # plus your usual configure options
make jdk
build/<conf>/jdk/bin/java MyProgram
```

Rust/Cargo 1.85 or newer and the Rust target standard library must be installed.
Native and cross targets are GNU Linux x86_64/aarch64 and macOS x86_64/aarch64.
These builds require Rust; missing tools produce a configure error rather than
silently omitting acceleration. Builders can use `--disable-rust-regex` to omit
the adapter and Rust toolchain requirement. Unsupported targets omit it by
default, and explicitly enabling it there reports an error. Native Linux/macOS
CI jobs install Rust and its matching standard-library notices before configure.
Cross builders install the corresponding `rustup target add` target. Cargo
builds with `--frozen` from checked-in sources; JDK builds require no crates.io
access. Matching Rust standard library copyright/dependency notices are copied
from the toolchain into the legal image; install the `rust-docs` component or
supply `--with-rust-regex-license=<matching COPYRIGHT-library.html>` when using
a minimal toolchain installation. The target uses baseline CPU features, with the upstream `memchr`
runtime dispatch selecting supported SIMD. There is no `target-cpu=native`.

`UseRustRegex` defaults to true when the adapter is included. Users can disable
acceleration with `-XX:-UseRustRegex`. `UseRustRegexIntrinsics` defaults to true and
controls all direct HotSpot leaf paths. Use `-XX:-UseRustRegexIntrinsics` to exercise the
registered JNI fallback. A JDK built without Rust warns and disables a requested
`UseRustRegex`; standard Java matching remains available.

## Dispatch and lifetime

Java always compiles the Pattern first, so Java syntax validation, named groups,
serialization, and precompiled Pattern reuse keep their existing behavior. A
Pattern accumulates eight consecutive unsuccessful eligible Latin-1 searches with default
flags before lazily compiling a Rust filter. One Matcher claims preparation with
an atomic flag; other Matchers continue in Java while it compiles. Volatile
publication makes the completed immutable filter available for reuse. It can be shared
across Matchers and threads. A Cleaner releases it when unreachable; the caller
uses `Reference.reachabilityFence` to protect each native search. Native handles
are transient and excluded from Pattern serialization data.

The eligibility gate accepts `String` inputs with 2,048–65,536 remaining
characters and a Java `Start` or `BnM` root. Size, input type and root checks run
before querying the native enable flag, so short inputs and mutable sequences
do not initialize the Rust backend. UTF-16 strings and mutable
CharSequences use Java. Rust operates directly on the compact String backing
array through an internal shared secret; it never changes it. Oversized input
uses Java rather than retaining heap pointers across an unbounded native call.
The eight-miss counter is an approximate volatile heuristic; races can defer
compilation but cannot change matches.

The shared C ABI adapter parses once, checks minimum match length in that parsed
representation, and reuses it for prefix extraction and NFA construction. It
builds a dense DFA with separate limits of 2 MiB for the NFA, 2 MiB for DFA output
and 4 MiB for determinization workspace. Prefix extraction supplies the upstream
SIMD-capable literal prefilter. Pattern length is bounded to 4,096 bytes.
Retained filters share a 64 MiB native accounting budget. Each handle is charged
for the DFA's reported storage, prefilter storage, inline handle, and a fixed
overhead allowance. Before construction, the adapter reserves 12 MiB plus handle
overhead for the maximum DFA/prefilter/NFA/determinization charges and a parsing
allowance; successful construction reduces it to the actual retained charge.
Cleanup, errors, and unwinding return the reservation. Distinct Patterns with
identical expressions are charged separately. Budget exhaustion permanently
selects Java for that Pattern. Concurrent preparations share the same budget
and require enough capacity for their working state. Existing filters continue
to work and their search path performs no budget accounting. This bounds
accounted filter storage and compilation reservations; allocator metadata,
fragmentation, and the Rust runtime are outside that metric.
Compilation occurs in native thread state with copied pattern bytes, so GC can
proceed. Normal searches allocate nothing and acquire no locks. Search errors
and caught Rust panics fail open; all three C ABI exports contain unwinding
panics, including Cleaner destruction. The interpreter has frameless x86_64
and AArch64 entries; C1
uses the platform C calling convention; C2 emits a leaf runtime call. All three
call the same bounded, immutable search routine without JNI transitions or
input copying. Normal JNI remains the fallback when intrinsification is
unavailable, disabled, or the interpreter needs a safepoint slow path.
The AArch64 interpreter materializes the complete libjvm function address and
branches through a register, independently of code-cache size or placement.
C1's runtime-call name table includes the Rust leaf for debug verification.

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
The syntax gate tracks the first class character after optional negation, so a
leading literal `]` cannot hide later set operators or nested classes. Combined
grammar tests cover those interactions. This remains a conservative lexical
recognizer; extending the subset should use parsed structure and differential
evidence, rather than merely adding exceptions to the character whitelist.

A successful eligible Java search resets the miss gate, including before native
compilation. A compiled DFA is retained, but probing resumes only after eight
consecutive misses. Sequential alternating hits and misses no longer accumulate enough
evidence to compile a filter.
This adapts to a formerly negative workload becoming positive and amortizes
compilation without a permanent positive-search penalty. A first positive
probe still has a cost. The opt-out flags remain available; no universal
speedup is asserted.
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
make test TEST="jtreg:test/jdk/java/util/regex"
make test TEST="jtreg:test/jdk/java/util/Scanner jtreg:test/jdk/java/lang/String"
```

`RustRegexTest` compares bound/state and capture outcomes against the same Java
engine with native handles disabled. Its jtreg actions exercise interpreter,
C1, C2, JNI, the disabled flag, default settings, normal tiering and uncompressed Strings, plus concurrent Pattern
reuse/GC and serialization. `test/micro/.../regex/RustRegexFilter.java` is the
JMH benchmark for long misses, positive searches, short inputs, UTF-16 inputs,
unsupported flags/syntax and literal searches. Compare `-XX:-UseRustRegex`, `-XX:+UseRustRegex`,
and `-XX:+UseRustRegex -XX:-UseRustRegexIntrinsics` with each execution tier.
The differential test also checks that UTF-16 inputs, uncompressed Strings and
unsupported flags do not learn or compile filters. `RustRegexInitialization`
checks deferred backend initialization for short/mutable searches and initialization
on a long String search. The differential test also covers literal `]` at the start of a class, embedded
NUL pattern bytes, `find(int)`, anchored-operation bypass and Rust's possessive
superset. `runtime/interpreter/RustRegexStartup` tests both 64 MiB and 256 MiB
code caches with default settings, Rust disabled, explicitly enabled and using the JNI fallback.

Measured results and exact commands are recorded in
[rust-regex-results.md](rust-regex-results.md). AArch64 runtime performance must
be measured on real AArch64 hardware; cross compilation is not a performance
measurement. The complete JDK test suite is not represented by focused jtreg
coverage, so these results establish only the tested regression scope.
Review fixes and their separate validation are recorded in
[rust-regex-review-results.md](rust-regex-review-results.md).
The final performance review and new before/after measurements are recorded in
[rust-regex-final-review.md](rust-regex-final-review.md).
The subsequent grammar, native-budget, and complete-lifetime review is in
[rust-regex-review-followup.md](rust-regex-review-followup.md), including the
consecutive-miss gate and nonblocking shared-Pattern preparation.

Default-build/runtime policy and its validation are recorded in
[rust-regex-defaults.md](rust-regex-defaults.md).
