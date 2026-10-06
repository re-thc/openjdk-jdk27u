# Rust regex performance

## Workloads and method

Compare default-on Rust matching with `-XX:-UseRustRegex` in the same fork.
Linux x86_64, Xeon Platinum 8573C; one pinned CPU, Serial GC, one active processor.
Each side runs in a separate JVM. Interpreter, C1-only and C2-only settings are
measured separately. JMH 1.37 uses two 300 ms warmups and three 300 ms samples.
Each shape and lifetime reuse mode has a separate JVM, and process order
alternates between two pairs. The runner uses no child forks to fit
this host's thread quota. These are exploratory shared-host measurements;
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
The capture offsets and native handoff limits are unchanged.

The measurements support retaining a hybrid by shape and work performed:
16-character C2 digit misses improve 5.20x, while fixed-width misses lose
(0.44x). C2 prefix misses at 8 characters remain slower (0.50x); fixed-width,
alternation and captured early hits also have native overhead. These are
remaining targets for compact short plans. Input length alone cannot select
the faster path, and short expressions do not justify adding a miss counter.

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

Cold lifetimes were measured at the same call counts and lengths. They are
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
avoids construction entirely, and there is no activation threshold at call 9.

## Reproduction

Build the fork and JMH microbenchmarks, then supply the benchmark classpath:

```sh
python3 make/scripts/benchmark-rust-regex.py \
    --java build/<configuration>/jdk/bin/java \
    --classpath '<benchmark-classes>:<jmh-jars>/*' \
    --output build/rust-regex-benchmarks
```

The script runs serially, pins a CPU where supported, writes commands as JSON
argument arrays, and retains JMH samples. Use `--suite short`, `tiny` or
`lifetime` to run a subset, `--tiers C2` to isolate a tier, or `--suite plans`
to select the prefix/digit cases. Use `--resume` with the same JDK and commands
after an interrupted run. Default reproduction uses three process pairs.
The [native option audit](rust-regex-optimization-audit.md) separately tests Rust
compiler/engine options without Java boundary costs.

## Validation

The full x86 JDK build passes. Direct differential checks pass 305,450
comparisons per configuration across default/on/off, interpreter, C1, C2,
JNI-only and noncompact Strings. Intrinsic and JNI budget tests exhaust
admission with 155 retained engines, preserve existing engines, select Java
for new allocations, and restore capacity after cleanup. AArch64
fastdebug/QEMU passes focused end-state/bounds checks and startup matching
in C1/C2 with `CheckUnhandledOops`; logs confirm the matching intrinsic.
AArch64 performance was not measured.

Local jtreg cannot start tests: its JDK-version probe fails to create a VM
thread (`pthread_create EAGAIN`). Direct checks are reported separately;
the CI matrix is required for a full jtreg result.
