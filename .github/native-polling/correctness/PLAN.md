<!-- Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved. -->
# One native kqueue correctness run

Use only `.github/workflows/main.yml` on `qualify/native-kqueue-correctness-once`,
with the exact validation SHA and a completed jtreg staging run ID. The workflow
has one native `macos-26` job, manual dispatch only, no matrix and no retries.
It builds candidate `cf218dc255de70fcd52903e5d85ef4aef11b564c` once as fastdebug.
The candidate contains the shared cached-registration reset repair, native selector
batching and attribution corrections. There is no queue deduplication.

## Verified harness transfer

Before dispatch, stage exactly `jtreg.tar.gz` and `jtreg-manifest.json` as the
one-day Actions artifact `native-kqueue-clean-jtreg-20261024` in this repository.
Staging and its completed run ID are prerequisites, not supplied by this workflow.
Do not rebuild or substitute the verified pair.

- Archive: 10,214,570 bytes; SHA256
  `3e6696fca570ec2d8d0781d4b4d550d0e30b8414300cd6a6f507a5f2eb8b8697`.
- Manifest: SHA256
  `78797074289179427d2522da5b199857c2db2645e6dd6423a8ecc2721ddf8dfb`.
- The committed manifest is byte-identical. It records all source pins, build
  inputs and 21 distribution files. The consumer verifies whole-file hashes, safe
  archive entries, every file before/after extraction and clean release metadata
  `SOURCE=git:551e17adac05`. Links, duplicates and extra files are rejected.

The source-built harness uses jtreg `551e17adac0579859012c4c46318b8fa3cf2ff37`,
JTHarness `9149bb776f4df5435a6f97d6bbf9b30af1086d5a` and
AsmTools `30f96d5c7f24097c756b8360eccd137933f529fa`. All were clean detached checkouts.
The preparation recipe identity is `02e3c3be1bf529b0b682dc35dbd1fe67b58b6643`.
No harness dependency acquisition or compilation occurs in the Mac job.

## Runtime prerequisites and limits

Require native Darwin arm64, Python 3.12+, 12 GiB free disk, Xcode 26.6 (17F113),
macOS SDK 26.5 and the complete standard build-tool preflight. Use installed Xcode
via `DEVELOPER_DIR`; require compiler/linker/Metal tools without downloading Xcode
components. Normal official Homebrew installation supplies Autoconf 2.73, GNU
make 4.4.1 and m4 1.4.21, with normal trust and a 120-second installation cap. Disable
auto-update, unrelated upgrades and cleanup; compiler caches/GTest are unnecessary.
The process open-file soft limit rises to 4096 within its existing hard limit;
require at least 2048 for unmodified upstream tests. Use at most 3 build jobs.

Download only the official Java 26 Darwin arm64 BootJDK URL frozen in the controller;
verify SHA256 `254586bcd1bf6dcd125ad667ac32562cb1e2ab1abf3a61fb117b6fabb571e765`.
Use data-filtered extraction and discover the executable/release home by identity,
without assuming bundle directory spelling. No download fallback or retry.

| Work | Maximum minutes |
| --- | ---: |
| Checkout / harness transfer | 5 / 2 |
| Native setup | 5 |
| One fastdebug configure, image build, copy and hash | 40 |
| Tests, helper builds and native diagnostics combined | 20 |
| Initialization and bookkeeping | 3 |
| Always-run teardown / artifact upload | 2 / 8 |

The work deadline is 75 minutes, starting before checkout. Phase/command deadlines
only shorten it. Workflow step caps total 85 minutes including initialization and
collection; the job hard cap is 85 minutes. No release/baseline builds or timing
workloads. Infrastructure termination or upload failure can prevent final delivery.

## Exact correctness workload

Run 21 sequential jtreg invocations with Java/system assertions, concurrency 1 and
unchanged declared configurations: 13 shared selector/datagram programs, both
SelectorOps default/poller-modes descriptions, 5 KQueueBatchUpdates repeats and
1 KQueueRegistration. They contain 26 applicable declared run actions; two further
Windows-only descriptions are inapplicable. Preserve actual framework counts/skips
and command/JTR status. Harness/test/compiler JVM forks are controlled by jtreg and
the test descriptions; 21 is not a total JVM count. Each invocation has an outer
180-second cap inside the shared 20-minute phase; incomplete work fails.

Helpers: 1 native pinner-library compilation, 1 candidate-javac JNI-header compilation,
2 ASan/UBSan diagnostic compilations and 2 diagnostic executions capped at 60 seconds
each. Explicit non-test Java launches are BootJDK/harness/candidate version, in
addition to 21 harness launches. No benchmark classes. Sanitizer errors halt execution.

The deterministic 6414-case probe links actual KQueue.c to JNI/kevent stubs. The real
Darwin probe runs 2000 mixed 64-change add/delete cycles with SIGUSR1, recording
signals, syscall/receipt EINTR, error-followed-by-valid changes and close/fd reuse.
Zero observed EINTR is not proof of forced interruption. Java tests cover readiness
preservation, mixed filters, more than 64 updates, UDP zero-interest disconnect/
re-enable, cancellation, close and wakeups. These are correctness checks.

## Evidence and output bounds

Capture stdout/stderr separately, capped at 8 MiB each (32 MiB each for image build),
also clipped by the 128 MiB aggregate command-log budget. Overflow stops the command
and marks failure. JTR/text files are limited to 8 MiB each. The selected artifact is
capped at 128 MiB; omissions are recorded and make collection fail. No console stream
of full command logs.

Retain source/image/harness/helper identities, actual generated command plan,
bounded logs/receipts, phase/final status, JTR/text results and runtime test sources
for 5 days. Exclude JDK/harness images, binaries/classes, build specifications, raw
environment dumps, private process registry, notes and review journals. The one-day
input artifact contains only the harness archive/manifest. Always stop process groups
before collecting, including setup/build/test failures. Historical refs/evidence stay
separate and unchanged.
