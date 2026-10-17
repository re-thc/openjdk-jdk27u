#!/usr/bin/env python3
# Copyright (c) 2026, re-thc. GPLv2, as described in the repository LICENSE.
"""Portable UBFX assertion-contract fixture using existing JDK/jtreg; no ARM IR credit."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import subprocess

REPO = Path(__file__).resolve().parents[3]
ORIGINAL = 'bf4d2615bf435e8889ef95e48220938505905bbb'
TEST = Path('test/hotspot/jtreg/compiler/c2/aarch64/TestLongBitfieldExtract.java')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--jdk', required=True, type=Path)
    parser.add_argument('--jtreg', required=True, type=Path)
    parser.add_argument('--work', required=True, type=Path, help='Fresh output directory')
    args = parser.parse_args()
    work = args.work.resolve()
    if work.exists() and any(work.iterdir()):
        raise RuntimeError('Use a fresh work directory; existing evidence is not overwritten')
    work.mkdir(parents=True, exist_ok=True)
    java = args.jdk.resolve() / 'bin/java'
    jar = args.jtreg.resolve() / 'lib/jtreg.jar'
    if not java.is_file() or not jar.is_file():
        raise RuntimeError('Supply an existing JDK and jtreg; no installation is attempted')
    before = subprocess.check_output(['git', '-C', str(REPO), 'show', ORIGINAL + ':' + str(TEST)])
    after = (REPO / TEST).read_bytes()
    # All test methods/IR annotations precede @Run. The semantic oracles follow
    # the C2 assertions; both regions must be exactly the original source.
    assert before.split(b'    @Run(')[0] == after.split(b'    @Run(')[0]
    oracle = b'            for (long x : new long[]'
    assert before[before.index(oracle):] == after[after.index(oracle):]
    assert before.count(b'@IR(') == after.count(b'@IR(') == 28
    for side, source in [('before', before), ('after', after)]:
        tree = work / side
        root = tree / 'test/hotspot/jtreg'
        target = tree / TEST
        target.parent.mkdir(parents=True)
        target.write_bytes(source)
        for name in ('TEST.ROOT', 'TEST.groups', 'TEST.quick-groups'):
            shutil.copy2(REPO / 'test/hotspot/jtreg' / name, root / name)
        (root / 'compiler/lib').symlink_to(REPO / 'test/hotspot/jtreg/compiler/lib', target_is_directory=True)
        for name in ('lib', 'jtreg-ext'):
            (tree / 'test' / name).symlink_to(REPO / 'test' / name, target_is_directory=True)
        # Keep all group paths valid without copying the repository or changing
        # TEST.ROOT. Only the one test source is overlaid.
        for relative in ('', 'compiler', 'compiler/c2', 'compiler/c2/aarch64'):
            source_dir = REPO / 'test/hotspot/jtreg' / relative
            dest_dir = root / relative
            for child in source_dir.iterdir():
                dest = dest_dir / child.name
                if not dest.exists():
                    dest.symlink_to(child, target_is_directory=child.is_dir())
    cases = [
        ('before-excluded', 'before', True, True, False, 'extract32 must be C2 compiled'),
        ('after-excluded', 'after', True, True, True, 'test result: Passed'),
        ('after-normal', 'after', False, False, True, 'test result: Passed'),
        ('after-missing-c2', 'after', False, True, False, 'should have been C2 compiled'),
    ]
    results = []
    for name, side, exclude_random, exclude_method, passes, marker in cases:
        output = work / name
        output.mkdir()
        command = [str(java), '-jar', str(jar), '-jdk:' + str(args.jdk.resolve()),
                   '-conc:1', '-retain:all', '-verbose:summary', '-w:' + str(output / 'work'),
                   '-r:' + str(output / 'report'), '-javaoption:-DReportStdout=true',
                   '-javaoption:-DVerifyIR=false', '-javaoption:-Dtest.seed=43']
        if exclude_random:
            command.append('-javaoption:-DExcludeRandom=true')
        if exclude_method:
            command.append('-javaoption:-XX:CompileCommand=exclude,compiler.c2.aarch64.TestLongBitfieldExtract::extract32')
        command.append(str(work / side / TEST))
        (output / 'command.json').write_text(json.dumps(command, indent=2) + '\n')
        print('Running portable contract fixture:', name, flush=True)
        with (output / 'launcher.log').open('w') as stream:
            process = subprocess.run(command, cwd=output, stdout=stream,
                                     stderr=subprocess.STDOUT, timeout=180)
        jtrs = list((output / 'work').rglob('TestLongBitfieldExtract.jtr'))
        text = '\n'.join(path.read_text(errors='replace') for path in jtrs)
        accepted = bool(jtrs) and (process.returncode == 0) == passes and marker in text
        results.append({'case': name, 'returncode': process.returncode,
                        'expected_pass': passes, 'required_marker': marker,
                        'accepted': accepted, 'directory': str(output)})
        print(name + ': ' + ('PASS' if accepted else 'UNEXPECTED RESULT'), flush=True)
        if not accepted:
            break
    receipt = {'original_source': ORIGINAL, 'original_test_sha256': hashlib.sha256(before).hexdigest(),
               'repaired_test_sha256': hashlib.sha256(after).hexdigest(), 'IR_annotations_unchanged': 28,
               'native_AArch64_IR_credit': False, 'cases': results}
    (work / 'result.json').write_text(json.dumps(receipt, indent=2) + '\n')
    if len(results) != len(cases) or not all(result['accepted'] for result in results):
        raise RuntimeError('Contract fixture failed; inspect retained JTR and launcher logs')
    print('All four assertion-contract cases passed. No native AArch64 IR qualification is claimed.')


if __name__ == '__main__':
    main()
