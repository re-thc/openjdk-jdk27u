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

script_dir=$(cd "$(dirname "$0")" && pwd)
fixture=$(mktemp -d)
trap 'rm -rf "$fixture"' EXIT
export GITHUB_OUTPUT="$fixture/output"
unset FAKE_VERSION FAKE_SUFFIX FAKE_TARGET
printf 'fixture manifest\n' > "$fixture/manifest"
cat > "$fixture/compiler" <<'COMPILER'
#!/usr/bin/env bash
case "$1" in
  -dumpfullversion) echo "${FAKE_VERSION:-16.2.0}" ;;
  --version) echo "gcc (conda-forge gcc) ${FAKE_VERSION:-16.2.0} ${FAKE_SUFFIX:-}" ;;
  -dumpmachine) echo "${FAKE_TARGET:-$(uname -m)-conda-linux-gnu}" ;;
  -print-prog-name=*) echo "$0" ;;
  *) exit 1 ;;
esac
COMPILER
chmod +x "$fixture/compiler"
cat > "$fixture/mismatched-cxx" <<'COMPILER'
#!/usr/bin/env bash
export FAKE_VERSION=16.1.0
exec "$(dirname "$0")/compiler" "$@"
COMPILER
chmod +x "$fixture/mismatched-cxx"
check=(bash "$script_dir/verify-gcc.sh" 16.2.0 "$fixture/compiler")
"${check[@]}" "$fixture/compiler" "$fixture/manifest" > /dev/null
initial_identity=$(cat "$GITHUB_OUTPUT")
printf '# changed driver bytes\n' >> "$fixture/compiler"
: > "$GITHUB_OUTPUT"
"${check[@]}" "$fixture/compiler" "$fixture/manifest" > /dev/null
test "$initial_identity" != "$(cat "$GITHUB_OUTPUT")"
for scenario in stale mismatch prerelease wrong-target; do
  reason="Expected released GCC 16.2.0"
  case "$scenario" in
    stale) export FAKE_VERSION=16.0.1; cxx="$fixture/compiler" ;;
    mismatch) cxx="$fixture/mismatched-cxx" ;;
    prerelease) export FAKE_SUFFIX='(experimental)'; cxx="$fixture/compiler" ;;
    wrong-target) export FAKE_TARGET='other-conda-linux-gnu'; cxx="$fixture/compiler"; reason='Expected native conda-forge GCC' ;;
  esac
  : > "$GITHUB_OUTPUT"
  if "${check[@]}" "$cxx" "$fixture/manifest" > "$fixture/log" 2>&1; then
    echo "GCC guard incorrectly accepted $scenario" >&2
    exit 1
  fi
  grep -qF "$reason" "$fixture/log"
  test ! -s "$GITHUB_OUTPUT"
  unset FAKE_VERSION FAKE_SUFFIX FAKE_TARGET
done
echo 'GCC guard: released 16.2.0 accepted; stale, mismatched, prerelease and nonnative compilers rejected.'
