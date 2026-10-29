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

expected=${1:?Usage: verify-gcc.sh VERSION CC CXX MANIFEST}
cc=${2:?Missing C compiler}
cxx=${3:?Missing C++ compiler}
manifest=${4:?Missing toolchain manifest}
identity=()
for compiler in "$cc" "$cxx"; do
  version=$("$compiler" -dumpfullversion -dumpversion)
  banner=$("$compiler" --version)
  banner=${banner%%$'\n'*}
  if [[ $version != "$expected" || ${banner,,} =~ experimental|prerelease|snapshot|trunk ]]; then
    echo "Expected released GCC $expected; $compiler reports: $banner (full version $version)" >&2
    exit 1
  fi
  target=$("$compiler" -dumpmachine)
  if [[ $target != "$(uname -m)-conda-linux-gnu" ]]; then
    echo "Expected native conda-forge GCC; $compiler targets $target" >&2
    exit 1
  fi
  echo "$(readlink -f "$compiler"): $banner; target=$target"
  identity+=("$version" "$banner" "$target")
done

# Include actual drivers/frontends and the entire locked toolchain in ccache identity.
# Hash bytes only, so runner-specific install paths do not change the cache key.
compiler_hash=$({
  printf '%s\n' "${identity[@]}"
  sha256sum "$cc" "$cxx" "$("$cc" -print-prog-name=cc1)" \
    "$("$cxx" -print-prog-name=cc1plus)" "$manifest" | cut -d ' ' -f 1
} | sha256sum | cut -d ' ' -f 1)
if [[ -n ${GITHUB_OUTPUT:-} ]]; then
  echo "identity=gcc-$expected-$compiler_hash" >> "$GITHUB_OUTPUT"
fi
