# StringZilla comparison index

PR4 integrates StringZilla 5.3.0 and PR63's Latin-1 scans.
[The PR](https://github.com/re-thc/openjdk-jdk27u/pull/4) states the retained
implementation, measured gains, remaining costs and current validation status.

The final complete-image comparisons and their original raw files are retained
in Actions:

- [Windows and AArch64 comparisons](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39798393906)
- [Linux serial, AVX2 and AVX-512 comparisons](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39798410962)
- [Independent final SDK payload verification](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39806466970)
- [Independent final raw-file verification](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39808185117)
- [Exact-head four-platform sanity checks](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39803028705)

Each measurement keeps its own source and complete-image identity.
The PR's final documentation cleanup does not change the measured build, source
or test trees. Actions artifacts carry their displayed expiration dates.

Earlier S comparisons are permanently retained at
[commit 5647ab3](https://github.com/re-thc/openjdk-jdk27u/commit/5647ab36d15fad53b99a0e722dce9216d3485999):
[s-neon raw files](s-neon-raw.tar.gz), [s-msvc raw files](s-msvc-raw.tar.gz),
[s-linux raw files](s-linux-raw.tar.gz), their member inventories, audit receipts
and complete loss rows. They measure merge `c17c5cb`, preceding the final MSVC
correction. They retain that identity and are not relabeled as final measurements.
