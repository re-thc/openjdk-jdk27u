# MSVC c2 matched complete-image results

Source: `4592230b14fc2f4b537b162fd7f6b791e882b615`. Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`. Strict collection passed 102 triplets / 306 records / 57 main compilation diagnostics. JMH uses two forks, three 500 ms warmup iterations and five 500 ms measurement iterations; errors are the reported 99.9% intervals.

Enabled has 35 higher means versus original and 40 versus disabled. 2 rows have nonoverlapping intervals against both controls; 3 additional rows have nonoverlapping intervals only against original. Every higher mean remains below. A ! marks nonoverlapping intervals.

| Case | Parameters | Original ns/op | Enabled ns/op | Disabled ns/op | Higher enabled mean |
|---|---|---:|---:|---:|---|
| tiny-latin | {"coder":"LATIN1","length":"4","needleLength":"4","position":"MISS"} | 5.310 +/- 0.348 | 5.175 +/- 0.278 | 5.461 +/- 0.765 | - |
| tiny-utf16 | {"coder":"UTF16","length":"4","needleLength":"4","position":"MISS"} | 3.694 +/- 0.113 | 3.649 +/- 0.211 | 3.980 +/- 0.878 | - |
| threshold-latin1-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 52.169 +/- 3.010 | 17.893 +/- 0.934 | 52.261 +/- 2.866 | - |
| threshold-latin1-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 52.543 +/- 2.687 | 19.209 +/- 1.018 | 53.323 +/- 3.495 | - |
| threshold-utf16-127 | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 33.459 +/- 1.551 | 13.810 +/- 0.736 | 28.815 +/- 1.315 | - |
| threshold-utf16-128 | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 33.183 +/- 1.924 | 13.041 +/- 0.696 | 28.570 +/- 1.472 | - |
| immediate-utf16 | {"coder":"UTF16","length":"128","needleLength":"4","position":"END"} | 5.620 +/- 0.311 | 7.303 +/- 0.389 | 6.012 +/- 0.292 | original!, disabled! |
| immediate-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 6.042 +/- 0.229 | 7.088 +/- 0.454 | 6.373 +/- 0.357 | original!, disabled |
| mixed-end-9 | {"coder":"MIXED","length":"4096","needleLength":"9","position":"END"} | 10.395 +/- 0.503 | 11.337 +/- 0.572 | 11.742 +/- 0.584 | original |
| mixed-end-63 | {"coder":"MIXED","length":"4096","needleLength":"63","position":"END"} | 34.551 +/- 1.686 | 27.890 +/- 4.549 | 26.189 +/- 1.693 | disabled |
| mixed-end-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"END"} | 35.128 +/- 1.639 | 26.112 +/- 1.425 | 26.339 +/- 1.520 | - |
| mixed-end-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"END"} | 35.446 +/- 2.009 | 24.463 +/- 1.517 | 27.003 +/- 1.281 | - |
| mixed-miss-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 797.627 +/- 52.526 | 209.012 +/- 17.291 | 805.019 +/- 44.477 | - |
| mixed-miss-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 823.490 +/- 132.462 | 207.742 +/- 12.357 | 850.922 +/- 110.259 | - |
| equal-latin1-32 | {"coder":"LATIN1","length":"32","needleLength":"4","position":"EQUAL"} | 2.999 +/- 0.131 | 3.194 +/- 0.106 | 3.835 +/- 1.512 | original |
| equal-latin1-4096 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"EQUAL"} | 72.182 +/- 10.157 | 72.482 +/- 11.457 | 66.841 +/- 2.936 | original, disabled |
| equal-utf16-32 | {"coder":"UTF16","length":"32","needleLength":"4","position":"EQUAL"} | 3.322 +/- 0.192 | 3.621 +/- 0.173 | 3.639 +/- 0.205 | original |
| equal-utf16-4096 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"EQUAL"} | 148.317 +/- 7.484 | 155.775 +/- 6.936 | 159.553 +/- 7.234 | original |
| overlap-min-latin | {"length":"0","needleLength":"257","shape":"OVERLAP_LATIN1"} | 227.717 +/- 13.427 | 97.040 +/- 3.342 | 179.705 +/- 9.520 | - |
| overlap-min-utf16 | {"length":"0","needleLength":"129","shape":"OVERLAP"} | 123.121 +/- 13.799 | 105.992 +/- 59.380 | 84.675 +/- 3.836 | disabled |
| bulk-latin1 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 768.762 +/- 56.496 | 156.861 +/- 6.907 | 775.473 +/- 73.047 | - |
| bulk-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 787.302 +/- 70.895 | 131.933 +/- 6.757 | 877.160 +/- 345.872 | - |
| long-utf16-64-512 | {"length":"512","needleLength":"64","shape":"NEAR_END"} | 355.753 +/- 28.304 | 365.720 +/- 44.782 | 396.884 +/- 58.421 | original |
| long-utf16-64-4096 | {"length":"4096","needleLength":"64","shape":"NEAR_END"} | 2825.152 +/- 360.015 | 2966.342 +/- 745.094 | 2744.166 +/- 139.403 | original, disabled |
| long-overlap-latin-512 | {"length":"254","needleLength":"257","shape":"OVERLAP_LATIN1"} | 28554.691 +/- 2021.875 | 69.703 +/- 9.092 | 22451.767 +/- 1423.748 | - |
| long-overlap-utf16-512 | {"length":"382","needleLength":"129","shape":"OVERLAP"} | 22420.992 +/- 1099.883 | 120.131 +/- 4.793 | 15745.867 +/- 843.457 | - |
| long-overlap-latin-4096 | {"length":"3838","needleLength":"257","shape":"OVERLAP_LATIN1"} | 443688.580 +/- 32352.723 | 442.027 +/- 23.071 | 437799.026 +/- 97796.845 | - |
| long-overlap-utf16-4096 | {"length":"3966","needleLength":"129","shape":"OVERLAP"} | 178887.114 +/- 38345.041 | 969.511 +/- 358.228 | 154950.504 +/- 6091.965 | - |
| threshold-utf16-511 | {"coder":"UTF16","length":"511","needleLength":"4","position":"MISS"} | 109.136 +/- 29.400 | 21.791 +/- 1.287 | 105.878 +/- 20.527 | - |
| threshold-utf16-512 | {"coder":"UTF16","length":"512","needleLength":"4","position":"MISS"} | 110.887 +/- 4.613 | 23.350 +/- 1.594 | 111.269 +/- 5.006 | - |
| msvc-bulk-utf16-8 | {"coder":"UTF16","length":"4096","needleLength":"8","position":"MISS"} | 785.957 +/- 30.043 | 129.191 +/- 7.371 | 766.558 +/- 24.101 | - |
| msvc-bulk-utf16-9 | {"coder":"UTF16","length":"4096","needleLength":"9","position":"MISS"} | 776.576 +/- 56.877 | 134.150 +/- 25.178 | 777.030 +/- 39.542 | - |
| msvc-bulk-utf16-16 | {"coder":"UTF16","length":"4096","needleLength":"16","position":"MISS"} | 818.852 +/- 83.303 | 135.853 +/- 37.210 | 765.838 +/- 25.014 | - |
| msvc-bulk-utf16-32 | {"coder":"UTF16","length":"4096","needleLength":"32","position":"MISS"} | 765.520 +/- 25.086 | 135.588 +/- 29.426 | 763.599 +/- 27.594 | - |
| msvc-bulk-utf16-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"MISS"} | 768.134 +/- 36.977 | 135.667 +/- 23.914 | 757.803 +/- 28.141 | - |
| msvc-threshold-utf16-8 | {"coder":"UTF16","length":"128","needleLength":"8","position":"MISS"} | 32.938 +/- 3.163 | 14.349 +/- 0.719 | 32.993 +/- 0.850 | - |
| msvc-threshold-utf16-9 | {"coder":"UTF16","length":"128","needleLength":"9","position":"MISS"} | 34.098 +/- 3.438 | 14.003 +/- 0.629 | 31.077 +/- 4.866 | - |
| immediate-utf16-126 | {"coder":"UTF16","length":"126","needleLength":"4","position":"END"} | 5.561 +/- 0.317 | 7.140 +/- 0.342 | 6.011 +/- 0.358 | original!, disabled! |
| immediate-utf16-127 | {"coder":"UTF16","length":"127","needleLength":"4","position":"END"} | 8.976 +/- 6.424 | 7.222 +/- 0.421 | 6.475 +/- 0.892 | disabled |
| msvc-utf16-end-128-9 | {"coder":"UTF16","length":"128","needleLength":"9","position":"END"} | 9.161 +/- 1.493 | 11.091 +/- 1.838 | 9.195 +/- 0.775 | original, disabled |
| msvc-utf16-end-4096-9 | {"coder":"UTF16","length":"4096","needleLength":"9","position":"END"} | 9.576 +/- 3.028 | 10.439 +/- 0.313 | 9.120 +/- 0.299 | original, disabled! |
| msvc-utf16-end-128-16 | {"coder":"UTF16","length":"128","needleLength":"16","position":"END"} | 16.437 +/- 2.771 | 13.500 +/- 2.347 | 12.833 +/- 4.020 | disabled |
| msvc-utf16-end-4096-16 | {"coder":"UTF16","length":"4096","needleLength":"16","position":"END"} | 17.636 +/- 7.788 | 13.971 +/- 2.522 | 12.086 +/- 0.484 | disabled |
| msvc-utf16-end-128-32 | {"coder":"UTF16","length":"128","needleLength":"32","position":"END"} | 70.517 +/- 171.658 | 19.301 +/- 4.252 | 16.210 +/- 0.725 | disabled |
| msvc-utf16-end-4096-32 | {"coder":"UTF16","length":"4096","needleLength":"32","position":"END"} | 22.333 +/- 1.257 | 18.357 +/- 0.958 | 15.850 +/- 0.763 | disabled! |
| msvc-utf16-end-128-64 | {"coder":"UTF16","length":"128","needleLength":"64","position":"END"} | 36.035 +/- 1.880 | 27.708 +/- 1.056 | 24.182 +/- 1.383 | disabled! |
| msvc-utf16-end-4096-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"END"} | 35.193 +/- 1.716 | 28.736 +/- 1.480 | 24.741 +/- 1.110 | disabled! |
| msvc-dense-utf16-512-4 | {"length":"512","needleLength":"4","shape":"NEAR_END"} | 349.433 +/- 19.038 | 357.591 +/- 19.421 | 345.469 +/- 18.231 | original, disabled |
| msvc-dense-utf16-4096-4 | {"length":"4096","needleLength":"4","shape":"NEAR_END"} | 2744.102 +/- 138.679 | 2726.858 +/- 149.732 | 2651.877 +/- 128.452 | disabled |
| msvc-dense-utf16-512-8 | {"length":"512","needleLength":"8","shape":"NEAR_END"} | 357.302 +/- 16.760 | 353.265 +/- 19.887 | 347.657 +/- 19.221 | disabled |
| msvc-dense-utf16-4096-8 | {"length":"4096","needleLength":"8","shape":"NEAR_END"} | 2691.863 +/- 142.775 | 2704.958 +/- 142.447 | 2716.566 +/- 133.016 | original |
| msvc-dense-utf16-512-9 | {"length":"512","needleLength":"9","shape":"NEAR_END"} | 348.300 +/- 18.183 | 354.656 +/- 19.859 | 341.307 +/- 15.920 | original, disabled |
| msvc-dense-utf16-4096-9 | {"length":"4096","needleLength":"9","shape":"NEAR_END"} | 2721.490 +/- 146.269 | 2717.195 +/- 116.692 | 2704.176 +/- 123.533 | disabled |
| msvc-dense-utf16-512-32 | {"length":"512","needleLength":"32","shape":"NEAR_END"} | 344.957 +/- 17.715 | 354.630 +/- 19.315 | 346.466 +/- 18.796 | original, disabled |
| msvc-dense-utf16-4096-32 | {"length":"4096","needleLength":"32","shape":"NEAR_END"} | 2714.393 +/- 147.896 | 2709.041 +/- 154.969 | 2737.689 +/- 152.748 | - |
| msvc-utf16-boundary-127-end | {"coder":"UTF16","length":"4096","needleLength":"127","position":"END"} | 62.251 +/- 2.846 | 50.163 +/- 2.846 | 39.374 +/- 2.290 | disabled! |
| msvc-utf16-boundary-127-miss | {"coder":"UTF16","length":"4096","needleLength":"127","position":"MISS"} | 752.051 +/- 41.009 | 125.217 +/- 7.224 | 745.778 +/- 41.622 | - |
| msvc-utf16-boundary-128-end | {"coder":"UTF16","length":"4096","needleLength":"128","position":"END"} | 65.717 +/- 3.342 | 49.347 +/- 2.983 | 40.430 +/- 2.197 | disabled! |
| msvc-utf16-boundary-128-miss | {"coder":"UTF16","length":"4096","needleLength":"128","position":"MISS"} | 749.290 +/- 37.660 | 124.822 +/- 7.134 | 740.227 +/- 44.375 | - |
| msvc-utf16-boundary-129-end | {"coder":"UTF16","length":"4096","needleLength":"129","position":"END"} | 62.818 +/- 4.256 | 32.764 +/- 1.512 | 42.085 +/- 2.331 | - |
| msvc-utf16-boundary-129-miss | {"coder":"UTF16","length":"4096","needleLength":"129","position":"MISS"} | 761.196 +/- 33.066 | 834.500 +/- 41.822 | 740.241 +/- 36.990 | original, disabled! |
| supp-forward-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 28.480 +/- 1.672 | 28.385 +/- 1.478 | 28.871 +/- 1.502 | - |
| supp-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 421.459 +/- 20.844 | 430.806 +/- 23.248 | 430.249 +/- 20.715 | original, disabled |
| supp-forward-latin-early | {"coder":"LATIN1","length":"256","needleLength":"4","position":"START"} | 4.325 +/- 0.213 | 4.220 +/- 0.227 | 4.249 +/- 0.226 | - |
| supp-forward-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 28.363 +/- 1.358 | 28.271 +/- 1.304 | 28.382 +/- 1.378 | - |
| supp-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 828.621 +/- 39.103 | 847.117 +/- 48.133 | 853.569 +/- 46.928 | original |
| supp-forward-utf16-early | {"coder":"UTF16","length":"128","needleLength":"4","position":"START"} | 5.183 +/- 0.254 | 5.267 +/- 0.303 | 5.195 +/- 0.279 | original, disabled |
| supp-forward-mixed-at | {"coder":"MIXED","length":"128","needleLength":"4","position":"MISS"} | 28.426 +/- 1.446 | 28.527 +/- 1.396 | 28.120 +/- 0.908 | original, disabled |
| supp-forward-mixed-bulk | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 851.616 +/- 46.664 | 843.467 +/- 45.318 | 845.702 +/- 38.283 | - |
| supp-forward-mixed-early | {"coder":"MIXED","length":"128","needleLength":"4","position":"START"} | 4.693 +/- 0.269 | 4.637 +/- 0.260 | 5.054 +/- 0.807 | - |
| supp-forward-mixed-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 833.091 +/- 43.287 | 834.648 +/- 41.881 | 822.872 +/- 37.597 | original, disabled |
| supp-forward-mixed-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 838.730 +/- 50.959 | 833.692 +/- 47.195 | 827.153 +/- 41.047 | disabled |
| char-forward-latin-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 5.631 +/- 0.287 | 5.692 +/- 0.257 | 5.593 +/- 0.286 | original, disabled |
| char-forward-latin-257 | {"coder":"LATIN1","length":"257","needleLength":"4","position":"MISS"} | 5.515 +/- 0.283 | 5.540 +/- 0.312 | 5.520 +/- 0.287 | original, disabled |
| supp-char-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 65.444 +/- 3.263 | 64.954 +/- 3.889 | 64.851 +/- 3.545 | disabled |
| supp-char-reverse-latin-below | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 67.523 +/- 3.006 | 70.154 +/- 3.607 | 70.153 +/- 3.877 | original, disabled |
| supp-char-reverse-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 70.028 +/- 3.774 | 43.540 +/- 2.360 | 78.446 +/- 4.456 | - |
| supp-char-reverse-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 1019.809 +/- 51.301 | 452.119 +/- 23.837 | 1024.771 +/- 57.479 | - |
| supp-char-reverse-latin-early | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 3.502 +/- 0.278 | 4.496 +/- 0.237 | 4.544 +/- 0.258 | original! |
| supp-char-forward-utf16-below | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 5.873 +/- 0.284 | 5.707 +/- 0.298 | 5.884 +/- 0.212 | - |
| supp-char-forward-utf16-at | {"coder":"UTF16","length":"129","needleLength":"4","position":"MISS"} | 5.851 +/- 0.282 | 5.891 +/- 0.292 | 5.933 +/- 0.297 | original |
| supp-char-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 122.489 +/- 6.510 | 121.641 +/- 8.588 | 120.127 +/- 2.921 | disabled |
| supp-char-reverse-utf16-below | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 31.213 +/- 1.874 | 32.110 +/- 1.684 | 32.727 +/- 1.762 | original |
| supp-char-reverse-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 31.281 +/- 1.646 | 33.336 +/- 1.636 | 33.376 +/- 1.713 | original |
| supp-char-reverse-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 767.146 +/- 43.098 | 780.213 +/- 42.584 | 848.105 +/- 47.160 | original |
| supp-char-reverse-utf16-early | {"coder":"UTF16","length":"4096","needleLength":"4","position":"END"} | 3.448 +/- 0.186 | 5.062 +/- 0.276 | 5.093 +/- 0.319 | original! |
| supp-builder-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 434.786 +/- 20.520 | 434.963 +/- 20.944 | 428.322 +/- 21.171 | original, disabled |
| supp-builder-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 847.301 +/- 48.000 | 848.872 +/- 48.306 | 846.622 +/- 45.183 | original, disabled |
| supp-builder-mixed | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 832.195 +/- 38.805 | 841.597 +/- 46.716 | 845.185 +/- 38.530 | original |
| supp-buffer-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 436.033 +/- 23.561 | 433.281 +/- 22.338 | 436.156 +/- 22.949 | - |
| latin-prefix-miss-575-511 | {"length":"575","needleLength":"511","shape":"LATIN_PREFIX_MISS"} | 6029.276 +/- 314.348 | 251.046 +/- 13.331 | 6076.361 +/- 353.973 | - |
| utf16-prefix-miss-303-256 | {"length":"303","needleLength":"256","shape":"UTF16_PREFIX_MISS"} | 2465.207 +/- 133.198 | 254.951 +/- 12.614 | 2082.198 +/- 116.802 | - |
| utf16-uniform-end-129-129 | {"length":"129","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 62.397 +/- 3.684 | 48.230 +/- 1.645 | 41.303 +/- 1.848 | disabled! |
| utf16-uniform-end-130-129 | {"length":"130","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 62.382 +/- 3.528 | 48.336 +/- 1.740 | 41.174 +/- 2.283 | disabled! |
| latin-end-32 | {"coder":"LATIN1","length":"4096","needleLength":"32","position":"END"} | 16.603 +/- 0.716 | 16.474 +/- 0.907 | 17.604 +/- 1.115 | - |
| latin-end-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"END"} | 26.925 +/- 1.492 | 18.418 +/- 0.822 | 27.076 +/- 1.473 | - |
| latin-miss-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"MISS"} | 775.170 +/- 30.891 | 537.293 +/- 25.623 | 754.631 +/- 40.924 | - |
| latin-period2-miss-4096-512 | {"length":"4096","needleLength":"512","shape":"LATIN_PERIOD2_MISS"} | 5919.488 +/- 320.760 | 851.032 +/- 46.865 | 5233.676 +/- 316.594 | - |
| latin-period3-miss-4095-513 | {"length":"4095","needleLength":"513","shape":"LATIN_PERIOD3_MISS"} | 7895.989 +/- 455.938 | 1212.295 +/- 54.931 | 6772.890 +/- 311.348 | - |
| utf16-period2-miss-2048-256 | {"length":"2048","needleLength":"256","shape":"UTF16_PERIOD2_MISS"} | 2383.670 +/- 102.086 | 887.945 +/- 62.660 | 2670.290 +/- 156.043 | - |
| utf16-period3-miss-2047-257 | {"length":"2047","needleLength":"257","shape":"UTF16_PERIOD3_MISS"} | 2524.347 +/- 135.899 | 978.987 +/- 51.666 | 2768.021 +/- 151.138 | - |
| char-forward-latin-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 13.850 +/- 0.501 | 14.099 +/- 0.733 | 14.029 +/- 0.800 | original, disabled |

Compilation diagnostics describe their named representative fixtures and are separate from timing evidence. Raw per-fork measurements and image, source, compiler and backend provenance are retained in the accompanying JSON and workflow artifact.
