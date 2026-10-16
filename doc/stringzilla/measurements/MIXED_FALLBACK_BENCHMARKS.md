# Mixed fallback qualification

Complete source-built JDK controls at production revision `90e763c6758c08b2cb8981beb8a038cf86c279e8`.
5 measured workloads, 45 matched triplets,
135 measurements and 270 isolated JVM forks.
Means and JMH 99.9% confidence half-widths are ns/op. Ratios below one are slower enabled means.
Every higher enabled mean is marked `(slower)` using unrounded scores, even if its ratio rounds to one.
All 6 higher enabled means remain visible, including overlapping intervals.
There are 0 higher non-overlapping enabled/control intervals.
Interval comparisons are descriptive, without a multiple-testing correction; overlap does not establish equivalence.

[Method](../BENCHMARKS.md#method) and [raw records, image fingerprints and build provenance](mixed-fallback-results.json).

| Backend | Tier | Workload | Original JDK | Disabled | Enabled | Original / enabled | Disabled / enabled | Intervals: original / disabled |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| avx2 | c1 | mixed-reverse-above | 91.14 ± 17.39 | 50.71 ± 8.54 | 22.27 ± 1.87 | 4.093× | 2.278× | faster / faster |
| avx2 | c1 | mixed-reverse-at | 81.07 ± 2.54 | 46.45 ± 3.01 | 30.14 ± 0.94 | 2.690× | 1.541× | faster / faster |
| avx2 | c1 | mixed-reverse-below | 86.91 ± 12.75 | 53.83 ± 8.15 | 48.35 ± 2.36 | 1.797× | 1.113× | faster / overlap |
| avx2 | c1 | mixed-reverse-immediate | 71.19 ± 2.48 | 64.87 ± 4.24 | 15.53 ± 0.65 | 4.585× | 4.178× | faster / faster |
| avx2 | c1 | mixed-reverse-tiny | 6.64 ± 0.20 | 5.57 ± 0.50 | 5.34 ± 0.11 | 1.243× | 1.042× | faster / overlap |
| avx2 | c2 | mixed-reverse-above | 18.72 ± 1.05 | 17.53 ± 0.41 | 9.46 ± 0.55 | 1.980× | 1.854× | faster / faster |
| avx2 | c2 | mixed-reverse-at | 16.95 ± 1.14 | 17.28 ± 0.38 | 9.56 ± 0.80 | 1.773× | 1.808× | faster / faster |
| avx2 | c2 | mixed-reverse-below | 18.34 ± 0.46 | 18.03 ± 1.18 | 16.92 ± 0.27 | 1.084× | 1.066× | faster / overlap |
| avx2 | c2 | mixed-reverse-immediate | 24.49 ± 2.55 | 24.58 ± 0.88 | 18.63 ± 0.57 | 1.315× | 1.319× | faster / faster |
| avx2 | c2 | mixed-reverse-tiny | 3.07 ± 0.25 | 2.94 ± 0.19 | 2.67 ± 0.21 | 1.149× | 1.100× | overlap / overlap |
| avx2 | interpreter | mixed-reverse-above | 2,777.21 ± 241.57 | 2,786.87 ± 112.45 | 377.69 ± 18.65 | 7.353× | 7.379× | faster / faster |
| avx2 | interpreter | mixed-reverse-at | 2,763.99 ± 188.76 | 2,809.45 ± 187.54 | 384.75 ± 12.12 | 7.184× | 7.302× | faster / faster |
| avx2 | interpreter | mixed-reverse-below | 2,628.54 ± 98.01 | 2,754.39 ± 294.02 | 2,555.71 ± 74.12 | 1.028× | 1.078× | overlap / overlap |
| avx2 | interpreter | mixed-reverse-immediate | 3,353.14 ± 559.29 | 3,392.91 ± 337.28 | 428.44 ± 18.45 | 7.826× | 7.919× | faster / faster |
| avx2 | interpreter | mixed-reverse-tiny | 371.73 ± 20.18 | 320.89 ± 15.48 | 285.78 ± 46.36 | 1.301× | 1.123× | faster / overlap |
| avx512 | c1 | mixed-reverse-above | 86.20 ± 3.01 | 48.56 ± 4.67 | 19.78 ± 0.71 | 4.359× | 2.455× | faster / faster |
| avx512 | c1 | mixed-reverse-at | 86.79 ± 3.37 | 49.39 ± 7.09 | 18.10 ± 0.84 | 4.795× | 2.729× | faster / faster |
| avx512 | c1 | mixed-reverse-below | 83.79 ± 12.95 | 46.96 ± 4.92 | 44.42 ± 1.95 | 1.886× | 1.057× | faster / overlap |
| avx512 | c1 | mixed-reverse-immediate | 71.78 ± 8.95 | 61.92 ± 1.59 | 14.02 ± 0.60 | 5.121× | 4.417× | faster / faster |
| avx512 | c1 | mixed-reverse-tiny | 6.69 ± 0.32 | 5.19 ± 0.33 | 5.03 ± 0.15 | 1.332× | 1.033× | faster / overlap |
| avx512 | c2 | mixed-reverse-above | 18.14 ± 1.34 | 17.23 ± 0.42 | 9.03 ± 0.48 | 2.009× | 1.908× | faster / faster |
| avx512 | c2 | mixed-reverse-at | 18.24 ± 0.96 | 17.32 ± 0.57 | 9.30 ± 1.66 | 1.961× | 1.862× | faster / faster |
| avx512 | c2 | mixed-reverse-below | 18.61 ± 1.85 | 16.99 ± 0.59 | 17.70 ± 0.67 | 1.051× | 0.960× (slower) | overlap / overlap |
| avx512 | c2 | mixed-reverse-immediate | 25.86 ± 1.69 | 24.71 ± 1.82 | 20.25 ± 1.51 | 1.277× | 1.220× | faster / faster |
| avx512 | c2 | mixed-reverse-tiny | 3.36 ± 0.43 | 2.91 ± 0.12 | 2.68 ± 0.25 | 1.255× | 1.087× | faster / overlap |
| avx512 | interpreter | mixed-reverse-above | 2,823.71 ± 146.14 | 2,938.73 ± 174.74 | 403.58 ± 33.70 | 6.997× | 7.282× | faster / faster |
| avx512 | interpreter | mixed-reverse-at | 2,730.49 ± 111.42 | 2,691.02 ± 143.19 | 379.47 ± 11.08 | 7.196× | 7.092× | faster / faster |
| avx512 | interpreter | mixed-reverse-below | 2,631.93 ± 90.43 | 2,710.78 ± 144.59 | 2,689.48 ± 175.72 | 0.979× (slower) | 1.008× | overlap / overlap |
| avx512 | interpreter | mixed-reverse-immediate | 3,158.29 ± 229.43 | 3,112.64 ± 109.12 | 415.94 ± 33.10 | 7.593× | 7.483× | faster / faster |
| avx512 | interpreter | mixed-reverse-tiny | 362.18 ± 27.03 | 309.32 ± 13.63 | 276.29 ± 10.40 | 1.311× | 1.120× | faster / faster |
| serial | c1 | mixed-reverse-above | 84.11 ± 3.44 | 49.66 ± 7.27 | 47.35 ± 5.58 | 1.777× | 1.049× | faster / overlap |
| serial | c1 | mixed-reverse-at | 83.07 ± 5.64 | 50.07 ± 2.81 | 47.78 ± 3.57 | 1.739× | 1.048× | faster / overlap |
| serial | c1 | mixed-reverse-below | 80.96 ± 4.68 | 45.66 ± 2.92 | 46.42 ± 4.98 | 1.744× | 0.984× (slower) | faster / overlap |
| serial | c1 | mixed-reverse-immediate | 68.46 ± 2.36 | 64.27 ± 2.94 | 52.32 ± 3.10 | 1.309× | 1.228× | faster / faster |
| serial | c1 | mixed-reverse-tiny | 6.69 ± 0.28 | 5.16 ± 0.25 | 5.40 ± 0.12 | 1.240× | 0.955× (slower) | faster / overlap |
| serial | c2 | mixed-reverse-above | 17.33 ± 1.40 | 17.42 ± 0.32 | 12.07 ± 0.50 | 1.436× | 1.443× | faster / faster |
| serial | c2 | mixed-reverse-at | 18.79 ± 1.82 | 17.89 ± 1.10 | 10.76 ± 0.39 | 1.747× | 1.663× | faster / faster |
| serial | c2 | mixed-reverse-below | 17.79 ± 1.54 | 18.20 ± 0.70 | 17.74 ± 0.66 | 1.003× | 1.026× | overlap / overlap |
| serial | c2 | mixed-reverse-immediate | 25.62 ± 0.59 | 25.67 ± 1.22 | 19.23 ± 1.23 | 1.333× | 1.335× | faster / faster |
| serial | c2 | mixed-reverse-tiny | 3.32 ± 0.14 | 2.97 ± 0.41 | 2.72 ± 0.07 | 1.218× | 1.090× | faster / overlap |
| serial | interpreter | mixed-reverse-above | 2,725.02 ± 124.90 | 3,007.54 ± 248.29 | 411.64 ± 18.63 | 6.620× | 7.306× | faster / faster |
| serial | interpreter | mixed-reverse-at | 2,744.60 ± 193.01 | 3,029.79 ± 158.15 | 391.90 ± 7.54 | 7.003× | 7.731× | faster / faster |
| serial | interpreter | mixed-reverse-below | 2,724.86 ± 94.45 | 2,743.16 ± 183.67 | 2,873.92 ± 95.73 | 0.948× (slower) | 0.955× (slower) | overlap / overlap |
| serial | interpreter | mixed-reverse-immediate | 3,115.10 ± 110.63 | 3,149.72 ± 144.76 | 458.99 ± 20.11 | 6.787× | 6.862× | faster / faster |
| serial | interpreter | mixed-reverse-tiny | 371.23 ± 19.50 | 321.43 ± 39.08 | 269.79 ± 9.52 | 1.376× | 1.191× | faster / faster |
