All times are ns per complete public operation. Columns are medians of round medians; ratios are medians of same-round median ratios. Above 1 favors the candidate. Brackets are observed minimum/maximum paired ratios, not confidence intervals. No noise gate is used. Loss columns retain the union of paired-ratio, control-median and pooled-mean losses; the measures can disagree. All raw samples, JMH means/errors and commands remain in the source study.

| Backend/tier | Case | Original | Prior | Candidate | Disabled | O/C [range] | P/C [range] | D/C [range] | Loss marks |
|---|---|---:|---:|---:|---:|---|---|---|---|
| serial/c1 | c1-avx0-lastIndexOf-LATIN1-32-4-MISS | 31.794 | 32.610 | 31.480 | 32.954 | 0.9877 [0.9265, 1.0885] | 1.0213 [0.9411, 1.1804] | 1.0547 [0.9740, 1.2569] | original:paired |
| avx2/c1 | c1-avx2-lastIndexOf-LATIN1-32-4-MISS | 30.606 | 30.319 | 32.150 | 30.121 | 0.9533 [0.9161, 1.0338] | 0.9432 [0.8873, 1.0988] | 0.9369 [0.8776, 0.9968] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| serial/c1 | c1-avx0-lastIndexOf-UTF16-127-4-MISS | 156.286 | 84.966 | 87.749 | 96.603 | 1.7980 [1.4830, 1.9477] | 0.9138 [0.8422, 1.1222] | 1.1053 [0.8287, 1.3354] | prior:paired,median,mean |
| avx2/c1 | c1-avx2-lastIndexOf-UTF16-127-4-MISS | 165.284 | 80.718 | 85.466 | 87.715 | 1.9255 [1.8701, 1.9696] | 0.9719 [0.9207, 1.0314] | 1.0570 [1.0106, 1.2568] | prior:paired,median,mean |
| avx2/c1 | c1-avx2-lastIndexOf-UTF16-128-4-MISS | 162.580 | 61.467 | 64.742 | 89.495 | 2.5011 [1.9927, 2.8738] | 0.9422 [0.7830, 0.9990] | 1.4453 [1.0920, 1.4668] | prior:paired,median,mean |
| avx2/c2 | c2-avx2-lastIndexOf-MIXED-4096-17-END | 11.295 | 10.218 | 9.653 | 10.521 | 1.1569 [1.0928, 1.2428] | 1.0403 [0.9945, 1.0739] | 1.0685 [1.0194, 1.0940] | - |
| avx2/c2 | c2-avx2-lastIndexOf-MIXED-4096-31-END | 14.199 | 11.881 | 12.349 | 14.676 | 1.1609 [1.0569, 1.3359] | 0.9732 [0.9241, 0.9986] | 1.1781 [1.1164, 1.2475] | prior:paired,median,mean |
| avx512/c2 | c2-avx3-lastIndexOf-MIXED-4096-17-END | 11.025 | 9.784 | 10.010 | 10.531 | 1.0983 [1.0739, 1.1833] | 0.9873 [0.9394, 1.0107] | 1.0569 [1.0335, 1.1453] | prior:paired,median,mean |
| serial/c2 | c2-avx0-lastIndexOf-UTF16-4096-9-END | 6.774 | 7.974 | 8.263 | 7.758 | 0.8237 [0.6880, 0.8375] | 0.9730 [0.8161, 0.9927] | 0.9180 [0.7952, 0.9983] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| serial/c2 | c2-avx0-lastIndexOf-UTF16-4096-17-END | 11.599 | 14.717 | 15.155 | 10.387 | 0.7834 [0.6716, 0.8749] | 0.9748 [0.8621, 1.0461] | 0.6990 [0.6571, 0.7121] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| avx2/interpreter | interpreter-avx2-lastIndexOf-LATIN1-4096-4-END | 326.479 | 294.907 | 297.141 | 370.209 | 1.0996 [1.0811, 1.1321] | 0.9958 [0.9755, 1.0201] | 1.2472 [1.1990, 1.2956] | prior:paired,median,mean |
| avx2/c2 | c2-avx2-lastIndexOf-LATIN1-4096-4-MISS | 680.624 | 217.596 | 221.643 | 699.022 | 3.0779 [3.0249, 3.2385] | 0.9718 [0.9201, 1.0623] | 3.2007 [2.7698, 3.3926] | prior:paired,median,mean |
| avx2/c1 | c1-avx2-lastIndexOf-UTF16-4096-4-MISS | 4833.903 | 417.410 | 433.489 | 2771.231 | 11.1531 [10.8168, 11.5173] | 0.9678 [0.9277, 0.9876] | 6.2741 [5.5596, 7.6834] | prior:paired,median,mean |
| avx512/c2 | c2-avx3-lastIndexOf-LATIN1-4096-4-MISS | 700.525 | 125.973 | 129.525 | 701.846 | 5.4085 [5.1007, 6.0516] | 0.9642 [0.9420, 1.0538] | 5.4419 [5.2784, 5.7136] | prior:paired,median,mean |
| avx512/c1 | c1-avx3-lastIndexOf-LATIN1-32-4-MISS | 30.118 | 30.196 | 29.674 | 30.176 | 1.0230 [0.9929, 1.0349] | 1.0176 [0.9752, 1.0442] | 1.0228 [0.9819, 1.0363] | - |
| avx512/c1 | c1-avx3-lastIndexOf-UTF16-128-4-MISS | 152.338 | 21.274 | 21.600 | 80.985 | 7.0423 [6.7853, 7.6653] | 1.0021 [0.9581, 1.0287] | 3.8824 [3.5883, 5.1363] | prior:median,mean |
| avx512/interpreter | interpreter-avx3-lastIndexOf-UTF16-4096-4-MISS | 143646.959 | 854.530 | 784.402 | 162739.883 | 184.0714 [177.6713, 189.9837] | 1.1040 [1.0195, 1.1208] | 207.8466 [199.3163, 213.6018] | - |
| avx2/c2 | c2-avx2-equals-UTF16-4096-4-EQUAL | 110.604 | 136.941 | 136.228 | 140.947 | 0.8273 [0.7919, 0.9633] | 1.0042 [0.8291, 1.0173] | 1.0384 [0.7278, 1.0894] | original:paired,median,mean; prior:mean; disabled:mean |
| avx2/c2 | c2-trim-shortPad | 12.592 | 14.755 | 13.792 | 14.624 | 0.9289 [0.8259, 1.0906] | 1.0737 [1.0034, 1.2392] | 1.0601 [0.9806, 1.3219] | original:paired,median,mean |
| avx2/c2 | c2-strip-shortPad | 13.046 | 13.979 | 13.976 | 13.941 | 0.9490 [0.9273, 0.9643] | 1.0008 [0.9295, 1.0519] | 0.9976 [0.9867, 1.0338] | original:paired,median,mean; prior:mean; disabled:paired,median |
| avx2/c2 | c2-strip-longBoth | 3593.039 | 296.753 | 296.110 | 3441.902 | 12.1357 [11.6187, 12.6016] | 1.0174 [0.9429, 1.0407] | 11.4198 [10.4914, 12.5957] | - |
| avx2/c2 | c2-stripLeading-gateBefore | 49.919 | 51.973 | 52.382 | 52.005 | 0.9470 [0.8745, 0.9581] | 0.9908 [0.9101, 1.0044] | 0.9768 [0.9025, 1.0226] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| avx2/c2 | c2-stripTrailing-shortClean | 1.952 | 1.779 | 1.797 | 1.738 | 1.0860 [1.0713, 1.0988] | 0.9890 [0.9830, 1.0068] | 0.9757 [0.9490, 0.9880] | prior:paired,median; disabled:paired,median,mean |
| avx2/c2 | c2-isBlank-probeAt | 9.816 | 13.468 | 12.968 | 8.812 | 0.7616 [0.7286, 0.7713] | 1.0254 [1.0217, 1.0532] | 0.6679 [0.6446, 0.7032] | original:paired,median,mean; disabled:paired,median,mean |
| avx2/c2 | c2-isBlank-prefix40 | 11.457 | 18.387 | 18.631 | 10.586 | 0.6152 [0.5484, 0.6847] | 1.0155 [0.9220, 1.0733] | 0.5686 [0.5216, 0.6977] | original:paired,median,mean; prior:median; disabled:paired,median,mean |
| avx2/c2 | c2-isBlank-longBlank | 1630.278 | 139.385 | 137.019 | 1923.226 | 11.6428 [11.3991, 12.1468] | 1.0096 [1.0002, 1.0482] | 13.9577 [13.4565, 14.0540] | - |
| avx2/c2 | c2-linesFirst-probeAt | 34.768 | 37.552 | 39.455 | 34.543 | 0.8791 [0.8336, 0.8999] | 0.9753 [0.9136, 1.0204] | 0.8506 [0.8430, 0.9266] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| avx2/c2 | c2-linesFirst-prefix40 | 35.378 | 42.359 | 41.623 | 34.618 | 0.8410 [0.8091, 0.9056] | 1.0106 [0.9829, 1.0527] | 0.8160 [0.8133, 0.8680] | original:paired,median,mean; disabled:paired,median,mean |
| avx2/c2 | c2-linesCount-noMatch | 1592.366 | 523.181 | 518.489 | 1629.037 | 3.0727 [2.9052, 3.4182] | 1.0099 [0.9115, 1.0901] | 3.1462 [3.0604, 3.2296] | - |
| avx2/c2 | c2-linesCount-windowCRLF | 57076.297 | 15603.339 | 15032.747 | 56252.366 | 3.8420 [3.6561, 3.9608] | 1.0378 [0.9994, 1.0898] | 3.7767 [3.6303, 4.0804] | - |
| avx2/c1 | c1-isBlank-longBlank | 4506.833 | 161.042 | 164.355 | 4384.882 | 27.3875 [26.0843, 30.0300] | 1.0037 [0.9418, 1.0616] | 27.0636 [25.6713, 29.5603] | prior:median,mean |
| avx2/interpreter | interpreter-isBlank-longBlank | 188532.633 | 1993.714 | 2031.907 | 190994.165 | 93.5868 [91.9987, 94.1495] | 0.9891 [0.9322, 1.0226] | 95.2627 [88.1217, 98.7095] | prior:paired,median,mean |
| avx2/interpreter | interpreter-trim-longBlank | 39818.563 | 794.867 | 819.054 | 37589.559 | 48.3555 [46.6398, 50.5578] | 0.9698 [0.9266, 0.9837] | 44.8377 [42.9535, 49.0506] | prior:paired,median,mean |
| serial/c1 | follow-c1-avx0-minimum-overlap | 715.169 | 589.607 | 645.345 | 662.796 | 1.1066 [0.7980, 1.3402] | 0.9348 [0.7352, 1.0061] | 1.0283 [0.8878, 1.1794] | prior:paired,median,mean |
| avx2/c1 | follow-c1-avx2-minimum-overlap | 618.985 | 26.717 | 25.624 | 619.457 | 24.4440 [23.0729, 24.8577] | 1.0427 [0.9583, 1.1451] | 24.4633 [22.7465, 25.3823] | - |
| avx512/c1 | follow-c1-avx3-minimum-overlap | 610.355 | 23.540 | 23.712 | 617.209 | 25.7451 [25.1195, 27.8948] | 0.9879 [0.9585, 1.0320] | 26.2258 [24.4494, 27.2849] | prior:paired,median,mean |
| avx2/c1 | follow-c1-avx2-utf16-uniform-129 | 102.722 | 111.277 | 16.392 | 101.358 | 6.2023 [6.0126, 6.4271] | 6.7144 [6.5039, 6.9991] | 6.1557 [5.8573, 6.3112] | - |
| avx2/c1 | follow-c1-avx2-lastIndexOf-UTF16-128-4-END | 10.235 | 9.294 | 9.576 | 8.621 | 1.0696 [0.9725, 1.1894] | 0.9722 [0.9066, 1.0173] | 0.8781 [0.8696, 0.9591] | prior:paired,median,mean; disabled:paired,median,mean |
| avx2/c1 | follow-c1-avx2-lastIndexOf-UTF16-4-4-END | 10.186 | 8.129 | 8.137 | 8.198 | 1.2611 [1.1736, 1.3444] | 1.0168 [0.9177, 1.0892] | 1.0061 [0.9478, 1.1222] | prior:median |
| serial/c2 | follow-c2-avx0-equals-LATIN1-4096-4-EQUAL | 117.923 | 102.189 | 108.714 | 116.623 | 1.0846 [0.9326, 1.1889] | 0.9507 [0.8594, 1.1523] | 1.0565 [1.0137, 1.1370] | prior:paired,median,mean |
| avx2/c2 | follow-c2-avx2-equals-LATIN1-4096-4-EQUAL | 63.129 | 71.962 | 73.037 | 70.834 | 0.8494 [0.7225, 0.9945] | 0.9899 [0.9067, 0.9950] | 0.9852 [0.6827, 1.0144] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| serial/c1 | follow-c1-avx0-equals-LATIN1-4096-4-EQUAL | 3377.923 | 99.215 | 98.587 | 3411.109 | 33.8748 [32.9637, 37.6396] | 1.0069 [0.9964, 1.0193] | 34.7135 [32.8946, 35.9119] | - |
| avx2/c1 | follow-c1-avx2-equals-LATIN1-4096-4-EQUAL | 3337.558 | 81.701 | 82.270 | 3446.137 | 40.4227 [39.0532, 41.6909] | 1.0075 [0.9245, 1.0115] | 41.1108 [39.2804, 42.8030] | prior:median,mean |
| avx512/c1 | follow-c1-avx3-equals-LATIN1-4096-4-EQUAL | 3390.562 | 72.882 | 73.141 | 3383.086 | 46.4022 [43.4361, 48.9850] | 0.9789 [0.9647, 1.0302] | 46.2819 [43.1844, 49.5302] | prior:paired,median |
| avx2/c2 | follow-c2-avx2-lastIndexOf-MIXED-4096-16-END | 10.311 | 7.820 | 8.091 | 10.328 | 1.3248 [1.2431, 1.4418] | 0.9406 [0.9291, 1.0732] | 1.2638 [1.2370, 1.3761] | prior:paired,median,mean |
| avx512/c2 | follow-c2-avx3-lastIndexOf-MIXED-4096-16-END | 10.648 | 8.462 | 8.157 | 10.345 | 1.3141 [1.2490, 1.4811] | 1.0278 [1.0192, 1.0535] | 1.2810 [1.2237, 1.3284] | - |
| serial/c2 | follow-c2-avx0-dense-suffix-64 | 16809.493 | 15843.000 | 15755.358 | 16627.164 | 1.0693 [1.0434, 1.1218] | 1.0288 [0.9739, 1.0527] | 1.0651 [0.8636, 1.1205] | - |
| serial/c2 | follow-c2-avx0-dense-suffix-65 | 16459.596 | 15395.690 | 15393.293 | 14966.444 | 1.0692 [1.0407, 1.1396] | 1.0003 [0.9685, 1.0313] | 0.9719 [0.9083, 1.0860] | disabled:paired,median,mean |
| avx2/c2 | follow-c2-avx2-dense-suffix-65 | 13390.565 | 445.039 | 450.605 | 12859.000 | 29.4769 [26.7236, 32.7636] | 0.9921 [0.9193, 1.0074] | 28.4360 [26.7896, 30.4507] | prior:paired,median,mean |
| avx512/interpreter | follow-interpreter-avx3-lastIndexOf-UTF16-4-4-END | 673.904 | 681.813 | 693.328 | 707.431 | 0.9823 [0.9663, 1.0044] | 0.9882 [0.9525, 1.0190] | 1.0102 [1.0025, 1.0674] | original:paired,median,mean; prior:paired,median,mean |
| serial/c2 | follow-c2-avx0-isBlank-longBlank | 1543.215 | 1830.159 | 1841.628 | 1842.492 | 0.8505 [0.7529, 0.8754] | 1.0215 [0.8957, 1.0357] | 1.0418 [0.8998, 1.1046] | original:paired,median,mean; prior:median |
| serial/c1 | follow-c1-avx0-linesCount-noMatch | 3447.249 | 3673.801 | 3631.875 | 3617.555 | 0.9492 [0.9123, 1.0325] | 1.0074 [0.9382, 1.0959] | 0.9901 [0.9814, 1.0840] | original:paired,median,mean; disabled:paired,median |
| serial/interpreter | follow-interpreter-avx0-trim-longBlank | 33433.094 | 43648.594 | 46727.940 | 43863.846 | 0.6958 [0.6829, 0.8078] | 0.9611 [0.9292, 0.9889] | 0.9135 [0.8958, 1.0586] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| avx2/interpreter | interpreter-avx2-utf16-127-4-MISS | 4860.932 | 606.201 | 616.091 | 5463.762 | 7.8459 [7.7430, 8.5101] | 0.9840 [0.9539, 1.0314] | 8.9703 [8.6689, 9.0340] | prior:paired,median |
| avx2/interpreter | interpreter-avx2-utf16-127-4-END | 688.559 | 443.446 | 442.865 | 721.697 | 1.5305 [1.4604, 1.5912] | 0.9997 [0.9507, 1.0219] | 1.6164 [1.5688, 1.6754] | prior:paired,mean |
| avx2/c2 | c2-avx2-utf16-127-4-MISS | 27.484 | 10.487 | 10.258 | 27.373 | 2.6965 [2.4836, 2.8750] | 1.0315 [0.9951, 1.0925] | 2.6584 [2.2957, 3.1189] | - |
| avx2/c2 | c2-avx2-utf16-127-4-END | 4.840 | 2.868 | 2.961 | 4.960 | 1.6534 [1.5952, 1.7184] | 0.9712 [0.9181, 0.9898] | 1.6831 [1.6417, 1.7043] | prior:paired,median,mean |
| serial/c2 | c2-avx0-dense65-255 | 718.250 | 876.006 | 1124.986 | 868.831 | 0.7159 [0.4828, 0.9148] | 0.8181 [0.5440, 1.7880] | 0.8521 [0.6164, 1.0825] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| serial/c2 | c2-avx0-dense65-256 | 682.065 | 731.009 | 703.076 | 797.954 | 0.9778 [0.9027, 0.9881] | 1.0400 [0.9768, 1.0623] | 1.1095 [1.0639, 1.1639] | original:paired,median,mean |
| serial/c2 | c2-avx0-dense-63 | 16337.571 | 15579.908 | 15663.918 | 16859.376 | 1.0430 [0.8814, 1.1344] | 0.9904 [0.9774, 1.0252] | 1.0614 [0.9073, 1.1313] | prior:paired,median |
| serial/c2 | c2-avx0-dense-66 | 16532.700 | 15200.357 | 15500.195 | 16581.594 | 1.0835 [0.9739, 1.1023] | 0.9860 [0.9193, 1.0504] | 1.0339 [0.9827, 1.0751] | prior:paired,median,mean |
| avx2/c1 | selected-avx2-c1-middle-miss-130-129 | 103.166 | 105.350 | 17.183 | 106.524 | 6.0461 [5.7121, 6.2735] | 6.1206 [5.9288, 6.4121] | 6.1051 [5.8347, 6.4741] | - |
| avx2/c1 | selected-avx2-c1-left-hit-130-129 | 107.810 | 110.135 | 17.232 | 103.220 | 6.1886 [5.5940, 6.5567] | 6.3525 [5.7719, 6.4431] | 5.9241 [5.5138, 6.1121] | - |
| avx2/c1 | selected-avx2-c1-uniform-724 | 565.224 | 551.931 | 36.189 | 549.419 | 15.6696 [14.9629, 16.3161] | 15.3919 [14.8955, 16.2144] | 15.1817 [14.7465, 17.1071] | - |
| avx2/c1 | selected-avx2-c1-uniform-725 | 582.714 | 579.273 | 38.093 | 608.027 | 15.3701 [15.2365, 15.8509] | 15.4420 [14.5169, 16.1104] | 15.8120 [14.8660, 16.7754] | - |
| avx2/c1 | selected-avx2-c1-uniform-1023 | 780.254 | 772.974 | 46.755 | 771.462 | 16.6887 [16.5857, 16.8476] | 16.4257 [15.7435, 17.5207] | 16.7307 [15.3749, 16.8281] | - |
| avx2/c1 | selected-avx2-c1-uniform-1024 | 780.626 | 52.342 | 52.583 | 768.290 | 14.8557 [14.8399, 15.1759] | 0.9959 [0.9884, 1.0258] | 14.6979 [14.1862, 14.9899] | prior:paired,median,mean |
| avx2/c2 | selected-avx2-c2-prefix-dense-64 | 13284.366 | 451.562 | 438.468 | 13519.055 | 30.8410 [28.5363, 31.8538] | 1.0351 [0.9754, 1.0884] | 31.5085 [28.0125, 32.8859] | - |
| avx2/c2 | selected-avx2-c2-prefix-dense-65 | 13938.929 | 456.204 | 432.291 | 14891.463 | 31.8275 [30.2078, 34.0406] | 1.0557 [1.0220, 1.0997] | 33.4647 [33.0179, 36.1002] | - |
| serial/c1 | selected-c1-avx0-uniform-129 | 105.240 | 114.122 | 101.132 | 103.216 | 1.0407 [1.0074, 1.0664] | 1.1312 [1.0573, 1.1953] | 1.0199 [0.9792, 1.0587] | - |
| avx512/c1 | selected-c1-avx3-uniform-129 | 103.343 | 18.873 | 18.371 | 106.057 | 5.6233 [5.3521, 6.0219] | 1.0398 [0.9753, 1.1133] | 5.8427 [5.3055, 6.0060] | - |
| serial/c2 | selected-c2-avx0-prefix-dense-64 | 16751.895 | 17225.389 | 17296.642 | 16189.436 | 0.9976 [0.9317, 1.0145] | 1.0034 [0.9705, 1.0087] | 0.9748 [0.8493, 1.0303] | original:paired,median; prior:median,mean; disabled:paired,median,mean |
| serial/c2 | selected-c2-avx0-prefix-dense-65 | 15401.138 | 15843.937 | 15823.900 | 16163.995 | 0.9785 [0.8235, 1.1199] | 1.0178 [0.9579, 1.0284] | 1.0231 [0.8810, 1.1283] | original:paired,median,mean; prior:mean |
| avx2/c1 | selected-c1-head-miss-130-129 | 240.631 | 11.215 | 8.112 | 248.443 | 29.1325 [27.1056, 31.9042] | 1.3806 [1.3050, 1.4777] | 30.4530 [27.6356, 32.7321] | - |
| neon/c1 | follow-c1-avx2-utf16-uniform-129 | 135.299 | 145.354 | 21.608 | 134.935 | 6.2576 [6.2452, 6.2688] | 6.7266 [6.7036, 6.7422] | 6.2455 [6.2199, 6.2488] | - |
| neon/c2 | follow-c2-avx2-dense-suffix-64 | 16615.134 | 446.904 | 446.229 | 16676.200 | 37.2292 [37.0283, 37.4575] | 1.0015 [0.9990, 1.0043] | 37.3714 [37.3080, 37.4625] | - |
| neon/c2 | follow-c2-avx2-dense-suffix-65 | 16558.390 | 495.215 | 495.361 | 16666.746 | 33.4712 [33.3181, 33.6882] | 0.9997 [0.9968, 1.0002] | 33.6468 [33.6029, 33.7027] | prior:paired,median,mean |
| neon/c2 | final-c2-avx2-dense65-256 | 788.131 | 208.710 | 208.987 | 801.077 | 3.7713 [3.7408, 3.8075] | 0.9988 [0.9804, 1.0169] | 3.8334 [3.8014, 3.8769] | prior:paired,median,mean |
| neon/c1 | selected-c1-middle-miss-130-129 | 136.212 | 146.513 | 25.049 | 136.141 | 5.4367 [5.4318, 5.4738] | 5.8510 [5.8420, 5.8686] | 5.4338 [5.4277, 5.4649] | - |
| neon/c1 | selected-c1-left-hit-130-129 | 135.773 | 146.547 | 21.897 | 135.595 | 6.2016 [6.1910, 6.2049] | 6.6930 [6.6891, 6.6960] | 6.1915 [6.1842, 6.2117] | - |
| neon/c1 | selected-c1-uniform-724 | 737.166 | 781.864 | 65.053 | 737.044 | 11.3326 [11.2801, 11.3423] | 12.0193 [11.9596, 12.0339] | 11.3311 [11.2665, 11.3482] | - |
| neon/c1 | selected-c1-uniform-725 | 738.360 | 783.490 | 65.195 | 737.749 | 11.3253 [11.3144, 11.3508] | 12.0243 [12.0049, 12.0441] | 11.3160 [11.3085, 11.3531] | - |
| neon/c1 | selected-c1-uniform-1023 | 1037.346 | 1099.982 | 86.870 | 1036.413 | 11.9413 [11.8612, 11.9607] | 12.6662 [12.5749, 12.6765] | 11.9306 [11.8538, 11.9525] | - |
| neon/c1 | selected-c1-uniform-1024 | 1038.309 | 94.701 | 94.807 | 1037.573 | 10.9519 [10.9155, 10.9779] | 0.9972 [0.9831, 1.0040] | 10.9504 [10.9365, 10.9561] | prior:paired,median,mean |
| neon/c2 | selected-c2-prefix-dense-64 | 16788.511 | 490.711 | 490.571 | 17058.803 | 34.2182 [34.1635, 34.3249] | 1.0004 [1.0001, 1.0013] | 34.7819 [34.7217, 34.8301] | - |
| neon/c2 | selected-c2-prefix-dense-65 | 16780.765 | 491.120 | 493.186 | 17032.161 | 34.0449 [33.9536, 34.1588] | 0.9966 [0.9936, 1.0003] | 34.5432 [34.5101, 34.6781] | prior:paired,median,mean |
| neon/c1 | selected-c1-head-miss-130-129 | 264.916 | 11.560 | 8.030 | 264.604 | 32.9952 [32.7874, 33.0083] | 1.4374 [1.4347, 1.4458] | 32.9501 [32.7742, 32.9830] | - |
| neon/c1 | c1-avx2-lastIndexOf-LATIN1-32-4-MISS | 28.115 | 28.188 | 28.210 | 26.655 | 0.9958 [0.9927, 1.0013] | 1.0003 [0.9964, 1.0014] | 0.9452 [0.9423, 0.9530] | original:paired,median; prior:median; disabled:paired,median,mean |
| neon/c1 | c1-avx2-lastIndexOf-UTF16-127-4-MISS | 87.606 | 101.230 | 101.014 | 90.713 | 0.8663 [0.8620, 0.8738] | 1.0017 [1.0006, 1.0030] | 0.8980 [0.8980, 0.8990] | original:paired,median,mean; disabled:paired,median,mean |
| neon/c1 | c1-avx2-lastIndexOf-UTF16-128-4-MISS | 88.140 | 59.990 | 60.123 | 84.970 | 1.4655 [1.4414, 1.4855] | 0.9980 [0.9829, 1.0057] | 1.4120 [1.3944, 1.4234] | prior:paired,median,mean |
| neon/c2 | c2-avx2-lastIndexOf-UTF16-4096-9-END | 6.816 | 19.757 | 19.525 | 7.476 | 0.3492 [0.3417, 0.3511] | 1.0119 [0.9781, 1.0310] | 0.3828 [0.3748, 0.3860] | original:paired,median,mean; disabled:paired,median,mean |
| neon/c2 | c2-avx2-lastIndexOf-UTF16-4096-17-END | 14.587 | 20.851 | 20.877 | 10.692 | 0.6982 [0.5023, 0.7236] | 1.0012 [0.9947, 1.0022] | 0.5123 [0.5096, 0.5278] | original:paired,median,mean; prior:median,mean; disabled:paired,median,mean |
| neon/c2 | c2-avx2-lastIndexOf-MIXED-4096-17-END | 10.901 | 12.541 | 13.772 | 10.868 | 0.8708 [0.7867, 0.9930] | 0.9932 [0.8211, 0.9971] | 0.7897 [0.7817, 0.9550] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| neon/c2 | c2-avx2-lastIndexOf-MIXED-4096-31-END | 15.588 | 15.506 | 15.638 | 15.605 | 0.9962 [0.9902, 1.1600] | 0.9946 [0.9885, 0.9972] | 0.9978 [0.9907, 1.0097] | original:paired,median; prior:paired,median,mean; disabled:paired,median,mean |
| neon/interpreter | interpreter-avx2-lastIndexOf-LATIN1-4096-4-END | 351.518 | 365.602 | 360.331 | 417.106 | 0.9651 [0.9596, 1.0581] | 1.0082 [0.9916, 1.0341] | 1.1577 [1.1257, 1.2001] | original:paired,median |
| neon/c2 | c2-avx2-lastIndexOf-LATIN1-4096-4-MISS | 726.764 | 312.231 | 312.058 | 736.914 | 2.3286 [2.2865, 2.3820] | 0.9999 [0.9977, 1.0018] | 2.3592 [2.3473, 2.3948] | prior:paired |
| neon/c1 | c1-avx2-lastIndexOf-UTF16-4096-4-MISS | 2529.292 | 609.007 | 608.704 | 2430.368 | 4.1557 [4.1351, 4.1585] | 1.0003 [0.9975, 1.0047] | 3.9930 [3.9820, 3.9982] | - |
| neon/interpreter | interpreter-avx2-lastIndexOf-UTF16-4096-4-MISS | 176473.919 | 1295.047 | 1289.322 | 182124.158 | 136.8735 [133.9518, 141.6207] | 1.0066 [1.0019, 1.0091] | 141.3245 [140.8145, 142.0344] | - |
| neon/c2 | c2-avx2-equals-UTF16-4096-4-EQUAL | 511.265 | 511.134 | 511.018 | 512.197 | 1.0005 [0.9958, 1.0011] | 1.0000 [0.9948, 1.0017] | 1.0015 [1.0007, 1.0026] | original:mean; prior:mean |
| neon/c2 | c2-trim-shortPad | 10.134 | 10.266 | 10.354 | 10.466 | 0.9972 [0.9465, 1.0068] | 0.9920 [0.9756, 1.0025] | 1.0095 [0.9789, 1.0392] | original:paired,median,mean; prior:paired,median,mean |
| neon/c2 | c2-strip-shortPad | 11.196 | 11.621 | 11.604 | 11.622 | 0.9658 [0.9417, 0.9867] | 1.0025 [0.9776, 1.0058] | 1.0016 [0.9788, 1.0054] | original:paired,median,mean; prior:mean; disabled:mean |
| neon/c2 | c2-strip-longBoth | 5117.342 | 985.248 | 985.215 | 5019.626 | 5.1945 [5.0938, 5.2272] | 1.0000 [0.9996, 1.0002] | 5.0971 [5.0666, 5.1149] | prior:paired,mean |
| neon/c2 | c2-stripLeading-gateBefore | 59.202 | 59.043 | 59.039 | 59.006 | 1.0025 [1.0020, 1.0032] | 1.0001 [0.9999, 1.0003] | 0.9991 [0.9980, 1.0022] | disabled:paired,median,mean |
| neon/c2 | c2-stripTrailing-shortClean | 2.402 | 2.436 | 2.439 | 2.438 | 0.9870 [0.9671, 0.9918] | 0.9967 [0.9938, 1.0055] | 1.0014 [0.9938, 1.0032] | original:paired,median,mean; prior:paired,median,mean; disabled:median |
| neon/c2 | c2-isBlank-probeAt | 10.562 | 16.258 | 16.171 | 11.497 | 0.6531 [0.6470, 0.6685] | 1.0066 [0.9934, 1.0174] | 0.7176 [0.6745, 0.7363] | original:paired,median,mean; disabled:paired,median,mean |
| neon/c2 | c2-isBlank-prefix40 | 13.152 | 20.784 | 20.561 | 12.872 | 0.6432 [0.6327, 0.6685] | 1.0120 [1.0034, 1.0222] | 0.6288 [0.6177, 0.6410] | original:paired,median,mean; disabled:paired,median,mean |
| neon/c2 | c2-isBlank-longBlank | 2104.109 | 477.486 | 478.019 | 2469.186 | 4.4013 [4.3988, 4.4086] | 0.9992 [0.9984, 0.9998] | 5.1655 [5.1626, 5.2027] | prior:paired,median,mean |
| neon/c2 | c2-linesFirst-probeAt | 35.671 | 41.378 | 41.456 | 34.314 | 0.8608 [0.8593, 0.8634] | 0.9959 [0.8947, 1.0023] | 0.8272 [0.6651, 0.8751] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| neon/c2 | c2-linesFirst-prefix40 | 38.404 | 46.415 | 46.401 | 39.109 | 0.8272 [0.7581, 0.8304] | 1.0004 [0.9066, 1.0073] | 0.8430 [0.7544, 0.8523] | original:paired,median,mean; prior:mean; disabled:paired,median,mean |
| neon/c2 | c2-linesCount-noMatch | 1693.494 | 666.466 | 663.165 | 1608.717 | 2.5609 [2.4828, 2.5877] | 1.0074 [0.9889, 1.0204] | 2.4283 [2.3909, 2.4658] | - |
| neon/c2 | c2-linesCount-windowCRLF | 50255.690 | 19234.505 | 19295.805 | 50300.911 | 2.6068 [2.5978, 2.6146] | 0.9988 [0.9909, 1.0013] | 2.6077 [2.6009, 2.6162] | prior:paired,median,mean |
| neon/c1 | c1-isBlank-longBlank | 4836.554 | 505.122 | 505.289 | 5054.034 | 9.5635 [9.5547, 9.5806] | 0.9995 [0.9979, 1.0021] | 10.0031 [9.9758, 10.0291] | prior:paired,median,mean |
| neon/interpreter | interpreter-isBlank-longBlank | 210101.528 | 2671.719 | 2633.908 | 225404.676 | 79.7679 [79.3662, 83.1605] | 1.0145 [1.0112, 1.0166] | 85.4318 [84.9302, 86.7076] | - |
| neon/interpreter | interpreter-trim-longBlank | 44027.308 | 1273.497 | 1263.400 | 46022.646 | 34.7643 [34.0225, 40.4079] | 1.0074 [1.0036, 1.0089] | 36.3449 [35.9845, 37.5090] | - |
| neon/c1 | follow-c1-avx2-minimum-overlap | 642.999 | 564.924 | 565.089 | 557.239 | 1.1386 [1.1361, 1.1396] | 0.9994 [0.9950, 1.0024] | 0.9852 [0.9836, 1.0015] | prior:paired,median,mean; disabled:paired,median,mean |
| neon/c1 | follow-c1-avx2-lastIndexOf-UTF16-128-4-END | 9.908 | 9.767 | 9.893 | 9.892 | 1.0016 [0.9876, 1.0179] | 0.9907 [0.9750, 1.0066] | 1.0046 [0.9851, 1.0143] | prior:paired,median,mean; disabled:median |
| neon/c1 | follow-c1-avx2-lastIndexOf-UTF16-4-4-END | 9.912 | 9.527 | 9.490 | 9.446 | 1.0446 [1.0390, 1.0479] | 1.0029 [0.9992, 1.0057] | 0.9943 [0.9912, 0.9992] | disabled:paired,median,mean |
| neon/c2 | follow-c2-avx2-equals-LATIN1-4096-4-EQUAL | 268.978 | 269.223 | 269.261 | 269.061 | 0.9984 [0.9982, 1.0043] | 1.0007 [0.9996, 1.0024] | 1.0003 [0.9943, 1.0006] | original:paired,median,mean; prior:median; disabled:median,mean |
| neon/c1 | follow-c1-avx2-equals-LATIN1-4096-4-EQUAL | 3092.153 | 162.196 | 163.353 | 3088.194 | 18.9219 [18.2236, 18.9486] | 0.9923 [0.9898, 1.0009] | 18.9136 [18.2618, 18.9536] | prior:paired,median,mean |
| neon/c2 | follow-c2-avx2-lastIndexOf-MIXED-4096-16-END | 11.906 | 13.233 | 12.068 | 10.348 | 1.0108 [0.7854, 1.2320] | 1.0024 [0.9997, 1.2113] | 0.8682 [0.7798, 0.9511] | original:median,mean; disabled:paired,median,mean |
| neon/interpreter | follow-interpreter-avx2-lastIndexOf-UTF16-4-4-END | 819.570 | 793.902 | 803.803 | 796.739 | 1.0002 [0.9719, 1.0287] | 0.9866 [0.9300, 1.0373] | 0.9916 [0.9352, 0.9986] | prior:paired,median,mean; disabled:paired,median,mean |
| neon/interpreter | interpreter-avx2-utf16-127-4-MISS | 5872.622 | 755.031 | 757.584 | 6092.852 | 7.7518 [7.6150, 8.3710] | 0.9972 [0.9879, 0.9997] | 8.0245 [7.9887, 8.0580] | prior:paired,median,mean |
| neon/c2 | c2-avx2-utf16-127-4-MISS | 31.502 | 15.680 | 16.398 | 28.333 | 1.9244 [1.9211, 2.0891] | 0.9921 [0.9167, 1.0026] | 1.8034 [1.7234, 1.9488] | prior:paired,median,mean |
| neon/c2 | c2-avx2-utf16-127-4-END | 4.553 | 2.366 | 2.378 | 4.655 | 1.9145 [1.8848, 1.9292] | 0.9951 [0.9747, 1.0042] | 1.9577 [1.9093, 1.9745] | prior:paired,median,mean |
| msvc/c1 | follow-c1-avx2-utf16-uniform-129 | 116.028 | 36.322 | 36.340 | 115.272 | 3.1854 [3.1589, 3.2951] | 1.0001 [0.9780, 1.0821] | 3.1713 [3.1430, 3.1884] | prior:median |
| msvc/c2 | follow-c2-avx2-dense-suffix-64 | 14048.205 | 16668.752 | 16597.531 | 15336.918 | 0.8462 [0.8122, 0.8574] | 0.9990 [0.9682, 1.0483] | 0.9219 [0.8881, 0.9423] | original:paired,median,mean; prior:paired,mean; disabled:paired,median,mean |
| msvc/c2 | follow-c2-avx2-dense-suffix-65 | 14042.832 | 16583.369 | 16585.254 | 15319.385 | 0.8474 [0.8048, 0.8520] | 0.9998 [0.9518, 1.0006] | 0.9232 [0.8815, 0.9249] | original:paired,median,mean; prior:paired,median; disabled:paired,median,mean |
| msvc/c2 | final-c2-avx2-dense65-256 | 685.830 | 802.702 | 823.480 | 677.342 | 0.8292 [0.7994, 0.8817] | 0.9753 [0.9417, 1.0007] | 0.8230 [0.7927, 0.8959] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| msvc/c1 | selected-c1-middle-miss-130-129 | 113.598 | 39.555 | 39.509 | 112.012 | 2.8807 [2.8033, 2.9452] | 1.0059 [0.9987, 1.1023] | 2.8433 [2.8150, 2.8625] | - |
| msvc/c1 | selected-c1-left-hit-130-129 | 118.345 | 39.002 | 36.306 | 118.693 | 3.2572 [3.1610, 3.3975] | 1.0747 [0.9933, 1.1547] | 3.2675 [3.1851, 3.3364] | - |
| msvc/c1 | selected-c1-uniform-724 | 585.211 | 122.865 | 122.389 | 585.992 | 4.7841 [4.7621, 4.7887] | 1.0048 [0.9922, 1.0287] | 4.7833 [4.7724, 4.8120] | - |
| msvc/c1 | selected-c1-uniform-725 | 591.229 | 122.077 | 122.868 | 586.666 | 4.8176 [4.7668, 4.8815] | 0.9940 [0.9896, 0.9953] | 4.7741 [4.7577, 4.7888] | prior:paired,median,mean |
| msvc/c1 | selected-c1-uniform-1023 | 821.890 | 160.553 | 161.250 | 823.042 | 5.0965 [5.0869, 5.1080] | 0.9957 [0.9944, 1.0037] | 5.1051 [5.0938, 5.1205] | prior:paired,median,mean |
| msvc/c1 | selected-c1-uniform-1024 | 825.922 | 159.586 | 160.222 | 823.637 | 5.1575 [5.1197, 5.2897] | 0.9969 [0.9956, 0.9984] | 5.1406 [5.1273, 5.1534] | prior:paired,median |
| msvc/c2 | selected-c2-prefix-dense-64 | 15367.494 | 16568.939 | 16595.730 | 19134.791 | 0.9247 [0.9160, 0.9422] | 1.0001 [0.9971, 1.0253] | 1.1537 [1.1529, 1.2143] | original:paired,median,mean; prior:median |
| msvc/c2 | selected-c2-prefix-dense-65 | 15299.667 | 16575.175 | 16582.885 | 19106.701 | 0.9228 [0.9222, 0.9279] | 0.9995 [0.9986, 1.0028] | 1.1523 [1.1519, 1.1555] | original:paired,median,mean; prior:paired,median,mean |
| msvc/c1 | selected-c1-head-miss-130-129 | 271.795 | 29.781 | 29.809 | 273.312 | 9.1116 [8.8911, 9.1708] | 0.9982 [0.9767, 1.0036] | 9.1701 [8.9215, 9.2157] | prior:paired,median,mean |
| msvc/c1 | c1-avx2-lastIndexOf-LATIN1-32-4-MISS | 34.166 | 32.519 | 32.524 | 33.266 | 1.0509 [1.0391, 1.1024] | 1.0009 [0.9979, 1.0255] | 1.0222 [1.0125, 1.0247] | prior:median |
| msvc/c1 | c1-avx2-lastIndexOf-UTF16-127-4-MISS | 128.676 | 140.857 | 139.782 | 89.978 | 0.9223 [0.9076, 0.9705] | 1.0097 [0.9955, 1.0158] | 0.6441 [0.6351, 0.6524] | original:paired,median,mean; disabled:paired,median,mean |
| msvc/c1 | c1-avx2-lastIndexOf-UTF16-128-4-MISS | 129.741 | 92.263 | 92.906 | 92.528 | 1.3957 [1.3777, 1.4537] | 0.9944 [0.9756, 0.9994] | 1.0001 [0.9908, 1.0047] | prior:paired,median,mean; disabled:median |
| msvc/c2 | c2-avx2-lastIndexOf-UTF16-4096-9-END | 7.757 | 12.664 | 12.641 | 8.051 | 0.6141 [0.6117, 0.6326] | 1.0002 [0.9994, 1.0037] | 0.6372 [0.6327, 0.6645] | original:paired,median,mean; prior:mean; disabled:paired,median,mean |
| msvc/c2 | c2-avx2-lastIndexOf-UTF16-4096-17-END | 13.591 | 15.040 | 15.015 | 10.811 | 0.9052 [0.8991, 0.9107] | 1.0011 [0.9962, 1.0140] | 0.7183 [0.7150, 0.7277] | original:paired,median,mean; prior:mean; disabled:paired,median,mean |
| msvc/c2 | c2-avx2-lastIndexOf-MIXED-4096-17-END | 13.419 | 12.381 | 12.479 | 11.501 | 1.0769 [0.9816, 1.2116] | 0.9915 [0.9056, 1.1197] | 0.9708 [0.8411, 1.0388] | prior:paired,median; disabled:paired,median,mean |
| msvc/c2 | c2-avx2-lastIndexOf-MIXED-4096-31-END | 19.460 | 17.492 | 17.460 | 15.466 | 1.1348 [0.9749, 1.1769] | 0.9998 [0.8915, 1.7035] | 0.8860 [0.7752, 0.9297] | prior:paired; disabled:paired,median,mean |
| msvc/interpreter | interpreter-avx2-lastIndexOf-LATIN1-4096-4-END | 479.774 | 412.262 | 414.216 | 508.846 | 1.1592 [1.1329, 1.1685] | 0.9951 [0.9418, 1.0112] | 1.2285 [1.1781, 1.2775] | prior:paired,median,mean |
| msvc/c2 | c2-avx2-lastIndexOf-LATIN1-4096-4-MISS | 743.879 | 148.156 | 148.290 | 743.032 | 5.0134 [4.7879, 5.1930] | 0.9977 [0.9758, 1.0007] | 5.0107 [4.7774, 5.3959] | prior:paired,median,mean |
| msvc/c1 | c1-avx2-lastIndexOf-UTF16-4096-4-MISS | 3897.834 | 2025.487 | 2040.712 | 2610.242 | 1.9101 [1.8761, 2.0050] | 0.9925 [0.9745, 0.9977] | 1.2821 [1.2712, 1.2874] | prior:paired,median,mean |
| msvc/interpreter | interpreter-avx2-lastIndexOf-UTF16-4096-4-MISS | 259922.835 | 7498.916 | 7491.400 | 271757.815 | 34.7247 [34.4355, 35.5478] | 1.0010 [0.9972, 1.0032] | 36.2146 [35.7105, 37.2704] | - |
| msvc/c2 | c2-avx2-equals-UTF16-4096-4-EQUAL | 145.444 | 146.240 | 136.109 | 146.352 | 1.0940 [0.7975, 1.2069] | 1.1072 [0.9440, 1.2081] | 1.0703 [0.9635, 1.2870] | - |
| msvc/c2 | c2-trim-shortPad | 13.588 | 15.467 | 15.766 | 15.441 | 0.8616 [0.8323, 0.9290] | 0.9825 [0.9449, 0.9995] | 0.9796 [0.9444, 0.9991] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| msvc/c2 | c2-strip-shortPad | 14.796 | 15.550 | 15.184 | 15.281 | 0.9749 [0.9342, 0.9947] | 1.0121 [0.9979, 1.0298] | 1.0064 [0.9557, 1.0441] | original:paired,median,mean |
| msvc/c2 | c2-strip-longBoth | 3610.473 | 3964.377 | 3932.337 | 3935.249 | 0.9175 [0.8964, 0.9256] | 1.0086 [0.9988, 1.0237] | 1.0016 [0.9747, 1.0057] | original:paired,median,mean |
| msvc/c2 | c2-stripLeading-gateBefore | 54.844 | 55.900 | 54.598 | 54.698 | 1.0038 [0.9999, 1.0060] | 1.0222 [0.9995, 1.0486] | 1.0007 [0.9971, 1.0131] | original:mean; prior:mean |
| msvc/c2 | c2-stripTrailing-shortClean | 2.133 | 2.095 | 2.111 | 2.095 | 1.0101 [0.9808, 1.0211] | 0.9911 [0.9659, 1.0031] | 0.9931 [0.9622, 1.0026] | prior:paired,median; disabled:paired,median,mean |
| msvc/c2 | c2-isBlank-probeAt | 12.736 | 13.012 | 13.261 | 13.024 | 0.9605 [0.8858, 0.9895] | 0.9828 [0.9050, 1.0051] | 0.9738 [0.9070, 1.0524] | original:paired,median,mean; prior:paired,median,mean; disabled:paired,median,mean |
| msvc/c2 | c2-isBlank-prefix40 | 14.497 | 14.113 | 14.074 | 14.039 | 1.0301 [1.0156, 1.0381] | 1.0010 [0.9921, 1.0655] | 0.9993 [0.9855, 1.0074] | disabled:paired,median |
| msvc/c2 | c2-isBlank-longBlank | 1637.890 | 1956.002 | 1951.128 | 1952.952 | 0.8393 [0.8019, 0.8400] | 1.0021 [0.9559, 1.0237] | 0.9996 [0.9565, 1.0023] | original:paired,median,mean; prior:mean; disabled:paired,mean |
| msvc/c2 | c2-linesFirst-probeAt | 37.220 | 37.109 | 36.798 | 36.326 | 1.0021 [0.9959, 1.0273] | 1.0117 [0.9599, 1.0387] | 0.9870 [0.9588, 1.0442] | disabled:paired,median |
| msvc/c2 | c2-linesFirst-prefix40 | 40.005 | 42.705 | 40.812 | 40.856 | 0.9802 [0.9768, 1.0109] | 1.0467 [1.0008, 1.0609] | 1.0016 [1.0001, 1.0027] | original:paired,median,mean |
| msvc/c2 | c2-linesCount-noMatch | 1743.760 | 1735.268 | 1742.673 | 1744.150 | 1.0036 [0.9597, 1.0066] | 0.9964 [0.9612, 0.9999] | 0.9995 [0.9671, 1.0626] | original:mean; prior:paired,median,mean; disabled:paired |
| msvc/c2 | c2-linesCount-windowCRLF | 56628.152 | 56025.471 | 56025.557 | 56892.303 | 1.0120 [0.9384, 1.0592] | 1.0022 [0.9421, 1.0093] | 1.0160 [0.9418, 1.0595] | original:mean; prior:median,mean |
| msvc/c1 | c1-isBlank-longBlank | 4903.435 | 4882.254 | 4868.329 | 4874.586 | 1.0072 [0.9652, 1.0379] | 1.0023 [0.9679, 1.0445] | 1.0013 [0.9631, 1.0438] | disabled:mean |
| msvc/interpreter | interpreter-isBlank-longBlank | 297614.246 | 283011.960 | 283370.724 | 284600.585 | 1.0543 [1.0092, 1.0826] | 0.9964 [0.9806, 1.0086] | 1.0100 [0.8958, 1.0132] | prior:paired,median,mean; disabled:mean |
| msvc/interpreter | interpreter-trim-longBlank | 72733.082 | 80293.701 | 79214.643 | 80597.603 | 0.9414 [0.8551, 0.9661] | 1.0117 [0.9525, 1.0786] | 0.9906 [0.9371, 1.0418] | original:paired,median,mean; disabled:paired,mean |
| msvc/c1 | follow-c1-avx2-minimum-overlap | 669.954 | 678.972 | 671.729 | 667.716 | 0.9969 [0.9661, 0.9978] | 1.0112 [0.9674, 1.0455] | 0.9939 [0.9622, 1.0415] | original:paired,median,mean; prior:mean; disabled:paired,median,mean |
| msvc/c1 | follow-c1-avx2-lastIndexOf-UTF16-128-4-END | 10.246 | 10.755 | 10.581 | 10.627 | 0.9682 [0.9653, 1.0303] | 1.0167 [1.0157, 1.0181] | 1.0051 [1.0041, 1.0598] | original:paired,median,mean |
| msvc/c1 | follow-c1-avx2-lastIndexOf-UTF16-4-4-END | 10.221 | 9.282 | 9.278 | 9.074 | 1.1011 [1.0887, 1.1042] | 1.0009 [0.9866, 1.0046] | 0.9777 [0.9681, 0.9781] | prior:mean; disabled:paired,median,mean |
| msvc/c2 | follow-c2-avx2-equals-LATIN1-4096-4-EQUAL | 77.435 | 77.382 | 77.387 | 77.439 | 0.9992 [0.9975, 1.0046] | 0.9999 [0.8070, 1.0039] | 0.9993 [0.9979, 1.0501] | original:paired; prior:paired,median,mean; disabled:paired |
| msvc/c1 | follow-c1-avx2-equals-LATIN1-4096-4-EQUAL | 3634.523 | 280.213 | 283.887 | 3612.770 | 12.8786 [12.6339, 13.3084] | 0.9916 [0.9786, 1.0205] | 12.8705 [12.6061, 13.1832] | prior:paired,median,mean |
| msvc/c2 | follow-c2-avx2-lastIndexOf-MIXED-4096-16-END | 13.039 | 12.314 | 12.274 | 10.625 | 1.0624 [1.0560, 1.3698] | 1.0186 [0.9975, 1.1473] | 0.8657 [0.8585, 1.0382] | disabled:paired,median,mean |
| msvc/interpreter | follow-interpreter-avx2-lastIndexOf-UTF16-4-4-END | 1009.474 | 1007.599 | 1001.113 | 1015.845 | 1.0084 [0.9808, 1.0739] | 1.0065 [0.9818, 1.0225] | 1.0148 [0.9972, 1.0219] | prior:mean |
| msvc/interpreter | interpreter-avx2-utf16-127-4-MISS | 8489.355 | 1006.539 | 1048.481 | 8698.866 | 8.0967 [8.0730, 8.2278] | 0.9615 [0.9549, 0.9771] | 8.2706 [8.1189, 8.6844] | prior:paired,median,mean |
| msvc/c2 | c2-avx2-utf16-127-4-MISS | 29.777 | 11.714 | 11.731 | 30.575 | 2.5389 [2.5355, 2.6990] | 0.9990 [0.9973, 1.0130] | 2.6063 [2.6013, 2.7019] | prior:paired,median,mean |
| msvc/c2 | c2-avx2-utf16-127-4-END | 5.507 | 3.789 | 3.788 | 5.222 | 1.4538 [1.4384, 1.4857] | 1.0011 [0.9947, 1.1154] | 1.3782 [1.3677, 1.4215] | - |
