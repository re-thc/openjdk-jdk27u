# MSVC c1 matched complete-image results

Source: `4592230b14fc2f4b537b162fd7f6b791e882b615`. Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`. Strict collection passed 120 triplets / 360 records / 57 main compilation diagnostics. JMH uses two forks, three 500 ms warmup iterations and five 500 ms measurement iterations; errors are the reported 99.9% intervals.

Enabled has 30 higher means versus original and 26 versus disabled. 4 rows have nonoverlapping intervals against both controls; 0 additional rows have nonoverlapping intervals only against original. Every higher mean remains below. A ! marks nonoverlapping intervals.

| Case | Parameters | Original ns/op | Enabled ns/op | Disabled ns/op | Higher enabled mean |
|---|---|---:|---:|---:|---|
| tiny-latin | {"coder":"LATIN1","length":"4","needleLength":"4","position":"MISS"} | 3.998 +/- 0.169 | 4.526 +/- 0.143 | 4.147 +/- 0.117 | original!, disabled! |
| tiny-utf16 | {"coder":"UTF16","length":"4","needleLength":"4","position":"MISS"} | 4.200 +/- 0.248 | 4.080 +/- 0.156 | 3.736 +/- 0.053 | disabled! |
| threshold-latin1-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 137.543 +/- 5.676 | 113.711 +/- 3.540 | 113.001 +/- 3.371 | disabled |
| threshold-latin1-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 141.587 +/- 4.956 | 94.407 +/- 2.524 | 116.110 +/- 4.535 | - |
| threshold-utf16-127 | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 83.273 +/- 13.508 | 64.794 +/- 3.649 | 62.600 +/- 3.093 | disabled |
| threshold-utf16-128 | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 86.270 +/- 16.706 | 61.381 +/- 2.736 | 62.317 +/- 3.384 | - |
| immediate-utf16 | {"coder":"UTF16","length":"128","needleLength":"4","position":"END"} | 5.970 +/- 0.211 | 6.245 +/- 0.253 | 6.443 +/- 0.268 | original |
| immediate-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 7.374 +/- 0.282 | 6.251 +/- 0.198 | 7.860 +/- 0.488 | - |
| mixed-end-9 | {"coder":"MIXED","length":"4096","needleLength":"9","position":"END"} | 9.835 +/- 0.268 | 9.996 +/- 0.438 | 9.367 +/- 0.319 | original, disabled |
| mixed-end-63 | {"coder":"MIXED","length":"4096","needleLength":"63","position":"END"} | 37.331 +/- 0.939 | 38.003 +/- 1.868 | 39.187 +/- 11.474 | original |
| mixed-end-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"END"} | 40.654 +/- 2.726 | 28.304 +/- 0.852 | 38.795 +/- 1.709 | - |
| mixed-end-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"END"} | 39.480 +/- 0.836 | 28.859 +/- 1.097 | 38.474 +/- 1.199 | - |
| mixed-miss-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 1985.608 +/- 91.230 | 416.875 +/- 46.580 | 1941.263 +/- 128.269 | - |
| mixed-miss-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 2101.620 +/- 140.089 | 1392.686 +/- 180.016 | 1936.200 +/- 122.922 | - |
| equal-latin1-32 | {"coder":"LATIN1","length":"32","needleLength":"4","position":"EQUAL"} | 20.115 +/- 1.468 | 8.466 +/- 0.424 | 18.460 +/- 0.507 | - |
| equal-latin1-4096 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"EQUAL"} | 1819.485 +/- 102.657 | 140.622 +/- 5.605 | 1970.951 +/- 335.410 | - |
| equal-utf16-32 | {"coder":"UTF16","length":"32","needleLength":"4","position":"EQUAL"} | 33.287 +/- 2.406 | 9.173 +/- 0.279 | 31.963 +/- 1.327 | - |
| equal-utf16-4096 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"EQUAL"} | 3635.592 +/- 130.396 | 263.127 +/- 10.879 | 3637.301 +/- 116.930 | - |
| overlap-min-latin | {"length":"0","needleLength":"257","shape":"OVERLAP_LATIN1"} | 627.959 +/- 33.629 | 344.182 +/- 9.919 | 339.332 +/- 13.846 | disabled |
| overlap-min-utf16 | {"length":"0","needleLength":"129","shape":"OVERLAP"} | 154.001 +/- 10.139 | 25.317 +/- 0.776 | 253.543 +/- 8.339 | - |
| bulk-latin1 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 1990.512 +/- 29.243 | 1336.001 +/- 31.057 | 1692.969 +/- 47.892 | - |
| bulk-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 1958.031 +/- 85.945 | 1365.198 +/- 56.252 | 1498.262 +/- 74.522 | - |
| long-utf16-64-512 | {"length":"512","needleLength":"64","shape":"NEAR_END"} | 679.705 +/- 29.407 | 452.932 +/- 26.521 | 461.562 +/- 8.914 | - |
| long-utf16-64-4096 | {"length":"4096","needleLength":"64","shape":"NEAR_END"} | 7092.977 +/- 5515.009 | 3207.682 +/- 93.615 | 3991.776 +/- 142.827 | - |
| mixed-probe-end-31 | {"coder":"MIXED","length":"4096","needleLength":"31","position":"END"} | 22.063 +/- 0.275 | 22.286 +/- 0.737 | 21.794 +/- 0.866 | original, disabled |
| mixed-probe-end-32 | {"coder":"MIXED","length":"4096","needleLength":"32","position":"END"} | 23.762 +/- 3.135 | 22.986 +/- 1.041 | 22.332 +/- 0.768 | disabled |
| mixed-probe-end-33 | {"coder":"MIXED","length":"4096","needleLength":"33","position":"END"} | 23.207 +/- 0.992 | 23.446 +/- 1.979 | 24.268 +/- 3.225 | original |
| long-overlap-latin-512 | {"length":"254","needleLength":"257","shape":"OVERLAP_LATIN1"} | 82547.437 +/- 4881.617 | 38.938 +/- 1.607 | 46304.106 +/- 2946.861 | - |
| long-overlap-utf16-512 | {"length":"382","needleLength":"129","shape":"OVERLAP"} | 28376.943 +/- 857.723 | 75.899 +/- 2.556 | 46641.900 +/- 1611.034 | - |
| long-overlap-latin-4096 | {"length":"3838","needleLength":"257","shape":"OVERLAP_LATIN1"} | 1271494.377 +/- 116961.772 | 294.088 +/- 6.621 | 667752.928 +/- 20497.224 | - |
| long-overlap-utf16-4096 | {"length":"3966","needleLength":"129","shape":"OVERLAP"} | 298299.761 +/- 11823.705 | 568.272 +/- 17.042 | 488531.889 +/- 49040.716 | - |
| threshold-utf16-511 | {"coder":"UTF16","length":"511","needleLength":"4","position":"MISS"} | 267.661 +/- 11.480 | 194.548 +/- 7.386 | 202.529 +/- 8.350 | - |
| threshold-utf16-512 | {"coder":"UTF16","length":"512","needleLength":"4","position":"MISS"} | 283.772 +/- 46.046 | 192.957 +/- 9.345 | 204.948 +/- 13.316 | - |
| msvc-bulk-utf16-8 | {"coder":"UTF16","length":"4096","needleLength":"8","position":"MISS"} | 2020.112 +/- 81.626 | 1461.966 +/- 175.317 | 1533.742 +/- 57.642 | - |
| msvc-bulk-utf16-9 | {"coder":"UTF16","length":"4096","needleLength":"9","position":"MISS"} | 2060.082 +/- 94.580 | 1380.104 +/- 37.301 | 1689.550 +/- 422.076 | - |
| msvc-bulk-utf16-16 | {"coder":"UTF16","length":"4096","needleLength":"16","position":"MISS"} | 2068.147 +/- 125.464 | 1385.167 +/- 37.830 | 1523.914 +/- 69.326 | - |
| msvc-bulk-utf16-32 | {"coder":"UTF16","length":"4096","needleLength":"32","position":"MISS"} | 1990.052 +/- 230.702 | 1383.513 +/- 46.377 | 1480.970 +/- 77.226 | - |
| msvc-bulk-utf16-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"MISS"} | 2008.212 +/- 272.510 | 1348.939 +/- 118.388 | 1519.227 +/- 60.264 | - |
| msvc-threshold-utf16-8 | {"coder":"UTF16","length":"128","needleLength":"8","position":"MISS"} | 75.832 +/- 2.322 | 57.785 +/- 1.327 | 59.755 +/- 2.449 | - |
| msvc-threshold-utf16-9 | {"coder":"UTF16","length":"128","needleLength":"9","position":"MISS"} | 85.199 +/- 23.122 | 60.425 +/- 2.059 | 62.450 +/- 15.884 | - |
| immediate-utf16-126 | {"coder":"UTF16","length":"126","needleLength":"4","position":"END"} | 6.244 +/- 0.484 | 6.023 +/- 0.122 | 6.905 +/- 0.320 | - |
| immediate-utf16-127 | {"coder":"UTF16","length":"127","needleLength":"4","position":"END"} | 5.955 +/- 0.243 | 6.264 +/- 1.445 | 6.702 +/- 1.679 | original |
| short-latin-c1-31-end | {"coder":"LATIN1","length":"31","needleLength":"4","position":"END"} | 8.259 +/- 0.222 | 8.227 +/- 0.551 | 8.398 +/- 0.621 | - |
| short-latin-c1-31-miss | {"coder":"LATIN1","length":"31","needleLength":"4","position":"MISS"} | 17.847 +/- 1.106 | 17.862 +/- 0.620 | 19.279 +/- 0.939 | original |
| short-latin-c1-32-end | {"coder":"LATIN1","length":"32","needleLength":"4","position":"END"} | 43.509 +/- 86.552 | 7.139 +/- 1.620 | 7.818 +/- 0.163 | - |
| short-latin-c1-32-miss | {"coder":"LATIN1","length":"32","needleLength":"4","position":"MISS"} | 18.644 +/- 1.658 | 17.882 +/- 0.612 | 22.669 +/- 16.760 | - |
| short-latin-c1-33-end | {"coder":"LATIN1","length":"33","needleLength":"4","position":"END"} | 7.461 +/- 0.282 | 6.231 +/- 0.360 | 7.906 +/- 0.332 | - |
| short-latin-c1-33-miss | {"coder":"LATIN1","length":"33","needleLength":"4","position":"MISS"} | 17.995 +/- 0.922 | 17.822 +/- 0.517 | 17.694 +/- 0.657 | disabled |
| msvc-mixed-c1-62-miss | {"coder":"MIXED","length":"4096","needleLength":"62","position":"MISS"} | 1947.574 +/- 84.495 | 390.367 +/- 14.830 | 1969.745 +/- 102.163 | - |
| msvc-mixed-c1-63-miss | {"coder":"MIXED","length":"4096","needleLength":"63","position":"MISS"} | 1902.392 +/- 67.046 | 396.829 +/- 19.439 | 1944.714 +/- 68.387 | - |
| msvc-mixed-c1-62-end | {"coder":"MIXED","length":"4096","needleLength":"62","position":"END"} | 38.091 +/- 1.630 | 38.575 +/- 0.838 | 36.924 +/- 1.292 | original, disabled |
| msvc-utf16-end-128-9 | {"coder":"UTF16","length":"128","needleLength":"9","position":"END"} | 8.861 +/- 0.268 | 8.918 +/- 0.350 | 9.616 +/- 0.467 | original |
| msvc-utf16-end-4096-9 | {"coder":"UTF16","length":"4096","needleLength":"9","position":"END"} | 9.135 +/- 0.460 | 9.022 +/- 0.287 | 9.700 +/- 0.423 | - |
| msvc-utf16-end-128-16 | {"coder":"UTF16","length":"128","needleLength":"16","position":"END"} | 11.676 +/- 0.365 | 12.001 +/- 0.328 | 16.299 +/- 0.978 | original |
| msvc-utf16-end-4096-16 | {"coder":"UTF16","length":"4096","needleLength":"16","position":"END"} | 12.315 +/- 0.528 | 12.065 +/- 0.212 | 17.160 +/- 0.730 | - |
| msvc-utf16-end-128-32 | {"coder":"UTF16","length":"128","needleLength":"32","position":"END"} | 20.029 +/- 0.799 | 20.269 +/- 0.864 | 32.174 +/- 1.019 | original |
| msvc-utf16-end-4096-32 | {"coder":"UTF16","length":"4096","needleLength":"32","position":"END"} | 19.766 +/- 0.830 | 19.697 +/- 1.141 | 32.005 +/- 1.979 | - |
| msvc-utf16-end-128-64 | {"coder":"UTF16","length":"128","needleLength":"64","position":"END"} | 35.144 +/- 1.500 | 36.249 +/- 1.810 | 64.167 +/- 2.365 | original |
| msvc-utf16-end-4096-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"END"} | 35.499 +/- 1.602 | 35.391 +/- 1.153 | 63.778 +/- 2.405 | - |
| msvc-dense-utf16-512-4 | {"length":"512","needleLength":"4","shape":"NEAR_END"} | 729.601 +/- 73.858 | 457.825 +/- 11.328 | 508.068 +/- 18.811 | - |
| msvc-dense-utf16-4096-4 | {"length":"4096","needleLength":"4","shape":"NEAR_END"} | 5811.644 +/- 355.726 | 3223.223 +/- 123.304 | 3916.820 +/- 233.966 | - |
| msvc-dense-utf16-512-8 | {"length":"512","needleLength":"8","shape":"NEAR_END"} | 718.198 +/- 84.130 | 435.374 +/- 14.016 | 479.886 +/- 15.280 | - |
| msvc-dense-utf16-4096-8 | {"length":"4096","needleLength":"8","shape":"NEAR_END"} | 5595.786 +/- 265.807 | 3091.494 +/- 160.813 | 3754.888 +/- 127.478 | - |
| msvc-dense-utf16-512-9 | {"length":"512","needleLength":"9","shape":"NEAR_END"} | 693.991 +/- 61.777 | 438.191 +/- 21.088 | 493.017 +/- 22.401 | - |
| msvc-dense-utf16-4096-9 | {"length":"4096","needleLength":"9","shape":"NEAR_END"} | 5597.058 +/- 251.574 | 3027.386 +/- 98.925 | 3910.435 +/- 297.812 | - |
| msvc-dense-utf16-512-32 | {"length":"512","needleLength":"32","shape":"NEAR_END"} | 689.497 +/- 55.515 | 442.153 +/- 17.821 | 463.010 +/- 13.617 | - |
| msvc-dense-utf16-4096-32 | {"length":"4096","needleLength":"32","shape":"NEAR_END"} | 5516.890 +/- 386.130 | 3103.119 +/- 179.995 | 3851.258 +/- 216.828 | - |
| msvc-utf16-boundary-127-end | {"coder":"UTF16","length":"4096","needleLength":"127","position":"END"} | 62.235 +/- 1.834 | 62.338 +/- 1.411 | 116.558 +/- 2.873 | original |
| msvc-utf16-boundary-127-miss | {"coder":"UTF16","length":"4096","needleLength":"127","position":"MISS"} | 1874.007 +/- 70.191 | 1303.572 +/- 67.674 | 1430.799 +/- 65.327 | - |
| msvc-utf16-boundary-128-end | {"coder":"UTF16","length":"4096","needleLength":"128","position":"END"} | 63.892 +/- 2.338 | 64.007 +/- 2.931 | 118.748 +/- 4.169 | original |
| msvc-utf16-boundary-128-miss | {"coder":"UTF16","length":"4096","needleLength":"128","position":"MISS"} | 1926.367 +/- 63.484 | 1303.103 +/- 51.252 | 1460.652 +/- 64.389 | - |
| msvc-utf16-boundary-129-end | {"coder":"UTF16","length":"4096","needleLength":"129","position":"END"} | 63.763 +/- 3.430 | 20.230 +/- 1.189 | 124.044 +/- 7.406 | - |
| msvc-utf16-boundary-129-miss | {"coder":"UTF16","length":"4096","needleLength":"129","position":"MISS"} | 1888.997 +/- 82.643 | 571.634 +/- 36.999 | 1419.317 +/- 67.250 | - |
| supp-forward-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 106.039 +/- 19.561 | 91.154 +/- 3.831 | 105.592 +/- 4.250 | - |
| supp-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 1367.008 +/- 61.132 | 1176.252 +/- 45.738 | 1414.242 +/- 102.527 | - |
| supp-forward-latin-early | {"coder":"LATIN1","length":"256","needleLength":"4","position":"START"} | 6.056 +/- 0.393 | 5.179 +/- 0.418 | 5.015 +/- 0.193 | disabled |
| supp-forward-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 38.797 +/- 1.353 | 39.046 +/- 2.372 | 38.437 +/- 1.211 | original, disabled |
| supp-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 1083.048 +/- 69.657 | 1167.497 +/- 49.534 | 1089.019 +/- 53.176 | original, disabled |
| supp-forward-utf16-early | {"coder":"UTF16","length":"128","needleLength":"4","position":"START"} | 4.993 +/- 0.301 | 4.477 +/- 0.256 | 4.511 +/- 0.132 | - |
| supp-forward-mixed-at | {"coder":"MIXED","length":"128","needleLength":"4","position":"MISS"} | 37.690 +/- 0.988 | 37.790 +/- 1.639 | 36.594 +/- 1.618 | original, disabled |
| supp-forward-mixed-bulk | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 1083.186 +/- 42.729 | 1076.318 +/- 13.020 | 1084.505 +/- 36.908 | - |
| supp-forward-mixed-early | {"coder":"MIXED","length":"128","needleLength":"4","position":"START"} | 5.729 +/- 0.410 | 4.936 +/- 0.182 | 4.768 +/- 0.162 | disabled |
| supp-forward-mixed-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 1078.508 +/- 41.577 | 391.961 +/- 2.508 | 1090.630 +/- 38.336 | - |
| supp-forward-mixed-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 1083.866 +/- 35.964 | 1114.076 +/- 49.129 | 1147.368 +/- 69.995 | original |
| char-forward-latin-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 110.776 +/- 3.160 | 94.669 +/- 3.631 | 103.081 +/- 3.966 | - |
| char-forward-latin-257 | {"coder":"LATIN1","length":"257","needleLength":"4","position":"MISS"} | 111.250 +/- 5.531 | 30.294 +/- 1.139 | 109.380 +/- 4.167 | - |
| supp-char-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 1534.980 +/- 104.643 | 318.241 +/- 14.906 | 1325.114 +/- 71.572 | - |
| supp-char-reverse-latin-below | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 106.247 +/- 7.269 | 106.908 +/- 7.774 | 115.450 +/- 28.521 | original |
| supp-char-reverse-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 105.328 +/- 5.225 | 31.264 +/- 1.034 | 113.195 +/- 13.497 | - |
| supp-char-reverse-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 1358.229 +/- 38.999 | 276.312 +/- 12.044 | 1407.379 +/- 69.881 | - |
| supp-char-reverse-latin-early | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 4.980 +/- 0.290 | 4.915 +/- 0.194 | 4.926 +/- 0.200 | - |
| supp-char-forward-utf16-below | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 38.827 +/- 1.816 | 36.418 +/- 1.330 | 36.999 +/- 1.662 | - |
| supp-char-forward-utf16-at | {"coder":"UTF16","length":"129","needleLength":"4","position":"MISS"} | 40.903 +/- 2.049 | 37.580 +/- 1.939 | 36.537 +/- 1.165 | disabled |
| supp-char-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 1254.890 +/- 48.124 | 1386.476 +/- 35.654 | 1150.757 +/- 51.762 | original!, disabled! |
| supp-char-reverse-utf16-below | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 42.134 +/- 1.541 | 45.542 +/- 2.636 | 43.197 +/- 2.416 | original, disabled |
| supp-char-reverse-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 45.829 +/- 2.176 | 44.728 +/- 3.024 | 44.025 +/- 2.895 | disabled |
| supp-char-reverse-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 1178.917 +/- 48.068 | 1452.978 +/- 55.614 | 1172.536 +/- 81.849 | original!, disabled! |
| supp-char-reverse-utf16-early | {"coder":"UTF16","length":"4096","needleLength":"4","position":"END"} | 4.539 +/- 0.257 | 4.577 +/- 0.211 | 4.786 +/- 0.720 | original |
| supp-builder-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 1359.650 +/- 48.069 | 1185.919 +/- 46.293 | 1468.307 +/- 120.323 | - |
| supp-builder-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 1048.643 +/- 49.827 | 1074.686 +/- 98.467 | 1030.657 +/- 33.431 | original, disabled |
| supp-builder-mixed | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 1046.949 +/- 52.046 | 1042.129 +/- 35.388 | 1031.151 +/- 34.648 | disabled |
| supp-buffer-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 1343.894 +/- 41.435 | 1156.218 +/- 36.719 | 1397.370 +/- 116.904 | - |
| latin-prefix-miss-575-511 | {"length":"575","needleLength":"511","shape":"LATIN_PREFIX_MISS"} | 15688.262 +/- 810.183 | 148.123 +/- 6.246 | 11388.558 +/- 1838.033 | - |
| utf16-prefix-miss-303-256 | {"length":"303","needleLength":"256","shape":"UTF16_PREFIX_MISS"} | 3213.512 +/- 138.641 | 158.765 +/- 5.712 | 5982.786 +/- 351.413 | - |
| utf16-uniform-end-129-129 | {"length":"129","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 63.348 +/- 3.701 | 20.277 +/- 0.499 | 121.157 +/- 4.987 | - |
| utf16-uniform-end-130-129 | {"length":"130","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 63.209 +/- 1.290 | 21.629 +/- 0.724 | 123.610 +/- 5.449 | - |
| latin-end-32 | {"coder":"LATIN1","length":"4096","needleLength":"32","position":"END"} | 30.489 +/- 1.112 | 10.555 +/- 0.436 | 26.042 +/- 1.783 | - |
| latin-end-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"END"} | 62.111 +/- 3.896 | 11.791 +/- 0.702 | 45.181 +/- 2.758 | - |
| latin-miss-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"MISS"} | 1964.299 +/- 71.399 | 335.255 +/- 18.136 | 1694.432 +/- 64.057 | - |
| latin-period2-miss-4096-512 | {"length":"4096","needleLength":"512","shape":"LATIN_PERIOD2_MISS"} | 5261.063 +/- 299.079 | 503.655 +/- 31.931 | 3995.398 +/- 212.367 | - |
| latin-period3-miss-4095-513 | {"length":"4095","needleLength":"513","shape":"LATIN_PERIOD3_MISS"} | 5202.430 +/- 272.458 | 744.836 +/- 56.456 | 3791.186 +/- 124.955 | - |
| utf16-period2-miss-2048-256 | {"length":"2048","needleLength":"256","shape":"UTF16_PERIOD2_MISS"} | 1944.777 +/- 155.364 | 517.596 +/- 32.693 | 1678.453 +/- 53.814 | - |
| utf16-period3-miss-2047-257 | {"length":"2047","needleLength":"257","shape":"UTF16_PERIOD3_MISS"} | 2175.435 +/- 228.123 | 594.801 +/- 12.982 | 1997.199 +/- 83.298 | - |
| msvc-char-forward-utf16-256 | {"coder":"UTF16","length":"256","needleLength":"4","position":"MISS"} | 95.090 +/- 5.596 | 75.926 +/- 4.183 | 88.828 +/- 4.308 | - |
| msvc-char-forward-utf16-257 | {"coder":"UTF16","length":"257","needleLength":"4","position":"MISS"} | 98.989 +/- 4.292 | 103.195 +/- 4.810 | 93.339 +/- 4.552 | original, disabled! |
| msvc-char-forward-utf16-258 | {"coder":"UTF16","length":"258","needleLength":"4","position":"MISS"} | 95.700 +/- 3.660 | 96.660 +/- 5.444 | 89.310 +/- 6.764 | original, disabled |
| msvc-char-reverse-utf16-255 | {"coder":"UTF16","length":"255","needleLength":"4","position":"MISS"} | 87.226 +/- 3.946 | 89.553 +/- 3.476 | 89.862 +/- 5.269 | original |
| msvc-char-reverse-utf16-256 | {"coder":"UTF16","length":"256","needleLength":"4","position":"MISS"} | 86.338 +/- 2.661 | 98.945 +/- 3.318 | 89.336 +/- 4.356 | original!, disabled! |
| msvc-char-reverse-utf16-257 | {"coder":"UTF16","length":"257","needleLength":"4","position":"MISS"} | 95.365 +/- 14.363 | 104.220 +/- 10.873 | 88.745 +/- 3.792 | original, disabled! |
| char-forward-latin-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 112.318 +/- 7.328 | 93.395 +/- 7.736 | 105.761 +/- 26.802 | - |

Compilation diagnostics describe their named representative fixtures and are separate from timing evidence. Raw per-fork measurements and image, source, compiler and backend provenance are retained in the accompanying JSON and workflow artifact.
