# Final-source ABC periodic controls

Source: `4592230b14fc2f4b537b162fd7f6b791e882b615`. Complete original/enabled/disabled images; JMH 2 forks, 3 × 500 ms warmup, 5 × 500 ms measurement; errors are reported 99.9% Student-t intervals. Strict augmented collector passed 24 triplets / 72 records from four completed backend jobs. AVX-512 has no timed results in the initial unsupported-host attempt and is excluded pending verified qualification.

Latin: H4095/N513, repeating ABC with D at N−3. UTF-16: H2047/N257, repeating 0401/0402/0403 with 0404 at N−3. These differ from the primary AAB/C fixtures.

| Backend | Tier | Coder | Original ns/op | Enabled ns/op | Disabled ns/op | E higher O | E higher D | E intervals overlap O/D |
|---|---|---|---:|---:|---:|---|---|---|
| neon | interpreter | Latin-1 | 94373.755 ± 10210.525 | 41723.789 ± 21940.489 | 90720.921 ± 7282.798 | false | false | false/false |
| neon | c1 | Latin-1 | 5999.456 ± 12.737 | 27437.239 ± 65.212 | 6006.214 ± 34.792 | true | true | false/false |
| neon | c2 | Latin-1 | 4648.366 ± 11.856 | 41059.614 ± 21818.843 | 4521.879 ± 7.355 | true | true | false/false |
| neon | interpreter | UTF-16 | 195269.808 ± 8826.969 | 18501.180 ± 31.924 | 203612.788 ± 10949.629 | false | false | false/false |
| neon | c1 | UTF-16 | 2458.538 ± 6.327 | 17891.754 ± 27.383 | 2499.415 ± 4.898 | true | true | false/false |
| neon | c2 | UTF-16 | 2316.312 ± 936.961 | 17907.231 ± 41.441 | 1445.263 ± 2.042 | true | true | false/false |
| msvc | interpreter | Latin-1 | 102350.300 ± 11461.680 | 1034.150 ± 55.514 | 109379.505 ± 14809.492 | false | false | false/false |
| msvc | c1 | Latin-1 | 5330.495 ± 352.051 | 713.597 ± 34.557 | 5017.170 ± 162.193 | false | false | false/false |
| msvc | c2 | Latin-1 | 3663.908 ± 129.190 | 715.750 ± 27.485 | 3745.870 ± 137.860 | false | false | false/false |
| msvc | interpreter | UTF-16 | 204745.983 ± 17514.512 | 13499.499 ± 560.500 | 217859.760 ± 16718.699 | false | false | false/false |
| msvc | c1 | UTF-16 | 2362.494 ± 83.364 | 13034.877 ± 531.214 | 2171.433 ± 96.102 | true | true | false/false |
| msvc | c2 | UTF-16 | 1607.551 ± 76.231 | 13048.050 ± 402.435 | 1356.599 ± 48.431 | true | true | false/false |
| avx2 | interpreter | Latin-1 | 146924.444 ± 10301.369 | 844.521 ± 23.034 | 148623.721 ± 4537.319 | false | false | false/false |
| avx2 | c1 | Latin-1 | 6813.439 ± 178.018 | 426.477 ± 3.217 | 6736.535 ± 19.155 | false | false | false/false |
| avx2 | c2 | Latin-1 | 4302.392 ± 298.266 | 423.925 ± 4.755 | 4131.691 ± 43.001 | false | false | false/false |
| avx2 | interpreter | UTF-16 | 275424.242 ± 18542.320 | 12086.665 ± 35.005 | 279007.768 ± 8962.046 | false | false | false/false |
| avx2 | c1 | UTF-16 | 3288.658 ± 107.849 | 11482.194 ± 43.908 | 2414.918 ± 13.227 | true | true | false/false |
| avx2 | c2 | UTF-16 | 1884.642 ± 10.326 | 11674.047 ± 87.957 | 1330.585 ± 31.663 | true | true | false/false |
| serial | interpreter | Latin-1 | 146110.698 ± 9396.332 | 1441.889 ± 33.561 | 144609.855 ± 8867.929 | false | false | false/false |
| serial | c1 | Latin-1 | 6785.054 ± 72.223 | 1003.617 ± 4.394 | 6777.625 ± 156.902 | false | false | false/false |
| serial | c2 | Latin-1 | 4486.518 ± 11.364 | 999.117 ± 1.466 | 4487.967 ± 16.125 | false | false | false/false |
| serial | interpreter | UTF-16 | 263725.830 ± 30518.280 | 7795.860 ± 28.431 | 282523.461 ± 12181.730 | false | false | false/false |
| serial | c1 | UTF-16 | 3240.050 ± 32.375 | 7244.793 ± 208.264 | 2411.489 ± 50.501 | true | true | false/false |
| serial | c2 | UTF-16 | 2087.472 ± 265.959 | 7012.553 ± 29.877 | 1692.700 ± 18.132 | true | true | false/false |

Ten combinations have higher enabled means with nonoverlapping intervals versus both controls: NEON Latin-1 C1/C2 and UTF-16 C1/C2 on all four measured backends. All interpreter cases win. Every higher mean remains visible.

This table reports the frozen source; candidate native filters have not been measured by this campaign.
