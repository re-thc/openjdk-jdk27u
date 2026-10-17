# Explicit retained-baseline continuation

This is preparation, **not campaign release**. The ordinary runner still builds
both images. Its explicit `--continue` mode reuses only the verified normal
baseline image from the failed e72c9c7 attempt, creates a fresh candidate worktree
and image, then executes the same full matrix. No old observation or report is
imported, pooled, replaced or retried. The original attempt stays exit125 with
zero workload measurements. Its first continuation (`fcb8f9a60e0`) also stopped125
before any runtime observation; that claim stays spent. See
[EXIT-RACE-REPAIR.md](EXIT-RACE-REPAIR.md) for the preserved failure and repair.

## Prepare the binding without building or launching Java

Use the original trusted `baseline-image-manifest.json` and
`baseline-provenance-files.json` preserved outside the failed attempt. Pin the
provenance JSON's SHA-256 from its reviewed record; do not manufacture a new
manifest or trust a freshly calculated hash of unknown input. Preparation:

```bash
set -euo pipefail
packet=/path/to/approved-checkout/doc/scanner-qualification
retained=/path/to/scanner-stage-a-e72c9c791f9-20261017
manifest=/path/to/preserved/baseline-image-manifest.json
provenance=/path/to/preserved/baseline-provenance-files.json
toolchains=/path/to/the/same/installed/toolchains
binding=/path/to/new/continuation-binding.json
: "${TRUSTED_PROVENANCE_SHA:?use the preserved reviewed SHA-256}"
timeout --signal=TERM --kill-after=2s 3m env PYTHONDONTWRITEBYTECODE=1 \
  python3 "$packet/continuation.py" prepare "$retained" "$manifest" \
  "$provenance" "$TRUSTED_PROVENANCE_SHA" "$toolchains" "$binding"
```

The printed SHA-256 pins the new binding for review. The recorder is exclusive
and never replaces a witness or spends the execution claim. Preparation reads
files, Git identities/status and installed `ldd` dependency metadata. It invokes
no JDK, compiler, build, test or workload.

The binding fixes:

- Baseline HEAD89885a6, exact source/test trees, all clean tracked inputs and no
  untracked source/build inputs; all seven original provenance-file hashes.
- The documented stage4 clean-custody/status0/non-stopped build footer, retaining
  its `survivors=true`. This exception accepts only the historical completed
  baseline build; an interrupted candidate build cannot use it.
- The absolute normal `images/jdk` path and trusted complete image manifest,
  including every CDS archive, launcher, native library, mode and link.
- The normalized build profile, installed GCC wrappers and actual GCC tree,
  resolved native tool/loader/library dependencies, mold, boot JDK, jtreg,
  supplementary sysroot, native headers, startup objects/linker scripts/archives,
  activation file and build environment.
- The complete qualification packet and one original Linux boot/deadline.

The existing baseline configure/spec/log records identify GCC16.2 and its input
paths. The newly captured installed-input fingerprints freeze those files for
the candidate; they do not retrospectively prove toolchain bytes at baseline
build time. Keep the original records and this limitation in the decision.
Only source/output path prefixes are normalized in compiler flags; version,
optimization, collector, CDS and configure settings must match exactly.
Ambient compiler, header, linker and loader overrides are rejected, including
`GCC_EXEC_PREFIX`, `COMPILER_PATH`, `LD_PRELOAD`, `LD_AUDIT` and `GLIBC_TUNABLES`.
Make/configure overrides such as `MAKEFLAGS`, `MAKEOVERRIDES`, `SPEC`,
`USER_MAKE_VARS`, `CUSTOM_ROOT` and `COMPARE_BUILD` are also rejected.

## Later authorized execution needs one command

### Preparing an explicitly reviewed successor after the failed build

The old binding cannot be run again. The file-only `prepare-successor` operation
pins the spent binding/claim and failed analysis/census, refreshes the repaired
packet, rejects changed installed-input fingerprints and preserves the exact baseline,
boot and both original absolute deadlines. It accepts only the recorded125
failure with zero runtime observations, no candidate image/footer, and an empty
live/error census. It records the missing old custody footer as uncertain;
it cannot manufacture ECHILD or a successful old make status.

```bash
PYTHONDONTWRITEBYTECODE=1 python3 "$packet/continuation.py" prepare-successor \
  /path/to/spent/continuation-binding.json REVIEWED_SPENT_BINDING_SHA256 \
  /path/to/preserved/failed-continuation /path/to/new/successor-binding.json
```

Preparation never spends a claim or launches a build/JVM. The fixed child
claim directory `successor` beneath the spent claim cannot be reset by changing
a binding filename, output path or candidate SHA. Existing evidence/claims are
never edited. Later binding revalidates the pins and recenses all old cleanup
identities without sending signals. A different PID birth is unrelated.
The successor binding SHA, complete repaired commit and the custody limitation
must be reviewed together before separate execution approval. This is a fresh
candidate build only; partial build output and old measurements are unusable.

### Executing only after separate approval

After explicit campaign release, use the approved checkout and the reviewed
binding SHA, with a new output path whose parent exists:

```bash
set -euo pipefail
CANDIDATE_REV=$(git rev-parse HEAD)
TOOLCHAINS=/path/to/the/same/installed/toolchains \
  bash doc/scanner-qualification/run-linux.sh --continue \
  /path/to/preserved/continuation-binding.json REVIEWED_BINDING_SHA256 \
  "$PWD" "$CANDIDATE_REV" /path/to/new/continuation-output
```

There is no second manual image-map or matrix wiring step. Under supervisor
custody, the binder verifies all pins, rechecks that the old birth/UID identities
have no live workers, and atomically spends one claim shared by the original
attempt. The claim lives beside, outside, the retained directory. Its identity
does not depend on the binding filename, output path or candidate revision.
It records the binding SHA, candidate, output and both images. A crash after
the exclusive claim directory is created remains spent. Never remove a claim
or prepare another attempt to replace interrupted or losing observations.
Read-only preflight rejects output overlap before creating the output, log or
observer, so a rejected path cannot modify preserved inputs.

The new output retains the binding, both provenance witnesses, one verified
two-image map, release/configure/spec records and fresh control/test/measurement
outputs. Every baseline consumer receives the same verified `BASE_JDK`; there
is no boot-JDK, exploded-image or rebuilt-baseline fallback.

Only candidate configure/make remains. Its source and normalized spec must
match before make, and its build must return success with clean custody,
`stopped=false`, `survivors=false`, `timed_out=false` and no missed drain deadline. Missing footer,
exit125 or persistent child ends the attempt. The build's six-second natural
drain begins at the first validated post-completion decision after bounded
observation. Baseline image/input verification runs again after candidate build.

The shared matrix then retains all six default-CDS mapping checks,57 jtreg
case/collector executions, two HOST runs,34 smoke VMs and the fixed2250 workload
children. Both builds must pass before the shared runtime matrix starts, so an
interrupted candidate build produces no runtime observations and still spends
the one attempt. All Serial/G1/ZGC settings, samples, paired ordering and frozen
gates are unchanged.

## Deadline, ceilings and failure

The continuation does **not** enter the ordinary six-hour wrapper. It uses only
the original absolute deadline, bound to the original Linux boot and a
conservative UTC bound. Verification/configure time consumes that budget.
Invalid, nonfinite, expired or wrong-boot bindings fail; both clocks are checked
before stages and while a stage is active. Expiry initiates bounded cleanup,
without granting another measurement window. The original outer TERM/KILL
allowance remains cleanup time, never sampling time.

The12GiB RSS ceiling remains. The25GiB disk check counts retained plus new
output, including source/build trees. The original failed directory is read
only. Any interruption preserves the new output and spent claim; there is no
automatic resume, sample reuse or retry. An expired window requires a separately
reviewed authorization change, not a new deadline inferred by this code.

Offline coverage includes altered/wrong images, changed/missing pins, compiler
flag mismatches, unreadable inputs, duplicate/partially written claims, original
live workers/PID reuse, deadline expiry during verification and an active stage,
interrupted candidate builds and clean custody with a persistent-child failure.
The full matrix's text is independently pinned in the source tests.
All87 offline tests, Bash syntax and whitespace checks pass. These fixtures
exercise file/control decisions and the injected supervisor loop; they do not
constitute a live continuation run or runtime qualification.
