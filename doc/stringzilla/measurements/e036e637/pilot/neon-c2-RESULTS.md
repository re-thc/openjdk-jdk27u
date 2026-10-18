# Complete-image candidate measurements: neon c2

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 3.422 ± 0.013 | 3.679 ± 0.018 | 3.669 ± 0.025 | original, disabled | original |
| stock | tiny-utf16 | 2.846 ± 0.030 | 2.744 ± 0.005 | 2.745 ± 0.007 | — | — |
| stock | pilot-mixed-end-9-scope2 | 11.031 ± 0.043 | 9.935 ± 0.251 | 8.010 ± 0.057 | disabled | disabled |
| stock | pilot-mixed-end-31-scope2 | 15.769 ± 0.064 | 15.726 ± 0.035 | 16.019 ± 0.052 | — | — |
| stock | pilot-mixed-end-32-scope2 | 16.172 ± 0.054 | 13.151 ± 0.219 | 16.359 ± 0.046 | — | — |
| stock | pilot-mixed-end-33-scope2 | 18.262 ± 2.174 | 14.486 ± 0.056 | 17.158 ± 0.054 | — | — |
| stock | pilot-mixed-end-129-scope2 | 49.978 ± 0.184 | 42.259 ± 0.181 | 47.505 ± 0.089 | — | — |
| stock | pilot-mixed-miss-129-scope2 | 711.377 ± 1.994 | 375.238 ± 1.105 | 757.933 ± 3.005 | — | — |
| stock | supp-char-forward-utf16-below | 11.610 ± 0.022 | 11.655 ± 0.046 | 11.626 ± 0.029 | original, disabled | — |
| stock | supp-char-forward-utf16-at | 12.249 ± 0.020 | 12.248 ± 0.022 | 12.272 ± 0.073 | — | — |
| stock | supp-char-forward-utf16-bulk | 350.902 ± 1.584 | 350.227 ± 2.453 | 351.066 ± 4.196 | — | — |
| stock | supp-char-reverse-latin-below | 54.777 ± 0.211 | 56.191 ± 0.379 | 55.965 ± 0.392 | original, disabled | original |
| stock | supp-char-reverse-latin-at | 55.395 ± 0.388 | 20.249 ± 0.186 | 51.708 ± 0.356 | — | — |
| stock | supp-char-reverse-latin-bulk | 788.487 ± 1.568 | 162.399 ± 0.718 | 746.091 ± 72.923 | — | — |
| stock | supp-char-reverse-latin-early | 2.891 ± 0.024 | 3.724 ± 0.015 | 3.717 ± 0.014 | original, disabled | original |
| stock | pilot-char-reverse-utf16-128-miss | 30.552 ± 0.098 | 32.536 ± 0.085 | 31.834 ± 0.073 | original, disabled | original, disabled |
| stock | pilot-char-reverse-utf16-255-miss | 52.752 ± 0.054 | 54.566 ± 0.158 | 53.611 ± 0.494 | original, disabled | original, disabled |
| stock | pilot-char-reverse-utf16-256-miss | 52.763 ± 0.117 | 58.688 ± 0.371 | 53.959 ± 0.169 | original, disabled | original, disabled |
| stock | pilot-char-reverse-utf16-4096-miss | 729.410 ± 3.156 | 627.379 ± 0.332 | 722.254 ± 2.967 | — | — |
| stock | supp-char-reverse-utf16-early | 2.953 ± 0.108 | 3.367 ± 0.041 | 3.369 ± 0.039 | original | original |
| stock | utf16-uniform-end-129-129 | 48.864 ± 5.321 | 59.589 ± 0.150 | 48.276 ± 0.086 | original, disabled | original, disabled |
| stock | utf16-uniform-end-130-129 | 52.234 ± 0.065 | 59.600 ± 0.075 | 48.265 ± 0.069 | original, disabled | original, disabled |
| stock | overlap-min-latin | 230.197 ± 0.151 | 120.099 ± 0.127 | 229.128 ± 0.308 | — | — |
| stock | overlap-min-utf16 | 117.567 ± 0.167 | 113.240 ± 0.192 | 109.036 ± 0.214 | disabled | disabled |
| stock | pilot-utf16-126-end | 5.309 ± 0.029 | 6.062 ± 0.017 | 5.506 ± 0.014 | original, disabled | original, disabled |
| stock | pilot-utf16-127-end | 5.298 ± 0.010 | 6.061 ± 0.018 | 5.540 ± 0.035 | original, disabled | original, disabled |
| stock | pilot-utf16-128-end | 5.318 ± 0.012 | 6.073 ± 0.039 | 5.540 ± 0.024 | original, disabled | original, disabled |
| stock | pilot-latin-bulk-end | 5.319 ± 0.034 | 5.738 ± 0.036 | 5.481 ± 0.039 | original, disabled | original, disabled |
| stock | pilot-mixed-end-127 | 48.851 ± 0.216 | 41.351 ± 0.179 | 46.595 ± 0.068 | — | — |
| stock | pilot-mixed-end-128 | 49.304 ± 0.460 | 41.542 ± 0.122 | 46.938 ± 0.082 | — | — |
| stock | pilot-neon-utf16-511-9-miss | 101.110 ± 0.562 | 45.961 ± 0.163 | 96.498 ± 0.252 | — | — |
| stock | pilot-neon-utf16-512-9-miss | 101.889 ± 0.748 | 46.722 ± 0.222 | 96.459 ± 0.513 | — | — |
| stock | pilot-neon-utf16-513-9-miss | 101.160 ± 1.176 | 47.328 ± 0.208 | 95.227 ± 0.376 | — | — |
| stock | pilot-neon-utf16-1023-9-miss | 193.726 ± 0.197 | 89.873 ± 0.638 | 185.525 ± 0.294 | — | — |
| stock | pilot-neon-utf16-1024-9-miss | 194.013 ± 0.465 | 184.916 ± 0.172 | 184.176 ± 0.988 | disabled | — |
| stock | neon-threshold-utf16-512-9-end | 7.229 ± 0.027 | 9.876 ± 0.033 | 7.974 ± 0.014 | original, disabled | original, disabled |
| stock | neon-dense-utf16-512-9 | 393.595 ± 1.628 | 159.468 ± 0.133 | 386.483 ± 0.601 | — | — |
| stock | pilot-neon-dense-utf16-577-64 | 397.407 ± 15.579 | 114.754 ± 0.124 | 381.906 ± 7.687 | — | — |
| stock | pilot-mixed-miss-31 | 732.980 ± 4.457 | 659.442 ± 0.826 | 787.360 ± 7.389 | — | — |
| stock | pilot-mixed-miss-32 | 744.185 ± 1.437 | 632.950 ± 1.134 | 757.370 ± 29.744 | — | — |
| stock | pilot-neon-utf16-end-64 | 25.051 ± 0.098 | 22.068 ± 0.048 | 26.771 ± 0.175 | — | — |
| periodic | supp-latin-period3-abc-miss-4095-513 | 4660.667 ± 12.037 | 167.651 ± 0.248 | 4606.813 ± 9.463 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 2932.586 ± 7.101 | 240.614 ± 0.761 | 1647.411 ± 1.288 | — | — |
| utf16-probe | probe-utf16-single-64-penultimate-miss | 3.373 ± 0.022 | 7.759 ± 0.022 | 3.399 ± 0.034 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-64-near-end-miss | 5.269 ± 0.038 | 9.849 ± 0.122 | 5.210 ± 0.012 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-bulk-4096-64-penultimate-miss | 2120.531 ± 5.116 | 669.015 ± 0.682 | 2148.805 ± 4.400 | — | — |
| utf16-probe | probe-utf16-bulk-4096-64-near-end-miss | 12407.983 ± 173.450 | 683.498 ± 0.728 | 8954.982 ± 952.509 | — | — |
