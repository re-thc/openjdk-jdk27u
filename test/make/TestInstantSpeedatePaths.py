#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Exercise actual executable extraction and FIXPATH argv/env flow on Unix.

Stand-in .exe scripts do not qualify Windows Rust, ABI, linker, or runtime.
Run: python3 test/make/TestInstantSpeedatePaths.py [repository root]
"""
import os
from pathlib import Path
import subprocess
import sys
import tempfile

root = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path(__file__).resolve().parents[2]
recipe_file = root / 'make/modules/java.base/lib/CoreLibraries.gmk'
recipe = recipe_file.read_text().split('env -u CARGO_ENCODED_RUSTFLAGS', 1)[1]
end = '--target-dir $(SPEEDATE_OUT)'
recipe = 'env -u CARGO_ENCODED_RUSTFLAGS' + recipe[:recipe.index(end) + len(end)].replace('\\\n', ' ')
# Expand the production recipe with make itself, not shell string substitution.
for windows in (False, True):
    with tempfile.TemporaryDirectory(prefix='speedate-paths-') as directory:
        work = Path(directory)
        tools = work / 'c/progra~1/rust/bin'
        tools.mkdir(parents=True)
        rust = tools / 'rustc.exe'
        cargo = tools / 'cargo.exe'
        rust.write_text('#!/bin/sh\n[ "$1" = --version ] || exit 7\nprintf "rustc fixture\\n"\n')
        cargo.write_text('''#!/usr/bin/env python3
import json, os, pathlib, subprocess, sys
actual=os.environ['RUSTC']
assert actual==os.environ['EXPECTED_RUSTC'], actual
assert 'fixpath' not in actual and ' exec ' not in actual,actual
assert 'CARGO_ENCODED_RUSTFLAGS' not in os.environ
assert os.environ['CARGO_BUILD_JOBS']=='2'
assert os.environ['RUSTFLAGS']=='-C target-cpu=x86-64 -C panic=unwind'
assert sys.argv[1:4]==['build','--frozen','--release'],sys.argv
assert sys.argv[sys.argv.index('--manifest-path')+1]==os.environ['EXPECTED_MANIFEST'],sys.argv
assert sys.argv[sys.argv.index('--target-dir')+1]==os.environ['EXPECTED_TARGET'],sys.argv
subprocess.run([os.environ['FIXTURE_RUSTC'], '--version'],check=True,stdout=subprocess.PIPE)
with open(os.environ['FIXTURE_RECORD'],'a') as f:
 f.write(json.dumps({'rustc':actual,'argv':sys.argv[1:]})+'\\n')
''')
        rust.chmod(0o755)
        cargo.chmod(0o755)
        # Explicit settings avoid auto-discovery of Cygwin/WSL tools on Linux.
        fixpath = (f'/bin/bash {root}/make/scripts/fixpath.sh -e /bin/false '
                   f'-p {work} -r X:\\\\env -t {work} -c /bin/false exec') if windows else ''
        (work / 'configure.ac').write_text(f'''AC_INIT([speedate-path-fixture], [1])
m4_include([{root}/make/autoconf/util_paths.m4])
FIXPATH='{fixpath}'
CARGO="$FIXPATH {cargo}"
RUSTC="$FIXPATH {rust}"
if test "x$FIXPATH" = x; then CARGO='{cargo}'; RUSTC='{rust}'; fi
SAVED_CARGO="$CARGO"
SAVED_RUSTC="$RUSTC"
UTIL_GET_EXECUTABLE(CARGO)
UTIL_GET_EXECUTABLE(RUSTC)
test "x$CARGO_EXECUTABLE" = 'x{cargo}' || exit 11
test "x$RUSTC_EXECUTABLE" = 'x{rust}' || exit 12
test "x$CARGO" = "x$SAVED_CARGO" || exit 13
test "x$RUSTC" = "x$SAVED_RUSTC" || exit 14
# Also verify the macro's documented removal of trailing command arguments.
RUSTC="$RUSTC --fixture-argument"
UTIL_GET_EXECUTABLE(RUSTC)
test "x$RUSTC_EXECUTABLE" = 'x{rust}' || exit 15
RUSTC="$SAVED_RUSTC"
AC_SUBST(FIXPATH)
AC_SUBST(CARGO)
AC_SUBST(RUSTC)
AC_SUBST(CARGO_EXECUTABLE)
AC_SUBST(RUSTC_EXECUTABLE)
AC_CONFIG_FILES([paths.mk])
AC_OUTPUT
''')
        (work / 'paths.mk.in').write_text(''.join(f'{v} := @{v}@\n' for v in
            ['FIXPATH','CARGO','RUSTC','CARGO_EXECUTABLE','RUSTC_EXECUTABLE']))
        subprocess.run([os.environ.get('AUTOCONF', 'autoconf'), '-o', 'configure', 'configure.ac'], cwd=work, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        subprocess.run(['/bin/bash', './configure'], cwd=work, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        source = work / 'c/repo/native'
        (source / 'rust').mkdir(parents=True)
        (source / 'rust/Cargo.toml').touch()
        output = work / 'c/build/native'
        output.mkdir(parents=True)
        (work / 'Makefile').write_text('include paths.mk\n'
            f'SPEEDATE_SRC := {source}\nSPEEDATE_OUT := {output}\n'
            'SPEEDATE_RUST_TARGET := x86_64-pc-windows-msvc\n'
            'SPEEDATE_RUST_CPU := x86-64\nall:\n\t' + recipe + '\n')
        def converted(path):
            return 'c:\\' + str(path.relative_to(work / 'c')).replace('/', '\\') if windows else str(path)
        env = dict(os.environ, EXPECTED_RUSTC=converted(rust),
                   EXPECTED_MANIFEST=converted(source / 'rust/Cargo.toml'),
                   EXPECTED_TARGET=converted(output), FIXTURE_RUSTC=str(rust),
                   FIXTURE_RECORD=str(work / 'record.jsonl'),
                   CARGO_ENCODED_RUSTFLAGS='must-be-removed', DEBUG_FIXPATH='1')
        result = subprocess.run(['make', '--no-print-directory', '-f', 'Makefile'], cwd=work,
                                env=env, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        if result.returncode:
            raise AssertionError(result.stdout)
        assert len((work / 'record.jsonl').read_text().splitlines()) == 1
        assert result.stdout.count('fixpath: debug: input:') == (1 if windows else 0),result.stdout
        print(('Windows-path' if windows else 'Unix') + ' extraction/production-recipe fixture PASS')
print('Fixture limits: no native Windows compiler/link/runtime executed.')
