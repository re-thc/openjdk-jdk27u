# Rust regex performance

Rust regex supplies a bounded native backend for `Pattern` and `Matcher`, with
HotSpot intrinsic entry points and JNI fallback. Unsupported syntax, flags,
input or allocation selects Java. Captures, Unicode, regions, resets,
replacements, continuation and end flags remain public compatibility requirements.

Validated preparations provide capture numbering and common traversal plans
without a second Java source parse. Existing native Regex, Cache and Captures
pools are shared. Managed plans can answer a query without entering Rust;
end flags come from an exact plan or Java replay. Reset/reuse coverage checks
native ownership after each operation without querying replay-triggering flags.
Separate fresh Patterns retain public end-flag comparisons.

## Qualified implementation

Runtime source `b2131d804980` avoids backend initialization for known Java-only
flags, leading syntax and plain/wholly quoted literals. It precomputes the first
mandatory literal character for anchored rejection and removes redundant enabled
checks in native-owned dispatch. Interpreter/C1 configurations use a larger
bounded prepared traversal window. The weak compilation-cache slot is restored
in place under its existing monitor, without additional strong retention.
The preceding `af8df701f42` repair preserves opaque `CharSequence` traversal and
lazy access behavior. Public APIs are unchanged.

Source and class hashes bind the measurements to this runtime. Four controls
use the same healthy executor: this implementation, preceding PR source
`166630a8509`, this implementation with Rust regex disabled, and original Java
`Pattern`/`Matcher`. Full 56-module linked images share the GCC 16.2 native VM,
library hashes, resource/JLI ordering and compression; all six standard CDS
archives were regenerated. Runtime patching was not used. Original Java shares
the integration's native VM binary, so this comparison cannot establish the
footprint of a pristine JDK without Rust support.

## Measurement protocol

The fixed comparison retains 5,196 JMH records in 351 phase-labelled rows,
2,304 fresh-process observations covering 144 cases, and eight paired latency
runs. All 3,148 commands completed successfully. Every fresh-process public
state agreed across controls. The complete evidence contains individual samples,
source/image hashes, commands, rejected candidates and earlier failed attempts.
Earlier source versions remain separate datasets.

Warm cases cover 8, 16, 17, 32, 33, 40, 41, 64 and 4,096 characters, misses
and early/late hits, captures and requested end flags. Correctness additionally
checks Unicode and stateful observations. Four balanced
control orders use CPU 0, one JMH thread, 128/256 MiB heap, two 100 ms warmups
and three 100 ms measurements. Medians and minimum/maximum JVM scores describe
these fixed samples; they are not confidence bounds. No sample was removed or
repeated until passing.

Interpreter, C1 level 1, C2-only, normal tiered and intrinsic-disabled JNI
configurations are separate. Instrumented compiler/entry proofs verify the
interpreter intrinsic, compiled C1/C2 intrinsic and JNI routes, independently of
timings. Normal tiered settings alone do not establish execution tier, and a
native-owned Pattern does not prove that every call entered Rust.

## Warm results and losses

Times below are medians in ns/op. “Prior” means `166630a8509`; Java means the
original-source control. All-case CSVs retain every workload and spread.

| Workload | Configuration | Prior | Current | Java |
| --- | --- | ---: | ---: | ---: |
| Uncaptured prefix, 17-character miss | Interpreter | 1,617 | 796 | 809 |
| Same | C1 | 51.9 | 32.2 | 32.3 |
| Same | Normal tiered | 26.7 | 26.7 | 19.9 |
| Uncaptured prefix, 41-character miss | Interpreter | 1,983 | 1,952 | 1,484 |
| Uncaptured prefix, 64-character miss | Interpreter | 2,314 | 2,181 | 1,945 |
| Uncaptured prefix, 4,096-character miss | Interpreter | — | 1,402 | 101,992 |
| Same | C1 | — | 155 | 5,224 |
| Captured prefix, anchored 16-character miss | Normal tiered | 17.6 | 7.6 | 27.6 |
| Captured prefix, anchored full hit | C1 | 72.1 | 77.5 | 119.2 |
| Captured email, early hit with end flags | Normal tiered | 35.5 | 35.7 | 69.1 |
| Unsupported leading lookahead, early hit | Normal tiered | 66.8 | 89.3 | 96.5 |

The 17-character interpreter ranges are current 789–830 and Java 788–847 ns;
C1 ranges are similarly close. The unsupported early-hit regression retains
current 62.0–91.0 versus prior 61.7–76.5 ns. Several full captured anchors cost
5–10% more than prior in explicit C1/C2/JNI configurations despite miss gains.
The tiered long-prefix rejection can use managed `String.indexOf`; its speedup
is an integration result, not evidence that every rejection entered Rust.

Direct-cost probes remain separate from public semantic comparisons. In C2,
raw native entry in the MethodHandle probe context costs 53.5 ns, its wrapper
58.0, managed traversal 12.1 and public facade 21.0. JNI entry/wrapper cost
59.5/66.9 ns. These different contexts are not additive cost components or pure
Rust timings. Preparation lookup also regresses: interpreter 674 to 1,936 ns,
C1 38.0 to 64.2, and normal tiered 18.4 to 28.3. Native entry is not inherently
the cheapest route for tiny inputs.

## First use, lifetimes and latency

Fresh-process probes include compile, matcher creation, search, capture strings
and end flags. For a 16-character early hit, default-tiered internal first use
costs current/prior/Java 3.67/4.19/8.53 ms for email and 1.02/1.43/5.34 ms for
alternation. Literal preparation improves 0.615 to 0.296 ms; quoted preparation
improves 0.535 to 0.362 ms, near Java's 0.366 ms. Captured-prefix first use
instead rises 0.453 to 0.864 ms (current range 0.458–2.726); uncaptured-prefix
rises 0.428 to 0.921 ms (0.419–1.463).

Email process wall medians are current 35.1, prior 34.2, disabled 40.7 and Java
39.5 ms. These include launcher, VM and helper work; filesystem caches were not
flushed. The earlier 40.5 versus disabled 23.4 ms email loss did not reproduce
with matched full images. This does not establish a general startup advantage.

Lifetime measurements include compilation/cache lookup and every search,
with shared preparations or GC before each cold iteration. The original C1
cold 16-character/32-miss case costs current 390 versus prior 185 and Java
153 us. Each current VM's sixth sample includes a 1.37–1.47 ms call;
separate diagnostics identify synchronous adapter compilation in that sample.
These original results remain in the evidence. A separately labelled fixed
comparison warms both caller and adapter routes and verifies compilation before
measurement: current 186 us (173–192), prior 177 (176–198), Java 153 (150–161).
It qualifies warmed execution, not first-compilation latency. Cold C2 one-miss
lifetimes still cost 89.5 us (87.7–129.1), versus prior 103.0 and Java 57.8.
Shared C2 32-miss lifetimes also regress: 3.91 us versus prior 1.65 and Java 2.77.

Paired GC/leaf workloads use four workers, 64K inputs, six pattern shapes and
the same 64 MiB thread stack for every control to accommodate Java recursion.
Observed explicit-GC wall maxima are intrinsic 16.0, JNI 12.3, disabled 26.9
and Java 34.8 ms. Observed steady-call maxima are 18.8/16.1/113.2/134.4 ms.
Peak process RSS is 67–68 MiB for the two enabled routes, versus 154–174 MiB
disabled and 152–183 MiB Java in these runs. These are workload observations,
not latency bounds or a general memory advantage; native AArch64 performance
remains unmeasured locally.

## Correctness and qualification limits

Release and fastdebug each pass 112 regex/Scanner/String/startup tests.
Each suite records 5,989 framework invocations: 5,985 successes and four standard
conditional skips. Enabled main-test configurations compare 408,435 public
results/states each; disabled compares 408,433. Eight state-sequence variants
compare 591,624 states each; eight opaque-CharSequence variants make 2,406
checks each. New preparation-boundary coverage includes 12,960 comparisons.
All controller-owned children were reaped. Fourteen Rust tests, Clippy and
format checks passed on the unchanged native source; their retained receipts
are bound to the current images rather than claimed as newly rerun.

These results support the specific integration improvements while retaining
the cold, short-input, hit and preparation losses above. Latest-head GitHub CI
could not be inspected because metadata requests returned HTTP 403; no earlier
green run qualifies this source. The original requested historical Library
artifact also remained inaccessible. The independent source-bound evidence
does not rely on that artifact's reported results.
