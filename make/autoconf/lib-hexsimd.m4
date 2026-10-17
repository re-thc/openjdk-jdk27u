#
# Copyright (c) 2026, Harry Chan. All rights reserved.
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

AC_DEFUN_ONCE([LIB_SETUP_HEX_SIMD],
[
  UTIL_ARG_ENABLE(NAME: hex-simd, DEFAULT: false, RESULT: ENABLE_HEX_SIMD,
      DESC: [build the optional Rust-backed HexFormat library])
  AC_ARG_WITH(rust-runtime-notices,
      [AS_HELP_STRING([--with-rust-runtime-notices=<path>],
          [Rust standard library copyright/license directory (normally in rustc sysroot)])])

  if test "x$ENABLE_HEX_SIMD" = xtrue; then
    if test "x$COMPILE_TYPE" != xnative; then
      AC_MSG_ERROR([--enable-hex-simd currently supports native builds only])
    fi
    case "$OPENJDK_TARGET_OS-$OPENJDK_TARGET_CPU" in
      linux-x86_64) HEX_SIMD_RUST_TARGET=x86_64-unknown-linux-gnu ;;
      linux-aarch64) HEX_SIMD_RUST_TARGET=aarch64-unknown-linux-gnu ;;
      macosx-aarch64) HEX_SIMD_RUST_TARGET=aarch64-apple-darwin ;;
      windows-x86_64) HEX_SIMD_RUST_TARGET=x86_64-pc-windows-msvc ;;
      *) AC_MSG_ERROR([--enable-hex-simd is unsupported on $OPENJDK_TARGET_OS-$OPENJDK_TARGET_CPU]) ;;
    esac

    UTIL_REQUIRE_PROGS(CARGO, cargo)
    UTIL_REQUIRE_PROGS(RUSTC, rustc)
    # Cargo's RUSTC environment variable takes one executable, not a shell
    # command. Keep the normalized command for configure probes, but remove the
    # complete (possibly multiword) fixpath prefix before exporting to make.
    UTIL_GET_EXECUTABLE(RUSTC)
    if test "x$RUSTC" != "x$RUSTC_EXECUTABLE" && \
        test "x$RUSTC" != "x$FIXPATH $RUSTC_EXECUTABLE"; then
      AC_MSG_ERROR([RUSTC must name a single executable without arguments; use a compiler wrapper executable for additional options])
    fi
    AC_MSG_CHECKING([for Cargo version (1.85 or later required)])
    CARGO_VERSION=`$CARGO --version | $CUT -d ' ' -f 2`
    CARGO_MAJOR=`$ECHO "$CARGO_VERSION" | $CUT -d . -f 1`
    CARGO_MINOR=`$ECHO "$CARGO_VERSION" | $CUT -d . -f 2`
    if ! test "$CARGO_MAJOR" -ge 1 2>/dev/null || \
        { test "$CARGO_MAJOR" -eq 1 && ! test "$CARGO_MINOR" -ge 85 2>/dev/null; }; then
      AC_MSG_ERROR([Cargo 1.85 or later is required, found $CARGO_VERSION])
    fi
    AC_MSG_RESULT([$CARGO_VERSION])
    AC_MSG_CHECKING([for rustc version (1.85 or later required)])
    RUSTC_VERSION=`$RUSTC --version | $CUT -d ' ' -f 2`
    RUSTC_MAJOR=`$ECHO "$RUSTC_VERSION" | $CUT -d . -f 1`
    RUSTC_MINOR=`$ECHO "$RUSTC_VERSION" | $CUT -d . -f 2`
    if ! test "$RUSTC_MAJOR" -ge 1 2>/dev/null || \
        { test "$RUSTC_MAJOR" -eq 1 && ! test "$RUSTC_MINOR" -ge 85 2>/dev/null; }; then
      AC_MSG_ERROR([rustc 1.85 or later is required, found $RUSTC_VERSION])
    fi
    AC_MSG_RESULT([$RUSTC_VERSION])

    AC_MSG_CHECKING([for native Rust target])
    RUSTC_HOST=`$RUSTC -vV | $SED -n 's/^host: //p'`
    if test "x$RUSTC_HOST" != "x$HEX_SIMD_RUST_TARGET"; then
      AC_MSG_ERROR([Rust host $RUSTC_HOST does not match $HEX_SIMD_RUST_TARGET])
    fi
    AC_MSG_RESULT([$RUSTC_HOST])

    AC_MSG_CHECKING([for Rust static library system dependencies])
    $ECHO '' > conftest.rs
    HEX_SIMD_NATIVE_LIBS_OUTPUT=`$RUSTC --crate-type staticlib --target "$HEX_SIMD_RUST_TARGET" \
        -C panic=abort --print native-static-libs -o conftest.a conftest.rs 2>&1`
    if test $? -ne 0; then
      AC_MSG_ERROR([Cannot compile Rust static library: $HEX_SIMD_NATIVE_LIBS_OUTPUT])
    fi
    HEX_SIMD_NATIVE_LIBS=`$ECHO "$HEX_SIMD_NATIVE_LIBS_OUTPUT" | $SED -n 's/^note: native-static-libs: //p'`
    $RM conftest.rs conftest.a
    if test "x$HEX_SIMD_NATIVE_LIBS" = x; then
      AC_MSG_ERROR([rustc did not report native-static-libs])
    fi
    AC_MSG_RESULT([$HEX_SIMD_NATIVE_LIBS])

    # Rust's static standard library is linked into libhexsimd. Preserve the
    # notices from the actual compiler, rather than a different Rust release.
    RUST_RUNTIME_NOTICES="$with_rust_runtime_notices"
    if test "x$RUST_RUNTIME_NOTICES" = x; then
      RUST_SYSROOT=`$RUSTC --print sysroot`
      RUST_RUNTIME_NOTICES="$RUST_SYSROOT/share/doc/rust"
    fi
    UTIL_FIXUP_PATH(RUST_RUNTIME_NOTICES)
    # Older Rust releases ship the combined toolchain notice instead of the
    # newer standard-library-only notice. Both contain runtime notices.
    for notice in COPYRIGHT-library.html COPYRIGHT.html COPYRIGHT; do
      if test -f "$RUST_RUNTIME_NOTICES/$notice"; then
        RUST_RUNTIME_COPYRIGHT="$RUST_RUNTIME_NOTICES/$notice"
        break
      fi
    done
    if test "x$RUST_RUNTIME_COPYRIGHT" = x || \
        { test ! -d "$RUST_RUNTIME_NOTICES/licenses" && \
          test ! -f "$RUST_RUNTIME_NOTICES/LICENSE-MIT"; }; then
      AC_MSG_ERROR([Rust runtime notices are required; use --with-rust-runtime-notices pointing to the copyright and license texts for this rustc release])
    fi
    AC_MSG_NOTICE([Hex SIMD uses Cargo's frozen dependency cache; run cargo fetch --locked --manifest-path $TOPDIR/src/java.base/share/native/libhexsimd/rust/Cargo.toml before building])
  fi

  AC_SUBST(ENABLE_HEX_SIMD)
  AC_SUBST(CARGO)
  AC_SUBST(RUSTC)
  AC_SUBST(RUSTC_EXECUTABLE)
  AC_SUBST(RUSTC_VERSION)
  AC_SUBST(HEX_SIMD_RUST_TARGET)
  AC_SUBST(HEX_SIMD_NATIVE_LIBS)
  AC_SUBST(RUST_RUNTIME_NOTICES)
  AC_SUBST(RUST_RUNTIME_COPYRIGHT)
])
