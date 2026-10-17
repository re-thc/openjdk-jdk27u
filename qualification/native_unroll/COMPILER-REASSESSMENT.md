# Compiler reassessment after the reported Mac correctness pass

The original PR14 remains draft at b3. The current review candidate is a
cumulative zero-seed lowering and compound conversion/reduction matcher, with a
phase-local recurrence classifier. It is not performance-qualified for PR14.

## New source repair

The classifier previously collected every AddF in an eligible compilation. Even
an unrelated scalar floating-point method therefore allocated a Node_List and
entered the indexed preparation pass. Collection now rejects structurally
unrelated adds with the existing constant-depth recognizer before allocating
state. Preparation still rechecks candidates. find_shared does not reshape the
supported unmasked AddF/reduction/cast chain; this filter cannot create a new
admission. Matching rules, encodings, unroll policy and floating semantics are
unchanged. This is a compiler-overhead scope reduction, not a runtime recovery
claim, and has had independent source review.

New structural cases require no classifier state for 4,096 ordinary additions,
unchanged exact selection for eight eligible recurrence adds mixed with 4,096
unrelated adds, and no state for strict, predicated or shared reduction inputs.
All 99 production-C++ model cases pass optimized and under ASan/UBSan. Accounting
now separately records K collection prechecks and at most 2A preparation checks;
indexed work remains conditional on registered candidates. The bound is
O(K + U + A + E_loop), not simply 2A total work. These are deterministic graph
operation tests, not a native C2 or wall-time performance experiment. The real
AArch64 ADLC accepts the updated description; all nine generated C++ units and
Matcher under both AArch64 and x86 header views pass syntax-only compilation
against real HotSpot interfaces. This does not establish target VM build/link or
installed ordinary-entry machine code.

`classifier-current-source.json` binds the new product tree/patch. Original
`classifier-provenance.json`, its historical image fingerprints and the prior
experiment record stay unchanged. Current source validation applies only the
explicit source-revision fields over that preserved record.

## Why no unroll cap or enlarged reduction penalty was added

Independent review agrees with the preserved native admission trace: SLP is
false, the local limit is 60, and b3 admits bodies 17, 26 and 44 through factor
eight, rejecting 80 at sixteen. Original87 admits 41 at two and rejects 70 at
four. Accurate old three-instruction reduction expansion changes b3's factor-four
body to 52, still admitted. Current zero-seed lowering is smaller. A penalty
large enough to force factor two would have no justified expansion basis.

The completed old native grouped candidate, source 3cd10d7, passed legacy
recovery against original87: default-SVE geometric ratio 0.96349 with paired
95% interval [0.95081, 0.97697], and SVE=0 ratio 0.99984 with interval
[0.98601, 1.01516], at zero allocation. Its 96 recovery outputs are independently
hash-checked locally. Five retention control bounds nevertheless failed: three
rawBits and two directBits conditions. Intervals spanning parity do not prove
non-regression. Those samples and criteria remain unchanged.

The current classifier fixes the old mutable-live-node admission and repeated
recurrence walks; the reported Mac pass covers its focused NEON correctness.
Neither fact replaces Linux ordinary-entry release matching or paired retention.
The new prefilter does not retroactively inherit the Mac pass or old timings.

## Separately revalidated maintained fallback fix

The prepared JDK-8382713 backport at a8af87dad615824ede923f26bf181771720322c2
was successfully rebuilt as an ordinary local fastdebug HotSpot development
check. Four focused tests passed with actual IR verification enabled, including
both IncrementalInlineVector settings. The matched b3-module overlay VM SHA256 is
ce53a900190534ea8106252236b13e861aa64ec99707e2a3296ecdc5f7a77d33.
An initial run with a non-whitelisted jtreg option was excluded from IR evidence;
the corrected successful run contained no global IR disabling.

The prior statement that this VM never built is stale. Preserved exact-source
allocation results show MAX256 dynamic insert decreasing from 12,288 to 10,240
B/call: late inlining removes wrappers and the surviving insert call, but payload
and clone arrays remain. Unsupported512 conversion stays at 51,200 B/call with
either flag. These existing measurements were not rerun. This separate maintained
backport was not merged into the reduction candidate and cannot close its native
performance gate, OSR mixed-Phis, ABI materialization or wide fallback allocation.

## Exact remaining blocker

This executor is Linux x86_64 and cannot execute native AArch64 C2. No new native
measured campaign, another Mac execution or new CI launch is within the current
recorded execution scope. Ordinary local build/IR checks were completed without
resetting any spent campaign or no-retry limit.

The twelve retained full rawBits captures and caller XML needed for the offline
control-code audit are also absent here; matching filenames in driver fixtures
are inert. DirectBits and complete caller machine bytes were never collected in
the old assembly cohort. Previous supported bulk transfer attempts failed; no
unchanged denied route was retried. Thus no source change explaining the five
failed control bounds can honestly be invented from the available evidence.

The candidate needs separately attributed native Linux release assembly and the
predefined paired recovery/retention gates before product publication to PR14.
This review branch provides the source repair and evidence boundaries. It does
not claim a no-regressions result or request repetition of the completed Mac
correctness scope. The narrow existing-output IR applicability audit remains
separate and does not block ordinary source work.
