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
records. The remaining three C1 level-3 arithmetic records and ten AOT/CDS/code-cache records also passed: 129 release jtreg records in total. A functional AOT training/assembly/replay probe succeeds across eight
interpreter/C1/C2 and flag variants with matching modPow checksums. Training
generates common entries; assembly uses ordinary entries. Probe timings ran
alongside compilation and are **not performance evidence**. The clean baseline
release at `87edd79d3104ff502f7befec034716b081436f49` also built successfully.

The clean fastdebug build completed successfully in 1,437.02 seconds and reaped
13,240 children. Its 20 common records passed with CheckUnhandledOops and
VerifyOops, as did all six archive records and both flagless CDS records.
The underlying jtreg commands exited 0; two outer wrappers exited 120 after
environment tool reattachment. Both statuses were preserved, and terminal
printing was hardened. This gives 157 passing final-implementation jtreg records
across release and fastdebug; the remaining fastdebug AOT selection had not
finished when last observed. The official SortIncludes.java checker passed.

The flag/GC public API probe had completed release Serial/G1/Z/Parallel/
Shenandoah and fastdebug Serial/G1/Z/Parallel across interpreter, C1 levels 1/3
and C2 with both flag settings: 504 matching result checks. These were functional
probes during builds, not timing evidence. Completion of fastdebug Shenandoah,
the published-head control build and native gtest build is unverified.

Execution is currently blocked: a status-read exec_command request and a
minimal `printf 'executor-probe-ok'` request did not return through the executor.
Their waiting cells were terminated; no service error code or command output
was returned. Earlier reattachment reported ready and a simple shell probe did
succeed on the original host, so this is a later executor responsiveness blocker,
not a claim that startup failed. GitHub connector reads and writes still work.
The full local fastdebug/probe logs have not been uploaded after this blocker.

Cold/warm performance and tier2 have not started. Exact final native ARM and
Windows AVX-512 qualification remain open. No speedup or independent-review
readiness is claimed. The approved sanity run
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
