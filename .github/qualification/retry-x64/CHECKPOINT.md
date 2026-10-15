# PR 9 execution checkpoint

The replacement environment provisioned and ran a shell startup probe. The
exact clean source `25bff7b9d9c33fac3e62af27b4405ff60c00e583` was restored from
checkpoint `6276dd1b9cc1be5010a5491402fb96fcbfe376c9`; the recovery bundle's
SHA256 and prerequisite verification passed. Its clean release build completed
and its 20 common-intrinsic jtreg records passed.

Local source is now `7454b15f85f20d7ed6688256b52c126603e3ff06`.
This author-only rewrite of 8c833417 uses the public noreply identity; both
commits have identical tree `85f88dbe68d8c68d66f9bec99639bcf52844f735`.
`retry-source.bundle` preserves it under `refs/heads/common-intrinsics`, with
prerequisite `c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b`. Its SHA256 is
`5f64d6b3add3b51ebffb6ae7a4967c951c08317b93319950073587eec09ea0cb`.
The public PR head remains c04d1ba1, open and **not draft**. No PR state change,
merge, force push, new PR/task or hosted campaign has been performed.

The local change uses ordinary interpreter entries during static CDS assembly,
preserving common entries for normal execution and AOT training. A new test
compares flag-off, flag-on and frequent-safepoint archives under Serial, G1 and
ZGC. Before the change it failed all three collectors: file byte 28,382 belongs
to Long's constant-pool tag #18 for Integer, with resolved tag 7 versus
unresolved tag 100. The real map offset and ownership are recorded separately;
the JTR's automatic excerpt points elsewhere. This is new x64 evidence, not
verification of the original ARM archive bytes or proof of their exact trigger.

The rebuilt release image at 8c833417 passes 20 common records (including new
first-modPow setup coverage), six archive records, two flagless CDS records,
11 related HotSpot records, 74 JDK records and three C1 level-1 arithmetic
records. A functional AOT training/assembly/replay probe succeeds across eight
interpreter/C1/C2 and flag variants with matching modPow checksums. Training
generates common entries; assembly uses ordinary entries. Probe timings ran
alongside compilation and are **not performance evidence**. The clean baseline
release at `87edd79d3104ff502f7befec034716b081436f49` also built successfully.

Clean fastdebug build, remaining AOT/flag/GC checks, full paired cold/warm
performance, tier2 and final native qualification are still pending. No current
speedup or independent-review readiness is claimed. The approved sanity run
38385226401 was still queued on attempt 2 when checked; do not update the PR
branch while doing so would cancel that run.

Both specified Library files resolved with the expected versions and sizes,
but the supported transfer helper returned `download failed` on the first
attempt and one local retry each. No bytes, readability or manifest verification
is available for those original packets in this environment. The original ARM
nondeterminism, exact final native ARM qualification/performance and Windows
AVX-512 execution remain open gates.

Builds run under a private child subreaper without changing PID 1. The first
build reaped its children on completion; subsequent runs reap continuously.
The baseline build reaped 8,407 children and process counts remained healthy.
`manifest.json`, command/result records and image fingerprints distinguish
every tested source. Images and complete JTR worktrees must be rebuilt elsewhere.
