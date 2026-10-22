#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Audit retained JMH files once, without builds or repeated measurements."""
import argparse
import base64
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import shutil
import subprocess
import tarfile
import urllib.request
import zipfile

HERE = Path(__file__).resolve().parent
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--manifest', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
a = p.parse_args()
a.output.mkdir()
spec = importlib.util.spec_from_file_location('prepare', HERE / 'prepare.py')
prepare = importlib.util.module_from_spec(spec)
spec.loader.exec_module(prepare)
headers = {'Authorization': 'Bearer ' + os.environ['GH_TOKEN'],
           'Accept': 'application/vnd.github+json'}
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
manifest = json.loads(a.manifest.read_text())
for study in manifest['studies']:
    label = study['label']
    ident = study['artifact']
    base = 'https://api.github.com/repos/re-thc/openjdk-jdk27u/actions/artifacts/' + str(ident)
    with prepare.OPEN(urllib.request.Request(base, headers=headers)) as response:
        meta = json.load(response)
    assert meta['id'] == ident and meta['digest'] == 'sha256:' + study['sha256'] and not meta['expired']
    assert meta['workflow_run']['id'] == study['run']
    assert meta['workflow_run']['head_sha'] == study['producer']
    archive = a.output / (label + '.zip')
    with prepare.OPEN(urllib.request.Request(base + '/zip', headers=headers)) as src, archive.open('wb') as dst:
        shutil.copyfileobj(src, dst)
    assert sha(archive) == study['sha256']
    dest = a.output / label
    with zipfile.ZipFile(archive) as z:
        assert all(not Path(n).is_absolute() and '..' not in Path(n).parts
                   and chr(92) not in n and ':' not in n for n in z.namelist())
        z.extractall(dest)
    roots = list(dest.rglob('paired-results/provenance.json'))
    assert len(roots) == 1
    root = roots[0].parent
    summary = a.output / (label + '-audit')
    subprocess.run(['python3', str(HERE.parent / 'dispatch-20261022/summarize.py'),
                    '--study', label + '=' + str(root), '--output', str(summary),
                    '--candidate-source', study['source'], '--prior-source', study['prior']], check=True)
    complete = json.loads((root / 'complete.json').read_text())
    assert complete['cases'] == study['cases'] and complete['rounds'] == 5
    assert complete['jmh_files'] == study['cases'] * 25
    assert complete['samples'] == study['cases'] * 125
    process_roots = list(dest.rglob('process-results/receipt.json'))
    assert len(process_roots) == 1
    process_root = process_roots[0].parent
    receipt = json.loads(process_roots[0].read_text())
    results = json.loads((process_root / 'results.json').read_text())
    assert receipt['complete'] and len(results) == 3
    assert {r['workload'] for r in results} == {'startup', 'javac', 'source-index'}
    names = list(receipt['controls'])
    assert len(names) == 4
    assert receipt['controls']['original']['source'] == '416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda'
    assert receipt['controls']['candidate']['source'] == study['source']
    assert receipt['controls']['disabled']['source'] == study['source']
    assert receipt['controls']['disabled']['flags'] == ['-XX:-UseStringZillaIntrinsics']
    assert receipt['images']['candidate']['files'] == receipt['images']['disabled']['files']
    import statistics
    for result in results:
        assert len(result['rounds']) == 8
        assert all(set(group) == set(names) for group in result['rounds'])
        for name in names:
            assert result['medians_ms'][name] == statistics.median(group[name]['milliseconds'] for group in result['rounds'])
            if name == 'candidate':
                continue
            ratios = [group[name]['milliseconds'] / group['candidate']['milliseconds'] for group in result['rounds']]
            assert result['paired'][name] == {'median': statistics.median(ratios), 'min': min(ratios), 'max': max(ratios), 'ratios': ratios}
    print('AUDIT_SUMMARY ' + json.dumps({'study': label, 'artifact': meta,
           'jmh': json.loads((summary / 'summary.json').read_text()),
           'process': results, 'process_receipt': receipt}, separators=(',', ':')), flush=True)
    print('AUDIT_ROWS ' + json.dumps({'study': label,
          'rows': json.loads((summary / 'rows.json').read_text())}, separators=(',', ':')), flush=True)
    # Preserve original text artifacts and raw JMH bytes outside the product PR.
    # Executable SDKs, dependency jars and compiled test binaries remain in the
    # immutable producer artifacts identified by digest above.
    members = []
    preserved = a.output / (label + '-raw.tar.gz')
    allowed = {'.json', '.log', '.txt', '.java', '.py', '.cmdline', '.gmk', '.stdout', '.stderr', '.c'}
    with tarfile.open(preserved, 'w:gz', compresslevel=9) as tar:
        for path in sorted(dest.rglob('*')):
            if path.is_file() and path.suffix in allowed:
                relative = path.relative_to(dest).as_posix()
                tar.add(path, arcname=relative, recursive=False)
                members.append({'path': relative, 'bytes': path.stat().st_size, 'sha256': sha(path)})
    with tarfile.open(preserved) as tar:
        for row in members:
            assert hashlib.sha256(tar.extractfile(row['path']).read()).hexdigest() == row['sha256']
    print('AUDIT_ARCHIVE ' + json.dumps({'study': label, 'bytes': preserved.stat().st_size,
          'sha256': sha(preserved), 'members': members}, separators=(',', ':')), flush=True)
    payload = base64.b64encode(preserved.read_bytes()).decode()
    for i in range(0, len(payload), 60000):
        print('AUDIT_ARCHIVE_CHUNK ' + json.dumps({'study': label, 'index': i // 60000,
              'base64': payload[i:i+60000]}, separators=(',', ':')), flush=True)
