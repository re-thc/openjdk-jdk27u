# Rust regex primary engine

This fork selects Rust at Pattern compilation for a parsed common subset of
`java.util.regex`. Supported Patterns return matches and captures directly
from Rust or a narrow short-match specialization, and retain no Java node graph.
Unsupported syntax compiles with Java. Unsupported inputs/operations permanently
promote the affected Pattern to Java.

## Build and runtime controls

GNU Linux/macOS x86_64 and AArch64 builds compile the locked vendor snapshot
offline. Supported default builds require Rust; builders can opt out with
`--disable-rust-regex`. Unsupported targets retain Java. Baseline CPU features
and upstream memchr runtime SIMD dispatch avoid a target-cpu=native dependency.

`UseRustRegex` defaults to true when included. Applications opt out with
`-XX:-UseRustRegex`. `UseRustRegexIntrinsics` also defaults to true;
`-XX:-UseRustRegexIntrinsics` selects registered JNI for Rust calls. The short
specialization continues to avoid those calls in either mode.

Interpreter, C1 and C2 paths on x86_64/AArch64 call the same C ABI with a handle,
input byte-array address and capture-array address. Four trailing ints carry
region bounds, search position and operation. C2 models capture writes. The
AArch64 interpreter branches through a full function address, independently
of code-cache placement. JNI remains available in every tier.

## Compatibility and selection

A recursive grammar recognizer translates ASCII expressions and records capture
numbers/names and nullable subexpressions. It accepts ordinary/noncapturing/named
groups, ordered alternation, ranges, negated classes, default ASCII d/D/w/W/s/S,
greedy/reluctant quantifiers, quoting, byte-valued escapes, anchors and boundaries.
Supported native flags are UNIX_LINES, ASCII CASE_INSENSITIVE and DOTALL.
Plain literals and LITERAL mode keep Java's optimized literal path.

Literal-prefix/digit-tail expressions, including ordinary/named captures, get
a compact specialization containing only the prefix and capture indices. It
handles searches of up to 256 characters and checks the first candidate of
longer searches. Numeric runs return to Rust after 256 characters on short
inputs or 32 characters on larger inputs.
Digit-only searches skip nondigits directly and read each digit once. Inputs
shorter than the required prefix plus one digit reject immediately.
Literal searches respect the region end, including small regions within large Strings.
This avoids the native boundary for short/early matches. The Rust engine is
compiled on the first operation that needs it, with no use-count threshold.
Patterns used exclusively through the specialization allocate no native engine
or Cleaner registration. A bounded cache also retains these parsed plans, so
recompiling an expression does not have to parse it again.

Dot uses Java's exact Latin-1 terminator set. Fixed-width expressions and
fixed-width prefixes with greedy fixed-width repeated tails share one engine
for all operations. Other expressions get a separate native engine with an
end assertion for matches(), including alternatives that require a later branch
for a full match. Keeping that variant separate preserves the primary engine's
one-pass capture optimization. Capture-bearing repeated subtrees are restricted
to one non-nullable capture without nested captures: Java's retained capture
histories can otherwise differ from Rust's.

Backreferences, lookaround, possessive repetition, embedded flags, Unicode
properties, nested/set-operation classes and other unrecognized constructs
use Java. The parser tracks negation and a leading literal ]; combined classes
such as `[]a~~a]+` cannot enter Rust. Unrecognized/invalid syntax goes to Java
for its usual syntax diagnostics. Extending the subset requires grammar and
differential evidence, not additional lexical exceptions.

Compact Latin-1 Strings use backing bytes directly. Other CharSequences are
snapshotted. The ASCII short plan can answer short searches and early candidates
directly on Unicode or noncompact Strings, without encoding. Operations that
need Rust encode noncompact Latin-1 Strings; non-Latin-1 contents promote to
Java. Regions over 65,536 characters can use the short plan for an early match
or immediate anchored rejection; other operations on these regions promote.
The native leaf-call limit remains 65,536 characters. Context-sensitive expressions
with transparent bounds or disabled anchoring bounds promote too. Dollar/\Z
expressions promote for final Java line terminators.

The selected backend supplies capture offsets, including unmatched groups, for find, matches,
lookingAt, replacement, splitting, immutable results and streams. Matcher keeps
zero-length progression. Literal-prefix/greedy-digit-tail plans compute exact
Java hitEnd()/requireEnd() flags without promotion, including results returned
by Rust for longer digit runs. Successful matches and failed searches set the
flags immediately without retaining replay input or metadata; anchored misses
inspect the saved prefix only if queried. General expressions still promote
and replay the last operation using saved input/bounds when these flags are queried: Rust's
match offsets do not describe Java's attempted reads and backtracking. Ordinary
matching never performs that replay. Scanner streaming end-state queries
preserve Java behavior; general delimiter patterns select Java after the first
query. Promotion publishes
a separately compiled graph; existing Matchers allocate Java locals lazily.
In-flight native calls retain their wrapper until completion.

## Memory and lifetime

A cache retains at most 256 expression/flag keys and weak native-engine values.
Identical live Patterns can share an immutable engine; weak values do not keep it
alive after the owners disappear. Unsupported syntax decisions are cached;
allocation failures remain retryable for newly compiled Patterns. Concurrent
cold misses can build duplicates, both charged to the budget.

The regex-automata meta engine uses bounded NFA/one-pass construction and
bounded lazy DFAs. Concurrent Matchers use separately owned pooled caches.
A shared 64 MiB accounting budget admits construction, retained engines and
search caches. It is a ceiling, not 64 MiB allocated at startup or per Pattern.
Construction reserves 16 MiB before allocation, then shrinks to the retained
charge. Cache creation reserves an upper allowance before allocation and keeps
an allowance for fixed state and lazy-DFA growth. Admission failure selects
Java; errors, unwinding and Cleaner cleanup return reservations.
The first search cache is admitted and initialized during native compilation, while
the thread is in native state, so the selected engine is ready for its first call.

The budget bounds accounted engine/cache storage and construction reservations;
allocator metadata, fragmentation and the Rust runtime are outside that metric.
Selected Patterns keep no Java graph. Promotion releases the backend reference;
other Patterns may still own the shared engine, and Cleaner cleanup is eventual.
Native Matcher arrays retain captures plus four ABI ints; Java-only Matchers
keep the original array size. Compilation/destruction use
native thread state; match calls retain no heap addresses after return. All
three C ABI exports contain unwinding panics and fail open.

## JDK applicability

The source inventory is [rust-regex-callers.txt](rust-regex-callers.txt). Backend
selection in Pattern and shared Matcher operations cover hidden callers too.

| Caller family | Route |
| --- | --- |
| Matcher search, anchored matching, captures, replacement, streams | Native primary matching, subject to the fallback rules above. |
| Pattern split, delimiter split, streams, predicates, match predicates | Shared Matcher path; existing literal shortcuts remain. |
| String regex helpers | Shared Pattern selection; repeated live expressions can share engines. |
| Scanner | Mutable snapshots; general streaming end-state queries select Java. |
| Filesystem/ZIP glob matchers | Anchored native matching if translated syntax is eligible. |
| Swing, joptsimple, compiler and JDK tool helpers | Shared Pattern/Matcher selection. |
| PrintPattern | Requests Java compilation before inspecting the graph. |
| Grapheme/Unicode constructs | Unsupported syntax selects Java. |
| Xerces XML Schema/XPath and platform native regex | Independent dialects/engines; not routed through Pattern. |

Audit commands:

```sh
rg -l 'import java.util.regex|java.util.regex.Pattern|java.util.regex.Matcher' src --glob '*.java'
rg -n 'class.*(Regex|Regexp)|package .*regex' src --glob '*.java'
```

## Vendor updates

```sh
python3 make/scripts/update-rust-regex.py --check
python3 make/scripts/update-rust-regex.py
python3 make/scripts/update-rust-regex.py --version <version>
```

The updater resolves dependencies outside the offline checkout, regenerates
Cargo.lock and pristine vendor sources/checksums, updates JDK MIT notices, and
records the live version/date/checksum in UPSTREAM.json. Review licenses and
toolchain requirements on updates. The adapter is GPLv2; bundled crates and the
Rust standard library use their MIT option.

## Upstream optimization guidance

The [option audit](rust-regex-optimization-audit.md) maps the upstream performance
guide to the adapter and records isolated trials of ThinLTO, full DFAs, bounded
backtracking and larger lazy-DFA caches. Default `std`/`perf` Cargo features,
literal/SIMD prefilters, lazy DFAs, one-pass captures, reusable engines and
separate mutable search caches are enabled. Release builds use optimization
level 3 and one codegen unit. Options with mixed performance or greater memory
cost remain deliberately disabled; the audit includes a portable offline script
and native measurements.

## Tests and measurements

```sh
cd src/hotspot/share/runtime/rustregex
cargo test --frozen
cargo clippy --frozen --all-targets -- -D warnings
cargo fmt --check
cd ../../../../..
make test TEST="jtreg:test/jdk/java/util/regex"
make test TEST="jtreg:test/jdk/java/util/Scanner jtreg:test/jdk/java/lang/String"
```

RustRegexTest compares captures and API state against a Java-only reference
and asserts native matching keeps Java roots absent. Modes cover default,
on/off, JNI, interpreter, C1, C2 and noncompact Strings. Separate tests exercise
memory admission/recovery and startup. Rust tests cover captures, full matches,
nullable results, byte inputs, concurrency, accounting and contained FFI panics.

RustRegexNative measures reusable searches, including positive/negative cases,
captures, fallback controls and short inputs. RustRegexEndFlags measures matching
plus both end-state queries, including early candidates in large regions.
RustRegexLifetime includes every
search in complete 1/8/9/10/16/32-call lifetimes, mixed workloads and shared
Pattern contention. Its shared/cold/distinct parameter distinguishes a live
shared engine, a collected previous owner of the same expression, and new
expressions. Compare each tier with -XX:-UseRustRegex and JNI-only mode.
Cold and distinct measurements collect before each invocation
outside the timed operation; Cleaner completion is not synchronized and its
asynchronous work can overlap measurement. Optional backend assertions ensure budget pressure
cannot silently substitute Java for the native compiler being measured.
Cross compilation/emulation is functional coverage; AArch64
performance requires real hardware.

The [performance report](rust-regex-performance.md) compares short inputs by
regex shape and tier, end-state queries, and complete Pattern lifetimes.
It includes the benchmark protocol, limitations and routing decisions.
