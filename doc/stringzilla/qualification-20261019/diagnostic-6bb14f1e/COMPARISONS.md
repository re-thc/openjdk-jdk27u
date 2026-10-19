# Repeated paired complete-image comparisons

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Higher enabled median; mean |
|---|---|---:|---:|---:|---:|---:|---|
| serial/c2 | bulk-latin1 | 717.228 | 216.813 | 698.412 | 3.3081 [3.0662, 3.5565] | 3.1772 [3.0157, 3.5206] | -; - |
| serial/c2 | bulk-utf16 | 708.643 | 252.621 | 722.347 | 2.8052 [2.6343, 3.1483] | 2.8602 [2.6836, 2.9593] | -; - |
| serial/c2 | equal-latin1-4096 | 125.844 | 127.949 | 135.670 | 0.9478 [0.9168, 0.9835] | 0.9361 [0.8021, 1.1860] | original,disabled; original |
| serial/c2 | equal-utf16-4096 | 235.321 | 240.540 | 246.558 | 1.0343 [0.8885, 1.0562] | 1.1001 [0.9801, 1.1066] | -; - |
| serial/c2 | immediate-latin | 5.764 | 4.413 | 5.690 | 1.2882 [1.2414, 1.3101] | 1.2893 [1.2505, 1.3161] | -; - |
| serial/c2 | immediate-utf16 | 5.558 | 10.094 | 5.441 | 0.5474 [0.5339, 0.5770] | 0.5390 [0.5341, 0.5412] | original,disabled; original,disabled |
| serial/c2 | immediate-utf16-126 | 5.462 | 9.802 | 5.216 | 0.5539 [0.5446, 0.5623] | 0.5321 [0.5298, 0.5376] | original,disabled; original,disabled |
| serial/c2 | latin-vm-bulk-65-fifth-from-end | 17273.171 | 16276.438 | 15389.244 | 1.0675 [0.9890, 1.0709] | 0.9356 [0.9337, 1.0185] | disabled; disabled |
| serial/c2 | latin-vm-end-9 | 8.680 | 13.679 | 8.586 | 0.6181 [0.5584, 0.6345] | 0.6215 [0.5450, 0.6282] | original,disabled; original,disabled |
| serial/c2 | latin-vm-single-128-fifth-from-end | 8.674 | 8.675 | 8.591 | 0.9999 [0.8896, 1.0014] | 0.9926 [0.9903, 1.1094] | original,disabled; original |
| serial/c2 | latin-vm-single-32-fifth-from-end | 9.012 | 9.221 | 9.625 | 0.9231 [0.8860, 1.1321] | 0.9858 [0.7785, 1.2752] | original,disabled; original |
| serial/c2 | long-latin-head-candidate-miss | 225.174 | 22.713 | 210.798 | 9.9181 [8.5117, 10.9222] | 9.2809 [8.3664, 9.3570] | -; - |
| serial/c2 | mixed-end-64 | 29.145 | 24.350 | 23.626 | 1.0842 [0.9382, 1.2903] | 0.9856 [0.6908, 1.0460] | disabled; disabled |
| serial/c2 | mixed-miss-64 | 698.186 | 376.217 | 721.929 | 1.8556 [1.8234, 1.8778] | 1.9189 [1.8970, 1.9451] | -; - |
| serial/c2 | supp-builder-mixed | 820.595 | 771.979 | 834.350 | 1.0341 [1.0137, 1.0872] | 1.0882 [1.0515, 1.1122] | -; - |
| serial/c2 | supp-char-forward-utf16-bulk | 208.733 | 213.331 | 217.369 | 0.9766 [0.9721, 0.9784] | 0.9962 [0.9685, 1.0305] | original,disabled; original,disabled |
| serial/c2 | supp-latin-single-end-257-257 | 96.631 | 30.441 | 92.192 | 3.1590 [2.9781, 3.3210] | 3.1333 [2.5019, 3.3145] | -; - |
| serial/c2 | tiny-utf16 | 3.511 | 3.011 | 2.980 | 1.1365 [1.0638, 1.1741] | 0.9745 [0.9318, 0.9965] | disabled; disabled |
| serial/c2 | utf16-uniform-end-129-129 | 56.446 | 26.174 | 42.044 | 2.1785 [2.1565, 2.3274] | 1.5253 [1.5194, 1.8265] | -; - |
