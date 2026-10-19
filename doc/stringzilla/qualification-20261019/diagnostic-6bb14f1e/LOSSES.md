# Repeated paired complete-image comparisons

10 rows have a higher enabled median or mean against at least one control.

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Higher enabled median; mean |
|---|---|---:|---:|---:|---:|---:|---|
| serial/c2 | equal-latin1-4096 | 125.844 | 127.949 | 135.670 | 0.9478 [0.9168, 0.9835] | 0.9361 [0.8021, 1.1860] | original,disabled; original |
| serial/c2 | immediate-utf16 | 5.558 | 10.094 | 5.441 | 0.5474 [0.5339, 0.5770] | 0.5390 [0.5341, 0.5412] | original,disabled; original,disabled |
| serial/c2 | immediate-utf16-126 | 5.462 | 9.802 | 5.216 | 0.5539 [0.5446, 0.5623] | 0.5321 [0.5298, 0.5376] | original,disabled; original,disabled |
| serial/c2 | latin-vm-bulk-65-fifth-from-end | 17273.171 | 16276.438 | 15389.244 | 1.0675 [0.9890, 1.0709] | 0.9356 [0.9337, 1.0185] | disabled; disabled |
| serial/c2 | latin-vm-end-9 | 8.680 | 13.679 | 8.586 | 0.6181 [0.5584, 0.6345] | 0.6215 [0.5450, 0.6282] | original,disabled; original,disabled |
| serial/c2 | latin-vm-single-128-fifth-from-end | 8.674 | 8.675 | 8.591 | 0.9999 [0.8896, 1.0014] | 0.9926 [0.9903, 1.1094] | original,disabled; original |
| serial/c2 | latin-vm-single-32-fifth-from-end | 9.012 | 9.221 | 9.625 | 0.9231 [0.8860, 1.1321] | 0.9858 [0.7785, 1.2752] | original,disabled; original |
| serial/c2 | mixed-end-64 | 29.145 | 24.350 | 23.626 | 1.0842 [0.9382, 1.2903] | 0.9856 [0.6908, 1.0460] | disabled; disabled |
| serial/c2 | supp-char-forward-utf16-bulk | 208.733 | 213.331 | 217.369 | 0.9766 [0.9721, 0.9784] | 0.9962 [0.9685, 1.0305] | original,disabled; original,disabled |
| serial/c2 | tiny-utf16 | 3.511 | 3.011 | 2.980 | 1.1365 [1.0638, 1.1741] | 0.9745 [0.9318, 0.9965] | disabled; disabled |
