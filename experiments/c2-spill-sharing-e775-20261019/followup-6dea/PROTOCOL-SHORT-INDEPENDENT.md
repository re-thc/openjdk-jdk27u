# Independent stock-vs-short confirmation, declared after screening

The six-pair option screen is exploratory and did not promote a policy under
its static-transport gate. Short's synthetic point estimate +3.71% was similar
in both order groups, with source -1.24% and dense -.77% versus v5. All intervals
span zero. This motivates a distinct independent confirmation of the bounded
lifetime/latency tradeoff. No screen observation is reused as confirmatory data.
Hybrid fails the predeclared source -2% point gate and adds no accepted pairs
or code advantage over short, so it is rejected rather than retuned.

Hypothesis: distance8 retains useful absolute decoder savings versus stock and
reduces exposure to longer live-range gaps, giving a better practical balance
than v5's distance64. Static counts remain net smaller than stock, although
synthetic normal-path counts are worse than v5. Do not mislabel this as fewer
instructions than v5, or retroactively claim the original screen gate passed.

Final candidate: the exact 774c1c0 product/test head plus only MaxDistance=8 in
the helper. Do not import experimental pair logs, the hybrid lambda or temporary
Oracle control into the PR. Keep all safety guards and both-mode120 integration
checks. Build complete source-matched stock/current-master and candidate images,
release/fastdebug, identical tools/options/source-date. Record commits, trees,
libjvm hashes. Preserve all older builds/evidence. Verify master before source
pinning and before timings. Current master checked e7753d9 remains unchanged.

Require native guards, full regalloc+relevant IR integration, both-mode activated
GC/deopt/alias/exception checks on every exercised nmethod, unchanged codec70
and frame85 checks on stock/candidate release and candidate debug, live GC frame
and oop-map proof on both debug images. Capture complete allocated code for all
five corpora, replacement loads/stores/moves/frame and actualJMHdense/copy.
Use frequency evidence honestly: static counts and debug profile estimates are
not hardware dynamic counters. New source pair must retain useful actual target
activation and net transport savings versus stock.

Use equal52-character complete-image installation paths and verify identical
modules/classlist/CDS before timings. A fresh stock build under the same network
permissions as the candidate avoids previously caught classlist-generation
mismatches. No patching of complete runtime images to equalize content.

Run exactly the original nine-cell12-pair matrix:216independent JVM forks,
AB then BA, interleave/rotate cells by pair. Same unchanged app/classes/frames,
JMH1.37 one thread, affinity0-3, SerialGC512MiB, ActiveProcessorCount4, explicit
CDSon, three1s warmups and five1s measurements. Median of five per fork, median
of12within-pair candidate/stock ratios;20k paired bootstrap seed20261019,
order medians, all observations retained. Per-cell95% intervals, not simultaneous
or a guarantee against every regression. No retries/subsets/optional stopping.
No overlapping builds/tests/diagnostic JVMs. The targeted same-image experiment
is a separate diagnostic and will not be pooled with this new confirmation.

Separately run the established48invocation startup/C2 batch cost matrix and
12fork GC/allocation profiler, preserving positive memory costs. Full command
and input/output identities must be recorded and rechecked after the batch.

Keep the short policy only if final safety gates pass, actual net transport
savings survive, at least one representative source/dense decoder cell has
useful positive benefit with its per-cell interval excluding zero, and controls
show no established material loss. Define material control loss as a point
estimate <=-2% with its95%interval entirely negative; assess all cells and
costs/uncertainty openly, including possible losses whose interval spans zero.
Compilation/startup cost intervals and RSS changes remain part of the review.
A statistically clear representative-workload regression must be reported and
weighed, not hidden by averaging. If this source pair fails qualification,
reject short and retain the already-qualified v5 policy with its new integration
tests. No further distance tuning or benchmark-specific exclusions from these
results. Any later idea would need another identified experiment.

After correctness/code gates, a coherent tested short candidate may be pushed
to draftPR56 so current-head CI can overlap the independent confirmation. Mark
uncompleted new performance as pending, not old-base qualification. No merge,
force-push or deletion. If rejected, revert its policy commit normally rather
than erasing history. Publish all successful/failed observations separately
from the focused product diff and end with actual current-head CI state.
