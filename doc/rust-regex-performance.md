# Rust regex performance

## Long literal and digit runs

The existing literal/digit plan can finish long runs when the VM is configured
to permit C2. It retains the 256-character limit for short regions and the
32-digit limit for longer regions under interpreter-only or C1-only settings.
This uses the VM's configured compilation ceiling; it does not identify the
current execution tier. Normal startup may execute the plan before C2 compiles
it. No compiler tier is disabled by the implementation.

Equal module-loading controls isolate this change. Two alternating process
pairs use the same captures, all four hit positions, both end-flag settings,
16/64/256/4,096-character regions at C2 and 16/4,096 at interpreter and C1.
At C2, 4,096-character full hits with end flags fall from 22.6 to 4.9 microseconds
for the captured prefix and from 21.9 to 4.9 for digits. Across all tested
configurations, median candidate/baseline ratios are 0.99 at C2, 1.01 at C1
and 1.00 in the interpreter. These are managed-plan gains, not Rust engine
throughput. A broader candidate that changed the short-region limit was
rejected after short digit cases regressed.

Fresh-process measurements include all four shapes, five region sizes and
every fitting hit position. The 68 semantic tuples, including captures and
both end flags, agree in both controls. First-use timings remain mixed;
focused nine-pair confirmation gives prefix full hits 2.23 to 1.77 ms and
digit full hits 1.92 to 1.49 ms, but email eight-character misses 13.21 to
14.59 ms. All samples are retained. This does not establish a universal
startup improvement.

The full public-API matrix also exposes substantial remaining losses.
Captured alternation on a 4,096-character full hit takes about 39 microseconds
versus 8.3 through the original-source Java control. Matched standalone Rust
capture-engine and adapter medians are 40.2 and 41.2 microseconds for that
case. Adapter and dispatch overhead therefore cannot explain the whole gap.
Email end-flag replay, short-prefix routing and low-reuse preparation remain
separate costs; a native engine does not universally win this corpus.

## First-use preparation and verified native routes

Runtime source `054933b4633`, Linux x86_64, GCC 16.2, Rust 1.99.0,
release with four-byte object headers. The preparation-cache key now uses
explicit hash and equality methods. This avoids the record-generated
`ObjectMethods` bootstrap during the first cache lookup; separate class
initialization logs confirm that bootstrap in the old-key control and its
absence in the new-key control. Cache reuse, colliding pattern hashes and
distinct flags retain their behavior.

Nine alternating fresh-process samples per control use one pinned CPU,
Serial GC, one active processor and `-Xshare:off`. First use includes Pattern
compilation, Matcher creation, one successful find, capture boundaries and
both end flags. Input is `a@b.co!` for email and `error123!` for the other
shapes. These are medians in milliseconds; expensive diagnostics run separately.

| First regex use | Original sources | Disabled | Default |
| --- | ---: | ---: | ---: |
| Captured email | 7.3 | 18.3 | 1.5 |
| Literal alternation plus digits | 4.5 | 13.8 | 15.6 |
| Literal prefix plus digits | 4.0 | 13.4 | 1.2 |
| Unsupported lookahead | 3.9 | 13.6 | 14.3 |

Original-source controls patch Pattern/Matcher from `8d8d71a` into the same
image. Module loading affects startup, so this is not an original-HotSpot
startup comparison. Equal module-loading controls isolate the key change:
email first use falls from 20.9 to 4.1 ms and alternation from 22.5 to 5.5 ms.
The normal default image still loses first-use time to disabled for alternation
and unsupported syntax; the key change does not remove Java replay or sibling
compilation costs. Whole-process wall medians for email are 88.8 ms disabled
and 73.8 ms default, and for alternation 83.6 and 81.7 ms respectively.

Untimed debugger counters observe 6,000 intrinsic-runtime entries each in the
interpreter, C1 and C2, with zero JNI entries. Disabling intrinsics produces
6,000 registered JNI entries. Compilation logs independently identify C1
level 1 and C2 compilation of the native wrapper; the interpreter run has no
compiled Java methods (its log contains two continuation stubs). These
observations establish routes, not timing results.

Reset/capture regression coverage now keeps Patterns native across find
reuse and successful anchored reuse, asserts the route after each operation,
and compares end flags separately on fresh Patterns. Failed anchored matches
retain their existing Java continuation behavior. All eight configurations
of `RustRegexTest` pass; enabled configurations compare 372,059 native/Java
results and API states each. Release and fastdebug each pass 109 tests and
5,989 framework checks. Fastdebug uses GCC 14 with strict warnings enabled.
The `RustRegexState` microbenchmark adds capture
boundaries and optional end flags across sizes, hit positions, unsupported
syntax and Unicode input. Its setup checks pass in all three controls.

The refreshed native/GC probe covers find, lookingAt and matches in the
interpreter, C1, C2 and JNI fallback: 48 workload records, each with four
workers and 65,536-character regions. The largest observed GC reaching time
is 3.21 ms, GC wall time 12.8 ms and steady-call time 26.8 ms. These describe
the tested workloads and scheduling conditions, not latency upper bounds or
matching timeouts.

Cold-lifetime setup now warms 2,000 complete lifetimes before the iteration
GCs. The paired C2 runs use `-XX:-TieredCompilation -Xbatch` and
`-XX:CompileThreshold=1000`. Warming Pattern.compile/find alone left the
benchmark facade interpreted under that configuration. A separate log confirms C2 code for
the complete lifetime method before measurement. Instrumented diagnostics and
setup smoke scores are excluded from timing comparisons.

Two dispatch-only candidates are rejected. Forced FastDigits inlining and
explicit concrete dispatch give C1 16-character prefix-miss medians of 47.5
and 48.1 ns versus 48.6 ns for the baseline. Explicit dispatch worsens prefix
full hits from 70.1 to 83.8 ns and digit full hits from 64.2 to 84.1 ns; both
process pairs show those losses. Across the complete diagnostic matrix,
median C2 ratios are 1.27 and 1.19 relative to the baseline. The comparisons
include ordinary, shared-first-character and repeated-prefix misses, multiple
sizes and hit positions, plus digit and email controls. Neither candidate is
in the production source.

## Integration qualification

Runtime source `1d66c34a98c`, Linux x86_64, GCC 16.2, Rust 1.99.0,
release with four-byte object headers. The native adapter uses a conservative
first-byte hint to skip futile anchored probes, and shares capture automata
for greedy runs separated by excluded literal bytes. Matching algorithms stay
in the pinned Rust library. Matcher clears captures before Java traversal,
avoids successful-email end-flag replay, and uses a small dispatcher after
promotion to Java. A collected, previously validated small preparation can
rebuild its backend lazily; first compilation still diagnoses syntax errors.

The public-API workload includes `reset().find()`, every capture's start/end,
`hitEnd()` and `requireEnd()`. Two alternating process pairs run JMH 1.37 on
one pinned CPU, Serial GC, one active processor, two 300 ms warmups and three
300 ms samples. These rows are medians of six samples, rather than the means
in the older reports below. Original-source controls patch Pattern/Matcher
from `8d8d71a` into the preceding release image; disabled controls run the
new image with `-XX:-UseRustRegex`. This is not a separately built original
HotSpot baseline.

| Captured-email public API | Tier | Original ns/op | Disabled ns/op | Default ns/op |
| --- | --- | ---: | ---: | ---: |
| Early hit, 16 chars | Interpreter | 5,696.8 | 4,775.1 | 2,952.8 |
| Early hit, 16 chars | C1 | 234.2 | 388.9 | 146.0 |
| Early hit, 16 chars | C2 | 81.6 | 83.3 | 34.1 |
| Full-length hit, 16 chars | C2 | 133.8 | 125.5 | 47.5 |
| Early hit, 4,096 chars | C2 | 81.9 | 73.3 | 38.8 |
| Full-length hit, 4,096 chars | Interpreter | 1,890,771.4 | 1,246,926.8 | 20,475.6 |
| Full-length hit, 4,096 chars | C1 | 86,209.4 | 62,362.0 | 15,603.1 |
| Full-length hit, 4,096 chars | C2 | 22,673.9 | 26,215.2 | 18,744.1 |

All these reused cases allocate approximately zero Java bytes per operation.
Short email results may use the existing compact plan; long full-length hits
use native matching. These figures must not be presented as a pure-native
ceiling. Separate untimed native-entry counters establish actual intrinsic
and JNI calls for interpreter, C1 and C2, and separate forced-native runs
retain raw, wrapper and complete Matcher costs.

Against the preceding runtime, the final short C2 public-API pairs improve
email early hits from 103.7/80.2 to 32.0/31.3 ns/op and full-length hits from
140.1/142.6 to 74.1/77.6 ns/op. Unsupported-pattern results are mixed:
full-length hits change from 122.2/93.6 to 80.8/100.3 ns/op; misses change from
110.5/156.3 to 206.1/145.9. Shared-host process variation remains material.
The raw pair results accompany the medians; these are not universal latency
guarantees or evidence that every fallback workload improves.

Cold post-GC complete lifetimes include Pattern compilation, Matcher creation
and matching. The JVM is already warmed; these are not process startup times.
For a 16-character one-call alternation miss, original / preceding / new
sample medians are 28.2 / 333.5 / 289.2 microseconds. For the corresponding
email case they are 34.6 / 52.3 / 49.5 microseconds. Java allocations for the
alternation case fall from about 5,925 to 5,114 bytes per lifetime; Rust
allocations are not included in that Java counter. At 4,096 characters and
32 calls, alternation medians are 2,656.2 / 282.1 / 260.2 microseconds;
email medians are 2,666.7 / 176.2 / 161.0 microseconds. Low-reuse cold use still
loses, and these measurements do not establish an automatic reuse crossover.
Native ARM throughput remains unmeasured.

The exact image hashes, source checkpoint, benchmark sources, commands,
individual samples and allocation counters are saved with the qualification
archive in Library. The release image passes 109 regex, Scanner and String
tests with 5,989 framework checks. The native adapter passes 14 tests and
Clippy. Fastdebug compilation encountered GCC 16's `-Werror=nonnull` in unchanged
OpenJDK handshake code. Retrying with `-Wno-error=nonnull` compiled that code,
then failed with `/usr/bin/bash: fork: Resource temporarily unavailable`.
The workspace had about 32,400 tasks, including over 31,000 unreaped `tee`
processes owned by PID 1. The current-image latency probe then failed before
execution: `pthread_create failed (EAGAIN)` and
`OutOfMemoryError: unable to create native thread`. Fastdebug tests and the
refreshed four-mode leaf/GC measurements are unrun; earlier latency observations
below describe their earlier source. Managed limits and the supervisor were
not changed.

## Remaining routing and startup limits

A refreshed same-image original-source control confirms the C2 scan wins:
4,096-character prefix misses change from 4,762.1 to 183.7 ns/op; digit misses
change from 122.0 to 33.8 ns/op at 16 characters, and 28,711.7 to 195.4 ns/op
at 4,096. Unsupported 16-character misses measure 90.1 / 88.4 / 85.5 ns/op
in original / disabled / default controls. The interpreter and C1 still show
a short-prefix miss loss: at 16 characters, interpreter original / disabled /
default medians are 961.6 / 958.7 / 1,645.1 ns/op, and C1 medians are
36.0 / 37.0 / 77.2 ns/op. Diagnostic wider and first-byte-selective Java
choices reduce it, but worsen other cases or retain C1 overhead, so neither
candidate is included in the production source.

Forced-native C2 16-character prefix measurements separate the Rust path from
the existing compact Java plan. Against runtime `90bfbafc664`, raw-call miss
medians change from 85.3 to 70.8 ns/op, and complete Matcher miss medians from
81.5 to 54.3. Raw early hits are essentially unchanged at 80.3 / 81.0 ns/op.
Raw late hits improve from 131.4 to 119.0; the wrapper late-hit result moves
from 133.7 to 144.2. These small-source diagnostics establish specific changes,
not a universal native-call win.

Five alternating subprocess samples per control measure fresh first regex
use, including compilation, Matcher creation, one successful match and end
flags. First-use medians for email are 10.6 / 23.4 / 40.5 ms, and alternation
5.4 / 18.4 / 50.0 ms, in original / disabled / default controls. Whole-process
wall medians are 175.9 / 90.2 / 110.2 ms for email and 169.5 / 84.4 / 119.9 ms
for alternation. The original control's patch-module loading contributes to
process startup; no original-HotSpot startup comparison is claimed. Default
first use remains more expensive than disabled. The timed runs pause the
local compiler build; the build resumes after timing.

## Earlier routing qualification

Linux x86_64, GCC 16.2, Rust 1.99.0, release image with four-byte object headers.
The fixed-digit/email/large-scan measurements use runtime source `a756ecf00b3`;
the final interpreter prefix repeat uses `cad381c7a22`. Later documentation
changes do not alter these runtime sources. JMH 1.37 runs on one pinned CPU,
with Serial GC, one active processor, three one-second warmups and five
one-second measurements. Two separate process pairs alternate control order.
The original-source control patches Pattern/Matcher from `8d8d71a` into the
same HotSpot image; it is not a separately built original HotSpot image.
The disabled control uses `-XX:-UseRustRegex`.

| Reused `reset().find()` workload | Tier | Original source ns/op | Disabled ns/op | Default ns/op |
| --- | --- | ---: | ---: | ---: |
| Prefix miss, 8 chars | Interpreter | 798.0 | 833.0 | 778.0 |
| Digit miss, 16 chars | C2 | 179.4 | 224.5 | 72.2 |
| Captured email early hit, 16 chars | C2 | 106.4 | 159.0 | 44.8 |
| Captured email miss, 16 chars | C2 | 212.8 | 178.0 | 127.1 |
| Fixed digit early hit, 16 chars | C2 | 115.5 | 88.6 | 72.5 |
| Fixed digit miss, 16 chars | C2 | 62.7 | 79.5 | 48.1 |
| Prefix miss, 4,096 chars | C2 | 7,030.2 | 6,360.3 | 269.6 |

The earlier same-runtime short-routing repeat at `086237ef161` measured C2
eight-character prefix misses at 28.9 / 28.2 / 27.7 ns/op in original,
disabled and default controls. Short literal-alternative early hits measured
67.4 / 56.2 / 44.3 ns/op; misses measured 196.7 / 202.7 / 133.9 ns/op.
The subsequent fixed-digit plan addresses the separately observed C2
fixed-width loss. Native x86/AArch64 calls remain the path for long scans.

These are exploratory shared-host measurements. Some process/sample spreads
are large; the individual samples, allocation counters, commands, CPU accounting
and image hashes are preserved in the Library qualification archives. Reused
searches allocate essentially zero Java bytes per operation. Full lifetime
diagnostics include compilation, Matcher creation and 1/8/32 alternating calls,
with original and disabled controls. Fresh general-engine construction can
still lose at low reuse. The cache-clearing and post-GC diagnostics do not
establish an exact cold break-even count or an automatic reuse threshold.
Native AArch64 throughput and a full original-HotSpot baseline remain unmeasured.

For native latency, `(?:[ab]{0,500})*[bc]` on 65,536 ASCII `a` bytes reproduced
long leaf calls on the reviewed image. Copying expensive work into native
thread state reduced GC reaching time from roughly 485 ms in the leaf probe
to microseconds in the paired transition probe. The guarded integrated run's
largest observed reaching time was 6.7 ms under the tested four-worker shapes.
The cold/warm matrix includes adjacent bounded/unbounded repetitions, capture
recovery, all three operation modes and allocation counts. These are tested
observations, not a timeout or an upper bound for every regex and machine.

## Eight-byte-header development profile (2026-10-10)

Source `e68d8de5cd3`, built with `bin/configure-dev`, GCC 14.2 and the default
linker. Linux x86_64, Xeon Platinum 8573C, one pinned CPU, Serial GC and one
active processor. Same-image Java baseline uses `-XX:-UseRustRegex`. Two
alternating process pairs per case; each process runs three 500 ms warmups and
five 500 ms measurements. Each case has its own JVM, with no child JMH forks.
These exploratory shared-host means include `Matcher.reset().find()`.
Values below 1 are losses. Binary hashes, JVM options and all samples are recorded
in the `sync-summary` records in [the results](rust-regex-performance.jsonl).

| Workload | Tier | Java ns/op | Default ns/op | Speedup |
| --- | --- | ---: | ---: | ---: |
| Prefix/digit miss, 4,096 chars | Interpreter | 114,216.6 | 2,474.1 | 46.16x |
| Prefix/digit miss, 4,096 chars | C1 | 6,270.9 | 207.4 | 30.23x |
| Prefix/digit miss, 4,096 chars | C2 | 4,867.9 | 170.8 | 28.50x |
| Digit miss, 16 chars | C2 | 88.4 | 29.7 | 2.98x |
| Prefix/digit miss, 8 chars | C2 | 24.5 | 33.1 | 0.74x |
| Captured email, early hit, 16 chars | C2 | 68.0 | 137.2 | 0.50x |

The expanded study below used an earlier revision and build profile. Compare
within each pair; absolute timings across revisions are not directly comparable.

## Expanded shape and lifetime study (2026-10-06)

Compare default-on Rust matching with `-XX:-UseRustRegex` in the same fork.
Linux x86_64, Xeon Platinum 8573C; one pinned CPU, Serial GC, one active processor.
Each side runs in a separate JVM. Interpreter, C1-only and C2-only settings are
measured separately. JMH 1.37 uses two 300 ms warmups and three 300 ms samples.
Each shape and lifetime reuse mode has a separate JVM, and process order
alternates between two pairs. The runner uses no child forks.
These are exploratory shared-host measurements;
per-process scores and all six samples per side accompany the means in the
[machine-readable results](rust-regex-performance.jsonl). The runtime source
is `ffa0899c6d2`; the native adapter is unchanged from the option audit.

Reusable-search measurements time `Matcher.reset().find()`, including capture
writes. A miss input contains only `!`; an early hit inserts the candidate at
position zero, followed by `!`. This isolates scanning from successful match
work. It is not a corpus benchmark: long near-matches, Unicode, adversarial
backtracking, other input distributions and real AArch64 throughput require
separate measurements.

| Shape | Expression | Hit |
| --- | --- | --- |
| Prefix | `error[0-9]+` | `error123` |
| Digits | `[0-9]+` | `123` |
| Fixed width | `[0-9]{3}-[0-9]{2}-[0-9]{4}` | `123-45-6789` |
| Alternation | `(?:error|warning|fatal)[0-9]+` | `error123` |
| Captures | `([a-z0-9_]+)@([a-z0-9_]+)\.[a-z]{2,4}` | `a@b.co` |

## Reused searches

Speedup is Java time divided by default time; values below 1 are losses.
Times and process samples are in the linked data. These tables distinguish
scanning misses from hits that stop near the beginning of the input.

### Misses

| Tier | Shape | 16 chars | 64 chars | 256 chars | 4,096 chars |
| --- | --- | ---: | ---: | ---: | ---: |
| interpreter | Prefix + digits | 0.62x | 0.91x | 1.81x | 82.07x |
| interpreter | Digits | 2.75x | 6.53x | 7.42x | 764.60x |
| interpreter | Fixed width | 2.24x | 16.36x | 76.73x | 1228.99x |
| interpreter | Alternation | 6.25x | 31.09x | 150.49x | 2081.94x |
| interpreter | Captured email | 10.32x | 43.39x | 157.96x | 2275.54x |
| C1 | Prefix + digits | 0.59x | 0.92x | 2.28x | 28.57x |
| C1 | Digits | 3.38x | 5.02x | 6.21x | 374.51x |
| C1 | Fixed width | 1.22x | 14.47x | 36.74x | 306.42x |
| C1 | Alternation | 2.88x | 12.97x | 19.18x | 206.65x |
| C1 | Captured email | 5.84x | 33.42x | 112.47x | 908.03x |
| C2 | Prefix + digits | 1.12x | 3.22x | 7.89x | 30.06x |
| C2 | Digits | 5.20x | 5.60x | 11.65x | 101.46x |
| C2 | Fixed width | 0.44x | 2.38x | 15.27x | 161.72x |
| C2 | Alternation | 2.06x | 11.12x | 43.38x | 95.42x |
| C2 | Captured email | 2.57x | 6.15x | 27.70x | 456.59x |

### Early hits

| Tier | Shape | 16 chars | 64 chars | 256 chars | 4,096 chars |
| --- | --- | ---: | ---: | ---: | ---: |
| interpreter | Prefix + digits | 1.37x | 1.15x | 1.27x | 1.59x |
| interpreter | Digits | 1.02x | 1.08x | 1.12x | 1.34x |
| interpreter | Fixed width | 3.86x | 4.74x | 4.37x | 7.22x |
| interpreter | Alternation | 1.66x | 2.51x | 1.80x | 1.89x |
| interpreter | Captured email | 4.35x | 5.84x | 3.98x | 3.90x |
| C1 | Prefix + digits | 1.36x | 2.08x | 1.26x | 1.63x |
| C1 | Digits | 1.54x | 1.38x | 2.91x | 2.25x |
| C1 | Fixed width | 2.24x | 1.63x | 1.73x | 1.89x |
| C1 | Alternation | 0.47x | 1.02x | 0.62x | 0.71x |
| C1 | Captured email | 1.82x | 1.50x | 1.51x | 1.18x |
| C2 | Prefix + digits | 1.51x | 2.56x | 2.09x | 1.54x |
| C2 | Digits | 0.97x | 0.96x | 1.03x | 0.94x |
| C2 | Fixed width | 0.59x | 0.80x | 1.06x | 0.61x |
| C2 | Alternation | 0.56x | 0.42x | 0.35x | 0.35x |
| C2 | Captured email | 0.41x | 0.51x | 0.45x | 0.88x |

### Very short misses

Each cell shows Java → default ns/op, followed by speedup.

| Tier | Shape | 4 chars | 8 chars |
| --- | --- | ---: | ---: |
| interpreter | Prefix + digits | 940.8 → 1467.2 (0.64x) | 1137.7 → 3102.7 (0.37x) |
| interpreter | Digits | 2431.8 → 1560.0 (1.56x) | 3771.9 → 1704.5 (2.21x) |
| C1 | Prefix + digits | 158.5 → 127.6 (1.24x) | 78.5 → 180.7 (0.43x) |
| C1 | Digits | 197.4 → 174.1 (1.13x) | 356.9 → 196.8 (1.81x) |
| C2 | Prefix + digits | 52.8 → 57.4 (0.92x) | 49.2 → 98.5 (0.50x) |
| C2 | Digits | 83.9 → 56.0 (1.50x) | 118.2 → 61.4 (1.93x) |

## Routing

Acceleration is default-on. Plain literals use Java's existing literal path.
Literal-prefix/digit-tail expressions use a compact Java short plan, which scans
regions up to 256 characters and checks the first candidate in longer regions.
Digit runs hand off to Rust after 256 characters in short searches or 32 in long
searches. The first operation needing Rust compiles it immediately. Short-only
Patterns allocate no native engine or Cleaner and retain no Java node graph.

A blanket character-count cutoff is not supported by these measurements.
The expression, candidate position, matched length and execution tier determine
how much work the native boundary saves. Early hits can do little matching work
even in a large input. Short general expressions can benefit in the interpreter
while losing to optimized Java in C2. Retaining both a Java graph and a native
engine would increase memory; the current hybrid stores only its small plan and
builds Rust when that plan cannot answer the operation.

The digit-only plan skips nondigits directly and reads each digit once;
inputs too short for the required prefix and digit reject immediately.
This avoids empty-prefix String searches and repeated character access.

The measurements support retaining a hybrid by shape and work performed:
16-character C2 digit misses improve 5.20x, while fixed-width misses lose
(0.44x). C2 prefix misses at 8 characters remain slower (0.50x); fixed-width,
alternation and captured early hits also have native overhead. These are
remaining targets for compact short plans. Input length alone cannot select the faster path.

## Complete Pattern lifetimes

`RustRegexLifetime` includes `Pattern.compile`, Matcher creation, all searches,
and backend checks. Alternating workloads begin with a miss and then alternate
hits/misses. Inputs here use `x ` padding. One call is therefore a miss.
`shared` retains another Pattern owning the same engine; `cold` collects the
previous owner before each timed invocation. GC setup is outside the timer;
Cleaner completion is not synchronized and can overlap measurement. These are
compile-plus-match timings, not GC-inclusive application costs. Shared-engine
lookup and cold native construction must be assessed separately.

### Live engine sharing

Complete C2 lifetime speedups below include compilation/cache lookup and all
calls. Source `error` uses the prefix/digit plan. One call is a miss; subsequent
calls alternate hits and misses.

| Shape | Chars | 1 call | 8 calls | 32 calls |
| --- | ---: | ---: | ---: | ---: |
| Prefix + digits | 16 | 2.05x | 1.23x | 1.11x |
| Prefix + digits | 4096 | 20.04x | 16.24x | 20.63x |
| Fixed width | 16 | 1.78x | 0.53x | 0.33x |
| Fixed width | 4096 | 45.74x | 43.32x | 86.92x |
| Alternation | 16 | 1.83x | 0.93x | 0.65x |
| Alternation | 4096 | 72.94x | 54.71x | 42.39x |
| Captured email | 16 | 4.16x | 1.58x | 1.64x |
| Captured email | 4096 | 234.22x | 243.74x | 206.82x |

The historical cold lifetimes were measured at the same call counts and lengths. They are
**inconclusive for an exact break-even count**: process variation and the
post-GC control dominate some rows, including prefix plans that allocate no
native engine. For example, the two 16-character one-call default prefix
scores are 286.5 and 5,448.4 microseconds. Those are not Rust compilation
latencies. Raw cold samples are retained so the limitation is reviewable.

The native option audit separately measures construction without Java/GC
costs; it confirms that general engine construction is much more expensive
than an individual warmed search. Cold use, engine sharing, and an early hit
must therefore be assessed separately. More reuse does not guarantee a gain:
32 shared short fixed-width calls are slower here (0.33x). The short-only plan
avoids construction entirely.

## Reproduction

Configure with `--with-jmh=<jmh-directory>`, then build the image and microbenchmarks:

```sh
make CONF=<configuration> images build-microbenchmark
python3 make/scripts/benchmark-rust-regex.py \
    --java build/<configuration>/images/jdk/bin/java \
    --classpath build/<configuration>/images/test/micro/benchmarks.jar \
    --output build/rust-regex-benchmarks
```

The script runs serially, pins a CPU where supported, writes commands as JSON
argument arrays, and retains JMH samples. Use `--suite short`, `tiny` or
`lifetime` to run a subset, `--tiers C2` to isolate a tier, or `--suite plans`
to select the prefix/digit cases. `--suite review` includes both losing short
shapes, large scans, complete 1/8/9/10/16/32-call lifetimes, mixed workloads and
four-worker sharing on up to four CPUs. Cold lifetimes now use single-shot
iterations; the historical cold rows above used invocation-level collection.
The runner records runtime hashes, commands and samples. Use `--resume` with the same JDK and commands
after an interrupted run. Default reproduction uses three process pairs.
The [native option audit](rust-regex-optimization-audit.md) separately tests Rust
compiler/engine options without Java boundary costs.

## Latency qualification

`make/scripts/RustRegexLatency.java` measures 65,536-character searches with
four shared-Pattern workers, new worker caches and concurrent explicit GC.
It reports first-call maxima, steady p99/max and GC wall time for scanning,
captures, ambiguous repetition and bounded alternation. Run with safepoint
logging to distinguish time reaching a safepoint from collection work.
These observations qualify the selected workloads; they are not a bound on
all eligible expressions. The CI qualification job runs interpreter, C1, C2
and JNI paths and stores raw samples and safepoint logs as artifacts.

## Previous-revision validation

At `9cfdc08f2ae`, all 57 GitHub Actions jobs passed on Linux x86_64/AArch64,
macOS AArch64 and Windows x86_64. The x86 desktop-free image and profile smoke checks pass. JMH builds successfully
with desktop benchmarks excluded. jtreg passes all 106 selected test descriptions
in regex, Scanner, String, startup and source checks (5,980 framework checks).
RustRegexTest passes 305,454 differential comparisons in each of eight modes:
default/on/off, interpreter, C1, C2, JNI-only and noncompact Strings. Intrinsic
and JNI budget tests preserve existing engines, select Java after admission
exhaustion, and restore capacity after cleanup. Rust tests, Clippy, formatting
and the frozen release build pass.

AArch64 C1/C2 functional coverage was collected with fastdebug under QEMU,
including bounds/end-state checks and startup matching with `CheckUnhandledOops`.
AArch64 performance requires native hardware and was not measured.
