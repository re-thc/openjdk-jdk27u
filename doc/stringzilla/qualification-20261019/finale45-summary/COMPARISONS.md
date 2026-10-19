# Repeated paired complete-image comparisons

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.
Loss marks distinguish paired-ratio medians below one, higher enabled control medians, and higher enabled pooled means. These summaries can disagree.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Loss: paired ratio; control median; pooled mean |
|---|---|---:|---:|---:|---:|---:|---|
| avx2/c2 | final-avx2-reverse-char-utf16-129-end | 3.259 | 3.350 | 3.527 | 0.9730 [0.9500, 1.0270] | 1.0903 [1.0529, 1.1462] | original; original; original |
| avx2/c2 | final-avx2-reverse-char-utf16-255-miss | 50.733 | 53.369 | 51.922 | 1.0374 [0.9310, 1.1511] | 0.9729 [0.9183, 1.0647] | disabled; original,disabled; disabled |
| avx2/c2 | final-avx2-reverse-char-utf16-256-miss | 50.107 | 40.860 | 50.624 | 1.2440 [1.2263, 1.2817] | 1.2390 [1.2098, 1.3303] | -; -; - |
| avx2/c2 | final-avx2-reverse-char-utf16-257-miss | 47.519 | 39.028 | 49.086 | 1.2845 [1.2172, 1.4987] | 1.2919 [1.2287, 1.3268] | -; -; - |
| serial/c1 | bulk-utf16 | 5147.854 | 255.392 | 4940.339 | 20.1567 [19.3749, 23.7193] | 19.3442 [18.5266, 19.5049] | -; -; - |
| serial/c1 | threshold-utf16-127 | 159.446 | 89.959 | 154.048 | 1.9587 [1.6012, 2.0224] | 1.7968 [1.5470, 1.9061] | -; -; - |
| serial/c2 | final-latin-word-prefix-end-32 | 17.600 | 8.643 | 17.413 | 2.2738 [2.0364, 2.4159] | 2.0147 [2.0103, 2.2811] | -; -; - |
| serial/c2 | immediate-utf16 | 5.629 | 3.174 | 5.675 | 1.7295 [1.6590, 1.7908] | 1.7451 [1.6785, 1.8055] | -; -; - |
| serial/c2 | latin-vm-end-9 | 8.805 | 6.969 | 8.724 | 1.2690 [1.2253, 1.3026] | 1.2626 [1.1498, 1.3986] | -; -; - |
| serial/c2 | mixed-miss-64 | 674.395 | 371.525 | 708.270 | 1.8511 [1.7729, 1.9345] | 1.9372 [1.8647, 1.9423] | -; -; - |
| serial/c2 | overlap-min-utf16 | 105.384 | 26.799 | 87.657 | 4.0767 [3.8382, 4.1750] | 3.3909 [3.2159, 3.4120] | -; -; - |
| serial/interpreter | bulk-latin1 | 40169.935 | 2281.364 | 38833.437 | 17.6079 [15.5117, 18.9940] | 17.0220 [16.4731, 17.3619] | -; -; - |
| serial/interpreter | equal-latin1-4096 | 48382.956 | 224.704 | 62384.396 | 221.6509 [205.5737, 228.2953] | 281.9837 [272.1250, 294.3612] | -; -; - |
