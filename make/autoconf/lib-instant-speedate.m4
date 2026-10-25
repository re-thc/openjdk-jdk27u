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

AC_DEFUN([LIB_CHECK_INSTANT_SPEEDATE_AVAILABLE],
[
speedate_unavailable=
SPEEDATE_RUST_FEATURES=
# Match the fork's native build baseline, not the build host's CPU. Keep the
# Windows AVX2 profile distinct from Linux's complete x86-64-v3 requirement.
case "$OPENJDK_TARGET_OS:$OPENJDK_TARGET_CPU:$OPENJDK_TARGET_LIBC" in
  (linux:x86_64:gnu) SPEEDATE_RUST_TARGET=x86_64-unknown-linux-gnu; SPEEDATE_RUST_CPU=x86-64-v3 ;;
  (linux:aarch64:gnu)
    SPEEDATE_RUST_TARGET=aarch64-unknown-linux-gnu
    SPEEDATE_RUST_CPU=generic
    # Stable Rust names for the userspace additions through Armv8.2-A. FP16,
    # crypto, dot-product and SVE extensions are not part of this baseline.
    SPEEDATE_RUST_FEATURES=+crc,+lse,+rdm,+dpb ;;
  (macosx:aarch64:*) SPEEDATE_RUST_TARGET=aarch64-apple-darwin; SPEEDATE_RUST_CPU=apple-m1 ;;
  (windows:x86_64:*)
    SPEEDATE_RUST_TARGET=x86_64-pc-windows-msvc
    SPEEDATE_RUST_CPU=x86-64
    SPEEDATE_RUST_FEATURES=+avx2,+fma ;;
  (*) speedate_unavailable="unsupported target" ;;
esac
if test "x$COMPILE_TYPE" = xcross; then
  speedate_unavailable="cross compilation"
fi
if test "x$enable_instant_speedate" != xno && test -z "$speedate_unavailable"; then
  UTIL_LOOKUP_PROGS(CARGO, cargo)
  UTIL_LOOKUP_PROGS(RUSTC, rustc)
  if test -z "$CARGO" || test -z "$RUSTC"; then
    speedate_unavailable="installed Cargo and Rust 1.88 or newer are required"
  else
    # Probes and make must not install a toolchain through rustup shims.
    UTIL_GET_EXECUTABLE(CARGO)
    speedate_cargo_simple=$fixpath_stripped
    UTIL_GET_EXECUTABLE(RUSTC)
    if test "x$speedate_cargo_simple" != "x$CARGO_EXECUTABLE" || \
        test "x$fixpath_stripped" != "x$RUSTC_EXECUTABLE"; then
      speedate_unavailable="Cargo and rustc must name executables without arguments"
    else
      rust_version_output=`RUSTUP_AUTO_INSTALL=0 $RUSTC --version 2>>config.log` || rust_version_output=
      rust_version=`$ECHO "$rust_version_output" | $CUT -d ' ' -f 2`
      rust_major=`$ECHO "$rust_version" | $CUT -d . -f 1`
      rust_minor=`$ECHO "$rust_version" | $CUT -d . -f 2`
      case "$rust_major:$rust_minor" in
        (*[[!0-9:]]*|:|*:) speedate_unavailable="cannot determine the installed Rust version" ;;
        (*)
          if test "$rust_major" -lt 1 || { test "$rust_major" -eq 1 && test "$rust_minor" -lt 88; }; then
            speedate_unavailable="installed Rust 1.88 or newer is required"
          fi ;;
      esac
    fi
  fi
  if test -z "$speedate_unavailable"; then
    rust_std_dir=`RUSTUP_AUTO_INSTALL=0 $RUSTC --print target-libdir --target "$SPEEDATE_RUST_TARGET" 2>>config.log` || rust_std_dir=
    rust_sysroot=`RUSTUP_AUTO_INSTALL=0 $RUSTC --print sysroot 2>>config.log` || rust_sysroot=
    UTIL_FIXUP_PATH(rust_std_dir, NOFAIL)
    UTIL_FIXUP_PATH(rust_sysroot, NOFAIL)
    SPEEDATE_RUST_LICENSE="$rust_sysroot/share/doc/rust/COPYRIGHT-library.html"
    if test ! -d "$rust_std_dir" || test ! -f "$SPEEDATE_RUST_LICENSE" || \
        ! $LS "$rust_std_dir"/libstd-*.rlib >/dev/null 2>&1; then
      speedate_unavailable="installed target standard library and COPYRIGHT-library.html are required"
    fi
  fi
fi
if test -n "$speedate_unavailable"; then
  AC_MSG_NOTICE([speedate native parser unavailable: $speedate_unavailable])
  AVAILABLE=false
fi
])

AC_DEFUN_ONCE([LIB_SETUP_INSTANT_SPEEDATE],
[
  speedate_check_available() {
    LIB_CHECK_INSTANT_SPEEDATE_AVAILABLE
  }
  UTIL_ARG_ENABLE(NAME: instant-speedate, DEFAULT: auto,
      RESULT: ENABLE_INSTANT_SPEEDATE,
      DESC: [build the bounded Rust speedate Instant.parse library],
      CHECKING_MSG: [if the speedate Instant parser should be built],
      CHECK_AVAILABLE: [speedate_check_available],
      IF_ENABLED: [
        AC_MSG_NOTICE([speedate uses installed Rust $rust_version for $SPEEDATE_RUST_TARGET ($SPEEDATE_RUST_CPU $SPEEDATE_RUST_FEATURES)])
      ],
      IF_DISABLED: [
        CARGO=
        RUSTC=
        CARGO_EXECUTABLE=
        RUSTC_EXECUTABLE=
        SPEEDATE_RUST_TARGET=
        SPEEDATE_RUST_CPU=
        SPEEDATE_RUST_FEATURES=
        SPEEDATE_RUST_LICENSE=
      ])
  AC_SUBST(ENABLE_INSTANT_SPEEDATE)
  AC_SUBST(CARGO)
  AC_SUBST(RUSTC)
  AC_SUBST(CARGO_EXECUTABLE)
  AC_SUBST(RUSTC_EXECUTABLE)
  AC_SUBST(SPEEDATE_RUST_TARGET)
  AC_SUBST(SPEEDATE_RUST_CPU)
  AC_SUBST(SPEEDATE_RUST_FEATURES)
  AC_SUBST(SPEEDATE_RUST_LICENSE)
])
