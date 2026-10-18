# Local Linux AArch64 execution plan for independent review

**Publication authorizes source review only. None of the commands below authorize a diagnostic or timed run.** After final approval, the local agent executes them inside Harry's retained native Linux AArch64 VM. Keep its volume, images and results; do not transfer images, logs or receipts to the cloud workspace. Native macOS is not the selected ABI. Restarting the retained VM is allowed before preparation starts; restarting or pausing it during an admitted attempt stops that attempt.

## Identities and limits

| Input | Exact identity |
| --- | --- |
| Product baseline | `02324e6bd026411407983df06284cd79460c33f6` |
| Product candidate | `b67cf2421d5dca1df4d9759003e1983a1b810f86` |
| Runtime/test code within candidate | `2378c7becb2d585aecf410163657fc59d12e59c6`; later candidate commits only change docs |
| Review harness | This Git commit's `.github/ffm/performance-decision-216/`; pin its full commit SHA and `SOURCE_FILES.json` SHA256 before execution |
| `Probe.java` | SHA256 `1fa0a03a924f31dbeb6569cec5f212936e0704c1ba945728a7e7a4a99b015cf1` |
| `Steady.java` | SHA256 `f44396ef7a62c6a6eb447a5f2246aeeac35ea57d96281f924ec60b58a38a9cc7` |
| `native.c` | SHA256 `68cfd3bfa8a5641475b4f342d45f5c3a1879bff6e150c857b73a940e7405acd2` |
| `configure-dev`, both product pins | SHA256 `0f38d9f758a1ddd5cc1d97c4ecc063fb35c4b0b50a6631bc070901efc9b27039` |
| Generated class bytes | 1,314 bytes; SHA256 `ccffb3898eb9adfbdd22912989a46859247c05bc65c32b89624f103d3e4d5d34`; CRC32 `1243521826`; two ABI entries |
| Build tools | Existing Linux AArch64 Boot JDK26+35, GCC16.0.1 and mold3.0.0, with full local hashes; no ccache |
| Allocation | Retain existing native 10-vCPU/11-GB VM; no emulation or resizing; one admitted CPU for Java children |

`SOURCE_FILES.json` pins every Python/Java/C source, this runbook, README, proposal, schedule and offline-validation receipt. It pins sources, not unbuilt class/native-library hashes. Compile the common harness once below; its actual artifact hashes join the execution bindings. `control` always uses the same baseline image path and bytes as `base`.

Overall budget: **150 active executor minutes and at most 150 elapsed minutes** from the first preparation operation to terminal sealing. Use no more than 85 minutes for retained-file audit, one normal baseline build, common harness compilation, all untimed diagnostics and final input review; 60 minutes for the campaign including collector I/O/snapshots/analysis; five minutes reserved for post-collection hashes, reporting and cleanup. Waiting for the initial approval is outside this budget. There is no pause/resume or fresh allowance after an error. Existing 10-vCPU allocation gives an absolute allocation ceiling of 25 vCPU-hours; record actual child/build CPU where available. No second baseline build or automatic candidate rebuild. A build gets at most 45 minutes and the remaining preparation budget. Six retained diagnostic children plus at most two attribution children each get 180 seconds within that preparation budget. Cleanup and artifact sealing consume the same overall budget. Uninterruptible OS/I/O stalls must be reported as overruns or cleanup-pending, never accepted data or extra time.

## 1. Bind the retained files before building

The local agent identifies these existing paths from the retained volume and its build/test logs, then records them as absolute paths in a local `RETAINED_INPUTS.json`. Do not guess paths, values or hashes. The example variables below name that record's fields; they are not suggested locations to overwrite.

```sh
set -euo pipefail
export FFM_REPOSITORY=/absolute/path/to/retained/git/repository
export FFM_CANDIDATE_SOURCE=/absolute/path/to/retained/candidate/source
export FFM_CANDIDATE_BUILD=/absolute/path/to/retained/release/build/directory
export FFM_CANDIDATE_IMAGE=/absolute/path/to/retained/release/images/jdk
export FFM_REQUIRED_JTR=/absolute/path/to/retained/DowncallTemplateTest_templates-required.jtr
export FFM_BOOT_JDK=/absolute/path/to/retained/linux-aarch64/jdk26
export FFM_JTREG=/absolute/path/to/retained/jtreg/installation
export FFM_CC=/absolute/path/to/retained/gcc
export FFM_CXX=/absolute/path/to/retained/g++
export FFM_MOLD=/absolute/path/to/retained/mold
export FFM_REVIEW_COMMIT=FULL_40_CHARACTER_REVIEW_COMMIT_FROM_THE_REMOTE_GIT_LINK
export FFM_REVIEW_ROOT=/new/absolute/path/for/review/worktree
export FFM_BASE_SOURCE=/new/absolute/path/for/baseline/worktree
export FFM_ATTEMPT_ROOT=/new/absolute/path/for/local/attempt/records

# Start the single wall/active preparation allowance before checkout/audit.
python3 - <<'PY'
import json, os, pathlib, time
root = pathlib.Path(os.environ['FFM_ATTEMPT_ROOT'])
root.mkdir()
start = time.monotonic_ns()
(root/'budget.json').write_text(json.dumps(dict(start_monotonic_ns=start,
    preparation_deadline_ns=start+5100_000_000_000,
    overall_deadline_ns=start+9000_000_000_000,
    boot_id=pathlib.Path('/proc/sys/kernel/random/boot_id').read_text().strip()), indent=2)+'\n')
PY

git -C "$FFM_REPOSITORY" fetch --no-tags origin codex/ffm-startup-diagnostic-20261014
git -C "$FFM_REPOSITORY" cat-file -e "$FFM_REVIEW_COMMIT^{commit}"
git -C "$FFM_REPOSITORY" worktree add --detach "$FFM_REVIEW_ROOT" "$FFM_REVIEW_COMMIT"
export FFM_KIT="$FFM_REVIEW_ROOT/.github/ffm/performance-decision-216"
git -C "$FFM_REVIEW_ROOT" rev-parse HEAD
sha256sum "$FFM_KIT/SOURCE_FILES.json"
```

Verify the full review commit rather than following a moving branch. The diagnostic branch's product tree is not either measured product source. No command in this plan builds that diagnostic tree. The source-review publication uses GitHub's [documented push-skip directive](https://docs.github.com/en/actions/how-tos/manage-workflow-runs/skip-workflow-runs), `[skip ci]`; do not push another diagnostic commit or invoke its existing historical workflow.

Required reuse checks, using the retained files rather than the abbreviated report:

| Retained evidence | What the local agent verifies | Reuse is invalid when |
| --- | --- | --- |
| Candidate source/build receipt and configure/build logs | Clean exact b67 source at build time; normal release `bin/configure-dev`/`make images` succeeded; target Linux/aarch64 | Wrong/dirty/unbound source, fastdebug image substitution, missing successful build provenance |
| Original image/module/native/CDS hashes | Rehash current image and compare with the hashes retained for that tested image, including all symlinks/files | Hash or file-set mismatch; computing a new hash alone does not recover missing historical linkage |
| Required-mode JTR and its original test command/JDK path | Result Passed; exact line `DOWNCALL_TEMPLATE_PASS checks=63 selected=true platform=linux-aarch64`; no unsupported-host fallback; test JDK binds to the retained image/its hashes | Missing/failed JTR, selected=false, native macOS fallback, different unlinked test image |
| `spec.gmk`, configure log and original configure argv | Actual release profile, tools, flags, disabled ccache, native debug-symbol mode, target and resolved build/version metadata | Missing/unresolved values, profile/ISA/toolchain mismatch, hidden warning override or differing compilation settings |
| Generated-template cache/install evidence | Matching installed metadata/resource/source ID and two ABI entries; extract class payload and verify length/hash/CRC above; resource bundle includes its own source ID | Missing/stale assets, payload mismatch, source/compiler/target binding mismatch |
| Boot JDK/GCC/G++/mold/JTreg files and receipts | Full local hashes and actual versions; jtreg from official tag 8.2.1+1 reports `8.2.1-dev+0` as originally recorded | Tool identity/version changes or guessed replacements |

The accepted correctness report remains accepted if image reuse fails. A failed reuse check stops this preparation with its exact reason; it does not authorize rebuilding the candidate, repeating correctness, changing flags or retrying a cohort. A source checkout that later moved is usable as a Git object store only; its current HEAD is not proof of the older image's source. No full foreign-suite repeat is planned.

Run these read-only inspections and preserve their output locally:

```sh
git -C "$FFM_CANDIDATE_SOURCE" rev-parse HEAD
git -C "$FFM_CANDIDATE_SOURCE" status --porcelain=v1
sha256sum "$FFM_CANDIDATE_SOURCE/bin/configure-dev" \
  "$FFM_CANDIDATE_BUILD/spec.gmk" "$FFM_REQUIRED_JTR"
sha256sum "$FFM_BOOT_JDK/bin/java" "$FFM_BOOT_JDK/bin/javac" \
  "$FFM_BOOT_JDK/lib/modules" "$FFM_CC" "$FFM_CXX" "$FFM_MOLD"
```

Use ordinary Python reads to record the complete relevant assignments from `spec.gmk`: `OPENJDK_TARGET_OS/CPU/CPU_ENDIAN/CPU_BITS`, `JVM_VARIANTS`, `JVM_FEATURES`, `DEBUG_LEVEL`, `CC/CXX/LD`, all C/CXX/LD flags, `CCACHE`, native-debug-symbol settings, `SOURCE_DATE`, `SOURCE_DATE_EPOCH`, `HOTSPOT_BUILD_TIME`, all `VERSION_*`, `USERNAME`, `WORKSPACE_ROOT`, `OUTPUTDIR` and `ALLOW_ABSOLUTE_PATHS_IN_OUTPUT`. Preserve the complete original file/hash, not just a filtered summary.

Before baseline configure, the agent creates and independently checks `MATCHED_CONFIGURE.json` from those existing facts. Its fields are `conf_name`, `jobs` (at most 10), `source_date` (resolved candidate epoch as decimal string), `build_user`, `version_opt`, and `caller_args` (the exact original `configure-dev` caller argv, including absolute Boot JDK/jtreg paths and all explicit configure flags). Add `tool_env`, containing the retained tool-search `PATH`, absolute resolved `CC/CXX/LD`, and any original `CFLAGS/CXXFLAGS/CPPFLAGS/LDFLAGS/CONFIGURE_DEV_NO_MOLD` environment values. Missing flag-environment values are removed rather than inherited accidentally. Add absolute `mold_path` and `tool_files` (path-to-SHA256 map), including the resolved compilers/linker/mold, their compiler support directories/packages, assembler/binutils and relevant headers/libraries. The map must come from the retained tool installation, not assumed executable names. Preserve package manifests if the full support tree is represented by a receipt. Resolve GCC's `cc1`, assembler and selected linker from those original compiler/toolchain records.

`caller_args` must use the same conf name in the fresh worktree. `baseline_replay.py` replaces any source-date/user/version-opt/conf-name caller values with the *retained resolved values* and appends disabled ccache; it preserves other options. In particular, an original `--with-source-date=current` must not override the saved epoch. The explicit `tool_env` drives configure and make; `FFM_CC` by itself would not pin the configure toolchain. Resolved metadata values are replayed to preserve candidate settings, not selected to obtain favorable timings. If they cannot be determined, stop before building.

`bin/configure-dev` supplies `-march=armv8.2-a -mtune=generic`, mold and GC/headless defaults. Its ccache detection is automatic; an explicit final `--disable-ccache` preserves the reported disabled state. Same command text alone is insufficient: configure-time `SOURCE_DATE` and workspace-derived default version strings reach libjvm. Path-only source/output-directory differences are allowed only when both configurations show `ALLOW_ABSOLUTE_PATHS_IN_OUTPUT=false`, matching GCC debug-prefix maps for source/output and macro-prefix map for source. Preserve all other resolved values. These implementation points are in `make/autoconf/jdk-options.m4`, `jdk-version.m4`, `hotspot.m4`, `flags-cflags.m4`, and `make/hotspot/lib/CompileJvm.gmk` at the product pins.

## 2. Build one ordinary matched baseline and common harness

```sh
git -C "$FFM_REPOSITORY" worktree add --detach "$FFM_BASE_SOURCE" \
  02324e6bd026411407983df06284cd79460c33f6
git -C "$FFM_BASE_SOURCE" diff --exit-code
git -C "$FFM_BASE_SOURCE" diff --cached --exit-code
export FFM_MATCHED_CONFIG=/absolute/path/to/verified/MATCHED_CONFIGURE.json
```

The following is the full configure/build invocation. The named process supervisor is **GNU coreutils `timeout` in its default process-group mode**, without `--foreground`; the local agent waits for that supervisor and retains its PID/status. The retained VM's init/reaper owns any orphaned descendants. The allowance below includes five seconds for TERM/KILL escalation and fits both 45 minutes and the remaining 85-minute preparation budget. A timeout/failure is terminal. Do not run it during collection.

```sh
python3 - <<'PY'
import json, os, pathlib, subprocess, sys, time
root = pathlib.Path(os.environ['FFM_ATTEMPT_ROOT'])
budget = json.loads((root/'budget.json').read_text())
assert budget['boot_id'] == pathlib.Path('/proc/sys/kernel/random/boot_id').read_text().strip()
seconds = min(2700, (budget['preparation_deadline_ns']-time.monotonic_ns())//1_000_000_000)-5
assert seconds > 0, 'STOP: preparation allowance exhausted'
argv = ['timeout', '--signal=TERM', '--kill-after=5s', str(seconds)+'s', sys.executable,
        str(pathlib.Path(os.environ['FFM_KIT'])/'baseline_replay.py'),
        '--source', os.environ['FFM_BASE_SOURCE'], '--config', os.environ['FFM_MATCHED_CONFIG'],
        '--logs', str(root/'baseline-build')]
with (root/'baseline-supervisor.log').open('xb') as log:
    process = subprocess.Popen(argv, stdout=log, stderr=subprocess.STDOUT)
    record = dict(pid=process.pid, command=argv, owner='local agent + GNU timeout + retained VM init')
    (root/'baseline-supervisor.json').write_text(json.dumps(record, indent=2)+'\n')
    record['exit'] = process.wait()
    (root/'baseline-supervisor.json').write_text(json.dumps(record, indent=2)+'\n')
    assert record['exit'] == 0, 'STOP: baseline failed/timed out; no retry'
PY
```

`baseline_replay.py` retains exclusive `configure.log`, `images.log` and command/tool-environment receipts. Preserve all failed logs and inspect the recorded timeout process group plus adopted descendants after success/failure. The local agent must verify cleanup with the VM init/reaper; unresolved live/zombie ownership stops preparation and is reported with PIDs. A KILL status, missing terminal status or delayed OS/I/O cleanup is not success. This is a named procedural ownership contract with a process-group timeout, not a guarantee that Linux can terminate uninterruptible I/O. Recheck both actual specs and every native-library hash after the normal build. A difference is unresolved until explained from source/configuration; **this run does not allow normalization, native-library swapping, image assembly or a second build to force equality**. If native hashes differ, stop before diagnostics/timing.

Set `FFM_BASE_IMAGE` to that build's `images/jdk` (replace the conf placeholder with the verified `MATCHED_CONFIGURE.json` value) and use one shared harness. Run shell blocks in the same Bash session or retain only these explicit `FFM_*` bindings between steps:

```sh
export FFM_BASE_IMAGE="$FFM_BASE_SOURCE/build/EXACT_CONF_NAME_FROM_MATCHED_CONFIG/images/jdk"
mkdir "$FFM_KIT/classes"
timeout --signal=TERM --kill-after=5s 120s "$FFM_BASE_IMAGE/bin/javac" \
  -d "$FFM_KIT/classes" "$FFM_KIT/Probe.java" "$FFM_KIT/Steady.java"
timeout --signal=TERM --kill-after=5s 120s "$FFM_CC" -O2 -fPIC -shared -pthread \
  "$FFM_KIT/native.c" -o "$FFM_KIT/libprobe.so"
sha256sum "$FFM_KIT/classes/Probe.class" "$FFM_KIT/classes/Steady.class" "$FFM_KIT/libprobe.so"
```

Record the exact javac/GCC commands and hashes, source hashes, and complete classes tree. Do not start either command unless its allowance plus cleanup fits the remaining preparation budget. `-O2 -fPIC -shared -pthread` matches the historical native-harness build command; the native library is compiled once and shared by both images. Its actual SHA256 is unrelated to the generated class payload SHA256 above. Build-tool JVM invocations are preparation processes, not additional benchmark/diagnostic forks; they consume the same 85-minute allowance.

## 3. Fixed untimed evidence before collection

Create local `PREPARED_PATHS.json` containing the real `paths` object (`base` and `template` absolute bin/java; `classes`; `native`), the one fixed `cpu`, and `diagnostic_output_directory`. Select that CPU once from the verified Linux affinity/cpuset intersection; do not inherit cloud CPU0, search for a favorable CPU, or reselect after an error. All diagnostics below run inside the same native Linux VM as their parent collector. They consume the preparation budget and cannot be retried with different warmup/flags.

The complete six-child command set is generated from the same source as the timing commands. No control duplicate is needed: control is the same baseline image. Each child uses the fixed counts (C2 1,000,000; C1 100,000), 30 warm batches and ten diagnostic samples. Samples are preserved as **untimed diagnostic data**, never pooled with performance data.

```sh
cd "$FFM_KIT"
export FFM_PREPARED_PATHS=/absolute/path/to/PREPARED_PATHS.json
python3 - <<'PY'
import json, os, pathlib, time
from child_collector import collect_child
from accounting_contract import resolve_leaf_candidate, verify_direct_membership
from decision import command
from measure_once import snapshot
cfg = json.loads(pathlib.Path(os.environ['FFM_PREPARED_PATHS']).read_text())
out = pathlib.Path(cfg['diagnostic_output_directory'])
out.mkdir()                       # exclusive: preserve any previous attempt
budget = json.loads((pathlib.Path(os.environ['FFM_ATTEMPT_ROOT'])/'budget.json').read_text())
assert budget['boot_id'] == pathlib.Path('/proc/sys/kernel/random/boot_id').read_text().strip()
deadline = min(budget['preparation_deadline_ns'], time.monotonic_ns()+6*180*1_000_000_000)
assert deadline > time.monotonic_ns(), 'STOP: preparation allowance exhausted'
def observe():
    start = time.monotonic_ns()
    raw = snapshot()
    candidate = resolve_leaf_candidate(pathlib.Path('/proc/self/cgroup').read_text(),
                                       pathlib.Path('/proc/self/mountinfo').read_text())
    verify_direct_membership(candidate, os.getpid(),
                             pathlib.Path(candidate['path'], 'cgroup.procs').read_text())
    assert candidate['mount_root'] == '/', 'STOP: hidden accounting ancestors'
    current, counters = pathlib.Path(candidate['path']), {}
    while True:
        counters[str(current)] = {name: ((current/name).read_text() if (current/name).exists() else None)
                                  for name in ['cpu.stat', 'cpu.max', 'cpuset.cpus.effective']}
        if current == pathlib.Path(candidate['mountpoint']): break
        assert pathlib.Path(candidate['mountpoint']) in current.parents
        current = current.parent
    return dict(monotonic_start_ns=start, monotonic_end_ns=time.monotonic_ns(),
                snapshot=raw, cgroup=candidate, counters=counters)
for image in ['base', 'template']:
    for cell in ['c2-unbound', 'c2-bound', 'c1-unbound']:
        stem = out / (image + '-' + cell)
        slot = dict(cell=cell, label=image)
        argv = command(slot, cfg['paths'])
        argv[1:1] = ['-Dsteady.diagnostic=true', '-XX:+UnlockDiagnosticVMOptions',
                     '-XX:+LogCompilation', '-XX:LogFile=' + str(stem) + '.xml',
                     '-Xlog:cds=info:file=' + str(stem) + '.cds.log:uptime']
        before = observe()
        row = collect_child(argv, cfg['cpu'], deadline,
                            pathlib.Path(str(stem)+'.stdout'), pathlib.Path(str(stem)+'.stderr'),
                            diagnostic_output=True)
        after = observe()
        pathlib.Path(str(stem)+'.host.json').write_text(json.dumps(dict(before=before, after=after), indent=2)+'\n')
        pathlib.Path(str(stem)+'.json').write_text(json.dumps(row, indent=2)+'\n')
        if 'error' in row or row['returncode'] != 0:
            raise SystemExit('STOP: invalid untimed child; no retry')
PY
```

The local agent owns cleanup and the *remaining overall preparation deadline* from `budget.json`; the command does not reset that allowance to its 18-minute child ceiling. From the six XML/marker records verify actual active `Steady.callsUnbound`/`callsBound` C1 level1 or C2 level4 compilations before the `DIAGNOSTIC_WARMED uptime_ms` marker, without an intervening not-entrant event. OSR compilation is identified as such. Policies alone do not satisfy this check. Verify each image's own default CDS archive was mapped and ordinary sharing was active; do not change CDS flags after inspecting results. Freeze raw logs, exact argv and image identities in the six receipts.

Use those actual children/witnesses and the paired host observations to establish direct-child wait4 accounting, PID/TID affinity, same VM/PID/mount/cgroup namespaces, selected `/proc/stat` CPU mapping and tick units, scoped counter deltas, all applicable visible ancestor quotas/effective cpusets, and absence of concurrent builds/tests/input writes. A single in-child snapshot proves visibility only; it cannot establish interval arithmetic. Preserve enclosing monotonic bounds and both counter snapshots, account for tick granularity/asynchronous updates, and report any remaining contradiction rather than guessing a correction or attributing delay. Any unresolved scope/counter contradiction stops admission. Neither source tests nor a self-asserted boolean substitutes for these observed records. No additional calibration loop or standalone five-second provenance probe is planned.

If attribution is needed, the only additional two child commands are one per image, with the same common flags/CPU/classpath and `Probe i` without `warm`, adding `-Xlog:class+init=info:file=ABSOLUTE_LOG:uptime`. Use `collect_child` without `diagnostic_output=True` for these Probe commands. They answer class initialization only, not a native-inline or PC-address cause. Six retained plus two attribution children is an absolute eight-diagnostic ceiling.

## 4. Seal the reviewable execution inputs

Use `inputs.py`'s checked schema and the actual retained/new files to create `EXECUTION_BINDINGS.json` plus referenced local evidence JSON records. These records extract verified facts; they do not invent PASS or copy the synthetic test fixtures. Include both complete image trees, modules, every `.so`/`.so.*`, every default CDS archive, source/build/tool/config receipts, generated-template identity, classes/native-library build identity, accepted correctness/JTR image linkage, six caller diagnostics and actual host admission. Copy the unchanged initial `budget.json` to `evidence/overall-budget.json` inside the local kit and reference its real hash as `evidence.overall_budget`; its boot ID must equal actual host admission. Preserve the original and do not rewrite start/deadlines. `get_budget()` checks that receipt, the runner refuses a timing launch after minute85, and the final hash/status phase must finish by minute150. Preserve raw files and pin their full hashes inside the reviewed receipt records. Candidate/base modules differ; CDS hashes may match; native file sets/hashes must match exactly. The base/control paths must be identical.

The parent first completes independent review of this exact Git source plan. The eventual execution grant must explicitly cover the one conditional attempt and this checked input-binding procedure. Under that grant, the local agent verifies the concrete files, freezes their real hashes, and records the grant's identity plus those hashes in `LAUNCH_REVIEW.json` before timing. Its human reviewer names the authorizing person; it must not claim they independently inspected a hash they have not seen. No extra approval is required solely because expected runtime artifact hashes become known during approved preparation. If the grant does not cover the binding procedure, stop for the remaining execution gate rather than inventing authorization. No such execution grant is supplied by this source-publication message.

The record binds `EXECUTION_BINDINGS.json`, `PROPOSAL.json`, `SCHEDULE.json` and `SOURCE_FILES.json` by hash. The source manifest and schedule are not edited to grant approval; the reviewed proposal remains DRAFT source. Supply the parent a concise actual source/image/tool/config/host identity summary and preserve full local receipts. No image/receipt transfer to the cloud is required.

```sh
cd "$FFM_KIT"
python3 -m unittest -q test_decision test_child_collector test_campaign test_inputs test_baseline_replay test_budget
sha256sum PROPOSAL.json SCHEDULE.json SOURCE_FILES.json EXECUTION_BINDINGS.json
# After, and only after, the independent execution approval is recorded:
python3 observe_return.py
```

`measure_once.py` fails before creating `run/` if review, identities, source files, actual host/CPU admission, original budget or runtime paths are invalid. It checks exact schedule structure/hash, environment injection, current boot/namespace/cgroup/affinity and admitted ancestor limits. Each child is checked against admitted limits and executable identity. `run/` is an exclusive one-shot marker, not resumable. Start the preparation clock only when the needed execution grant exists; after it starts, questions and delays consume its allowance. Stop if a required gate cannot finish in time, with no measured attempt; do not silently carry time allowances across days.

## 5. Fixed decision and terminal handling

`SCHEDULE.json` contains 108 startup slots (empty/framework/int, default tiered), then 36 C2 constant-unbound slots, then 72 conditional slots (C2 constant-bound/C1 level1 constant-unbound). Every condition has 12 paired blocks and all six label permutations twice. Base/control/candidate are adjacent within a paired cell. No re-randomization occurs during execution.

The primary minimum is 144 forks. Invalid forks, failed controls or consistent slowdowns stop all later stages. A non-held but inconclusive startup stage may still answer the independent C2-unbound question. The final 72 slots run only after both primary stages resolve favorably. Startup favorability requires comparator/candidate intervals wholly above1 for int process wall, process CPU and first invocation against both labels; retained C2 requires both wall/thread-CPU intervals above1. A construction-only gain cannot qualify end-to-end improvement.

Original controls remain point ratio 0.95–1.05 and entire 95% CI 0.90–1.10. Add the same control to int `first_ns`. Preserve the 10,000-resample paired geometric bootstrap/seed20261016 and all12 fork medians. Hold if either comparator interval is wholly below1 or candidate is slower than both labels in at least9/12 blocks, for any reported endpoint. A crossing interval or point ratio below1 is uncertain. No acceptable-loss allowance or post-hoc endpoint/threshold changes. A statistically favorable selected result still needs an independent maintenance-cost review; it is not shipping qualification or a broad no-regression result.

The whole-child wall endpoint ends when the child is reaped. Parent parsing/receipt writes, snapshots and analysis consume the campaign budget. Bound cleanup never discards an unreaped PID; record `cleanup_pending` and retain ownership until explicitly handed to the VM's init/reaper or a named supervisor. Do not launch a replacement child. Record deadline overruns, input/host mutation, missing terminal rows and unresolved accounting as stopped/invalid. Preserve every stdout/stderr, launch intent, witnessed launch, terminal receipt, raw row, snapshot and report, including rejected data. Persisted rows and launch evidence are distinct counts.

Use the reserved five minutes for final full input/image hashes, host-limit checks, status and a generated table with all measured endpoints/intervals. The collector's `pre_seal_budget_passed` check is explicitly provisional: its final status-file write, printing and process return have not yet completed. Its output requires terminal observation and cannot establish final acceptance by itself.

The invocation above directly runs `observe_return.py`; the build's GNU `timeout` does not cover it. `collector_supervisor.py` now supplies its bounded collector supervision. Before one collector launch the observer requires single-threaded Linux execution, default SIGCHLD handling and no preexisting children, and becomes a child subreaper. It exclusively creates `local/observer-intent.json` and `local/collector-launch.json`; preserve these even if collection never produces `run/`. A surviving intent forbids another launch.

Supervision initially uses the **same original overall deadline**. A missing campaign clock at the original preparation cutoff stops preflight and starts bounded cleanup; it cannot enable a timing launch. After input validation, the collector atomically publishes its actual campaign start/deadline in `run/campaign-budget.json`, before any timing child. The observer verifies its PID and the existing fixed budget arithmetic (including start by the preparation cutoff), then can only shorten supervision to that actual start plus the existing 60-minute campaign and five-minute sealing window. Preflight time does not consume the campaign/sealing allowance. Final acceptance requires that clock record. TERM starts two seconds before the endpoint and KILL one second before it, with nonblocking polling/reaping inside the endpoint. Earlier failure, adopted descendants or INT/TERM/HUP cancellation starts at most two seconds of cleanup, capped by that endpoint. A delayed wakeup cannot authorize signals after the endpoint. These reserves consume existing time; they do not extend a window or change campaign admission. The collector starts a new session/process group. Its unreaped leader anchors group signals; after reaping that leader the observer can signal only children whose current ownership it verifies with `waitid`. Subreaping brings orphaned descendants, including those leaving the group, under the observer. The `/proc` child inventory and waitable-child observations help target them but cannot prove emptiness; final cleanup also requires `waitid(P_ALL, WNOHANG | WNOWAIT)` to report ECHILD. No bare historical PID, unrelated process, namespace-wide scan or group whose leader was released is targeted.

`local/process-return.json` retains actual return code/time (null if still unknown), owned pending PIDs, signals, adopted-child reaps and cleanup observations. Complete matching worker intent/launch/terminal records remain required in addition to supervisor cleanup. Any supervision intervention invalidates acceptance even if the collector eventually exits zero; an overrun, incomplete/missing cleanup evidence, unknown/nonfinal status or unsuccessful return also stops acceptance. The original collector status, including statistical holds, remains recorded. The collector's report stays provisional until this final owner observation; a timely observation never clears a control failure, slowdown hold or inconclusive comparison. Preparation process-group/init cleanup remains the existing prerequisite. This terminal bookkeeping adds no approval checkpoint, JVM fork or time allowance.

The command exits nonzero whenever `terminal_observation_passed` is false, after preserving the terminal verdict. Exit zero confirms successful terminal observation only, including timely cleanup; it never grants performance approval or clears the recorded statistical disposition or `shipping_qualified=false`.

The committed tests use scripted clocks and mocked process operations only. They cover supervision logic, not actual Linux containment or runtime readiness. OS/filesystem stalls and uninterruptible tasks can defeat userspace termination or receipt writing. Missing final evidence blocks acceptance; pending PIDs require ownership follow-through with the VM's actual reaper, checking current identity/ownership before any action. Do not infer cleanup from observer exit, retry, extend time, or claim containment readiness from the offline test count.

State the actual stage/fork prefix completed and all omissions. Before/after hashes cannot disprove a transient write-and-restore; exclusive unchanged inputs remain an operational requirement. This selected ARM64 result cannot clear the old handwritten x64 hold or establish other tiers/layouts/platforms/current-master behavior. No merge or further campaign follows automatically.
