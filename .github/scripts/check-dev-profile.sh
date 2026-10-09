#!/usr/bin/env bash
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
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

jdk=${1:?Usage: check-dev-profile.sh JDK_PATH [SPEC_FILE]}
spec=${2:-"$jdk/../spec.gmk"}
[[ -f $spec ]] || { echo "Missing build configuration: $spec" >&2; exit 1; }

# Check the positive set, including any new upstream feature ending in "gc".
checked_variant=false
while read -r variant features; do
  [[ -n $features ]] || continue
  read -r -a feature_list <<< "$features"
  collectors=$(printf '%s\n' "${feature_list[@]}" | awk '/gc$/' | LC_ALL=C sort | paste -sd ' ' -)
  if [[ $collectors != 'g1gc serialgc zgc' ]]; then
    echo "Unexpected collectors for $variant: $collectors (expected g1gc serialgc zgc)" >&2
    exit 1
  fi
  checked_variant=true
done < <(awk '/^JVM_FEATURES_[a-z]+ *:=/ { sub(/ *:= */, " "); print }' "$spec")
[[ $checked_variant == true ]] || { echo 'No configured JVM variants found.' >&2; exit 1; }

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

for module in java.desktop java.datatransfer java.se jdk.accessibility jdk.editpad \
  jdk.hotspot.agent jdk.jconsole jdk.jpackage jdk.unsupported.desktop; do
  if [[ -e $jdk/jmods/$module.jmod || -L $jdk/jmods/$module.jmod ]]; then
    echo "Unexpected desktop jmod: $module" >&2
    exit 1
  fi
done

unexpected=$(find "$jdk" -type f \( -iname '*awt*.so' -o -iname '*awt*.dylib' -o -iname '*awt*.dll' \
  -o -iname '*fontmanager*' -o -iname '*splashscreen*' -o -iname '*jsound*' \
  -o -iname '*javajpeg*' -o -iname '*lcms*' -o -iname '*osxapp*' -o -iname '*osxui*' \
  -o -iname '*mlib_image*' -o -iname 'jawt*.h' \
  -o -iname 'sound.properties' -o -iname 'javaw.exe' \
  -o -iname 'jconsole' -o -iname 'jconsole.exe' -o -iname 'jhsdb' -o -iname 'jhsdb.exe' \
  -o -iname 'jpackage' -o -iname 'jpackage.exe' \
  -o -iname 'jabswitch.exe' -o -iname 'jaccessinspector.exe' -o -iname 'jaccesswalker.exe' \) -print)
if [[ -n $unexpected ]]; then
  echo "Unexpected desktop files in development image: $unexpected" >&2
  exit 1
fi
echo 'Development profile passed: Serial, G1, ZGC, excluded collectors, no desktop or audio modules, libraries or configuration.'
