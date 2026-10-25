# PR57 Git recovery checkpoint

The source branch preserves the exact surviving initial in-place XSS prototype. It is not the missing later c6ea1f6 candidate. The original /tmp archive is unavailable in the recovered session. RECOVERY-MANIFEST.json separates verified surviving trees, recovered commit metadata and missing source bytes.

The 32-file source tree is exactly 69c803e30d7af3932b27cdb51fc8b357e6c12795 on public base 98be5181dac1d5eff26745ac716aad7b76b348d8. Its permanent test and all Java/native/C2 files match the retained staged source. Original workspaces/results remain unchanged.

`retained-planning/` contains the surviving Oct23 controller and ordinary fixture sources. These are historical scaffolding, not the missing Oct24 A/U recipes or authorization to execute any JVM. No build, runtime, stack, pause or performance pass transfers to these checkpoints.

## Minimal Git handoff proposal

After a publication decision, push only the two named checkpoint branches to an approved Git remote. Do not change PR57, master or other existing refs; do not force-push, open a product PR, dispatch CI or merge. An existing public fork exposes unpublished source and handoff metadata; use an approved private target if that exposure is not authorized. Keep all images, objects and raw evidence local.

A fresh task should fetch and verify the exact checkpoint heads, read RECOVERY-MANIFEST.json, and keep the source branch and handoff branch separate. Do not apply the handoff files to the product patch. Recover the exact c6 tree from surviving bytes, or explicitly review a newly reconstructed successor under a new identity; never relabel the initial checkpoint as c6. Recreate/review missing modern fixture sources before seeking any build or measurement authority. Current master has advanced beyond the pinned5d base; any later integration is separate work and does not inherit timings.

These refs are presently local in temporary staging because the original persistent filesystem rejects new Git objects with ENOSPC. Do not discard this environment until an approved Git remote confirms the heads. No archive or Library transfer is proposed.
