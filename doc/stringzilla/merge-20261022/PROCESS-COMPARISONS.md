# Ordinary process comparisons

Three fixed workloads per platform; four complete-image controls; one warmup round followed by eight balanced rotating rounds. Tiering, CDS and runtime flags use ordinary defaults, with recorded CPU affinity. Times include whole-process startup and completion. `Master` is stored as `prior` in these process-only raw files. Ratios above 1 favor the candidate; brackets show the observed paired min/max, not confidence intervals. Loss marks retain every paired, median or pooled-mean loss. These narrow workloads do not establish a general application gain.

| Platform/workload | Original ms | Master ms | Enabled ms | Disabled ms | O/C [range] | M/C [range] | D/C [range] | Loss marks |
|---|---:|---:|---:|---:|---|---|---|---|
| linux/startup | 33.538 | 31.356 | 30.808 | 31.743 | 1.0850 [0.9957, 1.1853] | 1.0241 [0.9686, 1.1347] | 1.0334 [1.0064, 1.2029] | - |
| linux/javac | 1504.107 | 1567.316 | 1568.907 | 1503.093 | 0.9260 [0.8189, 1.0869] | 0.9853 [0.8488, 1.1210] | 0.9891 [0.8656, 1.0468] | original:paired,median,mean; master:paired,median,mean; disabled:paired,median,mean |
| linux/source-index | 735.173 | 749.988 | 728.836 | 809.013 | 0.9953 [0.8545, 1.0872] | 0.9829 [0.9379, 1.1753] | 1.1174 [0.9596, 1.6255] | original:paired,mean; master:paired |
| neon/startup | 28.884 | 29.512 | 28.913 | 28.131 | 0.9853 [0.8885, 1.0404] | 1.0046 [0.8734, 1.0620] | 0.9681 [0.9519, 1.0037] | original:paired,median,mean; master:mean; disabled:paired,median,mean |
| neon/javac | 1428.355 | 1414.383 | 1439.375 | 1440.325 | 0.9873 [0.9749, 0.9949] | 0.9760 [0.9416, 1.0495] | 0.9941 [0.9671, 1.0165] | original:paired,median,mean; master:paired,median,mean; disabled:paired,mean |
| neon/source-index | 697.926 | 730.928 | 704.587 | 731.164 | 0.9918 [0.8485, 1.1813] | 0.9922 [0.9441, 1.2382] | 1.0800 [0.9021, 1.2727] | original:paired,median,mean; master:paired |
| msvc/startup | 38.445 | 37.846 | 38.200 | 38.080 | 1.0142 [0.9203, 1.0404] | 1.0098 [0.9413, 1.0491] | 1.0122 [0.9503, 1.0585] | original:mean; master:median,mean; disabled:median |
| msvc/javac | 1500.844 | 1522.673 | 1533.448 | 1525.601 | 0.9722 [0.8931, 0.9939] | 0.9828 [0.8837, 1.0373] | 0.9880 [0.8915, 1.1143] | original:paired,median,mean; master:paired,median,mean; disabled:paired,median,mean |
| msvc/source-index | 462.237 | 456.329 | 466.636 | 486.045 | 0.9880 [0.9612, 1.0912] | 0.9826 [0.9684, 1.0698] | 1.0394 [0.9962, 1.0840] | original:paired,median; master:paired,median,mean |
