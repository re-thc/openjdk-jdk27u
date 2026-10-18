# Complete-image candidate measurements: neon c1

Original `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`; fork `e036e637a5aff1e2506ff82953a3fbd9fdba6a9d`. Two forks,3×500ms warmup and5×500ms measurement; ns/op ± JMH99.9% error. Every higher enabled mean is retained; overlapping intervals do not establish equivalence.

| Phase | Case | Original | Enabled | Disabled | Higher enabled mean | Nonoverlapping loss |
| --- | --- | ---: | ---: | ---: | --- | --- |
| stock | tiny-latin | 6.466 ± 0.028 | 6.650 ± 0.096 | 6.483 ± 0.047 | original, disabled | original, disabled |
| stock | tiny-utf16 | 7.087 ± 0.036 | 5.985 ± 0.019 | 5.910 ± 0.008 | disabled | disabled |
| stock | pilot-latin-31-end | 10.203 ± 0.016 | 10.282 ± 0.047 | 10.262 ± 0.050 | original, disabled | original |
| stock | pilot-latin-31-miss | 27.833 ± 0.079 | 28.122 ± 0.093 | 28.565 ± 2.067 | original | original |
| stock | pilot-latin-32-end | 10.220 ± 0.052 | 8.129 ± 0.026 | 10.413 ± 0.043 | — | — |
| stock | pilot-latin-32-miss | 28.676 ± 0.182 | 31.504 ± 0.190 | 29.289 ± 0.136 | original, disabled | original, disabled |
| stock | pilot-latin-33-end | 10.213 ± 0.057 | 8.224 ± 0.096 | 10.448 ± 0.034 | — | — |
| stock | pilot-latin-33-miss | 29.239 ± 0.106 | 32.162 ± 0.070 | 30.131 ± 2.028 | original, disabled | original |
| stock | pilot-mixed-end-9-scope2 | 15.708 ± 0.058 | 18.092 ± 0.077 | 14.190 ± 0.046 | original, disabled | original, disabled |
| stock | pilot-mixed-end-31-scope2 | 40.432 ± 0.085 | 31.164 ± 0.485 | 35.870 ± 0.061 | — | — |
| stock | pilot-mixed-end-32-scope2 | 41.478 ± 0.032 | 30.434 ± 0.039 | 36.875 ± 0.120 | — | — |
| stock | pilot-mixed-end-33-scope2 | 42.661 ± 0.063 | 36.299 ± 0.481 | 37.890 ± 0.078 | — | — |
| stock | pilot-mixed-end-129-scope2 | 150.689 ± 0.194 | 148.034 ± 0.580 | 134.331 ± 0.863 | disabled | disabled |
| stock | supp-char-forward-utf16-below | 75.627 ± 0.071 | 78.607 ± 0.110 | 75.585 ± 0.131 | original, disabled | original, disabled |
| stock | supp-char-forward-utf16-at | 76.340 ± 0.137 | 29.193 ± 0.216 | 76.361 ± 0.163 | — | — |
| stock | supp-char-forward-utf16-bulk | 2379.872 ± 3.281 | 431.977 ± 0.806 | 2380.890 ± 5.972 | — | — |
| stock | supp-char-reverse-latin-below | 171.849 ± 1.679 | 159.289 ± 0.841 | 171.981 ± 0.152 | — | — |
| stock | supp-char-reverse-latin-at | 172.622 ± 1.127 | 24.381 ± 0.285 | 172.634 ± 0.310 | — | — |
| stock | supp-char-reverse-latin-bulk | 2675.921 ± 10.055 | 165.668 ± 0.254 | 2670.574 ± 3.687 | — | — |
| stock | supp-char-reverse-latin-early | 7.238 ± 0.017 | 7.248 ± 0.063 | 7.283 ± 0.026 | original | — |
| stock | pilot-char-reverse-utf16-128-miss | 83.011 ± 0.607 | 44.729 ± 0.195 | 89.163 ± 0.187 | — | — |
| stock | pilot-char-reverse-utf16-255-miss | 158.752 ± 0.387 | 60.285 ± 0.148 | 171.857 ± 0.300 | — | — |
| stock | pilot-char-reverse-utf16-256-miss | 158.902 ± 0.961 | 62.736 ± 0.326 | 172.227 ± 0.242 | — | — |
| stock | pilot-char-reverse-utf16-4096-miss | 2428.918 ± 3.117 | 620.383 ± 1.250 | 2672.463 ± 4.496 | — | — |
| stock | supp-char-reverse-utf16-early | 7.004 ± 0.085 | 6.916 ± 0.074 | 6.822 ± 0.032 | disabled | — |
| stock | utf16-uniform-end-129-129 | 135.502 ± 0.207 | 138.648 ± 0.204 | 142.717 ± 0.278 | original | original |
| stock | utf16-uniform-end-130-129 | 135.421 ± 0.085 | 138.515 ± 0.104 | 142.752 ± 0.348 | original | original |
| stock | overlap-min-latin | 643.903 ± 2.866 | 647.815 ± 0.809 | 643.388 ± 0.542 | original, disabled | original, disabled |
| stock | overlap-min-utf16 | 264.759 ± 0.278 | 268.043 ± 0.336 | 279.436 ± 0.305 | original | original |
| stock | pilot-bulk-latin-miss | 3174.044 ± 10.520 | 327.279 ± 0.388 | 3176.104 ± 22.133 | — | — |
| stock | pilot-neon-utf16-127-4-miss-c1 | 87.871 ± 0.525 | 104.931 ± 0.339 | 88.611 ± 1.252 | original, disabled | original, disabled |
| periodic | supp-latin-period3-abc-miss-4095-513 | 5995.217 ± 8.204 | 171.602 ± 0.261 | 5994.685 ± 9.498 | — | — |
| periodic | supp-utf16-period3-abc-miss-2047-257 | 2458.340 ± 3.929 | 247.866 ± 0.747 | 2503.570 ± 6.402 | — | — |
