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

# Exercise the real policy/probe macros without needing foreign platform SDKs.
# Tool/library lookup stubs fail if any desktop discovery is attempted.
set -euo pipefail
configured_autoconf=$1
repo_root=$2
work=$3
. "$repo_root/test/make/autoconf/autoconf-common.sh"
find_autoconf "$configured_autoconf"
mkdir -p "$work"
work="$(cd "$work" && pwd)"
cd "$work"
cat > configure.ac <<'M4'
AC_INIT([headless-policy-tests], [1])
m4_include([util.m4])
m4_include([jdk-options.m4])
m4_include([jvm-features.m4])
m4_include([toolchain.m4])
m4_include([libraries.m4])
AC_DEFUN([UTIL_LOOKUP_PROGS], [:])
AC_DEFUN([UTIL_REQUIRE_PROGS], [:])
AC_DEFUN([UTIL_REQUIRE_TOOLCHAIN_PROGS], [:])
AC_DEFUN([UTIL_LOOKUP_TOOLCHAIN_PROGS], [
  case "$1" in
    METAL|METALLIB) AC_MSG_ERROR([unexpected desktop tool probe: $1]) ;;
  esac
])
AC_DEFUN([LIB_SETUP_ZLIB], [AC_MSG_NOTICE([zlib retained])])
AC_DEFUN([LIB_SETUP_LIBJPEG], [AC_MSG_ERROR([unexpected desktop library probe])])
AC_DEFUN([LIB_SETUP_GIFLIB], [AC_MSG_ERROR([unexpected desktop library probe])])
AC_DEFUN([LIB_SETUP_LIBPNG], [AC_MSG_ERROR([unexpected desktop library probe])])
AC_DEFUN([LIB_SETUP_LCMS], [AC_MSG_ERROR([unexpected desktop library probe])])
AC_DEFUN([LIB_SETUP_HARFBUZZ], [AC_MSG_ERROR([unexpected desktop library probe])])
JDKOPT_SETUP_HEADLESS
JVM_FEATURES_PARSE_OPTIONS
JVM_FEATURES_CALCULATE_ACTIVE([server])
JVM_FEATURES_VERIFY([server])
TOOLCHAIN_DETECT_TOOLCHAIN_EXTRA
LIB_SETUP_BUNDLED_LIBS
LIB_SETUP_WINDOWS_JVM_LIBS
AC_MSG_NOTICE([runtime libraries: $BASIC_JVM_LIBS])
AC_OUTPUT
M4
"$AUTOCONF" -I "$repo_root/make/autoconf" -o configure configure.ac

run_configure() {
  env ECHO=echo AWK=awk TR=tr GREP=grep SED=sed SORT=sort OUTPUTDIR="$work/outputs" \
      OPENJDK_TARGET_OS="$target_os" TOOLCHAIN_TYPE="$toolchain" \
      bash ./configure --enable-option-checking=fatal "$@" > result.log 2>&1
}
for target in linux:gcc macosx:clang windows:microsoft; do
  target_os=${target%:*}
  toolchain=${target#*:}
  run_configure
  grep -q 'zlib retained' result.log
  if test "$target_os" = windows; then
    grep -q 'user32.lib' result.log
    grep -q 'winmm.lib' result.log
    if grep -Eq 'gdi32[.]lib|winspool[.]lib|comdlg32[.]lib' result.log; then
      echo 'Desktop JVM libraries retained' >&2; exit 1
    fi
  fi
  run_configure --disable-desktop --enable-headless-only \
      --with-jvm-features=g1gc,serialgc,zgc,-epsilongc,-parallelgc,-shenandoahgc
  echo "Configure policy/probes passed: $target"
done
for option in --enable-desktop --disable-headless-only \
    --enable-jvm-feature-epsilongc --enable-jvm-feature-parallelgc \
    --enable-jvm-feature-shenandoahgc --disable-jvm-feature-serialgc \
    --disable-jvm-feature-g1gc --disable-jvm-feature-zgc \
    --with-jvm-features=parallelgc --with-jvm-features=-g1gc; do
  if run_configure "$option"; then
    echo "Incompatible override accepted: $option" >&2
    exit 1
  fi
  grep -q 'This fork requires' result.log
  echo "Override rejected: $option"
done
# Reconfiguration must reject an old full build without deleting any output.
mkdir -p outputs
printf '%s\n' 'ENABLE_DESKTOP := true' \
    'JVM_FEATURES_server := g1gc parallelgc serialgc zgc' > outputs/spec.gmk
if run_configure; then
  echo 'Stale full-build configuration accepted' >&2; exit 1
fi
grep -q 'Incompatible existing build outputs' result.log
rm outputs/spec.gmk
# Probe guards themselves are checked independently of the product-policy rejection.
sed '/^JDKOPT_SETUP_HEADLESS$/d' configure.ac > probes.ac
"$AUTOCONF" -I "$repo_root/make/autoconf" -o configure probes.ac
for target in linux:gcc macosx:clang windows:microsoft; do
  target_os=${target%:*}
  toolchain=${target#*:}
  ENABLE_DESKTOP=false run_configure
  if ENABLE_DESKTOP=true run_configure; then
    echo 'Probe test did not detect desktop discovery' >&2; exit 1
  fi
  grep -q 'unexpected desktop' result.log
done
# Named module paths must survive Windows path conversion, including quoted
# response-file arguments. Mock environment paths make this portable to Unix.
fixpath() {
  bash "$repo_root/make/scripts/fixpath.sh" -e /bin/true -p /cygdrive \
      -r C:/msys64 -t "$work" -c /bin/true "$@"
}
[[ $(fixpath -m print 'java.base=/cygdrive/c/src:/cygdrive/d/gensrc') == 'java.base=c:/src;d:/gensrc' ]]
[[ $(fixpath -m print 'java.base="/cygdrive/c/src:/cygdrive/d/gensrc"') == 'java.base="c:/src;d:/gensrc"' ]]
[[ $(fixpath print 'java.base=/cygdrive/c/src:/cygdrive/d/gensrc') == 'java.base=c:\src;d:\gensrc' ]]
[[ $(fixpath -m print '/cygdrive/c/src:/cygdrive/d/gensrc') == 'c:/src;d:/gensrc' ]]
[[ $(fixpath -m print 'java.base=/cygdrive/c/src') == 'java.base=c:/src' ]]
printf '%s\n' '--module-source-path' 'java.base="/cygdrive/c/src:/cygdrive/d/gensrc"' > paths.in
fixpath -m convert paths.in paths.out
grep -Fx 'java.base="c:/src;d:/gensrc"' paths.out

echo 'Headless configure and Windows path regression tests passed.'
