# AVX512 c2 matched complete-image results

Source: `4592230b14fc2f4b537b162fd7f6b791e882b615`. Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`. Strict collection passed 118 triplets / 354 records / 57 main compilation diagnostics. JMH uses two forks, three 500 ms warmup iterations and five 500 ms measurement iterations; errors are the reported 99.9% intervals.

Enabled has 31 higher means versus original and 25 versus disabled. 3 rows have nonoverlapping intervals against both controls; 11 additional rows have nonoverlapping intervals only against original. Every higher mean remains below. A ! marks nonoverlapping intervals.

| Case | Parameters | Original ns/op | Enabled ns/op | Disabled ns/op | Higher enabled mean |
|---|---|---:|---:|---:|---|
| tiny-latin | {"coder":"LATIN1","length":"4","needleLength":"4","position":"MISS"} | 3.935 +/- 0.277 | 3.834 +/- 0.341 | 3.797 +/- 0.326 | disabled |
| tiny-utf16 | {"coder":"UTF16","length":"4","needleLength":"4","position":"MISS"} | 2.738 +/- 0.227 | 2.651 +/- 0.246 | 2.632 +/- 0.212 | disabled |
| threshold-latin1-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 46.532 +/- 4.139 | 14.679 +/- 1.295 | 48.036 +/- 4.685 | - |
| threshold-latin1-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 46.949 +/- 4.224 | 17.723 +/- 1.667 | 48.081 +/- 4.354 | - |
| threshold-utf16-127 | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 28.383 +/- 2.450 | 10.639 +/- 1.007 | 24.798 +/- 2.260 | - |
| threshold-utf16-128 | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 28.690 +/- 2.933 | 16.942 +/- 1.656 | 24.787 +/- 2.100 | - |
| immediate-utf16 | {"coder":"UTF16","length":"128","needleLength":"4","position":"END"} | 4.972 +/- 0.480 | 5.014 +/- 0.413 | 5.175 +/- 0.515 | original |
| immediate-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 5.145 +/- 0.433 | 6.303 +/- 0.585 | 5.257 +/- 0.492 | original!, disabled |
| mixed-end-9 | {"coder":"MIXED","length":"4096","needleLength":"9","position":"END"} | 8.469 +/- 0.666 | 9.637 +/- 0.772 | 10.415 +/- 0.825 | original |
| mixed-end-63 | {"coder":"MIXED","length":"4096","needleLength":"63","position":"END"} | 21.332 +/- 1.874 | 17.812 +/- 1.491 | 21.945 +/- 1.808 | - |
| mixed-end-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"END"} | 21.634 +/- 1.970 | 17.417 +/- 1.657 | 22.842 +/- 1.960 | - |
| mixed-end-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"END"} | 22.145 +/- 2.056 | 18.927 +/- 1.609 | 22.704 +/- 2.166 | - |
| mixed-miss-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 676.355 +/- 54.988 | 281.118 +/- 27.933 | 679.808 +/- 59.793 | - |
| mixed-miss-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 673.848 +/- 59.584 | 167.233 +/- 14.335 | 677.282 +/- 53.967 | - |
| equal-latin1-32 | {"coder":"LATIN1","length":"32","needleLength":"4","position":"EQUAL"} | 2.386 +/- 0.187 | 2.389 +/- 0.224 | 2.385 +/- 0.200 | original, disabled |
| equal-latin1-4096 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"EQUAL"} | 65.308 +/- 12.971 | 72.703 +/- 6.201 | 72.830 +/- 5.403 | original |
| equal-utf16-32 | {"coder":"UTF16","length":"32","needleLength":"4","position":"EQUAL"} | 2.981 +/- 0.262 | 2.910 +/- 0.274 | 2.879 +/- 0.217 | disabled |
| equal-utf16-4096 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"EQUAL"} | 136.506 +/- 12.755 | 132.541 +/- 11.693 | 134.282 +/- 11.256 | - |
| overlap-min-latin | {"length":"0","needleLength":"257","shape":"OVERLAP_LATIN1"} | 153.736 +/- 14.299 | 19.096 +/- 1.611 | 151.615 +/- 11.857 | - |
| overlap-min-utf16 | {"length":"0","needleLength":"129","shape":"OVERLAP"} | 94.223 +/- 6.020 | 13.440 +/- 1.023 | 73.503 +/- 5.447 | - |
| latin-span-31 | {"length":"30","needleLength":"257","shape":"OVERLAP_LATIN1"} | 2324.528 +/- 193.905 | 17.065 +/- 1.608 | 2346.904 +/- 198.330 | - |
| latin-span-32 | {"length":"31","needleLength":"257","shape":"OVERLAP_LATIN1"} | 2393.550 +/- 194.394 | 16.012 +/- 1.228 | 2425.483 +/- 191.472 | - |
| latin-span-33 | {"length":"32","needleLength":"257","shape":"OVERLAP_LATIN1"} | 2470.303 +/- 198.442 | 17.211 +/- 1.404 | 2517.926 +/- 198.353 | - |
| latin-span-63 | {"length":"62","needleLength":"257","shape":"OVERLAP_LATIN1"} | 4730.582 +/- 374.805 | 17.336 +/- 1.450 | 4905.095 +/- 384.101 | - |
| latin-span-64 | {"length":"63","needleLength":"257","shape":"OVERLAP_LATIN1"} | 4697.205 +/- 357.390 | 14.612 +/- 1.142 | 4692.222 +/- 287.302 | - |
| utf16-span-15 | {"length":"14","needleLength":"129","shape":"OVERLAP"} | 667.935 +/- 44.790 | 19.742 +/- 1.418 | 534.757 +/- 42.689 | - |
| utf16-span-16 | {"length":"15","needleLength":"129","shape":"OVERLAP"} | 731.484 +/- 66.304 | 19.551 +/- 1.564 | 567.421 +/- 44.075 | - |
| utf16-span-17 | {"length":"16","needleLength":"129","shape":"OVERLAP"} | 767.241 +/- 60.850 | 19.094 +/- 2.027 | 598.599 +/- 40.734 | - |
| dense-latin-miss | {"length":"31","needleLength":"257","shape":"DENSE_MISS_LATIN1"} | 21.055 +/- 1.307 | 10.742 +/- 0.751 | 20.812 +/- 1.625 | - |
| dense-latin-start | {"length":"31","needleLength":"257","shape":"DENSE_START_LATIN1"} | 160.180 +/- 10.010 | 16.636 +/- 1.270 | 157.997 +/- 10.656 | - |
| dense-latin-end | {"length":"31","needleLength":"257","shape":"DENSE_END_LATIN1"} | 69.363 +/- 5.300 | 16.988 +/- 1.333 | 69.918 +/- 4.863 | - |
| bulk-latin1 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 694.416 +/- 50.035 | 138.993 +/- 17.887 | 685.617 +/- 37.225 | - |
| bulk-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 704.258 +/- 33.458 | 237.154 +/- 7.330 | 656.790 +/- 37.354 | - |
| long-utf16-64-512 | {"length":"512","needleLength":"64","shape":"NEAR_END"} | 306.962 +/- 8.114 | 71.129 +/- 1.864 | 314.398 +/- 18.484 | - |
| long-utf16-64-4096 | {"length":"4096","needleLength":"64","shape":"NEAR_END"} | 2492.698 +/- 114.594 | 378.108 +/- 54.688 | 2480.627 +/- 71.036 | - |
| mixed-boundary-end-15 | {"coder":"MIXED","length":"4096","needleLength":"15","position":"END"} | 10.760 +/- 1.141 | 12.749 +/- 0.459 | 12.143 +/- 0.598 | original!, disabled |
| mixed-boundary-end-16 | {"coder":"MIXED","length":"4096","needleLength":"16","position":"END"} | 11.337 +/- 0.318 | 12.039 +/- 1.777 | 12.682 +/- 0.372 | original |
| mixed-boundary-end-17 | {"coder":"MIXED","length":"4096","needleLength":"17","position":"END"} | 11.853 +/- 0.404 | 13.672 +/- 0.598 | 13.306 +/- 0.765 | original!, disabled |
| mixed-boundary-end-31 | {"coder":"MIXED","length":"4096","needleLength":"31","position":"END"} | 15.127 +/- 0.895 | 14.716 +/- 0.885 | 14.413 +/- 0.084 | disabled |
| mixed-boundary-end-32 | {"coder":"MIXED","length":"4096","needleLength":"32","position":"END"} | 13.486 +/- 0.033 | 15.161 +/- 1.330 | 15.347 +/- 1.098 | original! |
| mixed-boundary-end-33 | {"coder":"MIXED","length":"4096","needleLength":"33","position":"END"} | 14.430 +/- 0.541 | 15.808 +/- 0.297 | 15.704 +/- 1.298 | original!, disabled |
| long-overlap-latin-512 | {"length":"254","needleLength":"257","shape":"OVERLAP_LATIN1"} | 17261.115 +/- 61.973 | 16.058 +/- 2.526 | 18382.798 +/- 49.294 | - |
| long-overlap-utf16-512 | {"length":"382","needleLength":"129","shape":"OVERLAP"} | 15791.427 +/- 31.725 | 39.781 +/- 1.617 | 11844.577 +/- 66.356 | - |
| long-overlap-latin-4096 | {"length":"3838","needleLength":"257","shape":"OVERLAP_LATIN1"} | 310847.775 +/- 41807.459 | 69.349 +/- 3.110 | 288041.724 +/- 25250.562 | - |
| long-overlap-utf16-4096 | {"length":"3966","needleLength":"129","shape":"OVERLAP"} | 150659.759 +/- 10279.006 | 236.846 +/- 10.061 | 134662.213 +/- 5767.404 | - |
| threshold-utf16-511 | {"coder":"UTF16","length":"511","needleLength":"4","position":"MISS"} | 92.466 +/- 4.207 | 39.573 +/- 1.401 | 89.436 +/- 3.102 | - |
| threshold-utf16-512 | {"coder":"UTF16","length":"512","needleLength":"4","position":"MISS"} | 93.175 +/- 2.648 | 41.153 +/- 2.406 | 90.295 +/- 3.839 | - |
| latin-span-2 | {"length":"1","needleLength":"257","shape":"OVERLAP_LATIN1"} | 231.714 +/- 12.621 | 17.419 +/- 0.678 | 228.820 +/- 15.075 | - |
| latin-span-3 | {"length":"2","needleLength":"257","shape":"OVERLAP_LATIN1"} | 306.269 +/- 11.001 | 17.966 +/- 0.734 | 302.349 +/- 15.809 | - |
| latin-span-65 | {"length":"64","needleLength":"257","shape":"OVERLAP_LATIN1"} | 4960.072 +/- 270.088 | 16.062 +/- 0.661 | 5217.820 +/- 217.422 | - |
| latin-span-0 | {"coder":"LATIN1","length":"257","needleLength":"257","position":"END"} | 73.567 +/- 2.231 | 11.375 +/- 0.437 | 71.343 +/- 7.524 | - |
| latin-span-0-miss | {"coder":"LATIN1","length":"257","needleLength":"257","position":"MISS"} | 4.211 +/- 0.135 | 3.422 +/- 0.311 | 4.173 +/- 0.280 | - |
| dense-latin-span1-miss | {"length":"0","needleLength":"257","shape":"DENSE_MISS_LATIN1"} | 7.056 +/- 0.748 | 5.586 +/- 0.575 | 7.873 +/- 0.456 | - |
| dense-latin-span1-start | {"length":"0","needleLength":"257","shape":"DENSE_START_LATIN1"} | 80.981 +/- 6.633 | 19.247 +/- 1.188 | 76.465 +/- 3.280 | - |
| dense-latin-span1-end | {"length":"0","needleLength":"257","shape":"DENSE_END_LATIN1"} | 64.941 +/- 0.207 | 18.419 +/- 2.088 | 67.424 +/- 3.501 | - |
| mixed-c2-47-end | {"coder":"MIXED","length":"4096","needleLength":"47","position":"END"} | 16.871 +/- 0.052 | 18.259 +/- 1.240 | 17.580 +/- 0.059 | original!, disabled |
| mixed-c2-47-miss | {"coder":"MIXED","length":"4096","needleLength":"47","position":"MISS"} | 636.447 +/- 1.751 | 261.404 +/- 16.157 | 643.470 +/- 7.619 | - |
| mixed-c2-48-end | {"coder":"MIXED","length":"4096","needleLength":"48","position":"END"} | 16.718 +/- 0.039 | 19.014 +/- 0.275 | 17.703 +/- 0.083 | original!, disabled! |
| mixed-c2-48-miss | {"coder":"MIXED","length":"4096","needleLength":"48","position":"MISS"} | 639.679 +/- 17.853 | 254.699 +/- 0.509 | 635.851 +/- 0.805 | - |
| mixed-c2-49-end | {"coder":"MIXED","length":"4096","needleLength":"49","position":"END"} | 17.246 +/- 0.075 | 15.195 +/- 0.091 | 18.030 +/- 0.057 | - |
| mixed-c2-49-miss | {"coder":"MIXED","length":"4096","needleLength":"49","position":"MISS"} | 648.037 +/- 16.362 | 275.560 +/- 5.967 | 646.155 +/- 14.945 | - |
| immediate-utf16-126 | {"coder":"UTF16","length":"126","needleLength":"4","position":"END"} | 4.685 +/- 0.166 | 4.827 +/- 0.242 | 4.946 +/- 0.264 | original |
| immediate-utf16-127 | {"coder":"UTF16","length":"127","needleLength":"4","position":"END"} | 4.657 +/- 0.111 | 4.799 +/- 0.167 | 4.894 +/- 0.133 | original |
| supp-forward-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 23.872 +/- 0.734 | 24.224 +/- 1.454 | 23.749 +/- 0.515 | original, disabled |
| supp-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 365.441 +/- 15.828 | 363.863 +/- 13.070 | 362.553 +/- 12.478 | disabled |
| supp-forward-latin-early | {"coder":"LATIN1","length":"256","needleLength":"4","position":"START"} | 3.489 +/- 0.065 | 3.457 +/- 0.159 | 3.435 +/- 0.129 | disabled |
| supp-forward-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 24.226 +/- 0.998 | 24.209 +/- 0.946 | 24.225 +/- 0.787 | - |
| supp-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 728.361 +/- 37.124 | 722.105 +/- 26.940 | 722.760 +/- 29.639 | - |
| supp-forward-utf16-early | {"coder":"UTF16","length":"128","needleLength":"4","position":"START"} | 4.196 +/- 0.137 | 4.164 +/- 0.128 | 4.179 +/- 0.149 | - |
| supp-forward-mixed-at | {"coder":"MIXED","length":"128","needleLength":"4","position":"MISS"} | 23.908 +/- 0.654 | 23.711 +/- 0.625 | 24.331 +/- 2.552 | - |
| supp-forward-mixed-bulk | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 718.238 +/- 25.428 | 718.591 +/- 21.698 | 720.209 +/- 24.955 | original |
| supp-forward-mixed-early | {"coder":"MIXED","length":"128","needleLength":"4","position":"START"} | 3.541 +/- 0.105 | 3.536 +/- 0.080 | 3.859 +/- 0.524 | - |
| supp-forward-mixed-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 717.544 +/- 46.698 | 715.938 +/- 33.794 | 710.229 +/- 22.230 | disabled |
| supp-forward-mixed-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 707.641 +/- 26.242 | 723.385 +/- 51.838 | 703.146 +/- 17.613 | original, disabled |
| char-forward-latin-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 4.501 +/- 0.078 | 4.549 +/- 0.064 | 4.456 +/- 0.025 | original, disabled! |
| char-forward-latin-257 | {"coder":"LATIN1","length":"257","needleLength":"4","position":"MISS"} | 5.037 +/- 0.024 | 4.476 +/- 0.035 | 4.516 +/- 0.041 | - |
| supp-char-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 46.836 +/- 0.126 | 52.378 +/- 1.257 | 49.870 +/- 5.030 | original!, disabled |
| supp-char-reverse-latin-below | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 64.392 +/- 0.641 | 65.508 +/- 1.299 | 66.331 +/- 3.595 | original |
| supp-char-reverse-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 64.583 +/- 0.931 | 12.777 +/- 0.477 | 58.034 +/- 0.108 | - |
| supp-char-reverse-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 974.176 +/- 3.428 | 55.837 +/- 0.293 | 847.876 +/- 2.178 | - |
| supp-char-reverse-latin-early | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 2.790 +/- 0.008 | 3.642 +/- 0.013 | 3.976 +/- 0.540 | original! |
| supp-char-forward-utf16-below | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 4.784 +/- 0.022 | 6.022 +/- 0.022 | 5.407 +/- 0.990 | original!, disabled |
| supp-char-forward-utf16-at | {"coder":"UTF16","length":"129","needleLength":"4","position":"MISS"} | 5.437 +/- 0.938 | 4.584 +/- 0.365 | 5.428 +/- 0.937 | - |
| supp-char-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 92.753 +/- 0.887 | 117.182 +/- 39.400 | 97.164 +/- 7.518 | original, disabled |
| supp-char-reverse-utf16-below | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 24.339 +/- 0.061 | 26.791 +/- 0.035 | 26.800 +/- 0.026 | original! |
| supp-char-reverse-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 24.580 +/- 0.031 | 17.105 +/- 0.096 | 27.077 +/- 0.476 | - |
| supp-char-reverse-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 643.176 +/- 0.735 | 230.659 +/- 5.426 | 648.555 +/- 2.232 | - |
| supp-char-reverse-utf16-early | {"coder":"UTF16","length":"4096","needleLength":"4","position":"END"} | 2.817 +/- 0.018 | 4.396 +/- 0.235 | 4.368 +/- 0.086 | original!, disabled |
| supp-builder-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 359.570 +/- 0.611 | 359.855 +/- 0.640 | 359.932 +/- 1.597 | original |
| supp-builder-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 709.830 +/- 3.557 | 714.478 +/- 15.602 | 709.885 +/- 2.851 | original, disabled |
| supp-builder-mixed | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 708.812 +/- 1.184 | 708.870 +/- 1.100 | 709.135 +/- 1.488 | original |
| supp-buffer-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 364.043 +/- 0.587 | 366.282 +/- 10.510 | 364.145 +/- 0.933 | original, disabled |
| dense-latin-miss-span63 | {"length":"62","needleLength":"257","shape":"DENSE_MISS_LATIN1"} | 35.711 +/- 1.652 | 10.557 +/- 0.477 | 36.663 +/- 1.860 | - |
| dense-latin-end-span63 | {"length":"62","needleLength":"257","shape":"DENSE_END_LATIN1"} | 67.818 +/- 3.607 | 17.421 +/- 1.009 | 68.576 +/- 3.415 | - |
| dense-latin-miss-span64 | {"length":"63","needleLength":"257","shape":"DENSE_MISS_LATIN1"} | 36.263 +/- 2.163 | 7.811 +/- 0.485 | 35.425 +/- 1.709 | - |
| dense-latin-end-span64 | {"length":"63","needleLength":"257","shape":"DENSE_END_LATIN1"} | 67.547 +/- 3.954 | 14.132 +/- 0.895 | 68.124 +/- 3.659 | - |
| dense-latin-miss-span65 | {"length":"64","needleLength":"257","shape":"DENSE_MISS_LATIN1"} | 36.455 +/- 1.856 | 7.791 +/- 0.387 | 35.818 +/- 1.787 | - |
| dense-latin-end-span65 | {"length":"64","needleLength":"257","shape":"DENSE_END_LATIN1"} | 68.081 +/- 3.437 | 14.473 +/- 1.063 | 68.862 +/- 4.804 | - |
| dense-latin-bulk-end-257 | {"length":"3838","needleLength":"257","shape":"DENSE_END_LATIN1"} | 70.001 +/- 4.748 | 15.766 +/- 1.133 | 68.938 +/- 5.048 | - |
| dense-latin-bulk-end-511 | {"length":"3584","needleLength":"511","shape":"DENSE_END_LATIN1"} | 130.263 +/- 9.926 | 20.378 +/- 1.459 | 129.959 +/- 9.600 | - |
| latin-prefix-miss-575-511 | {"length":"575","needleLength":"511","shape":"LATIN_PREFIX_MISS"} | 4648.030 +/- 323.516 | 312.194 +/- 23.240 | 4705.384 +/- 276.196 | - |
| utf16-prefix-miss-303-256 | {"length":"303","needleLength":"256","shape":"UTF16_PREFIX_MISS"} | 1880.901 +/- 136.013 | 312.310 +/- 20.592 | 1549.141 +/- 107.714 | - |
| utf16-uniform-end-129-129 | {"length":"129","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 51.450 +/- 4.071 | 11.201 +/- 0.710 | 35.644 +/- 2.937 | - |
| utf16-uniform-end-130-129 | {"length":"130","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 42.842 +/- 13.293 | 11.827 +/- 0.979 | 35.852 +/- 2.628 | - |
| latin-end-32 | {"coder":"LATIN1","length":"4096","needleLength":"32","position":"END"} | 15.416 +/- 1.165 | 15.370 +/- 1.133 | 15.482 +/- 1.440 | - |
| latin-end-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"END"} | 24.201 +/- 2.252 | 15.329 +/- 1.207 | 23.724 +/- 1.800 | - |
| latin-miss-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"MISS"} | 674.989 +/- 53.424 | 140.322 +/- 13.037 | 678.888 +/- 63.086 | - |
| utf16-end-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"END"} | 25.288 +/- 6.633 | 16.548 +/- 1.511 | 20.698 +/- 1.812 | - |
| utf16-miss-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"MISS"} | 686.691 +/- 74.747 | 290.542 +/- 25.129 | 675.976 +/- 60.668 | - |
| latin-period2-miss-4096-512 | {"length":"4096","needleLength":"512","shape":"LATIN_PERIOD2_MISS"} | 4803.875 +/- 418.941 | 147.650 +/- 13.974 | 5049.746 +/- 501.915 | - |
| latin-period3-miss-4095-513 | {"length":"4095","needleLength":"513","shape":"LATIN_PERIOD3_MISS"} | 6045.547 +/- 830.161 | 125.262 +/- 11.069 | 6450.892 +/- 538.850 | - |
| utf16-period2-miss-2048-256 | {"length":"2048","needleLength":"256","shape":"UTF16_PERIOD2_MISS"} | 2096.038 +/- 158.248 | 6696.560 +/- 535.841 | 1573.378 +/- 136.852 | original!, disabled! |
| utf16-period3-miss-2047-257 | {"length":"2047","needleLength":"257","shape":"UTF16_PERIOD3_MISS"} | 2299.293 +/- 271.908 | 4931.274 +/- 643.763 | 1988.847 +/- 163.780 | original!, disabled! |
| simd-char-reverse-utf16-129 | {"coder":"UTF16","length":"129","needleLength":"4","position":"MISS"} | 25.597 +/- 1.935 | 18.825 +/- 1.665 | 28.322 +/- 2.156 | - |
| simd-char-reverse-utf16-255 | {"coder":"UTF16","length":"255","needleLength":"4","position":"MISS"} | 46.670 +/- 3.522 | 26.201 +/- 2.363 | 49.426 +/- 4.448 | - |
| simd-char-reverse-utf16-256 | {"coder":"UTF16","length":"256","needleLength":"4","position":"MISS"} | 47.916 +/- 3.775 | 23.958 +/- 1.985 | 49.868 +/- 3.836 | - |
| simd-char-reverse-utf16-257 | {"coder":"UTF16","length":"257","needleLength":"4","position":"MISS"} | 47.508 +/- 4.353 | 24.613 +/- 1.921 | 48.602 +/- 3.819 | - |
| char-forward-latin-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 10.130 +/- 0.891 | 10.033 +/- 0.850 | 10.211 +/- 0.958 | - |

Compilation diagnostics describe their named representative fixtures and are separate from timing evidence. Raw per-fork measurements and image, source, compiler and backend provenance are retained in the accompanying JSON and workflow artifact.
