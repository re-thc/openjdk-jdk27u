import csv,json,statistics,sys
from pathlib import Path
root=Path(sys.argv[1]); commands=json.loads((root/'commands.json').read_text());data={};cold={}
for e in commands:
 if e.get('returncode')!=0:continue
 text=Path(e['stdout']).read_text()
 if e['kind']=='steady':
  rows=list(csv.DictReader(x for x in text.splitlines() if not x.startswith('#')))
  for name in dict.fromkeys(r['case'] for r in rows):
   group=[r for r in rows if r['case']==name]
   data[e['gc'],e['compact'],name,e['round'],e['state']]={'ns':statistics.median(float(r['ns_per_call']) for r in group),'allocation':statistics.median(float(r['java_bytes_per_call']) for r in group),'samples':[float(r['ns_per_call']) for r in group]}
 else:
  line=next(x for x in text.splitlines() if x.startswith('COLD,'));cold[e['mode'],e['round'],e['state']]={'call_ns':int(line.split(',')[2]),'wall_ns':e['wall_ns'],'library_loads':sum('Loaded library ' in x and '/libhexsimd.so' in x for x in text.splitlines())}
report=[]
for gc,compact,name in sorted({k[:3] for k in data}):
 rounds=[r for r in range(1,7) if all((gc,compact,name,r,s) in data for s in ['baseline','enabled','disabled'])]
 if not rounds:continue
 groups={s:[data[gc,compact,name,r,s] for r in rounds] for s in ['baseline','enabled','disabled']}
 ratios={s:[data[gc,compact,name,r,s]['ns']/data[gc,compact,name,r,'enabled']['ns'] for r in rounds] for s in ['baseline','disabled']}
 report.append({'gc':gc,'compact':compact,'case':name,'rounds':rounds,'ns':{s:statistics.median(v['ns'] for v in group) for s,group in groups.items()},'allocation':{s:statistics.median(v['allocation'] for v in group) for s,group in groups.items()},'paired_speedup':{s:{'median':statistics.median(v),'min':min(v),'max':max(v),'wins':sum(x>1 for x in v),'ratios':v} for s,v in ratios.items()},'observations':groups})
cold_report=[]
for mode in sorted({k[0] for k in cold}):
 rounds=[r for r in range(1,7) if all((mode,r,s) in cold for s in ['baseline','enabled','disabled'])]
 if not rounds:continue
 groups={s:[cold[mode,r,s] for r in rounds] for s in ['baseline','enabled','disabled']}
 cold_report.append({'mode':mode,'rounds':rounds,'medians':{s:{m:statistics.median(v[m] for v in group) for m in ['call_ns','wall_ns','library_loads']} for s,group in groups.items()},'observations':groups})
result={'completed_processes':sum(e.get('returncode')==0 for e in commands),'steady':report,'cold':cold_report}
(root/'summary.json').write_text(json.dumps(result,indent=2)+'\n')
for row in report:
 if row['gc']=='G1' and row['compact'] or row['case'] in ['encode:1024','encode:65536','decode:128','mixed:65536']:
  ns=row['ns'];rat=row['paired_speedup'];print(row['gc'],row['compact'],row['case'],len(row['rounds']),*[f'{ns[s]:.1f}' for s in ['baseline','disabled','enabled']],*[f'{rat[s]["median"]:.2f}x[{rat[s]["min"]:.2f},{rat[s]["max"]:.2f}]({rat[s]["wins"]})' for s in ['baseline','disabled']])
for row in cold_report:print('COLD',row['mode'],row['medians'])
