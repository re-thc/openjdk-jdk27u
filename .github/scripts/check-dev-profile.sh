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

jdk=${1:?Usage: check-dev-profile.sh JDK_PATH}
java="$jdk/bin/java"
[[ -x $java ]] || java="$java.exe"
repo_root="$(cd "$(dirname "$0")/../.." && pwd)"
log=$(mktemp)
trap 'rm -f "$log"' EXIT

for gc in Serial G1 Z; do
  "$java" "-XX:+Use${gc}GC" "$repo_root/.github/scripts/DevProfileSmoke.java"
done

for gc in Epsilon Parallel Shenandoah; do
  if "$java" -XX:+UnlockExperimentalVMOptions "-XX:+Use${gc}GC" -version > "$log" 2>&1; then
    echo "Unexpected collector available: $gc" >&2
    exit 1
  fi
  # A startup failure for an unrelated reason must also fail this check.
  if ! grep -Eq 'not supported|Unrecognized VM option' "$log"; then
    cat "$log" >&2
    exit 1
  fi
done

unexpected=$(find "$jdk" -type f \( -iname '*awt*.so' -o -iname '*awt*.dylib' -o -iname '*awt*.dll' \
  -o -iname '*fontmanager*' -o -iname '*splashscreen*' -o -iname '*jsound*' \
  -o -iname '*javajpeg*' -o -iname '*lcms*' -o -iname '*osxapp*' -o -iname '*osxui*' \
  -o -iname 'sound.properties' -o -iname 'javaw.exe' \) -print)
if [[ -n $unexpected ]]; then
  echo "Unexpected desktop files in development image: $unexpected" >&2
  exit 1
fi
echo 'Development profile passed: Serial, G1, ZGC, excluded collectors, no desktop or audio modules, libraries or configuration.'
