# Ordinary routing supervisor contract

`run_ordinary.py` is a later-use controller scaffold. It has no JVM/native command defaults and the offline tests mock every `Popen`; none of these files compiles or launches the prototype.

## Frozen manifest

The future `pr57-ordinary-prepared-v1` JSON has these required fields:

* `execution_authorized: false`. Preparation never grants execution authority.
* `budget` exactly `{slots: 9, per_slot_seconds: 60, global_seconds: 300, cleanup_seconds: 5, explicit_GC: 0, planned_sorts_max: 30000}`.
* `planned_sorts`: declared integer count from 0 through 30,000.
* `output_directory`: absolute path that does not yet exist.
* `prototype_source_commit`: exact 40-character lowercase source commit.
* `slots`: nine records in this fixed order and kind: `native-guard-EU` (`native_guard`), then `Eactivation`, `Uactivation`, `Einterpreted`, `Uc1`, `UdisableIntrinsic`, `UUseAVX2`, `Estress`, `Ustress` (all `jvm`). Each record supplies `name`, `kind`, `seconds: 60`, exact nonempty `argv`, exact string-to-string `env`, and existing absolute `cwd`. Commands are never synthesized. `{slot_dir}` is the sole permitted placeholder and expands to that slot's unique output directory.
* `file_hashes`: nonempty map of canonical absolute paths to SHA-256 for all source, image/binary, fixture, command/configuration, and review inputs. Every path is rehashed immediately before output creation.
* `evidence`: records covered by `file_hashes` and grouped under `source`, `images`, `fixture`, and `binary_stack_review`. Each entry is `{path, sha256}`; `images` may be a list.
* `stack_review`: `{path, sha256, status: "PASS", roles: {E: ..., U: ...}}`, where the review document is itself in `file_hashes`; each role binds `production_dso_path`, `production_dso_sha256`, and `source_commit`, plus true booleans `callgraph_verified`, `guard_frame_verified`, `imports_verified`, `no_allocator_verified`, and `stack_reserve_verified`. The controller confirms byte bindings, not the technical correctness of the review.
* `harness`: exact map of this controller and offline-test absolute paths to their current SHA-256.

The separate authority document must say `execution_authorized: true` and bind `manifest_sha256`, canonical `evidence_sha256` (the digest of the complete `file_hashes` map), `stack_review_sha256`, and the resolved independent-review path and hash. The separate independent review must say `ready_to_run: true` and repeat the same manifest, evidence, and stack-review hashes. The prepared manifest itself remains unauthorized. All validation precedes the exclusive creation of `output_directory`.

## Execution behavior

The controller starts exactly one process at a time, reserves a slot before calling `Popen`, uses `shell=False`, `stdin=DEVNULL`, a regular combined log, and a new owned process group. Per-slot time is capped at 60 seconds, collection at 300 seconds, with five seconds reserved for cleanup. Cleanup itself is also bounded to five seconds from the failure, with at most three seconds for TERM and two seconds for KILL/reaping, whichever global deadline comes first. Logs above 8 MiB fail the slot. Any nonzero exit, timeout, log cap, interruption, or controller error stops subsequent slots; owned process groups are signalled and reaped within the bounded cleanup window, with unresolved cleanup recorded. Reservations and results are durable, and a failed or partial output directory cannot be rerun or replaced.

## Offline checks

```sh
python3 -B -m unittest /workspace/pr57-xss-prototype-20261023/ordinary/test_ordinary_offline.py
```

The tests validate nine-slot order/success, fail-stop behavior, timeout/no-retry handling, bounded cleanup, interruption cleanup, stale evidence and authority rejection, and slot-order rejection. All process creation and signals are mocked; tests must remain process-free.
