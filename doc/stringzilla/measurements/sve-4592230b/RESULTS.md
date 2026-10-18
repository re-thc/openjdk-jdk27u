# ARM SVE native component measurements

These measurements compare the production NEON native adapter with an experimental SVE adapter on identical buffers. They exclude the JVM, Java dispatch, JNI transitions and original-Java controls; they are not end-to-end JMH results.

Source: `4592230b14fc2f4b537b162fd7f6b791e882b615`; auxiliary harness: `bd553ab8f164de1345965d170d568eeb2d5aeaa1`. [Completed workflow](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39121741001), job `117658554966`.

The native ARM64 host ran on CPU 0 with 128-bit SVE vectors. GCC was Ubuntu `16-20260322-1ubuntu1` (`16.0.1 20260322`), matching the earlier benchmark compiler package. Compilation used `-O3 -march=armv8.2-a -fno-lto`; SVE functions used individual `target("+sve")` attributes. At this vector width the experimental adapter retained the exact NEON forward-search and equality function pointers.

All 76 fixtures passed independent scalar comparisons and a separate ASan/UBSan/alignment run. Two fixtures exceeded the production byte/work bounds, returned fallback and were excluded from timing. Each of the 74 eligible fixtures has 15 samples per backend after 3 warmups; sample order alternates between NEON and SVE. The same iteration count and buffers serve both backends. Values below are mean ns/call ± SEM, not JMH confidence intervals.

Among 70 comparisons with different adapter functions, SVE had 33 lower means and 37 higher means. The four identical-function controls remain visible. Narrow repeated-suffix Latin-1 searches improved substantially; bulk misses, many UTF-16 cases and long valid near-end matches favor NEON. These results do not justify replacing the NEON backend globally. Wider SVE vector lengths were not tested.

[Raw samples and receipts](raw.json), [results](results.json), [provenance](provenance.json), and the [complete job log](job.log) are preserved here. Artifact `12135970725` retains binaries, assembly, every raw sample, all 152 input byte files, compiler logs and provenance; ZIP digest `sha256:6ebf93ada8c518e6d566629c3deabc9dd2e283000e961c60ec508862da211195`. Padded native allocations do not replace the JVM physical-bound regression tests.

| Case | NEON ns/call ± SEM | SVE ns/call ± SEM | NEON/SVE | Higher SVE mean | Identical function control |
| --- | ---: | ---: | ---: | --- | --- |
| latin-short-31-miss | 24.461 ± 0.077 | 7.751 ± 0.008 | 3.156 | - | - |
| latin-short-32-miss | 25.327 ± 0.008 | 7.629 ± 0.008 | 3.320 | - | - |
| latin-threshold-255-miss | 40.621 ± 0.011 | 35.397 ± 0.004 | 1.148 | - | - |
| latin-threshold-256-miss | 41.622 ± 0.014 | 35.437 ± 0.022 | 1.175 | - | - |
| latin-threshold-257-miss | 43.201 ± 0.016 | 36.169 ± 0.009 | 1.194 | - | - |
| latin-bulk-miss | 326.824 ± 0.069 | 516.668 ± 0.033 | 0.633 | yes | - |
| latin-immediate | 9.497 ± 0.001 | 7.671 ± 0.004 | 1.238 | - | - |
| latin-64-immediate | 74.883 ± 0.027 | 73.941 ± 0.022 | 1.013 | - | - |
| latin-64-near-end-miss | 440.060 ± 0.875 | 564.762 ± 0.048 | 0.779 | yes | - |
| latin-single-end-257 | 12.955 ± 0.003 | 11.905 ± 0.004 | 1.088 | - | - |
| latin-single-miss-257 | 12.960 ± 0.004 | 11.893 ± 0.002 | 1.090 | - | - |
| latin-overlap-258 | 928.374 ± 0.860 | 69.080 ± 0.068 | 13.439 | - | - |
| latin-overlap-288 | 855.436 ± 0.760 | 70.459 ± 0.025 | 12.141 | - | - |
| latin-overlap-289 | 491.341 ± 0.222 | 71.975 ± 0.034 | 6.827 | - | - |
| latin-overlap-290 | 932.710 ± 0.562 | 71.641 ± 0.031 | 13.019 | - | - |
| latin-overlap-bulk | 1154.474 ± 3.362 | 579.906 ± 1.867 | 1.991 | - | - |
| latin-period2 | 797.806 ± 0.243 | 470.721 ± 0.135 | 1.695 | - | - |
| latin-period3 | 26608.001 ± 19.399 | 32690.220 ± 33.844 | 0.814 | yes | - |
| latin-prefix-miss | 829.669 ± 2.630 | 307.483 ± 0.048 | 2.698 | - | - |
| utf16-short-15-miss | 33.232 ± 0.003 | 10.201 ± 0.003 | 3.258 | - | - |
| utf16-short-16-miss | 36.060 ± 0.011 | 10.090 ± 0.006 | 3.574 | - | - |
| utf16-threshold-127-miss | 48.478 ± 0.008 | 38.135 ± 0.010 | 1.271 | - | - |
| utf16-threshold-128-miss | 50.989 ± 0.009 | 37.409 ± 0.014 | 1.363 | - | - |
| utf16-threshold-129-miss | 54.168 ± 0.017 | 38.072 ± 0.014 | 1.423 | - | - |
| utf16-bulk-miss | 638.652 ± 0.372 | 1029.682 ± 0.228 | 0.620 | yes | - |
| utf16-512-9-miss | 126.116 ± 0.044 | 138.182 ± 0.030 | 0.913 | yes | - |
| utf16-513-9-miss | 109.595 ± 0.036 | 138.056 ± 0.011 | 0.794 | yes | - |
| utf16-512-9-end | 12.719 ± 0.002 | 12.508 ± 0.002 | 1.017 | - | - |
| utf16-512-9-near-end | 131.516 ± 0.028 | 139.161 ± 0.044 | 0.945 | yes | - |
| utf16-immediate | 13.548 ± 0.005 | 11.293 ± 0.007 | 1.200 | - | - |
| utf16-64-immediate | 20.388 ± 0.014 | 19.528 ± 0.005 | 1.044 | - | - |
| utf16-64-near-end-miss | 146.974 ± 0.045 | 126.901 ± 0.047 | 1.158 | - | - |
| utf16-overlap-130 | 180.837 ± 0.072 | 185.353 ± 0.061 | 0.976 | yes | - |
| utf16-overlap-144 | 182.696 ± 0.075 | 185.868 ± 0.102 | 0.983 | yes | - |
| utf16-overlap-145 | 181.204 ± 0.049 | 185.281 ± 0.058 | 0.978 | yes | - |
| utf16-overlap-146 | 181.478 ± 0.044 | 186.196 ± 0.068 | 0.975 | yes | - |
| utf16-overlap-bulk | 483.467 ± 0.317 | 554.339 ± 0.065 | 0.872 | yes | - |
| utf16-period2 | 471.770 ± 0.154 | 539.754 ± 0.505 | 0.874 | yes | - |
| utf16-period3 | 17693.109 ± 5.557 | 18447.701 ± 7.109 | 0.959 | yes | - |
| utf16-prefix-miss | 184.431 ± 0.084 | 181.184 ± 0.572 | 1.018 | - | - |
| utf16-uniform-129 | 12.956 ± 0.003 | 11.793 ± 0.004 | 1.099 | - | - |
| utf16-uniform-130 | 14.289 ± 0.008 | 15.049 ± 0.009 | 0.950 | yes | - |
| utf16-crossed-64 | 163.752 ± 0.067 | 173.106 ± 0.057 | 0.946 | yes | - |
| utf16-crossed-129 | 579.774 ± 0.484 | 689.083 ± 1.712 | 0.841 | yes | - |
| char-latin-short | 5.951 ± 0.002 | 2.949 ± 0.001 | 2.018 | - | - |
| char-latin-255 | 14.417 ± 0.004 | 15.836 ± 0.002 | 0.910 | yes | - |
| char-latin-256 | 10.605 ± 0.004 | 15.966 ± 0.003 | 0.664 | yes | - |
| char-latin-bulk | 152.522 ± 0.039 | 239.087 ± 0.191 | 0.638 | yes | - |
| char-latin-immediate | 2.358 ± 0.000 | 2.370 ± 0.001 | 0.995 | yes | - |
| char-utf16-127 | 35.245 ± 0.011 | 34.579 ± 0.005 | 1.019 | - | - |
| char-utf16-128 | 30.147 ± 0.015 | 35.318 ± 0.010 | 0.854 | yes | - |
| char-utf16-129 | 24.948 ± 0.008 | 36.845 ± 0.020 | 0.677 | yes | - |
| char-utf16-255 | 54.082 ± 0.018 | 66.664 ± 0.010 | 0.811 | yes | - |
| char-utf16-256 | 48.605 ± 0.023 | 68.082 ± 0.005 | 0.714 | yes | - |
| char-utf16-257 | 43.051 ± 0.006 | 68.950 ± 0.009 | 0.624 | yes | - |
| char-utf16-bulk | 618.676 ± 0.315 | 1048.260 ± 0.145 | 0.590 | yes | - |
| char-utf16-immediate | 6.746 ± 0.001 | 7.257 ± 0.003 | 0.930 | yes | - |
| char-utf16-supplementary | 8.494 ± 0.002 | 8.199 ± 0.001 | 1.036 | - | - |
| latin-4-last-minus1-match | 9.468 ± 0.001 | 7.708 ± 0.002 | 1.228 | - | - |
| latin-4-last-minus8-match | 9.466 ± 0.001 | 7.719 ± 0.002 | 1.226 | - | - |
| utf16-9-last-minus1-match | 12.681 ± 0.003 | 12.634 ± 0.005 | 1.004 | - | - |
| utf16-9-last-minus8-match | 13.741 ± 0.001 | 13.962 ± 0.004 | 0.984 | yes | - |
| latin-257-last-minus1-match | 236.822 ± 0.652 | 263.076 ± 0.048 | 0.900 | yes | - |
| latin-257-last-minus8-match | 236.017 ± 0.521 | 262.769 ± 0.068 | 0.898 | yes | - |
| utf16-129-last-minus1-match | 183.582 ± 0.041 | 187.320 ± 0.035 | 0.980 | yes | - |
| utf16-129-last-minus8-match | 185.969 ± 0.095 | 190.211 ± 0.048 | 0.978 | yes | - |
| char-latin-last-minus1-match | 2.359 ± 0.001 | 2.374 ± 0.001 | 0.993 | yes | - |
| char-latin-last-minus8-match | 2.358 ± 0.000 | 2.373 ± 0.001 | 0.994 | yes | - |
| char-utf16-last-minus1-match | 6.714 ± 0.001 | 7.453 ± 0.002 | 0.901 | yes | - |
| char-utf16-last-minus8-match | 7.619 ± 0.001 | 8.711 ± 0.001 | 0.875 | yes | - |
| forward-latin-control | 304.456 ± 0.046 | 304.437 ± 0.061 | 1.000 | - | yes |
| forward-utf16-control | 598.610 ± 0.102 | 598.694 ± 0.104 | 1.000 | yes | yes |
| equality-latin-control | 154.045 ± 0.020 | 154.041 ± 0.036 | 1.000 | - | yes |
| equality-utf16-control | 313.064 ± 0.079 | 313.108 ± 0.037 | 1.000 | yes | yes |
