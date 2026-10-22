#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Reuse three sealed Linux controls and build one final complete candidate."""
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import urllib.request
import zipfile

HERE = Path(__file__).resolve().parent
ROOT = Path.cwd()
PAIR = ROOT / 'pair'
SOURCES = {'original': '416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda',
           'master': '8d030adbd245b19e6339e3ccd052eb7fe3635319',
           'fork': '93a0e98a80ea4807a45cc59a5334483a44b8cec6',
           'prior': 'c17c5cb06297e25681b4dab2eddbd60ceffe0300'}
PRODUCT = '73d8c5581d76e6a395a85ba2ff3f1c2a2be2fc5e'


def module(name):
    spec = importlib.util.spec_from_file_location(name, HERE / (name + '.py'))
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


support = module('support')
prepare = module('prepare')


def write(path, value):
    path.write_text(json.dumps(value, indent=2) + '\n')


def run(command, log):
    with log.open('w') as output:
        result = subprocess.run(command, stdout=output, stderr=subprocess.STDOUT)
    if result.returncode:
        print('\n'.join(log.read_text(errors='replace').splitlines()[-100:]), flush=True)
        result.check_returncode()


PAIR.mkdir()
exclude = Path(subprocess.check_output(['git', 'rev-parse', '--git-path', 'info/exclude'], text=True).strip())
with exclude.open('a') as output:
    output.write('\n' + '\n'.join('/' + name + '/' for name in
        ['pair', 'bootjdk', 'jtreg', '.stringzilla-driver', '.stringzilla-corpus',
         'paired-results', 'process-results', 'validation', 'jtreg-evidence',
         'native-sanitizers', 'candidate-retained']) + '\n')
subprocess.run(['git', 'fetch', '--depth=1', 'origin', SOURCES['original']], check=True)
# Reuse the three complete SDKs from the bounded predecessor run, including
# its independent original. Verify every payload file before execution.
headers = {'Authorization': 'Bearer ' + os.environ['GH_TOKEN'],
           'Accept': 'application/vnd.github+json'}
ident = 12420109804
digest = '95fb34cbacbef3c0d9336e1849228f88753aa486f04cc4ffddf8487a8d86fe1b'
base = 'https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/' + str(ident)
with prepare.OPEN(urllib.request.Request(base, headers=headers)) as response:
    meta = json.load(response)
assert meta['id'] == ident and meta['digest'] == 'sha256:' + digest and not meta['expired']
assert meta['workflow_run']['id'] == 39761363024
assert meta['workflow_run']['head_sha'] == 'a713cc1974d56a838f50746e5ce95d153ec954ac'
archive = PAIR / 'retained-controls.zip'
with prepare.OPEN(urllib.request.Request(base + '/zip', headers=headers)) as source, archive.open('wb') as dest:
    shutil.copyfileobj(source, dest)
assert support.sha(archive) == digest
retained = PAIR / 'retained-controls'
with zipfile.ZipFile(archive) as z:
    assert all(not Path(n).is_absolute() and '..' not in Path(n).parts
               and chr(92) not in n and ':' not in n for n in z.namelist())
    z.extractall(retained)
receipt_paths = list(retained.rglob('original-receipt.json'))
assert len(receipt_paths) == 1
sealed = receipt_paths[0].parent
receipts = {}
for old, label in [('original', 'original'), ('master', 'master')]:
    receipt = json.loads((sealed / (old + '-receipt.json')).read_text())
    inventory = json.loads((sealed / (old + '-inventory.json')).read_text())
    assert receipt['source'] == SOURCES[label] and receipt['clean_source']
    assert receipt['classes_match_build_outputs']
    assert receipt['image_tree_sha256'] == inventory['tree_sha256']
    image = sealed / old
    actual = support.image(image)
    assert actual['files'] == inventory['files'] and actual['tree_sha256'] == inventory['tree_sha256']
    shutil.move(image, PAIR / label)
    # Actions ZIPs omit execute bits; restore the SDK's launchers before use.
    for path in list((PAIR / label / 'bin').iterdir()) + [
            PAIR / label / 'lib/jspawnhelper', PAIR / label / 'lib/jexec']:
        if path.is_file():
            path.chmod(path.stat().st_mode | 0o111)
    for suffix in ['receipt.json', 'inventory.json', 'spec.gmk', 'configure.log']:
        shutil.copyfile(sealed / (old + '-' + suffix), PAIR / (label + '-' + suffix))
    receipts[label] = receipt
    assert receipt['settings'] == receipts['original']['settings']
    assert receipt['compiler_boot_banners'] == receipts['original']['compiler_boot_banners']
    run([str(PAIR / label / 'bin/java'), '-version'], PAIR / (label + '-restored-version.log'))
# The prior is the complete word-probe candidate, restored independently.
original_meta, original_digest = meta, digest
shutil.rmtree(retained)
archive.unlink()
ident = 12424910363
digest = '90d2dc58639b244f6c5213a31b4f82fc31baa045d939f3b0907ce7b1f7ad8cda'
base = 'https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/' + str(ident)
with prepare.OPEN(urllib.request.Request(base, headers=headers)) as response:
    meta = json.load(response)
assert meta['id'] == ident and meta['digest'] == 'sha256:' + digest and not meta['expired']
assert meta['workflow_run']['id'] == 39773662264
assert meta['workflow_run']['head_sha'] == 'bdde16e3fceaf4473a095d8b526d8c337f84e2ea'
archive = PAIR / 'retained-prior.zip'
with prepare.OPEN(urllib.request.Request(base + '/zip', headers=headers)) as source, archive.open('wb') as dest:
    shutil.copyfileobj(source, dest)
assert support.sha(archive) == digest
retained = PAIR / 'retained-prior'
with zipfile.ZipFile(archive) as z:
    assert len(z.namelist()) == len(set(z.namelist()))
    assert all(not Path(n).is_absolute() and '..' not in Path(n).parts
               and chr(92) not in n and ':' not in n for n in z.namelist())
    z.extractall(retained)
paths = list(retained.rglob('fork-receipt.json'))
assert len(paths) == 1
sealed = paths[0].parent
receipt = json.loads(paths[0].read_text())
inventory = json.loads((sealed / 'fork-inventory.json').read_text())
assert receipt['source'] == SOURCES['prior'] and receipt['clean_source'] and receipt['classes_match_build_outputs']
actual = support.image(sealed / 'fork')
assert actual['tree_sha256'] == inventory['tree_sha256'] == receipt['image_tree_sha256']
assert actual['files'] == inventory['files']
shutil.move(sealed / 'fork', PAIR / 'prior')
for path in list((PAIR / 'prior/bin').iterdir()) + [PAIR / 'prior/lib/jspawnhelper', PAIR / 'prior/lib/jexec']:
    if path.is_file():
        path.chmod(path.stat().st_mode | 0o111)
for suffix in ['receipt.json', 'inventory.json', 'spec.gmk', 'configure.log']:
    shutil.copyfile(sealed / ('fork-' + suffix), PAIR / ('prior-' + suffix))
assert receipt['settings'] == receipts['original']['settings']
assert receipt['compiler_boot_banners'] == receipts['original']['compiler_boot_banners']
receipts['prior'] = receipt
run([str(PAIR / 'prior/bin/java'), '-version'], PAIR / 'prior-restored-version.log')
shutil.rmtree(retained)
archive.unlink()
write(PAIR / 'original-master-reuse.json', {'artifact': original_meta, 'verified_zip_sha256': original_digest,
      'complete_file_inventories_verified': True})
write(PAIR / 'control-reuse.json', {'artifact': meta, 'verified_zip_sha256': digest,
      'complete_file_inventories_verified': True,
      'sources': {name: receipt['source'] for name, receipt in receipts.items()}})
for label, source in [('fork', SOURCES['fork'])]:
    subprocess.run(['git', 'checkout', '--detach', source], check=True)
    assert subprocess.check_output(['git', 'rev-parse', 'HEAD'], text=True).strip() == source
    assert not subprocess.check_output(['git', 'status', '--porcelain'], text=True).strip()
    conf = 'fresh-' + label
    run(['bash', 'bin/configure-dev', '--with-conf-name=' + conf, '--with-debug-level=release',
         '--with-boot-jdk=' + os.environ['BOOT_JDK'], '--with-version-opt=stringzilla-benchmark',
         '--with-version-pre=internal', '--with-source-date=1792195200',
         '--with-native-debug-symbols=none', '--with-jmod-compress=zip-1'], PAIR / (label + '-configure-output.log'))
    run(['make', 'CONF=' + conf, 'JOBS=2', 'images'], PAIR / (label + '-build.log'))
    build = ROOT / 'build' / conf
    image = PAIR / label
    shutil.copytree(build / 'images/jdk', image)
    shutil.copyfile(build / 'spec.gmk', PAIR / (label + '-spec.gmk'))
    shutil.copyfile(build / 'configure.log', PAIR / (label + '-configure.log'))
    release = (image / 'release').read_text()
    assert source[:12] in re.search(r'^SOURCE="(.*)"$', release, re.M)[1]
    settings = support.read_spec(PAIR / (label + '-spec.gmk'))
    if receipts:
        assert settings == receipts['original']['settings']
    configure = (build / 'configure.log').read_text()
    banners = [line for line in configure.splitlines()
               if 'Boot JDK version...' in line or 'compiler version' in line]
    assert len(banners) >= 3
    if receipts:
        assert banners == receipts['original']['compiler_boot_banners']
    classes = {}
    for name in ['String', 'StringLatin1', 'StringUTF16'] + (['StringZilla'] if label == 'fork' else []):
        shipped = PAIR / (label + '-classes')
        subprocess.run([str(image / 'bin/jimage'), 'extract', '--include',
                        'glob:**/java/lang/' + name + '.class', '--dir', str(shipped),
                        str(image / 'lib/modules')], check=True)
        actual = shipped / 'java.base/java/lang' / (name + '.class')
        built = build / 'jdk/modules/java.base/java/lang' / (name + '.class')
        assert support.sha(actual) == support.sha(built)
        classes[name] = support.sha(actual)
    inventory = support.image(image)
    write(PAIR / (label + '-inventory.json'), inventory)
    receipts[label] = {'source': source, 'clean_source': True, 'settings': settings,
                       'release': release, 'compiler_boot_banners': banners,
                       'shipped_classes_sha256': classes, 'classes_match_build_outputs': True,
                       'image_tree_sha256': inventory['tree_sha256'],
                       'source_trees': subprocess.check_output(['git', 'ls-tree', 'HEAD',
                                                              'bin', 'make', 'src', 'test'], text=True)}
    write(PAIR / (label + '-receipt.json'), receipts[label])
    print(json.dumps({'complete_image': label, 'source': source,
                      'tree_sha256': inventory['tree_sha256']}), flush=True)
assert subprocess.check_output(['git', 'show', '-s', '--format=%P', SOURCES['fork']], text=True).split() == [SOURCES['master'], PRODUCT]
commands = list((ROOT / 'build/fresh-fork').rglob('StringZillaKernels.o.cmdline'))
assert len(commands) == 1
assert ' -O3 ' in commands[0].read_text() and ' -O1 ' not in commands[0].read_text()
shutil.copyfile(commands[0], PAIR / commands[0].name)
controls = {}
for label, role in [('original', 'original'), ('master', 'master'), ('prior', 'prior'), ('candidate', 'fork'), ('disabled', 'fork')]:
    controls[label] = {'image': str(PAIR / role), 'spec': str(PAIR / (role + '-spec.gmk')),
                       'source': SOURCES[role], 'expected_tree_sha256': receipts[role]['image_tree_sha256']}
    if role in ('original', 'master'):
        controls[label]['baseline'] = True
    if label == 'disabled':
        controls[label]['flags'] = ['-XX:-UseStringZillaIntrinsics']
write(PAIR / 'controls.json', controls)
write(PAIR / 'process-controls.json', {'original': controls['original'], 'prior': controls['master'],
                                     'candidate': controls['candidate'], 'disabled': controls['disabled']})
cases = json.loads((HERE / 'followup-linux-cases.json').read_text())
probe = subprocess.run([str(PAIR / 'fork/bin/java'), '-XX:UseAVX=3', '-XX:+PrintFlagsFinal', '-version'],
                       text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, check=True).stdout
maximum = int(re.search(r'^\s*(?:intx|int)\s+UseAVX\s*=\s*(\d+)', probe, re.M)[1])
assert maximum >= 2
unavailable = [case for case in cases if case.get('avx', 2) > maximum]
selected = [case for case in cases if case not in unavailable]
write(PAIR / 'unavailable-cases.json', {'actual_maximum_avx': maximum, 'probe_output': probe,
                                     'excluded_cases': unavailable, 'runner_election': False})
write(PAIR / 'linux-cases.json', selected)
write(PAIR / 'scope.json', {'sources': SOURCES, 'product': PRODUCT, 'jobs': 1,
                           'complete_sdk_builds': 1, 'reused_complete_sdks': 3, 'controls': list(controls), 'rounds': 5,
                           'cases': len(selected), 'unavailable_cases': len(unavailable),
                           'warmup_iterations': 3, 'measurement_iterations': 5, 'duration_ms': 300})
# The same digest-bound jtreg distribution used by the native jobs.
ident = 12150561563
digest = 'bea9bcdcd407c1badace23cbad69aebd75f6d8478693738ea3b8e2b9ec52374d'
base = 'https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/' + str(ident)
headers = {'Authorization': 'Bearer ' + os.environ['GH_TOKEN'], 'Accept': 'application/vnd.github+json'}
with prepare.OPEN(urllib.request.Request(base, headers=headers)) as response:
    meta = json.load(response)
assert meta['id'] == ident and meta['digest'] == 'sha256:' + digest and not meta['expired']
assert meta['workflow_run']['id'] == 39164738566
archive = PAIR / 'jtreg.zip'
with prepare.OPEN(urllib.request.Request(base + '/zip', headers=headers)) as source, archive.open('wb') as dest:
    shutil.copyfileobj(source, dest)
assert hashlib.sha256(archive.read_bytes()).hexdigest() == digest
with zipfile.ZipFile(archive) as z:
    assert 'lib/jtreg.jar' in z.namelist()
    assert all(not Path(n).is_absolute() and '..' not in Path(n).parts and '\\' not in n and ':' not in n for n in z.namelist())
    z.extractall(ROOT / 'jtreg/installed')
write(PAIR / 'jtreg-distribution.json', meta)
