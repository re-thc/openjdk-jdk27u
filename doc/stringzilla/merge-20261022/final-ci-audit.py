#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Audit the complete final revision's ordinary CI and all StringZilla descriptions."""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import subprocess
import urllib.request

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('prepare', HERE / 'prepare.py')
prepare = importlib.util.module_from_spec(spec)
spec.loader.exec_module(prepare)
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--expected', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
p.add_argument('--run', type=int, required=True)
p.add_argument('--merge', required=True)
a = p.parse_args()
a.output.mkdir()
headers = {'Authorization': 'Bearer ' + os.environ['GH_TOKEN'], 'Accept': 'application/vnd.github+json'}
api = 'https://api.github.com/repos/re-thc/openjdk-jdk27u'
def fetch(url):
    with prepare.OPEN(urllib.request.Request(url, headers=headers)) as response:
        return response.read()
def write(name, value):
    (a.output / name).write_text(json.dumps(value, indent=2) + '\n')
expected = json.loads(a.expected.read_text())
run = json.loads(fetch(api + '/actions/runs/' + str(a.run)))
assert run['id'] == a.run and run['head_sha'] == expected['product']
assert run['status'] == 'completed' and run['conclusion'] == 'success'
jobs = json.loads(fetch(api + '/actions/runs/' + str(a.run) + '/jobs?per_page=100'))
assert jobs['total_count'] == len(jobs['jobs']) == 57
assert all(job['status'] == 'completed' and job['conclusion'] == 'success' for job in jobs['jobs'])
write('run.json', run)
write('jobs.json', jobs)
hashes = {}
for path in expected.pop('source_paths'):
    url = 'https://raw.githubusercontent.com/re-thc/openjdk-jdk27u/' + expected['product'] + '/' + path
    with urllib.request.urlopen(url) as response:
        hashes[path] = hashlib.sha256(response.read()).hexdigest()
expected['sources_sha256'] = hashes
write('expected.json', expected)
for job in jobs['jobs']:
    content = fetch(api + '/actions/jobs/' + str(job['id']) + '/logs').decode('utf-8')
    content = content.replace('\r\n', '\n').replace('\r', '\n').rstrip('\n') + '\n'
    bad = [line for line in content.splitlines() if 'compilerTier' in line
           and any(marker in line for marker in ('not annotated with @IntrinsicCandidate',
                                                'no compiler intrinsic', 'unknown intrinsic'))]
    assert not bad, bad
    (a.output / ('job-' + str(job['id']) + '.log')).write_text(content)
subprocess.run(['python3', str(HERE / 'audit-ci.py'), '--directory', str(a.output),
                '--expected', str(a.output / 'expected.json'), '--require-complete',
                '--run-id', str(a.run), '--merge', a.merge], check=True)
audit = json.loads((a.output / 'audit.json').read_text())
assert audit['complete'] and audit['jtreg_make_counts']['fail'] == audit['jtreg_make_counts']['error'] == 0
assert sum(row['passed_StringZilla_descriptions'] for row in audit['platforms'].values()) == 58
print('FINAL_CI_AUDIT ' + json.dumps(audit, separators=(',', ':')), flush=True)
print('FINAL_CI_TEST_SOURCES ' + json.dumps(expected, separators=(',', ':')), flush=True)
