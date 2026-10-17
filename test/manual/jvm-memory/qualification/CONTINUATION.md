# Owned verification and fixed-cutoff matched rebuild

The original attempt remains HOLD, with complete owned cleanup. Its successful
baseline make was rejected at the asynchronous-child control; candidate build,
correctness and measurements never started. That original result and its
forensic image/provenance witness remain unchanged.

## Successful-build shutdown policy

Scanner `db266200863da200d5bb11a80e8875643153db5e` supplies the narrow policy:
make touches javac's stop file without awaiting its five-second polling cycle.
Only successful explicit untimed image/gtest builds receive a six-second
natural drain. No signals occur during it; child command/exec diagnostics,
identity/custody, output, storage, cancellation and final kernel audit stay
active. Persistent/late/uncertain survivors fail even if subsequent cleanup
succeeds. Other commands and measurements retain strict cleanup. Javac-server
configuration is unchanged and symmetric.

## Verification is part of the owned invocation

`supervise.py` establishes its ChildScope and deadlines before native admission
and before forking the controller. It does not read/hash the continuation,
invoke Git, verify images or claim a witness before this scope/loop exists.
Log opening is inside its owned launch path. All continuation/source/input
verification executes in the controller child while the independent supervisor
continues enforcing the whole-invocation cutoff and cancellation.

Git checks also have local subreaper/pidfd cleanup, finite polling, cancellation
and a per-command deadline clipped to the global bound. Partial launch,
verification error and cancellation always enter owned cleanup. Git receipts
are retained in `verification.json`; outer cleanup and final child audit apply
even when controller construction/preflight fails. Hashing checks cancellation
and deadline between chunks; catalogs check between entries/chunks. A stalled
controller/native operation remains covered by the separate supervisor.
Source hashes are recorded by the owned controller's freeze, not by unbounded
hashing in the parent before its loop. `--harness-commit` is verified by an owned
Git check before any build. Nothing weakens kernel-confirmed pidfd ownership.

## Original boot evidence is absent: fixed UTC is the authority

The first attempt recorded monotonic values but not its boot identity. A boot
hash captured later cannot prove the original epoch. The implementation does
not invent that missing provenance or use legacy monotonic values as authority.
Capture-time boot fields in the retained legacy witness are forensic only.

The continuation is hard bounded by **2026-10-18 01:23:44 UTC**, conservatively
rounded down from the original fractional-second cutoff. At admission, remaining
UTC time becomes a non-extendable local monotonic ceiling. Both clocks are
checked: advancing UTC can stop sooner, and rolling UTC back cannot extend the
initial monotonic bound. A reboot uses only remaining UTC, not a new ten hours or
an old boot's monotonic epoch. Expired UTC skips admission/controller launch.
The release-build stage also derives its original 110-minute limit from the
original release UTC. Later fixed stage caps and all measurement gates remain.

## Retained baseline cannot satisfy toolchain byte provenance

Original `freeze.json` includes boot `bin/java`, `bin/javac`, the ASan runtime and
selected test inputs, but omits boot `lib/modules` and native compiler binaries.
The retained configure/spec/build records give paths and versions, not original
byte hashes. A current full-image/compiler hash cannot retroactively prove that
baseline and a new candidate used identical boot/compiler bytes. Reuse is
therefore **rejected**, including when the retained image's current hash verifies.
The former witness writer is disabled; more post-hoc witnesses cannot repair
that historical gap.

The smallest supported path is an explicitly selected **normal matched rebuild
of both B and C**, keeping production revisions and configure options unchanged:
B=`89885a6288e7aaabd01678a704a586272c0f96e3`,
C=`f03c433e6846632173209a2d85ca471c6ae6aa22`.

Before either build, capture the complete boot JDK (including modules and native
libraries) and declared native compiler/linker roots. Roots must contain actual
ELF GCC/G++, cc1/cc1plus and mold, not merely wrappers, version strings or package
metadata. Verify the same catalog before/after each build; reject changed bytes,
modes, links or entries. Both selected compiler paths must be covered. This is
prospective custody for the two new builds, never a claim about the old baseline.
System packages remain under the existing read-only/no-install environment
policy. Toolchain catalogs and all host-specific receipts stay local.

## Complete entry point after independent review and explicit release

Use the preserved original terminal/protocol witness and its trusted SHA; no
new reuse witness is required. New owner/output directories remain mandatory.
For the installed GCC16/mold provider, the complete entry point is:

```sh
source /workspace/toolchains/activate.sh
export PYTHONDONTWRITEBYTECODE=1
export TMPDIR=/path/to/retained-workspace-temp
python3 test/manual/jvm-memory/qualification/supervise.py --execute \
  --owner-output /path/to/new-owner \
  --continuation /path/to/retained/continuation.json \
  --continuation-sha256 TRUSTED_SHA --matched-rebuild -- \
  --output /path/to/new-output --stop-after all --harness-commit REVIEWED_HEAD \
  --toolchain-input-root /workspace/toolchains/gcc16 \
  --toolchain-input-root /workspace/toolchains/gcc16-root \
  --toolchain-input-root /workspace/toolchains/mold \
  --boot ORIGINAL_BOOT --jtreg ORIGINAL_JTREG --gtest ORIGINAL_GTEST \
  --jmh ORIGINAL_JMH --asan-runtime ORIGINAL_ASAN_RUNTIME \
  --configure-option=ORIGINAL_CONFIGURE_OPTION
```

Pass every original configure-option unchanged. The original protocol/input
records are verified, the single-use claim binds owner/output, both new source
worktrees are created and both normal release builds run. No baseline symlink,
copy/reuse or overwrite of the terminal output occurs. All profile/native/
negative-control/jtreg, fixture/EOF, memory, fixed balanced performance/startup
and conditional debug/ASan gates remain in the ordinary pipeline. No timing has
been consumed or may be repeated/expanded. No fresh budget, merge or CI dispatch
is implied. Twelve-GiB admission/debug storage gates and the runtime reserve
remain unchanged; a matched rebuild requires additional storage and does not
implicitly authorize deletion of retained outputs.

Owner COMPLETED/exit zero, full cleanup/final audit and inner LOCAL_GO_FOR_REVIEW
remain jointly required. An uncatchably dead independent supervisor is still
outside the user-space guarantee. Incomplete custody or expired bounds never
become a pass.

## Source validation only

`PYTHONDONTWRITEBYTECODE=1 python3 -m unittest -v test_guards test_supervisor test_continuation test_deadline`
passes **71 offline tests**, including owned delayed/cancelled/failed preflight,
partial Git launch, chunk cancellation/deadline, reboot/reset/rollback/expiry,
serialization, historical-reuse rejection and prospective boot/native-byte drift.
No matched rebuild or continuation was executed for this repair. Independent
review and explicit execution release remain required.
