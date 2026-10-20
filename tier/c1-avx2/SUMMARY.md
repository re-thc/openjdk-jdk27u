# c1-avx2

Each round uses the median of three JMH measurement iterations; speedup is the median of same-round baseline/candidate ratios. All rows are retained. Values below 1 mean candidate loss. Range is min..max paired speedup, not a confidence interval.

| Operation | Workload | Rounds | Base ns | Candidate ns | Off ns | Paired speedup | Paired range | Off/candidate |
|---|---|---:|---:|---:|---:|---:|---:|---:|
| isBlank | early | 5 | 10.81 | 11.65 | 11.25 | 0.908 | 0.883..0.972 | 0.983 |
| isBlank | gateAt | 5 | 268.02 | 50.40 | 259.55 | 5.483 | 4.904..5.928 | 5.184 |
| isBlank | longBlank | 5 | 4439.21 | 159.51 | 5509.87 | 27.517 | 26.342..28.522 | 32.695 |
| isBlank | longBoth | 5 | 4438.82 | 170.80 | 5215.04 | 25.989 | 25.144..27.274 | 30.411 |
| isBlank | longClean | 5 | 5.04 | 5.33 | 5.37 | 0.907 | 0.681..1.075 | 1.010 |
| isBlank | probeAfter | 5 | 34.55 | 43.05 | 34.63 | 0.803 | 0.336..0.888 | 0.804 |
| isBlank | probeAt | 5 | 34.33 | 42.54 | 34.14 | 0.767 | 0.746..0.887 | 0.827 |
| isBlank | shortBlank | 5 | 19.60 | 21.15 | 20.85 | 0.911 | 0.844..0.975 | 0.993 |
| isBlank | shortClean | 5 | 5.12 | 5.20 | 5.06 | 1.020 | 0.721..1.122 | 0.970 |
| isBlank | tailProbeAfter | 5 | 5.15 | 5.50 | 5.20 | 0.949 | 0.903..1.022 | 0.974 |
| isBlank | tailProbeAt | 5 | 5.08 | 5.23 | 5.16 | 0.970 | 0.932..1.167 | 0.996 |
| linesCount | dense | 5 | 16273.36 | 16038.44 | 16217.10 | 1.022 | 0.943..1.104 | 1.019 |
| linesCount | gateAt | 5 | 285.92 | 94.76 | 268.09 | 3.054 | 2.804..3.175 | 2.746 |
| linesCount | immediate | 5 | 3808.41 | 854.97 | 3706.73 | 4.583 | 4.032..4.689 | 4.428 |
| linesCount | lines128 | 5 | 29971.28 | 14859.61 | 30351.43 | 2.031 | 1.965..2.130 | 2.009 |
| linesCount | lines16 | 5 | 7446.87 | 7416.64 | 7463.99 | 1.020 | 0.970..1.052 | 1.006 |
| linesCount | lines80 | 5 | 20438.65 | 14148.88 | 20763.87 | 1.447 | 1.407..1.533 | 1.468 |
| linesCount | longLines | 5 | 17065.82 | 3548.17 | 17091.90 | 4.648 | 3.862..5.310 | 4.805 |
| linesCount | noMatch | 5 | 3565.83 | 619.83 | 3536.91 | 5.753 | 5.373..6.545 | 5.706 |
| linesCount | probeAfter | 5 | 4012.13 | 900.36 | 3984.98 | 4.473 | 3.776..4.970 | 4.255 |
| linesCount | probeAt | 5 | 3902.49 | 926.84 | 3868.72 | 4.211 | 3.843..4.810 | 4.323 |
| linesCount | short | 5 | 91.25 | 89.07 | 91.76 | 1.011 | 0.965..1.056 | 1.028 |
| linesFirst | dense | 5 | 70.51 | 72.27 | 72.68 | 0.981 | 0.931..1.087 | 0.988 |
| linesFirst | gateAt | 5 | 297.64 | 112.25 | 289.42 | 2.518 | 2.459..2.783 | 2.545 |
| linesFirst | immediate | 5 | 63.79 | 63.49 | 62.42 | 0.986 | 0.927..1.106 | 0.980 |
| linesFirst | lines128 | 5 | 172.37 | 112.40 | 172.60 | 1.534 | 1.438..1.680 | 1.590 |
| linesFirst | lines16 | 5 | 83.70 | 82.29 | 84.37 | 1.013 | 0.964..1.145 | 1.013 |
| linesFirst | lines80 | 5 | 134.42 | 107.45 | 135.11 | 1.250 | 1.219..1.413 | 1.301 |
| linesFirst | longLines | 5 | 3995.55 | 897.98 | 3838.08 | 4.421 | 4.227..4.955 | 4.313 |
| linesFirst | noMatch | 5 | 3480.20 | 612.00 | 3501.56 | 5.687 | 5.416..5.952 | 5.748 |
| linesFirst | probeAfter | 5 | 97.46 | 102.54 | 98.57 | 0.932 | 0.783..1.008 | 0.966 |
| linesFirst | probeAt | 5 | 96.96 | 104.29 | 97.09 | 0.926 | 0.858..1.152 | 0.922 |
| linesFirst | short | 5 | 77.00 | 75.59 | 74.69 | 1.062 | 0.939..1.112 | 0.994 |
| strip | early | 5 | 3806.85 | 187.60 | 4117.55 | 20.046 | 17.333..22.348 | 21.847 |
| strip | gateAt | 5 | 263.65 | 50.22 | 268.51 | 5.169 | 5.149..5.989 | 5.264 |
| strip | longBlank | 5 | 4590.82 | 162.43 | 5133.92 | 28.479 | 27.489..30.780 | 30.840 |
| strip | longBoth | 5 | 9547.37 | 344.16 | 10467.01 | 28.253 | 27.037..33.127 | 30.722 |
| strip | longClean | 5 | 10.24 | 10.11 | 10.10 | 1.013 | 0.944..1.325 | 0.999 |
| strip | probeAfter | 5 | 748.43 | 754.65 | 776.83 | 0.985 | 0.951..1.014 | 1.030 |
| strip | probeAt | 5 | 760.88 | 775.20 | 768.74 | 0.994 | 0.917..1.112 | 0.988 |
| strip | shortBlank | 5 | 21.89 | 25.95 | 24.12 | 0.844 | 0.775..1.007 | 0.983 |
| strip | shortClean | 5 | 10.22 | 10.29 | 10.48 | 1.002 | 0.972..1.040 | 0.991 |
| strip | tailProbeAfter | 5 | 737.68 | 728.73 | 786.56 | 0.987 | 0.979..1.369 | 1.056 |
| strip | tailProbeAt | 5 | 745.54 | 727.59 | 820.09 | 1.025 | 1.014..1.279 | 1.129 |
| stripLeading | early | 5 | 717.20 | 692.19 | 718.21 | 1.102 | 0.914..1.199 | 1.074 |
| stripLeading | gateAt | 5 | 264.41 | 51.23 | 261.14 | 5.162 | 3.707..6.116 | 5.098 |
| stripLeading | longBlank | 5 | 4495.31 | 169.01 | 5266.58 | 25.798 | 23.340..28.274 | 30.962 |
| stripLeading | longBoth | 5 | 5127.69 | 873.49 | 5686.49 | 5.845 | 5.222..8.553 | 6.510 |
| stripLeading | longClean | 5 | 5.75 | 5.58 | 5.64 | 1.034 | 0.974..1.307 | 1.017 |
| stripLeading | probeAfter | 5 | 770.47 | 712.03 | 772.84 | 1.052 | 0.924..1.342 | 1.031 |
| stripLeading | probeAt | 5 | 765.83 | 710.74 | 756.25 | 1.076 | 0.956..1.111 | 1.058 |
| stripLeading | shortBlank | 5 | 20.45 | 21.57 | 22.17 | 0.956 | 0.900..1.285 | 1.034 |
| stripLeading | shortClean | 5 | 5.68 | 5.53 | 5.64 | 1.026 | 0.949..1.273 | 1.026 |
| stripLeading | tailProbeAfter | 5 | 6.11 | 5.68 | 5.69 | 1.048 | 1.009..1.226 | 1.022 |
| stripLeading | tailProbeAt | 5 | 5.83 | 5.45 | 6.00 | 1.024 | 0.941..1.153 | 1.065 |
| stripTrailing | early | 5 | 3547.28 | 170.34 | 3950.95 | 21.001 | 20.418..26.123 | 23.057 |
| stripTrailing | gateAt | 5 | 273.28 | 56.34 | 281.65 | 4.864 | 4.396..6.086 | 5.063 |
| stripTrailing | longBlank | 5 | 5150.66 | 182.07 | 5481.57 | 28.078 | 26.524..37.708 | 31.010 |
| stripTrailing | longBoth | 5 | 5753.84 | 881.84 | 6096.68 | 6.544 | 6.303..7.423 | 6.960 |
| stripTrailing | longClean | 5 | 5.78 | 6.04 | 6.03 | 0.960 | 0.837..1.158 | 1.004 |
| stripTrailing | probeAfter | 5 | 5.77 | 6.53 | 6.00 | 0.895 | 0.861..1.426 | 0.986 |
| stripTrailing | probeAt | 5 | 5.68 | 6.08 | 5.98 | 0.932 | 0.877..1.043 | 0.991 |
| stripTrailing | shortBlank | 5 | 22.80 | 25.94 | 25.29 | 0.884 | 0.744..1.069 | 0.940 |
| stripTrailing | shortClean | 5 | 5.77 | 6.73 | 6.22 | 0.874 | 0.787..1.167 | 0.909 |
| stripTrailing | tailProbeAfter | 5 | 730.37 | 793.80 | 735.11 | 0.942 | 0.833..1.537 | 0.934 |
| stripTrailing | tailProbeAt | 5 | 713.39 | 787.85 | 733.38 | 0.913 | 0.830..1.361 | 0.949 |
| trim | early | 5 | 3047.54 | 181.28 | 3190.06 | 17.178 | 16.526..19.963 | 18.205 |
| trim | gateAt | 5 | 224.14 | 44.44 | 179.29 | 4.904 | 4.898..5.268 | 4.132 |
| trim | longBlank | 5 | 2765.96 | 148.80 | 2428.04 | 19.168 | 16.968..19.460 | 16.582 |
| trim | longBoth | 5 | 6176.09 | 311.13 | 5510.95 | 20.049 | 16.576..20.824 | 17.602 |
| trim | longClean | 5 | 6.37 | 5.57 | 5.40 | 1.162 | 1.047..1.218 | 0.966 |
| trim | probeAfter | 5 | 735.64 | 766.50 | 788.36 | 1.048 | 0.753..1.110 | 1.023 |
| trim | probeAt | 5 | 796.01 | 787.69 | 771.48 | 1.016 | 0.846..1.047 | 0.991 |
| trim | shortBlank | 5 | 15.75 | 17.55 | 18.12 | 0.891 | 0.817..0.897 | 1.012 |
| trim | shortClean | 5 | 6.18 | 5.27 | 5.38 | 1.138 | 1.048..1.241 | 1.029 |
| trim | tailProbeAfter | 5 | 764.81 | 738.82 | 743.03 | 1.025 | 0.953..1.115 | 0.987 |
| trim | tailProbeAt | 5 | 739.32 | 762.50 | 772.04 | 0.984 | 0.909..1.236 | 0.997 |

## Every measured paired loss

- isBlank/probeAt: 0.767x, paired candidate delta +9.93 ns/op.
- isBlank/probeAfter: 0.803x, paired candidate delta +8.49 ns/op.
- strip/shortBlank: 0.844x, paired candidate delta +4.05 ns/op.
- stripTrailing/shortClean: 0.874x, paired candidate delta +0.85 ns/op.
- stripTrailing/shortBlank: 0.884x, paired candidate delta +3.01 ns/op.
- trim/shortBlank: 0.891x, paired candidate delta +1.86 ns/op.
- stripTrailing/probeAfter: 0.895x, paired candidate delta +0.68 ns/op.
- isBlank/longClean: 0.907x, paired candidate delta +0.50 ns/op.
- isBlank/early: 0.908x, paired candidate delta +1.07 ns/op.
- isBlank/shortBlank: 0.911x, paired candidate delta +1.85 ns/op.
- stripTrailing/tailProbeAt: 0.913x, paired candidate delta +68.79 ns/op.
- linesFirst/probeAt: 0.926x, paired candidate delta +7.76 ns/op.
- linesFirst/probeAfter: 0.932x, paired candidate delta +7.45 ns/op.
- stripTrailing/probeAt: 0.932x, paired candidate delta +0.41 ns/op.
- stripTrailing/tailProbeAfter: 0.942x, paired candidate delta +47.65 ns/op.
- isBlank/tailProbeAfter: 0.949x, paired candidate delta +0.28 ns/op.
- stripLeading/shortBlank: 0.956x, paired candidate delta +0.93 ns/op.
- stripTrailing/longClean: 0.960x, paired candidate delta +0.24 ns/op.
- isBlank/tailProbeAt: 0.970x, paired candidate delta +0.16 ns/op.
- linesFirst/dense: 0.981x, paired candidate delta +1.33 ns/op.
- trim/tailProbeAt: 0.984x, paired candidate delta +12.13 ns/op.
- strip/probeAfter: 0.985x, paired candidate delta +11.31 ns/op.
- linesFirst/immediate: 0.986x, paired candidate delta +0.86 ns/op.
- strip/tailProbeAfter: 0.987x, paired candidate delta +9.68 ns/op.
- strip/probeAt: 0.994x, paired candidate delta +4.64 ns/op.
