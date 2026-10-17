#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
# Invoke only via supervise-linux.py --resume-from after execution authorization.
set -euo pipefail
: "${ZIP_QUAL_SUPERVISED:?Use the outer supervisor}"
: "${ZIP_QUAL_MONOTONIC_DEADLINE:?Use the outer supervisor deadline}"
: "${BOOT_JDK:?same installed Boot JDK 27 required}"
: "${JTREG_HOME:?same installed jtreg 8.3 required}"
ROOT=${1:?new continuation output}
C=${2:?reviewed continuation SHA}
export ZIP_REVIEW_COMMIT=$C
PREVIOUS=${3:?preserved terminal attempt}
Q=$(cd -- "${BASH_SOURCE[0]%/*}" && pwd)
BOOT_JDK=$(cd -- "$BOOT_JDK" && pwd -P)
JTREG_HOME=$(cd -- "$JTREG_HOME" && pwd -P)
export BOOT_JDK JTREG_HOME
cd -- "$ROOT"
phase() {
  python3 -E -B "$Q/campaign_deadline.py" "$PREVIOUS" > "$ROOT/results/deadline-$1.json"
  printf '%s\n' "$1" > "$ROOT/.qualification-phase.next"
  mv -f -- "$ROOT/.qualification-phase.next" "$ROOT/.qualification-phase"
}
mkdir -p "$ROOT/results" "$ROOT/classes"
phase retained-input-check
python3 -E -B "$Q/test-test-selection.py"
python3 -E -B "$Q/test-image-layout.py"
python3 -E -B "$Q/test-campaign-deadline.py"
python3 -E "$Q/retained-images.py" "$PREVIOUS" > "$ROOT/results/initial-provenance.json"
finish() {
  result=$?
  trap - EXIT
  provenance_result=0
  python3 -E "$Q/retained-images.py" "$PREVIOUS" > "$ROOT/results/final-provenance.json" || provenance_result=$?
  printf '{"stage_exit":%s,"provenance_exit":%s}\n' "$result" "$provenance_result" \
    > "$ROOT/results/continuation-exit.json"
  if [[ $provenance_result != 0 ]]; then result=1; fi
  exit "$result"
}
trap finish EXIT
BASE_TREE="$PREVIOUS/base"
CANDIDATE_TREE="$PREVIOUS/candidate"
BASE_JDK="$BASE_TREE/build/zip-qual/images/jdk"
CANDIDATE_JDK="$CANDIDATE_TREE/build/zip-qual/images/jdk"
export ZIP_REUSE_MODE=1
cp "$PREVIOUS/results/base-Serial-tests.log" "$ROOT/results/base-Serial-tests.log"
cp -a "$PREVIOUS/results/base-Serial-test-results" "$ROOT/results/base-Serial-test-results"
printf 'review=%s\nretained-builds=559703d10cbbaba18e59b8147a532eb81b1b77be\nbaseline-Serial=reused-completed-controls\n' "$C" \
  > "$ROOT/results/continuation-identities.log"
source "$Q/run-stages.sh"
