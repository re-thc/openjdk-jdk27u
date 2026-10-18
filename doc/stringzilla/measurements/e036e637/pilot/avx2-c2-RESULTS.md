# Complete-image candidate measurements: avx2 c2

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 4.805 ± 0.052 | 4.590 ± 0.012 | 4.627 ± 0.086 | — | — |
| stock | tiny-utf16 | 3.302 ± 0.037 | 3.193 ± 0.008 | 3.186 ± 0.006 | disabled | — |
| stock | supp-char-forward-utf16-below | 7.769 ± 0.019 | 6.178 ± 0.021 | 7.769 ± 0.023 | — | — |
| stock | supp-char-forward-utf16-at | 7.766 ± 0.014 | 5.824 ± 0.022 | 7.010 ± 1.204 | — | — |
| stock | supp-char-forward-utf16-bulk | 131.404 ± 0.292 | 119.197 ± 0.285 | 125.170 ± 9.555 | — | — |
| stock | supp-char-reverse-latin-below | 84.814 ± 4.365 | 86.584 ± 5.324 | 85.522 ± 3.579 | original, disabled | — |
| stock | supp-char-reverse-latin-at | 83.148 ± 0.358 | 21.259 ± 0.290 | 74.714 ± 0.225 | — | — |
| stock | supp-char-reverse-latin-bulk | 1254.432 ± 2.323 | 105.004 ± 0.645 | 1094.457 ± 3.046 | — | — |
| stock | supp-char-reverse-latin-early | 3.607 ± 0.062 | 4.688 ± 0.012 | 4.693 ± 0.015 | original | original |
| stock | pilot-char-reverse-utf16-128-miss | 31.704 ± 0.027 | 34.663 ± 0.088 | 32.503 ± 0.064 | original, disabled | original, disabled |
| stock | pilot-char-reverse-utf16-255-miss | 56.856 ± 0.078 | 59.868 ± 0.107 | 58.769 ± 5.915 | original, disabled | original |
| stock | pilot-char-reverse-utf16-256-miss | 57.212 ± 0.077 | 51.774 ± 0.098 | 57.872 ± 0.185 | — | — |
| stock | pilot-char-reverse-utf16-4096-miss | 829.711 ± 1.071 | 446.103 ± 0.642 | 832.495 ± 1.631 | — | — |
| stock | supp-char-reverse-utf16-early | 3.616 ± 0.025 | 3.892 ± 0.007 | 3.895 ± 0.010 | original | original |
| stock | utf16-uniform-end-129-129 | 61.751 ± 0.099 | 48.489 ± 0.165 | 42.649 ± 0.100 | disabled | disabled |
| stock | utf16-uniform-end-130-129 | 51.891 ± 15.693 | 48.438 ± 0.124 | 42.709 ± 0.222 | disabled | disabled |
| stock | overlap-min-latin | 184.466 ± 0.820 | 23.767 ± 0.040 | 184.473 ± 0.793 | — | — |
| stock | overlap-min-utf16 | 113.514 ± 0.203 | 90.077 ± 2.418 | 86.455 ± 0.255 | disabled | disabled |
| stock | pilot-utf16-126-end | 5.959 ± 0.137 | 8.263 ± 0.041 | 6.155 ± 0.017 | original, disabled | original, disabled |
| stock | pilot-utf16-127-end | 5.949 ± 0.021 | 8.289 ± 0.016 | 6.186 ± 0.088 | original, disabled | original, disabled |
| stock | pilot-utf16-128-end | 5.947 ± 0.046 | 8.282 ± 0.026 | 6.303 ± 0.746 | original, disabled | original, disabled |
| stock | pilot-latin-bulk-end | 6.202 ± 0.017 | 7.577 ± 0.056 | 6.363 ± 0.022 | original, disabled | original, disabled |
| stock | latin-span-31 | 2793.845 ± 3.909 | 19.783 ± 0.074 | 2820.300 ± 10.724 | — | — |
| stock | latin-span-32 | 2965.994 ± 133.802 | 21.227 ± 0.093 | 2905.430 ± 10.829 | — | — |
| stock | latin-span-33 | 2967.484 ± 5.419 | 21.475 ± 0.149 | 2995.615 ± 6.731 | — | — |
| stock | utf16-span-15 | 804.958 ± 0.641 | 62.707 ± 0.111 | 655.563 ± 61.970 | — | — |
| stock | utf16-span-16 | 862.747 ± 14.992 | 70.714 ± 1.029 | 691.342 ± 1.568 | — | — |
| stock | utf16-span-17 | 908.005 ± 1.444 | 70.863 ± 0.491 | 731.440 ± 1.809 | — | — |
| stock | pilot-x86-mixed-end-15 | 12.927 ± 0.041 | 14.729 ± 0.034 | 13.698 ± 0.292 | original, disabled | original, disabled |
| stock | pilot-x86-mixed-end-17 | 13.675 ± 0.048 | 15.282 ± 0.370 | 14.494 ± 0.069 | original, disabled | original, disabled |
| stock | pilot-x86-mixed-end-32 | 17.370 ± 0.077 | 19.734 ± 0.087 | 18.810 ± 0.185 | original, disabled | original, disabled |
| stock | pilot-x86-mixed-end-33 | 18.388 ± 0.065 | 20.443 ± 0.062 | 19.840 ± 1.085 | original, disabled | original |
| stock | pilot-x86-mixed-end-47 | 21.752 ± 0.075 | 24.389 ± 0.198 | 22.710 ± 0.070 | original, disabled | original, disabled |
| stock | pilot-x86-mixed-end-48 | 21.571 ± 0.199 | 17.173 ± 0.168 | 23.417 ± 0.029 | — | — |
| stock | pilot-x86-mixed-end-49 | 22.267 ± 0.110 | 19.627 ± 0.219 | 23.610 ± 0.079 | — | — |
| stock | pilot-x86-mixed-miss-47 | 819.606 ± 0.787 | 574.460 ± 0.420 | 826.393 ± 30.120 | — | — |
| stock | pilot-x86-mixed-miss-48 | 819.792 ± 1.528 | 571.765 ± 1.366 | 820.001 ± 0.947 | — | — |
| stock | pilot-x86-mixed-miss-49 | 820.690 ± 1.261 | 577.908 ± 1.202 | 822.821 ± 1.979 | — | — |
| stock | pilot-x86-char-forward-latin-bulk | 67.082 ± 0.253 | 60.396 ± 0.105 | 67.049 ± 0.170 | — | — |
| stock | pilot-x86-char-reverse-utf16-127-miss | 31.361 ± 0.042 | 32.296 ± 0.052 | 32.342 ± 0.101 | original | original |
| stock | utf16-period2-miss-2048-256 | 2546.798 ± 5.955 | 159.179 ± 0.587 | 2224.762 ± 502.116 | — | — |
| stock | utf16-period3-miss-2047-257 | 2962.910 ± 9.327 | 171.270 ± 0.568 | 2422.701 ± 26.834 | — | — |
| periodic | supp-latin-period3-abc-miss-4095-513 | 4230.056 ± 22.020 | 645.524 ± 1.733 | 4501.733 ± 313.838 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 1987.436 ± 21.078 | 162.754 ± 0.311 | 1695.516 ± 6.107 | — | — |
