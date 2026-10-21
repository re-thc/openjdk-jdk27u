<!-- Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved. -->
# Historical PR4 execution blocker and its resolution

**Resolved in attempt 3.** All eight builds and all 48 tier1 groups now pass
for product `7048d6f2` at merge `7223ef03`. The [complete outcome](ci7048-attempt3-success.json)
and [full log archive](ordinary-ci-39280914015-complete.tar.gz) supersede the
missing-execution status below. Do not rerun those five jobs. The later user
request to integrate PR63 and fix regressions requires new source-specific
validation. The remainder of this file preserves the earlier blocked state.

**Historical decision: retain the implementation; do not merge yet.** PR4 remained open
and draft. The [assessment](RESULTS.md) retains the performance tradeoff and
all losses. Source corrections, native validation and the planned final
complete-image comparisons are complete. Five mandatory macOS tier1 groups
never executed in either ordinary-CI attempt. No further source tuning or
performance campaign is required to address this execution blocker.

## Immutable source and evidence identities

| Item | Identity |
|---|---|
| Existing product branch | `codex/stringzilla-intrinsics-5.2.0` |
| Product head | `7048d6f2c74e25737850789812da063900ec18c0` |
| Independent original | `416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda` |
| Fork master used by ordinary CI | `70c91df3528a9c95bfde606a8fbe1bfaee957271` |
| Ordinary CI checkout | `7223ef030b1de2e72bbf7eb7db81e48e2f79c965` |
| Exact-product native evidence producer | `3b318ed7cf5b903c1b1065624e91d5d4eadbf4d0` |
| Existing evidence branch | `codex/stringzilla-final-artifacts` |

Ordinary CI checks GitHub's merge of master and the product, rather than the
exact-product images measured for performance. The
[source binding](ci7048-source-provenance.json) accounts for the eleven extra
files from other merged PRs; no StringZilla file differs. Fetch the actual
current refs before any action and preserve others' work. A changed checkout
requires an explicit source assessment; do not relabel these results.

## Completed work

- Four source corrections cover MSVC per-file optimization, the UTF-16
  immediate probe, the bounded reverse verifier and the Latin-1 physical-range
  guard/C1 bridge. See [source audit](SOURCE-AUDIT.md).
- All 98 planned original/enabled/disabled triplets complete on serial, AVX2,
  AVX-512, NEON and MSVC: 882 original JMH files and 4,410 samples. Three
  balanced interleaved rounds retain paired medians, spread and all seventeen
  loss-table rows. Practical startup, javac and indexing comparisons are mixed.
  See [final comparisons](final7048-summary/COMPARISONS.md).
- [Exact-product native run 39281225979](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39281225979)
  succeeds on Windows and ARM. Local, Windows and ARM targeted correctness,
  bounds, overlap and safepoint evidence is retained in the assessment.
- [Ordinary CI 39280914015](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015)
  passes Prepare, all eight release/fastdebug builds and 43 of 48 tier1 groups.
  The original attempt and one accepted failed-job-only recovery are both
  terminal failures. The same five groups below have runner ID zero and no
  executed steps in both attempts. No executed group reports a test failure
  or error. The records do not disclose the scheduling root cause.

## Remaining execution

All rows are `macos-aarch64 / test (...)` in the existing ordinary CI run.

| Required group | Original job | Recovery job |
|---|---|---|
| `lib-test/tier1` | [118492858179](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118492858179) | [118792915867](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118792915867) |
| `jdk/tier1 part 3` | [118492858155](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118492858155) | [118792915922](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118792915922) |
| `hs/tier1 common` | [118492858146](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118492858146) | [118792915951](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118792915951) |
| `hs/tier1 compiler part 1` | [118492858109](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118492858109) | [118792916163](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118792916163) |
| `hs/tier1 compiler part 3` | [118492858193](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118492858193) | [118792916219](https://github.com/re-thc/openjdk-jdk27u/actions/runs/39280914015/job/118792916219) |

Do not launch a third unchanged retry or another native qualification matrix.
First establish available macOS ARM execution capacity or resolve the reason
these five jobs cannot start. Then execute only these missing groups with the
same source and matched CI configuration, retaining checkout, toolchain,
runner and full test logs. Reuse existing successful builds/results when valid.
Inspect actual failures and correct attributable defects if any occur.

Review all five results and the full expected macOS StringZilla descriptions,
including the compiler-part-3 cases. Only successful, reviewed execution of
all required groups removes this blocker. Keep the measured losses in the
readiness decision. Do not merge, push upstream, force-push or create a new
product branch/PR. Use Harry Chan <38070640+re-thc@users.noreply.github.com> for
any authorized continuation commits.

## Audit and retention

The [terminal outcome](ci7048-outcome.json),
[raw attempt 2 jobs](ci7048-attempt2-terminal-jobs.json) and
[provenance ledger](ci7048-job-provenance.json) retain the exact blocked state.
The accepted recovery carries forward 52 successful executions; its new API
job IDs are mapped to their original times, runners, steps and logs. They are
not 52 new executions.

The [terminal audit archive](ordinary-ci-39280914015-outcome.tar.gz) and
[checksum receipt](ordinary-ci-outcome-archive.json) contain all 52 successful
logs, both terminal attempts, build/test metadata and standalone auditors.
Follow its README: verify `SHA256SUMS` before rerunning auditors, which refresh
derived timestamps. Independent extraction and both auditors pass, retaining
43 executed groups and five missing. A complete-qualification assertion must
continue to fail while these five remain absent. Original JMH bytes and all
earlier checkpoint archives remain retained outside the product PR.
