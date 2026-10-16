#!/usr/bin/env bash
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
repo=$(cd "$here/../../.." && pwd)
: "${JAVA_HOME:?Set JAVA_HOME to the normally built production JDK}"
out=${HEX_SIMD_OUT:-"$repo/build/hex-simd-production"}
# Only the unchanged reference class is patched in. HexFormat, its helper and
# libhexsimd come from the normally built JDK. No FFM or native-access override.
exec "$JAVA_HOME/bin/java" --patch-module "java.base=$out/patch" \
    --add-exports java.base/jdk.internal.util=ALL-UNNAMED \
    ${JAVA_OPTS:-} -cp "$out/classes" "$@"
