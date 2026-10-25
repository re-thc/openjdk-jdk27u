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

# Exercise the real wrapper's first-generation and cached second configuration.
# Product configure does not require Autoconf when it can reuse generated code;
# configure-generating tests must discover it independently.
set -euo pipefail
configured_autoconf=$1
repo_root=$2
work=$3
. "$repo_root/test/make/autoconf/autoconf-common.sh"
find_autoconf "$configured_autoconf"
selected_autoconf=$AUTOCONF
mkdir -p "$work"
work=$(cd "$work" && pwd)
fixture="$work/source"
mkdir -p "$fixture/make/autoconf"
cat > "$fixture/make/autoconf/configure.ac" <<'M4'
AC_INIT([cached-configure-discovery-test], [1])
AC_CONFIG_SRCDIR([spec.gmk.in])
AC_ARG_WITH([conf-name], [], [], [AC_MSG_ERROR([conf-name required])])
AC_SUBST(AUTOCONF)
AC_CONFIG_FILES([$with_conf_name.gmk:spec.gmk.in])
AC_OUTPUT
M4
printf '%s\n' 'AUTOCONF := @AUTOCONF@' > "$fixture/spec.gmk.in"
rm -f "$fixture/build/.configure-support/generated-configure.sh"
(
  cd "$fixture"
  unset AUTOCONF
  export PATH="$(dirname "$selected_autoconf"):$PATH"
  bash "$repo_root/make/autoconf/configure" CHECKME "$fixture" \
      --srcdir="$fixture" --with-conf-name=release > "$work/release.log" 2>&1
  cp build/.configure-support/generated-configure.sh "$work/first-configure.sh"
  bash "$repo_root/make/autoconf/configure" CHECKME "$fixture" \
      --srcdir="$fixture" --with-conf-name=fastdebug > "$work/fastdebug.log" 2>&1
  cmp "$work/first-configure.sh" build/.configure-support/generated-configure.sh
)
first=$(sed -n 's/^AUTOCONF := *//p' "$fixture/release.gmk")
second=$(sed -n 's/^AUTOCONF := *//p' "$fixture/fastdebug.gmk")
[[ -n $first && -x $first && -z $second ]]
# A bad explicit executable must fail rather than silently use a different tool.
if (find_autoconf "$work/missing-autoconf") > "$work/missing.log" 2>&1; then
  echo 'Invalid configured Autoconf was accepted' >&2; exit 1
fi
if (PATH="$work/no-tools"; find_autoconf '') > "$work/no-path.log" 2>&1; then
  echo 'Missing Autoconf on PATH was accepted' >&2; exit 1
fi
grep -q 'Autoconf is required' "$work/missing.log"
grep -q 'Autoconf is required' "$work/no-path.log"
# Pass the actual empty second-configuration value to the policy tests. No
# inherited AUTOCONF variable or command-line make override can mask discovery.
(
  unset AUTOCONF
  export PATH="$(dirname "$selected_autoconf"):$PATH"
  bash "$repo_root/test/make/autoconf/test-headless.sh" "$second" \
      "$repo_root" "$work/policy"
)
echo 'Cached second-configuration Autoconf discovery passed.'
