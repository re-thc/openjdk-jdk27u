# Repeated paired complete-image comparisons

1 rows have a higher enabled median or mean against at least one control.

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Higher enabled median; mean |
|---|---|---:|---:|---:|---:|---:|---|
| serial/c2 | latin-vm-end-9 | 8.834 | 14.215 | 8.608 | 0.6023 [0.5729, 0.6516] | 0.6186 [0.5517, 0.6409] | original,disabled; original,disabled |
