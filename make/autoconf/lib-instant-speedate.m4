# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0

AC_DEFUN_ONCE([LIB_SETUP_INSTANT_SPEEDATE],
[
  UTIL_ARG_ENABLE(NAME: instant-speedate, DEFAULT: false,
      RESULT: ENABLE_INSTANT_SPEEDATE,
      DESC: [build the bounded Rust speedate Instant.parse library],
      CHECKING_MSG: [if the speedate Instant parser should be built])
  if test "x$ENABLE_INSTANT_SPEEDATE" = xtrue; then
    if test "x$COMPILE_TYPE" = xcross || test "x$STATIC_LIBS" = xtrue; then
      AC_MSG_ERROR([instant-speedate currently requires a native, shared-library JDK build])
    fi
    case "$OPENJDK_TARGET_OS:$OPENJDK_TARGET_CPU" in
      linux:x86_64) SPEEDATE_RUST_TARGET=x86_64-unknown-linux-gnu; SPEEDATE_RUST_CPU=x86-64-v3 ;;
      linux:aarch64) SPEEDATE_RUST_TARGET=aarch64-unknown-linux-gnu; SPEEDATE_RUST_CPU=generic ;;
      macosx:aarch64) SPEEDATE_RUST_TARGET=aarch64-apple-darwin; SPEEDATE_RUST_CPU=apple-m1 ;;
      windows:x86_64) SPEEDATE_RUST_TARGET=x86_64-pc-windows-msvc; SPEEDATE_RUST_CPU=x86-64-v3 ;;
      *) AC_MSG_ERROR([instant-speedate supports Linux x64/AArch64, macOS arm64 and Windows x64 only]) ;;
    esac
    UTIL_REQUIRE_PROGS(CARGO, cargo)
    UTIL_REQUIRE_PROGS(RUSTC, rustc)
    rust_version=`$RUSTC --version | $CUT -d ' ' -f 2`
    rust_major=`$ECHO "$rust_version" | $CUT -d . -f 1`
    rust_minor=`$ECHO "$rust_version" | $CUT -d . -f 2`
    if test "$rust_major" -lt 1 || { test "$rust_major" -eq 1 && test "$rust_minor" -lt 88; }; then
      AC_MSG_ERROR([instant-speedate requires the installed Rust compiler to be at least 1.88])
    fi
    rust_std_dir=`$RUSTC --print target-libdir --target "$SPEEDATE_RUST_TARGET"`
    UTIL_FIXUP_PATH(rust_std_dir)
    if test ! -d "$rust_std_dir"; then
      AC_MSG_ERROR([the installed Rust toolchain lacks $SPEEDATE_RUST_TARGET; no toolchain will be installed automatically])
    fi
    AC_MSG_NOTICE([speedate uses installed Rust $rust_version for $SPEEDATE_RUST_TARGET])
    rust_sysroot=`$RUSTC --print sysroot`
    UTIL_FIXUP_PATH(rust_sysroot)
    SPEEDATE_RUST_LICENSE="$rust_sysroot/share/doc/rust/COPYRIGHT-library.html"
    if test ! -f "$SPEEDATE_RUST_LICENSE"; then
      AC_MSG_ERROR([the installed compiler is missing COPYRIGHT-library.html required for packaging its standard library])
    fi
  fi
  AC_SUBST(ENABLE_INSTANT_SPEEDATE)
  AC_SUBST(CARGO)
  AC_SUBST(RUSTC)
  AC_SUBST(SPEEDATE_RUST_TARGET)
  AC_SUBST(SPEEDATE_RUST_CPU)
  AC_SUBST(SPEEDATE_RUST_LICENSE)
])
