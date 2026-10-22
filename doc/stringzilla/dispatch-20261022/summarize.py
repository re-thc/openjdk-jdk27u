#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Audit raw JMH files and retain every comparison and union-of-losses row."""
import argparse
import hashlib
import json
import math
from pathlib import Path
import statistics

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--study',action='append',required=True,help='label=results directory')
p.add_argument('--output',type=Path,required=True)
p.add_argument('--candidate-source',required=True)
a=p.parse_args();a.output.mkdir(exist_ok=False)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
all_rows=[];studies=[]
for specification in a.study:
 label,directory=specification.split('=',1);root=Path(directory)
 provenance=json.loads((root/'provenance.json').read_text())
 complete=json.loads((root/'complete.json').read_text())
 results=json.loads((root/'results.json').read_text())
 assert complete['images_unchanged'] and complete['cases']==len(results)
 assert sha(root/'controller.py')==provenance['controller_source_sha256']
 assert sha(root/'manifest.json')==provenance['manifest_sha256']
 assert json.loads((root/'manifest.json').read_text())==provenance['cases']
 assert provenance['controls']['candidate']['source']==a.candidate_source
 names=list(provenance['controls']);assert names in (['original','master','prior','candidate','disabled'], ['original','master','candidate','disabled'])
 number=complete['rounds'];assert (len(names),number) in ((5,5),(4,8))
 assert provenance['method']['rounds']==number
 assert all(v==provenance['matched_build_settings']['original'] for v in provenance['matched_build_settings'].values())
 assert provenance['controls']['original']['source']=='416d7db3ec3cf03d0e4b05f919dce6aa9f9b5eda'
 assert provenance['controls']['master']['source']=='8d030adbd245b19e6339e3ccd052eb7fe3635319'
 assert provenance['controls']['disabled']['source']==a.candidate_source
 assert provenance['controls']['disabled']['flags']==['-XX:-UseStringZillaIntrinsics']
 if 'prior' in names:assert provenance['controls']['prior']['source']=='cd785f1c66fb72404c12b150d5f3d8e0fe0a4776'
 assert provenance['images']['candidate']['files']==provenance['images']['disabled']['files']
 for name in names:
  assert provenance['images'][name]['tree_sha256']==provenance['controls'][name]['expected_tree_sha256']
 for relative,digest in provenance['benchmark_sources'].items():
  assert sha(root/'benchmark-sources'/relative.replace(chr(92),'/').split('/')[-1])==digest
 files=[];samples=0
 for result in results:
  case=result['case'];rounds=result['rounds'];assert len(rounds)==number
  assert all(set(group)==set(names) for group in rounds)
  medians={n:statistics.median(group[n]['median'] for group in rounds) for n in names}
  means={n:statistics.mean(v for group in rounds for v in group[n]['samples']) for n in names}
  assert medians==result['medians']
  for group in rounds:
   for name,value in group.items():
    path=root/value['file'];assert path.name not in files;files.append(path.name)
    assert sha(path)==value['sha256']
    raw=json.loads(path.read_text());assert len(raw)==1;raw=raw[0]
    metric=raw['primaryMetric'];assert metric['rawData']==[value['samples']]
    assert len(value['samples'])==5 and metric['scoreUnit']=='ns/op'
    assert math.isclose(metric['score'],value['mean']) and math.isclose(statistics.mean(value['samples']),value['mean'])
    assert all(math.isfinite(v) and v>0 for v in value['samples'])
    assert math.isclose(value['median'],statistics.median(value['samples']))
    assert raw['params']=={k:str(v) for k,v in case['params'].items()}
    assert raw['forks']==1 and raw['warmupIterations']==3 and raw['measurementIterations']==5
    assert raw['warmupTime']==raw['measurementTime']=='300 ms'
    assert raw['jvmArgs']==value['command'][1:value['command'].index('-cp')]
    samples+=5
  losses={}
  for n in names:
   if n=='candidate':continue
   ratios=[group[n]['median']/group['candidate']['median'] for group in rounds]
   assert ratios==result['paired'][n]['ratios']
   assert result['paired'][n]=={'median':statistics.median(ratios),'min':min(ratios),'max':max(ratios),'ratios':ratios}
   marks=[]
   if statistics.median(ratios)<1:marks.append('paired')
   if medians[n]<medians['candidate']:marks.append('median')
   if means[n]<means['candidate']:marks.append('mean')
   if marks:losses[n]=marks
  backend='neon' if 'neon' in label else 'msvc' if 'msvc' in label else {0:'serial',2:'avx2',3:'avx512'}[case['avx']]
  all_rows.append({'study':label,'backend':backend,'tier':case['tier'],'case':case,'medians_ns':medians,'pooled_means_ns':means,'paired':result['paired'],'losses':losses})
 assert len(files)==complete['jmh_files']==len(results)*number*len(names) and samples==complete['samples']
 assert set(files)=={p.name for p in root.glob('*.json')}-{ 'provenance.json','manifest.json','results.json','complete.json' }
 assert [r['case'] for r in results]==provenance['cases']
 studies.append({'label':label,'cases':len(results),'jmh_files':len(files),'samples':samples,'source':provenance['controls']['candidate']['source'],'controls':provenance['controls'],'provenance_sha256':sha(root/'provenance.json'),'results_sha256':sha(root/'results.json'),'complete_sha256':sha(root/'complete.json')})
header='''All times are ns per complete public operation. Columns are medians of round medians; ratios are medians of same-round median ratios. Above 1 favors the candidate. Brackets are observed minimum/maximum paired ratios, not confidence intervals. No noise gate is used. Loss columns retain the union of paired-ratio, control-median and pooled-mean losses; the measures can disagree. All raw samples, JMH means/errors and commands remain in the source study.\n\n| Backend/tier | Case | Original | Master | Prior | Candidate | Disabled | O/C [range] | M/C [range] | P/C [range] | D/C [range] | Loss marks |\n|---|---|---:|---:|---:|---:|---:|---|---|---|---|---|\n'''
def markdown(rows):
 lines=[header]
 for r in rows:
  ratios=[f'{r["paired"][n]["median"]:.4f} [{r["paired"][n]["min"]:.4f}, {r["paired"][n]["max"]:.4f}]' if n in r['paired'] else '-' for n in ('original','master','prior','disabled')]
  values=[f'{r["medians_ns"][n]:.3f}' if n in r['medians_ns'] else '-' for n in ('original','master','prior','candidate','disabled')]
  loss='; '.join(n+':'+','.join(v) for n,v in r['losses'].items()) or '-'
  lines.append('| '+' | '.join([r['backend']+'/'+r['tier'],r['case']['id'],*values,*ratios,loss])+' |\n')
 return ''.join(lines)
(a.output/'COMPARISONS.md').write_text(markdown(all_rows))
(a.output/'LOSSES.md').write_text(markdown([r for r in all_rows if r['losses']]))
(a.output/'rows.json').write_text(json.dumps(all_rows,indent=2)+'\n')
summary={'source':a.candidate_source,'cases':len(all_rows),'jmh_files':sum(s['jmh_files'] for s in studies),'samples':sum(s['samples'] for s in studies),'union_loss_rows':sum(bool(r['losses']) for r in all_rows),'paired_losses_by_control':{n:sum(n in r['paired'] and r['paired'][n]['median']<1 for r in all_rows) for n in ('original','master','prior','disabled')},'studies':studies,'complete_raw_files_audited':True}
(a.output/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps({k:v for k,v in summary.items() if k!='studies'},indent=2))
