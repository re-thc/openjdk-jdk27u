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
bash "$repo_root/.github/scripts/check-headless-launcher.sh" "$jdk"
work=$(mktemp -d)
log="$work/rejected.log"
trap 'rm -rf "$work"' EXIT

javac="$jdk/bin/javac"
[[ -x $javac ]] || javac="$javac.exe"
"$javac" -d "$work" "$repo_root/.github/scripts/DevProfileSmoke.java"
for gc in Serial G1 Z; do
  "$java" -Xmx256m "-XX:+Use${gc}GC" -cp "$work" DevProfileSmoke
done
for compiler in -XX:TieredStopAtLevel=1 -XX:-TieredCompilation; do
  "$java" -Xmx256m -Xbatch -XX:CompileThreshold=100 -XX:+PrintCompilation "$compiler" \
    -cp "$work" DevProfileSmoke > "$work/compiler.log" 2>&1
  grep -q 'DevProfileSmoke::compute' "$work/compiler.log" || {
    echo "No smoke-method compilation with $compiler" >&2; exit 1;
  }
done
"$java" -Xmx256m "$repo_root/.github/scripts/DevProfileSmoke.java"
"$jdk/bin/javadoc" -quiet -d "$work/docs" "$repo_root/.github/scripts/DevProfileSmoke.java"
"$jdk/bin/jar" --create --file "$work/smoke.jar" -C "$work" DevProfileSmoke.class
"$jdk/bin/jlink" --add-modules java.base,java.logging --output "$work/runtime"
"$work/runtime/bin/java" --list-modules

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
# test-support contains deliberately invalid regression fixtures, not product outputs.
build_dir="$(cd "$(dirname "$spec")" && pwd)"
inputs="$work/inputs"
find "$build_dir/jdk" "$build_dir/support" "$build_dir/hotspot" "$build_dir/buildtools" \
  -path "$build_dir/support/test-support" -prune -o \
  -type f \( -name '*.filelist' -o -name '*.o.cmdline' -o -name '*.obj.cmdline' \) -print > "$inputs"
java_lists=$(find "$build_dir/jdk/modules" -name '*.filelist' | wc -l)
native_commands=$(find "$build_dir/support/native" "$build_dir/hotspot" \
  \( -name '*.o.cmdline' -o -name '*.obj.cmdline' \) | wc -l)
[[ $java_lists -gt 0 && $native_commands -gt 0 ]] || {
  echo 'Missing Java/native compilation records; validate an ordinary build, not just an image.' >&2
  exit 1
}
# Test oracle intentionally independent of Modules.gmk's product policy.
excluded='java[.](desktop|datatransfer|se)|jdk[.](accessibility|editpad|hotspot[.]agent|jconsole|jpackage|unsupported[.]desktop)'
source_pattern="/(src|gensrc)/($excluded)/|/gc/(epsilon|parallel|shenandoah)/|/splashscreen_stubs[.]c"
while IFS= read -r input; do
  if sed 's|\\|/|g' "$input" | grep -En "$source_pattern"; then
    echo "Excluded source in compiler input: $input" >&2
    exit 1
  fi
done < "$inputs"
for command in "$build_dir"/hotspot/variant-*/libjvm/objs/g1CollectedHeap.{o,obj}.cmdline; do
  [[ -f $command ]] || continue
  for collector in EPSILON PARALLEL SHENANDOAH; do
    grep -Eq -- "[-/]DINCLUDE_${collector}GC=0" "$command" || {
      echo "Missing collector exclusion in $command: $collector" >&2; exit 1;
    }
  done
done
# Inspect actual objects as well as command records. Derive forbidden object
# names from the preserved sources, so a stale object without a record fails.
find "$repo_root/src/hotspot" -name '*.cpp' \
  \( -path '*/gc/epsilon/*' -o -path '*/gc/parallel/*' -o -path '*/gc/shenandoah/*' \) \
  | sed 's|.*/||; s/[.]cpp$//' | LC_ALL=C sort -u > "$work/excluded-objects"
find "$build_dir/hotspot" \( -name '*.o' -o -name '*.obj' \) \
  | sed 's|.*/||; s/[.]obj$//; s/[.]o$//' | LC_ALL=C sort -u > "$work/objects"
unexpected=$(LC_ALL=C comm -12 "$work/excluded-objects" "$work/objects")
[[ -z $unexpected ]] || { echo "Excluded GC objects: $unexpected" >&2; exit 1; }
for object in g1CollectedHeap serialHeap zCollectedHeap; do
  grep -qx "$object" "$work/objects" || { echo "Missing supported GC object: $object" >&2; exit 1; }
done
# Reject outputs left from an earlier build even if they are no longer inputs.
unexpected=$(find "$build_dir/jdk" "$build_dir/support" "$build_dir/hotspot" "$build_dir/buildtools" \
  -path "$build_dir/support/test-support" -prune -o \
  -print | grep -E "/($excluded)(/|[.]jmod$)|/(compilefontconfig|dtdbuilder|generatenimbus|icondata|x11wrappergen)/|[.](air|metallib)$" || true)
[[ -z $unexpected ]] || { echo "Excluded build outputs: $unexpected" >&2; exit 1; }
# Product javac must not discover another module through a wildcard source path.
if find "$build_dir/jdk/modules" -name '*.cmdline' -exec grep -En -- \
    '--module-source-path [^ ]*\*|--module-source-path (java[.](desktop|datatransfer|se)|jdk[.](accessibility|editpad|hotspot[.]agent|jconsole|jpackage|unsupported[.]desktop))=' {} +; then
  echo 'Excluded or wildcard module source path exposed to product javac.' >&2
  exit 1
fi
if ! find "$build_dir/support/native/java.base" -name 'java.o.cmdline' -o -name 'java.obj.cmdline' \
    | grep -q .; then
  echo 'Missing libjli compiler record.' >&2; exit 1
fi
for command in "$build_dir"/support/native/java.base/libjli/java.{o,obj}.cmdline; do
  [[ -f $command ]] || continue
  grep -Eq -- '[-/]DHEADLESS' "$command" || { echo "Launcher lacks HEADLESS: $command" >&2; exit 1; }
done
for command in "$build_dir"/hotspot/variant-*/libjvm/objs/os_windows.obj.cmdline; do
  [[ -f $command ]] || continue
  grep -Eq -- '[-/]DHEADLESS' "$command" || { echo "HotSpot lacks HEADLESS: $command" >&2; exit 1; }
done
printf 'Compilation evidence passed: %s product javac lists, %s native compile records.\n' "$java_lists" "$native_commands"
echo 'Development profile passed: Serial, G1, ZGC; no excluded collectors, desktop, audio or Metal compilation or outputs.'
