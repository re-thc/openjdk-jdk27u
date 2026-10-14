# PCRE2 comparison results

The reviewed runtime at `32325506c3862d974053009408ab3824d5d29621` fixes actual
anchored JIT execution, Matcher-local replay, recent-work admission and direct
region snapshots. PCRE2 has useful conditional gains; isolated C2 lookahead
find is close to Java, lookingAt and matches still lose, and the conservative
admission policy regresses synthetic medium-hit workloads. This remains a draft.

Frozen Rust control: `cf8ff51954c23effb4e5e6a281ef8bf28111ca0c`. Before-review
PCRE2 runtime: `5af76868efbcf444e2928c43344cd3fe390464bb`. Original Java uses
the exact base regex facade classes in the same reviewed HotSpot binary, not
a separately built original-HotSpot image. The Rust task branch and PR #5 were
not edited. The current Rust owner's later changes are outside this comparison.

## Corrected independent-process experiment

The current campaign contains **760 successful processes**.
Each C2/C1 case has four independent fresh JVMs in two balanced forward/reverse
orders. Selected -Xint/JNI configurations have two independent JVMs each.
One fixture runs per process; the explicit mixed fixture is separate. Warmup is
350 ms and measurement 600 ms, with reset(input), region, the selected operation
and capture offsets. Capture text is checked outside timing. End flags are not
observed before warmup. C2 means its JVM configuration; fixed-duration warmup
does not prove every internal node is compiled, especially expensive misses.
All successful input hashes and binary/module bindings agree across controls.
Processes that failed startup EAGAIN and the earlier ratio-reset setup error are
preserved and excluded. Reruns used fewer sandbox wrappers; cycle-zero C2/JNI
reruns occurred later than their opposite-order pair. Four forks limit confidence.

Linux x86_64, GCC 16.2, Rust 1.99, compact headers, one pinned allowed CPU,
Serial GC, CDS disabled and one compiler thread were used. The packet records
CPU/VM/native configuration, commands and image hashes. SLJIT reports x86 64-bit,
little-endian, unaligned access. ARM/macOS are configured, not executed.

All times below are ns/op; table values are process medians.

| C2 configuration fixture | Operation | Original Java | Frozen Rust | Before review | After interpreter | After automatic |
| --- | --- | ---: | ---: | ---: | ---: | ---: |
| Tiny asserted-digit hit | find | 85.4 | 78.7 | 172.1 | 70.7 | 70.3 |
| Tiny asserted-digit miss | find | 101.1 | 97.4 | 70.6 | 37.2 | 36.5 |
| Long asserted capture hit | find | 1,417.2 | 1,431.8 | 1,401.6 | 3,376.1 | 1,493.4 |
| Long asserted capture hit | lookingAt | 1,450.2 | 1,423.2 | 3,414.8 | 3,410.7 | 2,675.1 |
| Long asserted capture hit | matches | 1,435.5 | 1,460.5 | 3,411.4 | 3,496.5 | 3,488.7 |
| Long absent captured prefix | find | 1,547.7 | 156.1 | 212.0 | 112.9 | 117.6 |
| Tiny BMP capture hit | find | 90.2 | 65.2 | 201.0 | 64.3 | 67.4 |
| Tiny genuine BMP miss | find | 1,614.3 | 1,529.4 | 135.4 | 117.0 | 117.8 |
| Long BMP capture hit | find | 7,383.6 | 7,448.9 | 7,840.3 | 3,934.4 | 1,830.7 |
| 12-unit region in huge String | find | 90.0 | 61.9 | 63.8 | 67.3 | 67.1 |

Long captured alternation at C2 still uses the managed Java plan. It is not
native-engine throughput. The new tiny asserted-digit plan preserves the
original assertion and replays its failed continuation when required; its gains
are managed routing gains. The native-repairs-only intermediate control retains
the old tiny/prefix routing, allowing that attribution. Proved absent prefixes
avoid native preparation and entry; frequent false prefixes and late candidates
are included in the raw matrix. Tiny BMP positives select Java for a narrowly
proved bounded shape; genuine BMP misses keep native rejection.

| C1 fixture | Original Java | Frozen Rust | Before review | After interpreter | After automatic |
| --- | ---: | ---: | ---: | ---: | ---: |
| Long lookahead find | 23,250.2 | 22,554.1 | 1,427.6 | 3,500.1 | 1,580.3 |
| Long lookahead lookingAt | 22,814.1 | 22,692.5 | 3,474.3 | 3,491.7 | 2,706.9 |
| Long BMP capture find | 42,161.0 | 41,748.2 | 15,283.4 | 3,903.1 | 1,869.8 |

The weighted mixed fixture is explicit and purposive, not a production frequency
estimate: original Java 9,495.6,
frozen Rust 2,881.8, before review
1,763.9, after automatic
1,589.8. It does not override the
isolated lookahead finding. Per-fixture actual native route counters are retained.

## Actual execution, observers and admission

The JIT stack callback proves find and lookingAt execution in widths 8/16.
LookingAt lazily compiles an ANCHORED variant and calls it without a runtime
option that disables JIT. matches never prepares JIT and retains full endpoint
semantics. Interpreter/C1/C2/JNI traces show long lookingAt bypasses the rejected
64-byte leaf attempt entirely. JIT preparation and actual entries are distinct
counters; observed flags can select Java only for the observing Matcher.

A first end-flag observer after native warming costs a median
1.384 ms, including
lazy original-Java sibling preparation. Following observer operations cost
6,741.3 ns in that
profile. Observing from the beginning has a different profile and costs
1,637.4 ns. Rare new observers
on a shared Pattern cost 1,587.8
ns/op versus 1,510.5 Java;
nonobserving peers remain native-eligible. These are separate measured workloads.

Default admission needs 32 useful results and 75% useful calls in recent history
(up to 64). Sparse positives separated by 1,024 misses do not prepare JIT.
The public phase probe has one validation hit before numbered calls: actual JIT
first enters numbered call 32, the 33rd useful call. Activation costs 112–180 us
across four JVMs. First cumulative crossings against the paired interpreter
occur at calls 32/40/46/111 and are noisy; no universal crossover is claimed.
After 128 hits, seventeen of the following 100 misses enter JIT, then dispatch
stops; after hits resume it waits forty-eight useful results. This fixes stale
success admission but is conservative at medium hit ratios:

| Synthetic useful-hit share | Before review | After interpreter | After automatic |
| --- | ---: | ---: | ---: |
| 1% | 320.4 | 207.0 | 206.6 |
| 5% | 353.8 | 305.2 | 308.9 |
| 50% | 923.4 | 1,479.0 | 1,516.4 |
| 75% | 1,242.4 | 2,073.2 | 1,611.8 |
| 100% | 1,579.0 | 2,662.1 | 1,575.1 |

The 50% and 75% losses against before-review automatic JIT are retained. Same-
binary automatic/interpreter controls establish the policy effect in this fixture;
they do not identify an optimal threshold for arbitrary production patterns.

## Memory, GC and concurrency

Long BMP reuse now allocates **0 Java bytes/op**, versus 8,200 before review;
tiny BMP native misses allocate zero versus 40. The reused native snapshot copies
only the opaque region from immutable String backing, with qualification cached
per Matcher and interval. Huge Strings with tiny regions and surrogates outside
the region are included. Native copy allocations remain: 8,192 requested bytes
for the 4,096-unit BMP region, independent of PCRE2's counters. JIT code/stacks
remain bounded by the global 64-MiB budget and W^X allocator; each variant reserves
1 MiB and each reusable stack 64 KiB. Logical counters are not RSS. Per-process
RSS, allocation, retained budget and generated code size remain in raw data.
The isolated long lookahead retains 1,197,252 logical native budget bytes and
998 JIT code bytes, with median RSS 46,414 KiB (interpreter 46,254 KiB). Long BMP
retains 1,215,745 budget bytes / 818 code bytes, RSS 46,880 KiB (interpreter
46,602 KiB). These small RSS differences are descriptive, not confidence bounds.
The raw 4,096-unit genuine BMP miss is retained; a targeted compilation trace
shows a greedy Java node compiling late, so that short timed run does not
establish a fully warmed C2 miss-speedup claim.

Current concurrency attempts have 20 successful processes and
40 resource failures. Workers share a Pattern and own Matchers; all
allowed CPUs are available, with a single compiler thread. Failures are neither
assigned timings nor excluded silently:

| Shared Pattern / workers | Original Java | Frozen Rust | Before review | After interpreter | After automatic |
| --- | ---: | ---: | ---: | ---: | ---: |
| lookahead / 1 | 1,442.9 (2 forks) | 1,506.9 (2 forks) | 1,429.6 (2 forks) | 3,483.9 (2 forks) | 1,467.7 (2 forks) |
| lookahead / 4 | resource failure | resource failure | resource failure | resource failure | resource failure |
| lookahead / 8 | resource failure | resource failure | resource failure | resource failure | resource failure |
| wide / 1 | 7,724.3 (2 forks) | 1,563.2 (2 forks) | 4,433.1 (2 forks) | 3,961.2 (2 forks) | 1,774.0 (2 forks) |
| wide / 4 | resource failure | resource failure | resource failure | resource failure | resource failure |
| wide / 8 | resource failure | resource failure | resource failure | resource failure | resource failure |

The earlier 1/4/8-worker experiment is preserved separately; its BMP copies and
global observer routing are obsolete. Thirty-two-Matcher correctness stress at
the reviewed native stage passed, including 786 pool-saturation fallbacks in
one no-JIT run without clearing the Pattern. Repeating that stress on the final
Java-routing image hit EAGAIN while starting its second worker and is inconclusive.

## Validation and remaining gaps

The corrected relevant suite covers **117 tests** and **5,989 framework checks**
(110 original passes, two corrected obsolete route assertions, and five named
String test IDs). Six affected tests were rerun after qualification caching;
the differential test passes **156,103 observations in each of eight modes**.
The ported regression compares **386,329** API states. Final Java routing has
five direct release-image passes for managed rejection, differential behavior,
UTF-16, GC/safepoints and the ported regression; the 32-worker rerun is the resource
failure described above. Reused UTF-16 allocates zero Java bytes and passes an
additional ZGC run. Native capture/limits/sharing/BMP/cleanup checks return tracked
allocation to zero and find no writable executable mapping.

Two real full native release JVM images were built. Process exhaustion blocked
the last Java-only make rebuild; those classes were compiled with the built javac,
replaced in java.base.jmod and linked into a complete runnable image using jlink.
Exact class, JMOD, native library, module hashes and commands are preserved.
Fastdebug failed first on GCC 16's upstream handshake nonnull warning, then on
fork/thread exhaustion after a narrow warning workaround. No fastdebug result is
claimed. The container accumulated about 32,000 unreaped PID-1 tee zombies.

The pinned five-project starter has ten static/constructed seeds plus explicit
runtime configurations; **14,258 differential observations** pass, including the
final image rerun. It is purposive evidence, not occurrence frequency or 99%
coverage. The larger supplied packet remained unavailable and its failed transfer
was not retried. ARM/macOS execution, fastdebug, a broader production corpus and
unrestricted final concurrency stress remain review gates. Unicode properties,
folding, embedded flags, surrogates, lookbehind and unproved capture histories
retain Java. Resource/limit exhaustion uses operation-local Java traversal and
never fabricates no-match; hostile Java fallback may remain expensive.

The common CharSequence access guard is isolated in `48a46b1a358` for deliberate
cherry-picking and retesting in both engines. New PCRE2-specific managed routing
and native changes are separate commits. No hosted diagnostic workflow ran.

## Historical results retained for context

The version-zero packet preserves the earlier 90-process warm matrix, independent
first-use/concurrency runs, native kernels and all failed/preliminary campaigns.
Its six samples came from **two independent processes**, not six forks. Its
fixed multi-fixture C2 long-lookahead row was Java 6,245 ns / PCRE2 1,414 ns;
the earlier isolated concurrency fixture was Java 1,500 ns / PCRE2 1,547 ns.
Both remain evidence of profile sensitivity. Its end-flag row validated flags
before warmup, promoted the Pattern and measured Java steady state; 6,519 ns
was not native-plus-replay latency. Its standalone native captured alternation
was Rust engine 40,940 ns / PCRE2 interpreted 3,369 ns / direct cached JIT 1,305 ns;
prefix miss favored interpretation 48 ns over direct JIT 170 ns. These kernels
exclude VM integration and cannot establish whole-JDK gains. The old 16.55-us
activation/43-call crossover does not replace the public phase costs above.

The versioned reproduction packet contains exact source pins, commands, raw
data, process/image bindings, compiler traces and excluded failures. No merge
is requested.
