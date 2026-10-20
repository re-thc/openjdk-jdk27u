# Fresh-process first-call measurements

Nine alternating baseline/candidate/off repeats. Input creation and operation dispatch precede the timer; result consumption follows it. Operation and full process medians are retained separately. These are first-call measurements with ordinary OS caches, not isolated initialization or cold-disk startup. Ratios are median same-round baseline/candidate ratios; ranges are minima and maxima, not confidence intervals.

| Operation | Input | Base call us | Candidate call us | Off call us | Paired speedup | Paired range | Base process ms | Candidate process ms | Off process ms |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|
| trim | empty | 2.92 | 2.63 | 3.33 | 1.015 | 0.867..1.291 | 33.62 | 34.88 | 38.52 |
| trim | long | 81.44 | 50.97 | 123.22 | 1.605 | 0.607..2.539 | 37.50 | 37.33 | 39.94 |
| strip | empty | 3.92 | 4.73 | 4.25 | 0.858 | 0.531..1.059 | 37.36 | 34.43 | 37.12 |
| strip | long | 361.83 | 58.53 | 444.57 | 5.912 | 1.808..19.282 | 35.45 | 37.21 | 35.88 |
| stripLeading | empty | 2.86 | 3.21 | 3.73 | 0.827 | 0.779..1.079 | 36.89 | 35.74 | 36.88 |
| stripLeading | long | 488.93 | 57.41 | 371.75 | 6.231 | 3.210..85.986 | 37.90 | 35.91 | 35.20 |
| stripTrailing | empty | 3.73 | 3.31 | 3.48 | 1.104 | 0.468..1.606 | 39.00 | 39.64 | 38.21 |
| stripTrailing | long | 317.48 | 58.21 | 446.08 | 5.363 | 4.822..30.131 | 35.04 | 36.50 | 36.55 |
| isBlank | empty | 3.71 | 4.01 | 4.10 | 0.886 | 0.674..1.174 | 36.21 | 36.21 | 36.03 |
| isBlank | long | 350.31 | 61.12 | 424.33 | 5.361 | 2.260..51.691 | 36.04 | 39.77 | 36.89 |
| linesCount | empty | 521.51 | 498.22 | 589.59 | 0.997 | 0.762..2.251 | 39.11 | 37.10 | 38.30 |
| linesCount | long | 1434.40 | 652.63 | 1795.96 | 2.261 | 1.426..2.848 | 48.00 | 44.61 | 49.65 |
| linesFirst | empty | 4505.92 | 4473.47 | 4879.43 | 1.175 | 0.586..1.895 | 40.06 | 39.62 | 42.51 |
| linesFirst | long | 2951.82 | 2176.26 | 3428.78 | 1.275 | 0.650..1.542 | 46.33 | 51.19 | 49.57 |
