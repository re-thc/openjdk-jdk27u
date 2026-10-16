Source e41d7823bf6de77c4bfba52e896bf325221488cb clean-image tier2 checkpoint.

Local tier2 selections are complete with explicit limitations. The 47 completed groups report 11681 executed passing records, 28 explicit skipped records, and 23 failures and 558 harness error outcomes. Original statuses, commands, image fingerprints and failed JTRs remain intact. Finished JTRs and logs from active groups are snapshots only and do not certify those groups complete.

The observed failure inventory is {"baseline-cross-collector-header-mismatch": 12, "environment-core-pattern-unavailable": 4, "baseline-reproduced-filestore-failure": 2, "harness-scratch-directory-setup-error": 558, "baseline-reproduced-native-gss-failure": 2, "environment-external-dns-unavailable": 2, "resource-suspected-exit137-with-isolated-pass": 1}. Named failures are checked against their exact messages and control-image evidence. Cleaners native GSS controls additionally retain child stderr; the original parent-only JTR limitation is explicit in its analysis. This does not certify tier2 clean or classify later failures automatically.

New batches use Make's automatic/ignore-quiet/failure-retention options. Preexisting commands/results remain intact; locks and exact-command/source checks prevent duplicate groups. Current executions use the owned subreaper; PID1 was untouched. Historical baseline controls are retained separately with their original source identity and hashes, and never counted as current passes.

Final performance, original native ARM ZGC reproduction, and current-source native ARM/Windows builds/tests remain pending. No approval, source-readiness or speedup conclusion is made.
