# Complete-image candidate measurements: serial c2

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 2.641 ± 0.127 | 2.887 ± 0.275 | 2.787 ± 0.084 | original, disabled | — |
| stock | tiny-utf16 | 1.848 ± 0.070 | 1.732 ± 0.042 | 1.747 ± 0.054 | — | — |
| stock | supp-char-forward-utf16-below | 5.108 ± 0.375 | 5.145 ± 0.190 | 5.052 ± 0.482 | original, disabled | — |
| stock | supp-char-forward-utf16-at | 5.519 ± 0.056 | 5.397 ± 0.177 | 5.542 ± 0.111 | — | — |
| stock | supp-char-forward-utf16-bulk | 135.364 ± 2.569 | 141.985 ± 24.681 | 134.497 ± 2.049 | original, disabled | — |
| stock | supp-char-reverse-latin-below | 38.706 ± 1.822 | 39.119 ± 1.141 | 39.287 ± 2.029 | original | — |
| stock | supp-char-reverse-latin-at | 38.225 ± 1.562 | 13.803 ± 0.389 | 36.262 ± 1.195 | — | — |
| stock | supp-char-reverse-latin-bulk | 562.706 ± 14.343 | 120.046 ± 1.180 | 523.645 ± 10.012 | — | — |
| stock | supp-char-reverse-latin-early | 2.077 ± 0.027 | 2.707 ± 0.066 | 2.677 ± 0.007 | original, disabled | original |
| stock | pilot-char-reverse-utf16-128-miss | 14.314 ± 0.099 | 15.281 ± 0.734 | 14.887 ± 0.473 | original, disabled | original |
| stock | pilot-char-reverse-utf16-255-miss | 24.863 ± 0.348 | 25.988 ± 0.937 | 25.160 ± 0.297 | original, disabled | — |
| stock | pilot-char-reverse-utf16-256-miss | 25.198 ± 0.280 | 26.437 ± 0.768 | 26.003 ± 1.050 | original, disabled | original |
| stock | pilot-char-reverse-utf16-4096-miss | 371.594 ± 2.822 | 358.719 ± 9.101 | 362.339 ± 14.199 | — | — |
| stock | supp-char-reverse-utf16-early | 2.112 ± 0.031 | 2.333 ± 0.083 | 2.357 ± 0.107 | original | original |
| stock | utf16-uniform-end-129-129 | 30.069 ± 1.458 | 25.539 ± 0.823 | 22.463 ± 0.472 | disabled | disabled |
| stock | utf16-uniform-end-130-129 | 28.975 ± 0.337 | 25.554 ± 1.168 | 22.462 ± 0.262 | disabled | disabled |
| stock | overlap-min-latin | 104.695 ± 5.525 | 57.947 ± 2.189 | 100.335 ± 2.775 | — | — |
| stock | overlap-min-utf16 | 56.503 ± 1.544 | 44.923 ± 0.858 | 44.114 ± 0.961 | disabled | — |
| stock | pilot-utf16-126-end | 3.574 ± 0.057 | 4.444 ± 0.142 | 3.403 ± 0.079 | original, disabled | original, disabled |
| stock | pilot-utf16-127-end | 3.531 ± 0.156 | 4.782 ± 0.048 | 3.395 ± 0.133 | original, disabled | original, disabled |
| stock | pilot-utf16-128-end | 3.715 ± 0.011 | 4.749 ± 0.017 | 3.634 ± 0.036 | original, disabled | original, disabled |
| stock | pilot-latin-bulk-end | 3.942 ± 0.142 | 4.350 ± 0.148 | 4.648 ± 0.047 | original | original |
| stock | pilot-equals-latin1-32 | 1.800 ± 0.040 | 1.811 ± 0.015 | 1.801 ± 0.028 | original, disabled | — |
| stock | pilot-equals-latin1-4096 | 83.204 ± 8.138 | 82.221 ± 1.877 | 83.183 ± 2.938 | — | — |
| stock | pilot-equals-utf16-32 | 2.370 ± 0.077 | 2.252 ± 0.059 | 2.306 ± 0.096 | — | — |
| stock | pilot-equals-utf16-4096 | 150.263 ± 0.834 | 149.531 ± 0.899 | 150.119 ± 1.051 | — | — |
| stock | pilot-serial-latin-end-31 | 10.314 ± 0.316 | 13.925 ± 0.417 | 10.430 ± 0.212 | original, disabled | original, disabled |
| stock | pilot-serial-latin-end-32 | 10.569 ± 0.316 | 14.300 ± 0.385 | 11.054 ± 0.555 | original, disabled | original, disabled |
| stock | pilot-serial-latin-end-33 | 10.559 ± 0.128 | 13.942 ± 0.160 | 11.149 ± 0.147 | original, disabled | original, disabled |
| stock | pilot-serial-latin-end-63 | 15.652 ± 0.804 | 22.320 ± 0.614 | 15.672 ± 0.746 | original, disabled | original, disabled |
| stock | pilot-serial-latin-end-64 | 15.603 ± 0.398 | 23.004 ± 0.791 | 16.088 ± 0.390 | original, disabled | original, disabled |
| stock | pilot-serial-latin-end-65 | 15.803 ± 0.316 | 22.454 ± 0.722 | 15.944 ± 0.151 | original, disabled | original, disabled |
| stock | pilot-serial-utf16-end-64 | 14.457 ± 0.161 | 10.619 ± 0.168 | 14.953 ± 0.334 | — | — |
| stock | pilot-serial-utf16-end-31 | 9.244 ± 0.108 | 10.554 ± 0.606 | 9.934 ± 0.274 | original, disabled | original |
| stock | pilot-serial-utf16-miss-31 | 371.646 ± 28.447 | 172.496 ± 13.607 | 355.317 ± 7.497 | — | — |
| stock | pilot-serial-utf16-end-32 | 9.834 ± 0.230 | 9.567 ± 0.299 | 10.147 ± 0.528 | — | — |
| stock | pilot-serial-utf16-miss-32 | 368.579 ± 6.511 | 165.102 ± 2.344 | 369.273 ± 4.517 | — | — |
| stock | pilot-serial-utf16-end-33 | 9.929 ± 0.084 | 10.063 ± 0.146 | 10.293 ± 0.200 | original | — |
| stock | pilot-serial-utf16-miss-33 | 372.551 ± 7.764 | 199.764 ± 2.847 | 365.837 ± 3.256 | — | — |
| stock | pilot-serial-utf16-end-63 | 14.273 ± 0.330 | 10.953 ± 0.235 | 14.380 ± 0.237 | — | — |
| stock | pilot-serial-utf16-miss-63 | 369.050 ± 3.235 | 201.020 ± 5.016 | 365.968 ± 8.805 | — | — |
| stock | pilot-serial-utf16-miss-64 | 370.471 ± 3.098 | 204.018 ± 1.440 | 370.022 ± 5.566 | — | — |
| stock | pilot-serial-utf16-end-65 | 14.284 ± 0.289 | 11.156 ± 0.278 | 14.840 ± 0.775 | — | — |
| stock | pilot-serial-utf16-miss-65 | 382.699 ± 3.014 | 205.477 ± 1.117 | 367.377 ± 9.147 | — | — |
| stock | pilot-serial-utf16-end-127 | 23.291 ± 0.993 | 13.529 ± 0.179 | 24.015 ± 0.981 | — | — |
| stock | pilot-serial-utf16-miss-127 | 367.167 ± 22.838 | 200.218 ± 0.871 | 360.587 ± 17.825 | — | — |
| stock | pilot-serial-utf16-end-128 | 26.776 ± 6.273 | 12.208 ± 0.497 | 23.864 ± 0.073 | — | — |
| stock | pilot-serial-utf16-miss-128 | 362.517 ± 11.147 | 194.383 ± 5.392 | 360.416 ± 4.074 | — | — |
| stock | pilot-serial-utf16-end-129 | 29.149 ± 0.625 | 86.296 ± 5.129 | 24.312 ± 2.465 | original, disabled | original, disabled |
| stock | pilot-serial-utf16-miss-129 | 371.747 ± 16.561 | 1100.181 ± 21.993 | 365.345 ± 15.065 | original, disabled | original, disabled |
| periodic | supp-latin-period3-abc-miss-4095-513 | 2234.913 ± 9.688 | 650.363 ± 5.604 | 2264.495 ± 101.607 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 970.962 ± 302.205 | 633.530 ± 18.658 | 741.887 ± 42.442 | — | — |
| utf16-probe | probe-utf16-single-31-penultimate-miss | 2.443 ± 0.023 | 4.103 ± 0.021 | 2.342 ± 0.014 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-31-near-end-miss | 6.462 ± 0.953 | 5.054 ± 0.028 | 3.423 ± 0.020 | disabled | disabled |
| utf16-probe | probe-utf16-single-32-penultimate-miss | 2.473 ± 0.077 | 4.134 ± 0.155 | 2.353 ± 0.024 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-32-near-end-miss | 6.277 ± 0.454 | 4.808 ± 0.277 | 3.431 ± 0.048 | disabled | disabled |
| utf16-probe | probe-utf16-single-33-penultimate-miss | 2.417 ± 0.034 | 4.061 ± 0.092 | 2.361 ± 0.015 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-33-near-end-miss | 6.980 ± 0.902 | 4.509 ± 0.040 | 3.388 ± 0.041 | disabled | disabled |
| utf16-probe | probe-utf16-single-63-penultimate-miss | 2.418 ± 0.071 | 4.033 ± 0.030 | 2.353 ± 0.102 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-63-near-end-miss | 6.779 ± 0.768 | 4.748 ± 0.651 | 3.420 ± 0.083 | disabled | disabled |
| utf16-probe | probe-utf16-single-64-penultimate-miss | 2.429 ± 0.037 | 4.061 ± 0.103 | 2.333 ± 0.083 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-64-near-end-miss | 7.114 ± 1.128 | 4.631 ± 0.332 | 3.380 ± 0.067 | disabled | disabled |
| utf16-probe | probe-utf16-single-65-penultimate-miss | 2.421 ± 0.028 | 4.063 ± 0.198 | 2.310 ± 0.036 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-65-near-end-miss | 6.589 ± 1.273 | 4.633 ± 0.166 | 3.409 ± 0.084 | disabled | disabled |
| utf16-probe | probe-utf16-single-127-penultimate-miss | 2.331 ± 0.073 | 3.992 ± 0.200 | 2.278 ± 0.073 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-127-near-end-miss | 7.739 ± 0.453 | 4.338 ± 0.076 | 3.227 ± 0.063 | disabled | disabled |
| utf16-probe | probe-utf16-single-128-penultimate-miss | 2.346 ± 0.068 | 4.084 ± 0.219 | 2.311 ± 0.113 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-128-near-end-miss | 7.906 ± 0.630 | 4.396 ± 0.044 | 3.287 ± 0.104 | disabled | disabled |
| utf16-probe | probe-utf16-single-129-penultimate-miss | 2.284 ± 0.080 | 6.143 ± 0.144 | 2.198 ± 0.017 | original, disabled | original, disabled |
| utf16-probe | probe-utf16-single-129-near-end-miss | 8.270 ± 0.900 | 7.235 ± 0.099 | 3.318 ± 0.362 | disabled | disabled |
| utf16-probe | probe-utf16-bulk-4096-64-penultimate-miss | 1203.725 ± 7.567 | 202.109 ± 10.058 | 1023.344 ± 42.766 | — | — |
| utf16-probe | probe-utf16-bulk-4096-64-near-end-miss | 5172.302 ± 155.103 | 6730.766 ± 573.266 | 4688.561 ± 155.270 | original, disabled | original, disabled |
