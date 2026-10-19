# Follow-through protocol, before option timings

Preserve fee0b841 and all earlier observations. First close the integration gap
with a single C2 kernel that is exercised during moving GC, active method/frame
deoptimization, aliases and ordered exceptions. Match every exercised nmethod
compile ID to a positive, unexhausted sharing summary. Keep all original tests.

Investigate the negative positive-trigger and array-copy point estimates. Full
actual-JMH code capture on original stock/candidate shows the positive kernel
removes eight static stack loads, adds three register copies, leaves stores/frame
unchanged; its entry-to-first-return region removes three loads and four
instructions. JMH stub counts are identical. Thus do not claim replacement
spills are the demonstrated cause. Array-copy's stub likewise matched in the
prior capture. Runtime layout/order/noise remains a possible contributor.

Try two general lifetime policies, independently identified in Git and complete
release images, with all existing safety guards unchanged:

1. Short: scan at most eight scheduled instructions instead of 64.
2. Hybrid: preserve the 64-instruction search; allow at most eight-instruction
   extensions, allowing farther same-block pairs only if every later reload use
   lies no later than an existing use of the retained reload (no added lifetime).

First require native/activated integration safety and real-workload activation.
Use separate untimed complete-code captures to count accepted rewrites, final
loads/stores/register moves/frame and qualify whether savings survive. Reject
an option at this gate if it loses necessary activation or eliminates all useful
real decoder savings. Do not tune constants after timing outcomes.

For surviving options, screen each against unchanged v5 with six fixed paired
independent JVM forks per cell: dense, source, positive-trigger and copy-control.
Alternate AB then BA, rotate cells and options by pair, preserve every result.
Options are separate comparisons, not pooled with their predecessor. Same JMH
1.37 one thread, affinity0-3, SerialGC512m, three1s warmups/five1s measurements,
explicit CDS-on, equal-length complete image paths. Median iteration score per
fork, median paired ratios, 20k whole-pair bootstrap seed20261019. Six-pair
screening intervals are exploratory, not the final profitability claim.

An option merits final confirmation if allocated transport improves the limiting
case and source/dense estimates are no worse than -2% versus v5, without an
established adverse control result. Require independent final source-matched
stock-vs-selected 12-pair nine-cell matrix and resource/GC/correctness gates for
any product policy change. If no option qualifies, retain the tested v5 policy
and state clearly that no improved policy was demonstrated. Do not erase its
negative estimates, or call a static instruction reduction a throughput win.

Shorten PR56 description to the problem, implementation, final qualification and
remaining limits, linking detailed evidence. Push coherent tested increments
without force, merge or deleting retained work. Current-head CI must be checked
through completion; report actual failures/queue limitations if service remains
unable to execute, without representing pending jobs as passed.
