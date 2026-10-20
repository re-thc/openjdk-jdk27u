# Selected final C2 results

Nanoseconds per complete operation. Base/final and old/final are medians of same-round ratios. Ranges are paired minima and maxima, not confidence intervals. Full summaries retain all rows and every loss.

| Operation | Input | Base ns | Final ns | Base/final | Paired range | Old/final |
|---|---|---:|---:|---:|---:|---:|
| `trim` | 4096 whitespace bytes | 1197.12 | 132.56 | 9.370x | 8.552..18.724 | 0.992x |
| `strip` | 4096 whitespace bytes on each side | 5177.27 | 296.01 | 16.820x | 16.176..19.517 | 0.973x |
| `stripLeading` | 4096 whitespace bytes | 2657.51 | 147.20 | 19.806x | 13.461..20.776 | 0.917x |
| `stripTrailing` | 4096 whitespace bytes on each side | 3105.57 | 520.80 | 5.924x | 5.867..6.111 | 0.926x |
| `isBlank` | 4096 whitespace bytes | 3275.24 | 135.24 | 24.218x | 21.324..25.479 | 1.014x |
| `lines().count()` | 4096 bytes, no CR/LF | 1785.69 | 513.47 | 3.465x | 3.362..3.589 | 0.991x |
| `lines().count()` | four 4096-byte lines | 6604.81 | 1968.03 | 3.356x | 3.332..3.442 | 0.956x |
| `lines().count()` | 256 16-byte lines | 4229.31 | 4840.03 | 0.874x | 0.798..1.170 | 0.962x |
| `lines().count()` | 256 80-byte lines | 9932.04 | 8923.38 | 1.136x | 0.940..1.151 | 0.966x |
| `lines().count()` | 256 128-byte lines | 14050.47 | 9805.61 | 1.433x | 1.279..1.496 | 0.969x |
| `stripTrailing` | empty | 1.40 | 1.53 | 0.966x | 0.755..1.113 | 2.099x |
| `stripTrailing` | 16 unchanged text bytes | 2.02 | 1.98 | 0.998x | 0.977..1.324 | 1.652x |
| `trim` | 4096 unchanged text bytes | 2.41 | 2.15 | 1.160x | 0.998..1.200 | 1.634x |
| `isBlank` | 16 whitespace bytes | 21.73 | 18.90 | 1.167x | 0.924..1.209 | 1.173x |
| `isBlank` | nonblank after seven spaces | 7.55 | 4.60 | 1.506x | 1.188..1.984 | 0.858x |
| `lines().findFirst()` | CRLF after 32 bytes | 41.60 | 54.00 | 0.783x | 0.698..0.918 | 1.007x |
| `strip` | 33 leading spaces, 4096 text bytes | 348.60 | 374.12 | 0.932x | 0.725..1.190 | 0.954x |

## Tier scope

| Configuration | Rows | Ratios below 1 | Below 0.95 | isBlank longBlank | trim longBlank | linesCount noMatch |
|---|---:|---:|---:|---:|---:|---:|
| c2 | 154 | 55 | 34 | 24.218x | 9.370x | 3.465x |
| c1 | 77 | 25 | 16 | 27.517x | 19.168x | 5.753x |
| int | 77 | 30 | 23 | 76.304x | 38.355x | 27.957x |

Counts describe tested rows, not application distributions or aggregate benefit. See each full table for absolute costs and every loss.

## Fresh-process first-call medians

| Operation | Input | Base call us | Final call us | Off call us | Paired base/final | Base process ms | Final process ms |
|---|---|---:|---:|---:|---:|---:|---:|
| trim | empty | 2.92 | 2.63 | 3.33 | 1.015x | 33.62 | 34.88 |
| trim | long | 81.44 | 50.97 | 123.22 | 1.605x | 37.50 | 37.33 |
| strip | empty | 3.92 | 4.73 | 4.25 | 0.858x | 37.36 | 34.43 |
| strip | long | 361.83 | 58.53 | 444.57 | 5.912x | 35.45 | 37.21 |
| stripLeading | empty | 2.86 | 3.21 | 3.73 | 0.827x | 36.89 | 35.74 |
| stripLeading | long | 488.93 | 57.41 | 371.75 | 6.231x | 37.90 | 35.91 |
| stripTrailing | empty | 3.73 | 3.31 | 3.48 | 1.104x | 39.00 | 39.64 |
| stripTrailing | long | 317.48 | 58.21 | 446.08 | 5.363x | 35.04 | 36.50 |
| isBlank | empty | 3.71 | 4.01 | 4.10 | 0.886x | 36.21 | 36.21 |
| isBlank | long | 350.31 | 61.12 | 424.33 | 5.361x | 36.04 | 39.77 |
| linesCount | empty | 521.51 | 498.22 | 589.59 | 0.997x | 39.11 | 37.10 |
| linesCount | long | 1434.40 | 652.63 | 1795.96 | 2.261x | 48.00 | 44.61 |
| linesFirst | empty | 4505.92 | 4473.47 | 4879.43 | 1.175x | 40.06 | 39.62 |
| linesFirst | long | 2951.82 | 2176.26 | 3428.78 | 1.275x | 46.33 | 51.19 |
