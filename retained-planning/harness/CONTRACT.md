# A/E/U comparison harness contract

This directory contains a Java fixture, an exact-once Python controller, an offline analyzer, and process-free tests. The controller deliberately has no default image paths and must not run until a separate preparation, independent review, and explicit execution-authority file are present.

## Frozen preparation schema

The runner accepts `xss-in-place-comparison-prepared-v2` JSON only. Required fields:

* `proposal_path`, `proposal_sha256`: the exact reviewed proposal identity.
* `output_directory`: a new, nonexistent, unique directory.
* `slots`, `cases`, `budget`: values derived from the proposal. The budget is 36 JVMs in 12 balanced A/E/U triplets, 32 cases, 18,432 measured, 9,216 conditioning, 720 warmups, 28,368 total validated calls, zero explicit GC, a 600-second global cap, 45 seconds per JVM, and five seconds reserved for cleanup.
* `role_bindings`: exactly A/E/U. Each role records `backend`, `source_commit`, `source_tree_sha256`, `image_root`, `java`, `build_receipt_path`, `build_receipt_sha256`, `java_hotspot_sha256`, `java_overlay_sha256`, `toolchain_sha256`, `configuration_sha256`, and `range_dso_path`/`range_dso_sha256` (null for A). Missing receipts are fatal; no path/hash placeholders are accepted.
* Each build receipt has schema `xss-comparison-build-receipt-v1`, role, backend, a clean source commit/tree identity, image root, actual file records for `bin/java`, `lib/server/libjvm.so`, and `lib/modules`, one exact fixture-overlay artifact, and nonempty actual toolchain and configuration file maps whose aggregate hashes are recomputed. Java and libjvm artifacts must be ELF files, and bin/java must be executable. The fixture artifact must be a pinned class file or JAR; the actual command classpath must include its matching classpath entry. A binds to the proposal's verified current-master commit and `stock-default` backend. E binds to the frozen prototype commit and `embedded` backend; U binds to that same source commit and `upstream` backend. E/U must match component by component on the three Java/HotSpot files, toolchain inputs, and exact overlay path/bytes. Each production range DSO path must resolve inside its role image root, be an ELF file, and have a hash matching the receipt, role binding, and frozen file map. E and U DSO paths and bytes must differ.
* Receipt fields are exact: `source_commit`, `source_dirty:false`, `source_tree_sha256`, `image_root`; `java_hotspot_files` is keyed by the three relative names above and each value is `{path, sha256}`; `java_overlay` is `{path, sha256, classpath_entry}`; `range_dso` is null for A or `{path, sha256}` for E/U; `toolchain` and `configuration` are each `{sha256, files}`, where `files` maps absolute file paths to SHA-256. Aggregate digests use lowercase SHA-256 of UTF-8 JSON serialized with sorted keys and compact separators. The role binding repeats all identity digests and exact image/DSO paths.
* Top-level `implementation_delta` freezes the prototype source commit and the reviewed four-argument native ABI (array base, low, high, current-thread stack limit), boolean result, shared recursion depth 8, in-place/no input-sized heap allocation, and pre-mutation guards. Both E/U build receipts must repeat this exact object.
* `activation_review_path` and `activation_review_sha256` identify a separately passed `xss-range-activation-review-v1` receipt for ordinary C2/native entry checks. It binds each production DSO path/hash to that role's Java/HotSpot and overlay digests, backend, nonempty entry symbol and positive observed entry count, diagnostic source and ELF shim path/hash, compiled-helper verification, and actual-entry verification. The independent ready review must bind this activation receipt hash too. These ordinary checks do not prove per-call selection during the timed run.
* The activation receipt has `status: PASS`, `scope: ordinary-c2-native-entry`, and the prototype `source_commit`; `roles` has exactly E/U entries with `backend`, `production_dso_path`, `production_dso_sha256`, `java_hotspot_sha256`, `java_overlay_sha256`, `entry_symbol`, positive integer `entry_count`, `diagnostic_source_path`/`diagnostic_source_sha256`, `diagnostic_shim_path`/`diagnostic_shim_sha256`, `entry_verified:true`, and `compiled_helper_verified:true`.
* `slot_commands`: one item per canonical slot with `slot`, `argv`, and `env`. `argv` includes the role's exact Java path once, one explicit `-cp`/`-classpath` containing that role's exact fixture overlay entry, `XssPublicBench`, `{history}`, and `{output_csv}`. Only those declared placeholders are expanded. Commands cannot override stock ISA/intrinsic policy or select an experimental backend through `BOUNDED_LONG_BACKEND`.
* `file_hashes`: nonempty absolute path to SHA-256 mapping for all build receipts, image files, source/configuration/toolchain inputs, fixture overlay, activation receipt and diagnostic source/shim files, plus other frozen inputs. Every path and hash is checked against actual bytes.
* `harness_sha256`: hashes of exactly `XssPublicBench.java`, `run_comparison.py`, `analyze_results.py`, `test_offline.py`, and this contract.

The separate authority JSON must contain `execution_authorized: true`, the prepared-manifest SHA-256, the independent review's resolved path, and its SHA-256. That review must itself state `ready_to_execute: true` and bind the same prepared-manifest and native activation receipt SHA-256 values. The prepared JSON must also explicitly set `execution_authorized: true`. Hashes and all prepared checks are replayed before the output directory is created.

## Commands

Offline checks only:

```sh
python3 -B -m unittest /workspace/pr57-xss-prototype-20261023/harness/test_offline.py
python3 -B /workspace/pr57-xss-prototype-20261023/harness/analyze_results.py --self-test
```

The execution form, for a later authorized and independently reviewed preparation, is:

```sh
python3 -B run_comparison.py PREPARED.json AUTHORITY.json REVIEW.json PROPOSAL.json
```

Each slot is reserved atomically before process creation. A slot is attempted at most once. Failure, timeout, malformed protocol, wrong output, or resource cap failure stops the remaining collection; no replacement, retry, extension, or data exclusion is supported. A pre-existing collection directory or slot artifact always prevents rerun.

The fixture sorts through the public `Arrays.sort(long[], low, high)` API. Reset and independent signed-radix oracle/guard checks are outside the timer. The analyzer retains per-JVM case medians, all matched triplet contrasts, absolute times, ratios, percentage and nanosecond deltas, spread, and separate reset/sort/validation allocation counters. These allocation counters apply to the sorting thread; they do not measure native allocation, worker allocation, or process peak memory.

The current fixed proposal is pinned to SHA-256 `90a633c85adcc5fc1230399c0c5a4b67b9629e2a378b17ea2e0a9797bb0c7a2a`; a change requires a reviewed harness update. Commands must have identical argument shape across every slot after replacing the role-bound Java executable. Environment must be identical except role-specific `JAVA_HOME` and `LD_LIBRARY_PATH`; JVM option injection variables, preload/audit loader variables, and `CLASSPATH` are rejected. The controller snapshots loaded mappings, but those snapshots prove only that a library is mapped, not that a particular native entry ran for each measured call. The separate activation receipt establishes ordinary entry coverage only; do not claim per-call native selection from the timed comparison.
