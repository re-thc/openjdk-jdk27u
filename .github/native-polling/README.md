# One bounded native kqueue validation

One Linux prerequisite job gates one macOS job that builds and compares fixed source revisions. There are no push/PR triggers, matrices, reusable-workflow fanout or automatic retries.

## Sources and run contract

- Base: `8d030adbd245b19e6339e3ccd052eb7fe3635319`.
- Release baseline B: `a1d7a297b6a22d72bde8a051d6aa3a910cdcf77c`.
- Release/fastdebug candidate C: `28a8b6162eaf5b4584e9b5d66c28359a336aa831`.
- B changes only the cached-registration reset statement and copyright. C adds native batching. Neither arm contains Java queue deduplication, its pending marker, or the Linux eventfd change.
- The validation correction must be one CI-only child of `ef4eeb6d70db6404f84b3d211183a81c42b9c161`, followed by the frozen earlier validation and C; workflow input `expected_validation_sha` must equal its full expected SHA. Controller verifies ancestry, clean source, CI-only scope and untouched SelectionKeyImpl/Linux sources.

Use the registered `.github/workflows/main.yml` on `qualify/native-kqueue-macos-once`. First, `ubuntu-26.04` checks the Homebrew formula versions and fetches/verifies all three arm64 Tahoe bottles; it also downloads and verifies the pinned Mac BootJDK. It then follows ordinary CI's source-build route for jtreg: `openjdk/jtreg` tag `jtreg-8.3+1`, frozen at `551e17adac0579859012c4c46318b8fa3cf2ff37`, built with the installed JDK 17. The official build script verifies all dependency downloads against the release's checksums. Selected build-input and runtime-jar SHA-256 pins add checks against the reviewed inputs. Build metadata is fixed to `8.3-dev+1`; no byte-equivalence with a separately built distribution is asserted. No Mac runner is requested unless the complete prerequisite job succeeds.

The Linux job transfers only the built jtreg distribution and its source/file manifest through a separate one-day artifact, following ordinary CI's artifact route. Archive and manifest SHA-256 values pass directly between jobs; Mac verifies those values, source/version and every file before extraction. No external jtreg download occurs on Mac. Filtered prerequisite logs, hashes and results retain five days; downloaded bottles, BootJDK binaries, build trees and caches are excluded from those results.

The `macos-26` job checks native Darwin/arm64, standard build utilities, installed Xcode 26.6 (17F113), macOS SDK 26.5 and required Apple tools, including Metal. Xcode selection uses DEVELOPER_DIR without changing the system selection or downloading components. Like ordinary macOS CI, setup installs Homebrew's official `autoconf` and `make` formulae, including Autoconf's `m4` dependency. Formula and executable versions must be Autoconf 2.73, GNU make 4.4.1 and m4 1.4.21. Homebrew verifies downloads; automatic updates, unrelated upgrades and cleanup are disabled for these commands. Installation has a 120-second cap within the five-minute Mac setup phase. Compiler caching, coreutils and GTest are unnecessary. Mac repeats the pinned BootJDK download/hash check; temporary remote failures stop the run without fallback or retry.

CI checkout is shallow depth 6, sufficient for the three validation commits -> C -> B -> base. It remains untouched. A separate detached worktree builds B release, preserves its complete image locally, switches to C for an incremental release build, then builds C fastdebug in a separate configuration. Both release configurations are identical, including fixed version suffix and no native debug symbols. A differing release VM hash blocks further builds/timing. Fastdebug baseline and full test-image builds are unnecessary. The pinner helper is compiled once; benchmark classes are compiled once by C and reused on both release images.

## Exact limits

The prerequisite job has a 15-minute hard cap and a ten-minute work deadline measured before checkout, leaving five minutes for transfer, collection and upload. It runs once, with no cache shortcut or retries. The Mac limits below are unchanged; the two sequential jobs consume at most 165 runner-minutes in total, with Mac skipped on prerequisite failure.

| Component | Maximum minutes |
| --- | ---: |
| Checkout | 5 |
| Get verified jtreg transfer | 2 |
| Preflight/dependencies | 5 |
| B release build/copy/hash | 40 |
| Incremental C release build/copy/hash | 10 |
| C fastdebug build/copy/hash | 40 |
| Correctness, native diagnostics, harness compilation | 20 |
| All measurements, launches, setup and teardown | 15 |
| Metadata/bookkeeping allowance | 3 |
| Final cleanup / artifact upload | 2 / 8 |

Stage caps total 130 minutes. Checkout, prerequisite transfer and bookkeeping give the 140-minute work deadline, measured from before checkout. Mac job hard cap is 150 minutes; the remaining ten minutes are reserved for always-run teardown/upload. Stage and command deadlines can only shorten the remaining global budget. A failure/timeout stops work; nothing is silently shortened, extended or rerun. External runner termination or an upload-service failure can still prevent artifact completion; the reserved collection steps are best effort under that infrastructure limitation.

## Correctness plan

On B/C release run 13 shared selector/datagram source programs and SelectorOps default/poller-mode descriptions (default plus modes 1/2/3). Existing declared configurations remain intact; Windows-only descriptions are inapplicable. Each shared invocation is capped at three minutes, with all correctness work collectively capped at twenty.

Run KQueueBatchUpdates five times on each of three images (15 runs), KQueueRegistration once on C release/fastdebug (2 runs), and five selected race/reset/wakeup programs on fastdebug. Record actual jtreg/framework counts from reports, including skips. Enable Java/system assertions for correctness only.

Compile/run two isolated ASan/UBSan native diagnostics, each with a 60-second execution cap. The fault probe links actual KQueue.c to deterministic kevent/JNI stubs. The real Darwin probe runs 2,000 64-change ADD/DELETE cycles under SIGUSR1, then error-followed-by-valid-change and close/reuse checks. Its handler belongs only to its standalone process, never the JVM. It reports actual syscall/receipt EINTR counts; zero observed EINTR is not proof that those paths were forced. Replayed completed deletes may report ENOENT; the probe accepts this idempotent outcome and verifies final absence.

## Measurement plan and overhead accounting

Four main cases retain real local TCP traffic and complete payload validation: stable READ interest (64 connections, 1 KiB), one changed filter per select (one connection), bulk READ/WRITE updates (137 connections), and backpressure (64 connections, 128 KiB bounded writes, requested 16 KiB send buffers, 5 ms peer read pauses).

Each main case has 4 balanced pairs: 16 pairs / 32 JVMs, each 2 s warmup plus 6 s measurement. Four short controls cover exactly 63, 64 and 65 single-filter changes plus selector construction: another 16 pairs / 32 JVMs, each 1 s warmup plus 2 s measurement.

Total: **32 pairs / 64 fresh JVMs**, with **352 seconds of fixed windows**. Main/control whole-command caps are 16/8 seconds, including the supervisor launch, JVM startup, connection setup, warmup, measurement, drain and JVM exit. Their sum is 768 seconds; 64 group teardowns add about 13 seconds (0.2 s each), leaving roughly 119 seconds for controller bookkeeping within the hard 900-second measurement phase. The cap is enforced; the campaign fails rather than adapting durations or dropping cases.

Cases rotate across rounds; every case has two AB and two BA pairs. Exact harness bytes, image/source identities and socket-buffer observations are retained. A paired socket-buffer/input mismatch stops the campaign. No build/test runs overlap timing. Records include completed warmup and measurement phases, histograms (reported quantiles are upper bounds), CPU/byte, main-thread allocation, operations, payload checksum, filter changes, induced partial writes, complete JVM process duration and controller elapsed time. Preserve every trial and failed/unmatched arm; failed pairs do not enter complete-pair summaries. No outlier deletion or automatic win gate exists. This is preliminary host-specific qualification, not a universal speed claim.

## Teardown and retained evidence

Each command gets a separate supervised process group. Its leader catches TERM and stays alive until KILL, preventing PID reuse during cleanup. Controller keeps the leader unreaped until TERM/KILL completes, masks cancellation while cleaning, and records active PID/start identities atomically. Timeout, nonzero exit and controller cancellation all terminate child/grandchild groups. Always-run cleanup checks process identity before signaling a surviving recorded group.

The evidence directory exists before checkout. Setup/build failures retain phase/status records, command stdout/stderr and any configuration files. An always-run collection step works even without a checkout, and still writes collection status if controller cleanup fails. The hosted export includes command logs/results, jtreg text/HTML reports, selected source snapshots, raw commit payloads, input/binary identities, image hash manifests and observations. Complete JDK images, compiled classes, native binaries/helpers, build specs and process-control state remain outside the hosted export. Runtime binaries stay in the runner-local build workspace for the job lifetime; existing local/private images are unaffected. Runtime test-source snapshots and hashes use an explicit 11-file allowlist; the final artifact exporter also uses fixed root-file and typed result-directory allowlists; documentation, reviews, development notes and test-tool caches are excluded. Environment metadata is limited to source/run identifiers, runner OS/architecture/image version, and selected tool/SDK version reports. Hosted artifact retention is five days, with compression disabled to reduce upload CPU. Do not place secrets or raw environment dumps in evidence.

Run the registered `main.yml` workflow on `qualify/native-kqueue-macos-once`, supplying its full commit SHA as `expected_validation_sha`. The artifact name includes the run ID and source SHA; retention is five days. Native Mac results are produced only by the workflow, not by local Linux controller checks.
