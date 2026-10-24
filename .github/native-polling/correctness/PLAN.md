<!-- Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved. -->
# One native kqueue correctness run

Use only `.github/workflows/main.yml` on `qualify/native-kqueue-correctness-once`,
with the exact validation SHA. One Linux staging job gates one native `macos-26`
job in the same workflow run. Manual dispatch only; no matrix or retries. The Mac
job builds candidate `cf218dc255de70fcd52903e5d85ef4aef11b564c` once as fastdebug.
It contains the shared cached-registration reset repair, native selector batching
and attribution corrections, without Java queue deduplication.

## Complete harness staging and transfer

The Linux job checks out the official OpenJDK sources at these commits:

- jtreg `551e17adac0579859012c4c46318b8fa3cf2ff37`.
- JTHarness `9149bb776f4df5435a6f97d6bbf9b30af1086d5a`.
- AsmTools `30f96d5c7f24097c756b8360eccd137933f529fa`.

It downloads the exact checksum-pinned JDK17/Ant archives, four runtime JARs and
TestNG license listed in `downloads.json`, then runs the unchanged qualified recipe
`prepare-clean-jtreg.sh` with the unchanged `inputs.json`. No package installation,
source archive fallback, cache shortcut or retained harness binary is used. The
OpenJDK source checkouts must be clean and detached before and after the build.

The preparation recipe originated at `02e3c3be1bf529b0b682dc35dbd1fe67b58b6643`;
its SHA256 is `467cb100a70fade5687ae79c493e7a6fc76d7af6c211b4941bd359d395a51fdc`.
The committed `harness-manifest.json` is the original qualified input-provenance
anchor, SHA256 `78797074289179427d2522da5b199857c2db2645e6dd6423a8ecc2721ddf8dfb`.

Fresh JARs and archive timestamps can differ from the prior local build. The fresh
artifact is bound to the same qualified source commits, recipe and input digests;
byte reproduction of the old archive is neither required nor claimed. Record the
actual compiler/JDK/Ant/GNU make/Python identities, clean source trees, jtreg version
execution, release metadata and every output file hash.

Upload exactly `jtreg.tar.gz`, fresh `jtreg-manifest.json` and `build-receipt.json`
as one-day artifact `native-kqueue-clean-jtreg-20261024`. The receipt binds this
repository, workflow run/attempt, validation SHA, recipe, sources/tools and archive/
manifest hashes. Archive, manifest and receipt SHA256 values pass directly through
job outputs; the Actions artifact ID/envelope digest are recorded separately.

The Mac job downloads that same-run artifact and verifies the receipt hash, all
context/source/tool pins, archive/manifest digests, safe entries, all 21 files before
and after extraction, unchanged runtime JAR digests and clean release source metadata.
The Linux producer runs this same content verifier before upload. No manual staging
location, external run ID or private transfer endpoint is required.

### Separate Linux budget

The Linux hard cap is 15 minutes. All initialization, four source checkout actions,
seven downloads, builds, version execution and packaging share an absolute 10-minute
work deadline measured before checkout. A watchdog covers direct preparation work;
all supervised commands are clipped by the remaining deadline. Reserve 1 minute for
the input upload, 2 for always-run teardown/collection and 2 for selected-log upload.
Per-step maxima overlap that absolute work deadline; they do not extend it.

There are 13 supervised Linux commands: one GNU make version check, seven downloads,
one recipe build, three tool/harness version checks and one package/verify command.
The recipe itself builds JTHarness, AsmTools and jtreg using the qualified targets.
Require native Linux x86_64, Python 3.12+, ordinary GNU make 4.x/build utilities and
4 GiB free disk; no unmanaged installation. Source checkouts have separate bounded
Actions steps. A staging/setup/upload/collection failure prevents Mac allocation.

The one-day input payload is capped at 26 MiB: archive at most 24 MiB and each JSON
at most 1 MiB. Expect roughly 10 MiB based on the qualified build; record the actual
size instead of assuming identical output. JDK/Ant archives, extracted tool images,
build trees and caches are excluded from all uploads. Selected staging identities
and bounded logs retain 5 days under the same 128 MiB result cap described below.
The two sequential jobs consume at most 100 runner-minutes (15 Linux plus 85 Mac).

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
input artifact contains only the harness archive, manifest and build receipt. Always stop process groups
before collecting, including setup/build/test failures. Historical refs/evidence stay
separate and unchanged.
