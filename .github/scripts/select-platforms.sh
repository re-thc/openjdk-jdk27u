#!/usr/bin/env bash
#
# Copyright (c) 2026, re-thc. All rights reserved.
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

set -euo pipefail

platforms=(linux-x64 linux-aarch64 macos-aarch64 windows-x64)
requested="${REQUESTED_PLATFORMS//[[:space:]]/}"

if [[ -n $requested ]]; then
  IFS=',' read -r -a tokens <<< "$requested"
  for token in "${tokens[@]}"; do
    case "$token" in
      linux-x64 | linux-aarch64 | macos-aarch64 | windows-x64 | linux | macos | windows | x64 | aarch64) ;;
      *) echo "Unsupported platform: $token" >&2; exit 1 ;;
    esac
  done
fi

for platform in "${platforms[@]}"; do
  os=${platform%-*}
  arch=${platform##*-}
  included=false
  if [[ -z $requested || ,$requested, == *,$platform,* || ,$requested, == *,$os,* || ,$requested, == *,$arch,* ]]; then
    included=true
  fi
  echo "$platform=$included" >> "$GITHUB_OUTPUT"
done
echo "dry-run=${DRY_RUN:-false}" >> "$GITHUB_OUTPUT"
