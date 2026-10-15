Source 0fb3e86a762 clean-image tier2 checkpoint.

Completed release HotSpot groups: 881 passed records, six CDS cross-collector header failures and two SA core-pattern failures. Completed fastdebug runtime: 346 passed records and the same six header failures. Both pristine87edd and publishedc04d reproduce the named header/core failures; with explicit four-byte headers off, the six CDS records pass on both current images.

The active release IO group found LDAP UnknownHostException: example.com; both control images reproduce that exact test and cause. The legacy security launch also selected the manual Password dialog, which fails without a display and is outside Make's automatic selection. New batches use -automatic -ignore:quiet; existing results/commands remain intact.

Snapshots of finished JTRs and logs from active batches are included and explicitly incomplete. They do not certify those groups as complete. Every original failure and control result is retained. The inventory has no unclassified failure at this checkpoint. Full tier2, final performance, original native ARM ZGC reproduction, and current-source native ARM/Windows qualification remain pending.

The supervisor adopted/reaped sixteen deliberately orphaned real tee helpers plus their parent in 0.106 seconds. Outputs matched; helper PIDs disappeared; persistent zombies stayed44. Current four test batches have bounded concurrency; cgroup quota is4 CPU equivalents within5 affinity CPUs. No init changes or completed benchmark restarts.
