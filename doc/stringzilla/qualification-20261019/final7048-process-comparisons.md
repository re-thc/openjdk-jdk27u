# Ordinary complete-process comparisons

Two six-round blocks; all 12 paired ratios are retained. Ratios are control/enabled; above one favors enabled.
Control times are medians across 12 runs in milliseconds. Ranges retain every paired round.

| Workload | Original ms | Enabled ms | Disabled ms | O/E block 1; block 2 | O/E pooled [range] | D/E pooled [range] |
|---|---:|---:|---:|---|---|---|
| startup | 31.066 | 30.392 | 30.910 | 0.9759; 1.0224 | 0.9919 [0.5673, 1.4499] | 0.9966 [0.5064, 1.5077] |
| javac | 1599.426 | 1580.808 | 1580.433 | 1.0687; 1.0467 | 1.0467 [0.8841, 1.2246] | 0.9969 [0.8642, 1.0942] |
| source-indexing | 685.462 | 677.864 | 782.987 | 1.0857; 1.0129 | 1.0317 [0.9041, 1.1976] | 1.1972 [0.9411, 1.4529] |
