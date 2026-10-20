#!/usr/bin/env bash
set -euo pipefail
cd /workspace/sz-candidate
source /workspace/toolchains/activate.sh
/workspace/toolchains/gcc16/bin/gcc -O2 -g -fsanitize=address,undefined -fno-sanitize-recover=all -I/workspace/toolchains/jdk27/include -I/workspace/toolchains/jdk27/include/linux -Isrc/hotspot/share/include -Isrc/hotspot/os/posix/include -Isrc/java.base/share/native/libjava -Isrc/java.base/share/native/libjava/stringzilla /workspace/sz-evidence/kernel-main.c -o /workspace/sz-evidence/scans-kernel-sanitize > /workspace/sz-evidence/kernel-compile.log 2>&1
/workspace/sz-evidence/scans-kernel-sanitize > /workspace/sz-evidence/kernel-sanitize.log 2>&1
