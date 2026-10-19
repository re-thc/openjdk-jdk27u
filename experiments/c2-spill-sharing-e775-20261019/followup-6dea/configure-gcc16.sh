#!/usr/bin/env bash
set -euo pipefail
source /workspace/toolchains/activate.sh
cd /workspace/work/spill-sharing/v5
build_level=$1
configuration_name=${2:-spill-v5-$build_level}
CC=/workspace/toolchains/gcc16/bin/gcc CXX=/workspace/toolchains/gcc16/bin/g++ bash configure \
  --with-conf-name="$configuration_name" --with-jobs=4 \
  --with-debug-level="$build_level" --with-native-debug-symbols=none \
  --with-version-opt=spillsharing --with-source-date=1792181715 \
  --with-boot-jdk=/workspace/toolchains/jdk27 \
  --with-jtreg=/workspace/toolchains/jtreg83 \
  --with-gtest=/workspace/work/spill-sharing/deps/googletest-1.17.0 \
  --with-freetype=system \
  --with-freetype-include=/workspace/toolchains/sysroot/usr/include/freetype2 \
  --with-freetype-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu \
  --with-extra-ldflags='-fuse-ld=mold -B/workspace/toolchains/mold/bin' \
  --x-includes=/workspace/toolchains/sysroot/usr/include \
  --x-libraries=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu \
  --with-cups-include=/workspace/toolchains/sysroot/usr/include \
  --with-fontconfig-include=/workspace/toolchains/sysroot/usr/include \
  --with-alsa-include=/workspace/toolchains/sysroot/usr/include \
  --with-alsa-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu
