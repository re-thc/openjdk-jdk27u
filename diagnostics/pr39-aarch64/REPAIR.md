# AArch64 mismatch repair for review

The source repair addresses the distinct paths exposed by native run
[39033175975](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39033175975).
It has not been benchmarked or executed on native ARM. The original failed
screen and its unchanged samples remain in [RESULTS.md](RESULTS.md).
[The per-row causal audit](causal-audit-39033175975.json) covers all 34 screening
rows, all paired final-worker/helper compilations and their variability gates.

## What the retained evidence establishes

All 152 measured forks had installed C2 benchmark code and zero collections.
The final normal JMH workers compiled during measurement iteration 1 and had
no subsequent target invalidation. No measured ARM machine-code bytes or
successful raw Ideal graphs were retained: compilation XML supplies tiers,
inlining decisions, bytecode identities and nmethod sizes, not instructions.
The prior successful graph checks printed their verdicts but discarded child
graph output. Source instruction counts alone cannot resolve the measured
instruction-level bottleneck.

| Rows | Formal result | Observed changed path | Repair selection |
|---|---|---|---|
| 000–006: 8 B heap, differences 1–7 | 7 regressions | New ARM intrinsic bypasses size predication; baseline uses inlined Java word loads | Keep calls below 128 B in Java |
| 007–013, 024–026: heap differences 1–7 and 10 | 10 regressions | Candidate enters stub; heap has no first-word C2 guard, and larger requests load/reduce 64 B before locating the difference | Two pinned C2 words before stub entry |
| 014–020: other primitive kinds, second-element difference | 7 inconclusive | Same intrinsic change; first measured iteration inflates within-fork spread; retained iterations 2/3 still show 38–53% losses | Two words cover long/double element 1 as well as smaller elements; retain formal inconclusive statuses |
| 021: equal 8 B | Inconclusive | Stub entry replaces Java for a single word; first-iteration instability remains | Short-input Java selection |
| 023: equal 64 KiB heap | Regression | Candidate intrinsic versus separately compiled baseline Java word loop; caller inlining differs too | Bound vector work to 2 KiB, then call original Java implementation on an equal prefix |
| 030–032: native/mixed prefixes 10/25/82 | 3 regressions | Both workers call a precompiled C2 segment helper; candidate helper adds new bounded dispatch and intrinsic work, baseline helper inlines Java word loads | Pinned scalar comparison through the 128 B minimum range before stub entry |
| 022, 027–029, 033 | 5 passes | Equal 128 B and longer-prefix comparisons retain intrinsic/caller-inlining advantages in this run | Keep vector execution eligible for equal heap 128 B and mismatches through byte 1,267 |

This separates observed call-path causes from unproven instruction costs.
The native helper was already too large for worker inlining in both images;
there is no candidate-only helper-inlining cliff in rows 030–033. In contrast,
caller inlining does differ in the equal and longer-prefix heap rows. The eight
inconclusive rows are not relabelled, and no sample has been deleted or added.

## Source policy

The changes are confined to AArch64 compiler admission and the existing C2
intrinsic expansion. No comparison library or handwritten assembly is added.
The x86 dispatch policy and the interpreter implementation remain unchanged.
The prefix ordering correction below also applies to x86 native/mixed calls.

- C2 heap calls now use the same 128 B minimum selection as native calls. A
  valid constant element scale is required; short, empty, negative or unsupported
  calls retain normal Java compilation.
- Within the guarded range, ordinary pinned, unaligned long loads check two
  heap words or sixteen native/mixed words in address order. A merged XOR and
  trailing/leading-zero count returns the first differing element. This covers
  every observed early losing position without entering the vector stub.
- Each AArch64 C2 heap stub call receives at most `2048 >> scale` elements. The
  smallest power-of-two prefix above the observed beneficial byte-1,267 case
  keeps that vector opportunity and the equal heap 128 B path. This is a
  conservative fallback boundary, not a measured optimum.
- If a larger heap input has an equal vector prefix, a real Java call invokes the
  existing `ArraysSupport.vectorizedMismatch` with **all original arguments**.
  It deliberately rescans the prefix. This preserves original indices, negative
  `~tail` values and deoptimization reconstruction, and avoids a duplicate word
  loop or forced caller inlining. The additional call merges both memory and IO.
  A compiled callee executes its existing Java word loop; a cold interpreter
  entry can still select its existing bounded intrinsic until compilation.
- Native and mixed C2 calls keep the existing 128 B–64 KiB selection and send
  the full original length to the stub. They do not use the heap cap or generate
  a post-stub Java rescan. Native equality was not measured, so the demonstrated
  heap loss does not justify changing the native bulk policy.
- Nullable array bases with unrestricted long offsets can become raw unsafe
  addresses. Their prefix loads need an all-memory dependency on ordinary heap
  stores through other aliases. `has_wide_mem` selects the established
  `MemBarCPUOrder` pattern: one after range guards before prefix loads, and one
  after all normal exits merge. These are compiler ordering barriers; the loads
  remain plain, unordered and pinned. Proven narrow heap and native addresses
  do not gain those barriers.
- AArch64 C1 admits a leaf only for a constant valid scale and a constant
  nonnegative length at most `65536 >> scale`. Unknown and larger ranges use
  Java. This closes the new unbounded heap-leaf path without changing LIR or
  relying on a multiplication that can overflow.

The length guard dominates every prefix load. Each subsequent load follows
all preceding equality branches; address arithmetic retains the original unsafe
classification and oop base when known non-null. Nullable array bases with
unrestricted offsets retain raw addresses, as in the existing stub expansion.
No shifted raw pointer is kept
across the Java fallback. Original object arguments and scoped sessions remain
reachable through the existing caller/fences. Native range/chunk guards and
outer polling loops remain in place. Public array guards and floating-point
NaN/signed-zero handling remain in their existing Java callers.

Keeping a vector path does not prove that its old advantage survives the new
guards or register/code-layout effects. Native 128 B equality repeats its scalar
prefix in the stub, and a large equal heap scan repeats up to 2 KiB in Java. These
costs, the changed inlining decisions, and the cap all require native validation.
The native equal 4 KiB path retains a single full-range stub after its scalar
prefix. Its intended benefit still needs to pass the native gate before any
expanded timing; preserving the path does not demonstrate that benefit.

## Regression checks

`AArch64VectorizedMismatchDispatchTest` checks heap/native/both mixed orders,
scales 0–3, all prefix/chunk boundaries, mismatch indices and tails, alignments,
primitive arrays, NaN payloads, signed zero and exception ordering. IR and debug
checks follow actual leaf and fallback argument edges: at most 2 KiB for heap,
original full-range heap Java arguments, full native/mixed leaf lengths and no
post-stub native Java rescan, and a polling Java callee when loop polling is
enabled. Native and both mixed orders have 4 KiB constant graph checks for
scales 0–3. Existing `NativeVectorizedMismatchTest` retains its x86
contract and checks ARM prefix guards, load pinning, branch admission and
per-chunk polling. A continuing chunk cycle must cross an explicit poll or
the exact normal Java mismatch call; C2 treats that call as a guaranteed
safepoint, and the callee's return polls. Arbitrary calls and off-cycle calls
cannot satisfy the check. `TestBoundedVectorizedMismatch` checks 17 C1 admission cases
and their level-1 semantic results.

Store/compare tests keep nullable compared arrays, unrestricted long offsets and
a separate writer parameter in the same C2 compilation. Graph checks follow
memory edges from the ordinary heap store into the raw prefix loads and from
the exit barrier into following stores; shared control or barrier counts alone
do not prove ordering. Runtime cases exercise aliases of either compared array
and an unrelated writer, rather than mutating only outside the compiled scanner.

The wrong-result executions used **our first repair,
`a5fbfd7125b6f0f5f571aa59a4104932834ecc64`**, not the author's original
`9fedf7ac9040bf1d46e383201524f1ca7a13a29e`. All three production C++ source
hashes in the VM manifest match `a5fbfd` and differ from `9fedf7a`; its recorded
`production_head=20054e` was the checkout parent while those source edits were
uncommitted. The source hashes identify the executed implementation.
On native x86, `heapStore0` with our ARM policy enabled and `mixedStore0` with
the ordinary x86 policy returned index 0 after the same-method store made the
inputs equal (expected -1). Their raw loads consumed the initial memory
parameter while only the later leaf consumed the heap store's memory slice.
The heap prefix was introduced by our repair. Original `9fedf7a` has the same
unbarriered native first-word pattern, supporting a native/mixed hazard by
source analysis, but these executions do **not** reproduce that original
commit. Both corrected VMs pass all twelve store/compare graph and runtime
probes, including following stores. These are shared-compiler correctness
checks, not native ARM execution or performance results. The validation record
retains both outcomes, exact source hashes, VM identities and graph hashes.

Successful and failed Ideal children now write named raw graph captures before
verification. `prepare.py` uses the supported `JTREG RETAIN=all` option, includes
the new tests, and requires ARM dispatch `ir`, `ideal` and `store-ordering` IDs
to execute.
This closes the successful-capture gap without relaxing a correctness gate.

Local checks include a complete GCC16.2 fastdebug x86 JDK build with Serial,
G1 and ZGC, rebuilt HotSpot for this correction, Java 27 compilation of all three
tests, 107 native graph-verifier mutations, and 31 Python campaign tests. An
isolated copy of that host VM enables only the new ARM compiler-policy branches while retaining x86
code generation and its existing mismatch stub. Its C1 admission/semantics,
C2 dispatch/framework semantics, twenty constant-range graphs and the
separately compiled polling Java fallback pass. The policy VM also passes all
146 variable/constant/chunk graphs, including default and Serial loop settings.
These are shared compiler-logic checks, **not an AArch64 build, emulated
performance result or native qualification**.
The ordinary host VM also passes the existing native graph suite with the
current PR's generated Java classes. [The local validation record](repair-validation.json)
identifies source hashes, overrides and evidence.
This local build uses the author-based review branch; it does not establish
the repaired merge result against current master.

Future protocol source fixes warmup at three iterations, retaining the same
three measured iterations, 132 rows, 560 forks, controls and 29-minute driver cap.
The existing native equal 4 KiB row moves to screen position zero, making the
future split 35 screening and 97 main rows. Its original stability and paired
5% benefit requirements stop the campaign before all other rows on failure;
it is neither duplicated nor retried. Historical 34/98 results remain unchanged.
It requests code dumps for the exact benchmark, generated worker and hot
callees found in retained compilation XML, and records compilation/invalidation
lines with iteration brackets. It validates installed tiers using the worker's
full package name. This may move
the observed normal-worker recompilation into warmup, but stability still needs
to pass the original gates; no retry or additional sample is permitted.

## Remaining native evidence and execution boundary

Before merging, the exact repaired source must pass the native correctness
matrix and stable matched measurements, with actual timed ARM nmethod bytes
and final tier/deoptimization boundaries retained. That is the missing evidence
for recovery and instruction-level attribution. No native application speedup
or optimal threshold is claimed here.

The completed runs consumed 95 of 225 reserved runner-minutes; 130 remain.
[CAMPAIGN.md](CAMPAIGN.md) identifies repair `93926e`, its merge against pinned
master, all image/toolchain receipts and a 5+125-minute job envelope. The author
and master concurrency guards remain separate from repaired-source identity.
The corrected source must pass correctness and the existing 4 KiB equality
benefit gate before later timing. Native instruction attribution still needs
actual relevant bytes; missing bytes limit any conclusion to the measured
end-to-end call path. No further CI or benchmark launch is authorized or has
occurred. Publishing this source does not start a workflow or spend the balance.

## Incorporation of encoder and decoder findings

The measured PR head already contains short-native C2 Java selection
(`475233bda9e`), the segment first-word check (`68f36a97498`), first-byte ordering
(`ccd4c72edfc`), read bounds (`d4757b0fc55`) and cached segment bases/addresses
(`9fedf7ac904`). Run 39033175975 included all of these. The later ARM heap/prefix,
bounded-C2 and C1 repair described above was absent from that experiment.

Decoder spill/Phi placement, low-mask matcher and scheduling findings are
separate and are not implemented by this repair. Master commit `89885a6288e`
changes Zen3+ spilling defaults; it was matched in both measured images and is
not a PR39 repair. The historical x86/application observations remain separate
from the native ARM microbenchmark verdict.
