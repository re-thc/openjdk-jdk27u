# Combined PR4 and PR63 assessment

Candidate `b19af25c4ccac240e017ca15bfbfc955d4798aa4` contains PR63's complete history and the measured dispatch corrections. The exact-head local release build and 130 String/intrinsic descriptions complete with 125 passes, five platform skips and no failures/errors. Native qualification and performance comparisons are in progress; earlier source results are retained under their actual identities. PR4 remains draft while these checks run.

The independent original is `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`. Local comparisons additionally use the complete PR63 image at `3c06040bad5a43930dbbcbd463156e885473badf`. Native Windows/ARM comparisons reuse the verified prior PR4 image at `7048d6f2c74e25737850789812da063900ec18c0`; this prior image does not contain PR63. The fourth control disables StringZilla in the candidate image. Disabling the candidate does not replace the independent original.

The bounded plan covers 46 Linux and 39 cases on each native platform, including material losses, winning and boundary controls. Each case has four balanced rotating rounds; each control uses an ordinary, isolated JMH fork with three 300 ms warmups and five 300 ms samples. All samples, losses, same-round median ratios and their minimum/maximum ranges will be retained. The ranges are observed spread, not confidence intervals. No noise gate discards losses.

Complete images, compiler/boot/configuration identities and native backend selections are verified. Forced interpreter/C1/C2 results are separate. Normal JVM startup, compilation and source-indexing comparisons use ordinary blocking whole-process timing in eight balanced rounds, with default tiering and CDS. These selected workloads do not establish a universal application benefit.

The earlier [PR63 report](prior-pr63-report.md), [7048 assessment](../qualification-20261019/RESULTS.md) and their raw evidence retain their original measurement identities. The previous ordinary CI completed all eight builds and 48 groups in attempt three at merge `7223ef030b1de2e72bbf7eb7db81e48e2f79c965`; it does not qualify this changed source.
