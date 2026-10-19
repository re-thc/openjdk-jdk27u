#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only
"""Summarize all paired results without removing losses or variable rounds."""
import argparse
import hashlib
import json
from pathlib import Path
import statistics as stats

p=argparse.ArgumentParser(description=__doc__)
p.add_argument('--output',type=Path,required=True)
p.add_argument('results',nargs='+',type=Path)
a=p.parse_args();a.output.mkdir(exist_ok=True,parents=True)
rows=[];sources=[]
for path in a.results:
    data=json.loads((path/'results.json').read_text())
    complete=json.loads((path/'complete.json').read_text())
    provenance=json.loads((path/'provenance.json').read_text())
    assert complete['triplets']==len(data) and complete['images_unchanged']
    sources.append(provenance)
    for row in data:
        assert len(row['rounds'])==3
        for round in row['rounds']:
            assert set(round)=={'original','enabled','disabled'}
            for control,d in round.items():
                raw=(path/d['json']).read_bytes()
                assert hashlib.sha256(raw).hexdigest()==d['sha256']
                metric=json.loads(raw)[0]['primaryMetric']
                assert d['samples']==metric['rawData'][0] and d['mean']==metric['score'] and d['error']==metric['scoreError']
                assert d['median']==stats.median(d['samples'])
        row['means']={c:stats.mean(v for r in row['rounds'] for v in r[c]['samples']) for c in ('original','enabled','disabled')}
        row['higher_enabled_mean']=[c for c in ('original','disabled') if row['means']['enabled']>row['means'][c]]
        row['higher_enabled_control_median']=[c for c in ('original','disabled') if row['medians']['enabled']>row['medians'][c]]
        rows.append(row)
keys=[(r['backend'],r['tier'],r['case']['id']) for r in rows]
assert len(set(keys))==len(keys),'Duplicated measured scope'
rows.sort(key=lambda r:(r['backend'],r['tier'],r['case']['id']))
header=['# Repeated paired complete-image comparisons','','All values are ns/op. Control columns show medians of round medians.',
        'Ratios are control/enabled: above one favors enabled. Brackets retain the minimum and maximum paired round ratios.',
        'Every raw sample, mean and reported JMH error remains in the accompanying results. No noise gate is applied.',
        'Loss marks distinguish paired-ratio medians below one, higher enabled control medians, and higher enabled pooled means. These summaries can disagree.','',
        '| Backend/tier | Case | Original | Enabled | Disabled | O/E median [range] | D/E median [range] | Loss: paired ratio; control median; pooled mean |',
        '|---|---|---:|---:|---:|---:|---:|---|']
all_lines=[];loss_lines=[]
for r in rows:
    ratios=[f'{stats.median(r["speedup"][c]):.4f} [{min(r["speedup"][c]):.4f}, {max(r["speedup"][c]):.4f}]' for c in ('original','disabled')]
    mark='; '.join(','.join(r[k]) or '-' for k in ('higher_enabled_median','higher_enabled_control_median','higher_enabled_mean'))
    line='| '+' | '.join([r['backend']+'/'+r['tier'],r['case']['id'],*[f'{r["medians"][c]:.3f}' for c in ('original','enabled','disabled')],*ratios,mark])+' |'
    all_lines.append(line)
    if r['higher_enabled_median'] or r['higher_enabled_control_median'] or r['higher_enabled_mean']:loss_lines.append(line)
(a.output/'COMPARISONS.md').write_text('\n'.join(header+all_lines)+'\n')
(a.output/'LOSSES.md').write_text('\n'.join([*header[:1],'',f'{len(loss_lines)} rows have a paired-ratio, control-median or pooled-mean loss against at least one control.','',*header[2:],*loss_lines])+'\n')
(a.output/'ALL-RESULTS.json').write_text(json.dumps({'provenance':sources,'results':rows},separators=(',',':'))+'\n')
summary={'triplets':len(rows),'controls':len(rows)*9,'samples':len(rows)*45,'higher_enabled_median_rows':sum(bool(r['higher_enabled_median']) for r in rows),
         'higher_enabled_control_median_rows':sum(bool(r['higher_enabled_control_median']) for r in rows),
         'higher_enabled_mean_rows':sum(bool(r['higher_enabled_mean']) for r in rows),'loss_table_rows':len(loss_lines),
         'groups':{b:{t:sum(r['backend']==b and r['tier']==t for r in rows) for t in ('interpreter','c1','c2')} for b in sorted({r['backend'] for r in rows})}}
(a.output/'SUMMARY.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary))
