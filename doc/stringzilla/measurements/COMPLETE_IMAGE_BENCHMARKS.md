# Complete-image benchmarks

Complete source-built JDK controls at production revision `90e763c6758c08b2cb8981beb8a038cf86c279e8`.
99 measured workloads, 606 matched triplets,
1818 measurements and 3636 isolated JVM forks.
Means and JMH 99.9% confidence half-widths are ns/op. Ratios below one are slower enabled means.
Every higher enabled mean is marked `(slower)` using unrounded scores, even if its ratio rounds to one.
All 105 higher enabled means remain visible, including overlapping intervals.
There are 2 higher non-overlapping enabled/control intervals.
Interval comparisons are descriptive, without a multiple-testing correction; overlap does not establish equivalence.

[Method](../BENCHMARKS.md#method) and [raw records, image fingerprints and build provenance](complete-image-results.json).

| Backend | Tier | Workload | Original JDK | Disabled | Enabled | Original / enabled | Disabled / enabled | Intervals: original / disabled |
| --- | --- | --- | ---: | ---: | ---: | ---: | ---: | --- |
| avx2 | c1 | buffer-latin | 2,684.67 ± 212.26 | 2,780.59 ± 122.66 | 244.30 ± 53.28 | 10.989× | 11.382× | faster / faster |
| avx2 | c1 | builder-latin | 2,676.15 ± 157.30 | 2,818.25 ± 85.25 | 211.39 ± 12.03 | 12.660× | 13.332× | faster / faster |
| avx2 | c1 | character-latin | 2,638.60 ± 123.03 | 2,403.19 ± 102.02 | 101.93 ± 5.66 | 25.885× | 23.576× | faster / faster |
| avx2 | c1 | character-utf16 | 1,891.11 ± 77.93 | 1,778.40 ± 68.69 | 385.70 ± 33.31 | 4.903× | 4.611× | faster / faster |
| avx2 | c1 | dispatch-avx2-latin-span-31 | 9,827.72 ± 606.29 | 9,754.58 ± 389.97 | 887.35 ± 18.11 | 11.075× | 10.993× | faster / faster |
| avx2 | c1 | dispatch-avx2-latin-span-32 | 10,040.96 ± 364.27 | 10,107.83 ± 346.49 | 472.66 ± 29.90 | 21.243× | 21.385× | faster / faster |
| avx2 | c1 | dispatch-avx2-latin-span-33 | 10,782.33 ± 341.98 | 10,664.47 ± 385.87 | 912.15 ± 53.50 | 11.821× | 11.692× | faster / faster |
| avx2 | c1 | dispatch-avx2-utf16-span-17 | 2,150.78 ± 85.23 | 1,764.04 ± 57.02 | 57.94 ± 2.66 | 37.119× | 30.444× | faster / faster |
| avx2 | c1 | dispatch-c1-latin-work-1 | 977.67 ± 74.29 | 917.42 ± 36.81 | 946.00 ± 108.53 | 1.033× | 0.970× (slower) | overlap / overlap |
| avx2 | c1 | dispatch-c1-latin-work-2 | 1,303.92 ± 62.74 | 1,252.44 ± 116.91 | 900.52 ± 34.62 | 1.448× | 1.391× | faster / faster |
| avx2 | c1 | dispatch-c1-latin-work-3 | 1,548.84 ± 68.51 | 1,541.80 ± 40.15 | 885.77 ± 31.20 | 1.749× | 1.741× | faster / faster |
| avx2 | c1 | dispatch-c1-utf16-work-5 | 828.67 ± 15.40 | 673.39 ± 9.18 | 108.28 ± 3.46 | 7.653× | 6.219× | faster / faster |
| avx2 | c1 | dispatch-c1-utf16-work-6 | 904.83 ± 21.55 | 807.97 ± 45.56 | 53.62 ± 2.06 | 16.874× | 15.068× | faster / faster |
| avx2 | c1 | dispatch-c1-utf16-work-7 | 1,046.87 ± 33.92 | 879.02 ± 58.43 | 54.83 ± 3.59 | 19.093× | 16.032× | faster / faster |
| avx2 | c1 | dispatch-c2-latin-256-work-1 | 901.39 ± 7.83 | 926.60 ± 48.08 | 286.80 ± 27.75 | 3.143× | 3.231× | faster / faster |
| avx2 | c1 | dispatch-c2-latin-256-work-2 | 1,267.39 ± 45.15 | 1,223.05 ± 17.03 | 288.56 ± 16.38 | 4.392× | 4.239× | faster / faster |
| avx2 | c1 | dispatch-c2-latin-256-work-3 | 1,483.35 ± 20.68 | 1,521.62 ± 58.61 | 287.61 ± 6.66 | 5.158× | 5.291× | faster / faster |
| avx2 | c1 | dispatch-c2-latin-work-13 | 4,466.55 ± 69.41 | 4,569.34 ± 172.11 | 898.62 ± 10.67 | 4.970× | 5.085× | faster / faster |
| avx2 | c1 | dispatch-c2-latin-work-14 | 5,082.58 ± 407.45 | 4,813.17 ± 118.94 | 891.58 ± 84.25 | 5.701× | 5.398× | faster / faster |
| avx2 | c1 | dispatch-c2-latin-work-15 | 5,173.40 ± 127.67 | 5,166.74 ± 110.70 | 844.43 ± 42.75 | 6.126× | 6.119× | faster / faster |
| avx2 | c1 | dispatch-c2-utf16-work-13 | 1,741.34 ± 78.12 | 1,468.27 ± 92.42 | 54.54 ± 1.39 | 31.931× | 26.923× | faster / faster |
| avx2 | c1 | dispatch-c2-utf16-work-14 | 1,903.28 ± 81.44 | 1,533.24 ± 72.05 | 56.85 ± 4.92 | 33.478× | 26.970× | faster / faster |
| avx2 | c1 | dispatch-c2-utf16-work-15 | 2,021.82 ± 79.74 | 1,648.35 ± 111.48 | 57.04 ± 2.71 | 35.446× | 28.898× | faster / faster |
| avx2 | c1 | dispatch-latin-end | 11.06 ± 0.11 | 11.50 ± 0.55 | 9.64 ± 0.56 | 1.148× | 1.194× | faster / faster |
| avx2 | c1 | dispatch-latin-needle-31 | 3,519.21 ± 86.33 | 3,571.58 ± 131.81 | 215.34 ± 8.06 | 16.342× | 16.586× | faster / faster |
| avx2 | c1 | dispatch-latin-needle-32 | 3,590.36 ± 48.57 | 3,684.72 ± 173.32 | 216.76 ± 11.83 | 16.564× | 16.999× | faster / faster |
| avx2 | c1 | dispatch-latin-needle-33 | 3,562.39 ± 172.03 | 3,569.20 ± 153.71 | 218.72 ± 8.49 | 16.288× | 16.319× | faster / faster |
| avx2 | c1 | dispatch-utf16-255 | 304.95 ± 7.12 | 187.37 ± 33.88 | 56.74 ± 3.19 | 5.374× | 3.302× | faster / faster |
| avx2 | c1 | dispatch-utf16-256 | 300.06 ± 7.95 | 163.69 ± 12.12 | 63.56 ± 2.30 | 4.721× | 2.575× | faster / faster |
| avx2 | c1 | dispatch-utf16-257 | 303.24 ± 8.54 | 166.64 ± 10.14 | 65.94 ± 2.67 | 4.598× | 2.527× | faster / faster |
| avx2 | c1 | dispatch-utf16-511 | 624.38 ± 32.42 | 349.37 ± 51.11 | 81.71 ± 5.33 | 7.641× | 4.276× | faster / faster |
| avx2 | c1 | dispatch-utf16-512 | 587.94 ± 26.29 | 346.61 ± 31.18 | 85.35 ± 3.68 | 6.889× | 4.061× | faster / faster |
| avx2 | c1 | dispatch-utf16-513 | 640.88 ± 27.39 | 357.58 ± 60.28 | 85.07 ± 1.73 | 7.533× | 4.203× | faster / faster |
| avx2 | c1 | dispatch-utf16-end | 11.22 ± 0.81 | 8.53 ± 0.25 | 8.61 ± 0.13 | 1.302× | 0.991× (slower) | faster / overlap |
| avx2 | c1 | dispatch-utf16-long-bulk | 43,460.03 ± 2,008.86 | 36,892.62 ± 1,537.84 | 872.23 ± 22.39 | 49.826× | 42.297× | faster / faster |
| avx2 | c1 | dispatch-utf16-needle-31 | 4,930.13 ± 498.08 | 2,444.79 ± 189.08 | 426.56 ± 18.30 | 11.558× | 5.731× | faster / faster |
| avx2 | c1 | dispatch-utf16-needle-32 | 4,891.79 ± 178.44 | 2,484.80 ± 158.52 | 434.34 ± 18.05 | 11.263× | 5.721× | faster / faster |
| avx2 | c1 | dispatch-utf16-needle-33 | 4,619.31 ± 285.27 | 2,614.92 ± 490.37 | 426.30 ± 27.37 | 10.836× | 6.134× | faster / faster |
| avx2 | c1 | early-latin | 9.20 ± 0.21 | 9.57 ± 0.51 | 9.65 ± 0.63 | 0.954× (slower) | 0.992× (slower) | overlap / overlap |
| avx2 | c1 | early-utf16 | 7.88 ± 0.45 | 8.36 ± 0.52 | 7.95 ± 0.36 | 0.991× (slower) | 1.051× | overlap / overlap |
| avx2 | c1 | equal-latin-above | 215.75 ± 3.93 | 214.69 ± 9.63 | 14.06 ± 0.83 | 15.347× | 15.271× | faster / faster |
| avx2 | c1 | equal-latin-at | 217.63 ± 16.38 | 219.87 ± 10.42 | 13.61 ± 0.26 | 15.986× | 16.150× | faster / faster |
| avx2 | c1 | equal-latin-below | 219.47 ± 6.31 | 220.62 ± 15.00 | 13.22 ± 0.31 | 16.596× | 16.683× | faster / faster |
| avx2 | c1 | equal-latin-first | 6.46 ± 0.53 | 7.24 ± 0.32 | 4.78 ± 0.26 | 1.353× | 1.516× | faster / faster |
| avx2 | c1 | equal-latin-large | 3,325.57 ± 119.38 | 3,476.00 ± 164.57 | 90.33 ± 6.42 | 36.817× | 38.482× | faster / faster |
| avx2 | c1 | equal-latin-last | 3,737.59 ± 417.86 | 3,557.72 ± 133.33 | 88.42 ± 2.79 | 42.273× | 40.239× | faster / faster |
| avx2 | c1 | equal-latin-short | 32.75 ± 0.58 | 31.77 ± 0.47 | 11.20 ± 0.99 | 2.923× | 2.836× | faster / faster |
| avx2 | c1 | equal-latin-tiny | 8.52 ± 0.47 | 8.72 ± 0.11 | 5.46 ± 0.21 | 1.560× | 1.596× | faster / faster |
| avx2 | c1 | equal-latin-word | 12.95 ± 1.57 | 12.52 ± 0.39 | 5.84 ± 0.51 | 2.216× | 2.141× | faster / faster |
| avx2 | c1 | equal-latin-word-above | 12.79 ± 0.46 | 13.27 ± 1.05 | 10.16 ± 0.49 | 1.259× | 1.306× | faster / faster |
| avx2 | c1 | equal-utf16-above | 227.26 ± 12.94 | 218.11 ± 14.23 | 13.89 ± 0.47 | 16.363× | 15.704× | faster / faster |
| avx2 | c1 | equal-utf16-at | 226.47 ± 22.70 | 218.42 ± 17.52 | 13.90 ± 0.31 | 16.295× | 15.715× | faster / faster |
| avx2 | c1 | equal-utf16-below | 214.13 ± 9.73 | 214.21 ± 8.63 | 12.99 ± 0.31 | 16.479× | 16.485× | faster / faster |
| avx2 | c1 | equal-utf16-first | 6.31 ± 0.65 | 6.83 ± 0.24 | 5.08 ± 0.75 | 1.244× | 1.346× | overlap / faster |
| avx2 | c1 | equal-utf16-large | 6,700.13 ± 338.21 | 6,814.31 ± 386.12 | 163.59 ± 5.45 | 40.957× | 41.655× | faster / faster |
| avx2 | c1 | equal-utf16-last | 6,824.99 ± 251.12 | 7,026.87 ± 195.44 | 173.76 ± 12.20 | 39.278× | 40.439× | faster / faster |
| avx2 | c1 | equal-utf16-short | 61.05 ± 5.86 | 56.75 ± 0.80 | 10.40 ± 0.27 | 5.870× | 5.456× | faster / faster |
| avx2 | c1 | equal-utf16-tiny | 12.16 ± 0.19 | 12.69 ± 0.85 | 5.70 ± 0.29 | 2.133× | 2.227× | faster / faster |
| avx2 | c1 | forward-latin | 2,680.87 ± 168.62 | 2,411.45 ± 122.82 | 206.99 ± 8.15 | 12.951× | 11.650× | faster / faster |
| avx2 | c1 | forward-utf16 | 1,922.42 ± 98.35 | 1,912.62 ± 54.18 | 396.43 ± 54.38 | 4.849× | 4.825× | faster / faster |
| avx2 | c1 | long-crossed-4 | 4,703.39 ± 211.40 | 2,427.94 ± 117.25 | 315.50 ± 13.46 | 14.908× | 7.695× | faster / faster |
| avx2 | c1 | long-end-256 | 7,518.65 ± 420.82 | 7,986.11 ± 300.93 | 1,027.75 ± 35.98 | 7.316× | 7.771× | faster / faster |
| avx2 | c1 | long-end-64-large | 7,708.61 ± 645.45 | 8,664.76 ± 482.86 | 354.65 ± 24.36 | 21.736× | 24.432× | faster / faster |
| avx2 | c1 | long-end-64-small | 1,029.16 ± 70.53 | 972.48 ± 53.83 | 68.60 ± 4.62 | 15.003× | 14.177× | faster / faster |
| avx2 | c1 | long-overlap-129 | 60,682.67 ± 2,562.10 | 49,634.09 ± 2,159.65 | 756.51 ± 33.65 | 80.214× | 65.609× | faster / faster |
| avx2 | c1 | long-overlap-latin-257 | 158,395.10 ± 6,915.28 | 157,621.88 ± 8,474.17 | 889.08 ± 14.04 | 178.157× | 177.287× | faster / faster |
| avx2 | c1 | long-start-64-large | 221,691.32 ± 10,490.46 | 195,978.18 ± 8,328.87 | 7,065.96 ± 1,593.89 | 31.375× | 27.736× | faster / faster |
| avx2 | c1 | long-start-64-small | 24,455.93 ± 1,927.17 | 22,328.06 ± 1,740.90 | 787.71 ± 61.19 | 31.047× | 28.346× | faster / faster |
| avx2 | c1 | mixed-forward-64 | 1,919.93 ± 116.65 | 1,912.34 ± 76.76 | 424.60 ± 12.88 | 4.522× | 4.504× | faster / faster |
| avx2 | c1 | mixed-forward-65 | 1,996.60 ± 169.71 | 1,987.88 ± 142.92 | 1,962.81 ± 64.41 | 1.017× | 1.013× | overlap / overlap |
| avx2 | c1 | mixed-reverse-4 | 5,117.40 ± 1,049.26 | 2,606.61 ± 560.05 | 444.71 ± 19.16 | 11.507× | 5.861× | faster / faster |
| avx2 | c1 | mixed-reverse-64 | 4,649.55 ± 291.67 | 2,404.99 ± 77.86 | 482.43 ± 12.20 | 9.638× | 4.985× | faster / faster |
| avx2 | c1 | mixed-reverse-65 | 5,810.92 ± 3,411.36 | 2,459.87 ± 159.59 | 385.90 ± 46.36 | 15.058× | 6.374× | faster / faster |
| avx2 | c1 | overlap-min-latin-256 | 611.83 ± 7.50 | 615.21 ± 6.98 | 289.78 ± 18.31 | 2.111× | 2.123× | faster / faster |
| avx2 | c1 | overlap-min-latin-257 | 626.90 ± 30.66 | 636.87 ± 71.08 | 624.62 ± 38.86 | 1.004× | 1.020× | overlap / overlap |
| avx2 | c1 | overlap-min-latin-258 | 618.86 ± 32.26 | 629.03 ± 41.66 | 622.51 ± 19.73 | 0.994× (slower) | 1.010× | overlap / overlap |
| avx2 | c1 | overlap-min-utf16-128 | 231.26 ± 12.83 | 197.82 ± 12.38 | 171.12 ± 47.41 | 1.351× | 1.156× | overlap / overlap |
| avx2 | c1 | overlap-min-utf16-129 | 227.19 ± 8.37 | 196.55 ± 8.11 | 103.77 ± 2.75 | 2.189× | 1.894× | faster / faster |
| avx2 | c1 | overlap-min-utf16-130 | 231.34 ± 7.56 | 199.39 ± 13.10 | 105.39 ± 1.86 | 2.195× | 1.892× | faster / faster |
| avx2 | c1 | reverse-latin | 3,693.12 ± 95.23 | 3,668.12 ± 182.04 | 207.93 ± 11.63 | 17.761× | 17.641× | faster / faster |
| avx2 | c1 | reverse-latin-64 | 3,661.93 ± 301.59 | 3,557.23 ± 93.93 | 218.18 ± 4.41 | 16.784× | 16.304× | faster / faster |
| avx2 | c1 | reverse-utf16-bulk | 4,687.13 ± 81.24 | 2,786.47 ± 339.46 | 439.49 ± 78.10 | 10.665× | 6.340× | faster / faster |
| avx2 | c1 | short-latin | 22.73 ± 0.99 | 22.00 ± 1.20 | 22.13 ± 0.57 | 1.027× | 0.994× (slower) | overlap / overlap |
| avx2 | c1 | short-mixed | 19.11 ± 0.92 | 19.16 ± 0.48 | 18.54 ± 0.27 | 1.031× | 1.034× | overlap / overlap |
| avx2 | c1 | short-utf16 | 39.21 ± 1.54 | 23.85 ± 1.34 | 23.46 ± 1.60 | 1.671× | 1.016× | faster / overlap |
| avx2 | c1 | short-utf16-forward | 18.43 ± 0.49 | 18.14 ± 0.59 | 18.22 ± 0.54 | 1.011× | 0.996× (slower) | overlap / overlap |
| avx2 | c1 | threshold-latin-above | 250.59 ± 18.70 | 240.80 ± 15.68 | 43.70 ± 3.39 | 5.734× | 5.510× | faster / faster |
| avx2 | c1 | threshold-latin-at | 232.55 ± 7.48 | 239.88 ± 14.00 | 42.11 ± 1.77 | 5.522× | 5.697× | faster / faster |
| avx2 | c1 | threshold-latin-below | 234.65 ± 17.72 | 233.56 ± 8.17 | 228.12 ± 5.48 | 1.029× | 1.024× | overlap / overlap |
| avx2 | c1 | threshold-utf16-above | 151.83 ± 2.75 | 85.01 ± 8.33 | 54.04 ± 3.33 | 2.810× | 1.573× | faster / faster |
| avx2 | c1 | threshold-utf16-at | 148.09 ± 4.88 | 84.59 ± 11.47 | 55.78 ± 7.28 | 2.655× | 1.516× | faster / faster |
| avx2 | c1 | threshold-utf16-below | 147.59 ± 6.36 | 92.65 ± 9.26 | 93.78 ± 19.63 | 1.574× | 0.988× (slower) | faster / overlap |
| avx2 | c1 | tiny-latin-search | 6.21 ± 0.14 | 5.85 ± 0.20 | 5.77 ± 0.13 | 1.076× | 1.014× | faster / overlap |
| avx2 | c1 | tiny-mixed-search | 6.22 ± 0.10 | 6.36 ± 0.41 | 6.49 ± 0.66 | 0.959× (slower) | 0.979× (slower) | overlap / overlap |
| avx2 | c1 | tiny-utf16-forward | 6.33 ± 0.16 | 6.49 ± 0.19 | 6.18 ± 0.10 | 1.025× | 1.051× | overlap / faster |
| avx2 | c1 | tiny-utf16-search | 6.80 ± 0.43 | 6.59 ± 0.20 | 6.45 ± 0.19 | 1.055× | 1.022× | overlap / overlap |
| avx2 | c2 | buffer-latin | 389.91 ± 18.03 | 397.37 ± 32.78 | 376.50 ± 8.15 | 1.036× | 1.055× | overlap / overlap |
| avx2 | c2 | builder-latin | 372.02 ± 10.26 | 380.99 ± 12.24 | 379.93 ± 8.23 | 0.979× (slower) | 1.003× | overlap / overlap |
| avx2 | c2 | character-latin | 1,034.35 ± 29.31 | 893.71 ± 45.79 | 78.78 ± 1.96 | 13.130× | 11.345× | faster / faster |
| avx2 | c2 | character-utf16 | 123.17 ± 42.48 | 112.40 ± 8.32 | 109.06 ± 4.82 | 1.129× | 1.031× | overlap / overlap |
| avx2 | c2 | dispatch-avx2-latin-span-31 | 2,424.28 ± 66.41 | 2,408.57 ± 132.30 | 176.93 ± 13.44 | 13.702× | 13.613× | faster / faster |
| avx2 | c2 | dispatch-avx2-latin-span-32 | 3,227.05 ± 1,337.02 | 2,426.13 ± 121.00 | 463.95 ± 6.22 | 6.956× | 5.229× | faster / faster |
| avx2 | c2 | dispatch-avx2-latin-span-33 | 2,493.26 ± 182.69 | 2,592.88 ± 217.96 | 924.54 ± 37.43 | 2.697× | 2.804× | faster / faster |
| avx2 | c2 | dispatch-avx2-utf16-span-17 | 822.07 ± 37.41 | 687.28 ± 73.88 | 52.89 ± 1.71 | 15.542× | 12.994× | faster / faster |
| avx2 | c2 | dispatch-c1-latin-work-1 | 229.33 ± 4.41 | 225.63 ± 3.58 | 145.15 ± 3.04 | 1.580× | 1.554× | faster / faster |
| avx2 | c2 | dispatch-c1-latin-work-2 | 313.88 ± 16.10 | 315.90 ± 21.01 | 143.99 ± 11.23 | 2.180× | 2.194× | faster / faster |
| avx2 | c2 | dispatch-c1-latin-work-3 | 373.83 ± 11.37 | 364.29 ± 5.04 | 149.88 ± 20.06 | 2.494× | 2.431× | faster / faster |
| avx2 | c2 | dispatch-c1-utf16-work-5 | 318.34 ± 18.35 | 275.68 ± 8.14 | 56.92 ± 2.64 | 5.593× | 4.844× | faster / faster |
| avx2 | c2 | dispatch-c1-utf16-work-6 | 359.61 ± 17.15 | 301.74 ± 14.78 | 56.32 ± 0.77 | 6.385× | 5.358× | faster / faster |
| avx2 | c2 | dispatch-c1-utf16-work-7 | 419.65 ± 43.46 | 358.46 ± 69.07 | 54.78 ± 2.52 | 7.661× | 6.544× | faster / faster |
| avx2 | c2 | dispatch-c2-latin-256-work-1 | 223.21 ± 5.75 | 222.50 ± 5.83 | 231.81 ± 10.62 | 0.963× (slower) | 0.960× (slower) | overlap / overlap |
| avx2 | c2 | dispatch-c2-latin-256-work-2 | 308.59 ± 17.72 | 302.67 ± 14.29 | 281.16 ± 14.15 | 1.098× | 1.076× | overlap / overlap |
| avx2 | c2 | dispatch-c2-latin-256-work-3 | 502.46 ± 184.03 | 369.08 ± 10.38 | 279.14 ± 5.47 | 1.800× | 1.322× | faster / faster |
| avx2 | c2 | dispatch-c2-latin-work-13 | 1,126.65 ± 20.64 | 1,119.92 ± 38.39 | 155.76 ± 8.20 | 7.233× | 7.190× | faster / faster |
| avx2 | c2 | dispatch-c2-latin-work-14 | 1,232.38 ± 73.68 | 1,187.55 ± 55.11 | 154.41 ± 10.98 | 7.981× | 7.691× | faster / faster |
| avx2 | c2 | dispatch-c2-latin-work-15 | 1,747.55 ± 741.40 | 1,257.20 ± 36.33 | 159.74 ± 7.20 | 10.940× | 7.870× | faster / faster |
| avx2 | c2 | dispatch-c2-utf16-work-13 | 671.19 ± 25.58 | 561.78 ± 10.29 | 59.66 ± 4.03 | 11.249× | 9.416× | faster / faster |
| avx2 | c2 | dispatch-c2-utf16-work-14 | 701.76 ± 29.77 | 587.11 ± 34.36 | 61.31 ± 3.23 | 11.447× | 9.577× | faster / faster |
| avx2 | c2 | dispatch-c2-utf16-work-15 | 782.63 ± 43.70 | 670.24 ± 34.47 | 54.10 ± 2.00 | 14.465× | 12.388× | faster / faster |
| avx2 | c2 | dispatch-latin-end | 6.50 ± 1.44 | 6.24 ± 0.45 | 5.55 ± 0.30 | 1.170× | 1.123× | overlap / overlap |
| avx2 | c2 | dispatch-latin-needle-31 | 684.46 ± 18.89 | 709.34 ± 109.18 | 212.00 ± 15.48 | 3.229× | 3.346× | faster / faster |
| avx2 | c2 | dispatch-latin-needle-32 | 695.83 ± 19.75 | 751.83 ± 64.10 | 210.61 ± 12.58 | 3.304× | 3.570× | faster / faster |
| avx2 | c2 | dispatch-latin-needle-33 | 685.57 ± 22.77 | 687.47 ± 75.13 | 214.98 ± 9.16 | 3.189× | 3.198× | faster / faster |
| avx2 | c2 | dispatch-utf16-255 | 48.86 ± 2.40 | 47.49 ± 1.55 | 48.45 ± 3.12 | 1.008× | 0.980× (slower) | overlap / overlap |
| avx2 | c2 | dispatch-utf16-256 | 48.90 ± 2.80 | 47.42 ± 1.53 | 48.54 ± 2.99 | 1.007× | 0.977× (slower) | overlap / overlap |
| avx2 | c2 | dispatch-utf16-257 | 49.79 ± 2.55 | 47.91 ± 0.87 | 48.70 ± 0.82 | 1.022× | 0.984× (slower) | overlap / overlap |
| avx2 | c2 | dispatch-utf16-511 | 93.64 ± 4.18 | 91.59 ± 3.72 | 92.83 ± 4.32 | 1.009× | 0.987× (slower) | overlap / overlap |
| avx2 | c2 | dispatch-utf16-512 | 91.37 ± 5.28 | 88.85 ± 1.61 | 82.59 ± 1.42 | 1.106× | 1.076× | faster / faster |
| avx2 | c2 | dispatch-utf16-513 | 91.95 ± 2.19 | 87.45 ± 2.82 | 83.37 ± 3.43 | 1.103× | 1.049× | faster / overlap |
| avx2 | c2 | dispatch-utf16-end | 6.04 ± 1.80 | 5.51 ± 0.19 | 4.36 ± 0.15 | 1.384× | 1.263× | overlap / faster |
| avx2 | c2 | dispatch-utf16-long-bulk | 16,083.66 ± 379.94 | 12,531.18 ± 261.03 | 919.88 ± 33.63 | 17.484× | 13.623× | faster / faster |
| avx2 | c2 | dispatch-utf16-needle-31 | 682.03 ± 26.76 | 678.92 ± 31.24 | 438.95 ± 39.93 | 1.554× | 1.547× | faster / faster |
| avx2 | c2 | dispatch-utf16-needle-32 | 730.08 ± 49.06 | 687.13 ± 29.65 | 412.76 ± 4.98 | 1.769× | 1.665× | faster / faster |
| avx2 | c2 | dispatch-utf16-needle-33 | 670.72 ± 19.31 | 687.62 ± 17.55 | 442.98 ± 74.14 | 1.514× | 1.552× | faster / faster |
| avx2 | c2 | early-latin | 3.67 ± 0.17 | 3.61 ± 0.22 | 3.60 ± 0.13 | 1.019× | 1.002× | overlap / overlap |
| avx2 | c2 | early-utf16 | 4.56 ± 0.24 | 4.22 ± 0.06 | 4.26 ± 0.04 | 1.069× | 0.989× (slower) | faster / overlap |
| avx2 | c2 | equal-latin-above | 7.83 ± 0.61 | 8.05 ± 0.45 | 7.81 ± 0.70 | 1.002× | 1.031× | overlap / overlap |
| avx2 | c2 | equal-latin-at | 6.78 ± 0.57 | 7.01 ± 0.35 | 7.64 ± 0.33 | 0.887× (slower) | 0.917× (slower) | overlap / overlap |
| avx2 | c2 | equal-latin-below | 6.87 ± 0.38 | 7.02 ± 0.59 | 6.24 ± 0.72 | 1.101× | 1.124× | overlap / overlap |
| avx2 | c2 | equal-latin-first | 2.09 ± 0.04 | 2.17 ± 0.10 | 2.17 ± 0.14 | 0.959× (slower) | 0.998× (slower) | overlap / overlap |
| avx2 | c2 | equal-latin-large | 64.31 ± 14.66 | 73.57 ± 6.72 | 72.52 ± 4.48 | 0.887× (slower) | 1.015× | overlap / overlap |
| avx2 | c2 | equal-latin-last | 71.20 ± 3.46 | 71.63 ± 4.35 | 69.89 ± 2.37 | 1.019× | 1.025× | overlap / overlap |
| avx2 | c2 | equal-latin-short | 2.35 ± 0.06 | 2.35 ± 0.11 | 2.46 ± 0.45 | 0.955× (slower) | 0.954× (slower) | overlap / overlap |
| avx2 | c2 | equal-latin-tiny | 2.93 ± 0.14 | 2.92 ± 0.11 | 2.95 ± 0.15 | 0.991× (slower) | 0.988× (slower) | overlap / overlap |
| avx2 | c2 | equal-latin-word | 3.03 ± 0.12 | 2.95 ± 0.15 | 2.90 ± 0.14 | 1.048× | 1.018× | overlap / overlap |
| avx2 | c2 | equal-latin-word-above | 3.16 ± 0.06 | 3.20 ± 0.10 | 3.22 ± 0.13 | 0.979× (slower) | 0.994× (slower) | overlap / overlap |
| avx2 | c2 | equal-utf16-above | 8.16 ± 0.84 | 7.55 ± 1.12 | 7.71 ± 0.31 | 1.058× | 0.979× (slower) | overlap / overlap |
| avx2 | c2 | equal-utf16-at | 6.85 ± 0.68 | 7.06 ± 0.13 | 7.16 ± 0.69 | 0.957× (slower) | 0.985× (slower) | overlap / overlap |
| avx2 | c2 | equal-utf16-below | 6.73 ± 0.39 | 6.87 ± 0.44 | 6.43 ± 0.39 | 1.048× | 1.069× | overlap / overlap |
| avx2 | c2 | equal-utf16-first | 2.17 ± 0.11 | 2.11 ± 0.06 | 2.17 ± 0.08 | 1.003× | 0.975× (slower) | overlap / overlap |
| avx2 | c2 | equal-utf16-large | 135.29 ± 12.32 | 138.16 ± 4.92 | 121.29 ± 17.81 | 1.115× | 1.139× | overlap / overlap |
| avx2 | c2 | equal-utf16-last | 133.68 ± 28.41 | 138.69 ± 25.98 | 134.35 ± 27.94 | 0.995× (slower) | 1.032× | overlap / overlap |
| avx2 | c2 | equal-utf16-short | 3.20 ± 0.15 | 3.10 ± 0.36 | 3.07 ± 0.20 | 1.043× | 1.008× | overlap / overlap |
| avx2 | c2 | equal-utf16-tiny | 2.91 ± 0.06 | 2.99 ± 0.07 | 3.03 ± 0.26 | 0.960× (slower) | 0.985× (slower) | overlap / overlap |
| avx2 | c2 | forward-latin | 381.10 ± 9.65 | 379.89 ± 5.09 | 389.11 ± 33.88 | 0.979× (slower) | 0.976× (slower) | overlap / overlap |
| avx2 | c2 | forward-utf16 | 756.71 ± 27.75 | 750.95 ± 18.76 | 762.73 ± 47.22 | 0.992× (slower) | 0.985× (slower) | overlap / overlap |
| avx2 | c2 | long-crossed-4 | 718.76 ± 80.57 | 708.29 ± 49.47 | 300.58 ± 30.78 | 2.391× | 2.356× | faster / faster |
| avx2 | c2 | long-end-256 | 2,599.24 ± 324.67 | 2,731.94 ± 173.74 | 1,011.98 ± 35.50 | 2.568× | 2.700× | faster / faster |
| avx2 | c2 | long-end-64-large | 2,894.44 ± 224.15 | 2,603.30 ± 256.34 | 383.74 ± 36.59 | 7.543× | 6.784× | faster / faster |
| avx2 | c2 | long-end-64-small | 327.08 ± 20.77 | 331.65 ± 16.19 | 68.52 ± 3.93 | 4.774× | 4.840× | faster / faster |
| avx2 | c2 | long-overlap-129 | 22,156.88 ± 377.99 | 18,584.79 ± 800.82 | 676.47 ± 19.20 | 32.754× | 27.473× | faster / faster |
| avx2 | c2 | long-overlap-latin-257 | 36,824.36 ± 1,092.11 | 37,759.05 ± 2,169.96 | 920.60 ± 65.21 | 40.000× | 41.016× | faster / faster |
| avx2 | c2 | long-start-64-large | 76,491.43 ± 23,863.73 | 77,220.80 ± 22,700.94 | 6,404.32 ± 370.53 | 11.944× | 12.058× | faster / faster |
| avx2 | c2 | long-start-64-small | 7,205.03 ± 293.58 | 7,673.20 ± 449.65 | 741.07 ± 23.18 | 9.722× | 10.354× | faster / faster |
| avx2 | c2 | mixed-forward-64 | 750.95 ± 30.23 | 777.72 ± 43.69 | 753.82 ± 73.28 | 0.996× (slower) | 1.032× | overlap / overlap |
| avx2 | c2 | mixed-forward-65 | 734.47 ± 26.65 | 757.54 ± 26.98 | 743.21 ± 34.17 | 0.988× (slower) | 1.019× | overlap / overlap |
| avx2 | c2 | mixed-reverse-4 | 750.64 ± 168.71 | 688.46 ± 28.21 | 447.34 ± 9.07 | 1.678× | 1.539× | faster / faster |
| avx2 | c2 | mixed-reverse-64 | 660.60 ± 30.06 | 671.07 ± 66.54 | 475.31 ± 15.87 | 1.390× | 1.412× | faster / faster |
| avx2 | c2 | mixed-reverse-65 | 691.84 ± 25.59 | 666.79 ± 27.18 | 164.08 ± 7.04 | 4.217× | 4.064× | faster / faster |
| avx2 | c2 | overlap-min-latin-256 | 159.55 ± 7.76 | 155.56 ± 7.10 | 155.16 ± 9.40 | 1.028× | 1.003× | overlap / overlap |
| avx2 | c2 | overlap-min-latin-257 | 161.56 ± 12.70 | 156.37 ± 11.04 | 145.12 ± 5.12 | 1.113× | 1.077× | overlap / overlap |
| avx2 | c2 | overlap-min-latin-258 | 155.30 ± 11.12 | 161.55 ± 12.13 | 146.42 ± 3.69 | 1.061× | 1.103× | overlap / overlap |
| avx2 | c2 | overlap-min-utf16-128 | 93.02 ± 4.60 | 75.82 ± 3.11 | 48.36 ± 1.81 | 1.924× | 1.568× | faster / faster |
| avx2 | c2 | overlap-min-utf16-129 | 95.37 ± 7.38 | 81.03 ± 2.73 | 49.90 ± 1.04 | 1.911× | 1.624× | faster / faster |
| avx2 | c2 | overlap-min-utf16-130 | 91.51 ± 2.01 | 74.87 ± 3.25 | 50.38 ± 0.59 | 1.816× | 1.486× | faster / faster |
| avx2 | c2 | reverse-latin | 667.05 ± 4.06 | 693.62 ± 36.83 | 209.38 ± 5.36 | 3.186× | 3.313× | faster / faster |
| avx2 | c2 | reverse-latin-64 | 672.76 ± 30.14 | 667.01 ± 18.81 | 217.79 ± 7.49 | 3.089× | 3.063× | faster / faster |
| avx2 | c2 | reverse-utf16-bulk | 758.96 ± 101.51 | 716.31 ± 72.52 | 466.89 ± 60.14 | 1.626× | 1.534× | faster / faster |
| avx2 | c2 | short-latin | 4.64 ± 0.07 | 4.52 ± 0.07 | 4.57 ± 0.14 | 1.016× | 0.989× (slower) | overlap / overlap |
| avx2 | c2 | short-mixed | 7.66 ± 0.58 | 7.62 ± 0.42 | 7.77 ± 0.48 | 0.985× (slower) | 0.981× (slower) | overlap / overlap |
| avx2 | c2 | short-utf16 | 10.66 ± 0.49 | 10.31 ± 0.56 | 9.82 ± 0.32 | 1.085× | 1.050× | faster / overlap |
| avx2 | c2 | short-utf16-forward | 7.76 ± 0.22 | 7.93 ± 0.24 | 7.72 ± 0.13 | 1.006× | 1.028× | overlap / overlap |
| avx2 | c2 | threshold-latin-above | 48.15 ± 1.13 | 47.91 ± 1.30 | 41.46 ± 1.52 | 1.162× | 1.156× | faster / faster |
| avx2 | c2 | threshold-latin-at | 47.30 ± 4.05 | 47.91 ± 2.36 | 40.11 ± 1.15 | 1.179× | 1.194× | faster / faster |
| avx2 | c2 | threshold-latin-below | 47.06 ± 2.39 | 48.68 ± 2.15 | 49.33 ± 4.08 | 0.954× (slower) | 0.987× (slower) | overlap / overlap |
| avx2 | c2 | threshold-utf16-above | 30.22 ± 2.25 | 26.29 ± 2.54 | 28.59 ± 1.84 | 1.057× | 0.920× (slower) | overlap / overlap |
| avx2 | c2 | threshold-utf16-at | 29.68 ± 2.77 | 28.36 ± 1.74 | 27.53 ± 1.76 | 1.078× | 1.030× | overlap / overlap |
| avx2 | c2 | threshold-utf16-below | 27.14 ± 1.96 | 28.45 ± 2.28 | 27.36 ± 5.43 | 0.992× (slower) | 1.040× | overlap / overlap |
| avx2 | c2 | tiny-latin-search | 3.91 ± 0.69 | 3.80 ± 0.28 | 3.68 ± 0.16 | 1.062× | 1.033× | overlap / overlap |
| avx2 | c2 | tiny-mixed-search | 3.78 ± 0.15 | 3.87 ± 0.25 | 3.88 ± 0.39 | 0.975× (slower) | 0.997× (slower) | overlap / overlap |
| avx2 | c2 | tiny-utf16-forward | 4.17 ± 0.09 | 4.20 ± 0.05 | 4.22 ± 0.15 | 0.988× (slower) | 0.996× (slower) | overlap / overlap |
| avx2 | c2 | tiny-utf16-search | 3.00 ± 0.12 | 3.09 ± 0.14 | 3.01 ± 0.10 | 0.999× (slower) | 1.027× | overlap / overlap |
| avx2 | interpreter | buffer-latin | 31,466.09 ± 1,895.89 | 37,509.27 ± 4,116.44 | 624.24 ± 39.00 | 50.407× | 60.088× | faster / faster |
| avx2 | interpreter | builder-latin | 31,179.83 ± 2,274.69 | 39,217.78 ± 2,871.18 | 592.61 ± 16.02 | 52.615× | 66.178× | faster / faster |
| avx2 | interpreter | character-latin | 39,818.13 ± 2,741.51 | 39,738.11 ± 4,220.16 | 349.57 ± 17.31 | 113.906× | 113.677× | faster / faster |
| avx2 | interpreter | character-utf16 | 154,732.44 ± 8,030.38 | 160,501.12 ± 14,772.10 | 673.83 ± 54.57 | 229.630× | 238.191× | faster / faster |
| avx2 | interpreter | dispatch-avx2-latin-span-31 | 103,869.26 ± 5,597.13 | 110,689.22 ± 9,959.47 | 1,314.31 ± 140.82 | 79.030× | 84.219× | faster / faster |
| avx2 | interpreter | dispatch-avx2-latin-span-32 | 103,426.19 ± 5,694.45 | 112,937.39 ± 5,171.16 | 791.84 ± 62.90 | 130.615× | 142.626× | faster / faster |
| avx2 | interpreter | dispatch-avx2-latin-span-33 | 115,605.69 ± 9,914.65 | 113,068.52 ± 6,722.89 | 1,182.29 ± 41.65 | 97.781× | 95.635× | faster / faster |
| avx2 | interpreter | dispatch-avx2-utf16-span-17 | 154,930.79 ± 12,245.08 | 165,576.05 ± 8,269.64 | 482.20 ± 18.53 | 321.303× | 343.379× | faster / faster |
| avx2 | interpreter | dispatch-c1-latin-work-1 | 10,360.41 ± 1,151.11 | 10,159.51 ± 779.63 | 1,205.16 ± 100.69 | 8.597× | 8.430× | faster / faster |
| avx2 | interpreter | dispatch-c1-latin-work-2 | 13,334.85 ± 1,042.92 | 13,340.86 ± 950.74 | 1,201.30 ± 60.59 | 11.100× | 11.105× | faster / faster |
| avx2 | interpreter | dispatch-c1-latin-work-3 | 16,994.75 ± 1,731.99 | 16,909.56 ± 1,247.81 | 1,174.31 ± 62.44 | 14.472× | 14.400× | faster / faster |
| avx2 | interpreter | dispatch-c1-utf16-work-5 | 64,358.06 ± 4,144.81 | 64,654.08 ± 3,194.24 | 493.14 ± 32.33 | 130.506× | 131.106× | faster / faster |
| avx2 | interpreter | dispatch-c1-utf16-work-6 | 71,093.09 ± 7,267.15 | 72,954.22 ± 1,616.49 | 489.83 ± 23.18 | 145.137× | 148.937× | faster / faster |
| avx2 | interpreter | dispatch-c1-utf16-work-7 | 79,485.24 ± 2,496.10 | 83,931.50 ± 5,495.07 | 486.88 ± 26.63 | 163.255× | 172.387× | faster / faster |
| avx2 | interpreter | dispatch-c2-latin-256-work-1 | 10,152.75 ± 1,390.06 | 10,360.94 ± 842.51 | 547.37 ± 56.82 | 18.548× | 18.929× | faster / faster |
| avx2 | interpreter | dispatch-c2-latin-256-work-2 | 12,805.12 ± 280.67 | 13,261.82 ± 1,457.25 | 560.38 ± 22.21 | 22.851× | 23.666× | faster / faster |
| avx2 | interpreter | dispatch-c2-latin-256-work-3 | 17,168.15 ± 1,199.60 | 17,610.26 ± 2,062.47 | 596.05 ± 47.40 | 28.803× | 29.545× | faster / faster |
| avx2 | interpreter | dispatch-c2-latin-work-13 | 50,263.65 ± 1,530.05 | 53,378.18 ± 7,760.64 | 1,225.68 ± 53.83 | 41.009× | 43.550× | faster / faster |
| avx2 | interpreter | dispatch-c2-latin-work-14 | 52,641.26 ± 4,546.48 | 55,038.90 ± 7,494.53 | 1,209.68 ± 63.71 | 43.517× | 45.499× | faster / faster |
| avx2 | interpreter | dispatch-c2-latin-work-15 | 53,396.84 ± 5,337.79 | 59,130.75 ± 3,322.84 | 1,102.11 ± 55.31 | 48.449× | 53.652× | faster / faster |
| avx2 | interpreter | dispatch-c2-utf16-work-13 | 132,467.63 ± 12,769.61 | 137,273.02 ± 6,755.59 | 477.02 ± 32.32 | 277.698× | 287.771× | faster / faster |
| avx2 | interpreter | dispatch-c2-utf16-work-14 | 137,270.08 ± 5,993.40 | 145,354.10 ± 6,702.38 | 488.09 ± 20.75 | 281.240× | 297.803× | faster / faster |
| avx2 | interpreter | dispatch-c2-utf16-work-15 | 150,035.66 ± 9,377.14 | 156,846.75 ± 14,531.03 | 475.19 ± 18.29 | 315.738× | 330.072× | faster / faster |
| avx2 | interpreter | dispatch-latin-end | 318.25 ± 9.45 | 348.16 ± 12.50 | 320.19 ± 18.96 | 0.994× (slower) | 1.087× | overlap / overlap |
| avx2 | interpreter | dispatch-latin-needle-31 | 34,123.43 ± 3,066.70 | 41,089.50 ± 2,424.51 | 491.77 ± 17.34 | 69.389× | 83.555× | faster / faster |
| avx2 | interpreter | dispatch-latin-needle-32 | 34,258.00 ± 3,098.61 | 39,844.86 ± 3,072.76 | 514.00 ± 50.07 | 66.650× | 77.519× | faster / faster |
| avx2 | interpreter | dispatch-latin-needle-33 | 33,232.13 ± 1,145.60 | 40,731.87 ± 2,771.07 | 493.86 ± 14.85 | 67.290× | 82.476× | faster / faster |
| avx2 | interpreter | dispatch-utf16-255 | 9,196.51 ± 503.68 | 10,182.90 ± 591.77 | 554.81 ± 32.29 | 16.576× | 18.354× | faster / faster |
| avx2 | interpreter | dispatch-utf16-256 | 9,311.14 ± 376.85 | 9,723.10 ± 445.57 | 572.36 ± 85.93 | 16.268× | 16.988× | faster / faster |
| avx2 | interpreter | dispatch-utf16-257 | 10,008.95 ± 1,262.85 | 9,682.67 ± 591.61 | 551.61 ± 20.28 | 18.145× | 17.553× | faster / faster |
| avx2 | interpreter | dispatch-utf16-511 | 18,610.76 ± 753.85 | 19,715.18 ± 878.16 | 556.45 ± 28.52 | 33.446× | 35.430× | faster / faster |
| avx2 | interpreter | dispatch-utf16-512 | 18,874.89 ± 1,312.24 | 19,721.43 ± 1,047.31 | 571.39 ± 29.13 | 33.033× | 34.515× | faster / faster |
| avx2 | interpreter | dispatch-utf16-513 | 18,415.16 ± 739.00 | 19,815.78 ± 745.11 | 563.05 ± 25.34 | 32.706× | 35.193× | faster / faster |
| avx2 | interpreter | dispatch-utf16-end | 700.55 ± 45.64 | 705.56 ± 23.83 | 422.45 ± 43.98 | 1.658× | 1.670× | faster / faster |
| avx2 | interpreter | dispatch-utf16-long-bulk | 3,252,618.97 ± 152,038.08 | 3,477,449.69 ± 187,012.83 | 1,314.72 ± 49.62 | 2473.997× | 2645.007× | faster / faster |
| avx2 | interpreter | dispatch-utf16-needle-31 | 142,685.73 ± 5,312.69 | 149,871.43 ± 7,454.08 | 834.66 ± 22.05 | 170.951× | 179.560× | faster / faster |
| avx2 | interpreter | dispatch-utf16-needle-32 | 145,132.50 ± 6,131.40 | 150,269.33 ± 6,667.66 | 836.33 ± 6.10 | 173.535× | 179.677× | faster / faster |
| avx2 | interpreter | dispatch-utf16-needle-33 | 144,111.98 ± 12,633.12 | 146,283.41 ± 7,176.90 | 840.34 ± 38.52 | 171.493× | 174.077× | faster / faster |
| avx2 | interpreter | early-latin | 259.46 ± 13.73 | 259.96 ± 11.84 | 157.13 ± 6.02 | 1.651× | 1.654× | faster / faster |
| avx2 | interpreter | early-utf16 | 556.65 ± 89.43 | 595.03 ± 60.35 | 164.94 ± 17.12 | 3.375× | 3.607× | faster / faster |
| avx2 | interpreter | equal-latin-above | 3,159.02 ± 464.66 | 3,901.79 ± 442.28 | 127.08 ± 8.55 | 24.858× | 30.703× | faster / faster |
| avx2 | interpreter | equal-latin-at | 2,885.52 ± 41.13 | 3,725.61 ± 305.47 | 130.27 ± 13.70 | 22.151× | 28.600× | faster / faster |
| avx2 | interpreter | equal-latin-below | 3,037.57 ± 251.37 | 3,647.92 ± 123.44 | 125.22 ± 8.31 | 24.258× | 29.132× | faster / faster |
| avx2 | interpreter | equal-latin-first | 132.60 ± 7.55 | 149.80 ± 4.12 | 122.74 ± 5.21 | 1.080× | 1.220× | overlap / faster |
| avx2 | interpreter | equal-latin-large | 49,364.78 ± 3,203.13 | 58,592.78 ± 5,523.39 | 201.17 ± 12.97 | 245.392× | 291.264× | faster / faster |
| avx2 | interpreter | equal-latin-last | 45,482.37 ± 2,870.14 | 54,722.43 ± 1,749.13 | 203.47 ± 28.86 | 223.529× | 268.940× | faster / faster |
| avx2 | interpreter | equal-latin-short | 529.81 ± 204.59 | 656.31 ± 81.46 | 121.59 ± 4.90 | 4.357× | 5.398× | faster / faster |
| avx2 | interpreter | equal-latin-tiny | 169.58 ± 9.03 | 205.40 ± 5.27 | 133.15 ± 21.53 | 1.274× | 1.543× | faster / faster |
| avx2 | interpreter | equal-latin-word | 222.63 ± 15.06 | 283.38 ± 10.41 | 119.20 ± 6.54 | 1.868× | 2.377× | faster / faster |
| avx2 | interpreter | equal-latin-word-above | 239.31 ± 21.24 | 293.63 ± 15.00 | 123.23 ± 5.69 | 1.942× | 2.383× | faster / faster |
| avx2 | interpreter | equal-utf16-above | 3,125.86 ± 208.01 | 3,750.88 ± 232.30 | 128.39 ± 8.73 | 24.347× | 29.215× | faster / faster |
| avx2 | interpreter | equal-utf16-at | 3,058.90 ± 414.36 | 3,785.43 ± 329.13 | 126.15 ± 6.56 | 24.247× | 30.006× | faster / faster |
| avx2 | interpreter | equal-utf16-below | 2,982.36 ± 167.59 | 3,850.07 ± 250.18 | 124.56 ± 6.95 | 23.944× | 30.910× | faster / faster |
| avx2 | interpreter | equal-utf16-first | 134.05 ± 9.59 | 154.66 ± 6.79 | 128.47 ± 8.97 | 1.043× | 1.204× | overlap / faster |
| avx2 | interpreter | equal-utf16-large | 92,023.99 ± 2,965.45 | 120,945.11 ± 12,628.81 | 275.66 ± 21.10 | 333.835× | 438.752× | faster / faster |
| avx2 | interpreter | equal-utf16-last | 89,986.37 ± 1,668.73 | 114,703.19 ± 6,576.01 | 273.12 ± 10.11 | 329.480× | 419.979× | faster / faster |
| avx2 | interpreter | equal-utf16-short | 828.32 ± 23.85 | 1,117.48 ± 77.11 | 125.75 ± 8.22 | 6.587× | 8.887× | faster / faster |
| avx2 | interpreter | equal-utf16-tiny | 215.32 ± 8.23 | 285.71 ± 19.03 | 123.33 ± 7.40 | 1.746× | 2.317× | faster / faster |
| avx2 | interpreter | forward-latin | 29,094.37 ± 964.15 | 34,476.21 ± 2,853.93 | 348.80 ± 19.90 | 83.414× | 98.843× | faster / faster |
| avx2 | interpreter | forward-utf16 | 148,628.20 ± 3,856.24 | 165,659.37 ± 21,809.10 | 512.69 ± 5.04 | 289.901× | 323.120× | faster / faster |
| avx2 | interpreter | long-crossed-4 | 151,185.34 ± 12,642.70 | 158,472.83 ± 6,635.52 | 806.84 ± 23.17 | 187.380× | 196.412× | faster / faster |
| avx2 | interpreter | long-end-256 | 472,787.02 ± 27,467.40 | 492,235.15 ± 22,936.22 | 1,704.38 ± 57.13 | 277.395× | 288.805× | faster / faster |
| avx2 | interpreter | long-end-64-large | 483,240.34 ± 25,458.81 | 538,327.07 ± 54,135.46 | 794.56 ± 42.92 | 608.188× | 677.518× | faster / faster |
| avx2 | interpreter | long-end-64-small | 58,355.96 ± 3,998.19 | 59,565.85 ± 3,625.66 | 506.40 ± 47.31 | 115.237× | 117.626× | faster / faster |
| avx2 | interpreter | long-overlap-129 | 4,396,773.18 ± 174,542.62 | 4,781,724.24 ± 246,707.75 | 1,188.68 ± 77.24 | 3698.885× | 4022.734× | faster / faster |
| avx2 | interpreter | long-overlap-latin-257 | 1,604,404.52 ± 140,322.95 | 1,710,945.11 ± 140,960.59 | 1,219.59 ± 83.90 | 1315.524× | 1402.881× | faster / faster |
| avx2 | interpreter | long-start-64-large | 17,280,521.06 ± 1,139,169.41 | 17,348,964.47 ± 687,007.89 | 6,887.11 ± 539.27 | 2509.109× | 2519.047× | faster / faster |
| avx2 | interpreter | long-start-64-small | 1,869,279.01 ± 72,492.29 | 1,983,670.28 ± 96,354.53 | 1,171.19 ± 35.50 | 1596.047× | 1693.717× | faster / faster |
| avx2 | interpreter | mixed-forward-64 | 144,218.17 ± 5,357.52 | 164,784.79 ± 57,583.03 | 550.52 ± 22.91 | 261.965× | 299.324× | faster / faster |
| avx2 | interpreter | mixed-forward-65 | 145,696.02 ± 7,697.06 | 159,310.43 ± 7,480.62 | 153,808.14 ± 10,942.85 | 0.947× (slower) | 1.036× | overlap / overlap |
| avx2 | interpreter | mixed-reverse-4 | 151,471.91 ± 13,232.63 | 154,026.50 ± 7,775.88 | 805.99 ± 38.00 | 187.932× | 191.101× | faster / faster |
| avx2 | interpreter | mixed-reverse-64 | 147,042.36 ± 5,618.00 | 153,480.19 ± 8,399.93 | 771.22 ± 41.24 | 190.663× | 199.011× | faster / faster |
| avx2 | interpreter | mixed-reverse-65 | 150,383.42 ± 11,462.43 | 145,986.66 ± 4,265.91 | 749.87 ± 37.05 | 200.547× | 194.684× | faster / faster |
| avx2 | interpreter | overlap-min-latin-256 | 6,823.47 ± 501.45 | 7,214.88 ± 527.18 | 564.64 ± 28.33 | 12.085× | 12.778× | faster / faster |
| avx2 | interpreter | overlap-min-latin-257 | 7,330.64 ± 450.75 | 7,317.21 ± 537.74 | 1,306.39 ± 92.55 | 5.611× | 5.601× | faster / faster |
| avx2 | interpreter | overlap-min-latin-258 | 7,506.62 ± 1,024.11 | 7,018.23 ± 375.68 | 1,172.99 ± 64.63 | 6.400× | 5.983× | faster / faster |
| avx2 | interpreter | overlap-min-utf16-128 | 18,587.69 ± 2,198.30 | 18,068.57 ± 706.52 | 620.20 ± 12.77 | 29.970× | 29.133× | faster / faster |
| avx2 | interpreter | overlap-min-utf16-129 | 18,032.90 ± 1,610.21 | 19,560.71 ± 1,107.72 | 481.71 ± 11.68 | 37.436× | 40.607× | faster / faster |
| avx2 | interpreter | overlap-min-utf16-130 | 17,654.54 ± 759.90 | 19,850.37 ± 1,945.78 | 489.16 ± 9.97 | 36.091× | 40.580× | faster / faster |
| avx2 | interpreter | reverse-latin | 35,466.94 ± 4,706.94 | 39,995.17 ± 1,812.88 | 520.49 ± 37.24 | 68.141× | 76.841× | faster / faster |
| avx2 | interpreter | reverse-latin-64 | 32,368.93 ± 2,525.50 | 41,173.21 ± 2,908.65 | 486.99 ± 21.00 | 66.467× | 84.546× | faster / faster |
| avx2 | interpreter | reverse-utf16-bulk | 149,837.66 ± 15,014.14 | 150,743.24 ± 10,118.97 | 865.80 ± 19.98 | 173.062× | 174.108× | faster / faster |
| avx2 | interpreter | short-latin | 464.26 ± 20.13 | 520.09 ± 87.98 | 180.16 ± 9.04 | 2.577× | 2.887× | faster / faster |
| avx2 | interpreter | short-mixed | 1,293.08 ± 51.28 | 1,391.23 ± 88.58 | 166.18 ± 3.84 | 7.781× | 8.372× | faster / faster |
| avx2 | interpreter | short-utf16 | 1,486.46 ± 108.31 | 1,536.40 ± 29.70 | 1,507.32 ± 73.96 | 0.986× (slower) | 1.019× | overlap / overlap |
| avx2 | interpreter | short-utf16-forward | 1,386.68 ± 93.32 | 1,387.04 ± 140.31 | 186.72 ± 3.20 | 7.426× | 7.428× | faster / faster |
| avx2 | interpreter | threshold-latin-above | 2,427.93 ± 177.57 | 2,890.57 ± 239.87 | 340.14 ± 15.60 | 7.138× | 8.498× | faster / faster |
| avx2 | interpreter | threshold-latin-at | 2,445.46 ± 177.15 | 2,860.11 ± 202.72 | 348.18 ± 19.27 | 7.024× | 8.214× | faster / faster |
| avx2 | interpreter | threshold-latin-below | 2,491.47 ± 175.43 | 2,768.49 ± 195.54 | 2,809.59 ± 136.75 | 0.887× (slower) | 0.985× (slower) | slower / overlap |
| avx2 | interpreter | threshold-utf16-above | 4,975.92 ± 270.13 | 5,112.22 ± 203.74 | 521.75 ± 42.22 | 9.537× | 9.798× | faster / faster |
| avx2 | interpreter | threshold-utf16-at | 5,086.93 ± 191.84 | 5,054.44 ± 436.71 | 530.15 ± 32.91 | 9.595× | 9.534× | faster / faster |
| avx2 | interpreter | threshold-utf16-below | 4,737.53 ± 190.09 | 5,024.76 ± 414.85 | 4,920.08 ± 262.09 | 0.963× (slower) | 1.021× | overlap / overlap |
| avx2 | interpreter | tiny-latin-search | 222.42 ± 44.76 | 218.64 ± 10.14 | 154.24 ± 5.53 | 1.442× | 1.417× | faster / faster |
| avx2 | interpreter | tiny-mixed-search | 255.17 ± 5.91 | 276.56 ± 11.19 | 150.24 ± 11.64 | 1.698× | 1.841× | faster / faster |
| avx2 | interpreter | tiny-utf16-forward | 295.48 ± 16.81 | 309.39 ± 10.47 | 158.81 ± 10.10 | 1.861× | 1.948× | faster / faster |
| avx2 | interpreter | tiny-utf16-search | 441.59 ± 23.63 | 464.87 ± 15.23 | 462.85 ± 17.19 | 0.954× (slower) | 1.004× | overlap / overlap |
| avx512 | c1 | dispatch-latin-end | 11.21 ± 0.15 | 11.54 ± 0.28 | 9.54 ± 0.61 | 1.176× | 1.211× | faster / faster |
| avx512 | c1 | dispatch-latin-needle-31 | 3,520.68 ± 56.96 | 3,528.11 ± 111.19 | 133.84 ± 12.11 | 26.305× | 26.361× | faster / faster |
| avx512 | c1 | dispatch-latin-needle-32 | 3,461.40 ± 18.69 | 3,463.47 ± 28.42 | 143.23 ± 2.85 | 24.166× | 24.181× | faster / faster |
| avx512 | c1 | dispatch-latin-needle-33 | 3,878.27 ± 221.04 | 3,694.95 ± 239.99 | 152.02 ± 11.80 | 25.511× | 24.305× | faster / faster |
| avx512 | c1 | dispatch-utf16-255 | 302.15 ± 10.06 | 163.42 ± 11.99 | 26.11 ± 1.41 | 11.570× | 6.258× | faster / faster |
| avx512 | c1 | dispatch-utf16-256 | 296.81 ± 3.41 | 169.61 ± 22.71 | 23.54 ± 0.83 | 12.609× | 7.206× | faster / faster |
| avx512 | c1 | dispatch-utf16-257 | 299.23 ± 7.14 | 161.61 ± 9.66 | 24.32 ± 1.04 | 12.306× | 6.646× | faster / faster |
| avx512 | c1 | dispatch-utf16-511 | 606.66 ± 35.38 | 315.00 ± 33.77 | 45.18 ± 1.37 | 13.428× | 6.972× | faster / faster |
| avx512 | c1 | dispatch-utf16-512 | 587.78 ± 10.89 | 306.60 ± 10.07 | 41.65 ± 3.05 | 14.111× | 7.360× | faster / faster |
| avx512 | c1 | dispatch-utf16-513 | 610.12 ± 35.00 | 321.48 ± 26.54 | 45.12 ± 2.01 | 13.522× | 7.125× | faster / faster |
| avx512 | c1 | dispatch-utf16-end | 10.70 ± 0.50 | 8.69 ± 0.41 | 8.26 ± 0.07 | 1.296× | 1.053× | faster / overlap |
| avx512 | c1 | dispatch-utf16-needle-31 | 4,673.88 ± 140.99 | 2,506.52 ± 297.38 | 277.29 ± 12.55 | 16.856× | 9.039× | faster / faster |
| avx512 | c1 | dispatch-utf16-needle-32 | 4,731.46 ± 291.22 | 2,427.50 ± 126.63 | 288.02 ± 28.63 | 16.427× | 8.428× | faster / faster |
| avx512 | c1 | dispatch-utf16-needle-33 | 4,822.46 ± 478.98 | 2,787.23 ± 309.33 | 272.94 ± 5.51 | 17.669× | 10.212× | faster / faster |
| avx512 | c1 | equal-latin-large | 3,374.80 ± 125.12 | 3,372.60 ± 136.60 | 66.04 ± 11.18 | 51.105× | 51.072× | faster / faster |
| avx512 | c1 | equal-latin-short | 31.35 ± 1.48 | 32.15 ± 1.20 | 11.38 ± 1.34 | 2.754× | 2.824× | faster / faster |
| avx512 | c1 | equal-utf16-large | 6,624.27 ± 297.22 | 6,777.97 ± 487.24 | 136.75 ± 1.94 | 48.442× | 49.566× | faster / faster |
| avx512 | c1 | long-crossed-4 | 4,772.57 ± 258.00 | 2,496.94 ± 316.83 | 313.90 ± 11.89 | 15.204× | 7.955× | faster / faster |
| avx512 | c1 | long-end-256 | 7,511.33 ± 483.96 | 8,059.51 ± 185.65 | 363.26 ± 19.11 | 20.678× | 22.187× | faster / faster |
| avx512 | c1 | long-end-64-large | 7,552.44 ± 538.56 | 8,089.78 ± 335.75 | 345.15 ± 3.10 | 21.882× | 23.438× | faster / faster |
| avx512 | c1 | long-end-64-small | 1,010.64 ± 70.72 | 972.08 ± 65.49 | 68.66 ± 5.74 | 14.719× | 14.158× | faster / faster |
| avx512 | c1 | long-overlap-129 | 59,084.38 ± 1,304.81 | 48,686.29 ± 1,450.17 | 55.60 ± 6.53 | 1062.628× | 875.619× | faster / faster |
| avx512 | c1 | long-overlap-latin-257 | 158,474.45 ± 9,417.90 | 154,746.71 ± 4,489.09 | 73.51 ± 3.41 | 2155.816× | 2105.106× | faster / faster |
| avx512 | c1 | long-start-64-large | 217,777.18 ± 26,344.65 | 192,750.92 ± 13,172.06 | 6,267.83 ± 325.00 | 34.745× | 30.752× | faster / faster |
| avx512 | c1 | mixed-reverse-64 | 4,682.10 ± 144.36 | 2,456.68 ± 176.70 | 272.07 ± 21.58 | 17.209× | 9.030× | faster / faster |
| avx512 | c1 | mixed-reverse-65 | 5,344.62 ± 1,105.14 | 2,891.89 ± 550.70 | 291.46 ± 22.92 | 18.337× | 9.922× | faster / faster |
| avx512 | c1 | overlap-min-latin-256 | 611.96 ± 28.21 | 617.32 ± 19.40 | 58.41 ± 2.26 | 10.477× | 10.569× | faster / faster |
| avx512 | c1 | overlap-min-latin-257 | 649.01 ± 48.51 | 614.65 ± 32.96 | 59.97 ± 1.81 | 10.823× | 10.250× | faster / faster |
| avx512 | c1 | overlap-min-latin-258 | 604.11 ± 4.95 | 616.15 ± 16.01 | 60.57 ± 1.70 | 9.974× | 10.173× | faster / faster |
| avx512 | c1 | overlap-min-utf16-128 | 234.39 ± 12.80 | 192.23 ± 2.76 | 19.70 ± 0.79 | 11.901× | 9.760× | faster / faster |
| avx512 | c1 | overlap-min-utf16-129 | 229.70 ± 6.70 | 196.88 ± 9.52 | 27.07 ± 5.14 | 8.485× | 7.273× | faster / faster |
| avx512 | c1 | overlap-min-utf16-130 | 230.85 ± 12.96 | 203.05 ± 11.53 | 23.41 ± 2.83 | 9.861× | 8.674× | faster / faster |
| avx512 | c1 | reverse-latin | 3,580.27 ± 139.90 | 3,545.16 ± 79.70 | 146.26 ± 26.30 | 24.478× | 24.238× | faster / faster |
| avx512 | c1 | reverse-utf16-bulk | 4,634.73 ± 110.12 | 2,369.62 ± 78.72 | 285.13 ± 10.05 | 16.255× | 8.311× | faster / faster |
| avx512 | c1 | short-latin | 22.54 ± 1.72 | 22.43 ± 1.15 | 22.36 ± 0.90 | 1.008× | 1.003× | overlap / overlap |
| avx512 | c1 | short-utf16-forward | 19.04 ± 0.56 | 18.99 ± 1.23 | 18.08 ± 0.35 | 1.053× | 1.051× | faster / overlap |
| avx512 | c1 | threshold-latin-above | 228.97 ± 19.02 | 238.60 ± 14.80 | 16.62 ± 0.76 | 13.777× | 14.357× | faster / faster |
| avx512 | c1 | threshold-latin-at | 225.15 ± 13.05 | 235.89 ± 9.75 | 16.60 ± 0.26 | 13.561× | 14.208× | faster / faster |
| avx512 | c1 | threshold-latin-below | 232.89 ± 8.94 | 231.86 ± 7.67 | 238.60 ± 24.05 | 0.976× (slower) | 0.972× (slower) | overlap / overlap |
| avx512 | c1 | threshold-utf16-above | 147.58 ± 1.69 | 86.45 ± 11.86 | 18.53 ± 0.88 | 7.965× | 4.665× | faster / faster |
| avx512 | c1 | threshold-utf16-at | 151.92 ± 6.64 | 86.15 ± 9.17 | 18.37 ± 0.33 | 8.271× | 4.691× | faster / faster |
| avx512 | c1 | threshold-utf16-below | 149.64 ± 7.00 | 81.00 ± 2.70 | 79.88 ± 3.43 | 1.873× | 1.014× | faster / overlap |
| avx512 | c1 | tiny-utf16-forward | 6.74 ± 0.68 | 6.26 ± 0.10 | 6.51 ± 0.41 | 1.035× | 0.963× (slower) | overlap / overlap |
| avx512 | c2 | dispatch-latin-end | 5.82 ± 0.10 | 5.81 ± 0.13 | 5.25 ± 0.10 | 1.109× | 1.107× | faster / faster |
| avx512 | c2 | dispatch-latin-needle-31 | 679.43 ± 28.41 | 683.08 ± 14.32 | 150.27 ± 11.11 | 4.521× | 4.546× | faster / faster |
| avx512 | c2 | dispatch-latin-needle-32 | 731.86 ± 28.29 | 723.32 ± 41.67 | 151.24 ± 8.61 | 4.839× | 4.783× | faster / faster |
| avx512 | c2 | dispatch-latin-needle-33 | 669.11 ± 35.28 | 671.10 ± 25.63 | 125.96 ± 18.12 | 5.312× | 5.328× | faster / faster |
| avx512 | c2 | dispatch-utf16-255 | 47.81 ± 2.92 | 51.02 ± 8.27 | 23.55 ± 1.88 | 2.030× | 2.166× | faster / faster |
| avx512 | c2 | dispatch-utf16-256 | 48.14 ± 1.24 | 47.49 ± 1.81 | 22.58 ± 1.37 | 2.132× | 2.103× | faster / faster |
| avx512 | c2 | dispatch-utf16-257 | 49.95 ± 5.96 | 46.81 ± 1.22 | 23.38 ± 1.87 | 2.137× | 2.002× | faster / faster |
| avx512 | c2 | dispatch-utf16-511 | 94.62 ± 7.41 | 89.09 ± 2.78 | 40.74 ± 2.09 | 2.323× | 2.187× | faster / faster |
| avx512 | c2 | dispatch-utf16-512 | 88.59 ± 2.58 | 87.65 ± 2.44 | 39.49 ± 2.04 | 2.243× | 2.219× | faster / faster |
| avx512 | c2 | dispatch-utf16-513 | 90.33 ± 2.06 | 91.25 ± 2.20 | 40.55 ± 3.03 | 2.228× | 2.250× | faster / faster |
| avx512 | c2 | dispatch-utf16-end | 5.58 ± 0.27 | 5.54 ± 0.06 | 4.29 ± 0.23 | 1.301× | 1.292× | faster / faster |
| avx512 | c2 | dispatch-utf16-needle-31 | 697.97 ± 43.97 | 680.65 ± 31.76 | 278.94 ± 22.20 | 2.502× | 2.440× | faster / faster |
| avx512 | c2 | dispatch-utf16-needle-32 | 699.92 ± 63.40 | 683.68 ± 43.99 | 270.35 ± 2.87 | 2.589× | 2.529× | faster / faster |
| avx512 | c2 | dispatch-utf16-needle-33 | 679.22 ± 50.52 | 672.06 ± 22.11 | 265.76 ± 5.42 | 2.556× | 2.529× | faster / faster |
| avx512 | c2 | equal-latin-large | 71.33 ± 1.50 | 69.81 ± 0.74 | 71.58 ± 2.60 | 0.996× (slower) | 0.975× (slower) | overlap / overlap |
| avx512 | c2 | equal-latin-short | 2.29 ± 0.09 | 2.33 ± 0.10 | 2.30 ± 0.02 | 0.995× (slower) | 1.010× | overlap / overlap |
| avx512 | c2 | equal-utf16-large | 122.52 ± 27.08 | 136.03 ± 1.55 | 137.71 ± 6.20 | 0.890× (slower) | 0.988× (slower) | overlap / overlap |
| avx512 | c2 | long-crossed-4 | 684.32 ± 22.24 | 675.69 ± 14.47 | 295.75 ± 19.68 | 2.314× | 2.285× | faster / faster |
| avx512 | c2 | long-end-256 | 2,636.07 ± 42.71 | 2,654.61 ± 54.99 | 362.13 ± 9.15 | 7.279× | 7.330× | faster / faster |
| avx512 | c2 | long-end-64-large | 2,369.47 ± 54.23 | 2,407.18 ± 99.00 | 345.03 ± 17.35 | 6.868× | 6.977× | faster / faster |
| avx512 | c2 | long-end-64-small | 295.66 ± 17.06 | 292.68 ± 8.05 | 68.17 ± 5.10 | 4.337× | 4.293× | faster / faster |
| avx512 | c2 | long-overlap-129 | 19,707.20 ± 313.72 | 18,255.04 ± 782.03 | 52.35 ± 2.94 | 376.449× | 348.710× | faster / faster |
| avx512 | c2 | long-overlap-latin-257 | 36,480.54 ± 1,918.20 | 35,938.94 ± 371.05 | 72.50 ± 3.40 | 503.166× | 495.695× | faster / faster |
| avx512 | c2 | long-start-64-large | 77,114.52 ± 24,414.06 | 85,011.62 ± 29,812.77 | 6,298.62 ± 293.32 | 12.243× | 13.497× | faster / faster |
| avx512 | c2 | mixed-reverse-64 | 679.45 ± 42.17 | 686.11 ± 36.13 | 292.34 ± 16.01 | 2.324× | 2.347× | faster / faster |
| avx512 | c2 | mixed-reverse-65 | 658.35 ± 7.63 | 696.80 ± 44.61 | 170.57 ± 5.85 | 3.860× | 4.085× | faster / faster |
| avx512 | c2 | overlap-min-latin-256 | 158.57 ± 6.72 | 160.93 ± 7.21 | 55.36 ± 1.68 | 2.865× | 2.907× | faster / faster |
| avx512 | c2 | overlap-min-latin-257 | 153.90 ± 2.02 | 152.40 ± 4.07 | 56.18 ± 1.39 | 2.739× | 2.713× | faster / faster |
| avx512 | c2 | overlap-min-latin-258 | 155.68 ± 5.75 | 148.39 ± 3.32 | 56.77 ± 2.17 | 2.742× | 2.614× | faster / faster |
| avx512 | c2 | overlap-min-utf16-128 | 94.12 ± 5.17 | 74.12 ± 2.55 | 16.24 ± 0.58 | 5.797× | 4.565× | faster / faster |
| avx512 | c2 | overlap-min-utf16-129 | 95.57 ± 3.47 | 78.58 ± 3.95 | 20.45 ± 2.02 | 4.673× | 3.842× | faster / faster |
| avx512 | c2 | overlap-min-utf16-130 | 90.61 ± 2.27 | 74.24 ± 1.30 | 20.20 ± 0.31 | 4.486× | 3.676× | faster / faster |
| avx512 | c2 | reverse-latin | 690.75 ± 31.31 | 701.42 ± 35.37 | 131.07 ± 12.98 | 5.270× | 5.352× | faster / faster |
| avx512 | c2 | reverse-utf16-bulk | 685.72 ± 29.99 | 683.92 ± 17.06 | 253.28 ± 18.55 | 2.707× | 2.700× | faster / faster |
| avx512 | c2 | short-latin | 4.65 ± 0.08 | 4.65 ± 0.12 | 4.64 ± 0.21 | 1.003× | 1.003× | overlap / overlap |
| avx512 | c2 | short-utf16-forward | 7.66 ± 0.16 | 7.97 ± 0.37 | 7.72 ± 0.07 | 0.992× (slower) | 1.032× | overlap / overlap |
| avx512 | c2 | threshold-latin-above | 47.25 ± 2.26 | 48.50 ± 1.89 | 13.71 ± 0.25 | 3.446× | 3.537× | faster / faster |
| avx512 | c2 | threshold-latin-at | 46.64 ± 0.80 | 47.98 ± 0.57 | 14.05 ± 0.34 | 3.318× | 3.414× | faster / faster |
| avx512 | c2 | threshold-latin-below | 46.37 ± 1.09 | 46.94 ± 0.38 | 47.76 ± 3.29 | 0.971× (slower) | 0.983× (slower) | overlap / overlap |
| avx512 | c2 | threshold-utf16-above | 27.80 ± 0.38 | 27.58 ± 1.62 | 16.85 ± 1.37 | 1.649× | 1.636× | faster / faster |
| avx512 | c2 | threshold-utf16-at | 30.43 ± 0.98 | 27.52 ± 0.59 | 16.11 ± 0.38 | 1.889× | 1.708× | faster / faster |
| avx512 | c2 | threshold-utf16-below | 27.72 ± 2.11 | 26.22 ± 2.40 | 26.51 ± 1.13 | 1.046× | 0.989× (slower) | overlap / overlap |
| avx512 | c2 | tiny-utf16-forward | 4.19 ± 0.13 | 4.10 ± 0.06 | 4.16 ± 0.05 | 1.008× | 0.986× (slower) | overlap / overlap |
| avx512 | interpreter | dispatch-latin-end | 315.90 ± 6.99 | 351.05 ± 15.62 | 324.36 ± 9.86 | 0.974× (slower) | 1.082× | overlap / faster |
| avx512 | interpreter | dispatch-latin-needle-31 | 33,386.19 ± 1,918.23 | 41,561.69 ± 6,162.41 | 414.03 ± 21.68 | 80.637× | 100.383× | faster / faster |
| avx512 | interpreter | dispatch-latin-needle-32 | 35,435.81 ± 4,387.13 | 38,899.17 ± 2,697.14 | 420.32 ± 18.67 | 84.307× | 92.546× | faster / faster |
| avx512 | interpreter | dispatch-latin-needle-33 | 33,055.52 ± 2,005.04 | 38,517.21 ± 1,906.70 | 417.90 ± 13.44 | 79.099× | 92.168× | faster / faster |
| avx512 | interpreter | dispatch-utf16-255 | 9,379.37 ± 1,014.61 | 10,232.63 ± 451.86 | 507.09 ± 30.53 | 18.497× | 20.179× | faster / faster |
| avx512 | interpreter | dispatch-utf16-256 | 9,627.81 ± 274.19 | 10,200.00 ± 909.41 | 520.08 ± 15.60 | 18.512× | 19.612× | faster / faster |
| avx512 | interpreter | dispatch-utf16-257 | 9,369.42 ± 351.44 | 9,900.37 ± 371.46 | 506.40 ± 24.28 | 18.502× | 19.551× | faster / faster |
| avx512 | interpreter | dispatch-utf16-511 | 18,874.56 ± 677.43 | 20,491.34 ± 1,362.78 | 541.77 ± 16.74 | 34.839× | 37.823× | faster / faster |
| avx512 | interpreter | dispatch-utf16-512 | 18,105.37 ± 789.65 | 19,463.17 ± 1,196.39 | 531.54 ± 24.67 | 34.062× | 36.617× | faster / faster |
| avx512 | interpreter | dispatch-utf16-513 | 18,372.62 ± 1,147.16 | 19,092.92 ± 1,471.65 | 513.36 ± 22.85 | 35.789× | 37.192× | faster / faster |
| avx512 | interpreter | dispatch-utf16-end | 680.39 ± 33.94 | 761.00 ± 61.82 | 435.19 ± 22.84 | 1.563× | 1.749× | faster / faster |
| avx512 | interpreter | dispatch-utf16-needle-31 | 143,810.19 ± 9,634.89 | 151,077.68 ± 11,741.70 | 708.58 ± 101.93 | 202.955× | 213.211× | faster / faster |
| avx512 | interpreter | dispatch-utf16-needle-32 | 143,772.67 ± 5,043.91 | 153,537.29 ± 11,495.18 | 687.89 ± 13.76 | 209.005× | 223.200× | faster / faster |
| avx512 | interpreter | dispatch-utf16-needle-33 | 138,821.86 ± 4,773.31 | 147,227.92 ± 7,858.02 | 669.30 ± 51.75 | 207.412× | 219.971× | faster / faster |
| avx512 | interpreter | equal-latin-large | 45,277.11 ± 1,347.66 | 56,936.84 ± 3,450.38 | 190.10 ± 16.19 | 238.171× | 299.505× | faster / faster |
| avx512 | interpreter | equal-latin-short | 477.06 ± 22.22 | 636.01 ± 67.44 | 117.15 ± 2.79 | 4.072× | 5.429× | faster / faster |
| avx512 | interpreter | equal-utf16-large | 88,434.97 ± 1,809.32 | 119,731.28 ± 18,946.56 | 270.17 ± 14.42 | 327.333× | 443.173× | faster / faster |
| avx512 | interpreter | long-crossed-4 | 149,062.31 ± 16,178.01 | 149,779.34 ± 6,866.77 | 763.68 ± 16.68 | 195.189× | 196.128× | faster / faster |
| avx512 | interpreter | long-end-256 | 473,226.86 ± 42,130.07 | 497,683.87 ± 25,121.75 | 1,065.55 ± 65.35 | 444.113× | 467.066× | faster / faster |
| avx512 | interpreter | long-end-64-large | 494,927.39 ± 19,707.68 | 511,259.82 ± 29,523.90 | 749.01 ± 11.57 | 660.774× | 682.579× | faster / faster |
| avx512 | interpreter | long-end-64-small | 57,719.55 ± 3,629.03 | 65,141.33 ± 10,273.38 | 481.08 ± 26.94 | 119.979× | 135.407× | faster / faster |
| avx512 | interpreter | long-overlap-129 | 4,359,859.62 ± 127,327.49 | 4,562,911.71 ± 160,813.90 | 466.01 ± 10.15 | 9355.769× | 9791.496× | faster / faster |
| avx512 | interpreter | long-overlap-latin-257 | 1,589,806.46 ± 65,393.35 | 1,663,898.47 ± 146,242.61 | 331.11 ± 6.91 | 4801.503× | 5025.275× | faster / faster |
| avx512 | interpreter | long-start-64-large | 17,745,369.49 ± 1,988,550.67 | 17,369,619.74 ± 697,670.94 | 6,729.32 ± 469.95 | 2637.022× | 2581.184× | faster / faster |
| avx512 | interpreter | mixed-reverse-64 | 146,525.97 ± 10,898.82 | 152,158.47 ± 8,311.15 | 603.73 ± 33.12 | 242.701× | 252.031× | faster / faster |
| avx512 | interpreter | mixed-reverse-65 | 146,097.79 ± 7,820.96 | 152,208.99 ± 4,478.65 | 614.65 ± 86.64 | 237.693× | 247.636× | faster / faster |
| avx512 | interpreter | overlap-min-latin-256 | 6,734.97 ± 445.34 | 6,882.11 ± 671.31 | 323.61 ± 15.44 | 20.812× | 21.267× | faster / faster |
| avx512 | interpreter | overlap-min-latin-257 | 6,727.60 ± 417.23 | 6,842.27 ± 411.62 | 320.17 ± 6.59 | 21.013× | 21.371× | faster / faster |
| avx512 | interpreter | overlap-min-latin-258 | 6,570.41 ± 237.97 | 6,835.35 ± 462.39 | 339.85 ± 10.23 | 19.333× | 20.113× | faster / faster |
| avx512 | interpreter | overlap-min-utf16-128 | 17,754.83 ± 1,916.02 | 18,493.03 ± 1,625.96 | 450.26 ± 28.42 | 39.432× | 41.072× | faster / faster |
| avx512 | interpreter | overlap-min-utf16-129 | 17,563.00 ± 548.40 | 18,770.92 ± 993.78 | 456.06 ± 15.63 | 38.510× | 41.159× | faster / faster |
| avx512 | interpreter | overlap-min-utf16-130 | 18,078.50 ± 617.86 | 18,482.88 ± 572.32 | 453.75 ± 13.83 | 39.843× | 40.734× | faster / faster |
| avx512 | interpreter | reverse-latin | 32,502.77 ± 1,159.62 | 41,105.94 ± 4,096.10 | 448.08 ± 11.53 | 72.539× | 91.739× | faster / faster |
| avx512 | interpreter | reverse-utf16-bulk | 150,546.47 ± 14,909.84 | 147,430.34 ± 7,830.68 | 745.46 ± 12.53 | 201.952× | 197.772× | faster / faster |
| avx512 | interpreter | short-latin | 462.98 ± 18.26 | 498.51 ± 27.90 | 169.58 ± 11.97 | 2.730× | 2.940× | faster / faster |
| avx512 | interpreter | short-utf16-forward | 1,362.47 ± 87.08 | 1,359.69 ± 37.79 | 159.15 ± 11.20 | 8.561× | 8.544× | faster / faster |
| avx512 | interpreter | threshold-latin-above | 2,561.56 ± 228.00 | 2,808.60 ± 237.93 | 320.34 ± 12.22 | 7.996× | 8.768× | faster / faster |
| avx512 | interpreter | threshold-latin-at | 2,340.08 ± 173.89 | 2,897.26 ± 244.45 | 332.59 ± 26.46 | 7.036× | 8.711× | faster / faster |
| avx512 | interpreter | threshold-latin-below | 2,441.94 ± 252.59 | 2,824.08 ± 546.75 | 2,742.83 ± 103.33 | 0.890× (slower) | 1.030× | overlap / overlap |
| avx512 | interpreter | threshold-utf16-above | 4,861.42 ± 214.94 | 5,298.40 ± 704.99 | 500.36 ± 23.77 | 9.716× | 10.589× | faster / faster |
| avx512 | interpreter | threshold-utf16-at | 4,849.03 ± 181.48 | 5,065.67 ± 248.49 | 491.20 ± 16.22 | 9.872× | 10.313× | faster / faster |
| avx512 | interpreter | threshold-utf16-below | 4,858.46 ± 355.69 | 4,932.47 ± 161.76 | 4,903.44 ± 181.42 | 0.991× (slower) | 1.006× | overlap / overlap |
| avx512 | interpreter | tiny-utf16-forward | 300.58 ± 15.26 | 300.35 ± 12.45 | 177.98 ± 25.41 | 1.689× | 1.688× | faster / faster |
| serial | c1 | dispatch-avx2-latin-span-31 | 10,072.37 ± 423.29 | 9,840.12 ± 224.04 | 892.31 ± 35.46 | 11.288× | 11.028× | faster / faster |
| serial | c1 | dispatch-avx2-latin-span-32 | 9,674.67 ± 73.43 | 10,194.24 ± 671.86 | 874.86 ± 32.98 | 11.059× | 11.652× | faster / faster |
| serial | c1 | dispatch-avx2-latin-span-33 | 10,842.56 ± 1,049.40 | 11,125.58 ± 1,267.36 | 872.82 ± 49.49 | 12.422× | 12.747× | faster / faster |
| serial | c1 | dispatch-avx2-utf16-span-17 | 2,021.01 ± 27.79 | 1,763.13 ± 109.45 | 694.15 ± 17.26 | 2.912× | 2.540× | faster / faster |
| serial | c1 | dispatch-c1-latin-work-1 | 929.69 ± 49.32 | 968.61 ± 74.29 | 930.08 ± 42.29 | 1.000× (slower) | 1.041× | overlap / overlap |
| serial | c1 | dispatch-c1-latin-work-2 | 1,248.06 ± 43.76 | 1,206.62 ± 14.97 | 878.39 ± 42.26 | 1.421× | 1.374× | faster / faster |
| serial | c1 | dispatch-c1-latin-work-3 | 1,517.43 ± 121.89 | 1,542.93 ± 62.54 | 854.94 ± 27.71 | 1.775× | 1.805× | faster / faster |
| serial | c1 | dispatch-c1-utf16-work-5 | 786.02 ± 19.67 | 675.33 ± 17.02 | 105.60 ± 1.11 | 7.444× | 6.395× | faster / faster |
| serial | c1 | dispatch-c1-utf16-work-6 | 887.13 ± 46.82 | 757.04 ± 22.15 | 714.33 ± 37.90 | 1.242× | 1.060× | faster / overlap |
| serial | c1 | dispatch-c1-utf16-work-7 | 1,037.55 ± 73.74 | 878.02 ± 47.09 | 666.14 ± 49.28 | 1.558× | 1.318× | faster / faster |
| serial | c1 | dispatch-c2-latin-work-13 | 4,509.17 ± 143.53 | 4,678.34 ± 284.68 | 879.66 ± 56.80 | 5.126× | 5.318× | faster / faster |
| serial | c1 | dispatch-c2-latin-work-14 | 4,986.04 ± 102.84 | 4,880.74 ± 121.04 | 880.34 ± 54.89 | 5.664× | 5.544× | faster / faster |
| serial | c1 | dispatch-c2-latin-work-15 | 5,110.09 ± 139.60 | 5,128.37 ± 195.01 | 840.99 ± 91.18 | 6.076× | 6.098× | faster / faster |
| serial | c1 | dispatch-c2-utf16-work-13 | 1,763.92 ± 127.95 | 1,460.68 ± 32.39 | 673.92 ± 74.55 | 2.617× | 2.167× | faster / faster |
| serial | c1 | dispatch-c2-utf16-work-14 | 1,926.34 ± 78.43 | 1,570.48 ± 140.38 | 683.42 ± 58.77 | 2.819× | 2.298× | faster / faster |
| serial | c1 | dispatch-c2-utf16-work-15 | 1,984.26 ± 64.28 | 1,623.53 ± 53.70 | 700.50 ± 33.84 | 2.833× | 2.318× | faster / faster |
| serial | c1 | dispatch-latin-end | 11.18 ± 0.62 | 11.44 ± 0.24 | 9.23 ± 0.20 | 1.212× | 1.239× | faster / faster |
| serial | c1 | dispatch-latin-needle-31 | 3,675.01 ± 133.58 | 3,613.22 ± 103.07 | 623.03 ± 46.74 | 5.899× | 5.799× | faster / faster |
| serial | c1 | dispatch-latin-needle-32 | 3,494.68 ± 127.49 | 3,490.91 ± 95.75 | 574.59 ± 32.47 | 6.082× | 6.075× | faster / faster |
| serial | c1 | dispatch-latin-needle-33 | 3,404.70 ± 30.19 | 3,522.24 ± 74.89 | 551.26 ± 21.46 | 6.176× | 6.389× | faster / faster |
| serial | c1 | dispatch-latin-range-1023 | 864.05 ± 13.82 | 864.10 ± 41.76 | 154.12 ± 2.94 | 5.606× | 5.607× | faster / faster |
| serial | c1 | dispatch-latin-range-1024 | 854.75 ± 25.48 | 871.72 ± 36.60 | 159.77 ± 4.77 | 5.350× | 5.456× | faster / faster |
| serial | c1 | dispatch-latin-range-1025 | 872.73 ± 48.82 | 884.84 ± 61.42 | 160.51 ± 4.26 | 5.437× | 5.513× | faster / faster |
| serial | c1 | dispatch-utf16-255 | 314.63 ± 19.43 | 162.59 ± 14.75 | 33.86 ± 0.86 | 9.291× | 4.802× | faster / faster |
| serial | c1 | dispatch-utf16-256 | 302.51 ± 11.43 | 170.11 ± 13.35 | 34.75 ± 1.45 | 8.706× | 4.896× | faster / faster |
| serial | c1 | dispatch-utf16-257 | 300.42 ± 3.25 | 166.23 ± 8.71 | 33.95 ± 0.64 | 8.849× | 4.897× | faster / faster |
| serial | c1 | dispatch-utf16-511 | 601.00 ± 35.92 | 318.26 ± 28.80 | 44.91 ± 0.80 | 13.384× | 7.087× | faster / faster |
| serial | c1 | dispatch-utf16-512 | 605.57 ± 19.97 | 303.03 ± 7.17 | 45.20 ± 1.16 | 13.398× | 6.705× | faster / faster |
| serial | c1 | dispatch-utf16-513 | 607.80 ± 21.13 | 318.57 ± 25.12 | 46.97 ± 1.64 | 12.940× | 6.782× | faster / faster |
| serial | c1 | dispatch-utf16-end | 10.76 ± 0.76 | 8.35 ± 0.21 | 8.54 ± 0.24 | 1.259× | 0.977× (slower) | faster / overlap |
| serial | c1 | dispatch-utf16-long-bulk | 44,068.60 ± 1,085.43 | 37,060.17 ± 2,273.04 | 878.44 ± 34.19 | 50.167× | 42.189× | faster / faster |
| serial | c1 | dispatch-utf16-needle-31 | 4,701.62 ± 157.07 | 2,749.64 ± 326.25 | 240.73 ± 17.49 | 19.530× | 11.422× | faster / faster |
| serial | c1 | dispatch-utf16-needle-32 | 4,824.27 ± 281.71 | 2,428.62 ± 178.07 | 230.39 ± 17.58 | 20.939× | 10.541× | faster / faster |
| serial | c1 | dispatch-utf16-needle-33 | 4,755.48 ± 300.11 | 3,152.58 ± 558.59 | 276.56 ± 12.77 | 17.195× | 11.399× | faster / faster |
| serial | c1 | equal-latin-large | 3,339.24 ± 140.53 | 3,327.40 ± 228.39 | 1,193.54 ± 31.93 | 2.798× | 2.788× | faster / faster |
| serial | c1 | equal-latin-short | 31.54 ± 0.58 | 32.00 ± 1.21 | 22.16 ± 0.84 | 1.423× | 1.444× | faster / faster |
| serial | c1 | equal-utf16-large | 6,772.76 ± 533.38 | 6,678.44 ± 319.93 | 2,423.43 ± 114.84 | 2.795× | 2.756× | faster / faster |
| serial | c1 | long-crossed-4 | 4,738.89 ± 95.18 | 2,697.96 ± 498.72 | 225.65 ± 7.36 | 21.001× | 11.956× | faster / faster |
| serial | c1 | long-end-256 | 7,580.33 ± 343.23 | 8,370.88 ± 724.47 | 2,360.09 ± 50.91 | 3.212× | 3.547× | faster / faster |
| serial | c1 | long-end-64-large | 7,695.02 ± 670.20 | 8,502.74 ± 787.08 | 291.85 ± 12.47 | 26.366× | 29.134× | faster / faster |
| serial | c1 | long-end-64-small | 930.65 ± 53.33 | 967.25 ± 52.34 | 48.43 ± 1.52 | 19.216× | 19.972× | faster / faster |
| serial | c1 | long-overlap-129 | 60,707.91 ± 3,691.79 | 49,732.10 ± 2,074.09 | 732.76 ± 9.39 | 82.848× | 67.869× | faster / faster |
| serial | c1 | long-overlap-latin-257 | 159,205.06 ± 8,286.07 | 152,631.60 ± 3,648.45 | 826.89 ± 19.88 | 192.535× | 184.586× | faster / faster |
| serial | c1 | long-start-64-large | 218,339.43 ± 13,225.46 | 186,982.87 ± 9,295.05 | 6,117.26 ± 145.02 | 35.692× | 30.566× | faster / faster |
| serial | c1 | mixed-reverse-64 | 4,740.80 ± 187.47 | 2,466.33 ± 195.88 | 340.71 ± 9.63 | 13.914× | 7.239× | faster / faster |
| serial | c1 | mixed-reverse-65 | 4,656.85 ± 122.44 | 2,398.03 ± 104.12 | 1,813.27 ± 132.19 | 2.568× | 1.322× | faster / faster |
| serial | c1 | overlap-min-latin-256 | 623.47 ± 46.40 | 632.28 ± 71.30 | 240.38 ± 16.61 | 2.594× | 2.630× | faster / faster |
| serial | c1 | overlap-min-latin-257 | 592.15 ± 8.08 | 614.59 ± 19.08 | 604.51 ± 17.82 | 0.980× (slower) | 1.017× | overlap / overlap |
| serial | c1 | overlap-min-latin-258 | 609.84 ± 14.18 | 658.45 ± 55.18 | 618.98 ± 27.08 | 0.985× (slower) | 1.064× | overlap / overlap |
| serial | c1 | overlap-min-utf16-128 | 226.64 ± 11.18 | 195.26 ± 7.01 | 49.04 ± 1.79 | 4.621× | 3.982× | faster / faster |
| serial | c1 | overlap-min-utf16-129 | 229.61 ± 13.56 | 196.32 ± 7.23 | 105.15 ± 4.12 | 2.184× | 1.867× | faster / faster |
| serial | c1 | overlap-min-utf16-130 | 229.55 ± 7.48 | 196.40 ± 10.29 | 107.80 ± 3.75 | 2.129× | 1.822× | faster / faster |
| serial | c1 | reverse-latin | 3,565.66 ± 125.84 | 3,529.75 ± 54.97 | 1,824.50 ± 97.95 | 1.954× | 1.935× | faster / faster |
| serial | c1 | reverse-utf16-bulk | 4,750.68 ± 199.89 | 2,562.08 ± 211.70 | 231.59 ± 14.06 | 20.514× | 11.063× | faster / faster |
| serial | c1 | short-latin | 22.59 ± 0.89 | 21.82 ± 0.50 | 22.24 ± 0.80 | 1.016× | 0.981× (slower) | overlap / overlap |
| serial | c1 | short-utf16-forward | 18.30 ± 0.78 | 18.33 ± 1.06 | 17.90 ± 0.42 | 1.022× | 1.024× | overlap / overlap |
| serial | c1 | threshold-latin-above | 234.97 ± 11.22 | 225.74 ± 3.01 | 131.69 ± 3.18 | 1.784× | 1.714× | faster / faster |
| serial | c1 | threshold-latin-at | 229.48 ± 10.21 | 226.28 ± 8.20 | 128.21 ± 4.67 | 1.790× | 1.765× | faster / faster |
| serial | c1 | threshold-latin-below | 228.67 ± 13.46 | 232.20 ± 16.45 | 226.48 ± 6.35 | 1.010× | 1.025× | overlap / overlap |
| serial | c1 | threshold-utf16-above | 154.10 ± 9.19 | 83.13 ± 11.47 | 28.40 ± 0.59 | 5.425× | 2.926× | faster / faster |
| serial | c1 | threshold-utf16-at | 152.31 ± 6.52 | 83.57 ± 9.25 | 28.63 ± 2.28 | 5.319× | 2.918× | faster / faster |
| serial | c1 | threshold-utf16-below | 148.77 ± 3.85 | 78.40 ± 3.16 | 89.93 ± 17.88 | 1.654× | 0.872× (slower) | faster / overlap |
| serial | c1 | tiny-utf16-forward | 6.46 ± 0.32 | 6.27 ± 0.08 | 6.38 ± 0.31 | 1.013× | 0.982× (slower) | overlap / overlap |
| serial | c2 | dispatch-avx2-latin-span-31 | 2,832.94 ± 170.37 | 2,905.56 ± 358.94 | 931.09 ± 75.86 | 3.043× | 3.121× | faster / faster |
| serial | c2 | dispatch-avx2-latin-span-32 | 3,064.30 ± 182.42 | 2,801.51 ± 21.28 | 891.37 ± 72.57 | 3.438× | 3.143× | faster / faster |
| serial | c2 | dispatch-avx2-latin-span-33 | 2,951.63 ± 117.51 | 3,350.93 ± 135.01 | 856.15 ± 34.57 | 3.448× | 3.914× | faster / faster |
| serial | c2 | dispatch-avx2-utf16-span-17 | 821.44 ± 43.77 | 730.97 ± 12.70 | 723.34 ± 34.63 | 1.136× | 1.011× | faster / overlap |
| serial | c2 | dispatch-c1-latin-work-1 | 272.68 ± 8.78 | 272.36 ± 11.34 | 159.29 ± 14.23 | 1.712× | 1.710× | faster / faster |
| serial | c2 | dispatch-c1-latin-work-2 | 347.19 ± 6.15 | 367.66 ± 19.38 | 153.30 ± 9.72 | 2.265× | 2.398× | faster / faster |
| serial | c2 | dispatch-c1-latin-work-3 | 434.02 ± 7.73 | 451.35 ± 21.40 | 147.36 ± 1.95 | 2.945× | 3.063× | faster / faster |
| serial | c2 | dispatch-c1-utf16-work-5 | 324.34 ± 6.34 | 295.57 ± 7.88 | 63.88 ± 3.77 | 5.077× | 4.627× | faster / faster |
| serial | c2 | dispatch-c1-utf16-work-6 | 371.91 ± 17.42 | 342.85 ± 37.77 | 65.49 ± 2.03 | 5.679× | 5.235× | faster / faster |
| serial | c2 | dispatch-c1-utf16-work-7 | 411.86 ± 24.56 | 366.86 ± 4.40 | 64.53 ± 3.19 | 6.382× | 5.685× | faster / faster |
| serial | c2 | dispatch-c2-latin-work-13 | 1,287.38 ± 32.22 | 1,323.70 ± 36.03 | 198.98 ± 2.07 | 6.470× | 6.652× | faster / faster |
| serial | c2 | dispatch-c2-latin-work-14 | 1,415.02 ± 48.88 | 1,464.26 ± 136.45 | 902.57 ± 51.00 | 1.568× | 1.622× | faster / faster |
| serial | c2 | dispatch-c2-latin-work-15 | 1,531.56 ± 35.66 | 1,509.18 ± 99.08 | 795.22 ± 35.90 | 1.926× | 1.898× | faster / faster |
| serial | c2 | dispatch-c2-utf16-work-13 | 720.49 ± 30.60 | 603.01 ± 11.79 | 68.16 ± 1.21 | 10.570× | 8.847× | faster / faster |
| serial | c2 | dispatch-c2-utf16-work-14 | 751.48 ± 66.10 | 654.56 ± 9.13 | 638.33 ± 27.43 | 1.177× | 1.025× | faster / overlap |
| serial | c2 | dispatch-c2-utf16-work-15 | 766.38 ± 21.77 | 728.90 ± 23.09 | 679.58 ± 24.20 | 1.128× | 1.073× | faster / faster |
| serial | c2 | dispatch-latin-end | 6.01 ± 0.29 | 7.72 ± 0.34 | 5.35 ± 0.20 | 1.122× | 1.442× | faster / faster |
| serial | c2 | dispatch-latin-needle-31 | 658.23 ± 8.67 | 671.09 ± 21.26 | 196.82 ± 11.14 | 3.344× | 3.410× | faster / faster |
| serial | c2 | dispatch-latin-needle-32 | 670.65 ± 18.85 | 694.38 ± 50.33 | 597.57 ± 45.34 | 1.122× | 1.162× | faster / faster |
| serial | c2 | dispatch-latin-needle-33 | 674.48 ± 22.56 | 687.88 ± 32.06 | 559.02 ± 10.06 | 1.207× | 1.231× | faster / faster |
| serial | c2 | dispatch-latin-range-1023 | 178.11 ± 3.24 | 168.71 ± 4.95 | 50.66 ± 1.08 | 3.516× | 3.330× | faster / faster |
| serial | c2 | dispatch-latin-range-1024 | 164.89 ± 4.85 | 171.18 ± 3.59 | 159.87 ± 7.63 | 1.031× | 1.071× | overlap / faster |
| serial | c2 | dispatch-latin-range-1025 | 169.32 ± 8.01 | 169.63 ± 6.41 | 156.57 ± 2.45 | 1.081× | 1.083× | faster / faster |
| serial | c2 | dispatch-utf16-255 | 48.60 ± 2.31 | 49.68 ± 1.88 | 46.85 ± 1.60 | 1.037× | 1.060× | overlap / overlap |
| serial | c2 | dispatch-utf16-256 | 50.36 ± 2.14 | 51.33 ± 3.34 | 49.16 ± 2.59 | 1.024× | 1.044× | overlap / overlap |
| serial | c2 | dispatch-utf16-257 | 49.64 ± 4.50 | 47.79 ± 2.16 | 47.44 ± 1.79 | 1.046× | 1.007× | overlap / overlap |
| serial | c2 | dispatch-utf16-511 | 96.10 ± 7.24 | 93.02 ± 6.59 | 89.87 ± 1.21 | 1.069× | 1.035× | overlap / overlap |
| serial | c2 | dispatch-utf16-512 | 91.62 ± 5.14 | 89.35 ± 2.66 | 43.05 ± 1.36 | 2.128× | 2.075× | faster / faster |
| serial | c2 | dispatch-utf16-513 | 93.55 ± 5.59 | 88.80 ± 2.08 | 44.26 ± 1.53 | 2.113× | 2.006× | faster / faster |
| serial | c2 | dispatch-utf16-end | 5.64 ± 0.11 | 5.43 ± 0.20 | 4.20 ± 0.11 | 1.340× | 1.290× | faster / faster |
| serial | c2 | dispatch-utf16-long-bulk | 17,310.20 ± 754.80 | 15,747.77 ± 508.36 | 913.49 ± 48.51 | 18.950× | 17.239× | faster / faster |
| serial | c2 | dispatch-utf16-needle-31 | 662.19 ± 22.80 | 656.82 ± 25.65 | 224.59 ± 14.34 | 2.948× | 2.924× | faster / faster |
| serial | c2 | dispatch-utf16-needle-32 | 696.77 ± 57.81 | 697.40 ± 47.94 | 219.08 ± 3.83 | 3.180× | 3.183× | faster / faster |
| serial | c2 | dispatch-utf16-needle-33 | 673.25 ± 6.12 | 677.99 ± 19.07 | 272.43 ± 4.39 | 2.471× | 2.489× | faster / faster |
| serial | c2 | equal-latin-large | 118.12 ± 6.00 | 116.69 ± 15.14 | 109.74 ± 11.89 | 1.076× | 1.063× | overlap / overlap |
| serial | c2 | equal-latin-short | 2.89 ± 0.23 | 2.70 ± 0.07 | 2.87 ± 0.24 | 1.006× | 0.939× (slower) | overlap / overlap |
| serial | c2 | equal-utf16-large | 214.86 ± 9.93 | 212.43 ± 21.34 | 218.55 ± 10.00 | 0.983× (slower) | 0.972× (slower) | overlap / overlap |
| serial | c2 | long-crossed-4 | 675.48 ± 24.76 | 676.64 ± 21.48 | 220.87 ± 5.26 | 3.058× | 3.064× | faster / faster |
| serial | c2 | long-end-256 | 3,433.27 ± 812.93 | 3,000.40 ± 151.96 | 2,381.33 ± 83.81 | 1.442× | 1.260× | faster / faster |
| serial | c2 | long-end-64-large | 2,591.20 ± 142.18 | 2,615.44 ± 154.02 | 284.29 ± 8.57 | 9.115× | 9.200× | faster / faster |
| serial | c2 | long-end-64-small | 329.62 ± 8.73 | 349.38 ± 25.45 | 47.20 ± 3.59 | 6.984× | 7.403× | faster / faster |
| serial | c2 | long-overlap-129 | 24,282.09 ± 1,936.42 | 21,003.77 ± 1,410.61 | 678.16 ± 27.71 | 35.806× | 30.972× | faster / faster |
| serial | c2 | long-overlap-latin-257 | 45,198.11 ± 2,247.42 | 44,200.35 ± 1,321.73 | 897.58 ± 38.18 | 50.355× | 49.244× | faster / faster |
| serial | c2 | long-start-64-large | 92,822.81 ± 33,549.56 | 101,246.88 ± 35,744.24 | 6,461.43 ± 609.87 | 14.366× | 15.669× | faster / faster |
| serial | c2 | mixed-reverse-64 | 689.78 ± 55.64 | 673.75 ± 11.72 | 343.60 ± 16.48 | 2.008× | 1.961× | faster / faster |
| serial | c2 | mixed-reverse-65 | 673.24 ± 22.02 | 672.74 ± 27.50 | 250.17 ± 7.84 | 2.691× | 2.689× | faster / faster |
| serial | c2 | overlap-min-latin-256 | 172.65 ± 3.93 | 181.33 ± 12.07 | 183.26 ± 11.26 | 0.942× (slower) | 0.989× (slower) | overlap / overlap |
| serial | c2 | overlap-min-latin-257 | 175.16 ± 4.04 | 175.09 ± 9.08 | 152.54 ± 4.22 | 1.148× | 1.148× | faster / faster |
| serial | c2 | overlap-min-latin-258 | 177.94 ± 3.66 | 176.72 ± 2.32 | 149.48 ± 7.22 | 1.190× | 1.182× | faster / faster |
| serial | c2 | overlap-min-utf16-128 | 96.37 ± 1.59 | 92.12 ± 7.86 | 58.98 ± 2.62 | 1.634× | 1.562× | faster / faster |
| serial | c2 | overlap-min-utf16-129 | 97.17 ± 1.78 | 87.58 ± 3.55 | 59.46 ± 2.06 | 1.634× | 1.473× | faster / faster |
| serial | c2 | overlap-min-utf16-130 | 98.81 ± 5.97 | 88.39 ± 6.15 | 59.62 ± 3.05 | 1.657× | 1.483× | faster / faster |
| serial | c2 | reverse-latin | 710.52 ± 30.00 | 667.99 ± 14.99 | 201.35 ± 13.44 | 3.529× | 3.318× | faster / faster |
| serial | c2 | reverse-utf16-bulk | 707.46 ± 35.36 | 692.50 ± 14.96 | 234.85 ± 8.65 | 3.012× | 2.949× | faster / faster |
| serial | c2 | short-latin | 4.70 ± 0.23 | 4.64 ± 0.12 | 4.73 ± 0.18 | 0.993× (slower) | 0.980× (slower) | overlap / overlap |
| serial | c2 | short-utf16-forward | 7.87 ± 0.28 | 7.72 ± 0.17 | 7.87 ± 0.14 | 1.000× (slower) | 0.981× (slower) | overlap / overlap |
| serial | c2 | threshold-latin-above | 47.62 ± 1.92 | 48.78 ± 2.00 | 21.40 ± 1.37 | 2.225× | 2.279× | faster / faster |
| serial | c2 | threshold-latin-at | 48.19 ± 1.10 | 48.88 ± 3.39 | 21.58 ± 1.33 | 2.233× | 2.265× | faster / faster |
| serial | c2 | threshold-latin-below | 46.54 ± 1.54 | 47.42 ± 1.21 | 48.21 ± 3.90 | 0.965× (slower) | 0.983× (slower) | overlap / overlap |
| serial | c2 | threshold-utf16-above | 26.68 ± 1.24 | 27.33 ± 1.33 | 27.18 ± 1.15 | 0.981× (slower) | 1.006× | overlap / overlap |
| serial | c2 | threshold-utf16-at | 27.04 ± 2.74 | 25.94 ± 2.75 | 27.66 ± 3.11 | 0.978× (slower) | 0.938× (slower) | overlap / overlap |
| serial | c2 | threshold-utf16-below | 26.53 ± 2.58 | 26.98 ± 0.89 | 27.12 ± 1.60 | 0.978× (slower) | 0.995× (slower) | overlap / overlap |
| serial | c2 | tiny-utf16-forward | 4.31 ± 0.23 | 4.34 ± 0.15 | 4.17 ± 0.06 | 1.034× | 1.041× | overlap / overlap |
| serial | interpreter | dispatch-avx2-latin-span-31 | 95,913.64 ± 7,935.37 | 116,886.96 ± 10,601.58 | 1,141.33 ± 39.86 | 84.037× | 102.413× | faster / faster |
| serial | interpreter | dispatch-avx2-latin-span-32 | 99,888.57 ± 6,616.76 | 119,508.97 ± 9,815.68 | 1,150.05 ± 61.96 | 86.856× | 103.916× | faster / faster |
| serial | interpreter | dispatch-avx2-latin-span-33 | 101,457.08 ± 6,298.54 | 118,766.38 ± 8,531.06 | 1,126.70 ± 37.68 | 90.048× | 105.411× | faster / faster |
| serial | interpreter | dispatch-avx2-utf16-span-17 | 158,574.54 ± 12,435.24 | 163,457.44 ± 11,524.78 | 1,132.61 ± 35.36 | 140.009× | 144.320× | faster / faster |
| serial | interpreter | dispatch-c1-latin-work-1 | 9,141.70 ± 447.87 | 11,993.19 ± 2,276.08 | 1,198.58 ± 108.35 | 7.627× | 10.006× | faster / faster |
| serial | interpreter | dispatch-c1-latin-work-2 | 12,183.35 ± 317.98 | 14,845.83 ± 1,063.00 | 1,138.86 ± 50.72 | 10.698× | 13.036× | faster / faster |
| serial | interpreter | dispatch-c1-latin-work-3 | 15,455.77 ± 1,679.28 | 16,921.74 ± 1,294.15 | 1,122.24 ± 32.80 | 13.772× | 15.078× | faster / faster |
| serial | interpreter | dispatch-c1-utf16-work-5 | 62,467.60 ± 4,542.50 | 62,735.72 ± 3,116.43 | 1,132.97 ± 24.43 | 55.136× | 55.373× | faster / faster |
| serial | interpreter | dispatch-c1-utf16-work-6 | 71,366.77 ± 4,809.40 | 71,715.60 ± 3,782.48 | 1,149.29 ± 28.31 | 62.096× | 62.400× | faster / faster |
| serial | interpreter | dispatch-c1-utf16-work-7 | 82,207.30 ± 4,589.16 | 80,731.13 ± 3,277.79 | 1,132.13 ± 15.23 | 72.613× | 71.309× | faster / faster |
| serial | interpreter | dispatch-c2-latin-work-13 | 44,079.92 ± 2,332.44 | 54,530.39 ± 7,354.24 | 1,131.91 ± 28.78 | 38.943× | 48.176× | faster / faster |
| serial | interpreter | dispatch-c2-latin-work-14 | 48,470.71 ± 9,357.48 | 56,067.01 ± 5,965.57 | 1,117.75 ± 25.83 | 43.364× | 50.160× | faster / faster |
| serial | interpreter | dispatch-c2-latin-work-15 | 51,009.74 ± 1,905.19 | 62,001.82 ± 5,107.64 | 1,077.65 ± 35.88 | 47.334× | 57.534× | faster / faster |
| serial | interpreter | dispatch-c2-utf16-work-13 | 134,220.01 ± 6,435.77 | 133,785.45 ± 5,127.44 | 1,070.56 ± 20.76 | 125.373× | 124.967× | faster / faster |
| serial | interpreter | dispatch-c2-utf16-work-14 | 140,240.00 ± 9,025.79 | 142,136.31 ± 11,541.91 | 1,098.64 ± 88.33 | 127.649× | 129.375× | faster / faster |
| serial | interpreter | dispatch-c2-utf16-work-15 | 154,221.27 ± 11,646.84 | 148,476.29 ± 9,634.49 | 1,144.43 ± 37.44 | 134.758× | 129.738× | faster / faster |
| serial | interpreter | dispatch-latin-end | 310.16 ± 12.74 | 352.37 ± 8.91 | 319.45 ± 16.85 | 0.971× (slower) | 1.103× | overlap / faster |
| serial | interpreter | dispatch-latin-needle-31 | 37,569.45 ± 4,967.41 | 39,831.30 ± 2,701.06 | 857.73 ± 19.35 | 43.801× | 46.438× | faster / faster |
| serial | interpreter | dispatch-latin-needle-32 | 34,973.55 ± 2,202.84 | 40,737.31 ± 2,864.58 | 898.31 ± 54.81 | 38.932× | 45.349× | faster / faster |
| serial | interpreter | dispatch-latin-needle-33 | 35,099.05 ± 3,807.19 | 39,958.41 ± 2,916.97 | 812.86 ± 17.89 | 43.180× | 49.158× | faster / faster |
| serial | interpreter | dispatch-latin-range-1023 | 8,570.66 ± 602.83 | 10,208.38 ± 959.21 | 436.31 ± 20.79 | 19.643× | 23.397× | faster / faster |
| serial | interpreter | dispatch-latin-range-1024 | 8,537.52 ± 592.38 | 10,136.07 ± 598.32 | 427.96 ± 9.43 | 19.950× | 23.685× | faster / faster |
| serial | interpreter | dispatch-latin-range-1025 | 8,886.06 ± 948.72 | 10,196.05 ± 545.17 | 435.64 ± 17.21 | 20.398× | 23.405× | faster / faster |
| serial | interpreter | dispatch-utf16-255 | 9,326.58 ± 619.32 | 10,091.11 ± 725.97 | 504.38 ± 17.22 | 18.491× | 20.007× | faster / faster |
| serial | interpreter | dispatch-utf16-256 | 9,738.85 ± 1,032.90 | 10,198.79 ± 404.31 | 502.66 ± 11.14 | 19.375× | 20.290× | faster / faster |
| serial | interpreter | dispatch-utf16-257 | 9,501.18 ± 816.58 | 10,185.19 ± 1,332.71 | 509.85 ± 19.38 | 18.635× | 19.977× | faster / faster |
| serial | interpreter | dispatch-utf16-511 | 18,951.89 ± 1,220.76 | 20,105.12 ± 1,536.68 | 527.28 ± 39.26 | 35.943× | 38.130× | faster / faster |
| serial | interpreter | dispatch-utf16-512 | 18,877.39 ± 1,197.23 | 20,124.42 ± 2,648.35 | 508.82 ± 21.54 | 37.100× | 39.551× | faster / faster |
| serial | interpreter | dispatch-utf16-513 | 18,809.83 ± 1,547.23 | 20,853.55 ± 2,126.24 | 522.86 ± 13.43 | 35.975× | 39.884× | faster / faster |
| serial | interpreter | dispatch-utf16-end | 671.61 ± 22.32 | 726.60 ± 74.81 | 427.65 ± 34.08 | 1.570× | 1.699× | faster / faster |
| serial | interpreter | dispatch-utf16-long-bulk | 3,372,766.49 ± 138,568.92 | 3,591,281.27 ± 214,396.92 | 1,306.31 ± 26.59 | 2581.904× | 2749.180× | faster / faster |
| serial | interpreter | dispatch-utf16-needle-31 | 146,192.69 ± 4,313.89 | 149,119.19 ± 3,453.83 | 654.37 ± 32.43 | 223.411× | 227.883× | faster / faster |
| serial | interpreter | dispatch-utf16-needle-32 | 142,101.64 ± 4,861.71 | 152,388.58 ± 7,732.92 | 649.17 ± 24.61 | 218.896× | 234.743× | faster / faster |
| serial | interpreter | dispatch-utf16-needle-33 | 144,234.54 ± 13,144.64 | 149,104.77 ± 3,425.73 | 712.69 ± 34.63 | 202.381× | 209.214× | faster / faster |
| serial | interpreter | equal-latin-large | 55,780.86 ± 3,569.21 | 47,213.32 ± 2,517.44 | 214.12 ± 7.03 | 260.508× | 220.496× | faster / faster |
| serial | interpreter | equal-latin-short | 562.53 ± 28.26 | 540.82 ± 33.13 | 130.17 ± 6.11 | 4.322× | 4.155× | faster / faster |
| serial | interpreter | equal-utf16-large | 105,100.34 ± 12,356.10 | 97,944.24 ± 18,082.35 | 1,375.96 ± 1,751.83 | 76.383× | 71.183× | faster / faster |
| serial | interpreter | long-crossed-4 | 151,449.44 ± 11,312.13 | 148,024.63 ± 5,349.17 | 719.69 ± 49.25 | 210.436× | 205.677× | faster / faster |
| serial | interpreter | long-end-256 | 473,445.97 ± 25,911.44 | 477,802.06 ± 16,865.79 | 3,046.24 ± 68.31 | 155.420× | 156.850× | faster / faster |
| serial | interpreter | long-end-64-large | 494,195.75 ± 19,215.03 | 488,821.94 ± 24,888.55 | 713.63 ± 22.45 | 692.513× | 684.983× | faster / faster |
| serial | interpreter | long-end-64-small | 61,340.98 ± 8,556.82 | 56,746.51 ± 1,816.70 | 459.26 ± 13.92 | 133.565× | 123.561× | faster / faster |
| serial | interpreter | long-overlap-129 | 4,521,610.01 ± 196,005.88 | 4,440,121.49 ± 291,754.85 | 1,112.06 ± 32.73 | 4065.974× | 3992.697× | faster / faster |
| serial | interpreter | long-overlap-latin-257 | 1,548,593.61 ± 147,832.40 | 1,722,873.11 ± 113,480.42 | 1,192.79 ± 61.03 | 1298.301× | 1444.412× | faster / faster |
| serial | interpreter | long-start-64-large | 17,335,974.76 ± 725,324.76 | 17,543,678.86 ± 914,761.86 | 6,600.62 ± 271.14 | 2626.416× | 2657.883× | faster / faster |
| serial | interpreter | mixed-reverse-64 | 147,846.26 ± 6,834.01 | 154,083.12 ± 11,101.94 | 640.41 ± 12.51 | 230.860× | 240.599× | faster / faster |
| serial | interpreter | mixed-reverse-65 | 147,629.52 ± 9,906.73 | 173,086.55 ± 30,695.97 | 2,234.77 ± 113.84 | 66.060× | 77.452× | faster / faster |
| serial | interpreter | overlap-min-latin-256 | 7,357.62 ± 1,995.13 | 7,147.80 ± 606.69 | 526.78 ± 28.41 | 13.967× | 13.569× | faster / faster |
| serial | interpreter | overlap-min-latin-257 | 6,722.14 ± 690.20 | 7,564.50 ± 736.06 | 1,138.12 ± 48.58 | 5.906× | 6.646× | faster / faster |
| serial | interpreter | overlap-min-latin-258 | 6,442.27 ± 561.08 | 7,144.85 ± 414.02 | 1,164.63 ± 65.90 | 5.532× | 6.135× | faster / faster |
| serial | interpreter | overlap-min-utf16-128 | 18,500.80 ± 852.90 | 17,989.52 ± 737.44 | 480.24 ± 34.87 | 38.524× | 37.460× | faster / faster |
| serial | interpreter | overlap-min-utf16-129 | 17,888.12 ± 771.46 | 18,048.75 ± 376.97 | 1,095.05 ± 48.73 | 16.336× | 16.482× | faster / faster |
| serial | interpreter | overlap-min-utf16-130 | 19,981.98 ± 2,318.37 | 20,196.59 ± 4,191.63 | 1,106.29 ± 46.83 | 18.062× | 18.256× | faster / faster |
| serial | interpreter | reverse-latin | 35,563.96 ± 2,846.72 | 39,230.53 ± 2,634.75 | 2,082.82 ± 45.22 | 17.075× | 18.835× | faster / faster |
| serial | interpreter | reverse-utf16-bulk | 154,211.18 ± 13,618.40 | 155,969.36 ± 19,449.60 | 689.13 ± 14.47 | 223.775× | 226.327× | faster / faster |
| serial | interpreter | short-latin | 462.69 ± 31.53 | 547.43 ± 41.30 | 184.16 ± 15.02 | 2.512× | 2.973× | faster / faster |
| serial | interpreter | short-utf16-forward | 1,318.39 ± 30.54 | 1,457.24 ± 101.61 | 194.10 ± 13.67 | 6.792× | 7.507× | faster / faster |
| serial | interpreter | threshold-latin-above | 2,517.41 ± 268.53 | 2,846.25 ± 273.29 | 428.95 ± 15.85 | 5.869× | 6.635× | faster / faster |
| serial | interpreter | threshold-latin-at | 2,542.82 ± 311.25 | 2,889.53 ± 378.56 | 422.79 ± 5.97 | 6.014× | 6.834× | faster / faster |
| serial | interpreter | threshold-latin-below | 2,526.91 ± 132.52 | 2,883.76 ± 285.42 | 2,868.39 ± 233.79 | 0.881× (slower) | 1.005× | overlap / overlap |
| serial | interpreter | threshold-utf16-above | 4,960.25 ± 332.58 | 5,229.04 ± 264.95 | 505.03 ± 26.09 | 9.822× | 10.354× | faster / faster |
| serial | interpreter | threshold-utf16-at | 4,941.84 ± 424.79 | 5,159.29 ± 247.65 | 505.10 ± 20.04 | 9.784× | 10.214× | faster / faster |
| serial | interpreter | threshold-utf16-below | 4,822.97 ± 251.26 | 5,175.17 ± 419.21 | 5,340.66 ± 221.44 | 0.903× (slower) | 0.969× (slower) | slower / overlap |
| serial | interpreter | tiny-utf16-forward | 292.25 ± 24.43 | 311.93 ± 4.08 | 155.12 ± 7.13 | 1.884× | 2.011× | faster / faster |
