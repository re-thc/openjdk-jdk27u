#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Compile the native contract with explicit declaration errors on AArch64."""
import hashlib
import json
from pathlib import Path
import subprocess

root=Path.cwd();out=root/'validation';out.mkdir(exist_ok=False)
test=root/'test/jdk/java/lang/String'
includes=[root/'pair/fork/include',root/'pair/fork/include/linux',
 root/'src/hotspot/share/include',root/'src/hotspot/os/posix/include',
 root/'src/java.base/share/native/libjava',root/'src/java.base/share/native/libjava/stringzilla']
cmd=['gcc-16','-std=c11','-O2','-fPIC','-shared','-Werror=implicit-function-declaration',
 '-Werror=builtin-declaration-mismatch','-Wno-unknown-pragmas',
 *['-I'+str(p) for p in includes],str(test/'libStringZillaKernelsTest.c'),
 '-o',str(out/'libStringZillaKernelsTest.so')]
with (out/'native-build.log').open('w') as log:
 subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,check=True)
subprocess.run([str(root/'pair/original/bin/javac'),'-d',str(out),str(test/'StringZillaKernelsTest.java')],check=True)
args=[str(root/'pair/fork/bin/java'),'--add-opens=java.base/java.lang=ALL-UNNAMED',
 '-Djava.library.path='+str(out),'-cp',str(out),'StringZillaKernelsTest']
with (out/'native-contract.log').open('w') as log:
 subprocess.run(args,stdout=log,stderr=subprocess.STDOUT,check=True)
(out/'receipt.json').write_text(json.dumps({'compile_command':cmd,'java_command':args,
 'fixture_sha256':hashlib.sha256((test/'libStringZillaKernelsTest.c').read_bytes()).hexdigest(),
 'passed':True},indent=2)+'\n')
