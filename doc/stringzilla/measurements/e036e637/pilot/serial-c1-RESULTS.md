# Complete-image candidate measurements: serial c1

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 5.811 ± 0.175 | 6.329 ± 0.146 | 6.535 ± 0.083 | original | original |
| stock | tiny-utf16 | 7.000 ± 0.220 | 4.985 ± 0.059 | 5.052 ± 0.081 | — | — |
| stock | pilot-latin-31-end | 7.757 ± 0.068 | 7.883 ± 0.086 | 7.967 ± 0.227 | original | — |
| stock | pilot-latin-31-miss | 29.832 ± 1.235 | 30.728 ± 1.169 | 30.300 ± 0.716 | original, disabled | — |
| stock | pilot-latin-32-end | 7.737 ± 0.045 | 7.069 ± 0.070 | 8.089 ± 0.183 | — | — |
| stock | pilot-latin-32-miss | 31.075 ± 0.917 | 35.504 ± 1.207 | 30.859 ± 0.497 | original, disabled | original, disabled |
| stock | pilot-latin-33-end | 7.708 ± 0.222 | 7.098 ± 0.072 | 8.060 ± 0.088 | — | — |
| stock | pilot-latin-33-miss | 31.608 ± 0.469 | 36.736 ± 0.918 | 32.523 ± 0.997 | original, disabled | original, disabled |
| stock | pilot-mixed-end-9-scope1 | 11.825 ± 0.017 | 16.115 ± 0.597 | 11.606 ± 0.065 | original, disabled | original, disabled |
| stock | pilot-mixed-end-31-scope1 | 30.323 ± 1.020 | 33.525 ± 0.332 | 30.015 ± 0.056 | original, disabled | original, disabled |
| stock | pilot-mixed-end-32-scope1 | 31.131 ± 0.645 | 33.017 ± 1.437 | 30.876 ± 0.054 | original, disabled | disabled |
| stock | pilot-mixed-end-33-scope1 | 32.008 ± 0.809 | 33.971 ± 0.408 | 31.710 ± 0.094 | original, disabled | original, disabled |
| stock | pilot-mixed-end-129-scope1 | 112.892 ± 1.290 | 116.271 ± 0.107 | 112.579 ± 0.309 | original, disabled | original, disabled |
| stock | supp-char-forward-utf16-below | 55.215 ± 0.211 | 54.965 ± 0.179 | 55.453 ± 1.551 | — | — |
| stock | supp-char-forward-utf16-at | 55.811 ± 1.038 | 49.701 ± 3.006 | 55.284 ± 0.058 | — | — |
| stock | supp-char-forward-utf16-bulk | 1755.996 ± 44.073 | 1184.987 ± 34.483 | 1740.304 ± 16.971 | — | — |
| stock | supp-char-reverse-latin-below | 155.111 ± 1.244 | 155.895 ± 0.421 | 157.358 ± 0.545 | original | — |
| stock | supp-char-reverse-latin-at | 156.215 ± 4.078 | 24.543 ± 0.729 | 157.525 ± 0.791 | — | — |
| stock | supp-char-reverse-latin-bulk | 2341.102 ± 77.990 | 171.529 ± 0.309 | 2312.909 ± 5.611 | — | — |
| stock | supp-char-reverse-latin-early | 7.927 ± 0.411 | 7.908 ± 0.262 | 8.026 ± 0.563 | — | — |
| stock | pilot-char-reverse-utf16-128-miss | 65.902 ± 0.231 | 53.713 ± 1.609 | 62.358 ± 0.202 | — | — |
| stock | pilot-char-reverse-utf16-255-miss | 134.985 ± 0.501 | 90.168 ± 3.743 | 128.964 ± 0.660 | — | — |
| stock | pilot-char-reverse-utf16-256-miss | 136.320 ± 3.256 | 90.730 ± 0.724 | 129.212 ± 0.368 | — | — |
| stock | pilot-char-reverse-utf16-4096-miss | 1976.726 ± 15.587 | 1177.005 ± 3.533 | 1827.987 ± 5.847 | — | — |
| stock | supp-char-reverse-utf16-early | 7.301 ± 0.214 | 7.956 ± 0.262 | 8.686 ± 0.255 | original | original |
| stock | utf16-uniform-end-129-129 | 95.976 ± 0.487 | 98.311 ± 0.660 | 95.629 ± 0.253 | original, disabled | original, disabled |
| stock | utf16-uniform-end-130-129 | 96.018 ± 0.470 | 97.898 ± 0.275 | 95.398 ± 0.133 | original, disabled | original, disabled |
| stock | overlap-min-latin | 481.113 ± 8.217 | 483.715 ± 1.371 | 479.587 ± 4.135 | original, disabled | — |
| stock | overlap-min-utf16 | 187.567 ± 4.867 | 189.767 ± 0.959 | 191.163 ± 5.991 | original | — |
| stock | pilot-bulk-latin-miss | 5137.229 ± 1394.145 | 1077.635 ± 1.353 | 5142.589 ± 1591.219 | — | — |
| periodic | supp-latin-period3-abc-miss-4095-513 | 6413.569 ± 142.375 | 1073.555 ± 14.890 | 6359.252 ± 178.525 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 3231.852 ± 40.506 | 830.758 ± 1.365 | 2457.194 ± 41.724 | — | — |
