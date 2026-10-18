# Complete-image StringZilla measurements

Runtime source: `4592230b14fc2f4b537b162fd7f6b791e882b615`. Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.

Every row compares the original complete JDK, the enabled complete fork and the
same fork image with acceleration disabled on one host. Lower ns/op is faster.
Values are mean ± JMH 99.9% error from two forks with five measured iterations
per fork. Ratios use unrounded means. Intervals are descriptive; overlap does
not establish equivalence.

`↑O` marks every enabled mean higher than original; `↑D` marks every mean
higher than disabled. `!` marks a higher mean whose reported intervals do
not overlap. Flags use unrounded values, including differences hidden by
rounding. All rows and higher means are retained.

`H` is the actual searched string length in code units, including the fixture's
needle and sentinel where applicable. `N` is the needle length; equality has
no needle; character searches use one BMP code unit. The case ID identifies
the exact manifest parameters and shape.

## serial

| Tier | Case | H | N | Original ns/op | Enabled ns/op | Disabled ns/op | O/E | D/E | Higher enabled mean |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| interpreter | supp-latin-single-end-257-257 | 257 | 257 | 2187.167 ± 284.797 | 262.594 ± 57.946 | 2558.796 ± 117.098 | 8.329 | 9.744 | — |
| interpreter | supp-latin-single-miss-257-257 | 257 | 257 | 174.874 ± 6.301 | 185.360 ± 4.884 | 189.746 ± 3.633 | 0.943 | 1.024 | ↑O |
| interpreter | supp-latin-two-end-258-257 | 258 | 257 | 2336.585 ± 252.809 | 330.068 ± 4.165 | 2526.941 ± 158.317 | 7.079 | 7.656 | — |
| c1 | supp-latin-single-end-257-257 | 257 | 257 | 252.433 ± 2.816 | 257.682 ± 2.046 | 252.259 ± 1.353 | 0.980 | 0.979 | ↑O! ↑D! |
| c1 | supp-latin-single-miss-257-257 | 257 | 257 | 4.150 ± 0.116 | 4.006 ± 0.050 | 4.340 ± 0.197 | 1.036 | 1.083 | — |
| c1 | supp-latin-two-end-258-257 | 258 | 257 | 253.032 ± 3.537 | 256.963 ± 4.321 | 256.004 ± 8.697 | 0.985 | 0.996 | ↑O ↑D |
| c2 | supp-latin-single-end-257-257 | 257 | 257 | 45.497 ± 2.830 | 54.675 ± 2.304 | 45.060 ± 0.939 | 0.832 | 0.824 | ↑O! ↑D! |
| c2 | supp-latin-single-miss-257-257 | 257 | 257 | 2.751 ± 0.028 | 2.300 ± 0.037 | 2.833 ± 0.024 | 1.196 | 1.232 | — |
| c2 | supp-latin-two-end-258-257 | 258 | 257 | 45.514 ± 0.834 | 55.161 ± 1.576 | 45.412 ± 0.665 | 0.825 | 0.823 | ↑O! ↑D! |

## avx2

| Tier | Case | H | N | Original ns/op | Enabled ns/op | Disabled ns/op | O/E | D/E | Higher enabled mean |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| interpreter | supp-latin-two-end-258-257 | 258 | 257 | 3592.267 ± 126.503 | 378.620 ± 3.816 | 3596.671 ± 41.892 | 9.488 | 9.499 | — |
| c1 | supp-latin-two-end-258-257 | 258 | 257 | 252.402 ± 2.763 | 17.971 ± 0.742 | 253.000 ± 3.049 | 14.045 | 14.078 | — |
| c2 | supp-latin-two-end-258-257 | 258 | 257 | 71.030 ± 0.632 | 14.907 ± 0.198 | 71.006 ± 2.598 | 4.765 | 4.763 | — |

## avx512

| Tier | Case | H | N | Original ns/op | Enabled ns/op | Disabled ns/op | O/E | D/E | Higher enabled mean |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| interpreter | supp-latin-two-end-258-257 | 258 | 257 | 3531.427 ± 95.462 | 376.197 ± 11.143 | 3655.030 ± 196.354 | 9.387 | 9.716 | — |
| c1 | supp-latin-two-end-258-257 | 258 | 257 | 248.491 ± 3.646 | 17.556 ± 0.413 | 246.559 ± 4.062 | 14.154 | 14.044 | — |
| c2 | supp-latin-two-end-258-257 | 258 | 257 | 72.223 ± 3.480 | 14.868 ± 0.215 | 71.369 ± 1.539 | 4.857 | 4.800 | — |

## neon

| Tier | Case | H | N | Original ns/op | Enabled ns/op | Disabled ns/op | O/E | D/E | Higher enabled mean |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| interpreter | supp-latin-single-end-257-257 | 257 | 257 | 3904.651 ± 871.697 | 431.498 ± 5.697 | 4000.227 ± 496.161 | 9.049 | 9.271 | — |
| interpreter | supp-latin-single-miss-257-257 | 257 | 257 | 302.720 ± 12.031 | 326.036 ± 11.668 | 336.681 ± 15.516 | 0.928 | 1.033 | ↑O |
| interpreter | supp-latin-two-end-258-257 | 258 | 257 | 3546.411 ± 517.139 | 667.629 ± 7.330 | 3782.898 ± 546.823 | 5.312 | 5.666 | — |
| c1 | supp-latin-single-end-257-257 | 257 | 257 | 324.805 ± 1.972 | 327.887 ± 0.447 | 324.331 ± 0.353 | 0.991 | 0.989 | ↑O! ↑D! |
| c1 | supp-latin-single-miss-257-257 | 257 | 257 | 6.505 ± 0.033 | 5.430 ± 0.015 | 6.652 ± 0.015 | 1.198 | 1.225 | — |
| c1 | supp-latin-two-end-258-257 | 258 | 257 | 324.234 ± 0.297 | 327.825 ± 0.640 | 324.597 ± 0.508 | 0.989 | 0.990 | ↑O! ↑D! |
| c2 | supp-latin-single-end-257-257 | 257 | 257 | 89.713 ± 0.163 | 110.451 ± 0.167 | 90.463 ± 0.413 | 0.812 | 0.819 | ↑O! ↑D! |
| c2 | supp-latin-single-miss-257-257 | 257 | 257 | 3.433 ± 0.019 | 2.878 ± 0.004 | 3.677 ± 0.017 | 1.193 | 1.278 | — |
| c2 | supp-latin-two-end-258-257 | 258 | 257 | 89.925 ± 0.888 | 110.346 ± 0.079 | 90.649 ± 0.152 | 0.815 | 0.821 | ↑O! ↑D! |
| c2 | supp-neon-c2-utf16-positive-512-9 | 512 | 9 | 8.634 ± 0.046 | 22.236 ± 0.040 | 8.787 ± 0.013 | 0.388 | 0.395 | ↑O! ↑D! |
| c2 | supp-neon-c2-utf16-positive-512-64 | 512 | 64 | 30.176 ± 0.334 | 27.343 ± 0.040 | 30.149 ± 0.035 | 1.104 | 1.103 | — |

## msvc

| Tier | Case | H | N | Original ns/op | Enabled ns/op | Disabled ns/op | O/E | D/E | Higher enabled mean |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| interpreter | supp-latin-single-end-257-257 | 257 | 257 | 6201.644 ± 1034.366 | 494.905 ± 39.906 | 6383.099 ± 688.678 | 12.531 | 12.898 | — |
| interpreter | supp-latin-single-miss-257-257 | 257 | 257 | 383.427 ± 9.500 | 372.598 ± 29.663 | 390.963 ± 29.408 | 1.029 | 1.049 | — |
| interpreter | supp-latin-two-end-258-257 | 258 | 257 | 5425.385 ± 380.629 | 506.806 ± 31.828 | 6329.760 ± 150.197 | 10.705 | 12.490 | — |
| c1 | supp-latin-single-end-257-257 | 257 | 257 | 343.302 ± 15.441 | 359.964 ± 25.167 | 349.599 ± 16.428 | 0.954 | 0.971 | ↑O ↑D |
| c1 | supp-latin-single-miss-257-257 | 257 | 257 | 7.708 ± 0.281 | 6.538 ± 0.357 | 7.544 ± 0.400 | 1.179 | 1.154 | — |
| c1 | supp-latin-two-end-258-257 | 258 | 257 | 343.094 ± 12.519 | 350.776 ± 18.436 | 344.060 ± 15.730 | 0.978 | 0.981 | ↑O ↑D |
| c2 | supp-latin-single-end-257-257 | 257 | 257 | 89.600 ± 16.573 | 94.655 ± 4.444 | 108.750 ± 58.961 | 0.947 | 1.149 | ↑O |
| c2 | supp-latin-single-miss-257-257 | 257 | 257 | 5.368 ± 0.633 | 3.883 ± 0.153 | 5.232 ± 0.264 | 1.382 | 1.347 | — |
| c2 | supp-latin-two-end-258-257 | 258 | 257 | 82.255 ± 3.763 | 95.374 ± 4.493 | 84.614 ± 4.373 | 0.862 | 0.887 | ↑O! ↑D! |
