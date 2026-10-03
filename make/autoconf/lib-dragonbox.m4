# Pinned external Dragonbox dependency; source is never vendored into the JDK.
AC_DEFUN_ONCE([LIB_SETUP_DRAGONBOX], [
  AC_ARG_WITH([dragonbox], [AS_HELP_STRING([--with-dragonbox=DIR],
      [use the checksum-pinned Dragonbox build cache (default: disabled)])])
  DRAGONBOX_ENABLED=false
  DRAGONBOX_DIR=
  if test "x$with_dragonbox" != x && test "x$with_dragonbox" != xno; then
    if test "x$with_dragonbox" = xyes; then
      AC_MSG_ERROR([--with-dragonbox requires a cache directory; run make/devkit/fetchDragonbox.sh])
    fi
    DRAGONBOX_DIR="$with_dragonbox"
    UTIL_FIXUP_PATH([DRAGONBOX_DIR])
    UTIL_REQUIRE_PROGS(SHA256SUM, [sha256sum])
    AC_MSG_CHECKING([Dragonbox pinned source and license checksums])
    if ! (cd "$DRAGONBOX_DIR" && "$SHA256SUM" -c "$TOPDIR/make/data/dragonbox/sha256.txt" >&AS_MESSAGE_LOG_FD 2>&1); then
      AC_MSG_ERROR([Dragonbox cache does not match the approved pin])
    fi
    AC_MSG_RESULT([verified])
    DRAGONBOX_ENABLED=true
  fi
  AC_SUBST(DRAGONBOX_ENABLED)
  AC_SUBST(DRAGONBOX_DIR)
])
