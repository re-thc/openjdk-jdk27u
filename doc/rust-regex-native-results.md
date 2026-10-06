# Native primary regex measurements

Measured on Linux x86_64, Intel Xeon Platinum 8573C, using implementation `f5b7c7ca1ef4504eb2fb73ef09b337e57a30cf48` (JDK 27.0.2 internal) on 2026-10-06. The final native-primary backend includes graph-free short plans. Java baseline is the same built JDK with `-XX:-UseRustRegex`. Values below are means of three alternating enabled/disabled process pairs. A speedup below 1 is a loss. Raw results retain per-iteration statistics; the summary includes the range of process means.

Commands: [exact invocations](rust-regex-native-benchmark-commands.txt). Data: [raw JMH results](rust-regex-native-benchmark-results.jsonl), [all paired summaries](rust-regex-native-benchmark-summary.json).

One pinned CPU (four for contention), ActiveProcessorCount=1, SerialGC, one compiler thread, two 200 ms warmups and three 200 ms measurements. JMH runs without child forks because of the host process quota; each enabled/disabled pair uses separate JVMs. These are exploratory microbenchmarks on one host. AArch64 emulation establishes functionality, not performance.

## What these measurements establish

Reused 4,096-character misses improve about 90x in the interpreter, 30x in C1 and 26x in C2. Short C2 digit-tail searches and captures also improve. This is not a universal performance win: C1 immediate anchored misses add roughly 15–20 ns, long C2 anchored digit runs are about 1.4x slower, and cold native compilation can outweigh all savings in a short lifetime. Cold four-worker workloads also lose in these samples.

The labels C1/C2 identify VM/compiler configurations. They do not prove that every cold helper has reached that compilation level. Short warmups, invocation-level GC and asynchronous cleanup produce substantial variance in some cold rows; use the recorded process ranges and raw statistics rather than infer a precise break-even call count. Further measurements on an unconstrained host with longer warmups are needed for production capacity planning.

## Reused searches

| Tier | Characters | Case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C1 | 4096 | captures | 136.5 | 72.4 | 1.88x |
| C1 | 4096 | hit | 103.4 | 72.2 | 1.43x |
| C1 | 4096 | lateHit | 9644.2 | 354.8 | 27.18x |
| C1 | 4096 | miss | 7099.8 | 235.7 | 30.12x |
| C1 | 64 | captures | 133.1 | 80.5 | 1.65x |
| C1 | 64 | hit | 100.6 | 73.3 | 1.37x |
| C1 | 64 | lateHit | 188.6 | 124.1 | 1.52x |
| C1 | 64 | miss | 108.3 | 115.8 | 0.94x |
| C2 | 4096 | captures | 54.7 | 36.0 | 1.52x |
| C2 | 4096 | hit | 41.0 | 39.9 | 1.03x |
| C2 | 4096 | lateHit | 5435.1 | 281.1 | 19.34x |
| C2 | 4096 | miss | 5326.8 | 207.9 | 25.62x |
| C2 | 64 | captures | 55.2 | 35.4 | 1.56x |
| C2 | 64 | hit | 51.3 | 38.3 | 1.34x |
| C2 | 64 | lateHit | 108.7 | 45.8 | 2.37x |
| C2 | 64 | miss | 67.3 | 37.9 | 1.77x |
| C2-JNI | 4096 | captures | 62.0 | 37.3 | 1.66x |
| C2-JNI | 4096 | hit | 55.9 | 47.4 | 1.18x |
| C2-JNI | 4096 | lateHit | 6532.6 | 328.6 | 19.88x |
| C2-JNI | 4096 | miss | 6654.7 | 232.2 | 28.66x |
| C2-JNI | 64 | captures | 57.1 | 36.7 | 1.55x |
| C2-JNI | 64 | hit | 57.9 | 40.7 | 1.42x |
| C2-JNI | 64 | lateHit | 113.2 | 48.0 | 2.36x |
| C2-JNI | 64 | miss | 70.0 | 39.3 | 1.78x |
| interpreter | 4096 | captures | 2754.0 | 1555.2 | 1.77x |
| interpreter | 4096 | hit | 2314.5 | 1471.7 | 1.57x |
| interpreter | 4096 | lateHit | 134531.9 | 1724.0 | 78.03x |
| interpreter | 4096 | miss | 141846.9 | 1577.4 | 89.93x |
| interpreter | 64 | captures | 2798.6 | 1706.8 | 1.64x |
| interpreter | 64 | hit | 2352.7 | 1644.8 | 1.43x |
| interpreter | 64 | lateHit | 4282.0 | 3617.6 | 1.18x |
| interpreter | 64 | miss | 2663.0 | 2622.5 | 1.02x |

## Fallback and flag controls

Literal, lookaround and non-Latin-1 inputs use Java. The ASCII case-insensitive flag case uses the general Rust engine; it does not select the digit-tail specialization.

| Tier | Characters | Case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C1 | 4096 | flags | 55463.3 | 661.1 | 83.89x |
| C1 | 4096 | literal | 5025.2 | 4548.7 | 1.10x |
| C1 | 4096 | unsupported | 51783.2 | 54012.2 | 0.96x |
| C1 | 4096 | utf16 | 7565.3 | 6856.8 | 1.10x |
| C1 | 64 | flags | 755.7 | 118.3 | 6.39x |
| C1 | 64 | literal | 82.5 | 86.2 | 0.96x |
| C1 | 64 | unsupported | 853.0 | 768.5 | 1.11x |
| C1 | 64 | utf16 | 176.5 | 133.9 | 1.32x |
| C2 | 4096 | flags | 11257.6 | 633.3 | 17.77x |
| C2 | 4096 | literal | 3191.5 | 3217.9 | 0.99x |
| C2 | 4096 | unsupported | 26147.1 | 27817.9 | 0.94x |
| C2 | 4096 | utf16 | 5080.7 | 5128.3 | 0.99x |
| C2 | 64 | flags | 197.3 | 101.9 | 1.94x |
| C2 | 64 | literal | 51.6 | 53.5 | 0.96x |
| C2 | 64 | unsupported | 429.2 | 418.6 | 1.03x |
| C2 | 64 | utf16 | 77.9 | 95.1 | 0.82x |
| interpreter | 4096 | flags | 1561636.5 | 1814.3 | 860.75x |
| interpreter | 4096 | literal | 83200.1 | 92084.5 | 0.90x |
| interpreter | 4096 | unsupported | 1061389.4 | 1124250.6 | 0.94x |
| interpreter | 4096 | utf16 | 199810.7 | 220306.3 | 0.91x |
| interpreter | 64 | flags | 22692.7 | 1205.8 | 18.82x |
| interpreter | 64 | literal | 2035.5 | 2348.2 | 0.87x |
| interpreter | 64 | unsupported | 19355.6 | 27984.6 | 0.69x |
| interpreter | 64 | utf16 | 3570.7 | 3870.1 | 0.92x |

## Anchored operations

| Tier | Characters | Operation/case | Java ns/op | Default ns/op | Speedup |
| --- | ---: | --- | ---: | ---: | ---: |
| C1 | 4096 | lookingAt/fullHit | 27056.9 | 11961.4 | 2.26x |
| C1 | 4096 | lookingAt/miss | 56.4 | 71.7 | 0.79x |
| C1 | 4096 | matches/fullHit | 27252.5 | 11889.3 | 2.29x |
| C1 | 4096 | matches/miss | 50.6 | 66.1 | 0.77x |
| C1 | 64 | lookingAt/fullHit | 467.6 | 133.0 | 3.52x |
| C1 | 64 | lookingAt/miss | 56.2 | 71.3 | 0.79x |
| C1 | 64 | matches/fullHit | 472.7 | 129.1 | 3.66x |
| C1 | 64 | matches/miss | 53.0 | 72.8 | 0.73x |
| C2 | 4096 | lookingAt/fullHit | 9782.3 | 13893.5 | 0.70x |
| C2 | 4096 | lookingAt/miss | 44.3 | 51.1 | 0.87x |
| C2 | 4096 | matches/fullHit | 10237.8 | 14228.6 | 0.72x |
| C2 | 4096 | matches/miss | 53.1 | 39.9 | 1.33x |
| C2 | 64 | lookingAt/fullHit | 238.5 | 81.5 | 2.92x |
| C2 | 64 | lookingAt/miss | 45.3 | 37.6 | 1.21x |
| C2 | 64 | matches/fullHit | 207.5 | 67.3 | 3.08x |
| C2 | 64 | matches/miss | 28.9 | 40.3 | 0.72x |

## Complete matching workloads per Pattern

Every row includes Pattern.compile, Matcher creation and every search. Shared retains a live owner of the same expression. Cold collects the previous owner of the same expression. Distinct adds a unique optional marker suffix; that expression requires the general compiler and can have a separate full-match engine. Cold/distinct collect before each invocation outside the timed operation, and backend checks run before and after matching. GC runs before the timed invocation. Cleaner completion is not synchronized or timed separately, and asynchronous cleanup can overlap measurement. These are compilation-and-matching workloads rather than total GC/destruction costs.

| Tier | Expression/reuse | Calls/workers | Mix | Java us/workload | Default us/workload | Speedup |
| --- | --- | ---: | --- | ---: | ---: | ---: |
| C1 | error/cold | 32/4 | alternating | 312.02 | 362.85 | 0.86x |
| C1 | error/cold | 32/4 | miss | 376.38 | 410.38 | 0.92x |
| C1 | error/shared | 32/4 | alternating | 211.01 | 100.07 | 2.11x |
| C1 | error/shared | 32/4 | miss | 157.29 | 125.48 | 1.25x |
| C1 | error/cold | 9/4 | alternating | 267.64 | 392.86 | 0.68x |
| C1 | error/cold | 9/4 | miss | 279.52 | 496.44 | 0.56x |
| C1 | error/shared | 9/4 | alternating | 128.14 | 48.63 | 2.64x |
| C1 | error/shared | 9/4 | miss | 198.37 | 49.94 | 3.97x |
| C1 | error/cold | 1/1 | alternating | 55.91 | 117.72 | 0.47x |
| C1 | error/cold | 1/1 | lastHit | 47.94 | 47.99 | 1.00x |
| C1 | error/cold | 1/1 | miss | 82.22 | 135.06 | 0.61x |
| C1 | error/shared | 1/1 | alternating | 8.81 | 0.58 | 15.29x |
| C1 | error/shared | 1/1 | lastHit | 0.76 | 0.37 | 2.05x |
| C1 | error/shared | 1/1 | miss | 8.45 | 0.55 | 15.28x |
| C1 | error/cold | 10/1 | alternating | 108.36 | 133.07 | 0.81x |
| C1 | error/cold | 10/1 | lastHit | 117.72 | 133.63 | 0.88x |
| C1 | error/cold | 10/1 | miss | 115.43 | 134.76 | 0.86x |
| C1 | error/shared | 10/1 | alternating | 36.22 | 2.66 | 13.64x |
| C1 | error/shared | 10/1 | lastHit | 65.64 | 3.27 | 20.08x |
| C1 | error/shared | 10/1 | miss | 70.66 | 2.97 | 23.78x |
| C1 | error/cold | 16/1 | alternating | 106.79 | 122.10 | 0.87x |
| C1 | error/cold | 16/1 | lastHit | 154.48 | 125.47 | 1.23x |
| C1 | error/cold | 16/1 | miss | 161.58 | 119.94 | 1.35x |
| C1 | error/shared | 16/1 | alternating | 57.76 | 3.31 | 17.45x |
| C1 | error/shared | 16/1 | lastHit | 110.28 | 4.53 | 24.36x |
| C1 | error/shared | 16/1 | miss | 113.78 | 4.57 | 24.88x |
| C1 | error/cold | 32/1 | alternating | 166.00 | 129.45 | 1.28x |
| C1 | error/cold | 32/1 | lastHit | 327.09 | 139.51 | 2.34x |
| C1 | error/cold | 32/1 | miss | 302.98 | 136.30 | 2.22x |
| C1 | error/shared | 32/1 | alternating | 124.31 | 6.30 | 19.72x |
| C1 | error/shared | 32/1 | lastHit | 294.43 | 8.56 | 34.38x |
| C1 | error/shared | 32/1 | miss | 310.63 | 9.03 | 34.40x |
| C1 | error/cold | 8/1 | alternating | 78.67 | 118.19 | 0.67x |
| C1 | error/cold | 8/1 | lastHit | 104.38 | 123.37 | 0.85x |
| C1 | error/cold | 8/1 | miss | 109.56 | 119.27 | 0.92x |
| C1 | error/shared | 8/1 | alternating | 30.65 | 1.81 | 16.95x |
| C1 | error/shared | 8/1 | lastHit | 54.21 | 2.23 | 24.26x |
| C1 | error/shared | 8/1 | miss | 57.38 | 2.50 | 22.99x |
| C1 | error/cold | 9/1 | alternating | 84.41 | 125.01 | 0.68x |
| C1 | error/cold | 9/1 | lastHit | 108.93 | 126.89 | 0.86x |
| C1 | error/cold | 9/1 | miss | 122.05 | 123.55 | 0.99x |
| C1 | error/shared | 9/1 | alternating | 37.17 | 2.10 | 17.74x |
| C1 | error/shared | 9/1 | lastHit | 58.04 | 2.48 | 23.36x |
| C1 | error/shared | 9/1 | miss | 66.85 | 2.81 | 23.83x |
| C2 | error/cold | 32/4 | alternating | 201.58 | 363.02 | 0.56x |
| C2 | error/cold | 32/4 | miss | 263.22 | 453.36 | 0.58x |
| C2 | error/shared | 32/4 | alternating | 147.41 | 54.70 | 2.69x |
| C2 | error/shared | 32/4 | miss | 142.37 | 65.60 | 2.17x |
| C2 | error/cold | 9/4 | alternating | 176.58 | 311.23 | 0.57x |
| C2 | error/cold | 9/4 | miss | 205.27 | 536.77 | 0.38x |
| C2 | error/shared | 9/4 | alternating | 101.02 | 41.97 | 2.41x |
| C2 | error/shared | 9/4 | miss | 111.36 | 56.10 | 1.98x |
| C2 | error/distinct | 1/1 | alternating | 154.23 | 549.51 | 0.28x |
| C2 | error/distinct | 1/1 | miss | 1237.37 | 729.38 | 1.70x |
| C2 | error/distinct | 32/1 | alternating | 688.81 | 416.23 | 1.65x |
| C2 | error/distinct | 32/1 | miss | 274.70 | 286.00 | 0.96x |
| C2 | error/distinct | 9/1 | alternating | 190.74 | 337.06 | 0.57x |
| C2 | error/distinct | 9/1 | miss | 681.22 | 550.51 | 1.24x |
| C2 | error/cold | 1/1 | alternating | 26.23 | 158.40 | 0.17x |
| C2 | error/cold | 1/1 | lastHit | 25.17 | 30.39 | 0.83x |
| C2 | error/cold | 1/1 | miss | 29.65 | 672.12 | 0.04x |
| C2 | error/shared | 1/1 | alternating | 6.13 | 0.40 | 15.20x |
| C2 | error/shared | 1/1 | lastHit | 0.34 | 0.18 | 1.89x |
| C2 | error/shared | 1/1 | miss | 5.47 | 0.37 | 14.71x |
| C2 | error/cold | 10/1 | alternating | 52.35 | 95.81 | 0.55x |
| C2 | error/cold | 10/1 | lastHit | 76.27 | 98.49 | 0.77x |
| C2 | error/cold | 10/1 | miss | 77.30 | 97.15 | 0.80x |
| C2 | error/shared | 10/1 | alternating | 28.64 | 1.64 | 17.48x |
| C2 | error/shared | 10/1 | lastHit | 48.86 | 2.36 | 20.75x |
| C2 | error/shared | 10/1 | miss | 60.01 | 2.64 | 22.71x |
| C2 | error/cold | 16/1 | alternating | 76.71 | 100.07 | 0.77x |
| C2 | error/cold | 16/1 | lastHit | 140.07 | 96.18 | 1.46x |
| C2 | error/cold | 16/1 | miss | 128.78 | 98.62 | 1.31x |
| C2 | error/shared | 16/1 | alternating | 44.31 | 2.36 | 18.75x |
| C2 | error/shared | 16/1 | lastHit | 84.25 | 3.80 | 22.17x |
| C2 | error/shared | 16/1 | miss | 88.37 | 4.05 | 21.84x |
| C2 | error/cold | 32/1 | alternating | 115.65 | 108.08 | 1.07x |
| C2 | error/cold | 32/1 | lastHit | 210.05 | 110.31 | 1.90x |
| C2 | error/cold | 32/1 | miss | 301.06 | 100.81 | 2.99x |
| C2 | error/shared | 32/1 | alternating | 100.56 | 6.65 | 15.12x |
| C2 | error/shared | 32/1 | lastHit | 195.31 | 8.07 | 24.20x |
| C2 | error/shared | 32/1 | miss | 181.56 | 7.79 | 23.32x |
| C2 | error/cold | 8/1 | alternating | 46.37 | 181.53 | 0.26x |
| C2 | error/cold | 8/1 | lastHit | 113.98 | 138.16 | 0.83x |
| C2 | error/cold | 8/1 | miss | 66.66 | 139.09 | 0.48x |
| C2 | error/shared | 8/1 | alternating | 22.40 | 1.44 | 15.59x |
| C2 | error/shared | 8/1 | lastHit | 39.06 | 2.16 | 18.12x |
| C2 | error/shared | 8/1 | miss | 45.79 | 2.41 | 19.04x |
| C2 | error/cold | 9/1 | alternating | 47.19 | 98.78 | 0.48x |
| C2 | error/cold | 9/1 | lastHit | 91.06 | 99.82 | 0.91x |
| C2 | error/cold | 9/1 | miss | 83.98 | 156.37 | 0.54x |
| C2 | error/shared | 9/1 | alternating | 29.81 | 1.53 | 19.48x |
| C2 | error/shared | 9/1 | lastHit | 56.12 | 2.55 | 22.05x |
| C2 | error/shared | 9/1 | miss | 55.03 | 3.55 | 15.50x |
| C2 | ssn/cold | 1/1 | alternating | 38.61 | 423.32 | 0.09x |
| C2 | ssn/cold | 1/1 | miss | 34.76 | 934.06 | 0.04x |
| C2 | ssn/shared | 1/1 | alternating | 12.56 | 0.24 | 52.33x |
| C2 | ssn/shared | 1/1 | miss | 12.14 | 0.22 | 55.95x |
| C2 | ssn/cold | 32/1 | alternating | 340.14 | 522.12 | 0.65x |
| C2 | ssn/cold | 32/1 | miss | 642.92 | 390.26 | 1.65x |
| C2 | ssn/shared | 32/1 | alternating | 299.85 | 4.14 | 72.41x |
| C2 | ssn/shared | 32/1 | miss | 588.24 | 4.31 | 136.35x |
| C2 | ssn/cold | 9/1 | alternating | 116.44 | 389.83 | 0.30x |
| C2 | ssn/cold | 9/1 | miss | 197.49 | 474.09 | 0.42x |
| C2 | ssn/shared | 9/1 | alternating | 94.05 | 1.57 | 59.74x |
| C2 | ssn/shared | 9/1 | miss | 102.88 | 1.28 | 80.28x |

## Memory and interpretation

Short-only literal-prefix/digit-tail Patterns allocate no native engine or Cleaner and retain no Java graph. The first long/native operation pays Rust compilation immediately; there is no eighth/ninth-call threshold. General expressions compile Rust at Pattern.compile. Identical live Patterns can share an engine through the bounded cache; eviction and concurrent cold misses can create duplicates.

The 64 MiB value is a process-wide accounting ceiling, not an allocation at startup or per Pattern. It includes construction reservations, engines and search caches. Allocator metadata, fragmentation and runtime storage are outside that accounting. Once admitted, lazy caches retain a growth allowance.

| Expression | Reported engine/cache bytes | Accounted bytes incl. growth allowances |
| --- | ---: | ---: |
| error[0-9]+ | 4,867 | 90,227 |
| Named word/code captures | 6,069 | 101,299 |
| SSN | 7,211 | 127,179 |

Validation and remaining limits are recorded in [the validation transcript](rust-regex-native-validation.txt). Earlier rejection-filter reports refer to a superseded design.
