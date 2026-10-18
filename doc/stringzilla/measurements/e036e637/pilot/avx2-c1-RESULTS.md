# Complete-image candidate measurements: avx2 c1

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 7.193 ± 0.020 | 7.518 ± 0.031 | 7.590 ± 0.209 | original | original |
| stock | tiny-utf16 | 7.575 ± 0.131 | 7.178 ± 0.945 | 6.575 ± 0.023 | disabled | — |
| stock | pilot-latin-31-end | 12.358 ± 0.056 | 12.260 ± 0.214 | 12.016 ± 0.046 | disabled | — |
| stock | pilot-latin-31-miss | 33.154 ± 0.096 | 33.173 ± 0.140 | 33.640 ± 0.664 | original | — |
| stock | pilot-latin-32-end | 12.328 ± 0.014 | 10.485 ± 0.026 | 13.184 ± 0.044 | — | — |
| stock | pilot-latin-32-miss | 34.197 ± 0.440 | 48.098 ± 15.873 | 34.338 ± 0.058 | original, disabled | — |
| stock | pilot-latin-33-end | 12.353 ± 0.043 | 10.524 ± 0.026 | 13.335 ± 0.154 | — | — |
| stock | pilot-latin-33-miss | 35.227 ± 0.577 | 44.808 ± 0.913 | 35.519 ± 0.663 | original, disabled | original, disabled |
| stock | pilot-mixed-end-9-scope1 | 15.967 ± 0.079 | 21.014 ± 0.425 | 15.425 ± 0.205 | original, disabled | original, disabled |
| stock | pilot-mixed-end-31-scope1 | 39.128 ± 0.262 | 28.877 ± 0.099 | 36.578 ± 0.531 | — | — |
| stock | pilot-mixed-end-32-scope1 | 40.071 ± 0.272 | 27.833 ± 0.474 | 37.698 ± 0.635 | — | — |
| stock | pilot-mixed-end-33-scope1 | 42.210 ± 1.018 | 32.972 ± 0.102 | 38.658 ± 0.248 | — | — |
| stock | pilot-mixed-end-129-scope1 | 145.584 ± 1.326 | 150.783 ± 3.607 | 135.850 ± 3.207 | original, disabled | original, disabled |
| stock | supp-char-forward-utf16-below | 74.717 ± 0.712 | 73.308 ± 0.216 | 73.422 ± 0.569 | — | — |
| stock | supp-char-forward-utf16-at | 75.504 ± 0.330 | 33.229 ± 0.109 | 77.797 ± 18.269 | — | — |
| stock | supp-char-forward-utf16-bulk | 1978.293 ± 17.477 | 402.623 ± 1.128 | 1977.037 ± 14.735 | — | — |
| stock | supp-char-reverse-latin-below | 190.436 ± 0.822 | 205.790 ± 64.828 | 181.833 ± 2.760 | original, disabled | — |
| stock | supp-char-reverse-latin-at | 191.808 ± 1.521 | 24.981 ± 1.068 | 190.776 ± 1.167 | — | — |
| stock | supp-char-reverse-latin-bulk | 2817.082 ± 24.811 | 102.441 ± 1.174 | 2772.236 ± 8.991 | — | — |
| stock | supp-char-reverse-latin-early | 8.153 ± 0.021 | 8.498 ± 0.182 | 10.582 ± 4.715 | original | original |
| stock | pilot-char-reverse-utf16-128-miss | 90.995 ± 0.180 | 40.266 ± 0.072 | 85.337 ± 1.331 | — | — |
| stock | pilot-char-reverse-utf16-255-miss | 170.526 ± 0.577 | 51.046 ± 3.632 | 171.316 ± 0.354 | — | — |
| stock | pilot-char-reverse-utf16-256-miss | 171.518 ± 2.510 | 51.022 ± 0.397 | 171.853 ± 0.232 | — | — |
| stock | pilot-char-reverse-utf16-4096-miss | 2573.103 ± 10.039 | 411.944 ± 3.558 | 2571.803 ± 7.734 | — | — |
| stock | supp-char-reverse-utf16-early | 7.201 ± 0.033 | 8.470 ± 0.139 | 8.772 ± 0.057 | original | original |
| stock | utf16-uniform-end-129-129 | 115.196 ± 1.305 | 136.468 ± 0.457 | 134.568 ± 2.219 | original, disabled | original |
| stock | utf16-uniform-end-130-129 | 114.894 ± 0.842 | 136.585 ± 0.285 | 134.469 ± 2.215 | original, disabled | original |
| stock | overlap-min-latin | 662.879 ± 1.985 | 25.692 ± 0.109 | 663.903 ± 2.762 | — | — |
| stock | overlap-min-utf16 | 262.529 ± 2.911 | 264.513 ± 1.101 | 262.321 ± 0.903 | original, disabled | disabled |
| stock | pilot-bulk-latin-miss | 3851.805 ± 16.566 | 230.154 ± 0.836 | 4092.675 ± 1130.579 | — | — |
| periodic | supp-latin-period3-abc-miss-4095-513 | 6808.739 ± 132.648 | 587.529 ± 3.868 | 6755.315 ± 20.517 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 3256.440 ± 15.542 | 162.521 ± 1.030 | 3203.239 ± 1223.152 | — | — |
