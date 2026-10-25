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

# Exercise the real launcher checks with Windows-style diagnostic paths and
# line endings, including on hosts without a native Windows JDK.
set -euo pipefail
HEADLESS_LAUNCHER_TEST_JDK=$(cd "$1" && pwd)
export HEADLESS_LAUNCHER_TEST_JDK
check=$(cd "$(dirname "$2")" && pwd)/$(basename "$2")
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT
wrapped="$work/wrapped jdk"
mkdir -p "$wrapped/bin" "$work/temporary files"
export TMPDIR="$work/temporary files"
export HEADLESS_LAUNCHER_TEST_OUTPUT="$work/native-output"

for tool in javac jar; do
  cat > "$wrapped/bin/$tool" <<'TOOL'
#!/bin/bash
exec "$HEADLESS_LAUNCHER_TEST_JDK/bin/$(basename "$0")" "$@"
TOOL
done
cat > "$wrapped/bin/java" <<'JAVA'
#!/bin/bash
set -euo pipefail
status=0
"$HEADLESS_LAUNCHER_TEST_JDK/bin/java" "$@" \
    > "$HEADLESS_LAUNCHER_TEST_OUTPUT.stdout" \
    2> "$HEADLESS_LAUNCHER_TEST_OUTPUT.stderr" || status=$?
stdout=$(< "$HEADLESS_LAUNCHER_TEST_OUTPUT.stdout")
stderr=$(< "$HEADLESS_LAUNCHER_TEST_OUTPUT.stderr")
# Emulate MSYS rewriting a POSIX absolute jar argument for a native tool.
# Relative arguments need no translation. The real JDK still opens the files.
if [[ ${1:-} == -jar && ${2:-} == /* ]]; then
  stderr=${stderr//"$2"/"C:/msys64$2"}
fi
case ${HEADLESS_LAUNCHER_TEST_FAULT:-} in
  status) status=0 ;;
  stdout) stdout='Unexpected standard output' ;;
  diagnostic) stderr='Wrong launcher diagnostic' ;;
esac
[[ -z $stdout ]] || printf '%s\r\n' "${stdout%$'\r'}"
[[ -z $stderr ]] || printf '%s\r\n' "${stderr%$'\r'}" >&2
exit "$status"
JAVA
chmod +x "$wrapped/bin/"*
# The Mac checks inspect the actual retained native libraries too.
if [[ $(uname -s) == Darwin ]]; then
  ln -s "$HEADLESS_LAUNCHER_TEST_JDK/lib" "$wrapped/lib"
fi

if ! bash "$check" "$wrapped" > "$work/normal.log" 2>&1; then
  cat "$work/normal.log" >&2
  exit 1
fi
grep -q 'Headless launcher/archive and native-service checks passed.' "$work/normal.log"
# Portability handling must still reject wrong status, stream or message.
for fault in status stdout diagnostic; do
  if HEADLESS_LAUNCHER_TEST_FAULT=$fault bash "$check" "$wrapped" \
      > "$work/$fault.log" 2>&1; then
    echo "Launcher checks accepted incorrect $fault" >&2
    exit 1
  fi
  grep -q 'Unexpected launcher error' "$work/$fault.log" || {
    cat "$work/$fault.log" >&2
    exit 1
  }
done
echo 'Launcher path, CRLF and diagnostic rejection checks passed.'
