# Local selections complete; PR9 remains unfinished

The clean local candidate is `e41d7823bf6de77c4bfba52e896bf325221488cb`. Public PR9 remains open and non-draft at `c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b`. This follow-up changed no runtime source, PR source/body/draft state, workflow or launch marker. It launched no native JDK build or hosted run and executed no stopped four-byte-header stress.

Release and fastdebug each completed all 11 main groups. Current-source accounting contains 11,681 passing records and 11,681 distinct image-kind/test pairs. There are no pending selections, unknown failures, unreviewed skips, unexplained batch errors or unmet setup cases. Original outcomes remain 23 failures, 558 harness errors and 28 skipped records; this is not clean tier2 or PR approval.

| Selection | Actual outcome | Evidence |
| --- | --- | --- |
| Exact 558 original setup-error cases | 556 passed; one DNS failure; one console skip; no fresh setup error | setup-followup-final-assessment.json |
| Surviving FD networking worker | 1,073 passed; one DNS skip | clean-fastdebug-tier2-jdk-net.result.json |
| Previously unrun FD JAXP group | 516 passed | clean-fastdebug-tier2-jaxp.result.json |
| Previously unrun FD langtools group | 12 passed | clean-fastdebug-tier2-langtools.result.json |
| Surviving FD IO/tools/time worker | 1,243 executed passes; one filesystem skip; one baseline FileStore failure; 558 original setup errors | clean-fastdebug-tier2-jdk-io-tools-time.result.json |
| One isolated release ReadXBytes case | Passed with the original 12 GiB heap and no new OOM kill | readxbytes-isolated.json |

No completed group was restarted. Prefetched groups used canonical names and exact source/command locks; the main controller reused their results. The bounded setup queue stopped at its first nonzero batch, reviewed the exact baseline DNS cause, and resumed only unexecuted blocks. Every original name, source-file hash and follow-up JTR was checked one-to-one, with no duplicate or omission. FD ReadXBytes had already passed and was not repeated.

The original IO log and harness trace independently record 558 scratch-directory errors within 04:06:45–46 UTC. Only 37 error JTRs survived; 521 outcomes had no JTR. The earlier JTR-only inventory undercounted the errors. The collector, assessor and evidence pack now retain trace-only outcomes, immutable SHA-256-matched trace snapshots, and a required follow-up disposition for every unmet name. No missing JTR was fabricated.

At that same second, release ZipFSOutputStreamTest was writing its STORED case with a 2,147,483,648-byte entry plus a 25 MiB entry and temporary/archive overlap. This establishes competing disk demand and supports storage contention as the explanation. Historical errno and free-space samples are absent, so ENOSPC is not proved. The initial 5 GiB readiness check stopped before any follow-up test ran.

Disk headroom was restored by reclaiming completed link inputs and consolidating byte-identical, mode-matched JVM intermediate copies while retaining every payload path. Available space rose to about 6.66 GB. All six qualified release/FD payload fingerprints still match after testing. Images, exploded modules, native fixtures, source, old results and archives were preserved. New work used fresh named directories and batches of 37, then at most 32, cases. The resumed monitor's initial resource-file collision and missing early samples are explicit in setup-resource-monitor-repair.json; an independent observer was installed without restarting a test.

The LDAP pool failure has the exact `UnknownHostException: example.com` cause, verified against the retained `87edd79d` baseline JTR by SHA-256. ConsolePromptTest requires the absolute `/usr/bin/expect` path, which is absent. Both remain explicit coverage gaps. Neither was retried, remapped or bypassed.

The original release ReadXBytes exit 137 accompanied a cgroup OOM-kill counter increase. Its annotation overrides the batch 1 GiB limit with 12 GiB on a 16 GiB cgroup. Kernel victim logs are inaccessible, so exact historical victim attribution remains unproved. The single follow-up ran after all other Java workers stopped, preserving its image, source, seed, flags and 12 GiB heap. It passed. Eighty-one resource samples show a peak cgroup charge of 17,179,750,400 bytes against a 17,179,869,184-byte limit, with no new OOM kill. This near-limit run supports exclusive admission; the original failure remains a resource-suspect failed record.

Historical ARM run `38640541680` recorded baseline 20/20 pass, flag-off 20/20 pass and flag-on 16/20 pass under ZGC. Enabled failures were blocks 1, 2, 3 and 14. Its green workflow tolerated archive mismatches. The actual tested JVM was `d8fc74ba01f7e6ed0a77e94f89b1a0922a79a776`; checked-out test source was `8bf01e9ed8a3df53fd8836d61216ed511ad3e591`; workflow was `f88580c372fb96ce91e39faa41fa04121ca197e6`. The tested and checked-out source trees are equal, and public `c04d1ba1` differs from `8bf01e9e` only in two documentation files. This is source equivalence, not a separately tested c04 binary or a test of current e41d.

Inherited raw-map findings identify archived resolved-method/class-state differences in ArraysSupport and Long. The original Library/archive packets remain unavailable after their permitted bounded transfer attempts; no raw-map re-verification or transfer retry occurred here. Current source review and x64 off/on/forced-safepoint, GC/oop-setting, AOT and dynamic-CDS checks support the narrow static-CDS Java-entry mitigation. They do not close the native ARM gate. No stopped four-byte-header stress may be rerouted or substituted.

Run `38829832202` built ARM and Windows fastdebug and passed basic development-profile VM checks, then failed under-instrumented identity assertions; release siblings were cancelled. The exact single-repository SOURCE expectation is a checker-design defect, but actual native SOURCE was not captured, so binary identity remains unqualified. No JDK images were retained in the listed artifacts.

The unchanged diagnostic-only identity/retention patch was provided as ordinary message text and remains unapplied. SHA-256: `5e2fa0a118e81ac444c877d292fe995120c3b84fa6dff5c60279d499e55619f6`; base workflow: `12fb0c876b9ec3b23ce59f003badc086e2b0f368`. It captures inputs before preserving the original strict assertions, retains diagnostics and unverified bundles, and disables matrix fail-fast. YAML, 18 shell syntax checks and three synthetic fixtures passed; actual GHA execution is untested. No new native build or hosted run is approved.

Remaining performance stays held for the parent handoff; no final-performance controller or pre-performance freeze receipt exists. Reuse the completed interpreter warm tier and exact cold measurements only under their strict fingerprints. Remaining legacy/boundary/other cold/startup, C1/C2 warm and C2-control phases are pending. Retain the exploratory C1L1 feature-off +0.0408 ms signal. No broad speedup or zero-overhead claim is made.

Native ARM archive correctness/performance and Windows AVX512 remain unqualified. Public PR prose is stale: it still calls the historical ARM diagnostic queued. Source publication and final concise PR prose remain pending. PR9 is not ready for independent review or merge.
