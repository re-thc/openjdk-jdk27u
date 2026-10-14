import json,pathlib,hashlib
root=pathlib.Path('evidence')
p=root/'release-causal'
out=pathlib.Path('compact-evidence');out.mkdir()
pairs=[json.loads(x) for x in (p/'pairs.jsonl').read_text().splitlines()]
assert len(pairs)==360 and len({(tuple(r['condition']),r['pair']) for r in pairs})==360
assert all(r['pair'] in range(12) and r['order']==(['base87','b3'] if r['pair']%2==0 else ['b3','base87']) for r in pairs)
assert all(len(r['results'])==2 for r in pairs)
for pair in pairs:
    assert pair['results']['base87']['checksum']==pair['results']['b3']['checksum']
    for result in pair['results'].values():
        assert len(result['windows'])==5
        assert all(int(w['calls'])==100000 and int(w['compilation_ms'])==0 for w in result['windows'])
for name,marker in [('plan.json','QUALIFIED_PLAN_JSON'),('summary.json','QUALIFIED_SUMMARY_JSON')]:
    data=json.loads((p/name).read_text())
    (out/name).write_text(json.dumps(data,indent=2))
    print(marker+'='+json.dumps(data))
host=json.loads((root/'native-ir-host.json').read_text())
(out/'native-host.json').write_text(json.dumps(host,indent=2));print('QUALIFIED_HOST_JSON='+json.dumps(host))
(out/'pairs.jsonl').write_text((p/'pairs.jsonl').read_text())
for pair in pairs: print('QUALIFIED_PAIR_JSON='+json.dumps(pair))
statuses=[]
prototypes={}
for f in sorted(p.glob('pair*.status.json')):
    d=json.loads(f.read_text());assert d['exit_status']==0 and d['diagnostic']==False
    assert not any(x.startswith('-XX:CompileCommand=print,') or 'PrintIdeal' in x or '+PrintAssembly' in x or '+LogCompilation' in x for x in d['argv'])
    name=f.name.removesuffix('.status.json')
    condition=name.split('-',1)[1]
    prototypes.setdefault(condition,d['argv'])
    statuses.append({'name':name,'exit_status':d['exit_status'],'diagnostic':d['diagnostic'],'output':d['output']})
assert len(statuses)==720
(out/'statuses.json').write_text(json.dumps(statuses,indent=2))
print('QUALIFIED_STATUSES_JSON='+json.dumps(statuses))
print('QUALIFIED_COMMAND_PROTOTYPES_JSON='+json.dumps(prototypes))
records=[]
for f in sorted((root/'controller-classes').glob('*.class')):
    records.append({'name':f.name,'bytes':f.stat().st_size,'sha256':hashlib.file_digest(f.open('rb'),'sha256').hexdigest()})
(out/'controllers.json').write_text(json.dumps(records,indent=2));print('QUALIFIED_CONTROLLERS_JSON='+json.dumps(records))
print('QUALIFIED_EVIDENCE_VALIDATION_JSON='+json.dumps({'processes':720,'adjacent_pairs':360,'conditions':30,'balanced_pairs_per_condition':12,'clean_fixed_windows':3600,'all_window_compilation_ms':0,'all_exit_statuses':0,'source_artifact':11883417851}))
