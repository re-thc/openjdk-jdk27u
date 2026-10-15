Source 0fb3e86a762be2cd3ed9ec35f327e1e7c64682bc clean-image tier2 checkpoint.

Tier2 remains incomplete. The 9 completed groups report 1243 passed records and 16 failures. Original statuses, commands, image fingerprints and failed JTRs remain intact. Finished JTRs and logs from active groups are snapshots only and do not certify those groups complete.

The observed failure inventory is {"baseline-cross-collector-header-mismatch": 12, "environment-core-pattern-unavailable": 4, "environment-external-dns-unavailable": 1, "manual-outside-official-automatic-selection": 1, "baseline-reproduced-native-gss-failure": 1}. Named failures are checked against their exact messages and control-image evidence. Cleaners native GSS controls additionally retain child stderr; the original parent-only JTR limitation is explicit in its analysis. This does not certify tier2 clean or classify later failures automatically.

New batches use Make's automatic/ignore-quiet/failure-retention options. Preexisting commands/results remain intact; locks and exact-command/source checks prevent duplicate prelaunched groups. The bounded supervision self-test reaped one parent plus sixteen deliberately orphaned tee helpers, verified their outputs and left no new persistent zombie. PID1 was untouched.

Final performance, original native ARM ZGC reproduction, and current-source native ARM/Windows builds/tests remain pending. No approval, source-readiness or speedup conclusion is made.
