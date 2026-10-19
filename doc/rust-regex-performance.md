# Rust regex performance

Rust regex supplies a default-on backend for eligible patterns in supported
builds, through HotSpot intrinsics with JNI fallback. Build/VM opt-outs remain
available. Unsupported syntax, flags and inputs select Java. Public captures,
Unicode, regions, resets, replacement, continuation and end flags remain
compatibility requirements. Native entry is not always the cheapest route.

## Qualified source and controls

Runtime `5adf632a2082e273d72b812dc6f844fa39b9b9dd` freezes capture-name metadata
once after preparation validation and shares the immutable map when restoring
a collected weak wrapper. This removes repeated map construction under the
existing cache monitor without retaining an engine or Java graph strongly.
Wrapper/WeakReference allocation and the monitor remain. The literal precheck
examines the first character, then the remainder backwards, finding common
trailing quantifiers sooner while preserving the leading-class check. It
visits the same characters and predicate; eligibility is unchanged.

Preceding runtime `b2131d804980` avoids backend initialization for known
Java-only expressions, uses validated capture/traversal metadata instead of a
second Java source parse, rejects anchored literal mismatches early, expands
prepared interpreter/C1 traversal and restores weak-cache slots in place.
Earlier `af8df701f42` preserves opaque `CharSequence` traversal and lazy access.
Existing Regex/Cache/Captures pools are retained. Public APIs are unchanged.

Five controls share the same healthy executor: prior runtime `af8df701f42`
(header-only publication `166630a8509`), published runtime `b2131d804980`
(report-only head `d51b49a263d`), current runtime, current with Rust disabled,
and original Java `Pattern`/`Matcher`. Below, **Prior**, **Published** and
**Current** distinguish these versions; **Java** means original Java source.
Full 56-module images share the GCC 16.2 native VM, library hashes, resource/JLI
ordering and compression; all six standard CDS archives were regenerated.
All 75 affected class bytes were verified in release and fastdebug images.
Final comparisons use no runtime module patch. The original-Java control
shares the integration's native VM, so it cannot establish the binary footprint
of a pristine JDK without Rust support.

The unchanged native source is bound to Rust 1.99.0
(`b940084d7`, 2026-09-28) and the x86-64-v3/AVX2+ build. Other native targets,
including AArch64, do not acquire local performance qualification from these
results. HotSpot, Rust and the native ABI are unchanged in this increment.

## Protocol and evidence

The final fixed study completed 580 commands: 2,560 JMH records in 136 logical
rows and 320 fresh-process observations in 16 case/configuration groups.
Every fresh-process public state agreed across all five controls. Four
position-balanced orders use CPU 0, one thread and 128/256 MiB heaps.
Average-time cases use two 100 ms warmups and three 100 ms measurements;
lifetime cases use three warmups and six single-shot measurements. Each
command launches its own VM with explicit VM options, using JMH `-f 0` inside
that process. All four JVM scores and raw samples are retained; medians and
observed minimum/maximum are not confidence bounds. No sample was removed or
repeated until passing.

Interpreter, C1 level 1, C2-only, normal tiered and intrinsic-disabled JNI
configurations are separate. Twenty-seven additional diagnostics verify
ownership, compiler/entry routes and allocation outside the timing study,
including interpreter/C1 JNI controls. Compiler logs establish actual compiled
methods and intrinsic/native entries; configuration alone does not prove tier
or that each operation entered Rust. C1 callers and adapters were compiled
before lifetime measurement. C2 later parameter cases also triggered
recompilation during warmup; those logs remain available.

`PreparedRegexCost`, `RustRegexCosts`, `RustRegexLifetime` and `RustRegexState`
provide benchmark sources. The `cache-review` checkpoint directory retains
source/image hashes, commands, individual samples, all-case CSVs and diagnostic
logs. Earlier versions and rejected candidates remain separate datasets.

## Preparation gains and costs

Times are median ns/op. Constant `RustRegexCosts.cacheLookup` compiles
`error[0-9]+` with its prepared owner/handle retained by diagnostic setup;
its context differs from other public-lookup benchmarks.

| Configuration | Prior | Published | Current |
| --- | ---: | ---: | ---: |
| Normal tiered | 19.0 | 29.7 | 21.5 |
| C1 | 36.0 | 63.1 | 53.2 |
| C2-only | 19.9 | 36.2 | 23.7 |
| Interpreter | 671 | 1,955 | 1,444 |

These recover part of the published lookup loss. Leading-class public lookup
is Published/Current 25.2/24.0 ns in C2, 51.3/51.4 ns in C1 and
1,299/1,292 ns in the interpreter. Reverse-only scanning was rejected: prototype
leading-class C2 cost rose 19.3 to 29.0 ns. The selected first-character revision
repaired that prototype loss. Prototype patch-module measurements select the
mechanism; these tables use final full images.

Forced-weak restoration compiles `(?<word>error)(?<digits>[0-9]+)` after invocation
setup clears the current weak slot outside timed compilation. The original
owner stays reachable and restored wrappers remain lazy. This isolates wrapper
reconstruction, not real GC collection, first Rust compilation or startup.

| Configuration | Prior | Published | Current |
| --- | ---: | ---: | ---: |
| Normal tiered | 201.2 | 149.7 | 70.7 |
| C1 | 359.7 | 330.6 | 137.3 |
| C2-only | 136.8 | 139.2 | 92.5 |
| Interpreter | 6,471 | 6,261 | 4,057 |

Separate C2 GC profiling observes named restoration falling 280 to 168 B/op
and a one-name general shape 216 to 168 B/op. The no-name prefix control stays
at 168 B/op. These include common reflective invocation setup and do not
measure heap retention. Ownership probes verify 32 distinct lazy restores and
correct captures for named/general shapes on all three native source versions.
Tests verify immutable metadata before and after restoration. No lock-contention
benefit is claimed.

Retained alternatives that saved a Java graph/reuse counter on preparations
or used `DontInline` on `CacheEntry.reuse` had mixed instrumented cold-path
results; the graph added strong retention. They were not adopted as established
fixes for current cache or shared-lifetime costs.

## Complete calls, lifetimes and first use

Current complete-call examples retain capture/end-flag observation. Prefix
`matches` cases reset each call, using `(error)([0-9]+)` on 16 characters;
miss input is 16 exclamation marks. Times are ns/op.

| Case | Configuration | Prior | Published | Current | Disabled | Java |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| Prefix miss, no end-flag queries | Normal tiered | 20.9 | 9.8 | 9.7 | 20.1 | 28.8 |
| Prefix miss, queries both end flags | Normal tiered | 20.3 | 9.0 | 8.8 | 20.0 | 30.3 |
| Prefix full hit, no end-flag queries | C1 | 75.2 | 80.8 | 82.3 | 128.8 | 122.8 |
| Email early hit, with end flags | Normal tiered | 30.8 | 29.9 | 30.4 | 74.0 | 69.0 |
| Unicode early hit, with end flags | Normal tiered | 36.8 | 31.6 | 31.6 | 85.1 | 94.6 |
| Unsupported leading lookahead, with end flags | Normal tiered | 216.3 | 265.8 | 171.9 | 67.3 | 72.1 |
| Alternation, 4,096-character late hit, with end flags | Normal tiered | 300 | 309 | 302 | 82,998 | 77,635 |

The C1 full-hit regression against Prior remains. Unsupported-call spreads are
large: Current 70.8–366.8 ns versus Published 59.2–408.4 and Java 65.9–76.3.
These samples do not establish a stable unsupported-case gain. Native-owned
patterns can answer operations through managed plans; these integration gains
do not prove every call entered Rust.

Lifetime cases include compile/cache lookup and all searches after caller and
adapter warmup, using shared owners or GC before each cold iteration. They
cover 16/32 characters, 1/32 calls, misses and a hit on the last *call*, at the
beginning of that input. Selected gains and losses are in us/op:

| Case | Configuration | Prior | Published | Current | Java |
| --- | --- | ---: | ---: | ---: | ---: |
| Shared, 16 chars, 32 misses | C2-only | 1.66 | 1.71 | 1.95 | 3.36 |
| Same | Normal tiered | 2.56 | 2.39 | 2.80 | 2.30 |
| GC-cold, 16 chars, one miss | C2-only | 117.9 | 117.6 | 97.5 | 66.4 |
| GC-cold, 16 chars, 32 misses | C1 | 185.1 | 202.2 | 221.8 | 158.7 |
| GC-cold, 16 chars, 32 calls, last call hits | Interpreter | 93.7 | 85.2 | 117.2 | 74.4 |
| GC-cold, 16 chars, one miss | Normal tiered | 172.2 | 137.7 | 174.9 | 82.3 |

Current C2 shared scores range 1.63–2.13 us; C1 cold 32-miss scores range
172–362 versus Published 184–374 us. Every case/control remains in the all-case
CSV. Shared lifetimes retain their engine: weak reconstruction is not their
demonstrated cause. A roughly 10 ns lookup gain per lifetime cannot explain
microsecond differences. These observations support the bounded allocation/cache
changes but do not establish a universal lifecycle win.

Fresh-process probes include compile, matcher creation, search, capture strings
and end flags. Default-tiered Published/Current/Java internal first-use medians
are email 3.75/3.94/9.64 ms, alternation 1.07/0.71/6.47 ms, literal
0.440/0.325/0.340 ms and uncaptured prefix 0.459/0.541/6.06 ms. Current email
ranges 3.31–4.00 ms; uncaptured prefix 0.488–0.579 ms. Email and uncaptured
first use retain losses against Published. Email process wall medians are
Current 36.5, Published 38.0, disabled 42.2 and Java 45.0 ms; Current ranges
35.5–41.9 ms. Wall time includes launcher, VM and helper work; filesystem caches
were not flushed. This is not pure VM startup or a general startup advantage.

## Earlier broad qualification and limits

The preceding `b2131d804980` full-image study retains 5,196 JMH records,
2,304 fresh-process runs and eight paired GC/leaf-latency runs. Sizes span
8, 16, 17, 32, 33, 40, 41, 64 and 4,096 characters with misses and early/late
hits. These qualify that earlier source, not the new source. Uncaptured
17-character misses improved against Prior from 1,617 to 796 ns in the
interpreter and 51.9 to 32.2 ns in C1, near Java's 809/32.3 ns. Interpreter
41/64-character misses still cost 1,952/2,181 ns versus Java 1,484/1,945.
MethodHandle-context C2 direct native entry/wrapper probes cost 53.5/58.0 ns;
JNI cost 59.5/66.9 ns. Different probe contexts are not additive cost components
or pure Rust engine timings.

That study's original C1 cold lifetime included a 1.37–1.47 ms synchronous
adapter-compilation spike; its warmed-adapter comparison is separate. The old
C2 shared 32-miss median of 3.91 us remains, including two 26 us raw tails.
The new fixed study does not replace or explain away those observations.
The earlier reported email startup loss of 40.5 versus disabled 23.4 ms did
not reproduce with matched full images.

Earlier four-worker, 64K-input, six-shape GC/leaf workloads used the same
64 MiB thread stacks for all controls to accommodate Java recursion.
Observed explicit-GC wall maxima were intrinsic/JNI/disabled/Java
16.0/12.3/26.9/34.8 ms; steady-call maxima were 18.8/16.1/113.2/134.4 ms.
Peak process RSS was 67–68 MiB enabled, 154–174 MiB disabled and 152–183 MiB
Java. These are observations on the preceding source, not current latency
bounds, pure engine costs or a general memory advantage.

Current release and fastdebug each pass 112 regex/Scanner/String/startup tests,
with 5,989 framework invocations: 5,985 successes and four standard conditional
skips. Main enabled variants compare 408,435 public results/states each;
disabled compares 408,433. Eight state-sequence variants compare 591,624 states
each; eight opaque-CharSequence variants make 2,406 checks each. Reset/reuse
coverage asserts native ownership after every operation without triggering
end-flag replay; separate fresh Patterns preserve public flag comparisons.
Fourteen Rust tests, Clippy and formatting retain passing receipts bound to
the unchanged native source, rather than being claimed as newly rerun.

Latest-head GitHub CI remains unknown because metadata access returned HTTP
403; no earlier green run qualifies this source. The historical Library
version was also inaccessible. This independent source-bound qualification
does not rely on that artifact's reported results.
