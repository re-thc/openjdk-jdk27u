#!/usr/bin/env python3
#
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
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

"""Test the production configure policy with actual Autoconf macros and fake tools.

Run: python3 test/make/TestInstantSpeedateConfigure.py [repository root]
No Rust/JDK compilation, downloads, or native platform qualification is performed.
Foreign target cases test selection only; all stand-in tools run on this Unix host.
"""
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile


TOOL = '''#!{python}
import json, os, pathlib, sys
args = sys.argv[1:]
name = pathlib.Path(sys.argv[0]).name
assert os.environ.get('RUSTUP_AUTO_INSTALL') == '0'
with open(os.environ['FIXTURE_CALLS'], 'a') as stream:
    stream.write(json.dumps([name, args]) + '\\n')
broken = os.environ.get('FIXTURE_BROKEN')
if name == 'rustc':
    if args == ['--version']:
        print('rustc ' + ('1.87.0' if broken == 'old-rust' else '1.88.0') + ' (fixture)')
        sys.exit(1 if broken == 'version-status' else 0)
    if args[:2] == ['--print', 'target-libdir']:
        assert args[2:] == ['--target', os.environ['FIXTURE_RUST_TARGET']]
        print(os.environ['FIXTURE_STD'])
        sys.exit(1 if broken == 'std-status' else 0)
    if args == ['--print', 'sysroot']:
        print(os.environ['FIXTURE_SYSROOT'])
        sys.exit(1 if broken == 'sysroot-status' else 0)
else:
    assert name == 'cargo' and args[0] == 'metadata', args
    assert '--frozen' in args and '--offline' in args, args
    assert args[args.index('--filter-platform') + 1] == os.environ['FIXTURE_RUST_TARGET']
    assert args[args.index('--manifest-path') + 1] == os.environ['FIXTURE_MANIFEST']
    assert os.environ['RUSTC'] == str(pathlib.Path(sys.argv[0]).with_name('rustc'))
    assert 'CARGO_ENCODED_RUSTFLAGS' not in os.environ
    print('{{"packages": []}}')
    sys.exit(1 if broken == 'offline' else 0)
raise AssertionError('Unexpected tool invocation: ' + repr(args))
'''


def main():
    root = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path(__file__).resolve().parents[2]
    autoconf = os.environ.get('AUTOCONF', 'autoconf')
    bash = shutil.which('bash')
    assert bash, 'An installed bash and Autoconf are required'
    variables = ('ENABLE_INSTANT_SPEEDATE', 'CARGO_EXECUTABLE', 'RUSTC_EXECUTABLE',
                 'SPEEDATE_RUST_TARGET', 'SPEEDATE_RUST_CPU', 'SPEEDATE_RUST_LICENSE')
    with tempfile.TemporaryDirectory(prefix='instant-configure-') as directory:
        work = Path(directory).resolve()
        # Use the repository option/tool/path macros, including named arguments.
        # Restrict PATH only during production probing, never exposing real Rust.
        (work / 'configure.ac').write_text('''AC_INIT([instant-configure-fixture], [1])
m4_include([util.m4])
m4_include([lib-instant-speedate.m4])
ECHO=echo
CUT='{cut}'
DIRNAME='{dirname}'
BASENAME='{basename}'
LS='{ls}'
TOPDIR='{root}'
FIXPATH=
OPENJDK_BUILD_OS=linux
OPENJDK_TARGET_OS=$FIXTURE_OS
OPENJDK_TARGET_CPU=$FIXTURE_CPU
OPENJDK_TARGET_LIBC=$FIXTURE_LIBC
COMPILE_TYPE=$FIXTURE_COMPILE_TYPE
CONFIGURE_OVERRIDDEN_VARIABLES=
fixture_saved_path=$PATH
PATH=$FIXTURE_TOOLS
LIB_SETUP_INSTANT_SPEEDATE
PATH=$fixture_saved_path
AC_CONFIG_FILES([result])
AC_OUTPUT
'''.format(root=root, **{name: shutil.which(name) for name in ('cut', 'dirname', 'basename', 'ls')}))
        (work / 'result.in').write_text(''.join(f'{name}=@{name}@\n' for name in variables))
        generated = subprocess.run([autoconf, '-I', str(root / 'make/autoconf'),
                                    '-o', 'configure', 'configure.ac'], cwd=work,
                                   text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=60)
        assert generated.returncode == 0, generated.stdout
        cases = 0

        def check(label, *, broken='', option='', target=('linux', 'x86_64', 'gnu'),
                  compile_type='native', enabled=False, succeeds=True,
                  rust_target='x86_64-unknown-linux-gnu', cpu='x86-64', no_probes=False,
                  spaced_tools=False):
            nonlocal cases
            cases += 1
            case = work / f'case-{cases}'
            case.mkdir()
            tools = case / ('spaced tools' if spaced_tools else 'tools')
            tools.mkdir()
            for name in ('env', 'rm'):
                (tools / name).symlink_to(shutil.which(name))
            for name in ('cargo', 'rustc'):
                if broken != 'missing-' + name:
                    executable = tools / name
                    executable.write_text(TOOL.format(python=sys.executable))
                    executable.chmod(0o755)
            std = case / 'std'
            if broken != 'missing-std':
                std.mkdir()
                if broken != 'empty-std':
                    (std / 'libstd-fixture.rlib').touch()
            sysroot = case / 'sysroot'
            notices = sysroot / 'share/doc/rust/COPYRIGHT-library.html'
            notices.parent.mkdir(parents=True)
            if broken != 'missing-notices':
                notices.write_text('fixture notices\n')
            calls = case / 'calls.jsonl'
            env = dict(os.environ, FIXTURE_OS=target[0], FIXTURE_CPU=target[1], FIXTURE_LIBC=target[2],
                       FIXTURE_COMPILE_TYPE=compile_type, FIXTURE_TOOLS=str(tools), FIXTURE_BROKEN=broken,
                       FIXTURE_RUST_TARGET=rust_target, FIXTURE_STD=str(std), FIXTURE_SYSROOT=str(sysroot),
                       FIXTURE_CALLS=str(calls), FIXTURE_MANIFEST=str(root / 'src/java.base/share/native/libinstant/rust/Cargo.toml'),
                       CARGO_ENCODED_RUSTFLAGS='must-be-removed', CONFIG_SHELL=bash)
            for name in ('CARGO', 'RUSTC'):
                env.pop(name, None)
            result = subprocess.run([bash, str(work / 'configure'), *([option] if option else [])],
                                    cwd=case, env=env, text=True, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT, timeout=30)
            assert (result.returncode == 0) == succeeds, label + '\n' + result.stdout
            if succeeds:
                values = dict(line.split('=', 1) for line in (case / 'result').read_text().splitlines())
                assert values['ENABLE_INSTANT_SPEEDATE'] == str(enabled).lower(), label + '\n' + result.stdout
                if enabled:
                    assert values['SPEEDATE_RUST_TARGET'] == rust_target, (label, values)
                    assert values['SPEEDATE_RUST_CPU'] == cpu, (label, values)
                    assert values['CARGO_EXECUTABLE'] == str(tools / 'cargo'), (label, values)
                    assert values['RUSTC_EXECUTABLE'] == str(tools / 'rustc'), (label, values)
                    assert values['SPEEDATE_RUST_LICENSE'] == str(notices), (label, values)
                else:
                    assert all(not values[name] for name in variables[1:]), (label, values)
            else:
                assert 'not available' in result.stdout, label + '\n' + result.stdout
            recorded = [json.loads(line) for line in calls.read_text().splitlines()] if calls.exists() else []
            if no_probes:
                assert not recorded, (label, recorded)
            if enabled:
                assert any(name == 'cargo' for name, _ in recorded), (label, recorded)
            print(label + ' PASS')

        check('default cached Linux x64', enabled=True)
        check('explicit auto cached Linux x64', option='--enable-instant-speedate=auto', enabled=True)
        check('explicit disable never probes', option='--disable-instant-speedate', no_probes=True)
        check('spaced tools auto', spaced_tools=True, no_probes=True)
        check('spaced tools explicit', spaced_tools=True, option='--enable-instant-speedate',
              succeeds=False, no_probes=True)
        for broken in ('missing-cargo', 'missing-rustc', 'old-rust', 'missing-std', 'empty-std',
                       'missing-notices', 'offline', 'version-status', 'std-status', 'sysroot-status'):
            check(broken + ' auto', broken=broken)
            check(broken + ' explicit', broken=broken, option='--enable-instant-speedate', succeeds=False)
        for label, target, compile_type in (
                ('cross', ('linux', 'x86_64', 'gnu'), 'cross'),
                ('unsupported', ('linux', 'ppc64', 'gnu'), 'native'),
                ('musl', ('linux', 'x86_64', 'musl'), 'native')):
            check(label + ' auto', target=target, compile_type=compile_type, no_probes=True)
            check(label + ' explicit', target=target, compile_type=compile_type,
                  option='--enable-instant-speedate', succeeds=False, no_probes=True)
        for target, rust_target, cpu in (
                (('linux', 'aarch64', 'gnu'), 'aarch64-unknown-linux-gnu', 'generic'),
                (('macosx', 'aarch64', ''), 'aarch64-apple-darwin', 'apple-m1'),
                (('windows', 'x86_64', ''), 'x86_64-pc-windows-msvc', 'x86-64')):
            check(target[0] + ' default cached', target=target,
                  enabled=True, rust_target=rust_target, cpu=cpu)
            check(target[0] + ' explicit auto cached', target=target,
                  option='--enable-instant-speedate=auto',
                  enabled=True, rust_target=rust_target, cpu=cpu)
            check(target[0] + ' other-target explicit', target=target, option='--enable-instant-speedate',
                  enabled=True, rust_target=rust_target, cpu=cpu)
            check(target[0] + ' disabled never probes', target=target,
                  option='--disable-instant-speedate', no_probes=True)
            for broken in ('missing-cargo', 'missing-rustc', 'old-rust', 'missing-std',
                           'missing-notices', 'offline'):
                check(target[0] + ' ' + broken + ' auto', target=target, broken=broken,
                      rust_target=rust_target, cpu=cpu)
                check(target[0] + ' ' + broken + ' explicit', target=target, broken=broken,
                      option='--enable-instant-speedate', succeeds=False,
                      rust_target=rust_target, cpu=cpu)
        print(f'{cases} production configure-policy cases PASS; no native code compiled')


if __name__ == '__main__':
    main()
