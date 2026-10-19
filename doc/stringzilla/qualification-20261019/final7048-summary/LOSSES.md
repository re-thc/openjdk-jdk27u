# Repeated paired complete-image comparisons

17 rows have a paired-ratio, control-median or pooled-mean loss against at least one control.

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
| msvc/c1 | overlap-min-latin | 625.082 | 352.161 | 349.428 | 1.7605 [1.7162, 1.7982] | 0.9922 [0.9408, 1.0054] | disabled; disabled; disabled |
| msvc/c1 | short-latin-c1-32-miss | 18.123 | 20.259 | 18.400 | 0.9164 [0.8554, 0.9915] | 0.9919 [0.8605, 1.0066] | original,disabled; original,disabled; original |
| msvc/c2 | equal-latin1-4096 | 78.872 | 84.179 | 79.411 | 1.0023 [0.9369, 1.0033] | 0.9434 [0.9324, 1.0460] | disabled; original,disabled; original,disabled |
| msvc/c2 | final-latin-word-prefix-end-25 | 10.953 | 11.279 | 11.319 | 0.9945 [0.9711, 1.0052] | 1.0058 [1.0035, 1.0174] | original; original; original |
| msvc/c2 | latin-vm-end-33 | 10.902 | 9.771 | 13.608 | 1.1158 [1.0022, 1.1423] | 1.4397 [1.1088, 1.4885] | -; -; original,disabled |
| msvc/c2 | latin-vm-end-9 | 5.206 | 5.208 | 5.544 | 0.9997 [0.9013, 1.0553] | 1.0032 [0.9720, 1.1118] | original; original; original |
| neon/c1 | overlap-min-latin | 642.817 | 647.377 | 643.600 | 0.9930 [0.9929, 0.9962] | 0.9942 [0.9932, 0.9943] | original,disabled; original,disabled; original,disabled |
| neon/c1 | short-latin-c1-32-miss | 28.428 | 29.646 | 28.874 | 0.9587 [0.9556, 0.9589] | 0.9740 [0.9723, 0.9757] | original,disabled; original,disabled; original,disabled |
| neon/interpreter | immediate-latin | 351.127 | 379.873 | 426.511 | 0.9268 [0.9243, 0.9368] | 1.0899 [1.0574, 1.1963] | original; original; original |
| serial/c1 | overlap-min-latin | 739.351 | 778.505 | 747.110 | 0.9354 [0.8493, 0.9895] | 0.9965 [0.9548, 1.1086] | original,disabled; original,disabled; original |
| serial/c1 | short-latin-c1-32-miss | 37.244 | 39.239 | 39.085 | 0.9351 [0.9039, 1.1089] | 0.9673 [0.9485, 1.0556] | original,disabled; original,disabled; original,disabled |
| serial/c2 | equal-latin1-4096 | 115.665 | 109.109 | 110.170 | 1.0427 [0.9967, 1.0917] | 0.9972 [0.9829, 1.0310] | disabled; -; - |
| serial/c2 | latin-vm-bulk-65-fifth-from-end | 15608.586 | 16187.882 | 15406.619 | 0.9210 [0.9088, 1.0545] | 0.9524 [0.8532, 0.9688] | original,disabled; original,disabled; original,disabled |
