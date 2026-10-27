# One matched pilot comparison: shared guards and silent preparation

The observation-free route lowers later full-request CPU by 2.40–3.18 µs in
all six later-position comparisons, against the preserved instrumented
reference. Each native body is 258 bytes smaller. First preparations remain
expensive, with a small Medium regression. Invocation results are mixed:
Long's native-call CPU regresses in two pairs, and Short has one negative
within-image execution saving. No additional forks were run to improve these
outcomes. This is not an application or warmed-throughput adoption win.

Exactly six release JVMs compare the preserved `8e9b7c551b8` image, action 4,
with qualified `dff603c8988`, action 5. The old route has producer instrumentation;
the new held-method producer has none. The quoted new cost is the complete
observed WhiteBox request, including its surrounding interface, not an
instrumented producer timer or a claimed pure compiler CPU measurement.
The compiler source was unchanged in this pass. Only the existing
[measurement harness](support/interpreter-frame-pilot/InterpreterFramePilotBench.java)
changed, in `03e3bd08638`.

## Matching and first-use controls

Three adjacent pairs alternate which image leads. Preparation and execution
orders rotate so each case occupies each position once per image:

| Pair | Image order | Case order |
|---|---|---|
| p0 | old, new | Short, Medium, Long |
| p1 | new, old | Medium, Long, Short |
| p2 | old, new | Long, Short, Medium |

The same class bytes, target/caller source, CPUs 0–3, G1, fixed 64 MiB heap,
ActiveProcessorCount=4, CICompilerCount=2, CDS off and tier policy serve both
images. UseDirectBaseline is off and UseInterpreterFramePilot is on. As in the
existing pilot, run* callers reach C2 before measurement; target* methods stay
excluded from ordinary compilation and inlining. No C1/C2 hold, notification
mask or admission threshold changes. Compiler state checks require caller
level 4 and target level 0 before/after each window. Reported compilation-time
milliseconds do not advance in any of the six window groups; this coarse
aggregate is not proof of zero compiler activity.

The harness first times a query of an already C2-compiled caller, then repeats
that query. This exercises the WhiteBox bridge without emitting a prefix or
preparing a target's method ID. Actual generation then uses the rotated order,
with no diagnostic formatting/output or disable requests between its three
timings. Afterward all bodies are disabled, ordinary result oracles run, and
each case uses disabled/on/on/disabled windows of 500,000 calls. Checksums and
exact hit deltas validate every window. All 72 windows remain in
[samples](direct-baseline-data/interpreter-match-samples.tsv).

The second-query CPU is 11.056/7.050/30.976 µs in the old p0/p1/p2 runs and
1.342/1.261/1.443 µs in the new ones. The 30.976 µs result is retained. A single
query repeat is not a stable universal interface-cost estimate; it must not be
subtracted from generation. Full cold/repeated query CPU/wall and internal
boundaries are in [queries](direct-baseline-data/interpreter-match-queries.tsv).
The first-query CPU ranges are old 14.621–19.468 µs and new 15.363–18.327 µs.

## Full preparation requests

Each cell below is old observed reference → new observation-free route, using
external requesting-thread CPU and wall timers. Both producers run on that
thread. Their inner timers are nested; none is added to the external request.

| Pair / case | Position | Request CPU µs | CPU change | Request wall µs |
|---|---:|---:|---:|---:|
| p0 Short | first | 13.330 → 12.678 | -4.89% | 12.619 → 12.018 |
| p0 Medium | second | 8.022 → 4.867 | -39.33% | 7.531 → 4.397 |
| p0 Long | third | 8.252 → 5.668 | -31.31% | 7.781 → 5.228 |
| p1 Medium | first | 15.563 → 15.864 | +1.93% | 14.993 → 15.253 |
| p1 Long | second | 8.983 → 5.819 | -35.22% | 8.493 → 5.288 |
| p1 Short | third | 5.098 → 2.424 | -52.45% | 4.637 → 2.003 |
| p2 Long | first | 19.509 → 18.948 | -2.88% | 18.748 → 18.047 |
| p2 Short | second | 5.708 → 3.305 | -42.10% | 5.238 → 2.824 |
| p2 Medium | third | 6.941 → 3.765 | -45.76% | 6.470 → 3.345 |

Later requests consistently fall from 5.098–8.983 to 2.424–5.819 µs CPU and
from 4.637–8.493 to 2.003–5.288 µs wall. The large first-preparation outcome
follows its position rather than always belonging to Short. New first CPU is
12.678/15.864/18.948 µs for Short/Medium/Long, despite the preceding query probe.
The first Medium outcome worsens by 0.301 µs CPU and 0.260 µs wall.

For the new image, the first request's CPU outside the internal WhiteBox timer
is 6.208/6.330/7.321 µs; later requests have 0.812–0.972 µs outside. That
boundary includes result allocation/copy, handle/JNI exit and Java measurement
boundaries. These cuts establish remaining first-use work, not its exact
function-level cause. No first-use premium is subtracted or discarded.

This is a combined image/package comparison. It removes old producer clock
instrumentation and repeated guard encoding together; it does not identify
their independent CPU shares. The new WhiteBox-enabled image also contains
the qualified forced-poll test-hook checks, inactive here. Its outer WhiteBox
timers, snapshot and 32-long result packaging remain. These request numbers
therefore provide delivered-interface costs, not a production normal-trigger
budget. See [all requests](direct-baseline-data/interpreter-match-requests.tsv)
and [paired changes](direct-baseline-data/interpreter-match-request-pairs.tsv).

## One-time setup and emitted bytes

| One-time CPU µs | Old p0 / p1 / p2 | New p0 / p1 / p2 |
|---|---:|---:|
| Arena initialization | 17.546 / 20.241 / 20.791 | 19.880 / 35.353 / 22.944 |
| Enclosing interpreter BufferBlob allocation | 2.684 / 2.223 / 2.804 | 2.694 / 3.245 / 2.444 |

Arena setup is higher in all three pairs, including the adverse 35.353 µs
outcome. Arena wall ranges are old 16.946–20.491 µs and new 19.570–34.702 µs.
These costs precede Java requests and are not charged to each method. The
blob cut covers the whole interpreter allocation, 338,880 requested bytes in
both images, including the 64 KiB arena. It is not an incremental arena-only
allocation measurement. Startup common-guard emission lies outside these cuts,
so they do not establish total feature-startup CPU. All one-time outcomes are
in [startup](direct-baseline-data/interpreter-match-startup.tsv).

| Prefix | Operations unchanged | Old emitted bytes | New emitted bytes | Reduction |
|---|---:|---:|---:|---:|
| Short | 5 | 380 | 122 | 258 (-67.89%) |
| Medium | 21 | 667 | 409 | 258 (-38.68%) |
| Long | 39 | 976 | 718 | 258 (-26.43%) |

To avoid timing an instrumented new producer for size, the harness reads each
published immutable 4 KiB slice only after all timing windows. All three
preparations succeed, no earlier query emits code, and successive accepted
slices must be exactly 4 KiB apart. The unused tail retains the arena's 0xcc
fill. Its observed extent matches the old producer's exact size in all nine
old cases. Full saved-slice disassembly validates every extent, a final dispatch
jump ending there, and only int3 padding afterward, for all eighteen bodies.

The three bodies total 2,023 → 1,249 bytes. This excludes the new common startup
guard block. Both still reserve 64 KiB and assign three full 4 KiB slices, so
neither reserved memory nor assigned-slice memory shrinks. Size evidence is in
[code](direct-baseline-data/interpreter-match-code.tsv); raw bytes/disassembly
with embedded addresses remain private.

## Warm fixed-tier invocation results

These are within-JVM means of two on and two disabled windows, in CPU ns per
target call. Disabled means the feature is enabled but this body is disabled;
it is not a flag-off VM. The paired native-call percentage compares the two
images' on values.

| Pair / case | Old disabled / on | New disabled / on | New within-image saving | Paired on change |
|---|---:|---:|---:|---:|
| p0 Short | 17.552 / 15.293 | 15.912 / 14.520 | 1.392 | -5.06% |
| p1 Short | 15.208 / 15.983 | 15.341 / 15.520 | -0.179 | -2.89% |
| p2 Short | 17.247 / 13.997 | 14.865 / 13.127 | 1.738 | -6.22% |
| p0 Medium | 35.253 / 23.577 | 29.257 / 21.604 | 7.653 | -8.37% |
| p1 Medium | 41.179 / 23.672 | 28.104 / 22.890 | 5.213 | -3.30% |
| p2 Medium | 33.679 / 22.268 | 28.799 / 21.541 | 7.259 | -3.27% |
| p0 Long | 86.143 / 33.180 | 62.969 / 32.965 | 30.004 | -0.65% |
| p1 Long | 84.471 / 29.411 | 61.500 / 30.048 | 31.452 | +2.17% |
| p2 Long | 67.232 / 27.791 | 61.147 / 29.510 | 31.637 | +6.18% |

Medium's on CPU improves in every pair; Long worsens by 0.637 and 1.719 ns/call
in p1/p2. Short's p1 on path is slower than its own interpreter control by
0.179 ns/call (+1.17%); old p1 also has a negative Short saving. These outcomes
remain material limits on a claim of universally beneficial execution.

The disabled controls differ substantially between images, notably Long's
67.2–86.1 versus 61.1–63.0 ns/call. Interpreter layout, image/ASLR and sampling
variation have not been causally partitioned. Three pairs cannot resolve those
effects or establish steady-state neutrality. Full CPU/wall values remain in
[execution](direct-baseline-data/interpreter-match-execution.tsv) and
[execution pairs](direct-baseline-data/interpreter-match-execution-pairs.tsv).

For scale only, new Long's two later full requests divided by their same-JVM
CPU savings give 189 and 186 calls; its first request gives 599. These quotients
exclude setup and use targets deliberately kept interpreted. They are not
admission thresholds or evidence of repayment before ordinary C1/C2.

## Provenance and resulting decision

Both libjvm hashes match their prior qualification and remain unchanged. One
identical class file serves both; the target/caller source region is checked
unchanged against the preserved pilot. Exact identities and settings are in
[images](direct-baseline-data/interpreter-match-images.tsv) and
[settings](direct-baseline-data/interpreter-match-settings.tsv). The new Unsafe
read requires --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED at compile
and runtime. Printing and byte reads follow all request/execution timers.
There are no diagnostic JVMs, profilers, active tooling capabilities, concurrent
builds or additional performance forks in this comparison.

All six JVMs finish correctly. Eighteen request outcomes, twelve query probes,
six startup cuts and all 72 execution windows are retained; no adverse case is
excluded. Commands were reaped; PID1's zombie set remains twenty and 3.3 GiB
is free. Raw logs, full bytes/disassembly and scripts remain private under
`/workspace/interpreter-frame-match`; prior images and evidence are preserved.

The combined change makes recurring requests cheaper and removes duplicated
body bytes. First-use cost, higher measured arena setup and the adverse Long
invocation pairs prevent calling this an overall win. Normal admission and
actual interpreter time saved before C1 remain unmeasured here. This bounded
comparison is complete; no threshold tuning or further timing campaign is
included.

## Retained-code follow-up: added work, layout and repayment

This follow-up reads the existing six captures and exact source only. It runs
no new JVM, build, profiler or benchmark. Runtime source and both qualified
images remain unchanged. The private analysis script is
`/workspace/interpreter-frame-match/analyze_retained.py`; normalized results
are in [retained code analysis](direct-baseline-data/interpreter-match-retained-code-analysis.tsv)
and [repayment arithmetic](direct-baseline-data/interpreter-match-retained-repayment.tsv).

### Executed instructions and guards

All nine paired semantic instruction regions are byte-for-byte identical:
old slice offset 220 to its first dispatch, versus new slice offset zero to
its dispatch. Their hashes also match across all three pairs per case. The
continuation has the same polling dispatch instruction shape, with different
absolute table addresses between JVMs. The old second fallback dispatch is
unreachable on a successful prefix invocation.

| Work in a successful, unarmed release entry | Old | New |
|---|---:|---:|
| Selector instructions, inferred from source | 14 | 14 |
| Safety guards and hit increment | 34 | 34 |
| Inactive WhiteBox forced-poll probe instructions | 0 | 2 |
| Guard conditional branches, including the probe | 12 | 13 |
| Taken guard conditional branches | 0 | 2 |
| Body/continuation indirect jumps | 2 | 2 |

The selector counts include its jump to the body. The indirect-jump row counts
that jump and the continuation jump, rather than adding another two to the
selector. Counts exclude common interpreter frame setup/counters/events, the
caller, and subsequent ordinary return-bytecode execution. They describe the
source-selected fast path, not measured retired instructions or cycles. The
old body's 34 guard instructions and twelve branches are also verified from
the retained disassembly; the shared startup entry itself was not captured.

The proven added recurring work is the inactive test probe's memory compare
and taken conditional branch. Its leaf arm function, register saves/restores
and return marker do not execute in these unarmed windows. The normal poll
test is still executed once at entry, but its clear-poll outcome changes from
an untaken `jne fallback` to a taken `je not_armed`. This accounts for the
second added taken branch without adding a second entry poll. All nine JVMTI
flags, the per-method breakpoint count, interpreter-only check and hit update
remain on every successful entry. The duplicate interpreter-only check in
the selector and guards existed in both images.

The shared encoding itself does not add a call or indirect jump. It moves
guards from after the existing indirect jump to before it. The 258 bytes
removed per slice consist of 220 bytes of relocated guards/hit increment and
38 bytes of eliminated fallback dispatch. The relocated checks still execute;
the eliminated fallback did not execute in successful old invocations.
Removing producer clocks affects preparation, not the timed invocation path.
See the [entry selector](../../src/hotspot/cpu/x86/templateInterpreterGenerator_x86.cpp),
[shared guard emitter and prefix loop](../../src/hotspot/cpu/x86/interpreterFramePilot_x86.cpp)
and [polling dispatch](../../src/hotspot/cpu/x86/interp_masm_x86.cpp).

### BCP stores and stack traffic

These counts are the same in every old/new body, excluding guards/dispatch:

| Prefix | Semantic bytes / instructions | Stack pushes / loads / explicit SP adds | Local loads / stores | BCP advances / saved-BCP stores |
|---|---:|---:|---:|---:|
| Short | 84 / 28 | 5 / 4 / 4 | 2 / 0 | 5 / 5 |
| Medium | 371 / 119 | 19 / 18 / 18 | 6 / 2 | 21 / 21 |
| Long | 680 / 220 | 34 / 33 / 33 | 14 / 5 | 39 / 39 |

Each bytecode still advances r13 and stores it to the interpreter frame's
saved BCP. Every produced integer is materialized on the stack; consumers
reload it and adjust SP. Long spends 78 of its 220 instructions on BCP
advance/save and another 100 on stack push/load/explicit-SP-add operations.
That is 178 instructions, about 81%, before counting local accesses. This is
an instruction-count description, not a CPU attribution. No extra BCP store,
operand spill or arithmetic instruction explains Long's new regression:
these bytes are identical. The precise interpreter state/GC/tooling contract
is retained; this analysis does not propose removing those stores or changing
the canonical stack state.

### What layout evidence can explain

All old slice bases are 32 modulo 64; their semantic region starts 220 bytes
later, at 60 modulo 64. All new slice bases and semantic starts are zero modulo
64. Thus the same semantic instruction sequence has different placement:

| Semantic region | Old / new 64-byte blocks spanned | Old / new instructions crossing a 64-byte boundary |
|---|---:|---:|
| Short | 3 / 2 | 1 / 1 |
| Medium | 7 / 6 | 3 / 5 |
| Long | 12 / 11 | 6 / 8 |

Long also changes from 30 to 33 instruction crossings of 16-byte boundaries,
and 14 to 17 at 32-byte boundaries. These are static address properties; they
are not measured cache misses, decoder stalls, micro-ops or branch penalties.
New code spans fewer blocks but has more straddling instructions, so an
alignment heuristic alone does not establish which is faster. Shared guard
branch sites, the position of the existing indirect jump, cold test-hook code
and ordinary interpreter/template addresses also change. Higher address bits
and caller placement were not controlled or captured for causal attribution.

These low-bit alignments are identical across the three pairs while Long's
on CPU changes by -0.65%, +2.17% and +6.18%. Alignment is therefore a possible
contributor, not an established explanation for the variation. Long's disabled
interpreter controls also change from 67.2–86.1 to 61.1–63.0 ns/call, although
the disabled selector skips both the prefix and the new probe. That reinforces
the limit on attributing the results to prefix execution alone. The data
cannot apportion the adverse 0.637/1.719 ns per Long call between the proven
new entry work, layout, predictor/cache effects and other timing variation.
Neither regression is discarded or declared harmless.

### Interpreter-relative savings and request repayment

Only new-image action-5 full requests enter the following quotients. Its
producer has no internal observation; the delivered request still includes
the externally timed WhiteBox bridge, snapshot and result packaging. No old
instrumented producer cost, subtracted query estimate or zeroed phase statistic
is used as a production cost. CPU repayment is
`ceil(full request CPU / (disabled CPU per call - on CPU per call))`.
The wall quotient separately uses wall request and wall savings; CPU and wall
are never mixed. Positions are one-based; position one retains first use.

| Pair / prefix | Position | CPU saving ns/call (% of interpreter control) | Request CPU µs | CPU repayment calls | Wall repayment calls |
|---|---:|---:|---:|---:|---:|
| p0 Short | 1 | 1.392 (8.75%) | 12.678 | 9,109 | 8,204 |
| p1 Short | 3 | -0.179 (-1.17%) | 2.424 | no saving | no saving |
| p2 Short | 2 | 1.738 (11.69%) | 3.305 | 1,902 | 1,644 |
| p0 Medium | 2 | 7.653 (26.16%) | 4.867 | 636 | 574 |
| p1 Medium | 1 | 5.213 (18.55%) | 15.864 | 3,043 | 2,923 |
| p2 Medium | 3 | 7.259 (25.20%) | 3.765 | 519 | 465 |
| p0 Long | 3 | 30.004 (47.65%) | 5.668 | 189 | 175 |
| p1 Long | 2 | 31.452 (51.14%) | 5.819 | 186 | 168 |
| p2 Long | 1 | 31.637 (51.74%) | 18.948 | 599 | 571 |

For example, the first Long quotient is ceil(18,948 / 31.637374)=599;
its later counterparts are ceil(5,668 / 30.004378)=189 and
ceil(5,819 / 31.452178)=186. All values exclude one-time arena/interpreter
startup costs and any future normal-trigger work. They are scale calculations
for methods deliberately excluded from C1/C2, not evidence that enough calls
remain interpreted to repay the request before ordinary compilation. The
negative Short pair has no finite repayment under its retained mean. No
workload-weighted or application repayment is inferred from these three shapes.

### One minimal proposal

Separate emission of the forced-poll regression hooks from general WhiteBox
enablement with an explicit startup-only test opt-in. The focused guard tests
would request it; ordinary WhiteBox measurements would not. The unselected
entry would emit the existing normal `test poll; jne fallback` path and no
forced-poll compare/branch or leaf-call block. The actual poll, all tooling and
breakpoint guards, hit accounting and polling fallback must remain intact;
the post-poll test return marker would use the same test opt-in.

This is one bounded separation of test machinery, justified by the proven
extra recurring instructions. It is not a claim to fix Long's layout effect
or the total cheap-tier budget, and the six retained pairs cannot predict its
speedup. The opt-in itself is only a proposal: no source, flag default, test,
policy, admission or image change is implemented in this analysis. No padding
tuning or second optimization is proposed from these inconclusive timings.

The subsequent [explicit test-hook opt-in cleanup](interpreter-frame-hook-optin.md)
implements this proposal and qualifies release/fastdebug correctness and actual
generated-code exclusion. It runs no new timings and preserves this report's
images, adverse results and causal limits.
