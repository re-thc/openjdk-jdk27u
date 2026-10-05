# Rust regex review follow-up

This review addresses the reported class-grammar mismatch, complete Pattern
lifetimes, and aggregate native memory. Acceleration remains enabled by default;
`-XX:-UseRustRegex` selects the Java-only baseline.

## Correctness and ownership

The reported `[]a~~a]+` sequence was reproduced on the patched JVM at
`668e26020e06c8ff82720f99a768bcf9ec2e0a5f`: eight misses on 2,048 `x`
characters followed by a search of 2,048 `a` characters incorrectly returned
false. The gate now tracks the first class character after optional negation.
A leading literal `]` cannot hide subsequent Rust set operators or nested
classes. Thirty combined class grammars, plus compatible caret/bracket cases
and nested-class cases, supplement the existing differential tests.

Successful eligible searches now interrupt learning before compilation as well
as after it. Sequential alternating hits and misses no longer accumulate eight misses and
pay for a filter on a later hit. Matcher reuses one counter observation to avoid
an extra volatile read or write on the always-positive path. The cached lookup
remains a small helper for C1.

One Matcher claims native preparation with a lazily initialized VarHandle.
Concurrent Matchers use Java until the result is published, rather than waiting
on the Pattern monitor. Volatile publication protects the handle; a failed or
unavailable native compilation publishes a permanent Java fallback. Tests hold
the preparation flag to check temporary fallback and hold the Pattern monitor
while another thread prepares its filter.

The adapter has one 64 MiB accounting budget for retained filters and pending
compilations. It reserves 12 MiB plus handle overhead before building, covering
the configured NFA/DFA/prefilter/determinization limits and a parsing allowance.
After construction it charges reported DFA/prefilter storage, inline handle
storage and an overhead allowance. Errors, unwinding and Cleaner destruction
return reservations. Identical expressions in separate Patterns are charged
separately. No budget operation occurs on the search path. Allocator metadata,
fragmentation and Rust runtime storage are outside the accounting metric.

## Complete Pattern lifetimes

`RustRegexLifetime` includes `Pattern.compile`, creation of the Matcher(s), and
all searches in the measured interval. Its parameters cover 8/9/10/16/32 total
calls, 2,048/4,096/32,768 characters, error/SSN expressions, negative searches,
a final hit, alternating hits/misses, and one/four Matchers sharing a Pattern.
Executor workers are created before measurement; scheduling and Future costs
are included in the shared case.

The broad parameter sweep uses short JMH intervals to identify costs. Isolated
confirmations use one parameter combination per fresh JVM, three alternating
on/off pairs, 2×500 ms warmup and 5×500 ms measurements. All runtime options are
on the actual JVM command line. JMH uses `-f 0` because the environment cannot
fit a harness JVM and its fork within the exhausted process quota. Single
Matcher runs use one CPU; shared runs use four. Confirmations use a 32 MiB heap
to collect short-lived native owners promptly. Final confirmations consistently
use JMH's `FULL_DONTINLINE` blackhole mode, avoiding an additional compiler-mode
probe JVM that exceeded that quota. These are cloud x86 timings;
QEMU is used only for functional ARM coverage.

The tables report medians of three process means, in microseconds per complete
Pattern lifetime. Speedup is Java-only time divided by default-enabled time.
Small differences and overlapping process ranges do not establish a speedup.
All rows below use 4,096 characters. `error` denotes `error[0-9]+`; `ssn`
denotes `[0-9]{3}-[0-9]{2}-[0-9]{4}`.

| Tier | Calls | Scenario | Matchers | Expression | Java µs | Default µs | Speedup |
| --- | ---: | --- | ---: | --- | ---: | ---: | ---: |
| interpreter | 9 | miss | 1 | error | 1460.98 | 1487.98 | 0.98× |
| interpreter | 32 | miss | 1 | error | 5029.03 | 1450.32 | 3.47× |
| C1 | 9 | miss | 1 | error | 71.88 | 109.12 | 0.66× |
| C1 | 32 | miss | 1 | error | 380.83 | 143.31 | 2.66× |
| C2 | 9 | miss | 1 | error | 53.23 | 104.98 | 0.51× |
| C2 | 32 | miss | 1 | error | 200.15 | 91.01 | 2.20× |
| C1 | 9 | lastHit | 1 | error | 62.17 | 102.04 | 0.61× |
| C2 | 9 | lastHit | 1 | error | 46.65 | 89.81 | 0.52× |
| C1 | 32 | alternating | 1 | error | 126.97 | 151.48 | 0.84× |
| C2 | 32 | alternating | 1 | error | 95.96 | 94.64 | 1.01× |
| C1 | 32 | miss | 4 | error | 251.34 | 196.04 | 1.28× |
| C1 | 32 | alternating | 4 | error | 173.66 | 222.24 | 0.78× |
| C2 | 32 | miss | 4 | error | 197.12 | 167.91 | 1.17× |
| C2 | 32 | alternating | 4 | error | 476.87 | 313.63 | 1.52× |
| C2 | 9 | miss | 1 | ssn | 145.73 | 274.37 | 0.53× |
| C2 | 32 | miss | 1 | ssn | 462.93 | 262.31 | 1.76× |

Eight preceding misses cannot guarantee future savings. In C1/C2, lifetimes
ending at the ninth call can still lose because that call pays native
compilation. The filter helps persistent negative workloads; it does not offer
a universal latency improvement. The earlier warmed-search tables measure a
different workload and must not be used as complete-lifetime results.

The C1 alternating single/shared cases are slower in this round. The
interrupted-learning test confirms that sequential alternating searches avoid
native compilation; counter maintenance and eligibility checks still have
costs. Shared outcomes follow execution order rather than benchmark call index,
so a mixed workload can still form a miss streak and activate a filter. The
shared counter is an approximate heuristic, not an atomic global streak.
The shared C2 alternating result has especially large process variation:
Java-only means range from 127.99 to 479.34 µs, and enabled means from 186.38 to
318.23 µs. Its apparent median improvement is not reliable evidence of a gain.
The shared C1 negative ranges also overlap. These measurements do not establish
a general performance non-regression guarantee, and the ninth-call cost remains
a limitation of synchronous activation. Raising a fixed threshold alone would
move that cost to another terminal call.

An always-positive warmed control compares the previous Java classes at
`668e26020e0` with this revision using the same current native adapter, three
alternating before/after pairs, and the same portable blackhole mode:

| Tier | Before ns/op | After ns/op | Before process range | After process range |
| --- | ---: | ---: | ---: | ---: |
| C1 | 98.24 | 100.13 | 95.39–98.28 | 99.05–103.94 |
| C2 | 87.21 | 96.81 | 81.97–106.63 | 88.85–100.00 |

This is a separate reused-Matcher control, not a complete Pattern lifetime.

The checked-in benchmark source and raw samples preserve the broad diagnostic
rounds, the consecutive-miss change, the synchronization diagnosis, and the
final nonblocking confirmations. The 1,042 retained JMH records include
intermediate diagnostics; only the `stable-confirm` phase supplies the lifetime
table above. Earlier phases used intermediate implementations and are retained
to expose the investigation, rather than being presented as final performance.
The `positive-control` phase supplies the separate warmed control. See the
[raw records](rust-regex-lifetime-results.jsonl),
[exact commands](rust-regex-lifetime-commands.txt),
[broad sweep runner](rust-regex-lifetime-sweep.py), and
[final confirmation runner](rust-regex-lifetime-confirm.py). The runners use
the recorded workspace/toolchain paths, which must be adapted on another host.
The release was checked live again: crates.io reports regex 1.13.1,
matching the pinned, vendored dependency.

## Validation

- Linux x86_64 release JDK rebuild completes. The worker's process/thread quota
  required running generated javac commands directly before finishing the
  normal `make CONF=cloud JOBS=1 jdk` build.
- All eight standalone differential configurations pass after the final Java
  ownership change: default, off, on, JNI, interpreter, C1, C2, and uncompressed
  Strings. Each retains 5,248 bound/state comparisons and exercises the 30 new
  combined grammars, interrupted learning, preparation ownership, concurrency,
  serialization, GC, and the earlier edge cases.
- Native release Rust tests: eight pass. Optimized AArch64 Rust tests under
  QEMU: the same eight pass. Frozen Cargo builds, rustfmt and Clippy with
  warnings denied pass.
- Native-budget exhaustion and Cleaner recovery pass through intrinsic and
  JNI paths, each retaining 3,095 filters before admission fails. Existing
  filters remain usable, and newly activated Patterns use Java with correct
  captures when capacity is unavailable.
- Twenty x86 startup configurations and three initialization gates pass. C1
  logs confirm the miss observation, cached lookup and miss wrapper inline;
  both compiler tiers select the native intrinsic.
- GNU Linux AArch64 release HotSpot rebuild completes. Ten QEMU startup/search
  configurations pass: default/off/on/JNI at 64/256 MiB interpreter code-cache
  sizes, plus C1 and C2 with native filter and intrinsic confirmation. Execution
  uses the cross-built libjvm, current patched Java modules and stock ARM
  launcher/native libraries with CDS/SVE disabled.
- The fresh regex jtreg attempt fails in its JDK-version probe with native
  thread creation `EAGAIN`, before any test runs. Standalone results above are
  not jtreg passes. Earlier jtreg results describe earlier revisions only;
  fresh-head CI results must be checked separately.

Commands, selected output and final source hashes are in the
[validation transcript](rust-regex-review-followup-validation.txt).
Physical ARM timing, a native macOS run of this revision, and the full JDK
suite remain untested locally.

The syntax gate remains a conservative lexical recognizer. Future subset
extensions should use parsed structure or a rigorous shared-subset recognizer
and combined differential evidence. A shared native cache for identical
expressions is another possible improvement; the present budget bounds their
independent allocations.
