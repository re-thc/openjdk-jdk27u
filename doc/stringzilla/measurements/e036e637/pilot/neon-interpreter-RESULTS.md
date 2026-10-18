# Complete-image candidate measurements: neon interpreter

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 317.750 ± 27.813 | 321.638 ± 13.737 | 322.229 ± 26.861 | original | — |
| stock | tiny-utf16 | 546.765 ± 12.033 | 550.889 ± 23.693 | 555.380 ± 19.689 | original | — |
| stock | pilot-latin-31-end | 367.322 ± 32.775 | 374.369 ± 28.363 | 376.658 ± 33.800 | original | — |
| stock | pilot-latin-31-miss | 605.272 ± 65.781 | 592.902 ± 47.673 | 589.095 ± 50.259 | disabled | — |
| stock | pilot-latin-32-end | 371.224 ± 33.632 | 361.251 ± 20.326 | 426.700 ± 29.576 | — | — |
| stock | pilot-latin-32-miss | 606.873 ± 50.498 | 450.747 ± 6.356 | 688.269 ± 44.734 | — | — |
| stock | pilot-latin-33-end | 365.519 ± 27.260 | 357.464 ± 7.100 | 418.270 ± 17.469 | — | — |
| stock | pilot-latin-33-miss | 624.922 ± 81.368 | 449.443 ± 5.472 | 691.491 ± 47.947 | — | — |
| stock | pilot-mixed-end-129-scope2 | 6993.101 ± 711.879 | 4274.684 ± 89.590 | 7012.878 ± 662.970 | — | — |
| stock | pilot-mixed-end-64 | 3723.070 ± 294.850 | 536.532 ± 5.844 | 3822.068 ± 292.183 | — | — |
| stock | pilot-mixed-miss-64 | 188867.617 ± 10209.143 | 1208.418 ± 4.855 | 196340.471 ± 13278.238 | — | — |
| stock | pilot-mixed-miss-129-scope2 | 183568.654 ± 5900.630 | 1141.398 ± 7.016 | 190569.862 ± 11495.973 | — | — |
| stock | pilot-mixed-fallback-127-end | 3650.297 ± 153.764 | 594.068 ± 9.680 | 3714.890 ± 271.310 | — | — |
| stock | pilot-mixed-fallback-127-miss | 3373.345 ± 172.109 | 547.844 ± 8.739 | 3487.051 ± 216.005 | — | — |
| stock | pilot-mixed-fallback-128-end | 3829.210 ± 306.030 | 598.131 ± 3.238 | 3736.296 ± 377.120 | — | — |
| stock | pilot-mixed-fallback-128-miss | 3417.092 ± 193.670 | 563.964 ± 9.042 | 3456.841 ± 148.702 | — | — |
| stock | supp-char-forward-utf16-below | 6150.656 ± 610.085 | 6508.929 ± 542.885 | 6222.100 ± 536.958 | original, disabled | — |
| stock | supp-char-forward-utf16-at | 5915.365 ± 529.609 | 446.156 ± 8.756 | 6369.478 ± 609.432 | — | — |
| stock | supp-char-forward-utf16-bulk | 196954.536 ± 26213.516 | 852.872 ± 9.914 | 195799.343 ± 17268.414 | — | — |
| stock | supp-char-reverse-latin-below | 2756.196 ± 388.040 | 3106.093 ± 204.574 | 3103.412 ± 194.336 | original, disabled | — |
| stock | supp-char-reverse-latin-early | 230.366 ± 13.756 | 259.774 ± 21.851 | 254.995 ± 16.863 | original, disabled | — |
| stock | pilot-char-reverse-utf16-128-miss | 5996.646 ± 548.085 | 844.604 ± 22.200 | 6321.360 ± 526.219 | — | — |
| stock | pilot-char-reverse-utf16-4096-miss | 188230.989 ± 24008.215 | 1421.925 ± 14.745 | 190772.713 ± 14933.800 | — | — |
| stock | supp-char-reverse-utf16-early | 397.923 ± 23.587 | 425.323 ± 32.321 | 414.183 ± 11.927 | original, disabled | — |
| stock | utf16-uniform-end-129-129 | 11056.856 ± 713.498 | 628.667 ± 10.291 | 11111.152 ± 863.732 | — | — |
| stock | utf16-uniform-end-130-129 | 11815.217 ± 977.084 | 632.863 ± 6.709 | 11721.147 ± 1361.751 | — | — |
| stock | overlap-min-latin | 7987.067 ± 866.056 | 475.321 ± 6.976 | 8414.813 ± 1368.864 | — | — |
| stock | overlap-min-utf16 | 22906.953 ± 2632.551 | 636.558 ± 7.562 | 21299.888 ± 2305.234 | — | — |
| stock | latin-prefix-miss-575-511 | 248640.813 ± 36767.726 | 508.730 ± 8.510 | 259077.667 ± 31884.647 | — | — |
| stock | utf16-prefix-miss-303-256 | 510356.911 ± 22042.644 | 714.952 ± 7.641 | 501150.573 ± 55578.931 | — | — |
| periodic | supp-latin-period3-abc-miss-4095-513 | 90279.764 ± 6060.590 | 570.111 ± 7.749 | 98276.006 ± 9008.300 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 198559.931 ± 21788.750 | 846.243 ± 11.675 | 200219.779 ± 20689.050 | — | — |
