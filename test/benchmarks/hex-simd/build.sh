#!/usr/bin/env bash
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
repo=$(cd "$here/../../.." && pwd)
: "${JAVA_HOME:?Set JAVA_HOME to the normally built production JDK}"
out=${HEX_SIMD_OUT:-"$repo/build/hex-simd-production"}
mkdir -p "$out/reference/java/util" "$out/patch" "$out/classes"
git -C "$repo" show 89885a6288e7aaabd01678a704a586272c0f96e3:src/java.base/share/classes/java/util/HexFormat.java \
    > "$out/reference/HexFormat.original"
python3 - "$out" <<'PY'
import re, sys
from pathlib import Path
out = Path(sys.argv[1])
(out / 'reference/java/util/HexFormatReference.java').write_text(
    re.sub(r'\bHexFormat\b', 'HexFormatReference', (out / 'reference/HexFormat.original').read_text()))
PY
"$JAVA_HOME/bin/javac" -g --patch-module "java.base=$out/reference" -d "$out/patch" \
    "$out/reference/java/util/HexFormatReference.java"
"$JAVA_HOME/bin/javac" --patch-module "java.base=$out/patch" --add-exports java.base/jdk.internal.util=ALL-UNNAMED \
    -d "$out/classes" "$here"/*.java "$repo/test/jdk/java/util/HexFormat/BulkHexFormatTest.java"
