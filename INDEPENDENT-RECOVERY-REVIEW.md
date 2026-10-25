# PR57 persistent-source/evidence inventory (2026-10-25)

Read-only inventory. Git commands used `GIT_OPTIONAL_LOCKS=0`. No build, JVM, test, benchmark, CI, publication, or product edit was performed. Scope is the retained paths listed here and targeted name/hash searches under `/workspace`; absence statements are limited to those checks.

## Exact retained source and plans

- `/workspace/pr57-xss-prototype-20261023/source` is at base commit `98be5181dac1d5eff26745ac716aad7b76b348d8` (tree `b2cd1e51ce2f8af354d038dc32d98eb281b4dc0d`, parent `b2e2ccd83bac8d9fc11105076fbe3c0bcd440500`). It is detached and has 32 staged source changes: 10 modifications and 22 additions, including `BoundedSimdSort.java`, the HotSpot/C2 integration, `librangesort` embedded/upstream code and make integration. These are exact surviving worktree bytes, but are not the missing later c6 commit object.
- `source` uses common Git storage `/workspace/openjdk-jdk27u/.git`. The full later tree object `58222e00895fdd3cb3711fedaea57cdc047549fd` is absent there (`cat-file` lookup failed). Per the coordinator’s earlier object check, c6/f036/b84/d142/5d commit objects are absent from this common object database; c6’s reconstructed metadata is a separate reconstruction, not a recovered object.
- The permanent jtreg source `source/test/jdk/java/util/Arrays/BoundedSimdSort.java` survives with SHA-256 `e068b0c08b360b9dde96883823c845c602540f173848c3b4bfe40bdafc198b9e`. The 2026-10-23 independent source review records that same digest and describes its coverage. No compiled test class/JAR was found by a targeted `/workspace` filename search.
- Older public benchmark fixture and process-free controller sources survive under `harness/`: `XssPublicBench.java`, `run_comparison.py`, `analyze_results.py`, `test_offline.py`, and `CONTRACT.md`. Their contract and review JSON describe source-only planning; review explicitly records no timed/JVM execution or performance result.
- Ordinary planning sources survive under `ordinary/`: `XssActivation.java` (SHA-256 `f8465939a5ad95e8328f4b03d255f9fc6955de471054d083a844bca0b0b24231`), `native_guard_harness.cpp`, `heapsort_fallback.cpp`, `librangesort_witness.cpp`, `audit_stack_usage.py`, `run_ordinary.py`, `test_ordinary_offline.py`, contracts and source-review JSON. `prepare_commands.py` is a source-only command-plan generator. No prepared ordinary manifest, built A/U images, compiled fixture overlay, or executable result is present in the inventoried paths.
- Note on review drift: `independent-harness-review.json` says `ordinary/test_ordinary_offline.py` is absent, but it is present now (271 lines; SHA-256 `f0f302c32efbbdbcd5880a327a500ada44b96361d0bfb6b4ffc86d6a49c4ff06`). This only establishes the retained file; it was not run.

## Historical SIMD evidence retained

`/workspace/pr57-simd-history-audit-20261023/` retains `EVIDENCE-MANIFEST.json`, `HISTORICAL-CANDIDATE-LEDGER.json`, `native-history*.json`, `independent-measurement-history*.json`, `xss-upgrade-source-review.json`, source-identity and release-pin files, and independent reviews. These are reports/ledgers, not missing source commits or raw Oct24 fixtures. The manifest identifies zero builds, JVMs, explicit GC, or benchmark processes in that audit. The ledger describes older candidate source and historical-reported results while explicitly distinguishing missing old raw measurements.

## Specifically checked gaps

- No file named `src/java.base/share/legal/x86-simd-sort.md` (or basename `x86-simd-sort.md`) was found by `rg --files /workspace`.
- No `96JVM10`-named fixture, or compiled `XssActivation`, `BoundedSimdSort`, or `XssPublicBench` `.class`/`.jar`, was found in the targeted `/workspace` filename search. The Java fixture sources remain, but the Oct24 compiled A/U 96JVM10 ordinary fixture artifacts are not present in checked persistent workspace paths.
- The recorded null-test digest `69603ac71946eaf08f0d53880f6171f8de7eadbed0e4bcfb15bb4456cfc56590` and the f036-specific legal-notice/test additions were not found in the retained PR57 and SIMD-audit records searched. Existing `test/jdk/jni/nullCaller` content in broader checkouts is not evidence of that later f036 patch.
- The Oct24 archive named in the task note and its temporary c6 worktree are outside the retained `/workspace` inventory; the task note reports the archive is absent from `/tmp`. This inventory does not infer that the original archive/source is permanently lost beyond those checked paths.


## Independent checkpoint and handoff verification (2026-10-25)

Read-only verification of `/tmp/pr57-git-checkpoints-20261025` and `/tmp/pr57-handoff-20261025`:

- Source checkpoint `a144cd459f144f3b5626ba3344945c1e51cc5d69` has exact tree `69c803e30d7af3932b27cdb51fc8b357e6c12795`, parent `98be5181dac1d5eff26745ac716aad7b76b348d8`, and subject `Checkpoint retained PR57 in-place XSS source`. Author and committer are Harry Chan `<38070640+re-thc@users.noreply.github.com>`, both dated 2026-10-25 05:32:10 UTC.
- I independently checked all 32 `source_checkpoint.source_files` against the manifest byte sizes and SHA-256 values, the corresponding committed tree blob IDs, the original retained source worktree, and its Git index. All 32 matched at all four points; no mismatches. The new checkpoint worktree is clean; the original retained worktree remains staged as inventoried earlier.
- Handoff commit `d15de8791836e02963972365d8ecb13e1bacd097` has tree `eaae53585cceb34612b904e3778aa63e987c3d9a`, no parent, and subject `Record PR57 recovery state and retained source recipes`. Author and committer are the same identity, dated 2026-10-25 05:34:09 UTC. The commit tree has 21 files: the 18 manifest-listed retained planning files plus `README.md`, `RECOVERY-MANIFEST.json`, and `RECORDED-C6-COMMIT.txt`.
- All 18 retained planning copies in the handoff matched the manifest's exact byte size and SHA-256 and were byte-identical to their original `/workspace/pr57-xss-prototype-20261023` files.
- Independently reconstructed the canonical 313-byte c6 commit object bytes from the recorded tree, parent, author, committer, timestamps and message. Both Git's read-only `hash-object -t commit --stdin` and direct object-hash computation returned `c6ea1f61683fa42a92235b5233cebfe55ae28cd0`, matching the manifest. This verifies raw commit metadata identity only. The c6 tree `58222e00895fdd3cb3711fedaea57cdc047549fd`, b84 tree `39399e64cd4f29a5be4430313d5bd5b55e08a8a9`, and f036 tree `73ad87c80252e7653bb942554f448197c2832156` are absent from this checkpoint object database.
- Scope claims are appropriately limited: `recorded_c6.full_source_tree_recovered` is false; the missing prerequisites explicitly include the c6 legal notice and null-boundary test additions and the Oct24 A/U 96-JVM plus 10-JVM carrier/recorder fixture sources and frozen recipes. The manifest calls retained Oct23 planning files scaffolding, says they are not the missing Oct24 recipe or runtime qualification, and marks the recorded latest plan not ready to execute. It records historical plan counts but does not claim modern fixture recovery, completed runtime qualification, performance results, or adoption readiness.

No source worktree or existing product path was edited during this verification. The review additions were written only to this `/tmp` inventory file.
