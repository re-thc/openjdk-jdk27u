#!/bin/bash
#
# Copyright (c) 2022, 2026, Oracle and/or its affiliates. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
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

# Import common utils
. .github/scripts/report-utils.sh

GITHUB_STEP_SUMMARY="$1"
build_dirs=()
for spec in build/*/spec.gmk; do
  [[ -f "$spec" ]] || continue
  build_dirs+=("${spec%/spec.gmk}")
done
if [[ ${#build_dirs[@]} -eq 0 ]]; then
  echo '::error::Build failed without a configured build directory' >&2
  exit 1
fi

# Send signal to the do-build action that we failed
for build_dir in "${build_dirs[@]}"; do
  touch "$build_dir/build-failure" || exit 1
done

# Collect hs_errs for build-time crashes, e.g. javac, jmod, jlink, CDS.
# These usually land in make/
hs_err_files=$(ls make/hs_err*.log 2> /dev/null || true)

(
  echo '### :boom: Build failure summary'
  echo ''
  echo 'The build failed. Here follows the failure summary from the build.'
  echo '<details><summary><b>View build failure summary</b></summary>'
  echo ''
  echo '```'
  for build_dir in "${build_dirs[@]}"; do
    echo "Configuration: ${build_dir##*/}"
    if [[ -f "$build_dir/make-support/failure-summary.log" ]]; then
      cat "$build_dir/make-support/failure-summary.log"
    else
      echo "Failure summary ($build_dir/make-support/failure-summary.log) not found"
    fi
  done
  echo '```'
  echo '</details>'
  echo ''

  for hs_err in $hs_err_files; do
    echo "<details><summary><b>View HotSpot error log: "$hs_err"</b></summary>"
    echo ''
    echo '```'
    echo "$hs_err:"
    echo ''
    cat "$hs_err"
    echo '```'
    echo '</details>'
    echo ''
  done

  echo ''
  echo ':arrow_right: To see the entire test log, click the job in the list to the left. To download logs, see the `failure-logs` [artifact above](#artifacts).'
) >> $GITHUB_STEP_SUMMARY

truncate_summary
