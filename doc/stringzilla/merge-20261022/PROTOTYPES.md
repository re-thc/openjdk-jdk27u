# Retained prototype comparisons

These are diagnostics on actual2883 plus explicit patches, not qualification of final2538/cd785. Five balanced rounds use two 200 ms warmups and three 200 ms samples, with five complete-image controls. Times are medians of round medians in ns/op; ratios are medians of paired round ratios with observed min/max, not confidence intervals. Every row and loss remains shown; no noise gate is applied. Exact commands, raw means/errors, samples, patches, source snapshots and image seals are in the two diagnostic archives.

## L: direct Java-only scan loops

| Case | Original | Master | Prior | Candidate | Disabled | P/C [range] | O/C [range] | Paired loss controls |
|---|---:|---:|---:|---:|---:|---|---|---|
| follow-c2-avx0-isBlank-longBlank | 1578.381 | 1628.865 | 1889.755 | 1584.948 | 1659.040 | 1.1829 [0.9984, 1.4097] | 0.9959 [0.8962, 1.4279] | original |
| c2-isBlank-longBlank | 1554.788 | 1565.498 | 142.288 | 138.481 | 1540.157 | 1.0357 [0.6778, 2.7893] | 10.7452 [7.4060, 15.3602] | - |
| c2-isBlank-prefix40 | 10.831 | 10.734 | 17.770 | 18.405 | 10.716 | 0.9424 [0.9176, 1.0196] | 0.5893 [0.5581, 0.6142] | original, master, prior, disabled |
| l-c2-avx0-isBlank-prefix40 | 10.615 | 10.991 | 10.508 | 10.883 | 10.751 | 0.9590 [0.8521, 1.1603] | 0.9976 [0.9355, 1.1378] | original, master, prior |
| l-c2-avx0-strip-longBoth | 3684.041 | 3576.375 | 3589.788 | 3428.857 | 3528.253 | 0.9523 [0.8987, 1.0746] | 0.9989 [0.9393, 1.1938] | original, master, prior |
| l-c1-avx0-isBlank-longBlank | 4503.643 | 4394.047 | 4652.286 | 4430.485 | 4450.114 | 1.0537 [1.0422, 1.0543] | 1.0165 [0.9911, 1.0530] | master |
| l-c2-avx2-strip-longBoth | 3770.754 | 3473.684 | 312.733 | 311.032 | 3570.233 | 0.9827 [0.9230, 1.0920] | 11.9612 [10.2422, 12.4911] | prior |
| l-c1-avx2-isBlank-longBlank | 4459.937 | 4564.830 | 157.594 | 163.990 | 4438.775 | 0.9981 [0.9537, 1.0145] | 28.1424 [26.5124, 30.1657] | prior |
| l-c2-isBlank-shortPad | 2.733 | 2.667 | 2.725 | 2.709 | 2.745 | 1.0264 [0.9607, 1.0962] | 0.9999 [0.9636, 1.0877] | original, master |

## M on L: existing tier-query owner

| Case | Original | Master | Prior | Candidate | Disabled | P/C [range] | O/C [range] | Paired loss controls |
|---|---:|---:|---:|---:|---:|---|---|---|
| m-c1-avx0-utf16-127-miss | 154.438 | 153.132 | 82.702 | 83.653 | 78.800 | 0.9886 [0.9424, 1.2832] | 1.9022 [1.6900, 1.9516] | prior, disabled |
| m-c1-avx2-utf16-127-miss | 153.290 | 150.294 | 83.916 | 80.445 | 85.949 | 1.0512 [1.0021, 1.0874] | 1.9208 [1.8516, 2.0428] | - |
| m-c1-avx3-utf16-127-miss | 153.906 | 158.352 | 116.121 | 117.145 | 81.074 | 1.0304 [0.9229, 1.0529] | 1.3463 [1.2663, 1.4917] | disabled |
| c1-avx2-utf16-32-4-END | 9.923 | 9.769 | 8.466 | 8.173 | 8.049 | 1.0060 [0.9188, 1.0683] | 1.1854 [1.0881, 1.2150] | disabled |
| follow-c1-avx2-lastIndexOf-UTF16-128-4-END | 9.832 | 9.988 | 9.471 | 9.401 | 8.499 | 1.0074 [0.9738, 1.0627] | 1.0421 [0.9863, 1.1384] | disabled |
| follow-c1-avx2-utf16-uniform-129 | 103.086 | 104.820 | 17.104 | 16.960 | 101.668 | 1.0142 [0.8202, 1.0493] | 5.9859 [5.1772, 6.2263] | - |
| follow-c1-avx2-minimum-overlap | 636.026 | 626.064 | 25.333 | 25.257 | 621.496 | 0.9760 [0.9569, 1.1033] | 24.8135 [23.0218, 26.0299] | prior |
| c2-avx0-lastIndexOf-UTF16-4096-9-END | 7.094 | 6.826 | 8.065 | 8.173 | 7.785 | 1.0031 [0.7813, 1.0917] | 0.8680 [0.6822, 0.9361] | original, master, disabled |
| follow-c2-avx0-isBlank-longBlank | 1550.946 | 1705.631 | 1696.164 | 1653.353 | 1576.937 | 1.0259 [1.0089, 1.0363] | 0.9882 [0.8993, 1.0864] | original, disabled |
| c2-isBlank-prefix40 | 10.757 | 10.899 | 18.201 | 18.180 | 10.881 | 0.9861 [0.7649, 1.1057] | 0.5784 [0.4740, 0.6273] | original, master, prior, disabled |
| c2-linesFirst-probeAt | 31.150 | 31.055 | 37.151 | 37.630 | 32.686 | 0.9992 [0.9598, 1.0670] | 0.8378 [0.7617, 0.9709] | original, master, prior, disabled |
| m-c1-avx3-uniform-129 | 110.984 | 107.274 | 18.337 | 17.732 | 101.708 | 1.0433 [0.9914, 1.1123] | 6.1617 [5.8234, 6.3269] | - |
