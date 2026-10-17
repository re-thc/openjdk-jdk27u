# Process-exit observation repair; qualification still incomplete

The authorized `fcb8f9a60e01c9ca2ff75d84044d78f1b0ef082a` continuation
terminated125 during candidate compilation. The failed output remains preserved
as `scanner-continuation-fcb8f9a60e0-20261017`; its15 primary evidence hashes and
the earlier attempt's29 hashes are unchanged. No new build, JVM, timing or
campaign was run while preparing this repair.

## What failed and what the evidence proves

Stage5 observed owned PID87678, birth3289471, UID1000 as X/RSS0/PPID0/PGID-1/SID-1.
The same identity was already in its birth ledger with ordinary live metadata.
The old parser called global state validation before ownership selection and
raised immediately on X. This could also reject an unrelated process exiting
during the global procfs census.

The process fields came from **one final `/proc/PID/stat` buffer**, not separately
sampled state/parent/group/RSS buffers; UID came from the directory stat and an
earlier stat read checked birth. One buffer is still not an atomic kernel
snapshot. In the host's Linux6.18.55 `do_task_stat`, parent/group fields start
at0/-1 and depend on a later sighand lock; state and memory are read separately.
This tuple is consistent with exit inside that kernel handler. It does not
retrospectively prove exit for this process.
[Kernel source](https://raw.githubusercontent.com/gregkh/linux/v6.18.55/fs/proc/array.c).

Stage5 has no completion footer or proven make status. Its normal candidate
`images/jdk` directory is absent; the log ends during module compilation.
Partial libjvm output is insufficient build provenance. The candidate cannot be
reused. The old baseline still passed its full-image manifest verification.
The failed run produced0/6 CDS checks,0/57 jtreg executions,0/2 HOST runs,
0/34 smoke VMs and0/2250 workload children. Its184 RSS samples spanned183.063s
and peaked at2695244KiB; combined disk usage was8212MiB. Neither ceiling fired.

Two independent read-only audits found no live known or matching unledgered
workers. Of3546 identities,3545 had disappeared and one tee remained Z/RSS0
under PID1. They sent no signals. This is an empty live census, **not recovered
subreaper custody**: the missing stage5 adoption/ECHILD footer remains uncertain.
The original execution claim stays spent, with no reused observations.

## Repaired policy

The raw parser preserves observations. Only birth/UID-validated owned identities
get process pidfds, opened with flags0, revalidated against fresh metadata and
held through observation/cleanup. Unsupported states and negative RSS fail even
when an older sample was live or a descriptor is readable. X0/Z0 or missing
metadata requires positive pidfd exit evidence; nonready/error/invalid polls
remain uncertain. A zombie leader can still have live threads; process pidfd
readiness waits for the last thread. POLLHUP denotes reaping.
[pidfd documentation](https://man7.org/linux/man-pages/man2/pidfd_open.2.html).

Raw X metadata and the separate identity-bound exit witness remain in the logs;
absence is never rewritten as a fabricated zombie. Terminal handles close early
while their proofs remain cached. Every remaining handle closes on all exits.
Unrelated raw X rows do not become owned. New descendants require a still-live
held parent after the child's snapshot, so an exited parent's stale PID cannot
admit a new unrelated child. Cleanup uses held kernel identities; a fresh
fallback lookup must revalidate birth/UID and cannot silently skip nonready Z0.

The RSS observer shares this policy and writes `memory-exits.jsonl`. It preserves
positive sampled RSS even if exit is proved just afterward, so an observed
12GiB sample still stops before publishing healthy readiness. Poll proof never
replaces actual-parent WNOWAIT logging, waitpid status or final ECHILD. Missing
custody evidence still prevents a success footer.

Normal image builds now launch make directly under their subreaper, removing
the redundant build-only GNU timeout layer. This simplification does not fix
the procfs race by itself. One monotonic90-minute command deadline latches124
even if make later returns0; actual make status remains recorded. Timeout/fault/
nonzero exits bypass the six-second success-only natural drain. TERM10s/KILL2s
cleanup has one separate budget and cannot restart it. Nonbuild argv, runtime
matrix, collectors, samples and gates remain unchanged.

## Offline verification and ordinary checkout reproduction

```bash
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover \
  -s doc/scanner-qualification/tests -v
bash -n doc/scanner-qualification/run-linux.sh
git diff --check
```

All87 deterministic fixtures pass. They forbid real process creation, procfs,
waits, signals and prctl fall-through. Coverage includes one-buffer X parsing,
held/nonready/error pidfds, fresh state/identity changes, stale parent admission,
descriptor closure/reuse, RSS read-to-exit ordering, make timeout/status/drain,
actual-parent custody and strict runtime behavior. Successor fixtures protect
the spent claim, unchanged evidence/deadlines/toolchain, all five zero counters,
absent image/footer, fresh live/UID census, protected outputs, disk accounting,
pins, duplicate claims and expired budget. Two
independent source reviewers checked process/provider-lifecycle implications.
These fixtures establish control decisions, not live-run qualification.

## Concrete continuation proposal; no execution release

The [successor preparation](CONTINUATION.md) creates only a new reviewable
binding. It reuses the complete verified baseline and requires a fresh candidate
worktree/build with the unchanged production/test trees. The old partial
candidate, spent claim and all failed evidence remain untouched. The successor
pins the failed attempt and explicitly records its uncertain old custody.
It keeps the original Linux boot, monotonic47430.91 and absolute
**2026-10-17T20:25:12.037430+00:00** cutoff. Preparation/verification consumes
that window; no new six-hour budget exists.

After separate execution approval only, one `--continue` command would build
the candidate and run the unchanged full matrix. No sample replacement,
automatic retry, PR, merge, CI dispatch or installation is part of this repair.
If the original window expires first, this proposal cannot run under it.
The Scanner optimization remains **not qualified for integration**.
