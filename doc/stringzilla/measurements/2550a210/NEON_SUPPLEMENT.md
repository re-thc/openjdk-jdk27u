# AArch64 supplemental measurements at 2550a210

Complete original `416d7db3` and fork `2550a210` images, GCC 16.0.1, NEON. All 28 triplets use two forks, 3 × 500 ms warmup and 5 × 500 ms measurement. Values are ns/op with JMH 99.9% error. Every higher enabled mean is shown.

Archive metadata, downloaded ZIP, inner archives, source identities and build profiles are verified. Comparison with the primary producer's final image fingerprints remains pending while that job measures.

| Tier | Case | Original ns/op | Enabled ns/op | Disabled ns/op | Higher enabled mean |
| --- | --- | ---: | ---: | ---: | --- |
| interpreter | latin-prefix-miss-575-511 | 237479.102 ± 27057.781 | 1209.006 ± 3.834 | 283435.570 ± 37025.732 | — |
| c1 | latin-prefix-miss-575-511 | 20747.671 ± 35.510 | 837.248 ± 3.655 | 20754.121 ± 86.992 | — |
| c2 | latin-prefix-miss-575-511 | 7364.345 ± 9.784 | 835.451 ± 3.548 | 7387.043 ± 32.924 | — |
| interpreter | utf16-prefix-miss-303-256 | 514322.207 ± 49377.334 | 8951.118 ± 41.337 | 524022.068 ± 17859.819 | — |
| c1 | utf16-prefix-miss-303-256 | 6219.976 ± 15.082 | 8237.063 ± 30.741 | 6222.152 ± 5.873 | original, disabled |
| c2 | utf16-prefix-miss-303-256 | 2546.897 ± 3.805 | 8263.961 ± 48.368 | 2558.629 ± 2.570 | original, disabled |
| interpreter | utf16-uniform-end-129-129 | 10761.659 ± 337.770 | 589.322 ± 6.485 | 11753.860 ± 523.856 | — |
| c1 | utf16-uniform-end-129-129 | 135.501 ± 0.248 | 146.313 ± 0.112 | 135.201 ± 0.110 | original, disabled |
| c2 | utf16-uniform-end-129-129 | 48.862 ± 5.349 | 56.271 ± 0.079 | 48.381 ± 0.119 | original, disabled |
| interpreter | utf16-uniform-end-130-129 | 11169.248 ± 1047.147 | 1255.269 ± 10.194 | 11720.967 ± 500.146 | — |
| c1 | utf16-uniform-end-130-129 | 135.474 ± 0.244 | 146.382 ± 0.254 | 135.431 ± 0.289 | original, disabled |
| c2 | utf16-uniform-end-130-129 | 52.129 ± 0.120 | 56.373 ± 0.102 | 48.482 ± 0.198 | original, disabled |
| interpreter | latin-end-32 | 734.093 ± 92.110 | 376.250 ± 2.567 | 806.641 ± 86.678 | — |
| c1 | latin-end-32 | 44.839 ± 0.064 | 18.272 ± 0.232 | 45.040 ± 0.081 | — |
| c2 | latin-end-32 | 16.545 ± 0.050 | 14.533 ± 0.177 | 16.680 ± 0.054 | — |
| interpreter | latin-end-64 | 1152.464 ± 176.729 | 380.439 ± 8.956 | 1285.952 ± 167.352 | — |
| c1 | latin-end-64 | 84.569 ± 0.170 | 20.027 ± 0.146 | 84.660 ± 0.096 | — |
| c2 | latin-end-64 | 26.647 ± 0.044 | 16.145 ± 0.029 | 27.132 ± 0.221 | — |
| interpreter | latin-miss-64 | 39360.660 ± 3778.926 | 721.223 ± 6.371 | 43224.359 ± 3269.447 | — |
| c1 | latin-miss-64 | 3123.155 ± 6.073 | 358.241 ± 1.492 | 3119.271 ± 6.013 | — |
| c2 | latin-miss-64 | 714.775 ± 11.077 | 351.118 ± 0.552 | 721.665 ± 6.890 | — |
| interpreter | utf16-end-64 | 5660.093 ± 299.819 | 577.175 ± 6.777 | 6123.996 ± 326.785 | — |
| c1 | utf16-end-64 | 70.237 ± 0.128 | 26.506 ± 0.032 | 70.082 ± 0.116 | — |
| c2 | utf16-end-64 | 25.015 ± 0.033 | 21.418 ± 0.063 | 26.702 ± 0.038 | — |
| interpreter | utf16-miss-64 | 176846.846 ± 17477.853 | 1232.717 ± 2.964 | 185941.219 ± 9271.887 | — |
| c1 | utf16-miss-64 | 2495.012 ± 15.039 | 683.247 ± 0.950 | 2632.202 ± 5.379 | — |
| c2 | utf16-miss-64 | 736.308 ± 2.726 | 677.239 ± 0.678 | 701.131 ± 8.171 | — |
| interpreter | mixed-interpreter-end-64 | 3691.305 ± 277.861 | 491.530 ± 13.186 | 3695.607 ± 291.121 | — |
