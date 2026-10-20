# Fresh-process first-call measurements

Nine alternating baseline/candidate/off repeats. Input creation and operation dispatch precede the timer; result consumption follows it. Operation and full process medians are retained separately. These are first-call measurements with ordinary OS caches, not isolated initialization or cold-disk startup. Ratios are median same-round baseline/candidate ratios; ranges are minima and maxima, not confidence intervals.

| Operation | Input | Base call us | Candidate call us | Off call us | Paired speedup | Paired range | Base process ms | Candidate process ms | Off process ms |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|
| trim | empty | 2.85 | 2.70 | 2.73 | 1.055 | 0.676..2.718 | 35.08 | 34.86 | 34.35 |
| trim | long | 77.47 | 46.33 | 142.27 | 1.686 | 1.335..9.149 | 32.12 | 33.43 | 36.79 |
| strip | empty | 4.15 | 3.99 | 4.07 | 1.060 | 0.644..1.349 | 36.84 | 32.65 | 32.76 |
| strip | long | 340.74 | 53.76 | 394.17 | 6.628 | 3.607..25.029 | 39.05 | 36.63 | 35.48 |
| stripLeading | empty | 2.80 | 3.08 | 2.98 | 0.954 | 0.670..1.055 | 35.20 | 34.64 | 34.58 |
| stripLeading | long | 396.78 | 54.09 | 327.84 | 6.275 | 3.086..9.829 | 33.49 | 33.18 | 33.26 |
| stripTrailing | empty | 3.27 | 3.74 | 3.38 | 0.843 | 0.772..1.168 | 33.70 | 33.42 | 32.78 |
| stripTrailing | long | 298.49 | 56.67 | 369.17 | 5.673 | 0.993..42.433 | 35.20 | 37.02 | 33.31 |
| isBlank | empty | 3.44 | 3.81 | 3.86 | 0.869 | 0.719..1.196 | 34.00 | 32.61 | 31.76 |
| isBlank | long | 278.54 | 54.13 | 381.33 | 5.146 | 2.721..6.847 | 33.71 | 34.51 | 35.08 |
| linesCount | empty | 483.58 | 454.68 | 473.90 | 1.017 | 0.660..1.807 | 34.24 | 33.29 | 33.48 |
| linesCount | long | 1376.37 | 637.70 | 1724.33 | 2.242 | 1.270..4.710 | 43.09 | 42.51 | 45.28 |
| linesFirst | empty | 3907.37 | 4037.49 | 5258.91 | 1.031 | 0.444..1.587 | 38.63 | 38.47 | 38.86 |
| linesFirst | long | 2774.02 | 2105.79 | 2804.36 | 1.465 | 1.025..2.442 | 43.82 | 46.32 | 45.89 |
