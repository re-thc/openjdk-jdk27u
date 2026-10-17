# Local Scanner runner repair

This document records the original `e72c9c791f9` repair milestone. The later
authorized run exposed asynchronous post-build shutdown; see
[POST-BUILD-DRAIN.md](POST-BUILD-DRAIN.md) for that result, the narrow subsequent
source fix and verification of the already-built baseline without rebuilding.

This change repairs runner lifecycle classification. It does not qualify the
Scanner optimization and does not authorize another campaign. Production source,
JDK regression tests, fixed sample counts, performance gates and the historical
`ScannerProbe.java`/`ScannerSteady.java` workloads are unchanged.

## Preserved failed attempt

The sole authorized attempt used candidate
`cdaddc8592c8796ed42198d34465463deb4181a8` and baseline
`89885a6288e7aaabd01678a704a586272c0f96e3`. Baseline configure completed on
2026-10-17; cleanup rejected its process group before the first `make` command.
The group contained fourteen `ld.mold` zombies, all state Z, RSS0 and reparented
to PID1. The outer group retained one dead RSS0 `tee`. `kill -0` still succeeded
for these entries, causing the false "termination uncertain" decision. No live
owned worker remained in the final scan.

The attempt ended125 with **zero images, correctness tests or measurement rows**.
Its 41 RSS samples cover40.012481564s and peak at426356KiB; no12GiB resource stop
or25GiB disk limit was reached. The output directory
`/workspace/scratch/scanner-stage-a-cdaddc8592c-20261017` remains separate and
unchanged, including `RESULT.md`, `analysis.json`, `cleanup.csv`, controller/RSS
logs and configure output. No attempt is made to reap PID1's non-child zombies.
There is no partial timing data to reuse.

## Repair and audit

`runner_process.py` provides one Linux process classifier for readiness,
observation and cleanup. Birth plus UID validates a PID; only Z with zero RSS
is terminal. Zero RSS alone never makes a worker dead. Missing processes are
distinct from unreadable/malformed observations and reused PIDs. Ownership is
established by validated ancestry and retained across adoption or `setsid()`.
An uncertain target cannot suppress independent guarded cleanup of other known
births. Explicit cleanup signals use pidfds opened before identity revalidation.

`stage-control.py` registers a private stage before work, then enables per-process
subreaper custody before launching the GNU timeout/payload. It records waitable
Z0 children before actual-parent reaping and proves both no live owned members
and kernel `ECHILD` before writing a clean custody footer. A vanished supervisor
without that footer is uncertain; even a now-empty known ledger cannot exclude
an unrecorded escaped descendant. Known verified targets still receive guarded
cleanup attempts. At that revision, any live survivor after command exit made
the stage incomplete even when its termination succeeded. The subsequent
build-only natural-drain rule is documented separately; other stages stay strict.

The Bash runner uses this classification at observer readiness, pre-stage health,
wait completion, stage TERM/KILL verification and observer shutdown. It waits
interruptibly on short control helpers with I/O alarms. Bash reaps its own stage
and observer jobs after terminal verification; helpers do not impersonate their
kernel parent. The RSS observer retains state/birth/UID and zombie evidence,
publishes healthy readiness only after flush and limit checks, and uses a held
owner pidfd for fault notification. A stale observer remains an incomplete result
while its independently verified live process is still shut down.

The Java campaign asks the stage supervisor for a custody checkpoint before and
after every measurement child. A fresh snapshot is taken after the request,
avoiding stale observations of an already exited child. Only the waiting
campaign's ancestor chain may remain live; a surviving adopted or escaped worker
aborts before another measurement child. Checks sit outside measured child
lifetimes. The child command, VM flags, protocol and statistical gates remain
unchanged. This Linux mechanism does not claim other-platform runner coverage.

The image audit follows `make/Main.gmk`: `jdk` selects `exploded-image`, while
`images` selects `product-images`, which includes `jdk-image`.
`make/Images.gmk` links `JDK_IMAGE_DIR`, and
`make/autoconf/spec.gmk.template` sets it under `IMAGES_OUTPUTDIR` with subdirectory
`jdk`. Therefore the runner retains **`make CONF=scanner JOBS=4 jdk images`**
and consumes **`build/scanner/images/jdk`**. One current-output base/candidate map
feeds release/modules/VM hashes, CDS, jtreg, HOST, smoke and measurements. Required
image files and executable `bin/java` are checked before those consumers. No boot,
exploded, opposite-label or prior-attempt image is substituted.

## Offline validation only

From an ordinary checkout, using installed Python and Bash:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover \
  -s doc/scanner-qualification/tests -v
bash -n doc/scanner-qualification/run-linux.sh
git diff --check
```

Fixtures inject snapshots, clocks, pidfds/signals, wait outcomes, payload launch
and subreaper setup. Real process creation, waiting, pidfd access and signals are
guarded against in the tests. A temporary fake procfs tests parsing; no fixture
inspects or controls real PIDs. Tests cover live/stopped/blocked zero-RSS workers,
zombies, disappearance, reuse/UID changes, observation errors, mixed groups,
adoption/session escape, independent cleanup after uncertainty, lost custody,
pre-reap logging, stale readiness/shutdown, first-sample RSS limits, flush/report
failure and timeout unwinding, post-request checkpoints and normal image paths.

These offline checks establish the modeled local logic. They do **not** exercise
kernel subreaping/pidfds, compile the changed Java controller, build any image,
run jtreg or measure startup/allocation/performance. Those remain unverified.
No replacement campaign, installation, CI, PR or publication was performed.
Any later execution requires separately authorized runner validation and a fresh
source identity; the failed attempt remains an incomplete, zero-measurement run.

Local validation on 2026-10-17: **34 tests passed**; Bash syntax and
`git diff --check` passed. Production/test trees and both historical workload
hashes are unchanged. SHA-256 comparison of the eleven retained failed-attempt
evidence files listed above (including configure output) found no changes.
