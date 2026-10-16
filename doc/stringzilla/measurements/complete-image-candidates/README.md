# Complete-image qualification candidates

These superseded source snapshots retain every collected measurement and loss.
They use complete original/enabled/disabled distributions, with image fingerprints,
source revisions, compiler commands and full JMH samples in each JSON file.
Partial qualification datasets are not presented as complete workload matrices.
The [current report](../../BENCHMARKS.md) uses the final measured source and images.

| Dataset | Production source | Measurements | Complete triplets | Higher enabled means | Higher non-overlapping intervals |
| --- | --- | ---: | ---: | ---: | ---: |
| [a760-original-pilot.json](a760-original-pilot.json) | `a7607aa978d` | 54 | 18 | 9 | 1 |
| [25ed-interpreter-fixes.json](25ed-interpreter-fixes.json) | `4c50f0253a8` | 90 | 30 | 6 | 2 |
| [f2af-mixed-profile.json](f2af-mixed-profile.json) | `f2af143b49f` | 9 | 3 | 6 | 6 |
| [b50-c2-mixed.json](b50-c2-mixed.json) | `b50c796aa9c` | 9 | 3 | 0 | 0 |
| [b50-mixed-supplement.json](b50-mixed-supplement.json) | `b50c796aa9c` | 45 | 15 | 10 | 1 |
| [63b-c2-mixed.json](63b-c2-mixed.json) | `63b546d4c7b` | 9 | 3 | 0 | 0 |
| [63b-mixed-supplement.json](63b-mixed-supplement.json) | `63b546d4c7b` | 135 | 45 | 45 | 8 |
| [ad6-c1-inline.json](ad6-c1-inline.json) | `ad6e4585173` | 135 | 45 | 28 | 1 |
| [678-c1-probe-bypass.json](678-c1-probe-bypass.json) | `678160997c4` | 9 | 3 | 4 | 1 |
| [e6a-c1-reverse-probe.json](e6a-c1-reverse-probe.json) | `e6a48be3076` | 9 | 3 | 5 | 1 |
| [2b-c1-native-setup.json](2b-c1-native-setup.json) | `2b12046b12a` | 135 | 45 | 29 | 4 |
| [91f-c1-early-scalar.json](91f-c1-early-scalar.json) | `91f0bb49c11` | 18 | 6 | 6 | 3 |
| [b989-mixed-supplement.json](b989-mixed-supplement.json) | `b989cd8a8c3` | 135 | 45 | 29 | 9 |
| [b989-native-batch.json](b989-native-batch.json) | `b989cd8a8c3` | 27 | 9 | 0 | 0 |
| [abdd-small-dispatch.json](abdd-small-dispatch.json) | `abdd0828676` | 27 | 9 | 5 | 3 |
| [723-single-candidate.json](723-single-candidate.json) | `723ed0ca2fa` | 27 | 9 | 3 | 1 |
| [463-prefix-search.json](463-prefix-search.json) | `4635082ddeb` | 135 | 45 | 19 | 4 |
| [920-equality-fallback-supplement.json](920-equality-fallback-supplement.json) | `920f3ee7c88` | 135 | 45 | 16 | 1 |
| [920-mixed-64-pilot.json](920-mixed-64-pilot.json) | `920f3ee7c88` | 12 | 4 | 4 | 2 |
| [717-priority-controls.json](717-priority-controls.json) | `717b8b0defa` | 90 | 30 | 1 | 0 |
| [717-mixed-fallback.json](717-mixed-fallback.json) | `717b8b0defa` | 135 | 45 | 17 | 0 |
| [717-mixed-prefix.json](717-mixed-prefix.json) | `717b8b0defa` | 135 | 45 | 22 | 6 |
| [717-native-batch.json](717-native-batch.json) | `717b8b0defa` | 27 | 9 | 0 | 0 |

`4c50f0253a8` is the actual build checkout of the 25ed dataset. Its production tree
is identical to published `25ed31bfa6b` (`7018529f2f355f6376ef44d5c1ef90dc38909883`);
only commit author metadata changed. The archived provenance records both revisions.

Higher means with overlapping intervals remain recorded. Interval comparisons are
descriptive, without a multiple-testing correction; overlap does not establish equivalence.
