Selected final C2 results (ns per complete public operation). Old/final compares the preserved pre-refinement image directly.

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
