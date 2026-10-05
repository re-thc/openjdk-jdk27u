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

# Rust regex is enabled by default on supported targets; builders can opt out.
AC_DEFUN_ONCE([LIB_SETUP_RUST_REGEX], [
  RUST_REGEX_DEFAULT=no
  case "$OPENJDK_TARGET_OS-$OPENJDK_TARGET_CPU" in
    linux-x86_64|linux-aarch64)
      if test "x$OPENJDK_TARGET_LIBC" = xgnu; then
        RUST_REGEX_DEFAULT=yes
      fi ;;
    macosx-x86_64|macosx-aarch64) RUST_REGEX_DEFAULT=yes ;;
  esac
  AC_ARG_ENABLE([rust-regex], [AS_HELP_STRING([--disable-rust-regex],
      [omit the bundled Rust regex engine (default: enabled on supported targets)])],
      [], [enable_rust_regex=$RUST_REGEX_DEFAULT])
  AC_ARG_WITH([rust-regex-license], [AS_HELP_STRING([--with-rust-regex-license],
      [Rust standard library copyright notices from the matching toolchain])])
  RUST_REGEX_ENABLED=false
  if test "x$enable_rust_regex" = xyes; then
    if test "x$OPENJDK_TARGET_CPU" != xx86_64 && test "x$OPENJDK_TARGET_CPU" != xaarch64; then
      AC_MSG_ERROR([Rust regex requires x86_64 or aarch64])
    fi
    case "$OPENJDK_TARGET_OS" in
      linux)
        if test "x$OPENJDK_TARGET_LIBC" != xgnu; then
          AC_MSG_ERROR([Rust regex currently requires GNU libc on Linux])
        fi
        RUST_REGEX_TARGET="$OPENJDK_TARGET_CPU-unknown-linux-gnu" ;;
      macosx) RUST_REGEX_TARGET="$OPENJDK_TARGET_CPU-apple-darwin" ;;
      *) AC_MSG_ERROR([Rust regex currently supports Linux and macOS]) ;;
    esac
    UTIL_LOOKUP_PROGS(CARGO, cargo)
    if test "x$CARGO" = x; then
      AC_MSG_ERROR([Rust regex requires Cargo and Rust 1.85 or newer; use --disable-rust-regex to omit it])
    fi
    UTIL_REQUIRE_PROGS(RUSTC, rustc)
    RUSTC_VERSION=`$RUSTC --version | $CUT -d " " -f 2`
    AS_VERSION_COMPARE([$RUSTC_VERSION], [1.85.0],
        [AC_MSG_ERROR([Rust regex requires Rust 1.85 or newer])], [], [])
    RUST_REGEX_LICENSE="$with_rust_regex_license"
    if test "x$RUST_REGEX_LICENSE" = x; then
      RUST_SYSROOT=`$RUSTC --print sysroot`
      RUST_REGEX_LICENSE="$RUST_SYSROOT/share/doc/rust/COPYRIGHT-library.html"
      if test ! -f "$RUST_REGEX_LICENSE"; then
        RUST_REGEX_LICENSE="$RUST_SYSROOT/share/doc/rust/COPYRIGHT.html"
      fi
    fi
    if test ! -f "$RUST_REGEX_LICENSE"; then
      AC_MSG_ERROR([Rust copyright notices are missing; install rust-docs or use --with-rust-regex-license])
    fi
    UTIL_FIXUP_PATH(RUST_REGEX_LICENSE)
    RUST_REGEX_ENABLED=true
  elif test "x$enable_rust_regex" != x && test "x$enable_rust_regex" != xno; then
    AC_MSG_ERROR([--enable-rust-regex accepts yes or no])
  fi
  AC_SUBST(CARGO)
  AC_SUBST(RUST_REGEX_ENABLED)
  AC_SUBST(RUST_REGEX_TARGET)
  AC_SUBST(RUST_REGEX_LICENSE)
])
