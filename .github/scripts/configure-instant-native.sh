#!/usr/bin/env bash
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
set -euo pipefail

rustc=$INSTANT_RUSTC
cargo=$INSTANT_CARGO
options=()
if [[ $RUNNER_OS == Windows ]]; then
  rustc=$(cygpath -u "$rustc")
  cargo=$(cygpath -u "$cargo")
  options+=(--with-toolchain-version=2026 --with-msvc-toolset-version=14.44)
  options+=("GIT=$(cygpath -u "$INSTANT_GIT")")
else
  options+=(--with-zlib=system --with-native-debug-symbols-level=1)
fi

# Deliberately omit --enable-instant-speedate: this must exercise the default.
bash bin/configure-dev --with-conf-name=instant-native-validation \
  --with-debug-level=release --with-jobs=4 --disable-javac-server \
  "--with-version-opt=$GITHUB_SHA" "--with-boot-jdk=$1" \
  --with-jmod-compress=zip-1 --with-external-symbols-in-bundles=none \
  "CARGO=$cargo" "RUSTC=$rustc" "${options[@]}"
