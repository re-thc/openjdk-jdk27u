#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. GPL-2.0-only.
# Invoke only through supervise-linux.py after execution is authorized.
set -euo pipefail
: "${ZIP_QUAL_SUPERVISED:?Use the outer supervisor}"
ROOT=${1:?fresh supervised workspace}
C=${2:?full reviewed commit SHA}
shift 2
configure_options=("$@")
for option in "${configure_options[@]}"; do
  case "$option" in
    --with-toolchain-path=*|--with-freetype=*|--with-freetype-include=*|--with-freetype-lib=*|\
    --with-cups-include=*|--with-fontconfig-include=*|--with-alsa-include=*|--with-alsa-lib=*|\
    --x-includes=*|--x-libraries=*) ;;
    *) echo "Only installed dependency-path options are accepted: $option" >&2; exit 2 ;;
  esac
done
: "${BOOT_JDK:?installed Boot JDK 27 required}"
: "${JTREG_HOME:?installed jtreg 8.3 required}"
phase() {
  printf "%s\n" "$1" > "$ROOT/.qualification-phase.next"
  mv -f -- "$ROOT/.qualification-phase.next" "$ROOT/.qualification-phase"
}
jdk_image() {
  printf '%s/%s/build/zip-qual/images/jdk\n' "$ROOT" "$1"
}
phase source-check
python3 -E -B "${BASH_SOURCE[0]%/*}/test-image-layout.py"
python3 -E -B "${BASH_SOURCE[0]%/*}/test-test-selection.py"
python3 -E -B "${BASH_SOURCE[0]%/*}/test-campaign-deadline.py"
phase checkout
B=89885a6288e7aaabd01678a704a586272c0f96e3
git fetch origin master review/zipfile-compact-inflater-cache
test "$(git rev-parse "$C^{commit}")" = "$C"
git cat-file -e "$C:doc/zipfile-inflater-cache/run-qualification.py"
test "$(git rev-parse "$C:src/java.base/share/classes/java/util/zip/ZipFile.java")" = 9943e4f9635c2480f58bdf7c0116432eee00ad51
test "$(git rev-parse "$C:test/jdk/java/util/zip/ZipFile/InflaterCache.java")" = f79e29971e1c8b6dcedea8420a74ad80db914bd1
test "$(git rev-parse "$C:doc/zipfile-inflater-cache/ZipCacheFootprint.java")" = e720f00727bb6c030896d6f914f94dad8d664a47
git worktree add --detach "$ROOT/base" "$B"
git worktree add --detach "$ROOT/candidate" "$C"
mkdir -p "$ROOT/results" "$ROOT/classes"
{
  printf 'baseline=%s\ncandidate=%s\n' "$B" "$C"
  gcc --version
  g++ --version
  "$BOOT_JDK/bin/java" -version
} > "$ROOT/results/input-identities.log" 2>&1
for tree in base candidate; do
  cd "$ROOT/$tree"
  phase "build-$tree"
  timeout --kill-after=30s 10m bash bin/configure-dev --with-conf-name=zip-qual --with-debug-level=release \
    --with-jobs=4 --with-memory-size=8192 --with-boot-jdk="$BOOT_JDK" \
    --with-jtreg="$JTREG_HOME" --with-zlib=system "${configure_options[@]}" \
    > "$ROOT/results/$tree-configure.log" 2>&1
  timeout --kill-after=30s 90m make CONF=zip-qual JOBS=4 jdk-image \
    > "$ROOT/results/$tree-build.log" 2>&1
  image=$(jdk_image "$tree")
  test -x "$image/bin/java" || { echo "Missing packaged launcher: $image/bin/java" >&2; exit 1; }
  for file in release lib/modules lib/server/libjvm.so lib/libzip.so include/jni.h include/linux/jni_md.h; do
    test -f "$image/$file" || { echo "Missing packaged image file: $image/$file" >&2; exit 1; }
  done
  cp build/zip-qual/spec.gmk "$ROOT/results/$tree-spec.gmk"
  cp "$image/release" "$ROOT/results/$tree-release"
  sha256sum "$image/lib/modules" "$image/lib/server/libjvm.so" \
    "$image/lib/libzip.so" > "$ROOT/results/$tree-image-sha256.txt"
done
BASE_JDK=$(jdk_image base)
CANDIDATE_JDK=$(jdk_image candidate)
Q="$ROOT/candidate/doc/zipfile-inflater-cache"

BASE_TREE="$ROOT/base"
CANDIDATE_TREE="$ROOT/candidate"
ZIP_REUSE_MODE=0
source "$Q/run-stages.sh"
