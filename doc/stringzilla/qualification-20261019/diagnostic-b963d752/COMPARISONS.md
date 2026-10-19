# Repeated paired complete-image comparisons

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Higher enabled median; mean |
|---|---|---:|---:|---:|---:|---:|---|
| serial/c2 | bulk-latin1 | 687.545 | 202.548 | 691.479 | 3.4379 [3.2979, 3.5214] | 3.4215 [3.3676, 3.6774] | -; - |
| serial/c2 | immediate-utf16 | 5.360 | 3.121 | 5.360 | 1.6697 [1.6674, 1.7457] | 1.7172 [1.7057, 1.7315] | -; - |
| serial/c2 | latin-vm-end-9 | 8.834 | 14.215 | 8.608 | 0.6023 [0.5729, 0.6516] | 0.6186 [0.5517, 0.6409] | original,disabled; original,disabled |
