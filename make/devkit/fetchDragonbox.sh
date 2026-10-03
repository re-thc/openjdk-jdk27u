#!/usr/bin/env bash
# Fetch only the pinned upstream files into a checksum-verified build cache.
set -euo pipefail
repo_root=$(cd "$(dirname "$0")/../.." && pwd)
revision=beeeef91cf6fef89a4d4ba5e95d47ca64ccb3a44
cache_dir=${1:-"$repo_root/build/third-party/dragonbox/$revision"}
mkdir -p "$cache_dir"
while read -r checksum relative; do
  destination="$cache_dir/$relative"
  mkdir -p "$(dirname "$destination")"
  if ! test -f "$destination" || ! (cd "$cache_dir" && printf '%s  %s\n' "$checksum" "$relative" | sha256sum -c - >/dev/null 2>&1); then
    curl --fail --location --retry 2 "https://raw.githubusercontent.com/jk-jeon/dragonbox/$revision/$relative" -o "$destination.tmp"
    mv "$destination.tmp" "$destination"
  fi
done < "$repo_root/make/data/dragonbox/sha256.txt"
(cd "$cache_dir" && sha256sum -c "$repo_root/make/data/dragonbox/sha256.txt")
printf 'Configure with --with-dragonbox=%s\n' "$cache_dir"
