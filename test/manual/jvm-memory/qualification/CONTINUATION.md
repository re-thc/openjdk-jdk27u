# Preparation repair and bounded continuation

The original terminal attempt remains HOLD. Its successful baseline `make`
returned with a live child, which the old strict cleanup killed/reaped. Its
candidate build, correctness, memory and performance stages never ran. Reusing
the resulting baseline is preparation reuse, not a retrospective cleanup pass,
a qualification result, or permission to restart timings.

## Reviewed asynchronous-build policy

This repair follows Scanner commit
`db266200863da200d5bb11a80e8875643153db5e`. OpenJDK's make cleanup touches
`server.port.stop` and returns without awaiting the javac server; the server
checks that marker every 5000 ms. Immediate rejection of any live child after
successful make can therefore reject ordinary asynchronous shutdown. The old
receipt did not retain the child's command, so identifying that historical child
as the javac server remains an inference.

Only the explicit untimed image/gtest **build calls** opt in to a six-second
natural drain after authoritative exit zero. There are no signals during drain.
Ownership snapshots, pidfd child confirmation/reaping, cancellation, output and
storage guards remain active. The controller continues draining stdout so a
shutdown message cannot block a child on a full pipe. Success requires empty
owned custody and the kernel child audit within the original bounded window;
an empty observation arriving late cannot pass.

Persistent/uncertain children, observation errors, cancellation and nonzero
launcher status remain failures and enter the existing bounded cleanup. There
is no repeated grace or cleanup budget. Configure, correctness, fixtures and
measurements keep strict cleanup; timings receive no drain allowance. The outer
supervisor also keeps strict cleanup. Descendant commands/executables, birth,
UID and any diagnostic errors are retained before signalling, using a pinned
procfs directory after kernel direct-child confirmation. Deeper children are
eligible after adoption. PID/group numeric signalling remains absent.

Disabling javac-server was evaluated as a supported alternative. It is not
needed for this repair, which accommodates the normal bounded shutdown protocol
without changing either build configuration. A future configuration change must
apply symmetrically, requires its own provenance, and cannot silently reuse a
baseline with a different setting. Continuation checks compiler paths/versions,
boot JDK, features, desktop setting, JVM variants and javac-server setting
against the retained baseline.

## Record a trusted local witness before review/release

`image_manifest.py` adapts Scanner's complete retained-image catalog: every
relative entry's kind, mode, regular-file size/SHA-256 and symlink target. It
rejects external/broken links, special files, unreadable entries and files
changing during capture. Verification rejects missing, added, replaced or
same-size-modified entries. No VM/build/workload is launched.

`continuation.py` is deliberately limited to the original a30e335 baseline-build
ownership failure, successful make, complete inner/outer cleanup and final child
audit. It rejects prior candidate builds, correctness/measurement receipts,
changed inputs/source, a changed terminal result or an exhausted deadline.
The original B/C production revisions stay
`89885a6288e7aaabd01678a704a586272c0f96e3` and
`f03c433e6846632173209a2d85ca471c6ae6aa22`.

With the original source-based worktrees and receipts retained:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 test/manual/jvm-memory/qualification/continuation.py \
  /path/to/original-output /path/to/original-owner \
  /path/to/original-release.json /path/to/new-witness-directory
```

The witness directory must be new. Keep the returned `continuation.json` path
and SHA-256. It pins the original freeze, command/decision/owner/terminal
receipts, release, baseline spec/configure/build logs, full image manifest,
installed inputs and exact fixed protocol. The full image witness is **first
captured after terminal cleanup**, not claimed as a historical build-time hash.
Keep the witness/hash and all host data locally; publish only source/tests/docs.
Neither witness recording nor verification authorizes campaign execution.

## Complete remaining-stage entry point, only after independent review

Use the already approved original release, new owner/output directories and the
trusted witness/hash. Pass the same boot JDK, jtreg, GoogleTest, JMH, ASan runtime
and configure options from the original owner argv:

```sh
source /workspace/toolchains/activate.sh
export PYTHONDONTWRITEBYTECODE=1
export TMPDIR=/path/to/retained-workspace-temp
python3 test/manual/jvm-memory/qualification/supervise.py --execute \
  --owner-output /path/to/new-continuation-owner \
  --continuation /path/to/new-witness-directory/continuation.json \
  --continuation-sha256 TRUSTED_WITNESS_SHA256 -- \
  --output /path/to/new-continuation-output --stop-after all \
  --boot ORIGINAL_BOOT --jtreg ORIGINAL_JTREG --gtest ORIGINAL_GTEST \
  --jmh ORIGINAL_JMH --asan-runtime ORIGINAL_ASAN_RUNTIME \
  --configure-option=ORIGINAL_CONFIGURE_OPTION
```

Repeat the configure-option argument only for the original list, unchanged.
The supervisor verifies the witness and uses its original absolute monotonic
deadline, capped by its normal maximum; the inner controller inherits that same
deadline. Review/repair elapsed time and previous preparation consume the
original ten-hour cap. The original release-build stage cap is conservatively
bounded by original release start plus 110 minutes. No stage receives a fresh
budget. Different boot/monotonic-clock custody is rejected. Expiry stops the
continuation; it does not request or create another budget.

Before the inner launch, the supervisor atomically creates a single-use
`continuation.claim.json`, bound to the trusted witness hash, owner receipt and
new output. A repeated claim is refused; the inner controller verifies the same
claim. This prevents the same approved continuation from relaunching after
consuming any stage. The witness and original terminal files are not rewritten.

The new output links B to the verified retained worktree/image, without
reconfiguring/rebuilding/copying it, and creates a **new C source worktree**.
The original C worktree and all terminal attempt receipts remain unchanged.
The full baseline witness is reverified immediately before reuse; a new
baseline image/spec receipt and explicit `baseline-reuse.json` identify its
provenance. All later baseline consumers use this one linked verified image.
Candidate release build, both profile checks, exact native/negative-control and
jtreg cases, fixture and EOF/repetition regression, NMT/memory benefit,
unchanged fixed balanced samples/statistical gates, and conditional
fastdebug/ASan all remain in the ordinary `all()` pipeline.

No samples existed to reuse. Any failed/inconclusive remaining gate still stops;
there is no adaptive sample expansion, repeated timing, fresh authorization
budget or merge. Owner `COMPLETED`/exit zero, complete cleanup/final child audit
and inner `LOCAL_GO_FOR_REVIEW` remain jointly required. Independent supervisor
death remains outside the user-space containment guarantee.

## Validation and execution status

`PYTHONDONTWRITEBYTECODE=1 python3 -m unittest -v test_guards test_supervisor test_continuation`
passes **53 offline tests**. The tests cover natural five-second shutdown with
no signals, persistent and uninterruptible survivors, late observations,
cancellation/observation errors, strict stages, final child audit, held pidfds,
absolute/stage budget retention, full-image/provenance tampering, consumed-work
rejection, baseline build reuse and JSON serialization/nonfinite rejection.
Fake clocks/children/native boundaries launch no workload or VM. Source parses
and whitespace checks also pass. This is source/preparation validation; the
repaired continuation has not executed and awaits independent source review.
