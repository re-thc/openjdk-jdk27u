# Bounded executor recovery

The single read-only health check returned `recovery-health-ok`, exit 0. The
checkout is clean at `7454b15f85f20d7ed6688256b52c126603e3ff06`, tree
`85f88dbe68d8c68d66f9bec99639bcf52844f735`.

Both immutable runtime images identify source 8c833417 in their release files.
That commit and 7454b15f have the identical complete source tree; the latter
changes author metadata only. Every saved fastdebug image fingerprint was
rechecked successfully before further work. `recovery-manifest.json` records
the observed release fields, image hashes, full command results and source-tree
comparison. No build, measurement or Library transfer retry was started during
this recovery.

Completed final-implementation checks are 129 release and 33 fastdebug jtreg
records, plus 560 public-API result checks across five collectors, four tiers
and both flag settings on release and fastdebug. Fastdebug AOT has five passed
records and five records that did not meet platform requirements under its
selected VerifyOops=true flags; those five AOTCodeTest collector records require
VerifyOops null/false. These skips are not passes. The source-aligned published-head
control build and native gtest build completed with exit 0. The native gtests
have not executed. Performance and tier2 remain unstarted, and original ARM
archive attribution/native ARM and Windows AVX-512 qualification remain open.

`latest-fastdebug-probe-logs.zip` contains 132 log, result, JTR, summary and
reproduction-script files. Its size is 152105 bytes and SHA256 is
`55208876371fb1d31ca8035b45bacd3cd8237d7e782ce4db09b8ac4606db57c1`.
The source bundle and prerequisite in CHECKPOINT.md still suffice to restore
7454b15f; this packet supplies the recovered validation evidence. Images and
complete scratch worktrees remain local and can be rebuilt from those sources.
