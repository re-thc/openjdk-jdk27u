# PCRE2 comparison results

The frozen runtime at `5af76868efbcf444e2928c43344cd3fe390464bb` adds useful
native lookahead throughput and substantially reduces long native capture costs.
It also loses on some tiny and UTF-16 workloads. This remains a draft comparison;
the evidence does not justify a universal PCRE2 or always-JIT claim.

Rust control: `cf8ff51954c23effb4e5e6a281ef8bf28111ca0c`. Original-Java controls
patch the exact original regex sources into each corresponding built HotSpot
image. They are same-binary facade controls, not separate original-HotSpot builds.
Both native and patched-JVM measurements use the same Linux x86_64 host, GCC
16.2, Rust 1.99, compact object headers, exact inputs and observable API work.
Raw input hashes and both binary/module bindings agree throughout the final run.

The final public matrix has **11,600 samples / 1,800 control-cases / 90 processes**.
There are 180 independent first-use processes, 90 concurrency processes, 24
native engine/adapter processes and eight activation processes. Every performance
process returned zero. All cases and losses remain in the CSV and reproduction
packet. Warm medians use six samples from two balanced process orders, two
100-ms warmups and three 100-ms measurements, one pinned CPU, Serial GC and
CDS disabled. The small process count limits statistical confidence.

## Selected whole-JVM find work (ns/op)

| Workload | Java tier | Original Java in PCRE2 image | Frozen Rust | PCRE2 interpreter | PCRE2 automatic JIT |
| --- | --- | ---: | ---: | ---: | ---: |
| Captured alternation, 16-byte full hit | C1 | 152.8 | 306.8 | 162.2 | 169.2 |
| Captured alternation, 4096-byte full hit | C1 | 26,910.6 | 42,066.9 | 3,313.0 | 1,400.7 |
| Lookahead + captures, 4096-byte full hit | C1 | 28,831.3 | 22,611.5 | 3,610.8 | 1,403.8 |
| Captured alternation, 4096-byte full hit | C2 | 6,178.2 | 4,961.9 | 4,620.9 | 4,621.8 |
| Lookahead + captures, 4096-byte full hit | C2 | 6,245.0 | 6,299.7 | 3,569.4 | 1,413.8 |
| Same lookahead with end flags | C2 | 6,523.2 | 6,668.7 | 6,230.4 | 6,519.4 |
| Captured prefix, 4096-byte miss | C2 | 25,002.6 | 132.7 | 191.9 | 199.3 |
| BMP UTF-16 captures, 16-unit full hit | C2 | 163.3 | 150.5 | 218.3 | 212.7 |

C2 captured alternation completes in the retained managed Java plan in both
forks; its 4.6-us result is not Rust or PCRE2 engine throughput. The lookahead
native win shrinks when end flags are observed: original Java replay promotes
the Pattern. JNI controls preserve the gains on useful long native work and
the losses on tiny/miss/UTF-16 routing. Interpreter, C1, tiered and C2 results
and both original-Java controls remain separately identified.

## Native kernels, activation and memory

| Exact native find fixture | Rust engine | Rust adapter | PCRE2 interpreter core | Direct cached PCRE2 JIT |
| --- | ---: | ---: | ---: | ---: |
| Captured alternation 4096-byte full hit | 40,940.0 ns | 40,852.2 ns | 3,368.8 ns | 1,305.4 ns |
| Captured prefix 4096-byte miss | 94.4 ns | 112.1 ns | 47.8 ns | 169.6 ns |
| Captured alternation 16-byte full hit | 221.5 ns | 241.4 ns | 90.4 ns | 26.6 ns |

These native numbers exclude Java profiles, replay, JNI and HotSpot stable-copy
work. A direct-JIT tiny hit is promising but does not establish a public-API
win. Automatic admission currently stays interpreted for tiny/miss-only work;
the miss counterexample is retained instead of recommending always-JIT.

For the exact long captured lookahead activation probe, JIT appears on call 33.
Median activation-call cost is 16.55 us versus 3.17 us interpreted; steady calls
settle near 1.17 us versus 3.16 us. Cumulative preparation/matching crosses the
interpreter median at call 43, within this fixture only. At call 64 cumulative
cost is 163.4 versus 205.4 us. Generated code is 1,006 bytes. Its conservative
retained reservation is about 1.1 MiB including the reusable stack/context.
The C2 BMP route allocates 40 Java bytes/call at 16 code units and 8,200 at
4,096 units; byte-input matching allocates zero Java bytes in these warm cases.
The source-defined HotSpot stable copy requests one 4,096-byte native buffer
for the long Latin-1 call and 8,192 bytes for BMP, excluding allocator overhead;
these requests are outside the PCRE2 allocation counter.
Final C2 mixed-fixture snapshots report about 1.20 MiB budget / 818 JIT bytes
with automatic JIT, versus 83 KiB and zero JIT bytes interpreted. These are
logical PCRE2 counters, not RSS or HotSpot copy allocation totals.

## Preparation, lifetimes and concurrency

First use is mixed: the long captured alternation operation is 2.79 ms with
automatic PCRE2 versus 2.31 ms frozen Rust and 3.87 ms original Java. Long
lookahead is 2.00 ms versus 5.23/3.70 ms. The BMP UTF-16 first operation is
5.19 ms versus 6.30/3.97 ms. These independent processes include preparation
and observed public work; their total wall times are preserved separately.
Automatic JIT has not activated on these single calls.

Reused-pattern and collected-backend data include Java allocations and all
losses. Tiny same-binary shared-pattern controls sometimes differ substantially
despite no eligible JIT work, consistent with profile/compilation effects; do
not interpret these rows as a JIT causal gain. Collected-backend GC is outside
the timer and Cleaner/preparation caches can overlap. No general reuse or
collection crossover is claimed.

Shared-Pattern concurrency tests use 1/4/8 Matchers on all five available CPUs.
The isolated monomorphic Java lookahead fixture is about 1.50 us at one worker,
close to PCRE2 automatic at 1.55 us; this removes the large mixed-fixture Java
gap. At eight workers aggregate lookahead cost is roughly 0.47 us Java and
0.54 us PCRE2. BMP UTF-16 copies/scan remain expensive; at eight workers the
PCRE2 aggregate is about 2.05 us versus 0.56 us frozen Rust. Full RSS records
and per-process results are retained. Concurrency is not a blanket win.

## Validation and genuine limits

All **113** relevant regex/Scanner/String/startup/array-layout tests pass on the
corrected release image, including **5,989** framework checks. The new test
passes eight configurations with **156,103** differential observations each.
The ported regression compares about **386,329** native/Java API states per
enabled mode. GC/in-flight promotion, both widths, cleanup, memory pressure,
interrupt-flag preservation and the native W^X-map check pass. Compiler logs
show C1/C2 native-gate intrinsics; disabling intrinsics shows a native-method
call. A separate captured-repeat trace reached Java fallback StackOverflowError;
that failure remains preserved and illustrates a real limit of fallback.

The caller CharSequence guard is the independent commit `48a46b1a358`.
The exact frozen Rust image demonstrably bypasses the access limit; this image
preserves it. Timed String fixtures are unaffected by that common change.
The original Rust branch/PR were not modified.

The supplied research packet download failed and was not retried. A smaller
five-project pinned starter covers ten static/constructed seeds plus explicit
runtime-generated configurations; **14,258** observations pass. It is purposive
evidence, not usage frequency or 99% coverage. The broader supplied corpus and
ARM/macOS execution remain unavailable. Pattern Unicode properties/folding,
surrogates, lookbehind and unproved capture histories retain Java. Large work
is safepoint-capable; limit exhaustion returns to Java and never fabricates a
miss. Java fallback can remain expensive and has no interrupt-cancellation
contract. See the design document for exact bounds, lifetime and JIT policy.

Exact commands, source pins, raw results, prior failures and the stopped
preliminary campaign are preserved in the accompanying reproduction packet.
