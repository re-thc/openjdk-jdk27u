# PR9 live local qualification

Implementation: `e41d7823bf6de77c4bfba52e896bf325221488cb`; checkout
`/workspace/openjdk-jdk27u`, branch `common-intrinsics`. Public PR9 remains
open, non-draft, at `c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b`.

Both clean release/fastdebug images passed their builds. New-source focused
qualification passed 171 jtreg records plus two flagless redefinition records,
1399 fastdebug gtests (15 disabled), 864 functional flag/collector checks,
80 moving-GC cold probes (2571 actual GC cycles), and eight release dynamic-CDS
record/replay checks. All 239 ordinary interpreter handlers have identical
offsets with common intrinsics off/on.

The full interpreter warm tier (144 JMH invocations / 240 parameter forks) and
24 exact-size cold cases (16800 fresh JVM observations) are complete. A fixed
50-fork hash follow-up confirms correction of the previous large-array fallback
regression. The independent 360-block cold square follow-up did not reproduce
the original enabled-VM loss; its weak feature-off control signal is retained.
These are partial performance results, not full performance qualification.

## Running work

At 2026-10-15 22:56 UTC, four conc=1 jtreg batches were active: release main,
fastdebug main, fastdebug security prefetch, and release networking prefetch.
The main drivers reuse exact-command/source prefetch results under batch locks.
Do not launch duplicate batches or exceed four actual batches.

`python3 /workspace/pr9-layout-validation/tier2_status.py` shows live counts.
`observe_tier2_failures.py` checks actual completed JTR failures against exact
message/test/hash-verified historical controls. The current known failures are
12 cross-collector object-header flag mismatches (six per image) and two
release serviceability tests needing unavailable `/proc/sys/kernel/core_pattern`.
Original failures remain failures. They are separate from the native ARM
same-flag archive-resolution nondeterminism.

`after_net_prefetch.py` waits for release networking to finish, then uses that
same slot for both module-limited NoLDAP variants, both matching-header CDS
controls, and fastdebug networking. Inspect `after-net-prefetch.json`.

`finish_local_qualification.py` waits for all 22 main groups. It strictly checks
unknown failures, unreviewed skips and batch errors, then packs/publishes the
existing evidence branch and freezes `tier2-assessment.json` by SHA in
`pre-performance-evidence.json`. Never regenerate that assessment after the
receipt exists. It then runs the remaining quiet performance phases. Inspect
`local-continuation.json`; any unmet gate stops for review rather than claiming
success. Early interpreter/exact data are reused only after strict metadata
checks, and retain their original measurement timeline.

All long workers use `run_reaped.py`; PID1 was not changed. There are 66 stable
preexisting/reconnect-related PID1 zombies, no per-JVM leak, and no OOM kills.
Monitor free space (about 4 GiB at this snapshot). Preserve old namespace
`/workspace/pr9-validation`, its images, baseline controls, and frozen results.

## Publication and remaining blockers

Latest partial tier2 checkpoint:
`391c03db34b3920e719169ab1db2746cfcf60d25`,
`.github/qualification/chain-checkpoint/layout-tier2-stage-03`.
Archive SHA256: `48ed6ef7633e7c012f9fef7a6952fb0f53c7c1e9acde4a32f0bb47ac0668b06f`.
Clean core, complete interpreter, hash confirmation, exact cold data and the
full candidate patch have earlier immutable checkpoints, listed in
`BENCHMARKS_PENDING.md` and `/workspace/pr9-recovery/ACTIVE_STATE.json`.

Only fast-forward evidence pushes on `pr/common-intrinsics-final-evidence` are
authorized. Use the guarded `publish_evidence.py` under `run_reaped.py`; inspect
pack exit status and readability before publishing. No PR source push, hosted
campaign, merge, force push, new PR/tasks or init change without the applicable
parent approval. PR source push itself triggers hosted builds.

Current-source native AArch64 builds/CDS/ZGC/performance and Windows/native
AVX-512 execution remain unqualified. The original Library packets and approved
artifact could not be materialized after their single permitted local retry;
do not retry, guess URLs or bypass the supported path. Historical tested JVM
was `d8fc74ba01f7e6ed0a77e94f89b1a0922a79a776`, not the current source.

Finish all local tests and remaining performance, investigate actual signals,
then finalize `BENCHMARKS_PENDING.md` / `PR_DESCRIPTION_PENDING.md`. Repository
benchmark documentation is still stale; drafts are deliberately outside the
checkout so current-source qualification gates remain valid. No broad speedup,
clean-tier2, native qualification or review-readiness claim is authorized by
the current partial evidence.
