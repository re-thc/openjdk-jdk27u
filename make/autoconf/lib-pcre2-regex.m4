#
# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
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

# Bundled PCRE2 has no external build-time package fetch or Cargo dependency.
AC_DEFUN_ONCE([LIB_SETUP_PCRE2_REGEX], [
  PCRE2_REGEX_DEFAULT=no
  case "$OPENJDK_TARGET_OS-$OPENJDK_TARGET_CPU" in
    linux-x86_64|linux-aarch64|macosx-x86_64|macosx-aarch64) PCRE2_REGEX_DEFAULT=yes ;;
  esac
  AC_ARG_ENABLE([pcre2-regex], [AS_HELP_STRING([--disable-pcre2-regex],
      [omit the bundled PCRE2 regex engine (default: enabled on supported targets)])],
      [], [enable_pcre2_regex=$PCRE2_REGEX_DEFAULT])
  PCRE2_REGEX_ENABLED=false
  if test "x$enable_pcre2_regex" = xyes; then
    if test "x$PCRE2_REGEX_DEFAULT" != xyes; then
      AC_MSG_ERROR([PCRE2 regex currently supports Linux/macOS x86_64 and AArch64])
    fi
    PCRE2_REGEX_ENABLED=true
  elif test "x$enable_pcre2_regex" != xno; then
    AC_MSG_ERROR([--enable-pcre2-regex accepts yes or no])
  fi
  AC_SUBST(PCRE2_REGEX_ENABLED)
])
