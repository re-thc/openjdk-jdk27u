#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).

set -euo pipefail
root=$(cd "$(dirname "$0")/.." && pwd)
mkdir -p "$root/deps"
fetch() {
  local name=$1 url=$2 revision=$3
  if [[ ! -d "$root/deps/$name/.git" ]]; then git clone "$url" "$root/deps/$name"; fi
  git -C "$root/deps/$name" fetch origin "$revision"
  git -C "$root/deps/$name" checkout --detach "$revision"
  test "$(git -C "$root/deps/$name" rev-parse HEAD)" = "$revision"
}
fetch highway https://github.com/google/highway.git 1693ca7926ed12c5520623564e465cff97d93374
fetch ips2ra https://github.com/ips4o/ips2ra.git 83f6b76ca308b277b2acc3a36426a3baa3c9cb73
git -C "$root/deps/ips2ra" submodule update --init --recursive
fetch xss https://github.com/numpy/x86-simd-sort.git 6e059b14975df2e3c74260ec905167a1be5a34ca
fetch pdqsort https://github.com/orlp/pdqsort.git b1ef26a55cdb60d236a5cb199c4234c704f46726
# Extract a matching official Debian TBB development package, without installation.
curl -fL https://deb.debian.org/debian/pool/main/o/onetbb/libtbb-dev_2022.1.0-1+deb13u1_amd64.deb -o "$root/deps/libtbb-dev.deb"
dpkg-deb -x "$root/deps/libtbb-dev.deb" "$root/deps/tbb"
