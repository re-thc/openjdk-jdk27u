# Complete-image candidate measurements: serial interpreter

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 305.001 ± 4.530 | 317.355 ± 4.233 | 316.438 ± 2.376 | original, disabled | original |
| stock | tiny-utf16 | 507.161 ± 5.795 | 523.576 ± 11.006 | 512.474 ± 5.963 | original, disabled | — |
| stock | pilot-latin-31-end | 351.416 ± 5.725 | 362.185 ± 7.883 | 355.891 ± 6.563 | original, disabled | — |
| stock | pilot-latin-31-miss | 590.597 ± 9.846 | 613.815 ± 7.010 | 622.431 ± 29.220 | original | original |
| stock | pilot-latin-32-end | 349.106 ± 2.272 | 348.676 ± 4.950 | 391.595 ± 4.257 | — | — |
| stock | pilot-latin-32-miss | 602.442 ± 20.850 | 379.860 ± 13.090 | 651.222 ± 4.629 | — | — |
| stock | pilot-latin-33-end | 346.702 ± 1.668 | 345.686 ± 2.491 | 391.707 ± 2.010 | — | — |
| stock | pilot-latin-33-miss | 606.292 ± 6.906 | 380.379 ± 2.493 | 662.663 ± 21.023 | — | — |
| stock | pilot-mixed-end-129-scope1 | 5709.389 ± 121.191 | 3557.929 ± 25.269 | 6059.443 ± 140.740 | — | — |
| stock | pilot-mixed-end-64 | 2972.373 ± 32.663 | 490.719 ± 23.337 | 3181.561 ± 93.731 | — | — |
| stock | pilot-mixed-miss-64 | 159000.777 ± 5543.083 | 758.376 ± 5.026 | 170708.498 ± 1583.290 | — | — |
| stock | pilot-mixed-miss-129-scope1 | 154119.477 ± 1278.512 | 1620.925 ± 44.125 | 166677.798 ± 1118.247 | — | — |
| stock | pilot-mixed-fallback-127-end | 3005.822 ± 28.155 | 541.866 ± 14.988 | 3251.146 ± 72.542 | — | — |
| stock | pilot-mixed-fallback-127-miss | 2804.284 ± 17.305 | 462.578 ± 2.113 | 3010.848 ± 12.899 | — | — |
| stock | pilot-mixed-fallback-128-end | 2999.820 ± 23.916 | 528.755 ± 11.077 | 3212.498 ± 30.025 | — | — |
| stock | pilot-mixed-fallback-128-miss | 2855.978 ± 27.583 | 469.502 ± 6.925 | 3114.944 ± 68.601 | — | — |
| stock | supp-char-forward-utf16-below | 5259.006 ± 103.416 | 5520.433 ± 144.710 | 5615.868 ± 67.625 | original | original |
| stock | supp-char-forward-utf16-at | 5368.868 ± 76.649 | 370.112 ± 4.906 | 5630.266 ± 140.811 | — | — |
| stock | supp-char-forward-utf16-bulk | 164031.603 ± 1090.076 | 1536.648 ± 18.972 | 171943.047 ± 1573.540 | — | — |
| stock | supp-char-reverse-latin-below | 2569.854 ± 43.957 | 2644.804 ± 47.092 | 2670.046 ± 66.569 | original | — |
| stock | supp-char-reverse-latin-early | 227.297 ± 2.313 | 239.722 ± 1.446 | 236.879 ± 8.013 | original, disabled | original |
| stock | pilot-char-reverse-utf16-128-miss | 5178.228 ± 56.042 | 712.348 ± 10.371 | 5443.686 ± 147.210 | — | — |
| stock | pilot-char-reverse-utf16-4096-miss | 161720.015 ± 1723.209 | 1876.342 ± 21.409 | 167983.635 ± 1572.453 | — | — |
| stock | supp-char-reverse-utf16-early | 338.605 ± 4.790 | 351.238 ± 4.612 | 357.905 ± 9.833 | original | original |
| stock | utf16-uniform-end-129-129 | 9228.390 ± 66.330 | 623.945 ± 4.055 | 10059.718 ± 40.844 | — | — |
| stock | utf16-uniform-end-130-129 | 9222.721 ± 88.246 | 625.779 ± 5.581 | 10153.590 ± 108.118 | — | — |
| stock | overlap-min-latin | 6623.019 ± 47.128 | 487.537 ± 7.161 | 6844.309 ± 95.361 | — | — |
| stock | overlap-min-utf16 | 18345.430 ± 723.101 | 575.832 ± 9.352 | 19850.421 ± 242.501 | — | — |
| stock | latin-prefix-miss-575-511 | 211875.178 ± 9592.011 | 908.213 ± 10.906 | 206384.936 ± 2810.741 | — | — |
| stock | utf16-prefix-miss-303-256 | 437728.446 ± 3710.385 | 717.691 ± 6.880 | 458764.000 ± 6109.789 | — | — |
| periodic | supp-latin-period3-abc-miss-4095-513 | 82477.777 ± 792.079 | 1453.625 ± 29.228 | 86865.334 ± 1226.854 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 164170.703 ± 1924.653 | 1412.410 ± 12.493 | 174683.663 ± 2836.638 | — | — |
