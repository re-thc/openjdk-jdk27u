# Pre-correction dispatch diagnosis

These are measurements of complete baseline `416d7db3` and candidate `6bb14f1e` images built with GCC 16.0.1, running on the available AMD EPYC 9V74 host with `UseAVX=0`. They are not measurements of the subsequent word-probe correction or its GCC 16.2 build.

All 19 selected serial C2 triplets completed: 171 control processes and 855 samples. Three paired rounds use rotating original/enabled/disabled order, one JMH fork per control per round, three 300 ms warmups and five 300 ms measurements. The exact original manifest is retained alongside every JMH JSON, log, image identity and command. [All comparisons](COMPARISONS.md) and [every higher enabled median or mean](LOSSES.md) preserve the observed spread.

The UTF-16 immediate match at source length 128 took 5.558 ns original, 10.094 ns enabled and 5.441 ns disabled. Its three paired original/enabled ratios were 0.5474, 0.5770 and 0.5339. The length 126 control showed the same effect. [The C2 traces](jit/enabled.log) contain two `Objects.checkFromIndexSize` static calls and an `ArraysSupport.mismatch` call to compare eight bytes after the caller's physical checks. The follow-on correction replaces this exact-width probe with one word equality and retains the existing caller checks. Its acceptance requires separate complete-image results.

The same pass retains substantial gains: Latin-1 bulk miss 717.23 ns original versus 216.81 ns enabled, and UTF-16 bulk miss 708.64 ns versus 252.62 ns. Narrow-window and mixed-coder gains also remain in the table. Ten rows have a higher enabled median or mean against at least one control; none were removed.
