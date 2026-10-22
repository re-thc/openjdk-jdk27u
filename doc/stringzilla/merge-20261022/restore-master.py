#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Reuse the complete matched master already in the verified prior artifact."""
import argparse
import importlib.util
import json
from pathlib import Path
import shutil
import tarfile

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--backend', choices=['neon', 'msvc'], required=True)
a = p.parse_args()
here = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('support', here / 'support.py')
support = importlib.util.module_from_spec(spec)
spec.loader.exec_module(support)
root = Path('pair')
artifact = root / 'reference-artifact'
metadata = artifact if a.backend == 'neon' else artifact / 'candidate-retained'
receipt = json.loads((metadata / 'master-receipt.json').read_text())
inventory = json.loads((metadata / 'master-inventory.json').read_text())
master = '8d030adbd245b19e6339e3ccd052eb7fe3635319'
expected = {'neon': 'fdc755da24b452c79e04d921ab27622ed1cf7c330a5c023e0aa68abe8d4c95a4',
            'msvc': 'a3b8aebb38e5dcea84d7cb83af9ca08ed201af2093251bc62def1c105a2a1125'}[a.backend]
assert receipt['source'] == master and receipt['clean_checkout']
assert receipt['image_tree_sha256'] == inventory['tree_sha256'] == expected
assert receipt['shipped_classes_match_build_outputs']
assert receipt['compiler_identity']['full_identity_matches_original']
if a.backend == 'neon':
    archive = artifact / 'master-jdk.tar.gz'
    assert support.sha(archive) == (artifact / 'master-jdk.tar.gz.sha256').read_text().split()[0]
    with tarfile.open(archive) as t:
        assert all(n == 'master' or n.startswith('master/') for n in t.getnames())
        t.extractall(artifact, filter='data')
image = artifact / ('master' if a.backend == 'neon' else 'pair/master')
assert support.image(image)['files'] == inventory['files']
assert support.read_spec(metadata / 'master-spec.gmk') == support.read_spec(root / 'original-spec.gmk')
shutil.move(image, root / 'master')
for name in ['master-spec.gmk', 'master-inventory.json', 'master-receipt.json',
             'master-compiler-identity.json', 'master-configure.log']:
    shutil.copyfile(metadata / name, root / name)
(root / 'master-reuse.json').write_text(json.dumps({
    'source': master, 'tree_sha256': expected, 'complete_file_inventory_verified': True,
    'producer_reference': json.loads((root / 'reference.json').read_text())
}, indent=2) + '\n')
print(json.dumps({'source': master, 'verified_tree_sha256': expected}))
