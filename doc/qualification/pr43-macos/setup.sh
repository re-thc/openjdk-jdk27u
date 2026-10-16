#!/bin/bash
# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
# Standard public build dependencies only. No qualification or CI execution.
set -euo pipefail
if [[ $(uname -s) != Darwin || $(uname -m) != arm64 ]]; then
  echo 'Requires a native macOS arm64 shell, not Linux/Intel/Rosetta.' >&2; exit 2
fi
for tool in git curl shasum tar unzip python3 autoconf gmake m4 zip xcrun; do
  command -v "$tool" >/dev/null || { echo "Missing standard prerequisite: $tool. Read README.md." >&2; exit 2; }
done
xcrun --find clang >/dev/null
xcrun --sdk macosx --show-sdk-path >/dev/null
if [[ ${1:-} == '' ]]; then echo 'Usage: bash setup.sh /absolute/dependency-directory' >&2; exit 2; fi
mkdir -p "$1"
deps=$(cd "$1" && pwd)
if [[ ! -f "$deps/bootjdk-ready" ]]; then
  curl --fail --location --show-error --output "$deps/bootjdk.tar.gz" 'https://download.java.net/java/GA/jdk26/c3cc523845074aa0af4f5e1e1ed4151d/35/GPL/openjdk-26_macos-aarch64_bin.tar.gz'
  echo "254586bcd1bf6dcd125ad667ac32562cb1e2ab1abf3a61fb117b6fabb571e765  $deps/bootjdk.tar.gz" | shasum -a 256 -c -
  mkdir -p "$deps/bootjdk"
  tar -xzf "$deps/bootjdk.tar.gz" -C "$deps/bootjdk"
  touch "$deps/bootjdk-ready"
fi
boot=$(find "$deps/bootjdk" -path '*/Contents/Home/bin/java' -type f | head -1)
[[ -n "$boot" ]] || { echo 'No macOS Boot JDK found.' >&2; exit 2; }
boot=${boot%/bin/java}
if [[ ! -d "$deps/gtest/.git" ]]; then git clone --no-checkout https://github.com/google/googletest.git "$deps/gtest"; fi
git -C "$deps/gtest" checkout --detach f8d7d77c06936315286eb55f8de22cd23c188571
if [[ ! -d "$deps/jtreg/.git" ]]; then git clone --no-checkout https://github.com/openjdk/jtreg.git "$deps/jtreg"; fi
git -C "$deps/jtreg" checkout --detach 5afa26a21f06e3f231982f0d0abc50c33d68167c
# Scope GNU make to this dependency build; do not change system tools.
mkdir -p "$deps/tools"
if [[ ! -e "$deps/tools/make" ]]; then ln -s "$(command -v gmake)" "$deps/tools/make"; fi
export PATH="$deps/tools:$PATH"
if [[ ! -f "$deps/jtreg/build/images/jtreg/lib/jtreg.jar" ]]; then
  (cd "$deps/jtreg" && bash make/build.sh --jdk "$boot")
fi
python3 - "$deps" "$boot" <<'PY'
import json,sys
from pathlib import Path
deps=Path(sys.argv[1]); data={'boot_jdk':sys.argv[2],'jtreg':str(deps/'jtreg/build/images/jtreg'),'gtest':str(deps/'gtest')}
(deps/'dependencies.json').write_text(json.dumps(data,indent=2)+'\n')
print('Ready:',deps/'dependencies.json')
PY
