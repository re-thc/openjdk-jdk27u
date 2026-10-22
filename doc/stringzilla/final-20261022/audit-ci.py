#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Audit actual checkout, outer jtreg results and complete CI matrices."""
import argparse
import hashlib
import json
from pathlib import Path
import re

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--directory',type=Path,required=True)
p.add_argument('--expected',type=Path,default=Path(__file__).with_name('expected-ci-tests.json'))
p.add_argument('--require-complete',action='store_true')
p.add_argument('--run-id',type=int,required=True)
p.add_argument('--merge',required=True)
a=p.parse_args();root=a.directory
jobs=json.loads((root/'jobs.json').read_text())['jobs']
run=json.loads((root/'run.json').read_text())
expected=json.loads(a.expected.read_text())
product=expected['product'];merge=a.merge
assert run['id']==a.run_id and run['head_sha']==product
assert len({j['id'] for j in jobs})==len(jobs)
records=[];missing=[];outer={platform:[] for platform in expected['expected']}
for job in jobs:
    kind='test' if ' / test (' in job['name'] else 'build' if ' / build (' in job['name'] else 'prepare'
    path=root/f"job-{job['id']}.log"
    if not path.exists():
        missing.append({'id':job['id'],'name':job['name'],'status':job['status'],'conclusion':job['conclusion']});continue
    raw=path.read_bytes();text=raw.decode('utf-8')
    checkout=bool(re.search(r'log -1 --format=%H\r?\n[^\r\n]*'+merge+r'(?:\r?\n|$)',text))
    tables=[]
    for m in re.finditer(r'^\S+Z\s+(jtreg:\S+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s*$',text,re.M):
        table=dict(zip(('suite','total','pass','fail','error','skip'),[m[1]]+[int(m[i]) for i in range(2,7)]))
        assert table['total']==sum(table[k] for k in ('pass','fail','error','skip'))
        assert table not in tables,'Repeated make table; inspect before summing'
        tables.append(table)
    record={'id':job['id'],'name':job['name'],'kind':kind,'status':job['status'],'conclusion':job['conclusion'],
            'started_at':job['started_at'],'completed_at':job['completed_at'],
            'log_bytes':len(raw),'log_sha256':hashlib.sha256(raw).hexdigest(),
            'checkout_verified':checkout,'tables':tables,'test_success':'TEST SUCCESS' in text,
            'failed_steps':[s for s in job['steps'] if s['conclusion'] not in ('success','skipped',None)]}
    if job['conclusion']=='success' and kind!='prepare':
        assert checkout and not record['failed_steps'],job['name']
        if kind=='test':
            assert tables and record['test_success'] and all(t['fail']==t['error']==0 for t in tables),job['name']
            current=None
            for line in text.splitlines():
                start=re.match(r'^\S+Z\s+TEST: (.+)$',line)
                if start:current=start[1]
                result=re.match(r'^\S+Z\s+TEST RESULT: (.+)$',line)
                if result:
                    if current and 'StringZilla' in current:
                        platform=next(p for p in outer if job['name'].startswith(p+' / '))
                        outer[platform].append({'test':current,'result':result[1],'job_id':job['id']})
                    current=None
    records.append(record)
platforms={}
for platform,tests in outer.items():
    groups=[j for j in jobs if j['name'].startswith(platform+' / test (')]
    builds=[j for j in jobs if j['name'].startswith(platform+' / build (')]
    passed=[t['test'] for t in tests if t['result'].startswith('Passed.')]
    assert len(set(passed))==len(passed),(platform,'duplicate StringZilla description')
    complete=(len(groups)==12 and len(builds)==2 and all(j['conclusion']=='success' for j in groups+builds)
              and all((root/f"job-{j['id']}.log").exists() for j in groups+builds))
    if complete:assert set(passed)==set(expected['expected'][platform]),(platform,set(expected['expected'][platform])-set(passed),set(passed)-set(expected['expected'][platform]))
    platforms[platform]={'complete':complete,'builds':len(builds),'tier1_groups':len(groups),
                         'passed_StringZilla_descriptions':len(passed),'tests':tests}
complete=(run['status']=='completed' and run['conclusion']=='success' and len(jobs)==57 and not missing
          and all(j['conclusion']=='success' for j in jobs) and all(p['complete'] for p in platforms.values()))
if a.require_complete:assert complete,'CI execution/log coverage is incomplete'
counts={k:sum(t[k] for r in records for t in r['tables']) for k in ('total','pass','fail','error','skip')}
result={'run':run['id'],'attempt':run['run_attempt'],'product':product,'merge_checkout':merge,
        'complete':complete,'collected_jobs':len(records),'missing_logs':missing,'platforms':platforms,
        'jtreg_make_counts':counts,'counts_scope':'Reported make/jtreg descriptions, including platform skips; not unique test methods',
        'log_materialization':'GitHub connector decoded text, canonical LF with one final newline; raw JMH artifact files are retained separately without newline conversion',
        'records':records}
(root/'audit.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k not in ('records','platforms','missing_logs')},indent=2))
for platform,value in platforms.items():print(platform,{k:v for k,v in value.items() if k!='tests'})
