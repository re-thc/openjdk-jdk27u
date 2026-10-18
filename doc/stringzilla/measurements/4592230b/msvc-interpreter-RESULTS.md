# MSVC interpreter matched complete-image results

Source: `4592230b14fc2f4b537b162fd7f6b791e882b615`. Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`. Strict collection passed 94 triplets / 282 records / 57 main compilation diagnostics. JMH uses two forks, three 500 ms warmup iterations and five 500 ms measurement iterations; errors are the reported 99.9% intervals.

Enabled has 7 higher means versus original and 9 versus disabled. 0 rows have nonoverlapping intervals against both controls; 0 additional rows have nonoverlapping intervals only against original. Every higher mean remains below. A ! marks nonoverlapping intervals.

| Case | Parameters | Original ns/op | Enabled ns/op | Disabled ns/op | Higher enabled mean |
|---|---|---:|---:|---:|---|
| tiny-latin | {"coder":"LATIN1","length":"4","needleLength":"4","position":"MISS"} | 286.474 +/- 15.033 | 269.047 +/- 24.341 | 289.576 +/- 21.773 | - |
| tiny-utf16 | {"coder":"UTF16","length":"4","needleLength":"4","position":"MISS"} | 448.093 +/- 25.420 | 469.235 +/- 34.950 | 465.556 +/- 39.214 | original, disabled |
| lower-latin1-31-miss | {"coder":"LATIN1","length":"31","needleLength":"4","position":"MISS"} | 654.833 +/- 43.600 | 633.507 +/- 57.793 | 622.248 +/- 83.713 | disabled |
| lower-latin1-31-end | {"coder":"LATIN1","length":"31","needleLength":"4","position":"END"} | 347.365 +/- 35.275 | 346.639 +/- 16.677 | 343.335 +/- 32.333 | disabled |
| lower-latin1-32-miss | {"coder":"LATIN1","length":"32","needleLength":"4","position":"MISS"} | 638.525 +/- 64.590 | 344.874 +/- 16.926 | 676.888 +/- 68.349 | - |
| lower-latin1-32-end | {"coder":"LATIN1","length":"32","needleLength":"4","position":"END"} | 340.581 +/- 12.011 | 317.814 +/- 20.066 | 374.219 +/- 23.458 | - |
| lower-latin1-33-miss | {"coder":"LATIN1","length":"33","needleLength":"4","position":"MISS"} | 663.827 +/- 52.505 | 355.594 +/- 18.170 | 661.787 +/- 73.333 | - |
| lower-latin1-33-end | {"coder":"LATIN1","length":"33","needleLength":"4","position":"END"} | 374.239 +/- 117.930 | 294.183 +/- 18.052 | 374.223 +/- 22.590 | - |
| lower-utf16-15-miss | {"coder":"UTF16","length":"15","needleLength":"4","position":"MISS"} | 948.488 +/- 83.506 | 944.964 +/- 87.213 | 958.185 +/- 285.104 | - |
| lower-utf16-15-end | {"coder":"UTF16","length":"15","needleLength":"4","position":"END"} | 746.610 +/- 54.831 | 705.553 +/- 60.594 | 740.584 +/- 45.222 | - |
| lower-utf16-16-miss | {"coder":"UTF16","length":"16","needleLength":"4","position":"MISS"} | 1016.183 +/- 77.394 | 561.656 +/- 24.916 | 1211.522 +/- 83.022 | - |
| lower-utf16-16-end | {"coder":"UTF16","length":"16","needleLength":"4","position":"END"} | 744.625 +/- 80.829 | 445.246 +/- 32.555 | 928.925 +/- 64.300 | - |
| lower-utf16-17-miss | {"coder":"UTF16","length":"17","needleLength":"4","position":"MISS"} | 1046.286 +/- 127.505 | 567.326 +/- 26.430 | 1266.704 +/- 218.417 | - |
| lower-utf16-17-end | {"coder":"UTF16","length":"17","needleLength":"4","position":"END"} | 712.747 +/- 44.337 | 431.466 +/- 21.783 | 919.166 +/- 36.766 | - |
| threshold-latin1-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 3339.551 +/- 477.626 | 466.653 +/- 46.022 | 3534.680 +/- 744.593 | - |
| threshold-latin1-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 3389.858 +/- 839.045 | 439.026 +/- 13.494 | 3727.728 +/- 714.226 | - |
| threshold-utf16-127 | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 6459.287 +/- 278.688 | 675.168 +/- 38.648 | 6577.711 +/- 872.466 | - |
| threshold-utf16-128 | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 6505.496 +/- 618.875 | 677.716 +/- 19.418 | 6014.442 +/- 1196.395 | - |
| immediate-utf16 | {"coder":"UTF16","length":"128","needleLength":"4","position":"END"} | 772.271 +/- 19.166 | 408.812 +/- 20.230 | 963.618 +/- 29.051 | - |
| immediate-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 341.346 +/- 32.957 | 318.187 +/- 18.546 | 373.590 +/- 15.244 | - |
| mixed-miss-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 194061.456 +/- 14211.140 | 932.210 +/- 20.802 | 199523.456 +/- 29399.111 | - |
| mixed-miss-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 174816.104 +/- 26088.626 | 2232.270 +/- 100.626 | 192375.614 +/- 11885.039 | - |
| equal-latin1-32 | {"coder":"LATIN1","length":"32","needleLength":"4","position":"EQUAL"} | 666.502 +/- 43.272 | 130.696 +/- 8.029 | 711.783 +/- 78.644 | - |
| equal-latin1-4096 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"EQUAL"} | 57422.951 +/- 8283.695 | 351.082 +/- 15.110 | 70193.700 +/- 11152.933 | - |
| equal-utf16-32 | {"coder":"UTF16","length":"32","needleLength":"4","position":"EQUAL"} | 1210.500 +/- 91.634 | 137.634 +/- 32.814 | 1327.513 +/- 210.944 | - |
| equal-utf16-4096 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"EQUAL"} | 128368.699 +/- 22727.481 | 620.131 +/- 10.903 | 138019.841 +/- 23604.587 | - |
| overlap-min-latin | {"length":"0","needleLength":"257","shape":"OVERLAP_LATIN1"} | 8053.745 +/- 1582.191 | 385.594 +/- 11.076 | 11631.859 +/- 1100.530 | - |
| overlap-min-utf16 | {"length":"0","needleLength":"129","shape":"OVERLAP"} | 22642.715 +/- 1982.696 | 531.307 +/- 38.864 | 23151.938 +/- 3759.344 | - |
| bulk-latin1 | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 52743.865 +/- 14814.512 | 2144.834 +/- 41.617 | 54259.126 +/- 8498.437 | - |
| bulk-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 195450.104 +/- 23492.841 | 4877.212 +/- 171.947 | 193741.306 +/- 25371.315 | - |
| long-utf16-64-512 | {"length":"512","needleLength":"64","shape":"NEAR_END"} | 72677.994 +/- 5772.626 | 1047.094 +/- 37.770 | 71010.491 +/- 9635.730 | - |
| long-utf16-64-4096 | {"length":"4096","needleLength":"64","shape":"NEAR_END"} | 621948.689 +/- 64725.405 | 5299.793 +/- 543.904 | 620900.569 +/- 73636.372 | - |
| short-forward-latin1 | {"coder":"LATIN1","length":"32","needleLength":"4","position":"MISS"} | 531.881 +/- 69.992 | 197.613 +/- 21.232 | 577.241 +/- 62.080 | - |
| short-forward-utf16 | {"coder":"UTF16","length":"32","needleLength":"4","position":"MISS"} | 1685.088 +/- 184.548 | 215.453 +/- 31.550 | 1794.165 +/- 81.184 | - |
| short-forward-mixed | {"coder":"MIXED","length":"32","needleLength":"4","position":"MISS"} | 1659.923 +/- 168.151 | 200.079 +/- 23.714 | 1725.872 +/- 123.102 | - |
| lower-mixed-15 | {"coder":"MIXED","length":"15","needleLength":"4","position":"MISS"} | 907.423 +/- 64.566 | 942.376 +/- 85.072 | 917.271 +/- 49.144 | original, disabled |
| lower-mixed-16 | {"coder":"MIXED","length":"16","needleLength":"4","position":"MISS"} | 920.354 +/- 62.793 | 496.674 +/- 25.020 | 922.949 +/- 75.210 | - |
| lower-mixed-17 | {"coder":"MIXED","length":"17","needleLength":"4","position":"MISS"} | 1028.930 +/- 229.743 | 466.524 +/- 27.230 | 955.222 +/- 61.499 | - |
| mixed-fallback-127-miss | {"coder":"MIXED","length":"127","needleLength":"65","position":"MISS"} | 3275.070 +/- 305.698 | 480.035 +/- 65.640 | 3143.026 +/- 138.941 | - |
| mixed-fallback-127-end | {"coder":"MIXED","length":"127","needleLength":"65","position":"END"} | 3988.631 +/- 492.810 | 491.591 +/- 34.628 | 3981.104 +/- 504.432 | - |
| mixed-fallback-128-miss | {"coder":"MIXED","length":"128","needleLength":"65","position":"MISS"} | 3454.935 +/- 216.695 | 476.253 +/- 17.300 | 3342.793 +/- 344.074 | - |
| mixed-fallback-128-end | {"coder":"MIXED","length":"128","needleLength":"65","position":"END"} | 3674.826 +/- 404.071 | 523.005 +/- 128.913 | 3467.291 +/- 417.571 | - |
| mixed-prefix-end-128 | {"coder":"MIXED","length":"4096","needleLength":"128","position":"END"} | 6631.553 +/- 2145.187 | 4071.652 +/- 383.841 | 7344.438 +/- 1901.033 | - |
| mixed-prefix-end-129 | {"coder":"MIXED","length":"4096","needleLength":"129","position":"END"} | 6752.596 +/- 1175.269 | 4046.044 +/- 531.124 | 6990.426 +/- 739.868 | - |
| mixed-prefix-miss-128 | {"coder":"MIXED","length":"4096","needleLength":"128","position":"MISS"} | 189046.680 +/- 87305.025 | 2157.718 +/- 71.623 | 200317.047 +/- 17079.092 | - |
| mixed-prefix-miss-129 | {"coder":"MIXED","length":"4096","needleLength":"129","position":"MISS"} | 161570.911 +/- 17845.675 | 2186.919 +/- 98.655 | 196165.822 +/- 67727.893 | - |
| long-overlap-latin-512 | {"length":"254","needleLength":"257","shape":"OVERLAP_LATIN1"} | 1013798.157 +/- 182001.240 | 363.628 +/- 37.617 | 1378965.901 +/- 125377.343 | - |
| long-overlap-utf16-512 | {"length":"382","needleLength":"129","shape":"OVERLAP"} | 3895670.885 +/- 1036754.589 | 591.335 +/- 33.763 | 4402618.553 +/- 1832213.217 | - |
| long-overlap-latin-4096 | {"length":"3838","needleLength":"257","shape":"OVERLAP_LATIN1"} | 12337507.313 +/- 2605058.998 | 659.280 +/- 26.737 | 16920897.674 +/- 4921166.438 | - |
| long-overlap-utf16-4096 | {"length":"3966","needleLength":"129","shape":"OVERLAP"} | 40239256.282 +/- 5110379.391 | 1276.064 +/- 55.947 | 42144158.441 +/- 6758800.922 | - |
| supp-forward-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 2796.291 +/- 610.337 | 272.484 +/- 6.883 | 3007.796 +/- 942.045 | - |
| supp-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 41999.172 +/- 5768.783 | 2077.824 +/- 853.704 | 47900.391 +/- 14107.316 | - |
| supp-forward-latin-early | {"coder":"LATIN1","length":"256","needleLength":"4","position":"START"} | 284.865 +/- 47.305 | 178.825 +/- 35.846 | 268.098 +/- 17.692 | - |
| supp-forward-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 5572.741 +/- 607.673 | 287.287 +/- 9.557 | 5533.774 +/- 395.084 | - |
| supp-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 170886.797 +/- 49170.232 | 3670.011 +/- 412.696 | 191159.524 +/- 29932.699 | - |
| supp-forward-utf16-early | {"coder":"UTF16","length":"128","needleLength":"4","position":"START"} | 561.487 +/- 33.042 | 179.117 +/- 7.458 | 579.085 +/- 56.475 | - |
| supp-forward-mixed-at | {"coder":"MIXED","length":"128","needleLength":"4","position":"MISS"} | 5882.684 +/- 1325.958 | 301.463 +/- 57.727 | 5541.040 +/- 327.970 | - |
| supp-forward-mixed-bulk | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 181252.607 +/- 25628.544 | 3856.361 +/- 413.191 | 198482.262 +/- 44277.214 | - |
| supp-forward-mixed-early | {"coder":"MIXED","length":"128","needleLength":"4","position":"START"} | 449.735 +/- 10.917 | 174.965 +/- 29.835 | 451.353 +/- 57.737 | - |
| supp-forward-mixed-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"MISS"} | 166439.967 +/- 12105.818 | 745.287 +/- 231.257 | 179038.296 +/- 11416.202 | - |
| supp-forward-mixed-65 | {"coder":"MIXED","length":"4096","needleLength":"65","position":"MISS"} | 171617.084 +/- 8812.164 | 190124.581 +/- 22113.087 | 185352.906 +/- 25715.356 | original, disabled |
| char-forward-latin-256 | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 2902.780 +/- 590.234 | 2913.232 +/- 808.330 | 2871.590 +/- 476.590 | original, disabled |
| char-forward-latin-257 | {"coder":"LATIN1","length":"257","needleLength":"4","position":"MISS"} | 2951.038 +/- 784.456 | 268.582 +/- 104.493 | 2829.371 +/- 896.663 | - |
| supp-char-forward-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 44911.833 +/- 13279.748 | 639.905 +/- 135.089 | 42015.772 +/- 23524.284 | - |
| supp-char-reverse-latin-below | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 2772.405 +/- 150.256 | 2749.945 +/- 239.016 | 3031.676 +/- 740.849 | - |
| supp-char-reverse-latin-at | {"coder":"LATIN1","length":"256","needleLength":"4","position":"MISS"} | 2858.017 +/- 264.248 | 341.924 +/- 22.353 | 2915.095 +/- 343.151 | - |
| supp-char-reverse-latin-bulk | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 40052.799 +/- 4889.195 | 688.744 +/- 38.147 | 42032.349 +/- 7099.755 | - |
| supp-char-reverse-latin-early | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"END"} | 230.145 +/- 69.496 | 233.068 +/- 83.802 | 233.234 +/- 53.086 | original |
| supp-char-forward-utf16-below | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 5816.934 +/- 2469.903 | 5921.321 +/- 1498.162 | 5327.002 +/- 820.975 | original, disabled |
| supp-char-forward-utf16-at | {"coder":"UTF16","length":"129","needleLength":"4","position":"MISS"} | 5559.846 +/- 924.025 | 412.842 +/- 16.485 | 5865.098 +/- 1425.672 | - |
| supp-char-forward-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 181324.903 +/- 16239.188 | 2333.182 +/- 96.063 | 173945.130 +/- 26590.460 | - |
| supp-char-reverse-utf16-below | {"coder":"UTF16","length":"127","needleLength":"4","position":"MISS"} | 6597.944 +/- 344.376 | 6520.118 +/- 646.339 | 6172.782 +/- 902.031 | disabled |
| supp-char-reverse-utf16-at | {"coder":"UTF16","length":"128","needleLength":"4","position":"MISS"} | 5356.430 +/- 901.549 | 2917.633 +/- 7289.491 | 7338.485 +/- 1614.006 | - |
| supp-char-reverse-utf16-bulk | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 165937.699 +/- 28178.917 | 2478.366 +/- 112.326 | 188681.721 +/- 63437.073 | - |
| supp-char-reverse-utf16-early | {"coder":"UTF16","length":"4096","needleLength":"4","position":"END"} | 327.442 +/- 39.915 | 339.744 +/- 36.821 | 344.456 +/- 45.802 | original |
| supp-builder-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 48050.273 +/- 12172.111 | 2149.389 +/- 107.162 | 49149.780 +/- 10428.811 | - |
| supp-builder-utf16 | {"coder":"UTF16","length":"4096","needleLength":"4","position":"MISS"} | 171775.937 +/- 28503.202 | 4179.786 +/- 901.299 | 191698.884 +/- 44548.736 | - |
| supp-builder-mixed | {"coder":"MIXED","length":"4096","needleLength":"4","position":"MISS"} | 171373.030 +/- 32429.752 | 3969.897 +/- 97.222 | 175099.737 +/- 29378.376 | - |
| supp-buffer-latin | {"coder":"LATIN1","length":"4096","needleLength":"4","position":"MISS"} | 49325.599 +/- 12604.383 | 6051.079 +/- 14530.415 | 49499.026 +/- 13354.369 | - |
| latin-prefix-miss-575-511 | {"length":"575","needleLength":"511","shape":"LATIN_PREFIX_MISS"} | 275671.033 +/- 13036.929 | 505.441 +/- 22.042 | 323737.765 +/- 44692.480 | - |
| utf16-prefix-miss-303-256 | {"length":"303","needleLength":"256","shape":"UTF16_PREFIX_MISS"} | 563040.922 +/- 37313.138 | 690.274 +/- 40.499 | 592572.425 +/- 50403.157 | - |
| utf16-uniform-end-129-129 | {"length":"129","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 11931.614 +/- 1111.676 | 510.446 +/- 28.140 | 11306.115 +/- 1690.666 | - |
| utf16-uniform-end-130-129 | {"length":"130","needleLength":"129","shape":"UTF16_UNIFORM_END"} | 12127.486 +/- 1548.664 | 530.663 +/- 20.455 | 11934.245 +/- 1778.222 | - |
| latin-end-32 | {"coder":"LATIN1","length":"4096","needleLength":"32","position":"END"} | 772.994 +/- 80.916 | 315.243 +/- 24.297 | 892.377 +/- 101.763 | - |
| latin-end-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"END"} | 1281.616 +/- 152.038 | 327.823 +/- 18.403 | 1494.132 +/- 63.297 | - |
| latin-miss-64 | {"coder":"LATIN1","length":"4096","needleLength":"64","position":"MISS"} | 52068.236 +/- 10986.125 | 760.866 +/- 23.787 | 55207.230 +/- 10383.982 | - |
| msvc-interpreter-utf16-end-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"END"} | 6095.048 +/- 693.306 | 605.004 +/- 21.120 | 6208.075 +/- 432.611 | - |
| msvc-interpreter-utf16-miss-64 | {"coder":"UTF16","length":"4096","needleLength":"64","position":"MISS"} | 187714.279 +/- 25139.015 | 4878.945 +/- 216.014 | 197788.205 +/- 21767.752 | - |
| mixed-interpreter-end-64 | {"coder":"MIXED","length":"4096","needleLength":"64","position":"END"} | 3866.149 +/- 186.623 | 552.284 +/- 17.675 | 3854.884 +/- 257.015 | - |
| latin-period2-miss-4096-512 | {"length":"4096","needleLength":"512","shape":"LATIN_PERIOD2_MISS"} | 146643.793 +/- 21011.215 | 1032.344 +/- 33.649 | 160203.204 +/- 8094.857 | - |
| latin-period3-miss-4095-513 | {"length":"4095","needleLength":"513","shape":"LATIN_PERIOD3_MISS"} | 137134.118 +/- 13007.519 | 1289.935 +/- 62.699 | 150133.675 +/- 11949.743 | - |
| utf16-period2-miss-2048-256 | {"length":"2048","needleLength":"256","shape":"UTF16_PERIOD2_MISS"} | 261665.482 +/- 38866.658 | 1214.780 +/- 38.482 | 264197.916 +/- 25901.010 | - |
| utf16-period3-miss-2047-257 | {"length":"2047","needleLength":"257","shape":"UTF16_PERIOD3_MISS"} | 327531.516 +/- 31978.860 | 1266.458 +/- 43.508 | 314258.461 +/- 36924.255 | - |
| char-forward-latin-255 | {"coder":"LATIN1","length":"255","needleLength":"4","position":"MISS"} | 3563.537 +/- 353.803 | 3194.072 +/- 366.046 | 3043.787 +/- 417.042 | disabled |

Compilation diagnostics describe their named representative fixtures and are separate from timing evidence. Raw per-fork measurements and image, source, compiler and backend provenance are retained in the accompanying JSON and workflow artifact.
