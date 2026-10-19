# Repeated paired complete-image comparisons

2 rows have a paired-ratio, control-median or pooled-mean loss against at least one control.

All values are ns/op. Control columns show medians of round medians.
Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.
Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.
Loss marks distinguish paired-ratio medians below one, higher enabled control medians, and higher enabled pooled means. These summaries can disagree.

| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Loss: paired ratio; control median; pooled mean |
|---|---|---:|---:|---:|---:|---:|---|
| avx2/c2 | final-avx2-reverse-char-utf16-129-end | 3.259 | 3.350 | 3.527 | 0.9730 [0.9500, 1.0270] | 1.0903 [1.0529, 1.1462] | original; original; original |
| avx2/c2 | final-avx2-reverse-char-utf16-255-miss | 50.733 | 53.369 | 51.922 | 1.0374 [0.9310, 1.1511] | 0.9729 [0.9183, 1.0647] | disabled; original,disabled; disabled |
