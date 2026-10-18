# MSVC supplemental measurements at 2550a210

Complete original416d7db3 and fork2550a210 images; unchanged two-fork protocol. All24triplets and every higher enabled mean retained. The primary producer is still measuring; archive metadata, downloaded ZIP, inner tar and source/profile identities are verified. Binding to the producer’s final complete-image fingerprints remains pending.

| Tier | Case | Original ns/op | Enabled ns/op | Disabled ns/op | Higher enabled mean |
| --- | --- | ---: | ---: | ---: | --- |
| interpreter | latin-prefix-miss-575-511 | 141958.779 ± 22585.499 | 24734.602 ± 2512.323 | 207852.714 ± 120149.393 | — |
| c1 | latin-prefix-miss-575-511 | 15754.970 ± 464.277 | 24201.150 ± 882.289 | 11079.102 ± 248.569 | original, disabled |
| c2 | latin-prefix-miss-575-511 | 3345.386 ± 96.961 | 24399.802 ± 790.502 | 3355.473 ± 111.405 | original, disabled |
| interpreter | utf16-prefix-miss-303-256 | 333812.014 ± 31525.381 | 40852.533 ± 3710.463 | 293391.223 ± 19091.735 | — |
| c1 | utf16-prefix-miss-303-256 | 3244.593 ± 171.346 | 35288.899 ± 1235.260 | 6172.198 ± 188.277 | original, disabled |
| c2 | utf16-prefix-miss-303-256 | 1215.801 ± 54.789 | 36011.421 ± 1223.145 | 1026.809 ± 33.752 | original, disabled |
| interpreter | utf16-uniform-end-129-129 | 7080.853 ± 660.950 | 334.351 ± 40.817 | 6144.183 ± 232.452 | — |
| c1 | utf16-uniform-end-129-129 | 66.152 ± 2.107 | 97.708 ± 5.675 | 124.912 ± 3.341 | original |
| c2 | utf16-uniform-end-129-129 | 32.926 ± 3.007 | 33.789 ± 1.113 | 24.417 ± 0.762 | original, disabled |
| interpreter | utf16-uniform-end-130-129 | 6085.674 ± 368.913 | 707.266 ± 107.140 | 6150.955 ± 478.620 | — |
| c1 | utf16-uniform-end-130-129 | 67.217 ± 2.572 | 98.641 ± 4.569 | 126.862 ± 3.355 | original |
| c2 | utf16-uniform-end-130-129 | 31.021 ± 1.155 | 33.161 ± 0.951 | 24.155 ± 0.598 | original, disabled |
| interpreter | latin-end-32 | 485.946 ± 127.675 | 230.289 ± 9.191 | 494.071 ± 44.755 | — |
| c1 | latin-end-32 | 32.269 ± 1.053 | 46.223 ± 1.595 | 25.731 ± 0.155 | original, disabled |
| c2 | latin-end-32 | 10.597 ± 0.354 | 42.792 ± 1.635 | 10.641 ± 0.400 | original, disabled |
| interpreter | latin-end-64 | 723.862 ± 46.440 | 260.000 ± 52.620 | 785.546 ± 120.838 | — |
| c1 | latin-end-64 | 63.463 ± 2.010 | 69.482 ± 2.561 | 47.998 ± 1.659 | original, disabled |
| c2 | latin-end-64 | 15.548 ± 0.687 | 64.415 ± 2.056 | 15.439 ± 0.742 | original, disabled |
| interpreter | latin-miss-64 | 27375.007 ± 4868.484 | 536.515 ± 74.667 | 25695.311 ± 5382.966 | — |
| c1 | latin-miss-64 | 1998.725 ± 76.360 | 332.988 ± 4.035 | 1714.787 ± 61.107 | — |
| c2 | latin-miss-64 | 379.557 ± 21.656 | 329.305 ± 15.849 | 370.866 ± 18.903 | — |
| interpreter | msvc-interpreter-utf16-end-64 | 3219.228 ± 157.560 | 2601.999 ± 6986.456 | 3238.638 ± 376.306 | — |
| interpreter | msvc-interpreter-utf16-miss-64 | 112246.608 ± 29598.227 | 3295.371 ± 113.337 | 96063.598 ± 3873.624 | — |
| interpreter | mixed-interpreter-end-64 | 2138.114 ± 97.295 | 355.524 ± 16.421 | 2033.189 ± 96.078 | — |
