# Source 4592230b measurement evidence

Runtime: `4592230b14fc2f4b537b162fd7f6b791e882b615`.
Original: `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda`.

All 1,700 triplets are complete and strictly qualified: 1,635 main matrix,
30 exact ABC periodic fixtures and 35 single/two-candidate supplements.
[The complete table](COMPLETE-1700-RESULTS.md) retains every original/enabled/disabled
mean, JMH 99.9% error and higher enabled mean.
[The complete index](COMPLETE-1700-index.json) binds all source, image, workflow,
artifact and physical-key identities, including the missing-only AVX-512 recovery.

Every timed row compares complete images. Enabled and disabled share the same
fork image; benchmark classes are compiled by the original JDK. No patched
`java.base` classes are used. All two-fork/five-iteration samples remain in the
original control files and recovery score chunks.

The earlier [partial main table](RESULTS.md), [ABC table](abc-RESULTS.md) and
[single-candidate table](single-candidate-RESULTS.md) remain available with their
original receipts. Their union with the 255 recovered triplets is exact and
disjoint. Unsupported workers produced no timings. Actual failed producers and
zero-timing attempts retain their failure identities.

Native component screens are [separate](../native-screen2-4592230b/review.json).
Enabled-versus-enabled native comparisons do not establish gains over original
Java. This historical source does not qualify later runtime revisions.
