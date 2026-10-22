from pathlib import Path
import hashlib,json,math,statistics
r=Path('/workspace/stringzilla-recovery/integration-20261021');o=Path('/workspace/stringzilla-evidence/doc/stringzilla/merge-20261022');all_rows=[]
roots={'linux':r/'final-merge-process',**{n:r/'native-results'/('final-cd785-'+n)/'process-results' for n in ('neon','msvc')}}
for platform,root in roots.items():
 receipt=json.loads((root/'receipt.json').read_text());results=json.loads((root/'results.json').read_text());assert receipt['complete'] and len(results)==3
 assert receipt['controls']['candidate']['source']=='cd785f1c66fb72404c12b150d5f3d8e0fe0a4776';assert receipt['controls']['prior']['source']=='8d030adbd245b19e6339e3ccd052eb7fe3635319';names=list(receipt['controls']);assert names==['original','prior','candidate','disabled']
 for name,v in receipt['images'].items():assert v['tree_sha256']==receipt['controls'][name]['expected_tree_sha256']
 for result in results:
  rounds=result['rounds'];assert len(rounds)==8 and all(set(g)==set(names) for g in rounds)
  means={n:statistics.mean(g[n]['milliseconds'] for g in rounds) for n in names};medians={n:statistics.median(g[n]['milliseconds'] for g in rounds) for n in names};assert medians==result['medians_ms']
  for i,g in enumerate(rounds):
   for name,value in g.items():
    assert math.isfinite(value['milliseconds']) and value['milliseconds']>0
    if result['workload']=='source-index':assert (root/(f'source-index-r{i}-{name}.stdout')).read_text().strip()==receipt['source_index_checksum']
  losses={}
  for name,p in result['paired'].items():
   ratios=[g[name]['milliseconds']/g['candidate']['milliseconds'] for g in rounds];assert p=={'median':statistics.median(ratios),'min':min(ratios),'max':max(ratios),'ratios':ratios}
   marks=[]
   if p['median']<1:marks.append('paired')
   if medians[name]<medians['candidate']:marks.append('median')
   if means[name]<means['candidate']:marks.append('mean')
   if marks:losses[name]=marks
  all_rows.append({'platform':platform,'workload':result['workload'],'medians_ms':medians,'means_ms':means,'paired':result['paired'],'losses':losses,'source_output_verified':True,'receipt_sha256':hashlib.sha256((root/'receipt.json').read_bytes()).hexdigest()})
lines=['# Ordinary process comparisons\n\nThree fixed workloads per platform; four complete-image controls; one warmup round followed by eight balanced rotating rounds. Tiering, CDS and runtime flags use ordinary defaults, with recorded CPU affinity. Times include whole-process startup and completion. `Master` is stored as `prior` in these process-only raw files. Ratios above 1 favor the candidate; brackets show the observed paired min/max, not confidence intervals. Loss marks retain every paired, median or pooled-mean loss. These narrow workloads do not establish a general application gain.\n\n| Platform/workload | Original ms | Master ms | Enabled ms | Disabled ms | O/C [range] | M/C [range] | D/C [range] | Loss marks |\n|---|---:|---:|---:|---:|---|---|---|---|\n']
for row in all_rows:
 vals=[f"{row['medians_ms'][n]:.3f}" for n in names];ratios=[f"{row['paired'][n]['median']:.4f} [{row['paired'][n]['min']:.4f}, {row['paired'][n]['max']:.4f}]" for n in ('original','prior','disabled')];loss='; '.join(('master' if n=='prior' else n)+':'+','.join(v) for n,v in row['losses'].items()) or '-';lines.append('| '+' | '.join([row['platform']+'/'+row['workload'],*vals,*ratios,loss])+' |\n')
(o/'PROCESS-COMPARISONS.md').write_text(''.join(lines));(o/'process-rows.json').write_text(json.dumps(all_rows,indent=2)+'\n');print(json.dumps({'audited_workloads':len(all_rows),'paired_rounds':72,'timed_processes':288,'all_source_index_outputs_equal_within_platform':True,'master_paired_loss_workloads':sum(x['paired']['prior']['median']<1 for x in all_rows)},indent=2))
