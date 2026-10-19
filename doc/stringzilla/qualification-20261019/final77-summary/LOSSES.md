# Repeated paired complete-image comparisons

71 rows have a paired-ratio, control-median or pooled-mean loss against at least one control.

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.
Loss marks distinguish paired-ratio medians below one, higher enabled control medians, and higher enabled pooled means. These summaries can disagree.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Loss: paired ratio; control median; pooled mean |
|---|---|---:|---:|---:|---:|---:|---|
| avx2/c1 | immediate-utf16 | 10.740 | 9.839 | 9.294 | 1.0850 [1.0391, 1.1298] | 0.9114 [0.8992, 0.9868] | disabled; disabled; disabled |
| avx2/c1 | short-latin-c1-32-miss | 31.523 | 34.223 | 32.398 | 0.9072 [0.8444, 1.0458] | 0.9311 [0.9060, 1.0400] | original,disabled; original,disabled; original,disabled |
| avx2/c1 | threshold-utf16-127 | 162.548 | 168.609 | 158.056 | 1.0075 [0.9189, 1.0459] | 0.9744 [0.8742, 1.0276] | disabled; original,disabled; original,disabled |
| avx2/c1 | tiny-utf16 | 6.793 | 5.981 | 5.514 | 1.1357 [1.1082, 1.2066] | 0.9297 [0.8813, 0.9385] | disabled; disabled; disabled |
| avx2/c1 | utf16-uniform-end-129-129 | 116.242 | 121.182 | 124.204 | 0.9443 [0.9116, 0.9821] | 1.0362 [0.9619, 1.0396] | original; original; original |
| avx2/c2 | equal-latin1-4096 | 75.461 | 73.626 | 60.435 | 0.9985 [0.9797, 1.0402] | 0.8287 [0.7959, 0.9691] | original,disabled; disabled; original,disabled |
| avx2/c2 | equal-utf16-4096 | 112.193 | 135.853 | 141.786 | 0.8103 [0.8056, 1.2702] | 1.0907 [0.8173, 1.2727] | original; original; original |
| avx2/c2 | mixed-boundary-end-15 | 11.835 | 11.940 | 10.856 | 0.9912 [0.9809, 1.0715] | 0.9582 [0.8805, 1.0214] | original,disabled; original,disabled; original,disabled |
| avx2/c2 | mixed-boundary-end-16 | 13.038 | 12.039 | 11.734 | 1.0851 [0.8803, 1.1108] | 0.9747 [0.8763, 1.0716] | disabled; disabled; disabled |
| avx2/c2 | mixed-boundary-end-17 | 11.908 | 14.052 | 11.955 | 0.8474 [0.8214, 0.9935] | 0.8508 [0.7930, 0.9352] | original,disabled; original,disabled; original,disabled |
| avx2/c2 | simd-char-reverse-utf16-129 | 27.766 | 30.501 | 29.417 | 0.8962 [0.8761, 0.9179] | 0.9507 [0.9014, 0.9645] | original,disabled; original,disabled; original,disabled |
| avx2/c2 | supp-builder-mixed | 819.889 | 822.310 | 822.700 | 0.9505 [0.9373, 1.0704] | 1.0241 [0.9405, 1.0497] | original; original; original |
| avx2/c2 | supp-char-forward-utf16-bulk | 116.526 | 114.283 | 114.676 | 1.0259 [1.0196, 1.0302] | 0.9989 [0.9618, 1.0558] | disabled; -; disabled |
| avx2/interpreter | immediate-latin | 354.631 | 371.706 | 418.165 | 0.9541 [0.8281, 1.2498] | 1.0640 [1.0203, 1.2986] | original; original; - |
| avx512/c1 | immediate-utf16 | 10.711 | 10.050 | 9.084 | 1.0240 [1.0065, 1.1038] | 0.9039 [0.8208, 1.0086] | disabled; disabled; disabled |
| avx512/c1 | short-latin-c1-32-miss | 32.263 | 32.973 | 33.005 | 0.9200 [0.8977, 1.0675] | 1.0165 [0.9438, 1.0331] | original; original; original,disabled |
| avx512/c1 | tiny-utf16 | 6.943 | 5.871 | 5.619 | 1.1242 [1.0328, 1.1930] | 0.9424 [0.8294, 1.0413] | disabled; disabled; disabled |
| avx512/c2 | mixed-boundary-end-15 | 11.974 | 12.225 | 10.437 | 0.9795 [0.8641, 1.1147] | 0.8846 [0.8266, 0.9382] | original,disabled; original,disabled; original,disabled |
| avx512/c2 | supp-builder-mixed | 796.459 | 807.983 | 787.763 | 0.9824 [0.8311, 0.9857] | 0.9203 [0.7926, 1.0250] | original,disabled; original,disabled; original,disabled |
| avx512/c2 | supp-char-forward-utf16-bulk | 119.697 | 119.963 | 115.581 | 0.9597 [0.8711, 1.0789] | 0.8968 [0.8342, 1.1168] | original,disabled; original,disabled; original,disabled |
| avx512/c2 | tiny-utf16 | 2.894 | 2.923 | 2.808 | 0.9826 [0.8787, 0.9946] | 0.9322 [0.8525, 0.9870] | original,disabled; original,disabled; original,disabled |
| avx512/interpreter | tiny-utf16 | 438.494 | 481.030 | 454.161 | 0.9116 [0.8938, 0.9357] | 0.9429 [0.9079, 0.9668] | original,disabled; original,disabled; original,disabled |
| msvc/c1 | immediate-utf16 | 6.468 | 7.628 | 6.778 | 0.8594 [0.8366, 0.8663] | 0.8767 [0.8439, 0.9574] | original,disabled; original,disabled; original,disabled |
| msvc/c1 | mixed-probe-end-31 | 22.633 | 22.222 | 21.780 | 1.0185 [1.0011, 1.0312] | 0.9801 [0.9715, 1.0486] | disabled; disabled; - |
| msvc/c1 | msvc-utf16-boundary-127-end | 69.505 | 72.817 | 72.152 | 0.9546 [0.9545, 0.9854] | 0.9689 [0.9661, 1.0423] | original,disabled; original,disabled; original,disabled |
| msvc/c1 | msvc-utf16-boundary-128-end | 70.775 | 70.892 | 71.571 | 0.9902 [0.9465, 1.0604] | 0.9899 [0.9572, 1.0291] | original,disabled; original; disabled |
| msvc/c1 | msvc-utf16-end-128-16 | 12.738 | 13.512 | 12.278 | 0.9402 [0.9343, 0.9427] | 0.9155 [0.9028, 0.9171] | original,disabled; original,disabled; disabled |
| msvc/c1 | msvc-utf16-end-4096-9 | 9.593 | 10.477 | 9.517 | 0.9218 [0.7869, 0.9320] | 0.9048 [0.8044, 0.9084] | original,disabled; original,disabled; original,disabled |
| msvc/c1 | short-latin-c1-32-miss | 18.513 | 18.495 | 18.867 | 0.9861 [0.9401, 1.0027] | 0.9873 [0.9429, 1.0202] | original,disabled; -; original |
| msvc/c1 | supp-forward-utf16-bulk | 1111.329 | 1288.385 | 1259.445 | 0.8616 [0.8480, 0.9249] | 0.9775 [0.9254, 1.0187] | original,disabled; original,disabled; original,disabled |
| msvc/c1 | tiny-utf16 | 4.524 | 4.263 | 4.003 | 1.0203 [1.0074, 1.1027] | 0.9168 [0.8913, 0.9466] | disabled; disabled; disabled |
| msvc/c2 | equal-latin1-4096 | 85.066 | 83.022 | 84.334 | 1.0228 [0.9226, 1.0989] | 0.9774 [0.9147, 1.0424] | disabled; -; original,disabled |
| msvc/c2 | equal-utf16-4096 | 157.666 | 159.198 | 158.847 | 0.9904 [0.9656, 1.0542] | 0.9841 [0.9806, 1.0329] | original,disabled; original,disabled; original,disabled |
| msvc/c2 | final-latin-word-prefix-end-25 | 9.946 | 9.570 | 10.142 | 1.0367 [0.9098, 1.0446] | 1.0484 [0.9703, 1.0652] | -; -; disabled |
| msvc/c2 | latin-vm-end-31 | 11.304 | 10.468 | 10.979 | 1.0708 [0.8222, 1.1603] | 1.0970 [0.7863, 1.1142] | -; -; original,disabled |
| msvc/c2 | latin-vm-end-9 | 5.663 | 5.020 | 5.439 | 1.1280 [0.9618, 1.1960] | 1.0646 [0.9860, 1.0834] | -; -; disabled |
| msvc/c2 | mixed-end-64 | 18.473 | 17.517 | 16.108 | 1.0546 [0.9094, 1.0562] | 0.9195 [0.9066, 0.9432] | disabled; disabled; original,disabled |
| msvc/c2 | msvc-utf16-boundary-127-end | 31.502 | 29.125 | 25.753 | 1.0843 [1.0590, 1.0921] | 0.8794 [0.8383, 0.8928] | disabled; disabled; disabled |
| msvc/c2 | msvc-utf16-boundary-128-end | 33.372 | 28.768 | 25.198 | 1.1560 [1.1321, 1.1600] | 0.8732 [0.8378, 0.8759] | disabled; disabled; disabled |
| msvc/c2 | msvc-utf16-end-128-16 | 9.823 | 10.091 | 7.946 | 0.9784 [0.9256, 0.9865] | 0.7809 [0.7594, 0.8097] | original,disabled; original,disabled; original,disabled |
| msvc/c2 | msvc-utf16-end-4096-9 | 5.641 | 8.464 | 5.694 | 0.6626 [0.6310, 0.6749] | 0.6812 [0.6480, 1.2799] | original,disabled; original,disabled; original |
| msvc/c2 | supp-builder-mixed | 518.902 | 540.994 | 524.831 | 1.0028 [0.9223, 1.0053] | 0.9632 [0.9624, 1.0388] | disabled; original,disabled; original,disabled |
| msvc/c2 | supp-char-forward-utf16-bulk | 155.550 | 157.687 | 157.638 | 0.9998 [0.9401, 1.0402] | 0.9997 [0.9709, 1.0549] | original,disabled; original,disabled; original |
| msvc/interpreter | tiny-utf16 | 309.419 | 302.799 | 286.911 | 1.0354 [1.0184, 1.0699] | 0.9940 [0.9443, 0.9962] | disabled; disabled; disabled |
| neon/c1 | overlap-min-latin | 643.461 | 646.836 | 644.966 | 0.9950 [0.9945, 0.9959] | 0.9973 [0.9947, 0.9977] | original,disabled; original,disabled; original,disabled |
| neon/c1 | short-latin-c1-32-miss | 28.477 | 29.147 | 29.158 | 0.9770 [0.9732, 0.9796] | 1.0007 [0.9853, 1.0007] | original; original; original,disabled |
| neon/c1 | threshold-utf16-127 | 88.144 | 101.022 | 84.717 | 0.8715 [0.8642, 0.8791] | 0.8370 [0.8306, 0.8453] | original,disabled; original,disabled; original,disabled |
| neon/c1 | utf16-uniform-end-129-129 | 135.438 | 138.055 | 135.235 | 0.9808 [0.9807, 0.9821] | 0.9795 [0.9791, 0.9814] | original,disabled; original,disabled; original,disabled |
| neon/c2 | equal-latin1-4096 | 255.928 | 255.771 | 255.002 | 1.0003 [0.9962, 1.0039] | 0.9994 [0.9950, 1.0065] | disabled; disabled; original,disabled |
| neon/c2 | equal-utf16-4096 | 502.129 | 501.892 | 502.021 | 0.9999 [0.9972, 1.0013] | 1.0004 [0.9964, 1.0012] | original; -; - |
| neon/c2 | final-neon-c2-reverse-char-utf16-767 | 141.848 | 143.205 | 142.968 | 0.9896 [0.9845, 0.9905] | 0.9997 [0.9805, 1.0081] | original,disabled; original,disabled; original,disabled |
| neon/c2 | mixed-boundary-end-15 | 13.091 | 11.135 | 10.234 | 1.0744 [0.9478, 1.1757] | 0.9132 [0.8400, 0.9386] | disabled; disabled; disabled |
| neon/c2 | mixed-boundary-end-16 | 10.931 | 11.306 | 10.697 | 0.9642 [0.9541, 1.1929] | 0.9567 [0.9412, 0.9744] | original,disabled; original,disabled; disabled |
| neon/c2 | mixed-boundary-end-17 | 11.310 | 12.005 | 11.282 | 0.9657 [0.9355, 1.0529] | 0.9398 [0.8559, 0.9637] | original,disabled; original,disabled; original,disabled |
| neon/c2 | neon-threshold-utf16-512-9-end | 7.343 | 8.243 | 8.059 | 0.8921 [0.8896, 0.8924] | 0.9775 [0.9764, 0.9796] | original,disabled; original,disabled; original,disabled |
| neon/c2 | simd-char-reverse-utf16-129 | 29.754 | 31.643 | 30.783 | 0.9398 [0.9390, 0.9512] | 0.9723 [0.9701, 0.9843] | original,disabled; original,disabled; original,disabled |
| neon/c2 | supp-builder-mixed | 1224.960 | 1225.811 | 1224.120 | 0.9984 [0.9981, 1.0017] | 0.9992 [0.9972, 1.0001] | original,disabled; original,disabled; original,disabled |
| neon/c2 | supp-char-forward-utf16-bulk | 351.997 | 352.340 | 351.162 | 0.9990 [0.9898, 1.0133] | 0.9995 [0.9910, 1.0001] | original,disabled; original,disabled; disabled |
| neon/interpreter | tiny-utf16 | 539.179 | 536.610 | 541.449 | 1.0022 [0.9956, 1.0093] | 1.0088 [1.0045, 1.0090] | -; -; original |
| serial/c1 | immediate-utf16 | 10.823 | 10.311 | 9.558 | 0.9994 [0.9783, 1.1036] | 0.8887 [0.8639, 1.2842] | original,disabled; disabled; - |
| serial/c1 | mixed-probe-end-31 | 38.041 | 39.527 | 35.202 | 0.9624 [0.9147, 0.9791] | 0.9044 [0.8423, 0.9097] | original,disabled; original,disabled; original,disabled |
| serial/c1 | overlap-min-latin | 681.760 | 713.469 | 656.609 | 0.9141 [0.9029, 1.0334] | 0.9203 [0.8653, 1.0277] | original,disabled; original,disabled; original,disabled |
| serial/c1 | short-latin-c1-32-miss | 30.013 | 31.784 | 32.157 | 0.9488 [0.8824, 0.9535] | 1.0041 [0.9796, 1.0147] | original; original; original |
| serial/c1 | supp-forward-utf16-bulk | 1982.903 | 2054.224 | 2082.380 | 0.9670 [0.9391, 0.9678] | 1.0137 [0.9730, 1.0546] | original; original; original,disabled |
| serial/c1 | tiny-utf16 | 6.815 | 6.131 | 5.466 | 1.1078 [1.1025, 1.1376] | 0.9124 [0.8408, 0.9630] | disabled; disabled; disabled |
| serial/c1 | utf16-end-64 | 59.135 | 59.980 | 59.352 | 1.0014 [0.9859, 1.0123] | 0.9727 [0.9703, 1.0375] | disabled; original,disabled; disabled |
| serial/c1 | utf16-uniform-end-129-129 | 111.253 | 118.613 | 120.670 | 0.9197 [0.8073, 1.0494] | 1.0173 [0.9868, 1.1042] | original; original; original |
| serial/c2 | latin-vm-bulk-65-fifth-from-end | 16361.635 | 18357.906 | 14898.998 | 0.8404 [0.7286, 1.0653] | 0.9286 [0.6495, 0.9498] | original,disabled; original,disabled; original,disabled |
| serial/c2 | supp-builder-mixed | 844.433 | 818.062 | 788.696 | 1.0192 [0.9825, 1.0322] | 0.9810 [0.9155, 1.0115] | disabled; disabled; disabled |
| serial/c2 | tiny-utf16 | 3.131 | 3.020 | 3.005 | 1.0366 [0.9718, 1.0783] | 0.9930 [0.9753, 1.0749] | disabled; disabled; - |
| serial/interpreter | tiny-utf16 | 453.613 | 436.458 | 439.670 | 1.0420 [1.0382, 1.0451] | 1.0063 [1.0029, 1.0117] | -; -; disabled |
