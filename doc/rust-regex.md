# Rust regex backend

This fork includes a Rust backend for a compatible subset of `java.util.regex`.
Public APIs are unchanged. Patterns can use Rust, prepared Java specializations,
or the ordinary Java engine; native dispatch is not always the cheapest path.

## Building and controls

The backend is enabled by default for x86_64 and AArch64 on GNU/Linux and
macOS. Other targets build without it. Use `--disable-rust-regex` to omit it.
Enabled builds require Cargo, Rust 1.85 or newer and the matching Rust standard
library copyright notices. CI pins Rust 1.99.1 through the shared
`get-rust-regex` action. Install the toolchain and notices with rustup:

```sh
rustup toolchain install 1.99.1 --profile minimal --component rust-docs,rustfmt,clippy
rustup default 1.99.1
bash configure
make images
```

Configure resolves `RUSTC` and passes that compiler to Cargo. If notices cannot
be found in its sysroot, supply `--with-rust-regex-license=PATH`. Cargo builds
with `--frozen` from vendored sources; ordinary builds do not access a registry.
The adapter and HotSpot are linked together in `libjvm`.

On included builds, `UseRustRegex` and `UseRustRegexIntrinsics` default to true.
Applications can disable the backend with `-XX:-UseRustRegex`, or select its
registered JNI fallback with `-XX:-UseRustRegexIntrinsics`. JNI remains available
in interpreter, C1 and C2 configurations. The configured maximum compiler tier
also guides prepared Java choices; it does not identify the current tier of an
individual call.

## Compatibility

The recognizer accepts ASCII syntax including ordinary, named and noncapturing
groups, ordered alternation, ranges and negated classes, ASCII shorthand
classes, greedy/reluctant repetition, quoting, byte-valued escapes, anchors and
boundaries. Native flags are `UNIX_LINES`, ASCII `CASE_INSENSITIVE` and `DOTALL`.
Plain literals and `LITERAL` mode keep Java's optimized literal handling.
Backreferences, lookaround, possessive repetition, embedded flags, Unicode
properties, nested class operations and other unsupported syntax use Java,
including its usual invalid-pattern diagnostics.

Captures and state remain Java-compatible for `find`, `matches`, `lookingAt`,
replacement, split, predicates, streams and immutable match results. Repeated
captures are admitted only when Java's retained capture history can be
preserved. Prepared plans handle some short/early matches without constructing
a Rust engine. Complete validated preparations supply capture metadata without
a second Java source parse.

Compact Latin-1 Strings use their bytes directly. Noncompact Latin-1 Strings
are encoded when needed. Other `CharSequence` implementations use ordinary
Java traversal without taking a whole-input `toString()` snapshot or promoting
the shared Pattern. Resetting to a String can use the native backend again.
Non-Latin-1 input that cannot be answered by a prepared plan uses Java. The
native region limit is 65,536 characters; longer regions can still use a
prepared early match or immediate rejection. Unresolved longer operations,
unsupported bounds and final-terminator cases promote to Java.

Rust offsets do not describe Java's attempted reads/backtracking. Prepared
plans compute exact end flags where supported; other `hitEnd`/`requireEnd`
queries promote and replay the saved operation in Java. General anchored
failures replay immediately when Java continuation state is needed. Failed
searches defer continuation recovery until another `find` or `usePattern`;
reset discards it. Fixed-digit recovery uses a bounded specialization without
promoting the Pattern. Per-Matcher Java choices preserve eligibility for other
inputs. Scanner's mutable input and streaming end-state queries follow these
same rules.

## Ownership and native safety

A bounded cache retains at most 256 expression/flag keys, validated preparation
metadata and weak backend values. Capture-name metadata is immutable and shared
across wrapper restoration. Native engines are constructed lazily where
possible; Cleaner release follows wrapper lifetime. In-flight calls retain
their owner. Immutable Regex engines are shared, while pooled Cache/Captures
state belongs to individual searches.

The native adapter accounts for live engines, pooled caches and growth under a
64 MiB aggregate budget. Allocation/admission failures fall back to Java;
new Patterns can retry after resources are released. Full DFA construction and
the bounded backtracker are disabled; Thompson/PikeVM fallback remains available.

The C ABI uses pointers, sizes and integer results, never a Rust `bool` return.
Bounded leaf calls use relocated array-element addresses. Work beyond the leaf
budget uses stable native copies and safepoint-capable thread state.
Rust panics are contained at the FFI boundary; release builds retain
`panic = "unwind"`. Changing header layout, GC handling, capture publication or
thread transitions requires interpreter/C1/C2 and JNI correctness coverage.

## Maintenance and tests

`make/scripts/update-rust-regex.py` is the explicit dependency-update tool. It
regenerates the lockfile and pristine vendor checksums, legal notices and
`UPSTREAM.json`. Review those changes together; ordinary toolchain updates do
not require crate upgrades. The adapter is GPLv2; bundled crates and Rust's
standard library use their MIT option.

```sh
cd src/hotspot/share/runtime/rustregex
cargo test --frozen
cargo clippy --frozen --all-targets -- -D warnings
cargo fmt --check
cd ../../../../..
make test TEST="jtreg:test/jdk/java/util/regex"
make test TEST="jtreg:test/hotspot/jtreg/runtime/interpreter/RustRegexStartup.java"
make test TEST="jtreg:test/hotspot/jtreg/runtime/interpreter/RustRegexArrayLayout.java"
```

The regular tier1 jobs include regex API/state, ownership, mutable input,
continuation, admission/recovery and safepoint tests, plus HotSpot startup and
array-layout tests. Platform builds cover Linux x86_64/AArch64 and macOS
AArch64. Cross compilation/emulation establishes functionality, not native
hardware performance.

The microbenchmarks `RustRegexNative`, `RustRegexState`, `RustRegexEndFlags`,
`RustRegexLifetime` and `PreparedRegexCost` cover reusable operations, requested
end flags, complete lifetimes and preparation reuse. Forced weak-slot clearing
isolates wrapper reconstruction; GC-cold lifetimes warm callers/adapters and do
not measure whole-process startup. Compare matching semantics and actual
execution routes on the same host, and retain short-input, cold, allocation and
fallback costs alongside gains.
