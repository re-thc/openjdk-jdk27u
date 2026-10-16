# Mixed immediate-match prefix boundary qualification

Complete source-built JDK controls at production revision `90e763c6758c08b2cb8981beb8a038cf86c279e8`.
5 measured workloads, 45 matched triplets,
135 measurements and 270 isolated JVM forks.
Means and JMH 99.9% confidence half-widths are ns/op. Ratios below one are slower enabled means.
Every higher enabled mean is marked `(slower)` using unrounded scores, even if its ratio rounds to one.
All 9 higher enabled means remain visible, including overlapping intervals.
There are 1 higher non-overlapping enabled/control intervals.
Interval comparisons are descriptive, without a multiple-testing correction; overlap does not establish equivalence.

[Method](../BENCHMARKS.md#method) and [raw records, image fingerprints and build provenance](mixed-prefix-results.json).

| Backend | Tier | Workload | Original JDK | Disabled | Enabled | Original / enabled | Disabled / enabled | Intervals: original / disabled |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| avx2 | c1 | mixed-prefix-127 | 126.42 ± 5.59 | 125.62 ± 11.15 | 73.64 ± 2.34 | 1.717× | 1.706× | faster / faster |
| avx2 | c1 | mixed-prefix-128 | 128.33 ± 6.71 | 115.87 ± 5.43 | 75.80 ± 4.28 | 1.693× | 1.529× | faster / faster |
| avx2 | c1 | mixed-prefix-129 | 144.54 ± 17.64 | 119.81 ± 3.79 | 124.46 ± 14.15 | 1.161× | 0.963× (slower) | overlap / overlap |
| avx2 | c1 | mixed-prefix-64 | 67.34 ± 2.95 | 64.87 ± 6.07 | 22.23 ± 1.26 | 3.029× | 2.917× | faster / faster |
| avx2 | c1 | mixed-prefix-66 | 69.39 ± 4.13 | 64.92 ± 6.49 | 16.21 ± 1.11 | 4.281× | 4.006× | faster / faster |
| avx2 | c2 | mixed-prefix-127 | 44.72 ± 3.69 | 37.73 ± 1.59 | 29.81 ± 1.51 | 1.500× | 1.266× | faster / faster |
| avx2 | c2 | mixed-prefix-128 | 43.82 ± 2.10 | 39.63 ± 1.06 | 29.58 ± 1.60 | 1.482× | 1.340× | faster / faster |
| avx2 | c2 | mixed-prefix-129 | 45.31 ± 2.48 | 39.04 ± 2.08 | 36.75 ± 0.61 | 1.233× | 1.062× | faster / overlap |
| avx2 | c2 | mixed-prefix-64 | 23.96 ± 3.41 | 23.34 ± 0.84 | 19.15 ± 0.96 | 1.251× | 1.218× | faster / faster |
| avx2 | c2 | mixed-prefix-66 | 27.18 ± 1.31 | 23.73 ± 2.04 | 18.61 ± 0.38 | 1.461× | 1.276× | faster / faster |
| avx2 | interpreter | mixed-prefix-127 | 5,425.23 ± 158.57 | 5,767.63 ± 451.57 | 3,197.27 ± 116.87 | 1.697× | 1.804× | faster / faster |
| avx2 | interpreter | mixed-prefix-128 | 5,414.55 ± 277.76 | 6,011.92 ± 296.46 | 3,292.94 ± 146.57 | 1.644× | 1.826× | faster / faster |
| avx2 | interpreter | mixed-prefix-129 | 5,515.00 ± 220.42 | 5,836.99 ± 375.29 | 5,832.03 ± 471.59 | 0.946× (slower) | 1.001× | overlap / overlap |
| avx2 | interpreter | mixed-prefix-64 | 3,053.22 ± 248.10 | 3,051.04 ± 158.24 | 322.78 ± 13.79 | 9.459× | 9.452× | faster / faster |
| avx2 | interpreter | mixed-prefix-66 | 3,024.43 ± 133.59 | 3,177.23 ± 83.96 | 468.29 ± 21.97 | 6.458× | 6.785× | faster / faster |
| avx512 | c1 | mixed-prefix-127 | 137.01 ± 13.86 | 122.11 ± 7.30 | 76.19 ± 6.62 | 1.798× | 1.603× | faster / faster |
| avx512 | c1 | mixed-prefix-128 | 131.20 ± 4.99 | 118.18 ± 4.29 | 74.47 ± 2.71 | 1.762× | 1.587× | faster / faster |
| avx512 | c1 | mixed-prefix-129 | 129.65 ± 2.59 | 123.86 ± 9.93 | 124.93 ± 7.40 | 1.038× | 0.991× (slower) | overlap / overlap |
| avx512 | c1 | mixed-prefix-64 | 66.57 ± 2.25 | 61.03 ± 0.92 | 22.20 ± 0.98 | 2.999× | 2.749× | faster / faster |
| avx512 | c1 | mixed-prefix-66 | 69.59 ± 3.38 | 62.72 ± 3.47 | 16.37 ± 2.05 | 4.251× | 3.832× | faster / faster |
| avx512 | c2 | mixed-prefix-127 | 43.43 ± 1.73 | 37.03 ± 3.83 | 30.79 ± 2.05 | 1.411× | 1.203× | faster / faster |
| avx512 | c2 | mixed-prefix-128 | 43.09 ± 1.15 | 38.60 ± 2.15 | 28.94 ± 0.88 | 1.489× | 1.334× | faster / faster |
| avx512 | c2 | mixed-prefix-129 | 45.73 ± 2.88 | 38.43 ± 1.12 | 37.86 ± 2.04 | 1.208× | 1.015× | faster / overlap |
| avx512 | c2 | mixed-prefix-64 | 25.32 ± 4.19 | 22.52 ± 0.24 | 20.39 ± 0.89 | 1.242× | 1.105× | overlap / faster |
| avx512 | c2 | mixed-prefix-66 | 26.94 ± 1.32 | 23.53 ± 0.28 | 19.35 ± 0.94 | 1.392× | 1.216× | faster / faster |
| avx512 | interpreter | mixed-prefix-127 | 5,758.21 ± 287.07 | 5,923.09 ± 606.01 | 3,339.55 ± 122.04 | 1.724× | 1.774× | faster / faster |
| avx512 | interpreter | mixed-prefix-128 | 5,645.25 ± 374.12 | 5,650.19 ± 245.49 | 3,376.88 ± 139.22 | 1.672× | 1.673× | faster / faster |
| avx512 | interpreter | mixed-prefix-129 | 5,647.03 ± 448.31 | 5,937.33 ± 319.60 | 6,072.33 ± 364.48 | 0.930× (slower) | 0.978× (slower) | overlap / overlap |
| avx512 | interpreter | mixed-prefix-64 | 3,009.91 ± 159.28 | 3,010.93 ± 117.28 | 309.32 ± 4.96 | 9.731× | 9.734× | faster / faster |
| avx512 | interpreter | mixed-prefix-66 | 3,040.32 ± 104.55 | 3,178.43 ± 196.39 | 474.83 ± 23.64 | 6.403× | 6.694× | faster / faster |
| serial | c1 | mixed-prefix-127 | 126.94 ± 5.17 | 120.55 ± 3.32 | 110.03 ± 7.54 | 1.154× | 1.096× | faster / overlap |
| serial | c1 | mixed-prefix-128 | 126.82 ± 5.84 | 115.90 ± 3.79 | 110.62 ± 4.21 | 1.147× | 1.048× | faster / overlap |
| serial | c1 | mixed-prefix-129 | 131.15 ± 8.80 | 121.02 ± 4.82 | 122.13 ± 4.83 | 1.074× | 0.991× (slower) | overlap / overlap |
| serial | c1 | mixed-prefix-64 | 70.82 ± 4.63 | 60.35 ± 1.35 | 67.72 ± 1.82 | 1.046× | 0.891× (slower) | overlap / slower |
| serial | c1 | mixed-prefix-66 | 70.64 ± 4.95 | 66.24 ± 3.78 | 51.23 ± 1.04 | 1.379× | 1.293× | faster / faster |
| serial | c2 | mixed-prefix-127 | 44.16 ± 2.18 | 42.49 ± 1.81 | 30.82 ± 2.71 | 1.433× | 1.378× | faster / faster |
| serial | c2 | mixed-prefix-128 | 45.96 ± 8.51 | 45.88 ± 9.41 | 28.36 ± 0.92 | 1.620× | 1.618× | faster / faster |
| serial | c2 | mixed-prefix-129 | 43.58 ± 1.28 | 40.16 ± 2.32 | 40.63 ± 1.54 | 1.072× | 0.988× (slower) | faster / overlap |
| serial | c2 | mixed-prefix-64 | 25.03 ± 0.85 | 23.81 ± 0.67 | 20.59 ± 0.56 | 1.215× | 1.156× | faster / faster |
| serial | c2 | mixed-prefix-66 | 26.93 ± 1.53 | 24.50 ± 1.47 | 18.71 ± 0.68 | 1.440× | 1.310× | faster / faster |
| serial | interpreter | mixed-prefix-127 | 5,806.57 ± 253.84 | 5,701.63 ± 346.90 | 3,461.63 ± 160.47 | 1.677× | 1.647× | faster / faster |
| serial | interpreter | mixed-prefix-128 | 5,757.15 ± 286.68 | 5,629.85 ± 280.22 | 3,507.29 ± 145.24 | 1.641× | 1.605× | faster / faster |
| serial | interpreter | mixed-prefix-129 | 6,010.81 ± 330.49 | 5,630.69 ± 234.60 | 5,799.97 ± 254.97 | 1.036× | 0.971× (slower) | overlap / overlap |
| serial | interpreter | mixed-prefix-64 | 3,057.25 ± 247.49 | 3,087.81 ± 211.70 | 394.12 ± 25.47 | 7.757× | 7.835× | faster / faster |
| serial | interpreter | mixed-prefix-66 | 3,286.30 ± 264.25 | 3,187.19 ± 221.14 | 565.22 ± 181.20 | 5.814× | 5.639× | faster / faster |
