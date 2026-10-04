# Rust regex review fixes

The review of PR #5 identified an AArch64 startup defect, two missing Rust
panic boundaries and four gaps in regression coverage. The following changes
address those findings without changing the rejection-filter semantics.
Checks were collected on 2026-10-04 UTC (2026-10-05 in Asia/Taipei).

## Changes

- AArch64 interpreter dispatch now materializes the full address of
  `RustRegex::may_match` and branches through `rscratch1`. The former
  `far_jump` helper requires a code-cache target; this target is libjvm text.
  The new sequence has neither that debug assertion nor a relative branch
  range limit when using a small code cache.
- Register `RustRegex::may_match` in C1's shared runtime-call name lookup.
  Fastdebug execution exposed this additional defect: C1's LIR verifier
  could not resolve the leaf target and aborted before compiling it.
- `jdk_regex_may_match` contains unwinding Rust panics with `catch_unwind`
  and returns true to retain Java matching. `jdk_regex_free` also contains
  unwinding panics. Compilation already had the same boundary. A unit test
  injects panics inside the actual exported search and cleanup functions,
  checks the fail-open result and verifies subsequent searches still work.
  Injection code is absent from production builds.
- The seven-mode differential test now checks `[]a]x` and `[^]a]x`, valid
  and invalid `find(int)` offsets, `matches`/`lookingAt` before and after
  filter compilation, and `x*+x`. That last expression demonstrates a Rust
  candidate which Java must still reject under possessive semantics.
- A new HotSpot startup test runs interpreter searches with 64 MiB and
  256 MiB code caches and each of the disabled, intrinsic and JNI modes.
  It runs on ordinary builds as well as Rust-enabled builds, including
  AArch64 debug configurations. Additional child VMs compile 12,000
  searches under C1 and C2, covering the runtime-call verifier.

The controlled pre-fix fastdebug reproduction confirmed the reported
`CodeCache::find_blob` assertion with Rust intrinsics enabled. The review's
claim that this also breaks disabled/default builds was incorrect:
`generate_intrinsic_entry` checks intrinsic availability before generating
the entry. The same pre-fix VM starts successfully with `-XX:-UseRustRegex`.

The review's embedded-NUL explanation did not match the implementation:
patterns use a length-delimited ASCII byte array, not `GetStringUTFChars`.
An additional `a\0+b` differential case verifies that the filter compiles
and preserves the Java result for actual NUL bytes.

## Validation

The original build, regression and benchmark evidence remains in
[rust-regex-results.md](rust-regex-results.md). The checks below were run
again after these review fixes; the original broader test run is not
presented as a new run.

- Linux x86_64 packaged release JDK rebuilt successfully with Rust enabled.
  The changed C1 runtime lookup also compiled with `INCLUDE_RUST_REGEX=0`
  and precompiled headers disabled.
- Rust: three unit tests passed, including both injected FFI panics;
  both debug and optimized release profiles passed. Frozen offline dependency
  resolution, Clippy with warnings denied and rustfmt checks passed.
  The live latest-release check again returned regex 1.13.1.
- Regex jtreg suite: nine test files passed, including 997 framework cases
  (963 TestNG and 34 JUnit). `RustRegexTest` passed all seven execution
  modes, each with 5,248 existing bound/state cases plus the new edge cases.
- HotSpot jtreg: three tests passed, comprising the new six-configuration
  interpreter startup driver, C1/C2 compilation checks and intrinsic
  availability/disable tests.
- GNU Linux AArch64 release HotSpot rebuilt and linked. Under QEMU 10.0.13,
  all six interpreter startup/search configurations passed. Rust-enabled
  cases verified that the native DFA was actually compiled; disabled cases
  verified that it was absent. Separate C1 and C2 smoke tests each completed
  12,000 negative searches and checked a positive match's capture/bounds.
  Compilation logs show `RustRegex::mayMatch0` selected as an intrinsic in
  both compilers.
- The complete AArch64 fastdebug HotSpot build also linked successfully.
  After registering the C1 runtime target, the same six interpreter and
  two compiler smoke checks passed under assertions, with C1/C2 intrinsic
  selection recorded. A controlled pre-fix interpreter object reproduced
  the startup assertion with the Rust intrinsic enabled; disabling it
  allowed the pre-fix VM to start.
- The same three Rust unit tests passed in an optimized AArch64 test binary
  under QEMU, including the real C ABI search and cleanup panic boundaries.

The emulated runtime combines the cross-built AArch64 libjvm, this change's
Java module archive and stock OpenJDK 27 AArch64 launcher/native libraries.
CDS and SVE are disabled. This establishes functional smoke coverage; it
does not establish performance on physical ARM hardware or a complete native
AArch64 JDK build. The native hardware and complete JDK suite remain untested.

## Repeated long-miss measurements

After panic hardening, the packaged Linux x86_64 release JDK repeated the
initial long-miss workload on the same Xeon Platinum 8573C container with
a four-core quota. Competing builds and tests were paused or finished during
measurement. JMH 1.37 used one thread, three forks, three 500 ms warmups and
five 500 ms measurements per fork. The expression is `error[0-9]+`, with
reused Pattern/Matcher/String and compilation outside timing. Means are
ns/op ± JMH 99.9% confidence half-width; ratios are point estimates.

| Tier | Input bytes | Java ns/op | JNI ns/op | Intrinsic ns/op | Java / intrinsic |
| --- | ---: | ---: | ---: | ---: | ---: |
| interpreter | 4,096 | 150,746.5 ± 9,337.3 | 1,307.3 ± 182.7 | 1,141.9 ± 109.7 | 132.0× |
| interpreter | 32,768 | 1,530,193.1 ± 284,680.0 | 3,102.8 ± 577.0 | 2,674.7 ± 253.3 | 572.1× |
| C1 | 4,096 | 9,878.0 ± 2,517.1 | 231.3 ± 34.0 | 201.6 ± 16.4 | 49.0× |
| C1 | 32,768 | 68,641.3 ± 7,299.5 | 1,460.4 ± 429.3 | 1,367.9 ± 136.3 | 50.2× |
| C2 | 4,096 | 8,985.0 ± 2,558.7 | 296.3 ± 74.3 | 263.8 ± 48.2 | 34.1× |
| C2 | 32,768 | 68,940.4 ± 7,330.8 | 1,493.3 ± 592.3 | 1,559.5 ± 124.3 | 44.2× |

The post-fix workload accelerates in every execution tier. JNI/intrinsic
intervals overlap in several cases, so these measurements do not establish
that the intrinsic is always faster than JNI. Separate measurement rounds
on this cloud host are not a paired estimate of panic-guard overhead.
The original controls and raw results remain available in the initial report.
These measurements followed panic hardening; the subsequent C1 name-table
registration affects runtime-call verification and adds no measured leaf work.

[All 18 raw results](rust-regex-review-benchmark-results.json) retain per-fork
samples and confidence intervals. The [nine exact commands](rust-regex-review-benchmark-commands.txt)
record how to repeat this round.

An auxiliary native comparison linked pre-fix and post-fix Rust adapters into
separate DSOs in one pinned process, alternating their order over 12 pairs of
200,000-call batches per input size. Median paired post/pre ratios were 0.931
at 4,096 bytes and 1.004 at 32,768 bytes. This measures only the C ABI search
and is subject to cloud-host variation; it does not establish a general
performance non-regression guarantee. The caller source, raw paired samples,
build/test transcripts and ARM intrinsic log excerpts are preserved in
[rust-regex-review-validation.txt](rust-regex-review-validation.txt).
