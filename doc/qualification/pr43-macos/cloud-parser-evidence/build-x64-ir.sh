#!/usr/bin/env bash
set -euo pipefail
source /workspace/toolchains/activate.sh
cd /workspace/pr43-cloud-20261020/source
test "$(git rev-parse HEAD)" = 2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1
bash bin/configure-dev --with-conf-name=pr43-cloud-x64-ir \
  --with-debug-level=fastdebug --with-jobs=4 \
  --with-boot-jdk=/workspace/toolchains/jdk27 \
  --with-jtreg=/workspace/toolchains/jtreg83 \
  --with-toolchain-path=/workspace/toolchains/gcc16/bin \
  --with-native-debug-symbols=none \
  --with-version-opt=pr43-cloud-2b7b6060bea \
  --with-freetype=system \
  --with-freetype-include=/workspace/toolchains/sysroot/usr/include/freetype2 \
  --with-freetype-lib=/workspace/toolchains/sysroot/usr/lib/x86_64-linux-gnu \
  > /workspace/pr43-cloud-20261020/evidence/configure-x64-ir.log 2>&1
timeout 1800 make CONF=pr43-cloud-x64-ir JOBS=4 jdk \
  > /workspace/pr43-cloud-20261020/evidence/build-x64-ir.log 2>&1
