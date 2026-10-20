#!/usr/bin/env python3
"""Prepare selected report tables while retaining unselected rows in full summaries."""
import hashlib, json
from pathlib import Path
root=Path('/workspace/sz-evidence')
datasets={}
for name,folder,count in [('c2','qualify/c2-avx2',154),('c1','tier/c1-avx2',77),('int','tier/int-avx2',77)]:
    rows=json.loads((root/folder/'summary.json').read_text())
    assert len(rows)==count and all(row['rounds']==5 for row in rows)
    expected={'base','candidate','old','off'} if name=='c2' else {'base','candidate','off'}
    assert all(set(run)==expected for row in rows for run in row['per_round'].values())
    datasets[name]=rows
cold=json.loads((root/'cold-summary.json').read_text())
assert len(cold)==14 and all(row['rounds']==9 for row in cold)
identity=json.loads((root/'cold-summary-identity.json').read_text())
assert identity['candidate_commit']=='c881f89fb5cde1a5ec20fcf22adb0faa849303f6'
assert identity['raw_sha256']==hashlib.sha256((root/'cold.json').read_bytes()).hexdigest()
selected=[
 ('trim','longBlank','4096 whitespace bytes'),
 ('strip','longBoth','4096 whitespace bytes on each side'),
 ('stripLeading','longBlank','4096 whitespace bytes'),
 ('stripTrailing','longBoth','4096 whitespace bytes on each side'),
 ('isBlank','longBlank','4096 whitespace bytes'),
 ('linesCount','noMatch','4096 bytes, no CR/LF'),
 ('linesCount','longLines','four 4096-byte lines'),
 ('linesCount','lines16','256 16-byte lines'),
 ('linesCount','lines80','256 80-byte lines'),
 ('linesCount','lines128','256 128-byte lines'),
 ('stripTrailing','empty','empty'),
 ('stripTrailing','shortClean','16 unchanged text bytes'),
 ('trim','longClean','4096 unchanged text bytes'),
 ('isBlank','shortBlank','16 whitespace bytes'),
 ('isBlank','early','nonblank after seven spaces'),
 ('linesFirst','probeAt','CRLF after 32 bytes'),
 ('strip','probeAfter','33 leading spaces, 4096 text bytes')]
index={(row['operation'],row['workload']):row for row in datasets['c2']}
lines=['# Selected final C2 results','',
 'Nanoseconds per complete operation. Base/final and old/final are medians of same-round ratios. Ranges are paired minima and maxima, not confidence intervals. Full summaries retain all rows and every loss.', '',
 '| Operation | Input | Base ns | Final ns | Base/final | Paired range | Old/final |',
 '|---|---|---:|---:|---:|---:|---:|']
for op,case,description in selected:
    row=index[(op,case)]; low,high=row['paired_range']
    label={'linesCount':'lines().count()','linesFirst':'lines().findFirst()'}.get(op,op)
    lines.append(f"| {chr(96)}{label}{chr(96)} | {description} | {row['ns']['base']:.2f} | {row['ns']['candidate']:.2f} | {row['paired_speedup']:.3f}x | {low:.3f}..{high:.3f} | {row['paired_old_speedup']:.3f}x |")
facts={}
for config,rows in datasets.items():
    facts[config]=dict(rows=len(rows),losses=sum(row['paired_speedup']<1 for row in rows),
        losses_below_095=sum(row['paired_speedup']<.95 for row in rows),
        worst=sorted(rows,key=lambda row:row['paired_speedup'])[:12],
        selected_bulk=[row for row in rows if (row['operation'],row['workload']) in
            [('isBlank','longBlank'),('trim','longBlank'),('linesCount','noMatch')]])
    if config=='c2':
        facts[config]['old_losses']=sum(row['paired_old_speedup']<1 for row in rows)
        facts[config]['old_losses_below_095']=sum(row['paired_old_speedup']<.95 for row in rows)
        facts[config]['old_worst']=sorted(rows,key=lambda row:row['paired_old_speedup'])[:12]
        facts[config]['selected']=[index[(op,case)] for op,case,_ in selected]
lines+=['','## Tier scope','',
 '| Configuration | Rows | Ratios below 1 | Below 0.95 | isBlank longBlank | trim longBlank | linesCount noMatch |',
 '|---|---:|---:|---:|---:|---:|---:|']
for config in ['c2','c1','int']:
    f=facts[config]; by_key={(row['operation'],row['workload']):row for row in datasets[config]}
    ratios=[by_key[key]['paired_speedup'] for key in [('isBlank','longBlank'),('trim','longBlank'),('linesCount','noMatch')]]
    lines.append(f"| {config} | {f['rows']} | {f['losses']} | {f['losses_below_095']} | "+' | '.join(f'{v:.3f}x' for v in ratios)+' |')
lines+=['','Counts describe tested rows, not application distributions or aggregate benefit. See each full table for absolute costs and every loss.','',
        '## Fresh-process first-call medians','',
        '| Operation | Input | Base call us | Final call us | Off call us | Paired base/final | Base process ms | Final process ms |',
        '|---|---|---:|---:|---:|---:|---:|---:|']
for row in cold:
    op=row['operation_ns']; process=row['process_ns']
    lines.append(f"| {row['operation']} | {row['case']} | {op['base']['median']/1000:.2f} | {op['candidate']['median']/1000:.2f} | {op['off']['median']/1000:.2f} | {op['paired_speedup']:.3f}x | {process['base']['median']/1e6:.2f} | {process['candidate']['median']/1e6:.2f} |")
facts['cold']=cold
(root/'REPORT-TABLES.md').write_text('\n'.join(lines)+'\n')
(root/'report-facts.json').write_text(json.dumps(facts,indent=2)+'\n')
print('Prepared report tables from complete validated fixed studies')
