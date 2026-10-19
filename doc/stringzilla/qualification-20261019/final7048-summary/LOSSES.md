# Repeated paired complete-image comparisons

8 rows have a paired-ratio, control-median or pooled-mean loss against at least one control.

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.
Loss marks distinguish paired-ratio medians below one, higher enabled control medians, and higher enabled pooled means. These summaries can disagree.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Loss: paired ratio; control median; pooled mean |
|---|---|---:|---:|---:|---:|---:|---|
| avx2/c1 | short-latin-c1-32-miss | 30.249 | 32.262 | 30.724 | 0.9758 [0.9082, 1.0122] | 0.9653 [0.9324, 0.9820] | original,disabled; original,disabled; original,disabled |
| avx2/c2 | equal-latin1-4096 | 73.370 | 80.062 | 77.185 | 0.9164 [0.7850, 1.0918] | 0.9311 [0.9092, 1.1292] | original,disabled; original,disabled; original,disabled |
| avx2/interpreter | immediate-latin | 343.916 | 332.993 | 389.200 | 1.0521 [0.8292, 1.0618] | 1.1238 [1.0010, 1.1688] | -; -; original |
| avx512/c1 | short-latin-c1-32-miss | 31.038 | 36.048 | 35.691 | 0.8589 [0.7958, 1.0412] | 1.0017 [0.9876, 1.0936] | original; original,disabled; original |
| serial/c1 | overlap-min-latin | 739.351 | 778.505 | 747.110 | 0.9354 [0.8493, 0.9895] | 0.9965 [0.9548, 1.1086] | original,disabled; original,disabled; original |
| serial/c1 | short-latin-c1-32-miss | 37.244 | 39.239 | 39.085 | 0.9351 [0.9039, 1.1089] | 0.9673 [0.9485, 1.0556] | original,disabled; original,disabled; original,disabled |
| serial/c2 | equal-latin1-4096 | 115.665 | 109.109 | 110.170 | 1.0427 [0.9967, 1.0917] | 0.9972 [0.9829, 1.0310] | disabled; -; - |
| serial/c2 | latin-vm-bulk-65-fifth-from-end | 15608.586 | 16187.882 | 15406.619 | 0.9210 [0.9088, 1.0545] | 0.9524 [0.8532, 0.9688] | original,disabled; original,disabled; original,disabled |
