#!/usr/bin/env python3
"""Build isolated checksum controls while retaining the same zlib-ng library."""
import argparse
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument('--jdk', type=Path, required=True)
parser.add_argument('--bootjdk', required=True)
parser.add_argument('--profile', required=True)
parser.add_argument('--bash', default='bash')
parser.add_argument('--make', default='make')
parser.add_argument('--cmake', default='')
parser.add_argument('--toolchain', default='')
args = parser.parse_args()
root = Path.cwd()
results = root / 'qualification' / 'controls'
results.mkdir(parents=True, exist_ok=True)
jdk = args.jdk.resolve()
vm_name = 'jvm.dll' if os.name == 'nt' else 'libjvm.dylib'
files = {
    name: (root / name).read_text() for name in (
        'src/hotspot/share/runtime/stubRoutines.cpp',
        'src/hotspot/share/runtime/stubRoutines.hpp',
        'src/hotspot/share/c1/c1_GraphBuilder.cpp',
        'src/hotspot/share/c1/c1_Compiler.cpp',
        'src/hotspot/share/interpreter/abstractInterpreter.cpp',
        'src/hotspot/share/opto/c2compiler.cpp',
        'src/hotspot/cpu/x86/stubGenerator_x86_64_adler.cpp',
        'src/hotspot/cpu/aarch64/stubGenerator_aarch64.cpp',
    )
}
def change(text, old, new):
    if old not in text:
        raise RuntimeError('Control source did not match: ' + old)
    return text.replace(old, new, 1)

def adler_stub(text, arm, direct):
    begin = text.index('address ' + ('' if arm else 'StubGenerator::') + 'generate_updateBytesAdler32()')
    ending = '\n  }' if arm else '\n}'
    end = text.index(ending, begin) + len(ending)
    body = text[begin:end]
    if direct:
        instruction = '__ cmpw(c_rarg2, 1024);' if arm else '__ cmpl(c_rarg2, 1024);'
        body = change(body, instruction, instruction.replace('1024', '0'))
    else:
        body = change(body, 'address bulk_adler = ZipLibrary::adler32_address();', '')
        begin_block = body.index('Label use_simd;') if arm else body.index('if (!VM_Version::supports_avx2())')
        end_block = body.index('__ bind(use_simd);', begin_block) + len('__ bind(use_simd);')
        body = body[:begin_block] + body[end_block:]
    return text[:begin] + body + text[end:]

command = [args.bash, args.profile, '--with-conf-name=control', '--with-debug-level=release',
    '--with-boot-jdk=' + args.bootjdk, '--with-native-debug-symbols=none',
    '--disable-desktop', '--enable-headless-only',
    '--enable-jvm-feature-serialgc', '--enable-jvm-feature-g1gc', '--enable-jvm-feature-zgc',
    '--disable-jvm-feature-parallelgc', '--disable-jvm-feature-shenandoahgc',
    '--disable-jvm-feature-epsilongc', '--with-version-opt=zip-checksum-control']
if args.cmake:
    command.append('CMAKE=' + args.cmake)
command.extend(args.toolchain.split())
subprocess.run(command, check=True)
try:
    for variant in ('direct',):
        changed = dict(files)
        selector = 'src/hotspot/share/runtime/stubRoutines.cpp'
        changed[selector], count = re.subn(
            r'bool StubRoutines::use_zlib_ng_crc32\(\) \{.*?\n\}',
            'bool StubRoutines::use_zlib_ng_crc32() {\n  return ' +
            ('true' if variant == 'direct' else 'false') + ';\n}',
            changed[selector], count=1, flags=re.S)
        if count != 1:
            raise RuntimeError('CRC selector control did not match')
        for name, arm in (('src/hotspot/cpu/x86/stubGenerator_x86_64_adler.cpp', False),
                          ('src/hotspot/cpu/aarch64/stubGenerator_aarch64.cpp', True)):
            changed[name] = adler_stub(changed[name], arm, variant == 'direct')
        if variant == 'direct':
            name = 'src/hotspot/share/runtime/stubRoutines.hpp'
            changed[name] = change(changed[name], 'zlib_ng_crc32_min_length = 64', 'zlib_ng_crc32_min_length = 0')
            name = 'src/hotspot/share/c1/c1_GraphBuilder.cpp'
            changed[name] = change(changed[name],
                '#ifdef AMD64\n  if (callee->intrinsic_id() == vmIntrinsics::_updateBytesAdler32',
                '#if 0\n  if (callee->intrinsic_id() == vmIntrinsics::_updateBytesAdler32')
            name = 'src/hotspot/cpu/aarch64/stubGenerator_aarch64.cpp'
            begin = changed[name].index('address generate_updateBytesCRC32()')
            end = changed[name].index('\n  }', begin) + len('\n  }')
            body = changed[name][begin:end]
            first = body.index('    const Register crc ')
            last = body.index('    // record the stub entry', first)
            body = body[:first] + '    __ lea(r16, RuntimeAddress(ZipLibrary::crc32_address()));\n    __ br(r16);\n\n' + body[last:]
            changed[name] = changed[name][:begin] + body + changed[name][end:]
        else:
            name = 'src/hotspot/share/c1/c1_Compiler.cpp'
            for intrinsic in ('_updateAdler32', '_updateBytesAdler32', '_updateByteBufferAdler32'):
                changed[name] = change(changed[name], '  case vmIntrinsics::' + intrinsic + ':\n', '')
            name = 'src/hotspot/share/interpreter/abstractInterpreter.cpp'
            for intrinsic, kind in (('_updateAdler32', 'update'), ('_updateBytesAdler32', 'updateBytes'),
                                    ('_updateByteBufferAdler32', 'updateByteBuffer')):
                changed[name] = change(changed[name],
                    '      case vmIntrinsics::' + intrinsic + ': return java_util_zip_Adler32_' + kind + ';\n', '')
            name = 'src/hotspot/share/opto/c2compiler.cpp'
            changed[name] = change(changed[name], '  case vmIntrinsics::_updateAdler32:\n', '')
        for name, content in changed.items():
            (root / name).write_text(content)
        with (results / (variant + '-build.log')).open('w') as log:
            subprocess.run([args.make, 'CONF=control', 'hotspot', 'LOG=info'], check=True,
                           stdout=log, stderr=subprocess.STDOUT)
        image = results / variant
        shutil.copytree(jdk, image, dirs_exist_ok=True)
        built = root / 'build/control/jdk' / ('bin/server' if os.name == 'nt' else 'lib/server') / vm_name
        destination = image / ('bin/server' if os.name == 'nt' else 'lib/server') / vm_name
        shutil.copy2(built, destination)
        classes = results / 'tests'
        classes.mkdir(exist_ok=True)
        exe = '.exe' if os.name == 'nt' else ''
        subprocess.run([str(jdk / ('bin/javac' + exe)), '-d', str(classes),
            'test/hotspot/jtreg/compiler/intrinsics/zip/TestFpRegsABI.java'], check=True)
        for mode in (['-Xint'], ['-XX:TieredStopAtLevel=1'], ['-XX:-TieredCompilation']):
            subprocess.run([str(image / ('bin/java' + exe)), '-Xshare:off', '-Xbatch',
                *mode, '-cp', str(classes), 'compiler.intrinsics.zip.TestFpRegsABI'], check=True)
        (results / (variant + '-changes.json')).write_text(
            json.dumps({name: content for name, content in changed.items() if content != files[name]}, indent=2))
finally:
    for name, content in files.items():
        (root / name).write_text(content)
print('Built and ABI-tested the kernel and direct controls')
