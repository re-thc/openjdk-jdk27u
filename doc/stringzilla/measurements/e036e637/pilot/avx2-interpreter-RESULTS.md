# Complete-image candidate measurements: avx2 interpreter

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 384.149 ± 15.590 | 391.145 ± 13.992 | 387.074 ± 20.682 | original, disabled | — |
| stock | tiny-utf16 | 655.790 ± 16.911 | 634.030 ± 41.762 | 660.034 ± 53.145 | — | — |
| stock | pilot-latin-31-end | 479.512 ± 19.524 | 467.845 ± 29.698 | 471.749 ± 13.791 | — | — |
| stock | pilot-latin-31-miss | 825.466 ± 46.412 | 854.730 ± 30.852 | 828.017 ± 41.277 | original, disabled | — |
| stock | pilot-latin-32-end | 473.295 ± 13.248 | 444.820 ± 18.236 | 526.680 ± 11.572 | — | — |
| stock | pilot-latin-32-miss | 853.017 ± 39.157 | 509.344 ± 14.654 | 898.883 ± 60.478 | — | — |
| stock | pilot-latin-33-end | 483.358 ± 16.898 | 450.474 ± 22.272 | 531.283 ± 10.680 | — | — |
| stock | pilot-latin-33-miss | 848.439 ± 59.931 | 505.356 ± 14.879 | 924.858 ± 47.426 | — | — |
| stock | pilot-mixed-end-129-scope1 | 9697.908 ± 331.793 | 5774.223 ± 312.205 | 9875.569 ± 327.432 | — | — |
| stock | pilot-mixed-end-64 | 5035.245 ± 253.062 | 557.299 ± 31.683 | 5077.496 ± 164.021 | — | — |
| stock | pilot-mixed-miss-64 | 262249.715 ± 13488.400 | 1099.945 ± 16.162 | 263971.830 ± 15622.946 | — | — |
| stock | pilot-mixed-miss-129-scope1 | 254555.641 ± 11031.138 | 989.857 ± 16.863 | 258251.201 ± 18518.321 | — | — |
| stock | pilot-mixed-fallback-127-end | 5133.887 ± 156.637 | 664.434 ± 14.653 | 5217.320 ± 157.435 | — | — |
| stock | pilot-mixed-fallback-127-miss | 4541.508 ± 247.236 | 630.163 ± 12.055 | 4504.611 ± 125.194 | — | — |
| stock | pilot-mixed-fallback-128-end | 5264.233 ± 219.098 | 656.571 ± 31.005 | 5148.122 ± 108.503 | — | — |
| stock | pilot-mixed-fallback-128-miss | 4656.020 ± 232.164 | 637.718 ± 16.161 | 4609.697 ± 145.193 | — | — |
| stock | supp-char-forward-utf16-below | 9053.111 ± 942.538 | 8811.157 ± 476.405 | 8768.996 ± 313.237 | disabled | — |
| stock | supp-char-forward-utf16-at | 8977.788 ± 522.443 | 470.568 ± 13.698 | 8877.322 ± 316.051 | — | — |
| stock | supp-char-forward-utf16-bulk | 272807.232 ± 14591.398 | 844.916 ± 9.690 | 279240.251 ± 15884.127 | — | — |
| stock | supp-char-reverse-latin-below | 3507.606 ± 357.265 | 4582.594 ± 267.430 | 4432.820 ± 308.737 | original, disabled | original |
| stock | supp-char-reverse-latin-early | 286.291 ± 15.576 | 306.502 ± 8.079 | 312.603 ± 34.609 | original | — |
| stock | pilot-char-reverse-utf16-128-miss | 8685.253 ± 367.154 | 1018.061 ± 23.696 | 8803.334 ± 306.771 | — | — |
| stock | pilot-char-reverse-utf16-4096-miss | 268636.665 ± 15055.612 | 1380.384 ± 34.542 | 268347.243 ± 14492.832 | — | — |
| stock | supp-char-reverse-utf16-early | 459.751 ± 24.084 | 470.096 ± 36.664 | 474.271 ± 8.467 | original | — |
| stock | utf16-uniform-end-129-129 | 16300.099 ± 737.009 | 685.552 ± 10.376 | 16278.439 ± 1178.490 | — | — |
| stock | utf16-uniform-end-130-129 | 16313.271 ± 699.024 | 747.552 ± 5.535 | 16466.294 ± 939.497 | — | — |
| stock | overlap-min-latin | 12838.695 ± 1922.653 | 528.539 ± 15.845 | 13572.276 ± 655.081 | — | — |
| stock | overlap-min-utf16 | 31009.462 ± 2074.841 | 751.065 ± 14.391 | 33188.627 ± 3643.604 | — | — |
| stock | latin-prefix-miss-575-511 | 399149.452 ± 35036.098 | 728.450 ± 19.184 | 417371.151 ± 34287.228 | — | — |
| stock | utf16-prefix-miss-303-256 | 755488.933 ± 20499.898 | 812.862 ± 71.539 | 813040.665 ± 105583.612 | — | — |
| periodic | supp-latin-period3-abc-miss-4095-513 | 152146.473 ± 10946.534 | 1044.701 ± 23.075 | 152767.212 ± 2824.605 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 281193.729 ± 15861.022 | 841.740 ± 24.044 | 273889.694 ± 17696.579 | — | — |
