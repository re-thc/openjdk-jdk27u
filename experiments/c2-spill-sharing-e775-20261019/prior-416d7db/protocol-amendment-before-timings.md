# Pre-timing protocol clarification

No A/B throughput or startup measurements have been collected.

Keep every originally specified cell and the original 12-pair AB/BA design.
Add one synthetic positive mechanism control, `experiment.TriggerBench.kernel`,
using the repaired, oracle-checked 24-value fixture. The original kernel4 pressure
cell remains in the matrix. Its v5 reloads fail the intentional origin/tied-range
guards, as documented by the retained failed activation test and diagnostic log.
The new control requires no compiler/guard changes and accepted seven rewrites
with no budget exhaustion, while all 12,000 output and call-effect checks passed.
Use its tested directives, including FPU spilling, consistently in both arms.
This is a mechanism control; decoder application sources, input frames and public
APIs remain unchanged, and a synthetic gain cannot establish decoder benefit.

The public probe's time-based code captures made multiple C2 compilations while
a native build was active. Retain these diagnostics, but perform the final paired
release code captures on an idle machine with identical fixed counts (2,000
decodes per corpus), Xbatch and two compiler threads. Full outputs must match.
The code-capture adapter calls the unchanged decoder API and performs no timings.
Keep code capture, compiler diagnostics and throughput measurements separate.

The manually launched codec unit batch initially lacked the project's explicit
Gradle option `jzstd.adaptiveBlockSize=false`. The one adaptive encoder assertion
also fails on the boot JDK; all 70 selected cases pass on the candidate with this
documented project option. Preserve both initial failures and use the same project
option for the stock control. This option does not change the decoder workload.
## Current-master unit-harness heap correction, before timings

The first current-master stock unit batch used the benchmark's 512 MiB maximum
heap and passed 69/70 tests. `oneLargeWorkspaceCanUseTheDedicatedBudget` failed:
its 64 MiB + 1 cacheability assertion exceeds ScratchPool's default heap/8
budget at that heap size. The project's Gradle test task specifies a 4 GiB
maximum heap. Use `-Xms512m -Xmx4g` for all three selected unit-test arms, with
the same documented adaptive-block option. Preserve the failed 512 MiB batch.
Do not change the application or the already fixed 512 MiB decoder benchmark
heaps: decoder input/output and pool behavior remain identical between arms.
