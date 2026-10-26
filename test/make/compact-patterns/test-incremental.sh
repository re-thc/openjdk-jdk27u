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

# Isolate the real java.base CLDR rule from conversion cost. The jtreg generator
# test separately checks target data and payload equivalence with ordinary parsing.
set -euo pipefail
make=$1
spec=$2
repo=$3
work=$4
bash=$5
mkdir -p "$work"
work=$(cd "$work" && pwd)
rm -rf "$work/cldr" "$work/support" "$work/tzdata"
mkdir -p "$work/cldr/main" "$work/tzdata"
for locale in en ru root ja; do
  printf '%s\n' "$locale" > "$work/cldr/main/$locale.xml"
done
touch "$work/tools.marker" "$work/ZoneName.template"
cat > "$work/converter.sh" <<'CONVERTER'
set -eu
while test $# -gt 0; do
  case "$1" in
    -base) base=$2; shift 2 ;;
    -o) output=$2; shift 2 ;;
    *) shift ;;
  esac
done
mkdir -p "$output"
cat "$base/main/en.xml" "$base/main/ru.xml" "$base/main/root.xml" > "$output/payload"
printf '%s\n' converted >> "$output/invocations"
CONVERTER
marker="$work/support/gensrc/java.base/_cldr-gensrc.marker"
output=$(dirname "$marker")
run() {
  (cd "$repo/make" && "$make" -r -R -I "$repo/make/common" \
      -I "$repo/make/common/modules" -I "$repo/make/modules/java.base" \
      -f "$repo/make/ModuleWrapper.gmk" SPEC="$spec" \
      MODULE=java.base MAKEFILE_PREFIX=Gensrc \
      CLDR_DATA_DIR="$work/cldr" SUPPORT_OUTPUTDIR="$work/support" \
      BUILD_TOOLS_JDK="$work/tools.marker" TZ_DATA_DIR="$work/tzdata" \
      ZONENAME_TEMPLATE="$work/ZoneName.template" \
      TOOL_CLDRCONVERTER="$bash $work/converter.sh" "$marker")
}
count() {
  test "$(wc -l < "$output/invocations" | tr -d ' ')" = "$1"
}
run
count 1
cp "$output/payload" "$work/original-payload"
run
count 1
# Respect filesystems with one-second timestamp resolution.
for locale in ru root; do
  sleep 1
  printf '%s\n' changed >> "$work/cldr/main/$locale.xml"
  run
  if cmp -s "$work/original-payload" "$output/payload"; then
    echo "CLDR $locale edit did not regenerate payload" >&2
    exit 1
  fi
  cp "$output/payload" "$work/original-payload"
done
count 3
sleep 1
touch "$work/cldr/main/ja.xml"
run
count 4
cmp "$work/original-payload" "$output/payload"
run
count 4
echo 'Compact pattern CLDR incremental dependencies passed.'
