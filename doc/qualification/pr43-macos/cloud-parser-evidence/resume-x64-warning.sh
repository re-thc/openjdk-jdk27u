#!/usr/bin/env bash
set -euo pipefail
source /workspace/toolchains/activate.sh
cd /workspace/pr43-cloud-20261020/source
test "$(git rev-parse HEAD)" = 2b7b6060bea2b7ea057bbb52ddb81f63937e9cb1
test -z "$(git status --porcelain --untracked-files=no)"
# First build exited 2, not timeout. Retain every original flag and warning
# suppression; add only nonnull for this one translation unit in this build.
timeout 1800 make CONF=pr43-cloud-x64-ir JOBS=4 \
  'BUILD_LIBJVM_DISABLED_WARNINGS_gcc_handshake.cpp=stringop-overflow nonnull' \
  jdk > /workspace/pr43-cloud-20261020/evidence/build-x64-ir-attempt2.log 2>&1
