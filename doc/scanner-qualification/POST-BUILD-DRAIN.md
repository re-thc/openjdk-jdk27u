# Successful-build shutdown and retained baseline verification

The corrected campaign at `e72c9c791f9c9e94d39ca800ad71b6a31a37bfcc`
finished the baseline `make CONF=scanner JOBS=4 jdk images` successfully, then
ended125 at its live-survivor control. It produced no candidate image, jtreg,
HOST, smoke or workload measurements. The original result, process/RSS records
and clean custody footers remain unchanged; this repair does not reinterpret
that failed campaign as successful or authorize a restart.

## Cause supported by source and existing observations

Linux make's `CleanupJavacServer` in
[InitSupport.gmk](../../make/InitSupport.gmk) only touches `server.port.stop`;
[Init.gmk](../../make/Init.gmk) then finishes without waiting for the server.
[PortFileMonitor.java](../../make/langtools/tools/javacserver/server/PortFileMonitor.java)
checks that request every5000ms. The old supervisor rejected an adopted live
child less than0.7s after the request. Its birth matches creation of the javac
port file. It then became Z/RSS0 and was reaped; no owned live worker remained.

This is strong evidence of legitimate asynchronous javac-server shutdown,
rather than an established live leak. Exact executable/command identity was
not retained, so identifying that specific PID as the javac server remains an
inference. The deterministic control error is certain: any still-live child
after successful make caused immediate TERM and a latched125, before a normal
five-second polling interval could elapse.

## Narrow bounded repair

Only the two explicit `make ... jdk images` calls opt in to `build-stage`.
After authoritative command status0, the supervisor retains custody and allows
up to **six seconds** for natural shutdown: the five-second polling period plus
one second of scheduling/shutdown allowance. This interval starts at the first
validated post-command completion decision, after the separately bounded
observation; it does not start at the instant make exits. It sends no signal
during this period. No wait is added when custody is already empty.

Success still requires both no live owned descendants and kernel `ECHILD`,
verified within that deadline. A late empty observation cannot prove timely
drain. Deadline expiry latches failure; a persistent child receives the existing
guarded TERM10s/KILL2s cleanup and the stage remains125 even if cleanup succeeds.
An unkillable/uncertain child never receives a clean custody footer. Exception
handling cannot restart the twelve-second cleanup budget.

Abort, nonzero command exit, owner/observer fault and uncertain identity bypass
the grace. Birth/UID checks, pidfds, adoption tracking, RSS monitoring and I/O
alarms remain active. Configure, javac, CDS, correctness, HOST, smoke, performance
stages and per-measurement checkpoints keep their strict policy. The outer
six-hour absolute cap, VM flags, fixed samples and statistical gates are unchanged.

Offline fixtures run the actual supervisor loop against injected procfs, waits,
signals, observer heartbeats and clock. They prove normal five-second shutdown
returns0 without signals; persistent workers fail and escalate; unkillable
workers receive no second budget; and late observation, abort, observer loss,
failed commands and ordinary strict stages cannot pass through the build grace.
The complete offline suite passes all46 tests; Bash syntax and whitespace checks
also pass. No live server, build, probe or timing was run to test this repair.

## Verify the retained baseline without rebuilding

The retained baseline is the normal `base/build/scanner/images/jdk` under the
failed e72c9c7 attempt. Its source is exactly
`89885a6288e7aaabd01678a704a586272c0f96e3`, with clean tracked source/build files.
The retained configure/spec/release/build records describe Linux x64, native
release/product server, GCC16.2, the installed JDK27 boot toolchain, four jobs,
mold/sysroot flags and CDS plus Serial/G1/ZGC, excluding Shenandoah.

The original four-file hashes remain valid but cannot freeze all archives or
native dependencies. A separate local full-image manifest now records every
relative entry: type, mode, file size/SHA-256 and symlink target. It covers all
six CDS archives and launcher/native libraries. The recorder rejects external
or broken links, special files and files changing during capture. Verification
rejects added, missing, replaced or changed entries, including same-size edits.
It never launches Java, a build or a benchmark, and refuses to overwrite an
existing manifest.

The retained manifest has637 entries,331 regular files and444828141 file bytes.
Its release/module/VM/launcher entries match the original four hashes, and a
second complete verification against the current full image passed. Local
`baseline-provenance-files.json` pins the manifest SHA and configure/spec/build/
release/identity/footer records. Neither host data nor binaries belong in the
review branch; keep those two local JSON witnesses with the retained attempt.

At a later explicitly released continuation, use that **existing trusted**
manifest, rather than recording a new witness from whatever image is present:

```bash
set -euo pipefail
packet=/path/to/approved-checkout/doc/scanner-qualification
retained=/path/to/scanner-stage-a-e72c9c791f9-20261017
manifest=/path/to/preserved/baseline-image-manifest.json

test "$(git -C "$retained/base" rev-parse HEAD)" = \
  89885a6288e7aaabd01678a704a586272c0f96e3
test "$(git -C "$retained/base" rev-parse HEAD:src)" = \
  5b1009acd19e2b3c8c981b6f3b3180f8088dd2d9
test "$(git -C "$retained/base" rev-parse HEAD:test)" = \
  637cb780fb6375f39f53ab223f10df91f50175ed
git -C "$retained/base" diff --exit-code HEAD --
retained_status=$(git -C "$retained/base" status --porcelain --untracked-files=all)
test -z "$retained_status"
BASE_JDK=$(timeout 30s python3 "$packet/image_manifest.py" verify \
  "$retained/base/build/scanner/images/jdk" "$manifest")
test -n "$BASE_JDK"
export BASE_JDK
```

Require baseline HEAD89885a6, src tree
`5b1009acd19e2b3c8c981b6f3b3180f8088dd2d9` and test tree
`637cb780fb6375f39f53ab223f10df91f50175ed`, with all tracked inputs clean and
no untracked source/build inputs (the normal build directory is ignored).
Before using the output path, verify
the witness and retained provenance-file hashes against their preserved record,
and match the candidate's compiler, boot JDK, linker, sysroot and build profile.
Run verification immediately before reuse and again after any copy; retain its
result in the new continuation provenance. Route every baseline consumer through
this one verified absolute image path. Do not invoke the ordinary full runner
expecting reuse: that mode intentionally builds both images. The later explicit
[`--continue` mode](CONTINUATION.md) binds the retained artifact and builds only
the candidate while sharing the full matrix. Neither mode is released by this
source repair.

Reuse saves only baseline configure/build work. None of the required six CDS
mapping checks,57 jtreg case/collector executions, two HOST runs,34 smoke VMs or
fixed2250 workload children has run for this image. All remain required in a
released continuation; no old sample can replace them. Preserve the original
absolute cap if continuation is approved under that same capped authorization;
verification does not grant a fresh six-hour budget. The old exit125 and zero
measurement result remain immutable, and this image has no performance or
cross-platform qualification claim.
