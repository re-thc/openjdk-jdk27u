#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Verify every shipped payload file in the three final complete SDKs."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import urllib.request
import zipfile

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('prepare', HERE / 'prepare.py')
prepare = importlib.util.module_from_spec(spec)
spec.loader.exec_module(prepare)
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--manifest', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
a = p.parse_args()
a.output.mkdir()
headers = {'Authorization': 'Bearer ' + os.environ['GH_TOKEN'], 'Accept': 'application/vnd.github+json'}
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
proofs = {}
for image in json.loads(a.manifest.read_text())['images']:
    label = image['label']
    base = 'https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/' + str(image['artifact'])
    with prepare.OPEN(urllib.request.Request(base, headers=headers)) as response:
        meta = json.load(response)
    assert meta['id'] == image['artifact'] and meta['digest'] == 'sha256:' + image['sha256'] and not meta['expired']
    assert meta['workflow_run']['id'] == image['run'] and meta['workflow_run']['head_sha'] == image['producer']
    archive = a.output / (label + '.zip')
    with prepare.OPEN(urllib.request.Request(base + '/zip', headers=headers)) as src, archive.open('wb') as dst:
        shutil.copyfileobj(src, dst)
    assert sha(archive) == image['sha256']
    output = a.output / label
    if label in ('neon', 'msvc'):
        subprocess.run(['python3', str(HERE.parent / 'dispatch-20261022/verify-native-images.py'),
                        '--backend', label, '--candidate-source', image['source'],
                        '--archive', str(archive), '--output', str(output)], check=True)
        proof = json.loads((output / 'independent-verification.json').read_text())
        receipt = json.loads((output / 'pair-receipt.json').read_text())
        assert receipt['sources']['original'] == '416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda'
        assert (' -O2 ' if label == 'msvc' else ' -O3 ') in proof['kernel_compile_command']
        assert ' -O1 ' not in proof['kernel_compile_command'] and ' -Od ' not in proof['kernel_compile_command']
        assert json.loads((output / 'compiler-identity.json').read_text())['full_identity_matches_original']
    else:
        output.mkdir()
        with zipfile.ZipFile(archive) as z:
            names = z.namelist()
            assert len(names) == len(set(names))
            assert all(not Path(n).is_absolute() and '..' not in Path(n).parts
                       and chr(92) not in n and ':' not in n for n in names)
            receipts = [n for n in names if n.endswith('fork-receipt.json')]
            assert len(receipts) == 1
            prefix = receipts[0].removesuffix('fork-receipt.json')
            read = lambda name: json.loads(z.read(prefix + name))
            sources = {'original': '416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda',
                       'master': '8d030adbd245b19e6339e3ccd052eb7fe3635319',
                       'prior': '573e785e5d459c2a96f3042c48651c8cf17a75de',
                       'fork': image['source']}
            sealed = {}
            for label2, source in sources.items():
                receipt = read(label2 + '-receipt.json')
                inventory = read(label2 + '-inventory.json')
                assert receipt['source'] == source and receipt['clean_source'] and receipt['classes_match_build_outputs']
                digest = hashlib.sha256(json.dumps(inventory['files'], separators=(',', ':')).encode()).hexdigest()
                assert digest == receipt['image_tree_sha256'] == inventory['tree_sha256']
                sealed[label2] = receipt
                assert receipt['settings'] == sealed['original']['settings']
                assert receipt['compiler_boot_banners'] == sealed['original']['compiler_boot_banners']
            receipt = sealed['fork']
            inventory = read('fork-inventory.json')
            rows = []
            start = prefix + 'fork/'
            for info in z.infolist():
                if info.filename.startswith(start) and not info.is_dir():
                    h = hashlib.sha256()
                    size = 0
                    with z.open(info) as f:
                        while chunk := f.read(1024 * 1024):
                            h.update(chunk)
                            size += len(chunk)
                    rows.append([info.filename[len(start):], size, h.hexdigest()])
            actual = {row[0]: row for row in rows}
            expected = {row[0]: row for row in inventory['files']}
            assert len(rows) == len(actual) and actual == expected
            order = [actual[row[0]] for row in inventory['files']]
            digest = hashlib.sha256(json.dumps(order, separators=(',', ':')).encode()).hexdigest()
            assert digest == inventory['tree_sha256']
            command = z.read(prefix + 'StringZillaKernels.o.cmdline').decode()
            assert ' -O3 ' in command and ' -O1 ' not in command
            scope = read('scope.json')
            assert scope['complete_sdk_builds'] == 1 and scope['reused_complete_sdks'] == 3
            proof = {'backend': 'linux', 'source': image['source'], 'archive_sha256': sha(archive),
                     'images': {'fork': {'tree_sha256': digest, 'files': len(rows),
                                        'all_payload_files_verified': True}},
                     'shipped_classes_sha256': receipt['shipped_classes_sha256'],
                     'full_build_settings_and_compiler_boot_identities_match': True,
                     'retained_control_sources': sources, 'kernel_compile_command': command,
                     'independent_payload_hash_verification': True}
            for name in names:
                if name.startswith(prefix) and '/' not in name[len(prefix):] and not name.endswith('/'):
                    (output / Path(name).name).write_bytes(z.read(name))
            (output / 'independent-verification.json').write_text(json.dumps(proof, indent=2) + '\n')
    proofs[label] = proof
    print('SDK_PROOF ' + json.dumps({'label': label, 'artifact': meta, 'proof': proof},
                                   separators=(',', ':')), flush=True)
assert len(proofs) == 3
classes = [proof['shipped_classes_sha256'] for proof in proofs.values()]
assert classes[0] == classes[1] == classes[2], 'Shipped String-family classes differ between final SDKs'
print('SDK_CLASS_EQUIVALENCE ' + json.dumps({'source': next(iter(proofs.values()))['source'],
      'all_three_platforms_equal': True, 'classes_sha256': classes[0]}, separators=(',', ':')), flush=True)
(a.output / 'proofs.json').write_text(json.dumps(proofs, indent=2) + '\n')
