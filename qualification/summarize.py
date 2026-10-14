#!/usr/bin/env python3
import argparse, collections, csv, gzip, json, pathlib, random, statistics, xml.etree.ElementTree as ET
p=argparse.ArgumentParser();p.add_argument('directory');a=p.parse_args();root=pathlib.Path(a.directory)
groups=collections.defaultdict(lambda:collections.defaultdict(dict));compilations=[];statuses=collections.Counter();returncodes=collections.Counter()
for line in (root/'commands.jsonl').read_text().splitlines():
 rec=json.loads(line);statuses[rec.get('status','completed')]+=1;returncodes[str(rec['returncode'])]+=1
 if rec.get('status','completed')!='completed' or rec['returncode']!=0:continue
 lines=[s for s in (root/(rec['label']+'.stdout')).read_text().splitlines() if s.startswith(rec['kernel']+',')]
 header='kernel,phase,calls,count,start_uptime_ms,nanoseconds,allocated_bytes,compilation_ms,checksum,normal_before,osr_installed_before,normal_after,osr_installed_after'
 phases=collections.defaultdict(list)
 for row in csv.DictReader([header]+lines):
  phase=row['phase'];phase='steady' if phase.startswith('measure') else 'early' if phase.startswith('early') else phase
  phases[phase].append(row)
 for phase,rows in phases.items():
  key=(rec['header'],rec['bits'],rec['mode'],rec['kernel'],rec['observed'],tuple(rec['extra']),phase)
  groups[key][rec['image']][rec['rep']]={
   'ns_per_call':statistics.mean(int(r['nanoseconds'])/int(r['calls']) for r in rows),
   'bytes_per_call':statistics.mean(int(r['allocated_bytes'])/int(r['calls']) for r in rows),
   'compiler_delta_ms':statistics.mean(int(r['compilation_ms']) for r in rows),
   'calls_per_window':[int(r['calls']) for r in rows],
   'levels':[[int(r[k]) for k in ['normal_before','osr_installed_before','normal_after','osr_installed_after']] for r in rows]}
 log=root/(rec['label']+'.xml.gz')
 if log.exists():
  try:
   with gzip.open(log,'rb') as f:
    for _,node in ET.iterparse(f,events=['end']):
     if node.tag=='nmethod' and node.get('method','').startswith('PhaseVectorKernels '):
      row={'label':rec['label'],**node.attrib};row['main_code_bytes']=int(node.get('stub_offset','0'))-int(node.get('insts_offset','0'));compilations.append(row)
     node.clear()
  except ET.ParseError as error:raise SystemExit('Invalid complete compilation log '+str(log)+': '+str(error))
rng=random.Random(8392004);summary=[]
for key,builds in sorted(groups.items()):
 reps=sorted(set(builds['base'])&set(builds['patched']));n=len(reps)
 if n<2:continue
 b=[builds['base'][r]['ns_per_call'] for r in reps];q=[builds['patched'][r]['ns_per_call'] for r in reps]
 draws=[];deltas=[]
 for _ in range(10000):
  ids=[rng.randrange(n) for _ in range(n)];bm=sum(b[i] for i in ids)/n;pm=sum(q[i] for i in ids)/n
  draws.append(100*(pm/bm-1));deltas.append(pm-bm)
 draws.sort();deltas.sort()
 row={'header':key[0],'bits':key[1],'mode':key[2],'kernel':key[3],'observed':key[4],'extra':list(key[5]),'phase':key[6],'pairs':n,
      'base':{k:statistics.mean(builds['base'][r][k] for r in reps) for k in ['ns_per_call','bytes_per_call','compiler_delta_ms']},
      'patched':{k:statistics.mean(builds['patched'][r][k] for r in reps) for k in ['ns_per_call','bytes_per_call','compiler_delta_ms']},
      'change_percent':100*(statistics.mean(q)/statistics.mean(b)-1),'ci95_percent':[draws[249],draws[9749]],'ci95_delta_ns':[deltas[249],deltas[9749]],'replicates':{name:{str(r):builds[name][r] for r in reps} for name in ['base','patched']}}
 summary.append(row)
 if row['header']=='four' and row['phase'] in ['first','primed','steady','call1','call2','call3']:
  print(f"{row['mode']}/{row['bits']}/{row['kernel']}/{row['phase']}/obs{int(row['observed'])}: {row['base']['ns_per_call']:.1f}->{row['patched']['ns_per_call']:.1f}ns {row['change_percent']:+.1f}% [{draws[249]:+.1f},{draws[9749]:+.1f}], B {row['base']['bytes_per_call']:.1f}->{row['patched']['bytes_per_call']:.1f}, pairs{n}")
(root/'summary.json').write_text(json.dumps({'status_counts':dict(statuses),'returncode_counts':dict(returncodes),'results':summary},indent=2)+'\n')
(root/'compilation-records.json').write_text(json.dumps(compilations,indent=2)+'\n')
