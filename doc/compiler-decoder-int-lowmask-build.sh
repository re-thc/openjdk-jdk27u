#!/usr/bin/env bash
# Copyright (c) 2026, Harry Chan. All rights reserved.
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

set -euo pipefail
source /workspace/toolchains/activate.sh
common=(
  --with-jobs=4
  --with-boot-jdk=/workspace/toolchains/jdk27
  --with-jtreg=/workspace/toolchains/jtreg83
  --with-freetype=system
  --with-freetype-include=/workspace/toolchains/sysroot/usr/include/freetype2
  --with-freetype-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu
  --with-toolchain-path=/workspace/toolchains/gcc16/bin
  '--with-extra-ldflags=-fuse-ld=mold -B/workspace/toolchains/mold/bin'
  --x-includes=/workspace/toolchains/sysroot/usr/include
  --x-libraries=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu
  --with-cups-include=/workspace/toolchains/sysroot/usr/include
  --with-fontconfig-include=/workspace/toolchains/sysroot/usr/include
  --with-alsa-include=/workspace/toolchains/sysroot/usr/include
  --with-alsa-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu
)
for root in "$1" "$2"; do
  cd "$root"
  test -z "$(git status --porcelain)"
  for mode in release fastdebug; do
    bash configure --with-conf-name="lowmask-$mode" --with-debug-level="$mode" "${common[@]}"
    make CONF="lowmask-$mode" JOBS=4 \
      'BUILD_LIBJVM_handshake.cpp_EXTRA_CXXFLAGS=-Wno-error=nonnull' images
    git rev-parse HEAD > "build/lowmask-$mode/lowmask-source-head.txt"
    sha256sum "build/lowmask-$mode/spec.gmk" \
      "build/lowmask-$mode/images/jdk/bin/java" \
      "build/lowmask-$mode/images/jdk/lib/server/libjvm.so" \
      "build/lowmask-$mode/images/jdk/lib/modules" \
      "build/lowmask-$mode/images/jdk/release" > "build/lowmask-$mode/lowmask-build-sha256.txt"
  done
done
