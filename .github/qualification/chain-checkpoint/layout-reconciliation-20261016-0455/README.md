# PR9 remains unfinished

Published PR9 is open, non-draft, at `c04d1ba1e96b2176ce8a8e56eacae73c2d356d2b`.
The clean local candidate is `e41d7823bf6de77c4bfba52e896bf325221488cb`.
No runtime source, PR source, merge, workflow dispatch, build rerun or stopped
four-byte-header stress execution was performed during this reconciliation.

## Native build failure

Run `38829832202`, workflow revision `12fb0c876b9ec3b23ce59f003badc086e2b0f368`:

| Platform/profile | Build | Development profile | Identity step | Image retained |
| --- | --- | --- | --- | --- |
| Linux AArch64 fastdebug | passed | passed | failed | no |
| Windows x64 fastdebug | passed | passed | failed | no |
| Linux AArch64 release | cancelled | skipped | skipped | no |
| Windows x64 release | cancelled | skipped | skipped | no |

Both fastdebug logs show successful bundle verification, detached checkout and
the full expected `e41d7823...` HEAD before dependency setup. They show completed
product/test bundles and successful basic Serial/G1/ZGC development-profile VM
checks. They then show exit 1 in the identity shell step without tracing which
assertion failed or printing the actual release metadata.

The checker I added assumes exactly `SOURCE=".:git:e41d7823bf6d"`. That is too
restrictive: `make/SourceRevision.gmk` records nested repositories and appends
`+` for dirty status, and the GTest action creates a nested `gtest` checkout.
`make/ReleaseFile.gmk` copies the whole source forest into `SOURCE`. This is a
concrete checker-design defect. The actual native `SOURCE` value was not saved,
so the logs do not prove that a wrong image was built, or establish qualified
binary identity. The available evidence supports correct pre-build checkout
and successful compilation, with final image identity still unverified.

The only retained run artifact is `bundles-jtreg-8.2.1+1` (artifact 12018283749).
Identity and JDK-bundle uploads were skipped after failure. The successful
fastdebug images cannot be recovered from the listed run artifacts. Rebuilding
to replace them requires approval; the old workflow must not simply be rerun.

`native-identity-diagnostic-repair/identity-diagnostics.patch` is prepared only.
It captures HEAD/status/release metadata before asserting, traces the existing
assertions, uploads diagnostics after a successful Build even if identity fails,
retains unverified bundles on failure, and prevents matrix fail-fast cancellation.
It changes no source restoration, configure/build command, runtime source,
intrinsic flag, or identity acceptance rule. YAML and 18 shell syntax checks
passed. Three synthetic shell fixtures verified capture and original exit status;
they executed no JVM or build. Actual GHA execution remains untested.

## Surviving local work

The original workers survived. At the recorded snapshot, release has completed
10/11 main groups and fastdebug 7/11. Three ordinary batches remain active;
completed source/command-matched groups and measurements were not restarted.
See `live-status.json` for counts including active groups, and
`tier2-assessment.json` for completed-cohort accounting. They are different scopes.

There are 37 completed harness setup errors in fastdebug `sun/nio/cs`, reporting
directory-creation failures, plus release `ReadXBytes` exit 137. These remain
unresolved. A harmless current directory/file probe succeeds, with parent mode
0700 and available inodes; this does not explain the historical errors.
`ReadXBytes` overrides the batch limit with `-Xmx12g` on a 16 GiB cgroup while
other workers are active. The cgroup now records one OOM kill; it previously
recorded zero. Kernel victim logs are inaccessible, so attribution is suggestive,
not proved. Preserve the original errors and failure.

`qualification-hold.json` explicitly blocks final qualification and remaining
performance. The assessor was checked and reports timing eligibility false.
Existing non-stress workers may finish; no test was restarted by this work.

Already-complete current-source evidence remains preserved: clean release/FD,
171 focused jtreg plus two flagless cases, 1399 FD gtests (15 disabled), 864
functional cases, 80 concurrent GC probes and eight dynamic-CDS checks. Current
performance includes the full interpreter tier (144 JMH invocations/240 parameter
forks), 24 exact cold cases (16800 fresh VMs), the separate 50-fork hash comparison,
and the 360-block cold-square confirmation. No final-performance controller has
started. The remaining cold/startup, C1/C2 warm and C2-control phases are pending.

## Historical ARM archive result and source reconciliation

Existing decoded log `38640541680` contains 60 measured block records:

| Variant | Passed | Failed |
| --- | ---: | ---: |
| baseline | 20 | 0 |
| PR flag-off | 20 | 0 |
| PR flag-on | 16 | 4 |

Enabled failures were blocks 1, 2, 3 and 14. The script records archive mismatches
but only treats certain other nonzero exits as fatal; its green workflow was not
archive correctness. Workflow revision was `f88580c372fb96ce91e39faa41fa04121ca197e6`.
Test checkout was `8bf01e9ed8a3df53fd8836d61216ed511ad3e591`; actual tested JVM
source was merge commit `d8fc74ba01f7e6ed0a77e94f89b1a0922a79a776`.

GitHub commit metadata and local Git independently give both those source trees
as `7f756e250381a3c55b9a906771f9b2dd8ba28609`. Published `c04d1ba1` differs from
`8bf01e9e` only in `BENCHMARKS.md` and `summary.csv`. Its runtime/test source thus
contains the same unfixed implementation; this is source equivalence, not a
claim that a separately built c04d JVM was tested in the old run.

The inherited raw map interpretation identifies resolved-method/class-state
differences in ArraysSupport/Long. Those raw packets are still unavailable after
the permitted transfer attempts. Reading the old logs here did not retrieve or
independently re-map those archive bytes.

The local static-CDS mitigation selects Java entries during static assembly,
removing common-entry safepoint-dependent fallback from that phase. Ordinary
execution, dynamic CDS and AOT preimage/training retain common entries. Existing
e41d x64 release/FD archive checks cover off/on/forced-safepoint variants under
Serial/G1/Z with both oop settings, and AOT/dynamic checks passed. This supports
the mechanism and x64 behavior; it does not close the original native ARM gate.
No stopped four-byte-header stress may be rerouted or substituted.

The separate interpreter-layout regression is measured corrected: e41d puts
optional entries after ordinary handlers (all 239 offsets match off/on), and the
fixed ten-round comparison reduced the prior candidate's large-hash fallback
from 712 to 521 microseconds. BigInteger first-use preparation has selected exact
cold evidence, but the full original/size/tier matrix remains pending. Preserve
the exploratory C1L1 feature-off +0.0408 ms signal (95% CI +0.00125 to +0.08036).

## Remaining sequence and blockers

1. Finish existing ordinary workers without duplicating groups. Investigate the
   37 setup errors; only then plan their unmet cases in fresh named workdirs.
   Isolate the 12 GiB ReadXBytes case after other VMs stop and record resource
   events. No blanket rerun or deletion of original failed records.
2. Review the unapplied native diagnostic patch. A new limited diagnostic build
   needs approval because no JDK images were retained. Capture actual SOURCE and
   retained images before changing metadata acceptance or rebuilding further.
3. Close local setup/correctness gates, deliberately clear the hold, freeze and
   checkpoint the assessment, then resume only missing performance phases and
   review every slowdown signal. Final docs and PR publication remain pending.
4. Keep native ARM archive correctness, native performance and Windows AVX512
   unqualified. Use existing evidence and source review while the security stop
   remains in effect; no alternative stress route or campaign is proposed.

PR9 is not ready for independent review or merge.
