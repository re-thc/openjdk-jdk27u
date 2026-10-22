from pathlib import Path
import hashlib,json,re,shutil,tarfile
r=Path('/workspace/stringzilla-recovery/integration-20261021');o=Path('/workspace/stringzilla-evidence/doc/stringzilla/merge-20261022');sha=lambda b:hashlib.sha256(b).hexdigest()
studies={'linux':r/'final-merge-linux','neon':r/'native-results/final-cd785-neon/paired-results','msvc':r/'native-results/final-cd785-msvc/paired-results'};items=[]
for label,root in studies.items():
 c=json.loads((root/'complete.json').read_text());assert c['images_unchanged']
 for p in root.rglob('*'):
  rel=p.relative_to(root)
  if p.is_file() and (len(rel.parts)==1 or rel.parts[0]=='benchmark-sources') and p.suffix not in ['.class','.jar']:
   items.append((p,label+'/'+rel.as_posix()))
for label,root in [('linux',r/'final-merge-process'),('neon',r/'native-results/final-cd785-neon/process-results'),('msvc',r/'native-results/final-cd785-msvc/process-results')]:
 assert json.loads((root/'receipt.json').read_text())['complete']
 for p in root.iterdir():
  if p.is_file():items.append((p,label+'-process/'+p.name))
for label in ['neon','msvc']:
 root=r/'native-results'/('final-cd785-'+label)
 for sub in ['pair','validation','native-sanitizers','jtreg-evidence','build']:
  for p in (root/sub).rglob('*'):
   if p.is_file() and p.suffix in ['.json','.gmk','.cmdline','.log','.jtr','.txt','.summary','.html','.xml','.c','.java']:
    items.append((p,label+'-validation/'+str(p.relative_to(root))))
 root=r/'native-final-image-metadata'/label
 assert json.loads((root/'independent-verification.json').read_text())['independent_payload_hash_verification']
 items += [(p,label+'-complete-image/'+p.name) for p in root.iterdir() if p.is_file()]
for name in ['final-merge-build.log','final-merge-configure-output.log','final-merge-tests.log','final-merge-candidate-seal.json','final-merge-master-seal.json','merge-master-seal.json','cache-final-build.log','cache-final-candidate-seal.json','cache-final-configure-output.log','seal-cache-final-local.py','seal-final-merge-local.py','verify-final-native-images.py']:
 p=r/name
 if p.exists():items.append((p,'local-validation/'+name))
items.sort(key=lambda x:x[1]);assert len(items)==len({n for p,n in items});assert sum(bool(re.search(r'-r\d+-(?:original|master|prior|candidate|disabled)[.]json$',n)) for p,n in items)==1850
archive=o/'final-complete-measurements.tar.gz';assert not archive.exists();manifest=[]
with tarfile.open(archive,'w:gz') as t:
 for p,n in items:
  raw=p.read_bytes();assert p.suffix not in ['.class','.jar','.dll','.so','.exe'];t.add(p,arcname=n,recursive=False);manifest.append({'file':n,'bytes':len(raw),'sha256':sha(raw)})
with tarfile.open(archive) as t:
 assert t.getnames()==[m['file'] for m in manifest]
 for m in manifest:assert sha(t.extractfile(m['file']).read())==m['sha256']
(o/'final-complete-measurements.members.json').write_text(json.dumps(manifest,indent=2)+'\n');summary=json.loads((r/'final-merge-all-audited/summary.json').read_text());receipt={'archive':archive.name,'bytes':archive.stat().st_size,'sha256':sha(archive.read_bytes()),'members':len(items),'all_members_verified':True,'cases':74,'jmh_files':1850,'samples':9250,'ordinary_process_workloads':9,'ordinary_process_balanced_rounds_per_workload':8,'timed_ordinary_processes':288,'sources_unchanged_after_timing':True,'measured_source':summary['source'],'final_product':'b454fd484ab8b9c113f713bdecadc5976a9ca1a1','final_image_equivalence':'cache-final-image-equivalence.json','native_artifact_producer':'a068c05c1ace6c29c600e742e618669b25c77624','native_run':39734131176};(o/'final-complete-measurements.receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
for name in ['COMPARISONS.md','LOSSES.md','rows.json','summary.json']:shutil.copyfile(r/'final-merge-all-audited'/name,o/name)
print(json.dumps(receipt,indent=2))
