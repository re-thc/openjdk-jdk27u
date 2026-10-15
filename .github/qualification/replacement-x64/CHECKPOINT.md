# Common intrinsics replacement checkpoint

Status: incomplete; PR #9 is not ready for independent review.

The public PR head remains `c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b`.
The clean local source head is `25bff7b9d9c33fac3e62af27b4405ff60c00e583`.
`replacement-source.patch` applies to that public head and preserves the local
implementation if this runtime becomes unavailable. No merge, force push,
competing PR, cancellation or new hosted diagnostic run was performed.

`replacement-source.bundle` additionally preserves the exact two local commits.
After fetching the public base, verify it with `git bundle verify` and import its
branch into a separate remote-tracking ref before reviewing and fast-forwarding
the existing branch:

```sh
git fetch replacement-source.bundle refs/heads/common-intrinsics:refs/remotes/replacement/common-intrinsics
```

The source avoids generating the entire compiler-stub blob merely because
BigInteger is linked. Small interpreter arithmetic accumulates work before
preparing it in a safe VM frame; C1 demand and direct native/method-handle
targets prepare it separately. Montgomery operations prepare it on first use
because deferring them regressed the first modPow call. Entry generation visits
the common catalogue and reuses three identical aliases with independent flag
checks. Leaf adapters, publication locking, public APIs and default flags retain
their existing behavior.

## Validation and performance provenance

Release source `71e7b1a9f3ab8aa589221bd4dff548068b2660c5` passed 111 jtreg
records: common interpreter/C1 tests, crypto and BigInteger, JDK selections and
C1 level 1/3 arithmetic. It includes cold/warm BigInteger initialization checks.
The latest Montgomery/include-order followup is unbuilt and untested. Source
catalogue audit and whitespace checks pass; this is not an official include-order
validation. `images/demand` fingerprints in the manifest refer to 71e7b1a,
not the latest local source head.

In the completed interpreter 512-bit first-multiply comparison, 71e7b1a reduced
the enabled-path cost relative to the public head by 0.435 ms (95% interval
0.373 to 0.497 ms); its difference from matching master was +0.006 ms
(interval -0.018 to +0.031 ms). This matrix is partial: the corresponding
first-modPow result regressed by 0.459 ms (interval +0.110 to +0.809 ms),
prompting the unvalidated followup. The later unchanged flag-off control JVM
failed under process exhaustion, so the matrix was stopped. Warmed comparisons
have not run. Entry-generation optimization alone did not establish a resolved
startup improvement. No claim of zero enabled-path overhead is supported.

## Archive failure

Approved paired AArch64 run 38640541680 completed. Its workflow permits expected
mismatches, so its success conclusion does not mean every test passed. Across
20 ZGC repetitions per variant, matching baseline and PR flag-off each passed
20/20; PR flag-on passed 16/20. Failures were blocks 01, 02 and 03 at byte
1,784,920 (0 versus -64), and block 14 at byte 92,542 (7 versus 100).
The cause remains unproven. `paired-archive.log` contains every row.

Artifact 11936109812 is needed for `archive-results/results.json`,
`archive-results/environment.json`, the all-collector control JTRs, and the
retained failed PR-on JTR/SharedArchiveFile*.jsa/*.map files for blocks
01/02/03/14. Tool downloads and the prescribed Library materializer did not
yield accessible bytes; signed URLs are excluded from this checkpoint.

The original failed native runtime job's approved retry passed, including the
ZGC determinism test. Whole sanity run 38385226401 remains queued (attempt 2)
for other jobs. Do not push the PR branch while this approved run is active:
its workflow has cancel-in-progress enabled for the PR ref.

## Runtime blocker and remaining gates

The replacement runtime accumulated 32,398 zombies owned by PID 1 (`tail`, no
SIGCHLD handler). Fastdebug build/resume and a one-job incremental release build
failed with fork/native-thread EAGAIN. The one-job attempt reaped its own
orphaned children and failed before compilation. PID 1 was not modified or
killed. A process reaper repair or isolated validation runtime is required.

After restoration, build the latest source, rerun release and fastdebug checks
including CheckUnhandledOops/VerifyOops, AOT/CDS, code-cache and archive tests,
then complete matched first-use/startup and warmed benchmarks without concurrent
builds. Diagnose the retained AArch64 mismatch before clearing that gate.
Tier2, exact final native AArch64 qualification and Windows AVX-512 execution
remain unqualified. Historical results do not qualify the latest image.
