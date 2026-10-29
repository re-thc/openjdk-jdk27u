#!/usr/bin/env bash
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.  Oracle designates this
# particular file as subject to the "Classpath" exception as provided
# by Oracle in the LICENSE file that accompanied this code.
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
#

set -euo pipefail

version=${1:?Usage: install-gcc.sh VERSION PREFIX}
prefix=${2:?Missing install prefix}
script_dir=$(cd "$(dirname "$0")" && pwd)
case "$(uname -m)" in
  x86_64)
    platform=linux-64
    checksum=9a97976244929bbae28fb1fae504e74a3e7e6d1932870e3a03321f01b7fbd07b
    ;;
  aarch64)
    platform=linux-aarch64
    checksum=890bc4906e6ab17f1b393f0da21547f75e000078e573a156316ec925b92a4a4c
    ;;
  *) echo 'GCC CI supports native Linux x64 and AArch64.' >&2; exit 1 ;;
esac
manifest="$script_dir/../toolchains/gcc-$version-$platform.lock"
installer=$(mktemp -d)
trap 'rm -rf "$installer"' EXIT

# Bootstrap from the same channel as the locked compiler packages.
curl --fail --location --retry 3 \
  "https://conda.anaconda.org/conda-forge/$platform/micromamba-2.10.0-0.tar.bz2" \
  --output "$installer/micromamba.tar.bz2"
echo "$checksum  $installer/micromamba.tar.bz2" | sha256sum --check
tar --extract --file "$installer/micromamba.tar.bz2" --directory "$installer" bin/micromamba
mkdir -p "$HOME/.conda"
"$installer/bin/micromamba" create --no-rc --yes --safety-checks enabled \
  --root-prefix "$installer/root" --prefix "$prefix" --file "$manifest" \
  --cacert-path "${SSL_CERT_FILE:-/etc/ssl/certs/ca-certificates.crt}"

# Expose the native tools to configure without activating a conda environment.
triplet="$(uname -m)-conda-linux-gnu"
for tool in gcc g++ ar as ld nm objcopy objdump ranlib readelf strip; do
  ln -s "$triplet-$tool" "$prefix/bin/$tool"
done
# Configure uses --with-sysroot=/ for the runner's headers and libraries and
# -specs=builtin.specs when linking to omit conda's default environment RPATH.
# The JDK retains its normal static libstdc++/libgcc linkage.
bash "$script_dir/verify-gcc.sh" "$version" "$prefix/bin/gcc" "$prefix/bin/g++" "$manifest"
if [[ -n ${GITHUB_OUTPUT:-} ]]; then
  echo "path=$prefix/bin" >> "$GITHUB_OUTPUT"
fi
