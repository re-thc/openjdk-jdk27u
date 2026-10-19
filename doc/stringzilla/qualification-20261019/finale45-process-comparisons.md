# Ordinary complete-process comparisons

Two six-round blocks; all 12 paired ratios are retained. Ratios are control/enabled; above one favors enabled.
Control times are medians across 12 runs in milliseconds. Ranges retain every paired round.
Earlier timeout-based observations remain separately labeled diagnostics.

| Workload | Original ms | Enabled ms | Disabled ms | O/E block 1; block 2 | O/E pooled [range] | D/E pooled [range] |
|---|---:|---:|---:|---|---|---|
| startup | 36.649 | 35.869 | 37.648 | 1.1007; 0.9817 | 1.0597 [0.8420, 1.1651] | 1.0882 [0.8549, 1.5129] |
| javac | 1657.988 | 1668.563 | 1649.770 | 0.9462; 1.0117 | 0.9918 [0.8528, 1.0983] | 0.9723 [0.8181, 1.1459] |
| source-indexing | 655.003 | 643.670 | 712.397 | 1.0076; 1.1281 | 1.0362 [0.8602, 1.2711] | 1.1444 [0.9603, 1.5278] |
