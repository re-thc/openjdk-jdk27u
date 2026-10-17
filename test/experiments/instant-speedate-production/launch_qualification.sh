#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
# UNEXECUTED Linux-only proposal. Do not launch without execution authorization.
set -euo pipefail
stage=${1:?causal or full}
task_root=${2:?new absolute scratch root under /workspace}
causal_report=${3:-}
case "$stage" in causal|full) ;; *) exit 2 ;; esac
case "$task_root" in /workspace/*) ;; *) echo 'HOLD: use an absolute /workspace scratch directory' >&2; exit 2 ;; esac
task_started=$(python3 -c 'import time; print(time.monotonic())')
task_review=$PWD
task_tools="$task_review/test/experiments/instant-speedate-production"
test -f "$task_tools/job_entry.py"
task_parent_namespace=$(readlink /proc/self/ns/pid)
mkdir "$task_root"
mkdir "$task_root/tmp"
unset CARGO_ENCODED_RUSTFLAGS
export TMPDIR=/tmp TMP=/tmp TEMP=/tmp
extra=()
if test "$stage" = full; then
  test -n "$causal_report" || { echo 'HOLD: candidate-bound causal PASS report required' >&2; exit 2; }
  extra+=(--causal-report "$causal_report")
fi
# The final ten seconds are reserved for SIGKILL/namespace teardown.
task_timeout=$(python3 -c 'import sys,time; print(max(0,int(float(sys.argv[1])+21600-time.monotonic()-10)))' "$task_started")
test "$task_timeout" -gt 0
set +e
timeout --signal=TERM --kill-after=10s "${task_timeout}s" \
  bwrap --unshare-user --unshare-pid --as-pid-1 --die-with-parent \
    --new-session --disable-userns --ro-bind / / --bind /workspace /workspace \
    --bind "$task_root/tmp" /tmp --proc /proc --dev /dev --chdir "$task_review" \
    -- python3 "$task_tools/job_entry.py" --stage "$stage" --root "$task_root" \
      --repo "$task_review" --started "$task_started" \
      --parent-pidns "$task_parent_namespace" "${extra[@]}" \
  > "$task_root/outer.log" 2>&1
status=$?
set -e
printf '%s\n' "$status" > "$task_root/outer.exit-status"
# A missing inner verdict is HOLD/INCONCLUSIVE, never success. Namespace setup
# refusal has no uncontained fallback; existing evidence is retained.
exit "$status"
