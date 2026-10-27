#!/bin/bash
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
# or visit www.oracle.com if you need additional information or have any
# questions.
#

# Run both child makefiles used by CI's test-prebuilt, with an independent
# generated spec. Do not let a parent build's SPEC or MAKEFLAGS mask omissions.
set -euo pipefail
make=$1
repo=$2
boot_jdk=$3
image=$4
work=$5
mkdir -p "$work"
work=$(cd "$work" && pwd)
# No jtreg or native test files are used by this pure make regression.
mkdir -p "$work/jtreg" "$work/test-image"
unset MAKEFLAGS MFLAGS SPEC ENABLE_DESKTOP ENABLE_HEADLESS_ONLY
unset SERVER_JVM_COLLECTORS JVM_VARIANTS JVM_FEATURES_server

run_prebuilt() {
  local output=$1
  shift
  "$make" -r -R -I "$repo/make/common" -f "$repo/make/RunTestsPrebuilt.gmk" \
      test-prebuilt-with-exit-code OUTPUTDIR="$output" BOOT_JDK="$boot_jdk" \
      JT_HOME="$work/jtreg" JDK_IMAGE_DIR="$image" TEST_IMAGE_DIR="$work/test-image" \
      TEST=make:prebuilt-spec "$@"
}

run_prebuilt "$work/normal" > "$work/normal.log" 2>&1 || {
  cat "$work/normal.log"
  exit 1
}
# An executed child assertion and the overall result must both be present.
grep -q 'Prebuilt server policy and module graph passed.' "$work/normal.log"
grep -q 'TEST SUCCESS' "$work/normal.log"
test -f "$work/normal/make-support/find-tests.gmk"
test -f "$work/normal/run-test-spec.gmk"
run_prebuilt "$work/pinned" 'SERVER_JVM_COLLECTORS=parallelgc' > "$work/pinned.log" 2>&1 || {
  cat "$work/pinned.log"
  exit 1
}
grep -q 'Prebuilt server policy and module graph passed.' "$work/pinned.log"
grep -q 'TEST SUCCESS' "$work/pinned.log"

reject() {
  local name=$1 expected=$2
  shift 2
  if run_prebuilt "$work/$name" "$@" > "$work/$name.log" 2>&1; then
    echo "Prebuilt policy accepted $name" >&2
    exit 1
  fi
  grep -q "$expected" "$work/$name.log" || {
    cat "$work/$name.log"
    echo "Missing expected policy rejection for $name" >&2
    exit 1
  }
}
reject desktop 'This fork requires ENABLE_DESKTOP=false' ENABLE_DESKTOP=true
reject headless 'This fork requires ENABLE_DESKTOP=false' ENABLE_HEADLESS_ONLY=false
reject excluded 'This fork requires collectors' \
    'JVM_FEATURES_server=g1gc parallelgc serialgc zgc'
reject missing 'This fork requires collectors' 'JVM_FEATURES_server=g1gc serialgc'
reject coordinated 'This fork requires collectors' \
    'SERVER_JVM_COLLECTORS=g1gc parallelgc serialgc zgc' \
    'JVM_FEATURES_server=g1gc parallelgc serialgc zgc'
reject variant 'This fork requires collectors' JVM_VARIANTS=custom \
    'JVM_FEATURES_custom=g1gc parallelgc serialgc zgc'

# A direct reader of the generated spec must enforce the same contract.
if "$make" -r -R -I "$repo/make/common" -f "$repo/test/make/TestPrebuiltSpec.gmk" \
    SPEC="$work/normal/run-test-spec.gmk" ENABLE_DESKTOP=true \
    > "$work/direct.log" 2>&1; then
  echo 'Direct prebuilt spec accepted desktop override' >&2
  exit 1
fi
grep -q 'This fork requires ENABLE_DESKTOP=false' "$work/direct.log"
echo 'Prebuilt spec, child test execution and policy override checks passed.'
